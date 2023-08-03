Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475076E73A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 13:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576267.902212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWla-0005kI-V9; Thu, 03 Aug 2023 11:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576267.902212; Thu, 03 Aug 2023 11:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWla-0005gw-S5; Thu, 03 Aug 2023 11:45:18 +0000
Received: by outflank-mailman (input) for mailman id 576267;
 Thu, 03 Aug 2023 11:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRpN=DU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRWlZ-0005gq-4K
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 11:45:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e88::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f57335-31f3-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 13:45:14 +0200 (CEST)
Received: from MW4PR04CA0143.namprd04.prod.outlook.com (2603:10b6:303:84::28)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 11:45:10 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::94) by MW4PR04CA0143.outlook.office365.com
 (2603:10b6:303:84::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Thu, 3 Aug 2023 11:45:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.39 via Frontend Transport; Thu, 3 Aug 2023 11:45:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 06:45:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 06:45:08 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 3 Aug 2023 06:45:06 -0500
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
X-Inumbo-ID: 34f57335-31f3-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecLJks8nZLCKArJCOHq2ujcIQLhnw+8cFrvryAwSr/B/gKbpVrTQzv5xmcPfO14G/B93c/9D688ravyY1ryO1PedAfeiRIZ9inviJTbA0u37F7rxuvMpqkh5mhtt84G6l1LKmVNFa8forqSq+S5M9XNkrTO+xHQowQWXWZu/j0iaBfD1V7p9PPVKOZ21kraypZrnZKT5Ys6KnTS8kf3u9LDZxxNwBXs4d6D16RJkRlZndLJeIZuDZlFi1F3dAGDSg/fzeYPbnpIIpzAjfgQnAlbHV2cVeDeHsTiNpZzx9xjtSAIPHZFLMYCfuZL94Kvb2+kht2pUUEswzlB1D2fShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jFaJzUg551tZWmkn3AOVmjvfu748N+LQ5EQgCqAtsQ=;
 b=VBiWt1ahoJEM9R6HA2U0OcuXSwdIhDNAiwMhoXnvs0Vf/jXhUPFqLDxTNXn68lUE3c/c0wStmxm0O6M0OWlbYNsAgw1t+8eZJPUkGj1rLcemzdGRycY7lHyqX7nMng8G5O9aa5Fdj6GtQruk8qWg421/SXOwIZu7p+f6SXlxV/TWu1568h0aUFYseGK3DcVDwahS2nvmsvGwQeuM9XbNHUXZjkZkCTkWOtAw+nBDtu42qE1EmgkRVPCVxEwmxzNRGE1i/0xnJdHBKB8W363ulqM1yR0wJbFU34NDQxSdpTV4hiaD/VxgRCPmYYjpfNuCa4TEkuV/fpDj0i6wo7lIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jFaJzUg551tZWmkn3AOVmjvfu748N+LQ5EQgCqAtsQ=;
 b=kvLCQS2dlamNBpnwx1kg15fpOK/ziLcUHGO+e8PTsC9tY7i0t8i7g/H1HlbYoESUnOUGNwV8deG1j84fCxs9RNbLsTFxdX0oAEL8Bg597nKRma0dLISNAbceZEtRZyqWGpG7RmG5fQAaB/kxP7bWB2u4BaV9Xb5Mr2ahVF2xuKM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
Date: Thu, 3 Aug 2023 13:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230803104438.24720-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: d2de6af3-6218-44b8-c458-08db9417174e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4H0DW4atyqqC7Hk65CXdQVC4pWCo3fEZ0CVLlQUJ23wRPjUfqtxwytwjnoiKtpNEceE0Up14Faf9QgwQ5uEohXt8PL3VSX0tGhp05FCmbaPUzjpHm/Lha5NPUwumvep87k11d1txv3RtUscbzUaE+7u2PQW5ioK9tBDFW9d0tfMbWwxZayjpMvw3Ih4H1EWYi8p8dGrIbxHYaeNfxE9/R2ig5C6B7FeHYiWQfFTgQtuS/c3S3J1QpNfCCZrNZ5CNakDcSP8ynBImqV2DonQtUQWBgRCm3sNuLVSyYxQqwywXu58W+HqLyQS4mkoeNhuYVy11W8vbSt2tS3z7sCWcaNqyH93e7MMZj+fMasRojVxNCwChYN8x152wxzBjVs9LgRfeLyHOTAIujMkOPnm1fCllh+kcUyOUuMNx9IytE8P6/+/hTx5yywujqB+e2nLOX6XRTPUB1eJW0uFFgYmnl/rJwX2zyBYZ/33kNOGSSz6osm9o/hUqhzpcNg7DYRUGyFNh+bcubQSg9cMdtTkFTWlHl2pMZ5YBE5WqL/FOaOVH9R7tTaufa5HA1XqQuPRnPX7kOlpsH2X03WiOBy7F6bbdGvn1LT+lsp5PfUWTLpRLbfQnVI20UFYxiwvETlY0kfc3H8obuu0mecGUPFOMEiCOHv+SiTnQhtfyIJEsl8Jc6cCW7wUGMovAhLFhnVdhZ63VYWMP77Fgj+PZkY71SQ5AGA8OM4Bf0DsQ7NG11pMIsLYCKMGl/pCdoMAdyJPeK+x6JTZTlCjDzUbJFFdKTlo0hm6bodSEknlp3cEJjys=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(426003)(2616005)(336012)(53546011)(83380400001)(26005)(186003)(47076005)(41300700001)(36860700001)(16576012)(30864003)(70586007)(2906002)(70206006)(4326008)(5660300002)(316002)(44832011)(8676002)(8936002)(15650500001)(966005)(478600001)(54906003)(110136005)(40480700001)(356005)(81166007)(31696002)(86362001)(36756003)(31686004)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 11:45:09.7535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2de6af3-6218-44b8-c458-08db9417174e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822

Hi Daniel,

On 03/08/2023 12:44, Daniel P. Smith wrote:
> 
> 
> With on going development of hyperlaunch, changes to the device tree definitions
> has been necessary. This commit updates the specification for all current changes
> along with changes expected to be made in finalizing the capability.
> 
> This commit also adds a HYPERLAUNCH section to the MAINTAINERS file and places
> this documentation under its purview. It also reserves the path
> `xen/common/domain-builder` for the hyperlaunch domain builder code base.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  MAINTAINERS                                   |   9 +
>  .../designs/launch/hyperlaunch-devicetree.rst | 566 ++++++++++--------
>  2 files changed, 309 insertions(+), 266 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8a02a6c19..694412a961 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -332,6 +332,15 @@ M: Nick Rosbrook <rosbrookn@gmail.com>
>  S:     Maintained
>  F:     tools/golang
> 
> +HYPERLAUNCH
> +M:     Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:     Christopher Clark <christopher.w.clark@gmail.com>
> +W:     https://wiki.xenproject.org/wiki/Hyperlaunch
> +S:     Supported
> +F:     docs/design/launch/hyperlaunch.rst
> +F:     docs/design/launch/hyperlaunch-devicetree.rst
> +F:     xen/common/domain-builder/
> +
>  HYPFS
>  M:     Juergen Gross <jgross@suse.com>
>  S:     Supported
> diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst b/docs/designs/launch/hyperlaunch-devicetree.rst
> index b49c98cfbd..0bc719e4ae 100644
> --- a/docs/designs/launch/hyperlaunch-devicetree.rst
> +++ b/docs/designs/launch/hyperlaunch-devicetree.rst
> @@ -2,10 +2,11 @@
>  Xen Hyperlaunch Device Tree Bindings
>  -------------------------------------
> 
> -The Xen Hyperlaunch device tree adopts the dom0less device tree structure and
> -extends it to meet the requirements for the Hyperlaunch capability. The primary
> -difference is the introduction of the ``hypervisor`` node that is under the
> -``/chosen`` node. The move to a dedicated node was driven by:
> +The Xen Hyperlaunch device tree is informed by the dom0less device tree
> +structure with extensions to meet the requirements for the Hyperlaunch
> +capability. A major depature from the dom0less device tree is the introduction
> +of the ``hypervisor`` node that is under the ``/chosen`` node. The move to a
> +dedicated node was driven by:
> 
>  1. Reduces the need to walk over nodes that are not of interest, e.g. only
>     nodes of interest should be in ``/chosen/hypervisor``
> @@ -13,331 +14,364 @@ difference is the introduction of the ``hypervisor`` node that is under the
>  2. Allows for the domain construction information to easily be sanitized by
>     simple removing the ``/chosen/hypervisor`` node.
> 
> -Example Configuration
> ----------------------
> -
> -Below are two example device tree definitions for the hypervisor node. The
> -first is an example of a multiboot-based configuration for x86 and the second
> -is a module-based configuration for Arm.
> -
> -Multiboot x86 Configuration:
> -""""""""""""""""""""""""""""
> -
> -::
> -
> -    hypervisor {
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -        compatible = “hypervisor,xen”
> -
> -        // Configuration container
> -        config {
> -            compatible = "xen,config";
> -
> -            module {
> -                compatible = "module,microcode", "multiboot,module";
> -                mb-index = <1>;
> -            };
> -
> -            module {
> -                compatible = "module,xsm-policy", "multiboot,module";
> -                mb-index = <2>;
> -            };
> -        };
> -
> -        // Boot Domain definition
> -        domain {
> -            compatible = "xen,domain";
> -
> -            domid = <0x7FF5>;
> -
> -            // FUNCTION_NONE            (0)
> -            // FUNCTION_BOOT            (1 << 0)
> -            // FUNCTION_CRASH           (1 << 1)
> -            // FUNCTION_CONSOLE         (1 << 2)
> -            // FUNCTION_XENSTORE        (1 << 30)
> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
> -            functions = <0x00000001>;
> -
> -            memory = <0x0 0x20000>;
> -            cpus = <1>;
> -            module {
> -                compatible = "module,kernel", "multiboot,module";
> -                mb-index = <3>;
> -            };
> -
> -            module {
> -                compatible = "module,ramdisk", "multiboot,module";
> -                mb-index = <4>;
> -            };
> -            module {
> -                compatible = "module,config", "multiboot,module";
> -                mb-index = <5>;
> -            };
> -
> -        // Classic Dom0 definition
> -        domain {
> -            compatible = "xen,domain";
> -
> -            domid = <0>;
> -
> -            // PERMISSION_NONE          (0)
> -            // PERMISSION_CONTROL       (1 << 0)
> -            // PERMISSION_HARDWARE      (1 << 1)
> -            permissions = <3>;
> -
> -            // FUNCTION_NONE            (0)
> -            // FUNCTION_BOOT            (1 << 0)
> -            // FUNCTION_CRASH           (1 << 1)
> -            // FUNCTION_CONSOLE         (1 << 2)
> -            // FUNCTION_XENSTORE        (1 << 30)
> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
> -            functions = <0xC0000006>;
> -
> -            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
> -            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
> -            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
> -            mode = <5>; /* 64 BIT, PV */
> -
> -            // UUID
> -            domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
> -
> -            cpus = <1>;
> -            memory = <0x0 0x20000>;
> -            security-id = “dom0_t;
> -
> -            module {
> -                compatible = "module,kernel", "multiboot,module";
> -                mb-index = <6>;
> -                bootargs = "console=hvc0";
> -            };
> -            module {
> -                compatible = "module,ramdisk", "multiboot,module";
> -                mb-index = <7>;
> -            };
> -    };
> -
> -The multiboot modules supplied when using the above config would be, in order:
> +The Hypervisor node
> +-------------------
> 
> -* (the above config, compiled)
> -* CPU microcode
> -* XSM policy
> -* kernel for boot domain
> -* ramdisk for boot domain
> -* boot domain configuration file
> -* kernel for the classic dom0 domain
> -* ramdisk for the classic dom0 domain
> +The ``hypervisor`` node is a top level container for all information relating
> +to how the hyperlaunch is to proceed. This includes definitions of the domains
> +that will be built by hypervisor on start up. The node will be named
> +``hypervisor``  with a ``compatible`` property to identify which hypervisors
> +the configuration is intended. The hypervisor node will consist of one or more
> +config nodes and one or more domain nodes.
> 
> -Module Arm Configuration:
> -"""""""""""""""""""""""""
> +Properties
> +""""""""""
> 
> -::
> +compatible
> +  Identifies which hypervisors the configuration is compatible. Required.
> 
> -    hypervisor {
> -        compatible = “hypervisor,xen”
> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
> 
> -        // Configuration container
> -        config {
> -            compatible = "xen,config";
> +Child Nodes
> +"""""""""""
> 
> -            module {
> -                compatible = "module,microcode”;
> -                module-addr = <0x0000ff00 0x80>;
> -            };
> +* config
> +* domain
> 
> -            module {
> -                compatible = "module,xsm-policy";
> -                module-addr = <0x0000ff00 0x80>;
> +Config Node
> +-----------
> 
> -            };
> -        };
> +A ``config`` node is for passing configuration data and identifying any boot
> +modules that is of interest to the hypervisor.  For example this would be where
> +Xen would be informed of microcode or XSM policy locations. Each ``config``
> +node will require a unique device-tree compliant name as there may be one or
> +more ``config`` nodes present in a single dtb file. To identify which
> +hypervisor the configuration is intended, the required ``compatible`` property
> +must be present.
> 
> -        // Boot Domain definition
> -        domain {
> -            compatible = "xen,domain";
> -
> -            domid = <0x7FF5>;
> -
> -            // FUNCTION_NONE            (0)
> -            // FUNCTION_BOOT            (1 << 0)
> -            // FUNCTION_CRASH           (1 << 1)
> -            // FUNCTION_CONSOLE         (1 << 2)
> -            // FUNCTION_XENSTORE        (1 << 30)
> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
> -            functions = <0x00000001>;
> -
> -            memory = <0x0 0x20000>;
> -            cpus = <1>;
> -            module {
> -                compatible = "module,kernel";
> -                module-addr = <0x0000ff00 0x80>;
> -            };
> +While the config node is not meant to replace the hypervisor commandline, there
> +may be cases where it is better suited for passing configuration details at
> +boot time.  This additional information may be carried in properties assigned
> +to a ``config`` node. If there are any boot modules that are intended for the
> +hypervisor, then a ``module`` child node should be provided to identify the
> +boot module.
> 
> -            module {
> -                compatible = "module,ramdisk";
> -                module-addr = <0x0000ff00 0x80>;
> -            };
> -            module {
> -                compatible = "module,config";
> -                module-addr = <0x0000ff00 0x80>;
> -            };
> +Properties
> +""""""""""
> 
> -        // Classic Dom0 definition
> -        domain@0 {
> -            compatible = "xen,domain";
> -
> -            domid = <0>;
> -
> -            // PERMISSION_NONE          (0)
> -            // PERMISSION_CONTROL       (1 << 0)
> -            // PERMISSION_HARDWARE      (1 << 1)
> -            permissions = <3>;
> -
> -            // FUNCTION_NONE            (0)
> -            // FUNCTION_BOOT            (1 << 0)
> -            // FUNCTION_CRASH           (1 << 1)
> -            // FUNCTION_CONSOLE         (1 << 2)
> -            // FUNCTION_XENSTORE        (1 << 30)
> -            // FUNCTION_LEGACY_DOM0     (1 << 31)
> -            functions = <0xC0000006>;
> -
> -            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
> -            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
> -            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
> -            mode = <5>; /* 64 BIT, PV */
> -
> -            // UUID
> -            domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
> -
> -            cpus = <1>;
> -            memory = <0x0 0x20000>;
> -            security-id = “dom0_t”;
> -
> -            module {
> -                compatible = "module,kernel";
> -                module-addr = <0x0000ff00 0x80>;
> -                bootargs = "console=hvc0";
> -            };
> -            module {
> -                compatible = "module,ramdisk";
> -                module-addr = <0x0000ff00 0x80>;
> -            };
> -    };
> +compatible
> +  Identifies the hypervisor the confiugration is intended. Required.
> 
> -The modules that would be supplied when using the above config would be:
> +  Format: "<hypervisor name>,config", e.g "xen,config"
> 
> -* (the above config, compiled into hardware tree)
> -* CPU microcode
> -* XSM policy
> -* kernel for boot domain
> -* ramdisk for boot domain
> -* boot domain configuration file
> -* kernel for the classic dom0 domain
> -* ramdisk for the classic dom0 domain
> +bootargs
> +  This is used to provide the boot params for Xen.
> 
> -The hypervisor device tree would be compiled into the hardware device tree and
> -provided to Xen using the standard method currently in use. The remaining
> -modules would need to be loaded in the respective addresses specified in the
> -`module-addr` property.
> +  Format: String, e.g. "flask=silo"
> 
> +Child Nodes
> +"""""""""""
> 
> -The Hypervisor node
> --------------------
> +* module
> 
> -The hypervisor node is a top level container for the domains that will be built
> -by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
> -property is used to identify the type of hypervisor node present..
> +Domain Node
> +-----------
> 
> -compatible
> -  Identifies the type of node. Required.
> +A ``domain`` node is for describing the construction of a domain. Since there
> +may be one or more domain nodes, each one requires a unique, DTB compliant name
> +and a ``compatible`` property to identify as a domain node.
> 
> -The Config node
> ----------------
> +A ``domain`` node  may provide a ``domid`` property which will be used as the
> +requested domain id for the domain with a value of “0” signifying to use the
> +next available domain id, which is the default behavior if omitted. It should
> +be noted that a domain configuration is not able to request a domid of “0”.
> +Beyond that, a domain node may have any of the following optional properties.
> 
> -A config node is for detailing any modules that are of interest to Xen itself.
> -For example this would be where Xen would be informed of microcode or XSM
> -policy locations. If the modules are multiboot modules and are able to be
> -located by index within the module chain, the ``mb-index`` property should be
> -used to specify the index in the multiboot module chain.. If the module will be
> -located by physical memory address, then the ``module-addr`` property should be
> -used to identify the location and size of the module.
> +Properties
> +""""""""""
> 
>  compatible
> -  Identifies the type of node. Required.
> -
> -The Domain node
> ----------------
> +  Identifies the node as a domain node and for which hypervisor. Required.
> 
> -A domain node is for describing the construction of a domain. It may provide a
> -domid property which will be used as the requested domain id for the domain
> -with a value of “0” signifying to use the next available domain id, which is
> -the default behavior if omitted. A domain configuration is not able to request
> -a domid of “0”. After that a domain node may have any of the following
> -parameters,
> -
> -compatible
> -  Identifies the type of node. Required.
> +  Format: "<hypervisor name>,domain", e.g "xen,domain"
> 
>  domid
> -  Identifies the domid requested to assign to the domain. Required.
> +  Identifies the domid requested to assign to the domain.
> 
> -permissions
> +  Format: Integer, e.g <0>
> +
> +role
>    This sets what Discretionary Access Control permissions
>    a domain is assigned. Optional, default is none.
> 
> -functions
> -  This identifies what system functions a domain will fulfill.
> +  Format: Bitfield, e.g <3> or <0x00000003>
> +
> +          ROLE_NONE                (0)
> +          ROLE_UNBOUNDED_DOMAIN    (1U<<0)
> +          ROLE_CONTROL_DOMAIN      (1U<<1)
> +          ROLE_HARDWARE_DOMAIN     (1U<<2)
> +          ROLE_XENSTORE_DOMAIN     (1U<<3)
> +
> +capability
> +  This identifies what system capabilities a domain may have beyond the role it
> +  was assigned.
>    Optional, the default is none.
> 
> -.. note::  The `functions` bits that have been selected to indicate
> -   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits
> -   (30, 31) such that should these features ever be fully retired, the flags may
> -   be dropped without leaving a gap in the flag set.
> +  Format: Bitfield, e.g <3221225487> or <0xC0000007>
> +
> +          CAP_NONE            (0)
> +          CAP_CONSOLE_IO      (1U<<0)
> 
>  mode
>    The mode the domain will be executed under. Required.
> 
> +  Format: Bitfield, e.g <5> or <0x00000005>
> +
> +          MODE_PARAVIRTUALIZED     (1 << 0) PV | PVH/HVM
> +          MODE_ENABLE_DEVICE_MODEL (1 << 1) HVM | PVH
> +          MODE_LONG                (1 << 2) 64 BIT | 32 BIT
> +
>  domain-uuid
>    A globally unique identifier for the domain. Optional,
>    the default is NULL.
> 
> +  Format: Byte Array, e.g [B3 FB 98 FB 8F 9F 67 A3]
> +
>  cpus
>    The number of vCPUs to be assigned to the domain. Optional,
>    the default is “1”.
> 
> +  Format: Integer, e.g <0>
> +
>  memory
> -  The amount of memory to assign to the domain, in KBs.
> +  The amount of memory to assign to the domain, in KBs. This field uses a DTB
> +  Reg which contains a start and size. For memory allocation start may or may
> +  not have significance but size will always be used for the amount of memory
>    Required.
> 
> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
There is a mismatch between the description and above format:
- KB vs MB
- string vs reg format
- the x86 example uses string and Arm uses reg format

> +
>  security-id
>    The security identity to be assigned to the domain when XSM
>    is the access control mechanism being used. Optional,
> -  the default is “domu_t”.
> +  the default is “system_u:system_r:domU_t”.
> +
> +  Format: string, e.g. "system_u:system_r:domU_t"
This is specifying full label (as expected) whereas the examples use only type

> +
> +Child Nodes
> +"""""""""""
> +
> +* module
> +
> +Module node
> +-----------
> 
> -The Module node
> ----------------
> +This node describes a boot module loaded by the boot loader. A ``module`` node
> +will often appear repeatedly and will require a unique and DTB compliant name
> +for each instance. The compatible property is required to identify that the
> +node is a ``module`` node, the type of boot module, and what it represents.
> 
> -This node describes a boot module loaded by the boot loader. The required
> -compatible property follows the format: module,<type> where type can be
> -“kernel”, “ramdisk”, “device-tree”, “microcode”, “xsm-policy” or “config”. In
> -the case the module is a multiboot module, the additional property string
> -“multiboot,module” may be present. One of two properties is required and
> -identifies how to locate the module. They are the mb-index, used for multiboot
> -modules, and the module-addr for memory address based location.
> +Depending on the type of boot module, the ``module`` node will require either a
> +``module-index`` or ``module-addr`` property must be present. They provide the
> +boot module specific way of locating the boot module in memory.
> +
> +Properties
> +""""""""""
> 
>  compatible
>    This identifies what the module is and thus what the hypervisor
>    should use the module for during domain construction. Required.
> 
> -mb-index
> -  This identifies the index for this module in the multiboot module chain.
> +  Format: "module,<module type>"[, "module,<locating type>"]
> +          module type: kernel, ramdisk, device-tree, microcode, xsm-policy,
> +                       config
> +
> +          locating type: index, addr
> +
> +module-index
> +  This identifies the index for this module when in a module chain.
>    Required for multiboot environments.
> 
> +  Format: Integer, e.g. <0>
> +
>  module-addr
>    This identifies where in memory this module is located. Required for
>    non-multiboot environments.
> 
> +  Format: DTB Reg <start size>, e.g. <0x0 0x20000>
I guess the number of cells for start and size will be taken from #address-celss and #size-cells
defined either in /chosen or a config/domain node?

Also, what is the plan for the existing dom0less dt properties?
Will they need to be moved to new /hypervisor node or we will have to parse both /chosen and /hypervisor nodes?

~Michal

