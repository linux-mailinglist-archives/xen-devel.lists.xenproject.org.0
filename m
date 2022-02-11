Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C794B314E
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 00:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270679.465011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIfRZ-0001us-Aa; Fri, 11 Feb 2022 23:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270679.465011; Fri, 11 Feb 2022 23:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIfRZ-0001s7-7B; Fri, 11 Feb 2022 23:35:13 +0000
Received: by outflank-mailman (input) for mailman id 270679;
 Fri, 11 Feb 2022 23:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kHth=S2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nIfRX-0001UC-14
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 23:35:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa18ec3-8b93-11ec-8eb8-a37418f5ba1a;
 Sat, 12 Feb 2022 00:35:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82247B80D57;
 Fri, 11 Feb 2022 23:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08953C340E9;
 Fri, 11 Feb 2022 23:35:06 +0000 (UTC)
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
X-Inumbo-ID: 3fa18ec3-8b93-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644622507;
	bh=APsCFhU/hEwebhCwGfM+/31CQoeUD9aRNkoMeanb6JI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gP+kYQqNIQ9mL+lMlxiPq7bvppZpYj/ayOZTrNco9L+CFM5mcYIS9hJ8jKC2RNai+
	 hTljWBCiFtffvUzl5M+d/1lE2jBKCEawnhvIe2/6xYqwHnPiCKFvyJfBaunbguWRGE
	 6fqw3430qBRLJz3dRXIp/LCWbcJCNaaKkXhC4+idXqbeHp5tQ4U7ewDUIAuKpwRpDr
	 HDCYwg3klENpuGQ2JBEHuNwUD10G3VC0wcOmmSwLpuAf6l/yemEEo+pxpfa2qvKtxS
	 bbLMeWsPFoQtks1Cp7Pj+6WzKoUgGaCOzfU9Xbiav6K+QQKyVpS0BBH3kVpIOlxrBi
	 7W3WKTZMBYr9Q==
Date: Fri, 11 Feb 2022 15:35:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20220211115516.GA2356906@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2202111428290.2091381@ubuntu-linux-20-04-desktop>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com> <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com> <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com> <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com> <20220211115516.GA2356906@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-665559561-1644618992=:2091381"
Content-ID: <alpine.DEB.2.22.394.2202111516170.2091381@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-665559561-1644618992=:2091381
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2202111516171.2091381@ubuntu-linux-20-04-desktop>

