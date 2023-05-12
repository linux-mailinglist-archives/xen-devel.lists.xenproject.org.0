Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE270100B
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:04:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533900.830902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZvJ-0003cE-Sg; Fri, 12 May 2023 21:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533900.830902; Fri, 12 May 2023 21:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZvJ-0003aW-Pk; Fri, 12 May 2023 21:03:33 +0000
Received: by outflank-mailman (input) for mailman id 533900;
 Fri, 12 May 2023 21:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/Ay=BB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxZvI-0003aQ-E1
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:03:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e92bd1-f108-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:03:28 +0200 (CEST)
Received: from MW4PR04CA0056.namprd04.prod.outlook.com (2603:10b6:303:6a::31)
 by DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 21:03:25 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::3f) by MW4PR04CA0056.outlook.office365.com
 (2603:10b6:303:6a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24 via Frontend
 Transport; Fri, 12 May 2023 21:03:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.24 via Frontend Transport; Fri, 12 May 2023 21:03:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 16:03:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 16:03:21 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 May 2023 16:03:19 -0500
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
X-Inumbo-ID: 70e92bd1-f108-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIm/dIKuvGLy5M25MK8OtQa8p7bSDT/RAIQnHWKDy1v8C6H+m9yUEIyHBptGGcskVdfbs3lPe6UQ1KpR+ySRco7ZNlXGnufYnsSrvmlaJ81ri+EgbDUa7K5o0W5wIYcYSP9+gTHNDhgww1QD3AHbI/XPeUN6Rc9pzfE+tdH6GvuITr3XJjy2wwgTNm4auz6Qetzv6dRJoq83clCbzlIfC7NgYGlXJWw/mRyDJw/LZR2ULXtIk3ifwRfv9ap3z65Fjt4wk5VCuQaBGgW1LfOCwnBCvlhYIHAtQJQhFMBXdAR9/8/WsKjKVwgwhi5/9z7+0TNCPobmF3YrZ4nlbLG7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VPlWYf129wYlKBXI6XeX6da7R6uiXrDylbJaC8/Pr8=;
 b=oK5x7vyZmY/PHJgtkNLjg5htKNymCCYAKamGK0a5HqMgYiGGB/HitRJLXcmrhOYrGQQITpBe1rSAkiBWx0bJy5SY9v5HrCP3Pf8unF6BCP9wlo7RxYv9SlOt9vKpDb7YOjGDzqwyvArIDfIgbNo2tZHhvMYoSDZgym43jz4ynvUQ6xDX3+nJj3H6B+agAIzAPLAR3vomcgbW1jlRamP50/h9yHh/OsHCsRXyBsLOR9QvCO/KJCSibd+49TpO7ZTntBpr3NE1lYav1vqOJj9P9ov2MFO7QYbyBW0vkLqypH/AmM6saKm4kio/RNOk9JrgoWqkqVLA2Qn/khUo4vRuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VPlWYf129wYlKBXI6XeX6da7R6uiXrDylbJaC8/Pr8=;
 b=pe+h2PTvED0hA0k/WpmAFgN7sns8tgzxiAdRqrJ3PqOjNb0nANicmnzsE917fftKPwoEg8MS+LFlT/TypqLnLRU/9/yrVgIMPvQDeOwzYmFQuWWQY5P2/FiaqhQ0DKs72Nt63+S9wW4s9ntcv5JgaP6ARBR0lx008g88eG3izec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f7d78b4e-3a16-d342-59d2-caa4d2b75b9c@amd.com>
Date: Fri, 12 May 2023 17:03:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/8] pci/arm: Use iommu_add_dt_pci_device()
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-6-stewart.hildebrand@amd.com>
 <61ae93e8-ac8f-b373-4fa7-0a8aeb61ef4f@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <61ae93e8-ac8f-b373-4fa7-0a8aeb61ef4f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT010:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f25149-2073-482f-be1e-08db532c53c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jz1oEhBLfnBYTj4KfvgUm+FkGv1/ZhTZKA7NpGBN6ZHRqRCrkJLaznK52yo5h9beJehYIugk9efaUIreElOLr6wqxH0W2Nbyk4EGWpR+zp4uevHl/DMDshK2oLBCwDBfI19bTLz4dcIvs5Zbe6FJbONjKiBl1tNggUaKXwwhg1tQNqy23YRkhXZdEGHYZKC8yakY4smGaCgPNsi8H1FKneP7stqetdPtvirPrv6fr7GOVmdAYnoXfM7XTUg0+aEunGqGc3LIHhZvWZXvBNVNs8y6l4iLSydAzfPloBCjP4DxQ0h6Iulw/R6Q9bfJKB3A/j791THBkkaLx6Uup7Cny2LO+8WYcli43EigGcvwgNuXp41m7Wt1Twm3aWPLGfzgSnewn4nOJgtZLtHHQA1n2zbQlirv2WmRndOOLR43B6SFNIGc/ktZLO0SIfcRAt+VVcWo1VOYaWXEWCMGAE89Kgd+M+zU9cll6TqeqsdnZTj3OJsw/wQO1+N2GkmtKKLZkgj8l1CXOYqCru8mex4KVVfTNL9uLM0KgwR9bVUKT+HftsnfmUfADQsHyF8dAGSVSt7GP1AaHA1ezoobOcRyBgn2xYJ6SOaJixB+DiPmGR11sUDJNVslhviMMrh5pK1Pe7i0yGMAxQ6pNges8uGNdjtuXI9O6ouyOCNZy4dH3PqukTgYhoECYMIAVliOKmU4Itv0a4WQhOQnxVGO6/cwEXABRLbc/fG8L8hixjnuPTM3aSt2FY25ukpodd+sU6jQW5s3mYSQ+GVftTQER+TRrCwfCXSzfB4wRrGOL9ugvJg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(2616005)(16576012)(81166007)(47076005)(70586007)(31686004)(316002)(8676002)(8936002)(54906003)(70206006)(426003)(4326008)(6916009)(41300700001)(336012)(7416002)(44832011)(40460700003)(53546011)(186003)(40480700001)(26005)(478600001)(86362001)(356005)(2906002)(36756003)(31696002)(82740400003)(36860700001)(5660300002)(966005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 21:03:25.0523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f25149-2073-482f-be1e-08db532c53c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

On 5/12/23 03:25, Jan Beulich wrote:
> On 11.05.2023 21:16, Stewart Hildebrand wrote:
>> @@ -762,9 +767,20 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>              pdev->domain = NULL;
>>              goto out;
>>          }
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +        ret = iommu_add_dt_pci_device(pdev);
>> +        if ( ret < 0 )
>> +        {
>> +            printk(XENLOG_ERR "pci-iommu translation failed: %d\n", ret);
>> +            goto out;
>> +        }
>> +#endif
>>          ret = iommu_add_device(pdev);
> 
> Hmm, am I misremembering that in the earlier patch you had #else to
> invoke the alternative behavior?

