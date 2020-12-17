Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA32DD4F6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 17:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56045.97806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvrF-0000RS-Qf; Thu, 17 Dec 2020 16:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56045.97806; Thu, 17 Dec 2020 16:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvrF-0000R3-NQ; Thu, 17 Dec 2020 16:10:25 +0000
Received: by outflank-mailman (input) for mailman id 56045;
 Thu, 17 Dec 2020 16:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lBs=FV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kpvrE-0000Qy-Il
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 16:10:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0034a92-5fd6-4aeb-8e1b-b1df66a3d1eb;
 Thu, 17 Dec 2020 16:10:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA939AC79;
 Thu, 17 Dec 2020 16:10:22 +0000 (UTC)
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
X-Inumbo-ID: f0034a92-5fd6-4aeb-8e1b-b1df66a3d1eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608221422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qh3wm76ap/z3ujVwhKHfHGAXUtjkoyalsb8yIQAaDak=;
	b=uNCQ99WuWu0+KE4I0JNdLF1Kf7VnMTJjsJfIBNjHgWRGa6xSsMYmKwzJG1FtRfVEBvdpmk
	9hadAZgckZcDxfmP0Qs5MWcTxujHA9F80omkYUr9s7X7P+gBQofMudnKdhrKuDUxL8On7b
	jU9d81E6B8kEBpE4JuDETkDZ7lcOG6U=
Message-ID: <4cf9e657a31317fb8ce1dcce2e841f13733c79a1.camel@suse.com>
Subject: Re: [PATCH v3 6/8] xen/cpupool: add cpupool directories
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 17 Dec 2020 17:10:21 +0100
In-Reply-To: <fc21ddcd-f263-d502-5b85-a74350c29fe3@suse.com>
References: <20201209160956.32456-1-jgross@suse.com>
	 <20201209160956.32456-7-jgross@suse.com>
	 <fc21ddcd-f263-d502-5b85-a74350c29fe3@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HXN4+4NLrcBn94s8zI8s"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-HXN4+4NLrcBn94s8zI8s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-12-17 at 16:54 +0100, Jan Beulich wrote:
> On 09.12.2020 17:09, Juergen Gross wrote:
> > Add /cpupool/<cpupool-id> directories to hypfs. Those are
> > completely
> > dynamic, so the related hypfs access functions need to be
> > implemented.
> >=20
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
Not needed, I think, but still (and if this hasn't been committed
already):

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-HXN4+4NLrcBn94s8zI8s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/bgu0ACgkQFkJ4iaW4
c+4rgxAAnt9u5C8cstsXi0+UzlPWikRQczw41GQCpNOY+HXxpQjLGPkztk0d7X1t
0O9x6QeILicWfPOqbTl8M4ZJJle5HvkHVHPWxg6SxIlLYrEe+FYbYuiaw+m+ACSD
Uvf0LlZjAM8Gf1Wonz3jIy4dGtqNLiBJnfEi8MqjBBBy7rAqmyUroPnWXMC4hUUI
E/1s1m2CbXFWRIRCbBuYJLypdG5kI+/5bTA/z7uj324YyJcg6QdoaMmRzUVwBEYE
D/7QkqhNAIB7vNAHmYuYQTFoESFt7I3CSi2uTpb0icosbSERowzF5wZEn0YH2I89
DXUiOKeKPFhG9mF5EBo7nPv8urbw04DoMSmPZ8Lwm7rXopNUf2Rgsa1OAu2Ux1Sg
NVyyCacBMvvmhpGxCe3ZpzY6lYB6Vm8PvW3Dl85g441sARJw92S/bxZc/WdhqVoH
xYGQhq42vrtI7ntotv+WyN6n/McEcsK7qji6EVhpTaM0SPcXB2gV9o8zLxAk/5Nw
lexufXPDQbEDYNnw73pjwouIOokBgEpscYmiE4Ao0nNoHmlFzC8uQ6UlvHfGMDP3
rKVzIfM//AIOPFQfrAYDX82VeoHt4gx+G6qBNaOJ6wMYlStzl5Pzi0IExMhpQTqN
+uWsSTXCnWSgtkXY1wQgFZsKOuVvtAgFI7nMJTsZY3DR4n4QD5o=
=hZHG
-----END PGP SIGNATURE-----

--=-HXN4+4NLrcBn94s8zI8s--


