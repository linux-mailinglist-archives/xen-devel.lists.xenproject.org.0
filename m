Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E203F8317
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172731.315202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9lP-0001oh-TK; Thu, 26 Aug 2021 07:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172731.315202; Thu, 26 Aug 2021 07:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9lP-0001lw-Oy; Thu, 26 Aug 2021 07:25:27 +0000
Received: by outflank-mailman (input) for mailman id 172731;
 Thu, 26 Aug 2021 07:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9lN-0001kI-Hp
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:25:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4870a61-e9ed-4e34-8f12-2e351aa517ea;
 Thu, 26 Aug 2021 07:25:24 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-gxFygJZHNi2fVroXroCmpg-1; Thu, 26 Aug 2021 09:25:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:25:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:25:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 07:25:20 +0000
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
X-Inumbo-ID: d4870a61-e9ed-4e34-8f12-2e351aa517ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VW9/wdJ4/kFPJ+ukBVObUj1EDWpu9iV3yoaVGzNpK4k=;
	b=V+U6jYCYJupIihmBlNg4hEqlhXtTLjYL2JFqM7p4iDlmXnIsXhE0yAH0HqKT5wq4mzDp0E
	ihqxAR47qRurp6YyZZYAdO6e0Lw2FmB/Z4izC+E41w6CRGSHqfg3H5x/Gk7Vnop7KU/a6H
	+NwE+E7U7z8m8K3WP/yZ8tw4hb5W6YI=
