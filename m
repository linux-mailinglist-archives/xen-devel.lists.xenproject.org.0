Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A295640566
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451811.709604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13lD-00069O-2H; Fri, 02 Dec 2022 10:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451811.709604; Fri, 02 Dec 2022 10:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13lC-00066U-V8; Fri, 02 Dec 2022 10:59:14 +0000
Received: by outflank-mailman (input) for mailman id 451811;
 Fri, 02 Dec 2022 10:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC9X=4A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p13lB-00066O-7S
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:59:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55fb8ec8-7230-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 11:59:04 +0100 (CET)
Received: from BN0PR04CA0130.namprd04.prod.outlook.com (2603:10b6:408:ed::15)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 10:59:07 +0000
Received: from BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::5f) by BN0PR04CA0130.outlook.office365.com
 (2603:10b6:408:ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 2 Dec 2022 10:59:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT088.mail.protection.outlook.com (10.13.177.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.18 via Frontend Transport; Fri, 2 Dec 2022 10:59:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 04:59:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 02:59:06 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Dec 2022 04:59:04 -0600
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
X-Inumbo-ID: 55fb8ec8-7230-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXSbY+pJSm/RWIpWqvJAAWrlrsCH7b8R33QOEqMsJgbVrllCl45FVAj6+fmkOAPt2w3trCWQr5WBv2Qa2/Zln6A4Q0jLFY4WJpgP8/XK4Ek44WldbCU50C0/IKfsS8fYxSXe08PjTfIG1+W+RilVkek43FnX76XatbB8OzKJwtrMWgl/nrdQgZKFPsMaz1UG7u8nfXXOpDSHJ1GZcxwr68ANTXRQvl7hluDAfCa4DZbGv66bC1vkV+QHJBb1XsdsXz8Qh9Ex93tDUKujKlt2Bt3LlniuJV2iPpHTRSioUDIo0IGQdXSDT0hWTd7qGftNIGwIfzPWqR2IiAa4M4Kcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD76rEScKD8WF7yPTfiKGh1X1erIEL2q1R//zu3Uheg=;
 b=dm5xKbG00UYyLvFgVjCfGaRnL0gFtGUTjHEB00X8S5qLiWEzwNj91Q8u2G4386Jp9R8xvImVMjlrUFZuc2wvRlIdR0JX6hZvtvyMQqWX7aDtFCPhPMRVxf3oNfBBAysIANPfJ/1lNudZgp1ROZ1ffJMEtGo5pz8jcBqb/yUHINSyrJP1Z6A2ABbtbE7ixnD6AP4W5ddB2coH1lIBdN5toy/TFzUS/lsk6h1dSeoO6/5ydUqU6K9ax3OsSiJJ0pa7xJ2kvsL4Z4az2PpX/5btIp+nXXr1MInGlXa8+8Kobbtx5t8yCPv2VT44nx5tcFf6mbvPGh2hGgPE/yrb4NIoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD76rEScKD8WF7yPTfiKGh1X1erIEL2q1R//zu3Uheg=;
 b=vo0aNxpdmAv9a1i+L5RA63YcvCRY7tBherZk9i8oiRF/sF8P8chyRCWzVgFBV9eASGeVUmFedajKR9cgNtcPTUjWfAFWFl0xJVwTOVzo3RqPOYXBGgL8V6G2CpRuiZ2ZwLoeioeSH2hb6Rk3IsPy68D3N+07C2vQkF7x85WMF5o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ede99a96-cbf8-f388-0484-7b176d07742e@amd.com>
Date: Fri, 2 Dec 2022 11:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "Wei
 Liu" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT088:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 388fef10-1f68-498f-23b2-08dad4543bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vgAdJ0Y6ltqpuLJIhiw3TbH6BCFyw8q0EZakgLu4pKUhx5mwzj8GHE/CR9Evufe8ds/GhN50Ax/ap6s4xHPxkA2mHUBWapbH8zvnYU19+8cXdVFfEpJiQwFi0AV7atIOimFz7LcirxjtU/SZcyCWHE13nGCR+mRbgj/7W21e5NuYStmleCsRGUbGOhKVpeUbiCAQfulkBk4bdjAckheZLfjx5qXwwdsCiJyfBXJUnlDyYkHPhT1Hy2qCS15RrrNIVXPp8lYzLKcy7IzJ4uR+OGf/CX1MZPVLM2ATpA4OoyeejOI3Vn8wj1u8WvxFAmD6MXnxYNxwBBQl3e2kYxuw2HH9AdaZAUJhyOzYXtnzXLhVQhTOsc9uailuQvnM5Oxic2Xo41pbhHyhUWVfvzxfY3j6JGC9ideJtA17zzNdyJAipWRleaHMngiZuSKRFRS9r8wtITajUf8PrDmlf+/hhxZ/YOfnaoadacxcjGA2OLdJWKWbjKy1aVTP4UA0v6yCWNYcAX2E1Dupm6ruhk2gVq+hBDg0mtu1B+a1Rbmbw38VVsO9CaGGGI4Zoqv8sKF3RJP4a13Xcq5gNqp5bvJOKrw9VTiUYbB1AYrR1usDrjWuVCQqHLZhAYKotJnVaSe21wIYtGYimeKIrlVdDrcZiF0fDTApOKN4BwYHkRW6S8RFdo/avyHWFunt1Rgu2hCAwFjVB1R/rm/dYiDxDzBNpyV16DVH02+Y3s3bAaS3LQlFboc6nqrZq9/fYpCSKcTSaOSYCpOeh6OQkQPYsMJT8XLtOB6GMTRc3cUnnAkZg8b43aDXhtpLp+THKSN1eFM9G/JYAchV3ACthgsTnXGWtQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(81166007)(2906002)(7416002)(426003)(44832011)(54906003)(966005)(110136005)(5660300002)(316002)(186003)(70586007)(45080400002)(16576012)(70206006)(40480700001)(336012)(47076005)(40460700003)(8936002)(82740400003)(36756003)(4326008)(2616005)(86362001)(26005)(82310400005)(8676002)(31696002)(41300700001)(356005)(478600001)(31686004)(36860700001)(83380400001)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 10:59:07.4599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 388fef10-1f68-498f-23b2-08dad4543bfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> The SMMUv3 supports two stages of translation. Each stage of translation can be
> independently enabled. An incoming address is logically translated from VA to
> IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
> the output PA.
> 
> Stage 1 is intended to be used by a software entity to provide isolation or
> translation to buffers within the entity, for example DMA isolation within an
> OS. Stage 2 is intended to be available in systems supporting the
> Virtualization Extensions and is intended to virtualize device DMA to guest VM
> address spaces. When both stage 1 and stage 2 are enabled, the translation
> configuration is called nested.
> 
> Stage 1 translation support is required to provide isolation between different
> devices within OS. XEN already supports Stage 2 translation but there is no
> support for Stage 1 translation. The goal of this work is to support Stage 1
> translation for XEN guests. Stage 1 has to be configured within the guest to
> provide isolation.
> 
> We cannot trust the guest OS to control the SMMUv3 hardware directly as
> compromised guest OS can corrupt the SMMUv3 configuration and make the system
> vulnerable. The guest gets the ownership of the stage 1 page tables and also
> owns stage 1 configuration structures. The XEN handles the root configuration
> structure (for security reasons), including the stage 2 configuration.
> 
> XEN will emulate the SMMUv3 hardware and exposes the virtual SMMUv3 to the
> guest. Guest can use the native SMMUv3 driver to configure the stage 1
> translation. When the guest configures the SMMUv3 for Stage 1, XEN will trap
> the access and configure hardware.
> 
> SMMUv3 Driver(Guest OS) -> Configure the Stage-1 translation ->
> XEN trap access -> XEN SMMUv3 driver configure the HW.
> 
> SMMUv3 driver has to be updated to support the Stage-1 translation support
> based on work done by the KVM team to support Nested Stage translation:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Feauger%2Flinux%2Fcommits%2Fv5.11-stallv12-2stage-v14&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cecb9075a29974c8f5ad608dad3b5916f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638055074068482160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=PdK4%2Bsps3%2FdXYJUDv3iCy%2Byaqbh1bOVb1AFzTtx1nts%3D&amp;reserved=0
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F852299%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cecb9075a29974c8f5ad608dad3b5916f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638055074068482160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=5Kp7023HiA4Qbfi28wcPL20JyC2xLwwiyEUZcxTSCOA%3D&amp;reserved=0
> 
> As the stage 1 translation is configured by XEN on behalf of the guest,
> translation faults encountered during the translation process need to be
> propagated up to the guest and re-injected into the guest. When the guest
> invalidates stage 1 related caches, invalidations must be forwarded to the
> SMMUv3 hardware.
> 
> This patch series is sent as RFC to get the initial feedback from the
> community. This patch series consists of 21 patches which is a big number for
> the reviewer to review the patches but to understand the feature end-to-end we
> thought of sending this as a big series. Once we will get initial feedback, we
> will divide the series into a small number of patches for review.

Due to the very limited availability of the board we have, that is equipped with
DMA platform devices and SMMUv3 (I know that you tested PCI use case thoroughly),
I managed for now to do the testing on dom0 only.

By commenting out the code in Linux responsible for setting up Xen SWIOTLB DMA ops, I was able
to successfully verify the nested SMMU working properly for DMA platform devices on the
example of using ZDMA. Both the upstream dmatest client app as well as the VFIO user space driver
that I wrote for ZDMA passed the test!

I added some logs to verify the sync up between Linux and Xen during a VFIO test:

LINUX: SMMUv3: Setting the STE S1 Config 0x1405c000 for SID=0x210
XEN: vSMMUv3: guest config=ARM_SMMU_DOMAIN_NESTED
XEN: SMMUv3: Setting the STE S1 Config 0x1405c000 for SID=0x210

Before transfer example:
 src value: 0xdb71faf
 dst value: 0
Waiting for transfer completion...
After transfer example:
 src value: 0xdb71faf
 dst value: 0xdb71faf
TEST RESULT: PASS

LINUX: SMMUv3: Setting the STE S1 Config 0x12502000 for SID=0x210
XEN: vSMMUv3: guest config=ARM_SMMU_DOMAIN_NESTED
XEN: SMMUv3: Setting the STE S1 Config 0x12502000 for SID=0x210

~Michal

