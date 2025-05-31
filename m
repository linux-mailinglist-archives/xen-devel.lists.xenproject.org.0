Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A4AC98DD
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001761.1381975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBGP-000396-CV; Sat, 31 May 2025 01:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001761.1381975; Sat, 31 May 2025 01:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBGP-00036h-9O; Sat, 31 May 2025 01:43:57 +0000
Received: by outflank-mailman (input) for mailman id 1001761;
 Sat, 31 May 2025 00:53:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yfT0=YP=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uLATP-0000DF-3J
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:53:19 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3a6cda4-3db9-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:53:18 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3db83492afaso876685ab.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 17:53:18 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:729:c9c7:4a01:2714:55f9:a90c])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dd935288dbsm10137105ab.8.2025.05.30.17.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 17:53:15 -0700 (PDT)
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
X-Inumbo-ID: a3a6cda4-3db9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748652796; x=1749257596; darn=lists.xenproject.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BbI37kxQG7vp7V0ecTz+o356PMVwkE8qF6C+9oXMa5E=;
        b=l8pc1MCJM9+fVNrV+51VKmKzkPrr0GncAIIgXB3wvbnBuXmY9oZfyrZePZuQkVQUeD
         mTUdawm5xdKCFRsc7jyKNspaN3pbTCZQ2Btt5VT+v38lvfQ9adXdvUL/yd1U7uaTGEPe
         60zZM67Ae68l3l6MaPyR23e6W2PU9o0U/oUcXzFuazmiDby9p/lOJKXQupIo3GKLoyPh
         IvJSxVmB30RhlhwVyZJ6T247YUrE4vR3OH+zqEPn9h55drjUS6HmW60xU4v6Ze5emmxa
         tYp+4cHumw8VCyEqeoZEWRVF/bj3/4V7EG2h+SyWPIzbIv7dX7iHBRZwoLVT/d+sYyXJ
         v75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748652796; x=1749257596;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbI37kxQG7vp7V0ecTz+o356PMVwkE8qF6C+9oXMa5E=;
        b=xBgVpPOLQkdc8oPD15mTrtV0ciaKVmbHTuMJCMxiQP3jxthCaK4oqw7h/34rq5yque
         j9X82YgzGr7lnq2lTydln7ccLSFkP/awV58LcV2oX8ai7afPjBYewR/Bws4GREMQSfB8
         qjjxF3A45ZCsZZFWuZKxA7w0X0l4ZPMwYC6VViFl2yQTkFEjUeoCEjzMOXy5djwmwzNv
         XS/jzytqnN5wnTnebeFsIY2onE1ahSK9eOCSzxYXDEGD4wlE6+Y54rTaRfugcFMk2EJx
         1yxwfL0cBOCEuTDuaA/Wb0xYh9qvFZDQtosu+UVj/KR0xz4qO0LYApDyrbwOX7J4+38X
         NMNA==
X-Gm-Message-State: AOJu0YwpU7Lw1CADmjBqhQva16FDYEZTcFwdVtLiblE+m8e1WHKnVtW9
	kgJDJqNQViiPQNZLjaPFzbCJHKIBldJ5OergPYfr0wSV56QGF4n6+EVX
X-Gm-Gg: ASbGnctfI5nrZhbT3r//td5B9sFAVre6cAufD944lppf5iKutxEkQnIv4QOca7BSLQx
	iX1tAbvNIUfSPcHWbiVjeVT9swu3GMFjCxQL0/S9l0VcXsIlszg+Bw+QlTg4m8W4ahueOTKcin/
	uJ0QaLbc/Tj54acZKx22gwFwiVWH4xy8jhXfNXVeAlGabrKJsywWx5w1togag9Lq8fBZEO6h5RM
	6ADtBxHmUUF/jPQnKJ+Os2x1eYFrCNXvYGDzDmdS+yaQ2r4sddVQrg+2s7W7Q2V9gYEGwHrbqNw
	WuSyT6JHdcklsycPJC7TTZhKXPRc8t37p53GW62efvIpLAVI9h1KwDAa3SI=
