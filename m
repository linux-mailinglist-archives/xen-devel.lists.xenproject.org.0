Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A1C278F8D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 19:24:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLrQm-0004sF-8W; Fri, 25 Sep 2020 17:22:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEdM=DC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kLrQk-0004sA-Mi
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 17:22:46 +0000
X-Inumbo-ID: 067901aa-39c3-46f2-9cb1-0a24e66d9224
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 067901aa-39c3-46f2-9cb1-0a24e66d9224;
 Fri, 25 Sep 2020 17:22:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601054564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=38qzbhBEXzv3ijc8u3t+DUEJNo/y6DnA23MNpZW/FdY=;
 b=CLsfKZnU0BN8+bPSso30+t+YEdy+4Xru3mfSplPrBIoCx7CFhSgx07pILYUGCYEDpvecH3
 UOeU5Bu4fdX4Rc4VVEspCdIQQPjvAl4wlkC12yQ4JMn6RVcPP1OF6tRa88pX60ZABKU5rw
 HxhjI4JRI/k2CACjk4Py/aNSBjXJFqg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C05E7AC5B;
 Fri, 25 Sep 2020 17:22:44 +0000 (UTC)
Message-ID: <66880caef018abdbf9fe99116594a2826efcb603.camel@suse.com>
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
From: Dario Faggioli <dfaggioli@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "julien@xen.org"
 <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org"
 <wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>, 
 "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>, "george.dunlap@citrix.com"
 <george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Date: Fri, 25 Sep 2020 19:22:43 +0200
In-Reply-To: <87d02bavz7.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
 <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
 <918fa2e1-232c-a3ff-d0a9-776b470ee5db@suse.com> <87d02bavz7.fsf@epam.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-ootfjBMZnoKDRu8qlf1e"
User-Agent: Evolution 3.38.0 (by Flathub.org) 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-ootfjBMZnoKDRu8qlf1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-24 at 18:08 +0000, Volodymyr Babchuk wrote:
> So, as I see this, functions are called in the following way (on
> x86):
>=20
> 1. do_softirq() calls vcpu_begin_hyp_task() and then executes
> __do_softirq()
>=20
> 2. __do_softirq() does different jobs and eventually calls schedule()
>=20
> 3. schedule() calls vcpu_end_hyp_task() and makes scheduling decision
> which leads to call to context_switch()
>=20
> 4. On end context_switch() we will exit hypervisor and enter VM. At
> least, this is how I understand
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nextd->arch.ctxt_switch->tail(next);
>=20
> call.
>=20
> So, no need to call vcpu_begin_hyp_task() in context_switch() for
> x86.
>=20
Mmm... This looks correct to me too.

And what about the cases where schedule() does return?

Are these also fine because they're handled within __do_softirq()
(i.e., without actually going back to do_softirq() and hence never
calling end_hyp_task() for a second time)?


> I have put bunch of ASSERTs to ensure that vcpu_begin_hyp_task() or
> vcpu_end_hyp_task() are not called twice and that vcpu_end_hyp_task()
> is
> called after vcpu_begin_hyp_task(). Those asserts are not failing, so
> I
> assume that I did all this in the right way :)
>=20
Yeah, good to know. :-)

Are you doing these tests with both core-scheduling disabled and
enabled?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ootfjBMZnoKDRu8qlf1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9uJ2MACgkQFkJ4iaW4
c+6fbg//T+gci0WAW/CSuKgp1LLzT7uRduHejsyrq8EGX6dglulmES1bTsuuhY5W
/0S1ItJcpgbm1bZGYjHnvuttpYy8hbShvEwPV15a6B+3GYBF0CtYdD+IUywlW+0X
t7AgFxig2ylwJjVisaoHkC7u8pcKqWZZ25QshtAtXY43EtKl86hrhA5oJ5a5t9lD
W/zNTUCwkHpPXEu2iagvN7wLXVZbd9I0/JrbxmhmroywwCrOZ44NwxTI2Ei1Qekv
yTOkexysEtbQGnbNNka8336eAoY8T9ro95MDrNfTmAimJytILzmm/k3+GiWYMgDU
yqp0tEWjlbonEUMiM7IXTDSXCFWBKEPO3VPOqPDVOORztUYov4QOuDxKAk2YWjDT
aO9hI6t/gKdzRvoLQqJEMl+KbBX4+xiFOJrpWIB6bMKlwc3LZPdBeKWJlMb/ELXD
gJQ6aTFFw3Oy8Tz0MNkn9BBZmtsfjKf+Q5iOHxWywp0GD8VgZQD4vJXOErldXkmt
+8NJIGbfrd/IawCPfq4OkHcP0h7y0BafPl6HltFcLUNYRs4BaX3DcCI5aXqCb+b2
krcK6Lw5p1y/xg6XVrL10cZI7ZoctY+0SyX8DB4nWOfn0+WX/ym/87IBy8zCPnup
c6+3OR6JZwIzRsA4cLbIE0gGb83PNGRj4d0A+oWw/SK6AhoMjaI=
=e6JN
-----END PGP SIGNATURE-----

--=-ootfjBMZnoKDRu8qlf1e--


