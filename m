Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993827CE4F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 15:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197.449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNFFD-00038d-Hr; Tue, 29 Sep 2020 13:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197.449; Tue, 29 Sep 2020 13:00:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNFFD-00038E-EI; Tue, 29 Sep 2020 13:00:35 +0000
Received: by outflank-mailman (input) for mailman id 197;
 Tue, 29 Sep 2020 13:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yGhd=DG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kNFFB-000389-JW
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 13:00:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2a0c827-8ce6-4307-8ce1-ff1fde211db5;
 Tue, 29 Sep 2020 13:00:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C6F0AD82;
 Tue, 29 Sep 2020 13:00:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yGhd=DG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kNFFB-000389-JW
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 13:00:33 +0000
X-Inumbo-ID: d2a0c827-8ce6-4307-8ce1-ff1fde211db5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d2a0c827-8ce6-4307-8ce1-ff1fde211db5;
	Tue, 29 Sep 2020 13:00:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601384431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NOUI2T2QEG2cZsWT9QTXecUHLmXjR+Kc4LmF65lV0Yc=;
	b=W0cPGVC268PGs6Ng0c4AwjYNBvJkA/REZLJM1owwX/7bjaS6fsl4t/pkej4DWk/AT66eEt
	Hbcc8HxOyEOTG2xWxCLX5LvUAKMdp/I6l7CqvTqAol3/CdzROHFTIn9CYQ74sOkPCvzI55
	ZZZ1UeJgUIeEH5hLE4+xy/LZHofyL+k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4C6F0AD82;
	Tue, 29 Sep 2020 13:00:31 +0000 (UTC)
Message-ID: <46a1e5429b11a4a16d49118c3ec20617fb63c374.camel@suse.com>
Subject: Re: [PATCH 05/12] evtchn/sched: reject poll requests for unusable
 ports
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Date: Tue, 29 Sep 2020 15:00:29 +0200
In-Reply-To: <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
	 <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+vyZnvdKLr6qs8rwi4C2"
User-Agent: Evolution 3.38.0 (by Flathub.org) 
MIME-Version: 1.0


--=-+vyZnvdKLr6qs8rwi4C2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-09-28 at 12:58 +0200, Jan Beulich wrote:
> Before and after XSA-342 there has been an asymmetry in how not
> really
> usable ports get treated in do_poll(): Ones beyond a certain boundary
> (max_evtchns originally, valid_evtchns subsequently) did get refused
> with -EINVAL, while lower ones were accepted despite there
> potentially
> being no way to wake the vCPU again from its polling state. Arrange
> to
> also honor evtchn_usable() output in the decision.
>=20
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I agree with Julien that a comment about how evtchn_port_poll() would
improve things even further.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-+vyZnvdKLr6qs8rwi4C2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9zL+0ACgkQFkJ4iaW4
c+7dMBAA3MDXfrRjIWmJfyglc25MPU+nc1DK8pr79F5lqOihbuJK/nx8S+aBG82g
XOmW78ZQfCMzqONElJlZ4v1UHTYJjDxrSBlRA07On4iKR0sFzjCbTxxA+ZueVHQF
tcIEZQcAftopQbhd02ReM/OZPexJZDrrjqL/nZ2HXKHBXWqg0B7SfrtUkzrfN2tg
5JboSxdJBcxSwFOA5eIaZ2UAfiY1uSPrAAUvTNMS6amTqWbx/zgMWFW7VfQpINzz
xLZdG2l0gJWyH8Mjkcq7x9LSm7vL7Obr3CPVKXQw6PybtRPp14CZ+yY+K0O4iz9D
vttbuyRucxJDcmEwmTopLTxomWlXxUVIJVt8Y8u6jSJ/Cqt5znV+8TuwLePnwNvW
7phJGd9Rlfs/T5tSyD+eLEMzV9AQwpttSpGBAifPoFEbg2vIKQW1LpWgncS96jvy
ajCndoswtjqikNQIeNApqgK1g8z/h2LVOtcoRKzUH6IuvJ6WLdmjAbVkaWkn/LF8
Y0+eSaRFcE2xTAJvDbdDHnOb6tZ0CxlU7g6WlaK27bk3ILQCLIOvQONwq/6Bt5an
VsvIRbr6rw4AIaYiukCr/XJ0ydrAaFVJK6eJtBXLKiXI+qbmvMoUHPATzgTDKxCE
r6/o4QrH6XnZBTBY9SK+8f7FwugOPNnpUsuSY/CCo+TbT5Q3rQQ=
=1Hmg
-----END PGP SIGNATURE-----

--=-+vyZnvdKLr6qs8rwi4C2--


