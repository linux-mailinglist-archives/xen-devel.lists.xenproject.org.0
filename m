Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7EAC2AC7
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 22:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.996201.1378072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIYrl-0001Rk-9I; Fri, 23 May 2025 20:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 996201.1378072; Fri, 23 May 2025 20:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIYrl-0001Pl-6e; Fri, 23 May 2025 20:19:41 +0000
Received: by outflank-mailman (input) for mailman id 996201;
 Fri, 23 May 2025 20:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7Vd=YH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uIYrj-0001Pf-H1
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 20:19:39 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7d7b59-3813-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 22:19:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24AAA435AF;
 Fri, 23 May 2025 20:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AFCC4CEE9;
 Fri, 23 May 2025 20:19:33 +0000 (UTC)
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
X-Inumbo-ID: 3f7d7b59-3813-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748031576;
	bh=5AJ+0bOdoSPrkraz5Ud3mdFPqMrnrxqcw8RFggALXH4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eyQANeDhq7mswN9RKVt8WjPcIPK6UkAGaIiXDEd+LpGwIjirXc3UKYy+t1yGMOmu/
	 ObZDS5pneYwihmUU0wElFunhW/lDDcSqfZaS8wFv/fk5+ds5D6bcKga6XS8g/lvy6O
	 vIMRafzO8gttH8GAe7Spl40OC8mPXRCRtZzT5WHFArSAYP57Gf42nYI7Em5jhgs+Lw
	 JK61esqAr0pUkk8kUlRNr+MhmyAX4dhfYUZ/D+wjleKO8GyOPZHN1zsGV2WMPpO4sR
	 IZ/fMkY/Z+8pMf9TZua7CANiCJBlaDkWDFtCsVXH9Aqkf1I/Tl4Tp2uywfDQiCKmF5
	 3VdEWXZTH99Rg==
Date: Fri, 23 May 2025 13:19:32 -0700 (PDT)
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
Subject: Re: [RFC PATCH v4 8/8] docs: arm: proposal to add separate SCMI node
 for Xen agent
In-Reply-To: <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1382825891-1748031575=:147219"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1382825891-1748031575=:147219
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Proposal description to add separate SCMI DT node for Xen management agent
> under "chosen" or xen-config node, like Hyperlaunch "xen,config".

I think it is OK to place a larger "xen,config" node under /chosen with
more information for Xen to setup SCMI more easily.


> This proposal introduces a new approach to the Xen multi-domain
> configuration, where all Xen-specific configuration has been moved
> under the "/chosen" node. This requires less Dom0 device tree
> manipulation and isolates Xen configuration from domain configuration.
> 
> This approach provides the following device tree (DT) parameters:
> 
> - "xen,scmi-secondary-agents": A Xen-specific parameter under the
> "/chosen" node, which describes the SCMI agent configuration for
> the domains.
> - the SCMI configuration for Xen (privileged agent) and the shared
> memory configuration for all agents are provided under the "/chosen"
> node and are used strictly by Xen for its initial configuration.
> - the scmi_shm and SCMI configuration for Dom0 are placed in the
> "/firmware/scmi" node so that they can be moved to Dom0 without
> any changes.

Isn't the SCMI configuration present in /firmware/scmi referring to the
privileged agent=0 meant to be used by Xen?

I certainly see benefits in simplifying the configuration and especially
reducing the amount of changes a user might have to make on the
underlying device tree, but if the user needs to change /firmware/scmi
with the Dom0 information, it seems more dangerous and error prone than
the previous approach.


> This configuration allows the use of Xen-specific nodes to provide
> information strictly needed by Xen while using the default SCMI
> configuration for Dom0 and other domains. As a result, no additional
> bindings need to be introduced to the device tree.

This is not actually implemented by this patch series, right?


> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> 
> 
>  .../arm/firmware/arm-scmi-proposal.rst        | 224 ++++++++++++++++++
>  1 file changed, 224 insertions(+)
>  create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi-proposal.rst
> 
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi-proposal.rst b/docs/hypervisor-guide/arm/firmware/arm-scmi-proposal.rst
> new file mode 100644
> index 0000000000..fcc2ed2b65
> --- /dev/null
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi-proposal.rst
> @@ -0,0 +1,224 @@
> +
> +Proposal for SCMI multi-agent driver bindings
> +=============================================
> +
> +Now the Xen configuration for SCMI multi-agent support is done in a bit complicated way, especially
> +from SCMI multi-agent driver initialization and Dom0 DT manipulation point of view.
> +Also it does not take into account future requirements to support SCP SCMI FW.
> +
> +To enable SCMI multi-agent user need:
> +
> +* take host DT with basic SCMI enabled
> +* add SCMI shared-memory nodes for all agents
> +* update SCMI node to point on SCMI Xen management channel (``[smc-id, shmem]``)
> +* add "xen,scmi-secondary-agents" property to the "\chosen" node
> +
> +.. code::
> +
> +   chosen {
> +      xen,scmi-secondary-agents = <
> +                    1 0x82000003 &scmi_shm_1
> +                    2 0x82000004 &scmi_shm_2
> +                    3 0x82000005 &scmi_shm_3
> +                    4 0x82000006 &scmi_shm_4>;
> +    }
> +
> +    /{
> +            // SCMI shared-memory nodes for all agents
> +            scmi_shm_0 : sram@47ff0000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff0000 0x0 0x1000>;
> +            };
> +            scmi_shm_1: sram@47ff1000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff1000 0x0 0x1000>;
> +            };
> +            scmi_shm_2: sram@47ff2000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff2000 0x0 0x1000>;
> +            };
> +            scmi_shm_3: sram@47ff3000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff3000 0x0 0x1000>;
> +            };
> +            scmi_shm_4: sram@47ff4000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff4000 0x0 0x1000>;
> +            };
> +
> +            firmware {
> +                scmi: scmi {
> +                    compatible = "arm,scmi-smc";
> +                    arm, smc - id = <0x82000002>; <--- Xen management agent channel "smc-id"
> +                    #address-cells = < 1>;
> +                    #size-cells = < 0>;
> +                    #access-controller-cells = < 1>;
> +                    shmem = <&scmi_shm_0>; <--- Xen management agent channel "shmem"
> +
> +                    protocol@X{
> +                    };
> +                };
> +            };
> +    }
> +
> +Important thing to note is that all information about multi-channel support is strictly Xen specific.
> +
> +During initialization the SCMI multi-agent driver uses Host DT SCMI node and
> +"xen,scmi-secondary-agents" property to init itself and then, during Dom0 creation, manipulates
> +Dom0 DT to remove Xen specific SCMI info and update dom0 SCMI nodes with Dom0 SCMI agent specific
> +information.
> +
> +There are two negative points:
> +
> +1) Double DT modification - one is user to set up SCMI Xen support in Host DT, second -
> +   Dom0 DT manipulation.
> +2) In case of future support of mailbox shared-memory transport there could be up to 4 mailboxes and
> +   up to 2 shared-memories per SCMI agent channel.
> +
> +Hence SCMI multi-agent support is Xen specific knowledge there is a proposal to add it as Xen
> +specific DT definitions and so minimize Host and Dom0 DT manipulations.
> +Those definitions can be added in "/chosen" or, ideally, in "xen,config" node (like in Hyperlaunch design).
> +
> +The SCMI binding stays generic, just two SCMI nodes defined - one for Xen management channel and
> +one for Host Dom0 OSPM.
> +
> +Example of using "chosen" for configuration:
> +
> +.. code::
> +
> +    /{
> +
> +        chosen {
> +            ...
> +
> +            // Xen SCMI management channel
> +            scmi_shm_0 : sram@47ff0000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff0000 0x0 0x1000>;
> +            };
> +            scmi_xen: scmi {
> +                compatible = "arm,scmi-smc";
> +                arm,smc-id = <0x82000002>; <--- Xen manegement agent smc-id
> +                #address-cells = < 1>;
> +                #size-cells = < 0>;
> +                #access-controller-cells = < 1>;
> +                shmem = <&scmi_shm_0>; <--- Xen manegement agent shmem
> +            };
> +
> +            // SCMI multi-agent configuration
> +            scmi_shm_2: sram@47ff2000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff2000 0x0 0x1000>;
> +            };
> +            scmi_shm_3: sram@47ff3000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff3000 0x0 0x1000>;
> +            };
> +            scmi_shm_4: sram@47ff4000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff4000 0x0 0x1000>;
> +            };
> +            xen,scmi-secondary-agents = <
> +                        1 0x82000003 &scmi_shm
> +                        2 0x82000004 &scmi_shm_2
> +                        3 0x82000005 &scmi_shm_3
> +                        4 0x82000006 &scmi_shm_4>;
> +        };
> +
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

