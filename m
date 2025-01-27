Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EEA1D3C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877516.1287648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLfg-0000aX-Kc; Mon, 27 Jan 2025 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877516.1287648; Mon, 27 Jan 2025 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLfg-0000Y3-HK; Mon, 27 Jan 2025 09:44:44 +0000
Received: by outflank-mailman (input) for mailman id 877516;
 Mon, 27 Jan 2025 09:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcLff-0000Xv-49
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:44:43 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 540eb926-dc93-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 10:44:41 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2165448243fso90485055ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:44:40 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a76117esm6916617b3a.92.2025.01.27.01.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 01:44:38 -0800 (PST)
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
X-Inumbo-ID: 540eb926-dc93-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737971079; x=1738575879; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVonSM/Ug3YBLXyCLFjlMi72TEyASV4Yre95V5cNK0M=;
        b=AMqTxs78EMrT45PlyxxikfaQ6gxyjV0UuLL0dajjHBscaSvQbdXcSDwbY8LhJ/oU2a
         hkjtOpFZogLjNoR77/LDqoYl4BfAFdXny9HFdv5E6g7BrBscCR3Jc8FZjUpZ9LHOpjwp
         HqIIZAANcf7ifoPmIWxgb3wGY8fFrzWTamKVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971079; x=1738575879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVonSM/Ug3YBLXyCLFjlMi72TEyASV4Yre95V5cNK0M=;
        b=wFhxGCdrOTNNs2Hg+Z8HrgN9QFpUZqWmDLP+H1Xq87txhIa3p7DHi/uMjJeBHSOAhm
         Q6zFdvzpqufKCXfwldHgPLSxNFZH9DDT1f3Yf8Tf+2TTPIs80X5r13sosQ3s0MulZK3A
         8z7HsSjiciGdTzZJxQfcrrwVUWuGz549Wl01bCpZxc8RadtlD14oTYCD/e4gBeqRZueS
         Hgc1KCnpAaksiFxY9N/kg+wNVeL3wuaxn6jxmG4R8GTm9muR+3XB4iSlYEW39QsIQY9y
         W9Oqv2d5+f/yb3Posynrpuyd6LOsjOoEQSMUh9MbOgsOzil0cCu9tNm1Oyf7aWggzdmf
         pGLg==
X-Gm-Message-State: AOJu0Yz2CjFzMH/GijRwslbYOVGVzRiu4Q7DkKL+ymIDaDee9+tBvHNJ
	2mFYqjpzBSwlAcGuGKiOYn3GDDqnp4K08z/pwxALEkXZOGB8Adt72rkNLVyDHhA=
X-Gm-Gg: ASbGncuaaoWgi6Jqd8gWjJxORe2MAEVebWQnOIqp+AvD4nffTW5H24T2zTptReaRLdU
	9tCVMr7kdRXVCIW1Voep1fO+DRpV8dzHmeSQb96luRdsJkU891DsoljHeRTCTruycJp43WKjCjA
	YwysglXjm6JAllAG5+vzE0AGw/+e47RfKCCXwHuVsnzslSRWuQlze+DREC8Lh2r3a0gFU4q794f
	OxN+zlrS7Pw/mzQXGxKmjD/8YRrB958Kpegg9PGOaZ2WiKUgcLsWR9DIq7tZCJOrwQJZ90NUbZI
	69yTAhxJxMvYwAg=
X-Google-Smtp-Source: AGHT+IG8uG8XSZ/06Zw1jAP5Y1mbQYeUzLILKBtsWA4evNkgTHFQfBqPQfJh2z8Tw6X26Lop0+LKTQ==
X-Received: by 2002:a05:6a00:3c8a:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72daf9a6d2dmr61861798b3a.3.1737971079414;
        Mon, 27 Jan 2025 01:44:39 -0800 (PST)
Date: Mon, 27 Jan 2025 10:44:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Serious AMD-Vi issue
Message-ID: <Z5dVgd3aF_n9Q3hZ@macbook.local>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <Z5OkQgjd4Lt_rtr0@macbook.local>
 <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>

