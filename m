Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3096EF258
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526618.818497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prcaJ-0007zk-3o; Wed, 26 Apr 2023 10:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526618.818497; Wed, 26 Apr 2023 10:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prcaJ-0007xr-0n; Wed, 26 Apr 2023 10:41:15 +0000
Received: by outflank-mailman (input) for mailman id 526618;
 Wed, 26 Apr 2023 10:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HkN=AR=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1prcaH-0007xl-Kp
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 10:41:13 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.216]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbc382dc-e41e-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 12:41:10 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3QAewIBW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Apr 2023 12:40:58 +0200 (CEST)
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
X-Inumbo-ID: dbc382dc-e41e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1682505658; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EpjqCiV3gnmm42+9O3vkwFVAjru+cgqxjkK6VGJRowFM9MGQQc9IvV/F42T2jNIRWc
    2vYAyB8yJGhJnSC5flbE8J0F5+UGgbRjtMKXuJY+xToQODqSDmUTZsPvn1c/h6xO6dSV
    zJJ5g9kQAcPYKTZ/NZy0MrEJBo2HwX9AhyVaGGhiIcx8WfUPIXUWcpKa+esSmefa6mJF
    2yb0vW2m5jUUebEIEIquT9AckCfySP/uc9odfV0t9Kr5LTn9Oshhim1xD3Jj6zd/rWtp
    jTTaVj34rsorH6AZSNZmxlT002MelAtNiPo97mVXRoyMa740PYevXbiLnQkY4D/D68py
    ID8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1682505658;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7Cv5/o3BY5zVvZgmulq4jQTU+WB0ze9LCIknuwExZm0=;
    b=F93Rv2xQXExxDBIy3YWb+le5l6JzdNDddaMa7jJyi9qn6cyMxqIwR5xqiy1KOX6Jap
    oir6x5aJRTGhihjItsCCq952i75czRRz63VDJ4nfTnM6JCfsAqk/8FzdWX8LKwXwrhss
    BfdCLQlOTltgV2vJKBSwwDMpA1fRs+Ged7zw03/Awi7djJyZ79OnfJL5v7E14K1FlUPy
    Np3Q2KeW/u5wbapbyqcDhcksZNjZWCvPNp+hPiSbFZCKxrGHOoOSJH0I3x74HKWYtC26
    s0u2zAniIQYaDOZtyb2HgBC0zjuCP5P+Pp1mXmWsHuh0LKV0RBjFYYmRxdnkAGBzzlRg
    +b1w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1682505658;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7Cv5/o3BY5zVvZgmulq4jQTU+WB0ze9LCIknuwExZm0=;
    b=H89P/P1s61Mo/Rbu0lXd4HcMbcu/f33z/4MlzvbP5PZM4qGoa1pjChy2OHB6H4BQEh
    ULDYX2SqAKA8OzfGFr8sGfxeLXodUCNLUNy+fTDJQMFfYKwbMwth3dk8wViF0cXIF0CW
    09qbADyB9+ZKhPq9FZ4QS2+fsIjF3WOdRV1Jx4Va2xy3U/eq8bkyA6RGoYF23HuyOCcj
    KxIZjFZmL+XuMd+SyzABERTFSjrvLhKFFjVzmk74ajxoIEV7MMhHg75gMqFQFOyKRpO1
    107KYUvtGCzD0gAnl2krZKe9DJG9uXzT9ZP78cUktc4IgECtvP/RtIzmxy61zmK724TY
    Sjdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1682505658;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7Cv5/o3BY5zVvZgmulq4jQTU+WB0ze9LCIknuwExZm0=;
    b=6EsxgS8dTVTP364CxSDuG0RE4/dJ6Hx0x54uY5QvPz/mS33uqjVmmkJqBMQWjw4bX3
    1sYmet2W/vu9MuTks/BA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BBKIYx7sXVVhU9+brASRK3ZldJTnR7IDHecOJA=="
Date: Wed, 26 Apr 2023 12:40:51 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] Fix install.sh for systemd
Message-ID: <20230426124051.24c2a9a6.olaf@aepfle.de>
In-Reply-To: <9dfb4f01-979e-e225-214e-34ddb51a9199@suse.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
	<20230426091533.68324d8d.olaf@aepfle.de>
	<650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com>
	<20230426104754.78845a19.olaf@aepfle.de>
	<9dfb4f01-979e-e225-214e-34ddb51a9199@suse.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zhIK0kJ9tk+j6u24=l2I7ib";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/zhIK0kJ9tk+j6u24=l2I7ib
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 26 Apr 2023 11:07:17 +0200 Jan Beulich <jbeulich@suse.com>:

> On 26.04.2023 10:47, Olaf Hering wrote:
> > XEN_RUN_DIR and most likely also XEN_RUN_STORED have to be removed from=
 make install. =20
> ... this suggests to me that you really mean the change doesn't go far
> enough, but that's then different from nack-ing a change. Can you please
> clarify this for me (and maybe also for Jason, depending on how he has
> read your replies)?

I think the change should look like this, the runtime directories have to b=
e created at runtime.

 tools/Makefile                                     |    2 --
 tools/hotplug/FreeBSD/rc.d/xencommons.in           |    1 +
 tools/hotplug/FreeBSD/rc.d/xendriverdomain.in      |    1 +
 tools/hotplug/Linux/init.d/xendriverdomain.in      |    1 +
 tools/hotplug/Linux/systemd/xenconsoled.service.in |    2 +-
 tools/hotplug/NetBSD/rc.d/xendriverdomain.in       |    2 +-

