Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA2AE32C1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 00:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021926.1397654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTSyd-00071D-Pb; Sun, 22 Jun 2025 22:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021926.1397654; Sun, 22 Jun 2025 22:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTSyd-0006yz-MF; Sun, 22 Jun 2025 22:15:51 +0000
Received: by outflank-mailman (input) for mailman id 1021926;
 Sun, 22 Jun 2025 22:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTSyc-0006yd-6f
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 22:15:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 730cd617-4fb6-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 00:15:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D5F3A4F04B;
 Sun, 22 Jun 2025 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FAFC4CEE3;
 Sun, 22 Jun 2025 22:15:44 +0000 (UTC)
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
X-Inumbo-ID: 730cd617-4fb6-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750630546;
	bh=un3rS6+QpSEEAK1ytKfjON0SkjC6hH8RLOHA7nRnglk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WSH9aW18nEjaK1qpJe6jUCCG90jFkGSEc8ZTi2AE09iK5Gh7sZfIx440keoYdTkAQ
	 UvzcqvOtX9op3eUVA6t4JkMihjkyFOfZK5bISlHSKR6VfCtrsYDm9t/overDbB+BwS
	 B8MYF9CV5R/7aNJPRC9A6QTYHtiYEaRF/zg9edzvg6REgAOPiD5be9FAbswgEK5WJK
	 JzSVuRCXir8F7w22LG3MSe3qoBfCT6KmfvtOw2ibOKkVzZpLouur1mxwJNWyN6SrAl
	 Af6KKESxNyLKYduCWhApByDcyPnHYYoQVAaUw6PCDLPUXSIkCceqZ0VjVMejT01zwu
	 VvEElQHM1jKxQ==
Date: Sun, 22 Jun 2025 15:15:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
In-Reply-To: <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com>
Message-ID: <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop> <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop> <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1278577597-1750628131=:8066"
Content-ID: <alpine.DEB.2.22.394.2506221458040.8066@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1278577597-1750628131=:8066
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506221458041.8066@ubuntu-linux-20-04-desktop>

