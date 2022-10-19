Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31418603ADE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425571.673484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3jV-0006FK-6e; Wed, 19 Oct 2022 07:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425571.673484; Wed, 19 Oct 2022 07:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3jV-0006Cq-2L; Wed, 19 Oct 2022 07:43:21 +0000
Received: by outflank-mailman (input) for mailman id 425571;
 Wed, 19 Oct 2022 07:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3jT-0006C9-Po
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:43:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2b1d866-4f81-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:43:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 07:43:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:43:17 +0000
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
X-Inumbo-ID: b2b1d866-4f81-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f29W4RaYXkfx34LmHMhA1zNJbtO35OBlU5FTC9oYT9NQDiBOfEkOTg3x9Y55ijgtC5gOoDbrM0Idh9n/scK9lKJdjGiBWnuesOM74DIhkZb/1qVMIlc5Af6siftMoXJ3wG8BxwwbkpjJlYf0KdePelJkRCuJpl+3sQuOV/EXW8qCq8feIDmuwJZy+dUQwikggMZUgGYS8EJRAF2a02n0bLqgSv5BituQwmHCY4pexSmEh/BJ1cGeX0DVh/lOrKi2oW+wFIOBUDDcp56C/xs8jmyD/ylUWcx7ei3EZO2bRrspmrvi6x/OcsTdCKGevvIFIH03tsnkGtN8Pmq6wPDD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7rxHqGJe7QhMdpLK67MoUseFPrCyco8DcpKedNqvNI=;
 b=jzLY1lA3KEZFogH4TNrGCdZc5r5gwZWki27fIHpEkWNnoFUaY4b5DY0JhlAyROilGn8eO56pY5AeKGIUX2MzjIL5D2OQf4GQZBds/F6c7eGLEARwFAU4gz4pXk3ehRbsLFgL4s2bW1TnzST9BhXnDXdSZ8SK4zMqnD5pli0/6/UJqYFiK1RAF3up7jrurDl+abvAA0p49JyfLmtlJxZiu7gJXYdmjuR/jRvwVdG9rumE9Pv/P+edVBIKbc/7I463GCK/CbQ+sKrLqnUjdPt/d5cl0B0+3zk4LF74k5Pg+jd2VW8Gu6I1XygWaB1nl+epfIwcTytB0qHp2DSjcr+5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7rxHqGJe7QhMdpLK67MoUseFPrCyco8DcpKedNqvNI=;
 b=kXrDL5X9ERyfMnIAFRlomb92HBzFSnc+lclYz4s2NK+RiwpygPM1mMEqHuk5sEl3mhXWS3yBmMP1UQEjigbj9Rkkr0yptITF89V6/wDjQyNSHxnktWOHqKTAfalpvX96bD7qqCbNMKJVIyicxxoQyLVHIjRv9GPJjOQJSuzJUub/Ss+HFilXZRgSEgPo+UYI/COUUJzKV6vrwNqzuclPvOINH5lNNhfVRBJRUDQsB2H1ooK+PZzD4Ex2SrgKSVVKsOtgiSWth4CLSSn0NqsSHRluhCn7UANHjCj3TDjqrPPSq50Lwb3rLAM3HfzGOD2zHwMgUGMQdVO6EgSJ0LKXQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
