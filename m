Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E566B9F5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478476.741698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLYC-0000JR-QR; Mon, 16 Jan 2023 09:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478476.741698; Mon, 16 Jan 2023 09:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLYC-0000HK-NH; Mon, 16 Jan 2023 09:13:08 +0000
Received: by outflank-mailman (input) for mailman id 478476;
 Mon, 16 Jan 2023 09:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHLYB-0000H6-2l
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:13:08 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f93987ef-957d-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 10:13:03 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHLXi-005Xef-1V; Mon, 16 Jan 2023 09:12:38 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7754A30030F;
 Mon, 16 Jan 2023 10:12:44 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C608420A006E1; Mon, 16 Jan 2023 10:12:44 +0100 (CET)
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
X-Inumbo-ID: f93987ef-957d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Kwtryj1HCBFMowhvUsB8ib2dwQrySNMnhO0NS2CkGbQ=; b=fL34W63fUC/XvD2Z3ptNvw8G8a
	FTOVlIkTnPr/ESjmavB79YyPUbKJbBW9CY2+qWn8xZCQkSzZZrehxK37u2dDt4spOuPEstoggX/+o
	rbrBLVnCuZQio8BsPRDwYPLHNonYLHwwrDmeFDabsXzr5foisEmnDcbybjJeWMHPPR7Z9DeBOlKwt
	S1FDmqLc35Kppc7hQWzuT/E2K7rjYlSDiCSiVC7/h4TUkCslR/zdAl7jvV88gStKgxs6Fn8i3+/48
	soi/xtuHAscLZbFSPhPNUACSXsGgy/slwncXr3F2CiQRIPWmNX3YBGAIL5DAMUhULfAHz6LQJ5366
	BhK/mVfw==;
Date: Mon, 16 Jan 2023 10:12:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/2] x86/xen: don't return from xen_pv_play_dead()
Message-ID: <Y8UVDAgXh/y+B66k@hirez.programming.kicks-ass.net>
References: <20221125063248.30256-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125063248.30256-1-jgross@suse.com>

On Fri, Nov 25, 2022 at 07:32:46AM +0100, Juergen Gross wrote:
> All play_dead() functions but xen_pv_play_dead() don't return to the
> caller.
> 
> Adapt xen_pv_play_dead() to behave like the other play_dead() variants.
> 
> Juergen Gross (2):
>   x86/xen: don't let xen_pv_play_dead() return
>   x86/xen: mark xen_pv_play_dead() as __noreturn
> 
>  arch/x86/xen/smp.h      |  2 ++
>  arch/x86/xen/smp_pv.c   | 17 ++++-------------
>  arch/x86/xen/xen-head.S |  7 +++++++
>  tools/objtool/check.c   |  1 +
>  4 files changed, 14 insertions(+), 13 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