On Fri, 11 Feb 2022, Oleksii Moisieiev wrote:
> On Fri, Feb 11, 2022 at 11:18:47AM +0000, Bertrand Marquis wrote:
> > Hi Oleksii,
> > 
> > 
> > > On 11 Feb 2022, at 10:44, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com> wrote:
> > > 
> > > Hi Bertrand,
> > > 
> > > On Fri, Feb 11, 2022 at 08:46:05AM +0000, Bertrand Marquis wrote:
> > >> Hi Oleksii,
> > >> 
> > >> 
> > >>> On 8 Feb 2022, at 18:00, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com> wrote:
> > >>> 
> > >>> This is the implementation of SCI interface, called SCMI-SMC driver,
> > >>> which works as the mediator between XEN Domains and Firmware (SCP, ATF etc).
> > >>> This allows devices from the Domains to work with clocks, resets and
> > >>> power-domains without access to CPG.
> > >>> 
> > >>> Originally, cpg should be passed to the domain so it can work with
> > >>> power-domains/clocks/resets etc. Considering that cpg can't be split between
> > >>> the Domains, we get the limitation that the devices, which are using
> > >>> power-domains/clocks/resets etc, couldn't be split between the domains.
> > >>> The solution is to move the power-domain/clock/resets etc to the
> > >>> Firmware (such as SCP firmware or ATF) and provide interface for the
> > >>> Domains. XEN should have an entity, caled SCI-Mediator, which is
> > >>> responsible for messages redirection between Domains and Firmware and
> > >>> for permission handling.
> > >>> 
> > >>> The following features are implemented:
> > >>> - request SCMI channels from ATF and pass channels to Domains;
> > >>> - set device permissions for Domains based on the Domain partial
> > >>> device-tree. Devices with permissions are able to work with clocks,
> > >>> resets and power-domains via SCMI;
> > >>> - redirect scmi messages from Domains to ATF.
> > >> 
> > >> Before going more deeply in the code I would like to discuss the general
> > >> design here and ask some questions to prevent to rework the code before
> > >> we all agree that this is the right solution and that we want this in Xen.
> > >> 
> > >> First I want to point out that clock/reset/power virtualization is a problem
> > >> on most applications using device pass-through and I am very glad that
> > >> someone is looking into it.
> > >> Also SCMI is the current standard existing for this so relying on it is a very
> > >> good idea.
> > >> 
> > >> Latest version SCMI standard (DEN0056D v3.1) is defining some means
> > >> to use SCMI on a virtualised system. In chapter 4.2.1, the standard
> > >> recommends to set permissions per agent in the hypervisor so that a VM
> > >> could later use the discovery protocol to detect the resources and use them.
> > >> Using this kind of scenario the mediator in Xen would just configure the
> > >> Permissions in the SCMI and would then rely on it to limit what is possible
> > >> by who just by just assigning a channel to a VM.
> > > 
> > >> 
> > >> In your current design (please correct me if I am wrong) you seem to fully
> > >> rely on Xen and the FDT for discovery and permission.
> > > 
> > > In current implementation Xen is the trusted agent. And it's responsible
> > > for permissions setting. During initialization it discovers agent and
> > > set permissions by using BASE_SET_DEVICE_PERMISSIONS to the Dom0. When
> > > new domain is created, Xen assigns agent id for this domain and request
> > > resources, that are passed-through to this Domain.
> > 
> > Ok
> > 
> > > 
> > > I'm getting the follwing information from FDT:
> > > 1) Shared memory addressed, which should be used for agents. During
> > > initialization I send BASE_DISCOVER_AGENT to each of this addresses and
> > > receive agent_id. Xen is responsible for assigning agent_id for the
> > > Domain. Then Xen intercept smc calls from the domain, set agent_id and
> > > redirects it to the Firmware.
> > 
> > So Xen is setting the agent ID, no way for a guest to get access to something it
> > should with more check, am I right ?
> > 
> 
> Yes. Xen is the only entity, which is trusted. So it's responsible for
> setting permissions and assigning agent_id. Guest get's an access only
> for the devices it's allowed to.
> 
> > > 
> > > 2) Devices, that are using SCMI. Those devices has clock/power/resets
> > > etc related to scmi protocol (as it is done in Linux kernel)
> > > and scmi_devid should be set. I'm currently preparing to send patch,
> > > updating kernel bindings with this parameter to Linux kernel.
> > > scmi_devid value should match device id, set in the Firmware.
> > > dt example:
> > > &usb0 {
> > >    scmi_devid = <1>; // usb0 device id
> > >    clocks = <&scmi_clock 1> // relays on clock with id 1
> > > }
> > > 
> > > Xen requests permission for the device when device is attached to the
> > > Domain during creation.
> > 
> > Without this, how is (if it is) the linux kernel using SCMI for power management ?
> 
> Here is how it should be desribed in FDT: 
> /
> {
>     firmware {
>         scmi {
>             arm,smc-id = <0x82000002>;
>             scmi_power: protocol@11 {
>                 reg = <0x11>;
>                 #power-domain-cells = <1>;
>             };
>             ...
>             scmi_clock: protocol@14 {
>             ...
>             scmi_reset: protocol@16 {
>             ...
>         };
>     };
> };
> 
> &avb {
>     scmi_devid = <0>; // Matches Etherned device_id in Firmware
>     clocks = <&scmi_clock 0>;
>     power-domains = <&scmi_power 0>;
>     resets = <&scmi_reset 0>;
> };
> 
> In the provided case devid equals to reset, clock and power-domain id,
> but this is conicidence. Each clock/power-domain/reset parameter can
> have more than one entity.
> Also - no changes was done to linux kernel scmi drivers.
> 
> > 
> > > 
> > >> Wouldn’t it be a better idea to use the protocol fully ?
> > > 
> > > Hm, I was thinking I am using the protocol fully. Did I miss something?
> > 
> > Sorry you seem to be, my understanding of your design was not right.
> > 
> > > 
> > >> Could we get rid of some of the FDT dependencies by using the discovery
> > >> system of SCMI ?
> > > 
> > > I'm using FDT to get shmem regions for the channels. Then I send
> > > BASE_DISCOVER_AGENT to each region and getting agent data. Did I use the
> > > discovery system wrong?
> > 
> > After more digging it seems you are. The link between scmi resource and device
> > is not possible to get automatically.
> > 
> > > 
> > >> How is Linux doing this currently ? Is it relying on device tree to discover
> > >> the SCMI resources ?
> > > 
> > > Yes. Linux kernel has 2 nodes in the device-tree: arm,scmi-shmem, which
> > > includes memory region for the communication and arm,scmi-smc node,
> > > which describes all data related to scmi ( func_id, protocols etc)
> > > Then the device nodes refer to the protocols by setting
> > > clock/resets/power-domains etc. Please see the example above.
> > > BASE_DISCOVER_AGENT is not used in Linux kernel.
> > > The main idea was that scmi related changes to the device-tree are
> > > common for virtualized and non virtualized systems. So the same FDT
> > > configuration should work with of without Xen.
> > 
> > So at this stage this is not supported in Linux and you plan to add support for it to.
> > 
> 
> Yes. That's correct. I've already prepared patch which should update
> linux kernel device-tree bindings.
> 
> > > 
> > >> 
> > >> Also I understand that you rely on some entries to be declared in the device
> > >> tree and also some support to be implemented in ATF or SCP. I checked in
> > >> The boards I have access to and the device trees but none of this seem to
> > >> be supported there. Could you tell which board/configuration/ATF you are
> > >> using so that the implementation could be tested/validated ?
> > >> 
> > > 
> > > We're currently have POC made for r8a77951-ulcb-kf and
> > > r8a77961-salvator-xs boards. It's based on:
> > > Linux-bsp kernel: 
> > > git@github.com:renesas-rcar/linux-bsp.git
> > > based on tag <rcar-5.0.0.rc4>
> > > 
> > > ATF: 
> > > git@github.com:renesas-rcar/arm-trusted-firmware.git
> > > based on branch <rcar_gen3_v2.5>
> > > 
> > > I can push those changes to Github, so you can review them
> > 
> > Do you plan to add support for other boards ?
> > 
> 
> Right now we're working only with r8a77951 and r8a77961 boards.
> 
> > Did you discuss more in general with the linux kernel guys to see if this
> > approach was agreed and will be adopted by other manufacturers ?
> 
> I didn't. I've contacted Sudeep Holla <sudeep.holla@arm.com>, who is the
> maintainer of the SCMI protocol drivers. Waiting for the response.
> 
> Also we proposed to add Pinctl support to SCMI specification. It was
> agreed and should be added to SCMI protocol in SCMIv3.2 (due end-2022/early 2023).
> 
> > 
> > All in all I think this is a good idea but I fear that all this will actually only
> > be used by one board or one manufacturer and other might use a different
> > strategy, I would like to unrisk this before merging this in Xen.
> 
> The main idea was to make Xen SCMI mediator completely transparent from
> the Domain point of view. So there is no Xen specific changes should be
> done to OS pinctrl drivers to work through SCMI.
> 
> This means that all platforms, that already using SCMI can work with it
> in virtualized system.

I like this statement. The aim of this series should not be just one
board, but it should be able to easily support any board with an SCMI
interface. For it to work, any changes to device tree interfaces should
be done in upstream device tree
(linux.git/Documentation/devicetree/bindings and/or devicetree.org).

Xilinx doesn't make use of SCMI yet. We are currently using an older
firmware interface called EEMI. EEMI and SCMI are not the same but they
are somewhat similar.

From my experience with this kind of interfaces, I think Oleksii's
design is the right way to go. There are some important details to
review, like the device tree interfaces at the host level and domU
level, and the memory mapping of the channels; we need to be very
careful about those details. But overall I think it is the right
design.
--8323329-665559561-1644618992=:2091381--