Date: Wed, 19 Oct 2022 09:43:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c89384-1611-4788-491b-08dab1a59649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GlqJBSv2tm/uopySD0w5U4yJg+YjgCamrIQizm6f/G06FJTvg8K0biOB24L09QgvSgiyx9pGY3TYb6MsaUaAvuMNs0CaWYgDbES1LF/JKj2ZcC5af/Se5e7ohyh/GhACpGl044LuCTNlZ8cRK7myVoUqek6t+eKxHaS2giXfIJ2QrN6h2VDmMOT6CzMu4D+YAeM+yBJngLXbHOzLpKA5xnDM+nna0rjrkP618052ucZ7yv1K3LCreG5/yDYm8VzYeAJutZVD3M4Ez9+4PK3gyQRsBUABi8Uq3oPUsF0CYlUZX3ins+nDG5r57pra2ylCpYM2S0HcCs8ZOF5I+EvOHMwfuPekZrkBCGSQZUsKg2lAsxj48F/KcJvNBK60CFmJopKLuod5+BK90MyZLQn8rUzdw4y2JWjh6kke2i6BcJ18cJNhfdLV6inkJbgyTqt8NL5LLBz5Kvui3n7ogqbeFl0qH9cT+jL/DE/QYjozHgtNisqkXRH7chdoNsmcP/oyIjutoMjvA+URGbulHKetSPUlAvQz7lCasvPPztuNCA8WPb1sf3O5Wv8eRw0oIHN509wmBHOWY0ix2EVwkSKSpcXGRpRgVRefsKC9d28txZ0VquxNr4grrhwqNEyc7UaBVX035uoBic2CfOoNpreZIZeYuauURiuogVltA1ez8m2h9xSUFfliUme7kd0cVkKOwBTRYcunh0+lTvpxJJ+54ltDRfjC6Q6dvKPUtgsRapyF2MSscRP9xUWrMfdqp28AJ7CQ8+ASoRFV2jyHujNcKSBAxSyOEEv7Ld6teU+wHmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(36756003)(31686004)(86362001)(31696002)(38100700002)(2906002)(5660300002)(186003)(2616005)(6916009)(83380400001)(26005)(6486002)(316002)(6506007)(41300700001)(478600001)(6512007)(54906003)(66556008)(66946007)(66476007)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkgyZWFsWDJyVnNRei9FSlpmSHhNZEM3bmdRVm41bzIvOWlMZmQ0UzNXSTFv?=
 =?utf-8?B?c1ZRVzUyRUJVS0JxSDFqaEtPdTROaFZHYnNOTWVWaG5DdHgyaVU0Q1BUY2cw?=
 =?utf-8?B?MUFndkFXK1JyZWtoTzllcEJpYVRTK0lGa1ZXdnpoeFBQeHc3SlJlZXM0d1E3?=
 =?utf-8?B?aUV0TG1PaGxUQmhYZldGVUVHN214L1NVT1FyZS9jcEZ5T0tKRE9BYnZWNm9j?=
 =?utf-8?B?cERORmlDREluQnZkeUNxOG5BRS9IMnIrUVdBaFl0T0hQNlNzTHdQU3BRM0JG?=
 =?utf-8?B?SWl5SjYvdG1NWGhwZGZ1VlVNTUFNell4c0htOEJVL0dSWSsxRmxuRkpIaHA5?=
 =?utf-8?B?NXkyRnVaYkVhZlhGT1pKR0F0dy9rNVpoVWJURzkrcXowL0R4UzJnSTk4TDdN?=
 =?utf-8?B?TXM2SFVCeGZ4SENua1YxTHJlelpjeEo5WVR1YzFYelZjWEdtdWU4cyticHlS?=
 =?utf-8?B?VThTNENkNkloTjY3cStUdWtRYk5WenBEZmljOStLRGxpMlBPQ2lBSGxjc29F?=
 =?utf-8?B?S0tMSS8wT2k4SXpDeWZjdndVa3Z5MVV6NkVmbmRqTXNZdnVnZmtGblJKbFhJ?=
 =?utf-8?B?WDcrSStSd1MwWWh6MlQ5blEwdklQUUsycVVOVVI5ZFVIamRQbG5pNWs0SEFl?=
 =?utf-8?B?RGV3cks1Z3RLMTFrbHVBUW9hcGNJK2dHc3phMnZlNzI2UVFqMnluUzkzWHd3?=
 =?utf-8?B?NnlHeExUOFBJbEpFb3Q2VHY2RzNDTWVob29icnNtWk1jZCttdERNcFQ5Vnda?=
 =?utf-8?B?UGtkT3R1NTVxZnd6Z0ZHZDQ4azZHaTVHRnJKdmwxTlAwbG5ydU5pTkcwd1M4?=
 =?utf-8?B?VkhlSXZjVVMxQ1Mwd0xMQkVsNmhOSzRIRWVSc0NHUWh0MGMrNGVhYjIraStH?=
 =?utf-8?B?MWF2eHNTcHkrNGJzbkpvNW44eDB6eEhRTWdBa2JDNVJZYStzZng0VnVKcDhM?=
 =?utf-8?B?Vkg0QWgzQnJqSlhHMEpSUjNXZS9tN0N2QU9ZdFAvd3g4QmJUWmRvNmFmVTdl?=
 =?utf-8?B?SVh5cGc3Q1lBUTVxekd5UE9jaXVDY1NhRnlQOS9mb1M5a3M5WGVqbHZ6K2Fi?=
 =?utf-8?B?ZDJnU1JhbE5TdWZrN0JtdStkWC9tQUdUYXNRVEc0ei9wb0hOb1RNUUlQb2Js?=
 =?utf-8?B?bDdmbUFud00rNEZDZm5RNkVmNkpYVzN6OS9EZ0xHWEVrSHQ1VnlrRUl2L1gw?=
 =?utf-8?B?YVRoUDM0ZURDVmt1VEZjTk9KbzZTMk8xSXdkWEpHak1GbGpvdHU2aTcyZ3Fr?=
 =?utf-8?B?Tm42Vk1Pa3RtLzNHbmE0QnoyMkVNOHFJNnBmK1U0NkpjZzdRSUQraVhzcmJH?=
 =?utf-8?B?RUpuc1RPbEdxakExaGE1ZjZpQlBpcWt5dWZjWW50TDA0TGlZbk5LTXkvR0s1?=
 =?utf-8?B?VnpPZncxcGF2Y0pJcVBXZ3hvaTVJYXVPU0dYL2kvOXk1cjRUdU5vK3BVZmNL?=
 =?utf-8?B?QkNRL1hyZm9hSWt0Tndld3RpVHoxcms5RHFVNU5zcHcwdWtMOWo0UmxxWEFq?=
 =?utf-8?B?OWVEaG5CSHFYamo3Y0FIMzUyVHJTVS96TElJZDE3dlVQRHdyZmt2T3haMFFE?=
 =?utf-8?B?YUUrK20xM05UaXAyNXZpN2NBUmV1c1RLcTFvczY5VEhvNXk0SmhQTXlUL1Vp?=
 =?utf-8?B?YmNjOU5IeHBlN2pQeENGQmFkb2hNdUw4ZkdoWE52NkFDMEpxS29BMzFiUk5X?=
 =?utf-8?B?ZnIySFNHemFhT0NRb2Vwb1EzbXRPWm83ays5MGNRWVhhM2l2cXZDRE9rQ3c1?=
 =?utf-8?B?Y2k3QzM2TS9uNDhYSkRIRGRyTzJOZHY3VFUzd2tGMnIrY2czWDdQV3FKUDlE?=
 =?utf-8?B?aDVWaWNZSWJjaUVDV2w5Z1hnN0xEVFZ3cEpyYnZ5WVR5ODdKMC9NQnlwNmlX?=
 =?utf-8?B?RVR0MFI0eUJsb2ViK2EvZExNdkNYNnRrMXlIUHRXeHJvVEZid1JnNU82V05C?=
 =?utf-8?B?SE5CNEVXS1ZvRHRVZFh3Mi93Rm9iMGlvSmtEbnYwWXpEVHpyMDY2aHRzcTda?=
 =?utf-8?B?L0RoSVlxcU9Hbk1ZWGlKdkNOb2VWeFp6UUVEaHJJR2NzK2o2VFNwODkrWVRX?=
 =?utf-8?B?WmFCb0NoclRmQnk5dXNabDU4SDdmS0pTTnN3ODg1YTcxZjZxa1h3U1lQZktH?=
 =?utf-8?Q?OKMQ3BQg9f/e/W/PwAvFav83I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c89384-1611-4788-491b-08dab1a59649
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:43:17.6545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+Qlkht51QngTOTPPh4wW/f6M3Oq/ul+2zGgUeBNm/iMxiIAKUSWcNgTb2eK4SIxuF9TMHrkb5wWdHKzZ7GstQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

