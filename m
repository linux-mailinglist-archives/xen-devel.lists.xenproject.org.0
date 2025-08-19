Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDAB2C5B1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086635.1444833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMUZ-0007no-JD; Tue, 19 Aug 2025 13:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086635.1444833; Tue, 19 Aug 2025 13:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMUZ-0007mI-GR; Tue, 19 Aug 2025 13:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1086635;
 Tue, 19 Aug 2025 13:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoMUY-0007mC-Oz
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:35:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52d5db63-7d01-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 15:35:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b00797dso35759575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:35:08 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43987sm3781997f8f.16.2025.08.19.06.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:35:07 -0700 (PDT)
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
X-Inumbo-ID: 52d5db63-7d01-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755610508; x=1756215308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9EgTcG7/uKM2WDnvAcInXhfpZXjhAedZwGtEHy2kLgY=;
        b=AA0EK+CnrMrZ1nyG8pCIguul73K+4+zdC0d3o1sHhiQ04GbvTTpHfJwTWTJ8NA3rCI
         6XhtYTBqMrA2x8V18aIuKvPNr6bj3nB9fD9tlEz6r0j3LVT230Tec/yTHnULR9ZULibc
         +XRtxkYiyF9mfNqqUq5WL/6fAK2a+SAVg/yf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610508; x=1756215308;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EgTcG7/uKM2WDnvAcInXhfpZXjhAedZwGtEHy2kLgY=;
        b=uJXVmUN05Vzg4MjJGJStiL6Vwv6Mlr4gxuO8/Q8zNLFu2RUPmK1HnWnBYOk/Y/oYuY
         olk69/wZHyc74fVA3j8EFEUpsFm9IVL7pJniv5X3yhz+vrjOWrb2ueCSVik0o/eJIJ3t
         zkEpnViI5bcAm7zJwqfI+o3PQw1B7TxTr/c7Nv+EuMn9UnDRn+7K1BiVBJiTxrNJ6VBX
         c7i7+WB3Vao02HxCZPPD4y/jlyVsQS9InSz3prfIfWILYIoRcVZMA3eRP4CFvsCYU4cC
         UESgHBOSqAWdxUdX0LZrtSH4fL7cdqElhBbVfrdyhNuu5IVH60TrXhAhxwC+fsxmV288
         l9jw==
X-Forwarded-Encrypted: i=1; AJvYcCWfchG4TECVlHseFEcarDiajhIJb4bVZUvXfhElmRwcCW4BblhEtyEdtv3+qmHev8+TmZeVpia5YSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQvQkxVuQ3Bc0xHJMY0MMLxCs3gisZzt620OYfCf8OCLHMfVng
	vw2hBLL45kz8EKFm73e53wlJy2JDBU57caW8bntbRDJvW3LlGjhvFASBtTDDyo47wWeowTv8eEo
	SKUOr
X-Gm-Gg: ASbGnctDmZJW3DTa94TK9A56MS3FNdmx0Rr65ktqvjBGkuc43a5GMhWS3YstXPv9MhU
	MbSQWgb5u1b891tGaUZ2CF11MZ0bfDqZGThjUs3NhkDHncjIpzv4UPmLwPlnXnCNX76gbQDdGmS
	3FjTbZMMAqWuvcSGkZ1eOxEsbpR3r5nBMiaVx/RDYk7vjwyMYBeUafMucFhzPk3ogxKPh7of2Zw
	538FbndTQXTPTRCRPr65LizjRGwkj73c808Kn55KY0XjX1aoGQsaeSgSokBvilj49ErYdi4YnBZ
	QOB1w+IJl4hsgp9zKiBMO1KcOQ9STg/1qurpXOQdmS8sKgjO/LWyTaadHcF06KPi6WZWC20N3He
	LmUngeiNNCeU7aghjmutRmL0OPgcdFHBCjyJQRicNZK3u7yLye7dp77d1K3Y/lQ2xT4Sc
X-Google-Smtp-Source: AGHT+IEgdSFCVnKWbi8Axj4yu+flJjG0+4b8qZiHARMN6Jm8+3+UQn+9PBz74KniJhqRbIebtBEjDg==
X-Received: by 2002:a05:600c:1909:b0:456:1d93:4365 with SMTP id 5b1f17b1804b1-45b43db65afmr23680345e9.5.1755610508024;
        Tue, 19 Aug 2025 06:35:08 -0700 (PDT)
Message-ID: <a29ecb41-1581-4102-a9ad-6768380484bc@citrix.com>
Date: Tue, 19 Aug 2025 14:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] x86/msr: Implement rdmsr_safe() in C
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-2-andrew.cooper3@citrix.com>
 <e3b37ba8-72df-403b-816d-3be9011b8203@suse.com>
 <341a61df-fde2-40a4-bab3-31a0d66a3d0a@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <341a61df-fde2-40a4-bab3-31a0d66a3d0a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 2:28 pm, Andrew Cooper wrote:
> On 18/08/2025 12:23 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> ... in preparation to be able to use asm goto.
>>>
>>> Notably this mean that the value parameter must be taken by pointer rather
>>> than by value.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> In principle
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Thanks.
>
>> However, having looked at patch 2 first, ...
>>
>>> @@ -879,14 +879,14 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
>>>      case 0x8f: /* Sapphire Rapids X */
>>>  
>>>          if ( (c != &boot_cpu_data && !ppin_msr) ||
>>> -             rdmsr_safe(MSR_PPIN_CTL, val) )
>>> +             rdmsr_safe(MSR_PPIN_CTL, &val) )
>>>              return;
>> ... with this, wouldn't we be better off using ...
>>
>>>          /* If PPIN is disabled, but not locked, try to enable. */
>>>          if ( !(val & (PPIN_ENABLE | PPIN_LOCKOUT)) )
>>>          {
>>>              wrmsr_safe(MSR_PPIN_CTL, val | PPIN_ENABLE);
>>> -            rdmsr_safe(MSR_PPIN_CTL, val);
>>> +            rdmsr_safe(MSR_PPIN_CTL, &val);
>> ... plain rdmsr() here, thus not leaving it open to the behavioral change
>> patch 2 comes with?
> Yeah, probably.  At the point we've read it once, and written to it, a
> subsequent read is not going fail.
>
> I'll adjust, although it will have to be a rdmsrl().

No.  That would introduce a bug, because this path ignores a write error
too.

There isn't actually a problem even with patch 2, because of the how the
logic is currently laid out.

~Andrew

