Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE67AE0F3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 23:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608124.946424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qktRx-0002sG-MC; Mon, 25 Sep 2023 21:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608124.946424; Mon, 25 Sep 2023 21:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qktRx-0002pT-Ij; Mon, 25 Sep 2023 21:49:05 +0000
Received: by outflank-mailman (input) for mailman id 608124;
 Mon, 25 Sep 2023 21:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SH9A=FJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qktRw-0002pL-0a
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 21:49:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e89::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54f296bd-5bed-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 23:49:00 +0200 (CEST)
Received: from MN2PR10CA0031.namprd10.prod.outlook.com (2603:10b6:208:120::44)
 by SA0PR12MB4590.namprd12.prod.outlook.com (2603:10b6:806:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 21:48:55 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::55) by MN2PR10CA0031.outlook.office365.com
 (2603:10b6:208:120::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 21:48:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 21:48:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 25 Sep
 2023 16:48:54 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 25 Sep 2023 16:48:53 -0500
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
X-Inumbo-ID: 54f296bd-5bed-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAW3qG5wAIvwFBodv/bKBSnVsTJyDgRyFymP7x+ubRkrwDPtXzTNJkRQ2kKIb/ME/WuY653H1x8Tq+i0xbxvmIdZFPZ2VJFVr7sdhTlsOSLKur+kzA4Zpu3J3BspfAP7Cv/EhMb+57lhubyx5ep34ErKv1XYzjlQCL++0eP9MUGHiBtrlhziOl17Akk/2xQSNqKO6JMxsa6oKSZM9XJIVqCgcuOb+jAhZuwWBgNRZ1KvtWSBSr9TL5aEsCXN5o8GTTFb8sReWfV171+NJnMNY4pNR/JvC4i0UMFRJXbGIwuLp3/VAcOWtF+dzKMMXQcn7oPySq3nqbak2KztmdQm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1SAx3sAnqfkH32QfAPY2IdnjseGRoYk92tQ9C7QKQE=;
 b=Z1HpC4R9BpjEDKn3NJ/90A4coGWJAoqyEJNl4RfXKW4RWelmLolmxiVyqt3EWjx3HYkCtyvbLLCpsdoc+BonBiC6Ul6Xfr7mzuQuVMPJgkMFHRAxzbmSmqak65bEjoZNpPzhEEWSsUwDjCMEujd60s7UggfPFLkHzFCGPA3vwuZXfYqjvAGHeea/UE25j3sgw2/bNQFLtEwotJLsVP4LkVLkiG34dNqB+DkKOwVdriYsovinDQdUCTsApvRRaaelfWKLon1AP9+Qeb7/F/uvKpCsrkv/lGxnc6k8WqqVYLWQ3eSMw8cHEJAUDrXG6xZywr50mmtEVUMMoFkNQt2b+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1SAx3sAnqfkH32QfAPY2IdnjseGRoYk92tQ9C7QKQE=;
 b=Wl8kIsZq3SrDZhSRPV6BSYzomYZcZM8KO9uq65Lqly8FhpbjZScMsxO1hWOh9A0ttSkynCTZQuVKYzhY5O5Luega1IA/cUjqyF2GMglYQ/kyujjdAZYGFVTH5YAJBIAy3oom6/BWFAO45YS7TR1STP2ZifsmaIkG9e5DoUQ95DY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
Date: Mon, 25 Sep 2023 17:49:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SA0PR12MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 977ccd74-b95c-4beb-890d-08dbbe113768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rPkOQlJLeVTIIWZRearqjjlYQ7SAyY5ifGCqpZKUUf1jk/L/KSME7Cb8rFTY67njOLQ53PinVc2ZefT78iNmB8JV4RJTpjh0RRqhnkuioVkRv3HE6MzpjMZ83uae3eXttOVwaMHyLCXQIFFsqpaNL+kkeaKOk4mwe0ZsScvPvfZrTlrTnz4j9P92mAl+JXSMCAgrW87C3dzRiejF6nYTtHDm4dIUj5JAhn3Qm6fjIb/pVTCmi3HqJcm+ph1KKkYtgezD46lnfvEYN9Md0IHNpbGVgjT84xjBNpxgbFZQaF+8hZK+PsvmnEd9i3TqQ8o1enhXjW75SxOHj2hQ3bSs0QDehF5JjKgxzt1+1snp7nrbGW82gy7Dlj3dD4uJgrjQ/ALSq/yev2zLNOW9pEkooRcBuE+jNKuF0x34Ugb+LJlTI1Si6Aqqm30+thHkKbT0z9KXqH0y2c0crpkLKsW4aE4RIuIGi1umZVFn0fKF49WpDBtcIOSqWLe9nESPL/dH///ZXQoLZVcIXc2YFANpoiO5+uG1aRXnUnAcpTXUOnr1MjS655cqnBCqV8hhOHoUavNqbgE2fXa3+aZtqGScQR8l9u1TH/NH+r4LBG1C5Pf3kEJyUW/ducHOXpO++bA0zOcDLxzzUCPgCVxqRkJMK7kX7WSo7NH8NwnhOkt0CM6yES1f4qCLowsuVhkzz77LZdaIS0Q8ejKOsS9XEQeXB0dt83WQxlYrXObj1YG+MGC9GREKAKJWFOqoJtO9l1BggHqtwCkawVGxIR2jzX8crFnj+1yWR3ZH+brJNB7geQKf30dCjFfEN5TJhic/inkf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(82310400011)(451199024)(1800799009)(186009)(46966006)(36840700001)(40470700004)(31686004)(8936002)(4326008)(8676002)(426003)(40480700001)(336012)(26005)(110136005)(44832011)(2906002)(478600001)(41300700001)(70586007)(70206006)(316002)(16576012)(5660300002)(6666004)(53546011)(40460700003)(36756003)(36860700001)(47076005)(2616005)(83380400001)(81166007)(86362001)(31696002)(356005)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 21:48:55.5907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977ccd74-b95c-4beb-890d-08dbbe113768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4590

On 9/22/23 04:44, Roger Pau Monné wrote:
> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Skip mapping the BAR if it is not in a valid range.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>>  xen/drivers/vpci/header.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 1d243eeaf9..dbabdcbed2 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
>>              continue;
>>
>> +#ifdef CONFIG_ARM
>> +        if ( !is_hardware_domain(pdev->domain) )
>> +        {
>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
>> +                continue;
>> +        }
>> +#endif
> 
> Hm, I think this should be in a hook similar to pci_check_bar() that
> can be implemented per-arch.
> 
> IIRC at least on x86 we allow the guest to place the BARs whenever it
> wants, would such placement cause issues to the hypervisor on Arm?

Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.

Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").

The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d4629a14f26b..732be26f0d2d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -638,6 +638,16 @@ static void cf_check guest_bar_write(const struct pci_dev *pdev,
         return;
     }

+    if ( (val != 0xfffffff0U) &&
+         (bar->guest_addr != (0xfffffff0ULL & ~(bar->size - 1))) &&
+         (bar->guest_addr != (0xfffffffffffffff0ULL & ~(bar->size - 1))) )
+    {
+        if ( rangeset_remove_range(bar->mem, PFN_DOWN(bar->guest_addr),
+                                   PFN_DOWN(bar->guest_addr + bar->size) - 1) )
+            gprintk(XENLOG_WARNING, "%pp failed to remove old BAR range\n",
+                    &pdev->sbdf);
+    }
+
     bar->guest_addr = guest_addr;
 }

