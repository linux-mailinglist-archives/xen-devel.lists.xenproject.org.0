Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17526A65AEB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 18:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917572.1322449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuEMx-0005WD-Sa; Mon, 17 Mar 2025 17:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917572.1322449; Mon, 17 Mar 2025 17:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuEMx-0005TW-Om; Mon, 17 Mar 2025 17:35:19 +0000
Received: by outflank-mailman (input) for mailman id 917572;
 Mon, 17 Mar 2025 17:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuEMw-0005TO-Fl
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 17:35:18 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f2df89c-0356-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 18:35:15 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3014cb646ecso2723447a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 10:35:15 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3015363274csm6352341a91.38.2025.03.17.10.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:35:13 -0700 (PDT)
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
X-Inumbo-ID: 2f2df89c-0356-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742232913; x=1742837713; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tP2ZSgPJzcVNhjahR/CWuwGD7iC8y4WI104ettdUq44=;
        b=gNl0JqE7MK/Julodm/4ieOOD+ZS9AySh+e1ppdFG3Sy4jzKZmEdTkB6qkbt0EMWyqE
         8xyI87DG/feNW69PDEQaNflWVcTtnIZkjtA9DcPfHoJ9YC5i7Sy1cy+X3XlKkNoyIkna
         TBJuXdQDoTrgsxNt1BV7F+UAh8BrQE51Op3cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742232913; x=1742837713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tP2ZSgPJzcVNhjahR/CWuwGD7iC8y4WI104ettdUq44=;
        b=o6USMdK4vO2bCen4HlLzZ3vpzE4YiX2jma9b6IIVPgllb4F/9oae6FhvCtvENrDYpQ
         joeJTOdvZ2npsZulk5XceyDoUcmb7LeDyKO4UAGVSMXzupJA7LCP6LiHoF3IYZdWUUoR
         cx8CHjaWem/QAYZD1g6+/xlh/5OV0G1wAM6GD1sawARnITSmCH3zVatVPPENuIriPBmo
         omC2m0UB0y/6G1N61tcz8oAIXiwjog5nwZ7ckf+++WZniNpPgyBGTNV6otTBIJMBlXVD
         UNeVp2GvQDuDXop+sui/VcqS5v2KsTHSaWWMmlnwrrquvL7nDioayOBVmLF8ghkZoAYU
         Cfkg==
X-Forwarded-Encrypted: i=1; AJvYcCXcuJicoMIotrUOIf7Jy/x0GQRHYFpw2K98FiXUKx2sjiSHmvuvvhDsuwnJz28m6mOXJztvnGO6ILI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPuE9sdXkOkAvBbo1sp3BA8gPrigDum0/e3rrEHHf0hkyRO/pa
	0b1wJxirenYHTuluwFZJqgh/hTy9dMrDuNqWxQFGGKh3R11nohx/diZJEyIwks4=
X-Gm-Gg: ASbGnctv7x1v2sP66FkEIvuE8W170krA/3F95/hlmbobZEK3LtgXhGS3DAAdBEYoV1z
	2T9FNT+4+KM/If20o7/DeA2t1FymzpRrhnEvPeoNG45qBQWRybYQU9/EzVYkQmKsNQ96ovJQGYv
	vU75qaPuWKrU9SnZwhL6I9CPqDByepSnWQG0kAd8WQhlWnQAmq1npAI+gYsc7BWfYzIp4TRE3o8
	d0/IcLMMig/cbAap3zqvTra/IwlUeQhtOiwtWCOjw5VjznkGcCoI5G8osBeLmgYYiHvLYiuXif/
	/55ZZjMyuu42I2j7i9ZFLQevnMIePi261SIt5Al3RG59aYvoX5BP4jy56GvigEqsZg==
X-Google-Smtp-Source: AGHT+IFboREbnwcdvzYdlBKVnt2hpH4WzbKzUGcTaJAPb8tdEwH1piMUU/TbNCq8GHOKa85e/BxzVQ==
X-Received: by 2002:a17:90b:5247:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-30151ce122fmr17817492a91.9.1742232913548;
        Mon, 17 Mar 2025 10:35:13 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:35:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20
Message-ID: <Z9hdTCMKxF98wHJw@macbook.local>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
 <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
 <Z9hGH0GLq-I1cKzt@macbook.local>
 <Z9hPaLVVhqAK5H0K@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9hPaLVVhqAK5H0K@mail-itl>