On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
> On 18/06/2025 02:22, Stefano Stabellini wrote:
> > On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
> >> Hi Stefano,
> >>
> >> I'm very sorry for a long silence. Please see my answers below:
> >>
> >>
> >> On 23/05/2025 23:06, Stefano Stabellini wrote:
> >>> One question for Bertrand below
> >>>
> >>>
> >>> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> >>>> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> >>>> (TF-A) which provides SCMI interface with multi-agnet support, as shown
> >>>> below.
> >>>>
> >>>>     +-----------------------------------------+
> >>>>     |                                         |
> >>>>     | EL3 TF-A SCMI                           |
> >>>>     +-------+--+-------+--+-------+--+-------++
> >>>>     |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
> >>>>     +-----+-+  +---+---+  +--+----+  +---+---+
> >>>> smc-id0 |        |         |           |
> >>>> agent0  |        |         |           |
> >>>>     +-----v--------+---------+-----------+----+
> >>>>     |              |         |           |    |
> >>>>     |              |         |           |    |
> >>>>     +--------------+---------+-----------+----+
> >>>>            smc-id1 |  smc-id2|    smc-idX|
> >>>>            agent1  |  agent2 |    agentX |
> >>>>                    |         |           |
> >>>>               +----v---+  +--v-----+  +--v-----+
> >>>>               |        |  |        |  |        |
> >>>>               | Dom0   |  | Dom1   |  | DomX   |
> >>>>               |        |  |        |  |        |
> >>>>               |        |  |        |  |        |
> >>>>               +--------+  +--------+  +--------+
> >>>>
> >>>> The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
> >>>> memory transport for every Agent in the system.
> >>>>
> >>>> The SCMI Agent transport channel defined by pair:
> >>>>    - smc-id: SMC/HVC id used for Doorbell
> >>>>    - shmem: shared memory for messages transfer, Xen page aligned,
> >>>>    p2m_mmio_direct_nc.
> >>>>
> >>>> The follwoing SCMI Agents expected to be defined by SCMI FW to enable SCMI
> >>>> multi-agent functionality under Xen:
> >>>> - Xen manegement agent: trusted agents that accesses to the Base Protocol
> >>>> commands to configure agent specific permissions
> >>>> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
> >>>>     allowed direct HW access. At least one OSPM VM agent has to be provided
> >>>>     by FW if HW is handled only by Dom0 or Driver Domain.
> >>>>
> >>>> The EL3 SCMI FW expected to implement following Base protocol messages:
> >>>> - BASE_DISCOVER_AGENT
> >>>> - BASE_RESET_AGENT_CONFIGURATION (optional)
> >>>> - BASE_SET_DEVICE_PERMISSIONS (optional)
> >>>>
> >>>> The SCI SCMI SMC multi-agent driver implements following functionality:
> >>>> - It's initialized based on the Host DT SCMI node (only one SCMI interface
> >>>> is supported) which describes Xen management agent SCMI interface.
> >>>>
> >>>> scmi_shm_0 : sram@47ff0000 {
> >>>>       compatible = "arm,scmi-shmem";
> >>>>       reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>>> };
> >>>> firmware {
> >>>>       scmi: scmi {
> >>>>           compatible = "arm,scmi-smc";
> >>>>           arm, smc - id = <0x82000002>; // Xen manegement agent smc-id
> >>> some extra spaces, it might be a copy/paste error
> >> +
> >>>>           \#address-cells = < 1>;
> >>>>           \#size-cells = < 0>;
> >>>>           \#access-controller - cells = < 1>;
> >>>>           shmem = <&scmi_shm_0>; // Xen manegement agent shmem
> >>>>
> >>>>           protocol@X{
> >>>>           };
> >>>>       };
> >>>> };
> >>>>
> >>>> - It obtains Xen specific SCMI Agent's configuration from the Host DT,
> >>>> probes Agents and build SCMI Agents list; The Agents configuration is taken from:
> >>>>
> >>>> chosen {
> >>>>     xen,scmi-secondary-agents = <
> >>>>               1 0x82000003 &scmi_shm_1
> >>>>               2 0x82000004 &scmi_shm_2
> >>>>               3 0x82000005 &scmi_shm_3
> >>>>               4 0x82000006 &scmi_shm_4>;
> >>>> }
> >>>>
> >>>> /{
> >>>>       scmi_shm_1: sram@47ff1000 {
> >>>>               compatible = "arm,scmi-shmem";
> >>>>               reg = <0x0 0x47ff1000 0x0 0x1000>;
> >>>>       };
> >>>>       scmi_shm_2: sram@47ff2000 {
> >>>>               compatible = "arm,scmi-shmem";
> >>>>               reg = <0x0 0x47ff2000 0x0 0x1000>;
> >>>>       };
> >>>>       scmi_shm_3: sram@47ff3000 {
> >>>>               compatible = "arm,scmi-shmem";
> >>>>               reg = <0x0 0x47ff3000 0x0 0x1000>;
> >>>>       };
> >>>> }
> >>>>     where first item is "agent_id", second - "arm,smc-id", and third - "arm,scmi-shmem" for
> >>>>     this agent_id.
> >>>>
> >>>>     Note that Xen is the only one entry in the system which need to know
> >>>>     about SCMI multi-agent support.
> >>>>
> >>>> - It implements the SCI subsystem interface required for configuring and
> >>>> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> >>>> SCMI functionality for domain it has to be configured with unique supported
> >>>> SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
> >>>> [smc-id, shmem] defined for this SCMI Agent_id.
> >>>> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
> >>>>     -- zero-copy, the guest domain puts SCMI message in shmem;
> >>>>     -- the guest triggers SMC/HVC exception with smc-id (doorbell);
> >>>>     -- the Xen driver catches exception, do checks and synchronously forwards
> >>>>     it to EL3 FW.
> >>>> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
> >>>>     management agent channel on domain destroy event. This allows to reset
> >>>>     resources used by domain and so implement use-case like domain reboot.
> >>>>
> >>>> Dom0 Enable SCMI SMC:
> >>>>    - pass dom0_scmi_agent_id=<agent_id> in Xen command line. if not provided
> >>>>      SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
> >>>>      The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
> >>>>      node according to assigned agent_id.
> >>>>
> >>>> Guest domains enable SCMI SMC:
> >>>>    - xl.cfg: add configuration option as below
> >>>>
> >>>>      arm_sci = "type=scmi_smc_multiagent,agent_id=2"
> >>>>
> >>>>    - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond assigned agent_id for
> >>>>      the domain, for example:
> >>>>
> >>>> iomem = [
> >>>>       "47ff2,1@22001",
> >>>> ]
> >>> Looking at the code and the configuration options, it looks like it is
> >>> possible to map a scmi-shmem channel at a different address for the
> >>> guest. It seems like it would work. Is that correct?
> >>>
> >> Yes it will. in our case address 22001000 should be the save as
> >> sram@22001000 in the domain device-tree.
> >>>>    - DT: add SCMI nodes to the Driver domain partial device tree as in the
> >>>>    below example. The "arm,smc-id" should correspond assigned agent_id for the domain:
> >>>>
> >>>> passthrough {
> >>>>      scmi_shm_0: sram@22001000 {
> >>>>          compatible = "arm,scmi-shmem";
> >>>>          reg = <0x0 0x22001000 0x0 0x1000>;
> >>>>      };
> >>>>
> >>>>      firmware {
> >>>>           compatible = "simple-bus";
> >>>>               scmi: scmi {
> >>>>                   compatible = "arm,scmi-smc";
> >>>>                   arm,smc-id = <0x82000004>;
> >>>>                   shmem = <&scmi_shm_0>;
> >>>>                   ...
> >>>>               }
> >>>>       }
> >>>> }
> >>>>
> >>>> SCMI "4.2.1.1 Device specific access control"
> >>>>
> >>>> The XEN SCI SCMI SMC multi-agent driver performs "access-controller" provider function
> >>>> in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and provides the
> >>>> BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents have access to.
> >>>> The DT SCMI node should "#access-controller-cells=<1>" property and DT devices should be bound
> >>>> to the Xen SCMI.
> >>>>
> >>>> &i2c1 {
> >>>>       access-controllers = <&scmi 0>;
> >>>> };
> >>>>
> >>>> The Dom0 and dom0less domains DT devices will be processed automatically through
> >>>> sci_assign_dt_device() call, but to assign SCMI devices from toolstack the xl.cfg:"dtdev" property
> >>>> shell be used:
> >>>>
> >>>> dtdev = [
> >>>>       "/soc/i2c@e6508000",
> >>>> ]
> >>>>
> >>>> xl.cfg:dtdev will contain all nodes which are under SCMI management (not only those which are behind IOMMU).
> >>>>
> >>>> [1]https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >>>> [2]https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> >>>> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> >>>> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> >>> Thanks for the long explanation, great work! I am really looking forward
> >>> to have this feature in the tree soon.
> >>>
> >>>
> >>>> ---
> >>>>
> >>>> Changes in v4:
> >>>> - toolstack comments from Anthony PERARD
> >>>> - added dom0less support
> >>>> - added doc for "xen,scmi-secondary-agents"
> >>>>
> >>>>    docs/man/xl.cfg.5.pod.in                    |  13 +
> >>>>    docs/misc/arm/device-tree/booting.txt       |  60 ++
> >>>>    docs/misc/xen-command-line.pandoc           |   9 +
> >>>>    tools/libs/light/libxl_arm.c                |   4 +
> >>>>    tools/libs/light/libxl_types.idl            |   4 +-
> >>>>    tools/xl/xl_parse.c                         |  12 +
> >>>>    xen/arch/arm/dom0less-build.c               |  11 +
> >>>>    xen/arch/arm/domain_build.c                 |   3 +-
> >>>>    xen/arch/arm/firmware/Kconfig               |  11 +
> >>>>    xen/arch/arm/firmware/Makefile              |   1 +
> >>>>    xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
> >>>>    xen/arch/arm/firmware/scmi-shmem.c          | 173 ++++
> >>>>    xen/arch/arm/firmware/scmi-shmem.h          |  45 +
> >>>>    xen/arch/arm/firmware/scmi-smc-multiagent.c | 860 ++++++++++++++++++++
> >>>>    xen/include/public/arch-arm.h               |   3 +
> >>>>    15 files changed, 1371 insertions(+), 2 deletions(-)
> >>>>    create mode 100644 xen/arch/arm/firmware/scmi-proto.h
> >>>>    create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
> >>>>    create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
> >>>>    create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
> >>>>
> >>>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> >>>> index 1ccf50b8ea..302c46d8bc 100644
> >>>> --- a/docs/man/xl.cfg.5.pod.in
> >>>> +++ b/docs/man/xl.cfg.5.pod.in
> >>>> @@ -3122,8 +3122,21 @@ single SCMI OSPM agent support.
> >>>>    Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
> >>>>    option.
> >>>>
> >>>> +=item B<scmi_smc_multiagent>
> >>>> +
> >>>> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> >>>> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
> >>>> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
> >>>> +specified for the guest.
> >>>> +
> >>>>    =back
> >>>>
> >>>> +=item B<agent_id=NUMBER>
> >>>> +
> >>>> +Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
> >>>> +if the SCMI SMC support is enabled for the guest. The agent ids of domains
> >>>> +existing on a single host must be unique and in the range [1..255].
> >>>> +
> >>>>    =back
> >>>>
> >>>>    =back
> >>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> >>>> index 8943c04173..c8923ab8b2 100644
> >>>> --- a/docs/misc/arm/device-tree/booting.txt
> >>>> +++ b/docs/misc/arm/device-tree/booting.txt
> >>>> @@ -296,6 +296,20 @@ with the following properties:
> >>>>        Should be used together with dom0_scmi_smc_passthrough Xen command line
> >>>>        option.
> >>>>
> >>>> +    - "scmi_smc_multiagent"
> >>>> +
> >>>> +    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> >>>> +    SMC calls forwarding from domain to the EL3 firmware (like ARM
> >>>> +    Trusted Firmware-A) with a multi SCMI OSPM agent support.
> >>>> +    The SCMI agent_id should be specified for the guest with "xen,sci_agent_id"
> >>>> +    property.
> >>>> +
> >>>> +- "xen,sci_agent_id"
> >>>> +
> >>>> +    Specifies a non-zero ARM SCI agent id for the guest. This option is
> >>>> +    mandatory if the SCMI SMC "scmi_smc_multiagent" support is enabled for
> >>>> +    the guest. The agent ids of guest must be unique and in the range [1..255].
> >>>> +
> >>>>    Under the "xen,domain" compatible node, one or more sub-nodes are present
> >>>>    for the DomU kernel and ramdisk.
> >>>>
> >>>> @@ -764,3 +778,49 @@ The automatically allocated static shared memory will get mapped at
> >>>>    0x80000000 in DomU1 guest physical address space, and at 0x90000000 in DomU2
> >>>>    guest physical address space. DomU1 is explicitly defined as the owner domain,
> >>>>    and DomU2 is the borrower domain.
> >>>> +
> >>>> +SCMI SMC multi-agent support
> >>>> +============================
> >>>> +
> >>>> +For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_SMC_MA)
> >>>> +the Xen specific SCMI Agent's configuration shell be provided in the Host DT
> >>>> +according to the SCMI compliant EL3 Firmware specification with
> >>>> +ARM SMC/HVC transport using property "xen,scmi-secondary-agents" under
> >>>> +the top-level "chosen" node:
> >>>> +
> >>>> +- xen,scmi-secondary-agents
> >>>> +
> >>>> +    Defines a set of SCMI agents configuration supported by SCMI EL3 FW and
> >>>> +    available for Xen. Each Agent defined as triple consisting of:
> >>>> +    SCMI agent_id,
> >>>> +    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
> >>>> +    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem").
> >>>> +
> >>>> +As an example:
> >>>> +
> >>>> +chosen {
> >>>> +    xen,scmi-secondary-agents = <
> >>>> +        1 0x82000003 &scmi_shm_1
> >>>> +        2 0x82000004 &scmi_shm_2
> >>>> +        3 0x82000005 &scmi_shm_3
> >>>> +        4 0x82000006 &scmi_shm_4>;
> >>>> +}
> >>> NIT: it should be };
> >> +
> >>> Looking at scmi_probe, collect_agents, and the following SCMI
> >>> SCMI_BASE_DISCOVER_AGENT request, I wonder: do we actually need this
> >>> information?
> >>>
> >>> It looks like we can discover the agend_ids for every channel, I guess
> >>> what we need to know is the shmem location for every channel? But the
> >>> full list of shmem channel is available below thanks to the scmi-shmem
> >>> nodes.
> >>>
> >>> So, we have the list of scmi-shmem anyway, and we can probe the
> >>> agent_id. The only parameter left is the smc_id/func_id.
> >>>
> >>> Or maybe smc_id/func_id can be calculated from agent_id?
> >>>
> >>> I am asking mostly because if a user is supposed to add this
> >>> xen,scmi-secondary-agents property, where are they supposed to find the
> >>> smc_id/func_id information?
> >>>
> >>> It is important that we write down in this document how the user is
> >>> expected to find out what 1 is 0x82000003 which is scmi_shm_1.
> >> That's a very good question! The issue here is that there are no
> >>
> >> explicit requirements defining the relationship between agent_id and
> >> func_id.
> >>
> >>
> >> For example, in ARM-TF, different implementations can use different
> >> func_ids.
> >>
> >> To provide better flexibility, we decided to separate agent_id from func_id.
> >>
> >>
> >> Currently, the SCMI_BASE_DISCOVER_AGENT calls from the probe are intended to
> >>
> >> verify that all registered agents are present and that the configuration
> >> is correct.
> >>
> >> However, I understand that this additional validation could be optional
> >> to save traffic.
> >>
> >>
> >> To address this, I’m considering adding a configuration option, such as
> >>
> >> CONFIG_SCMI_AGENT_VALIDATION, which can be disabled to reduce boot time
> >> if this
> >>
> >> validation is not necessary for certain use cases.
> >>
> >>
> >> Lastly, I’ll be updating the document to include clearer information
> >> about the
> >>
> >> relationship between func_id and agent_id in the upcoming v5.
> >
> > The key point here is to make it easier for the user. If we can make
> > agent_id or func_id optional it would make users lives easier.
> >
> > Alternative, or in addition to this, we should make the docs as clear as
> > possible so that people can figure it out without having to ask
> > questions on xen-devel.
> >
> >
> 
> [OM ANSWER]
> 
> SCMI_BASE_DISCOVER_AGENT message requires agent_id. I think we can calculate
> 
> agent_id from func_id, the documentation will look like this:
> 
> ```
> 
> For enabling the ARM SCMI SMC multi-agent support (enabled by
> CONFIG_SCMI_SMC_MA)
> the Xen specific SCMI Agent's configuration shell be provided in the Host DT
> according to the SCMI compliant EL3 Firmware specification with
> ARM SMC/HVC transport using property "xen,scmi-secondary-agents" under
> the top-level "chosen" node:
> 
> - xen,scmi-secondary-agents
> 
>      Defines a set of SCMI agents configuration supported by SCMI EL3 FW and
>      available for Xen. Each Agent defined as triple consisting of:
>      SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
>      phandle to SCMI SHM assigned for the agent transport
> ("arm,scmi-shmem"),
> 
>      SCMI agent_id (optional)
> 
> As an example:
> 
> chosen {
>      xen,scmi-secondary-agents = <
>          0x82000003 &scmi_shm_1 1
>          0x82000004 &scmi_shm_2 2
>          0x82000005 &scmi_shm_3 3
>          0x82000006 &scmi_shm_4 4>;
> }
> 
> or
> 
> chosen {
>      xen,scmi-secondary-agents = <
>          0x82000003 &scmi_shm_1
>          0x82000004 &scmi_shm_2
>          0x82000005 &scmi_shm_3
>          0x82000006 &scmi_shm_4>;
> }
> 
> If the optional parameter agent_id is not provided, then Xen will
> request agent_id for each registered
> 
> channel from the firmware.
> 
> This procedure requires sending BASE_DISCOVER_AGENT using func_id and
> shmem region for each
> 
> registered agent and discover it's agent_id. This operation requires all
> memory reserved for the agents
> 
> to be mapped and then unmapped which can cause boot time increasing. So
> if boot time is important it is
> 
> preferable to provide agent_in in the device-tree.
> 
> There are some cases when Xen may not have an access to other agent
> memory, including scmi shmem due to
> 
> a very strict FFI configuration. In this case agent_id should be
> provided inside xem,scmi-secondary-agents parameter.
> 
> ```
> 
> What do you think about this approach?

