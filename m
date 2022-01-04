Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E1484049
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 11:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253160.434244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4hVe-0005vJ-Le; Tue, 04 Jan 2022 10:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253160.434244; Tue, 04 Jan 2022 10:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4hVe-0005tE-I0; Tue, 04 Jan 2022 10:57:42 +0000
Received: by outflank-mailman (input) for mailman id 253160;
 Tue, 04 Jan 2022 10:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4hVc-0005t7-WC
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 10:57:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21386a94-6d4d-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 11:57:38 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-rDHezk7XNAqEe7Z6L0Q-zQ-1; Tue, 04 Jan 2022 11:57:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 10:57:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 10:57:35 +0000
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
X-Inumbo-ID: 21386a94-6d4d-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641293858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LoA5SyaScT/msHw6SXGRTAvCTjtuPX45uUkGT+64aSA=;
	b=F9UOH/k6cnzMv5vk6zEpx0XfabP26+9NxocT7eKXc93oleqBg7/FVOqEhGFLNlOB7ywIVV
	kYfmaz2qK/abNaJSlgkbVBXi0qlolDVFL7paxhTOU7fnOmUwt3LlFkUZ+Ic863Ol/qzluj
	BBCyJVH6zgaVhf3oFUTiyOnduTgk+iA=
X-MC-Unique: rDHezk7XNAqEe7Z6L0Q-zQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5W8651EDRCskZmwfKbUyr7ApV2Txle+9qZhnp1iCS7mOnn+aI1eC2Nrh/rLDZ5+9kqzc4ug31SkdnCJf5LKkjveiyzofVa2BzmAB1USs0TtJVgeRM1l5WhlhC78cEMrtBOqSGm24qo4NuwrFeNHOs5swfu/+5fg9EUOS3cKjW7VjvGPSwDdFl5DJd82WIfGQ3rzTlPEXlfECIblxwRY8UKdOZYZ7y+oEWXbb2FGQL2lo9VETi2tH/xcx22qeh4wQltqDs9Ph3/eedmybVZhFl4oyvQaEM38LRUgU/45SzkUoPCOcv0WKdScIvQv6g0lVps2rXStL7dPPik9d5LZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoA5SyaScT/msHw6SXGRTAvCTjtuPX45uUkGT+64aSA=;
 b=SqB6t8N9nehWU5jLXBTbkgao6dYC+b+zu7JTP5Vu1nqwP6TDthGjkSyXBag1xTcdJ+voGzhJaSLDHaQoxBxe5jjmcQ/T2OAHPYy7IG+PRIbxZQZZSUHt3P+2u9OfNpoIrJsEFytdnTkoeTXP1hz5QN0bWE/1728zPEIllLAFF4zQpyTNA1TIVwP5ec7FXyUUdOwuaVi8+cfUmj/uueHf4jAbB7xPbvvmrsvPrFAaWsus8VF/LaOyc3XCmHLXvwsaBKQEG6LVJDgKMqghGxUuL37D6T8nNBpe08jTkQt9VW/YULK9lwi2dHxboXRjcwlbEtT9gUNVJ8XnIowwFTn7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
