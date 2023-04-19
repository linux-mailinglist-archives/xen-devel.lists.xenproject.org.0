Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16B6E77B1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523340.813312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5L3-0007uV-F2; Wed, 19 Apr 2023 10:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523340.813312; Wed, 19 Apr 2023 10:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5L3-0007rW-BB; Wed, 19 Apr 2023 10:47:01 +0000
Received: by outflank-mailman (input) for mailman id 523340;
 Wed, 19 Apr 2023 10:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp5L2-0006CV-4b
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:47:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe02::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82aa2f45-de9f-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 12:46:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9272.eurprd04.prod.outlook.com (2603:10a6:102:2a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:46:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:46:58 +0000
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
X-Inumbo-ID: 82aa2f45-de9f-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJXEa/xQOLzSclZZsD042z7q+zZyZm60WvljSk4/1lYTZWm1UrAi24fca/YNGzE6KjLDg9EdMJW01zv93bUHhaqUB7iNcibnzOm/H53dFWWzxGbsqwKbkjGKjRaJFgSjrDGavmv5jOPGJy8pHRgjYdzESJGkRnNz2A73ONgN2gN8ZH3oGkkkDj9I0KZExiKHTOuTcQXJm1vDmKaCDgsbyZM1E3wpH+1W5PBteNsN31PB2g3nwy17djmMHh4cnoHLGTqc37HXORX76UM8zzmrlg1s66ZqCVXW6BCo2aaRJyle7zCJfOH0TLgSxW70R6SXsbW+tejmFRViEWAu+kw5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7uQczNK/4mpSt5b9zhiriwBYD9oXL4EeN1Uwl2RegA=;
 b=jb5qkX000ImTuxlilqXO5HUKCE1GOraIe2kna+dlZgwgwi/uVql3vJhqKMWaCfIrebOy2inbLf1RXMbzCGTxY3ifved3Q33cWbgJIQvP/D1ddK+fZTZyaJ2WKPj/WeozQ773k6K4K8/RZ8mL0FVnSohSOTmQScWgEv7qxTuRUZ5r884xE3OfyXkwS6O+6aZTEKUZGQfE32OLopiGwvh26veVWLYUwABeWLjrncsuQfYY7w9a3R4zuUC7bmFLqpXMThO4OBA3Kc2EOFFiRJ9uqMW9V+D3/qoKgCXK5ajQp/JcEh4QDqnSeLfzNeF90hhZnRW420qYmDiWw4fCJi5fQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7uQczNK/4mpSt5b9zhiriwBYD9oXL4EeN1Uwl2RegA=;
 b=CbFgW3ZQItvcUoFrDKcNOOz/yIV4LywC4G6xCJMAUXtuyMLjLbO4kwH6POA7uGp96shILOoY1QTJQ6Vbp4LY62n0gOBCpjEQvWk4uVpVnYaZqtugtaWRa2HTJ8ghqvVquGmdqhFwXgbnKoN72WYZuQmZ86A3MQ0zzPebybnL+V6/CSjAKAL5LIJlYMg4H8KVHKP70CxJjWS9+yuKPWsxUZXaV3DrkTlRcj8bkxZJf0iIMC8yLWLjMhhFdgl7k4pVHpimthVrlgXDN8JAG+Gv7JHRFf1b2hHi5mP83ZnM5qQjVx90xb69RKnmiKrni4hx0VQ7kXEuWPLs4vxHhXDWww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18fcf499-a2ae-ab48-a66f-ca0499097e8a@suse.com>
Date: Wed, 19 Apr 2023 12:46:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 5/5] x86/HVM: limit cache writeback overhead
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
In-Reply-To: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: ba814f8b-5957-4809-610d-08db40c3660c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YRA9wm5W+WiTVRPqwm+QPdxYdYqUIFLsSR0gIQUgfamTAseIesmpMRSHQoqM9juQVfEyzu9vrwByxZYO8pRzsMFuADZQwEZaY1I7RoC3GqbZF10Iej+pcMdaoRdShh9rgYAOU9BlCSPyEeS6y99cNNke7dibKzcFUnFNZ68ZzL8Auk9vXw2rUYq5jJ5OaYGqBnktCxpQr3qPYEj1vLG6gogHKiI/BjzW97hA3Za0xUCDTRK8f5aHbpYxhoeJN5N6Zxmvs+gIV08JDZf4ExzyV0DtsWcObWHmsSwcpXBkmS3P3XNqoNwcUQPOsxNsQAQp8cIVfiPbU8s+jEq+I2gnAPyAHATyskdj8bqn1EuYLcf7fZc6RWvbEgEpJCCYovA2EUt5sRnMXEkN/Fyvs7Mw+MTAHdLFbnI31YDkj+cI1nKo8ZSRTb4zZTeV+89v3G5tDWAF6y9chlVEWNxuYMfRGNm8wPaxRd5GkWvv7BhMN6cYY7SXLbIog0wOKT8sr3i2DM5OeDj8HtsOI76vtVs2PE/spo1+9aMbkzZX4R6sAfVzsLE9IGqZ6YGl9YEv+YTInxY+p/AQqKhXsK5UcCbiMkuRFYSCO2qoXmJ1jmgkZOfVVnJvV+6IBzraeDpS+zFspnn+yMTra0XP/PY8jAS3fQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(38100700002)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(2906002)(6512007)(36756003)(26005)(83380400001)(6506007)(86362001)(31696002)(2616005)(31686004)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1hzM2ZBVXNBT20xZ3lpY0paT3RUYytjSFF3Ky9Ga2ZpTk9vaWlMbFU0YmUw?=
 =?utf-8?B?NWkxYVFkYnVPaTRLRml2YXZlSUFNWGJrRXhRNTQvRzF6VEo1amxhdlpHTWxL?=
 =?utf-8?B?UmpCZW5sZnFONXpQVUdhM1JVVElXQ2lQWVU5eS84emMwbnBBWXJXa0N1TUlj?=
 =?utf-8?B?K3RudG5CY2Y0d05pcFJ5L25QK0ZQY3hqbmlGL3k0UXpLUlpwOXlNTVhsMGRD?=
 =?utf-8?B?em5iQlJjUlpuOXdROWRFcWl1ZXVQd0NraUFHd0lIVWY5YytIamJ4a1NEa0Vl?=
 =?utf-8?B?dFB0NUZ5aDJKRVJNNTRzcFQyNU9zVlQvb3JlSWZsTE5xKzhpRGMrdWVEWG9D?=
 =?utf-8?B?UjhuNk1kT2FqSzlxVXNPNUpxNmNzUForQnhRTXRXN0ZlN1pRQ0s3TE12S1Vp?=
 =?utf-8?B?ZHVrclFDM1lzNE9DTEJyeVllV0Z4ZWlhM0VMbUVtQ0Y1cFhDMFJ6Zy95TWRX?=
 =?utf-8?B?NWlnSkNuRGpFQ01weEtnZENFUUd3M0IwZTJGaFgvSXNYQUFSc1lkTGFOMklB?=
 =?utf-8?B?TjVOY2haRVJhL3NSckswOGZOdk9wdWJtNXhBTUVjSFlaS1oxMW9UOGxYY0la?=
 =?utf-8?B?NVJnaEpVbUV4Yi9JU2x6N1liRWt0d2dUV1g2czhiOXV2a0dsQ3NBNHJtbjJ1?=
 =?utf-8?B?QTZkMWw1WE82QTBtOGFNTmFCbGZTdXVvdzNvZ055ZmUvN2VmQWJhQktDZTRu?=
 =?utf-8?B?N1pJbWVIYXpGamR3a0hnZmdlQUlGK1NvWEd0dXNkN3hpK1o1RlBleGFDdFNw?=
 =?utf-8?B?Q3BpdXFrakNjSGxiaUs2NVUra2FKNjkrTWowdWxGNGQxYWpRM1FMRy9TZG9B?=
 =?utf-8?B?S2k1L3k4bFZHZCtTa3Jwa3VlV0FacjhpbGdCdTVhcG5kZStZR0lvWmFYblZw?=
 =?utf-8?B?dFFRYUdRNkhvTVgvQjMvV2p2NFlLbFpxK3BPZ3lrelVQKzl2MnZBUDNVRHJE?=
 =?utf-8?B?eDJTNjJNdFc4T3ZDejgyeDhwUGMvU1padHNuQjA3NVFTVERzM3RFVWYwZzlM?=
 =?utf-8?B?dENtMnF1SzdBTDJOYTlYc0t2ZHkxMDRyUk90NzRhNzlINXVUR1FMSEFCS1pG?=
 =?utf-8?B?NXlwQUJzMjRPOGdKVUxaRkZuRXZodUZsOU9tWlRJaVdwZ0RGU0lVUy9IMmlo?=
 =?utf-8?B?SnFDN0FIaVRtd2MxVWU0OGhTUERQYkFkbnVhNVJ1bzBkVDI2UDByUXJoci9s?=
 =?utf-8?B?aVBGU056alJzbVJtY20wb2t6OW5JeVp5OUZIUUpIS01GdWpRc0VBSGRCMDdT?=
 =?utf-8?B?ZFp0MlBCbVJPVk85S01lb3h6MFVMTUYxd0JKclMzMEhRb2luTEhrd1J1djl2?=
 =?utf-8?B?SzF5NzhYcDFqVEl1NngxYXdWaGcwK3RTOUxVQXVJZ2lMc3NXTm1UV082OUVN?=
 =?utf-8?B?K0FEc1AvcDJ2aWlHL3B1NzFSdDdZZ1E3b2cxY1JPa3ZyUjF3dVhlb1l5WkJw?=
 =?utf-8?B?bzFHKzdHRUdiS091OEhscDFzNEp2SUtKSzVpaDJVSG40LzBId0lIVmxaTVRz?=
 =?utf-8?B?RUJDZjQydlpBMmpmT3IrUjdLUDNOKytLU3AwdEFiZDhPclZCUCtVQkd2OVBO?=
 =?utf-8?B?MzE2bFNBT1M0K1JaVXB0SzBNcW1nc0dYS0hVT2FKL2QyeHVITCtldUIrN01O?=
 =?utf-8?B?d0xLSmgxcTlzdGU1QmZKei9hT1NyektqQ0huS0VOMFQ1engxeFJJakwrZjFR?=
 =?utf-8?B?N3M5c3RiN20wYkowOHEwRk13NVpiaHV4YU5HMmN1eUEvck1nZUQvdklJMjRt?=
 =?utf-8?B?SHd3UE0rSnkwZ2ZHOUlSdzhQUFo1OTU3MmZ3enlJenVuMU5JTUpOdnpVKzZS?=
 =?utf-8?B?ckdaNDFFeklSb3p5V2VtaWdoajZyRHY2Kzh0MGkwa0RaOEV4YlkrVDE0QjFP?=
 =?utf-8?B?ek5NYzZGdEd6b2tCWFNDOVdVaEQyTlJESVd1VzJuRHgrQWtTN1lNZUNuL2ht?=
 =?utf-8?B?bXZSWjU5SytJQmRoU0JEaDhZTHRtREFYbDRWZGlzdkxwTm5TdHRXeUNqclZD?=
 =?utf-8?B?MTlOVllpUlV6QmdEQm9FdU5tSU93TVlyQnpMMGJScXB5bFd6RXdOSW12SkZE?=
 =?utf-8?B?NzdnOEVDZUdOQlZ4WDNLeStFVGNOWk0wSERTTzIrN1JpbnM0b1k1VEdIVnF4?=
 =?utf-8?Q?dFHX6btZNpbJaR8uBVLr45hlG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba814f8b-5957-4809-610d-08db40c3660c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:46:57.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6Khoj9pc60HiNVQA0ybCULb6DXIyh9KQLJ9s2WHQxVgnw+7wpqzz51G7waPWtWXFhtu+0WYxKIfyxFeE4zupg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9272

