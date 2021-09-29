Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956E41C54C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199068.352897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZOt-0000Iq-O4; Wed, 29 Sep 2021 13:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199068.352897; Wed, 29 Sep 2021 13:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZOt-0000Ff-Jo; Wed, 29 Sep 2021 13:13:31 +0000
Received: by outflank-mailman (input) for mailman id 199068;
 Wed, 29 Sep 2021 13:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZOs-0000FX-3a
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:13:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 555b93f5-22d5-4a13-a4b9-60bd8575a494;
 Wed, 29 Sep 2021 13:13:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-ZXZ70dRTNBqTnbNPCsaFTw-1; Wed, 29 Sep 2021 15:13:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 13:13:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:13:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0094.eurprd04.prod.outlook.com (2603:10a6:20b:31e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:13:25 +0000
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
X-Inumbo-ID: 555b93f5-22d5-4a13-a4b9-60bd8575a494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8riSR7WaBkT+h9mazx+moSRxeE0eWzN0eTXIGip8o4=;
	b=eIG2E56kxFd1N8jEN00fltlinortw/dCKUW2ECpVy8AcT2ruVnsyEXqs7PM4uenOrhA+Mg
	8YtJ+En5P3E8VoSzwSgKkWY+bvge+KWxH7ZRotEcnwsIA6oXoAgb4oGMA6sli5JzdSqQC2
	RQ65fjEnTZywzduF9pSCcP+x24d9el4=
X-MC-Unique: ZXZ70dRTNBqTnbNPCsaFTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fW7nLgIeU3yeeIdJ7tE9Neir+vYLBsKSxsSDUYI8hIhg2wgojB0uXfLF1gJW1NArR80ZBwNlJ5A1zM1hbwRyo2i8ka0wOMkoHI9JzcNqEMmyAi/kAMioV6WJeM+bFRtFt1hl3BwFsyEyOeNcUq0n7U/NlPDJmDibiuHUARR9aVP5ACNvNuWQxJFOT3wUNplXOIjwYQV0v5uC+ozGnL3lVugffchRA66/5wSnLmUqaTyB5RKTXv4SYt6dmYuwQ6SFTU64be1SXJ2BHPVTKTXV93Q8gyQKtwH147+PC+lhsBPUFyB+y4XPfofdzmXNz/QRQFFLZJix9ZlOsrU9YxlZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=K8riSR7WaBkT+h9mazx+moSRxeE0eWzN0eTXIGip8o4=;
 b=CZLJkZGrUrGUA7F0b4tN8oglObcB+ep+pphNA8ICHT7E5JbUGr+ZvolYTVaIVhqf2I+UcPMy2USGRGk1Dn1FjHTu1JWZfsVhgh8EJOeHApKz2wHdrEifCpacwL/prV8WbVQfDs7LdCJvCarA9sJLgQFkd10fnevHBO4EO/z9WAICRh/CJn+fcPrCJ/H+AuIa4pj9voTGTSfw47dlKj0apkkeO90nYq9sDugLPdTttRGfjyFmh6cvPKxUXchmtMesoTXLkD4z+w71Pt4lhkWTZdnvuk691q0EDa2VqivS4dtszccgSmoVqrs40b3k0JjGuVkCsmdpX51IaiZHrt9pUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v4 1/6] x86/PVH: improve Dom0 memory size calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Message-ID: <4684f314-2c4e-f662-bd4e-132be001da9e@suse.com>