X-MC-Unique: gxFygJZHNi2fVroXroCmpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWMlPk/cn38mSVs8alYLHoPb9Ckj4t9h6qPMWdLKuRrjvmUzwktNVPlDhIvlJinaFV+wu4uuWs/hB5+LxQD20pEr9BZHHqFcWiAsSMQIdo54h/DhfRZF0YFYYM1ZbTOq/OWtoFGu+rMCAgX8IFoFQNh4MnJ/u9xJXHj7KY4XhVQrNWCgDl2fGPImY/GeqfQLiB6949efcPOmsbH7zWHhvzhsNBVAOEebP0TssghvFz5ZPOoJSyXJpOrK/RHNKo+lnk6MatVkZp79yPkLOgGa5uaCz/Wj1hxwFADZ5Q4BvAuaQeTFXalv2BN5QZg/NhX4bqoaATajuI874vl1S6Ae8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW9/wdJ4/kFPJ+ukBVObUj1EDWpu9iV3yoaVGzNpK4k=;
 b=QmrJ2n+uKyXQdfRsAQ6/BxfS7Qg9Zbp42MgxwVLOc9jRilbJBpsuUa6nk6XcWeF9U0ccQML/feGL6vMUYC42ljCbpykim98w2YXAhnhJBrsZ4rBBoTuJeZoHmGljcBsREcft9Icg/M5B44J3xPAlIfWqtykL357A7xx1TZDWPG7mSrHBzttnLaoK7J9t5S8lbcyBhIJqh4pQhgGOZpSz2Rh/LSlnfFxsst4IbvdnYB9Zjleef2JbN5yygo/LnY7Tmvy79syFxgIkh5qj4VsNx/KAWr0Zza53KkU48J3hPfEcgdT0SgxEQYHLlhIiGqOcn2IJr/CEmrxqpLkw5Cd5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 6/8] AMD/IOMMU: provide function backing
 XENMEM_reserved_device_memory_map
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <93f33c54-8abe-4a73-3597-2f7d00d2f4af@suse.com>
Date: Thu, 26 Aug 2021 09:25:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa7c22b0-47e1-4628-bf07-08d96862a9a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118BE2251972851370BF22AB3C79@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dMNl0LFoSXqUW9oN9q6p1HBU5NjZrUq9SgyZiWX9xSReMSfkk0sfdjxhAjYRztBfAex01iQeBdSk68oUyMnC0VN82ujyAXm7kqCb/O99wkdQK6osDYI8FXcvcc514rcsB00u0WBi7tfipKfxmf2PVkhptpIej9Ju8Fkvq+nfuc3qAuLbM3xNDkbuibFHJ2dvY3sPxcAoHV1ammE88+k+EaIwcMZ4uI/gXqhusLwCsQOVSn8XOQltSnKAKEtlIFjHSXG5Og+7I/U/Kht9bzgDBIA/uJxajZPqM/iq2VPvZZVfyvMBA5DK8Iei5DxT2E/Gx9xx+Q6p56emUwhTpDY09JnkLB8uTKemWzMM+zKcUFBkAJl0qLviHuQGdAUiF9qjCa+xBFcl/kPDIAvy+0P1CFwgVkFNUFEu8ZDyqn5mfwKeO12mtjjbasjKbAu4q4l0R8hPLT75/lWzW1Wm/gHD2yMfg7lO9tCA9FUUYuKoPNcPnGb83dM3uHymOCldaM59Xun1l7pQv83p4zoI6wCLBEpNfPI78nplwiAH6dk9UodpiiFUHHntG7dkSjtvihsmw7zvKluVGp9lBIaTqG7hM4Q8sznFdQwnXJyISDq69ounUFNV6AVfgIgnVVmr256f3mdlE8TgiyPAvbRMpDuehscyb+ZCR8YJ8vTA0A3OUkw+G3iwXU6yV+XDoAQ/AT/AZtkP0QuRPdkq+Mgclris/Oz14asq8OO0NUJRFM0lWhVw+m7LWGJhKY5TKapDtcXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(31686004)(66476007)(956004)(2616005)(2906002)(8676002)(66946007)(38100700002)(498600001)(5660300002)(36756003)(54906003)(16576012)(31696002)(26005)(83380400001)(4326008)(6916009)(186003)(86362001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejErY0lzdWRtaDFjeFNPaVljSWFuNSt1d2x6QTAzanJtMUFncUJTVzlPcDA0?=
 =?utf-8?B?NG4rcjlUWDBWTEpZZVprT1ozOU01ZGpSTktpeFoxU0NWeWRpZEVPaEdWbDF1?=
 =?utf-8?B?RFNXSDhkdzBLbDc4VkFLQURaRjl5UmZEUjRCR1dKSmcrVW02WjJnUVMzbGpp?=
 =?utf-8?B?c2l1OG42M2liYy9PY2F1NnFrR3pHaExiTGdqNFNsNWpyanVrblZwQjRsMVM0?=
 =?utf-8?B?ZVJKSGMzdG9jMmJJaWQrOEF5TSsyUytTR3B2a0lVMUJFZmhxZ1ZZeUwvYU1o?=
 =?utf-8?B?ckw2OXpEb3cyZ0dHejczSUd3THNUSjd6MHBQNXJwdDU3VVMzWlBUczMwcWRU?=
 =?utf-8?B?QmNodWovUUZOME5vd2R5K2hwMVhSbVJ5SlN4MkYvRmg4SkpFclB6bUVibFIy?=
 =?utf-8?B?U3dJTmt2R29RcERCd01pUzIxVTE1aGFzTUVaZXJCampPcmUrdlVzazE0bzF3?=
 =?utf-8?B?LzZwbmJsbllza09HNkFxcS9mK21qK3Jab0o1UmtORGx2cXlyVDVnWjEvbHd3?=
 =?utf-8?B?OHZsdTRld1h4TUh4cmFlTWd0MW5VTElaZCs3YXpueDdkdno5TFBocFlQNmp0?=
 =?utf-8?B?YVZRQnlQZHVjSjk4cHdsOFU1a2hjSUJWN1JJZTlPMk1KN0ZwaXo1RjN4QnFE?=
 =?utf-8?B?UjdYNnBkSTM5TWNFZ0hhVmQvRXJHNDJFOVVwaFd6eEFSbXB3M2sxZHI3Uldx?=
 =?utf-8?B?N0cxUjcyRWNXVWp4eStGS2dQUko1L1VYVWVmanFoV0tJNmw2VmNiWDd6NXdG?=
 =?utf-8?B?QjcwZjR4dEE4YlAxUmdVNU8wWlhtYmdyOHRkMUZPSHhDSlRMWXBVZFR0OTJa?=
 =?utf-8?B?M0REN0J6M0pFZlIrZEVMM0J4QmJpeGpJUllaRlljeVkrOXlJUEZCUGpkemdw?=
 =?utf-8?B?UmhyRHNjMWsyZE81NkVIN0VTMDNlYTZLZ1d4dUZoR3hNaFQ3VEdlS1MxZ1cw?=
 =?utf-8?B?bDFSTHZxdGhRSVRwREZvSU1DRVJIcHhQSEhCSzRoNkNRbUNnVC8rZEdoRm92?=
 =?utf-8?B?VXU1SlhSRCtpZm43R3ovaWNpcGd6Q0hhay9JWjk1K3cxbS94eUxXcXlwUis1?=
 =?utf-8?B?MVk2Mzh1cmc5V3RzajNVcU4zeno2ZmhxMkV2RE1LRVd2SytlUGp0c2VoRDMy?=
 =?utf-8?B?a0YvTEx3ZGp4R1Vzeit1ZVUzbHAxL0ZjNmJHdFA0QzllU29LcEtsRzNsOFhJ?=
 =?utf-8?B?clBTc2RzMTJZQWdUNGFtaWVhbGN6UmRLWFFPaVE5alllVjNjYlhyVDFVTXVL?=
 =?utf-8?B?d0pKam1VVW1HZlc3OHJBQis4endleGxUWVRjUGJCdFMzQlduSUpEeGFiUnBX?=
 =?utf-8?B?SHBpQ3A0U3ZnWDVJUFpBUk9tY0pLdmVtR01uc3kvNHpkRWFRYWg5VHUzNDNZ?=
 =?utf-8?B?UUZUczNzWGlNOGRjbWJleUZVcnM1eVdHcFFBc3JvcGs3NzJNbE41aDJIYjcr?=
 =?utf-8?B?WmlEQUVUcW03VDlLZG8yRzdnMUV1eUt1cFYvTHNwYktEellrOE5pOEtrZ1VV?=
 =?utf-8?B?ejVxNWR6UmU5b2VhOGxSL1VzbmwxV1VqeFhiQkcrVlVCSWU3ZVduNUpjdkpu?=
 =?utf-8?B?T2d6MXRmSEZPaDhTcStjQXlQQmhuWm1UTGdteHMrS1ZMV0hvMmJBN1FjZGRq?=
 =?utf-8?B?YTFTQ3V6NHlTU2VDRG9RdGNocGlkNWxnMDA0UzY3Sk5sMGdndm1VYzlGWG5n?=
 =?utf-8?B?bURoL3lDcXgyL1A4L2Q3eDdZTzNyc2VnTFZQaUw5d2h6VGcvRFQrbmNmMVVT?=
 =?utf-8?Q?YGuAglcXbLISIU3hwJJGiA0yMxUNjyOXblhH5yK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7c22b0-47e1-4628-bf07-08d96862a9a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:25:21.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: debop5If3b5RaKYJEm7ZMFVEf2Y+RP4yY3Tmtl13MMg7rp5N6M3RUZOrGdAI/d+GoXU+1om5LtYScgzYgqavwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

Just like for VT-d, exclusion / unity map ranges would better be
reflected in e.g. the guest's E820 map. The reporting infrastructure
was put in place still pretty tailored to VT-d's needs; extend
get_reserved_device_memory() to allow vendor specific code to probe
whether a particular (seg,bus,dev,func) tuple would get its data
actually recorded. I admit the de-duplication of entries is quite
limited for now, but considering our trouble to find a system
surfacing _any_ IVMD this is likely not a critical issue for this
initial implementation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v7: Re-base.
v5: New.

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1042,6 +1042,9 @@ static int get_reserved_device_memory(xe
     if ( !(grdm->map.flags & XENMEM_RDM_ALL) && (sbdf != id) )
         return 0;
 
+    if ( !nr )
+        return 1;
+
     if ( grdm->used_entries < grdm->map.nr_entries )
     {
         struct xen_reserved_device_memory rdm = {
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -110,6 +110,7 @@ struct amd_iommu {
 struct ivrs_unity_map {
     bool read:1;
     bool write:1;
+    bool global:1;
     paddr_t addr;
     unsigned long length;
     struct ivrs_unity_map *next;
@@ -236,6 +237,7 @@ int amd_iommu_reserve_domain_unity_map(s
                                        unsigned int flag);
 int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
                                          const struct ivrs_unity_map *map);
+int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
 int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
                                              unsigned long page_count,
                                              unsigned int flush_flags);
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -145,7 +145,7 @@ static int __init reserve_iommu_exclusio
 
 static int __init reserve_unity_map_for_device(
     uint16_t seg, uint16_t bdf, unsigned long base,
-    unsigned long length, bool iw, bool ir)
+    unsigned long length, bool iw, bool ir, bool global)
 {
     struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
     struct ivrs_unity_map *unity_map = ivrs_mappings[bdf].unity_map;
@@ -164,7 +164,11 @@ static int __init reserve_unity_map_for_
          */
         if ( base == unity_map->addr && length == unity_map->length &&
              ir == unity_map->read && iw == unity_map->write )
+        {
+            if ( global )
+                unity_map->global = true;
             return 0;
+        }
 
         if ( unity_map->addr + unity_map->length > base &&
              base + length > unity_map->addr )
@@ -183,6 +187,7 @@ static int __init reserve_unity_map_for_
 
     unity_map->read = ir;
     unity_map->write = iw;
+    unity_map->global = global;
     unity_map->addr = base;
     unity_map->length = length;
     unity_map->next = ivrs_mappings[bdf].unity_map;
@@ -222,7 +227,8 @@ static int __init register_range_for_all
 
         /* reserve r/w unity-mapped page entries for devices */
         for ( bdf = rc = 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
-            rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir);
+            rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir,
+                                              true);
     }
 
     return rc;
@@ -255,8 +261,10 @@ static int __init register_range_for_dev
         paddr_t length = limit + PAGE_SIZE - base;
 
         /* reserve unity-mapped page entries for device */
-        rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir) ?:
-             reserve_unity_map_for_device(seg, req, base, length, iw, ir);
+        rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir,
+                                          false) ?:
+             reserve_unity_map_for_device(seg, req, base, length, iw, ir,
+                                          false);
     }
     else
     {
@@ -292,9 +300,9 @@ static int __init register_range_for_iom
 
         req = get_ivrs_mappings(iommu->seg)[bdf].dte_requestor_id;
         rc = reserve_unity_map_for_device(iommu->seg, bdf, base, length,
-                                          iw, ir) ?:
+                                          iw, ir, false) ?:
              reserve_unity_map_for_device(iommu->seg, req, base, length,
-                                          iw, ir);
+                                          iw, ir, false);
     }
 
     return rc;
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -467,6 +467,81 @@ int amd_iommu_reserve_domain_unity_unmap
     return rc;
 }
 
