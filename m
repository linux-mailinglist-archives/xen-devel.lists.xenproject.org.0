Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D473A770B5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 00:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933099.1335129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzNGk-00061l-F1; Mon, 31 Mar 2025 22:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933099.1335129; Mon, 31 Mar 2025 22:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzNGk-0005yl-Bq; Mon, 31 Mar 2025 22:06:10 +0000
Received: by outflank-mailman (input) for mailman id 933099;
 Mon, 31 Mar 2025 22:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzNGi-0005yf-Jv
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 22:06:09 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 578fc204-0e7c-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 00:06:06 +0200 (CEST)
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
X-Inumbo-ID: 578fc204-0e7c-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743458763; x=1743717963;
	bh=2ITHvXA/jE6BBA/O3peQvbyCBEesTWT9pXAjI2DPzB0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FFoT8xJa5ZfjfsW70qUVPPqm7sln3MwCfezZmJqbP8Q06zTqm7z6zwt9ldGjnt1dJ
	 cG5M8wrNiBsHECvUZsvFwpiI5Mm7Nk65AYicNr9+ZMwMMquxg1wWqDJlUtl9Qa20iD
	 JE7QgrVtux+a7Sf+TFIcXeaJFw6t83M+HY5FXLHZmRcv5v3lTTJHly8DbnKQ+nG8xB
	 jY41iHIUTU+9kOhEOdAjfbPGYcpa4gkIAd6MiiQy/Qk06s78c7333qwpDixGfjJFkI
	 f9lRzH3J5X1LBJjSfgP6J7KBAruHhBZOwhlg/b4hHtq/t4c3DsaXG/RB/vjsvOY06s
	 oBDoZG4xGZk7w==
Date: Mon, 31 Mar 2025 22:05:57 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
Message-ID: <8SMetgSD1uoMZImiRB3XaYH-5w9kuIQG-nWdEjCYMeNSelRS5Jo1XPmLMNjCiZ_PXnFuz3I_4IJiqZojUzgkordBmaU5kWZgCbN32ol9IaY=@proton.me>
In-Reply-To: <alpine.DEB.2.22.394.2503241630590.2325679@ubuntu-linux-20-04-desktop>
References: <20250320230339.3897874-1-dmukhin@ford.com> <7b16c87d-f2af-451e-a58f-36461a697ad7@citrix.com> <S3vHcnDhAQjiX22Mole-rMLN7kVyt0VJlMkbW8xjdR2IA-iisSKw2vpD5-_gZcxu0cn3UmyOgx8xchOuXUNx4SuhfvL5TrcWCyJOr46ueS8=@proton.me> <alpine.DEB.2.22.394.2503241630590.2325679@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8c6ad6d5d8cfc1485cf90c43e15e73e9ff662529
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 24th, 2025 at 4:32 PM, Stefano Stabellini <sstabellini@ker=
nel.org> wrote:

>=20
>=20
> On Mon, 24 Mar 2025, Denis Mukhin wrote:
>=20
> > On Monday, March 24th, 2025 at 6:51 AM, Andrew Cooper andrew.cooper3@ci=
trix.com wrote:
> >=20
> > > On 20/03/2025 11:05 pm, dmkhn@proton.me wrote:
> > >=20
> > > > Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
> > > > range as per [1]. This macro replaces hardcoded checks against the
> > > > open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
> > > > the code a bit.
> > > >=20
> > > > [1] Intel SDM volume 3A
> > > > Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
> > > > Section "Valid Interrupt Vectors"
> > > >=20
> > > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > >=20
> > > Would it be possible to adjust your git configuration so committer is
> > > set to Denis Mukhin dmukhin@ford.com ?
> > >=20
> > > Right now, it takes manual fixup to prevent your commits going in as
> > > authored by dmkhn@proton.me, and one already slipped through.
> > > https://xenbits.xen.org/gitweb/?p=3Dxen.git&a=3Dsearch&h=3Drefs%2Fhea=
ds%2Fstaging&st=3Dauthor&s=3Ddmkhn%40proton.me
> >=20
> > I will fix my environment, sorry for inconvenience.
> > Thanks!
>=20
>=20
> Hi Denis,
>=20
> FYI it is suffiecient to add:
>=20
> From: Denis Mukhin dmukhin@ford.com
>=20
>=20
> as part of the body of the email (first line), git will automatically
> pick it up for the Author field. You don't necessarily need to change
> your email setup.

Thanks!


