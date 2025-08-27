Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFEB38A40
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 21:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096880.1451449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urLvK-0006BR-Kk; Wed, 27 Aug 2025 19:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096880.1451449; Wed, 27 Aug 2025 19:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urLvK-00069C-I3; Wed, 27 Aug 2025 19:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1096880;
 Wed, 27 Aug 2025 19:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCET=3H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urLvJ-00068p-9y
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 19:35:09 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef6e7fbe-837c-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 21:35:06 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f3533fd05so241021e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 12:35:06 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3bba5682sm2707191e87.69.2025.08.27.12.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 12:35:04 -0700 (PDT)
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
X-Inumbo-ID: ef6e7fbe-837c-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756323306; x=1756928106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wgvs3zCdmcO6eznyzGFu4JO+Xe9R1kWdtg1/e190Zrw=;
        b=K87lFYYW5jWRMIc+HQxfV/Lrfsq5EzEjHCN8T4qPOZr1934Mh0Vn6FG0OpFHzIurWO
         uVUGTEz37uHwrkP8AiGJ20x2qOvzHWse/ik+aTNllDHl89zBHqri7qBhk+wOj2shu6ij
         Y5NVbjZEjORqCCnB6iZ745q0PRC7lQUOAxWvwm6sXwdoIzsi+Pjo/kX65Q/0Dv74ijK5
         i/g1GOy2NFByg6xrEucOKNrctz9+zyPVRvq7v36jFXksaen3REGkXSrxvUc3Vhr3wNT5
         OpyCcvMNSQ7CUVppjOlf2ry/xsSmeormcU/Oxt3p3OAiA5YUmdwQQbJs9gdpwVuReWUs
         N72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756323306; x=1756928106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgvs3zCdmcO6eznyzGFu4JO+Xe9R1kWdtg1/e190Zrw=;
        b=xUtS8kKyN090FfZY3EiLpD+Z3Y77PTWfDqc2rEwVDkux+Va/Rak95kzSfScNkvl7ki
         LldJ5sCRGJmgxIuVyULGpnX/IHUP9rShNw+Eo4tY6hnZ0vjejI7W+ayhXEmsDpAj4j5x
         26eet684NKsWLd1Si7HxhPzmp9ZrUsZfV+TmMrFH3XInFNnTKBb63wzaj2ALlEgIUWym
         H/jdiC7oWel6ymFn57cdsdIFSPb9Lh38JfJLR+g4HdSOdHtdTVKLBmr64wtSFeCaRMVK
         6qY3CLgOY9hSGhf9p924vLrZT1rovRolKEmEeEGyoNRScUM05VuyBliyDQWhZkf2fPYr
         RkHw==
X-Forwarded-Encrypted: i=1; AJvYcCVcRIXOLJmZGGmRpcdYOF2xztTo2IEvXUXxZ7l9kL3EHsl+J3GHKlKHgSZEP50sEqKmbuFnYU8JADc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMRAqv58v0xxV5RVRIN5Yy1kQWoZUdcLsGY9D43PdcigvO+hza
	oxvcL7BP29JTh+NbgrLenZOqJtDxmZl587PsLO4fllm4tXR4YhFLrlbN
X-Gm-Gg: ASbGncsrMF/j/4dvaqZmrA6//Jqso6LQrFumERBj1rEzmzL3WzEIHhsNWFk4FypPEp7
	CuuG1jEyeDhxBRIPJP9bhj7dBn/Yzn1FqHV6HgFZeMk5HAhuyv3+9r3lBlIyBG9R01CwzXOpXNe
	uRR6dj/l1dPX7yL78RungvdYR7zwOBsU8cPy1Qd+mxi+ZOcsmlFZwVvEcI/PadG6RQXIIezYKcx
	y4OqHEojUOSBO06vAsJotQeSOAAy/Uv5m3+yo8zO/IDVsG/QN5slP8ippOITFdgs5B1bnFAPmxa
	4IFdSwSg0XpoXDcAdBYgJFi2S8hXLsn6YfMkEUq5269d60GL63bYNku2jQTP3TfdG0EGvQVZ5ss
	LZ0Gcc6JYqSagDcaSGvcmagJ6Tw==
