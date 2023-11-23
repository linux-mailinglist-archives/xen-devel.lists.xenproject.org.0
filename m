Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC07F5F01
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639701.997343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68oU-0001hD-64; Thu, 23 Nov 2023 12:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639701.997343; Thu, 23 Nov 2023 12:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68oU-0001f3-3K; Thu, 23 Nov 2023 12:28:10 +0000
Received: by outflank-mailman (input) for mailman id 639701;
 Thu, 23 Nov 2023 12:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIdj=HE=desiato.srs.infradead.org=BATV+39fc1edcc778f4c9f1e2+7396+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r68oT-0001ex-9C
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:28:09 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1bb521c-89fb-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 13:28:07 +0100 (CET)
Received: from [154.49.97.70] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r68oO-00D1r7-1U; Thu, 23 Nov 2023 12:28:04 +0000
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
X-Inumbo-ID: c1bb521c-89fb-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VWAK5xRltuUBYASYt9N56sGcUspu6GohkiBafufHCA0=; b=EiBAOkdFLOJ1usJy9AlhHcl2sM
	Ta/5PJj91vLX5+bH5MXaGjle+lRV/jAShyvmu/i8I35lhzusJ+2Sc/O/DCi5kFkY3G53OnSId0xa+
	P5B+wYJczBuLDkCZyzkm+oxkTTF2rapRawGWikVcHNqAYZlyLEv1UM4/am95yWycJgJdJuAhfKkla
	TAbBp7q4TlyZAoOqrgN7DhUH9Bo3OY3BLkWZKHS0setC0zL6Q67Hky4Rqrqx7Nj1KlfeuGQrRlCsI
	qwgwZclYE+W3lNuWSFNR/r+W2Hw+NDHeIZYOnANn5BM8Y19BPR9wWaR9N+xKBtVuc4t7xKpNSPypY
	LGwVMR0w==;
Date: Thu, 23 Nov 2023 12:27:58 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "paul@xen.org" <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/6=5D_xen=5Fpvdev=3A_Do_not_?= =?US-ASCII?Q?assume_Dom0_when_creating_a_directory?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87v89swtmz.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com> <20231121221023.419901-5-volodymyr_babchuk@epam.com> <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org> <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop> <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org> <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop> <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org> <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop> <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com> <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org> <87bkbky9bb.fsf@epam.com> <5941AF2D-71E7-4A5B-A519-25F87F90DC05@infradead.org> <87v89swtmz.fsf@epam.com>
Message-ID: <C2DEE963-41CB-4377-93FD-BD9FB500926F@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 23 November 2023 12:17:57 GMT, Volodymyr Babchuk <Volodymyr_Babchuk@epam=
=2Ecom> wrote:
>
>Hi David,
>
>David Woodhouse <dwmw2@infradead=2Eorg> writes:
>> Which PV backends do you care about? We already have net, block and con=
sole converted=2E
>
>Well, this is all what we need, actually=2E Even console only will be
>sufficient, as we are using QEMU to provide virtio-pci backends, so both
>storage and networking should be provided by virtio=2E Are you proposing
>to just drop this patch at all? I believe we can live without it, yes=2E

Yeah, I think you can drop anything that's only needed for the legacy back=
ends=2E I'm tempted to make a separate config option to compile those out=
=2E


