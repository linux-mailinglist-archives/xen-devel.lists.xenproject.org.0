Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E59392F2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762258.1172405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwSF-0001jx-6E; Mon, 22 Jul 2024 17:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762258.1172405; Mon, 22 Jul 2024 17:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwSF-0001ew-2F; Mon, 22 Jul 2024 17:04:07 +0000
Received: by outflank-mailman (input) for mailman id 762258;
 Mon, 22 Jul 2024 17:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVwSD-0001aU-P3
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:04:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66938a0b-484c-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 19:04:04 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52f008aa351so2107302e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:04:04 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c789eb8sm443645266b.35.2024.07.22.10.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:04:03 -0700 (PDT)
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
X-Inumbo-ID: 66938a0b-484c-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721667844; x=1722272644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mjgjwa3kPvZM5pZjJMrO/Qtozz1yU/NtYu8JHgYi3c4=;
        b=cfasR34+hgBs+LSaSNFrtUESLlYFlNbLRuUJf0WgPI3JKczNeUKpmOzf4cw2TBpbBz
         xLW6hV9xtbaueqYDZlhb6vP5C+JS23uNTCoA0Opn6jIBs+ZT1BY7mYOBBF3G2qNbI+/Y
         eFNY8CPn3Mq0875yLFcHwnzPW5wY8RPBgnUrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721667844; x=1722272644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mjgjwa3kPvZM5pZjJMrO/Qtozz1yU/NtYu8JHgYi3c4=;
        b=KsuRZVRpBo+UNLdexwzsXFZDlpLQFh/lpV0uVhkFWmmVq5bpgYAXyzwV4OYhWmRjk6
         ictU6khRFjVj+QZAZIWnaerq3NwqREirXWZ2XfauTBkipGG7inLYQplzAwKu0ljwy+/i
         kOKHd7CMkLG/87uXr3g6exp8MK0GmAy3xMTP1Wl8SHqi3pN5DfjQ7IOObEOdHOstZ5ho
         bHePMx0ihaJ9DMFnoJ+DinAsVhORIpVQen+zf8c2DBM/zAOFu6yWCPl0DNfoH4otkGqM
         JFywjwWj3s/gBorlauVlOIuXYz4x2+xPwpBSjcsefYONCi4GO/OOu/4/aPFJQSGWP6gm
         HkoA==
X-Forwarded-Encrypted: i=1; AJvYcCWeVoyUCRZYBk6D9iE4/PHlepuoFuj70JAuRnN89GoUnHBXdp0Na9gMAzSjlPUVv9w8xNeiHm0u4M2B3p+lsOJKRn0QKHkmJt1LEYQ4PiY=
X-Gm-Message-State: AOJu0YzJAaEInLC4DdkG+rjQ3QB1gg+lvYBbXkb0J0fXtuXEYEb+xHdQ
	A/Qcx99lKpuKnv2918K5mgYPN5VhkNcvFhtv6A6NhdeZHyI6cz/J+J+eGLAOUauLcHbn2b+Ps/8
	U
X-Google-Smtp-Source: AGHT+IEWvzuZmfb6npybAMbljO/tdNbsxah4FsHZNNxI0OYH3SpdmTIQOo2Nn5+DX8/ezgVfrhMlXg==
X-Received: by 2002:a05:6512:3e01:b0:52e:a7a6:ed7f with SMTP id 2adb3069b0e04-52efb84ea35mr3420263e87.60.1721667844206;
        Mon, 22 Jul 2024 10:04:04 -0700 (PDT)
Message-ID: <f53e8b5b-1a89-4190-a6bc-495e8487384f@citrix.com>
Date: Mon, 22 Jul 2024 18:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
To: Jan Beulich <jbeulich@suse.com>
Cc: Gene Bright <gene@cyberlight.us>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
 <9123e966-1ec6-4853-b6a2-f92e21dc784c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9123e966-1ec6-4853-b6a2-f92e21dc784c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2024 11:43 am, Jan Beulich wrote:
> On 22.07.2024 12:18, Andrew Cooper wrote:
>> EFI systems can run with NX disabled, as has been discovered on a Broadwell
>> Supermicro X10SRM-TF system.
>>
>> Prior to commit fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot
>> path"), the logic to unlock NX was common to all boot paths, but that commit
>> moved it out of the native-EFI booth path.
>>
>> Have the EFI path attempt to unlock NX, rather than just blindly refusing to
>> boot when CONFIG_REQUIRE_NX is active.
>>
>> Fixes: fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot path")
>> Link: https://xcp-ng.org/forum/post/80520
>> Reported-by: Gene Bright <gene@cyberlight.us>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> for both patches, yet with two remarks and a nit here:
>
> First: Cleanup in the earlier patch will get in the way of backporting
> this easily. Let's hope I won't screw up.

I'd just take both.

The reason the patches are this way around is because the reading of max
extd leaf needs moving in order to add the vendor check, and doing that
together in this patch made the diff far harder to follow.

>
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const struct file *file,
>>      efi_bs->FreePool(ptr);
>>  }
>>  
>> +static bool __init intel_unlock_nx(void)
>> +{
>> +    uint64_t val, disable;
>> +
>> +    rdmsrl(MSR_IA32_MISC_ENABLE, val);
>> +
>> +    disable = val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
>> +
>> +    if ( !disable )
>> +        return false;
>> +
>> +    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);
> The base ISA not having ANDN or NAND (and a prereq to my patch to add
> minimum-ABI-level control to the build machinery still sitting there
> unreviewed), using "val ^ disable" here would likely produce slightly
> better code for the time being.

While that might technically be true, you're assuming that everyone
reading the code can de-obfuscate ^ back into &~, and that the compiler
hasn't made its own alternative arrangements.

It's init code, not a fastpath.

>
>> @@ -752,10 +772,17 @@ static void __init efi_arch_cpu(void)
>>      caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
>>  
>>      /*
>> -     * This check purposefully doesn't use cpu_has_nx because
>> +     * These checks purposefully doesn't use cpu_has_nx because
> Nit: With the change to plural, switch to "don't"?

Yes, my mistake.  Fixed.

~Andrew

