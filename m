Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5E27F9EEE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 12:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642001.1001037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7a6u-0006pZ-KZ; Mon, 27 Nov 2023 11:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642001.1001037; Mon, 27 Nov 2023 11:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7a6u-0006nw-HK; Mon, 27 Nov 2023 11:49:08 +0000
Received: by outflank-mailman (input) for mailman id 642001;
 Mon, 27 Nov 2023 11:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fT1m=HI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r7a6t-0006nq-AP
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 11:49:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f67608a1-8d1a-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 12:49:04 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b4734b975so4776365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 03:49:04 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k24-20020a5d5258000000b00332c0aace23sm11734537wrc.105.2023.11.27.03.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 03:49:03 -0800 (PST)
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
X-Inumbo-ID: f67608a1-8d1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701085744; x=1701690544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kW4RCVrbbaCbEntC8Yzu+19SQZJLaZ2u5ZHseuSLRWI=;
        b=n9RVL8vGBvgHwRwvHEeL+Te6W0GQzpcUaVKBwIMkQZZG5frOsKt5cJyGAxJfIoEAs9
         9TGwl3flkkfu+VapLic+UQsdY8krdEWYYKf2XmM+XINnAFqwLZPDXnxyuEavJGqhlbAB
         zzlY/cHLA2TKEJ6ZjflFzh3S4UPTjecRrtcU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085744; x=1701690544;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kW4RCVrbbaCbEntC8Yzu+19SQZJLaZ2u5ZHseuSLRWI=;
        b=RZ/O7MpQeFXp1v/JxlXF201vS5wCTFhYHK+xI7D+iaTovxbGucwhEDfvgE9dJrcLJx
         oOxP2p7/hAfy3Jo3IEmT/uy2M4++W54ucLiKqtl5KqsNyJtF9o+i/eMbMRxGupxKGwtI
         xD2Z2zmahcen7CM5Op/kFlQZ4bE0HFfBgL1vqwc3fyw3NLn6oqDF7Re8h0AfLyyWFGOy
         vM6kwuGOXoSUPjDuK3xLCv7bPYh9FJuZJSVCCojQT/remD4apz5S2CYfIaHoqSd0eJSz
         uYbSUx+5q7f3016sseFBmJf8+wx5Gu6YTlcwDe7CxtWAxxVbCOQWMdFn/0J8ElyabxSN
         Joyg==
X-Gm-Message-State: AOJu0YxaQB1Xz9elQFICu7UPqvaUAIvk/iNliH95F6ryi+ouV+zSAwye
	ABPx3G32XFrCn5hJFSptIv1DaQ==
X-Google-Smtp-Source: AGHT+IH62kjb8WyQ2w7dbXIM1Smc3JbDbLdKThk7powgW3mBpqS2lHeUWGLJvccXorqCVYSrJGxPaA==
X-Received: by 2002:adf:f94d:0:b0:333:43b:840a with SMTP id q13-20020adff94d000000b00333043b840amr1124769wrr.50.1701085743821;
        Mon, 27 Nov 2023 03:49:03 -0800 (PST)
