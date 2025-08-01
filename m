Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CAB1888D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 23:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067586.1432248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhwxf-000155-Pi; Fri, 01 Aug 2025 21:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067586.1432248; Fri, 01 Aug 2025 21:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhwxf-00013W-Mt; Fri, 01 Aug 2025 21:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1067586;
 Fri, 01 Aug 2025 21:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=maRn=2N=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uhwxe-00013Q-VV
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 21:06:43 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2406::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a59e824-6f1b-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 23:06:39 +0200 (CEST)
Received: from DM6PR01CA0020.prod.exchangelabs.com (2603:10b6:5:296::25) by
 BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 21:06:33 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::de) by DM6PR01CA0020.outlook.office365.com
 (2603:10b6:5:296::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.17 via Frontend Transport; Fri,
 1 Aug 2025 21:06:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 21:06:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 16:06:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 16:06:32 -0500
Received: from [172.17.155.73] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 16:06:31 -0500
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
X-Inumbo-ID: 6a59e824-6f1b-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYIzoWFm4Oc46Qse/ZCf9gziEP147iiVMz9Y+XXbQX4mZd8yFXrtfs7+zjZZ0XYNiw18mcFRUqdSDGfj424aW1506NXottRfRA0bm6+8Ola1GyNifoMUSakGYLfx+ZuZJ/Co3Ckmvb0TOFaaLZ2sRIPu7LVdF1MeqK0//6nw2JDunBkqLp+Hasgcx3vyekuIualhsnX9f2tzmnhvsulLu7l+4uX63R3y71og1TxavpyrwvxfUS/2TJiorGR/zIBzyE5odcPqgvM+aMGkn0eCV8VqEv9vcCCcSUmjb44+ya9gQdMqmaiwlc5Vl2HiVOEx8g/Myy6zVzsTCWv2hcc4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8t24WWrL1IVFSvnBebqfO7cUxnvvM/ynMjtQbQUX8s=;
 b=izLN9pSIvOWLQQ4M/erbmhY7JKvgv41SEFi47yuwjfO3y4oGHKDJc1TW4UXokQ1Hssd6VQjZGBP6psWaDLEMW2IA1idjzaZkfgIzboNXfJnASlwcp3IfSQplEkUBiRi67Rq1a2f1tAmnULsTdq5d1HkoqvLRHCquDlz5c9zl+up2TOVxuYaoC6WraCChI2BxHvufCO+fDlhIRTmMH6cQgKjIoKCyd6jyS6XBWYMv1kxfQ5TGUSCSok2y2E5UTb3oakSa5uvj4IIrV0O2NJRBtOPca+ZvkcwqOxqfDr/vCEf2cal65WGa1Q/StzwYl2IejtkUGj92FsUoybdg0cxXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8t24WWrL1IVFSvnBebqfO7cUxnvvM/ynMjtQbQUX8s=;
 b=jvMZZcS6mhQN79cQvn4+W+3UNAhyU9N62fKpWby5x3bzlhXf5jtj6UfS7meuz5My6mHFSP25Nyw2uDncr8Qvt+JIACb46jeWklvosD3kH42Uh3yKt3K5q5f1MlvpL02lo98NiVbnHA2REPio+IwCLVpCQri3KwOY17qaQGirQj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6d5545a2-bbf0-4cf9-9820-5eaf6d8530f8@amd.com>
Date: Fri, 1 Aug 2025 17:06:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com>
 <aIJi8E2BC-dzAIz8@macbook.local> <aIM5IR-d4_u19JVe@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aIM5IR-d4_u19JVe@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: df187537-9d65-45ac-726d-08ddd13f4b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjVDSDQwNFo0dGNzYWpCWHhhSmoyZGtydGV3ZTdnRlc5STJvWmlqenJiNXNk?=
 =?utf-8?B?TlVFbnljS2xOdDI5d2hLUDVUbk9nT1cxKzZTdHAvZmlPWC9OT2hmMVVkMVBF?=
 =?utf-8?B?dk1IWGVzQTVFb2pPYlhsTm9YZmZzZ3VDbHU0aUFxUW9paGh3czh5MGVkNzRo?=
 =?utf-8?B?R042cTArcmJDL2ovU29uVHBaelJMOHVSdVF2em9QTlY1NVA4WVFLdTJRT2pD?=
 =?utf-8?B?ZVRKVTU5dDJwY0JjalhzK3FTZkJ5R05MYXcyWjBQaG52cFRlRloycjBGMWpo?=
 =?utf-8?B?dEcxQnhmNTBKRXlLSCsvZlhuRVN0TGN2R29YaDlvUElHaURIR2duYi9zdmts?=
 =?utf-8?B?aVRwTndGQ1NPUlQ3enE4Q0pUbENiSGt5YzlUVDJ1cDlWR1NtdDl5NmlUTFNQ?=
 =?utf-8?B?OWpBdDEyUGdGd3JPWTIyV0RnUHNCL2RMcytiL2NsRW5LVFN4dlliYjFYRDRr?=
 =?utf-8?B?Qis1cTBBUThZL2YzbVR4ZlB0NkpRUVlZUjFQdGd3SzR1a2tFNGdzeFVoWWxz?=
 =?utf-8?B?UE9LZkZKSUoweFY2ZTlIWDBLLytDRmZkcVduTm1oZjJlaXdwdzFYa0s0RENa?=
 =?utf-8?B?TDNyRmN0c1JzTWcrUmFGU1NUSUtyTXlWV0tLdFpkcnV2c3UydUlFSkF3cW4r?=
 =?utf-8?B?NDRZcFl6T3FQdTVWS1VaSzE2MmtjOGk1QThtS2gzZkg5alFRcHB2cHFHZjR0?=
 =?utf-8?B?MEFMTm9nYmh1VTduVE9VUWJPQXBVLzQ3ZVNoQXRCMWpHamY1TU9aL3RwcVpN?=
 =?utf-8?B?M0I5am1DM0F2eW5KVjYvT0hURHFYdUloT251eVBLc1Q1a1hXTllPRTFsOEhQ?=
 =?utf-8?B?KzhyWENBSnNSWW1wblIwSHN5N0orQTlDM3pYSGM1Nys5NngxTkxPb2tqZ2xQ?=
 =?utf-8?B?WW9peGYzSm5IdkRRR29vdGlkeFJQTDdvem9TVEczZzBLNWloUDE3U3c4c204?=
 =?utf-8?B?aE8rcmJId3piZm93VkZNVUhUa0Fqcm1FS28wUVpad2RpMmEzU0ZJdHZweU02?=
 =?utf-8?B?RnZPVWFUWE9yWG1PdjNzZTJrMXpVeE5kcmwvZGFQdFg0aHhjV2NMaGEvOUQ1?=
 =?utf-8?B?cnN0NE5QSDV3Nk0ycHpudGpiWE9UbUZOcU1jeTZGak83eDZEOGVBT1NTNTRM?=
 =?utf-8?B?MGRmcTZjR3JvVEkwaDFDUldyS1gzS2hTNm5YVGFGS2s3YXdvVVp4ZGFyZ093?=
 =?utf-8?B?RHNrenZJZ0VYSjNUcnJ5Tng4VHRBK3pIRXZsQUlBNGQ4K1YwcjBkdWo4TnhP?=
 =?utf-8?B?ZUVMRS9QUW5SYmYwSjBLcG9tS0Z2SDBoOG9kYkVYbi9jVGR1Q2d2Y0ZVZlZq?=
 =?utf-8?B?akFnamhvRGM1M1BRSVJiZFE3amtxWjM1RzFPWTJnSVNCWnRqTERiQ29WN2Zt?=
 =?utf-8?B?Z1FaNmd2cUUzdzY5ekJpMUsrMjBicVpiSTR4UVVEd0FJZGZvZkhpVVZTSzNH?=
 =?utf-8?B?K1U4M2I5QVdPM2p4dUd2VE1GR1hmNnJ2WkxRS0U2ODU0akMybVU1YWIwT1dS?=
 =?utf-8?B?Zkx2MVUwSytjNW5RQ2xuRWZxRkFiZzdxVC9IcDdMM3VWc21vdWxKOVpKZ21B?=
 =?utf-8?B?YW1LMWFIamR4RndSVFNRdEJBcTNlUVY0RGZzcHB6bFBLWHE1aGljaUljNW5O?=
 =?utf-8?B?SjR4SmhpYzB3TGpIUEFsTGUrQVUwRHAwUDVLeWNHaURkNGk4RUtoRDh3cVor?=
 =?utf-8?B?a2Q3c2NRdFY3MllIMk9QTEMrdWZIZnZPWlhJVnJFMTlBRHJqbGZRcVZDWHNa?=
 =?utf-8?B?SmRuUmVseFdsL0lTNllqWW1leTdrUzBSNDQxQTJTeXFYMEV2dTY3NlF2V2Rj?=
 =?utf-8?B?R05vSjBQcjhMWUhibkdZV0F2aWdreC9mVDdWcm9hOUZFbkVhYzJaVWc1emYz?=
 =?utf-8?B?SFRxK1hQREZGYnd2MmFsNHhHbmcvUVV2Nk44dDFDR0dCN3lEWDhGRjhqOTVm?=
 =?utf-8?B?ZEFzSmhEU1FKZnhrTVBjZUg5YTJ0NFdYVGFNY01hZDdmUFpmeVUxSDJvMTFi?=
 =?utf-8?B?aTRGR2FaZHhqRWtPM0JjVEMzcmFmMlJZMjBCR2dNeWY4aWVIdEpGQ1Z0MjBC?=
 =?utf-8?Q?53BcLe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 21:06:32.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df187537-9d65-45ac-726d-08ddd13f4b1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533

On 7/25/25 03:58, Roger Pau Monné wrote:
> On Thu, Jul 24, 2025 at 06:44:32PM +0200, Roger Pau Monné wrote:
>> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
>>> @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>>      return rc;
>>>  }
>>>  
>>> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
>>> +                                            uint16_t cmd, bool rom_only)
>>> +{
>>> +    struct vpci_map_task *task = xzalloc(struct vpci_map_task);
>>
>> xvzalloc() preferably.
>>
>> This however introduces run-time allocations as a result of guest
>> actions, which is not ideal IMO.  It would be preferable to do those
>> allocations as part of the header initialization, and re-use them.
> 
> I've been thinking over this, as I've realized that while commenting
> on it, I didn't provide any alternatives.
> 
> The usage of rangesets to figure out the regions to map is already not
> optimal, as adding/removing from a rangeset can lead to memory
> allocations.  It would be good if we could create rangesets with a
> pre-allocated number of ranges (iow: a pool of struct ranges), but
> that's for another patchset.  I think Jan already commented on this
> aspect long time ago.

+1

> I'm considering whether to allocate the deferred mapping structures
> per-vCPU instead of per-device.  That would for example mean moving
> the current vpci_bar->mem rangeset so it's allocated in vpci_vcpu
> struct instead.  The point would be to not have the rangesets per
> device (because there can be a lot of devices, specially for the
> hardware domain), but instead have those per-vCPU.  This should work
> because a vCPU can only queue a single vPCI operation, from a single
> device.
> 
> It should then be possible to allocate the deferred mapping structures
> at vCPU creation.  I also ponder if we really need a linked list to
> queue them; AFAIK there can only ever be an unmapping and a mapping
> operation pending (so 2 operations at most).  Hence we could use a
> more "fixed" structure like an array.  For example in struct vpci_vcpu
> you could introduce a struct vpci_map_task task[2] field?
> 
> Sorry, I know this is not a minor change to request.  It shouldn't
> change the overall logic much, but it would inevitably affect the
> code.  Let me know what you think.

Thanks for the feedback and suggestion. Yeah, I'll give this a try.
Here's roughly what I'm thinking so far. I'll keep playing with it.

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629eeb..942c9fe7d364 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -387,6 +387,16 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
  */
 static int vcpu_teardown(struct vcpu *v)
 {
+#ifdef CONFIG_HAS_VPCI
+    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
+    {
+        struct vpci_map_task *task = &v->vpci.task[i];
+
+        for ( unsigned int j = 0; j < ARRAY_SIZE(task->bars); j++ )
+            rangeset_destroy(task->bars[j].mem);
+    }
+#endif
+
     vmtrace_free_buffer(v);
 
     return 0;
@@ -467,6 +477,26 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
         d->vcpu[prev_id]->next_in_list = v;
     }
 
+#ifdef CONFIG_HAS_VPCI
+    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
+    {
+        struct vpci_map_task *task = &v->vpci.task[i];
+
+        for ( unsigned int j = 0; j < ARRAY_SIZE(task->bars); j++ )
+        {
+            struct vpci_bar_map *bar = &task->bars[j];
+            char str[32];
+
+            snprintf(str, sizeof(str), "PCI map vcpu %u task %u BAR %u", vcpu_id, i, j);
+
+            bar->mem = rangeset_new(v->domain, str, RANGESETF_no_print);
+
+            if ( !bar->mem )
+                goto fail_sched;
+        }
+    }
+#endif
+
     /* Must be called after making new vcpu visible to for_each_vcpu(). */
     vcpu_check_shutdown(v);
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 17cfecb0aabf..afe78b00ffc9 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -116,7 +116,6 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -207,14 +206,23 @@ struct vpci {
 #endif
 };
 
+#ifdef __XEN__
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
     const struct pci_dev *pdev;
-    uint16_t cmd;
-    bool rom_only : 1;
+    struct domain *domain;
+    unsigned int nr_pending_ops;
+    struct vpci_map_task {
+        struct vpci_bar_map {
+            uint64_t addr;
+            uint64_t guest_addr;
+            struct rangeset *mem;
+        } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
+        uint16_t cmd;
+        bool rom_only : 1;
+    } task[2];
 };
 
-#ifdef __XEN__
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */

