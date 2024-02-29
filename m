Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7986CFA7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687333.1070661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjZR-0002sm-MS; Thu, 29 Feb 2024 16:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687333.1070661; Thu, 29 Feb 2024 16:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjZR-0002qQ-JZ; Thu, 29 Feb 2024 16:47:45 +0000
Received: by outflank-mailman (input) for mailman id 687333;
 Thu, 29 Feb 2024 16:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfjZQ-0002Pm-SU
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:47:44 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 429e609a-d722-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:47:44 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a44282a09bdso181664966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:47:44 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d25-20020a1709067f1900b00a440e2ada28sm839750ejr.201.2024.02.29.08.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:47:42 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 429e609a-d722-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709225263; x=1709830063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdUnGZlU6VtasExL7xFxpE+W1ikXD8je+ONl8osCxEs=;
        b=P4CLJnNYwPsGOAy9qvBI4laVNJrWEOKfwEa1uCIOXZifpLDNwXnLaNO9IWorTeWaGC
         Xj8SO/F/t9snHNhANE1aE3rlsWn4DDO3vdIJNbs0QJRLUiL3fRlceZMoPDCjkPj+J/yb
         YcbNwWuOJwwVaArs2+IHub5+qFWS6aDY41nNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225263; x=1709830063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XdUnGZlU6VtasExL7xFxpE+W1ikXD8je+ONl8osCxEs=;
        b=EnmajzNUPsLv/QZTffcurY7GUAC6PuhCUQV3/DDS8FW34haXouoJqqdqOCBcaqxcua
         IEcBDlUa6uuYUsDfgxKL/lyXtZ5I/sqnAWE3NJknQJtNfeMbSAJNwCVmx4vJdm1oUCfF
         pZXigb5Q+KD0DPKAFZKkROxyosuQB3kV3jHt8CEskESjkyBqgoe4hRTRyVO6o3jl1dY1
         72PnwYyaXAOdZ5K25aKFigE1j9FUoGvHPhu6ilsz9dwNO7k6BO92A58JIiu0vrvfFcGG
         MOzPYVLPV22e0FuIANePy++eA+OSk/9NlOuhIQ0xWUW5pKG/VvC4x2hOrnX+2afv4/Ys
         tKgA==
X-Gm-Message-State: AOJu0YyOz2cw9Q8hb1omYJiV0VgnaHUrSw89aGNpb/6UvGoTVCS0z7tp
	aVc5PwILPgdsyaZ3r7pATahE1sYC0z2sWDNg1auDQRmZguZ+Lhc95XIa2HlEMCJvDZ/dKWUohBt
	k
X-Google-Smtp-Source: AGHT+IHIzeCeOGBP4kLlARZ9iNHdebiu0J582qb0P65U/EEM7LJDmxYfmdWcAoYbaO75TQ4MuymClA==
X-Received: by 2002:a17:906:a88:b0:a3e:473d:e391 with SMTP id y8-20020a1709060a8800b00a3e473de391mr1953878ejf.22.1709225263690;
        Thu, 29 Feb 2024 08:47:43 -0800 (PST)
Message-ID: <dd361525-be1a-4d11-bbc8-4f5eedd381e0@citrix.com>
Date: Thu, 29 Feb 2024 16:47:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule
 20.7
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
 <b844e28f-a53b-49c0-b4b9-297367546bd3@citrix.com>
 <d9674a6e2ef00457a90d570fc3866c81@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d9674a6e2ef00457a90d570fc3866c81@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 4:21 pm, Nicola Vetrini wrote:
> On 2024-02-29 17:10, Andrew Cooper wrote:
>> On 29/02/2024 3:27 pm, Nicola Vetrini wrote:
>>> diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
>>> index c25dc0f6c2a9..b7e70289737b 100644
>>> --- a/xen/include/xen/kconfig.h
>>> +++ b/xen/include/xen/kconfig.h
>>> @@ -25,7 +25,7 @@
>>>  #define __ARG_PLACEHOLDER_1 0,
>>>  #define config_enabled(cfg) _config_enabled(cfg)
>>>  #define _config_enabled(value)
>>> __config_enabled(__ARG_PLACEHOLDER_##value)
>>> -#define __config_enabled(arg1_or_junk)
>>> ___config_enabled(arg1_or_junk 1, 0)
>>> +#define __config_enabled(arg1_or_junk)
>>> ___config_enabled(arg1_or_junk (1), (0))
>>>  #define ___config_enabled(__ignored, val, ...) val
>>
>> This one hunk I suggest we deviate rather than adjust.  You've subtly
>> broken it, and it's extreme preprocessor magic in the first place to
>> turn an absent symbol into a 0.
>>
>
> How so? I did test this because I was very wary of it, but it seemed
> to expand fine (either if ((0)) or if ((1)) ). I may of course be
> wrong, and it could be deviated regardless.
>

arg1_or_junk(1) can now be a function or macro expansion depending on
context, where previously it couldn't be.

~Andrew

