Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467E31E205
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 23:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86445.162303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCVEu-00039m-QW; Wed, 17 Feb 2021 22:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86445.162303; Wed, 17 Feb 2021 22:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCVEu-00039N-NM; Wed, 17 Feb 2021 22:24:08 +0000
Received: by outflank-mailman (input) for mailman id 86445;
 Wed, 17 Feb 2021 22:24:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYKF=HT=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lCVEt-00039I-BK
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 22:24:07 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e699e8ee-2c96-4371-9f50-e39a183f86ea;
 Wed, 17 Feb 2021 22:24:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n4so286610wrx.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 14:24:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm5526509wrv.83.2021.02.17.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 14:24:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 583D51FF7E;
 Wed, 17 Feb 2021 22:24:03 +0000 (GMT)
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
X-Inumbo-ID: e699e8ee-2c96-4371-9f50-e39a183f86ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=UBErDwxItRQDaQKbAHMCfrEjjIOCFPLlsoGBCNNVrxc=;
        b=dHVoXOEhkEQmqkxhT1z9RJDaL3PKUPKjab59XnBq+VAabO0DBXbi6J6gE3yWhZG0O9
         O4Z8HNEn+spF9oAtjqGOyFzymowEkimnrfehoc1B1DMs1OXoRPeJSMsE+ktV+nlPuzfe
         f82zgsatGikwu+U9h5iQCza80bsmYxienCH/LsZaUiqHvK8kp6In4Z0beWPK3abQyT9C
         w0CLqfxBzVJRmJIIXGxhuVHqMXjGB3I2m9a4YMXTpQBLpIKPh++Ei6x9oZCjSObqS671
         nyyAAiEsbmasyWY7A9bVH1PLFdJql5yGJ0rgFCpOBuYoTgABeTmRI5H5VmVtRMbFiKIK
         6BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=UBErDwxItRQDaQKbAHMCfrEjjIOCFPLlsoGBCNNVrxc=;
        b=JubkAlXrHJ6SWoAD0V/vDmwjno29lsh/YFrMh53RhIQAircSEo6+oMv04hhpYo5p9o
         h7+4lN30tasiMLSr5V7b7qI6cFocdgzvDIzYh84TF0VYSPoPL242Is2WjhCkQ6J9mdo9
         WTihtPTVxGmSLRWUjJHJVZlJK6QsrwYfrl4s38DWNfwL3hEZbN1GgzCFHUsXhkJld1Cr
         YdS9VfsmSMQExP//sy9oGNUhCvDNO3H7555rYBZTVsqK0FJInZ9x5HXeyXGmBg4O4Gr7
         MF/TJhy9GhOA29AuYgpjkf6jSWiQ8oQ5Cuar1qNMolmoAF3fFx0jBjjCBz6zjxqcWv+l
         Sy1w==
X-Gm-Message-State: AOAM533Ri0/O6Hz2nZP22BYfRXHwMyVlQ82tQVkbOOQ2YDpcS3wbmS+r
	9wVrqux87s+/zxdnyGHl+3s0rQ==
X-Google-Smtp-Source: ABdhPJwv23fB+ttVoJXnMOjEDxGHSwBNNyZx5lUAwYZzR2vi+hrXJ0Dh3JQH0hBHHsnpt0xkUXTEbw==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr1291969wrw.298.1613600645220;
        Wed, 17 Feb 2021 14:24:05 -0800 (PST)
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, julien@xen.org, andre.przywara@arm.com,
 stefano.stabellini@linaro.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Date: Wed, 17 Feb 2021 22:22:50 +0000
In-reply-to: <20210217204654.GA353754@localhost.localdomain>
Message-ID: <87sg5us58c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Cleber Rosa <crosa@redhat.com> writes:

