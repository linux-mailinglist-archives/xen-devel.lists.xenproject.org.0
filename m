Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F26EDA6B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 05:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525705.817051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr8wD-00069t-1h; Tue, 25 Apr 2023 03:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525705.817051; Tue, 25 Apr 2023 03:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr8wC-00067e-VG; Tue, 25 Apr 2023 03:01:52 +0000
Received: by outflank-mailman (input) for mailman id 525705;
 Tue, 25 Apr 2023 03:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr8wC-00067U-2E
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 03:01:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85d265a4-e315-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 05:01:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6079062086;
 Tue, 25 Apr 2023 03:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1379EC433D2;
 Tue, 25 Apr 2023 03:01:47 +0000 (UTC)
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
X-Inumbo-ID: 85d265a4-e315-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682391708;
	bh=uSCcKvz0LNOXa/OJdwnoYYZ6X+aEYAiIBlARA18YdrY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FBWTKohnBRYco4Ht9zef7fePIiDpc8+Qf6g7tmBD3D3uyoKfBdVsakGYliJJ/+eAN
	 NFDrTZHkTibWrbRKtJplBWaMS/f9UQ4wPHJ6fgLH/hbFnzWHy9gz/EMWw8iO6V9BLf
	 6aZJzG87pcHf1SHrHQ/3uDX8ZfcrSSHsKOa/NW08MB4Bs0UZnoUOk42zNmQEDkHGW6
	 8SpafsbNJpUU//ezHNz/Qx8oR3GVVNkHfAiSKkwshWEgBmI/yWswmBvD0TOZpKtwAn
	 cdd64ERALaR5y/fnXgNKUaQ2PEFH3DsJRpF+U6x/ENbngIweefvzmBCNACVGy2PUPb
	 Xqod+KwT+fkmg==
Date: Mon, 24 Apr 2023 20:01:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 5/6] automation: PCI passthrough tests on ADL hw
In-Reply-To: <b01494665d1a8cce5c426be70beca2c519215eca.1682369736.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304241717510.3419@ubuntu-linux-20-04-desktop>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com> <b01494665d1a8cce5c426be70beca2c519215eca.1682369736.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-879240808-1682381878=:3419"
Content-ID: <alpine.DEB.2.22.394.2304241722140.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-879240808-1682381878=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304241722141.3419@ubuntu-linux-20-04-desktop>

On Mon, 24 Apr 2023, Marek Marczykowski-Górecki wrote:
> Add simple PCI passthrough test to both PV and HVM domU. It passes
> through a network adapter (the only one in the system), gets an IP via
> DHCP (first basic test) and then ping the gateway (second basic test).
> Finally, if device is supposed to use MSI or MSI-X (as set in the
> PCIDEV_INTR test variable), check if it's in use via /proc/interrupts.
> 
> On the current runner, the device in question is this:
> 03:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I225-V [8086:15f3] (rev 03)
> 	Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:7d25]
> 	Flags: bus master, fast devsel, latency 0, IRQ 18
> 	Memory at 50400000 (32-bit, non-prefetchable) [size=1M]
> 	Memory at 50500000 (32-bit, non-prefetchable) [size=16K]
> 	Capabilities: [40] Power Management version 3
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
> 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
> 	Capabilities: [a0] Express Endpoint, MSI 00
> 	Capabilities: [100] Advanced Error Reporting
> 	Capabilities: [140] Device Serial Number ...
> 	Capabilities: [1c0] Latency Tolerance Reporting
> 	Capabilities: [1f0] Precision Time Measurement
> 	Capabilities: [1e0] L1 PM Substates
> 	Kernel driver in use: igc
> 	Kernel modules: igc
> 
> With the current Xen version, it uses MSI-X under PV and MSI under HVM.
> 
> This patch moves domU config to a variable, to make it configurable on
> per-test basis. Add also a few comments for visual separation of tests.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/gitlab-ci/test.yaml     | 20 ++++++++-
>  automation/scripts/qubes-x86-64.sh | 80 ++++++++++++++++++++++++++-----
>  2 files changed, 89 insertions(+), 11 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d68c584269dd..1ce083e6cd88 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -94,6 +94,8 @@
>      # the test controller runs on RPi4
>      CONTAINER: alpine:3.12-arm64v8
>      LOGFILE: smoke-test.log
> +    PCIDEV: "03:00.0"
> +    PCIDEV_INTR: "MSI-X"

This is minor but I would move PCIDEV_INTR to
adl-pci-pv-x86-64-gcc-debug given that adl-pci-hvm-x86-64-gcc-debug
already redefines it.

