Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39623A6E0C7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 18:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925918.1328785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twlYi-0005Rx-2T; Mon, 24 Mar 2025 17:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925918.1328785; Mon, 24 Mar 2025 17:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twlYh-0005PF-Vg; Mon, 24 Mar 2025 17:25:55 +0000
Received: by outflank-mailman (input) for mailman id 925918;
 Mon, 24 Mar 2025 17:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OLEh=WL=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1twlYf-0005P9-Mn
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 17:25:54 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 082d8dc1-08d5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 18:25:51 +0100 (CET)
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
X-Inumbo-ID: 082d8dc1-08d5-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742837149; x=1743096349;
	bh=6/sQ4z82YmEADDWgiMIF9ohYwXJKmtyxA2NrxrDcbCY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=eTiFjlv/v3FB8DVBRfjQUcZhInBXGZ+JXITJ+0yLPyWDcs/ugaiw7kXYYcHpbDSjh
	 IkC6MfAJBi/+F/SUkZHz2o4p41uf4CTcz9lnryV4/9jL6TVuPlvOmqofPi7tI/dA6U
	 Wg6JXqLUqrU3nMRXW28zczhPkaOshEg+DAX7hW6dLXEYYbzEzdrf+Zif2gkg20v0xF
	 1nv6Vuu5oQlBwMVcSuCfiV6av3T6sr+kBl3nynR8Zx7JAMQMZDHvs+zFzE1ifcD1N4
	 9A7CIfdNK+pbMtVp/71yAre0aepJqBUrGcVoHUDMbGjvaMuSCAgIGEhO6cvWDpoilm
	 ItSkjRh8fqGNQ==
Date: Mon, 24 Mar 2025 17:25:45 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
Message-ID: <S3vHcnDhAQjiX22Mole-rMLN7kVyt0VJlMkbW8xjdR2IA-iisSKw2vpD5-_gZcxu0cn3UmyOgx8xchOuXUNx4SuhfvL5TrcWCyJOr46ueS8=@proton.me>
In-Reply-To: <7b16c87d-f2af-451e-a58f-36461a697ad7@citrix.com>
References: <20250320230339.3897874-1-dmukhin@ford.com> <7b16c87d-f2af-451e-a58f-36461a697ad7@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 551889f1aa14ab51c5ed2e787bec9bb4f7e7717a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 24th, 2025 at 6:51 AM, Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:

>=20
>=20
> On 20/03/2025 11:05 pm, dmkhn@proton.me wrote:
>=20
> > Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
> > range as per [1]. This macro replaces hardcoded checks against the
> > open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
> > the code a bit.
> >=20
> > [1] Intel SDM volume 3A
> > Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
> > Section "Valid Interrupt Vectors"
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> Would it be possible to adjust your git configuration so committer is
> set to Denis Mukhin dmukhin@ford.com ?
>=20
>=20
> Right now, it takes manual fixup to prevent your commits going in as
> authored by dmkhn@proton.me, and one already slipped through.
> https://xenbits.xen.org/gitweb/?p=3Dxen.git&a=3Dsearch&h=3Drefs%2Fheads%2=
Fstaging&st=3Dauthor&s=3Ddmkhn%40proton.me

I will fix my environment, sorry for inconvenience.
Thanks!

>=20
> Thanks,
>=20
> ~Andrew

