Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7049BDCD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 22:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260560.450266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCTEG-0006J3-Kc; Tue, 25 Jan 2022 21:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260560.450266; Tue, 25 Jan 2022 21:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCTEG-0006Gt-FP; Tue, 25 Jan 2022 21:19:52 +0000
Received: by outflank-mailman (input) for mailman id 260560;
 Tue, 25 Jan 2022 21:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npsv=SJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCTEF-0006Gd-6e
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 21:19:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8695bbe3-7e24-11ec-8eb8-a37418f5ba1a;
 Tue, 25 Jan 2022 22:19:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1C07617D2;
 Tue, 25 Jan 2022 21:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1830BC340E0;
 Tue, 25 Jan 2022 21:19:47 +0000 (UTC)
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
X-Inumbo-ID: 8695bbe3-7e24-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643145587;
	bh=dztc3U9v7Wfr4w0oLqPEkDx3cbgBIHJ3oEdNcV5Sdxk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NvbbxYPrTTsMwXY5CVbrq8VkHzV01FmKd7JxM4P0I+rXloNE+eN+eS02ouWZaUsKr
	 2exSEGi/KJ8J0JJKRFydVs84RFQCqQgbn40tTKhRH6PwCFrmhs/2TZP9xbNhXtWKZi
	 nVMnMjPTSUUzCqxpRY2mylyijHwhRGRXJgz7btQL1TvxFK86Asxi4OyX/wmUUHenkA
	 7z4nvYbKsYgmbqBO7QgyNO7VjsL6sRcuD2KnHbClDwffyWOJknb1TOTBNhW2AutAFe
	 e+BByGE2tjkeCdsAWYmRsFatAxd6mYWqY4kuYC0PohuzGE5d8fbHM3EyZIDsDfLWhH
	 Rw4VUW8Kk9XTQ==
Date: Tue, 25 Jan 2022 13:19:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20220125143515.GA2803662@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2201251245120.27308@ubuntu-linux-20-04-desktop>
References: <20220119120400.GA3779126@EPUAKYIW015D> <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop> <20220120102147.GA4153317@EPUAKYIW015D> <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop> <20220121150753.GA898010@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop> <20220124182249.GA2485483@EPUAKYIW015D> <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop> <d5c84296-79a6-5698-802d-4d9ba60dbf24@xen.org>
 <alpine.DEB.2.22.394.2201241403240.27308@ubuntu-linux-20-04-desktop> <20220125143515.GA2803662@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jan 2022, Oleksii Moisieiev wrote:
> On Mon, Jan 24, 2022 at 02:14:43PM -0800, Stefano Stabellini wrote:
> > On Mon, 24 Jan 2022, Julien Grall wrote:
> > > On 24/01/2022 19:06, Stefano Stabellini wrote:
> > > > It looks like XEN_DOMCTL_host_node_by_path and
> > > > XEN_DOMCTL_find_host_compatible_node would also solve the problem but I
> > > > think that a single hypercall that retrieves the entire host DTB would
> > > > be easier to implement
> > > 
> > > DOMCTL should only be used to handle per-domain information. If we want to
> > > create a new sub-hypercall of either __HYPERVISOR_platform_op or
> > > __HYPERVISOR_sysctl_op (not sure which one).
> > > 
> > > AFAICT, both are versioned.
> > > 
> > > > and more robust in the long term. >
> > > > hypfs has the advantage that it would create an interface more similar
> > > > to the one people are already used to on Linux systems
> > > > (/proc/device-tree). xl/libxl would have to scan the whole hypfs tree,
> > > > which intuitively I think it would be slower.
> > > 
> > > Even if you have the binary blob, you would still have to scan the
> > > device-tree. That said, it is probably going to be potentially a bit faster
> > > because you have less hypercall.
> > > 
> > > However, here this is a trade-off between memory use and speed. If you want
> > > speed, then you may have to transfer up to 2MB every time. So the question is
> > > do we care more about speed or memory usage?
> > > 
> > > > Also the feature might be
> > > > harder to implement but I am not sure.
> > > > 
> > > > I don't have a strong preference and this is not a stable interface (we
> > > > don't have to be extra paranoid about forward and backward
> > > > compatibility). So I am fine either way. Let's see what the others think
> > > > as well.
> > > 
> > > My preference would be to use hypfs as this is cleaner than exposing a blob.
> > 
> > That's also fine by me. Probably the hypfs implementation shouldn't be
> > much more difficult than something like
> > XEN_DOMCTL_host_node_by_path/XEN_DOMCTL_find_host_compatible_node.
> > 
> > 
> > > However, are we sure we can simply copy the content of the host Device-Tree to
> > > the guest Device-Tree for SCMI? For instance, I know that for device
> > > passthrough there are some property that needs to be altered for some devices.
> > > Hence, why it is not present. Although, I vaguely recalled to have written a
> > > PoC, not sure if it was posted on the ML.
> > 
> > The SCMI node cannot be copied "as is" from host to guest. It needs a
> > couple of changes but they seem feasible as they are limited to the
> > channels exposed to the guest. (The generic device passthrough case is a
> > lot more difficult.)
> 
> 
> Hi Stefano,
> 
> What I'm thinking about is do we actually need to create SCMI node in DomU device-tree?
> I have this question is because we don't need SCMI node to be present in DomU 
> device-tree if it has no passed-through devices, which are using scmi. 
> So if we don't have passed-through devices or do not provide DomU partial device-tree 
> in config, then there is no need to create SCMI node.
> 
> For now I see the following possible domu configurations:
> 1) If DomU has a lot of passed-through devices and it's easier to inherit 
> host device-tree and disable not passed-through devices.
> Partial device tree will looks like this:
> 
> #include "r8a77961-salvator-xs.dts" //include host device tree
> 
> /
> {
> 	soc {
> 		...
> 	}
> 
> };
> 
> // Disable non passed-through devices
> &hscif {
> 	status = "disabled";
> };
> 
> In this case DomU partial device-tree will inherit arm,scmi-smc and 
> arm,scmi-shmem nodes and all clock/reset/power-domains which are using scmi. 
> All this nodes can be copied to DomU device-tree from partial device-tree.

