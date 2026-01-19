Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A8D3B927
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 22:13:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208323.1520512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhwY3-0002ks-9O; Mon, 19 Jan 2026 21:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208323.1520512; Mon, 19 Jan 2026 21:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhwY3-0002jR-5b; Mon, 19 Jan 2026 21:12:31 +0000
Received: by outflank-mailman (input) for mailman id 1208323;
 Mon, 19 Jan 2026 21:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIhq=7Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vhwY1-0002jK-IA
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 21:12:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d80f75d-f57b-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 22:12:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 74FFA40D9A;
 Mon, 19 Jan 2026 21:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1441C116C6;
 Mon, 19 Jan 2026 21:12:22 +0000 (UTC)
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
X-Inumbo-ID: 8d80f75d-f57b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768857144;
	bh=gIUQKTb4qgDQbXOcb9pJA2xwBrcDdOEamvxwJ41a2ec=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nhzjk9mbbru6Xsqy1Zs/EAFgxxKt4A9Cy1fDKiwnjVq5+5N/gpBfcrh4DPuXP7Oze
	 HLNxJ+MI9GhmwfcAELqI3a0X9xdzBBnfN14zU3ieB6ZPXE0mtn2xTIyqU38Ka5PikR
	 BH8Y7sEMiBGFezcUshpP/lKeB1Ns2r87TBu1bRHdPM72TmlLgW6aejeWr/uY14hCcQ
	 OIWLlEZjkly6a0XLnWOEkEaOjhRlUcV4f8+qMuTHpRw+M8TYg2MPUwTdYRGXYUCnuF
	 W7HvkAZCdMXR0F5IXdtkfdKiJKLmHzFaSMo07p8fIDlzhw2e9ciuokXIs+9k70pH2E
	 xW7yvBHbk9GVw==
