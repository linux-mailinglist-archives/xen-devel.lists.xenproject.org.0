Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF4B35070
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 02:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093748.1449152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhnM-0007Mo-4A; Tue, 26 Aug 2025 00:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093748.1449152; Tue, 26 Aug 2025 00:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhnM-0007LL-17; Tue, 26 Aug 2025 00:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1093748;
 Tue, 26 Aug 2025 00:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAYs=3G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uqhnK-0007LF-E4
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 00:44:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8684b24-8215-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 02:44:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1CCCB44166;
 Tue, 26 Aug 2025 00:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031DEC4CEED;
 Tue, 26 Aug 2025 00:44:03 +0000 (UTC)
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
X-Inumbo-ID: c8684b24-8215-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756169045;
	bh=9u8l0+nqxjaCdoVZJZIdl54MZ6+L3WTi+EWaI5SJwSM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eKAagl2RnHsrWDYpYiizc9GRiJSfRrvywHAzpX5XaIA1Yz1mziUmd+NXXYb9frj++
	 7edCSW38trvATxn7IfUjSMpl7mbx7bbqkL/AHC9NWT6pngbBipTsl3nlqaT/DeIXK1
	 qbkRJvh3nV6JTE3LXhT8yoE587n5wI439n7MDXUzECS5ejOunhzMoTRuT1x0h8lA+V
	 VJCKZ8Gujb+/WLMsDtE3kuCnB2nWd2vncFk5CUs9tdX9NTH7eyJzYhovPHOlKvaXYk
	 5Hg9Rx5rJrZfiWcC0AHPyUJZGM620tF1SQ7MXNczILge62ejw0gXt3GdvRHeQwWN22
	 FmsIo/FP4ezkw==
Date: Mon, 25 Aug 2025 17:44:02 -0700 (PDT)
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
Subject: Re: [RFC PATCH v5 10/10] docs: arm: add SCI SCMI SMC multi-agent
 driver docs
In-Reply-To: <79e357dbe97fbb8c8148e75fa65182e611665695.1753184487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508251740500.3391208@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <79e357dbe97fbb8c8148e75fa65182e611665695.1753184487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add SCI SCMI SMC multi-agent driver documentation.
> It includes a detailed description of the SCMI multi-agent driver.
> This document explains the driver's functionality, configuration,
> and the compilation process. The Xen SCMI multi-agent driver is
> designed to provide SCMI access to system resources from different
> domains.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

missing Grygorii's signed-off-by


