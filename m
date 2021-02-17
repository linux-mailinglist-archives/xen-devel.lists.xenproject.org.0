Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B031E54C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 06:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86430.162413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCbYZ-0002PA-5I; Thu, 18 Feb 2021 05:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86430.162413; Thu, 18 Feb 2021 05:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCbYZ-0002Ol-1p; Thu, 18 Feb 2021 05:08:51 +0000
Received: by outflank-mailman (input) for mailman id 86430;
 Wed, 17 Feb 2021 20:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0xF/=HT=redhat.com=crosa@srs-us1.protection.inumbo.net>)
 id 1lCTj2-00022J-Lb
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 20:47:08 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c3272381-f90d-4553-b4c5-433c72b31c0a;
 Wed, 17 Feb 2021 20:47:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-fQu7eeJtN0CedJ2OgkwHOQ-1; Wed, 17 Feb 2021 15:47:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC95C801965;
 Wed, 17 Feb 2021 20:47:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8796060F;
 Wed, 17 Feb 2021 20:46:56 +0000 (UTC)
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
X-Inumbo-ID: c3272381-f90d-4553-b4c5-433c72b31c0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613594826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pnqM8mef723a/lVpNQvs8vnov3IYns0l6DZWn5GscnM=;
	b=BJNjfxznCHtuA4XzkyezbA0wbIvqUglLNYhzCUInyJLcroqtRbzEahWuoscszQ4JGKqlbz
	Du114Vi0ERrXp3CIO+NQeSA2M27VzDPcrqmC1ZUu/vKxyt1mfNvwgEX8tQJZ8xWuLOfedP
	0V2hjIXe0CqtTRZh7hzVWzOyiPZ2xG4=
X-MC-Unique: fQu7eeJtN0CedJ2OgkwHOQ-1
Date: Wed, 17 Feb 2021 15:46:54 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, julien@xen.org, andre.przywara@arm.com,
	stefano.stabellini@linaro.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
	stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Message-ID: <20210217204654.GA353754@localhost.localdomain>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210211171945.18313-8-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 05:19:45PM +0000, Alex Benn=E9e wrote:
