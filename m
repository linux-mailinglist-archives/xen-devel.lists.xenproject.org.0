Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD8ACE950
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 07:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006207.1385399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN37G-0006E4-Rs; Thu, 05 Jun 2025 05:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006207.1385399; Thu, 05 Jun 2025 05:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN37G-0006BC-MG; Thu, 05 Jun 2025 05:26:14 +0000
Received: by outflank-mailman (input) for mailman id 1006207;
 Thu, 05 Jun 2025 05:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjOr=YU=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uN37F-0006B6-MH
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 05:26:13 +0000
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [2607:f8b0:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97dc7793-41cd-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 07:26:12 +0200 (CEST)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3ddc3c70e20so386465ab.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 22:26:12 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:729:c9c7:c3e2:180e:e54f:7b49])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ff1e5aee18sm2684590173.101.2025.06.04.22.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 22:26:10 -0700 (PDT)
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
X-Inumbo-ID: 97dc7793-41cd-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749101171; x=1749705971; darn=lists.xenproject.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T53+ijlXu/Jb/YRepw4rfUkWAWCFRGwzmhGhfqmrkf0=;
        b=np8bzwblFQovFxUw6WhqD82dMPJFKaNnYBz+3nCViyD1+2USIZnbkhPerV3bUzqocW
         mAKgpUW9Gk069+s4TJQsJw2rmHxg3o4IBWGYPgxRnjBEyA8/3OxLq37f4wII17qLzyne
         loZLNz1psQgHlqJxRuSI61xVL15spVE2FcoEQqOVuJCgZ1iGwPzUJSSauJLp1MVz797w
         xZ0wrySSp9v95dND/9hkCSYoL4d4V6giEr2lu0Qzw8LBMVMG8Ve3eswB0SVHb5y9tU/G
         KMxM0oOLqXg9b84qeKDpx3c/xjxvbgCPojBb6FUPm707gKSd0u+/fPE6DkY34mFm0cxI
         o/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101171; x=1749705971;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T53+ijlXu/Jb/YRepw4rfUkWAWCFRGwzmhGhfqmrkf0=;
        b=ejxbKC/Su0i/6AvTGSBZ0RxABNeAlwJtV1X3gq15Qw/2hrzZ4EtW935vhZMrOEy3EU
         d3SKTiARSHQoK9mGzQFVzseDu5j+rbe0ceZKxzioC/N18H237d9VE1zb+dTGXpNa2MRj
         vPsXzhfZBFxeH+bYWCiX97xSAH+v5JIdH3SRv2AQ8wxoQrAVB8/abv2IpcuotW0kcgYr
         JLNUs8hgpUgooefQ349Qa9ptT5TXwOREZX2wbIu3aFvCm60pK4Y1Dw2gU2NP8CgCeNNn
         LtG0GEMpU7OMQixjmH0Qq6nYoaaV5BW5jVG68Go3cVdTeciEbPWkKsZN3rqOT0jUht8G
         FAfg==
X-Gm-Message-State: AOJu0YwNN0vKDC2NGrUefe7I+mRJecum12lByrbjx5n7VHhzHIcaLKZK
	SBdmVHt82YmY1+7SUzEEyP0WdYgJbiMRxknP0tSIawrRjTlQ70jQmJBl
X-Gm-Gg: ASbGncvMI2/BZV4Kvr8JWqM+8WtdcdeCCCkgETzwoR5/2OctM/0dApdrhgZkLkCy/pr
	h9IJLZXNFdYaNlnLHWk0w+gDwPLoL4YG65PifiKo50NJySbPf2fOR3lJyn+RsCTL+npe2y4fxXK
	z0Oo9GVneiCeknKCi2Ru6K3MNsQfu4OMR8t6XC/KckozycxvNUs9HK/UczKOm02wWj6bIbP5seu
	FP7KxRar9A0Ykw/3OWb4pHZLNeKKQZl2gwNrp/AEux0R/BOnx9ff0FmqNMsC2Tn6EDbOoFSonoW
	7SqyUukwgrVMV6C6YRdf2KDM7XrPZtn0ySfpL0hqlvt43Pm1YBcGwpRRyhA=