> ---
> 
> Changes in v5:
> - rework multi-agent driver to leave Host Device-tree unmodified
> 
>  .../arm/firmware/arm-scmi.rst                 | 341 +++++++++++++++++-
>  1 file changed, 340 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> index a084c0caa3..2ab56af879 100644
> --- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> @@ -31,7 +31,10 @@ domain serving as Driver domain).
>  
>  The below sections describe SCMI support options available for Xen.
>  
> -[1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
> +| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
> +| [2] `System Control and Management Interface (SCMI) bindings <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml>`_
> +| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml>`_
> +
>  
>  Simple SCMI over SMC/HVC calls forwarding driver (EL3)
>  ------------------------------------------------------
> @@ -175,3 +178,339 @@ enabling SCMI with "arm_sci" xl.cfg option.
>      ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
>      ->        xen,force-assign-without-iommu;
>        };
> +
> +SCMI SMC/HVC multi-agent driver (EL3)
> +-------------------------------------
> +
> +The SCMI SMC/HVC multi-agent driver enables support for ARM EL3 Trusted Firmware-A (TF-A) which
> +provides SCMI interface with multi-agnet support, as shown below.

multi-agent

> +
> +::
> +
> +      +-----------------------------------------+
> +      |                                         |
> +      | EL3 TF-A SCMI                           |
> +      +-------+--+-------+--+-------+--+-------++
> +      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
> +      +-----+-+  +---+---+  +--+----+  +---+---+
> +    smc-id1 |        |         |           |
> +    agent1  |        |         |           |
> +      +-----v--------+---------+-----------+----+
> +      |              |         |           |    |
> +      |              |         |           |    |
> +      +--------------+---------+-----------+----+
> +             smc-id0 |  smc-id2|    smc-idX|
> +             agent0  |  agent2 |    agentX |
> +                     |         |           |
> +                +----v---+  +--v-----+  +--v-----+
> +                |        |  |        |  |        |
> +                | Dom0   |  | Dom1   |  | DomX   |
> +                |        |  |        |  |        |
> +                |        |  |        |  |        |
> +                +--------+  +--------+  +--------+
> +
> +The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared-memory transport

is expected to provide


> +for every Agent in the system. The SCMI Agent transport channel defined by pair:
> +
> +- smc-id: SMC/HVC function id used for Doorbell
> +- shmem: shared memory for messages transfer, **Xen page aligned**.
> +  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _PAGE_DEVICE, indicating that this
> +  memory is mapped as device memory.
> +
> +The following SCMI Agents expected to be defined by SCMI FW to enable SCMI multi-agent functionality

is expected to

> +under Xen:
> +
> +- Xen management agent: trusted agents that accesses to the Base Protocol commands to configure
> +  agent specific permissions
> +- OSPM VM agents: non-trusted agent, one for each Guest domain which is  allowed direct HW access.
> +  At least one OSPM VM agent has to be provided by FW if HW is handled only by Dom0 or Driver Domain.
> +
> +The EL3 SCMI FW expected to implement following Base protocol messages:

is expected to

> +
> +- BASE_DISCOVER_AGENT (optional if agent_id was provided)
> +- BASE_RESET_AGENT_CONFIGURATION (optional)
> +- BASE_SET_DEVICE_PERMISSIONS (optional)
> +
> +The number of supported SCMI agents and their transport specifications are SCMI FW implementation
> +specific.
> +
> +Compiling with multi-agent support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +To build with the SCMI SMC/HVC multi-agent driver support, enable Kconfig option:
> +
> +::
> +
> +    CONFIG_SCMI_SMC_MA
> +
> +
> +Driver functionality
> +^^^^^^^^^^^^^^^^^^^^
> +
> +The SCI SCMI SMC multi-agent driver implements following functionality:
> +
> +- The driver is initialized based on the ``xen,config`` node under ``chosen``
> +  (only one SCMI interface is supported), which describes the Xen management
> +  agent SCMI interface.
> +
> +.. code::
> +
> +    scmi_shm_1: sram@47ff1000 {
> +              compatible = "arm,scmi-shmem";
> +              reg = <0x0 0x47ff1000 0x0 0x1000>;
> +    };
> +    scmi_xen: scmi {
> +            compatible = "arm,scmi-smc";
> +            arm,smc-id = <0x82000002>; <--- Xen manegement agent smc-id
> +            #address-cells = < 1>;
> +            #size-cells = < 0>;
> +            #access-controller-cells = < 1>;
> +            shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
> +    };
> +
> +- The driver obtains Xen specific SCMI Agent's configuration from the Host DT, probes Agents and
> +  builds SCMI Agents list. The Agents configuration is taken from "scmi-secondary-agents"
> +  property where first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and third is
> +  optional "agent_id":
> +
> +.. code::

.. code-block:: dts


> +    chosen {
> +      ranges; <--- set default ranges so address can be translated when parsing scmi_shm node
> +      xen,config {
> +        ranges; <--- set default ranges so address can be translated when parsing scmi_shm node
> +        scmi-secondary-agents = <
> +                      0x82000003 &scmi_shm_0 0
> +                      0x82000004 &scmi_shm_2 2
> +                      0x82000005 &scmi_shm_3 3
> +                      0x82000006 &scmi_shm_4 4>;
> +        #scmi-secondary-agents-cells = <3>; <--- optional, default 3
> +
> +        scmi_shm_0 : sram@47ff0000 {
> +            compatible = "arm,scmi-shmem";
> +            reg = <0x0 0x47ff0000 0x0 0x1000>;
> +        };
> +
> +        scmi_shm_2: sram@47ff2000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff2000 0x0 0x1000>;
> +        };
> +        scmi_shm_3: sram@47ff3000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff3000 0x0 0x1000>;
> +        };
> +        scmi_shm_4: sram@47ff4000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff4000 0x0 0x1000>;
> +        };
> +
> +        // Xen SCMI management channel
> +        scmi_shm_1: sram@47ff1000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff1000 0x0 0x1000>;
> +        };
> +
> +        scmi_xen: scmi {
> +            compatible = "arm,scmi-smc";
> +            arm,smc-id = <0x82000002>; <--- Xen manegement agent smc-id
> +            #address-cells = < 1>;
> +            #size-cells = < 0>;
> +            #access-controller-cells = < 1>;
> +            shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
> +        };
> +      };
> +    };
> +
> +    /{
> +        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI enabled for it
> +        scmi_shm: sram@47ff1000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff1000 0x0 0x1000>;
> +        };
> +
> +        firmware {
> +            scmi: scmi {
> +                compatible = "arm,scmi-smc";
> +                arm,smc-id = <0x82000003>; <--- Host OSPM agent smc-id
> +                #address-cells = < 1>;
> +                #size-cells = < 0>;
> +                shmem = <&scmi_shm>; <--- Host OSPM agent shmem
> +
> +                protocol@X{
> +                };
> +            };
> +        };
> +    };
> +
> +  This approach allows defining multiple SCMI Agents by adding Xen-specific properties under
> +  the ``/chosen`` node to the Host Device Tree, leaving the main part unchanged. The Host DT
> +  SCMI channel will be passed to Dom0.
> +
> +  The Xen management agent is described as a ``scmi_xen`` node under the ``/chosen`` node, which
> +  is used by Xen to control other SCMI Agents in the system.
> +
> +  All secondary agents' configurations are provided in the ``scmi-secondary-agents`` property with
> +  an optional ``agent_id`` field.
> +
> +  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to identify the agent in the
> +  system and can be omitted by setting ``#scmi-secondary-agents-cells = <2>``, so the Secondary
> +  Agents configuration will look like this:
> +
> +.. code::

.. code-block:: dts


> +    chosen {
> +      xen,config {
> +        scmi-secondary-agents = <
> +                      0x82000003 &scmi_shm_0
> +                      0x82000004 &scmi_shm_2
> +                      0x82000005 &scmi_shm_3
> +                      0x82000006 &scmi_shm_4>;
> +        #scmi-secondary-agents-cells = <2>;
> +      };
> +    }
> +
> +  In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to discover the ``agent_id``
> +  for each secondary agent. Providing the ``agent_id`` in the ``scmi-secondary-agents`` property
> +  allows skipping the discovery call, which is useful when the secondary agent's shared memory is
> +  not accessible by Xen or when boot time is important because it allows skipping the agent
> +  discovery procedure.
> +
> +.. note::
> +
> +    Note that Xen is the only one entry in the system which need to know about SCMI multi-agent support.
> +
> +- The driver implements the SCI subsystem interface required for configuring and enabling SCMI
> +  functionality for Dom0/hwdom and Guest domains. To enable SCMI functionality for guest domain
> +  it has to be configured with unique supported SCMI Agent_id and use corresponding SCMI SMC/HVC
> +  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_id.
> +
> +- Once Xen domain is configured it can communicate with EL3 SCMI FW:
> +
> +  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
> +  - the guest triggers SMC/HVC exception with agent "smc-id" (doorbell);
> +  - the Xen driver catches exception, do checks and synchronously forwards it to EL3 FW.
> +
> +- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen management agent channel on
> +  domain destroy event. This allows to reset resources used by domain and so implement use-case
> +  like domain reboot.
> +
> +
> +Configure SCMI for Dom0
> +^^^^^^^^^^^^^^^^^^^^^^^
> +The **"dom0_scmi_agent_id=<dom0_agent_id>"** Xen command line is used to enable SCMI functionality for
> +Dom0. if not provided SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
> +
> +Xen utilizes Host DT SCMI node to configure Dom0 SCMI Agent so the device-tree remains unchanged
> +except for the Xen specific properties under ``/chosen`` node. If Xen device-tree doesn't include
> +``/firmware/scmi`` node or it's disabled, the Dom0 SCMI Agent will not be configured.
> +
> +.. note::
> +
> +    The **dom0_scmi_agent_id** value should match the ``func_id`` and ``shmem`` in the ``/firmware/scmi`` node
> +    to set the correct Dom0 SCMI Agent.
> +
> +Configure SCMI for for guest domain with toolstack
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +* In domain's xl.cfg file add **"arm_sci"** option as below
> +
> +::
> +
> +    arm_sci = "type=scmi_smc_multiagent,agent_id=2"
> +
> +* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which should correspond
> +  assigned "agent_id" for the domain, for example:
> +
> +::
> +
> +    iomem = [
> +        "47ff2,1@22001",
> +    ]
> +
> +.. note:: It's up to the user to select guest IPA for mapping SCMI shared-memory.
> +
> +* Add SCMI nodes to the Driver domain partial device tree as in the below example.
> +  The "arm,smc-id" should correspond assigned agent_id for the domain:
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
> +                    arm,smc-id = <0x82000004>;
> +                    shmem = <&scmi_shm_0>;
> +                    ...
> +                }
> +        }
> +    }
> +
> +**Device specific access control**
> +
> +The XEN SCMI SMC/HVC multi-agent driver performs "access-controller" provider function in case
> +EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and provides the
> +BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents have access to.
> +The Host DT SCMI node should have "#access-controller-cells=<1>" property and DT devices should
> +be bound to the SCMI node using Access Controllers bindings [3].
> +
> +For example:
> +
> +.. code::
> +
> +    &i2c1 {
> +            access-controllers = <&scmi 0>;
> +    };
> +
> +Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from toolstack to the guest:
> +
> +::
> +
> +    dtdev = [
> +        "/soc/i2c@e6508000",
> +    ]
> +
> +.. note::
> +
> +    xl.cfg:"dtdev" need contain all nodes which are under SCMI management (not only those which are
> +    behind IOMMU) and passed-through to the guest domain.
> +
> +Configure SCMI for predefined domains (dom0less)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +* add "xen,sci_type" and "xen,sci_agent_id" properties for required DomU ("xen,domain") node
> +
> +::
> +
> +    xen,sci_type="scmi_smc_multiagent"
> +    xen,sci_agent_id=2
> +
> +* add scmi nodes to the Driver domain partial device tree the same way as above (toolstack case) and
> +  enable access to the "arm,scmi-shmem" according to the dom0less documentation. For example:
> +
> +.. code::
> +
> +      scmi_shm_0: sram@22001000 {
> +            compatible = "arm,scmi-shmem";
> +            reg = <0x00 0x22001000 0x00 0x1000>;
> +    ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
> +    ->        xen,force-assign-without-iommu;
> +      };
> +
> +* For SCMI device access control configure pass-through devices in the guest partial DT according to
> +  the dom0less documentation and ensure that devices SCMI management has "xen,path" property set:
> +
> +.. code::
> +
> +		i2c@e6508000 {
> +            ...
> +			reg = <0x00 0xe6508000 0x00 0x1000>;
> +    ->        xen,path = "/soc/i2c@e6508000"
> +    ->        xen,reg = <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
> +    ->        xen,force-assign-without-iommu;
> +        };
> -- 
> 2.34.1
> 

