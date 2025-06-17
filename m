Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC27ADDFD7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 01:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018612.1395486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgAr-00075t-GM; Tue, 17 Jun 2025 23:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018612.1395486; Tue, 17 Jun 2025 23:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgAr-00073A-By; Tue, 17 Jun 2025 23:57:05 +0000
Received: by outflank-mailman (input) for mailman id 1018612;
 Tue, 17 Jun 2025 23:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRgAp-000733-UG
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 23:57:04 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0bd7d0-4bd6-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 01:56:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C6CA6111C;
 Tue, 17 Jun 2025 23:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4513BC4CEE3;
 Tue, 17 Jun 2025 23:56:50 +0000 (UTC)
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
X-Inumbo-ID: be0bd7d0-4bd6-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750204612;
	bh=6co/NqIy1XaVnFLBhLEVyQ5k5/wpTLT6j9j0nPeOMqk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K/wn/J/RYSKewCQAcPkkrUjNmTCTTJDeCLr5hWjJjKwo2BHxsf1yp46vGv6GSxrUt
	 QHNJaPwCpj05bej6vpVQQGTMP9iMlsFGeKBmBmKcDmJ5gFilIcfignv/epsybuIHGq
	 Da72KwHN6EhXXFTtbXCN0jCrxvmklzXYQHK/YUfFTjz0b5abRiH0LiyaPdQZzApMQt
	 fSiBS1oHpPYyGHQFG9MWEQ70UGR7Avn8kz5ktfpPGz2IB0qBOVrVpVYOdXMpLvlEft
	 4d1FwNy2KSVQEUIdZVip/eJsMHVgCsq4ZfsCrqH35AYNBHm++hYuYC2lsT9mqSxYBY
	 VgjaFVb1WF5ig==
