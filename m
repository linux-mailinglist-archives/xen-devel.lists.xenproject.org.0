Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E3DABC7D6
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990205.1374144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6AU-0001BH-Q7; Mon, 19 May 2025 19:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990205.1374144; Mon, 19 May 2025 19:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6AU-00019q-NS; Mon, 19 May 2025 19:28:58 +0000
Received: by outflank-mailman (input) for mailman id 990205;
 Mon, 19 May 2025 19:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6AS-00019k-S9
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:28:56 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 807b846d-34e7-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 21:28:55 +0200 (CEST)
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
X-Inumbo-ID: 807b846d-34e7-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747682933; x=1747942133;
	bh=EVi8Hx1WoiFWzl7lifzSRGlqUUNnXKgH4ezOB7X2b88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lacicC7IKMz9v6u7Fc/DCbwQGN6HKxX909OwPQFJePMqkg5fz+7XNrvvE3Mt1c5Gm
	 X2r0biBGD96rMTi5RzlvWgi0tcsvbqVrbfz0kF3POy3IviBBDRUWLC6uoJS9yS4ikM
	 wAZ8gctmSWbi4vPN8K9OpeugA7nvE58MoF9qkpY9o6jqQ6YZBBqKcu135TNwJ0Y67k
	 bpVIdVYvQnOtADXN6dsOt1M2A1TMaux8cAZY9UiknfrXTLyOI6aMTFsYIUHP3VqmMf
	 wMQe4mhSEIYdMDG0C5wBVO8JzrxzKr9WNFEpCKIpYEVbP9WHZFiLGVuPdz1iEIRqnL
	 miVjnwHHfTreA==
Date: Mon, 19 May 2025 19:28:47 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/2] xen/domain: adjust domain ID allocation for Arm
Message-ID: <aCuGar139qeDQ5g0@kraken>
In-Reply-To: <bbbf5488-e501-4e1d-8eff-c703e55f4456@suse.com>
References: <20250516020434.1145337-1-dmukhin@ford.com> <20250516020434.1145337-3-dmukhin@ford.com> <bbbf5488-e501-4e1d-8eff-c703e55f4456@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 047387ad87ad0eea3f503587682c6e44b9af21a6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 10:57:44AM +0200, Jan Beulich wrote:
> On 16.05.2025 04:04, dmkhn@proton.me wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -85,7 +85,7 @@ void __init domid_init(void)
> >   *
> >   * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of =
IDs,
> >   * perform an exhaustive search starting from the end of the used doma=
in ID
> > - * range.
> > + * range, excluding get_initial_domain_id() ID.
> >   */
> >  domid_t domid_alloc(domid_t domid)
> >  {
> > @@ -103,6 +103,9 @@ domid_t domid_alloc(domid_t domid)
> >              if ( domid =3D=3D DOMID_FIRST_RESERVED )
> >                  domid =3D 0;
> >
> > +            if ( domid =3D=3D get_initial_domain_id() )
> > +                continue;
> > +
> >              if ( !rangeset_contains_singleton(domid_rangeset, domid) )
> >                  break;
> >          }
>=20
> Isn't there a (perhaps even pre-existing) issue here with a DomU potentia=
lly
> getting ID 0 assigned when get_initial_domain_id() returns non-zero?

Yes, thanks.

I have updated commit message in v7 to mention that:

  https://lore.kernel.org/xen-devel/20250519192306.1364471-3-dmukhin@ford.c=
om/

>=20
> Jan


