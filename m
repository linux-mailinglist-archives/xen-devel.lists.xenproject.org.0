Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B91AD40F3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 19:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011144.1389485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP2v3-0007M4-F4; Tue, 10 Jun 2025 17:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011144.1389485; Tue, 10 Jun 2025 17:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP2v3-0007JD-Bz; Tue, 10 Jun 2025 17:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1011144;
 Tue, 10 Jun 2025 17:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP2v0-0007J6-Gu
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 17:37:51 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a025dab3-4621-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 19:37:48 +0200 (CEST)
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
X-Inumbo-ID: a025dab3-4621-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749577067; x=1749836267;
	bh=n+8Zp4ThX8bXf2cDbE03SB7SU8GLT8y0/4kovw9ji1M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WifSoPaeSwPgA6bC48ngGhQYFA64GJcRnmCP2CUsMAx6gB42goLq1iLS7IKUaxZZH
	 r4+lK7mE3+SLgYMri93Ix5PCwmYnwhOPG72cd+LiF4zQM/BdNeczCF0TSDy/mOnPXl
	 VXPwxgOQPBqC3Jev5Rbs+y9w+okI17K6WH5OZMX0s2oAZxzna+L2h4jCwAzZkAPmkG
	 vK0h5UJTuKvZBpMkj5l612DYQNCJnmOKHKiufzgFyudcVpdh5q2H/oDp8PY3TULY7s
	 4RhEQsGbCLv3NBUim4D2OmgcigJ0+JXefsp3KSq9+y77Y3v0TuAvoI5hNO2itW1oFS
	 wXl296pHgdEgQ==
Date: Tue, 10 Jun 2025 17:37:41 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
Message-ID: <aEhtYPt5/ODqES7m@kraken>
In-Reply-To: <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com>
References: <20250606194937.2412579-1-dmukhin@ford.com> <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c09e8553de55c506b95d74878083f167b703fb51
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:10:44AM +0200, Jan Beulich wrote:
> On 06.06.2025 21:49, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Group all pbuf-related data structures under domain's console field.
>=20
> Fine with me in principle, as I was indeed wondering about the lack of
> grouping when the sub-struct was introduced, but ...
>=20
> > @@ -654,6 +648,12 @@ struct domain
> >
> >      /* Console settings. */
> >      struct {
> > +        /* hvm_print_line() and guest_console_write() logging. */
> > +#define DOMAIN_PBUF_SIZE 200
> > +        char *pbuf;
> > +        unsigned int pbuf_idx;
> > +        spinlock_t pbuf_lock;
> > +
> >          /* Permission to take ownership of the physical console input.=
 */
> >          bool input_allowed;
> >      } console;
>=20
> ... since all uses of the fields need touching anyway, can we perhaps
> think of giving the fields better names? I never understood what the
> 'p' in "pbuf" actually stands for, for example. My suggestion would
> be to replace "pbuf" by "glog" (for "guest logging"), but surely there
> are alternatives.

Sounds good to me.
I can do renaming in v2.

>=20
> Jan
>=20


