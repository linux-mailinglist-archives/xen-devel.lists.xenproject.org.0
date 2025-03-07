Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD8A56218
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 08:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904626.1312477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqSaY-0005Zz-NG; Fri, 07 Mar 2025 07:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904626.1312477; Fri, 07 Mar 2025 07:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqSaY-0005YH-Jh; Fri, 07 Mar 2025 07:57:46 +0000
Received: by outflank-mailman (input) for mailman id 904626;
 Fri, 07 Mar 2025 07:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UYgQ=V2=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tqSaV-0005YB-Se
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 07:57:44 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d613e2d5-fb29-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 08:57:37 +0100 (CET)
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
X-Inumbo-ID: d613e2d5-fb29-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741334256; x=1741593456;
	bh=nLYTQKoATI/LXfQBASN75Se+HUZd5e+tWhsq1WltsXg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jBVlllenZciSHFHgIlaxGWTRyKaBewczqgUIZuFjFjudyfDogeReO9iyjLK3vKs/D
	 BBovEeUqIJpn9GKc0IOq9qfsdLJSYoTjo3UOG3B41GZlI2Xbj8PPzrtd68vgfMjWtl
	 ppWIBpvYMimJuILG1kgtEkfGWA6lBg+zpFUmfbIHsQ5o7H3q3hxztEjTBpP0h1xDSp
	 wzEE5kr98kbPwjliWAAcIXE+oEM2bVTINRnxL0pLrZXDUU0SvEFa1b0cY733+2eLHc
	 DQM1PZ8qKw4dk7ROXzkLxvc7JJZF3dDEGDDhyFa+vF6XcWFfLOr5SL4HIUp6dAxHaO
	 CKzCpm2NCfvUQ==
Date: Fri, 07 Mar 2025 07:57:28 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] xen/consoled: clean up console handling for PV shim
Message-ID: <pwgsQnY4i4Gw01Ny2d4T-FhShI1m_d6xvFiwdUUto_UC13O_RgXGU-dJ81-ClbWtF0ayeRnHmYuz0YL3-3xGGQ0kxzrl5mpR9xqRteyDemQ=@proton.me>
In-Reply-To: <6aadb0dd-8bfe-4c63-9997-8ded6a9faf98@suse.com>
References: <20250306075819.154361-1-dmkhn@proton.me> <6aadb0dd-8bfe-4c63-9997-8ded6a9faf98@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 54f54509e7b7438895c54f692699d76669a5b9d2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, March 6th, 2025 at 8:35 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:

>=20
>=20
> On 06.03.2025 08:59, dmkhn@proton.me wrote:> --- a/xen/include/xen/consol=
ed.h
>=20
> > +++ b/xen/include/xen/consoled.h
> > @@ -1,12 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > #ifndef XEN_CONSOLED_H
> > #define XEN_CONSOLED_H
> >=20
> > #include <public/io/console.h>
> >=20
> > +int consoled_guest_tx(char c);
> > +
> > +#ifdef CONFIG_PV_SHIM
> > +
> > void consoled_set_ring_addr(struct xencons_interface *ring);
> > struct xencons_interface consoled_get_ring_addr(void);
> > -void consoled_guest_rx(void);
> > -void consoled_guest_tx(char c);
> > +int consoled_guest_rx(void);
> > +bool consoled_is_enabled(void);
> > +
> > +#else
> > +
> > +#define consoled_is_enabled() (false)
> > +
> > +#endif / CONFIG_PV_SHIM */
>=20
>=20
> I'm sorry to be picky, but why did you move just consoled_guest_tx() out
> of the conditional? Once something needs moving out, imo everything that
> doesn't strictly need to be there wants to move out as well. Which would
> leave just consoled_is_enabled() there. Then
> Acked-by: Jan Beulich jbeulich@suse.com
>=20
> I can certainly make the adjustment while committing, if no other need
> for a v6 arises.

I will appreciate help!
Thanks

>=20
> Jan

