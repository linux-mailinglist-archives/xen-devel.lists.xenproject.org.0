Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD54369078
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116070.221481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtBZ-0000cu-Hz; Fri, 23 Apr 2021 10:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116070.221481; Fri, 23 Apr 2021 10:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtBZ-0000cX-Eo; Fri, 23 Apr 2021 10:37:21 +0000
Received: by outflank-mailman (input) for mailman id 116070;
 Fri, 23 Apr 2021 10:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o87G=JU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lZtBY-0000cS-54
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:37:20 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70cd2550-dcc7-4010-a015-32e776718dcb;
 Fri, 23 Apr 2021 10:37:18 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.24.3 DYNA|AUTH)
 with ESMTPSA id g00c91x3NAbGZa9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 23 Apr 2021 12:37:16 +0200 (CEST)
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
X-Inumbo-ID: 70cd2550-dcc7-4010-a015-32e776718dcb
ARC-Seal: i=1; a=rsa-sha256; t=1619174237; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=p8Bbg5NZEYJfBI8D+QpKeG+3iKBKl6jIho2jiU4gySxPm2YIynZjtCN9Os22tRdrcE
    GNKFDmnmzQWIXnQnsIPLOozgntJE6bU4L8KkOA9hbXyI7ehHwpycvzzegBILqkGmHVXV
    SGcLT/jCiXPX7xWQG3M97KZkbogBbIAahuSucr/pPxwzcF0cBhVTGMwyuklRyG5cpQKl
    CXOfxHffqp43K5m3iv0uuYxLOINyrJXnx0NSsicSChFGpl0Sc+U06WZteaxOxHWb3TCz
    IX9hC33Pyc5ON7azisjkjumXOeaaFOxpKf43rBEvI0sNApYlQHkF1gZ4YO5K5isWwAdV
    hWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619174237;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=j93W4MdtcJ06QaKj+KWzi2ni53gGP1p2Z/Qqky/mcFc=;
    b=moRMwC7htqeXvbZH0Zlj2JkpKXCGff7ci1mMAiBWenUpqn4C8I9eIqWDiIkV5Ew0M6
    xWIbvB77BfO1xVH1jHB21XjSUWYD0kdZBWBVcUCQThO+XOt63wvCCv8pSmTczaK2ztBY
    h/SULOnjR8qfs3iYhKWxCKRqwiN9lE0rXqB5yHmENvPnGZ39gbxVRjWTT9JaxZ0rTBRP
    FGAmd69LUAKCGAG8GmgV1HlrOVbDnwCoek/Io/2/hnGHMd9Q+HE8zlsNinIXYDW0tvir
    +GOyV7tLmAUvzUsSyOqeuzuJ1GteEslgsb70u6XRPH53evuOLUp1RvPLdLCQHRrDmCPT
    HwEg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619174237;
    s=strato-dkim-0002; d=aepfle.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=j93W4MdtcJ06QaKj+KWzi2ni53gGP1p2Z/Qqky/mcFc=;
    b=CV32QIIkQlMcvnqckvLL3zrEI1NXs7cCmC1JvkeC970tm8griaFGLe5hcUJrK9jl/S
    NHu9oqM2k0bC5kEqXUfpY1JLgZ9nMMAkiLTXhVPJ8Ryq3oDDx4AkLVp9Ndnw9JinTG8I
    FSRUYTwwOvLwxq6QZSUvnbhi/IhKTHvefhSIG5QJ+a6V6FCM1EBnHapZpy/otZ9DOvky
    LnP4RtWi9SOrM/y50UMnSt+SFxP5He0aV5WliGBBCerVYWLeOreOp1ECMGDiuUe8cT2m
    MgqExuFQ6cEz14I6SZhpPqI2/+Y9TyxJcF1OfQXjJGfZzENddwnSza/3b/C6DBuJK1di
    FKRg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3RdcLGMdqQ=="
X-RZG-CLASS-ID: mo00
Date: Fri, 23 Apr 2021 12:37:12 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] [PATCH v2] hotplug/Linux: fix starting of xenstored
 with restarting systemd
Message-ID: <YIKjWBSSV++6mBpd@aepfle.de>
References: <20190517095621.24271-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oWmjQS5dK1GEjOsR"
Content-Disposition: inline
In-Reply-To: <20190517095621.24271-1-olaf@aepfle.de>


--oWmjQS5dK1GEjOsR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping?

On Fri, May 17, Olaf Hering wrote:

