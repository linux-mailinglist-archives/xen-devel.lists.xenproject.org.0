Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F4B35056
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 02:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093734.1449141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhhY-0005iP-GL; Tue, 26 Aug 2025 00:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093734.1449141; Tue, 26 Aug 2025 00:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhhY-0005gt-9S; Tue, 26 Aug 2025 00:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1093734;
 Tue, 26 Aug 2025 00:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAYs=3G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uqhhW-0005gn-85
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 00:38:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede14f0e-8214-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 02:38:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F28F5419A8;
 Tue, 26 Aug 2025 00:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211BAC4CEED;
 Tue, 26 Aug 2025 00:38:02 +0000 (UTC)
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
X-Inumbo-ID: ede14f0e-8214-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756168683;
	bh=61dTSQG6PWxphczi3A8mngGJKQHPzl6uVQQSMcYnGZ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XYK7q3JokTLngkrgSTKUZ5wbs49uq3L4GgHDKnDXbsX9TFhvYKp6GAebcGHIS1XM7
	 lU76SuudyNvdyo8aU7Zzw5GZNHhXyEv/dZXfVxyfbKE3RqhLZNlNEhl/GGYmdwNvSY
	 xIJOj2aq7CBOoZ25wvQ0jxEWIAb/Xr+lyIDKW1o3olN0RqNzoZGzgN4pgEVUPV49Oo
	 zuVl8mNVOTGOe68Yfyx6N+7HBaJzZSVuwtXfEbKZoKbbYk6qitBy5OTOw19pO4M0sg
	 pKupm7ULuayGbzvhh1lnF9wF8GhF0lwTwlygfNd2frSy8yTVDXunOc2iHcroggBrl/
	 Ac5fCCRJN7Q4g==
