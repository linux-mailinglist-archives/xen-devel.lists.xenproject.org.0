Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A99387C63
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 17:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129363.242839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1aF-0008QY-TC; Tue, 18 May 2021 15:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129363.242839; Tue, 18 May 2021 15:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1aF-0008OJ-Pr; Tue, 18 May 2021 15:24:35 +0000
Received: by outflank-mailman (input) for mailman id 129363;
 Tue, 18 May 2021 15:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj1aD-0008O6-Ik
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 15:24:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b4e4d50-4400-48c9-9929-0e59982739f1;
 Tue, 18 May 2021 15:24:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08976AF21;
 Tue, 18 May 2021 15:24:32 +0000 (UTC)
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
X-Inumbo-ID: 9b4e4d50-4400-48c9-9929-0e59982739f1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621351472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=LdchXg5sD+yim6rkWrmO58TKx/j7GGKezGaYKhI977k=;
	b=IztIi2iySIHDdcvp3+HaMVEEYj/xFEyqaVuIrrBSLLhj5BAr014qIT3w9OarOoxPRx7QHe
	s2eN1hrCyagxplH7QGRToiXDFFgIWtK4xh/bgXOlJBzG+eBOUzllBR1LNgbG12slYCSTc5
	LImoDYfPV910nkwp6blzp6Jp2wlTgKw=
Message-ID: <f7738499f24f6682f4ae1c1c750e30f322dfdbf3.camel@suse.com>
Subject: QEMU backport necessary for building with "recent" toolchain (on
 openSUSE Tumbleweed)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Ian Jackson
 <iwj@xenproject.org>,  Wei Liu <wl@xen.org>, Roger Pau Monne
 <roger.pau@citrix.com>
Date: Tue, 18 May 2021 17:24:30 +0200
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dWM7hf+zHIeucaFvLuqN"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-dWM7hf+zHIeucaFvLuqN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

While trying to build Xen on openSUSE Tumbleweed, I run into this
error, when qemu-xen is being built:

ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
make[1]: *** [Makefile:53: multiboot.img] Error 1
make: *** [Makefile:576: pc-bios/optionrom/all] Error 2
make: Leaving directory '/build/tools/qemu-xen-build'
make[3]: *** [Makefile:212: subdir-all-qemu-xen-dir] Error 2
make[3]: Leaving directory '/build/tools'
make[2]: *** [/build/tools/../tools/Rules.mk:156: subdirs-install] Error 2
make[2]: Leaving directory '/build/tools'
make[1]: *** [Makefile:66: install] Error 2
make[1]: Leaving directory '/build/tools'
make: *** [Makefile:140: install-tools] Error 2

Build tools versions are as follows:

dario@885e566747e1:~> gcc -v
gcc version 10.3.0 (SUSE Linux)=20

dario@885e566747e1:~> ld -v
GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.36.1.20210326-3

I think we need the following commit in our QEMU: bbd2d5a812077
("build: -no-pie is no functional linker flag").

I have attempted a quick-&-dirty backport of it here:
https://xenbits.xen.org/gitweb/?p=3Dpeople/dariof/qemu-xen.git;a=3Dcommit;h=
=3D85575b7b661cedb8e6f6e192d36199ca9fde5841

Feel free to use it as a base, or tell me if I can help more with it in
any other way with it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-dWM7hf+zHIeucaFvLuqN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCj3C4ACgkQFkJ4iaW4
c+7Vbw/9ETlckt36nVjn7zX5I12Od0zSnz9TLDFg/9Bpg3dG4Q+zjMMaK+h6DoOI
Iz7lVsgdqq+B5FPP26ITOqvL2ary7ULAQliaT9GquN4i3r9p8qvWRXo6NkYfDNcH
3BxGZuBrm0OkLiP4gixw+VlrCRN3LGct+dUcTXAcJ//9U0LSZyZJm5ryEMm2BJxn
8JRK8FNeisRIrnqpTfD39fVPB5Qn5ddgPyAEwVPd1koWK4RiEGbRaA0Et3ZJrNtl
2sID/1nkjScMGMpfYDQ6txnp3Izmta2ZskO1l9GdGnFN95CLaCSiA8dVHKSgjpO+
BGAtJ4RxTjr1tT+AF64sGV4pJ08SY6e+WSudmeKptH0vAoLKWjJLMlyYzpEjg8ic
lqhyqYtsE+iHWrrEwQZeufSCL3T6IH1AoyPqnxF8H5MvMYtJVCDovq2qOTpuQ6cx
Pvv9Gw0CfZYiIKhoYzOX7XDvoQHJEoPG8n4xsMr5XTUkZtYMqJAzSESURD5Fk0e4
eVCrXX27RvkKR+g4BbuVAHqDdeL+sBpFT6UBbHFMbb69h5ZxOt/5a1AIQ+2Ncbtz
D5cDpi8VWnt+nDMyXwJFjoUKnxd1MAekTzcYXE1ouQcRfFFewfKfyV+mYs0C7Vjy
4RJ0MtF7jm/jY0LZIaSshim9T/0PgPZkZj9U1sDY1cqBf+M/fGI=
=Sdo0
-----END PGP SIGNATURE-----

--=-dWM7hf+zHIeucaFvLuqN--