This is an almost dom0 configuration. For this kind of use-cases, I
think it is enough to handle dom0 automatically correctly. I wouldn't
ask for anything more than that.


> 2) DomU has few passed-through devices, so it's easier to add the device nodes 
> to the passthrough node of DomU partial device-tree.
> DomU partial device-tree will look like this:
> {
> 	scmi_shmem: scp-shmem@0x53FF0000 {
> 		compatible = "arm,scmi-shmem";
> 		reg = <0x0 0x53FF0000 0x0 0x10000>;  
> 	};
> 	scmi {
> 		arm,smc-id = <....>;
> 		compatible = "arm,scmi-smc"; 
> 		shmem = <&scmi_shmem>;
> 		scmi_clock: protocol@14 {
> 			...
> 		};
> 		scmi_reset: protocol@16 {
> 			...
> 		};
> 	}; 
> 	passthrough {
> 		hscif0: serial@e6540000 { 
> 			compatible = "renesas,hscif-r8a77961";
> 			scmi_devid = <5>;
> 			clocks = <&scmi_clock 5>;
> 			resets = <&scmi_reset 5>;
>  			...
> 		};
> 	};
> };
> 
> As you can see in this case we have to manually copy arm,scmi-shmem and 
> arm,scmi-smc nodes with hscif0 node or the device-tree compilation will fail.
> We can use 0x53FF0000, provided in arm,scmi-shmem node and map domain channel 
> to this address and copy scmi related nodes to the DomU device-tree.
> This is useful when we need to expose only certain protocols to the DomU. 
> Also it's easy to modify DomU scmi node, as we need for stm32mp1 for example 
> when different smc-id should be set for DomU.

I think this is the most interesting case that should be automated and
not require manual intervention. Let me explain why.

Currently we require partial device trees to be manually written because
there is no easy way to automatically generate them. (I have some ideas
on how to automatically generate partial device trees but that is a
separate discussion.)

Unfortunately, it has become increasingly clear that it is too difficult
for users (even advanced users!) to come up with the appropriate partial
device trees. Thus, I am reluctant to introduce more things that rely on
the user having to manually specify partial device tree information.
This is why I would like the SCMI nodes to be automatically added for
domUs.

Of course, if a user provides the scmi and scmi_shmem nodes in the
partial device tree we could just use them. But ideally we should also
be able to automatically generated them based on the host device tree
nodes, so that the user only needs to provide serial@e6540000 (in your
example, scmi_devid would need to be populated too) and the rest would
be done automatically as we do today for the gic and vuart nodes.

At the same time I don't want to scope-creep this patch series too much
and I don't mean to ask you to add a huge new infrastructure to Xen and
the Xen tools just to get SCMI support in. I would rather have a
not-great automatic generation of the domU SCMI nodes than nothing (e.g.
using your suggested XEN_DOMCTL_host_node_by_path and
XEN_DOMCTL_find_host_compatible_node hypercalls althought they would
need to be platform_op as Julien suggested).

It looks like the generation of scmi_shmem and scmi should be easy
enough that could be handled without difficulty in xl/libxl. But if that
turns out to be too difficult, we could have a small independent
bash/python script that from the host device tree generates the partial
device tree with the SCMI nodes. From Xen point of view we are would
still be using the partial device tree, but the partial device tree
itself would be generated instead of manually written. As this workflow
requires a separate tool I think it is a worse option than the one
above. Still better than nothing though.


> 3) DomU doesn't have any passthrough nodes, which are using scmi.
> In this case we don't want SCMI nodes to be in the DomU device-tree.
> 
> I see only one use-case when we may need scmi nodes to be generated by xl in 
> DomU device-tree:
> Xen generates psci node to handle cpu_on and cpu_off. 
> According to the Section 4.3.2.5 of the DEN0056C [1]:
> > For these power domains, this protocol can be used to implement PSCI CPU_SUSPEND, CPU_ON, CPU_FREEZE, CPU_DEFAULT_SUSPEND and CPU_OFF functions.
> 
> So in theory psci node can use scmi to control cpu state. But this is not our 
> use-case because we don't want to give DomU ability to stop physical CPU. 
> Xen can't intercept and handle CPU_ON and CPU_OFF requests when mailbox transport 
> is used for SCMI communication.
> 
> [1] "SCMI Specification DEN0056C," [Online]. Available: https://developer.arm.com/documentation/den0056/latest 

I agree with you on this one; I am not worried about this case.

