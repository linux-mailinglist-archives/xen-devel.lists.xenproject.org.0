Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFBCB2D08A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 02:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087109.1445274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoWDx-0000ks-Q9; Tue, 19 Aug 2025 23:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087109.1445274; Tue, 19 Aug 2025 23:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoWDx-0000ih-Mm; Tue, 19 Aug 2025 23:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1087109;
 Tue, 19 Aug 2025 23:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x5vT=27=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uoWDv-0000ib-8m
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 23:58:40 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bb88661-7d58-11f0-a32a-13f23c93f187;
 Wed, 20 Aug 2025 01:58:37 +0200 (CEST)
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
X-Inumbo-ID: 6bb88661-7d58-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1755647915; x=1755907115;
	bh=bZsMPkcP7LjUClKF5IPD7dJJ3czft31iCTSRqwIQk90=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l2TGHs17hV8+nhPihxnyEhYAysuV1iqT9WpEG696v0UOn/JD5LxZjNZYOm+XgVZKc
	 q47p5MUKGjuHvL9/E/VproQ5iZnuLslS2DtIMUZ9WUQeGUO7ZDiB/212wEWhK73zod
	 7RoKBVcGmbZduJ7l8n3Mwy2DchEmEzgyg1Nqr8xArpkLeXbdmDSUbpZlPRKrE4773f
	 zZPy5akrArOujpd7nhRtpzrWMfHw5iNZ7CQ7puIpOzsn/wXTwiL+xmD64SRtC/hXSL
	 5Xb6HklvwgDDetx2Ju6odATPDMiSIjOlm0eFIIqRVOr5H5IxmnQXx0pVjg/kPL3vop
	 tQYLsw5Ckzd4Q==
Date: Tue, 19 Aug 2025 23:58:31 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
Message-ID: <aKUPo+hRdfGlg+S8@kraken>
In-Reply-To: <f85ae718-0243-4426-a555-327afffe7148@suse.com>
References: <20250812223024.2364749-1-dmukhin@ford.com> <20250812223024.2364749-2-dmukhin@ford.com> <f85ae718-0243-4426-a555-327afffe7148@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 39544987c90e5a39a71aae442a481c81e501bb1b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 09:11:11AM +0200, Jan Beulich wrote:
> On 13.08.2025 00:30, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, there are two different domain ID allocation implementations=
:
> >
> >   1) Sequential IDs allocation in dom0less Arm code based on max_init_d=
omid;
> >
> >   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
> >      max_init_domid (both Arm and x86).
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
> >   ID is not used;
> > - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERV=
ED-1],
> >   starting from the last used ID.
> >   Implementation guarantees that two consecutive calls will never retur=
n the
> >   same ID. ID#0 is reserved for the first boot domain (currently, dom0)=
 and
> >   excluded from the allocation range.
> >
> > Remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
> > Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> > ---
> > Changes since v15:
> > - fixup for check after the first pass in the bitarray in domid_alloc()
> > - trivial renaming for the local variable in domid_alloc()
> > - kept Julien's R-b, added Alejandro's R-b
>=20
> Just to mention: My take is that this kind of a fix ought to invalidate a=
ll
> earlier R-b. It's not just a cosmetic change, after all.

Sorry for the hiccup here, did not mean to overrule the review process.

My bold assumption was that in case of small fixups like this it is
satisfactory to carry over previous acks.

I asked (matrix) both Julien and Alejandro to re-review and confirm.

>=20
> Jan


