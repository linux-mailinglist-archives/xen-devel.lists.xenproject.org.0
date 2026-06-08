Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ujpQEpMfJ2r7sAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 22:01:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D1565A3D1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 22:01:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=W8GlixhX;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=aPt4hLhh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1332045.1594679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWg9m-0004yr-9f; Mon, 08 Jun 2026 20:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332045.1594679; Mon, 08 Jun 2026 20:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWg9m-0004w5-6o; Mon, 08 Jun 2026 20:01:10 +0000
Received: by outflank-mailman (input) for mailman id 1332045;
 Mon, 08 Jun 2026 20:01:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWg9k-0004vz-D2
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:01:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWg9j-003QoK-GY
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:01:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a271f77-e002-0a2a0a5209dd-0a2a4503c184-18
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:01:07 +0200
Received: from [202.12.124.145] (helo=fout-b2-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a271f81-672d-0a2a45030019-ca0c7c9189e1-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:01:06 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 4CB4C1D000DA;
 Mon,  8 Jun 2026 16:01:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 16:01:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Jun 2026 16:01:03 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1780948865;
	 x=1781035265; bh=7TXsuCqjQSIWLbg+cf+quPHZ9WycHowGw1HKiMELlIk=; b=
	W8GlixhXY+jIX9baMuLqMnlhGyfgYVLFJhSGbn8T7t9hihzr9kT63vQn9hUsbmh8
	d0slSjzZh5Su0Cq1SdPzorHOGew4p8ATsGurx2BC8ZEleHWnal5KY11FzgQPNifl
	W/QvKxFgybTC8+q7T5R6cAtT59I3Vj+TfwE1mHfgrrcK/samE/BQFcMyR53nPqEy
	cO+yYmx57oKYDel5fxauWzx5NGW/bYG47mrFNGnjrj935AsEheikhRKt/PRtMgyo
	FX3rbZzMhoVRMOdHYWbwZMo60iQuSk33ywSSRS2+mwZKFxPergn4EDSygX4i7LzW
	pxDEMSzQN42shQafz6e7VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780948865; x=1781035265; bh=7TXsuCqjQSIWLbg+cf+quPHZ9WycHowGw1H
	KiMELlIk=; b=aPt4hLhhcY5MZhQokHz9SbnbIkOV86/uVw/MJCmimjWGLcU4A8T
	tF25hRksOBuVPSrZbaBvEq7KYg7ebhGoHks1SKbuJCurXyShYWHI5rv94g0iC/RU
	sLW3LVou7ToTKJuhkpKFAI3IqaoAFznGBR18dyaS7WTaJfA7i9OCuW+xsibp10M9
	4pnVynnTnG9rrc9zQW6WfQvvrIsb49T4keJ7XdhDHsEZr0PivZhGQ7Z2tybCkFt6
	F7HZba1akGzDiaZhnMbhQe8ehe6UOUrp646F9dBc8Bw3XqqQE87DnsRS9s+Xk73z
	R4NJfziA7WVTB/xauqx2IEC2Kj/iFS73xKg==
X-ME-Sender: <xms:gB8namMqmDl84NlSrPeBOelskpi3y9_2RVQ4qERaTkqrv92AXMc1CA>
    <xme:gB8nakD5i7dpsJZ53ZkV4geGxnPt0n3dF799dVCpMXHp6SYLuGVYup4SRcYAG9Nyi
    Nw09oPqD-GBJpeUaKeLqqiN39tXVDbw_AC-VaoisvD--gGE>
X-ME-Received: <xmr:gB8najdeFcPHMQ3dFdCIfWE0KGL2fjH86tzAK1Ytf0M3SpMedir_mz4RUray-V0phcLbi7hFHYNpxt0Z3Smobr0oWQXe8CWB8YE>
X-ME-Proxy-Cause: dmFkZTGQ4pTAzhuEpoGVMeriJ3lWmM37sxlt6N4wcJxOTYuZHU7CFWh2lWAzPhPkGA+OZ/
    zcl7ltwAExDJCCyzWR/75ahTZWemLuTCkPXHqktPoV7DPMD4XM/6pa3NCS56BTAPkK5QO/
    R1C1tw+H9vUrOYth3Icqg45rqXwcc3EBj/KB+YAG0a+FJTBGcwL0Jj+5rYoY1KAC5Qd9vh
    CGTSeNdFak4tWU5D8TJxmOoLO8NUmejCjTH7Pa5IW/pUZiuK9DkMf79agMqAp7wUJmEri8
    8bLV7M9mmC6fb2BCPQlFS0Iomud8b28VeYIM0MOHZW7f9bsNVz/bxZFMUjYrrVn+h9/7WS
    AAod0VrAxc8Z+WF1NcGN4ORJW6zwGszjTwcB+q3iPhXNG/OnWpTbBI3e52f0apbS7Y/kZj
    9JTUpo89Cd4aXYvlb8e/t9BuYSBfsrXJR0R4MH+1GrkGZEh95ChN2H/noELWN4gmsWB5mt
    55pNSpkgVVf18lmWPm4lKHS47JQi5ASCVwh4we3BSUlchEJhdpDPlwLGY8+uO6wRplShZc
    4w9CqyJYvZQX1XwQjJTf+qLtXcbcumd+YVTH7Knt9In0a94zQxhGyNY9nkKJ1OkRf57AST
    fTEB77KwPFD6MKXnpXSz0d2gqa4FAEDr9iUBvvuKmaRBZ8KSqihOO7AjDONg
X-ME-Proxy: <xmx:gB8najOlW0QYE69xhfX4DPNTpUq8OtFC5u2mWWA6tLiHEqaz_pIK4Q>
    <xmx:gB8najK3sx5chUbUbDvb8IJ1bHQ71Vatckj5vTeeMDKFqs6KD7Xz2Q>
    <xmx:gB8najLq66eXo8khqjy1AtdYcy2h1OwMw90ikJk7u-6XZU2EgxTzUQ>
    <xmx:gB8nat7ztjjiKkBkPqEBFerFlhNhY4SgPSw-QjSNtWFJADamf54gFA>
    <xmx:gR8naqSbnsoltCqY4nLVU2_2oIGurBZ7qIcRn1ixREbRotgGDJv9c66f>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 8 Jun 2026 22:01:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
Message-ID: <aicffd9gRs-HQ88v@mail-itl>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nyBmkYNrsX5w2vPj"
Content-Disposition: inline
In-Reply-To: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
X-purgate-ID: tlsNG-33051d/1780948867-42F62938-466BDFFC/10/73395122804
X-purgate-type: spam
X-purgate-size: 11454
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,suse.com,vates.tech,gmail.com,apertussolutions.com];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,apertussolutions.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81D1565A3D1


