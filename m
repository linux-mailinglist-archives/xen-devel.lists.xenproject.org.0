Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B79870127
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 13:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688391.1072422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh7KM-0001tk-OF; Mon, 04 Mar 2024 12:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688391.1072422; Mon, 04 Mar 2024 12:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh7KM-0001rO-KA; Mon, 04 Mar 2024 12:21:54 +0000
Received: by outflank-mailman (input) for mailman id 688391;
 Mon, 04 Mar 2024 12:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rh7KM-0001rH-1M
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 12:21:54 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6de11e0-da21-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 13:21:50 +0100 (CET)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3c1ea425a0fso557201b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 04:21:51 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a24-20020ac87218000000b0042ef85c6a42sm194641qtp.17.2024.03.04.04.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 04:21:48 -0800 (PST)
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
X-Inumbo-ID: c6de11e0-da21-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709554910; x=1710159710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lhz+A8tKC1gvelqDSIx7ID/PY3PzPukLCWqUXdA2I9Q=;
        b=lKNpoByTcALnOecQnspFuHuiw93Q1GwyJXibMjHHpzHVnD+sxF+IRz7DU0ZIfz/wbC
         IoCM+o6wGvdIPh5Bu36spL66IBm3z7DO2Wbb5Dg+kFag0BuFIcnPZiRwCgDNEKqIPzUY
         2Irbr1KuxZE7s4B4dhTtBDV1M1z5fBK/8Prek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709554910; x=1710159710;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhz+A8tKC1gvelqDSIx7ID/PY3PzPukLCWqUXdA2I9Q=;
        b=WbI64MMMtWjpfBoEQyJOHEIQxisS2U64OxhYNuWcC/hICHcYw/JESHPAYcAi8AJZp0
         osdBLf2VhKhpEXu0ERD6IrJkYIHigsu0eo1qV4A5ocAmYBsg/3Dz3Z26K5Y0ScJSOoT4
         LjphPwtQ4Rlklm3Fla0u5nx9WxblOnXt1YRwANNJGOxBGpj515hqS1ySU5hWzvqhk9h1
         Bjn0ny+JNg1NZBoFUK/mBbyfN0DFtYRsm5Qnrmk4wcHmg94kvS3dS7MHNpiGg5DJMK9q
         QFzTcRQFiXXSHdi5PCIyKdDwq7ryID7um8ovJ9pUiKeK/B9VNJgYmaf0/le/+43EMKCm
         MIRA==
X-Forwarded-Encrypted: i=1; AJvYcCXGrxFyALzDNx9fWrPf1NLU9EaYnyaZ+qog3etUbJQOtc4PpSIw7QEEhVhLWu+w83x5+yBs6g9IdHc14xn+7dwzrYgwdcpfOlsRKWzRXFE=
X-Gm-Message-State: AOJu0YyR1OV/9HM7eyzVDuQ0/u7+4ucipfhGDWIyj08h7H0viXdthLWp
	glOluH36OYdYIrKwkFnQ0qOh0lKf2UNsj5WiMr4bEQdoCK3nYKov5JxXNqB8nbA=
X-Google-Smtp-Source: AGHT+IGf8yLuPkjw7MLU91ez2zvKrZ8knPVcbF7RvN7zj60aBar9sa/3zX0L9YLALKxxiSLSsmHIdg==
X-Received: by 2002:aca:2b04:0:b0:3c1:4678:5aff with SMTP id i4-20020aca2b04000000b003c146785affmr9053178oik.31.1709554909855;
        Mon, 04 Mar 2024 04:21:49 -0800 (PST)
Message-ID: <7bb5c1f1-f6ac-4345-a969-10387d08dbbc@citrix.com>
Date: Mon, 4 Mar 2024 12:21:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cpu-policy: Hide x2APIC from PV guests
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229221448.2593171-1-andrew.cooper3@citrix.com>
 <da6bb1e7-fa8f-4aca-8ba1-36f49f41d38b@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <da6bb1e7-fa8f-4aca-8ba1-36f49f41d38b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2024 8:33 am, Jan Beulich wrote:
> On 29.02.2024 23:14, Andrew Cooper wrote:
>> PV guests can't write to MSR_APIC_BASE (in order to set EXTD), nor can they
>> access any of the x2APIC MSR range.  Therefore they mustn't see the x2APIC
>> CPUID bit saying that they can.
> This argumentation could then be used equally for the APIC bit. Why is it
> correct to hide x2APIC, but not APIC?

In an ideal world we'd hide APIC too.

But Linux pvops doesn't tolerate it, and I'm not sure classic dom0 did
either.

>> Right now, the host x2APIC flag filters into PV guests, meaning that PV guests
>> generally see x2APIC except on Zen1-and-older AMD systems.
>>
>> Linux works around this by explicitly hiding the bit itself, and filtering
>> EXTD out of MSR_APIC_BASE reads.  NetBSD behaves more in the spirit of PV
>> guests, and entirely ignores the APIC when built as a PV guest.
>>
>> Change the annotation from !A to !S.  This has a consequence of stripping it
>> out of both PV featuremasks.  However, as existing guests may have seen the
>> bit, set it back into the PV Max policy; a VM which saw the bit and is alive
>> enough to migrate will have ignored it one way or another.
>>
>> Hiding x2APIC does also change the contents of leaf 0xb, but as the
>> information is nonsense to begin with, this is likely an improvement on the
>> status quo.  The blind reporting of APIC_ID = vCPU_ID * 2 isn't interlinked
>> with the host's topology structure, and the APIC_IDs are useless without an
>> MADT to start with.  Dom0 is the only PV VM to get an MADT but it's the host
>> one, meaning the two sets of APIC_IDs are from different address spaces.
> Aiui the field will now be seen as zero on all CPUs. Is all CPUs having the
> same APIC ID there really better than them all having different ones?

Again - we're taking something that was conditionally like this, and
making it unconditionally like this.

When x2APIC is hidden, so is the precondition for the data in this leaf
being valid.

> Also while I agree that logically CPUID leaf 0xb EDX is tied to x2APIC being
> available as a feature, nothing is said in this regard in the documentation
> of that leaf. This in particular leaves open whether on a system with x2APIC
> disabled in/by firmware the value would actually be zero. Yet that case could
> be considered somewhat similar to the PV case here.

I'm not aware of there being a capability to disable x2APIC in firmware.

The only choices you got were which mode to default to, and
(occasionally) whether to set the x2APIC opt-out in DMAR.

~Andrew

