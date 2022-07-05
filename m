Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7EC566E8F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361131.590456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8htl-0001pZ-Em; Tue, 05 Jul 2022 12:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361131.590456; Tue, 05 Jul 2022 12:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8htl-0001nT-BR; Tue, 05 Jul 2022 12:43:25 +0000
Received: by outflank-mailman (input) for mailman id 361131;
 Tue, 05 Jul 2022 12:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8htk-0001nN-11
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:43:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e0b6f54-fc60-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:43:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6065.eurprd04.prod.outlook.com (2603:10a6:208:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:43:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:43:20 +0000
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
X-Inumbo-ID: 0e0b6f54-fc60-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CENuYn1a5CC1/0q4tYgDbKb06/+uiip/Y6wq2RvaO2/k9cBa6wv5MX7NF4TebW01LZqLqpicjY1qGo9oBTPUs+hb5dMV5vCeVKVYgfuw81ZEQx5dbYdE8Q8UNrkiU8JynwvvtrpHrDSv/QzPHTEQuh8x6be6rPE3FDDZi3dEU/LKTgfhj21dnmlrI0R0yaFP/Oq8WbLGjgdkVWFG7+XfpZMnROC9x0CHO4euE9isac4JXsUbnafqXM1r1Te2rpA+p6qmDXssBJ7LM81Eg3xY57hMwOO5QYn8w6eN16/vACpQp1Fa1n885M5/tJd/+0F4K4vVhoNbOjZyqC+GoYXbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kE9tF4OKVANrzWwJZfuQmt3GkZdJOPqWNjkumzgidE=;
 b=d3o3+cS+3VPOBjMM1d7m/NxT8OYuKC3u9lPtmdqA6NIXD7WwIJFRt4HHBkrz5UopNrhp982exh57LL2dz10d+oheM3Y9P9XOywTfUadZu9s3D23ouhVkfp/+pjZhSxjf67QbcVlIVMv8LKoIwEJxVmPcHuGMaayn4/pz1cqwoNGHGDSOX377rGGg0dFeS7qjoclVMknaVT0JBYrrfnZGR5yIRuVCl1FZAxEsR7x957ga+iYO4e50hD7xI8JKdTDTlEyaFgnxsGmlpI7dq7zf46tHVflK3mrKx/4Z8Mc8XyOOyecRcxjBcfdHBIKQGO85NzOtdBT6lHSzztIGbTx4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kE9tF4OKVANrzWwJZfuQmt3GkZdJOPqWNjkumzgidE=;
 b=rBDHCdjcB6JYTPGOa2yEaV2bDkVAEfjzQ2kFcJbCemD2hFTWDx1U4bGBPHLchpR0Ep/elR6oIf0MM1SrJIe2gBfQQ4ZK3Y8Py/cJbREy1JY0wHzuZoYXVUY03LizI42B4uZt0EV5EFIlvkCX/sW285Qp+Ki8rBB7ehrP2egR3aOn8a0wygY8kUd9BHdSug6EjVi/HEOujZiQxwrxaKSzGT4FGuVG/ZJz1KLJXH0kDMSEaqfXGoxA+UMwj03esoXi2Ci30mcHyRGxV7W+gYIfTFgv8Q0ApvR+5pmkEN/2VYkrvDLy4JW2I5viqveDrR8T4DUAQBAMkbSJuL5YWuC6zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b3e1a15-f358-3095-87fc-c47843eff94a@suse.com>
Date: Tue, 5 Jul 2022 14:43:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 01/14] iommu: add preemption support to iommu_{un,}map()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6880204-5e4c-49e7-7585-08da5e83f11b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6065:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HvIA4oCjHZlVzsisnh7zCVojYSJaehvDZLGu/30RYv3t5W6O7B5h1RyrmdDgZgBO8FSMQS2RaR+3g9OXIuthQ0BcLb0FIVE6ok7W7keI2yJUG+FOKEgwguIVpROEqpfneHgGDVto2vVmuLdcE+82AGor7d9AsSag9F76N9o4PCi2pvDUZ+mmRgOrzd37NStDjiPgQ6FFNAwTP7Zgm74Q/zHtEn7zyN4hGX6Br5/mQ/7fBH4CPsM2EPnVFSMMxVLujrFfHQhw7FgSvLCnUlvXP/3jiBQLXZ4V7vN8xPwkROMTN60DX+NPzc8u7knuqsFMPBZFPFIhvCtt/xXPlzVGeJKo7DcuqmhcAhvzRDtuJTHGmaaIAYz7aVTPkuX89RxsETK428p2bXPjXIbCq5D7rraWYYZ3vJiWF9rrTiiAwZ4GhDgXQOZrTJLb/J6kldPzSGA+ggv3I+oNx1QCDTDQa2EelyBn0QwnZL/kWzgQHye8WUfb44KKmSNmkjRDseBj9kvKCmXUxcJGdoQmD8dPMmcWbBpVi0GZjMHgWguFDKpLR0HHR3aKLsgGtiM+4L0AimnFqOwRuVOxIssTm5uNtEywxFX7k0JCDOrEEI4pmgUc9kNouk1b+wTGa537dL9cBQB4996jsSeceT5ogu4RrtzxrR772xJyLHBiCgJME7ILnJnCysL7vwi2hyzuHnLvYz45RtU2iU+5J/3tAbahD2Nh9wsYKoYJ9XiVlvk/raFJPSX9+r/6JajpQpWnFPWB0bf2SiSiGMlK4Q6NMNkqKgDVfXHUhQrrw0WemZExu32cM/XSDmOL1mmTcT8IbW/Vm4dBfcfQJMZwiALHnm3Irq3ubkhvnkU4v14neBfHfmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(39860400002)(346002)(366004)(83380400001)(31686004)(6506007)(36756003)(6486002)(478600001)(26005)(186003)(2616005)(6512007)(41300700001)(2906002)(31696002)(86362001)(54906003)(6916009)(4326008)(316002)(38100700002)(66476007)(66556008)(66946007)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1FHLzlmQ0p4RFlrUTV1VWlOMGxpOXl5NHNKdDZ0Wk1GL3VjNXp3WEhIM0xs?=
 =?utf-8?B?TjZXaGsvZXZOS1FmK0RMcHh3Z0w2ZGd3WmRsQ0hOa1hIdlFvL0hhVHRoUEdN?=
 =?utf-8?B?K2JOdk5sdmJPZUhma0h1RVhoWG1qRGNBb29PU01PT0xJT0ZRRWFVNnhRTGhR?=
 =?utf-8?B?UHVKdG8zUndGdm5Db2lFcFpESUExdU1uYWRTNnFDWlBWUDNuaVJlOFR3ZkEy?=
 =?utf-8?B?U2RxWVBJb0tQa0RuN0xseW14aDBXZ0JKQ2xXUUtxajlXUXVXUWh4WXNhaGhq?=
 =?utf-8?B?MkpzUUlGVGFCVFlmWWxIeklpTnAwdGxocnV6U3BYYnJiaFNGZ1pIM2JoZzVE?=
 =?utf-8?B?UDVCTEJOYnNDUkVVQkRhYXlja090YVhGSFVRLzRFbUkvemRYM3UyQnU3bVpp?=
 =?utf-8?B?dEVxYktoRjF2VEdhUzNONm5oSGgyZWZqOS80NTNSVFg3U05BQXhad2lGNTJN?=
 =?utf-8?B?N3cwVDd2a0kydmZ0aXh0QXA3WU5NMk1vWnYvcXhmVmQ0eGhBZkVpM3dDNHNM?=
 =?utf-8?B?a0VUTFlpNVdJT1FlU2FlMHJlVFU0amcxcDgzalNVQmF6L0oxYVJCbjRXZEc2?=
 =?utf-8?B?VVZpakh0M045a0NBbmttOTd5am83bnp5b1JyRElEeitSTTVJNlBJckFUbkVT?=
 =?utf-8?B?c3FTWUtYNUhrdUkvVFhsenE2RDg5aUdGb2ZNVFpxN2Voc21IL0UraGVjc0lj?=
 =?utf-8?B?UGZIZHE1R2xrTUhBcFloL0p0Tk42T2FhcHY0ckJHY0I5RndYRHJtaEZldTFC?=
 =?utf-8?B?SG81UTBoVXg3WHJKQTVKbktUYjY4andQRjNIQmt6dlp6V1BlMFVMYTRMbjl2?=
 =?utf-8?B?N1grNURLL3NJZFFtQldzZ2VXdzV3a1V5NnNMMXRtRkQ5N1doaUwzYzBYdEJS?=
 =?utf-8?B?KzhiR1JXdGJsWnlUd3dYV25JZXRUb1NVVUJhMldKRm5HT2VJQWNvc0JmWjR0?=
 =?utf-8?B?cS9ubG5CTXU1TzMveFpIL2FSWjZpOEl4Z2xQQnRNNXdmWWd0cTFleFFGUFU1?=
 =?utf-8?B?N28yR05mZi83SmhDdzNnMHExTXlrVnI2Zk5kdWdQSmRMZ1hXQlZzaFk3Q2Z6?=
 =?utf-8?B?TDhDSi8rWWdOWUFCS0x0cThuczRCUllFdGx6L2dGdld6N01nNUhCcXRqM1FE?=
 =?utf-8?B?MUVxTDVaT2ZBanc1ZTgyb0txeFpiOUQyMkFHSUZIYVNpUnNxRHZRVTJIbFlo?=
 =?utf-8?B?R2YyK3IzR0t1WnpVcWVOVFJZaFpQbm5vT0pKcGxIekp3b3FzbkhsMlp2MUlj?=
 =?utf-8?B?VSswKzE3UWswWFY1WlV4ODhEcjNBRW9CeHF0M0VNWDJiMlNxY2V2LzUrNmhw?=
 =?utf-8?B?anIvMUdUVGpUNmxSNzdKaXBtMDBXNUdQakZVNmVqVjR0NmVGMEJ4N2JKSDJt?=
 =?utf-8?B?NkdqTE16dWJRbHNRdE5QTmhYb0RoRXhaaTQ5UWw5YzVTU25aMTdNQ0RyVmlU?=
 =?utf-8?B?aVRUaytZNGZsaHNwM3V1NjYwdU5hRWw1azQwUmhPTzRPVEViT3kzVnJnaitJ?=
 =?utf-8?B?bi9xSE8zSDV0aHJoYUtDdWM3ZjRseko3K05BRXV6UTlnUkFlQ0dHSzBYZ2Zh?=
 =?utf-8?B?cGFPZWZ6QkNmY2NqSExPWjZOOXp0KzB1cWRqN1N5cUdOSTJPR3liVk9TWURL?=
 =?utf-8?B?RWlrOGxZOEpyNVhPS1ZBZlZNMkVHV25vVXVlbkVCNzlpc2JTVkJNeXFKTFMv?=
 =?utf-8?B?b0dRWFVoT2Q5cjY0a3BhdFI4aWttY3ZQd3dGR1Z6N1ozcnBaZ29YdGxHWCt4?=
 =?utf-8?B?akFrSzlaNi83QTcvSHYzVlpicmFZSnlYTGt1NlRsZVlKcFN6M0huaGhJc1NI?=
 =?utf-8?B?NXRWLzN2bERCZU14bUJ2azk3K25JYjc4TlM2RTIwL1RFcTN1NjQrTzAzbEVW?=
 =?utf-8?B?V04zYzc3d3dOOUVMRHVwMVZXaWxsYlRiY1lLekFMaTlzNHUzNFNPalVHK05o?=
 =?utf-8?B?UEdXOWpmRXBqa204bHJsdlVaTzRLeWM1R2hVOTNtWGtKYVFiMWdib051dmJE?=
 =?utf-8?B?dWNHaVhMcHpaMTdnQmdNUDBVTXdKc1hUaVFqWjFJbFR4Q2FVSnpzOUNFWmk4?=
 =?utf-8?B?R2dPbkJRV3RpNlFyWStTUXN5azRJMHBMZmtsZm1uQzBrU3BJMkNyTjhsQ1JL?=
 =?utf-8?Q?2QaL110ZMU0RM4Zj6Nhrgt0yA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6880204-5e4c-49e7-7585-08da5e83f11b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:43:20.6744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2l5S1V2py9wA3Enx4OlAGjgscuxKtgyiWXGYKe8uOidRvXDKGWm0HF8LqEIKnbbAcFF0POEtq+gNXA1NmtU6gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6065