--nyBmkYNrsX5w2vPj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 8 Jun 2026 22:01:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi

On Mon, Jun 08, 2026 at 06:31:08PM +0100, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
>=20
> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are un=
able
> to boot xen.efi when debugging symbols are included.
>=20
> Either way, having debug symbols by default is abnormal and contrary to h=
ow
> the non-EFI path works.
>=20
> Produce xen-syms.efi unconditionally, just like xen-syms.  If
> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if no=
t,
> then not.  When xen-syms is processed by mkelf32, the debug symbols are s=
imply
> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
>=20
> Some old versions of binutils ld managed to produce efi files which the
> matching version of strip couldn't process.  This includes Binutils 2.26
> included in Ubuntu 16.04.  Delete the workaround for this bug, and requir=
e a
> less broken toolchain.

While I see Ubuntu 16.04 dropped, how is the "require a less broken
toolchain" addressed? By implicitly disabling xen.efi build on broken
toolchain? Maybe README should have a note about needing newer Binutils
for xen.efi? Currently it says just Binutils 2.25. There is a section
about optional build deps, maybe add there something like "GNU Binutils
X.Y (required for building xen.efi)", if the version is known, or at
least "GNU Binutils capable of producing non-broken PE files (required
for building xen.efi)" if the version is not known.

> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Frediano Ziglio <frediano.ziglio@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>=20
> For 4.22.  This was posted previously as
>=20
>   https://lore.kernel.org/xen-devel/20251208133945.61375-1-frediano.zigli=
o@citrix.com/T/#u
>=20
> but merged the two patches and rewritten the commit message to make it cl=
ear
> that failing to strip xen.efi is causing boot failures.
>=20
> Previously xen.efi.elf was produced but it's unclear why, and unnecessaer=
ily
> different, so I've dropped it.
>=20
> While this does want backporting, it can't be.  Xen 4.21 and older still =
build
> test with Ubuntu 16.04 and choke
> ---
>  .gitignore            |  1 +
>  CHANGELOG.md          |  3 +++
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile | 11 ++++-------
>  xen/arch/x86/arch.mk  |  7 -------
>  7 files changed, 11 insertions(+), 47 deletions(-)
>=20
> diff --git a/.gitignore b/.gitignore
> index bfc7bdf043c3..49e2c6961768 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -224,6 +224,7 @@ tools/flask/policy/xenpolicy-*
>  xen/xen
>  xen/suppression-list.txt
>  xen/xen-syms
> +xen/xen-syms.efi
>  xen/xen-syms.map
>  xen/xen.*
> =20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5cf19372a361..71d1e9ab8c69 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>   - On x86:
>     - Enable pf-fixup option by default for PVH dom0.
>     - The libxenguest bzImage loader now uses the system liblz4 library.
> +   - The install-time environment variable INSTALL_EFI_STRIP no longer e=
xists.
> +     xen.efi is always stripped, while the symbols remain available in
> +     xen-syms.efi.
> =20
>  ### Added
>   - Support for per-domain Xenstore quota in C xenstored (includes
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 8198a7f063cf..0a3fd67076fc 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot m=
odules are found.
>  Once built, `make install-xen` will place the resulting binary directly =
into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment =
(and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/e=
fi` not
> -match your system). When built with debug info, the binary can be quite =
large.
> -Setting `INSTALL_EFI_STRIP=3D1` in the environment will cause it to be s=
tripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also=
 be set
> -to any combination of options suitable to pass to `strip`, in case the d=
efault
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/=
efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).
> =20
>  The binary itself will require a configuration file (names with the `.ef=
i`
>  extension of the binary's name replaced by `.cfg`, and - until an existi=
ng
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c555..fcd3fc3d36cf 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>  	  Say Y here if you want to build Xen with debug information. This
>  	  information is needed e.g. for doing crash dump analysis of the
>  	  hypervisor via the "crash" tool.
> -	  Saying Y will increase the size of the xen-syms and xen.efi
> -	  binaries. In case the space on the EFI boot partition is rather
> -	  limited, you may want to install a stripped variant of xen.efi in
> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -	  docs/misc/efi.pandoc for more information - when not using
> -	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  Saying Y will increase the size of the xen-syms and xen-syms.efi
> +	  binaries.
> =20
>  endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index 1f11610b5f68..0f9b56fc399d 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -493,22 +493,6 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> =20
> -# Strip
> -#
> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped befor=
e it
> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) =
below
> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> -# option(s) to the strip command.
> -ifdef INSTALL_EFI_STRIP
> -
> -ifeq ($(INSTALL_EFI_STRIP),1)
> -efi-strip-opt :=3D --strip-debug --keep-file-symbols
> -else
> -efi-strip-opt :=3D $(INSTALL_EFI_STRIP)
> -endif
> -
> -endif
> -
>  .PHONY: _install
>  _install: D=3D$(DESTDIR)
>  _install: T=3D$(notdir $(TARGET))
> @@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).=
efi; \
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> -			$(if $(efi-strip-opt), \
> -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET)=
=2Eefi && \
> -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi=
/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)=
/$(T)-$(XEN_FULLVERSION).efi; \
>  		elif [ "$(D)" =3D "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))=
" ]; then \
>  			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2;=
 \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 47dd6c50fe88..01ed7302202e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -196,10 +196,7 @@ note_file_option ?=3D $(note_file)
> =20
>  extra-$(XEN_BUILD_PE) +=3D efi.lds
>  ifeq ($(XEN_BUILD_PE),y)
> -$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/e=
fi/relocs-dummy.o $(obj)/efi/mkreloc
> -ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug i=
nfo from $(@F)"
> -endif
> +$(TARGET)-syms.efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(o=
bj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
>  	$(objtree)/tools/symbols $(all_symbols) --source-name=3D$(@F).S --empty=
 \
>  		> $(dot-target).0s.S
>  	$(MAKE) $(build)=3D$(@D) .$(@F).0s.o
> @@ -233,10 +230,10 @@ endif
>  	$(NM) -pa --format=3Dsysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
> -ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf=
64-x86-64 $@ $@.elf
> -endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +
> +$(TARGET).efi: $(TARGET)-syms.efi
> +	$(STRIP) $< -o $@
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index cd0602a79aaf..199adc1a0967 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -95,13 +95,6 @@ EFI_LDFLAGS :=3D $(patsubst -m%,-mi386pep,$(LDFLAGS)) =
--subsystem=3D10 --enable-long
>  LD_PE_check_cmd =3D $(call ld-option,$(EFI_LDFLAGS) --image-base=3D0x100=
000000 -o $(efi-check).efi $(efi-check).o)
>  XEN_BUILD_PE :=3D $(LD_PE_check_cmd)
> =20
> -# If the above failed, it may be merely because of the linker not dealin=
g well
> -# with debug info. Try again with stripping it.
> -ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
> -EFI_LDFLAGS +=3D --strip-debug
> -XEN_BUILD_PE :=3D $(LD_PE_check_cmd)
> -endif
> -
>  ifeq ($(XEN_BUILD_PE),y)
> =20
>  # Check if the linker produces fixups in PE by default
>=20
> base-commit: 37df17d2f903503c619713eb01e488f2cb1a257f
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nyBmkYNrsX5w2vPj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmonH30ACgkQ24/THMrX
1yycwgf9EFvplfGgqrB9wewr44t56C4tdTsdMLRS3lcryFRz8UOjZ0lbLXfl15BC
hI9WBMAdqsJxtv7kBFqcKW7d/5FSrhoFlDczSLQp5rPI//sHHCm8GRbkPhCL1KCJ
aNUi6PviP384dQL5Wyt6zJCbCRl0WWRPcNs8R6fbPYNANV+hTljM7DPPGRMAu5GV
PC7B9ccdbOw7GGUNeki0FsfeZCFsjFuML79oVzR6VB0Xy8qBs30tMLW21IXk3xmX
dv8ftofGuhBWfpPS0fwskXoDkVzS60CnCi2NxXY+9Osl+0MnZ9Gh6iUhxkz5ePGI
4d6h2MGX6Dtf8NX0YO5aa77WkH/gpA==
=V41x
-----END PGP SIGNATURE-----

--nyBmkYNrsX5w2vPj--