> A hard to trigger race with another unrelated systemd service and
> xenstored.service unveiled a bug in the way how xenstored is launched
> with systemd.
>=20
> launch-xenstore may start either a daemon or a domain. In case a domain
> is used, systemd-notify was called. If another service triggered a
> restart of systemd while xenstored.service was executed, systemd may
> temporary lose track of services with Type=3Dnotify. As a result,
> xenstored.service would be marked as failed and units that depend on it
> will not be started anymore. This breaks the enire Xen toolstack.
>=20
> The chain of events is basically: xenstored.service sends the
> notification to systemd, this is a one-way event. Then systemd may be
> restarted by the other unit. During this time xenstored.service is done
> and exits. Once systemd is done with its restart it collects the pending
> notifications and childs. If it does not find the unit which sent the
> notification it will declare it as failed.
>=20
> A workaround for this scenario is to wait for a short time after sending
> to notification. If systemd happens to restart it will still find the
> unit it launched.
>=20
> Adjust the callers of launch-xenstore to specifiy the init system.
> Do not fork xenstored with systemd, preserve pid.
> Be verbose about xenstored startup only with sysv to avoid interleaved
> output in systemd journal. Do the same also for domain case, even if is
> not strictly needed because init-xenstore-domain has no output.
>=20
> The fix for upstream systemd which is supposed to fix it:
> 575b300b795b6 ("pid1: rework how we dispatch SIGCHLD and other signals")
>=20
> v02:
> - preserve Type=3Dnotify
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/hotplug/Linux/init.d/xencommons.in         |  2 +-
>  tools/hotplug/Linux/launch-xenstore.in           | 56 ++++++++++++++++++=
------
>  tools/hotplug/Linux/systemd/xenstored.service.in |  2 +-
>  3 files changed, 44 insertions(+), 16 deletions(-)
>=20
> diff --git a/tools/hotplug/Linux/init.d/xencommons.in b/tools/hotplug/Lin=
ux/init.d/xencommons.in
> index 7fd6903b98..dcb0ce4b73 100644
> --- a/tools/hotplug/Linux/init.d/xencommons.in
> +++ b/tools/hotplug/Linux/init.d/xencommons.in
> @@ -60,7 +60,7 @@ do_start () {
>  	mkdir -m700 -p ${XEN_LOCK_DIR}
>  	mkdir -p ${XEN_LOG_DIR}
> =20
> -	@XEN_SCRIPT_DIR@/launch-xenstore || exit 1
> +	@XEN_SCRIPT_DIR@/launch-xenstore 'sysv' || exit 1
> =20
>  	echo Setting domain 0 name, domid and JSON config...
>  	${LIBEXEC_BIN}/xen-init-dom0 ${XEN_DOM0_UUID}
> diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux=
/launch-xenstore.in
> index 991dec8d25..8ff243670d 100644
> --- a/tools/hotplug/Linux/launch-xenstore.in
> +++ b/tools/hotplug/Linux/launch-xenstore.in
> @@ -15,6 +15,16 @@
>  # License along with this library; If not, see <http://www.gnu.org/licen=
ses/>.
>  #
> =20
> +initd=3D$1
> +
> +case "$initd" in
> +	sysv|systemd) ;;
> +	*)
> +	echo "first argument must be 'sysv' or 'systemd'"
> +	exit 1
> +	;;
> +esac
> +
>  XENSTORED=3D@XENSTORED@
> =20
>  . @XEN_SCRIPT_DIR@/hotplugpath.sh
> @@ -44,15 +54,9 @@ timeout_xenstore () {
>  	return 0
>  }
> =20
> -test_xenstore && exit 0
> -
> -test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CON=
FIG_LEAF_DIR@/xencommons
> -
> -[ "$XENSTORETYPE" =3D "" ] && XENSTORETYPE=3Ddaemon
> +run_xenstored () {
> +	local maybe_exec=3D$1
> =20
> -/bin/mkdir -p @XEN_RUN_DIR@
> -
> -[ "$XENSTORETYPE" =3D "daemon" ] && {
>  	[ -z "$XENSTORED_ROOTDIR" ] && XENSTORED_ROOTDIR=3D"@XEN_LIB_STORED@"
>  	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS=3D"$XENSTORED_ARGS -T @XEN_=
LOG_DIR@/xenstored-trace.log"
>  	[ -z "$XENSTORED" ] && XENSTORED=3D@XENSTORED@
> @@ -60,13 +64,30 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && =
=2E @CONFIG_DIR@/@CONFIG_LEAF
>  		echo "No xenstored found"
>  		exit 1
>  	}
> +	$maybe_exec $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORE=
D_ARGS
> +}
> =20
> -	echo -n Starting $XENSTORED...
> -	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
> +if test "$initd" =3D 'sysv' ; then
> +	test_xenstore && exit 0
> +fi
> =20
> -	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || e=
xit 1
> +test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CON=
FIG_LEAF_DIR@/xencommons
> =20
> -	exit 0
> +[ "$XENSTORETYPE" =3D "" ] && XENSTORETYPE=3Ddaemon
> +
> +/bin/mkdir -p @XEN_RUN_DIR@
> +
> +[ "$XENSTORETYPE" =3D "daemon" ] && {
> +	if test "$initd" =3D 'sysv' ; then
> +		echo -n Starting $XENSTORED...
> +		run_xenstored ''
> +		timeout_xenstore $XENSTORED || exit 1
> +		exit 0
> +	else
> +		XENSTORED_ARGS=3D"$XENSTORED_ARGS -N"
> +		run_xenstored 'exec'
> +		exit 1
> +	fi
>  }
> =20
>  [ "$XENSTORETYPE" =3D "domain" ] && {
> @@ -76,9 +97,16 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && .=
 @CONFIG_DIR@/@CONFIG_LEAF
>  	XENSTORE_DOMAIN_ARGS=3D"$XENSTORE_DOMAIN_ARGS --memory $XENSTORE_DOMAIN=
_SIZE"
>  	[ -z "$XENSTORE_MAX_DOMAIN_SIZE" ] || XENSTORE_DOMAIN_ARGS=3D"$XENSTORE=
_DOMAIN_ARGS --maxmem $XENSTORE_MAX_DOMAIN_SIZE"
> =20
> -	echo -n Starting $XENSTORE_DOMAIN_KERNEL...
> +	if test "$initd" =3D 'sysv' ; then
> +		echo -n Starting $XENSTORE_DOMAIN_KERNEL...
> +	else
> +		echo Starting $XENSTORE_DOMAIN_KERNEL...
> +	fi
>  	${LIBEXEC_BIN}/init-xenstore-domain $XENSTORE_DOMAIN_ARGS || exit 1
> -	systemd-notify --ready 2>/dev/null
> +	if test "$initd" =3D 'systemd' ; then
> +		systemd-notify --ready
> +		sleep 9
> +	fi
> =20
>  	exit 0
>  }
> diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hot=
plug/Linux/systemd/xenstored.service.in
> index 80c1d408a5..c226eb3635 100644
> --- a/tools/hotplug/Linux/systemd/xenstored.service.in
> +++ b/tools/hotplug/Linux/systemd/xenstored.service.in
> @@ -11,7 +11,7 @@ Type=3Dnotify
>  NotifyAccess=3Dall
>  RemainAfterExit=3Dtrue
>  ExecStartPre=3D/bin/grep -q control_d /proc/xen/capabilities
> -ExecStart=3D@XEN_SCRIPT_DIR@/launch-xenstore
> +ExecStart=3D@XEN_SCRIPT_DIR@/launch-xenstore 'systemd'
> =20
>  [Install]
>  WantedBy=3Dmulti-user.target
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--oWmjQS5dK1GEjOsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCCo1IACgkQ86SN7mm1
DoBJug//Xiy0vVZ/cGpxy5gHSR1QbrE8Vq75nSzAC5NegSIWYs3xHBUzhIF/5Jg/
nIz3eDCL3hwgeqaTAEPCPkqi1PUlWJC2Yb/UM0zUbQoAr0WRDJornihnfcCOHhgl
YpQ7ddgBqQzeKfCzufmSbcAuYnzfMqFQ9gofwlrpa+qQ/Zw+tssUxDgDT6FEq59Z
6rz1gUKQjKay4enlyiNrBh+ISnEb+aCoVzMCLrewhmFqY549sZrTnP0c8TeU8POl
YWp+PALp7YPZWbWv4qVTq90+l6Vm5o8yRNbe3SZt5vR0SienAGJIgYh+R7FO2VpQ
qabUBR4YoTjjyWWP1SWpG4eXnu2DfcNdwvUqFPchbJgP0FOqmBOtyCRTGENgaGi8
NqXvu8T/0skzyibVQUJ1ud4zVVYOPQAfBfPASzO9BCHn63rbnySij4iFPF1lftTt
PaDg1EO1XUSgYmRXXxBvZFJDnktZY1HDFXP6Omn1+UJj6jUTTY3lCqxdFIIRwNUO
EwktlHRlbYrLZUZLcKJnZWqsyIuOeyBE7Q6SbQkPAehIonvCvCaUGyH/l2si54No
MZ/SjOKkcSx09a4XUiHcJR2YfVTlbCrMN3RVFnj+4GjZvEIcJsHQKL18ha/Lf83D
w+JAyjbKTN7qEYn+h36E3FiELP2nvXnPqPP4nnuvWA79je5NMzg=
=BGb/
-----END PGP SIGNATURE-----

--oWmjQS5dK1GEjOsR--

