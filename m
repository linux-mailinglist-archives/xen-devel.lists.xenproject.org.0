Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665959B679
	for <lists+xen-devel@lfdr.de>; Sun, 21 Aug 2022 23:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391050.628724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPsh5-0007Sf-LW; Sun, 21 Aug 2022 21:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391050.628724; Sun, 21 Aug 2022 21:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPsh5-0007Pe-I7; Sun, 21 Aug 2022 21:41:19 +0000
Received: by outflank-mailman (input) for mailman id 391050;
 Sun, 21 Aug 2022 21:41:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gA9S=YZ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oPsh4-0007PY-0Q
 for xen-devel@lists.xenproject.org; Sun, 21 Aug 2022 21:41:18 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa048c7-2199-11ed-9250-1f966e50362f;
 Sun, 21 Aug 2022 23:41:16 +0200 (CEST)
Received: from zn.tnic (p200300ea971b9882329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971b:9882:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 37F911EC02AD;
 Sun, 21 Aug 2022 23:41:09 +0200 (CEST)
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
X-Inumbo-ID: faa048c7-2199-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1661118069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=KIcMde7mEwkhghZiqNjJmux9e20lzrNLzuoUxjrdEyk=;
	b=fRJjagWVesGdFFoceT6Hc3D7jkvR02MBb5zWtq1w8zsMTxMbd6ZkjyTeAq4arHakBVOn1T
	KHITZZ/q5/4f5Fgkn4htYS/3zm+nTTaVmtGAzqPuPiH+mRCPbc5oOmbZfLlivPD2JBF7nK
	ijtRrQXVmQbuujcURhRd5hUUvnLDGBY=
Date: Sun, 21 Aug 2022 23:41:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/10] x86/mtrr: fix MTRR fixup on APs
Message-ID: <YwKmcFuKlq3/MzVi@zn.tnic>
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-2-jgross@suse.com>
 <YwIkV7mYAC4Ebbwb@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwIkV7mYAC4Ebbwb@zn.tnic>

On Sun, Aug 21, 2022 at 02:25:59PM +0200, Borislav Petkov wrote:
> > Fix that by using percpu variables for saving the MSR contents.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > ---
> > I thought adding a "Fixes:" tag for the kernel's initial git commit
> > would maybe be entertaining, but without being really helpful.
> > The percpu variables were preferred over on-stack ones in order to
> > avoid more code churn in followup patches decoupling PAT from MTRR
> > support.
> 
> So if that thing has been broken for so long and no one noticed, we
> could just as well not backport to stable at all...

Yeah, you can't do that.

The whole day today I kept thinking that something's wrong with this
here. As in, why hasn't it been reported until now.

You say above:

"... for all cpus is racy in case the MSR contents differ across cpus."

But they don't differ:

"7.7.5 MTRRs in Multi-Processing Environments

In multi-processing environments, the MTRRs located in all processors
must characterize memory in the same way. Generally, this means that
identical values are written to the MTRRs used by the processors. This
also means that values CR0.CD and the PAT must be consistent across
processors. Failure to do so may result in coherency violations or loss
of atomicity. Processor implementations do not check the MTRR settings
in other processors to ensure consistency. It is the responsibility of
system software to initialize and maintain MTRR consistency across all
processors."

And you can't have different fixed MTRR type on each CPU - that would
lead to all kinds of nasty bugs.

And here's from a big fat box:

$ rdmsr -a 0x2ff | uniq -c
    256 c00

All 256 CPUs have the def type set to the same thing.

Now, if all CPUs go write that same deftype_lo variable in the
rendezvous handler, the only issue that could happen is if a read
sees a partial write. BUT, AFAIK, x86 doesn't tear 32-bit writes so I
*think* all CPUs see the same value being corrected by using mtrr_state
previously saved on the BSP.

As I said, we should've seen this exploding left and right otherwise...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