On Fri, Jan 24, 2025 at 01:26:23PM -0800, Elliott Mitchell wrote:
> On Fri, Jan 24, 2025 at 03:31:30PM +0100, Roger Pau Monné wrote:
> > On Thu, Jan 25, 2024 at 12:24:53PM -0800, Elliott Mitchell wrote:
> > > Apparently this was first noticed with 4.14, but more recently I've been
> > > able to reproduce the issue:
> > > 
> > > https://bugs.debian.org/988477
> > > 
> > > The original observation features MD-RAID1 using a pair of Samsung
> > > SATA-attached flash devices.  The main line shows up in `xl dmesg`:
> > > 
> > > (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I
> > 
> > I think I've figured out the cause for those faults, and posted a fix
> > here:
> > 
> > https://lore.kernel.org/xen-devel/20250124120112.56678-1-roger.pau@citrix.com/
> > 
> > Fix is patch 5/5, but you likely want to take them all to avoid
> > context conflicts.
> 
> I haven't tested yet, but some analysis from looking at the series.
> 
> This seems a plausible explanation for the interrupt IOMMU messages.  As
> such I think there is a good chance the reported messages will disappear.
> 
> Nothing in here looks plausible for solving the real problem, that of
> RAID1 mirrors diverging (almost certainly getting zeroes during DMA, but
> there is a chance stale data is being read).
> 
> Worse, since it removes the observed messages, the next person will
> almost certainly have severe data loss by the time they realize there is
> a problem.  Notably those messages lead me to Debian #988477, so I was
> able to take action before things got too bad.

I think it's the first time I get complains from the reported of a bug
after attempting to fix it.

Maybe my original message wasn't clear enough.  So far I consider the
IOMMU faults and the disk issues different bugs, and hence me asking
specifically whether the posted series make any different for any of
those issues.

I would be surprised if it also fixed the data loss issue, but wanted
to ask regardless.

> 
> 
> I'm not absolutely certain this is a pure Xen bug.  There is a
> possibility the RAID1 driver is reusing DMA buffers in a fashion which
> violates the DMA interface.  Yet there is also a good chance Xen isn't
> implementing its layer properly either.
> 
> 
> 
> There is one pattern emerging at this point.  Samsung hardware is badly
> effected, other vendors are either uneffected or mildly effected.
> Notably the estimated age of the devices meant to be handed off to
> someone able to diagnose the issue is >10 years.  The uneffected
> Crucial/Micron SATA device *should* drastically outperform these, yet
> instead it is uneffected.  The Crucial/Micron NVMe is very mildly
> effected, yet should be more than an order of magnitude faster.
> 
> The simplest explanation is the flash controller on the Samsung devices
> is lower latency than the one used by Micron.
> 
> 
> Both present reproductions feature AMD processors and ASUS motherboards.
> I'm doubtful of this being an ASUS issue.  This seems more likely a case
> of people who use RAID with flash tending to go with a motherboard vendor
> who reliably support ECC on all their motherboards.
> 
> I don't know whether this is confined to AMD processors, or not.  The
> small number of reproductions suggests few people are doing RAID with
> flash storage.  In which case no one may have tried RAID1 with flash on
> Intel processors.  On Intel hardware the referenced message would be
> absent and people might think their problem was distinct from Debian
> #988477.

As said above - my current hypothesis is that the IOMMU fault message
is just a red herring, and has nothing to do with the underlying data
loss issue that you are seeing.

I expect there will be no similar IOMMU fault message on Intel
hardware, as updating of interrupt remapping entries was already done
atomically on VT-d.

> In fact what seems a likely reproduction on Intel hardware is the Intel
> sound card issue.  I notice that issue occurs when sound *starts*
> playing.  When a sound device starts, its buffers would be empty and the
> first DMA request would be turned around with minimal latency.  In such
> case this matches the Samsung SATA devices handling DMA with low
> latency.

Can you reproduce the data loss issue without using RAID in Linux?
You can use fio with verify or similar to stress test it.

Can you reproduce if dom0 is PVH instead of PV?

Can you reproduce with dom0-iommu=strict mode in the Xen command line?

> 
> 
> > Can you give it a try and see if it fixes the fault messages, plus
> > your issues with the disk devices?
> 
> Ick.  I was hoping to avoid reinstalling the known problematic devices
> and simply send them to someone better setup for analyzing x86 problems.
> 
> Looking at the series, it seems likely to remove the fault messages and
> turn this into silent data loss.  I doubt any AMD processors have an
> IOMMU, yet omit cmpxchg16b (older system lacked full IOMMU, yet did have
> cmpxchg16b, newer system has both).  Even guests have cmpxchg16b
> available.

Silent data loss> data loss might or not be there, regardless of whether
IOMMU faults are being reported.  IMO it's unhelpful to make this kind of
comments, as you seem to suggest a preference for leaving the IOMMU
fault bug unfixed, which I'm sure it's not the case.

> If you really want this tested, it will be a while before the next
> potential downtime window.

No worries, I already have confirmation from someone else that was
seeing the same IOMMU faults has tested the fix.  I was mostly
wondering whether it would affect your data loss issues in any way, as
for that I have no one else that can reproduce.

Thanks, Roger.

