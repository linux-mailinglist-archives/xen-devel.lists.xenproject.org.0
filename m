Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005A5725A2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 21:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366042.596605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLbv-0000RC-L7; Tue, 12 Jul 2022 19:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366042.596605; Tue, 12 Jul 2022 19:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLbv-0000O1-IE; Tue, 12 Jul 2022 19:31:55 +0000
Received: by outflank-mailman (input) for mailman id 366042;
 Tue, 12 Jul 2022 19:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1LYd=XR=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oBLbu-0000Nv-Al
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 19:31:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47acffc9-0219-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 21:31:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75E9E61947;
 Tue, 12 Jul 2022 19:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C5FC341C0;
 Tue, 12 Jul 2022 19:31:50 +0000 (UTC)
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
X-Inumbo-ID: 47acffc9-0219-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657654310;
	bh=O5l3DDkCL1GLC1cLcZh7E/j88FiYHXorbNoNPs9qYjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7mlHgNgtuET3TxAjKenZBXszlKL5EWencfe+7pE6MvAfl5dII94BZePOvH7Y9v+9
	 aeQwJTYBa1Q8k/ixcCtlq5Qx/t/S6QtFtd1Qt0KqzhyG2/tPiR+MxMsBb4qiolssHp
	 FNhjcDS/z85gj8K/4anC04dMYLqVoHhrA8C7EI5M=
Date: Tue, 12 Jul 2022 21:31:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: Build warnings in Xen 5.15.y and 5.10.y with retbleed backports
Message-ID: <Ys3MI7cv2yKj9RFc@kroah.com>
References: <Ys2jlGMqAe6+h1SX@kroah.com>
 <ddcdd531-fc33-39df-a69f-5352d7a1c8af@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcdd531-fc33-39df-a69f-5352d7a1c8af@oracle.com>

On Tue, Jul 12, 2022 at 03:19:39PM -0400, Boris Ostrovsky wrote:
> 
> On 7/12/22 12:38 PM, Greg KH wrote:
> > Hi all,
> > 
> > I'm seeing the following build warning:
> > 	arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_mmu_update(): can't find starting instruction
> > in the 5.15.y and 5.10.y retbleed backports.
> > 
> > I don't know why just this one hypercall is being called out by objtool,
> > and this warning isn't in 5.18 and Linus's tree due to I think commit
> > 5b2fc51576ef ("x86/ibt,xen: Sprinkle the ENDBR") being there.
> > 
> > But, is this a ret call that we "forgot" here?  It's a "real" ret in
> > Linus's branch:
> > 
> > .pushsection .noinstr.text, "ax"
> > 	.balign PAGE_SIZE
> > SYM_CODE_START(hypercall_page)
> > 	.rept (PAGE_SIZE / 32)
> > 		UNWIND_HINT_FUNC
> > 		ANNOTATE_NOENDBR
> > 		ANNOTATE_UNRET_SAFE
> > 		ret
> > 		/*
> > 		 * Xen will write the hypercall page, and sort out ENDBR.
> > 		 */
> > 		.skip 31, 0xcc
> > 	.endr
> > 
> > while 5.15.y and older has:
> > .pushsection .text
> > 	.balign PAGE_SIZE
> > SYM_CODE_START(hypercall_page)
> > 	.rept (PAGE_SIZE / 32)
> > 		UNWIND_HINT_FUNC
> > 		.skip 31, 0x90
> > 		ANNOTATE_UNRET_SAFE
> > 		RET
> > 	.endr
> > 
> > So should the "ret" remain or be turned into "RET" in mainline right
> > now?
> 
> 
> It doesn't matter --- this is overwritten by the hypervisor during initialization when Xen fills in actual hypercall code.
> 
> 
> So f4b4bc10b0b85ec66f1a9bf5dddf475e6695b6d2 added 'ret' to make objtool happy and then 14b476e07fab6 replaced 'ret' with RET as part of SLS fixes. The latter was not really necessary but harmless.
> 
> 
> So it can be 'ret', RET, or anything else that tools don't complain about. It will not be executed.

Cool, thanks.

But what about the objtool warning that I now see?  Is that "real"?

I don't run any Xen systems, so I can't test any of this myself.

thanks,

greg k-h

