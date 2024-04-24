Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D478B0A2F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711420.1111354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcB7-0001wf-3y; Wed, 24 Apr 2024 12:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711420.1111354; Wed, 24 Apr 2024 12:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcB7-0001uD-0y; Wed, 24 Apr 2024 12:56:49 +0000
Received: by outflank-mailman (input) for mailman id 711420;
 Wed, 24 Apr 2024 12:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCeM=L5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rzcB5-0001u7-Cl
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:56:47 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a7dfbfd-023a-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 14:56:45 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-78f049fefd5so428968885a.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 05:56:45 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b2-20020a05620a0f8200b007905e6545f2sm4603766qkn.106.2024.04.24.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 05:56:43 -0700 (PDT)
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
X-Inumbo-ID: 1a7dfbfd-023a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713963404; x=1714568204; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c1U6hFW0nf0o4zSEUalsww+L7r7ioVGT4pSQmKO8EMs=;
        b=US3mohIIhr5kYYuVy9wSDcqsfdrp7f6cro7g/uFprzsIjJXIUqzZmo2Y+sbemRxVd/
         Tb2AiWYmysCZ3lk3hFcthvbFUuaPrbfcT3tHtzDswohRbI3qI9R8EnKonvB7B+gk0NZg
         EZCwhknYjiWxuwpPEX+3fynTw5x9n8ADKJqRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963404; x=1714568204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1U6hFW0nf0o4zSEUalsww+L7r7ioVGT4pSQmKO8EMs=;
        b=NTKh/lnHVnAoh8KQJuhR2KlBxz3ehFPABTIMP1udayqVVXw0b/PLBbd8CLHgqlyevQ
         VKNRz/CTUUlywg+qr3NuEZRgHXazuEqyfxsTn+tjux5W+adiRPmNPlDaG590XvVY8rAA
         /+AdrnPREoe1U5czC824HQaG0ptyCqmXE1vQmUErsGg0iNpmlL5CuzanA2oejlA1+Oz/
         g5fom8UmEduIBZiwKWgGobLAnwmTck+5CHi0usGsk6yqCnfom4pCQdA6PR1koifiNGQJ
         DczS9SqloPNMQwtObgpVgL10C6AF3qmXAYnA5dbrwasXmzqqqAU7CGwI98w5pdo8LG3o
         HciA==
X-Forwarded-Encrypted: i=1; AJvYcCUK5cXOHyCFAlggSucP67ruB2qxicAF5gNCyuqw5/apfgSZjWFycoRigs4vlhMCCUn+/CI8xUDSgY1TqFXbOH8/2SPZz0PmFPGTVxyEyDo=
X-Gm-Message-State: AOJu0YwQznVEyjSS6sEK/OtUhiuqWiJdDgSCOGmEgRGBHtnmy8pbl6Oc
	TJS+ViVUPk2doRnB5ue5dtvOL1XF7sAtXueS8HwU7AeOQ4e1Uxiu633z+ikKB5g=
X-Google-Smtp-Source: AGHT+IF4xur0ZUcD5dkuIAA4m2NSI8uhsYoxJ/kGFtajfefMO+N3fXN2eJYEn75e6LA0WnppD+OWOw==
X-Received: by 2002:a05:620a:5594:b0:78e:db73:913b with SMTP id vq20-20020a05620a559400b0078edb73913bmr2524629qkn.28.1713963404256;
        Wed, 24 Apr 2024 05:56:44 -0700 (PDT)
Message-ID: <6d1218ad-1669-49d6-9ee5-10e604cffd11@citrix.com>
Date: Wed, 24 Apr 2024 13:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] x86/msr: add suffix 'U' to MSR_AMD_CSTATE_CFG
 macro.
To: Jan Beulich <jbeulich@suse.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
 <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
 <424463bd-2682-4f77-896c-f1d1f47aadc9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <424463bd-2682-4f77-896c-f1d1f47aadc9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2024 1:51 pm, Jan Beulich wrote:
> On 24.04.2024 14:11, Alessandro Zucchelli wrote:
>> This addresses violations of MISRA C:2012 Rule 7.2 which states as
>> following: A “u” or “U” suffix shall be applied to all integer constants
>> that are represented in an unsigned type.
>>
>> No functional change.
> I'm inclined to suggest
> Fixes: 652683e1aeaa ("x86/hvm: address violations of MISRA C:2012 Rule 7.2")
> as that change clearly should have taken care of this already. The line
> changed here is even visible in patch context there.
>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
>

I expect it was a race condition.  MSR_AMD_CSTATE_CFG is a recent addition.

~Andrew

