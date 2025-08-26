Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42BB35961
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094241.1449580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqKq-0005un-K9; Tue, 26 Aug 2025 09:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094241.1449580; Tue, 26 Aug 2025 09:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqKq-0005sE-HE; Tue, 26 Aug 2025 09:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1094241;
 Tue, 26 Aug 2025 09:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqZn=3G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uqqKp-0005s8-Rf
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:51:23 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 393df5bc-8262-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 11:51:23 +0200 (CEST)
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
X-Inumbo-ID: 393df5bc-8262-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1756201881; x=1756461081;
	bh=kJEcQS6+eU3bNX4bPJig/hf6cxnvjY9POdPDmJHOvUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=neBCetmMGgutRhPLgD0zHt3QZOW07KNYPMArdjLxnJ+JLCuvJcMytTOyf3F6Z4Yz3
	 6blmXfxWOss4AKA72UbUtGF3yny3PMrld3veycHyxa3AzVe6TGyBryyMNAlw2mSxXJ
	 pcH1E6m6TmF74DcwD29ge9qVCFl/pS1xPej3+DIvz7ox/oYU8DG0JazBenEJ2uvv9i
	 WSDCmAHjEDpBaDyjHnaTx/dQgvc3zZI3aLiRwLBB2uiYpHB4C//JpMfSsr5jvNtB99
	 VhT+fDaKXQRau97QjOn2zRf7lbrQCM2URJTCMVTDihmJozxxjsrx10MSeQrqSwJnrC
	 b4k6GvPzXNgfA==
Date: Tue, 26 Aug 2025 09:51:17 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
Message-ID: <aK2DT1tExIl5Ua7r@kraken>
In-Reply-To: <304cffd8-498d-447f-a8b0-cda694393ec8@xen.org>
References: <20250812223024.2364749-1-dmukhin@ford.com> <20250812223024.2364749-2-dmukhin@ford.com> <304cffd8-498d-447f-a8b0-cda694393ec8@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9c2045f5c48d4270e2a5dc7d0817f8faa1b6c2f7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 10:33:16PM +0100, Julien Grall wrote:
> Hi Denis,
>=20
> On 12/08/2025 23:30, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, there are two different domain ID allocation implementations=
:
> >
> >    1) Sequential IDs allocation in dom0less Arm code based on max_init_=
domid;
> >
> >    2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not us=
e
> >       max_init_domid (both Arm and x86).
> >
> > The domain ID allocation covers dom0 or late hwdom, predefined domains,
> > post-boot domains, excluding Xen system domains (domid >=3D
> > DOMID_FIRST_RESERVED).
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Note, fixing dependency on max_init_domid is out of scope of this patch=
.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > new common/domid.c based on the bitmap.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and use=
 it if
> >    ID is not used;
> > - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERV=
ED-1],
> >    starting from the last used ID.
> >    Implementation guarantees that two consecutive calls will never retu=
rn the
> >    same ID. ID#0 is reserved for the first boot domain (currently, dom0=
) and
> >    excluded from the allocation range.
> >
> > Remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
>  > Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>  > ---> Changes since v15:
> > - fixup for check after the first pass in the bitarray in domid_alloc()
>=20
> This was a good catch from Jan. Has a unit-test been added for this issue=
?

No, I did not update the test suite, will do.

>=20
> Anyway, my reviewed-by holds.

Thanks.

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20


