Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2530C2CE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80587.147452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xD9-0007td-CL; Tue, 02 Feb 2021 15:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80587.147452; Tue, 02 Feb 2021 15:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xD9-0007tE-8x; Tue, 02 Feb 2021 15:03:23 +0000
Received: by outflank-mailman (input) for mailman id 80587;
 Tue, 02 Feb 2021 15:03:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=58F4=HE=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l6xD7-0007t9-VN
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:03:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff164533-b49f-4ddd-b103-126440e6d3a3;
 Tue, 02 Feb 2021 15:03:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EADCBAD57;
 Tue,  2 Feb 2021 15:03:19 +0000 (UTC)
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
X-Inumbo-ID: ff164533-b49f-4ddd-b103-126440e6d3a3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612278200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68SE39HbaZaq/EHFcUnvvpfmGpnlieWm24yT1YRTzWg=;
	b=V/TreyBkVM0RSNZfKFebGXM5zcg4e+90YAsxZhPAeqz2wTwN3WnjsvtTqhSQRLvtMA238A
	87OH9tzy+9TOJHU7N3NFVabCpYONOYwD/mL6yKcR0T82LcvI8opL4jTRycZN+qyU7cwrNC
	DlDQugwT+pbPOTc5nf2Oz3THF2IzPKk=
Message-ID: <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Anders =?ISO-8859-1?Q?T=F6rnqvist?=
	 <anders.tornqvist@codiax.se>, xen-devel@lists.xenproject.org, Stefano
	Stabellini <sstabellini@kernel.org>
Date: Tue, 02 Feb 2021 16:03:18 +0100
In-Reply-To: <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
	 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
	 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
	 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
	 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
	 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
	 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
	 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
	 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
	 <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-R/S8TuxHfJahqHl9r7DO"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-R/S8TuxHfJahqHl9r7DO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-02-02 at 07:59 +0000, Julien Grall wrote:
> Hi Dario,
>=20
Hi!

> I have had a quick look at your place. The RCU call in=20
> leave_hypervisor_to_guest() needs to be placed just after the last
> call=20
> to check_for_pcpu_work().
>=20
> Otherwise, you may be preempted and keep the RCU quiet.
>=20
Ok, makes sense. I'll move it.

> The placement in enter_hypervisor_from_guest() doesn't matter too
> much,=20
> although I would consider to call it as a late as possible.
>=20
Mmmm... Can I ask why? In fact, I would have said "as soon as
possible".

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-R/S8TuxHfJahqHl9r7DO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAZabYACgkQFkJ4iaW4
c+5FLg/+JZW0aeDvv0sWbH+C7aKYkyA2LGmft0QaEvYE/guNn8AlDt/0cazmDIem
N3IxwCsHa2B8hdrBM8s4p/5hTsEggoIS78A7p9VfKqfZloHASwuOtG6bEuPb7ZTN
MBH9rjrqOg7l//nEc0rgnsoRi0wTuWIZ3yJp1JthVmtrtAuul+jNryvfvWEHz+jE
TBuwbF3t5SYh7CfHFYQzcYgF+DfOKDhY9UzUktZyQFbtDMhhqxMfPklJNcHuA7SQ
Eurcx12G0jz/n8MCoJbvcwt/HeFLNE+8qeAz35Am/Zm1hDpJiZ0Zsunr6tyiO06L
lKL8wp+4OF7ql0bBvJuHCdtUXxPnOXGJnkBpwBHnkZeuh5Cl7tLJ9Wk7HMyYMMa8
fKRCqGljWBFzneiRRggzlc3ijvJE/UeQKB0Idn73UDeQW9yPnfkJObKC20qKA33h
Tg5nOVPz2hkV7/tNJ7u1plC+CTWoaVzTlNoRccjxh8QJjsl4Ln89UzQmmR4tk4ha
YkOV3ENChK0K7PJ03cizlmmwkkQc6f0yXdbM9O5rq+qmFEhsA8Ru4U/69GQEsYqm
dx65gyAMRbc1ODCHD0NuG/84/8fSS3GIc2PZigKR/t8bYttX9PzA00pvCxIiAl3D
XhOiDgwB4xPITVSXR9ozJRXbsopbbz8lD/B3Wvhc/9V10wdcXi4=
=IVOe
-----END PGP SIGNATURE-----

--=-R/S8TuxHfJahqHl9r7DO--