On Mon, Mar 17, 2025 at 05:35:51PM +0100, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 17, 2025 at 04:56:15PM +0100, Roger Pau Monné wrote:
> > On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
> > > On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
> > > > On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
> > > >> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> > > >>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
> > > >>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> > > >>>>
> > > >>>> This one has working S3, so add a test for it here.
> > > >>>>
> > > >>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > >>>> ---
> > > >>>> Cc: Jan Beulich <jbeulich@suse.com>
> > > >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > >>>>
> > > >>>> The suspend test added here currently fails on staging[1], but passes on
> > > >>>> staging-4.19[2]. So the regression wants fixing before committing this
> > > >>>> patch.
> > > >>>>
> > > >>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> > > >>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
> > > >>> We could commit the patch now without the s3 test.
> > > >>>
> > > >>> I don't know what the x86 maintainers think about fixing the suspend
> > > >>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> > > >> I'm on it already, but it's annoying. Lets convert this thread to
> > > >> discussion about the issue:
> > > >>
> > > >> So, I bisected it between staging-4.19 and master. The breakage is
> > > >> somewhere between (inclusive):
> > > >> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> > > >> and
> > > >> 47990ecef286 x86/boot: Improve MBI2 structure check
> > > >>
> > > >> But, the first one breaks booting on this system and it remains broken
> > > >> until the second commit (or its parent) - at which point S3 is already
> > > >> broken. So, there is a range of 71 commits that may be responsible...
> > > >>
> > > >> But then, based on a matrix chat and Jan's observation I've tried
> > > >> reverting f75780d26b2f "xen: move per-cpu area management into common
> > > >> code" just on top of 47990ecef286, and that fixed suspend.
> > > >> Applying "xen/percpu: don't initialize percpu on resume" on top of
> > > >> 47990ecef286 fixes suspend too.
> > > >> But applying it on top of master
> > > >> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
> > > >> but the failure mode is different than without the patch - system resets
> > > >> on S3 resume, with no crash message on the serial console (even with
> > > >> sync_console), instead of hanging.
> > > >> And one more data point: reverting f75780d26b2f on top of master is the
> > > >> same as applying "xen/percpu: don't initialize percpu on resume" on
> > > >> master - system reset on S3 resume.
> > > >> So, it looks like there are more issues...
> > > > Another bisection round and I have the second culprit:
> > > >
> > > >     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
> > > >
> > > > With master+"xen/percpu: don't initialize percpu on resume"+revert of
> > > > 8e60d47cf011 suspend works again on this AMD system.
> > > 
> > > That's not surprising in the slightest.
> > > 
> > > Caching hardware values in Xen isn't safe across S3, which QubesOS has
> > > found time and time again, and for which we still have outstanding bugs.
> > > 
> > > S3 turns most of the system off.  RAM gets preserved, but devices and
> > > plenty of internal registers don't.
> > 
> > I think I've spotted the issue.  enable_iommu() called on resume
> > (ab)uses set_msi_affinity() to force an MSI register write, as it's
> > previous behavior was to unconditionally propagate the values.  With
> > my change it would no longer perform such writes on resume.
> > 
> > I think the patch below should help.
> 
> It doesn't, I still got reboot on resume, with no crash message on
> serial (even with sync_console).

There was an error with the previous patch, and it's also a bug in the
original patch.  Could you give a try to the updated patch below?

Sorry for bothering you, but ATM I haven't found a way to trigger
this myself.

Thanks, Roger.
---
commit 70ea4301d5ca663ac6d850658b3fe832950ec363
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Mon Mar 17 15:40:11 2025 +0100

    x86/msi: always propagate MSI writes when not in active system mode
    
    Relax the limitation on MSI register writes, and only apply it when the
    system is in active state.  For example AMD IOMMU drivers rely on using
    set_msi_affinity() to force an MSI register write on resume from
    suspension.
    
    The original patch intention was to reduce the number of MSI register
    writes when the system is in active state.  Leave the other states to
    always perform the writes, as it's safer given the existing code, and it's
    expected to not make a difference performance wise.
    
    For such propagation to work even when the IRT index is not updated the MSI
    message must be adjusted in all success cases for AMD IOMMU, not just when
    the index has been newly allocated.
    
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 163ccf874720..8bb3bb18af61 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg,
 {
     entry->msg = *msg;
 
+    if ( unlikely(system_state != SYS_STATE_active) )
+        /*
+         * Always propagate writes when not in the 'active' state.  The
+         * optimization to avoid the MSI address and data registers write is
+         * only relevant for runtime state, and drivers on resume (at least)
+         * rely on set_msi_affinity() to update the hardware state.
+         */
+        force = true;
+
     if ( iommu_intremap != iommu_intremap_off )
     {
         int rc;
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 9abdc38053d7..08766122b421 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
-    if ( rc > 0 )
+    if ( rc >= 0 )
     {
         for ( i = 1; i < nr; ++i )
             msi_desc[i].remap_index = msi_desc->remap_index + i;


