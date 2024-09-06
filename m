Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034D96FE85
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 01:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792074.1202118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smiTa-00049x-4g; Fri, 06 Sep 2024 23:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792074.1202118; Fri, 06 Sep 2024 23:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smiTa-00047r-1l; Fri, 06 Sep 2024 23:34:50 +0000
Received: by outflank-mailman (input) for mailman id 792074;
 Fri, 06 Sep 2024 23:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1smiTY-0003ro-Ps
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 23:34:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9988f503-6ca8-11ef-99a1-01e77a169b0f;
 Sat, 07 Sep 2024 01:34:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F4F05C57ED;
 Fri,  6 Sep 2024 23:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEB4C4CEC4;
 Fri,  6 Sep 2024 23:34:43 +0000 (UTC)
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
X-Inumbo-ID: 9988f503-6ca8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725665685;
	bh=0GL3+CoOuOKR5yj/Punk2gjyeTB85okMiTKV7Yc+swc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XW/lgVvW8w6nni7aVfVUZR1Am4M9sk7XGM4xpScuvaxQBgYQe9Kw7qXKXknFnloJC
	 s0dfQsG5RO9LFmtBshYKaWG2hWA7z2yWiJ1nGy/Wfjb0gSFgLlSQRL4bjv6Evd3fPE
	 PKAXuJWns8gNqOVjG33pYUnCWchG1T4pZ5zx3snmVIm4Z0D4Y4JSoLCZ+/qn0e6FF3
	 +VXzELwWdu5ENUF/uOFDaEXCGjYxOj13yIXT8zhYm2wQDyvmWPbaDw2WSqhV9BjrUu
	 r1q/84MkkIkwD3Ksy3fNYFDyCbUXVUIaVjTsfkJK3lcKxMulTaMxEOsbL1LBlhSxRj
	 XsJwVLirytjhQ==
Date: Fri, 6 Sep 2024 16:34:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    Peng Fan <peng.fan@oss.nxp.com>, "julien@xen.org" <julien@xen.org>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: Follow up discussion for: [RFC v2] Introduce SCI-mediator
 feature
In-Reply-To: <460ec8fb-bae0-4681-b774-20cb564fa9c4@epam.com>
Message-ID: <alpine.DEB.2.22.394.2409061543500.53815@ubuntu-linux-20-04-desktop>
References: <460ec8fb-bae0-4681-b774-20cb564fa9c4@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Sep 2024, Oleksii Moisieiev wrote:
> Greetings,
> 
> After some time we are back to the development of the SCI-Mediator 
> feature presented as RFC few years earlier.
> Link to the RFC v2: 
> https://lore.kernel.org/all/cover.1644341635.git.oleksii_moisieiev@epam.com/
> 
> Last time feature discussion was stalled at the following point:
> - Device-tree bindings should be changed to provide proper device-id for 
> SCMI devices which is upstreamed in the Linux Kernel by now:
> https://patchew.org/linux/20240105130404.301172-1-gatien.chevallier@foss.st.com/20240105130404.301172-2-gatien.chevallier@foss.st.com/
> 
> That's why we went back to the development of the SCMI-Mediator feature. 
> Our current setup is Dom0less with Zephyr as Control domain and Linux as 
> DomU.

Hi Oleksii, great to hear that the binding was finally merged and the
work can continue!


