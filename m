Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D95A69087
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920841.1324890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuiM-0008PR-Jq; Wed, 19 Mar 2025 14:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920841.1324890; Wed, 19 Mar 2025 14:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuiM-0008MH-Gb; Wed, 19 Mar 2025 14:48:14 +0000
Received: by outflank-mailman (input) for mailman id 920841;
 Wed, 19 Mar 2025 14:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuuiL-0008M9-G0
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:48:13 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dad8b20-04d1-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:48:11 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3998119f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:48:11 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df33d7sm21848419f8f.17.2025.03.19.07.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 07:48:10 -0700 (PDT)
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
X-Inumbo-ID: 2dad8b20-04d1-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742395690; x=1743000490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T+ejJWYYvwDs6XMjNP2XR+GTzxF7Al8yF6919E///pk=;
        b=LTjxmWThvpqWc1p0dACffsvg0KVbTwoNJrseo2KyeDV6uFril8Gi3fPYcv+dbf2MVI
         WFdXH0jb1+zAE1/2T/1cKCk4Vl2to8YZMbusuOc1T/FtS+TKqeAGMntejgs1zO1VDMTO
         1q/kIKhfsOcUHVdJWyEJW7Efsz5JNldTphgeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395690; x=1743000490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+ejJWYYvwDs6XMjNP2XR+GTzxF7Al8yF6919E///pk=;
        b=gZgVb+iAwuK5o9jSY1SwfZs3T8fRav3jTgpsekRbDU826HcTdeA9QIJ/x6zEgi4Eoc
         6k8u23A5mvhrlJUeewRHxvLXaCiliN0DdleOWmK/5c0I3xsyHrpebjEcV2qyxgzVxndg
         ZVVbQLiCEGXRmPFyIceFaepjXH2qd/30RedlrFtzImfmEy+e7LCNE1amo4RP2ZtfzlpR
         227jj1OhIOA1kzzzzqVXGODW4QHLh1bjTrPtNiygiCQ/ol0L8Zy8efxdX1ziGoPK/l1S
         +UgSa1RT1yxgptRbEPtcEe+OwEzR3lQOBlooTIurHME/UX3EniUH/ZhaROkwAnSPQ/l5
         4YXw==
X-Forwarded-Encrypted: i=1; AJvYcCUfzyCcdcaA5Nmh+wZ3GhDxSrIFssg64+mOIGPVqH96mUTmlHKNXxPuXvISX09gvE+KE3ZKp6/+NPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziLN3bSOdHAtYaeBZOGMdo3YEg1oe+bgEm4qtqC6lHjjAdMjDk
	bsc4Z6yXFzLdaKYtKWId8tGM6nSCBLiUC7xkpLT5JztEgmaXPtHY4gY9yvV8s+k=
X-Gm-Gg: ASbGnctNyzO7Wduu0g4pzUbR6Jvnc8s/tpKLfkPA+rYr83UVLzg72h3Jy4oa5jbZF0d
	hq0IzZ21/95LrSVpCxSPyt7WJCl+Tkfn/Y+DXq9PmtIsk7y7UHTaADXNSYW9HgFpq/O/4/VMvrg
	oOcUwU7AyQG7VVrKMZ2mOT+VGnSNiCJtVy+F0hWzcocSqlL1BlmVUsOFMHu+zIel5nHCLNgt4gf
	mPwJltXfpvvog3vQV6aTS1iNitaHop+PRDkuyRX3FTDhufX+QRr2CqjSQnJTJgdvuVIgHR+b9un
	teJydADlc3dO+J0J7iIvJQDlBAK+urYmWL/hfEuz/KTDvstLJh77rQH+leVZ8hr0lSK4ckro/ai
	Ea2+tfTvN
X-Google-Smtp-Source: AGHT+IENjBjP10rAl+Hz1KcdtIaXKKDJPi6UgJajfiKCFslCKfbfIh903zZLL5CcTCA+siNrPAvhAg==
X-Received: by 2002:a5d:5f91:0:b0:391:319c:1950 with SMTP id ffacd0b85a97d-399739ddf64mr2660238f8f.8.1742395690380;
        Wed, 19 Mar 2025 07:48:10 -0700 (PDT)
Message-ID: <4ad85368-51ae-49b1-9e18-b601bc6a44b4@citrix.com>
Date: Wed, 19 Mar 2025 14:48:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Fix IS_ALIGNED() check in IS_LnE_ALIGNED()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250319142011.138250-1-andrew.cooper3@citrix.com>
 <79bf742f-d472-4744-afda-1b47bd88f04d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <79bf742f-d472-4744-afda-1b47bd88f04d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 2:29 pm, Jan Beulich wrote:
> On 19.03.2025 15:20, Andrew Cooper wrote:
>> The current CI failures happen to be a latent bug triggered by a narrow set of
>> properties of the initrd, which CI encountered by chance.
> Plus properties of the host memory map.
>
>> One step during boot involves constructing directmap mappings for modules.
>> With some probing at the point of creation, it is observed that there's a 4k
>> mapping missing towards the end of the initrd.
>>
>>   (XEN) === Mapped Mod1 [0000000394001000, 00000003be1ff6dc] to Directmap
>>   (XEN) Probing paddr 394001000, va ffff830394001000
>>   (XEN) Probing paddr 3be1ff6db, va ffff8303be1ff6db
>>   (XEN) Probing paddr 3bdffffff, va ffff8303bdffffff
>>   (XEN) Probing paddr 3be001000, va ffff8303be001000
>>   (XEN) Probing paddr 3be000000, va ffff8303be000000
>>   (XEN) Early fatal page fault at e008:ffff82d04032014c (cr2=ffff8303be000000, ec=0000)
>>
>> The conditions for this bug appear to be map_pages_to_xen() call with a non-2M
>> aligned start address, some number of full 2M pages, then a tail needing 4k
>> pages.
>>
>> Anyway, the condition for spotting superpage boundaries in map_pages_to_xen()
>> is wrong.  The IS_ALIGNED() macro expects a power of two for the alignment
>> argument, and subtracts 1 itself.
>>
>> Fixing this causes the failing case to now boot.
>>
>> Fixes: 97fb6fcf26e8 ("x86/mm: introduce helpers to detect super page alignment")
>> Debugged-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> Judging by how IS_ALIGNED() is wrong, I think the pre-condition might be
>> exactly 4k past a 2M boundary, not just simply a non-2M boundary.
> That's the understanding I have gained, yes.
>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5505,7 +5505,7 @@ int map_pages_to_xen(
>>                                                                  \
>>      ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
>>      IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
>> -               (1UL << (PAGETABLE_ORDER * ((n) - 1))) - 1);     \
>> +               (1UL << (PAGETABLE_ORDER * ((n) - 1))));         \
> Can we also get rid of the now unnecessary outermost pair of parentheses
> of that operand, please? Imo any reduction in parentheses in constructs
> like this helps readability.

Ok. I'll adjust all of these, and get the fix in.

Thanks.

~Andrew