Date: Mon, 25 Aug 2025 17:37:56 -0700 (PDT)
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
Subject: Re: [RFC PATCH v5 09/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
In-Reply-To: <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508251737510.3391208@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> (TF-A) which provides SCMI interface with multi-agnet support, as shown

multi-agent


> below.
> 
>   +-----------------------------------------+
>   |                                         |
>   | EL3 TF-A SCMI                           |
>   +-------+--+-------+--+-------+--+-------++
>   |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
>   +-----+-+  +---+---+  +--+----+  +---+---+
> smc-id1 |        |         |           |
> agent1  |        |         |           |
>   +-----v--------+---------+-----------+----+
>   |              |         |           |    |
>   |              |         |           |    |
>   +--------------+---------+-----------+----+
>          smc-id0 |  smc-id2|    smc-idX|
>          agent0  |  agent2 |    agentX |
>                  |         |           |
>             +----v---+  +--v-----+  +--v-----+
>             |        |  |        |  |        |
>             | Dom0   |  | Dom1   |  | DomX   |
>             |        |  |        |  |        |
>             |        |  |        |  |        |
>             +--------+  +--------+  +--------+
> 
> The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
> memory transport for every Agent in the system.
> 
> The SCMI Agent transport channel defined by pair:
>  - smc-id: SMC/HVC id used for Doorbell
>  - shmem: shared memory for messages transfer, Xen page
>  aligned. Shared memort is mapped with the following flags:
>  MT_DEVICE_nGnRE.
> 
> The follwoing SCMI Agents expected to be defined by SCMI FW to enable SCMI
> multi-agent functionality under Xen:
> - Xen manegement agent: trusted agents that accesses to the Base Protocol

management


> commands to configure agent specific permissions
> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
>   allowed direct HW access. At least one OSPM VM agent has to be provided
>   by FW if HW is handled only by Dom0 or Driver Domain.
> 
> The EL3 SCMI FW expected to implement following Base protocol messages:
> - BASE_DISCOVER_AGENT (optional if agent_id was provided)
> - BASE_RESET_AGENT_CONFIGURATION (optional)
> - BASE_SET_DEVICE_PERMISSIONS (optional)
> 
> The SCI SCMI SMC multi-agent driver implements following
> functionality:
> - The driver is initialized based on the ``xen,config`` node under ``chosen``
>   (only one SCMI interface is supported), which describes the Xen management
>   agent SCMI interface.
> 
> scmi_shm_1: sram@47ff1000 {
>           compatible = "arm,scmi-shmem";
>           reg = <0x0 0x47ff1000 0x0 0x1000>;
> };
> scmi_xen: scmi {
>         compatible = "arm,scmi-smc";
>         arm,smc-id = <0x82000003>; <--- Xen manegement agent smc-id
>         #address-cells = < 1>;
>         #size-cells = < 0>;
>         #access-controller-cells = < 1>;
>         shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
> };
> 
> - The driver obtains Xen specific SCMI Agent's configuration from the Host DT, probes Agents and
>   builds SCMI Agents list. The Agents configuration is taken from "scmi-secondary-agents"
>   property where first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and third is
>   optional "agent_id":
> 
> chosen {
>   ranges;
>   xen,config {

The node name could be xen-config, but it doesn't matter because we
should check for the compatible string instead (no check on node name).

We need to add a compatible string here, I would use "xen,scmi":

    compatible = "xen,scmi";


>     ranges;
>     scmi-secondary-agents = <
>                   0x82000003 &scmi_shm_0 0
>                   0x82000004 &scmi_shm_2 2
>                   0x82000005 &scmi_shm_3 3
>                   0x82000006 &scmi_shm_4 4>;
>     #scmi-secondary-agents-cells = <3>; <--- optional, default 3
> 
>     scmi_shm_0 : sram@47ff0000 {
>         compatible = "arm,scmi-shmem";
>         reg = <0x0 0x47ff0000 0x0 0x1000>;
>     };
> 
>     scmi_shm_2: sram@47ff2000 {
>             compatible = "arm,scmi-shmem";
>             reg = <0x0 0x47ff2000 0x0 0x1000>;
>     };
>     scmi_shm_3: sram@47ff3000 {
>             compatible = "arm,scmi-shmem";
>             reg = <0x0 0x47ff3000 0x0 0x1000>;
>     };
>     scmi_shm_4: sram@47ff4000 {
>             compatible = "arm,scmi-shmem";
>             reg = <0x0 0x47ff4000 0x0 0x1000>;
>     };
> 
>     // Xen SCMI management channel
>     scmi_shm_1: sram@47ff1000 {
>             compatible = "arm,scmi-shmem";
>             reg = <0x0 0x47ff1000 0x0 0x1000>;
>     };
> 
>     scmi_xen: scmi {
>         compatible = "arm,scmi-smc";
>         arm,smc-id = <0x82000002>; <--- Xen manegement agent smc-id
>         #address-cells = < 1>;
>         #size-cells = < 0>;
>         #access-controller-cells = < 1>;
>         shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
>     };
>   };
> };
> 
> /{
>     // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI enabled for it
>     scmi_shm: sram@47ff0000 {
>             compatible = "arm,scmi-shmem";
>             reg = <0x0 0x47ff0000 0x0 0x1000>;
>     };
> 
>     firmware {
>         scmi: scmi {
>             compatible = "arm,scmi-smc";
>             arm,smc-id = <0x82000002>; <--- Host OSPM agent smc-id
>             #address-cells = < 1>;
>             #size-cells = < 0>;
>             shmem = <&scmi_shm>; <--- Host OSPM agent shmem
> 
>             protocol@X{
>             };
>         };
>     };
> };
> 
> This approach allows defining multiple SCMI Agents by adding Xen-specific properties under
> the ``/chosen`` node to the Host Device Tree, leaving the main part unchanged. The Host DT
> SCMI channel will be passed to Dom0.
> 
> The Xen management agent is described as a ``scmi_xen`` node under the ``/chosen`` node, which
> is used by Xen to control other SCMI Agents in the system.
> 
> All secondary agents' configurations are provided in the ``scmi-secondary-agents`` property with
> an optional ``agent_id`` field.
> 
> The ``agent_id`` from the ``scmi-secondary-agents`` property is used to identify the agent in the
> system and can be omitted by setting ``#scmi-secondary-agents-cells = <2>``, so the Secondary
> Agents configuration will look like this:
> 
> chosen {
>   xen,config {
>     scmi-secondary-agents = <
>                   0x82000003 &scmi_shm_0
>                   0x82000004 &scmi_shm_2
>                   0x82000005 &scmi_shm_3
>                   0x82000006 &scmi_shm_4>;
>     #scmi-secondary-agents-cells = <2>;
>   };
> }
> 
> In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to discover the ``agent_id``
> for each secondary agent. Providing the ``agent_id`` in the ``scmi-secondary-agents`` property
> allows skipping the discovery call, which is useful when the secondary agent's shared memory is
> not accessible by Xen or when boot time is important because it allows skipping the agent
> discovery procedure.
> 
>   Note that Xen is the only one entry in the system which need to know
>   about SCMI multi-agent support.
> 
> - It implements the SCI subsystem interface required for configuring and
> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> SCMI functionality for domain it has to be configured with unique supported
> SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
> [smc-id, shmem] defined for this SCMI Agent_id.
> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
>   -- zero-copy, the guest domain puts SCMI message in shmem;
>   -- the guest triggers SMC/HVC exception with smc-id (doorbell);
>   -- the Xen driver catches exception, do checks and synchronously forwards
>   it to EL3 FW.
> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
>   management agent channel on domain destroy event. This allows to reset
>   resources used by domain and so implement use-case like domain reboot.
> 
> Dom0 Enable SCMI SMC:
>  - pass dom0_scmi_agent_id=<agent_id> in Xen command line. if not provided
>    SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
>    The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
>    node according to assigned agent_id.
> 
> Guest domains enable SCMI SMC:
>  - xl.cfg: add configuration option as below
> 
>    arm_sci = "type=scmi_smc_multiagent,agent_id=2"
> 
>  - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond assigned agent_id for
>    the domain, for example:
> 
> iomem = [
>     "47ff2,1@22001",
> ]
> 
>  - DT: add SCMI nodes to the Driver domain partial device tree as in the
>  below example. The "arm,smc-id" should correspond assigned agent_id for the domain:
> 
> passthrough {
>    scmi_shm_0: sram@22001000 {
>        compatible = "arm,scmi-shmem";
>        reg = <0x0 0x22001000 0x0 0x1000>;
>    };
> 
>    firmware {
>         compatible = "simple-bus";
>             scmi: scmi {
>                 compatible = "arm,scmi-smc";
>                 arm,smc-id = <0x82000004>;
>                 shmem = <&scmi_shm_0>;
>                 ...
>             }
>     }
> }
> 
> SCMI "4.2.1.1 Device specific access control"
> 
> The XEN SCI SCMI SMC multi-agent driver performs "access-controller" provider function
> in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and provides the
> BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents have access to.
> The DT SCMI node should "#access-controller-cells=<1>" property and DT devices should be bound
> to the Xen SCMI.
> 
> &i2c1 {
> 	access-controllers = <&scmi 0>;
> };
> 
> The Dom0 and dom0less domains DT devices will be processed automatically through
> sci_assign_dt_device() call, but to assign SCMI devices from toolstack the xl.cfg:"dtdev" property
> shell be used:

shall

> 
> dtdev = [
>     "/soc/i2c@e6508000",
> ]
> 
> xl.cfg:dtdev will contain all nodes which are under SCMI management (not only those which are behind IOMMU).
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> [2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> 
> Changes in v5:
> - fix device-tree example format in booting.txt, added ";" after "}".
> - update define in scmi-proto.h
> - update define in scmi-shmem.h file
> - scmi_assign_device - do not ignore -EOPNOTSUPP return
> code of the do_smc_xfer
> - remove overwriting agent_channel->agent_id after
> SCMI_BASE_DISCOVER_AGENT call
> - add multi-agent files to the MAINTAINERS
> - add SCMI multi-agent description to the SUPPORT.md
> - handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
> for smc call
> - updated collect_agents function. Set agent_id parameter as optional
> in scmi-secondary-agents device-tree property
> - introduce "#scmi-secondary-agents-cells" parameter to set if
> agent_id was provided
> - reanme xen,scmi-secondary-agents property to scmi-secondary-agents
> - move memcpu_toio/fromio for the generic place
> - update Xen to get management channel from /chosen/xen,config node
> - get hypervisor channnel from node instead of using hardcoded
> - update handling scmi and shmem nodes for the domain
> - Set multi-agent driver to support only Arm64
> 
> Changes in v4:
> - toolstack comments from Anthony PERARD
> - added dom0less support
> - added doc for "xen,scmi-secondary-agents"
> 
>  MAINTAINERS                                 |   4 +
>  SUPPORT.md                                  |  11 +
>  docs/man/xl.cfg.5.pod.in                    |  13 +
>  docs/misc/arm/device-tree/booting.txt       |  88 +++
>  docs/misc/xen-command-line.pandoc           |   9 +
>  tools/libs/light/libxl_arm.c                |   4 +
>  tools/libs/light/libxl_types.idl            |   4 +-
>  tools/xl/xl_parse.c                         |  12 +
>  xen/arch/arm/dom0less-build.c               |  11 +
>  xen/arch/arm/domain_build.c                 |   3 +-
>  xen/arch/arm/firmware/Kconfig               |  12 +
>  xen/arch/arm/firmware/Makefile              |   1 +
>  xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
>  xen/arch/arm/firmware/scmi-shmem.c          | 112 +++
>  xen/arch/arm/firmware/scmi-shmem.h          |  45 ++
>  xen/arch/arm/firmware/scmi-smc-multiagent.c | 803 ++++++++++++++++++++
>  xen/include/public/arch-arm.h               |   3 +
>  17 files changed, 1297 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>  create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>  create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>  create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 31dbba54bb..1b6b58cbb7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -514,6 +514,10 @@ R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>  S:	Supported
>  F:	xen/arch/arm/firmware/sci.c
>  F:	xen/arch/arm/include/asm/firmware/sci.h
> +F:	xen/arch/arm/firmware/scmi-smc-multiagent.c
> +F:	xen/arch/arm/firmware/scmi-shmem.c
> +F:	xen/arch/arm/firmware/scmi-shmem.h
> +F:	xen/arch/arm/firmware/scmi-proto.h
>  
>  SEABIOS UPSTREAM
>  M:	Wei Liu <wl@xen.org>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6a82a92189..9d7857d953 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -956,6 +956,17 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
>  
>      Status: Supported
>  
> +### Arm: SCMI SMC multi-agent support
> +
> +Enable support for the multi-agent configuration of the EL3 Firmware, which
> +allows Xen to provide an SCMI interface to the Domains.
> +Xen manages access permissions to the HW resources and provides an SCMI interface
> +to the Domains. Each Domain is represented as a separate Agent, which can
> +communicate with EL3 Firmware using a dedicated shared memory region, and
> +notifications are passed through by Xen.
> +
> +    Status, ARM64: Tech Preview
> +
>  ### ARM: Guest PSCI support
>  
>  Emulated PSCI interface exposed to guests. We support all mandatory
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 8f1a203e21..f6cf2d4567 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3103,8 +3103,21 @@ single SCMI OSPM agent support.
>  Should be used together with B<scmi_smc_passthrough> Xen command line
>  option.
>  
> +=item B<scmi_smc_multiagent>
> +
> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
> +specified for the guest.
> +
>  =back
>  
> +=item B<agent_id=NUMBER>
> +
> +Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
> +if the SCMI SMC support is enabled for the guest. The agent ids of domains
> +existing on a single host must be unique and in the range [1..255].

Why is the option mandatory if the commit description explains that the
agent_id can be probed by Xen? In the commit message, the mandatory
field is smc-id instead?

I guess it is because we expect Xen to have already the agent_id->smc-id
mapping and we expect the agent_id to be easier to remember and to write
in the config file?


>  =back
>  
>  =back
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 8ea11c1551..10a99cfd15 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -322,6 +322,20 @@ with the following properties:
>      Should be used together with scmi_smc_passthrough Xen command line
>      option.
>  
> +    - "scmi_smc_multiagent"
> +
> +    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> +    SMC calls forwarding from domain to the EL3 firmware (like ARM
> +    Trusted Firmware-A) with a multi SCMI OSPM agent support.
> +    The SCMI agent_id should be specified for the guest with "xen,sci_agent_id"
> +    property.
> +
> +- "xen,sci_agent_id"
> +
> +    Specifies a non-zero ARM SCI agent id for the guest. This option is
> +    mandatory if the SCMI SMC "scmi_smc_multiagent" support is enabled for
> +    the guest. The agent ids of guest must be unique and in the range [1..255].

same question


>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> @@ -824,3 +838,77 @@ The automatically allocated static shared memory will get mapped at
>  0x80000000 in DomU1 guest physical address space, and at 0x90000000 in DomU2
>  guest physical address space. DomU1 is explicitly defined as the owner domain,
>  and DomU2 is the borrower domain.
> +
> +SCMI SMC multi-agent support
> +============================
> +
> +For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_SMC_MA)
> +the Xen specific SCMI Agent's configuration shell be provided in the Host DT

shall


> +according to the SCMI compliant EL3 Firmware specification with
> +ARM SMC/HVC transport using property "scmi-secondary-agents" placed in "xen,config"
> +node under "chosen" node:
> +
> +- scmi-secondary-agents
> +
> +    Defines a set of SCMI agents configuration supported by SCMI EL3 FW and
> +    available for Xen. Each Agent defined as triple consisting of:
> +    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
> +    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem"),
> +    SCMI agent_id (optional) if not set - Xen will determine Agent ID for
> +    each provided channel using BASE_DISCOVER_AGENT message.
> +
> +As an example:
> +
> +/{
> +chosen {
> +    xen,config {

same comment about node name and compatible string


> +        scmi_shm_1: sram@47ff1000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff1000 0x0 0x1000>;
> +        };
> +        scmi_shm_2: sram@47ff2000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff2000 0x0 0x1000>;
> +        };
> +        scmi_shm_3: sram@47ff3000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff3000 0x0 0x1000>;
> +        };
> +        scmi_shm_3: sram@47ff4000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff4000 0x0 0x1000>;
> +        };
> +        scmi-secondary-agents = <
> +            0x82000003 &scmi_shm_1 1
> +            0x82000004 &scmi_shm_2 2
> +            0x82000005 &scmi_shm_3 3
> +            0x82000006 &scmi_shm_4 4>;
> +            #scmi-secondary-agents-cells = <3>;
> +        };
> +    };
> +};
> +
> +- #scmi-secondary-agents-cells
> +
> +    Defines whether Agent_id is set in the "scmi-secondary-agents" property.
> +    Possible values are: 2, 3.
> +    When set to 3 (the default), expect agent_id to be present in the secondary
> +    agents list.
> +    When set to 2, agent_id will be discovered for each channel using
> +    BASE_DISCOVER_AGENT message.
> +
> +
> +Example:
> +
> +/{
> +chosen {
> +    xen,config {
> +        scmi-secondary-agents = <
> +            0x82000003 &scmi_shm_1
> +            0x82000004 &scmi_shm_2
> +            0x82000005 &scmi_shm_3
> +            0x82000006 &scmi_shm_4>;
> +            #scmi-secondary-agents-cells = <2>;


In the example we should also add Xen own nodes like you did in the
commit message.


> +        };
> +    };
> +};
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 7a1f723e63..5a1c1e072c 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1105,6 +1105,15 @@ which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
>  SCMI nodes removed from Dom0/hwdom device tree.
>  (for example, thin Dom0 with Driver domain use-case).
>  
> +### dom0_scmi_agent_id (ARM)
> +> `= <integer>`
> +
> +The option is available when `CONFIG_SCMI_SMC_MA` is compiled in, and allows to
> +enable SCMI functionality for Dom0 by specifying a non-zero ARM SCMI agent id.
> +The SCMI will be disabled for Dom0 if this option is not specified
> +(for example, thin Dom0 or dom0less use-cases).
> +The agent ids of domains existing on a single host must be unique.

