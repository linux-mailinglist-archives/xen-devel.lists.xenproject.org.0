Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B819B12D43
	for <lists+xen-devel@lfdr.de>; Sun, 27 Jul 2025 02:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059784.1426419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufpgZ-0003aP-TJ; Sun, 27 Jul 2025 00:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059784.1426419; Sun, 27 Jul 2025 00:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufpgZ-0003YL-Qe; Sun, 27 Jul 2025 00:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1059784;
 Sun, 27 Jul 2025 00:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBAf=2I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ufpgX-0003YF-Hd
 for xen-devel@lists.xenproject.org; Sun, 27 Jul 2025 00:56:17 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e0d2587-6a84-11f0-a31e-13f23c93f187;
 Sun, 27 Jul 2025 02:56:14 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AFA6D1400068;
 Sat, 26 Jul 2025 20:56:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sat, 26 Jul 2025 20:56:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Jul 2025 20:56:11 -0400 (EDT)
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
X-Inumbo-ID: 7e0d2587-6a84-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1753577772; x=1753664172; bh=HJ
	XjQMdy4aXD4qPqsG3NAMARVk/M9pGTD43O/X89e+4=; b=ea+RJb2m9RUV8TMHpD
	7elOy+lm0cshWOtLN7XyvvczDr3oEg0eNHCJ1oJcnBbASEVmy15wYyy7T+hRolKG
	kLWOk17/MHEiwDUnxVNaMNyhFGURmFiFLc8SP4fzT/LxQbqi6ukenhaOfFO2upVH
	K1UF+YekrBLbnPJi/lPS4+eFgALOkmElbqgqDWFn4KMf+HiTYeZLC01KU1R731FD
	L62y5QW0pbEWmfy23eNKGeGUVlYMxM0elyXLOJjVPET5SA9ZKnPSxa12ik2rEZ6G
	bwzhZXU8DxY0UU2cbQ/yA85+7n9vO4RgycIsJ5Hs23O0YgDj54vr6Ul0BzTweSP0
	4zqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753577772; x=
	1753664172; bh=HJXjQMdy4aXD4qPqsG3NAMARVk/M9pGTD43O/X89e+4=; b=j
	mIPtl8Cp/1+lnsNRgwtSNWZFY4e59ndhlGVRfxwtWIKvCNPplnvaKsYpD6fNoYLa
	56W/K/yMm2eBhXi6SBQLVDeiTzpAZQp/+YjHlbAKZX3m+syxzu5bIGkC0tSGncBb
	rENVm9GVXf1L7Bp9EFXYgYQU1l0jyySshOJ6DgwEnpKhzlmR7DJxyUEYtZyKiObw
	CfacdQ1lzyNiSpvguIkH0mVTAG74mdQQigVCd7D0F28rQZUHc67ModuUlYM0cwm8
	EuDK/PQuutMWKCLVykbqpS6wBb42bOneRNvT68yddYLGkP6HaLei1Q93ZAUgM445
	25kj6SYScXPyt2iZGpYPA==
X-ME-Sender: <xms:LHmFaL80FpvRbrBsCM8tVbYScKGVQSOMb8nFNpdlGRJggFm3vHvTvA>
    <xme:LHmFaFTrLynzAeK5I4kykDGHO3dAlq9j_w9sFKwzSCv_M7VIEdwfCIzfCyjB6Bkdt
    hbjaSjNA-jRTw>
X-ME-Received: <xmr:LHmFaPcY9O4zqKWzx1VZpZq0grQWR-KZuKGIpbT87vSfoEXwRShTMfqtx-ZZg1IOoziLNhHVuCK8kzUUEy5wWwCXexX7OiGA_jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekjeeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekueekieeuvdel
    tdelleekueeivedukeejfedthfeuuefhffekffejiefgteelgfenucffohhmrghinhepgh
    hithhhuhgsrdgtohhmpdhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrd
    horhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtgho
    mhdprhgtphhtthhopehgvghorhhgvgdrughunhhlrghpsegtihhtrhhigidrtghomhdprh
    gtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhi
    vghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepfihlseigvghnrdhorhhg
X-ME-Proxy: <xmx:LHmFaJBfxYmkBpe-tDMZv19M5mYGTGs-6UPOv-AcV0eIP5Q_96iwyw>
    <xmx:LHmFaBlw8kdOjXkQ1aizZkO94wmwOnUmWGsVOvCXxevScYtyFKJtgg>
    <xmx:LHmFaEeM1uv5dkPmRXKbxFK2haZsuueXjBu6Vb1_fc1D8N94Tn9CHg>
    <xmx:LHmFaFR_Pp77mJnS5gjYB74Cy1QDn-x86OwIp1qLtVOC-2Hp8G8_cg>
    <xmx:LHmFaHsfO-gTXSU20Al74LgabhT8Ii-845-ZLiWz5hhFTXYHwNrmR_QC>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 27 Jul 2025 02:56:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: xl devd crashes in domU - Xen 4.20