There's no need to write back caches on all CPUs upon seeing a WBINVD
exit; ones that a vCPU hasn't run on since the last writeback (or since
it was started) can't hold data which may need writing back.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With us not running AMD IOMMUs in non-coherent ways, I wonder whether
svm_wbinvd_intercept() really needs to do anything (or whether it
couldn't check iommu_snoop just like VMX does, knowing that as of
c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
HAP's"] that's always set; this would largely serve as grep fodder then,
to make sure this code is updated once / when we do away with this
global variable, and it would be the penultimate step to being able to
fold SVM's and VT-x'es functions).

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -537,6 +537,8 @@ void hvm_do_resume(struct vcpu *v)
         v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
     }
 
+    __cpumask_set_cpu(v->processor, v->arch.hvm.cache_dirty_mask);
+
     if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
     {
         struct x86_event info;
@@ -1592,6 +1594,10 @@ int hvm_vcpu_initialise(struct vcpu *v)
     if ( rc )
         goto fail6;
 
+    rc = -ENOMEM;
+    if ( !zalloc_cpumask_var(&v->arch.hvm.cache_dirty_mask) )
+        goto fail6;
+
     rc = ioreq_server_add_vcpu_all(d, v);
     if ( rc != 0 )
         goto fail6;
@@ -1621,6 +1627,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
     viridian_vcpu_deinit(v);
+    FREE_CPUMASK_VAR(v->arch.hvm.cache_dirty_mask);
     return rc;
 }
 
