Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK6RHxR972lKBwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:13:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB101474F6E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295005.1571704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNdT-00015h-2I; Mon, 27 Apr 2026 15:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295005.1571704; Mon, 27 Apr 2026 15:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNdS-00013K-Vl; Mon, 27 Apr 2026 15:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1295005;
 Mon, 27 Apr 2026 15:12:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf7fbe13000f373@swg.vates.tech>)
 id 1wHNdR-00013E-1c
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNdP-00CvTB-10
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:12:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf7fbe13000f373@swg.vates.tech>)
 id 69ef7cd8-e002-0a2a0a5209dd-0a2a45048a96-12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:12:30 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf7fbe13000f373@swg.vates.tech>)
 id 69ef7cde-1dec-0a2a45040019-b9ff1c22b521-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:12:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf7fbe13000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 15:12:28 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id E6ADD877EF;
 Mon, 27 Apr 2026 17:12:27 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=nvUq1OCjijHHjCRh3xKqrvTqYw/FcsJE6AeDDs7luOs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bezpCvCogfbd95bq1MTvtxHGFbcK0G0UjHepu80mo7HbUuVpMAvyfkTySX+ZKp2cQ2ZNdABxM
 2veAYXKB3UFw6jqq2VN5Dd1PJkG4/HIlFVtn2OZS3gxdIm4Yho/rRnQsgfMpNtdqCQWuJ6VpCZ/
 2AvtXkSEjf2IAsfNf2mPEvMs8ZDcG6D78kkrRQWQy2rbirUhiA2vyAqusirbCMpJE9Ly6uS0WDx
 wqTQee+23pTCP6Y65jZuYgBYlj1UgyaMUFx47cF8fwegPuzuJD5jvVp8W0eizxcriTlHX5pIiRt
 6Sb1wwH3eLl6R3fd+bnJGg8Vcuwan2rz+/PnGGyPXHog==
X-Zone-Loop: ac8675518f30b467b204b36589b42707c9958735726f
x-campaign-type: default
x-transaction-id: b01bb53b-b52c-425b-8aa2-57df1fd9b60f
x-swg-uid: 01-f1549c0f-3b67-4b23-82ec-f235ee9cba72
X-Mailer: Sweego
Message-ID:
 <1777302748.8631fc262581453bbf619ec5b2062170.19dcf7fbe13000f373@vates.tech>
x-swg-bid: 1777302748.8631fc262581453bbf619ec5b2062170.19dcf7fbe13000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 27 Apr 2026 17:12:27 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 03/13] Add debian rootfs artifact
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <ad97jcRfLG7nXk29@l14>
 <ad_SBvYvvFmOspSQ@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad_SBvYvvFmOspSQ@mail-itl>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.29c1.d93e4a476c499e31.19dcf7fbb9a.2d346ab1c18c0856=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777302748058
X-purgate-ID: tlsNG-ebf023/1777302750-32E743FF-0C64F532/0/0
X-purgate-type: clean
X-purgate-size: 4271
X-Rspamd-Queue-Id: DB101474F6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.29c1.d93e4a476c499e31.19dcf7fbb9a.2d346ab1c18c0856=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 07:59:34PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Apr 15, 2026 at 11:50:38AM +0000, Anthony PERARD wrote:
> > > diff --git a/scripts/debian-rootfs=2Esh b/scripts/debian-rootfs=2Esh
> > > new file mode 100755
> > > index 000000000000=2E=2E7cb8a96e39c0
> > > --- /dev/null
> > > +++ b/scripts/debian-rootfs=2Esh
> > =2E=2E=2E
> > > +PKGS=3D(
> > > +    # System
> > > +    bridge-utils
> > > +    dropbear
> > > +    udev
> > > +    systemd-sysv
> > > +    iproute2
> > > +    inetutils-ping
> > > +    util-linux
> > > +    cpio
> >=20
> > Is `cpio` going to be used in dom0? The alpine rootfs don't have it=2E
>=20
> Alpine does have it, via busybox=2E That said, I don't see it used in an=
y
> current test=2E

Turns out I'm actually using `cpio` on the Alpine rootfs=2E But the only
reason is to work around a very slow download of the rootfs via the UEFI
firmware (and grub) of the machine=2E I just boot with a smaller rootfs,
then after Linux is started, I download the rootfs that only has the
xentool and extract it with `cpio`=2E (loading the full rootfs over
netboot takes about 15min on that machine)

> > > +# don't need persistent logging, avoid journal flush service
> > > +rmdir var/log/journal
> >=20
> > I think this would better be done with:
> >=20
> >     cat >> /etc/systemd/journald=2Econf=2Ed/storage=2Econf <<EOF
> >     [Journal]
> >     Storage=3Dvolatile
> >     EOF
> >=20
> > because I think systemd intend to change the behavior in future releas=
e,
> > and we are more explicit with a config file=2E
>=20
> +1=20
>=20
> > > +# Create rootfs
> > > +cd /
> > > +{
> > > +    PATHS=3D"bin etc home init lib lib64 mnt opt root sbin srv tmp =
usr var"
> > > +    find $PATHS -print0
> > > +    echo -ne "dev\0proc\0run\0sys\0"
> > > +} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs=2Ecpio=2Egz"
> >=20
> > You should add "-R0:0" to the `cpio` command, like we do for the alpin=
e
> > rootfs=2E
>=20
> Hm, I'm not sure if that's a good idea=2E There are a few intentionally
> non-root files in Debian=2E Right now that is:
>=20
> -rw-r-----   1 root     42            496 Apr  1 01:08 etc/gshadow
> -rw-r-----   1 root     42            564 Apr  1 01:08 etc/shadow
> -rw-r-----   1 root     42            444 Apr  1 01:08 etc/gshadow-
> -rw-r-----   1 root     42            565 Apr  1 01:08 etc/shadow-
> -rwxr-sr-x   1 root     42          31256 Apr 19  2025 usr/bin/expiry
> -rwxr-sr-x   1 root     42         113848 Apr 19  2025 usr/bin/chage
> -rwsr-xr--   1 root     printadm    51272 Mar  8  2025 usr/lib/dbus-1=2E=
0/dbus-daemon-launch-helper
> -rwxr-sr-x   1 root     42          43256 Jun 29  2025 usr/sbin/unix_chk=
pwd
> drwxr-xr-x   2 systemd- systemd-        0 Apr  1 01:08 var/lib/systemd/n=
etwork
> drwxr-xr-x   2 42       root            0 Apr  1 01:07 var/lib/apt/lists=
/auxfiles
> drwx------   2 42       root            0 Apr  1 01:07 var/lib/apt/lists=
/partial
> drwxrwsr-x   2 root     mem             0 Sep  8  2025 var/mail
> -rw-rw-r--   1 root     43              0 Sep  8  2025 var/log/wtmp
> -rw-rw-r--   1 root     43              0 Sep  8  2025 var/log/lastlog
> -rw-rw----   1 root     43              0 Sep  8  2025 var/log/btmp
> -rw-r-----   1 root     adm         31508 Apr  1 01:08 var/log/apt/term=
=2Elog
> drwx------   2 42       root            0 Apr  1 01:08 var/cache/apt/arc=
hives/partial
>=20
> While it _might_ not explode right now if we reset it to root, it may
> cause issues in the future (for example APT likes to run downloads as
> unprivileged user, with write access only to
> /var/lib/apt/lists/partial)=2E

Ah, right, "-R0:0" probably only make sense when we build Xen as a build
user=2E

So, with the change to journald config:
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.29c1.d93e4a476c499e31.19dcf7fbb9a.2d346ab1c18c0856=---

