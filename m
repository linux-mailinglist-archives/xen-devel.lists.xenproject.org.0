Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHJJDDb6e2n4JgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 01:24:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FBB5E27
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 01:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217137.1526950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlcIW-0003xE-6d; Fri, 30 Jan 2026 00:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217137.1526950; Fri, 30 Jan 2026 00:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlcIW-0003va-35; Fri, 30 Jan 2026 00:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1217137;
 Fri, 30 Jan 2026 00:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+hK=AD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlcIU-0003vU-T1
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 00:23:39 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e889b48f-fd71-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 01:23:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 711E36001A;
 Fri, 30 Jan 2026 00:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917A5C4CEF7;
 Fri, 30 Jan 2026 00:23:29 +0000 (UTC)
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
X-Inumbo-ID: e889b48f-fd71-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769732611;
	bh=MEltI2cCPlssu2KOL0WlU661UsBIBmLJ9wAmtTzzN/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F43u8TYUQzArOQQSzsEZQW7znFd/B+e/tAtYQgZ9gFo6p3th0sLinocJ8KegfdYiB
	 Jr+N7/WtUqGeImdEhanLY1YdTcTSCm3dSK9EFsaShYGHGokcdyywNLz5VJEM3bxxp5
	 jHOZ9tpPmQakOSb9tzyM1uIrIz2vFjoYkhWMd0SpRpjq94e27QBGGwSxTWsjfwOb7T
	 ZRT8iD/VKvEs+ALeLZ9Cl/q8zkC4zii7KgQ5fa5+olKu9Xjl5mS54PSyUxDpqFY+D7
	 ioGf+36s6+TS21rkQxr8rnNnEjkw+IvbqCyX8AoolgxqNAkItK1wC5yop40ETP64Pg
	 zB1jep9MOYcCg==