This is better, thank you!


> I will add information about all point into the docs and will try to
> make it as clear as possible.

[...]


> >>> I don't understand why we need __memcpy_fromio and __memcpy_toio: can't
> >>> we use a simple memcpy?
> >> This approach was used because we're trying to access shared memory
> >> between two independent systems:
> >>
> >> Arm-TF and Xen in our case which places some chunks of data to the same
> >> memory. And, according to the [0]
> >>
> >> ```
> >>
> >> Some devices (such as framebuffers) would like to use larger transfers than
> >> 8 bytes at a time. For these devices, the memcpy_toio(),
> >> memcpy_fromio() and memset_io() functions are
> >> provided. Do not use memset or memcpy on IO addresses; they are not
> >> guaranteed to copy data in order.
> >>
> >> ```
> >>
> >> Also, the same approach was used by Arm team when introducing scmi
> >> driver to the Linux kernel [1]
> >>
> >>
> >> [0]:https://www.kernel.org/doc/Documentation/driver-api/device-io.rst
> >>
> >> [1]:https://git.iliana.fyi/linux/patch/?id=d5141f37c42e0b833863f157ac4cee203b2ba3d2
> > Keep in mind that [0] refers specifically to access to MMIO regions. I
> > assume that the SCMI shared buffers are on normal memory? Regarding [1],
> > it makes sense if Linux is trying to support shared memory over MMIO.
> >
> > Looking at one of your replies below, I am guessing the memory buffers
> > are actually in normal memory but the issue is that TF-A is mapping them
> > as uncacheable. Is that correct?
> >
> > In that case, I still don't understand why a simple memcpy would not be
> > sufficient. Can you check?
> >
> > If yes, then for now I would just simplify it down to memcpy. When
> > someone adds support for an SCMI server elsewhere we could look into
> > adding a more sophisticated memcpy and we can look at the details at
> > that point in time. Specifically, I am not convinced that memcpy_toio
> > and memcpy_fromio would work if the SCMI server is on a separate
> > non-coherent microcontroller.
> >
> According to the TF-A implementation  SCMI memory
> 
> is mapped with the  flags: MT_DEVICE (like for  stm32mp1) or
> MT_NON_CACHEABLE (for rpi3)
> 
> So probably you're right. I will check with simple memcpy.

