Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A388157211D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 18:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365877.596226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIuS-0005Mf-QG; Tue, 12 Jul 2022 16:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365877.596226; Tue, 12 Jul 2022 16:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIuS-0005KA-MQ; Tue, 12 Jul 2022 16:38:52 +0000
Received: by outflank-mailman (input) for mailman id 365877;
 Tue, 12 Jul 2022 16:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1LYd=XR=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oBIuR-0005K0-1V
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 16:38:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1adfddf9-0201-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 18:38:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37D6D6192F;
 Tue, 12 Jul 2022 16:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002E6C3411C;
 Tue, 12 Jul 2022 16:38:46 +0000 (UTC)
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
X-Inumbo-ID: 1adfddf9-0201-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657643927;
	bh=4BDfSSRpMaIphCs/51FX5hBMkKL+h2V39A32PoeENKE=;
	h=Date:From:To:Cc:Subject:From;
	b=VszbvoOQ32Y5tUUOu1X5m/qZVrA8i8HEwF6OfAI3/1iEY8WzgXQYawQzWhkcEHNI1
	 zb7w8lqauDh19oVhcNZgsh2p101mFkKJXH45mNi5sZfjBIZjIfjXX0qJk2ixP1XNaA
	 1zzD/p9+2gIbYSLAfE5mJBzY40yFlUhhIcHqvp4k=
Date: Tue, 12 Jul 2022 18:38:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Build warnings in Xen 5.15.y and 5.10.y with retbleed backports
Message-ID: <Ys2jlGMqAe6+h1SX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I'm seeing the following build warning:
	arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_mmu_update(): can't find starting instruction
in the 5.15.y and 5.10.y retbleed backports.

I don't know why just this one hypercall is being called out by objtool,
and this warning isn't in 5.18 and Linus's tree due to I think commit
5b2fc51576ef ("x86/ibt,xen: Sprinkle the ENDBR") being there.

But, is this a ret call that we "forgot" here?  It's a "real" ret in
Linus's branch:

.pushsection .noinstr.text, "ax"
	.balign PAGE_SIZE
SYM_CODE_START(hypercall_page)
	.rept (PAGE_SIZE / 32)
		UNWIND_HINT_FUNC
		ANNOTATE_NOENDBR
		ANNOTATE_UNRET_SAFE
		ret
		/*
		 * Xen will write the hypercall page, and sort out ENDBR.
		 */
		.skip 31, 0xcc
	.endr

while 5.15.y and older has:
.pushsection .text
	.balign PAGE_SIZE
SYM_CODE_START(hypercall_page)
	.rept (PAGE_SIZE / 32)
		UNWIND_HINT_FUNC
		.skip 31, 0x90
		ANNOTATE_UNRET_SAFE
		RET
	.endr

So should the "ret" remain or be turned into "RET" in mainline right
now?

thanks,

greg k-h

