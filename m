Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56336B325CC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090752.1447860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upc9C-0006xj-3i; Sat, 23 Aug 2025 00:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090752.1447860; Sat, 23 Aug 2025 00:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upc9C-0006v9-08; Sat, 23 Aug 2025 00:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1090752;
 Sat, 23 Aug 2025 00:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upc9B-0006v3-G4
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:30:17 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55803221-7fb8-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:30:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EBD38A58C37;
 Sat, 23 Aug 2025 00:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF397C4CEED;
 Sat, 23 Aug 2025 00:30:10 +0000 (UTC)
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
X-Inumbo-ID: 55803221-7fb8-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755909012;
	bh=nxDb3/lxwFXee89Pkah4dOh/6MR/uZtN8I2KlwzTX9E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kZBMkPMwAxwDr0Bvyum5ZT5gAitwuFj77kHyYNlFneay6TI6RAvQcfGV3HOJw9cRK
	 ji5cjJIJyJAHpb5OhyzkA9lgBjjZ47nSYUexSqa86UrRMmDUGmiVcz41CFL7BxCUSX
	 leNme3EiG5Bn5oSbcLG/7iP/tlOvE4ieidrQhVqU0s/0TgogQyMmjpbbrNB2FnUKmt
	 UjKKUci0EHvcfyyc91IGf3B+v8bm5PF7NyNNyCUb4Y6lf8PMoXfpk6nBlHaxVHN7Jh
	 BOxR77GnG4AaHAl/gUyMSPUwZ4NO5hkle4bwOBJGsX7/HfH1hzZ7IXILEUmF+3/rHO
	 5TNOkDHa0feDw==
Date: Fri, 22 Aug 2025 17:30:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 04/10] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
In-Reply-To: <dcce8830102110e2edba022b0909d6fd85110880.1753184487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508221726220.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <dcce8830102110e2edba022b0909d6fd85110880.1753184487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add documentation section for Simple Arm SCMI over SMC/HVC calls forwarding
> driver (EL3).
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

This doc looks good, a couple of minor suggestions:
- briefly document the bindings expected as input (e.g. compatible
  "arm,scmi-smc" and "arm,scmi-shmem") or simply provide links to official docs
- it says "SCMI over SMC/HVC" but I am not sure if HVC would actually
  work