Date: Tue, 4 Jan 2022 11:57:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PoD: move increment of entry count
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Language: en-US
In-Reply-To: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0188.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc993f5d-d713-48b0-8eb0-08d9cf7103b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61766DBEE57E0548EC6185EEB34A9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8HkbE+8hR2XPwiiqDzedjVOvEUcjPnmpmyA38emaUKvcZzqAzjFor6I9hcJ5rc3F9bLOzX1qhddpvEzyb2RXQNQH2zQZXafpS0LAokYmsaExn0kTsZs6eTip4CZOPdAxtKAFZzKbcECpVgmmT88y3O6k7+/Df6hBYIBy3iaoYUGTy54WLReVLCh74xWW5HMgcnccjqRz1iH25NF8Kmt0MndcQDMi5ded9oA+8dU7L9hAgPMoIsx7tW7cu/89VVg+VtPVxIjIuxIgZbLlFxsGAiE4k4sjmH4SYc2FpzR/hd3U+ONmJ2nVAIAetNQ/kGj+zzjKbrUeC2v1kp9BxPYdtKPpSpZebIrpUz6BTsm2x6gdeQeSVWbisLfDyclqi4TV2fFYNTsOZhDAN4Lxmef6d+3cjdQb+tnkEe5nswTyqltIdXKa2+nphxtR3Wru8MHSDd1sbkhltrwaXTbKJfT/VDFf1z92zixc80AVPfsbin1X7/wbpGLR2O7XRUnXw4MHvoyeOD8a3p2nAMPl+3aSLspikOKgq9nQuNGnDDJqtkxQA70QtlY3Ik4BntHu40pnztjaUaWxDn39fsByFOOIXwAh52OhTXN98zhY/1mg9DKWD19Caj8RLLIChGoQ8iXhk0TkkAixWPH3Lw7sVVMXod5tUM15mSXBpaKd6fOrVCdUsiGD/J+gZ3xGFErqfb1hFksQAlgAsJi6mwcgLkqiDkoVYT9fFZ899wytJHSjvYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(26005)(186003)(54906003)(2616005)(38100700002)(508600001)(66476007)(4326008)(6506007)(316002)(6666004)(6512007)(66556008)(2906002)(31696002)(6486002)(8936002)(31686004)(5660300002)(6916009)(8676002)(83380400001)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmYrZm9nY01DMmk3MUNjUVl0Lzl2VzVJRmR2Q1ZMQ0d1S2dCeG9xSDh1U2pX?=
 =?utf-8?B?NXhYVURNMzhsZllUdmg3clJaYTVMMzU0TldHVS9iS1ZWcEl1RmdaeFNhLzNs?=
 =?utf-8?B?VU1WZnV4enhqK0xkWXRoUENKRXJyV2k1WXpEWDBJMzRtL1dtZW5zQUJrQ3lZ?=
 =?utf-8?B?SXo4WWxxTHZjaXRxdTBpcHhpcUp0cWZXNGFBRm94R1BMWFNhODZnSW5pdDZT?=
 =?utf-8?B?d3dDZFE3TkE4SHJYa0NEYnZIcEYyWEhiOWR5N1M1b250MHhhakVON3Joa1pJ?=
 =?utf-8?B?ekJhc2dhNXF1NnlrMDdINm1jQVlqYUUvemVobFkwNG42Rnl2UXA2Rk05WGFO?=
 =?utf-8?B?QnpKVng0bkxjblRvSGdqcEgvRFlWMkN1eWVQeFRGWS9EWkN1R0hWNzJoWTZX?=
 =?utf-8?B?Rmt1ejRMZ3h1anJ1S0RNME8xTFdqcDBmZm00Y3FNWkdhVUdLZ1VMUVk3NXR1?=
 =?utf-8?B?NHIzYXFyRWk4V1grMWV0SFlhdlFxZ1RyUXkxYW9jSXZocVh0MGM4S21jMENO?=
 =?utf-8?B?Y3Excm1lNlBGSkIzVTZNVkJtZ29hRXRVYUQxUnl5dFBsZHI2aXJZODB4VHJC?=
 =?utf-8?B?Y2s4d0pMc0NadXZMeVU3MGw3dG1PcjJTRmlvRlNyR3BKc0hmZFhJL0c1TTIy?=
 =?utf-8?B?RGlnRjdFSDVwcm4xeWw5NHhwandCU3pxQlVuR3oxUHJZQWRnRDFCWFd5ZHdq?=
 =?utf-8?B?NjZlSkdpTXA3TjkwL1pZV2xBNWRBVkN0b3ZlYmx4OHhFRTYwWmFoK1FNVDlv?=
 =?utf-8?B?NkZ2bWNVc3VqVDR6VmZsWmVMRG1uek9nT1dYcWtiUURvZG56c1BleVNEN1ll?=
 =?utf-8?B?MmJneFJWMFR6S2tnT29ISFNhNGlBdnpTWlJNZnR6N2diV2RMWUJPNDFRdnB2?=
 =?utf-8?B?bU8yS05iVXk5WVNqMmQ1NHRINjJEOVJUYlNtUnVrQnBBSWN5cEdTMjFkRXZw?=
 =?utf-8?B?SEFYV3JEa1FtaEdQRHpyUU9wNnZ1SUx1aGJQeGV4VEVPSGtsK0Nnd0YyeVpT?=
 =?utf-8?B?REJNS0ZmRU9hMW10VzRjdXJETENyUHFaWllFc015L0FCWll1M2NCMUJ6cndN?=
 =?utf-8?B?ZTJxYmNXYzNUVHh5ZHZGbWFRVnNqSnFkekJyaDlZMFVYakVOYjNEeU1CYWZI?=
 =?utf-8?B?bFdTdlBSZ09TZmp4bHJQNXBPUU1uN2NQUEdBdThId2dPNDMrVW1qQVhpOWE1?=
 =?utf-8?B?MjRMaXNQVkRVVnorcGdnM2FtTFk4UGNKRDR5T0c3Vnp5TzFtck9OZmNYRFY5?=
 =?utf-8?B?b3ZXS3dzdGoxeXE1UEV0bkkwd3Niemx6cmthQTRZemJiaUNKb3RFM0JOR2g2?=
 =?utf-8?B?a0htSGd5aWdzZ09MNWpZVFJDSkU4R0Y4WmdudTRhMWNXL1pwTEZYMm5iUG1M?=
 =?utf-8?B?MVpNcUhYcDhTV0RNamR2NGRuZ2MzbWIzZDN2eG9ramthUUpZNVRmYzk3dVpC?=
 =?utf-8?B?TnhmMzlWenVtSDlacFprU2RDZTJSdEJaemFuMkczUFlQRytUZTQrR1lvWURm?=
 =?utf-8?B?Wmozbk5kRzU0MEMwSTBpYUwzQ0hBbktvK2dtdmZDUjN4d2lGdGpMcFFOVitq?=
 =?utf-8?B?TFRkMlFITjZyKzNJRFR1cE1tbCt6T2J0ZkNaTDdacmZhcVJCTEtVN3p3SWg3?=
 =?utf-8?B?dk5nTEMyOTRDVDMwWkpjT3JaS0ZlSUpTdHBPZmFoOThpazdQVkdoYkpidGVY?=
 =?utf-8?B?OU1oNjlwSE44eGNGbkd4UTI1aTRtUDNJZ092T1ZmbFdiU0V6eGVnNnp2VVRm?=
 =?utf-8?B?SmZ3NDMyRVJhYWZPOTdrVWxmY3dnTU90OU96aFhaVm5BZTRENWI2eENibng4?=
 =?utf-8?B?K3FvTmoxRDFITmNUczhoZEdqR2I5TXI4Q3VXYitXNFVzRDNGN3BkQzhJTnJm?=
 =?utf-8?B?aDgxeU1xdk5NNEJ2M1JGYTd5R1EyNDZPK01UcWZ1U3g1eEtIRkprMzBlQ3c2?=
 =?utf-8?B?RFNVVmxiTlpaVEZOay9ta1lzYzEwWmIza2xXV3lzeWJ4MXQzclA2NDg2dXlm?=
 =?utf-8?B?UlR2c1Zacm5sLzNsR0RKektpelFFdGkyTDBaalZhb3hvS2FVTFpqK3BOUjBL?=
 =?utf-8?B?QnhkaElkWlQyRlBYSE85MGFQNkpuRW05NVVjY3hzbFowdjRjUUNpOWJkN1ZP?=
 =?utf-8?B?dmgrZU1oQ2M5OUM0MWtiTEJ3Z2xLYTFVZEREVllzeXFYeEo3UHcrdkFvZmtV?=
 =?utf-8?Q?6SSykMMaEOPNHaRUzrOhTck=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc993f5d-d713-48b0-8eb0-08d9cf7103b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 10:57:35.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQAYqaNnbSSV1zdmiCRP0IpguDboMZHxRqwpJRxV6Q1ytBOVI0dBzbVkgYH9dJBa5EAINy92MhXFkKAxcxCKmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

