Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826D3439F6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 07:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100003.190368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOEMl-0003GL-Gr; Mon, 22 Mar 2021 06:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100003.190368; Mon, 22 Mar 2021 06:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOEMl-0003Fw-DH; Mon, 22 Mar 2021 06:48:43 +0000
Received: by outflank-mailman (input) for mailman id 100003;
 Mon, 22 Mar 2021 06:48:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SYKs=IU=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1lOEMj-0003Fr-1k
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 06:48:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc377903-84b0-46bc-b925-3af9b1627445;
 Mon, 22 Mar 2021 06:48:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAA10614A5;
 Mon, 22 Mar 2021 06:48:38 +0000 (UTC)
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
X-Inumbo-ID: fc377903-84b0-46bc-b925-3af9b1627445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616395719;
	bh=aBATp9cF4F75lj0dyqnEuKbgcMuvl6XXRbrTzcy1hz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxLByM1eDq0pAWzRAwSsBEtuDaWYZqg6zod0MvQTrLNHpY8NTSNjhfdxcHiCxcly0
	 DQvAMqQD2ShMoUpfkDwdvPTp96vCTOQyyF5JNn/wSHhGwxZeLsrClVpece2ySaXawI
	 9PkHyUmoarBs6z/o6d5PNp531EJr0zEVQXexQChe8sA1IHKUtWghq6em8yj3+fdj38
	 zgiMLsTuOooSmiopAu7+/VWDYsgtH5oeVEN0wZFXwmRUVemE/khxfZ35KmlLTwSlW4
	 xQS8cccvEqeyLjNm11wnNaA/JB3l3/LOHvJ2RWO1sG9lws3q2FUmQMgtnHgX4oak0F
	 zLXRmzzHY7zJA==
Date: Mon, 22 Mar 2021 08:48:35 +0200
From: Leon Romanovsky <leon@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: "Hsu, Chiahao" <andyhsu@amazon.com>, Andrew Lunn <andrew@lunn.ch>,
	netdev@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
	davem@davemloft.net, kuba@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <YFg9w980NkZzEHmb@unreal>
References: <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch>
 <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com>
 <YFI676dumSDJvTlV@unreal>
 <f3b76d9b-7c82-d3bd-7858-9e831198e33c@amazon.com>
 <YFeAzfJsHAqPvPuY@unreal>
 <12f643b5-7a35-d960-9b1f-22853aea4b4c@amazon.com>
 <YFgtf6NBPMjD/U89@unreal>
 <c7b2a12d-bf81-3d5f-40ae-f70e6cfa1637@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c7b2a12d-bf81-3d5f-40ae-f70e6cfa1637@suse.com>

On Mon, Mar 22, 2021 at 06:58:34AM +0100, J=FCrgen Gro=DF wrote:
> On 22.03.21 06:39, Leon Romanovsky wrote:
> > On Sun, Mar 21, 2021 at 06:54:52PM +0100, Hsu, Chiahao wrote:
> > >=20
> >=20
> > <...>
> >=20
> > > > > Typically there should be one VM running netback on each host,
> > > > > and having control over what interfaces or features it exposes is=
 also
> > > > > important for stability.
> > > > > How about we create a 'feature flags' modparam, each bits is spec=
ified for
> > > > > different new features?
> > > > At the end, it will be more granular module parameter that user sti=
ll
> > > > will need to guess.
> > > I believe users always need to know any parameter or any tool's flag =
before
> > > they use it.
> > > For example, before user try to set/clear this ctrl_ring_enabled, they
> > > should already have basic knowledge about this feature,
> > > or else they shouldn't use it (the default value is same as before), =
and
> > > that's also why we use the 'ctrl_ring_enabled' as parameter name.
> >=20
> > It solves only forward migration flow. Move from machine A with no
> > option X to machine B with option X. It doesn't work for backward
> > flow. Move from machine B to A back will probably break.
> >=20
> > In your flow, you want that users will set all module parameters for
> > every upgrade and keep those parameters differently per-version.
>=20
> I think the flag should be a per guest config item. Adding this item to
> the backend Xenstore nodes for netback to consume it should be rather
> easy.
>=20
> Yes, this would need a change in Xen tools, too, but it is the most
> flexible way to handle it. And in case of migration the information
> would be just migrated to the new host with the guest's config data.

Yes, it will overcome global nature of module parameters, but how does
it solve backward compatibility concern?

Thanks

>=20
>=20
> Juergen