I would also move PCIDEV to adl-pci-pv-x86-64-gcc-debug and
adl-pci-hvm-x86-64-gcc-debug, but I am fine either way.

However the two new tests failed for me:

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/847157948


+ grep '^Welcome to Alpine Linux' smoke.serial
+ '[' 0 -le 0 ]
+ '[' 0 -le 0 ]
+ echo 'ERROR: test timeout, aborting'
ERROR: test timeout, aborting

The Welcome to Alpine Linux message is missing


>    artifacts:
>      paths:
>        - smoke.serial
> @@ -147,6 +149,24 @@ adl-suspend-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.12-gcc-debug
>  
> +adl-pci-pv-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
> +adl-pci-hvm-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  variables:
> +    PCIDEV_INTR: "MSI"
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index c0bc71764f73..6442f7dda515 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -4,8 +4,21 @@ set -ex
>  
>  test_variant=$1
>  
> +### defaults
>  wait_and_wakeup=
>  timeout=120
> +domU_config='
> +type = "pvh"
> +name = "domU"
> +kernel = "/boot/vmlinuz"
> +ramdisk = "/boot/initrd-domU"
> +extra = "root=/dev/ram0 console=hvc0"
> +memory = 512
> +vif = [ "bridge=xenbr0", ]
> +disk = [ ]
> +'
> +
> +### test: smoke test
>  if [ -z "${test_variant}" ]; then
>      passed="ping test passed"
>      domU_check="
> @@ -23,6 +36,8 @@ done
>  tail -n 100 /var/log/xen/console/guest-domU.log
>  echo \"${passed}\"
>  "
> +
> +### test: S3
>  elif [ "${test_variant}" = "s3" ]; then
>      passed="suspend test passed"
>      wait_and_wakeup="started, suspending"
> @@ -48,6 +63,59 @@ xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
>  ping -c 10 192.168.0.2 || exit 1
>  echo \"${passed}\"
>  "
> +
> +### test: pci-pv, pci-hvm
> +elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
> +
> +    if [ -z "$PCIDEV" ]; then
> +        echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
> +        echo "Optionally set also 'PCIDEV_INTR' to 'MSI' or 'MSI-X'" >&2
> +        exit 1
> +    fi
> +
> +    passed="pci test passed"
> +
> +    domU_config='
> +type = "'${test_variant#pci-}'"
> +name = "domU"
> +kernel = "/boot/vmlinuz"
> +ramdisk = "/boot/initrd-domU"
> +extra = "root=/dev/ram0 console=hvc0"
> +memory = 512
> +vif = [ ]
> +disk = [ ]
> +pci = [ "'$PCIDEV',seize=1" ]
> +on_reboot = "destroy"
> +'
> +
> +    domU_check="
> +set -x -e
> +ip link set eth0 up
> +timeout 30s udhcpc -i eth0
> +pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
> +ping -c 10 \"\$pingip\"
> +echo domU started
> +cat /proc/interrupts
> +"
> +    if [ "$PCIDEV_INTR" = "MSI-X" ]; then
> +        domU_check="$domU_check
> +grep -- '\\(-msi-x\\|PCI-MSI-X\\).*eth0' /proc/interrupts
> +"
> +    elif [ "$PCIDEV_INTR" = "MSI" ]; then
> +        # depending on the kernel version and domain type, the MSI can be
> +        # marked as '-msi', 'PCI-MSI', or 'PCI-MSI-<SBDF>'; be careful to not match
> +        # -msi-x nor PCI-MSI-X
> +        domU_check="$domU_check
> +grep -- '\\(-msi\\|PCI-MSI\\( \\|-[^X]\\)\\).*eth0' /proc/interrupts
> +"
> +    fi
> +    domU_check="$domU_check
> +echo \"${passed}\"
> +"
> +
> +    dom0_check="
> +tail -n 100 -F /var/log/xen/console/guest-domU.log
> +"
>  fi
>  
>  # DomU
> @@ -97,17 +165,7 @@ xl create /etc/xen/domU.cfg
>  ${dom0_check}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> -# just PVH for now
> -echo '
> -type = "pvh"
> -name = "domU"
> -kernel = "/boot/vmlinuz"
> -ramdisk = "/boot/initrd-domU"
> -extra = "root=/dev/ram0 console=hvc0"
> -memory = 512
> -vif = [ "bridge=xenbr0", ]
> -disk = [ ]
> -' > etc/xen/domU.cfg
> +echo "$domU_config" > etc/xen/domU.cfg
>  
>  echo "rc_verbose=yes" >> etc/rc.conf
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
> -- 
> git-series 0.9.1
> 
--8323329-879240808-1682381878=:3419--

