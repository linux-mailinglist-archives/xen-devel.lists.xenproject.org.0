Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA2A469EF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 19:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897152.1305867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMJS-0007o9-5G; Wed, 26 Feb 2025 18:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897152.1305867; Wed, 26 Feb 2025 18:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMJS-0007m6-2H; Wed, 26 Feb 2025 18:39:18 +0000
Received: by outflank-mailman (input) for mailman id 897152;
 Wed, 26 Feb 2025 18:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UxMA=VR=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tnMJP-0007m0-9s
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 18:39:16 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9150d18-f470-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 19:39:13 +0100 (CET)
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
X-Inumbo-ID: f9150d18-f470-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740595151; x=1740854351;
	bh=cZm7m8oDhbS80aDkBqH8CHonuDcIBkWMOqyG+7WetCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hbBYATaLXbFYWTV3qnQtilMlJu96MwXKveF8+FygJvYZgHkZrlSLHZJHPwVh5JRsv
	 xokK6f9H7LHU7f1Mmr8dnMvPB+qc72ftYLjdiS0+loFaogBC6XQ90qr/LCpQHJZWu9
	 L1JdhxrpAdoebrW1VqRmbsIr4e2aMDWZ9tmd0iPhon0IQ0Fy5QrCj5YKHS1k0vIuZb
	 G4bMNsvNM2QGmK+yMPim9cb3zBMTmbYbnC4wzu4DYE9uEcWohCphEaWc1L8ilvEtzS
	 VHbQdiVridncT6fTp0zExRfPkrGh1e+T8caXn4O+wotvISpG+PqUWshjRwBRVwNKyT
	 vUIb4pYVHgs6g==
Date: Wed, 26 Feb 2025 18:39:07 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
Message-ID: <4fIn4-lOrAgG5CkcxCJ-10lj4uGVZmQZpKtP4OZwzSyWyOqmxghZ4UCNsWf7x5vJi9I25YuVZqyTFqrVcRjgD4s4DqrLJrCGkVID4tNSgjk=@proton.me>
In-Reply-To: <d955ba46-6556-40dd-9809-8f64c53dd704@suse.com>
References: <20250218083048.596012-1-dmkhn@proton.me> <d955ba46-6556-40dd-9809-8f64c53dd704@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 55b6029a69ea01f579055b76b494cbf4124f2b54
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, February 26th, 2025 at 3:30 AM, Jan Beulich <jbeulich@suse.co=
m> wrote:

>=20
>=20
> On 18.02.2025 09:31, dmkhn@proton.me wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > console_input_domain() takes an RCU lock to protect domain structure.
> > That implies call to rcu_unlock_domain() after use.
> >=20
> > Introduce a pair of console_get_domain() / console_put_domain() to high=
light
> > the correct use of the call within the code interacting with Xen consol=
e
> > driver.
> >=20
> > The new calls used in __serial_rx(), which also fixed console forwardin=
g to
> > late hardware domains which run with domain IDs different from 0.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > Link to the original patch:
> > https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-4-c5d36b3=
1d66c@ford.com/
> > ---
> > xen/arch/arm/vpl011.c | 6 ++---
> > xen/drivers/char/console.c | 53 +++++++++++++++++++-------------------
> > xen/include/xen/console.h | 3 ++-
> > 3 files changed, 32 insertions(+), 30 deletions(-)
>=20
>=20
> This patch doesn't apply to staging. Looks like it depends on "arm/vuart:
> move vpl011-related code to vpl011 emulator" without this being said anyw=
here.

Correct, this patch depends on
  https://lore.kernel.org/xen-devel/20250212211802.1669675-1-dmukhin@ford.c=
om/
and I have R-b:
  https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2502121412500.61909=
0@ubuntu-linux-20-04-desktop/

>=20
> Jan

