Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59ADD3883F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 22:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207045.1520135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgrG5-0000fI-On; Fri, 16 Jan 2026 21:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207045.1520135; Fri, 16 Jan 2026 21:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgrG5-0000dr-ME; Fri, 16 Jan 2026 21:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1207045;
 Fri, 16 Jan 2026 21:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vgrG3-0000dl-M3
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 21:21:27 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa3fb3a-f321-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 22:21:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE9E560160;
 Fri, 16 Jan 2026 21:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A34C116C6;
 Fri, 16 Jan 2026 21:21:21 +0000 (UTC)
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
X-Inumbo-ID: 4fa3fb3a-f321-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768598483;
	bh=kVz63F/RyJ3otjUteBXhgWEC5QC8+f0Ju+jogj49Cy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dTWxDWPNJutlwHzW59KTQuBNdEPQtfQ2123bKumxK4Aq5BMsnNfiRGiks6DFzMzFS
	 l9SMkx8CCg/nFv4jC7o6cGTbVH9XsJRMaCSU83yeQ9dQf3if6Pagk+J5GWGmfuIViK
	 irFLQIzWt86vN7yNq7YtXIGL30/3rBcxyJ8Tzycp0ND18dk+SP0QpU27Cbi2crgXZX
	 9ixbQHYiY6rxLrNzeTo0rd80/qjnzbyLq8gz9atY3blagct9EMvKggAzm738Bmx5/Q
	 yLxckxFq3ZFb//Ecqx4LRRHfbI4FQKMjTHeL88HAQSN84lj3VbVL+vh2PpxAq55He5
	 uafVGNWTKxkJQ==
Date: Fri, 16 Jan 2026 13:21:17 -0800 (PST)
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
In-Reply-To: <ed981ced-d5e5-45df-b424-cfc9866e993f@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601161220250.72558@ubuntu-linux-20-04-desktop>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com> <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2601141639070.72558@ubuntu-linux-20-04-desktop>
 <ed981ced-d5e5-45df-b424-cfc9866e993f@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Jan 2026, Oleksii Moisieiev wrote:
