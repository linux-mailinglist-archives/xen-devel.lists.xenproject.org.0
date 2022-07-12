Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C59572598
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 21:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366024.596583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLWU-0006iU-Jl; Tue, 12 Jul 2022 19:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366024.596583; Tue, 12 Jul 2022 19:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLWU-0006g8-Gz; Tue, 12 Jul 2022 19:26:18 +0000
Received: by outflank-mailman (input) for mailman id 366024;
 Tue, 12 Jul 2022 19:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1LYd=XR=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oBLWT-0006g2-6t
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 19:26:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f540be1-0218-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 21:26:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11D04B81B96;
 Tue, 12 Jul 2022 19:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA9DC3411C;
 Tue, 12 Jul 2022 19:26:13 +0000 (UTC)
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
X-Inumbo-ID: 7f540be1-0218-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657653973;
	bh=KofZy0gS7enXRLvK5w5s70pOuM52suAS0d4+pv9phsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+JpUI7Hlc73b9zL/pC97stcYKxyVPA2NzaJTw5CDhNHAWTdGQPl4eSAY2DrMC4yZ
	 4w5E3PHJwulm6Ys1IlHBPmCC+2Opm/xQnuZWr6p5ofmoxTUPqlxmpimVKTnLXUxJwp
	 P0Ur70+AdZXROv+Az3KlC8DmWNqTme9x8yRZX0c4=
Date: Tue, 12 Jul 2022 21:26:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Jane Chu <jane.chu@oracle.com>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, stable@vger.kernel.org
Subject: Re: [PATCH] x86/PAT: Report PAT on CPUs that support PAT without MTRR
Message-ID: <Ys3K0oS9QLx778Lb@kroah.com>
References: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz.ref@aol.com>
 <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>
 <Ys2/Lho9vQO33RZc@kroah.com>
 <a9efcbf3-3b34-53b7-0fa8-55a5ed3a17b4@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9efcbf3-3b34-53b7-0fa8-55a5ed3a17b4@netscape.net>

On Tue, Jul 12, 2022 at 03:16:01PM -0400, Chuck Zmudzinski wrote:
> On 7/12/22 2:36 PM, Greg KH wrote:
> > On Tue, Jul 12, 2022 at 02:20:37PM -0400, Chuck Zmudzinski wrote:
> > > The commit 99c13b8c8896d7bcb92753bf
> > > ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
> > > incorrectly failed to account for the case in init_cache_modes() when
> > > CPUs do support PAT and falsely reported PAT to be disabled when in
> > > fact PAT is enabled. In some environments, notably in Xen PV domains,
> > > MTRR is disabled but PAT is still enabled, and that is the case
> > > that the aforementioned commit failed to account for.
> > > 
> > > As an unfortunate consequnce, the pat_enabled() function currently does
> > > not correctly report that PAT is enabled in such environments. The fix
> > > is implemented in init_cache_modes() by setting pat_bp_enabled to true
> > > in init_cache_modes() for the case that commit 99c13b8c8896d7bcb92753bf
> > > ("x86/mm/pat: Don't report PAT on CPUs that don't support it") failed
> > > to account for.
> > > 
> > > This patch fixes a regression that some users are experiencing with
> > > Linux as a Xen Dom0 driving particular Intel graphics devices by
> > > correctly reporting to the Intel i915 driver that PAT is enabled where
> > > previously it was falsely reporting that PAT is disabled.
> > > 
> > > Fixes: 99c13b8c8896d7bcb92753bf ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > > ---
> > > Reminder: This patch is a regression fix that is needed on stable
> > > versions 5.17 and later.
> >
> > Then why are you saying it fixes a commit that is in 4.4.y and newer?
> >
> > confused,
> >
> > greg k-h
> 
> It is true the erroneous reporting of PAT goes back to 4.4.y. But it
> was not until 5.17.y when the i915 driver was patched with a commit
> that started using pat_enabled() instead of boot_cpu_has(X86_FEATURE_PAT)
> and that is when a regression that started annoying users appeared
> in the kernel. I presume that we only backport patches to stable that
> fix regressions that are really bothering users, so even though the
> problem dates to 4.4.y, there is no need to backport before 5.17.y
> which is when the problem manifested in a way that started
> bothering users.

If it needs to go back to 4.9.y or so, let's take it all the way back to
be consistent everywhere.

thanks,

greg k-h