Date: Thu, 29 Jan 2026 16:23:28 -0800 (PST)
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
Subject: Re: [PATCH v9 5/5] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
In-Reply-To: <9a95d21c212013b8e76f20a0248e94108512c94f.1769696107.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601291615420.2238666@ubuntu-linux-20-04-desktop>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com> <9a95d21c212013b8e76f20a0248e94108512c94f.1769696107.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:url,47ff0000:email,47ff2000:email,0.0.85.241:email,47ff1000:email,e6508000:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,47ff3000:email,0.0.0.1:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[1.79.181.104:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 760FBB5E27
X-Rspamd-Action: no action

On Thu, 29 Jan 2026, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add SCI SCMI SMC multi-agent driver documentation.
> It includes a detailed description of the SCMI multi-agent driver.
> This document explains the driver's functionality, configuration,
> and the compilation process. The Xen SCMI multi-agent driver is
> designed to provide SCMI access to system resources from different
> domains.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> (no changes since v8)
> 
> Changes in v8:
> - update documentation to match the last DT format
> - fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
> - update documentation with dom0less configuration example
> - update documentation with new param xen,dom0-sci-agent-id
> instead of the command line parameter
> 
> Changes in v7:
> - update documentation in section of the xen_scmi configuration which
> is matched by "xen,sci" compatible instead of the direct path.
> 
> Changes in v6:
> - remove all HVC mentions from the multi-agent doc
> - update sci-agent-id parameter description in the documentation
> - add missing Sign-of
> - minor fixes across the document
> 
> Changes in v5:
> - rework multi-agent driver to leave Host Device-tree unmodified
> 
>  .../arm/firmware/arm-scmi.rst                 | 420 ++++++++++++++++++
>  1 file changed, 420 insertions(+)
> 
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> index d9698f4e4b..2497a870f3 100644
> --- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> @@ -36,6 +36,8 @@ The below sections describe SCMI support options available for Xen.
>  
>  | [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
>  | [2] `System Control and Management Interface (SCMI) bindings <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml>`_
> +| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml>`_
> +
>  
>  Simple SCMI over SMC calls forwarding driver (EL3)
>  ------------------------------------------------------
> @@ -189,3 +191,421 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg option.
>      ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
>      ->        xen,force-assign-without-iommu;
>        };
> +
> +SCMI SMC multi-agent driver (EL3)
> +-------------------------------------
> +
> +The SCMI SMC multi-agent driver enables support for ARM EL3 Trusted Firmware-A (TF-A) which
> +provides SCMI interface with multi-agent support, as shown below.
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
> +The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared-memory transport
> +for every Agent in the system. The SCMI Agent transport channel defined by pair:
> +
> +- smc-id: SMC function id used for Doorbell
> +- shmem: shared memory for messages transfer, **Xen page aligned**.
> +  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _PAGE_DEVICE, indicating that this
> +  memory is mapped as device memory.
> +
> +The following SCMI Agents are expected to be defined by SCMI FW to enable SCMI multi-agent functionality
> +under Xen:
> +
> +- Xen management agent: trusted agents that accesses to the Base Protocol commands to configure
> +  agent specific permissions
> +- OSPM VM agents: non-trusted agent, one for each Guest domain which is  allowed direct HW access.
> +  At least one OSPM VM agent has to be provided by FW if HW is handled only by Dom0 or Driver Domain.
> +
> +The EL3 SCMI FW is expected to implement following Base protocol messages:
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
> +To build with the SCMI SMC multi-agent driver support, enable Kconfig option:
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
> +- The driver is initialized from the Xen SCMI container ``xen_scmi_config``
> +  under ``/chosen/xen`` (for example ``/chosen/xen/xen_scmi_config/scmi``).
> +  Only one SCMI interface is supported. The SCMI configuration must live under
> +  the Xen SCMI container ``xen,sci`` beneath ``/chosen``.
> +  The Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is a child of
> +  this "xen,sci" container; any other "arm,scmi-smc" nodes (for example under
> +  "/firmware") are ignored to avoid stealing the host's SCMI OSPM instance.
> +
> +.. code-block:: dts
> +
> +        scmi_shm_1: sram@47ff1000 {
> +            compatible = "arm,scmi-shmem";
> +            reg = <0x0 0x47ff1000 0x0 0x1000>;
> +        };
> +        scmi_xen: scmi {
> +          compatible = "arm,scmi-smc";
> +          arm,smc-id = <0x82000003>; <--- Xen management agent smc-id
> +          #address-cells = < 1>;
> +          #size-cells = < 0>;
> +          #access-controller-cells = < 1>;
> +          shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> +        };
> +
> +.. note::
> +   This layout keeps the Host DT unchanged for Dom0 and baremetal Linux by
> +   using func_id 0x82000002 / shmem 0x47ff0000 for Dom0, while Xen uses a
> +   separate privileged channel func_id 0x82000003 / shmem 0x47ff1000. EL3
> +   firmware enforces permissions per agent_id, so there is no conflict between
> +   Dom0 and Xen channels.
> +
> +- The driver obtains Xen specific SCMI Agent's configuration from the Host DT, probes Agents and
> +  builds SCMI Agents list. The Agents configuration is taken from "scmi-secondary-agents"
> +  property where first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and third is
> +  optional "agent_id":
> +
> +.. code-block:: dts
> +
> +    chosen {
> +      ranges; <--- set default ranges so address can be translated when parsing scmi_shm node
> +      xen {
> +        ranges;
> +        xen_scmi_config {
> +          compatible = "xen,sci";
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +          ranges; <--- set default ranges so address can be translated when parsing scmi_shm node
> +          scmi-secondary-agents = <
> +                        0x82000002 &scmi_shm_0 0
> +                        0x82000004 &scmi_shm_2 2
> +                        0x82000005 &scmi_shm_3 3
> +                        0x82000006 &scmi_shm_4 4>;
> +          #scmi-secondary-agents-cells = <3>; <--- optional, default 3
> +          xen,dom0-sci-agent-id = <0>;  /* Dom0 agent ID */
> +
> +          scmi_shm_0 : sram@47ff0000 {
> +              compatible = "arm,scmi-shmem";
> +              reg = <0x0 0x47ff0000 0x0 0x1000>;
> +          };
> +
> +          scmi_shm_2: sram@47ff2000 {
> +              compatible = "arm,scmi-shmem";
> +              reg = <0x0 0x47ff2000 0x0 0x1000>;
> +          };
> +          scmi_shm_3: sram@47ff3000 {
> +              compatible = "arm,scmi-shmem";
> +              reg = <0x0 0x47ff3000 0x0 0x1000>;
> +          };
> +          scmi_shm_4: sram@47ff4000 {
> +              compatible = "arm,scmi-shmem";
> +              reg = <0x0 0x47ff4000 0x0 0x1000>;
> +          };
> +
> +          // Xen SCMI management channel
> +          scmi_shm_1: sram@47ff1000 {
> +              compatible = "arm,scmi-shmem";
> +              reg = <0x0 0x47ff1000 0x0 0x1000>;
> +          };
> +
> +          scmi_xen: scmi {
> +              compatible = "arm,scmi-smc";
> +              arm,smc-id = <0x82000003>; <--- Xen management agent smc-id
> +              #address-cells = < 1>;
> +              #size-cells = < 0>;
> +              #access-controller-cells = < 1>;
> +              shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> +          };
> +        };
> +      };
> +    };
> +
> +    /{
> +        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI enabled for it
> +        scmi_shm: sram@47ff0000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff0000 0x0 0x1000>;
> +        };
> +
> +        firmware {
> +            scmi: scmi {
> +                compatible = "arm,scmi-smc";
> +                arm,smc-id = <0x82000002>; <--- Host OSPM agent smc-id
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
> +  The Xen management agent is described as a ``scmi_xen`` node under the ``xen,sci`` compatible node,
> +  which is used by Xen to control other SCMI Agents in the system.
> +
> +  All secondary agents' configurations are provided in the ``scmi-secondary-agents`` property with
> +  an optional ``agent_id`` field.
> +
> +  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to identify the agent in the
> +  system and can be omitted by setting ``#scmi-secondary-agents-cells = <2>``, so the Secondary
> +  Agents configuration will look like this:
> +
> +.. code-block:: dts
> +
> +    chosen {
> +      xen {
> +        xen_scmi_config {
> +          compatible = "xen,sci";
> +          scmi-secondary-agents = <
> +                        0x82000002 &scmi_shm_0
> +                        0x82000004 &scmi_shm_2
> +                        0x82000005 &scmi_shm_3
> +                        0x82000006 &scmi_shm_4>;
> +          #scmi-secondary-agents-cells = <2>;
> +        };
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
> +  it has to be configured with unique supported SCMI Agent_id and use corresponding SCMI SMC
> +  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_id.
> +
> +- Once Xen domain is configured it can communicate with EL3 SCMI FW:
> +
> +  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
> +  - the guest triggers SMC exception with agent "smc-id" (doorbell);
> +  - the Xen driver catches exception, do checks and synchronously forwards it to EL3 FW.
> +
> +- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen management agent channel on
> +  domain destroy event. This allows to reset resources used by domain and so implement use-case
> +  like domain reboot.
> +
> +
> +Configure SCMI for Dom0
> +^^^^^^^^^^^^^^^^^^^^^^^
> +Set the Dom0 SCMI agent ID in the device tree using the Xen SCMI container under ``/chosen``.
> +Add ``xen,dom0-sci-agent-id`` to the ``xen,sci`` node. If the property is absent, SCMI stays
> +disabled for Dom0 and the SCMI nodes are removed from Dom0 DT.
> +
> +.. code-block:: dts
> +
> +  chosen {
> +    xen {
> +      ranges;
> +      xen_scmi_config {
> +        compatible = "xen,sci";
> +        xen,dom0-sci-agent-id = <0>;  /* Dom0 agent ID */
> +        /* scmi-secondary-agents and scmi_xen as shown above */
> +      };
> +    };
> +  };
> +
> +Xen utilizes the Host DT ``/firmware/scmi`` node to configure the Dom0 SCMI agent, leaving the
> +rest of the Host DT unchanged except for the Xen-specific properties under ``/chosen``. If the
> +``/firmware/scmi`` node is missing or disabled, the Dom0 SCMI agent will not be configured.

It might be good to clarify that actually /firmware/scmi is simply
copied to the Dom0 DT unmodified. However, for Dom0 SCMI configuration,
Xen actually relies on scmi-secondary-agents and xen,dom0-sci-agent-id.


> +.. note::
> +
> +  The ``xen,dom0-sci-agent-id`` value must match the ``func_id`` and ``shmem`` pairing provided by
> +  the EL3 firmware for Dom0 (for example in the ``/firmware/scmi`` node).
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
> +                    arm,smc-id = <0x82000004>;  <--- smc-id for agent_id=2
> +                    shmem = <&scmi_shm_0>;
> +                    ...
> +                }
> +        }
> +    }
> +
> +**Device specific access control**
> +
> +The XEN SCMI SMC multi-agent driver performs "access-controller" provider function in case
> +EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and provides the
> +BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents have access to.
> +The Host DT SCMI node should have "#access-controller-cells=<1>" property and DT devices should
> +be bound to the SCMI node using Access Controllers bindings [3].
> +
> +For example:
> +
> +.. code-block:: dts
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
> +* add "xen,sci_type" and "xen,sci-agent-id" properties for required DomU ("xen,domain") node
> +
> +::
> +
> +    xen,sci_type="scmi_smc_multiagent"
> +    xen,sci-agent-id=2
> +
> +* add scmi nodes to the Driver domain partial device tree the same way as above (toolstack case) and
> +  enable access to the "arm,scmi-shmem" according to the dom0less documentation. For example:
> +
> +.. code-block:: dts
> +
> +      scmi_shm_0: sram@22001000 {
> +            compatible = "arm,scmi-shmem";
> +            reg = <0x00 0x22001000 0x00 0x1000>;
> +    ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;

this should be 0x47ff2000 ?


> +    ->        xen,force-assign-without-iommu;
> +      };
> +
> +* For SCMI device access control configure pass-through devices in the guest partial DT according to
> +  the dom0less documentation and ensure that devices SCMI management has "xen,path" property set:
> +
> +Example (dom0less, multi-agent):
> +
> +.. code-block:: dts
> +
> +  chosen {
> +    xen {
> +      ranges;
> +      xen_scmi_config {
> +        compatible = "xen,sci";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        /* Xen management channel shared memory */
> +        scmi_shm_1: sram@47ff1000 {
> +          compatible = "arm,scmi-shmem";
> +          reg = <0x0 0x47ff1000 0x0 0x1000>;
> +        };
> +
> +        scmi_shm_domu: sram@47ff2000 {
> +          compatible = "arm,scmi-shmem";
> +          reg = <0x0 0x47ff2000 0x0 0x1000>;
> +        };
> +
> +        scmi-secondary-agents = <
> +          0x82000004 &scmi_shm_domu 2>;
> +        #scmi-secondary-agents-cells = <3>;
> +
> +        scmi_xen: scmi {
> +          compatible = "arm,scmi-smc";
> +          arm,smc-id = <0x82000003>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          #access-controller-cells = <1>;
> +          shmem = <&scmi_shm_1>;
> +        };
> +      };
> +    };
> +
> +    xen,domain@1 {
> +      compatible = "xen,domain";
> +      xen,sci_type = "scmi_smc_multiagent";
> +      xen,sci-agent-id = <2>;
> +      /* other domain properties here */
> +    };
> +  };
> +
> +.. code-block:: dts
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