There is a difference between MT_DEVICE and MT_NON_CACHEABLE: as far as
I know MT_DEVICE requires aligned accesses while MT_NON_CACHEABLE does
not.

However, as I wrote in the other email, if I am not mistaken the current
implementation of memcpy might work well for us anyway. (To be
confirmed.)

[...]


> >>> Are you sure it is worth to go through all this trouble to modify FDT in
> >>> place when we could simply generate the DT node from scratch like we do
> >>> for example for the GIC? This seems to be more error prone as well. Is
> >>> generating it from scratch is really difficult? If it is difficult then OK.
> >>>
> >> In the last patch [0] of the series, there is a proposal to separate
> >>
> >>    the Xen privileged agent from the Dom0 agent. This eliminates the
> >>
> >> need to modify the Xen Device Tree Blob (DTB), which is a positive
> >> improvement
> >>
> >> since the Dom0 agent node is already present in the device tree.
> >>
> >> However, the issue with SCMI node generation lies in the need to handle
> >>
> >> the list of protocols that are supported across the system.
> >>
> >> If we want to generate the SCMI node for Dom0, we need to:
> >>
> >> Copy these protocols from a centralized or predefined source.
> >> Set the correct phandle for each subnode within the SCMI node, ensuring
> >>
> >> accurate representation and functionality.
> >> This extra step of managing the protocols and phandles adds
> >>
> >> complexity but is necessary for ensuring proper support for Dom0.
> >>
> >> [0]
> >> https://lists.xenproject.org/archives/html/xen-devel/2025-05/msg01041.html
> > I was only commenting that rather than trying to modify the DT in place
> > we could create the node for Dom0 from scratch (artificially), based on
> > host DT information as required (fetching data from the host DT as
> > required and copying it to the Dom0 DT).
> >
> The problem is that scmi node, apart from the default parameters has a
> list of
> 
> supported protocols which may be different for Xen and Dom0 so to
> generate Dom0 node
> 
> from scratch we need to copy(or even generate) these nodes which will
> require complex implementation.
> 
> In contrary, if we go with implementation, proposed in the last patch -
> then we can have
> 
> more cleaner Xen device tree, which will look like this:
> 
> ```
> 
> chosen {
> 
>      scmi_xen: scmi {
> 
>            arm,smc-id = <0x82000002>;
> 
>            shmem= <$shm_0>;
> 
>           ... # no protocols description here
> 
> };
> 
> firmware {
> 
>     scmi {
> 
>            arm,smc-id = <0x82000003>;
> 
>            shmem= <$shm_1>;
> 
>            protocol@X{
> 
>            };
> 
>     }
> 
> };
> 
> ```
> 
> In this case, we don’t provide any protocol information for the Xen
> agent and instead set protocols for Dom0.
> 
> This ensures that each node has the information it requires.