Date: Wed, 29 Sep 2021 15:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2aa6dc84-7f8a-4ca5-997c-08d9834aebe9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435289E55FE18BC8715FF693B3A99@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EVJM8OMEARLRE00bSES6mAfvXvn1lYwUhwYQwIsvfhBLyL25Gr/TjnpAW+XqrS+2im+co2XJZG4POspn9Ly5RDzf6cXh8KJd354nhQO1W+zemsAebmkjRWaGf2+W2Qc8wyKw/024+XSbZWQJ+hkE6nCn+53bCkHhFN3DSPkdl862mGUxMG/fbZfL0zRHOiAtD+DBQ8g+7f3+FrKUr7em5j3S/wtwZXiRI7ues79YjA+hBrqGjDaE9+UMYwexzoNVpDGcYXjE73GWCc9MwbjvNql9H0gia+GioZw4agzdsdmaw1aIqLy5/FxubNjN5Mhbb2gx5f4qFRBzLdM/wEg+jjlA2CMw5H+oQqXee4sRGbmtV07ULDzvjh6mCy/yIgJZB4rPb7WEjj2OiY9QigdluOjTGObk4wGC5+Z4wC9ooquBTE8X6GBKC8hC5XeW4sWEyg7hivezQCywCal+gZ92IaHHXk7PmZta4Aeikee/WgIGtSYrBRyObiCOSqUFgOHbOpM4Dxc1K7A6hLQLlcyUPfyELgQRSFRKvkML1nMwTZ0alJw9JeUClnPly8H+Q7wzGZSayDPIlN5XP037W30H7p3bUO/U8XT9mC5SPGQCV2n+jmFvToY8oiAZIK5H3Xb12gnlfp9kG7LZmuqzzXqYMJYGAQghhIICpK3/RBl2NY0dfRNEoe7/J8WZgBfmDRZh5AMkaiX0fr7BBO3GKx1oaqMv1l3DehjxtE0DXJhGGoxMYVfOkVpLv+Fk4y3bJ1pTOU/vuTy/YzXgoM225LEDMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(6916009)(5660300002)(38100700002)(54906003)(8676002)(956004)(8936002)(186003)(26005)(31696002)(316002)(86362001)(66946007)(31686004)(4326008)(2906002)(36756003)(16576012)(66476007)(66556008)(508600001)(6486002)(25903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJ2S3VITXVZcG9DNnhVTkNnaE9Ka2p1VjB2cy96d0h5dldDb1F1TVg3Z1Z2?=
 =?utf-8?B?NDlCT2JYMmVPS3lPMCtQdHVQYWhtWG1WdHBXSEw4NXUvRjZkaDZTR3RPcWp5?=
 =?utf-8?B?czhramhTaUdNZi9zOWxER3Rxc2xVTE9DREpsRXRNRDdVY3dGRkJmVlpHbmhz?=
 =?utf-8?B?QmJ4N2FrUnFxcit1a04yUTdnOXVxeWtJdURCNncvYzcweklEa2l0VjZMQ2ZM?=
 =?utf-8?B?ekRaYmRFcHN4bllVRllpMG5VNTV3Wjc5NjdpVFdFbEFmeW5jNlNMR3FjRE5n?=
 =?utf-8?B?cmtjcDZGc09IQlpwcTFJZGI5Q1Y4cnhQNXN5SmZKUXBwSFZDU2FubDlGVDhT?=
 =?utf-8?B?bGNscDJlaFdEdEhPdlpkNmxlZlJzZXA2M050WGVxdFI1VGZpZExjMlBoNTYw?=
 =?utf-8?B?YmR1VWFqSmdWRG4ranQ0bDc2eGs5WHIwZ0gzNDVrTWY5TlFWbkpYbzNzeU1X?=
 =?utf-8?B?VitOZVFwWkxDSEdwa29iQUMzSE5wdkFHMjc0eVM4clR1a1c0dmRpU2hOZ2p5?=
 =?utf-8?B?alVWKzUvY0w0dWM4dkNZZTZQYm5SbnZNeUdwNlAzV1UrbTJJL2cwNXpQdnlz?=
 =?utf-8?B?TEt1SU55c0JLLzVVTXJ4RzNvYWNrQUNaSWVINUJXRyt2T0g3TXAyMHI1Ly9G?=
 =?utf-8?B?NVVLQVV2MG1XWDB4Sm0za3duQWVnODRWdmNNTlh5c0xVUmpKNitzaWZ0UmdC?=
 =?utf-8?B?RmNpZnRBOHZBVENJRHR1U1crOHBzc3FEaWh4YmVzc3NUUE1EUDNJOWpLZVV6?=
 =?utf-8?B?UDd5a04yaklZSHFNYlYwRkZMWEI2cjRmOWNjUkRHV3F6UHEvMHZSV2ZEeFF3?=
 =?utf-8?B?UlFMTW8zYmRNMitHcWFjd0hrTEtDbHYvZTk4disxSnZwY29zOTZtQlAzVmJU?=
 =?utf-8?B?dnZhd2F4WXJvckl4T2RrWlZhczFHV1EvdTB5Z2tuckNpRGorOXAxektUeTg0?=
 =?utf-8?B?K20vVXhHbGNVTEF0REIwSFlRa3ZPNjlCdzYzYzU3MjcvU05YVFNOWWN5NEU2?=
 =?utf-8?B?dCtFTS9HWFEzSUZIR0l4M1FwbGs1RlpJRjZXcS8ydytRdElXbGI2dS9GZkVF?=
 =?utf-8?B?dkN3ZnlkVXZXVUFBRjFrWGlyVUMwdDFBTnMrWmZMUHRnclA3S2IxQjdEM0JH?=
 =?utf-8?B?eFVGZ1BuUHJtRFdsMDJ0QWxXT3lXdlhnNWhpc0p1QTJlNGNXWWxEL01Cd3da?=
 =?utf-8?B?Ni9wSlRhdVdud0F3QkVrSjdkN1VDM0EveUp5VWRiUmsyRks0UFhsTkgyVE4y?=
 =?utf-8?B?eGJMak9KalJzUG81cjR5VXhOQVdOQTlXcjFsOFpMVTZkZXgzM3YwWFJER1BT?=
 =?utf-8?B?T3p1cnhkS3gya2w4enkvUThwcGZBS0N2V2t1dzJENXkwZ3RvM1FNbzVpc2k2?=
 =?utf-8?B?WmU2bk9WUlR1ZmxJemszYkJ2UzF3MzdwRFpQQ3UydGZxL0FqRUdYRGwzcW9v?=
 =?utf-8?B?bUFZck5Fd1ViT05Kanh2NW85eXJDdjQ1VS92NjI4Q0tiS3dzQWdFeGJkVlBU?=
 =?utf-8?B?b21zbHErWEhycU9qaDhCQUFQLzFJbHBkZSs0MTFtVEhqQVhvWW9LN3hXVk9T?=
 =?utf-8?B?TFI4MTVMWmZ1ZU1qajFnR01CMHRCWVRDcDBGV2ptSnJHQkFUK2piU1hEZElF?=
 =?utf-8?B?RXlGcUFyQjlHcHBwVlFqNWtwenMwYzhHNXNPek80TzdZZWFZRTZtcUgyVUV3?=
 =?utf-8?B?SmNQZlIwd2c5VVVWZ0FRWUt5VTBqR1NveGFFbnFodXA2VWpBbVgzSjJLVzZH?=
 =?utf-8?Q?KI0MoQkEIw9I61SQRtEJxMuJILiTa8S+UT+MNpS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa6dc84-7f8a-4ca5-997c-08d9834aebe9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:13:25.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6ZTRnhIRCxP4aRn5naJvXYlmpR7WVURBaOasgnJGSiQQeFG5JQEmRINkP0x+hIUh0FFz/SZ/BAGl1PW2OxqqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

Assuming that the accounting for IOMMU page tables will also take care
of the P2M needs was wrong: dom0_paging_pages() can determine a far
higher value, high enough for the system to run out of memory while
setting up Dom0. Hence in the case of shared page tables the larger of
the two values needs to be used (without shared page tables the sum of
both continues to be applicable).

To not further complicate the logic, eliminate the up-to-2-iteration
loop in favor of doing a few calculations twice (before and after
calling dom0_paging_pages()). While this will lead to slightly too high
a value in "cpu_pages", it is deemed better to account a few too many
than a few too little.

Also uniformly use paging_mode_enabled(), not is_hvm_domain().

While there also account for two further aspects in the PV case: With
"iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
none need accounting for. And if shadow mode is to be enabled, setting
aside a suitable amount for the P2M pool to get populated is also
necessary (i.e. similar to the non-shared-page-tables case of PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder whether this isn't enough to drop the "PVH dom0 without
dom0_mem" warning.

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -318,8 +318,7 @@ unsigned long __init dom0_compute_nr_pag
     struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
 {
     nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages;
-    bool need_paging;
+    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
 
     /* The ordering of operands is to work around a clang5 issue. */
     if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
@@ -337,53 +336,65 @@ unsigned long __init dom0_compute_nr_pag
         avail -= d->max_vcpus - 1;
 
     /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) )
+    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
     {
         unsigned int s;
 
         for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            avail -= max_pdx >> s;
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
+    }
+
+    nr_pages = get_memsize(&dom0_size, avail);
+
+    /*
+     * If allocation isn't specified, reserve 1/16th of available memory for
+     * things like DMA buffers. This reservation is clamped to a maximum of
+     * 128MB.
+     */
+    if ( !nr_pages )
+    {
+        nr_pages = avail - (pv_shim ? pv_shim_mem(avail)
+                            : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
+        if ( paging_mode_enabled(d) )
+            /*
+             * Temporary workaround message until internal (paging) memory
+             * accounting required to build a pvh dom0 is improved.
+             */
+            printk("WARNING: PVH dom0 without dom0_mem set is still unstable. "
+                   "If you get crashes during boot, try adding a dom0_mem parameter\n");
     }
 
-    need_paging = is_hvm_domain(d) &&
-        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
-    for ( ; ; need_paging = false )
+    if ( paging_mode_enabled(d) || opt_dom0_shadow )
     {
-        nr_pages = get_memsize(&dom0_size, avail);
-        min_pages = get_memsize(&dom0_min_size, avail);
-        max_pages = get_memsize(&dom0_max_size, avail);
+        unsigned long cpu_pages;
 
         /*
-         * If allocation isn't specified, reserve 1/16th of available memory
-         * for things like DMA buffers. This reservation is clamped to a
-         * maximum of 128MB.
+         * Clamp according to min/max limits and available memory
+         * (preliminary).
          */
-        if ( !nr_pages )
-        {
-            nr_pages = avail - (pv_shim ? pv_shim_mem(avail)
-                                 : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
-            if ( is_hvm_domain(d) && !need_paging )
-                /*
-                 * Temporary workaround message until internal (paging) memory
-                 * accounting required to build a pvh dom0 is improved.
-                 */
-                printk("WARNING: PVH dom0 without dom0_mem set is still unstable. "
-                       "If you get crashes during boot, try adding a dom0_mem parameter\n");
-        }
-
-
-        /* Clamp according to min/max limits and available memory. */
-        nr_pages = max(nr_pages, min_pages);
-        nr_pages = min(nr_pages, max_pages);
+        nr_pages = max(nr_pages, get_memsize(&dom0_min_size, avail));
+        nr_pages = min(nr_pages, get_memsize(&dom0_max_size, avail));
         nr_pages = min(nr_pages, avail);
 
-        if ( !need_paging )
-            break;
+        cpu_pages = dom0_paging_pages(d, nr_pages);
 
-        /* Reserve memory for shadow or HAP. */
-        avail -= dom0_paging_pages(d, nr_pages);
+        if ( !iommu_use_hap_pt(d) )
+            avail -= cpu_pages;
+        else if ( cpu_pages > iommu_pages )
+            avail -= cpu_pages - iommu_pages;
     }
 
+    nr_pages = get_memsize(&dom0_size, avail);
+    min_pages = get_memsize(&dom0_min_size, avail);
+    max_pages = get_memsize(&dom0_max_size, avail);
+
+    /* Clamp according to min/max limits and available memory (final). */
+    nr_pages = max(nr_pages, min_pages);
+    nr_pages = min(nr_pages, max_pages);
+    nr_pages = min(nr_pages, avail);
+
     if ( is_pv_domain(d) &&
          (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
          (!memsize_gt_zero(&dom0_min_size) || (nr_pages > min_pages)) )


