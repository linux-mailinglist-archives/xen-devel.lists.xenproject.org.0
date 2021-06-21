Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50A3AED30
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 18:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145611.267783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMWv-0004X9-IN; Mon, 21 Jun 2021 16:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145611.267783; Mon, 21 Jun 2021 16:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMWv-0004UT-Do; Mon, 21 Jun 2021 16:12:09 +0000
Received: by outflank-mailman (input) for mailman id 145611;
 Mon, 21 Jun 2021 16:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQgB=LP=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lvMWt-0004UN-Qp
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 16:12:07 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53dd6fcd-32fe-498f-ae2b-9efa961282c3;
 Mon, 21 Jun 2021 16:12:06 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D1612191C;
 Mon, 21 Jun 2021 16:12:05 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 049FA118DD;
 Mon, 21 Jun 2021 16:12:04 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id fWFAOlS60GC2KAAALh3uQQ
 (envelope-from <dfaggioli@suse.com>); Mon, 21 Jun 2021 16:12:04 +0000
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
X-Inumbo-ID: 53dd6fcd-32fe-498f-ae2b-9efa961282c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624291925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tAVEVsbsfjXCOOTXv/NHanBYHSaedMRbDLIpDJdYQs0=;
	b=Himgh+ETRFtBu32tfpOv3hhkEY18IxcnH5pHJKXnXN/e/6noJ6vwBg1qowsQ79GXxOkOcp
	ifT4fVdI9HQTCplGzuwydWqJNdn2jZ0fx4YbI2ppQzClvGld31fSrx4gogXLMDuCDlJrvv
	7DINYpFJPkQIqgm3b3yQ8mXHkcDhDoY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624291925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tAVEVsbsfjXCOOTXv/NHanBYHSaedMRbDLIpDJdYQs0=;
	b=Himgh+ETRFtBu32tfpOv3hhkEY18IxcnH5pHJKXnXN/e/6noJ6vwBg1qowsQ79GXxOkOcp
	ifT4fVdI9HQTCplGzuwydWqJNdn2jZ0fx4YbI2ppQzClvGld31fSrx4gogXLMDuCDlJrvv
	7DINYpFJPkQIqgm3b3yQ8mXHkcDhDoY=
Message-ID: <4302ad195e7072d937c76ed955d90792a0c301d8.camel@suse.com>
Subject: Re: [PATCH] credit2: make sure we pick a runnable unit from the
 runq if there is one
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?=
	 <michal.leszczynski@cert.pl>, Dion Kant <g.w.kant@hunenet.nl>, Jan Beulich
	 <jbeulich@suse.com>
Date: Mon, 21 Jun 2021 18:12:04 +0200
In-Reply-To: <5D80842F-4479-46CC-A391-28E4EF364C7E@citrix.com>
References: <162221476843.1378.16573083798333423966.stgit@Wayrath>
	 <5D80842F-4479-46CC-A391-28E4EF364C7E@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Uxd0edeoaGAyn99Hj6Mb"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-Uxd0edeoaGAyn99Hj6Mb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi George (and sorry for the delay in replying),

On Mon, 2021-06-07 at 12:10 +0000, George Dunlap wrote:
> > On May 28, 2021, at 4:12 PM, Dario Faggioli <dfaggioli@suse.com>
> > wrote:
> > Reported-by: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> > Reported-by: Dion Kant <g.w.kant@hunenet.nl>
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Thanks for tracking this down, Dario!
>=20
Hehe, this was a nasty one indeed! :-P

> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Just one comment:
> > @@ -3496,8 +3500,7 @@ runq_candidate(struct csched2_runqueue_data
> > *rqd,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * some budget, then ch=
oose it.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (yield || svc->credit >=
 snext->credit) &&
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (!has_cap(svc) || unit_grab_budget(svc)) &&
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unit_runnable_state(svc->unit) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (!has_cap(svc) || unit_grab_budget(svc)) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snex=
t =3D svc;
>=20
> By the same logic, shouldn=E2=80=99t we also move the `(!has_cap() =E2=80=
=A6)` clause
> into a separate `if(x) continue` clause?=C2=A0 There may be runnable unit=
s
> further down the queue which aren=E2=80=99t capped / haven=E2=80=99t exha=
usted their
> budget yet.
>=20
That's actually a very good point. I think, however, that it's even
more complicated than this.

In fact, if I move the cap+budget check in its own if above this one,
it can happen that some budget is grabbed by the unit. If, however, we
then don't pick it up (because of priority) we then need to have it
return the budget right away, which it's tricky.

So, I came up with the solution of turning the above `if` into this:

        /*
         * If the one in the runqueue has more credit than current (or idle=
,
         * if current was not runnable) or if current is yielding, we can t=
ry
         * to actually pick it.
         */
        if ( (yield || svc->credit > snext->credit) )
        {
            /*
             * The last thing we need to check, is whether the unit has eno=
ugh
             * budget, in case it is capped. We need to do it now, when we =
are
             * otherwise sure that we want to pick it already (rather than =
in
             * its own independent 'if'), to avoid the hassle of needing to
             * return the budget (which we'd have to if we checked and grab=
bed
             * it but then decide to run someone else).
             */
            if ( has_cap(svc) && !unit_grab_budget(svc) )
                continue;

            /* And if we have go this far, we are done. */
            snext =3D svc;
            break;
        }

Of course, something else that we can do is to pull the
`if (yield || svc->credit > snext->credit))` "out" of all the other
checks, i.e., doing all the checks we do only either if we're yielding
or if the unit in the runq actually has higher priority.

Efficiency wise, I don't think there will be much difference. The
latter solution is more code-churn (we're basically re-indenting one
level to the right almost the entire `list_for_each_safe` body), but it
might be more readable and easy to understand and follow in the long
run.

So, any preference? :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Uxd0edeoaGAyn99Hj6Mb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmDQulQACgkQFkJ4iaW4
c+4AUg//YcWAARUF9e6DqYYUYiZRY8ozFoGDil7BythEyxSzjrcGmBmQgAYfmrpT
Kc8VbhmvgghpR+BrmvJ8Ad1LZ2RuL+hJKpOkty2R4YMcTSL45DpuTNdRTZRysT2X
7emMEvg1silQZyZmTsFbkTzUXtwcUl5D3WdhwHZRUXfMLlWZIuwxFkRq6DMjH5Tk
gxBdwKL4Gy+iVSx/5xrz1gxkToewaLg3D8oUPcLqPjOjfZWLX6i6MTrOiiCVnzjh
yMFDhrgfwe/OeB+CdUFACznq/Japo36futUaZ811gilwfWS3kiWoZ+gPm2W88Kxx
ag7mjvJ0R6m5heBeQbdSyAO2HA250DM8XJlFe6/tXdwD1K2Oubz9sCO5Pj99FZ0F
sqODGZICgp6kGWmSJhi92uwIq8rjjTkuftGpfRTmon6wGHjyuFeHj0Ook2iiJ4ZH
gK6xZpzFu1KS1Ne7PpsMo3YCGRww4oLgtG6XYjsjttSA4cVnkPILrp4LAfjE1o82
JFVxbr5NKEhZMsQx3ssaCg79Hcl9corggxn+h9a79oyOw6FScdcPbdHgSNvebeeE
DyTE9OmFYe92lJ1xysBRColwb4Vjr4A0RSA205v44POKQ4QcFWK/j1uSq7JSRdBH
yT2YKpEBLoRW5zavE1nP8rr/0Qn3H5m9s2nRbplWiOsk+0xX4xs=
=ycLN
-----END PGP SIGNATURE-----

--=-Uxd0edeoaGAyn99Hj6Mb--


