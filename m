Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91E5722C5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 20:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365998.596539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBKkR-0007n2-0A; Tue, 12 Jul 2022 18:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365998.596539; Tue, 12 Jul 2022 18:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBKkQ-0007kE-Sf; Tue, 12 Jul 2022 18:36:38 +0000
Received: by outflank-mailman (input) for mailman id 365998;
 Tue, 12 Jul 2022 18:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1LYd=XR=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oBKkP-0007k8-Ng
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 18:36:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef6af70-0211-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 20:36:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1381B81BB4;
 Tue, 12 Jul 2022 18:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C44CC3411C;
 Tue, 12 Jul 2022 18:36:33 +0000 (UTC)
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
X-Inumbo-ID: 8ef6af70-0211-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657650993;
	bh=nAOi1MXsyoVA0q9gtRNUyy6hltF+AMdxpRWiXfWBYeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0vW8IXumz/ivLT3cERCSGYAWs6tdTRL1wCt9BWjxzmdxi1SLyExGyUVx+/BrYGW7
	 3CVGWTBENx5dyBMuX+ieXSL+TOud9FcNOdGHmaJJ3paXHZ7ugefk9DeDyQDecm/odG
	 bN9CdSEj/FjZs1q7+EcHAjdilv39IfeOFUFGswE4=
Date: Tue, 12 Jul 2022 20:36:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chuck Zmudzinski <brchuckz@aol.com>
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
Message-ID: <Ys2/Lho9vQO33RZc@kroah.com>
References: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz.ref@aol.com>
 <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>

On Tue, Jul 12, 2022 at 02:20:37PM -0400, Chuck Zmudzinski wrote:
> The commit 99c13b8c8896d7bcb92753bf
> ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
> incorrectly failed to account for the case in init_cache_modes() when
> CPUs do support PAT and falsely reported PAT to be disabled when in
> fact PAT is enabled. In some environments, notably in Xen PV domains,
> MTRR is disabled but PAT is still enabled, and that is the case
> that the aforementioned commit failed to account for.
> 
> As an unfortunate consequnce, the pat_enabled() function currently does
> not correctly report that PAT is enabled in such environments. The fix
> is implemented in init_cache_modes() by setting pat_bp_enabled to true
> in init_cache_modes() for the case that commit 99c13b8c8896d7bcb92753bf
> ("x86/mm/pat: Don't report PAT on CPUs that don't support it") failed
> to account for.
> 
> This patch fixes a regression that some users are experiencing with
> Linux as a Xen Dom0 driving particular Intel graphics devices by
> correctly reporting to the Intel i915 driver that PAT is enabled where
> previously it was falsely reporting that PAT is disabled.
> 
> Fixes: 99c13b8c8896d7bcb92753bf ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> Reminder: This patch is a regression fix that is needed on stable
> versions 5.17 and later.

Then why are you saying it fixes a commit that is in 4.4.y and newer?

confused,

greg k-h

