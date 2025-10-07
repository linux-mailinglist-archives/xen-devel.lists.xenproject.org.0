Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBCBC0FFE
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 12:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138645.1474289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v64pI-0007EN-R3; Tue, 07 Oct 2025 10:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138645.1474289; Tue, 07 Oct 2025 10:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v64pI-0007BI-O0; Tue, 07 Oct 2025 10:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1138645;
 Tue, 07 Oct 2025 10:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTop=4Q=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1v64pE-0007BC-4Z
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 10:21:46 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6672f1fa-a367-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 12:21:38 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v64oe-0000000DixI-40cP; Tue, 07 Oct 2025 10:21:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 46331300220; Tue, 07 Oct 2025 12:21:06 +0200 (CEST)
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
X-Inumbo-ID: 6672f1fa-a367-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vNHYGcYUWu+zhrNr0VX20BTV37QWlvHYYxUYXoY2euQ=; b=mmsCdRxUI345ERhSUGFHTcgxrE
	YEZ5pJyxwFjtu8mofBBVuNfLELkZEeDY4xtRnova6yDNGRfy3PO2f5ZJt5fhXS4EXa7H/I93ZnRxl
	KdZj8k432ZCmmibrZ4HzmNyYnT5X4GfZX/vtb+rZ7GADcumirEdb3pdbSje4L1lHZVs5E/qeUIqLH
	AlQpU9tMhCwAdFg/0IxUhhHWmj4JMO9Nr2RSXRAhMaUlTBX7VZ7GLsx9YDmR4rU2ImWVeBPoQI2h6
	E6s0OMqZklPR0pC/00tBhTg5qYvmR8s0GddYubu6n4+euFZcwYHTi1xydoKDDvkE0FiYfaeCxoHW3
	Ruy16Hqg==;
Date: Tue, 7 Oct 2025 12:21:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 15/21] x86/xen: Drop xen_irq_ops
Message-ID: <20251007102106.GE3245006@noisy.programming.kicks-ass.net>
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-16-jgross@suse.com>
 <20251006185553.GY3245006@noisy.programming.kicks-ass.net>
 <c8b3c9ea-8c6c-4ec2-b01f-df3f8f487a8c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c8b3c9ea-8c6c-4ec2-b01f-df3f8f487a8c@suse.com>

On Tue, Oct 07, 2025 at 09:47:48AM +0200, J=FCrgen Gro=DF wrote:
> On 06.10.25 20:55, Peter Zijlstra wrote:
> > On Mon, Oct 06, 2025 at 09:46:00AM +0200, Juergen Gross wrote:
> > > Instead of having a pre-filled array xen_irq_ops for Xen PV paravirt
> > > functions, drop the array and assign each element individually.
> >=20
> > Same comment for the next few patches; this changelog is a little light
> > on *why*. I mean, I don't mind the change, but supposedly we should
> > justify things at least a little, right? :-)
>=20
> Would you be fine with the following addition:
>=20
>   This is in preparation of reducing the paravirt include hell by
>   splitting paravirt.h into multiple more fine grained header files,
>   which will in turn require to split up the pv_ops vector as well.
>   Dropping the pre-filled array makes life easier for objtool to
>   detect missing initializers in multiple pv_ops_ arrays.

Yes, that'll do. The latter being the main reason in this case, right?