From: Roger Pau Monné <roger.pau@citrix.com>

The loop in iommu_{,un}map() can be arbitrary large, and as such it
needs to handle preemption.  Introduce a new flag that signals whether
the function should do preemption checks, returning the number of pages
that have been processed in case a need for preemption was actually
found.

Note that the cleanup done in iommu_map() can now be incomplete if
preemption has happened, and hence callers would need to take care of
unmapping the whole range (ie: ranges already mapped by previously
preempted calls).  So far none of the callers care about having those
ranges unmapped, so error handling in arch_iommu_hwdom_init() can be
kept as-is.

Note that iommu_legacy_{un,}map() are left without preemption handling:
callers of those interfaces aren't going to modified to pass bigger
chunks, and hence the functions won't be modified as they are legacy and
uses should be replaced with iommu_{un,}map() instead if preemption is
required.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Integrate into series, with quite a few adjustments (beyond mere re-
    basing).

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -308,13 +308,13 @@ static unsigned int mapping_order(const
     return order;
 }
 
-int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
-              unsigned long page_count, unsigned int flags,
-              unsigned int *flush_flags)
+long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+               unsigned long page_count, unsigned int flags,
+               unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
-    unsigned int order;
+    unsigned int order, j = 0;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -329,6 +329,11 @@ int iommu_map(struct domain *d, dfn_t df
 
         order = mapping_order(hd, dfn, mfn, page_count - i);
 
+        if ( (flags & IOMMUF_preempt) &&
+             ((!(++j & 0xfff) && general_preempt_check()) ||
+              i > LONG_MAX - (1UL << order)) )
+            return i;
+
         rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
                         flags | IOMMUF_order(order), flush_flags);
 