+int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
+{
+    unsigned int seg = 0 /* XXX */, bdf;
+    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
+    /* At least for global entries, avoid reporting them multiple times. */
+    enum { pending, processing, done } global = pending;
+
+    for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
+    {
+        pci_sbdf_t sbdf = PCI_SBDF2(seg, bdf);
+        const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
+        unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
+        const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
+        int rc;
+
+        if ( !iommu )
+        {
+            /* May need to trigger the workaround in find_iommu_for_device(). */
+            const struct pci_dev *pdev;
+
+            pcidevs_lock();
+            pdev = pci_get_pdev(seg, sbdf.bus, sbdf.devfn);
+            pcidevs_unlock();
+
+            if ( pdev )
+                iommu = find_iommu_for_device(seg, bdf);
+            if ( !iommu )
+                continue;
+        }
+
+        if ( func(0, 0, sbdf.sbdf, ctxt) )
+        {
+            /*
+             * When the caller processes a XENMEM_RDM_ALL request, don't report
+             * multiple times the same range(s) for perhaps many devices with
+             * the same alias ID.
+             */
+            if ( bdf != req && ivrs_mappings[req].iommu &&
+                 func(0, 0, PCI_SBDF2(seg, req).sbdf, ctxt) )
+                continue;
+
+            if ( global == pending )
+                global = processing;
+        }
+
+        if ( iommu->exclusion_enable &&
+             (iommu->exclusion_allow_all ?
+              global == processing :
+              ivrs_mappings[bdf].dte_allow_exclusion) )
+        {
+            rc = func(PFN_DOWN(iommu->exclusion_base),
+                      PFN_UP(iommu->exclusion_limit | 1) -
+                      PFN_DOWN(iommu->exclusion_base), sbdf.sbdf, ctxt);
+            if ( unlikely(rc < 0) )
+                return rc;
+        }
+
+        for ( ; um; um = um->next )
+        {
+            if ( um->global && global != processing )
+                continue;
+
+            rc = func(PFN_DOWN(um->addr), PFN_DOWN(um->length),
+                      sbdf.sbdf, ctxt);
+            if ( unlikely(rc < 0) )
+                return rc;
+        }
+
+        if ( global == processing )
+            global = done;
+    }
+
+    return 0;
+}
+
 int __init amd_iommu_quarantine_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -667,6 +667,7 @@ static const struct iommu_ops __initcons
     .suspend = amd_iommu_suspend,
     .resume = amd_iommu_resume,
     .crash_shutdown = amd_iommu_crash_shutdown,
+    .get_reserved_device_memory = amd_iommu_get_reserved_device_memory,
     .dump_page_tables = amd_dump_page_tables,
 };
 