Same question about agent id vs. smc-id


>  ### dtuart (ARM)
>  > `= path [:options]`
>  
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e4407d6e3f..be0e6263ae 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
>          config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
>          break;
> +    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
> +        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> +        config->arch.arm_sci_agent_id = d_config->b_info.arch_arm.arm_sci.agent_id;
> +        break;
>      default:
>          LOG(ERROR, "Unknown ARM_SCI type %d",
>              d_config->b_info.arch_arm.arm_sci.type);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index c8bc0f8521..da7f87cd0c 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -553,11 +553,13 @@ libxl_sve_type = Enumeration("sve_type", [
>  
>  libxl_arm_sci_type = Enumeration("arm_sci_type", [
>      (0, "none"),
> -    (1, "scmi_smc")
> +    (1, "scmi_smc"),
> +    (2, "scmi_smc_multiagent")
>      ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
>  
>  libxl_arm_sci = Struct("arm_sci", [
>      ("type", libxl_arm_sci_type),
> +    ("agent_id", uint8)
>      ])
>  
>  libxl_rdm_reserve = Struct("rdm_reserve", [
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 68d2ebeb9f..4c05b20c06 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
>              }
>          }
>  
> +        if (MATCH_OPTION("agent_id", ptr, oparg)) {
> +            unsigned long val = parse_ulong(oparg);
> +
> +            if (!val || val > 255) {
> +                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%lu). Valid range [1..255]\n",
> +                        val);
> +                ret = ERROR_INVAL;
> +                goto parse_error;
> +            }
> +            arm_sci->agent_id = val;
> +        }
> +
>          ptr = strtok(NULL, ",");
>      }
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index d28143f98b..6ca17b0ce6 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -299,6 +299,17 @@ int __init domu_dt_sci_parse(struct dt_device_node *node,
>          d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
>      else if ( !strcmp(sci_type, "scmi_smc") )
>          d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> +    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
> +    {
> +        uint32_t agent_id = 0;
> +
> +        if ( !dt_property_read_u32(node, "xen,sci_agent_id", &agent_id) ||
> +             !agent_id )
> +            return -EINVAL;
> +
> +        d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> +        d_cfg->arch.arm_sci_agent_id = agent_id;
> +    }
>      else
>      {
>          printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n",
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 92039cf213..ea13e374a0 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -508,7 +508,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                   dt_property_name_is_equal(prop, "linux,uefi-mmap-start") ||
>                   dt_property_name_is_equal(prop, "linux,uefi-mmap-size") ||
>                   dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-size") ||
> -                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver"))
> +                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver") ||
> +                 dt_property_name_is_equal(prop, "xen,config") )
>                  continue;

please match by compatible string rather than by node name


>              if ( dt_property_name_is_equal(prop, "xen,dom0-bootargs") )
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> index 5c5f0880c4..972cd9b173 100644
> --- a/xen/arch/arm/firmware/Kconfig
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -29,6 +29,18 @@ config SCMI_SMC
>  	  driver domain.
>  	  Use with EL3 firmware which supports only single SCMI OSPM agent.
>  
> +config SCMI_SMC_MA
> +	bool "Enable ARM SCMI SMC multi-agent driver"
> +	depends on ARM_64
> +	select ARM_SCI
> +	help
> +	  Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Domains
> +	  to EL3 firmware (TF-A) which supports multi-agent feature.
> +	  This feature allows to enable SCMI per Domain using unique SCMI agent_id,
> +	  so Domain is identified by EL3 firmware as an SCMI Agent and can access
> +	  allowed platform resources through dedicated SMC/HVC Shared memory based
> +	  transport.
> +
>  endchoice
>  
>  endmenu
> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
> index 71bdefc24a..37927e690e 100644
> --- a/xen/arch/arm/firmware/Makefile
> +++ b/xen/arch/arm/firmware/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_ARM_SCI) += sci.o
>  obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
> +obj-$(CONFIG_SCMI_SMC_MA) += scmi-shmem.o scmi-smc-multiagent.o
> diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scmi-proto.h
> new file mode 100644
> index 0000000000..e290d6630d
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-proto.h
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Arm System Control and Management Interface definitions
> + * Version 3.0 (DEN0056C)
> + *
> + * Copyright (c) 2024 EPAM Systems
> + */
> +
> +#ifndef ARM_FIRMWARE_SCMI_PROTO_H_
> +#define ARM_FIRMWARE_SCMI_PROTO_H_
> +
> +#include <xen/stdint.h>
> +
> +#define SCMI_SHORT_NAME_MAX_SIZE 16
> +
> +/* SCMI status codes. See section 4.1.4 */
> +#define SCMI_SUCCESS              0
> +#define SCMI_NOT_SUPPORTED      (-1)
> +#define SCMI_INVALID_PARAMETERS (-2)
> +#define SCMI_DENIED             (-3)
> +#define SCMI_NOT_FOUND          (-4)
> +#define SCMI_OUT_OF_RANGE       (-5)
> +#define SCMI_BUSY               (-6)
> +#define SCMI_COMMS_ERROR        (-7)
> +#define SCMI_GENERIC_ERROR      (-8)
> +#define SCMI_HARDWARE_ERROR     (-9)
> +#define SCMI_PROTOCOL_ERROR     (-10)
> +
> +/* Protocol IDs */
> +#define SCMI_BASE_PROTOCOL 0x10
> +
> +/* Base protocol message IDs */
> +#define SCMI_BASE_PROTOCOL_VERSION            0x0
> +#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
> +#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
> +#define SCMI_BASE_DISCOVER_AGENT              0x7
> +#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
> +#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
> +
> +typedef struct scmi_msg_header {
> +    uint8_t id;
> +    uint8_t type;
> +    uint8_t protocol;
> +    uint32_t status;
> +} scmi_msg_header_t;
> +
> +/* Table 2 Message header format */
> +#define SCMI_HDR_ID    GENMASK(7, 0)
> +#define SCMI_HDR_TYPE  GENMASK(9, 8)
> +#define SCMI_HDR_PROTO GENMASK(17, 10)
> +
> +#define SCMI_FIELD_GET(_mask, _reg)                                            \
> +    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))