When not holding the PoD lock across the entire region covering P2M
update and stats update, the entry count should indicate too large a
value in preference to a too small one, to avoid functions bailing early
when they find the count is zero. Hence increments should happen ahead
of P2M updates, while decrements should happen only after. Deal with the
one place where this hasn't been the case yet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comments.
---
While it might be possible to hold the PoD lock over the entire
operation, I didn't want to chance introducing a lock order violation on
a perhaps rarely taken code path.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1342,19 +1342,22 @@ mark_populate_on_demand(struct domain *d
         }
     }
 
+    /*
+     * Without holding the PoD lock across the entire operation, bump the
+     * entry count up front assuming success of p2m_set_entry(), undoing the
+     * bump as necessary upon failure.  Bumping only upon success would risk
+     * code elsewhere observing entry count being zero despite there actually
+     * still being PoD entries.
+     */
+    pod_lock(p2m);
+    p2m->pod.entry_count += (1UL << order) - pod_count;
+    pod_unlock(p2m);
+
     /* Now, actually do the two-way mapping */
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
                        p2m_populate_on_demand, p2m->default_access);
     if ( rc == 0 )
-    {
-        pod_lock(p2m);
-        p2m->pod.entry_count += 1UL << order;
-        p2m->pod.entry_count -= pod_count;
-        BUG_ON(p2m->pod.entry_count < 0);
-        pod_unlock(p2m);
-
         ioreq_request_mapcache_invalidate(d);
-    }
     else if ( order )
     {
         /*
@@ -1366,6 +1369,14 @@ mark_populate_on_demand(struct domain *d
                d, gfn_l, order, rc);
         domain_crash(d);
     }
+    else if ( !pod_count )
+    {
+        /* Undo earlier increment; see comment above. */
+        pod_lock(p2m);
+        BUG_ON(!p2m->pod.entry_count);
+        --p2m->pod.entry_count;
+        pod_unlock(p2m);
+    }
 
 out:
     gfn_unlock(p2m, gfn, order);