> Hi Stefano,
> Please see below.
> 
> On 15/01/2026 03:14, Stefano Stabellini wrote:
> > Hi Oleksii,
> >
> > I am fine with the goals and the strategy to achieve the goals but there
> > are some finer details that don't make sense to me. I apologize if I am
> > asking the same questions you have already answered as some time as
> > passed from the last interaction.
> >
> >
> > On Wed, 14 Jan 2026, Oleksii Moisieiev wrote:
> >> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> >> (TF-A) which provides SCMI interface with multi-agent support, as shown
> >> below.
> >>
> >>    +-----------------------------------------+
> >>    |                                         |
> >>    | EL3 TF-A SCMI                           |
> >>    +-------+--+-------+--+-------+--+-------++
> >>    |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
> >>    +-----+-+  +---+---+  +--+----+  +---+---+
> >> smc-id1 |        |         |           |
> >> agent1  |        |         |           |
> >>    +-----v--------+---------+-----------+----+
> >>    |              |         |           |    |
> >>    |              |         |           |    |
> >>    +--------------+---------+-----------+----+
> >>           smc-id0 |  smc-id2|    smc-idX|
> >>           agent0  |  agent2 |    agentX |
> >>                   |         |           |
> >>              +----v---+  +--v-----+  +--v-----+
> >>              |        |  |        |  |        |
> >>              | Dom0   |  | Dom1   |  | DomX   |
> >>              |        |  |        |  |        |
> >>              |        |  |        |  |        |
> >>              +--------+  +--------+  +--------+
> >>
> >> The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared
> >> memory transport for every Agent in the system.
> >>
> >> The SCMI Agent transport channel defined by pair:
> >>   - smc-id: SMC id used for Doorbell
> >>   - shmem: shared memory for messages transfer, Xen page
> >>   aligned. Shared memort is mapped with the following flags:
> >>   MT_DEVICE_nGnRE.
> >>
> >> The follwoing SCMI Agents are expected to be defined by SCMI FW to enable SCMI
> >> multi-agent functionality under Xen:
> >> - Xen management agent: trusted agents that accesses to the Base Protocol
> >> commands to configure agent specific permissions
> >> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
> >>    allowed direct HW access. At least one OSPM VM agent has to be provided
> >>    by FW if HW is handled only by Dom0 or Driver Domain.
> >>
> >> The EL3 SCMI FW is expected to implement following Base protocol messages:
> >> - BASE_DISCOVER_AGENT (optional if agent_id was provided)
> >> - BASE_RESET_AGENT_CONFIGURATION (optional)
> >> - BASE_SET_DEVICE_PERMISSIONS (optional)
> >>
> >> The SCI SCMI SMC multi-agent driver implements following
> >> functionality:
> >> - The driver is initialized from the Xen SCMI container ``xen_scmi_config``
> >>    (compatible ``xen,sci``) placed under ``/chosen/xen``. Only the
> >>    ``arm,scmi-smc`` node that is a child of this container will bind to Xen;
> >>    other SCMI nodes (for example under ``/firmware``) are ignored to avoid
> >>    stealing the host OSPM instance.
> >>
> >> scmi_shm_1: sram@47ff1000 {
> >>            compatible = "arm,scmi-shmem";
> >>            reg = <0x0 0x47ff1000 0x0 0x1000>;
> >> };
> >> scmi_xen: scmi {
> >>          compatible = "arm,scmi-smc";
> >>          arm,smc-id = <0x82000003>; <--- Xen management agent smc-id
> >>          #address-cells = < 1>;
> >>          #size-cells = < 0>;
> >>          #access-controller-cells = < 1>;
> >>          shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> >> };
> >>
> >> - The driver obtains Xen specific SCMI Agent's configuration from the
> >>    Host DT, probes Agents and builds SCMI Agents list. The Agents
> >>    configuration is taken from "scmi-secondary-agents" property where
> >>    first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and
> >>    third is optional "agent_id":
> >>
> >> / {
> >>    chosen {
> >>      xen {
> >>        ranges;
> >>        xen_scmi_config {
> >>          compatible = "xen,sci";
> >>          #address-cells = <2>;
> >>          #size-cells = <2>;
> >>          ranges;
> >>
> >>          scmi_shm_0: sram@47ff0000 {
> >>            compatible = "arm,scmi-shmem";
> >>            reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>          };
> >>
> >>          /* Xen SCMI management channel */
> >>          scmi_shm_1: sram@47ff1000 {
> >>            compatible = "arm,scmi-shmem";
> >>            reg = <0x0 0x47ff1000 0x0 0x1000>;
> >>          };
> >>
> >>          scmi_shm_2: sram@47ff2000 {
> >>            compatible = "arm,scmi-shmem";
> >>            reg = <0x0 0x47ff2000 0x0 0x1000>;
> >>          };
> >>
> >>          scmi_shm_3: sram@47ff3000 {
> >>            compatible = "arm,scmi-shmem";
> >>            reg = <0x0 0x47ff3000 0x0 0x1000>;
> >>          };
> >>
> >>          scmi-secondary-agents = <
> >>            0x82000002 &scmi_shm_0 0
> > 0x82000002 is the same func_id as...
> >
> >
> >>            0x82000004 &scmi_shm_2 2
> >>            0x82000005 &scmi_shm_3 3>; <--- func_id, shmem, agent_id
> >>          #scmi-secondary-agents-cells = <3>;
> >>
> >>          scmi_xen: scmi {
> >>            compatible = "arm,scmi-smc";
> >>            arm,smc-id = <0x82000002>; <--- Xen management agent func_id
> > as the one used for Xen. This cannot be right?
> >
> That's right. Here should be 0x82000003.
> >>            #address-cells = <1>;
> >>            #size-cells = <0>;
> >>            #access-controller-cells = <1>;
> >>            shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> >>          };
> >>        };
> >>      };
> >>    };
> >> };
> >>
> >> / {
> >>      /*
> >>       * Host SCMI OSPM channel - provided to the Dom0 as is if SCMI
> >>       * enabled for it, ignored by Xen multi-agent mediator
> >>       */
> >>      scmi_shm: sram@47ff0000 {
> >>              compatible = "arm,scmi-shmem";
> >>              reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>      };
> > this is the same as &scmi_shm_0 which I guess is intended?
> >
> it is. to match Host DT.
> >>      firmware {
> >>        scmi: scmi {
> >>          compatible = "arm,scmi-smc";
> >>          arm,smc-id = <0x82000002>; <--- Host OSPM agent smc-id
> > but this again is the same smc-id meant to be used by Xen.
> >
> > If 0x82000002 is the privileged interface, then it is OK for Xen and
> > also baremetal Linux to use it, but Linux Dom0 should not be using it?
> > Or is the smc-id interchangeable and not necessarily tied to the
> > agent-id?
> >
> > I think either way this detail should be clarified in the docs. Speaking
> > of docs, the next patch introducing the doc is not up-to-date with this
> > patch.
> >
> In my current configuration, I have the following setup:
> 
> The Xen privileged interface operates through func_id 0x82000003.
> func_id 0x82000002 is used for Domain-0, in order to keep the Device
> Tree (DT) consistent between Xen and bare-metal configurations.
> I am unsure how best to document this, since the implementation does
> not strictly require this specific configuration and allows flexibility
> for the
> end user. My intention is to provide an example configuration in the DT
> examples that is most likely to be used as a reference for real-world
> setups.

Yes, I am aligned with that


> At this stage, I believe the most appropriate approach is to include a note
> in the documentation stating that the examples illustrate a configuration
> that aligns well with the Xen architecture, but other configurations are
> possible depending on user requirements.

Yes. The important detail is to explain that the same configuration
works for both Linux baremetal and Linux Dom0. In the Linux Dom0 case,
the privileged SCMI connection differs from the one of Linux Dom0 and it
is the one used by Xen.

Baremetal Linux: func_id 0x82000002, scmi-shmem 0x47ff0000
Dom0 Linux: func_id 0x82000002, scmi-shmem 0x47ff0000
Xen: func_id 0x82000003, scmi-shmem 0x47ff1000

This works because, I am guessing, the privileged SCMI connection is not
tied to func_id 0x82000002, scmi-shmem 0x47ff0000.

The problem occurs when there can be only one privileged SCMI connection
and it is tied to func_id 0x82000002, scmi-shmem 0x47ff0000 which is the
one described in the Host DT. In which case, Linux Dom0 ends up with the
privileged connection, not Xen.

I think we should explain why this problem does not occur.


> >>          #address-cells = < 1>;
> >>          #size-cells = < 0>;
> >>          shmem = <&scmi_shm>; <--- Host OSPM agent shmem
> >>
> >>          protocol@X{
> >>          };
> >>        };
> >>     };
> >> };
> >>
> >> This approach allows defining multiple SCMI Agents by adding
> >> Xen-specific properties under the ``/chosen`` node to the Host Device
> >> Tree, leaving the main part unchanged. The Host DT SCMI channel will
> >> be passed to Dom0.
> >>
> >> The Xen management agent is described as a ``scmi_xen`` node under the
> >> ``xen,sci`` comaptible node, which is used by Xen to control other
> >> SCMI Agents in the system.
> >>
> >> All secondary agents' configurations are provided in the
> >> ``scmi-secondary-agents`` property with an optional ``agent_id`` field.
> >>
> >> The ``agent_id`` from the ``scmi-secondary-agents`` property is used
> >> to identify the agent in the system and can be omitted by setting
> >> ``#scmi-secondary-agents-cells = <2>``, so the Secondary Agents
> >> configuration will look like this:
> >>
> >> / {
> >>    chosen {
> >>      xen {
> >>        xen_scmi_config {
> >>          compatible = "xen,sci";
> >>          #address-cells = <2>;
> >>          #size-cells = <2>;
> >>          ranges;
> >>
> >>          /* Shared memory nodes as defined earlier */
> >>
> >>          scmi-secondary-agents = <
> >>            0x82000003 &scmi_shm_0
> >>            0x82000004 &scmi_shm_2
> >>            0x82000005 &scmi_shm_3
> >>            0x82000006 &scmi_shm_4>;
> >>          #scmi-secondary-agents-cells = <2>;
> >>        };
> >>      };
> >>    };
> >> }
> >>
> >> In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to
> >> discover the ``agent_id`` for each secondary agent. Providing the
> >> ``agent_id`` in the ``scmi-secondary-agents`` property allows skipping
> >> the discovery call, which is useful when the secondary agent's shared
> >> memory is not accessible by Xen or when boot time is important because
> >> it allows skipping the agent discovery procedure.
> >>
> >>    Note that Xen is the only one entry in the system which need to know
> >>    about SCMI multi-agent support.
> >>
> >> - It implements the SCI subsystem interface required for configuring and
> >> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> >> SCMI functionality for domain it has to be configured with unique supported
> >> SCMI Agent_id and use corresponding SCMI SMC shared memory transport
> >> [smc-id, shmem] defined for this SCMI Agent_id.
> >> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
> >>    -- zero-copy, the guest domain puts SCMI message in shmem;
> >>    -- the guest triggers SMC exception with smc-id (doorbell);
> >>    -- the Xen driver catches exception, do checks and synchronously forwards
> >>    it to EL3 FW.
> >> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
> >>    management agent channel on domain destroy event. This allows to reset
> >>    resources used by domain and so implement use-case like domain reboot.
> >>
> >> Dom0 Enable SCMI SMC:
> >>   - pass dom0_scmi_agent_id=<agent_id> in Xen command line. if not provided
> >>     SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
> >>     The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
> >>     node according to assigned agent_id.
> > Given that everything else, the entire configuration, is based on device
> > tree, I think it makes sense to also configure this via device tree
> > instead of a command line.
> >
> > This could be another parameter under xen_scmi_config. What do you
> > think?
> >
> 
> The ``dom0_scmi_agent_id`` parameter was introduced to keep the Dom0
> configuration separate from the xen_scmi_config node, which is intended
> specifically for Xen SCMI configuration. In my opinion, adding Dom0-specific
> configuration to xen_scmi_config would mix the purposes of the node and
> reduce clarity.
>
> Additionally, the ``dom0_scmi_agent_id`` parameter is similar to the
> ``agent_id`` parameter used for arm_sci in xl.cfg. This approach ensures
> that
> the Dom0 configuration is as consistent as possible with the
> configuration for
> other domains.
> 
> Overall, I believe this makes the configuration less confusing, as it allows
> us to set similar parameters for both Dom0 and other domains in a clear
> and organized manner.