X-Google-Smtp-Source: AGHT+IFBp8jvSDh7cqJxttpiA7HS/7CdCn/3Aos/r+reLqDQMP2JD0NugBpqWmHlxR6RaVV0ItgB/A==
X-Received: by 2002:a05:6e02:180a:b0:3d4:6d6f:6e1f with SMTP id e9e14a558f8ab-3dd99ca9400mr17312735ab.6.1748652796488;
        Fri, 30 May 2025 17:53:16 -0700 (PDT)
Date: Fri, 30 May 2025 19:53:06 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org, dkiper@net-space.pl, phcoder@gmail.com
Subject: [PATCH v2 0/1] Xen: Add Xen command line parsing
Message-ID: <20250530195306.41af4199@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Nfny_rgglLe_w6W9jAdx9J";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/9Nfny_rgglLe_w6W9jAdx9J
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

The patch has been tested with both PV and PVH virtual machines, using
an otherwise unpatched GRUB source tree, building the patch on top of
the tip of git master at the time of this writing (commit 73d1c95). My
testing environment is a fully updated Arch Linux system with Xen built
from the stable-4.20 branch.

Changes from the previous version of the patch:

* Added documentation for the future to the GRUB manual.
* Fixed error checking when allocating memory.
* Enhanced coding style, code efficiency, and comments based on Daniel
  Kiper's previous review and my own re-review.
* Added an explicit null termination check on the Xen-provided kernel
  command line before parsing.
* Fixed some memory management issues that could result in unnecessary
  memory consumption (one memory leak and a couple of places where an
  extra byte was allocated that didn't need to be).

The patch has been thoroughly tested by booting a patched GRUB with
various different parameters passed to it via the Xen-provided kernel
command line. The effects of these parameters on the bootloader's
environment were then tested, and then an Arch Linux image was booted
to ensure that boot still worked. The full list of test cases and their
results can be seen at [2] (pastebinned so as to not overload people's
email clients with 185-character-long lines).

[1] https://github.com/QubesOS/qubes-linux-pvgrub2/pull/16
[2] https://bpa.st/Z45A

Aaron Rainbolt (1):
  kern/xen: Add Xen command line parsing

 docs/grub.texi                |  50 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |  14 ++
 grub-core/kern/main.c         |  12 ++
 grub-core/kern/xen/cmdline.c  | 344 ++++++++++++++++++++++++++++++++++
 include/grub/xen.h            |   2 +
 6 files changed, 424 insertions(+)
 create mode 100644 grub-core/kern/xen/cmdline.c

--=20
2.49.0


--Sig_/9Nfny_rgglLe_w6W9jAdx9J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmg6UvIACgkQpwkWDXPH
kQkteA//ZYj9rrDDUrtS9Kt1C5YBArGy51VcG6GAZ6svAqiTdaiXpEDZYXhFC3m8
iBumFWNFxyf2o4Ngk9w3lrE2kIZFRh5ZAkpqxs1BcrAa0QojAcehW7RcVXBGd1GE
CBxJeG1y3rQHZOePHzLfZEpYdlpaDkr5yd/0FsBEYdiWLODsnQxKf99I93rrXtg4
l1NxhUQyXurrSxqVZwa/KZxsx4TOVNIkIQPv6mIRwm4tGYubi+K+6a9/CwQ+l95+
K6/gi9jQyR6F92mLOGT4H4TU+z1QiBOv+p4BbbjLsxbeI4BjHp7LcE4AxZBGerS0
Vxubh+jgrnMmGmejYPK6hE6h8ElneEjfhYpI4Aye3UncSeURwAVHczhOSmwAfg/w
lTBvF18NVIe0AA6chKMmhDFTB7K9a/rmLp8Onm0vDxRvsuR4Q8+CHXmiMvzAAtXZ
iPD8gh9CsSWqdk78J4xUOzv9fg1fzzIx8gi4mrzKfcyaSF+KyECbO1kVxbVxF5Aw
6qw0rbNp67CoqQ2K8jql9en6OxjgGyjfgAeCFwRJ6Btn/nXAr5me3+3gEKFMdhSc
pRhsPw0NeF0QMRC/rJMVPxwyK9G3ziJ/fot6ISIR2libbOAw4e57fiMJ+z6j4kTq
f4RMyl8q+AwqSZH2l2hTZzNrGvM3v1ins6JYErTvK2q014lp8BY=
=wxbL
-----END PGP SIGNATURE-----

--Sig_/9Nfny_rgglLe_w6W9jAdx9J--

