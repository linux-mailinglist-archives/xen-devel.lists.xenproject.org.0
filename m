Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FCE8CCE3A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728243.1133107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3wV-0006gg-2H; Thu, 23 May 2024 08:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728243.1133107; Thu, 23 May 2024 08:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3wU-0006e4-VZ; Thu, 23 May 2024 08:36:54 +0000
Received: by outflank-mailman (input) for mailman id 728243;
 Thu, 23 May 2024 08:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA3wT-0006dr-Q1
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:36:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a6630b1-18df-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 10:36:52 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51ffff16400so11911462e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:36:52 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01631sm1904138966b.153.2024.05.23.01.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 01:36:51 -0700 (PDT)
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
X-Inumbo-ID: 9a6630b1-18df-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716453411; x=1717058211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7l/2d6fclAu6FofaUz5jRdfurxhewbvq7pz++xoGK1E=;
        b=ur+aE2ORX+zmydK4u1Za4NhW8AfcV5fNWFX52LUZ7eRpkfFNF0j0GVzg1o4+xU1mzX
         tnGdpmkdvZz1pQtYp+loqWNnkhKPmBxzM+Zq1U8Bd0MmkgC+TAsDXeu3Jn3rJAfmSvRg
         85OhQkl4UAyr8tUEfeO7efjQ6lQP4M1bk7qzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453411; x=1717058211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l/2d6fclAu6FofaUz5jRdfurxhewbvq7pz++xoGK1E=;
        b=fYSu2ALbMUWj6PD+iYR1sTSuIVpLqBFuAQNoMzbib+zqFcP3sb85FFJ89gtzw0jBi8
         l1sNZRTwMpzfSlWxcna7MmEj29gTmSBJuErO0bPO7W14l1ZiECYbFVcyFdoA3DsO94E7
         EcSFF4O7otkYA3ker66Q0Tb2FSzHSgdD08g24GSgVFSbjCxwgnIA08+vEmWCnjwOkE8D
         C2xppXsc5VU2UL0fFC8KukcO8EqYDZj6x5mVfbJyuj15cULyiDLotybGZ8McsQVw8j6B
         xtMnzsMEWmEjr9/iug/BWAnsHXaPB0FcfGo35xx7d1sdxkvnhB6TnlTnGzwd5u5swsXL
         3UJw==
X-Forwarded-Encrypted: i=1; AJvYcCXPToQvsE4yrNMfZk3OtXcp97MOLM1sqLHMAVM3Jrg/FX64oK3/UkE9fKUjoVviP5Wj8WzWtDS1Spr0y0QXY5E24d828AgZOtbKqTSvUSE=
X-Gm-Message-State: AOJu0Yx+3gdgdNwazWEcoT5n53oszLp5wCpKj99pp8y0fNcBO7wRVHKn
	G6ItWqVZZuYpGvKeDBVZew0jLLTdMCieJr/kqWUB7QyEhOAgTUUaCYh4cWmZ6s4=
X-Google-Smtp-Source: AGHT+IGAJIV4q9G5CAkOexovAiYUVnf8I01Qc7hEc+So2iEDHqRNAIVrJ3/M8MzMtpIqqov5YOMfmg==
X-Received: by 2002:a05:6512:48d7:b0:51f:2a80:a982 with SMTP id 2adb3069b0e04-526c0b5dc01mr3551603e87.47.1716453411455;
        Thu, 23 May 2024 01:36:51 -0700 (PDT)
Message-ID: <0708b3dc-442d-4ae2-bdf2-a27b48a8c5c2@citrix.com>
Date: Thu, 23 May 2024 09:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools: Drop libsystemd as a dependency
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-5-andrew.cooper3@citrix.com>
 <19c7a56c-5640-438d-aece-6a62f748e893@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <19c7a56c-5640-438d-aece-6a62f748e893@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 9:27 am, Jürgen Groß wrote:
> On 16.05.24 20:58, Andrew Cooper wrote:
>> diff --git a/automation/build/archlinux/current.dockerfile
>> b/automation/build/archlinux/current.dockerfile
>> index 3e37ab5c40c1..d29f1358c2bd 100644
>> --- a/automation/build/archlinux/current.dockerfile
>> +++ b/automation/build/archlinux/current.dockerfile
>> @@ -37,6 +37,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm
>> --noprogressbar --needed \
>>           sdl2 \
>>           spice \
>>           spice-protocol \
>> +        # systemd for Xen < 4.19
>
> Does this work as intended? A comment between the parameters and no
> "\" at the
> end of the line?

Sadly, yes.

Comments are stripped out on a line-granuar basis, prior to Docker
interpreting the remainder.

This is the approved way to do comments in dockerfiles, and we already
have other examples of this in our dockerfiles.

See e.g. a0e29b316363d9 for what I'll be doing with these comments in
~3y time.

~Andrew