We are heading in a direction where Dom0 has its own separate domain
node similarly to other Dom0less domains. Many of these changes have
already been committed as part of Hardware Domain / Control Domain
separation work by Jason.

In a world where Dom0, like other DomUs, has its own configuration node
and also Dom0 can be split between Hardware Domain and Control Domain,
it doesn't make sense to use Dom0 command line options anymore. It is
already possible to assign Dom0 "powers" to a dom0less domain for
example.

I can see it is worth discussing command line options for dom0 in
situations where Device Tree might not be present (datacenter
configuration on ACPI system) but in this case where Device Tree changes
are required, I think it doesn't make sense to add Dom0 command line
options as they are less flexible and a duplicate of other options we
must have anyway.

However, we can express them in better ways. For instance, we could
reuse your exiting work to enable dom0less DomUs.

See https://www.youtube.com/watch?v=J6q67jkG5DQ


> >> Guest domains enable SCMI SMC:
> >>   - xl.cfg: add configuration option as below
> >>
> >>     arm_sci = "type=scmi_smc_multiagent,=2"
> >>
> >>   - xl.cfg: enable access to the "arm,scmi-shmem" which should
> >>   correspond assigned agent_id for the domain, for example:
> >>
> >> iomem = [
> >>      "47ff2,1@22001",
> >> ]
> >>
> >>   - DT: add SCMI nodes to the Driver domain partial device tree as in the
> >>   below example. The "arm,smc-id" should correspond assigned agent_id
> >>   for the domain:
> >>
> >> passthrough {
> >>     scmi_shm_0: sram@22001000 {
> >>         compatible = "arm,scmi-shmem";
> >>         reg = <0x0 0x22001000 0x0 0x1000>;
> >>     };
> >>
> >>     firmware {
> >>          compatible = "simple-bus";
> >>              scmi: scmi {
> >>                  compatible = "arm,scmi-smc";
> >>                  arm,smc-id = <0x82000004>;
> >>                  shmem = <&scmi_shm_0>;
> >>                  ...
> >>              }
> >>      }
> >> }
> >>
> >> SCMI "4.2.1.1 Device specific access control"
> >>
> >> The XEN SCI SCMI SMC multi-agent driver performs "access-controller"
> >> provider function in case EL3 SCMI FW implements SCMI "4.2.1.1 Device
> >> specific access control" and provides the BASE_SET_DEVICE_PERMISSIONS
> >> command to configure the devices that an agents have access to.
> >> The DT SCMI node should "#access-controller-cells=<1>" property and DT
> >> devices should be bound to the Xen SCMI.
> >>
> >> &i2c1 {
> >>      access-controllers = <&scmi 0>;
> >> };
> >>
> >> The Dom0 and dom0less domains DT devices will be processed
> >> automatically through sci_assign_dt_device() call, but to assign SCMI
> >> devices from toolstack the xl.cfg:"dtdev" property
> >> shall be used:
> >>
> >> dtdev = [
> >>      "/soc/i2c@e6508000",
> >> ]
> >>
> >> xl.cfg:dtdev will contain all nodes which are under SCMI
> >> management (not only those which are behind IOMMU).
> >>
> >> [1]https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >> [2]https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> >>
> >> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> >> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> >> ---
> >>
> >> Changes in v7:
> >> - rework scmi nodes for xen to match on compatible string instead of
> >> the direct path
> >>
> >> Changes in v6:
> >> - updated scmi-shmem to use io.h from generic location
> >> - update scmi_agent_id parameter to be provided inside dom0= parameter
> >> list and have the following format "dom0=sci-agent-id=0"
> >> This change was done as a response for Stefano comment and
> >> requires a lot of code changes, but produces much cleaner solution
> >> that's why I've added it to the code.
> >> - fix file comments and return codes
> >> - fix lenght checks in shmem_{get,put}_message to use offsetof
> >> - remove len member from scmi_channel structure as it is not used
> >> - set scmi-secondary-agents property to be mandatory since if no
> >> secondary agents were provided then there is no sence to enable scmi
> >> when no secondary agents are populated to the Domains
> >> - update documentation in booting.txt, added xen_scmi node to the
> >> example
> >> - adjust d->arch.sci_enabled value in scmi_domain_destroy
> >> - fix lock management in smc_create_channel call
> >> - avoid extra map_channel_memory command for Xen management channel
> >> because collect_agent_id call unmaps memory if DOMID_XEN is not
> >> set. So for Xen management channel we can init domain_id ad DOMID_XEN
> >> before calling collect_agent_id so memory shouldn't be unmapped.
> >>
> >> Changes in v5:
> >> - fix device-tree example format in booting.txt, added ";" after "}".
> >> - update define in scmi-proto.h
> >> - update define in scmi-shmem.h file
> >> - scmi_assign_device - do not ignore -EOPNOTSUPP return
> >> code of the do_smc_xfer
> >> - remove overwriting agent_channel->agent_id after
> >> SCMI_BASE_DISCOVER_AGENT call
> >> - add multi-agent files to the MAINTAINERS
> >> - add SCMI multi-agent description to the SUPPORT.md
> >> - handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
> >> for smc call
> >> - updated collect_agents function. Set agent_id parameter as optional
> >> in scmi-secondary-agents device-tree property
> >> - introduce "#scmi-secondary-agents-cells" parameter to set if
> >> agent_id was provided
> >> - reanme xen,scmi-secondary-agents property to scmi-secondary-agents
> >> - move memcpu_toio/fromio for the generic place
> >> - update Xen to get management channel from /chosen/xen,config node
> >> - get hypervisor channnel from node instead of using hardcoded
> >> - update handling scmi and shmem nodes for the domain
> >> - Set multi-agent driver to support only Arm64
> >>
> >> Changes in v4:
> >> - toolstack comments from Anthony PERARD
> >> - added dom0less support
> >> - added doc for "xen,scmi-secondary-agents"
> >>
> >>   MAINTAINERS                                 |   4 +
> >>   SUPPORT.md                                  |  11 +
> >>   docs/man/xl.cfg.5.pod.in                    |  13 +
> >>   docs/misc/arm/device-tree/booting.txt       | 103 +++
> >>   docs/misc/xen-command-line.pandoc           |  19 +-
> >>   tools/libs/light/libxl_arm.c                |   4 +
> >>   tools/libs/light/libxl_types.idl            |   4 +-
> >>   tools/xl/xl_parse.c                         |  12 +
> >>   xen/arch/arm/dom0less-build.c               |  11 +
> >>   xen/arch/arm/domain_build.c                 |  26 +-
> >>   xen/arch/arm/firmware/Kconfig               |  12 +
> >>   xen/arch/arm/firmware/Makefile              |   1 +
> >>   xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
> >>   xen/arch/arm/firmware/scmi-shmem.c          | 115 +++
> >>   xen/arch/arm/firmware/scmi-shmem.h          |  45 ++
> >>   xen/arch/arm/firmware/scmi-smc-multiagent.c | 815 ++++++++++++++++++++
> >>   xen/include/public/arch-arm.h               |   3 +
> >>   17 files changed, 1359 insertions(+), 3 deletions(-)
> >>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
> >>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
> >>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
> >>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index ecd3f40df8..4ad1d818a6 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -532,6 +532,10 @@ R:      Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> >>   S: Supported
> >>   F: xen/arch/arm/firmware/sci.c
> >>   F: xen/arch/arm/include/asm/firmware/sci.h
> >> +F:  xen/arch/arm/firmware/scmi-smc-multiagent.c
> >> +F:  xen/arch/arm/firmware/scmi-shmem.c
> >> +F:  xen/arch/arm/firmware/scmi-shmem.h
> >> +F:  xen/arch/arm/firmware/scmi-proto.h
> >>
> >>   SEABIOS UPSTREAM
> >>   M: Wei Liu<wl@xen.org>
> >> diff --git a/SUPPORT.md b/SUPPORT.md
> >> index 491f9ecd1b..7c8951d67b 100644
> >> --- a/SUPPORT.md
> >> +++ b/SUPPORT.md
> >> @@ -956,6 +956,17 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
> >>
> >>       Status: Supported
> >>
> >> +### Arm: SCMI SMC multi-agent support
> >> +
> >> +Enable support for the multi-agent configuration of the EL3 Firmware, which
> >> +allows Xen to provide an SCMI interface to the Domains.
> >> +Xen manages access permissions to the HW resources and provides an SCMI interface
> >> +to the Domains. Each Domain is represented as a separate Agent, which can
> >> +communicate with EL3 Firmware using a dedicated shared memory region, and
> >> +notifications are passed through by Xen.
> >> +
> >> +    Status, ARM64: Tech Preview
> >> +
> >>   ### ARM: Guest PSCI support
> >>
> >>   Emulated PSCI interface exposed to guests. We support all mandatory
> >> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> >> index ad1553c5e9..4fc3e12939 100644
> >> --- a/docs/man/xl.cfg.5.pod.in
> >> +++ b/docs/man/xl.cfg.5.pod.in
> >> @@ -3156,8 +3156,21 @@ single SCMI OSPM agent support.
> >>   Should be used together with B<scmi-smc-passthrough> Xen command line
> >>   option.
> >>
> >> +=item B<scmi_smc_multiagent>
> >> +
> >> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> >> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmware-A)
> >> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
> >> +specified for the guest.
> >> +
> >>   =back
> >>
> >> +=item B<agent_id=NUMBER>
> >> +
> >> +Specifies a non-zero ARM SCI agent id for the guest. This option is mandatory
> >> +if the SCMI SMC support is enabled for the guest. The agent ids of domains
> >> +existing on a single host must be unique and in the range [1..255].
> >> +
> >>   =back
> >>
> >>   =back
> >> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> >> index 977b428608..6fd7e4a16b 100644
> >> --- a/docs/misc/arm/device-tree/booting.txt
> >> +++ b/docs/misc/arm/device-tree/booting.txt
> >> @@ -322,6 +322,20 @@ with the following properties:
> >>       Should be used together with scmi-smc-passthrough Xen command line
> >>       option.
> >>
> >> +    - "scmi_smc_multiagent"
> >> +
> >> +    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI over
> >> +    SMC calls forwarding from domain to the EL3 firmware (like ARM
> >> +    Trusted Firmware-A) with a multi SCMI OSPM agent support.
> >> +    The SCMI agent_id should be specified for the guest with "xen,sci-agent-id"
> >> +    property.
> >> +
> >> +- "xen,sci-agent-id"
> >> +
> >> +    Specifies ARM SCMI agent id for the guest. This option is mandatory if the
> >> +    SCMI SMC "scmi_smc_multiagent" support is enabled for the guest. The agent ids
> >> +    of guest must be unique and in the range [0..255].
> > these two don't seem to be in the commit message examples
> >
> >
> ``scmi_smc_multiagent`` mentioned in the commit message at the following
> part:
> 
>  > - xl.cfg: add configuration option as below
>  > arm_sci = "type=scmi_smc_multiagent,agent_id=2"
> 
> ``xen,sci-agent-id`` is used for dom0less. It described in arm-scmi.rst
> file which was presented in the next commit.

All device tree options should be described
docs/misc/arm/device-tree/booting.txt, even if they are similar to other
options described elsewhere. This is similar to the way all Xen command
line options should be described in docs/misc/xen-command-line.pandoc


> >>   Under the "xen,domain" compatible node, one or more sub-nodes are present
> >>   for the DomU kernel and ramdisk.
> >>
> >> @@ -824,3 +838,92 @@ The automatically allocated static shared memory will get mapped at
> >>   0x80000000 in DomU1 guest physical address space, and at 0x90000000 in DomU2
> >>   guest physical address space. DomU1 is explicitly defined as the owner domain,
> >>   and DomU2 is the borrower domain.


