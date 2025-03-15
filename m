Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045CA62394
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915632.1321111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFwA-0002Bb-Gv; Sat, 15 Mar 2025 01:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915632.1321111; Sat, 15 Mar 2025 01:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFwA-00029i-Dx; Sat, 15 Mar 2025 01:03:38 +0000
Received: by outflank-mailman (input) for mailman id 915632;
 Sat, 15 Mar 2025 01:03:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttFw8-00029c-WA
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:03:36 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a7b87e-0139-11f0-9ab9-95dc52dad729;
 Sat, 15 Mar 2025 02:03:36 +0100 (CET)
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
X-Inumbo-ID: 52a7b87e-0139-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742000614; x=1742259814;
	bh=SmSCL0+qlM06wlDwsoQvN6LfGsCVuGRAQpA59YIyAGA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=g3etPs9mdOtL1+uFK9tNof1jsu935KtiwSU4/zPurc7+yS5NQyIC+A1s+bbUbv4o4
	 +h9RlNZik6aoZeXsFxVw1IlGjkFRlYx6uGc1nDfEN78MsxH1+0SXD+VEco69iQdAhU
	 cqyYx1Mt9c5Ry7jLB+cFu6hlN+fQE7RebZoSnTnYhA1SuKDGM46e4PprEXcfpSaoOH
	 MbALDq875LflCApeogGMA5LoYJGOrloLrN5j2bdDwSg7HP0M/mzyrYHPJYpEizbwWR
	 Xo6ahYeKBzZtyEMlOaauhID9mGIC+gRb75+F6yoHjKvPzgifwv82ZDqE4VBjQiPVh5
	 DudG5wanlMoXQ==
Date: Sat, 15 Mar 2025 01:03:33 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
Message-ID: <ZSWlbJjcQuPrvCTcjHEmH0uZyQ34tfGY1EAiIm_nFCWJIEhebSUiCNRGnFWhSZczh-rhJy8ZgyKe-pvFljjLoTGRUYN1qkvMK0yQX_pySL4=@proton.me>
In-Reply-To: <94879059-1a38-45e3-ab3a-4f8eacd885cf@citrix.com>
References: <20250314011528.2608217-1-dmukhin@ford.com> <94879059-1a38-45e3-ab3a-4f8eacd885cf@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c4661984fceb90cd563f82b971f31e522528bfff
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, March 14th, 2025 at 2:14 AM, Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:

>=20
>=20
> On 14/03/2025 1:20 am, dmkhn@proton.me wrote:
>=20
> > Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
> > readability.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> There are currently very few uses of NR_ISAIRQS, and you're about
> tripling that.
>=20
> Please could you do a prep patch renaming to NR_IRS_IRQS first for
> legibility?

Posted here:
  https://lore.kernel.org/xen-devel/20250315010033.2917197-2-dmukhin@ford.c=
om/

Thanks!

>=20
> ~Andrew

