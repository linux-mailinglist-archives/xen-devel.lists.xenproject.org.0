Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B366EEC8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 05:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526454.818213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prVWJ-0005gi-U3; Wed, 26 Apr 2023 03:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526454.818213; Wed, 26 Apr 2023 03:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prVWJ-0005e4-QN; Wed, 26 Apr 2023 03:08:39 +0000
Received: by outflank-mailman (input) for mailman id 526454;
 Wed, 26 Apr 2023 03:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1prVWI-0005dy-G6
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 03:08:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1cd3d15-e3df-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 05:08:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CB1861193;
 Wed, 26 Apr 2023 03:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6053AC433EF;
 Wed, 26 Apr 2023 03:08:33 +0000 (UTC)
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
X-Inumbo-ID: a1cd3d15-e3df-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682478514;
	bh=PzQJ1UmMeamWaVQGvThlEAXTvAWz6c6yXI6rxtx2GOE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P2ABSbKv7IUuhZVOd/Nq0/olTd6IIr6nxHIbPhLJLvNLyu3SSWwCm9cf69FuuyWDr
	 +rK8O42bHFpU/TdR9WeRrDVxzocnEfhfFAA3e7YC0WmyX8+1afpq783t1XJb+ZiYEF
	 nffsp2Rt8YrvMGI57Dn37gvPzsW96IHZV1ainkbi1K6nPpL4zyeEBJJGYVEtD7jQhj
	 rIb4IGjy4xuodh/zUt9R4YwFrzB20MS5zO5n5CzkjG/RKEip6AKMVzFV4VJ8WqNtmx
	 1p0A+GnWJfZbiBjFUGzA4k8q00Tixc59xu+m0pgHfg/KGU2WD/Z/Wtf4fBFuhRkNPg
	 UE6WaTrC3rVnQ==
Date: Tue, 25 Apr 2023 20:08:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 5/6] automation: PCI passthrough tests on ADL hw
In-Reply-To: <1948952135feb360797da0bb0136e7d42e188e72.1682468126.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304251825360.3419@ubuntu-linux-20-04-desktop>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com> <1948952135feb360797da0bb0136e7d42e188e72.1682468126.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-601136291-1682472388=:3419"
Content-ID: <alpine.DEB.2.22.394.2304252008090.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-601136291-1682472388=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304252008091.3419@ubuntu-linux-20-04-desktop>

On Wed, 26 Apr 2023, Marek Marczykowski-Górecki wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> changes in v2:
>  - drop leftover debug shell
>  - fix regex -msi to not match -msi-x
>  - fix waiting for domU startup
> ---
>  automation/gitlab-ci/test.yaml     | 20 +++++++-
>  automation/scripts/qubes-x86-64.sh | 85 ++++++++++++++++++++++++++-----
>  2 files changed, 93 insertions(+), 12 deletions(-)
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
> index 6c0309704661..a01c571860ee 100755
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
> @@ -48,6 +63,62 @@ xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
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
> +grep -- '\\(-msi \\|PCI-MSI\\( \\|-[^X]\\)\\).*eth0' /proc/interrupts
> +"
> +    fi
> +    domU_check="$domU_check
> +echo \"${passed}\"
> +"
> +
> +    dom0_check="
> +until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
> +    sleep 1
> +done
> +tail -n 100 /var/log/xen/console/guest-domU.log
> +"
>  fi
>  
>  # DomU
> @@ -63,7 +134,7 @@ rm var/run
>  echo "#!/bin/sh
>  
>  ${domU_check}
> -/bin/sh" > etc/local.d/xen.start
> +" > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
>  sed -i -e 's/^Welcome/domU \0/' etc/issue
> @@ -98,17 +169,7 @@ xl create /etc/xen/domU.cfg
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
--8323329-601136291-1682472388=:3419--

