Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B62BB12572
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 22:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058491.1426043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufP3c-0004pN-IE; Fri, 25 Jul 2025 20:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058491.1426043; Fri, 25 Jul 2025 20:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufP3c-0004mq-Fa; Fri, 25 Jul 2025 20:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1058491;
 Fri, 25 Jul 2025 20:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiiL=2G=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1ufP3b-0004mk-C7
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 20:30:19 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ccf9333-6996-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 22:30:17 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3e277338149so1770065ab.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 13:30:17 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb90:bf84:45ad:8504:c1a1:d950:5158])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-508c91eee93sm154601173.41.2025.07.25.13.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 13:30:15 -0700 (PDT)
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
X-Inumbo-ID: 2ccf9333-6996-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753475416; x=1754080216; darn=lists.xenproject.org;
        h=mime-version:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oqaMcs5iOX0NzJqohXywTLlJDbwGQ+nZMcYiP57zthI=;
        b=ZaxMGGUAk9fxYo+EUwQO9Hm6kGhvajV+Z4vY9w4jmMrVeVWW18al2BUSxDkifpEip+
         9cNEryyvPpwvIFKuKpXBAqiMHEwGFNK2PRLsKaFJZ24v/rDP2WXffoBI4qqvNvSmPCWu
         bgSmvrM3dmRfDD46bcKlss8+jLYeIgSBiFYXeuhghRQVbhaExK+WWWvoROEK3UxKqWTT
         9wXyj4aBdi+QjUDQrkZK5lXSYvt58lyDU4ORxD03M2/FfuNnad43YUW79E3VP2plLkYU
         blOGj2TgKd0Brzt6QKNG9D4rsCc3QDI3toPzIIZknpmjrNbKeetj0KKQiwcoe1MsAl8D
         YrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753475416; x=1754080216;
        h=mime-version:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqaMcs5iOX0NzJqohXywTLlJDbwGQ+nZMcYiP57zthI=;
        b=LMU9muhO0ppNJguK5Iwe8trst8s+tgp5qceGATu+NFHumjLD4IiLqyf2LfyzbNnlN4
         AfRzYjiyLcdIQC1bFnRP0QAHeIYQ1+FQ2BCmYVuhmGhI/qMULpo2LNU083ucvhXigCP4
         SSX3Ql24BlUb1ZO3LskXFeDJMqadElWs+Fh1S25JgXINjayRjxhj4K9rYqD4FuMazv0/
         nYNF5Za4yxBuBhr3aqABPra+AWQOvSoY0v3fbqvvUOBEQSN+R7gIngZGs4RvtvjFhAYS
         QQ0o6L7iCS2QnuPGEQH2PaKPMyNIAOjYD86Ula5qhpS2eHBB72epuS2dyZb6YL9E6qYQ
         S1WA==
X-Forwarded-Encrypted: i=1; AJvYcCUiVggypHKiH9zuemce1eDwTMu5F2yGobPP8d6n6ekQuSffIBTSIBSsC1uyVwiu/W583AaWO56esko=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydsADX8Lf3vSKvurHpJT4Fd5M5yGRivkwMLemspBqVjACocKbc
	KFXV4j/m38ftz++80rVf3I6GnwxOiB5TvQEtqFYfi9bVICc5usyRGGkd
X-Gm-Gg: ASbGncsL+l0vvhchcN18bTunwFnHw7YdybqD2aKy709mSR4yHOraHaLJPZ0+Ol8efmp
	Tv4OHnZDoF92B9cWYKOsC73eibxuDaq/Q1koRJHVpG9Q35VbmVUQOGDF/GpBnTTAas0gawc0G+m
	lREsAFs9Z708NED7OVklMv1ZthB3tG6sF5AEv5RYSvxd3NBfSfQJH3dRSbkEq+ah23I9yCS6c5S
	WaDOY8hN9a0gCK8qQwbbifg/v2pKHwDApxJY4ahMNm61H5ZCdFgkP5XzEr+C0OLUIbGKUbd1aFr
	WhlofQnLXL+dVlcvGUObL8XfLxJ/8XZMLHxll52zx7wXKjvPHD+Sxsl9baXxqs37FR13qHwaE+H
	Wf6+90pfJb87LHJUqxOz9Fouyvpx+gAY=
