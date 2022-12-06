Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C9643FEA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 10:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454543.712066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2UKH-0001Z8-Dv; Tue, 06 Dec 2022 09:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454543.712066; Tue, 06 Dec 2022 09:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2UKH-0001WE-AJ; Tue, 06 Dec 2022 09:33:21 +0000
Received: by outflank-mailman (input) for mailman id 454543;
 Tue, 06 Dec 2022 09:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiLW=4E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2UKF-0001W8-VT
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 09:33:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03e4b011-7549-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 10:33:18 +0100 (CET)
Received: from MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::19)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 09:33:15 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::59) by MW4P222CA0014.outlook.office365.com
 (2603:10b6:303:114::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Tue, 6 Dec 2022 09:33:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Tue, 6 Dec 2022 09:33:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 03:33:14 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 03:33:12 -0600
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
X-Inumbo-ID: 03e4b011-7549-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETg39m5ZD+nmSV/qE7R98P/kPurBtCwMWBqJ1jbNhXQZjJZtdfLCr/JM/YPtafwRcUVfcjDYzv2CDB9FiFxZJU6pCuZX0FPkaA6ecxxhgzBVSWS4/8J3w9hrWe138K9lM99YdSX9TopgiDW283FT6gEpAJNAmTinxw46Phey3yMAOhzJ91rYszwap76rausTWqYKv3PtvnZ3+0Q4wvVR80Dmobs6fXaTrR0WAGhxNP2kRtz24Fbzlu8aKpD9MIVPuMpImWVLF1cTJAlvNngwN23QVY2RoVM6sfVgebHsRGCBCKbeWJanlicJAQ21ik1pjHFs1OvMj0m/HcIoTyRmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bf+Sq0FPc1ixEn1ZuUtMi3LDydTHtRj/LMTJTc8RBG8=;
 b=NwTaGjVzmCjVO93WcsJYbUD5Vf9FZjDJn60TnPLUZg2zJo7AMh8OKOmd5puIdnHLCDLl9TW6rkFZLcAYSkMTmn9KTD5RQcRtkvrb4dhhh06hsKTiA0+D3OqC+QejA+bhFqZzMlWvkJgfq6vb+rG4gHXLY89hS7EpuuAYM5SNcu9WW5Vd7W3ggx8YifrpYc+FswtYAv/RquZDA3ukhefEa2g2hM6J2bsa4sITjJ1C5kgrIAynN6Iu4jHSH9JPTVo1RrNCvqILNANmRaqfJWJNeng/EsJx0q2Q10C59XhFayegM2SG/CIVpCV3HRNDVCVOYq0rsPa6VBk8C+z1UdFUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bf+Sq0FPc1ixEn1ZuUtMi3LDydTHtRj/LMTJTc8RBG8=;
 b=NTp284cy/+qzz9WNjHbrxp2ltpVrf4/AkExZrxlfj0nIENz44RkS9EQhe7+1gOJFgxC95BgMAm7MGXGoHt9pFzjQ7zJZ2phf+Oqzp/Z99q3ktUVggv88kWfZzY16qAUeVwqFhNqyz9g51sIr33avnQtqVtsrOXWqbOfRhc3lI3g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2ea634df-bb2a-6921-a8e0-7ab73fbd3276@amd.com>
Date: Tue, 6 Dec 2022 10:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <ede99a96-cbf8-f388-0484-7b176d07742e@amd.com>
In-Reply-To: <ede99a96-cbf8-f388-0484-7b176d07742e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fd66d0-5a56-4798-8880-08dad76ce6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5LZIAO1ftKKCSjIw1secsEp0a3OGagNIyIzY6qRBSpHbDJCDkzZQMbw9S32O9SohNCB1cuhQ4Qi2NsC7OTgd1yR0X3ioGv0y6i5NKABbJ8/J551hhvqcPJRF8f0gQDAI+3Va6dL4Hlh6YpAdvtK+JlfSejHk0Db8bEgWcT6xKHWKDVzXhfUpIRECAUdMi4PfewK1WTKiEqO8ZGW/mc9e7pUGAV6FoUbVWpqffJMi/NxyywEC1ZjSBiaDH2b9x4HLsSo4sVmtlvR3xZUAe8ub4pqoPF8GBKJfoPgthHs77TTIBJM1WcIF5+mffm3SF+RMEpblW34sXbOyZPRR5+PNfWxcx9P+z625wuAJRBZo/NaSU0v11ElshzD/0c6XNVZABiwgFW2XrpAPgVjtTVO5D/vbaBYGNG50AXAJbiheXOQ6mnvEQ9Zop49H58rmXq+rLsTTft69afNk2rTXB1F+4V8IivId/dDnGxya6+EiYtj557pPlU9HlIncfiIdihduSFYX+9joAhyKun7EkHaUqoxyrjIuUmP4zvnhrswYYXJYJ5HNG+jiAYIlOkL/Qsx/VkLkeLQHCICCHb8WhdFWl7anO8gsWNqEECcnatg7c791lrUKAkUKGxHHafk2doQN0zl7ikIjUv8UPLMUDc+1oyonilNd3V1Y3Eqp32f8aaXniThdaGYX41Nyy8BvNYls95id8iRa4ZMszcMb4jvffJnsvgx6sxIlGhl4nAaaQzGotHjLuWATnUOcHGuAzlV2XaJJjIJKnsVMwmxCEuCuGGssVyK31RgNt6V2dBr9leueVMjwWutv5AKoHJREA2sSOUeDdXpElfVlDtFxph5KDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(31686004)(82740400003)(31696002)(356005)(86362001)(81166007)(8936002)(41300700001)(44832011)(2906002)(40460700003)(4326008)(7416002)(5660300002)(36860700001)(83380400001)(70586007)(478600001)(316002)(70206006)(110136005)(2616005)(16576012)(45080400002)(54906003)(40480700001)(82310400005)(8676002)(966005)(336012)(47076005)(426003)(186003)(26005)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 09:33:15.6362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fd66d0-5a56-4798-8880-08dad76ce6f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316

Hi Rahul,

On 02/12/2022 11:59, Michal Orzel wrote:
> Hi Rahul,
> 
> On 01/12/2022 17:02, Rahul Singh wrote:
>>
>>
>> The SMMUv3 supports two stages of translation. Each stage of translation can be
>> independently enabled. An incoming address is logically translated from VA to
>> IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
>> the output PA.
>>
>> Stage 1 is intended to be used by a software entity to provide isolation or
>> translation to buffers within the entity, for example DMA isolation within an
>> OS. Stage 2 is intended to be available in systems supporting the
>> Virtualization Extensions and is intended to virtualize device DMA to guest VM
>> address spaces. When both stage 1 and stage 2 are enabled, the translation
>> configuration is called nested.
>>
>> Stage 1 translation support is required to provide isolation between different
>> devices within OS. XEN already supports Stage 2 translation but there is no
>> support for Stage 1 translation. The goal of this work is to support Stage 1
>> translation for XEN guests. Stage 1 has to be configured within the guest to
>> provide isolation.
>>
>> We cannot trust the guest OS to control the SMMUv3 hardware directly as
>> compromised guest OS can corrupt the SMMUv3 configuration and make the system
>> vulnerable. The guest gets the ownership of the stage 1 page tables and also
>> owns stage 1 configuration structures. The XEN handles the root configuration
>> structure (for security reasons), including the stage 2 configuration.
>>
>> XEN will emulate the SMMUv3 hardware and exposes the virtual SMMUv3 to the
>> guest. Guest can use the native SMMUv3 driver to configure the stage 1
>> translation. When the guest configures the SMMUv3 for Stage 1, XEN will trap
>> the access and configure hardware.
>>
>> SMMUv3 Driver(Guest OS) -> Configure the Stage-1 translation ->
>> XEN trap access -> XEN SMMUv3 driver configure the HW.
>>
>> SMMUv3 driver has to be updated to support the Stage-1 translation support
>> based on work done by the KVM team to support Nested Stage translation:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Feauger%2Flinux%2Fcommits%2Fv5.11-stallv12-2stage-v14&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cecb9075a29974c8f5ad608dad3b5916f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638055074068482160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=PdK4%2Bsps3%2FdXYJUDv3iCy%2Byaqbh1bOVb1AFzTtx1nts%3D&amp;reserved=0
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F852299%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cecb9075a29974c8f5ad608dad3b5916f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638055074068482160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=5Kp7023HiA4Qbfi28wcPL20JyC2xLwwiyEUZcxTSCOA%3D&amp;reserved=0
>>
>> As the stage 1 translation is configured by XEN on behalf of the guest,
>> translation faults encountered during the translation process need to be
>> propagated up to the guest and re-injected into the guest. When the guest
>> invalidates stage 1 related caches, invalidations must be forwarded to the
>> SMMUv3 hardware.
>>
>> This patch series is sent as RFC to get the initial feedback from the
>> community. This patch series consists of 21 patches which is a big number for
>> the reviewer to review the patches but to understand the feature end-to-end we
>> thought of sending this as a big series. Once we will get initial feedback, we
>> will divide the series into a small number of patches for review.
> 
> Due to the very limited availability of the board we have, that is equipped with
> DMA platform devices and SMMUv3 (I know that you tested PCI use case thoroughly),
> I managed for now to do the testing on dom0 only.
> 
> By commenting out the code in Linux responsible for setting up Xen SWIOTLB DMA ops, I was able
> to successfully verify the nested SMMU working properly for DMA platform devices on the
> example of using ZDMA. Both the upstream dmatest client app as well as the VFIO user space driver
> that I wrote for ZDMA passed the test!
> 
> I added some logs to verify the sync up between Linux and Xen during a VFIO test:
> 
> LINUX: SMMUv3: Setting the STE S1 Config 0x1405c000 for SID=0x210
> XEN: vSMMUv3: guest config=ARM_SMMU_DOMAIN_NESTED
> XEN: SMMUv3: Setting the STE S1 Config 0x1405c000 for SID=0x210
> 
> Before transfer example:
>  src value: 0xdb71faf
>  dst value: 0
> Waiting for transfer completion...
> After transfer example:
>  src value: 0xdb71faf
>  dst value: 0xdb71faf
> TEST RESULT: PASS
> 
> LINUX: SMMUv3: Setting the STE S1 Config 0x12502000 for SID=0x210
> XEN: vSMMUv3: guest config=ARM_SMMU_DOMAIN_NESTED
> XEN: SMMUv3: Setting the STE S1 Config 0x12502000 for SID=0x210

I finished testing this series by also covering dom0less and xl domUs.
Tests passed so good job!
I do not have access to any board with more than one IOMMU so I could not validate
this behavior.

~Michal