> On Thu, Feb 11, 2021 at 05:19:45PM +0000, Alex Benn=C3=A9e wrote:
>> These tests make sure we can boot the Xen hypervisor with a Dom0
>> kernel using the guest-loader. We currently have to use a kernel I
>> built myself because there are issues using the Debian kernel images.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  MAINTAINERS                  |   1 +
>>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 118 insertions(+)
>>  create mode 100644 tests/acceptance/boot_xen.py
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 853f174fcf..537ca7a6f3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1998,6 +1998,7 @@ M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>  S: Maintained
>>  F: hw/core/guest-loader.c
>>  F: docs/system/guest-loader.rst
>> +F: tests/acceptance/boot_xen.py
>>=20=20
>>  Intel Hexadecimal Object File Loader
>>  M: Su Hang <suhang16@mails.ucas.ac.cn>
>> diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
>> new file mode 100644
>> index 0000000000..8c7e091d40
>> --- /dev/null
>> +++ b/tests/acceptance/boot_xen.py
>> @@ -0,0 +1,117 @@
>> +# Functional test that boots a Xen hypervisor with a domU kernel and
>> +# checks the console output is vaguely sane .
>> +#
>> +# Copyright (c) 2020 Linaro
>> +#
>> +# Author:
>> +#  Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import os
>> +
>> +from avocado import skipIf
>> +from avocado_qemu import wait_for_console_pattern
>> +from boot_linux_console import LinuxKernelTest
>> +
>> +
>> +class BootXenBase(LinuxKernelTest):
>> +    """
>> +    Boots a Xen hypervisor with a Linux DomU kernel.
>> +    """
>> +
>> +    timeout =3D 90
>> +    XEN_COMMON_COMMAND_LINE =3D 'dom0_mem=3D128M loglvl=3Dall guest_log=
lvl=3Dall'
>> +
>> +    def fetch_guest_kernel(self):
>> +        # Using my own built kernel - which works
>> +        kernel_url =3D ('https://fileserver.linaro.org/'
>> +                      's/JSsewXGZ6mqxPr5/download?path=3D%2F&files=3D'
>> +                      'linux-5.9.9-arm64-ajb')
>> +        kernel_sha1 =3D '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
>> +        kernel_path =3D self.fetch_asset(kernel_url,
>> +                                       asset_hash=3Dkernel_sha1)
>> +
>> +        return kernel_path
>> +
>> +    def launch_xen(self, xen_path):
>> +        """
>> +        Launch Xen with a dom0 guest kernel
>> +        """
>> +        self.log.info("launch with xen_path: %s", xen_path)
>> +        kernel_path =3D self.fetch_guest_kernel()
>> +
>> +        self.vm.set_console()
>> +
>> +        xen_command_line =3D self.XEN_COMMON_COMMAND_LINE
>> +        self.vm.add_args('-machine', 'virtualization=3Don',
>> +                         '-cpu', 'cortex-a57',
>> +                         '-m', '768',
>> +                         '-kernel', xen_path,
>> +                         '-append', xen_command_line,
>> +                         '-device',
>> +                         "guest-loader,addr=3D0x47000000,kernel=3D%s,bo=
otargs=3Dconsole=3Dhvc0"
>
> Nitpick/OCD: single quotes to match all other args?
>
>> +                         % (kernel_path))
>> +
>> +        self.vm.launch()
>> +
>> +        console_pattern =3D 'VFS: Cannot open root device'
>> +        wait_for_console_pattern(self, console_pattern, "Panic on CPU 0=
:")
>> +
>> +
>> +class BootXen(BootXenBase):
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_411_and_dom0(self):
>> +        """
>> +        :avocado: tags=3Darch:aarch64
>> +        :avocado: tags=3Daccel:tcg
>> +        :avocado: tags=3Dcpu:cortex-a57
>> +        :avocado: tags=3Dmachine:virt
>> +        """
>> +        xen_url =3D ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_a=
rm64.deb')
>> +        xen_sha1 =3D '034e634d4416adbad1212d59b62bccdcda63e62a'
>
> This URL is already giving 404s because of a new pacakge.  I found
> this to work (but yeah, won't probably last long):
>
>         xen_url =3D ('http://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.11-arm64_4.11.4+57-g41a822c392-2_arm=
64.deb')
>         xen_sha1 =3D 'b5a6810fc67fd50fa36afdfdfe88ce3153dd3a55'

I think the solution is to use archive links here. There is a snapshot
archive of sid (we've used it in the past) but I suspect there isn't an
archive of old stable packages for a reason.

>
>> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
>> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm=
64")
>> +
>> +        self.launch_xen(xen_path)
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_414_and_dom0(self):
>> +        """
>> +        :avocado: tags=3Darch:aarch64
>> +        :avocado: tags=3Daccel:tcg
>> +        :avocado: tags=3Dcpu:cortex-a57
>> +        :avocado: tags=3Dmachine:virt
>> +        """
>> +        xen_url =3D ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_a=
rm64.deb')
>> +        xen_sha1 =3D 'b9d209dd689ed2b393e625303a225badefec1160'
>
> Likewise here:
>
>         xen_url =3D ('https://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.14-arm64_4.14.0+88-g1d1d1f5391-2_arm=
64.deb')
>         xen_sha1 =3D 'f316049beaadd50482644e4955c4cdd63e3a07d5'
>
>> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
>> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm=
64")
>> +
>> +        self.launch_xen(xen_path)
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_415_and_dom0(self):
>> +        """
>> +        :avocado: tags=3Darch:aarch64
>> +        :avocado: tags=3Daccel:tcg
>> +        :avocado: tags=3Dcpu:cortex-a57
>> +        :avocado: tags=3Dmachine:virt
>> +        """
>> +
>> +        xen_url =3D ('https://fileserver.linaro.org/'
>> +                   's/JSsewXGZ6mqxPr5/download'
>> +                   '?path=3D%2F&files=3Dxen-upstream-4.15-unstable.deb')
>> +        xen_sha1 =3D 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
>> +        xen_deb =3D self.fetch_asset(xen_url, asset_hash=3Dxen_sha1)
>> +        xen_path =3D self.extract_from_deb(xen_deb, "/boot/xen-4.15-uns=
table")
>> +
>> +        self.launch_xen(xen_path)
>> --=20
>> 2.20.1
>>=20
>>=20
>
> With those changes,
>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>


--=20
Alex Benn=C3=A9e