@@ -341,7 +346,7 @@ int iommu_map(struct domain *d, dfn_t df
                    d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
 
         /* while statement to satisfy __must_check */
-        while ( iommu_unmap(d, dfn0, i, flush_flags) )
+        while ( iommu_unmap(d, dfn0, i, 0, flush_flags) )
             break;
 
         if ( !is_hardware_domain(d) )
@@ -365,7 +370,10 @@ int iommu_legacy_map(struct domain *d, d
                      unsigned long page_count, unsigned int flags)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
+    int rc;
+
+    ASSERT(!(flags & IOMMUF_preempt));
+    rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
@@ -373,25 +381,33 @@ int iommu_legacy_map(struct domain *d, d
     return rc;
 }
 
-int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
-                unsigned int *flush_flags)
+long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                 unsigned int flags, unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
-    unsigned int order;
+    unsigned int order, j = 0;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    ASSERT(!(flags & ~IOMMUF_preempt));
+
     for ( i = 0; i < page_count; i += 1UL << order )
     {
         dfn_t dfn = dfn_add(dfn0, i);
         int err;
 
         order = mapping_order(hd, dfn, _mfn(0), page_count - i);
+
+        if ( (flags & IOMMUF_preempt) &&
+             ((!(++j & 0xfff) && general_preempt_check()) ||
+              i > LONG_MAX - (1UL << order)) )
+            return i;
+
         err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
-                         order, flush_flags);
+                         flags | IOMMUF_order(order), flush_flags);
 
         if ( likely(!err) )
             continue;
