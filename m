Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7B88112D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 12:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695876.1086118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmuNY-0008MX-1O; Wed, 20 Mar 2024 11:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695876.1086118; Wed, 20 Mar 2024 11:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmuNX-0008KQ-Ul; Wed, 20 Mar 2024 11:45:07 +0000
Received: by outflank-mailman (input) for mailman id 695876;
 Wed, 20 Mar 2024 11:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoSn=K2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmuNX-0008KK-8d
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 11:45:07 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b5dc919-e6af-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 12:45:06 +0100 (CET)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-430a7497700so42375041cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 04:45:06 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 kk12-20020a05622a2c0c00b0042f3830ef2csm7380661qtb.33.2024.03.20.04.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 04:45:04 -0700 (PDT)
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
X-Inumbo-ID: 4b5dc919-e6af-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710935105; x=1711539905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZAQvVoBCyzU/1oUrCyBVFll9V2JjiyFu0n8HcXYqGY=;
        b=ispV/x+UytR41XoT8wgEN/yogXz0kWHA8bylnYljgFVFpP8A+8nIu8ueQDAoypZT4w
         Y1NHS7dKY5REo879ndw5yxeg68PmMlAivnVMPzVJRQzfqLtq08cKPlsYtxwFQ/KErv1X
         3I8+rE+/S+HeImJ59PvZahpJA6jalXcLhfBfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710935105; x=1711539905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZAQvVoBCyzU/1oUrCyBVFll9V2JjiyFu0n8HcXYqGY=;
        b=IXUpCwlAxPtA+3nkPkQd7HCqfZtvm86lwakCWBV2H1/ves2rkIgE3KeeKJ5bg+jC/S
         O7bglRrfBUAlQzqoRkqdin87szjdjcLM6PIYM2ebY5utE9q1Z55bw+BFxpxAA0qlE3BJ
         213liODIVYSg8q4eYACDX3V5cFJWRC8tJeRC+w+m9mVU9oHCLV6MopWJRX/Oq1pOgXNt
         NC9tJC+iBVJTjlg2+XigisLM1A5Ark+JO8gPtDfuNTstp031DkFnET64MYOwDxrzXNGU
         wkTEN3KDtzLYLXqujRabnRe6WJPfXG9/Djnh+jz2dIq5TwMYIjnQzI1yZnl8JHMcnN2D
         Ws4g==
X-Forwarded-Encrypted: i=1; AJvYcCWtNxxABJa85fUDS332J82EGl0nLJRe1L9YNM+CZqG4Hyvbx71b69v48q9K5HDD6dZ5vVmJwLZfwWlmnGpOZSGtluB4AQILUAG0emULPIA=
X-Gm-Message-State: AOJu0YzhWgpHftElhtvaif23t83vrG9GVLFKZlWltpCbDLdEQIMhxcWn
	Zn9nq/aP6bCOSy7/PblpmvcuzWhlFRXZxygtyLK6tlJbrcL4UvnOIEctBDuIhFg=
X-Google-Smtp-Source: AGHT+IEGXKDiwBuYKTnNokF6SyW+hE1eh5rvw6/6Am3prwEXWp4Mxx9nGosk18+xcnzk/MrpTUfOaw==
X-Received: by 2002:a05:622a:650:b0:430:b5ab:28ef with SMTP id a16-20020a05622a065000b00430b5ab28efmr18689020qtb.47.1710935104789;
        Wed, 20 Mar 2024 04:45:04 -0700 (PDT)
Message-ID: <9268c7e4-afb5-485b-aaf5-818b3f21c6e3@citrix.com>
Date: Wed, 20 Mar 2024 11:45:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
 <8eb3d0d4-daf2-40a4-83b6-d3726e02814f@citrix.com>
 <e8898bca-7dd2-4e40-acc0-72c4d7da1d1d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e8898bca-7dd2-4e40-acc0-72c4d7da1d1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2024 8:12 am, Jan Beulich wrote:
> On 19.03.2024 18:40, Andrew Cooper wrote:
>> It occurs to me that I need this hunk too.
>>
>> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
>> index 25d329ce486f..bf3f9ec01e6e 100755
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -329,6 +329,10 @@ def crunch_numbers(state):
>>          # In principle the TSXLDTRK insns could also be considered
>> independent.
>>          RTM: [TSXLDTRK],
>>  
>> +        # Enhanced Predictive Store-Forwarding is a informational note
>> on top
>> +        # of PSF.
>> +        PSFD: [EPSF],
>> +
>>          # The ARCH_CAPS CPUID bit enumerates the availability of the
>> whole register.
>>          ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
>>  
>>
>> To cause EPSF to disappear properly when levelling.
> What exactly is wrong with exposing EPSF when PSFD is not there?

https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/white-papers/security-analysis-of-amd-predictive-store-forwarding.pdf

Final sentence before the conclusion:

"Software can determine the presence of EPSF through CPUID Fn8000_0021
EAX[18]. All processors that support EPSF will also support PSFD."

i.e. you'll never see anything about PSF without having the controls to
turn it off.

~Andrew

