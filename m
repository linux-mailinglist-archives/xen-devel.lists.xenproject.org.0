Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A06A9F9DB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 21:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971027.1359531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UPw-0005cQ-ST; Mon, 28 Apr 2025 19:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971027.1359531; Mon, 28 Apr 2025 19:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UPw-0005Zm-PZ; Mon, 28 Apr 2025 19:45:28 +0000
Received: by outflank-mailman (input) for mailman id 971027;
 Mon, 28 Apr 2025 19:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9UPv-0005Zg-Lo
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 19:45:27 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5485b7f2-2469-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 21:45:25 +0200 (CEST)
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
X-Inumbo-ID: 5485b7f2-2469-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745869524; x=1746128724;
	bh=bc7Ndy3JrkpE0Y/Bizs8QiSkvloKDOrkgGRDVzrn52Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=a081DLwTrGg+lyvskID9rm+R7BF4oeL+hhWBq/MEgQSMBb3a3jchycoD3kzbx53bT
	 VqCOPRYeQYYgjaJKkirqTyFEMHxCGboWK/+N9xq3JuMSP4JzS8cbv5/u1cAtdgOuw4
	 kF7oF0qkeNjTN0BGfF/444UapsQj0z0LvRzV4rWRe8bDxLuHZrYTwglMuYkxYBb7Bn
	 jBBv4USFjQOdXUfNoo8Cy+EmhAdiuCQlmz3G4UuepmTP4+LSP4pGm8XIIrRKcEANbt
	 qXlb0bLj019CzQSUNDkOYO1EzulPBF3OTifIThX7bWXPVRsnpEkDjXKYRWEV0CaD8M
	 Mb6QeoTE1KV0A==
Date: Mon, 28 Apr 2025 19:45:19 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v4 1/3] x86/vmx: Introduce vmread()
Message-ID: <aA/azHrc2W7ICQ41@kraken>
In-Reply-To: <0b47b52c-e998-430a-90f6-e95bda74524d@citrix.com>
References: <20250426072720.39317-1-dmukhin@ford.com> <0b47b52c-e998-430a-90f6-e95bda74524d@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9cfb06204fec801e2636169f51587eefbcb3464b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:39:36PM +0100, Andrew Cooper wrote:
> On 26/04/2025 8:27 am, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > The current implementation of __vmread() returns the result via pointer
> > argument which leads to excess code in some places.
> >
> > Introduce a new vmread() function as suggested in [1].
> >
> > [1] https://lore.kernel.org/xen-devel/c452a1d7-4a57-4c5f-8a83-36a74ff22=
8ec@citrix.com/
>=20
> Usually for this, we use
>=20
> Suggested-by: whoever
>=20
> rather than links to emails.=C2=A0 I can fix on commit.

OK, noted for the future.
Thanks!

>=20
> ~Andrew


