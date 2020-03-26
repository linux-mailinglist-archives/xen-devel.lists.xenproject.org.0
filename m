Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9263E1939AB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 08:33:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHMyo-0004bo-4W; Thu, 26 Mar 2020 07:31:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WXLh=5L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jHMym-0004bj-IY
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 07:31:04 +0000
X-Inumbo-ID: bf1e4d82-6f33-11ea-875d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf1e4d82-6f33-11ea-875d-12813bfff9fa;
 Thu, 26 Mar 2020 07:31:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7586EAC22;
 Thu, 26 Mar 2020 07:31:02 +0000 (UTC)
Message-ID: <23c9fb7cb90e7283c66dc9748e578d167ea907e8.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Mar 2020 08:31:01 +0100
In-Reply-To: <20200310080946.29020-1-jgross@suse.com>
References: <20200310080946.29020-1-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-OeLykafWPrnO7h0sHr3h"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] xen/sched: fix cpu offlining with core
 scheduling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-OeLykafWPrnO7h0sHr3h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-10 at 09:09 +0100, Juergen Gross wrote:
> Offlining a cpu with core scheduling active can result in a hanging
> system. Reason is the scheduling resource and unit of the to be
> removed
> cpus needs to be split in order to remove the cpu from its cpupool
> and
> move it to the idle scheduler. In case one of the involved cpus
> happens
> to have received a sched slave event due to a vcpu former having been
> running on that cpu being woken up again, it can happen that this cpu
> will enter sched_wait_rendezvous_in() while its scheduling resource
> is
> just about to be split. It might wait for ever for the other sibling
> to join, which will never happen due to the resources already being
> modified.
>=20
> This can easily be avoided by:
> - resetting the rendezvous counters of the idle unit which is kept
> - checking for a new scheduling resource in
> sched_wait_rendezvous_in()
>   after reacquiring the scheduling lock and resetting the counters in
>   that case without scheduling another vcpu
> - moving schedule resource modifications (in schedule_cpu_rm()) and
>   retrieving (schedule(), sched_slave() is fine already, others are
> not
>   critical) into locked regions
>=20
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-OeLykafWPrnO7h0sHr3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl58WjUACgkQFkJ4iaW4
c+74gg/9G4CM2zZ/6iMrPDb4Vhnz5osJ6jJznqBNamSg3ACcaCuYb9kX7FF4URW+
oJwxvck3uxYKpp7vPPG7dWlUKZ2qC1NnrPoQpO8jPGndlJ4j9xJYPTKlSd8NhAtb
+SubpkYbLNB1owVP9hYZ2lhSTjV1ubGKfWc5Cnwz4OEVNByloPxUoLfCjkLzWxfM
jnE+WhLje+71b2Eu5MNMmCGZWCmA02nt7zZelEi6zR5iOO2w1QLOFY/mfAsNv9R1
062Qj8abp1kZNohgu3GxLT7MgE/VW6jhYJFGaq2t0p2QSF2ioghF9duHUv245WbK
myD5tghvP8ZKj3K+Z01W3kVgqjKktgAcg7MkWjWkmAxWcOHtwdsUoq2d0dzkuHSg
eTJS1/E4ei1nQU2ghdIi/s/i/3GvgY/9n/9/GvHwX4ZIsVwRjOvJu8/7vQEWTSBS
Z37iTIPdnTko+tlgFHKESjwm1VLoI/DPL/T5Xl2h5MAgeXq2qDKhX1lISKrQB+H0
kfasFI+X8C6aylNbWo12mwFuUI/Twq7lt9v+PcYiq61GlDz0av/FXLGsktpjBRKc
OP4ApO/uv+qrQ1HVwBAhowaIfWMHg4m+2+RAcXo4GwA5yx1t8bzucHwx9IOE+2Rz
cn+KqNrM6SRGfJFymOa+Kvwdbw8Dmz6/E54iaY2HMHU/A3veEMo=
=xp2B
-----END PGP SIGNATURE-----

--=-OeLykafWPrnO7h0sHr3h--