By OSPM you mean Dom0 and not Xen? So this is a change compared to a
device tree for baremetal Linux without Xen?

Let me ask the same question differently. In the case of barematal Linux
without Xen (no KVM), what would Linux see under /firmware/scmi as
smc-id and shmem? The same as the one that Xen would use for itself? Or
the same as the ones that Dom0 would use when Xen is present?


> +                protocol@X{
> +                };
> +            };
> +        };
> +    }
> +
> +
> +In the above case:
> +
> +1) Xen SCMI multi-agent can be probed with DT configuration from "chosen" (or special "xen,config")
> +   node and all Xen related nodes can be easily dropped from Dom0 DT.
> +2) Host SCMI OSPM channel DT nodes can be copied to Dom0 DT without changes if SCMI enabled for it.
> +3) Future support for mailbox shared-memory transport (SCP SCMI FW) can be simplified as no more
> +   manipulation required with Dom0 SCMI "arm,smc-id" and "shmem" DT properties.

Yes, I can see the benefit if we can arrange it so that the underlying
host device tree is the same that Linux would use baremetal. And all the
extra configuration is placed under /chosen in "xen,config" node or
similar. I would probably call it "xen,scmi".


> +Example of using "xen,config" for configuration:
> +
> +.. code::
> +
> +    hypervisor {
> +        compatible = “hypervisor,xen”
> +
> +        // Configuration container
> +        config {
> +            compatible = "xen,config";
> +            ...
> +
> +            // Xen SCMI management channel
> +            scmi_shm_0 : sram@47ff0000 {
> +                compatible = "arm,scmi-shmem";
> +                reg = <0x0 0x47ff0000 0x0 0x1000>;
> +            };
> +            scmi_xen: scmi {
> +                compatible = "arm,scmi-smc";
> +                arm,smc-id = <0x82000002>; <--- Xen manegement agent smc-id
> +                #address-cells = < 1>;
> +                #size-cells = < 0>;
> +                #access-controller-cells = < 1>;
> +                shmem = <&scmi_shm_0>; <--- Xen manegement agent shmem
> +            };
> +
> +            // SCMI multi-agent configuration
> +            scmi_shm_2: sram@47ff2000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff2000 0x0 0x1000>;
> +            };
> +            scmi_shm_3: sram@47ff3000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff3000 0x0 0x1000>;
> +            };
> +            scmi_shm_4: sram@47ff4000 {
> +                    compatible = "arm,scmi-shmem";
> +                    reg = <0x0 0x47ff4000 0x0 0x1000>;
> +            };
> +            xen,scmi-secondary-agents = <
> +                        1 0x82000003 &scmi_shm
> +                        2 0x82000004 &scmi_shm_2
> +                        3 0x82000005 &scmi_shm_3
> +                        4 0x82000006 &scmi_shm_4>;
> +        };
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
> +    }
> -- 
> 2.34.1
> 
--8323329-1382825891-1748031575=:147219--

