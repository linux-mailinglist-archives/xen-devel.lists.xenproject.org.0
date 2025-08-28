Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADBB3ACD0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 23:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100052.1453652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkKC-00025z-1z; Thu, 28 Aug 2025 21:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100052.1453652; Thu, 28 Aug 2025 21:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkKB-00024D-VK; Thu, 28 Aug 2025 21:38:27 +0000
Received: by outflank-mailman (input) for mailman id 1100052;
 Thu, 28 Aug 2025 21:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsNu=3I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urkKA-00023m-G7
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 21:38:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53701622-8457-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 23:38:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A51460139;
 Thu, 28 Aug 2025 21:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A85BC4CEEB;
 Thu, 28 Aug 2025 21:38:22 +0000 (UTC)
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
X-Inumbo-ID: 53701622-8457-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756417103;
	bh=gBJ2MLLjjmA3mYJqv41fPeWVBTVwZKt8grizIURQfx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T2x+L4qwBBWleTvo6UWpzTobz+uFJjna2BMEcReLxyNV1rhCdL7wCFGbQ7dRrT2Wb
	 I3LgSU/i+KMm+DRVsagnmAh2+UmdnYB14zngUNYUrpbHTdXNIWjNdrDA1A8KvvS2do
	 vGfXvgIHkgRwd2thoym38EyI5/Zonm9cZX2gGNBsxambecP4HdNXHIvWGEpXtCdaHj
	 r8cd3Ub9dkEKxK1pPEPktdTf44Oy43CPzURJEH3PqZuXAR5JssiF8ioNBp9TrJ603h
	 DUjELnTnAqkn4mTqJOEp5OtHtDju91D8H+bft4JrNsMLA2hrQUNNkO+wx76ww9U+RK
	 vmLTKQiDfOsPA==
Date: Thu, 28 Aug 2025 14:38:20 -0700 (PDT)
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
Subject: Re: [PATCH v6 4/4] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
In-Reply-To: <17e009a131e54ad68f0a182b1766d333cf1c63f8.1756399156.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508281436010.8757@ubuntu-linux-20-04-desktop>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com> <17e009a131e54ad68f0a182b1766d333cf1c63f8.1756399156.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add documentation section for Simple Arm SCMI over SMC calls forwarding
> driver (EL3).
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

We typically wrap lines at 80. It can be done on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v6:
> - add link to the scmi bindings used in the doc
> - remove mentions about HVC calls from doc
> - rename cmdline parameter to scmi-smc-passthrough
> 
> Changes in v5:
> - rename dom0_scmi_smc_passthrough in documentation
> 
>  .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++++
>  docs/hypervisor-guide/arm/index.rst           |   9 +
>  docs/hypervisor-guide/index.rst               |   1 +
>  3 files changed, 190 insertions(+)
>  create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>  create mode 100644 docs/hypervisor-guide/arm/index.rst
> 
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> new file mode 100644
> index 0000000000..4394c95431
> --- /dev/null
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> @@ -0,0 +1,180 @@
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
> +  ARM SMC shared-memory transport;
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
> +| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
> +| [2] `System Control and Management Interface (SCMI) bindings <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml>`_
> +
> +Simple SCMI over SMC calls forwarding driver (EL3)
> +------------------------------------------------------
> +
> +The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pretty generic case for
> +the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI firmware supports only
> +single SCMI OSPM transport (agent) with Shared memory based transport and SMC calls as doorbell.
> +
> +The SCMI over SMC calls forwarding driver solves major problem for this case by allowing
> +SMC calls to be forwarded form guest to the EL3 SCMI firmware.
> +
> +By default, the SCMI over SMC calls forwarding is enabled for Dom0/hwdom.
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
> +forwards SMC calls.
> +
> +Compiling
> +^^^^^^^^^
> +
> +To build with the SCMI over SMC calls forwarding enabled support, enable Kconfig option
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
> +This section describes how to configure the SCMI over SMC calls forwarding driver to handle use
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
> +**"scmi-smc-passthrough"** option. This will disable SCMI for Dom0/hwdom and SCMI nodes will
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
> +Please refer to [2] for details of SCMI DT bindings.
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