Date: Mon, 19 Jan 2026 13:12:21 -0800 (PST)
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
Subject: Re: [PATCH v7 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
In-Reply-To: <5177397f-d596-40b3-9207-f0de63a24ee6@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601191311410.7192@ubuntu-linux-20-04-desktop>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com> <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2601141639070.72558@ubuntu-linux-20-04-desktop> <ed981ced-d5e5-45df-b424-cfc9866e993f@epam.com>
 <alpine.DEB.2.22.394.2601161220250.72558@ubuntu-linux-20-04-desktop> <5177397f-d596-40b3-9207-f0de63a24ee6@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Jan 2026, Oleksii Moisieiev wrote:
> On 16/01/2026 23:21, Stefano Stabellini wrote:
> > On Fri, 16 Jan 2026, Oleksii Moisieiev wrote:
> >> Hi Stefano,
> >> Please see below.
> >>
> >> On 15/01/2026 03:14, Stefano Stabellini wrote:
> >>> Hi Oleksii,
> >>>
> >>> I am fine with the goals and the strategy to achieve the goals but there
> >>> are some finer details that don't make sense to me. I apologize if I am
> >>> asking the same questions you have already answered as some time as
> >>> passed from the last interaction.
> >>>
> >>>
> >>> On Wed, 14 Jan 2026, Oleksii Moisieiev wrote:
> >>>> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> >>>> (TF-A) which provides SCMI interface with multi-agent support, as shown
> >>>> below.
> >>>>
> >>>>     +-----------------------------------------+
> >>>>     |                                         |
> >>>>     | EL3 TF-A SCMI                           |
> >>>>     +-------+--+-------+--+-------+--+-------++
> >>>>     |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
> >>>>     +-----+-+  +---+---+  +--+----+  +---+---+
> >>>> smc-id1 |        |         |           |
> >>>> agent1  |        |         |           |
> >>>>     +-----v--------+---------+-----------+----+
> >>>>     |              |         |           |    |
> >>>>     |              |         |           |    |
> >>>>     +--------------+---------+-----------+----+
> >>>>            smc-id0 |  smc-id2|    smc-idX|
> >>>>            agent0  |  agent2 |    agentX |
> >>>>                    |         |           |
> >>>>               +----v---+  +--v-----+  +--v-----+
> >>>>               |        |  |        |  |        |
> >>>>               | Dom0   |  | Dom1   |  | DomX   |
> >>>>               |        |  |        |  |        |
> >>>>               |        |  |        |  |        |
> >>>>               +--------+  +--------+  +--------+
> >>>>
> >>>> The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared
> >>>> memory transport for every Agent in the system.
> >>>>
> >>>> The SCMI Agent transport channel defined by pair:
> >>>>    - smc-id: SMC id used for Doorbell
> >>>>    - shmem: shared memory for messages transfer, Xen page
> >>>>    aligned. Shared memort is mapped with the following flags:
> >>>>    MT_DEVICE_nGnRE.
> >>>>
> >>>> The follwoing SCMI Agents are expected to be defined by SCMI FW to enable SCMI
> >>>> multi-agent functionality under Xen:
> >>>> - Xen management agent: trusted agents that accesses to the Base Protocol
> >>>> commands to configure agent specific permissions
> >>>> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
> >>>>     allowed direct HW access. At least one OSPM VM agent has to be provided
> >>>>     by FW if HW is handled only by Dom0 or Driver Domain.
> >>>>
> >>>> The EL3 SCMI FW is expected to implement following Base protocol messages:
> >>>> - BASE_DISCOVER_AGENT (optional if agent_id was provided)
> >>>> - BASE_RESET_AGENT_CONFIGURATION (optional)
> >>>> - BASE_SET_DEVICE_PERMISSIONS (optional)
> >>>>
> >>>> The SCI SCMI SMC multi-agent driver implements following
> >>>> functionality:
> >>>> - The driver is initialized from the Xen SCMI container ``xen_scmi_config``
> >>>>     (compatible ``xen,sci``) placed under ``/chosen/xen``. Only the
> >>>>     ``arm,scmi-smc`` node that is a child of this container will bind to Xen;
> >>>>     other SCMI nodes (for example under ``/firmware``) are ignored to avoid
> >>>>     stealing the host OSPM instance.
> >>>>
> >>>> scmi_shm_1: sram@47ff1000 {
> >>>>             compatible = "arm,scmi-shmem";
> >>>>             reg = <0x0 0x47ff1000 0x0 0x1000>;
> >>>> };
> >>>> scmi_xen: scmi {
> >>>>           compatible = "arm,scmi-smc";
> >>>>           arm,smc-id = <0x82000003>; <--- Xen management agent smc-id
> >>>>           #address-cells = < 1>;
> >>>>           #size-cells = < 0>;
> >>>>           #access-controller-cells = < 1>;
> >>>>           shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> >>>> };
> >>>>
> >>>> - The driver obtains Xen specific SCMI Agent's configuration from the
> >>>>     Host DT, probes Agents and builds SCMI Agents list. The Agents
> >>>>     configuration is taken from "scmi-secondary-agents" property where
> >>>>     first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and
> >>>>     third is optional "agent_id":
> >>>>
> >>>> / {
> >>>>     chosen {
> >>>>       xen {
> >>>>         ranges;
> >>>>         xen_scmi_config {
> >>>>           compatible = "xen,sci";
> >>>>           #address-cells = <2>;
> >>>>           #size-cells = <2>;
> >>>>           ranges;
> >>>>
> >>>>           scmi_shm_0: sram@47ff0000 {
> >>>>             compatible = "arm,scmi-shmem";
> >>>>             reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>>>           };
> >>>>
> >>>>           /* Xen SCMI management channel */
> >>>>           scmi_shm_1: sram@47ff1000 {
> >>>>             compatible = "arm,scmi-shmem";
> >>>>             reg = <0x0 0x47ff1000 0x0 0x1000>;
> >>>>           };
> >>>>
> >>>>           scmi_shm_2: sram@47ff2000 {
> >>>>             compatible = "arm,scmi-shmem";
> >>>>             reg = <0x0 0x47ff2000 0x0 0x1000>;
> >>>>           };
> >>>>
> >>>>           scmi_shm_3: sram@47ff3000 {
> >>>>             compatible = "arm,scmi-shmem";
> >>>>             reg = <0x0 0x47ff3000 0x0 0x1000>;
> >>>>           };
> >>>>
> >>>>           scmi-secondary-agents = <
> >>>>             0x82000002 &scmi_shm_0 0
> >>> 0x82000002 is the same func_id as...
> >>>
> >>>
> >>>>             0x82000004 &scmi_shm_2 2
> >>>>             0x82000005 &scmi_shm_3 3>; <--- func_id, shmem, agent_id
> >>>>           #scmi-secondary-agents-cells = <3>;
> >>>>
> >>>>           scmi_xen: scmi {
> >>>>             compatible = "arm,scmi-smc";
> >>>>             arm,smc-id = <0x82000002>; <--- Xen management agent func_id
> >>> as the one used for Xen. This cannot be right?
> >>>
> >> That's right. Here should be 0x82000003.
> >>>>             #address-cells = <1>;
> >>>>             #size-cells = <0>;
> >>>>             #access-controller-cells = <1>;
> >>>>             shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> >>>>           };
> >>>>         };
> >>>>       };
> >>>>     };
> >>>> };
> >>>>
> >>>> / {
> >>>>       /*
> >>>>        * Host SCMI OSPM channel - provided to the Dom0 as is if SCMI
> >>>>        * enabled for it, ignored by Xen multi-agent mediator
> >>>>        */
> >>>>       scmi_shm: sram@47ff0000 {
> >>>>               compatible = "arm,scmi-shmem";
> >>>>               reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>>>       };
> >>> this is the same as &scmi_shm_0 which I guess is intended?
> >>>
> >> it is. to match Host DT.
> >>>>       firmware {
> >>>>         scmi: scmi {
> >>>>           compatible = "arm,scmi-smc";
> >>>>           arm,smc-id = <0x82000002>; <--- Host OSPM agent smc-id
> >>> but this again is the same smc-id meant to be used by Xen.
> >>>
> >>> If 0x82000002 is the privileged interface, then it is OK for Xen and
> >>> also baremetal Linux to use it, but Linux Dom0 should not be using it?
> >>> Or is the smc-id interchangeable and not necessarily tied to the
> >>> agent-id?
> >>>
> >>> I think either way this detail should be clarified in the docs. Speaking
> >>> of docs, the next patch introducing the doc is not up-to-date with this
> >>> patch.
> >>>
> >> In my current configuration, I have the following setup:
> >>
> >> The Xen privileged interface operates through func_id 0x82000003.
> >> func_id 0x82000002 is used for Domain-0, in order to keep the Device
> >> Tree (DT) consistent between Xen and bare-metal configurations.
> >> I am unsure how best to document this, since the implementation does
> >> not strictly require this specific configuration and allows flexibility
> >> for the
> >> end user. My intention is to provide an example configuration in the DT
> >> examples that is most likely to be used as a reference for real-world
> >> setups.
> > Yes, I am aligned with that
> >
> >
> >> At this stage, I believe the most appropriate approach is to include a note
> >> in the documentation stating that the examples illustrate a configuration
> >> that aligns well with the Xen architecture, but other configurations are
> >> possible depending on user requirements.
> > Yes. The important detail is to explain that the same configuration
> > works for both Linux baremetal and Linux Dom0. In the Linux Dom0 case,
> > the privileged SCMI connection differs from the one of Linux Dom0 and it
> > is the one used by Xen.
> >
> > Baremetal Linux: func_id 0x82000002, scmi-shmem 0x47ff0000
> > Dom0 Linux: func_id 0x82000002, scmi-shmem 0x47ff0000
> > Xen: func_id 0x82000003, scmi-shmem 0x47ff1000
> >
> > This works because, I am guessing, the privileged SCMI connection is not
> > tied to func_id 0x82000002, scmi-shmem 0x47ff0000.
> >
> > The problem occurs when there can be only one privileged SCMI connection
> > and it is tied to func_id 0x82000002, scmi-shmem 0x47ff0000 which is the
> > one described in the Host DT. In which case, Linux Dom0 ends up with the
> > privileged connection, not Xen.
> >
> > I think we should explain why this problem does not occur.
> >
> >
> >>>>           #address-cells = < 1>;
> >>>>           #size-cells = < 0>;
> >>>>           shmem = <&scmi_shm>; <--- Host OSPM agent shmem
> >>>>
> >>>>           protocol@X{
> >>>>           };
> >>>>         };
> >>>>      };
> >>>> };
> >>>>
> >>>> This approach allows defining multiple SCMI Agents by adding
> >>>> Xen-specific properties under the ``/chosen`` node to the Host Device
> >>>> Tree, leaving the main part unchanged. The Host DT SCMI channel will
> >>>> be passed to Dom0.
> >>>>
> >>>> The Xen management agent is described as a ``scmi_xen`` node under the
> >>>> ``xen,sci`` comaptible node, which is used by Xen to control other
> >>>> SCMI Agents in the system.
> >>>>
> >>>> All secondary agents' configurations are provided in the
> >>>> ``scmi-secondary-agents`` property with an optional ``agent_id`` field.
> >>>>
> >>>> The ``agent_id`` from the ``scmi-secondary-agents`` property is used
> >>>> to identify the agent in the system and can be omitted by setting
> >>>> ``#scmi-secondary-agents-cells = <2>``, so the Secondary Agents
> >>>> configuration will look like this:
> >>>>
> >>>> / {
> >>>>     chosen {
> >>>>       xen {
> >>>>         xen_scmi_config {
> >>>>           compatible = "xen,sci";
> >>>>           #address-cells = <2>;
> >>>>           #size-cells = <2>;
> >>>>           ranges;
> >>>>
> >>>>           /* Shared memory nodes as defined earlier */
> >>>>
> >>>>           scmi-secondary-agents = <
> >>>>             0x82000003 &scmi_shm_0
> >>>>             0x82000004 &scmi_shm_2
> >>>>             0x82000005 &scmi_shm_3
> >>>>             0x82000006 &scmi_shm_4>;
> >>>>           #scmi-secondary-agents-cells = <2>;
> >>>>         };
> >>>>       };
> >>>>     };
> >>>> }
> >>>>
> >>>> In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to
> >>>> discover the ``agent_id`` for each secondary agent. Providing the
> >>>> ``agent_id`` in the ``scmi-secondary-agents`` property allows skipping
> >>>> the discovery call, which is useful when the secondary agent's shared
> >>>> memory is not accessible by Xen or when boot time is important because
> >>>> it allows skipping the agent discovery procedure.
> >>>>
> >>>>     Note that Xen is the only one entry in the system which need to know
> >>>>     about SCMI multi-agent support.
> >>>>
> >>>> - It implements the SCI subsystem interface required for configuring and
> >>>> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> >>>> SCMI functionality for domain it has to be configured with unique supported
> >>>> SCMI Agent_id and use corresponding SCMI SMC shared memory transport
> >>>> [smc-id, shmem] defined for this SCMI Agent_id.
> >>>> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
> >>>>     -- zero-copy, the guest domain puts SCMI message in shmem;
> >>>>     -- the guest triggers SMC exception with smc-id (doorbell);
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
> >>> Given that everything else, the entire configuration, is based on device
> >>> tree, I think it makes sense to also configure this via device tree
> >>> instead of a command line.
> >>>
> >>> This could be another parameter under xen_scmi_config. What do you
> >>> think?
> >>>
> >> The ``dom0_scmi_agent_id`` parameter was introduced to keep the Dom0
> >> configuration separate from the xen_scmi_config node, which is intended
> >> specifically for Xen SCMI configuration. In my opinion, adding Dom0-specific
> >> configuration to xen_scmi_config would mix the purposes of the node and
> >> reduce clarity.
> >>
> >> Additionally, the ``dom0_scmi_agent_id`` parameter is similar to the
> >> ``agent_id`` parameter used for arm_sci in xl.cfg. This approach ensures
> >> that
> >> the Dom0 configuration is as consistent as possible with the
> >> configuration for
> >> other domains.
> >>
> >> Overall, I believe this makes the configuration less confusing, as it allows
> >> us to set similar parameters for both Dom0 and other domains in a clear
> >> and organized manner.
> > We are heading in a direction where Dom0 has its own separate domain
> > node similarly to other Dom0less domains. Many of these changes have
> > already been committed as part of Hardware Domain / Control Domain
> > separation work by Jason.
> >
> > In a world where Dom0, like other DomUs, has its own configuration node
> > and also Dom0 can be split between Hardware Domain and Control Domain,
> > it doesn't make sense to use Dom0 command line options anymore. It is
> > already possible to assign Dom0 "powers" to a dom0less domain for
> > example.
> >
> > I can see it is worth discussing command line options for dom0 in
> > situations where Device Tree might not be present (datacenter
> > configuration on ACPI system) but in this case where Device Tree changes
> > are required, I think it doesn't make sense to add Dom0 command line
> > options as they are less flexible and a duplicate of other options we
> > must have anyway.
> That makes sense to me. Since we are moving to the Dom0 Device Tree
> configuration,
> I can move ``dom0_scmi_agent_id`` inside the ``xen,sci`` node and rename
> it as the
> ``agent_id`` property.
> 
> Would you recommend dropping the ``dom0_scmi_agent_id`` command line
> parameter
> entirely, or should I keep it as a backup option?

I would drop the command line parameter entirely