Message-ID: <a4b4546a-60b8-4d0e-bdf4-9af6699fb925@citrix.com>
Date: Mon, 27 Nov 2023 11:49:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
To: Neowutran <xen@neowutran.ovh>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com> <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <x4qzfuqkkebjkdfmhw6rvdhrn2ewa6ghjtjqd7xevnuylfahh7@pjratinsg76a>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <x4qzfuqkkebjkdfmhw6rvdhrn2ewa6ghjtjqd7xevnuylfahh7@pjratinsg76a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/11/2023 7:54 pm, Neowutran wrote:
> Hi, 
> I did some more tests and research, indeed this patch improved/solved my specific case. 
>
> Starting point: 
>
> I am using Xen version 4.17.2 (exactly this source https://github.com/QubesOS/qubes-vmm-xen).
> In the bios (a Asus motherboard), I configured the "local apic" parameter to "X2APIC".
> For Xen, I did not set the parameter "x2apic-mode" nor the parameter "x2apic_phys". 
>
> Case 1:
> I tryied to boot just like that, result: system is unusuably slow
>
> Case 2:
> Then, I applied a backport of the patch  
> https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw 
> to the original Xen version of QubesOS and I recompiled. 
> (https://github.com/neowutran/qubes-vmm-xen/blob/x2apic3/X2APIC.patch)
> Result: it work, the system is usable. 
>
> Case 3:
> Then, I applied the patch https://github.com/xen-project/xen/commit/26a449ce32cef33f2cb50602be19fcc0c4223ba9
> to the original Xen version of QubesOS and I recompiled.
> (https://github.com/neowutran/qubes-vmm-xen/blob/x2apic4/X2APIC.patch)
> Result: system is  
> unusuably slow. 
>
>
> In "Case 2", the value returned by the function "apic_x2apic_probe" is "&apic_x2apic_mixed". 
> In "Case 3", the value returned by the function "apic_x2apic_probe" is "&apic_x2apic_cluster". 
>
>
> -------------------
> If you want / need, details for the function "apic_x2apic_probe":
>
> Known "input" value:
>
> "CONFIG_X2APIC_PHYSICAL" is not defined
> "iommu_intremap == iommu_intremap_off" = false
> "acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL" -> 0
> "acpi_gbl_FADT.flags" = 247205 (in decimal)
> "CONFIG_X2APIC_PHYSICAL" is not defined
> "CONFIG_X2APIC_MIXED" is defined, because it is the default choice
> "x2apic_mode" = 0
> "x2apic_phys" = -1
>
>
>
> Trace log (I did some call "printk" to trace what was going on)
> Case 2:
> (XEN) NEOWUTRAN: X2APIC_MODE: 0 
> (XEN) NEOWUTRAN: X2APIC_PHYS: -1 
> (XEN) NEOWUTRAN: acpi_gbl_FADT.flags: 247205 
> (XEN) NEOWUTRAN IOMMU_INTREMAP: different 
> (XEN) Neowutran: PASSE 2 
> (XEN) Neowutran: PASSE 4 
> (XEN) NEOWUTRAN: X2APIC_MODE: 3 
> (XEN) Neowutran: PASSE 7 
> (XEN) NEOWUTRAN: X2APIC_MODE: 3 
>  
> (XEN) NEOWUTRAN: X2APIC_PHYS: -1 
> (XEN) NEOWUTRAN: acpi_gbl_FADT.flags: 247205 
> (XEN) NEOWUTRAN IOMMU_INTREMAP: different 
>
> Case 3:
> (XEN) NEOWUTRAN2: X2APIC_PHYS: -1 
> (XEN) NEOWUTRAN2: acpi_gbl_FADT.flags: 247205 
> (XEN) NEOWUTRAN2 IOMMU_INTREMAP: different 
> (XEN) Neowutran2: Passe 1 
> (XEN) NEOWUTRAN2: X2APIC_PHYS: 0 
> (XEN) Neowutran2: Passe 6 
> (XEN) Neowutran2: Passe 7 
> (XEN) NEOWUTRAN2: X2APIC_PHYS: 0 
> (XEN) NEOWUTRAN2: acpi_gbl_FADT.flags: 247205 
> (XEN) NEOWUTRAN2 IOMMU_INTREMAP: different 
> (XEN) Neowutran2: Passe 2 
> (XEN) Neowutran2: Passe 4 
> (XEN) Neowutran2: Passe 7
>
>
>
> If you require the full logs, I could publish the full logs somewhere.
> ----------------------
>
> ( However I do not understand if the root issue is a buggy motherboard, a
> bug in xen, or if the parameter "X2APIC_PHYSICAL" should have been set
> by the QubesOS project, or something else)

Hello,

Thankyou for the analysis.

For your base version of QubeOS Xen, was that 4.13.2-5 ?   I can't see
any APIC changes in the patchqueue, and I believe all relevant bugfixes
are in 4.17.2, but I'd just like to confirm.

First, by "unusable slow", other than the speed, did everything else
appear to operate adequately?  Any chance you could guess the slowdown. 
i.e. was it half the speed, or "seconds per log console line during
boot" levels of slow?


Having re-reviewed 26a449ce32, the patch is correct but the reasoning is
wrong.

ACPI_FADT_APIC_CLUSTER predates x2APIC by almost a decade (it appeared
in ACPI 3.0), and is not relevant outside of xAPIC mode.  xAPIC has 2
different logical destination modes, cluster and flat, and their
applicability is dependent on whether you have fewer or more than 8
local APICs, hence that property being called out in the ACPI spec.

x2APIC does not have this property.  DFR was removed from the
architecture, and logical mode is strictly cluster.  So the bit should
never have been interpreted on an x2APIC code path.

Not that it matters in your case - the bit isn't set in your FADT, hence
why case 1 and 3 have the same behaviour.


This brings us to case 2, where mixed mode does seem to resolve the perf
problem.

Since that patch was written, I've learnt how cluster delivery mode
works for external interrupts, and Xen should never ever have been using
it (Xen appears to be alone in OS software here).  For an external
interrupt in Logical cluster mode, it always sends to the lowest ID in
the cluster.  If that APIC decides that the local processor is too busy
to handle the interrupt now, it forwards the interrupt to the next APIC
in the cluster, and this cycle continues until one APIC accepts the message.

You get most interrupts hitting the lowest APIC in the cluster, but the
interrupt can be forwarded between APICs for an unbounded quantity of
time depending on system utilisation.


Could you please take case 2 and confirm what happens when booting with
x2apic-mode={physical,cluster}?  If the pattern holds, the physical
should be fine, and cluster should see the same problems as case 1 and 3.

Thanks,

~Andrew