ffs64 is declared in xen/bitops.h


> +#define SCMI_FIELD_PREP(_mask, _val)                                           \
> +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> +
> +static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
> +{
> +    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
> +           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
> +           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
> +}
> +
> +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t *hdr)
> +{
> +    hdr->id = SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
> +    hdr->type = SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
> +    hdr->protocol = SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
> +}
> +
> +static inline int scmi_to_xen_errno(int scmi_status)
> +{
> +    if ( scmi_status == SCMI_SUCCESS )
> +        return 0;
> +
> +    switch ( scmi_status )
> +    {
> +    case SCMI_NOT_SUPPORTED:
> +        return -EOPNOTSUPP;
> +    case SCMI_INVALID_PARAMETERS:
> +        return -EINVAL;
> +    case SCMI_DENIED:
> +        return -EACCES;
> +    case SCMI_NOT_FOUND:
> +        return -ENOENT;
> +    case SCMI_OUT_OF_RANGE:
> +        return -ERANGE;
> +    case SCMI_BUSY:
> +        return -EBUSY;
> +    case SCMI_COMMS_ERROR:
> +        return -ENOTCONN;
> +    case SCMI_GENERIC_ERROR:
> +        return -EIO;
> +    case SCMI_HARDWARE_ERROR:
> +        return -ENXIO;
> +    case SCMI_PROTOCOL_ERROR:
> +        return -EBADMSG;
> +    default:
> +        return -EINVAL;
> +    }
> +}
> +
> +/* PROTOCOL_VERSION */
> +#define SCMI_VERSION_MINOR GENMASK(15, 0)
> +#define SCMI_VERSION_MAJOR GENMASK(31, 16)
> +
> +struct scmi_msg_prot_version_p2a {
> +    uint32_t version;
> +} __packed;
> +
> +/* BASE PROTOCOL_ATTRIBUTES */
> +#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
> +#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
> +
> +struct scmi_msg_base_attributes_p2a {
> +    uint32_t attributes;
> +} __packed;
> +
> +/*
> + * BASE_DISCOVER_AGENT
> + */
> +#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
> +
> +struct scmi_msg_base_discover_agent_a2p {
> +    uint32_t agent_id;
> +} __packed;
> +
> +struct scmi_msg_base_discover_agent_p2a {
> +    uint32_t agent_id;
> +    char name[SCMI_SHORT_NAME_MAX_SIZE];
> +} __packed;
> +
> +/*
> + * BASE_SET_DEVICE_PERMISSIONS
> + */
> +#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
> +
> +struct scmi_msg_base_set_device_permissions_a2p {
> +    uint32_t agent_id;
> +    uint32_t device_id;
> +    uint32_t flags;
> +} __packed;
> +
> +/*
> + * BASE_RESET_AGENT_CONFIGURATION
> + */
> +#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
> +
> +struct scmi_msg_base_reset_agent_cfg_a2p {
> +    uint32_t agent_id;
> +    uint32_t flags;
> +} __packed;
> +
> +#endif /* ARM_FIRMWARE_SCMI_PROTO_H_ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scmi-shmem.c
> new file mode 100644
> index 0000000000..8fc8ca356b
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-shmem.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (c) 2025 EPAM Systems
> + */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <asm/io.h>
> +#include <xen/err.h>
> +#include <xen/lib/arm/io.h>
> +
> +#include "scmi-proto.h"
> +#include "scmi-shmem.h"
> +
> +static inline int
> +shmem_channel_is_free(const volatile struct scmi_shared_mem __iomem *shmem)
> +{
> +    return (readl(&shmem->channel_status) &
> +            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
> +}
> +
> +int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
> +                      scmi_msg_header_t *hdr, void *data, int len)
> +{
> +    int ret;
> +
> +    if ( (len + sizeof(shmem->msg_header)) > SCMI_SHMEM_MAPPED_SIZE )

shouldn't this take into account offsetof(struct scmi_shared_mem,
msg_header) ?