Leaving aside how we generate the device tree nodes for Dom0, which is
of minor importance, we have two potentially conflicting goals:

1) no Xen-specific changes to Device Tree outside of /chosen
2) When Xen is present, Xen should be the one using the information in the Host Device Tree

With 1), I mean that the Host Device Tree, outside of the /chosen node,
should be the same for the BSP (no Xen) and for Xen. That is because it
should describe the platform, no matter the software running on it. Also
at the time the Device Tree is generated, often it is not known if Xen
will be running on the platform or not.

With 2) I meant that ideally when Xen is present, Xen should be the one
to use the information under /firmware/scmi, because Xen is the
principal SCMI client. Then Xen would generate somehow the SCMI device
tree nodes for Dom0 and the DomUs.

1) is more important than 2).

From what you wrote, it looks like the SCMI device tree nodes are
different between Linux baremetal and Xen. If /firmware/scmi describes
what Linux baremetal should use, then it would work for Linux baremetal
but it would *not* work for Xen's own SCMI connection. Is that correct?

If that is the case, that is unfortunate. We need to compromise on 2).

I would keep /firmware/scmi as the one used by Linux baremetal because I
think we should uphold 1) above all else.

Then the Xen SCMI nodes could be placed under /chosen. This is less than
ideal because /chosen should contain Xen/Linux configurations, not
firmware interfaces. But it is the best we can do in a difficult
situation.

I think that whether the Dom0 device tree nodes are artificially
generated by Xen, or copied from the Host Device Tree somewhere, it
matters less.
--8323329-1278577597-1750628131=:8066--