The registration by virtual/linear address has downsides: At least on
x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
PV domains the areas are inaccessible (and hence cannot be updated by
Xen) when in guest-user mode.

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, flesh out the map/unmap functions.

Noteworthy differences from map_vcpu_info():
- areas can be registered more than once (and de-registered),
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: By using global domain page mappings the demand on the underlying
     VA range may increase significantly. I did consider to use per-
     domain mappings instead, but they exist for x86 only. Of course we
     could have arch_{,un}map_guest_area() aliasing global domain page
     mapping functions on Arm and using per-domain mappings on x86. Yet
     then again map_vcpu_info() doesn't do so either (albeit that's
     likely to be converted subsequently to use map_vcpu_area() anyway).

RFC: In map_guest_area() I'm not checking the P2M type, instead - just
     like map_vcpu_info() - solely relying on the type ref acquisition.
     Checking for p2m_ram_rw alone would be wrong, as at least
     p2m_ram_logdirty ought to also be okay to use here (and in similar
     cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
     used here (like altp2m_vcpu_enable_ve() does) as well as in
     map_vcpu_info(), yet then again the P2M type is stale by the time
     it is being looked at anyway without the P2M lock held.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
 {
-    return -EOPNOTSUPP;
+    struct domain *currd = v->domain;
+    void *map = NULL;
+    struct page_info *pg = NULL;
+    int rc = 0;
+
+    if ( gaddr )
+    {
+        unsigned long gfn = PFN_DOWN(gaddr);
+        unsigned int align;
+        p2m_type_t p2mt;
+
+        if ( gfn != PFN_DOWN(gaddr + size - 1) )
+            return -ENXIO;
+
+#ifdef CONFIG_COMPAT
+        if ( has_32bit_shinfo(currd) )
+            align = alignof(compat_ulong_t);
+        else
+#endif
+            align = alignof(xen_ulong_t);
+        if ( gaddr & (align - 1) )
+            return -ENXIO;
+
+        rc = check_get_page_from_gfn(currd, _gfn(gfn), false, &p2mt, &pg);
+        if ( rc )
+            return rc;
+
+        if ( !get_page_type(pg, PGT_writable_page) )
+        {
+            put_page(pg);
+            return -EACCES;
+        }
+
+        map = __map_domain_page_global(pg);
+        if ( !map )
+        {
+            put_page_and_type(pg);
+            return -ENOMEM;
+        }
+        map += PAGE_OFFSET(gaddr);
+    }
+
+    if ( v != current )
+    {
+        if ( !spin_trylock(&currd->hypercall_deadlock_mutex) )
+        {
+            rc = -ERESTART;
+            goto unmap;
+        }
+
+        vcpu_pause(v);
+
+        spin_unlock(&currd->hypercall_deadlock_mutex);
+    }
+
+    domain_lock(currd);
+
+    if ( map )
+        populate(map, v);
+
+    SWAP(area->pg, pg);
+    SWAP(area->map, map);
+
+    domain_unlock(currd);
+
+    if ( v != current )
+        vcpu_unpause(v);
+
+ unmap:
+    if ( pg )
+    {
+        unmap_domain_page_global(map);
+        put_page_and_type(pg);
+    }
+
+    return rc;
 }
 
 /*
@@ -1573,6 +1648,22 @@ int map_guest_area(struct vcpu *v, paddr
  */
 void unmap_guest_area(struct vcpu *v, struct guest_area *area)
 {
+    struct domain *d = v->domain;
+    void *map;
+    struct page_info *pg;
+
+    domain_lock(d);
+    map = area->map;
+    area->map = NULL;
+    pg = area->pg;
+    area->pg = NULL;
+    domain_unlock(d);
+
+    if ( pg )
+    {
+        unmap_domain_page_global(map);
+        put_page_and_type(pg);
+    }
 }
 
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)