@@ -1628,6 +1635,8 @@ void hvm_vcpu_destroy(struct vcpu *v)
 {
     viridian_vcpu_deinit(v);
 
+    FREE_CPUMASK_VAR(v->arch.hvm.cache_dirty_mask);
+
     ioreq_server_remove_vcpu_all(v->domain, v);
 
     if ( hvm_altp2m_supported() )
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2363,8 +2363,14 @@ static void svm_vmexit_mce_intercept(
 
 static void cf_check svm_wbinvd_intercept(void)
 {
-    if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_WRITEBACK);
+    struct vcpu *curr = current;
+
+    if ( !cache_flush_permitted(curr->domain) )
+        return;
+
+    flush_mask(curr->arch.hvm.cache_dirty_mask, FLUSH_WRITEBACK);
+    cpumask_copy(curr->arch.hvm.cache_dirty_mask,
+                 cpumask_of(curr->processor));
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3710,11 +3710,17 @@ static void vmx_do_extint(struct cpu_use
 
 static void cf_check vmx_wbinvd_intercept(void)
 {
-    if ( !cache_flush_permitted(current->domain) || iommu_snoop )
+    struct vcpu *curr = current;
+
+    if ( !cache_flush_permitted(curr->domain) || iommu_snoop )
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_WRITEBACK);
+    {
+        flush_mask(curr->arch.hvm.cache_dirty_mask, FLUSH_WRITEBACK);
+        cpumask_copy(curr->arch.hvm.cache_dirty_mask,
+                     cpumask_of(curr->processor));
+    }
     else
         wbnoinvd();
 }
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -161,6 +161,8 @@ struct hvm_vcpu {
         struct svm_vcpu svm;
     };
 
+    cpumask_var_t       cache_dirty_mask;
+
     struct tasklet      assert_evtchn_irq_tasklet;
 
     struct nestedvcpu   nvcpu;