Message-ID: <aIV5KRlKN2BZyObB@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1MJX/yXhGbqKaof9"
Content-Disposition: inline


--1MJX/yXhGbqKaof9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Jul 2025 02:56:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: xl devd crashes in domU - Xen 4.20

Hi,

Driver domains do not work in Xen 4.20, due to `xl devd` crashing. I've
got a report about it in Debian 13, but I can reproduce the issue
outside of Debian too.

I can reproduce the issue on master too.

The original report: https://github.com/QubesOS/qubes-issues/issues/10050#i=
ssuecomment-3092559292
And analysis done there:

user@sys-whonix-firewall:~/xen-4.20.0+68-g35cb38b222$ gdb --args /usr/lib/x=
en-4.20/bin/xl devd
GNU gdb (Debian 16.3-1) 16.3
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from /usr/lib/xen-4.20/bin/xl...
Reading symbols from /usr/lib/debug/.build-id/e0/c4fd106db94ad95b556765d61d=
f2ec13fe674e.debug...
(gdb) r
Starting program: /usr/lib/xen-4.20/bin/xl devd
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Program received signal SIGSEGV, Segmentation fault.
__strlen_evex () at ../sysdeps/x86_64/multiarch/strlen-evex-base.S:81
warning: 81     ../sysdeps/x86_64/multiarch/strlen-evex-base.S: No such fil=
e or directory
(gdb) bt
#0  __strlen_evex () at ../sysdeps/x86_64/multiarch/strlen-evex-base.S:81
#1  0x00007ffff7d95d7b in __GI___regexec (preg=3Dpreg@entry=3D0x7fffffffdc5=
0, string=3D0x0, nmatch=3Dnmatch@entry=3D0, pmatch=3Dpmatch@entry=3D0x0,
eflags=3Deflags@entry=3D0)
    at ./posix/regexec.c:211
#2  0x00007ffff7e013e9 in __compat_regexec (preg=3Dpreg@entry=3D0x7fffffffd=
c50, string=3D<optimized out>, nmatch=3Dnmatch@entry=3D0, pmatch=3Dpmatch@e=
ntry=3D0x0,
    eflags=3Deflags@entry=3D0) at ./posix/regexec.c:240
#3  0x00005555555610c1 in auto_autoballoon () at ./tools/xl/xl.c:96
#4  parse_global_config (configfile=3D0x55555557f0c3 "/etc/xen/xl.conf", co=
nfigfile_data=3D<optimized out>, configfile_len=3D<optimized out>) at
=2E/tools/xl/xl.c:134
#5  main (argc=3D2, argv=3D0x7fffffffdde8) at ./tools/xl/xl.c:436
(gdb) frame 3
#3  0x00005555555610c1 in auto_autoballoon () at ./tools/xl/xl.c:96
96          ret =3D regexec(&regex, info->commandline, 0, NULL, 0);
(gdb) list
91      #undef SIZE_PATTERN
92
93          if (ret)
94              return 1;
95
96          ret =3D regexec(&regex, info->commandline, 0, NULL, 0);
97          regfree(&regex);
98
99          return ret =3D=3D REG_NOMATCH;
100     }
(gdb) print info->commandline
$1 =3D 0x0
(gdb)


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1MJX/yXhGbqKaof9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiFeSkACgkQ24/THMrX
1yxuggf+K9PfQAVHNli2zxbMDondXPrJRc5nZwjh5uMdteUWkAMdxPfeRYnytovm
e+w4ZzbkxpoaM/qngsxgDmKiVZ+eZKphVYKFZ0stwZ9ZB19KQvC8oDpJh8Y1Ch16
7WuBtjaMd3ncEuCJTJhN8DdrI3ImdfTe0rjAEAolbLF8C1lizLJdejf6PlJ1DqTv
J6LYPkrDCRPBYq5avh9MmY+nDuxGskWqlXegkqGkhhB39w2fuDDlwWZYVgOtgvyb
OEQMMQ4NMzo+devJMFfRGa9Aqi0UnvhsLAEz1yo8kfA/4WMViGwjADDghe667PNy
72NPlYtyVinY6/my5WubvJjAuTvdeg==
=YEyp
-----END PGP SIGNATURE-----

--1MJX/yXhGbqKaof9--

