Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C327D30D40B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 08:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80826.148073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7CdI-0002Mh-P8; Wed, 03 Feb 2021 07:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80826.148073; Wed, 03 Feb 2021 07:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7CdI-0002MI-LT; Wed, 03 Feb 2021 07:31:24 +0000
Received: by outflank-mailman (input) for mailman id 80826;
 Wed, 03 Feb 2021 07:31:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgMe=HF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l7CdG-0002MD-PN
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 07:31:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f04f281-6c19-4619-8e30-5ba1af13219f;
 Wed, 03 Feb 2021 07:31:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B17C3AC55;
 Wed,  3 Feb 2021 07:31:20 +0000 (UTC)
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
X-Inumbo-ID: 1f04f281-6c19-4619-8e30-5ba1af13219f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612337480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LurbnCi6cSGjDt+8GQYuZGaVU6xBpMGqOuE44eWPkTg=;
	b=JL99QBDI7Y5ojnOMfoi4EEoEJqKvAW2CWjYztbnnurcQczTZWqZGD8pfNq5PPU/scQrLjj
	fiAvilXni/craQij12J2fwLkGX2Y2WJ1vcmvMblRnbq0BYMahVMT5GlcDTOHk5KBTvx+oI
	fQYazFgisqoF6cu1leINQFjJBh3HboY=
Message-ID: <501664dbdb736eaa4d9c05255dedfd7ad3e694fa.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Anders =?ISO-8859-1?Q?T=F6rnqvist?=
	 <anders.tornqvist@codiax.se>, xen-devel@lists.xenproject.org, Stefano
	Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Juergen Gross <jgross@suse.com>
Date: Wed, 03 Feb 2021 08:31:19 +0100
In-Reply-To: <7f2ec84a-9814-ffb1-0940-e936a80afbbb@xen.org>
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
	 <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
	 <7f2ec84a-9814-ffb1-0940-e936a80afbbb@xen.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hIOvxr7sBUz5B6FO3JQj"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-hIOvxr7sBUz5B6FO3JQj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again,=20

On Tue, 2021-02-02 at 15:23 +0000, Julien Grall wrote:
> (Adding Andrew, Jan, Juergen for visibility)
>=20
Thanks! :-)

> On 02/02/2021 15:03, Dario Faggioli wrote:
> > On Tue, 2021-02-02 at 07:59 +0000, Julien Grall wrote:
> > > The placement in enter_hypervisor_from_guest() doesn't matter too
> > > much,
> > > although I would consider to call it as a late as possible.
> > >=20
> > Mmmm... Can I ask why? In fact, I would have said "as soon as
> > possible".
>=20
> Because those functions only access data for the current vCPU/domain.
> This is already protected by the fact that the domain is running.
>=20
Mmm.. ok, yes, I think it makes sense.

> By leaving the "quiesce" mode later, you give an opportunity to the
> RCU=20
> to release memory earlier.
>=20
Yeah. What I wanted to be sure is that we put the CPU "back in the
race" :-) before any current or future use of RCUs.

> In reality, it is probably still too early as a pCPU can be
> considered=20
> quiesced until a call to rcu_lock*() (such rcu_lock_domain()).
>=20
Well, yes, in theory, we could track down which is the first RCU read
side crit. section on this path, and put the call right before that (if
I understood what you mean).

To me, however, this looks indeed too complex and difficult to
maintain, not only for 4.15 but in general. E.g., suppose we find such
a use of RCUs in function foo() called by bar() called by
hypervisor_enter_from_guest().

If someone at some points wants to use RCUs in bar(), how does she know
that she should also move the call to rcu_quiet_enter() from foo() to
there?

So, yes, I'll move it a little down, but still within
hypervisor_enter_from_guest().

In the meanwhile, I had a quick chat with Jourgen about x86. In fact, I
had a look and was not finding a place where to put the
rcu_quiet_{exit,enter}() calls as convenient as you have here on ARM.
I.e., two nice C functions that we traverse for all kind of guests, for
HVM and SVM, etc.

Actually, I was quite skeptical about it but, you know, one can hope!
Juergen confirmed that there's no such things, so I'll look at the
various entry.S files for the proper spots.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-hIOvxr7sBUz5B6FO3JQj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAaUUcACgkQFkJ4iaW4
c+4vig/+IKxBhp5C0Yknj+OHXkwPqxlBdQcRkeqqNsO+vLGAp7y5iFqwoC/uRYot
tRSpjYqERxi41/o7hOfvAD7PIoGtfiFK4RSFxlXY0Ui4hq+alyE0zllPYaEjWAeT
65oVoTvjyJqnRIwZeH9KZlJk2ZNa7Z6gjcEeTJ1I6zq9dTmtQYTqpZNTEGMqwI/y
zShQRfEYJjuFJzuFg3LDKSJr1IQZBNpxJg18XpzW3RmCj8qhjy9AKiwatuhKRiXx
/+axdPcfGLMTyOUsEp3UjemsyGhAmPjLrosGJ4x+5ym4iiepReugSXdfsHDXgsuo
5xoJAjwkbBUw3341oV/tib9cacV4/WkuRtNfPOB6qBO7UlApRQPzc+GEGUzUtt8F
zfqZASiKRIEbewzuT0mm52qZr9vvLE1dr00kP8GcqoQkUiOJMnzxwNoF5Lf6jcyY
pBjTJeS38ODqHzh9JpAersruRdw2DTsbEAPu1MGxW8am6hxW3yYlQs7PByboyyUa
klpsU0zjq4SWmg1CTYBgf5lgvffXae4a6UhfS+MGzp1+KQf3v++2n6/DELRKpdd6
YkfkzHZJ7Nq6AMbUnz7uGb1JJDVU79cSh1h9I99ZMkaJbRK0CqYbli/kFoBsHDRi
cql+QRhVK37xYHcwOgYZ/AfiwYQWoHMgBI7jcf5F4AW8OL2vpA0=
=XdIW
-----END PGP SIGNATURE-----

--=-hIOvxr7sBUz5B6FO3JQj--