You are remembering correctly. v1 had an #else, v2 does not.

> Now you end up calling both functions;
> if that's indeed intended,

Yes, this is intentional.

> this may still want doing differently.
> Looking at the earlier patch introducing the function, I can't infer
> though whether that's intended: iommu_add_dt_pci_device() checks that
> the add_device hook is present, but then I didn't find any use of this
> hook. The revlog there suggests the check might be stale.

Ah, right, the ops->add_device check is stale in the other patch. Good catch, I'll remove it there.

> If indeed the function does only preparatory work, I don't see why it
> would need naming "iommu_..."; I'd rather consider pci_add_dt_device()
> then.

The function has now been reduced to reading SMMU configuration data from DT and mapping RID/BDF -> AXI stream ID. However, it is still SMMU related, and it is still invoking another iommu_ops hook function, dt_xlate (which is yet another AXI stream ID translation, separate from what is being discussed here). Does this justify keeping "iommu_..." in the name? I'm not convinced pci_add_dt_device() is a good name for it either (more on this below).

> Plus in such a case #ifdef-ary here probably wants avoiding by
> introducing a suitable no-op stub for the !HAS_DEVICE_TREE case. Then
> ...
> 
>>          if ( ret )
>>          {
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +            iommu_fwspec_free(pci_to_dev(pdev));
>> +#endif
> 
> ... this (which I understand is doing the corresponding cleanup) then
> also wants wrapping in a suitably named tiny helper function.

Sure, I'm on board with eliminating/reducing the #ifdef-ary where possible. Will do.

> But yet further I'm then no longer convinced this is the right place
> for the addition. pci_add_device() is backing physdev hypercalls. It
> would seem to me that the function may want invoking yet one layer
> further up, or it may even want invoking from a brand new DT-specific
> physdev-op. This would then leave at least the x86-only paths (invoking
> pci_add_device() from outside of pci_physdev_op()) entirely alone.

Let's establish that pci_add_device()/iommu_add_device() are already inherently performing tasks related to setting up a PCI device to work with an IOMMU.

The preparatory work in question needs to happen after:

  pci_add_device()
    -> alloc_pdev()

since we need to know all the possible RIDs (including those for phantom functions), but before the add_device iommu hook:

  pci_add_device()
    -> iommu_add_device()
      -> iommu_call(hd->platform_ops, add_device, ...)


The preparatory work (i.e. mapping RID/BDF -> AXI stream ID) is inherently associated with setting up a PCI device to work with an ARM SMMU (but not any particular variant of the SMMU). The SMMU distinguishes what PCI device/function DMA traffic is associated with based on the derived AXI stream ID (sideband data), not the RID/BDF directly. See [1].

Moving the preparatory work one layer up would mean duplicating what alloc_pdev() is already doing to set up pdev->phantom_stride (which we need to figure out all RIDs for that particular device). Moving it down into the individual SMMU drivers (smmu_ops/platform_ops) would mean duplicating special phantom function handling in each SMMU driver, and further deviating from the Linux SMMU driver(s) they are based on.

It still feels to me like pci_add_device() (or iommu_add_device()) is the right place to perform the RID/BDF -> AXI stream ID mapping.

Since there's nothing inherently DT specific (or ACPI specific) about deriving sideband data from RID/BDF, let me propose a new name for the function (instead of iommu_add_dt_pci_device):

  iommu_derive_pci_device_sideband_IDs()


Now, as far as DT and ACPI co-existing goes, I admit I haven't tested with CONFIG_ACPI=y yet (there seems to be some issues when both CONFIG_ARM_SMMU_V3=y and CONFIG_ACPI=y are enabled, even in staging). But I do recognize that we need a way support both CONFIG_HAS_DEVICE_TREE=y and CONFIG_ACPI=y simultaneously. Let me think on that for a bit...

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