X-Google-Smtp-Source: AGHT+IGDIMB+YpuQ3vaGe/Iotr3IV9/xHS0oZwrZQ4sTxh7TQpihKwrhI3Mra+yBlH9OOHZQ5+ls6g==
X-Received: by 2002:a05:6512:1244:b0:55f:4400:f2f6 with SMTP id 2adb3069b0e04-55f4400f686mr4226851e87.42.1756323305419;
        Wed, 27 Aug 2025 12:35:05 -0700 (PDT)
Message-ID: <4ad27aeb-4a71-4360-85a2-42f145cca6b6@gmail.com>
Date: Wed, 27 Aug 2025 22:35:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 09/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.07.25 14:41, Oleksii Moisieiev wrote:

Hello Oleksii

[I will try to not repeat comments provided by Stefano in separate letter]


> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> (TF-A) which provides SCMI interface with multi-agnet support, as shown
> below.
> 
>    +-----------------------------------------+
>    |                                         |
>    | EL3 TF-A SCMI                           |
>    +-------+--+-------+--+-------+--+-------++
>    |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
>    +-----+-+  +---+---+  +--+----+  +---+---+
> smc-id1 |        |         |           |
> agent1  |        |         |           |
>    +-----v--------+---------+-----------+----+
>    |              |         |           |    |
>    |              |         |           |    |
>    +--------------+---------+-----------+----+
>           smc-id0 |  smc-id2|    smc-idX|
>           agent0  |  agent2 |    agentX |
>                   |         |           |
>              +----v---+  +--v-----+  +--v-----+
>              |        |  |        |  |        |
>              | Dom0   |  | Dom1   |  | DomX   |
>              |        |  |        |  |        |
>              |        |  |        |  |        |
>              +--------+  +--------+  +--------+
> 
> The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
> memory transport for every Agent in the system.
> 
> The SCMI Agent transport channel defined by pair:
>   - smc-id: SMC/HVC id used for Doorbell
>   - shmem: shared memory for messages transfer, Xen page
>   aligned. Shared memort is mapped with the following flags:
>   MT_DEVICE_nGnRE.
> 
> The follwoing SCMI Agents expected to be defined by SCMI FW to enable SCMI
> multi-agent functionality under Xen:
> - Xen manegement agent: trusted agents that accesses to the Base Protocol
> commands to configure agent specific permissions
> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
>    allowed direct HW access. At least one OSPM VM agent has to be provided
>    by FW if HW is handled only by Dom0 or Driver Domain.
> 
> The EL3 SCMI FW expected to implement following Base protocol messages:
> - BASE_DISCOVER_AGENT (optional if agent_id was provided)
> - BASE_RESET_AGENT_CONFIGURATION (optional)
> - BASE_SET_DEVICE_PERMISSIONS (optional)
> 
> The SCI SCMI SMC multi-agent driver implements following
> functionality:
> - The driver is initialized based on the ``xen,config`` node under ``chosen``
>    (only one SCMI interface is supported), which describes the Xen management
>    agent SCMI interface.
> 
> scmi_shm_1: sram@47ff1000 {
>            compatible = "arm,scmi-shmem";
>            reg = <0x0 0x47ff1000 0x0 0x1000>;
> };
> scmi_xen: scmi {
>          compatible = "arm,scmi-smc";
>          arm,smc-id = <0x82000003>; <--- Xen manegement agent smc-id
>          #address-cells = < 1>;
>          #size-cells = < 0>;
>          #access-controller-cells = < 1>;
>          shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
> };
> 
> - The driver obtains Xen specific SCMI Agent's configuration from the Host DT, probes Agents and
>    builds SCMI Agents list. The Agents configuration is taken from "scmi-secondary-agents"
>    property where first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and third is
>    optional "agent_id":
> 
> chosen {
>    ranges;
>    xen,config {
>      ranges;
>      scmi-secondary-agents = <
>                    0x82000003 &scmi_shm_0 0
>                    0x82000004 &scmi_shm_2 2
>                    0x82000005 &scmi_shm_3 3
>                    0x82000006 &scmi_shm_4 4>;
>      #scmi-secondary-agents-cells = <3>; <--- optional, default 3
> 
>      scmi_shm_0 : sram@47ff0000 {
>          compatible = "arm,scmi-shmem";
>          reg = <0x0 0x47ff0000 0x0 0x1000>;
>      };
> 
>      scmi_shm_2: sram@47ff2000 {
>              compatible = "arm,scmi-shmem";
>              reg = <0x0 0x47ff2000 0x0 0x1000>;
>      };
>      scmi_shm_3: sram@47ff3000 {
>              compatible = "arm,scmi-shmem";
>              reg = <0x0 0x47ff3000 0x0 0x1000>;
>      };
>      scmi_shm_4: sram@47ff4000 {
>              compatible = "arm,scmi-shmem";
>              reg = <0x0 0x47ff4000 0x0 0x1000>;
>      };
> 
>      // Xen SCMI management channel
>      scmi_shm_1: sram@47ff1000 {
>              compatible = "arm,scmi-shmem";
>              reg = <0x0 0x47ff1000 0x0 0x1000>;
>      };
> 
>      scmi_xen: scmi {
>          compatible = "arm,scmi-smc";
>          arm,smc-id = <0x82000002>; <--- Xen manegement agent smc-id
>          #address-cells = < 1>;
>          #size-cells = < 0>;
>          #access-controller-cells = < 1>;
>          shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
>      };
>    };
> };
> 
> /{
>      // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI enabled for it
>      scmi_shm: sram@47ff0000 {
>              compatible = "arm,scmi-shmem";
>              reg = <0x0 0x47ff0000 0x0 0x1000>;
>      };
> 
>      firmware {
>          scmi: scmi {
>              compatible = "arm,scmi-smc";
>              arm,smc-id = <0x82000002>; <--- Host OSPM agent smc-id
>              #address-cells = < 1>;
>              #size-cells = < 0>;
>              shmem = <&scmi_shm>; <--- Host OSPM agent shmem
> 
>              protocol@X{
>              };
>          };
>      };
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
>    xen,config {
>      scmi-secondary-agents = <
>                    0x82000003 &scmi_shm_0
>                    0x82000004 &scmi_shm_2
>                    0x82000005 &scmi_shm_3
>                    0x82000006 &scmi_shm_4>;
>      #scmi-secondary-agents-cells = <2>;
>    };
> }
> 
> In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to discover the ``agent_id``
> for each secondary agent. Providing the ``agent_id`` in the ``scmi-secondary-agents`` property
> allows skipping the discovery call, which is useful when the secondary agent's shared memory is
> not accessible by Xen or when boot time is important because it allows skipping the agent
> discovery procedure.
> 
>    Note that Xen is the only one entry in the system which need to know
>    about SCMI multi-agent support.
> 
> - It implements the SCI subsystem interface required for configuring and
> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> SCMI functionality for domain it has to be configured with unique supported
> SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
> [smc-id, shmem] defined for this SCMI Agent_id.
> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
>    -- zero-copy, the guest domain puts SCMI message in shmem;
>    -- the guest triggers SMC/HVC exception with smc-id (doorbell);
>    -- the Xen driver catches exception, do checks and synchronously forwards
>    it to EL3 FW.
> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
>    management agent channel on domain destroy event. This allows to reset
>    resources used by domain and so implement use-case like domain reboot.
> 
> Dom0 Enable SCMI SMC:
>   - pass dom0_scmi_agent_id=<agent_id> in Xen command line. if not provided
>     SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
>     The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
>     node according to assigned agent_id.
> 
> Guest domains enable SCMI SMC:
>   - xl.cfg: add configuration option as below
> 
>     arm_sci = "type=scmi_smc_multiagent,agent_id=2"
> 
>   - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond assigned agent_id for
>     the domain, for example:
> 
> iomem = [
>      "47ff2,1@22001",
> ]
> 
>   - DT: add SCMI nodes to the Driver domain partial device tree as in the
>   below example. The "arm,smc-id" should correspond assigned agent_id for the domain:
> 
> passthrough {
>     scmi_shm_0: sram@22001000 {
>         compatible = "arm,scmi-shmem";
>         reg = <0x0 0x22001000 0x0 0x1000>;
>     };
> 
>     firmware {
>          compatible = "simple-bus";
>              scmi: scmi {
>                  compatible = "arm,scmi-smc";
>                  arm,smc-id = <0x82000004>;
>                  shmem = <&scmi_shm_0>;
>                  ...
>              }
>      }
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
> 
> dtdev = [
>      "/soc/i2c@e6508000",
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
>   MAINTAINERS                                 |   4 +
>   SUPPORT.md                                  |  11 +
>   docs/man/xl.cfg.5.pod.in                    |  13 +
>   docs/misc/arm/device-tree/booting.txt       |  88 +++
>   docs/misc/xen-command-line.pandoc           |   9 +
>   tools/libs/light/libxl_arm.c                |   4 +
>   tools/libs/light/libxl_types.idl            |   4 +-
>   tools/xl/xl_parse.c                         |  12 +
>   xen/arch/arm/dom0less-build.c               |  11 +
>   xen/arch/arm/domain_build.c                 |   3 +-
>   xen/arch/arm/firmware/Kconfig               |  12 +
>   xen/arch/arm/firmware/Makefile              |   1 +
>   xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
>   xen/arch/arm/firmware/scmi-shmem.c          | 112 +++
>   xen/arch/arm/firmware/scmi-shmem.h          |  45 ++
>   xen/arch/arm/firmware/scmi-smc-multiagent.c | 803 ++++++++++++++++++++
>   xen/include/public/arch-arm.h               |   3 +
>   17 files changed, 1297 insertions(+), 2 deletions(-)
>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
> 

[snip]

> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 68d2ebeb9f..4c05b20c06 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
>               }
>           }
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
>           ptr = strtok(NULL, ",");
>       }
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index d28143f98b..6ca17b0ce6 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -299,6 +299,17 @@ int __init domu_dt_sci_parse(struct dt_device_node *node,
>           d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
>       else if ( !strcmp(sci_type, "scmi_smc") )
>           d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> +    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
> +    {
> +        uint32_t agent_id = 0;
> +
> +        if ( !dt_property_read_u32(node, "xen,sci_agent_id", &agent_id) ||
> +             !agent_id )
> +            return -EINVAL;

In toolstack you keep the check for agent_id to be in the range of 1 to 
255. Why do not check here as well?


> +
> +        d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> +        d_cfg->arch.arm_sci_agent_id = agent_id;
> +    }
>       else
>       {
>           printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n",


[snip]

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

2025


[snip]


> diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scmi-shmem.c
> new file mode 100644
> index 0000000000..8fc8ca356b
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-shmem.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.

NIT: Is this really a multi-agent driver?

(scmi-smc-multiagent.c has exact the same description).

> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (c) 2025 EPAM Systems
> + */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <asm/io.h>
> +#include <xen/err.h>
> +#include <xen/lib/arm/io.h>

NIT: AFAIK, "asm" should be included after "xen"

> +
> +#include "scmi-proto.h"
> +#include "scmi-shmem.h"
> +

[snip]

> +
> +static struct scmi_channel *smc_create_channel(uint32_t agent_id,
> +                                               uint32_t func_id, uint64_t addr)
> +{
> +    struct scmi_channel *channel;
> +
> +    channel = get_channel_by_id(agent_id);
> +    if ( channel )
> +        return ERR_PTR(EEXIST);

missing "-" before EEXIST


> +
> +    channel = xmalloc(struct scmi_channel);
> +    if ( !channel )
> +        return ERR_PTR(ENOMEM);

missing "-" before ENOMEM

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

[snip]

> +
> +static int scmi_dt_hyp_channel_read(struct dt_device_node *scmi_node, struct scmi_data *scmi_data,
> +                                    u64 *addr)

Missing __init?

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

unsigned int please if n_agents cannot be negative

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
> +    if ( IS_ERR(channel) )
> +        goto out;
> +
> +    /* Request agent id for Xen management channel  */
> +    ret = collect_agent_id(channel);
> +    if ( ret )
> +        return ret;

Why just ret? You seem to allocate memory in smc_create_channel() which
needs to be freed. I guess, free_channel_list() is needed.

> +
> +    /* Save the agent id for Xen management channel */
> +    scmi_data.hyp_channel_agent_id = channel->agent_id;
> +
> +    ret = map_channel_memory(channel);
> +    if ( ret )
> +        goto out;

The same question as above, as "goto out;" in your case is equivalent of 
"return ret;"

> +
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

[snip]