X-Google-Smtp-Source: AGHT+IEIEssQyYpJAI3uaYnFE/r+RIy7mtvyJO2hCXZ7dYai+czsg/AJDEmrM6oh2w1ZHJoQU/jxZQ==
X-Received: by 2002:a05:6e02:12cc:b0:3dd:b7da:5254 with SMTP id e9e14a558f8ab-3ddbedae965mr16824255ab.7.1749101171227;
        Wed, 04 Jun 2025 22:26:11 -0700 (PDT)
Date: Thu, 5 Jun 2025 00:26:01 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org, daniel.kiper@oracle.com,
 phcoder@gmail.com, marmarek@invisiblethingslab.com
Subject: [PATCH v3 0/1] kern/xen: Add Xen command line parsing
Message-ID: <20250605002601.73a34f9b@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZF=r=FsOwGehNJsxTrAMV2o";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/ZF=r=FsOwGehNJsxTrAMV2o
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
the tip of git master at the time of this writing (commit 438f055). My
testing environment is a fully updated Arch Linux system with Xen built
from the stable-4.20 branch.

Changes from the previous version of the patch:

* Implemented changes suggested by Marek from Invisible Things Lab, who
  reviewed an earlier version of the patch. Specifically:
  * Added minor optimizations (avoided needlessly calling grub_strlen
    in a loop, got rid of an unneeded variable, removed a redundant
    string length check)
  * Made a couple of bit setting and unsetting operations in the parser
    more readable
  * Removed a superfluous extra NUL terminator from a string literal

The patch has been thoroughly tested by booting a patched GRUB with
various different parameters passed to it via the Xen-provided kernel
command line. The effects of these parameters on the bootloader's
environment were then tested, and then an Arch Linux image was booted
to ensure that boot still worked. The full list of test cases and their
results can be seen at [2] (pastebinned so as to not overload people's
email clients with 185-character-long lines). This is the same test
suite used for version 2 of the patch.

[1] https://github.com/QubesOS/qubes-linux-pvgrub2/pull/16
[2] https://bpa.st/5C7A

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
2.49.0


--Sig_/ZF=r=FsOwGehNJsxTrAMV2o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmhBKmkACgkQpwkWDXPH
kQnGvQ//SdvF1dnEEjK7Y9/lSyC91a1q7JWPyHSodauHeEmHBz8X5JcvAhJB3eRz
7QVGnAa4cLeXAZtumPcxlFbHyBFVgRvSdoOMYNu02GB7kTWg/71tHVGZKgDDgjSi
t7CNevsaKDy6BymJlMq8bLjbodxgE5qZ14kQ3SwPdQcSVRIpzSggTOOe1sIvYoWr
B0/8mc67e3Lk4U7MtvcuG0PeBVRR64hxzjY/rxvqfyUUs9sYIVVNHiab2FWmvsmP
sF3uTyYW4kuQjK3rpgmuQf2n8jGB8rD4TMoa6TkW5j+zw6a87ZeoeoxNcKW1HYzY
QNEuQglgIK2lVX0ozWEqpUKK4EliSP1sylZFxfZETvvZZf3FkRddgpQ+O07l9V/j
piMH5qjIslEK99uOQ3ZrqFfqhG7zLPekO1H8B5YhOcyjIw2p50HNMzaP5UkUyQJ1
Fx1p1n3JxRP/000gUfizisWZSxLNlYYuKok/dLgpWqudp3BqLjkixhFpDioADVgR
KAqzo9Iync/AzIgP/A+Wy8Y+3vx2mDEMGgvTJsS8Q1+XP6FMQVACuF8lx/8TBBAb
QyIep0+a3YkNbhfTMsKvnNY9gHFh+JOuMO+88z1VRlUkZAA9sSsj+qq60Eno6Zlo
t5LVgs06I7VHhTdmhXdz1mhBgaOSSEt4QT3+VAuCVSecBhB3q0g=
=lgoW
-----END PGP SIGNATURE-----

--Sig_/ZF=r=FsOwGehNJsxTrAMV2o--

