Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0083A979EF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 00:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963668.1354631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lgp-0006Xu-E9; Tue, 22 Apr 2025 22:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963668.1354631; Tue, 22 Apr 2025 22:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lgp-0006W4-BN; Tue, 22 Apr 2025 22:02:03 +0000
Received: by outflank-mailman (input) for mailman id 963668;
 Tue, 22 Apr 2025 22:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7Lgn-0006Vw-Mp
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 22:02:01 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a172e17-1fc5-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 00:01:59 +0200 (CEST)
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
X-Inumbo-ID: 6a172e17-1fc5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745359319; x=1745618519;
	bh=lZljoNL+R2lxF1GXxPJxkv7kzdUwJ95v0+U56DH+QTs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Cl8euVUzyv6gE/vQK1AO09pB5JxugHNcNrUmlr6eogMJAQYE5oZhumil/GhE+WsSA
	 RaoQItlMraEbKiNdxW7kDZRqqBZ+dmwUG6W+DYZviq75fB6gDUXYemMY6zU67jcQHj
	 Zo+GthEMmFfsaYmZJL9HFHT++HWLVwfVcl0a0JTsFBnaYZ0iP/8ejkwLsIjL5v6+px
	 gmLsKsxNrxNfpe6qIfzhKcTqN36naCayLqxWBVJNcYF+mvLFeTaJILiwZN3eyM5zni
	 VqvlnB/D+y1LIwhho9OynGqPaMV28bjK0hWzQ2VtHf3GbEgXs+5R0lvf32UNpoDDJ+
	 yRh0h4rJJ5y+Q==
Date: Tue, 22 Apr 2025 22:01:54 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, dmukhin@ford.com
Subject: Re: [PATCH v3 0/4] CI: updates to XTF CI runners
Message-ID: <aAgRzwTYUZwp1jG3@starscream>
In-Reply-To: <alpine.DEB.2.22.394.2504221353300.785180@ubuntu-linux-20-04-desktop>
References: <20250422161819.2089738-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2504221353300.785180@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ab230ce683a4a38dd3c5b2611047f99ea5a6afc5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 01:54:06PM -0700, Stefano Stabellini wrote:
> On Tue, 22 Apr 2025, dmkhn@proton.me wrote:
>=20
> > The series started from adding new argo XTF CI job and ended up with up=
dating
> > all XTF runners and related CI jobs.
> >
> > It unifies the XTF runner scripts so that it is possible to use one scr=
ipt for
> > executing any XTF test under QEMU. That simplifies running XTFs locally=
 and in
> > CI.
> >
> > Patch 1 reworks x86 XTF runner.
> > Patch 2 reworks x86 EFI XTF.
> > Patch 3 reworks Arm64 XTF runner.
> > Patch 4 adds new argo x86 XTF CI job.
>=20
> I committed the first 3 patches. For the last patch, I take we need to
> wait for the argo test to land in XTF?

Thanks!

Yes, we need argo XTF test.