X-Google-Smtp-Source: AGHT+IHGeygkzLv1ex4eHWHMtapnWUCOGMLge/XnNnreDNkl39LsMVatIoJqd+ARYJBMW4JbiEGhmg==
X-Received: by 2002:a05:6e02:b28:b0:3e2:9030:47f7 with SMTP id e9e14a558f8ab-3e3c5302ffdmr13115095ab.6.1753475415825;
        Fri, 25 Jul 2025 13:30:15 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:30:12 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: [RESEND PATCH v3 0/1] kern/xen: Add Xen command line parsing
Message-ID: <20250725153012.1dd46644@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yhNPXsFvd_x=KLjPONaqPpe";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/yhNPXsFvd_x=KLjPONaqPpe
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

The patch's code is unchanged from the last time I sent it [2], I've
simply rebased it on top of the latest commit at the time of this
writing (0e36779). I have not run it through the full test suite used
previously, but I have ensured that both PV and PVH bootloaders build
successfully and can boot an Arch Linux virtual machine on an Arch
Linux host.

Changes from the version 2 of the patch:

* Added documentation for the future to the GRUB manual.
* Fixed error checking when allocating memory.
* Enhanced coding style, code efficiency, and comments based on Daniel
  Kiper's previous review and my own re-review.
* Added an explicit null termination check on the Xen-provided kernel
  command line before parsing.
* Fixed some memory management issues that could result in unnecessary
  memory consumption (one memory leak and a couple of places where an
  extra byte was allocated that didn't need to be).

[1] https://github.com/QubesOS/qubes-linux-pvgrub2/pull/16
[2] https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00011.html

Aaron Rainbolt (1):
  kern/xen: Add Xen command line parsing

 docs/grub.texi                |  50 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |  14 ++
 grub-core/kern/main.c         |  12 ++
 grub-core/kern/xen/cmdline.c  | 343 ++++++++++++++++++++++++++++++++++
 include/grub/xen.h            |   2 +
 6 files changed, 423 insertions(+)
 create mode 100644 grub-core/kern/xen/cmdline.c

--=20
2.50.1


--Sig_/yhNPXsFvd_x=KLjPONaqPpe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiD6VQACgkQpwkWDXPH
kQnzIA//ZPx3c3NB3ZLxCWuOSviRAJESdifZGn8zcMxl5nMvgX1XgFetp5ipL66f
xkaDHBqtEAtI93I3Ewpc2SduU4YJg407idHKeOdq5W5qrfYG4uu9qmXu0IkrwZXi
qh98Ui+BzXud1BhTsi4SXPTgeRq+duHV8kyljZrWYsiDcpTDvloKZMtT6M7R+Fym
28j074OrCs1O0MOU+5skJcW1tjpS+zepgg5YGYRAnECXQy1Y8mbYREkvCCDwn3Ax
2hIsHsSPXjJn5XUZ6VrbKxhWKFhwAAiydb9MnhAcJ564oi8mkJE3g6VAVTZlIu0s
hGORrXRIiE+O/ga6Ju3//khksyUqiH5QiE2D5qE2mkDBft6Wexfz18qDYTDXKLiW
qErP5ro1Eqvmbm0Lidfc5d7XPHZOj2sXdVsU3EuaFOXIVedXFys4bCYLyvcjaVNL
O2BtBNlZ8RXM4tZfEVu9AbBvciuLgmpn0/tUtsTRMWUM5Gvlr+v+JVsEK5U5x6TR
w57FIPQSx7dQtZs6K8Xjj8lvBovbr0tJiR13cEybt48Sn0+Afbgxmo6x1hySCVzQ
PXemCcCUiWrpGFXfSv3fDOi3ec7ujuohIRN8JPPI2j+C9fe1PBjAGhKIeGKRGoIA
zQbj54MYhIoPFGLdToURUFTy6ewIx2mzBEeJXafJzHyZksYB3jA=
=jtKx
-----END PGP SIGNATURE-----

--Sig_/yhNPXsFvd_x=KLjPONaqPpe--

