Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFC92A33D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 14:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755369.1163702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQnp3-0002Yb-09; Mon, 08 Jul 2024 12:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755369.1163702; Mon, 08 Jul 2024 12:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQnp2-0002Vg-Tj; Mon, 08 Jul 2024 12:50:24 +0000
Received: by outflank-mailman (input) for mailman id 755369;
 Mon, 08 Jul 2024 12:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvmn=OI=netbsd.org=riastradh@srs-se1.protection.inumbo.net>)
 id 1sQnp0-0002VZ-2r
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 12:50:23 +0000
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e68c5f-3d28-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 14:50:20 +0200 (CEST)
Received: by mail.netbsd.org (Postfix, from userid 1457)
 id D3FE284E5A; Mon,  8 Jul 2024 12:50:16 +0000 (UTC)
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
X-Inumbo-ID: a0e68c5f-3d28-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netbsd.org;
	s=20240131; t=1720443016;
	bh=sv+vncVcFsths5MdyJdCkFEoXKk+qtCqzxp50j9X66Y=;
	h=To:CC:In-reply-to:Subject:Date:From;
	b=wpnYM80ohORwLTCj1Qs3RSl3FWBcKjfTsM2E1beqto7wdtlOnBdZWZyjyl02y+nLm
	 IXkem4uIlcqQ6SpFCE7i92/j27NWMlIYUJB5aSniwsNBrO4YKvhGUEmrWAvn6JdiXB
	 3L7Jf+Ml2pnDQ6zy7B+yA1cnL3dXN+EyKI4ZPxiE=
To: Jan Beulich <jbeulich@suse.com>
CC: xen-devel@lists.xenproject.org
In-reply-to: <9d3d1e2e-738e-4ed8-a771-ca541fde9002@suse.com> (jbeulich@suse.com)
Subject: Re: GNTTABOP_setup_table yields -1 PFNs
Date: Mon, 8 Jul 2024 12:50:12 +0000
From: Taylor R Campbell <riastradh-xen-devel@NetBSD.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240708125016.D3FE284E5A@mail.netbsd.org>

> Date: Mon, 8 Jul 2024 11:09:21 +0200
> From: Jan Beulich <jbeulich@suse.com>
>=20
> On 06.07.2024 04:22, Taylor R Campbell wrote:
> > On a Xen 4.14 host (with extraversion=3D.0.88.g1d1d1f53), with version 1
> > grant tables, where GNTTABOP_query_size initially returns nr_frames=3D32
> > max_nr_frames=3D64, a NetBSD guest repeatedly queries
> > GNTTABOP_setup_table for successively larger nr_frames from 1 up.
>=20
> First question: Is there some earlier GNTTABOP_setup_table that you invok=
e?
> I'd expect (and also observe) nr_frames=3D1 initially.

Not that the guest OS invokes.  Perhaps the bootloader, pv-grub 0.97,
might invoke GNTTABOP_setup_table?  I looked around but couldn't find
an obvious source for pv-grub 0.97.

> Second: The version you name is pretty unclear from an upstream perspecti=
ve.
> Leaving aside that 4.14 is out of support, it's entirely unclear whether =
you
> at least have all bug fixes in place that we have upstream (4.14.6). With=
out
> that it's hard to see what you're asking for.

It looks like it's based on commit:

commit 1d1d1f5391976456a79daac0dcfe7157da1e54f7
Author: Roger Pau Monn=E9 <roge.rpau@citrix.com>
Date:   Tue Dec 1 15:34:55 2020 +0100

    x86/vioapic: fix usage of index in place of GSI in vioapic_write_redire=
nt

Does that help to narrow it down?  (I don't know if I can rule out
local changes, though.)

