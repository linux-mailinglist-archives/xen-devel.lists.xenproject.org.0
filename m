Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D851880339
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 18:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695543.1085371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmd36-0003uO-9p; Tue, 19 Mar 2024 17:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695543.1085371; Tue, 19 Mar 2024 17:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmd36-0003rz-6K; Tue, 19 Mar 2024 17:14:52 +0000
Received: by outflank-mailman (input) for mailman id 695543;
 Tue, 19 Mar 2024 17:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmd34-0003rs-7k
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 17:14:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30ee9838-e614-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 18:14:49 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41412e6b2cfso15788395e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 10:14:49 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0034174875850sm5493269wrb.70.2024.03.19.10.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 10:14:47 -0700 (PDT)
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
X-Inumbo-ID: 30ee9838-e614-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710868488; x=1711473288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6/a3b+fxTvBdKPc6QkA6k20Nwv60cgrdy6XCpTTdV4=;
        b=iG7FysCifNX6P6Ax5YWu3mlQXaqjcz5BzxGD6buLzvvNKl5tWoPiBC7B1n1X+RbGP6
         CSsdV3wJSoR/IjBZZGGOYcB/cRuf0FRzPWmzIk7p8Pe8KMIhwXFcpCmbRhvqoGNqeUEr
         1D1Gx1FzuyGGWci0bcRIhcosWhw1khWL/dBOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710868488; x=1711473288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6/a3b+fxTvBdKPc6QkA6k20Nwv60cgrdy6XCpTTdV4=;
        b=RGsrev/eaego75idkNePq2AhAJ++/ZmYWi0g4x8i1xd5ILWVN+v6gRr6gSLJhg4tdH
         6F3QOuCel4+SCOTzhOjSafjxPskfRBjv2XzcXqXSGHEAItixxTDT+rPaSIImzQwF8gRc
         v9rRROqHdBjizjF2VvThngadGEbiikfYTS8Az7/O09Vj+WUz4vO1SEA7uSY7gZphiWwx
         t5F1uNvwtr82HBBYO1w7LSKga1zOz9rq9Z9+Gny92KY9bhzkijGlHInHtpb3Wp45hveP
         xFzgNde/xp0DOvetl49M3sy+PavkBF0cC2YXiWyrsPvDuH2DzNrW/y4aji2T7zXDmIkO
         DHhw==
X-Forwarded-Encrypted: i=1; AJvYcCX58xVmnA/Npv57d4OgtCdkECKaMwmsejJDlzPcRLrS+hbQqA6w1+LGxENFEAMBRln+zqEtMM0OkXPD7EDkayOg6bHWL0fugwvJ8Rw4IAo=
X-Gm-Message-State: AOJu0YwFgmi7f6CBiJX6XmW2P3F18IHY5oDp6RRvaL2oNeg6Viq2z/gm
	NNOhjaowLyui05dHDFicjiETrSVLwb0GPagipk9oOmATK0Jx0UN7l9E8J7c2dAw=
X-Google-Smtp-Source: AGHT+IEWhF1WEEmo5ffkgUbVs9VOlMvVYiysFsQkLQ1uSJmao0h5BSiPUFRGwdLoJZb0syY7ZbI5cg==
X-Received: by 2002:a05:600c:3c86:b0:414:286:fd1f with SMTP id bg6-20020a05600c3c8600b004140286fd1fmr7705455wmb.11.1710868488528;
        Tue, 19 Mar 2024 10:14:48 -0700 (PDT)
Message-ID: <c322bc29-d1e6-4acb-a410-ea2e3204a111@citrix.com>
Date: Tue, 19 Mar 2024 17:14:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
 <e45432b2-9ab5-4fa7-994c-37265edbc8f5@suse.com>
 <4aa2aced-d4dc-40d6-818b-8163657cd670@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4aa2aced-d4dc-40d6-818b-8163657cd670@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2024 1:11 pm, Jan Beulich wrote:
> On 19.03.2024 08:33, Jan Beulich wrote:
>> On 18.03.2024 19:13, Andrew Cooper wrote:
>>> I'm not sure about FSRSC as a name, but it definitely beats AMD's longhand
>>> name of FAST_REP_SCASB.
>> With FSRS already used, I guess that's the closest we can get to keep
>> names for similar features similar.
>>
>>> --- a/tools/misc/xen-cpuid.c
>>> +++ b/tools/misc/xen-cpuid.c
>>> @@ -91,6 +91,7 @@ static const char *const str_e1c[32] =
>>>      [24] = "perfctr-nb", /* [25] */
>>>      [26] = "dbx",        [27] = "perftsc",
>>>      [28] = "pcx-l2i",    [29] = "monitorx",
>>> +    [30] = "dbext2",
>>>  };
>> AMD calls this AddrMaskExt (PM) or AdMskExtn (PPR). I can see where your
>> different name choice is coming from, yet I still wonder whether we should
>> try to stay closer where possible.
> Having located the corresponding doc,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a slight preference to adjusted names for this one feature.

Neither are great.  How about "addr-msk-ext" ?

~Andrew