> Hereby I want to start a discussion about the correct approach of adding 
> scmi nodes to the partial device tree for domain.
> 
> Current device-tree configuration we have for Xen and DomU domain are 
> the following:
> 
> 1) Xen device-tree overlay:
> &{/} {
>          #address-cells = <0x02>;
>          #size-cells = <0x01>;
> 
>          sram@3ff00000 {
>                  compatible = "mmio-sram";
>                  reg = <0x00 0x3ff00000 0x10000>;
>                  #address-cells = <0x01>;
>                  #size-cells = <0x01>;
>                  ranges = <0x00 0x00 0x3ff00000 0x10000>;
>                  phandle = <0x03>;
> 
>                  scmi_shm_0: scmi_shm@0 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x00 0x1000>;
>                  };
>                  scmi_shm_1: scmi_shm@1 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x1000 0x1000>;
>                  };
>                  scmi_shm_2: scmi_shm@2 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x2000 0x1000>;
>                  };
>                  scmi_shm_3: scmi_shm@3 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x3000 0x1000>;
>                  };
>                  scmi_shm_4: scmi_shm@4 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x4000 0x1000>;
>                  };
>                  scmi_shm_5: scmi_shm@5 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x5000 0x1000>;
>                  };
>                  scmi_shm_6: scmi_shm@6 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x6000 0x1000>;
>                  };
>                  scmi_shm_7: scmi_shm@7 {
>                          compatible = "arm,scmi-shmem";
>                          reg = <0x7000 0x1000>;
>                  };
>          };
> };
> &{/} {
>                  domU {
>                          compatible = "xen,domain";
>   			 ...
>                          xen,arm_sci = "scmi-smc";
>                  };
> 
> };
> &{/firmware/} {
>          scmi: scmi {
>                  compatible = "arm,scmi-smc";
>                  arm,smc-id = <0x82000002>;
>                  #address-cells = <0x01>;
>                  #size-cells = <0x00>;
>                  #access-controller-cells = <1>;
>                  shmem = <&scmi_shm_0>;
> 
>                  epam,secondary-agents = <
>                  1 0x82000003 &scmi_shm_1
>                  2 0x82000004 &scmi_shm_2
>                  3 0x82000005 &scmi_shm_3
>                  4 0x82000006 &scmi_shm_4
>                  5 0x82000007 &scmi_shm_5
>                  6 0x82000008 &scmi_shm_6
>                  7 0x82000009 &scmi_shm_7
>                  >;
> 
>                  scmi_reset: protocol@16 {
>                          reg = <0x16>;
>                          #reset-cells = <0x01>;
>                  };
> 
>                  scmi_clock: protocol@14 {
>                          reg = <0x14>;
>                          #clock-cells = <0x01>;
>                          phandle = <0x04>;
>                  };
>          };
> };
> 
> &pcie1 {
>          resets = <&scmi_reset 0>, <&scmi_reset 1>, <&pcie_rescal>;
>          access-controllers = <&scmi 1>;
> };
> 
> As can be seen from overlay Xen reading the following information:
> 1) Shared memory configuration as a list of shared memory pages. They 
> will not go to the Control domain device-tree.
> 2) SCMI configuration for Agent-id 0, which is Xen itself. This agent is 
> responsible to set the device permissions for acces-controller device
> 3) epam,secondary-agents (name probably should be changed) is the list 
> of objects and corresponding shmems and smc-id for agents. Please note 
> that all agents will use smc-id 0x82000002
> and Xen-Mediator will make a calculation and provide agent-specific 
> smc-id for ARM-TF

If this is a Xen specific (or hypervisor specific) configuration, then
it could be under /chosen for Xen together with the other dom0less
configurations and the Xen command line. For instance if 0x82000003-9
are arbitrary numbers chosen by Xen, then this is could be under
/chosen.

If this is a generic property of the SCMI connection, then we need to
make it standard and part of
Documentation/devicetree/bindings/firmware/arm,scmi.yaml. Or maybe it
could just be derived automatically at boot by Xen probing and querying
on the Agent0 connection?


> 4) List of scmi protocols and access-controller id, where scmi is 
> accss-controller device
> 5) domU configuration has xen,arm_sci = "scmi-smc" to enable scmi support
> 
> - DomU Domain device-tree
> 
> /{
> 	 scmi { 
> 
>                   scmi_reset: protocol@16 {
>                        reg = <0x16>;
>                        #reset-cells = <0x01>;
>                   };
>          };
> 	passthrough {
> 	
>                  pciex: pcie@1000120000 {
>                          compatible = "brcm,bcm2712-pcie";
>                          ...
>                          resets = <&scmi_reset 1>, &<scmi_reset 2>;
>                          ...
> 
>                  };
> 	}
> };
> 
> Where scmi node (similar to GIC could be either empty node, which will 
> be recreated by XEN). Hardcoded device-tree phandle as was done for GIC 
> is not supported because for scmi-pinctrl protocol there are no static 
> subnode configuration.
> During domain creation Xen mediator code will create scmi node with 
> existing phandle and create a complete domain device-tree. Xen will use 
> original xen device-tree as a base to create scmi nodes. It can use it 
> either directly in dom0less mode or tools can read Xen device from hypfs 
> to create device tree entries for DomUs.


Now we have a way to automatically generate partial DTBs from the host
DTB in ImageBuilder using Lopper:
https://gitlab.com/xen-project/imagebuilder/-/blob/master/README.md?ref_type=heads

The user only needs to specify the path of the device to assign and the
rest is done automatically by the tools, e.g.:

DOMU_PASSTHROUGH_PATHS[0] = "/amba/sdhci@f1050000"


I think we should try to make it easy to generate the DomU partial
device tree using automatic tools like ImageBuilder and Lopper but
also make it possible for users to hand-write the partial DTB if they
want to.

Is the SCMI device tree node just as simple as this?

      scmi { 

               scmi_reset: protocol@16 {
                    reg = <0x16>;
                    #reset-cells = <0x01>;
               };
      };

If so, it could probably be generated by Xen. But then we have a problem
with the phandle. Without a fixed phandle, it becomes difficult
(impossible?) to write the partial device tree for passthrough devices.

Maybe we could have a fixed phandle for the "scmi_reset" node
(SCMI_RESET_PHANDLE) and another fixed phandle for the "scmi_power" node
(SCMI_POWER_PHANDLE)?