@@ -425,7 +441,7 @@ int iommu_unmap(struct domain *d, dfn_t
 int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_count, &flush_flags);
+    int rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -124,14 +124,15 @@ void arch_iommu_check_autotranslated_hwd
 void arch_iommu_hwdom_init(struct domain *d);
 
 /*
- * The following flags are passed to map operations and passed by lookup
- * operations.
+ * The following flags are passed to map (applicable ones also to unmap)
+ * operations, while some are passed back by lookup operations.
  */
 #define IOMMUF_order(n)  ((n) & 0x3f)
 #define _IOMMUF_readable 6
 #define IOMMUF_readable  (1u<<_IOMMUF_readable)
 #define _IOMMUF_writable 7
 #define IOMMUF_writable  (1u<<_IOMMUF_writable)
+#define IOMMUF_preempt   (1u << 8)
 
 /*
  * flush_flags:
@@ -153,12 +154,18 @@ enum
 #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
 #define IOMMU_FLUSHF_all (1u << _IOMMU_FLUSHF_all)
 
-int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                           unsigned long page_count, unsigned int flags,
-                           unsigned int *flush_flags);
-int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
-                             unsigned long page_count,
-                             unsigned int *flush_flags);
+/*
+ * For both of these: Negative return values are error indicators. Zero
+ * indicates full successful completion of the request, while positive
+ * values indicate partial completion, which is possible only with
+ * IOMMUF_preempt passed in.
+ */
+long __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+                            unsigned long page_count, unsigned int flags,
+                            unsigned int *flush_flags);
+long __must_check iommu_unmap(struct domain *d, dfn_t dfn,
+                              unsigned long page_count, unsigned int flags,
+                              unsigned int *flush_flags);
 
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                                   unsigned long page_count,


