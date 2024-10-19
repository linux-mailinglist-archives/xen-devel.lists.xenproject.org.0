Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF629A4F8D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 18:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822585.1236546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2Bsr-00057U-5T; Sat, 19 Oct 2024 16:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822585.1236546; Sat, 19 Oct 2024 16:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2Bsr-00055z-2o; Sat, 19 Oct 2024 16:00:53 +0000
Received: by outflank-mailman (input) for mailman id 822585;
 Sat, 19 Oct 2024 16:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wyF=RP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2Bso-00055t-WF
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 16:00:51 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee1fb73-8e33-11ef-a0be-8be0dac302b0;
 Sat, 19 Oct 2024 18:00:49 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso29913725e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 19 Oct 2024 09:00:49 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf027a50sm4735122f8f.15.2024.10.19.09.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Oct 2024 09:00:47 -0700 (PDT)
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
X-Inumbo-ID: 4ee1fb73-8e33-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729353648; x=1729958448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d0DVluRQMgQwqA5P8D1A1X7VBqpmGdcgsjJkPsiIBNw=;
        b=BchEC3JLRtEYqj8/lY1+i4z2GLb3QNLVhj7ni/CJ70tRCljLrmR0Y5NC12LeIi0GB5
         inpcYe9Oct39pP6jYljcLDNRRGDuudmDSrA1sf3leIHWhy32xqpMoPbTB/DCKl8JrOq9
         vKvtTln2eQvhfcp6QtxDo9Ew1e+7oNuNGURic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729353648; x=1729958448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0DVluRQMgQwqA5P8D1A1X7VBqpmGdcgsjJkPsiIBNw=;
        b=EeF4Nd0yvDqQjqvxzhvSyk6dzDLGhO8OzJG6hCLaUme0o5upUnV6WR7qz/+bqVfWSm
         pSqoEZnCMGbC1YUKdCE+N20CjN7hzZ3cs+b9QiKC5K30an6a5zn7D1Prkvj5drjp3CUh
         1DmugjWo+DNRuK/JJ7Xer0urLv/97EqodzWw+0j5iR0fgS4hGeUTbkcxMYuZ86K73owS
         U3vTT/8bjuUrmj6C3O0BUqPwzf2oZTfIJ5VvJtC9EpRCQVRnadJxkgwuVTFLKh/NJ+TS
         Lj3RNbkQ2bRy0JbVxx4JAHyYHomN2YB9WP519PCprxSSvpQrDIisJKBABzC9qb6xzwDU
         d8ig==
X-Forwarded-Encrypted: i=1; AJvYcCWBW7pOngt+liPUVp8tkvE7k2P7QKlZOdtaGr+w/XXdvk5qatrUrPkBE5+rFFgBMt62Ngg4BHvwk5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxnn0+Nn60jdNnmzXecMeuU7BKIJB4R6XSwVMhlo0fO0kzmICua
	WJHX4kb5bXPjG2nzhnBGKYz6zvicsY2W0uEMgiOn5p5td/tRb9glbQz4Au27Ayo=
X-Google-Smtp-Source: AGHT+IGCLVRMxLqwXI3ADi2W95qGXRBye3CnV//hMHW20/cQeosjAXy7omADYLLdF9TQBX2kHfDPbQ==
X-Received: by 2002:a05:600c:34c1:b0:431:52a3:d9d9 with SMTP id 5b1f17b1804b1-431615bd3f2mr47416075e9.0.1729353648520;
        Sat, 19 Oct 2024 09:00:48 -0700 (PDT)
Message-ID: <34770deb-4fff-4b9a-af2e-668a17a40c93@citrix.com>
Date: Sat, 19 Oct 2024 17:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/44] x86/boot: convert microcode loading to consume
 struct boot_info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-18-dpsmith@apertussolutions.com>
 <c9cc4162-2ddb-4085-be39-a4e477f417c5@citrix.com>
 <f83bd185-e5cf-4824-b2f0-c5300c06d998@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f83bd185-e5cf-4824-b2f0-c5300c06d998@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2024 4:49 pm, Daniel P. Smith wrote:
> On 10/17/24 21:14, Andrew Cooper wrote:
>> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>>> diff --git a/xen/arch/x86/cpu/microcode/core.c
>>> b/xen/arch/x86/cpu/microcode/core.c
>>> index 8564e4d2c94c..22fea80bc97e 100644
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -178,16 +177,16 @@ static void __init microcode_scan_module(
>>>       /*
>>>        * Try all modules and see whichever could be the microcode blob.
>>>        */
>>> -    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
>>> +    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
>>>       {
>>>           if ( !test_bit(i, module_map) )
>>>               continue;
>>>   
>>
>> Somewhere in this series, it would be nice to purge the these "module 0
>> is dom0" special cases.  I'm not sure where best in the series to do it,
>> and it may not be here.
>>
>> Later, in "x86/boot: remove module_map usage from microcode loading" you
>> convert this test_bit() into a type != UNKNOWN check, but the pattern is
>> used elsewhere too.
>>
>> How about a for_each_unknown_module(bi, bm) helper?  (which at this
>> point can even use module_map in scope).
>
> So I do have the first_boot_module_index() iterator which I am using
> to effectively open-code your suggested for_each_unknown_module() in
> one or two places. I can introduce that helper when I first do the
> open coding,
> though I would like to make it a little more generic. I would prefer
> to do it as for_each_bootmodule(bi, bm, type). There is a
> scenario/enhancement that I would like to get to that may require
> doing an iteration on a type other than BOOTMOD_UNKNOWN.
>
> Would you be okay with leaving the module_map usage at this point and
> changing over to the for_each_bootmodule() when it is dropped? As I
> see it, otherwise I would have to make the helper initially work with
> module_map only to turn around and drop it when module_map goes away.
> At least to me, seems like unnecessary churn unless you see a way
> without causing the churn in the helper.

I'll leave it to your judgement about when is best to introduce the
helper.  You know the series better than I do.

~Andrew

