Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78FB1AD3B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 06:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069979.1433649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj9bE-0002FT-5v; Tue, 05 Aug 2025 04:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069979.1433649; Tue, 05 Aug 2025 04:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj9bE-0002D6-2m; Tue, 05 Aug 2025 04:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1069979;
 Tue, 05 Aug 2025 04:48:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8F9P=2R=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uj9bC-0002D0-Lc
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 04:48:30 +0000
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e0f574e-71b7-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 06:48:29 +0200 (CEST)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3e3fdfa4c2aso2790365ab.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 21:48:29 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb90:bf84:45ad:2f41:d127:adbe:c0d6])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e402b34532sm48015065ab.56.2025.08.04.21.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 21:48:27 -0700 (PDT)
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
X-Inumbo-ID: 6e0f574e-71b7-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754369308; x=1754974108; darn=lists.xenproject.org;
        h=mime-version:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fAeb9X+8AuYEPG8mHnlJ16wIPZcag0txnZ1arZNalQ0=;
        b=H3lAVRTeU+yBVc0fC01gLVj6lukHhLs+OePODKqUdbI0L1TtLhLvFDSrlRY1Y0Gd2x
         Vumdq+l6bGOWGFy0tFbIv3DmkACCIgBEZNl2ZlXvE6Q6CSepv3bbojTJzQG91Xhkintj
         0mcdUB8B5DnvcpEIZCRiNIHf38DTTEgPB8xt4rPG3mSg8eqKd+nSJjsQFA8fblPWQoGy
         MjuaMLNbPIx6BxCOn0++d2ZDKk8nawrrCCd+PJZaAAPyEO1TONV2jKnUQW8YtXGNtMEg
         6wT7Caq2pCkHNvu0KpTwW3TQWeCLohpC73fXBXt5SljxUM7cKuSTFzUHQLIZR4Xdaib3
         YqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369308; x=1754974108;
        h=mime-version:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAeb9X+8AuYEPG8mHnlJ16wIPZcag0txnZ1arZNalQ0=;
        b=FGQaTZjpAVozHaexu7EtS2wKlT4ZrsBe7fbZ/whQSMjMyKD5qW2cRcYrcbtaHM+W5p
         Wt3tAs2IGXhmsdCbu+M6I+Ix3nluf41yJfAG3xQD1/d9UrUY8PW5BTtlzzYEiwAZ0bF3
         Rik3odsjjKFStx8R2WuRQTSOT3dm/HkXp0J6KmUlCq5QgMAArG0RY2yJS2NJ7gfFWjlK
         IRch32yuoWPaTSW5F0S5ILlt2bxtp9dO2evkXSLn4Yi8H/jOvQJn3rEMWqGvT2rQEb7H
         PFOlK3K3SwRKvr2fmm63kEjBj5bUvU5F56CHYrINP18slWsYjG/ru3/eVCiwURIRVoWS
         SEug==
X-Forwarded-Encrypted: i=1; AJvYcCWbMXZFgvNbXspNNIWk65wfUbOWsDm1WVnqyTjRFhH6CPLvPwIvQyAcSZG9RGNM/Vtv9JH7FVVaxsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7WoZQSDYT9j9GdMAcB6WtsqhH1L+dR0RAIRwBNl3dV0bXTBWz
	TW5yT0WYVyv7gJRoHl4LHhu8XJOWwC7DkM/X4AmCzhYEnVE6frkvOHIO
X-Gm-Gg: ASbGncv65iBg7ERGSrdEYtd94Hf99vaTIG4m5WLty2tAlryHcCy23RBSWQCS//8coXP
	4NbbRY+UwEH+8ebME1H3rgpVYKzk1fQ/VqgqSazjpQfoFv50vNhPGbNhgK6BeJ8P+yMoo834Fp0
	Z9BZYjstVT7yqeUx/g5UwMC7BxfWLeKGwdTe0X0pbn/XZ5TPPhK51lSsAGw/+R5HO0sQIsZ2vH3
	UHTtub7eUj71FvVC2h7D7s59549jdWYkVitrYAZVWfggnHLtx3DFdC6WMcWQtRFkZStEcO3CZeg
	O2BDzcPGMFY1ctIkdPuzcyKXLVlxIh7GCPgF+6oEB2fwzJOHtuHOnSZyoff+3Ja7x0G57lm7+Vj
	uxYwpK7haFl9oyoZfnR1gfzXsSWpMGXitA0N0R2IRAw==
X-Google-Smtp-Source: AGHT+IEKeEi/gAby9VnxKw5TgC6XlozkOvfKVx6TrT+v3TIv3VnhHxTOSNY+bluWQN+20xgcwCOhjw==
X-Received: by 2002:a05:6e02:2482:b0:3e4:6c1:74a4 with SMTP id e9e14a558f8ab-3e416190916mr55764455ab.3.1754369308047;
        Mon, 04 Aug 2025 21:48:28 -0700 (PDT)