Date: Tue, 17 Jun 2025 16:56:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
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
In-Reply-To: <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2506171654090.1780597@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop> <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1934469375-1750204611=:1780597"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1934469375-1750204611=:1780597
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 17 Jun 2025, Stefano Stabellini wrote:
> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
> > Hi Stefano,
> > 
> > I'm very sorry for a long silence. Please see my answers below:
> > 
> > 
> > On 23/05/2025 23:06, Stefano Stabellini wrote:
> > > One question for Bertrand below
> > >
> > >
> > > On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> > >> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> > >> (TF-A) which provides SCMI interface with multi-agnet support, as shown
> > >> below.
> > >>
> > >>    +-----------------------------------------+
> > >>    |                                         |
> > >>    | EL3 TF-A SCMI                           |
> > >>    +-------+--+-------+--+-------+--+-------++
> > >>    |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
> > >>    +-----+-+  +---+---+  +--+----+  +---+---+
> > >> smc-id0 |        |         |           |
> > >> agent0  |        |         |           |
> > >>    +-----v--------+---------+-----------+----+
> > >>    |              |         |           |    |
> > >>    |              |         |           |    |
> > >>    +--------------+---------+-----------+----+
> > >>           smc-id1 |  smc-id2|    smc-idX|
> > >>           agent1  |  agent2 |    agentX |
> > >>                   |         |           |
> > >>              +----v---+  +--v-----+  +--v-----+
> > >>              |        |  |        |  |        |
> > >>              | Dom0   |  | Dom1   |  | DomX   |
> > >>              |        |  |        |  |        |
> > >>              |        |  |        |  |        |
> > >>              +--------+  +--------+  +--------+
> > >>
> > >> The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
> > >> memory transport for every Agent in the system.
> > >>
> > >> The SCMI Agent transport channel defined by pair:
> > >>   - smc-id: SMC/HVC id used for Doorbell
> > >>   - shmem: shared memory for messages transfer, Xen page aligned,
> > >>   p2m_mmio_direct_nc.
> > >>
> > >> The follwoing SCMI Agents expected to be defined by SCMI FW to enable SCMI
> > >> multi-agent functionality under Xen:
> > >> - Xen manegement agent: trusted agents that accesses to the Base Protocol
> > >> commands to configure agent specific permissions
> > >> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
> > >>    allowed direct HW access. At least one OSPM VM agent has to be provided
> > >>    by FW if HW is handled only by Dom0 or Driver Domain.
> > >>
> > >> The EL3 SCMI FW expected to implement following Base protocol messages:
> > >> - BASE_DISCOVER_AGENT
> > >> - BASE_RESET_AGENT_CONFIGURATION (optional)
> > >> - BASE_SET_DEVICE_PERMISSIONS (optional)
> > >>
> > >> The SCI SCMI SMC multi-agent driver implements following functionality:
> > >> - It's initialized based on the Host DT SCMI node (only one SCMI interface
> > >> is supported) which describes Xen management agent SCMI interface.
> > >>
> > >> scmi_shm_0 : sram@47ff0000 {
> > >>      compatible = "arm,scmi-shmem";
> > >>      reg = <0x0 0x47ff0000 0x0 0x1000>;
> > >> };
> > >> firmware {
> > >>      scmi: scmi {
> > >>          compatible = "arm,scmi-smc";
> > >>          arm, smc - id = <0x82000002>; // Xen manegement agent smc-id
> > > some extra spaces, it might be a copy/paste error
> > +
> > >>          \#address-cells = < 1>;
> > >>          \#size-cells = < 0>;
> > >>          \#access-controller - cells = < 1>;
> > >>          shmem = <&scmi_shm_0>; // Xen manegement agent shmem
> > >>
> > >>          protocol@X{
> > >>          };
> > >>      };
> > >> };
> > >>
> > >> - It obtains Xen specific SCMI Agent's configuration from the Host DT,
> > >> probes Agents and build SCMI Agents list; The Agents configuration is taken from:
> > >>
> > >> chosen {
> > >>    xen,scmi-secondary-agents = <
> > >>              1 0x82000003 &scmi_shm_1
> > >>              2 0x82000004 &scmi_shm_2
> > >>              3 0x82000005 &scmi_shm_3
> > >>              4 0x82000006 &scmi_shm_4>;
> > >> }
> > >>
> > >> /{
> > >>      scmi_shm_1: sram@47ff1000 {
> > >>              compatible = "arm,scmi-shmem";
> > >>              reg = <0x0 0x47ff1000 0x0 0x1000>;
> > >>      };
> > >>      scmi_shm_2: sram@47ff2000 {
> > >>              compatible = "arm,scmi-shmem";
> > >>              reg = <0x0 0x47ff2000 0x0 0x1000>;
> > >>      };
> > >>      scmi_shm_3: sram@47ff3000 {
> > >>              compatible = "arm,scmi-shmem";
> > >>              reg = <0x0 0x47ff3000 0x0 0x1000>;
> > >>      };
> > >> }
> > >>    where first item is "agent_id", second - "arm,smc-id", and third - "arm,scmi-shmem" for
> > >>    this agent_id.
> > >>
> > >>    Note that Xen is the only one entry in the system which need to know
> > >>    about SCMI multi-agent support.
> > >>
> > >> - It implements the SCI subsystem interface required for configuring and
> > >> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> > >> SCMI functionality for domain it has to be configured with unique supported
> > >> SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
> > >> [smc-id, shmem] defined for this SCMI Agent_id.
> > >> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
> > >>    -- zero-copy, the guest domain puts SCMI message in shmem;
> > >>    -- the guest triggers SMC/HVC exception with smc-id (doorbell);
> > >>    -- the Xen driver catches exception, do checks and synchronously forwards
> > >>    it to EL3 FW.
> > >> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
> > >>    management agent channel on domain destroy event. This allows to reset
> > >>    resources used by domain and so implement use-case like domain reboot.
> > >>
> > >> Dom0 Enable SCMI SMC:
> > >>   - pass dom0_scmi_agent_id=<agent_id> in Xen command line. if not provided
> > >>     SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
> > >>     The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
> > >>     node according to assigned agent_id.
> > >>
> > >> Guest domains enable SCMI SMC:
> > >>   - xl.cfg: add configuration option as below
> > >>
> > >>     arm_sci = "type=scmi_smc_multiagent,agent_id=2"
> > >>
> > >>   - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond assigned agent_id for
> > >>     the domain, for example:
> > >>
> > >> iomem = [
> > >>      "47ff2,1@22001",
> > >> ]
> > > Looking at the code and the configuration options, it looks like it is
> > > possible to map a scmi-shmem channel at a different address for the
> > > guest. It seems like it would work. Is that correct?
> > >
> > Yes it will. in our case address 22001000 should be the save as
> > sram@22001000 in the domain device-tree.
> > >>   - DT: add SCMI nodes to the Driver domain partial device tree as in the
> > >>   below example. The "arm,smc-id" should correspond assigned agent_id for the domain:
> > >>
> > >> passthrough {
> > >>     scmi_shm_0: sram@22001000 {
> > >>         compatible = "arm,scmi-shmem";
> > >>         reg = <0x0 0x22001000 0x0 0x1000>;
> > >>     };
> > >>
> > >>     firmware {
> > >>          compatible = "simple-bus";
> > >>              scmi: scmi {
> > >>                  compatible = "arm,scmi-smc";
> > >>                  arm,smc-id = <0x82000004>;
> > >>                  shmem = <&scmi_shm_0>;
> > >>                  ...
> > >>              }
> > >>      }
> > >> }
> > >>
> > >> SCMI "4.2.1.1 Device specific access control"
> > >>
> > >> The XEN SCI SCMI SMC multi-agent driver performs "access-controller" provider function
> > >> in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and provides the
> > >> BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents have access to.
> > >> The DT SCMI node should "#access-controller-cells=<1>" property and DT devices should be bound
> > >> to the Xen SCMI.
> > >>
> > >> &i2c1 {
> > >>      access-controllers = <&scmi 0>;
> > >> };
> > >>
> > >> The Dom0 and dom0less domains DT devices will be processed automatically through
> > >> sci_assign_dt_device() call, but to assign SCMI devices from toolstack the xl.cfg:"dtdev" property
> > >> shell be used:
> > >>
> > >> dtdev = [
> > >>      "/soc/i2c@e6508000",
> > >> ]
> > >>
> > >> xl.cfg:dtdev will contain all nodes which are under SCMI management (not only those which are behind IOMMU).
> > >>
> > >> [1]https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > >> [2]https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> > >> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> > >> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> > > Thanks for the long explanation, great work! I am really looking forward
> > > to have this feature in the tree soon.
> > >
> > >
> > >> ---
> > >>
> > >> Changes in v4:
> > >> - toolstack comments from Anthony PERARD
> > >> - added dom0less support
> > >> - added doc for "xen,scmi-secondary-agents"
> > >>
> > >>   docs/man/xl.cfg.5.pod.in                    |  13 +
> > >>   docs/misc/arm/device-tree/booting.txt       |  60 ++
> > >>   docs/misc/xen-command-line.pandoc           |   9 +
> > >>   tools/libs/light/libxl_arm.c                |   4 +
> > >>   tools/libs/light/libxl_types.idl            |   4 +-
> > >>   tools/xl/xl_parse.c                         |  12 +
> > >>   xen/arch/arm/dom0less-build.c               |  11 +
> > >>   xen/arch/arm/domain_build.c                 |   3 +-
> > >>   xen/arch/arm/firmware/Kconfig               |  11 +
> > >>   xen/arch/arm/firmware/Makefile              |   1 +
> > >>   xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
> > >>   xen/arch/arm/firmware/scmi-shmem.c          | 173 ++++
> > >>   xen/arch/arm/firmware/scmi-shmem.h          |  45 +
> > >>   xen/arch/arm/firmware/scmi-smc-multiagent.c | 860 ++++++++++++++++++++
> > >>   xen/include/public/arch-arm.h               |   3 +
> > >>   15 files changed, 1371 insertions(+), 2 deletions(-)
> > >>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
> > >>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
> > >>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
> > >>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
> > >>
> > >> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > >> index 1ccf50b8ea..302c46d8bc 100644
> > >> --- a/docs/man/xl.cfg.5.pod.in
> > >> +++ b/docs/man/xl.cfg.5.pod.in
> > >> @@ -3122,8 +3122,21 @@ single SCMI OSPM agent support.
> > >>   Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
> > >>   option.
> > >>
> > >> +=item B<scmi_smc_multiagent>
> > >> +
> > >> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> > >> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
> > >> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
> > >> +specified for the guest.
> > >> +
> > >>   =back
> > >>
> > >> +=item B<agent_id=NUMBER>
> > >> +
> > >> +Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
> > >> +if the SCMI SMC support is enabled for the guest. The agent ids of domains
> > >> +existing on a single host must be unique and in the range [1..255].
> > >> +
> > >>   =back
> > >>
> > >>   =back
> > >> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > >> index 8943c04173..c8923ab8b2 100644
> > >> --- a/docs/misc/arm/device-tree/booting.txt
> > >> +++ b/docs/misc/arm/device-tree/booting.txt
> > >> @@ -296,6 +296,20 @@ with the following properties:
> > >>       Should be used together with dom0_scmi_smc_passthrough Xen command line
> > >>       option.
> > >>
> > >> +    - "scmi_smc_multiagent"
> > >> +
> > >> +    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> > >> +    SMC calls forwarding from domain to the EL3 firmware (like ARM
> > >> +    Trusted Firmware-A) with a multi SCMI OSPM agent support.
> > >> +    The SCMI agent_id should be specified for the guest with "xen,sci_agent_id"
> > >> +    property.
> > >> +
> > >> +- "xen,sci_agent_id"
> > >> +
> > >> +    Specifies a non-zero ARM SCI agent id for the guest. This option is
> > >> +    mandatory if the SCMI SMC "scmi_smc_multiagent" support is enabled for
> > >> +    the guest. The agent ids of guest must be unique and in the range [1..255].
> > >> +
> > >>   Under the "xen,domain" compatible node, one or more sub-nodes are present
> > >>   for the DomU kernel and ramdisk.
> > >>
> > >> @@ -764,3 +778,49 @@ The automatically allocated static shared memory will get mapped at
> > >>   0x80000000 in DomU1 guest physical address space, and at 0x90000000 in DomU2
> > >>   guest physical address space. DomU1 is explicitly defined as the owner domain,
> > >>   and DomU2 is the borrower domain.
> > >> +
> > >> +SCMI SMC multi-agent support
> > >> +============================
> > >> +
> > >> +For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_SMC_MA)
> > >> +the Xen specific SCMI Agent's configuration shell be provided in the Host DT
> > >> +according to the SCMI compliant EL3 Firmware specification with
> > >> +ARM SMC/HVC transport using property "xen,scmi-secondary-agents" under
> > >> +the top-level "chosen" node:
> > >> +
> > >> +- xen,scmi-secondary-agents
> > >> +
> > >> +    Defines a set of SCMI agents configuration supported by SCMI EL3 FW and
> > >> +    available for Xen. Each Agent defined as triple consisting of:
> > >> +    SCMI agent_id,
> > >> +    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
> > >> +    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem").
> > >> +
> > >> +As an example:
> > >> +
> > >> +chosen {
> > >> +    xen,scmi-secondary-agents = <
> > >> +        1 0x82000003 &scmi_shm_1
> > >> +        2 0x82000004 &scmi_shm_2
> > >> +        3 0x82000005 &scmi_shm_3
> > >> +        4 0x82000006 &scmi_shm_4>;
> > >> +}
> > > NIT: it should be };
> > +
> > > Looking at scmi_probe, collect_agents, and the following SCMI
> > > SCMI_BASE_DISCOVER_AGENT request, I wonder: do we actually need this
> > > information?
> > >
> > > It looks like we can discover the agend_ids for every channel, I guess
> > > what we need to know is the shmem location for every channel? But the
> > > full list of shmem channel is available below thanks to the scmi-shmem
> > > nodes.
> > >
> > > So, we have the list of scmi-shmem anyway, and we can probe the
> > > agent_id. The only parameter left is the smc_id/func_id.
> > >
> > > Or maybe smc_id/func_id can be calculated from agent_id?
> > >
> > > I am asking mostly because if a user is supposed to add this
> > > xen,scmi-secondary-agents property, where are they supposed to find the
> > > smc_id/func_id information?
> > >
> > > It is important that we write down in this document how the user is
> > > expected to find out what 1 is 0x82000003 which is scmi_shm_1.
> > 
> > That's a very good question! The issue here is that there are no
> > 
> > explicit requirements defining the relationship between agent_id and
> > func_id.
> > 
> > 
> > For example, in ARM-TF, different implementations can use different
> > func_ids.
> > 
> > To provide better flexibility, we decided to separate agent_id from func_id.
> > 
> > 
> > Currently, the SCMI_BASE_DISCOVER_AGENT calls from the probe are intended to
> > 
> > verify that all registered agents are present and that the configuration
> > is correct.
> > 
> > However, I understand that this additional validation could be optional
> > to save traffic.
> > 
> > 
> > To address this, I’m considering adding a configuration option, such as
> > 
> > CONFIG_SCMI_AGENT_VALIDATION, which can be disabled to reduce boot time
> > if this
> > 
> > validation is not necessary for certain use cases.
> > 
> > 
> > Lastly, I’ll be updating the document to include clearer information
> > about the
> > 
> > relationship between func_id and agent_id in the upcoming v5.
>  
> The key point here is to make it easier for the user. If we can make
> agent_id or func_id optional it would make users lives easier.
> 
> Alternative, or in addition to this, we should make the docs as clear as
> possible so that people can figure it out without having to ask
> questions on xen-devel.
> 
>  
> > >> +/{
> > >> +        scmi_shm_1: sram@47ff1000 {
> > >> +                compatible = "arm,scmi-shmem";
> > >> +                reg = <0x0 0x47ff1000 0x0 0x1000>;
> > >> +        };
> > >> +        scmi_shm_2: sram@47ff2000 {
> > >> +                compatible = "arm,scmi-shmem";
> > >> +                reg = <0x0 0x47ff2000 0x0 0x1000>;
> > >> +        };
> > >> +        scmi_shm_3: sram@47ff3000 {
> > >> +                compatible = "arm,scmi-shmem";
> > >> +                reg = <0x0 0x47ff3000 0x0 0x1000>;
> > >> +        };
> > >> +        scmi_shm_3: sram@47ff4000 {
> > >> +                compatible = "arm,scmi-shmem";
> > >> +                reg = <0x0 0x47ff4000 0x0 0x1000>;
> > >> +        };
> > > Are these scmi_shm_1 - scmi_shm_3 under the top level device tree node?
> > > Or are under /firmware? Or are they under /chosen?
> > >
> > > I take they are under the top level node together with scmi_shm_0?
> > >
> > > Can you please also clarify in the document as well?
> > >
> > >
> > all these nodes are on the top level of the device-tree. But there is no
> > specific place for them.
> > 
> > They could be subnodes to some memory-region for example. I will clarify
> > this.
> > 
> > >> +}
> > >> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > >> index 8e50f6b7c7..bc3c64d6ec 100644
> > >> --- a/docs/misc/xen-command-line.pandoc
> > >> +++ b/docs/misc/xen-command-line.pandoc
> > >> @@ -1091,6 +1091,15 @@ which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
> > >>   SCMI nodes removed from Dom0/hwdom device tree.
> > >>   (for example, thin Dom0 with Driver domain use-case).
> > >>
> > >> +### dom0_scmi_agent_id (ARM)
> > >> +> `= <integer>`
> > >> +
> > >> +The option is available when `CONFIG_SCMI_SMC_MA` is compiled in, and allows to
> > >> +enable SCMI functionality for Dom0 by specifying a non-zero ARM SCMI agent id.
> > >> +The SCMI will be disabled for Dom0 if this option is not specified
> > >> +(for example, thin Dom0 or dom0less use-cases).
> > >> +The agent ids of domains existing on a single host must be unique.
> > >> +
> > >>   ### dtuart (ARM)
> > >>   > `= path [:options]`
> > >>
> > >> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > >> index 28ba9eb787..7712f53cd4 100644
> > >> --- a/tools/libs/light/libxl_arm.c
> > >> +++ b/tools/libs/light/libxl_arm.c
> > >> @@ -229,6 +229,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> > >>       case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
> > >>           config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> > >>           break;
> > >> +    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
> > >> +        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> > >> +        config->arch.arm_sci_agent_id = d_config->b_info.arch_arm.arm_sci.agent_id;
> > >> +        break;
> > >>       default:
> > >>           LOG(ERROR, "Unknown ARM_SCI type %d",
> > >>               d_config->b_info.arch_arm.arm_sci.type);
> > >> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > >> index aa2190ab5b..11e31ce786 100644
> > >> --- a/tools/libs/light/libxl_types.idl
> > >> +++ b/tools/libs/light/libxl_types.idl
> > >> @@ -553,11 +553,13 @@ libxl_sve_type = Enumeration("sve_type", [
> > >>
> > >>   libxl_arm_sci_type = Enumeration("arm_sci_type", [
> > >>       (0, "none"),
> > >> -    (1, "scmi_smc")
> > >> +    (1, "scmi_smc"),
> > >> +    (2, "scmi_smc_multiagent")
> > >>       ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
> > >>
> > >>   libxl_arm_sci = Struct("arm_sci", [
> > >>       ("type", libxl_arm_sci_type),
> > >> +    ("agent_id", uint8)
> > >>       ])
> > >>
> > >>   libxl_rdm_reserve = Struct("rdm_reserve", [
> > >> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > >> index bd22be9d33..81aa3797e3 100644
> > >> --- a/tools/xl/xl_parse.c
> > >> +++ b/tools/xl/xl_parse.c
> > >> @@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
> > >>               }
> > >>           }
> > >>
> > >> +        if (MATCH_OPTION("agent_id", ptr, oparg)) {
> > >> +            unsigned long val = parse_ulong(oparg);
> > >> +
> > >> +            if (!val || val > 255) {
> > >> +                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%lu). Valid range [1..255]\n",
> > >> +                        val);
> > >> +                ret = ERROR_INVAL;
> > >> +                goto parse_error;
> > >> +            }
> > >> +            arm_sci->agent_id = val;
> > >> +        }
> > >> +
> > >>           ptr = strtok(NULL, ",");
> > >>       }
> > >>
> > >> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > >> index 0a00f03a25..43d21eb889 100644
> > >> --- a/xen/arch/arm/dom0less-build.c
> > >> +++ b/xen/arch/arm/dom0less-build.c
> > >> @@ -835,6 +835,17 @@ int __init domu_dt_sci_parse(struct dt_device_node *node,
> > >>           d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> > >>       else if ( !strcmp(sci_type, "scmi_smc") )
> > >>           d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> > >> +    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
> > >> +    {
> > >> +        uint32_t agent_id = 0;
> > >> +
> > >> +        if ( !dt_property_read_u32(node, "xen,sci_agent_id", &agent_id) ||
> > >> +             !agent_id )
> > > shouldn't we check that agent_id <= 255 ?
> > 
> > I see no limitation about max agent_id in DEN0056E document, it's uint32_t.
> > 
> > >> +            return -EINVAL;
> > >> +
> > >> +        d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> > >> +        d_cfg->arch.arm_sci_agent_id = agent_id;
> > >> +    }
> > >>       else
> > >>       {
> > >>           printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n",
> > >> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > >> index 36d28b52a4..0c9274a2b3 100644
> > >> --- a/xen/arch/arm/domain_build.c
> > >> +++ b/xen/arch/arm/domain_build.c
> > >> @@ -616,7 +616,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
> > >>                    dt_property_name_is_equal(prop, "linux,uefi-mmap-start") ||
> > >>                    dt_property_name_is_equal(prop, "linux,uefi-mmap-size") ||
> > >>                    dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-size") ||
> > >> -                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver"))
> > >> +                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver") ||
> > >> +                 dt_property_name_is_equal(prop, "xen,scmi-secondary-agents") )
> > >>                   continue;
> > >>
> > >>               if ( dt_property_name_is_equal(prop, "xen,dom0-bootargs") ) diff --git a/xen/arch/arm/firmware/Kconfig
> > >> b/xen/arch/arm/firmware/Kconfig index 5c5f0880c4..6b051c8ada 100644
> > >> --- a/xen/arch/arm/firmware/Kconfig +++
> > >> b/xen/arch/arm/firmware/Kconfig @@ -29,6 +29,17 @@ config SCMI_SMC
> > >> driver domain. Use with EL3 firmware which supports only single SCMI
> > >> OSPM agent. +config SCMI_SMC_MA + bool "Enable ARM SCMI SMC multi-agent driver"
> > >> +    select ARM_SCI
> > >> +    help
> > >> +      Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Domains
> > >> +      to EL3 firmware (TF-A) which supports multi-agent feature.
> > >> +      This feature allows to enable SCMI per Domain using unique SCMI agent_id,
> > >> +      so Domain is identified by EL3 firmware as an SCMI Agent and can access
> > >> +      allowed platform resources through dedicated SMC/HVC Shared memory based
> > >> +      transport.
> > >> +
> > >>   endchoice
> > >>
> > >>   endmenu
> > >> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
> > >> index 71bdefc24a..37927e690e 100644
> > >> --- a/xen/arch/arm/firmware/Makefile
> > >> +++ b/xen/arch/arm/firmware/Makefile
> > >> @@ -1,2 +1,3 @@
> > >>   obj-$(CONFIG_ARM_SCI) += sci.o
> > >>   obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
> > >> +obj-$(CONFIG_SCMI_SMC_MA) += scmi-shmem.o scmi-smc-multiagent.o
> > >> diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scmi-proto.h
> > >> new file mode 100644
> > >> index 0000000000..3f4b9c5d6b
> > >> --- /dev/null
> > >> +++ b/xen/arch/arm/firmware/scmi-proto.h
> > >> @@ -0,0 +1,164 @@
> > >> +/* SPDX-License-Identifier: GPL-2.0-only */
> > >> +/*
> > >> + * Arm System Control and Management Interface definitions
> > >> + * Version 3.0 (DEN0056C)
> > >> + *
> > >> + * Copyright (c) 2024 EPAM Systems
> > >> + */
> > >> +
> > >> +#ifndef XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
> > >> +#define XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
> > > NIT: ARM_FIRMWARE_SCMI_PROTO_H
> > +
> > >> +#include <xen/stdint.h>
> > >> +
> > >> +#define SCMI_SHORT_NAME_MAX_SIZE 16
> > >> +
> > >> +/* SCMI status codes. See section 4.1.4 */
> > >> +#define SCMI_SUCCESS              0
> > >> +#define SCMI_NOT_SUPPORTED      (-1)
> > >> +#define SCMI_INVALID_PARAMETERS (-2)
> > >> +#define SCMI_DENIED             (-3)
> > >> +#define SCMI_NOT_FOUND          (-4)
> > >> +#define SCMI_OUT_OF_RANGE       (-5)
> > >> +#define SCMI_BUSY               (-6)
> > >> +#define SCMI_COMMS_ERROR        (-7)
> > >> +#define SCMI_GENERIC_ERROR      (-8)
> > >> +#define SCMI_HARDWARE_ERROR     (-9)
> > >> +#define SCMI_PROTOCOL_ERROR     (-10)
> > >> +
> > >> +/* Protocol IDs */
> > >> +#define SCMI_BASE_PROTOCOL 0x10
> > >> +
> > >> +/* Base protocol message IDs */
> > >> +#define SCMI_BASE_PROTOCOL_VERSION            0x0
> > >> +#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
> > >> +#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
> > >> +#define SCMI_BASE_DISCOVER_AGENT              0x7
> > >> +#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
> > >> +#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
> > >> +
> > >> +typedef struct scmi_msg_header {
> > >> +    uint8_t id;
> > >> +    uint8_t type;
> > >> +    uint8_t protocol;
> > >> +    uint32_t status;
> > >> +} scmi_msg_header_t;
> > >> +
> > >> +/* Table 2 Message header format */
> > >> +#define SCMI_HDR_ID    GENMASK(7, 0)
> > >> +#define SCMI_HDR_TYPE  GENMASK(9, 8)
> > >> +#define SCMI_HDR_PROTO GENMASK(17, 10)
> > >> +
> > >> +#define SCMI_FIELD_GET(_mask, _reg)                                            \
> > >> +    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> > >> +#define SCMI_FIELD_PREP(_mask, _val)                                           \
> > >> +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> > >> +
> > >> +static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
> > >> +{
> > >> +    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
> > >> +           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
> > >> +           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
> > >> +}
> > >> +
> > >> +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t *hdr)
> > >> +{
> > >> +    hdr->id = SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
> > >> +    hdr->type = SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
> > >> +    hdr->protocol = SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
> > >> +}
> > >> +
> > >> +static inline int scmi_to_xen_errno(int scmi_status)
> > >> +{
> > >> +    if ( scmi_status == SCMI_SUCCESS )
> > >> +        return 0;
> > >> +
> > >> +    switch ( scmi_status )
> > >> +    {
> > >> +    case SCMI_NOT_SUPPORTED:
> > >> +        return -EOPNOTSUPP;
> > >> +    case SCMI_INVALID_PARAMETERS:
> > >> +        return -EINVAL;
> > >> +    case SCMI_DENIED:
> > >> +        return -EACCES;
> > >> +    case SCMI_NOT_FOUND:
> > >> +        return -ENOENT;
> > >> +    case SCMI_OUT_OF_RANGE:
> > >> +        return -ERANGE;
> > >> +    case SCMI_BUSY:
> > >> +        return -EBUSY;
> > >> +    case SCMI_COMMS_ERROR:
> > >> +        return -ENOTCONN;
> > >> +    case SCMI_GENERIC_ERROR:
> > >> +        return -EIO;
> > >> +    case SCMI_HARDWARE_ERROR:
> > >> +        return -ENXIO;
> > >> +    case SCMI_PROTOCOL_ERROR:
> > >> +        return -EBADMSG;
> > >> +    default:
> > >> +        return -EINVAL;
> > >> +    }
> > >> +}
> > >> +
> > >> +/* PROTOCOL_VERSION */
> > >> +#define SCMI_VERSION_MINOR GENMASK(15, 0)
> > >> +#define SCMI_VERSION_MAJOR GENMASK(31, 16)
> > >> +
> > >> +struct scmi_msg_prot_version_p2a {
> > >> +    uint32_t version;
> > >> +} __packed;
> > >> +
> > >> +/* BASE PROTOCOL_ATTRIBUTES */
> > >> +#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
> > >> +#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
> > >> +
> > >> +struct scmi_msg_base_attributes_p2a {
> > >> +    uint32_t attributes;
> > >> +} __packed;
> > >> +
> > >> +/*
> > >> + * BASE_DISCOVER_AGENT
> > >> + */
> > >> +#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
> > >> +
> > >> +struct scmi_msg_base_discover_agent_a2p {
> > >> +    uint32_t agent_id;
> > >> +} __packed;
> > >> +
> > >> +struct scmi_msg_base_discover_agent_p2a {
> > >> +    uint32_t agent_id;
> > >> +    char name[SCMI_SHORT_NAME_MAX_SIZE];
> > >> +} __packed;
> > >> +
> > >> +/*
> > >> + * BASE_SET_DEVICE_PERMISSIONS
> > >> + */
> > >> +#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
> > >> +
> > >> +struct scmi_msg_base_set_device_permissions_a2p {
> > >> +    uint32_t agent_id;
> > >> +    uint32_t device_id;
> > >> +    uint32_t flags;
> > >> +} __packed;
> > >> +
> > >> +/*
> > >> + * BASE_RESET_AGENT_CONFIGURATION
> > >> + */
> > >> +#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
> > >> +
> > >> +struct scmi_msg_base_reset_agent_cfg_a2p {
> > >> +    uint32_t agent_id;
> > >> +    uint32_t flags;
> > >> +} __packed;
> > >> +
> > >> +#endif /* XEN_ARCH_ARM_SCI_SCMI_PROTO_H_ */
> > >> +
> > >> +/*
> > >> + * Local variables:
> > >> + * mode: C
> > >> + * c-file-style: "BSD"
> > >> + * c-basic-offset: 4
> > >> + * tab-width: 4
> > >> + * indent-tabs-mode: nil
> > >> + * End:
> > >> + */
> > >> diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scmi-shmem.c
> > >> new file mode 100644
> > >> index 0000000000..dd613ee0b5
> > >> --- /dev/null
> > >> +++ b/xen/arch/arm/firmware/scmi-shmem.c
> > >> @@ -0,0 +1,173 @@
> > >> +/* SPDX-License-Identifier: GPL-2.0-only */
> > >> +/*
> > >> + * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
> > >> + *
> > >> + * Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> > >> + * Copyright (c) 2025 EPAM Systems
> > >> + */
> > >> +/* SPDX-License-Identifier: GPL-2.0-only */
> > >> +
> > >> +#include <asm/io.h>
> > >> +#include <xen/err.h>
> > >> +
> > >> +#include "scmi-proto.h"
> > >> +#include "scmi-shmem.h"
> > > This code is written more generically than the description implies. If
> > > we only want to make SMC calls to TF-A on EL3 and exchange data with it
> > > over shared memory, then I think:
> > > - we don't need the __iomem tag, as there is no MMIO
> > > - we only need a DMB, not a DSB (readl and writel imply DSB, use only
> > >    readl_relaxed and writel_relaxed)
> > >
> > > On the other hand, if we also want to handle the case where the SCMI
> > > server could be on a separate co-processor, then what this code is doing
> > > is not sufficient because we also need a dcache flush, in addition to
> > > the DSB.
> > >
> > > Bertrand, can you double-check?
> > >
> > >
> > >> +/*
> > >> + * Copy data from IO memory space to "real" memory space.
> > >> + */
> > >> +static void __memcpy_fromio(void *to, const volatile void __iomem *from,
> > >> +                            size_t count)
> > >> +{
> > >> +    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
> > >> +    {
> > >> +        *(u8 *)to = readb_relaxed(from);
> > >> +        from++;
> > >> +        to++;
> > >> +        count--;
> > >> +    }
> > >> +
> > >> +    while ( count >= 4 )
> > >> +    {
> > >> +        *(u32 *)to = readl_relaxed(from);
> > >> +        from += 4;
> > >> +        to += 4;
> > >> +        count -= 4;
> > >> +    }
> > >> +
> > >> +    while ( count )
> > >> +    {
> > >> +        *(u8 *)to = readb_relaxed(from);
> > >> +        from++;
> > >> +        to++;
> > >> +        count--;
> > >> +    }
> > >> +}
> > >> +
> > >> +/*
> > >> + * Copy data from "real" memory space to IO memory space.
> > >> + */
> > >> +static void __memcpy_toio(volatile void __iomem *to, const void *from,
> > >> +                          size_t count)
> > >> +{
> > >> +    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
> > >> +    {
> > >> +        writeb_relaxed(*(u8 *)from, to);
> > >> +        from++;
> > >> +        to++;
> > >> +        count--;
> > >> +    }
> > >> +
> > >> +    while ( count >= 4 )
> > >> +    {
> > >> +        writel_relaxed(*(u32 *)from, to);
> > >> +        from += 4;
> > >> +        to += 4;
> > >> +        count -= 4;
> > >> +    }
> > >> +
> > >> +    while ( count )
> > >> +    {
> > >> +        writeb_relaxed(*(u8 *)from, to);
> > >> +        from++;
> > >> +        to++;
> > >> +        count--;
> > >> +    }
> > >> +}
> > > I don't understand why we need __memcpy_fromio and __memcpy_toio: can't
> > > we use a simple memcpy?
> > 
> > This approach was used because we're trying to access shared memory
> > between two independent systems:
> > 
> > Arm-TF and Xen in our case which places some chunks of data to the same
> > memory. And, according to the [0]
> > 
> > ```
> > 
> > Some devices (such as framebuffers) would like to use larger transfers than
> > 8 bytes at a time. For these devices, the memcpy_toio(),
> > memcpy_fromio() and memset_io() functions are
> > provided. Do not use memset or memcpy on IO addresses; they are not
> > guaranteed to copy data in order.
> > 
> > ```
> > 
> > Also, the same approach was used by Arm team when introducing scmi
> > driver to the Linux kernel [1]
> > 
> > 
> > [0]: https://www.kernel.org/doc/Documentation/driver-api/device-io.rst
> > 
> > [1]:https://git.iliana.fyi/linux/patch/?id=d5141f37c42e0b833863f157ac4cee203b2ba3d2
> 
> 
> Keep in mind that [0] refers specifically to access to MMIO regions. I
> assume that the SCMI shared buffers are on normal memory? Regarding [1],
> it makes sense if Linux is trying to support shared memory over MMIO.
> 
> Looking at one of your replies below, I am guessing the memory buffers
> are actually in normal memory but the issue is that TF-A is mapping them
> as uncacheable. Is that correct?
> 
> In that case, I still don't understand why a simple memcpy would not be
> sufficient. Can you check?
> 
> If yes, then for now I would just simplify it down to memcpy. When
> someone adds support for an SCMI server elsewhere we could look into
> adding a more sophisticated memcpy and we can look at the details at
> that point in time. Specifically, I am not convinced that memcpy_toio
> and memcpy_fromio would work if the SCMI server is on a separate
> non-coherent microcontroller.

See my other reply: https://marc.info/?l=xen-devel&m=175020352903542

I think we should implement this as:
memcpy(to, from, count); dsb(st or ld);
--8323329-1934469375-1750204611=:1780597--

