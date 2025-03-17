Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBCAA656BA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917283.1322252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCpA-0002Ai-LY; Mon, 17 Mar 2025 15:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917283.1322252; Mon, 17 Mar 2025 15:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCpA-00028Z-Id; Mon, 17 Mar 2025 15:56:20 +0000
Received: by outflank-mailman (input) for mailman id 917283;
 Mon, 17 Mar 2025 15:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuCp9-0001ej-DH
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:56:19 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb6b752-0348-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:56:17 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso818388666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:56:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac314a9b738sm678860766b.165.2025.03.17.08.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 08:56:16 -0700 (PDT)
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
X-Inumbo-ID: 5cb6b752-0348-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742226977; x=1742831777; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJPkunmDHLcj8BF0r2a4T4pCeycX235cqmHEDMO+i5Q=;
        b=ijlpr3WtcpT7DksQ/SzNMqw6d2oYUM9v6XXe8ObNnByI7D2D2F5ZoR5ugI5PeHNejT
         Mi6svm/mQ48rxOleLHiemMFFarjGk2ge39qWajWkrKwZkgagWD5ILm4D9cN4R7jyVjuk
         LSS81c9SKQyacojb5Z4ITedJWLvUj/aGvSu9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226977; x=1742831777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJPkunmDHLcj8BF0r2a4T4pCeycX235cqmHEDMO+i5Q=;
        b=L4zh+5CzmOZu4x7U5FF+h03PmUa83W9fQJyREE46c+H7yErYi59hGI3YE3++pMrBXS
         ardbxTHHUTqiGQ9vozEkdTiKFx+JYOl8whqiaYQN5A/wzNN3sativHll3VbxCOT5U9d6
         ZJnIzho67Yhgf2qeWqyZyAbfxLCzO+zE7DfCxIULs4VWS2cQLWj0R8CvSNgIOpslJIVw
         o8TgHvhZ1Dy5rKHnmd9M60EStYy5Zfplj/C/YC3vKuhnx315ZJTHBuYi1xShuKBNotb1
         cJ3N1yv6WIZjjb/X5iGwGRbch9K2aZJZLmv1cOLXgHZNnJLOShxHtajNIP79x12+BMch
         DSLw==
X-Forwarded-Encrypted: i=1; AJvYcCUKFdVVHjlrafKI+LByI9SfI91lXm9pSkRBKeJV15XOOS8fVP8nq5uODbvdzA12SAmJ9WHLSOCbaJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsDrgUVk0tnFWcCMlS3+w+MItej6tfeHdWuMn/A95o0RBulXli
	HyIejGM+nCvhcmB/FZveW+iLqIVsXS5jDyKo3w3da7lLXZBdwlx3W6Y1Ti1Qf6M=
X-Gm-Gg: ASbGncsUHexZAyiOOW4sRy/v+4UpjK/qPbxV08HvNrhm4rJO6k65ffaIeLBzMDU7mgF
	lE7D3vKS9MsDF1eSttpBogwTp8a5KqOsNjb3AErrm/Nyye92qKV9btEja1bwilixmR+4/tPiea4
	d5UhcUBIdHvf/yfMI1BDED0eQkzs+K3lfBjP1GPaxJdz17hyqfqAQKBOntgol0R3VJ85I7HeKcN
	KRWAW7p+BAc4gWPhUHS6CpGlR9O26BFp+JQEyyIc41CGunrRN0Y/cO3YF7zG4/XlEqDbT7kFu+D
	JpygeQO0EPruYuysNpojgqz2pimF7mlPbpXP902Scj3+aUMny9lYeYZn/c7i26rVZA==
X-Google-Smtp-Source: AGHT+IFVqg9YA6MdlolR8tLtRR9bJ/0hZMhvSsl9Ex4jENfFS1TfAkkW4e9Rm0Fhydka/rBpwsPiLA==
X-Received: by 2002:a17:907:1784:b0:ac2:d1bd:3296 with SMTP id a640c23a62f3a-ac3122c9347mr1822138066b.10.1742226977188;
        Mon, 17 Mar 2025 08:56:17 -0700 (PDT)
Date: Mon, 17 Mar 2025 16:56:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20
Message-ID: <Z9hGH0GLq-I1cKzt@macbook.local>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
 <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>

On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
> On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
> > On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
> >> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> >>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
> >>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> >>>>
> >>>> This one has working S3, so add a test for it here.
> >>>>
> >>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >>>> ---
> >>>> Cc: Jan Beulich <jbeulich@suse.com>
> >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>
> >>>> The suspend test added here currently fails on staging[1], but passes on
> >>>> staging-4.19[2]. So the regression wants fixing before committing this
> >>>> patch.
> >>>>
> >>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> >>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
> >>> We could commit the patch now without the s3 test.
> >>>
> >>> I don't know what the x86 maintainers think about fixing the suspend
> >>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> >> I'm on it already, but it's annoying. Lets convert this thread to
> >> discussion about the issue:
> >>
> >> So, I bisected it between staging-4.19 and master. The breakage is
> >> somewhere between (inclusive):
> >> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> >> and
> >> 47990ecef286 x86/boot: Improve MBI2 structure check
> >>
> >> But, the first one breaks booting on this system and it remains broken
> >> until the second commit (or its parent) - at which point S3 is already
> >> broken. So, there is a range of 71 commits that may be responsible...
> >>
> >> But then, based on a matrix chat and Jan's observation I've tried
> >> reverting f75780d26b2f "xen: move per-cpu area management into common
> >> code" just on top of 47990ecef286, and that fixed suspend.
> >> Applying "xen/percpu: don't initialize percpu on resume" on top of
> >> 47990ecef286 fixes suspend too.
> >> But applying it on top of master
> >> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
> >> but the failure mode is different than without the patch - system resets
> >> on S3 resume, with no crash message on the serial console (even with
> >> sync_console), instead of hanging.
> >> And one more data point: reverting f75780d26b2f on top of master is the
> >> same as applying "xen/percpu: don't initialize percpu on resume" on
> >> master - system reset on S3 resume.
> >> So, it looks like there are more issues...
> > Another bisection round and I have the second culprit:
> >
> >     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
> >
> > With master+"xen/percpu: don't initialize percpu on resume"+revert of
> > 8e60d47cf011 suspend works again on this AMD system.
> 
> That's not surprising in the slightest.
> 
> Caching hardware values in Xen isn't safe across S3, which QubesOS has
> found time and time again, and for which we still have outstanding bugs.
> 
> S3 turns most of the system off.  RAM gets preserved, but devices and
> plenty of internal registers don't.

I think I've spotted the issue.  enable_iommu() called on resume
(ab)uses set_msi_affinity() to force an MSI register write, as it's
previous behavior was to unconditionally propagate the values.  With
my change it would no longer perform such writes on resume.

I think the patch below should help.

I wonder if we should unconditionally propagate the write from
__setup_msi_irq(), as it's also unlikely to make any difference to
skip that write, and would further keep the previous behavior.

Thanks, Roger.
---
commit 1d9bfd0d45f6b547b19f0d2f752fc3bd10103971
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