Date: Mon, 4 Aug 2025 23:48:16 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/2] kern/xen: Add Xen command line parsing
Message-ID: <20250804234816.3d14f53f@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xScQGjvbhehxfi4Rs=kQNRS";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/xScQGjvbhehxfi4Rs=kQNRS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The purpose of this patch is to allow the Xen hypervisor to pass extra
data to GRUB in the form of a kernel command line, allowing the host to
customize the boot process of the guest. The command line from Xen is
parsed, and any variables within that start with the string
`xen_grub_env_` are exposed as environment variables. The grub.cfg
script can then use those environment variables as it sees fit.

The main reason for doing this is to allow implementing boot modes in
Qubes OS while also using in-VM kernels. For more context on Qubes boot
modes, see [1]. In order for this to work with in-VM kernels, it is
necessary for dom0 to pass kernel parameters to the guest without
modifying the guest's grub.cfg manually. This patch allows this to be
done, by allowing dom0 to pass kernel parameters to GRUB, which then
provides them to grub.cfg as an environment variable. The grub.cfg
script within the VM can then append those variables to the kernel
command line.

All of the changes from version 3 of the patch are simply refinements
after a review from Daniel Kiper (coding style cleanups, avoiding
global variables, double-checking NUL-termination after using
grub_strncpy, etc.). The patch's functionality is unchanged.

Since there are substantial changes since version 3, I've re-run the
entire battery of tests that were used against the v3 patch, plus an
extra test to ensure an escaped control character won't be accepted in
variable values. The test results can be seen at [2]. As previously, the
tests were done by booting a patched GRUB in Xen with various different
parameters passed to it via the Xen-provided kernel command line. The
effects of these parameters on the bootloader's environment were then
tested, and then an Arch Linux image was booted to ensure that boot
still worked.

[1] https://github.com/QubesOS/qubes-linux-pvgrub2/pull/16
[2] https://bpa.st/3SBQ

Aaron Rainbolt (2):
  include/xen: Rename MAX_GUEST_CMDLINE to GRUB_XEN_MAX_GUEST_CMDLINE
  kern/xen: Add Xen command line parsing

 docs/grub.texi                |  51 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |  23 +++
 grub-core/kern/xen/cmdline.c  | 376 ++++++++++++++++++++++++++++++++++
 grub-core/kern/xen/init.c     |   2 +
 include/grub/xen.h            |   2 +
 include/xen/xen.h             |   4 +-
 7 files changed, 458 insertions(+), 2 deletions(-)
 create mode 100644 grub-core/kern/xen/cmdline.c

--=20
2.50.1


--Sig_/xScQGjvbhehxfi4Rs=kQNRS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiRjRAACgkQpwkWDXPH
kQmUcQ/+IK73jDnnYdHxMHW5n0qqZPpSkOK1mYaH7o9lzLGngg9ias2SqAML8aw+
Fyi+QQhVd7XRmPjZHe85yyVgEY3NM4WK7+T2PY4LfSAWq5xRKHVtm4mnhSMmXp95
/DPqL4k8Dyj8oVuu861gdSxGk3L8Bq8bW1ttMIxTn9j1A3lKZ7h3//z6aXu+fTgQ
MJuACkFJRGVjMnRXT40AKlRCM36KFktCC+C1r+a8Lh7rHhSzLWf6TbF+0A9Nt8vZ
foLAvqAGlYfLtyi5nCMPdC88VeOcVc2PjymhzCd2MdTc7Wumxhw/xUFsJcoggaZK
Al//2ekOjTjRP/Cirx6KBCe6eId3vk6YOC5HWKrHcFyCdYG3D+4MGXFPL9wQMEyN
c1QLWdIPtBtFXXHLjppX1gsd0Wi9Jt47K1Xr1glzLHs7b++Zhlz+/qtoguPHU74i
ilvAe8E4XRaCDZyFlxQofrfUVpa2OJOLHsoubS35X7DFpcNc+nHMYesDw4L6Bk0P
McjaJ1CAbsxfELJ82ReQajhjTLB10C26EUd+JolR3g6+6fU2L4Aiy+IwQw348Rmc
KKV429earA8F8Pu6UkgKEG8JQJlkbTts0wMs94+5pOslM5rqFqrbi/IDNJXV9e/2
fsU01RHTu4HKB6j8ryDi0Mgo5sPqfkJJJplfxQeaiRpeeo7Txj8=
=k+GH
-----END PGP SIGNATURE-----

--Sig_/xScQGjvbhehxfi4Rs=kQNRS--