> +    {
> +        printk(XENLOG_ERR "scmi: Wrong size of smc message. Data is invalid\n");
> +        return -EINVAL;
> +    }
> +
> +    ret = shmem_channel_is_free(shmem);
> +    if ( ret )
> +        return ret;
> +
> +    writel_relaxed(0x0, &shmem->channel_status);
> +    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set */
> +    writel_relaxed(0x0, &shmem->flags);
> +    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
> +    writel(pack_scmi_header(hdr), &shmem->msg_header);
> +
> +    if ( len > 0 && data )
> +        __memcpy_toio(shmem->msg_payload, data, len);
> +
> +    return 0;
> +}
> +
> +int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shmem,
> +                       scmi_msg_header_t *hdr, void *data, int len)
> +{
> +    int recv_len;
> +    int ret;
> +    int pad = sizeof(hdr->status);
> +
> +    if ( len >= SCMI_SHMEM_MAPPED_SIZE - sizeof(shmem) )

should this be sizeof(*shmem) ?


> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Wrong size of input smc message. Data may be invalid\n");
> +        return -EINVAL;
> +    }
> +
> +    ret = shmem_channel_is_free(shmem);
> +    if ( ret )
> +        return ret;
> +
> +    recv_len = readl(&shmem->length) - sizeof(shmem->msg_header);
> +
> +    if ( recv_len < 0 )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Wrong size of smc message. Data may be invalid\n");
> +        return -EINVAL;
> +    }
> +
> +    unpack_scmi_header(readl(&shmem->msg_header), hdr);
> +
> +    hdr->status = readl(&shmem->msg_payload);
> +    recv_len = recv_len > pad ? recv_len - pad : 0;
> +
> +    ret = scmi_to_xen_errno(hdr->status);
> +    if ( ret )
> +    {
> +        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
> +        return ret;
> +    }
> +
> +    if ( recv_len > len )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Not enough buffer for message %d, expecting %d\n",
> +               recv_len, len);
> +        return -EINVAL;
> +    }
> +
> +    if ( recv_len > 0 )
> +        __memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/scmi-shmem.h
> new file mode 100644
> index 0000000000..7313cb6b26
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-shmem.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Arm System Control and Management Interface definitions
> + * Version 3.0 (DEN0056C)
> + * Shared Memory based Transport
> + *
> + * Copyright (c) 2024 EPAM Systems
> + */
> +
> +#ifndef ARM_FIRMWARE_SCMI_SHMEM_H_
> +#define ARM_FIRMWARE_SCMI_SHMEM_H_
> +
> +#include <xen/stdint.h>
> +
> +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
> +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
> +
> +struct scmi_shared_mem {
> +    uint32_t reserved;
> +    uint32_t channel_status;
> +    uint32_t reserved1[2];
> +    uint32_t flags;
> +    uint32_t length;
> +    uint32_t msg_header;
> +    uint8_t msg_payload[];
> +};
> +
> +#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
> +
> +int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
> +                      scmi_msg_header_t *hdr, void *data, int len);
> +
> +int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shmem,
> +                       scmi_msg_header_t *hdr, void *data, int len);
> +#endif /* ARM_FIRMWARE_SCMI_SHMEM_H_ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/firmware/scmi-smc-multiagent.c
> new file mode 100644
> index 0000000000..9f839147d4
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
> @@ -0,0 +1,803 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (c) 2025 EPAM Systems
> + */
> +
> +#include <xen/acpi.h>
> +
> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +#include <xen/iocap.h>
> +#include <xen/err.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <xen/vmap.h>
> +
> +#include <asm/firmware/sci.h>
> +#include <asm/smccc.h>
> +
> +#include "scmi-proto.h"
> +#include "scmi-shmem.h"
> +
> +#define SCMI_AGENT_ID_INVALID 0xFF
> +
> +static uint8_t __initdata opt_dom0_scmi_agent_id = SCMI_AGENT_ID_INVALID;
> +integer_param("dom0_scmi_agent_id", opt_dom0_scmi_agent_id);
> +
> +#define SCMI_SECONDARY_AGENTS "scmi-secondary-agents"
> +
> +struct scmi_channel {
> +    uint32_t agent_id;
> +    uint32_t func_id;
> +    domid_t domain_id;
> +    uint64_t paddr;
> +    uint64_t len;

doesn't seem to be used


> +    struct scmi_shared_mem __iomem *shmem;
> +    spinlock_t lock;
> +    struct list_head list;
> +};
> +
> +struct scmi_data {
> +    struct list_head channel_list;
> +    spinlock_t channel_list_lock;
> +    uint32_t func_id;
> +    bool initialized;
> +    uint32_t shmem_phandle;
> +    uint32_t hyp_channel_agent_id;
> +    struct dt_device_node *dt_dev;
> +};
> +
> +static struct scmi_data scmi_data;
> +
> +static int send_smc_message(struct scmi_channel *chan_info,
> +                            scmi_msg_header_t *hdr, void *data, int len)
> +{
> +    struct arm_smccc_res resp;
> +    int ret;
> +
> +    ret = shmem_put_message(chan_info->shmem, hdr, data, len);
> +    if ( ret )
> +        return ret;
> +
> +    arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0, &resp);
> +
> +    if ( resp.a0 == ARM_SMCCC_INVALID_PARAMETER )
> +        return -EINVAL;
> +
> +    if ( resp.a0 )
> +        return -EOPNOTSUPP;
> +
> +    return 0;
> +}
> +
> +static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_t *hdr,
> +                       void *tx_data, int tx_size, void *rx_data, int rx_size)
> +{
> +    int ret = 0;
> +
> +    ASSERT(chan_info && chan_info->shmem);
> +
> +    if ( !hdr )
> +        return -EINVAL;
> +
> +    spin_lock(&chan_info->lock);
> +
> +    printk(XENLOG_DEBUG
> +           "scmi: agent_id = %d msg_id = %x type = %d, proto = %x\n",
> +           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
> +
> +    ret = send_smc_message(chan_info, hdr, tx_data, tx_size);
> +    if ( ret )
> +        goto clean;
> +
> +    ret = shmem_get_response(chan_info->shmem, hdr, rx_data, rx_size);
> +
> +clean:
> +    printk(XENLOG_DEBUG
> +           "scmi: get smc response agent_id = %d msg_id = %x proto = %x res=%d\n",
> +           chan_info->agent_id, hdr->id, hdr->protocol, ret);
> +
> +    spin_unlock(&chan_info->lock);
> +
> +    return ret;
> +}
> +
> +static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
> +{
> +    struct scmi_channel *curr;
> +    bool found = false;
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> +    {
> +        if ( curr->agent_id == agent_id )
> +        {
> +            found = true;
> +            break;
> +        }
> +    }
> +
> +    spin_unlock(&scmi_data.channel_list_lock);
> +    if ( found )
> +        return curr;
> +
> +    return NULL;
> +}
> +
> +static struct scmi_channel *acquire_scmi_channel(struct domain *d,
> +                                                 uint32_t agent_id)
> +{
> +    struct scmi_channel *curr;
> +    struct scmi_channel *ret = ERR_PTR(-ENOENT);
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> +    {
> +        if ( curr->agent_id == agent_id )
> +        {
> +            if ( curr->domain_id != DOMID_INVALID )
> +            {
> +                ret = ERR_PTR(-EEXIST);
> +                break;
> +            }
> +
> +            curr->domain_id = d->domain_id;
> +            ret = curr;
> +            break;
> +        }
> +    }
> +
> +    spin_unlock(&scmi_data.channel_list_lock);
> +
> +    return ret;
> +}
> +
> +static void relinquish_scmi_channel(struct scmi_channel *channel)
> +{
> +    ASSERT(channel != NULL);
> +
> +    spin_lock(&scmi_data.channel_list_lock);
> +    channel->domain_id = DOMID_INVALID;
> +    spin_unlock(&scmi_data.channel_list_lock);
> +}
> +
> +static int map_channel_memory(struct scmi_channel *channel)
> +{
> +    ASSERT(channel && channel->paddr);
> +    channel->shmem = ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPED_SIZE);
> +    if ( !channel->shmem )
> +        return -ENOMEM;
> +
> +    channel->shmem->channel_status = SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
> +    printk(XENLOG_DEBUG "scmi: Got shmem %lx after vmap %p\n", channel->paddr,
> +           channel->shmem);
> +
> +    return 0;
> +}
> +
> +static void unmap_channel_memory(struct scmi_channel *channel)
> +{
> +    ASSERT(channel && channel->shmem);
> +    iounmap(channel->shmem);
> +    channel->shmem = NULL;
> +}
> +
> +static struct scmi_channel *smc_create_channel(uint32_t agent_id,
> +                                               uint32_t func_id, uint64_t addr)
> +{
> +    struct scmi_channel *channel;
> +
> +    channel = get_channel_by_id(agent_id);
> +    if ( channel )
> +        return ERR_PTR(EEXIST);
> +
> +    channel = xmalloc(struct scmi_channel);
> +    if ( !channel )
> +        return ERR_PTR(ENOMEM);
> +
> +    spin_lock_init(&channel->lock);
> +    channel->agent_id = agent_id;
> +    channel->func_id = func_id;
> +    channel->domain_id = DOMID_INVALID;
> +    channel->shmem = NULL;
> +    channel->paddr = addr;
> +    list_add_tail(&channel->list, &scmi_data.channel_list);
> +    return channel;
> +}
> +
> +static void free_channel_list(void)
> +{
> +    struct scmi_channel *curr, *_curr;
> +
> +    list_for_each_entry_safe(curr, _curr, &scmi_data.channel_list, list)
> +    {
> +        list_del(&curr->list);
> +        xfree(curr);
> +    }
> +}
> +
> +static int __init
> +scmi_dt_read_hyp_channel_addr(struct dt_device_node *scmi_node, u64 *addr,
> +                              u64 *size)
> +{
> +    struct dt_device_node *shmem_node;
> +    const __be32 *prop;
> +
> +    prop = dt_get_property(scmi_node, "shmem", NULL);
> +    if ( !prop )
> +        return -EINVAL;
> +
> +    shmem_node = dt_find_node_by_phandle(be32_to_cpu(*prop));
> +    if ( IS_ERR_OR_NULL(shmem_node) )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Device tree error, can't parse reserved memory %ld\n",
> +               PTR_ERR(shmem_node));
> +        return PTR_ERR(shmem_node);
> +    }
> +
> +    return dt_device_get_address(shmem_node, 0, addr, size);
> +}
> +
> +/*
> + * Handle Dom0 SCMI specific DT nodes
> + *
> + * Make a decision on copying SCMI specific nodes into Dom0 device tree.
> + * For SCMI multi-agent case:
> + * - shmem nodes will not be copied and generated instead if SCMI
> + *   is enabled for Dom0
> + * - scmi node will be copied if SCMI is enabled for Dom0
> + */
> +static bool scmi_dt_handle_node(struct domain *d, struct dt_device_node *node)
> +{
> +    static const struct dt_device_match shmem_matches[] __initconst = {
> +        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
> +        { /* sentinel */ },
> +    };
> +    static const struct dt_device_match scmi_matches[] __initconst = {
> +        DT_MATCH_PATH("/firmware/scmi"),
> +        { /* sentinel */ },
> +    };
> +
> +    if ( !scmi_data.initialized )
> +        return false;
> +
> +    /* skip scmi shmem node for dom0 if scmi not enabled */
> +    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
> +    {
> +        dt_dprintk("  Skip scmi shmem node\n");
> +        return true;
> +    }
> +
> +    /* drop scmi if not enabled */
> +    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
> +    {
> +        dt_dprintk("  Skip scmi node\n");
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
> +                              uint32_t flags)
> +{
> +    struct scmi_msg_base_set_device_permissions_a2p tx;
> +    struct scmi_channel *channel;
> +    scmi_msg_header_t hdr;
> +
> +    channel = get_channel_by_id(scmi_data.hyp_channel_agent_id);
> +    if ( !channel )
> +        return -EINVAL;
> +
> +    hdr.id = SCMI_BASE_SET_DEVICE_PERMISSIONS;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    tx.agent_id = agent_id;
> +    tx.device_id = device_id;
> +    tx.flags = flags;
> +
> +    return do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
> +}
> +
> +static int scmi_dt_assign_device(struct domain *d,
> +                                 struct dt_phandle_args *ac_spec)
> +{
> +    struct scmi_channel *agent_channel;
> +    uint32_t scmi_device_id = ac_spec->args[0];
> +    int ret;
> +
> +    if ( !d->arch.sci_data )
> +        return 0;
> +
> +    /* The access-controllers is specified for DT dev, but it's not a SCMI */
> +    if ( ac_spec->np != scmi_data.dt_dev )
> +        return 0;
> +
> +    agent_channel = d->arch.sci_data;
> +
> +    spin_lock(&agent_channel->lock);
> +
> +    ret = scmi_assign_device(agent_channel->agent_id, scmi_device_id,
> +                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)",
> +               d, agent_channel->agent_id, scmi_device_id, ret);
> +    }
> +
> +    spin_unlock(&agent_channel->lock);
> +    return ret;
> +}
> +
> +static int collect_agent_id(struct scmi_channel *agent_channel)
> +{
> +    int ret;
> +    scmi_msg_header_t hdr;
> +    struct scmi_msg_base_discover_agent_p2a da_rx;
> +    struct scmi_msg_base_discover_agent_a2p da_tx;
> +
> +    ret = map_channel_memory(agent_channel);
> +    if ( ret )
> +        return ret;
> +
> +    hdr.id = SCMI_BASE_DISCOVER_AGENT;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    da_tx.agent_id = agent_channel->agent_id;
> +
> +    ret = do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx), &da_rx,
> +                        sizeof(da_rx));
> +    if ( agent_channel->domain_id != DOMID_XEN )
> +        unmap_channel_memory(agent_channel);
> +    if ( ret )
> +        return ret;
> +
> +    printk(XENLOG_DEBUG "id=0x%x name=%s\n", da_rx.agent_id, da_rx.name);
> +    agent_channel->agent_id = da_rx.agent_id;
> +    return 0;
> +}
> +
> +static __init int collect_agents(struct dt_device_node *scmi_node)
> +{
> +    const struct dt_device_node *config_node;
> +    const __be32 *prop;
> +    uint32_t len;
> +    const __be32 *end;
> +    uint32_t cells_per_entry = 3; /* Default to 3 cells if property is absent. */
> +
> +    config_node = dt_find_node_by_path("/chosen/xen,config");

Please use compatible strings, not paths


> +    if ( !config_node )
> +    {
> +        printk(XENLOG_WARNING "scmi: /chosen/xen,config node not found, no agents to collect.\n");
> +        return -ENOENT;
> +    }
> +
> +    /* Check for the optional '#scmi-secondary-agents-cells' property. */
> +    if ( dt_property_read_u32(config_node, "#scmi-secondary-agents-cells",
> +                              &cells_per_entry) )
> +    {
> +        if ( cells_per_entry != 2 && cells_per_entry != 3 )
> +        {
> +            printk(XENLOG_ERR "scmi: Invalid #scmi-secondary-agents-cells value: %u\n",
> +                   cells_per_entry);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    prop = dt_get_property(config_node, SCMI_SECONDARY_AGENTS, &len);
> +    if ( !prop )
> +    {
> +        /* This is not an error, as there may be no secondary agents. */
> +        printk(XENLOG_WARNING "scmi: No %s property found, no agents to collect.\n",
> +               SCMI_SECONDARY_AGENTS);
> +        return -EINVAL;

While the comment says this is not a fatal error, returning -EINVAL
leads to scmi_probe taking the error path

> +    }
> +
> +    /* Validate that the property length is a multiple of the cell size. */
> +    if ( len == 0 || len % (cells_per_entry * sizeof(uint32_t)) != 0 )
> +    {
> +        printk(XENLOG_ERR "scmi: Invalid length of %s property: %u for %u cells per entry\n",
> +               SCMI_SECONDARY_AGENTS, len, cells_per_entry);
> +        return -EINVAL;
> +    }
> +
> +    end = (const __be32 *)((const u8 *)prop + len);
> +
> +    for ( ; prop < end; )
> +    {
> +        uint32_t agent_id;
> +        uint32_t smc_id;
> +        uint32_t shmem_phandle;
> +        struct dt_device_node *node;
> +        u64 addr, size;
> +        int ret;
> +        struct scmi_channel *agent_channel;
> +
> +        smc_id = be32_to_cpu(*prop++);
> +        shmem_phandle = be32_to_cpu(*prop++);
> +
> +        if ( cells_per_entry == 3 )
> +            agent_id = be32_to_cpu(*prop++);
> +        else
> +            agent_id = SCMI_BASE_AGENT_ID_OWN;
> +
> +        node = dt_find_node_by_phandle(shmem_phandle);
> +        if ( !node )
> +        {
> +            printk(XENLOG_ERR "scmi: Could not find shmem node for agent %u\n",
> +                   agent_id);
> +            return -EINVAL;
> +        }
> +
> +        ret = dt_device_get_address(node, 0, &addr, &size);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR
> +                   "scmi: Could not read shmem address for agent %u: %d\n",
> +                   agent_id, ret);
> +            return ret;

why no "goto error" ?

> +        }
> +
> +        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )

should we also check that size % SCMI_SHMEM_MAPPED_SIZE == 0 ?


> +        {
> +            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
> +            return -EINVAL;
> +        }
> +
> +        agent_channel = smc_create_channel(agent_id, smc_id, addr);
> +        if ( IS_ERR(agent_channel) )
> +        {
> +            printk(XENLOG_ERR "scmi: Could not create channel for agent %u: %ld\n",
> +                   agent_id, PTR_ERR(agent_channel));
> +            return PTR_ERR(agent_channel);
> +        }
> +
> +        if ( cells_per_entry == 2 )
> +        {
> +            ret = collect_agent_id(agent_channel);
> +            if ( ret )
> +                return ret;
> +        }
> +
> +        printk(XENLOG_DEBUG "scmi: Agent %u SMC %X addr %lx\n", agent_channel->agent_id,
> +               smc_id, (unsigned long)addr);
> +    }
> +
> +    return 0;
> +}
> +
> +static int scmi_domain_init(struct domain *d,
> +                            struct xen_domctl_createdomain *config)
> +{
> +    struct scmi_channel *channel;
> +    int ret;
> +
> +    if ( !scmi_data.initialized )
> +        return 0;
> +
> +    /*
> +     * Special case for Dom0 - the SCMI support is enabled basing on
> +     * "dom0_sci_agent_id" Xen command line parameter
> +     */
> +    if ( is_hardware_domain(d) )
> +    {
> +        if ( opt_dom0_scmi_agent_id != SCMI_AGENT_ID_INVALID )
> +        {
> +            config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> +            config->arch.arm_sci_agent_id = opt_dom0_scmi_agent_id;
> +        }
> +        else
> +            config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> +    }
> +
> +    if ( config->arch.arm_sci_type == XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
> +        return 0;
> +
> +    channel = acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
> +    if ( IS_ERR(channel) )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Failed to acquire SCMI channel for agent_id %u: %ld\n",
> +               config->arch.arm_sci_agent_id, PTR_ERR(channel));
> +        return PTR_ERR(channel);
> +    }
> +
> +    printk(XENLOG_INFO
> +           "scmi: Acquire channel id = 0x%x, domain_id = %d paddr = 0x%lx\n",
> +           channel->agent_id, channel->domain_id, channel->paddr);
> +
> +    /*
> +     * Dom0 (if present) needs to have an access to the guest memory range
> +     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permission
> +     * domctl.
> +     */
> +    if ( hardware_domain && !is_hardware_domain(d) )
> +    {
> +        ret = iomem_permit_access(hardware_domain, paddr_to_pfn(channel->paddr),
> +                                  paddr_to_pfn(channel->paddr + PAGE_SIZE - 1));
> +        if ( ret )
> +            goto error;
> +    }
> +
> +    d->arch.sci_data = channel;
> +    d->arch.sci_enabled = true;
> +
> +    return 0;
> +
> +error:
> +    relinquish_scmi_channel(channel);
> +    return ret;
> +}
> +
> +int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +{
> +    if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
> +         config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA )
> +    {
> +        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
> +        return -EINVAL;
> +    }
> +    else if ( config->arch.arm_sci_type ==
> +              XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA &&
> +              config->arch.arm_sci_agent_id == 0 )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "scmi: A zero ARM SCMI agent_id is not supported\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int scmi_relinquish_resources(struct domain *d)
> +{
> +    int ret;
> +    struct scmi_channel *channel, *agent_channel;
> +    scmi_msg_header_t hdr;
> +    struct scmi_msg_base_reset_agent_cfg_a2p tx;
> +
> +    if ( !d->arch.sci_data )
> +        return 0;
> +
> +    agent_channel = d->arch.sci_data;
> +
> +    spin_lock(&agent_channel->lock);
> +    tx.agent_id = agent_channel->agent_id;
> +    spin_unlock(&agent_channel->lock);
> +
> +    channel = get_channel_by_id(scmi_data.hyp_channel_agent_id);
> +    if ( !channel )
> +    {
> +        printk(XENLOG_ERR
> +               "scmi: Unable to get Hypervisor scmi channel for domain %d\n",
> +               d->domain_id);
> +        return -EINVAL;
> +    }
> +
> +    hdr.id = SCMI_BASE_RESET_AGENT_CONFIGURATION;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    tx.flags = 0;
> +
> +    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
> +    if ( ret == -EOPNOTSUPP )
> +        return 0;
> +
> +    return ret;
> +}
> +
> +static void scmi_domain_destroy(struct domain *d)
> +{
> +    struct scmi_channel *channel;
> +
> +    if ( !d->arch.sci_data )
> +        return;
> +
> +    channel = d->arch.sci_data;
> +    spin_lock(&channel->lock);
> +
> +    relinquish_scmi_channel(channel);
> +    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
> +
> +    d->arch.sci_data = NULL;
> +    d->arch.sci_enabled = true;

Should this be false?


> +    spin_unlock(&channel->lock);
> +}
> +
> +static bool scmi_handle_call(struct cpu_user_regs *regs)
> +{
> +    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
> +    struct scmi_channel *agent_channel;
> +    struct domain *d = current->domain;
> +    struct arm_smccc_res resp;
> +    bool res = false;
> +
> +    if ( !sci_domain_is_enabled(d) )
> +        return false;
> +
> +    agent_channel = d->arch.sci_data;
> +    spin_lock(&agent_channel->lock);
> +
> +    if ( agent_channel->func_id != fid )
> +    {
> +        res = false;
> +        goto unlock;
> +    }
> +
> +    arm_smccc_1_1_smc(fid,
> +                      get_user_reg(regs, 1),
> +                      get_user_reg(regs, 2),
> +                      get_user_reg(regs, 3),
> +                      get_user_reg(regs, 4),
> +                      get_user_reg(regs, 5),
> +                      get_user_reg(regs, 6),
> +                      get_user_reg(regs, 7),
> +                      &resp);
> +
> +    set_user_reg(regs, 0, resp.a0);
> +    set_user_reg(regs, 1, resp.a1);
> +    set_user_reg(regs, 2, resp.a2);
> +    set_user_reg(regs, 3, resp.a3);
> +    res = true;
> +unlock:
> +    spin_unlock(&agent_channel->lock);
> +
> +    return res;
> +}
> +
> +static const struct sci_mediator_ops scmi_ops = {
> +    .domain_init = scmi_domain_init,
> +    .domain_destroy = scmi_domain_destroy,
> +    .relinquish_resources = scmi_relinquish_resources,
> +    .handle_call = scmi_handle_call,
> +    .dom0_dt_handle_node = scmi_dt_handle_node,
> +    .domain_sanitise_config = scmi_domain_sanitise_config,
> +    .assign_dt_device = scmi_dt_assign_device,
> +};
> +
> +static int __init scmi_check_smccc_ver(void)
> +{
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
> +    {
> +        printk(XENLOG_WARNING
> +               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> +        return -ENOSYS;
> +    }
> +
> +    return 0;
> +}
> +
> +static int scmi_dt_hyp_channel_read(struct dt_device_node *scmi_node, struct scmi_data *scmi_data,
> +                                    u64 *addr)
> +{
> +    int ret;
> +    u64 size;
> +
> +    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data->func_id) )
> +    {
> +        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
> +        return -ENOENT;
> +    }
> +
> +    ret = scmi_dt_read_hyp_channel_addr(scmi_node, addr, &size);
> +    if ( IS_ERR_VALUE(ret) )
> +        return -ENOENT;
> +
> +    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
> +    {
> +        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static __init int scmi_probe(struct dt_device_node *scmi_node, const void *data)
> +{
> +    u64 addr;
> +    int ret;
> +    struct scmi_channel *channel;
> +    int n_agents;
> +    scmi_msg_header_t hdr;
> +    struct scmi_msg_base_attributes_p2a rx;
> +
> +    ASSERT(scmi_node != NULL);
> +
> +    INIT_LIST_HEAD(&scmi_data.channel_list);
> +    spin_lock_init(&scmi_data.channel_list_lock);
> +
> +    if ( !acpi_disabled )
> +    {
> +        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
> +        return -EINVAL;
> +    }
> +
> +    ret = scmi_check_smccc_ver();
> +    if ( ret )
> +        return ret;
> +
> +    ret = scmi_dt_hyp_channel_read(scmi_node, &scmi_data, &addr);
> +    if ( ret )
> +        return ret;
> +
> +    scmi_data.dt_dev = scmi_node;
> +
> +    channel = smc_create_channel(SCMI_BASE_AGENT_ID_OWN, scmi_data.func_id, addr);

Should we call this with channel_list_lock held?


> +    if ( IS_ERR(channel) )
> +        goto out;
> +
> +    /* Request agent id for Xen management channel  */

At this poing channel->domain_id == DOMID_INVALID but collect_agent_id
checks for agent_channel->domain_id != DOMID_XEN

> +    ret = collect_agent_id(channel);
> +    if ( ret )
> +        return ret;
> +
> +    /* Save the agent id for Xen management channel */
> +    scmi_data.hyp_channel_agent_id = channel->agent_id;
> +
> +    ret = map_channel_memory(channel);
> +    if ( ret )
> +        goto out;

collect_agent_id already called map_channel_memory it looks like the
code was supposed to not unmap it the memory if domain_id == DOMID_XEN,
although the check doesn't work as expected.


> +    channel->domain_id = DOMID_XEN;
> +
> +    hdr.id = SCMI_BASE_PROTOCOL_ATTIBUTES;
> +    hdr.type = 0;
> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> +
> +    ret = do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
> +    if ( ret )
> +        goto error;
> +
> +    n_agents = SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
> +    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
> +    ret = collect_agents(scmi_node);
> +    if ( ret )
> +        goto error;
> +
> +    ret = sci_register(&scmi_ops);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "SCMI: mediator already registered (ret = %d)\n",
> +               ret);
> +        return ret;
> +    }
> +
> +    scmi_data.initialized = true;
> +    goto out;
> +
> +error:
> +    unmap_channel_memory(channel);
> +    free_channel_list();
> +out:
> +    return ret;
> +}
> +
> +static const struct dt_device_match scmi_smc_match[] __initconst = {
> +    DT_MATCH_PATH("/chosen/xen,config/scmi"),

We should match by compatible string, not by path

> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(scmi_smc_ma, "SCMI SMC MEDIATOR", DEVICE_FIRMWARE)
> +        .dt_match = scmi_smc_match,
> +        .init = scmi_probe,
> +DT_DEVICE_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 095b1a23e3..30e46de6d7 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
> +#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
>  
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
> @@ -355,6 +356,8 @@ struct xen_arch_domainconfig {
>      uint32_t clock_frequency;
>      /* IN */
>      uint8_t arm_sci_type;
> +    /* IN */
> +    uint8_t arm_sci_agent_id;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  
> -- 
> 2.34.1
> 

