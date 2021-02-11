Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE731832B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 02:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83749.156628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA1A1-0004fy-Tx; Thu, 11 Feb 2021 01:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83749.156628; Thu, 11 Feb 2021 01:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA1A1-0004fY-PK; Thu, 11 Feb 2021 01:52:49 +0000
Received: by outflank-mailman (input) for mailman id 83749;
 Thu, 11 Feb 2021 01:52:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXjU=HN=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1lA19z-0004fT-T8
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 01:52:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.244.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86175292-91d0-4b3d-a3dd-e30c7df3e4fd;
 Thu, 11 Feb 2021 01:52:45 +0000 (UTC)
Received: from BL0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:2d::21)
 by MWHPR02MB2512.namprd02.prod.outlook.com (2603:10b6:300:41::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Thu, 11 Feb
 2021 01:52:44 +0000
Received: from BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2d:cafe::e7) by BL0PR03CA0008.outlook.office365.com
 (2603:10b6:208:2d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 01:52:44 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT060.mail.protection.outlook.com (10.152.76.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 01:52:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 10 Feb 2021 17:52:40 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 10 Feb 2021 17:52:40 -0800
Received: from [10.23.123.28] (port=64995 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1lA19s-0002vc-Ll; Wed, 10 Feb 2021 17:52:40 -0800
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
X-Inumbo-ID: 86175292-91d0-4b3d-a3dd-e30c7df3e4fd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVrGnvt3MPBGhv71nxxnOhxibrSTUNVDqqNAjcW1suHQbEGmJyoEAah+NjrrgP+wqDcJVDZ4UlTJV+Xx8NmYgkEg70zK+CND8vI4rTRwAXddg9NBj0URtdr15Ut6Q5SBMdCAAazNQxsrjc79RwejkKzT+/JofVFpY7Gu1fTP1bgjEPSDMJWyJ/787UiH6DNlW1H2NYgI3qDN1l4WS1TjDzES76Lan04SQCM5D2uP/6wgE8523uAz+fnD9PNlXDxMxJCH75odbYrBXhtkAu1EmQ7AExOgVMfYr2M0Cp3exMT/6KAqlI/0paWlAT8r09WeYApMWX+Cl8d4UV8MCGrB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ9eeh0GmXQiwbKPLpPRAgdfEfGOmeb7VRhcUsjxMFk=;
 b=IexpxZLSZzljxRhcRrpDdcmCdBK4Z9fs9202lnwzonpNsC9TFBKPAQZ2Bg7w70yBOBPzwm/Fc0uiyO6rKNxWQxdHEkqFEVVdcBattXK8sF6LUqpZ2C+ne2bJGl8vRN8FDbfkhMk2CsQJ3I5GRdSJMKz525KZ5RjVgBNm96BcnqRh5Qtgx3eTQG+I4YE8E665OWTDclDOaq6FGm2VIdJ7FadhNIeUIvQp8cAmcEdE1L28UlrnmKThCfKMOpfq3vTIpPdtLHMVpSVCWmLevqoeGmxEfvw0ziG74OdR5nEwBNWDFALgAkLzUryrrp2FIqn7jNIC7bJ3EtZnvn98gpJfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=apertussolutions.com
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ9eeh0GmXQiwbKPLpPRAgdfEfGOmeb7VRhcUsjxMFk=;
 b=qAl5miOKHjOa/pF0gm3uzyLzM0QmkH46ojnxC7ivlQKvpK38UU/i2AlOmKCY1fspG0vSO/bDXB08b+vocIVI4dz9iALPOsq7f/mhiZAieYZcTXdBVn+yD/UbUdTT//iaUJl1e5y7eCwxKwtznsiIBX22d7dCv/Jku05wGJPFLIc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; apertussolutions.com; dkim=none (message not
 signed) header.d=none;apertussolutions.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Date: Wed, 10 Feb 2021 17:52:40 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <christopher.w.clark@gmail.com>,
	<andrew.cooper3@citrix.com>, <stefano.stabellini@xilinx.com>,
	<jgrall@amazon.com>, <iwj@xenproject.org>, <wl@xen.org>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <persaur@gmail.com>,
	<adam.schwalm@starlab.io>, <tomase@xilinx.com>, <brucea@xilinx.com>
Subject: Re: [RFC PATCH v2] docs/design: boot domain device tree design
In-Reply-To: <20210203000952.31695-1-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.21.2102101744580.7114@sstabellini-ThinkPad-T480s>
References: <20210203000952.31695-1-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-135185210-1613007905=:7114"
Content-ID: <alpine.DEB.2.21.2102101745060.7114@sstabellini-ThinkPad-T480s>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4147b980-6805-460e-9638-08d8ce2fb938
X-MS-TrafficTypeDiagnostic: MWHPR02MB2512:
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB25127AC0B374BB0D7150F1B6A08C9@MWHPR02MB2512.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8c5OsGF7lMztrzyuI3+E07RU+6eNWRrzKILlZUSDe/LlTgo7uNbRbW5Y390UjI00vRlJgXSgN/U3gZ89DFkWnwiV6UvAk70yBz7D1m2S5Uu0iSTOBoXrvgfAM+1rudN+o6PcAwNX5LbiGHgr8olYltUwqsOXQ+w8qqkhjsXLRSTpKm4CAJo71p5eG6AZSz275N9zJhEYuaZLYItVdwXJ0ivi2shahvUK7lZ/z0/A1Cg/Z6TAV37dH/vPx1DxL/mmTYFzpTqPVadp46rP3BI4Uy4SKpEIGFx69HynpSlSivDeB56ts9CfEKnoavb0aeocK3j/nsDvQBLTxTGHggo/X09KuuM3r4hv9ydEOK8wHiTQGQLyokWMxPf0PDeQgfWBy6Wv2kkkSfxmFLT0dmqCel4B6tZvLxx5gkltwoM/u+VkUozDpthl+RpkLSuBKbo/J5maX+BrcRDh3M5d3HwvUuTmVLWRMRwbX2LMo9xG0pDlz5rwT9Cp8msSntRNt9iKez54s9WU4a8Eei2jkBcHhOXB1ut4M2l++y3zO+McdC/vmj/ymYHFcF0hPwUwIJQ34AajzmVxJSDm+1kMeaK8mFQkWfzeq5lrTwIRs2qkwQwatHazBU7o3aXOWTKtkqksR1OWb3XqwzQdqJwyx+04FA0RN+Z7rycU5afrJpE69wAl8ac9tL1PmCNZtn7XAdqY+7hUGAO/UgebNeFtBiYxrVa/OKreW3vAJoJIa+jJwZ8=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(356005)(8936002)(70206006)(7636003)(33716001)(5660300002)(54906003)(7416002)(9786002)(36906005)(70586007)(30864003)(82740400003)(966005)(6916009)(336012)(478600001)(2906002)(83380400001)(316002)(36860700001)(82310400003)(26005)(33964004)(186003)(8676002)(426003)(4326008)(9686003)(107886003)(47076005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 01:52:43.7794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4147b980-6805-460e-9638-08d8ce2fb938
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2512

--8323329-135185210-1613007905=:7114
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102101745061.7114@sstabellini-ThinkPad-T480s>

On Tue, 2 Feb 2021, Daniel P. Smith wrote:
> This is a Request For Comments on the adoption of Device Tree as the
> format for the Launch Control Module as described in the previously
> posted DomB RFC.
> 
> For RFC purposes, a rendered of this file can be found here:
> ihttps://drive.google.com/file/d/1l3fo4FylvZCQs1V00DcwifyLjl5Jw3W8/view?usp=sharing
> 
> Details on the DomB boot domain can be found on Xen wiki:
> https://wiki.xenproject.org/wiki/DomB_mode_of_dom0less
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> 
> Version 2
> ---------
> 
>  - cleaned up wording
>  - updated example to reflect a real configuration
>  - add explanation of mb2 modules that would be loaded
>  - add the config node
> ---
>  docs/designs/boot-domain-device-tree.rst | 235 +++++++++++++++++++++++++++++++
>  1 file changed, 235 insertions(+)
>  create mode 100644 docs/designs/boot-domain-device-tree.rst
> 
> diff --git a/docs/designs/boot-domain-device-tree.rst b/docs/designs/boot-domain-device-tree.rst
> new file mode 100644
> index 0000000000..558d75a796
> --- /dev/null
> +++ b/docs/designs/boot-domain-device-tree.rst
> @@ -0,0 +1,235 @@
> +====================================
> +Xen Boot Domain Device Tree Bindings
> +====================================
> +
> +The Xen Boot Domain device tree adopts the dom0less device tree structure and
> +extends it to meet the requirements for the Boot Domain capability. The primary
> +difference is the introduction of the ``xen`` node that is under the ``/chosen``
> +node. The move to a dedicated node was driven by:
> +
> +1. Reduces the need to walk over nodes that are not of interest, e.g. only
> +nodes of interest should be in ``/chosen/xen``
> +
> +2. Enables the use of the ``#address-cells`` and ``#size-cells`` fields on the
> +xen node.
> +
> +3. Allows for the domain construction information to easily be sanitized by
> +simple removing the ``/chosen/xen`` node.
> +
> +Below is an example device tree definition for a xen node followed by an
> +explanation of each section and field:

This is great!

You should know that there is an effort ongoing to standardize a set of
device tree nodes for static hypervisors and heterogeneous computing
configurations. It is called system device tree and it is also aligned
with our dom0less nodes, in fact, you could say that dom0less is the
predecessor of system device tree. It is great to see that this proposal
is also very well aligned with it. We are all going in the same
direction, excellent! :-)

https://www.youtube.com/watch?v=2o-B21unV9M
https://github.com/devicetree-org/lopper/blob/68c35bdb92d25a24a1a0b9b3eaf258c034b1f5db/device-trees/system-device-tree.dts#L784


I am going to suggest to make a few changes below to make it even more
aligned and more device tree compatible. It might even allow us to
reuse system device tree tools such as lopper in the long term.




> +::
> +    xen {

This needs a compatible string too. In system device tree every domain
(Xen domain or AMP domain) has "openamp,domain" as compatible. I think
it would be good to reuse it here. We could also use something else, but
either way, I'd add a compatible string.


> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        // Configuration container
> +        config@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "xen,config";
> +
> +            // reg is required but ignored for "xen,config" node
> +            reg = <0>;

I think it might be better to avoid using regs for the domid, and
instead add a new property for it.


> +            module@1 {
> +                compatible = "multiboot,microcode", "multiboot,module";
> +                reg = <1>;
> +            };
> +
> +            module@2 {
> +                compatible = "multiboot,xsm-policy", "multiboot,module";
> +                reg = <2>;
> +            };
> +        };
> +
> +        // Boot Domain definition
> +        domain@0x7FF5 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "xen,domain";

I would add the domid here, e.g.:

domid = <1>;


> +            reg = <0x7FF5>;
> +            memory = <0x0 0x20000>;
> +            cpus = <1>;
> +            module@3 {
> +                compatible = "multiboot,kernel", "multiboot,module";
> +                reg = <3>;
> +            };
> +
> +            module@4 {
> +                compatible = "multiboot,ramdisk", "multiboot,module";
> +                reg = <4>;
> +            };
> +            module@5 {
> +                compatible = "multiboot,config", "multiboot,module";
> +                reg = <5>;
> +            };
> +
> +        // Classic Dom0 definition
> +        domain@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "xen,domain";
> +
> +            reg = <0>;
> +
> +            // PERMISSION_NONE          (0)
> +            // PERMISSION_CONTROL       (1 << 0)
> +            // PERMISSION_HARDWARE      (1 << 1)
> +            permissions = <3>;
> +
> +            // FUNCTION_NONE            (0)
> +            // FUNCTION_BOOT            (1 << 1)
> +            // FUNCTION_CRASH           (1 << 2)
> +            // FUNCTION_CONSOLE         (1 << 3)
> +            // FUNCTION_XENSTORE        (1 << 30)
> +            // FUNCTION_LEGACY_DOM0     (1 << 31)
> +            functions = <0xFFFFFFFF>;
> +
> +            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
> +            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
> +            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
> +            mode = <5>; /* 64 BIT, PV */
> +
> +            // UUID
> +            domain-handle = [B3 FB 98 FB 8F 9F 67 A3];

let's use uuid, see also below


> +            cpus = <1>;
> +            memory = <0x0 0x20000>;
> +            security-id = <0>;
> +
> +            module@6 {
> +                compatible = "multiboot,kernel", "multiboot,module";
> +                reg = <6>;
> +                bootargs = "console=hvc0";
> +            };
> +            module@7 {
> +                compatible = "multiboot,ramdisk", "multiboot,module";
> +                reg = <7>;
> +            };
> +    };
> +
> +The multiboot modules that would be supplied when using the above config would
> +be, in order:
> + - (the above config, compiled)
> + - CPU microcode
> + - XSM policy
> + - kernel for boot domain
> + - ramdisk for boot domain
> + - boot domain configuration file
> + - kernel for the classic dom0 domain
> + - ramdisk for the classic dom0 domain
> +
> +The Xen node
> +------------
> +The xen node is a top level container for the domains that will be built by
> +hypervisor on start up. On the ``xen`` node the ``#address-cells`` is set to one
> +and the ``#size-cells`` is set to zero. This is done to enforce that each domain
> +node must define a reg property and the hypervisor will use it to determine the
> +``domid`` for the domain.

I understand that it would be good to specify the domid, but why not
using a new device tree property for it? Reusing reg seems a bit
strange, and it causes a bit of awkwardness like reg = <0> for
xen,config.

You could just use one if the following:

domid = <0x1>;
domain-id = <0x1>;

and also:

uuid = "12345678-9abc-def0-1234-56789abcdef0";

The latter one is used in a recent secure enclave proposal:
https://lore.kernel.org/linux-devicetree/20201204121137.2966778-2-sudeep.holla@arm.com/

I think uuid would be better than domain-handle.


> +The Config node
> +---------------
> +
> +A config node is for detailing any multiboot modules that are of interest to Xen
> +itself. For example this would be where Xen would be informed of microcode or
> +XSM policy locations.

If you make the top-level xen node a domain too, then the module can be
put directly under it and you don't need a config node at all.


> For locating the multiboot modules, the #address-cells and
> +#size-cells are set according to how the multiboot modules are identified and
> +located. If the multiboot modules will be located by index within the module
> +chain, the values should be “1” and “0” respectively. If the multiboot module
> +will be located by physical memory address, then the values should be “1” and
> +“1” respectively.

This is an interesting problem. The device tree way to do this would be
to use the "ranges" property of the parent.

If the multiboot module is located by physical memory address, the
parent node is going to have a range property:

xen {
    compatible = "openamp,domain";
    ranges;
    #address-cells = <0x1>;
    #size-cells = <0x1>;

    module@1 {
        compatible = "multiboot,microcode", "multiboot,module";
        reg = <0x0 0x10000>;
    };
    
    module@2 {
        compatible = "multiboot,xsm-policy", "multiboot,module";
        reg = <0x10000 0x10000>;
    };
}


Instead, if the multiboot module is not a physical memory address, but
an index in the multiboot chain, then you'd remove ranges from the
parent:

xen {
    compatible = "openamp,domain";
    #address-cells = <0x1>;
    #size-cells = <0x0>;

    module@1 {
        compatible = "multiboot,microcode", "multiboot,module";
        reg = <0x1>;
    };
    
    module@2 {
        compatible = "multiboot,xsm-policy", "multiboot,module";
        reg = <0x2>;
    };
}


ranges is meant to express if the children are supposed to map to the
CPU address space or not.

This is going to work fine as long as all the modules are either in
physical memory or have a multiboot index.  This is going to work only
if all the modules are either in physical memory or a multiboot index.
There is also the issue that the existing dom0less spec doesn't use
ranges and we don't want to break compatibility (interesting, even
system device tree doesn't use ranges for domains.)

So maybe it is better to avoid the problem and just use a different way
to specify that you are referring to a multiboot index. Something like:

xen {
    compatible = "openamp,domain";
    #address-cells = <0x1>;
    #size-cells = <0x1>;

    module@1 {
        compatible = "multiboot,microcode", "multiboot,module";
        multiboot-index = <0x1>;
    };
    
    module@2 {
        compatible = "multiboot,xsm-policy", "multiboot,module";
        reg = <0x10000 0x10000>;
    };
}

This way we can mix the two for different modules and don't break
compatibility with dom0less. Any thoughts?



> +\#address-cells
> +  Identifies number of fields for address. Required.
> +
> +\#size-cells
> +  Identifies number of fields for size. Required.
> +
> +compatible
> +  Identifies the type of node. Required.
> +
> +reg
> +  Unused. Required.
> +
> +The Domain node
> +---------------
> +A domain node is for describing the construction of a domain. It is free to set
> +the #address-cells and #size-cells depending on how the multiboot modules
> +identified and located. If the multiboot modules will be located by index within
> +the module chain, the values should be “1” and “0” respectively. If the
> +multiboot module will be located by physical memory address, then the values
> +should be “1” and “1” respectively.
> +
> +As previously mentioned a domain node must have a reg property which will be
> +used as the requested domain id for the domain with a value of “0” signifying to
> +use the next available domain id. A domain configuration is not able to request
> +a domid of “0”. After that a domain node may have any of the following
> +parameters,
> +
> +\#address-cells
> +  Identifies number of fields for address. Required.
> +
> +\#size-cells
> +  Identifies number of fields for size. Required.
> +
> +compatible
> +  Identifies the type of node. Required.
> +
> +reg
> +  Identifies the domid requested to assign to the domain. Required.
> +
> +permissions
> +  This sets what Discretionary Access Control permissions
> +  a domain is assigned. Optional, default is none.
> +
> +functions
> +  This identifies what system functions a domain will fulfill.
> +  Optional, the default is none.
> +
> +.. note::  The `functions` bits that have been selected to indicate ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits (30, 31) such that should these features ever be fully retired, the flags may be dropped without leaving a gap in the flag set.
> +
> +mode
> +  The mode the domain will be executed under. Required.
> +
> +domain-handle
> +  A globally unique identifier for the domain. Optional,
> +  the default is NULL.
> +
> +cpus
> +  The number of vCPUs to be assigned to the domain. Optional,
> +  the default is “1”.
> +
> +memory
> +  The amount of memory to assign to the domain, in KBs.
> +  Required.
> +
> +security-id
> +  The security identity to be assigned to the domain when XSM
> +  is the access control mechanism being used. Optional,
> +  the default is “domu”.
> +
> +The Module node
> +---------------
> +This node describes a multiboot module loaded by the boot loader. The required
> +compatible property follows the format: multiboot,<type> where type can be
> +“module”, “kernel”, “ramdisk”, “device-tree”, “microcode”, “xsm-policy” or
> +“config”. The reg property is required and identifies how to locate the
> +multiboot module.
> +
> +compatible
> +  This identifies what the module is and thus what the hypervisor
> +  should use the module for during domain construction. Required.
> +
> +reg
> +  This identifies where this module is located within the multiboot
> +  module chain. Required.
> +
> +bootargs
> +  This is used to override the boot params carried with the
> +  multiboot module.
> +
> +.. note::  The bootargs property is intended for situations where the same kernel multiboot module is used for more than one domain.
> +
--8323329-135185210-1613007905=:7114--