> ---
> 
> Changes in v5:
> - rename dom0_scmi_smc_passthrough in documentation
> 
>  .../arm/firmware/arm-scmi.rst                 | 177 ++++++++++++++++++
>  docs/hypervisor-guide/arm/index.rst           |   9 +
>  docs/hypervisor-guide/index.rst               |   1 +
>  3 files changed, 187 insertions(+)
>  create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>  create mode 100644 docs/hypervisor-guide/arm/index.rst
> 
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> new file mode 100644
> index 0000000000..a084c0caa3
> --- /dev/null
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> @@ -0,0 +1,177 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +ARM System Control and Management Interface (SCMI)
> +==================================================
> +
> +The System Control and Management Interface (SCMI) [1], which is a set of operating
> +system-independent software interfaces that are used in system management. SCMI currently
> +provides interfaces for:
> +
> +- Discovery and self-description of the interfaces it supports
> +- Power domain management
> +- Clock management
> +- Reset domain management
> +- Voltage domain management
> +- Sensor management
> +- Performance management
> +- Power capping and monitoring
> +- Pin control protocol.
> +
> +The SCMI compliant firmware could run:
> +
> +- as part of EL3 secure world software (like Trusted Firmware-A) with
> +  ARM SMC/HVC shared-memory transport;
> +- on dedicated System Control Processor (SCP) with HW mailbox shared-memory transport
> +
> +The major purpose of enabling SCMI support in Xen is to enable guest domains access to the SCMI
> +interfaces for performing management actions on passed-through devices (such as clocks/resets etc)
> +without accessing directly to the System control HW (like clock controllers) which in most cases
> +can't shared/split between domains. Or, at minimum, allow SCMI access for dom0/hwdom (or guest
> +domain serving as Driver domain).
> +
> +The below sections describe SCMI support options available for Xen.
> +
> +[1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
> +
> +Simple SCMI over SMC/HVC calls forwarding driver (EL3)
> +------------------------------------------------------
> +
> +The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pretty generic case for
> +the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI firmware supports only
> +single SCMI OSPM transport (agent) with Shared memory based transport and SMC/HVC calls as doorbell.
> +
> +The SCMI over SMC/HVC calls forwarding driver solves major problem for this case by allowing
> +SMC/HVC calls to be forwarded form guest to the EL3 SCMI firmware.
> +
> +By default, the SCMI over SMC/HVC calls forwarding is enabled for Dom0/hwdom.
> +
> +::
> +
> +    +--------------------------+
> +    |                          |
> +    | EL3 SCMI FW (TF-A)       |
> +    ++-------+--^--------------+
> +     |shmem  |  | smc-id
> +     +----^--+  |
> +          |     |
> +     +----|-+---+---+----------+
> +     |    | |  FWD  |      Xen |
> +     |    | +---^---+          |
> +     +----|-----|--------------+
> +          |     | smc-id
> +     +----v-----+--+ +---------+
> +     |             | |         |
> +     | Dom0/hwdom  | | DomU    |
> +     |             | |         |
> +     |             | |         |
> +     +-------------+ +---------+
> +
> +
> +The SCMI messages are passed directly through SCMI shared-memory (zero-copy) and driver only
> +forwards SMC/HVC calls.
> +
> +Compiling
> +^^^^^^^^^
> +
> +To build with the SCMI over SMC/HVC calls forwarding enabled support, enable Kconfig option
> +
> +::
> +
> +    CONFIG_SCMI_SMC
> +
> +The ``CONFIG_SCMI_SMC`` is enabled by default.
> +
> +Pass-through SCMI SMC to domain which serves as Driver domain
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +This section describes how to configure the SCMI over SMC/HVC calls forwarding driver to handle use
> +case "thin Dom0 with guest domain, which serves as Driver domain". In this case HW need to be
> +enabled in Driver domain and dom0 is performing only control functions (without accessing FW) and so,
> +the SCMI need to be enabled in Driver domain.
> +
> +::
> +
> +     +--------------------------+
> +     |EL3 SCMI FW (TF-A)        |
> +     |                          |
> +     +-------------^--+-------+-+
> +             smc-id|  |shmem0 |
> +                   |  +----^--+
> +    +-------------++------+|----+
> +    |Xen          |  FWD  ||    |
> +    |             +--^----+|    |
> +    +----------------|-----|----+
> +              smc-id |     |
> +    +-----------+ +--+-----v-----+
> +    |           | |              |
> +    | Dom0      | |    Driver    |
> +    | Control   | |    domain    |
> +    |           | |              |
> +    +-----------+ +--------------+
> +
> +The SCMI can be enabled for one and only one guest domain.
> +
> +First. configure Dom0 to enable SCMI pass-through using Xen Command Line
> +**"scmi_smc_passthrough"** option. This will disable SCMI for Dom0/hwdom and SCMI nodes will
> +be removed from Dom0/hwdom device tree.
> +
> +**Configure SCMI pass-through for guest domain with toolstack**
> +
> +* In domain's xl.cfg file add **"arm_sci"** option as below
> +
> +::
> +
> +    arm_sci = "type=scmi_smc"
> +
> +* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
> +
> +::
> +
> +    iomem = [
> +        "47ff0,1@22001",
> +    ]
> +
> +.. note:: It's up to the user to select guest IPA for mapping SCMI shared-memory.
> +
> +* Add SCMI nodes to the Driver domain partial device tree as in the below example:
> +
> +.. code::
> +
> +    passthrough {
> +       scmi_shm_0: sram@22001000 {
> +           compatible = "arm,scmi-shmem";
> +           reg = <0x0 0x22001000 0x0 0x1000>;
> +       };
> +
> +       firmware {
> +            compatible = "simple-bus";
> +                scmi: scmi {
> +                    compatible = "arm,scmi-smc";
> +                    shmem = <&scmi_shm_0>;
> +                    ...
> +                }
> +        }
> +    }
> +
> +In general, the configuration is similar to any other HW pass-through, except explicitly
> +enabling SCMI with "arm_sci" xl.cfg option.
> +
> +**Configure SCMI pass-through for predefined domain (dom0less)**
> +
> +* add "xen,sci_type" property for required DomU ("xen,domain") node
> +
> +::
> +
> +       xen,sci_type="scmi_smc"
> +
> +* add scmi nodes to the Driver domain partial device tree the same way as above and enable access
> +  to the "arm,scmi-shmem" according to  dom0less documentation. For example:
> +
> +.. code::
> +
> +      scmi_shm_0: sram@22001000 {
> +            compatible = "arm,scmi-shmem";
> +            reg = <0x00 0x22001000 0x00 0x1000>;
> +    ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
> +    ->        xen,force-assign-without-iommu;
> +      };
> diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/arm/index.rst
> new file mode 100644
> index 0000000000..7aae4a0a03
> --- /dev/null
> +++ b/docs/hypervisor-guide/arm/index.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +ARM
> +===
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   firmware/arm-scmi
> diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
> index e4393b0697..520fe01554 100644
> --- a/docs/hypervisor-guide/index.rst
> +++ b/docs/hypervisor-guide/index.rst
> @@ -9,3 +9,4 @@ Hypervisor documentation
>     code-coverage
>  
>     x86/index
> +   arm/index
> \ No newline at end of file
> -- 
> 2.34.1
> 

