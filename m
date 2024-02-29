Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274086CA2D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:23:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687099.1069973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgO3-0004Xv-SE; Thu, 29 Feb 2024 13:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687099.1069973; Thu, 29 Feb 2024 13:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgO3-0004UQ-Oe; Thu, 29 Feb 2024 13:23:47 +0000
Received: by outflank-mailman (input) for mailman id 687099;
 Thu, 29 Feb 2024 13:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfgO2-0003p3-Hv
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:23:46 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c30fbea2-d705-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 14:23:44 +0100 (CET)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-690494d2e97so3353316d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:23:44 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b19-20020a0cf053000000b0068f6130e80dsm717623qvl.69.2024.02.29.05.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:23:42 -0800 (PST)
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
X-Inumbo-ID: c30fbea2-d705-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709213024; x=1709817824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xkkDsIfnCjDOGW9TDsukCtuFF7czac82KzI4GF5Lho=;
        b=I0qtFJyrapZDHK3lpBoUnB9P/q8ZDY1FrmMFNb0nDLZM+5a1or8gGMST31kmfLGjAD
         ByFO1omm6LLX3TKApim1hpW1UTHInR26UmhnU2Z7KCPtPxN0b8v4Tm51P23qYUyz6LxF
         783SESktBtmrAnTcGi66sVj5EPzLQZa9wiulA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213024; x=1709817824;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xkkDsIfnCjDOGW9TDsukCtuFF7czac82KzI4GF5Lho=;
        b=Dc58xzdlCZK+rGP5KjLDgY3AuUqlmk+lxaCewuMS4sH6VGzFirdD4jUhiSqPmmsTaT
         QwwMQcYu9G1N30cnZ/pE70vo16psh1dviyNaw5ruuubn0lRSMi9tJXaf4XOCRDLgwHeD
         RoLJ7Nbj6Fy149I1DPnwETOBkZuBVc4h3bBE91GZt65Tsn8fJ/Lp1H5fNTHtPx+UsjNR
         YSgJZaiRFtmqVs+Wo2BShq4L4Ie5HPTAIhmSEM6KjICnhAMvfvWCjoWvX9U7OClAlkal
         xwN4h5zvjPFYJ1cSt2jPudP6+NwEUAzCQQ7RhICdSwVxVuC/yneXrMAX2xpiF8M4AYzS
         hIxA==
X-Forwarded-Encrypted: i=1; AJvYcCXi9kF9lypOn71IgHZAgN/2s0fZGEOMoVg8xXwKgXafujJQQeBsRVJMabWczBAzemr7RXqfCxxcM5yYG/7AJFQcaE4bIxCN41JcaMMiDk0=
X-Gm-Message-State: AOJu0Yygk7CcrYRIjUtnfQGyp+rDO9IMULVp6mUJVS0mmK+BpLR72OkY
	p+9BmgYLP1NZlDqs5rqw4QyymsRg9LHb+dvhB3tkQ8h+Xy+u/GcpDtnw8GpmkbQ=
X-Google-Smtp-Source: AGHT+IGz3kZmMvSQwBxgEr/slFaR0FwkaGOqs8g3kEUGGBfz6plBAVAlpbUpY7HFfj+rvqUZ7E4Geg==
X-Received: by 2002:a05:6214:d69:b0:68f:a0c2:7341 with SMTP id 9-20020a0562140d6900b0068fa0c27341mr2857308qvs.13.1709213023778;
        Thu, 29 Feb 2024 05:23:43 -0800 (PST)
Message-ID: <623e9c0e-f05f-41e7-a800-0bba01cba7f4@citrix.com>
Date: Thu, 29 Feb 2024 13:23:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
 <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 12:47 pm, Jan Beulich wrote:
> On 29.02.2024 11:43, Andrew Cooper wrote:
>> Right now, the host x2APIC setting filters into the PV max and default
>> policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
>> x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.
>>
>> Linux has workarounds for the collateral damage caused by this leakage; it
>> unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
>> MSR_APIC_BASE.
>>
>> Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
>> incoming VMs which already saw the bit.  This is logic from before the
>> default/max split in Xen 4.14 which wasn't correctly adjusted at the time.
> What about guest_cpuid()'s handling of leaf 0xb then? The %edx value
> will change once a guest is rebooted, aiui. The comment in
> recalculate_cpuid_policy() that you update refers to that.

That comment is going in the next patch irrespective.

But yes - this will change leaf 0xb from being
host-conditionally-visible to always hidden.

PV guests don't have any coherent idea of topology.  Linux (with the
topo fixes) now explicitly ignores everything it can see and just fakes
up a flat non-SMT topology in a single package.

For PV dom0, where it sees the host MADT, the values in leaf 0xb are
bogus as they don't come from the same enumeration space.
>> Update the annotation from !A to !S which slightly better describes that it
>> doesn't really exist in PV guests.  HVM guests, for which x2APIC can be
>> emulated completely, already has it unconditionally set in the max policy.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> This wants backporting as far as people can tollerate, but it's really not
>> obvious which commit in 4.14 should be referenced in a Fixes: tag.
> Why 4.14? In 4.7.0 I see ...
>
>> @@ -830,11 +846,10 @@ void recalculate_cpuid_policy(struct domain *d)
>>      }
>>  
>>      /*
>> -     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
>> +     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
>>       * affect how to interpret topology information in other cpuid leaves.
>>       */
>>      __set_bit(X86_FEATURE_HTT, max_fs);
>> -    __set_bit(X86_FEATURE_X2APIC, max_fs);
>>      __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
>>  
>>      /*
> ... these adjustments, just still in calculate_pv_featureset(). I
> haven't gone further backwards to check if/when this exposure has
> really appeared. I wouldn't be surprised if it's been like that
> for all the time since we gained x2APIC support in the hypervisor.

4.14 was when we got the proper default vs max split.  Before then, this
block of logic was an opencoded "max(ish) for tookstacks which know
about it" kind of thing.

~Andrew