--- a/tools/Makefile
+++ b/tools/Makefile
@@ -58,9 +58,7 @@ build all: subdirs-all
 install:
 	$(INSTALL_DIR) -m 700 $(DESTDIR)$(XEN_DUMP_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LOG_DIR)
-	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LIB_DIR)
-	$(INSTALL_DIR) $(DESTDIR)$(XEN_RUN_STORED)
 	$(INSTALL_DIR) $(DESTDIR)$(PKG_INSTALLDIR)
 	$(MAKE) subdirs-install
=20
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -34,6 +34,7 @@ xen_startcmd()
 	local time=3D0
 	local timeout=3D30
=20
+	mkdir -p "@XEN_RUN_DIR@"
 	xenstored_pid=3D$(check_pidfile ${XENSTORED_PIDFILE} ${XENSTORED})
 	if test -z "$xenstored_pid"; then
 		printf "Starting xenservices: xenstored, xenconsoled."
--- a/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
@@ -27,6 +27,7 @@ xendriverdomain_start()
 {
 	printf "Starting xenservices: xl devd."
=20
+	mkdir -p "@XEN_RUN_DIR@"
 	PATH=3D"${bindir}:${sbindir}:$PATH" ${sbindir}/xl devd --pidfile ${XLDEVD=
_PIDFILE} ${XLDEVD_ARGS}
=20
 	printf "\n"
--- a/tools/hotplug/Linux/init.d/xendriverdomain.in
+++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
@@ -49,6 +49,7 @@ fi
=20
 do_start () {
 	echo Starting xl devd...
+	mkdir -m700 -p ${XEN_RUN_DIR}
 	${sbindir}/xl devd --pidfile=3D$XLDEVD_PIDFILE $XLDEVD_ARGS
 }
 do_stop () {
--- a/tools/hotplug/Linux/systemd/xenconsoled.service.in
+++ b/tools/hotplug/Linux/systemd/xenconsoled.service.in
@@ -11,7 +11,7 @@ Environment=3DXENCONSOLED_TRACE=3Dnone
 Environment=3DXENCONSOLED_LOG_DIR=3D@XEN_LOG_DIR@/console
 EnvironmentFile=3D-@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
 ExecStartPre=3D/bin/grep -q control_d /proc/xen/capabilities
-ExecStartPre=3D/bin/mkdir -p ${XENCONSOLED_LOG_DIR}
+ExecStartPre=3D/bin/mkdir -p ${XENCONSOLED_LOG_DIR} @XEN_RUN_DIR@
 ExecStart=3D@sbindir@/xenconsoled -i --log=3D${XENCONSOLED_TRACE} --log-di=
r=3D${XENCONSOLED_LOG_DIR} $XENCONSOLED_ARGS
=20
 [Install]
--- a/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
@@ -23,7 +23,7 @@ XLDEVD_PIDFILE=3D"@XEN_RUN_DIR@/xldevd.pid"
=20
 xendriverdomain_precmd()
 {
-	:
+	mkdir -p "@XEN_RUN_DIR@"
 }
=20
 xendriverdomain_startcmd()


Olaf

--Sig_/zhIK0kJ9tk+j6u24=l2I7ib
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRI/7MACgkQ86SN7mm1
DoB+Rw//YYUMzUCf0kQ0lG+62CT2JlCC75TM4vZ5ppndZrfm3qnszQ7Zs4GSRQat
XQiMob1OnrE9LGouv/eoT638fAhNvOSmbZolB7cOLz256/G8kyAO43FiU461ax6e
QARvxABqmIbtgskm1gYovpouXaNAcTiyujPA6VmmMSDmyRFRsOJtQ5vji85YwHTy
u90SeLNAJgC++yXmc9EYznbn/MlRAldHRAxbDU3NqdHSw4PKoWP4R/hnC8JfycdY
pBfRCghrUgbICQYrTZ2HLXxwgKdUkDdAjZn4ca+UNUlmgIiCXh2q+ap7lWbyVgEA
H6HbqInYQy9UMfHwTqAqb+gp/dI1AosL9rd/TUKOy+g3ZAAK0/AeGpQe490UxuC3
6F0/EEXHLVX0Oi+jgtK/h6lyJvxpfk316JuPYr+6EI2YB5sit0C9eQNa2Wrqc5Ku
zsX60Ctxu3ZYOgvUpFFKizBUPJ6hb0gXRiyLLawfzicOE3d8vfpbnJoEolOrjGcL
oH47tXUvXlmFGUpaJz5d1f5lMdx7OstoZVEdE3bIQo4KfBpQyuSkqfI5KTdpimfb
M5ukNWK5Fnub47K0UonzLq8MULLuWAVJOLzYYuffVPrM8iICGHyJDvkKsw2GdgXE
VcCY8k1QbxpR3p8lMBNbUvoviuJvlsgHG+wJwfA3/hCJPkKyLY8=
=to8F
-----END PGP SIGNATURE-----

--Sig_/zhIK0kJ9tk+j6u24=l2I7ib--