> These tests make sure we can boot the Xen hypervisor with a Dom0
> kernel using the guest-loader. We currently have to use a kernel I
> built myself because there are issues using the Debian kernel images.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  MAINTAINERS                  |   1 +
>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 tests/acceptance/boot_xen.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 853f174fcf..537ca7a6f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1998,6 +1998,7 @@ M: Alex Benn=E9e <alex.bennee@linaro.org>
>  S: Maintained
>  F: hw/core/guest-loader.c
>  F: docs/system/guest-loader.rst
> +F: tests/acceptance/boot_xen.py
> =20
>  Intel Hexadecimal Object File Loader
>  M: Su Hang <suhang16@mails.ucas.ac.cn>
> diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
> new file mode 100644
> index 0000000000..8c7e091d40
> --- /dev/null
> +++ b/tests/acceptance/boot_xen.py
> @@ -0,0 +1,117 @@
> +# Functional test that boots a Xen hypervisor with a domU kernel and
> +# checks the console output is vaguely sane .
> +#
> +# Copyright (c) 2020 Linaro
> +#
> +# Author:
> +#  Alex Benn=E9e <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +
> +from avocado import skipIf
> +from avocado_qemu import wait_for_console_pattern
> +from boot_linux_console import LinuxKernelTest
> +
> +
> +class BootXenBase(LinuxKernelTest):
> +    """
> +    Boots a Xen hypervisor with a Linux DomU kernel.
> +    """
> +
> +    timeout =3D 90
> +    XEN_COMMON_COMMAND_LINE =3D 'dom0_mem=3D128M loglvl=3Dall guest_logl=
vl=3Dall'
> +
> +    def fetch_guest_kernel(self):
> +        # Using my own built kernel - which works
> +        kernel_url =3D ('https://fileserver.linaro.org/'
> +                      's/JSsewXGZ6mqxPr5/download?path=3D%2F&files=3D'
> +                      'linux-5.9.9-arm64-ajb')
> +        kernel_sha1 =3D '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
> +        kernel_path =3D self.fetch_asset(kernel_url,
> +                                       asset_hash=3Dkernel_sha1)
> +
> +        return kernel_path
> +
> +    def launch_xen(self, xen_path):
> +        """
> +        Launch Xen with a dom0 guest kernel
> +        """
> +        self.log.info("launch with xen_path: %s", xen_path)
> +        kernel_path =3D self.fetch_guest_kernel()
> +
> +        self.vm.set_console()
> +
> +        xen_command_line =3D self.XEN_COMMON_COMMAND_LINE
> +        self.vm.add_args('-machine', 'virtualization=3Don',
> +                         '-cpu', 'cortex-a57',
> +                         '-m', '768',
> +                         '-kernel', xen_path,
> +                         '-append', xen_command_line,
> +                         '-device',
> +                         "guest-loader,addr=3D0x47000000,kernel=3D%s,boo=
targs=3Dconsole=3Dhvc0"

Nitpick/OCD: single quotes to match all other args?

> +                         % (kernel_path))
> +
> +        self.vm.launch()
> +
> +        console_pattern =3D 'VFS: Cannot open root device'
> +        wait_for_console_pattern(self, console_pattern, "Panic on CPU 0:=
")
> +
> +
> +class BootXen(BootXenBase):
> +
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    def test_arm64_xen_411_and_dom0(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Daccel:tcg
> +        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        xen_url =3D ('https://deb.debian.org/debian/'
> +                   'pool/main/x/xen/'
> +                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_ar=
m64.deb')
> +        xen_sha1 =3D '034e634d4416adbad1212d59b62bccdcda63e62a'

This URL is already giving 404s because of a new pacakge.  I found
this to work (but yeah, won't probably last long):

        xen_url =3D ('http://deb.debian.org/debian/'
                   'pool/main/x/xen/'
                   'xen-hypervisor-4.11-arm64_4.11.4+57-g41a822c392-2_arm64=
.deb')
        xen_sha1 =3D 'b5a6810fc67fd50fa36afdfdfe88ce3153dd3a55'

> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm6=
4")
> +
> +        self.launch_xen(xen_path)
> +
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    def test_arm64_xen_414_and_dom0(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Daccel:tcg
> +        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        xen_url =3D ('https://deb.debian.org/debian/'
> +                   'pool/main/x/xen/'
> +                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_ar=
m64.deb')
> +        xen_sha1 =3D 'b9d209dd689ed2b393e625303a225badefec1160'

Likewise here:

        xen_url =3D ('https://deb.debian.org/debian/'
                   'pool/main/x/xen/'
                   'xen-hypervisor-4.14-arm64_4.14.0+88-g1d1d1f5391-2_arm64=
.deb')
        xen_sha1 =3D 'f316049beaadd50482644e4955c4cdd63e3a07d5'

> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm6=
4")
> +
> +        self.launch_xen(xen_path)
> +
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +    def test_arm64_xen_415_and_dom0(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Daccel:tcg
> +        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dmachine:virt
> +        """
> +
> +        xen_url =3D ('https://fileserver.linaro.org/'
> +                   's/JSsewXGZ6mqxPr5/download'
> +                   '?path=3D%2F&files=3Dxen-upstream-4.15-unstable.deb')
> +        xen_sha1 =3D 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.15-unst=
able")
> +
> +        self.launch_xen(xen_path)
> --=20
> 2.20.1
>=20
>=20

With those changes,

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAtgLMACgkQZX6NM6Xy
CfOLJg/+LdIhvsNQD1wFhsh5OXvvTm8SLwTvFcM7YOiCeOLsOC6LGpTQyedugWAb
OLw5aib6qidCrOK+pjV+tISOw0hTJ0H28GVAyT/Y9AGsCNtu2xxAOw4jt1jJRrl3
JIYwoPfl4EWCnHGTobb1ZvHPfK6sumasHrZkZNujaKFKi3DZfIY7rtl+nHLdU5B8
OUd5lNcG0N1BBcLJJ8bZKhG8LdBfZrSIdwRekiyHjK/8udQ+gC9q64xVxerjjaT6
q76GFkUJT5rci+D5BOIaSDqlaDOwm+wKoFSYSa1syBx4ZvGcWHnxFBnDmWkwERTh
FJ8T/0EYGiNIlZvyFW4w0aPOGOyCvcOkc+kdKEP6q5JkJ7+44Ja76HA4fAodFgGe
uvDPfLOO930y7Co9Haudbd05NjAhWQSJG3hVZ2wkZ+QAnVzpvsAW5jKrhASMQvKH
N/mSMnR2a8nGVCvOvVDfjK6Kx/hPYvl3cxjqIqOs/JFXaIDUG+e/uGijz841L54T
KYVM/7tHLdzeasdW/kJLEApFlUJVdBJnl9CQd8vApEeW6GEuU3WqvxWoaJK51sCr
QiVgKxR2Byv1RadtLg8uj0NhpfJC3EEbnLqHeZHnhiZ7X62gvtg3am8osBIMFH2V
EnCZ/0LU2ut5yPAA/rALG+Kk/yMqvgBfNCKU4pGzWKXjz6X0u0w=
=sLVe
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--


