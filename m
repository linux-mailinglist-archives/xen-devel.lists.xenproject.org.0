Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08353F8513
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172849.315400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCK8-0005A7-1m; Thu, 26 Aug 2021 10:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172849.315400; Thu, 26 Aug 2021 10:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCK7-00056e-Ub; Thu, 26 Aug 2021 10:09:27 +0000
Received: by outflank-mailman (input) for mailman id 172849;
 Thu, 26 Aug 2021 10:09:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCK6-00056W-0O
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:09:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d194146-58da-4380-b5b1-112fa368217d;
 Thu, 26 Aug 2021 10:09:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-IRtJDmcwNnGe15IPRLYogg-1; Thu, 26 Aug 2021 12:09:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 10:09:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:09:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 10:09:19 +0000
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
X-Inumbo-ID: 3d194146-58da-4380-b5b1-112fa368217d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1sa8Fe77gt8qRj28nz+tzjOoJt1XN6A7BIFTYCnT5LA=;
	b=JMF7XCsfU5vGPnChflRmsvvFlKvuvLMCtrLT+Cb5vnzHmTvS2X8LXNby6umOHXL727fJ00
	eFOne+dx0Lobl6PEsn3R7g8pJxdim83VEaucKRCjpvgwwuXd2qV5VNIaHCiGcIHV56s0nC
	ZL1ZwPk/6uPIzqtvvqZxRTitGy6B2Mo=
X-MC-Unique: IRtJDmcwNnGe15IPRLYogg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilwdX3hHicpbD62xvWuXm0Vhs6gUuEe+e6jcRPGS9Txdv0L/NJVazWO/lK8dDINJXltn+CNFFnWcF3mykNzSZjmEtj4fwirrXWehslEBo55WanQ3Ew/Y/Nt+p76AHv6L/CkLX8qCfAclterHbTVTp5Iq+rR5mqn+eEtn3WxS5/Qf5H1qq6XcziXhFXD4xbM0BREL4P7jq1Au5PHIikBFGHlZAIT7rtWM2Db41Xzv8P+6decMPNJSKX3f0IjydWV+EYfC8wpKBDQFisMg1L0tG+8qN127K/OtrSJXjtzmpJWxB6vLExj2p4aoMd1nrUjfxai2gbkskqXC5gA0/l8Wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sa8Fe77gt8qRj28nz+tzjOoJt1XN6A7BIFTYCnT5LA=;
 b=UBEsFXrWkjO/lE5i0GPFTSM4Md6lrKJT9sfwVCCzwSiGIQhh8AIKFXzo/sKDKpz3atKRGnxAu4Ui45dtleUBo0yKucMav9m2X5rYlfc7aiJTH4/68BtPGgTRjA063W/ZhxHYd9spPNIzyYwHTb49dIAkAkAFfrQIVfFdNr6/Qy01n4Bcst854a9Gg/zov0pVYEtmDDivB3OlgFKM4qu07Vvywux2+5E/o8fA8tfhmREvOJ4JWjqRWedp12D/k+aaexVKyGBn2kZnmLMj/86+gkRav0WN2wLdn3682tWsPaL4X0Wfv//+XvxJj7TBkfOjN+ah0PUFcsdDOnJsrckaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
Date: Thu, 26 Aug 2021 12:09:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1dc890e-f89a-4785-c303-08d9687991f7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166840D7C2287CE771EA016B3C79@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a2/I/8gRmJ3LLkFNLasY0ZrTdBmr05gJo1IMplv0vFHdprN6T3bQYlZDyhzgVRcRDmyYb+fYobnGrxyJNlK3fI48fGyTH156d2o4HnLOjOmwQG1O+35Hzr+LB/lcpxNZPPDX4VUDZRjCKdn8dr/qbMk/CkBRwB33dOceLLF4h+pB03vqOH2/MBk7jIyB48no4JEj8RU5uZlRUAemY3tfJvqypYFlru7dJsWUCkZJJGYmvQThZbBARPLIYCYNcXyv5QLP1s6m0KYEaOOv2zfTltuZ1Qvv+I5B+8TBSNGOdmdEN2jWjKEFVv4btq39kDt8Qss/bf5FJ0lMnhoY8mRv5QgxHhO7rMi50fvNoS+6AaZuYJSX0LB/ythMneZZkHMzbwt9I+95B22s7fbU5P7S1+oWVJpFt+qquH1mYNIIb7ybXqyFwa3PV/JWH2q3z9pUb8qZ8y1NqJebZcDVA1MoonJH24kQV5UKaKHqBwv6qe7pxpaxFzVjrImw2rhnOmSZtJh3ZEi6z3QcsOae2CYabJpzHcGeMu3PrOT9qfKEPKZaKg3zeDTJppcnYFaQDDckTMJVWZQQujUNCCBptpEsZ/9qkiixL1ziq8qe3Ol3+mMbq7u661zyeeKoTu7fuOxkTJ2ufym6ffwJjwTpeI4frAP5z+v92qNcc45tHV//DaUlQoo5sOIIkxDjAMLZOLCfFdfyZtpgkZz7firHBbyqcf0HbjPh/aQo4xcQ6OgJIDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(396003)(376002)(136003)(186003)(26005)(38100700002)(31696002)(16576012)(316002)(66946007)(66556008)(66476007)(54906003)(86362001)(8676002)(6916009)(2906002)(4326008)(83380400001)(5660300002)(478600001)(31686004)(956004)(2616005)(36756003)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXFaTGczTGZtRm9MbTJONENhT3hsQ0RUUlE2Z2NlNUF5eHgva05UYmhLcTU3?=
 =?utf-8?B?WmRwb204M3N1SVUvc1BHYzhhNFBOSjA1cHpDZGdmWHhiWmNPSVZLYmd1UG93?=
 =?utf-8?B?VU10WVF1VlUwOTZzdkI1YUJKSEJhS05CeDFhUHBHWUhBam1pdkY4WXRXK1Zt?=
 =?utf-8?B?TmZyU1RodGh4TVY5RUk5N1J2bmJWak03RmRPOUdWUEZRZGw4eGdvdGx4Q0FF?=
 =?utf-8?B?SGt0Lzg5VktJVm42NHovYTd1S1hIWVhRRWlKd1Y5ai9YNG5qbjNXbHB4cU1W?=
 =?utf-8?B?TmNzUTlJeXZOVWlOcXg1czQrd29abm1PeEhwT0pnTENnYmN4TWhYSlFhSUk5?=
 =?utf-8?B?Nll5bGJTSE9FTUlidW4yak8zbjRyUnlKS0NIUmd0YnN3TTA4dlJWTkVaNFd5?=
 =?utf-8?B?Y01XTlU0RndZZEdENGZXZE9uZEZZa1ptMXNlM3hPOTNrNCsyZGZNdWswRW00?=
 =?utf-8?B?REFCWGxyYWIraENxaCs5Ky8rV2ZkeWhZTk9pdUZ5andiNWtIL2Y3cFN3WXhv?=
 =?utf-8?B?eGFGaTUxa25GT0pKVXpSM3F2Z2tUdGkvRG1uZXNVN3hWNjdIbWVndkhCWnhW?=
 =?utf-8?B?YVVmYW5qdEIrMjZXVGRQTStVZmZqUFBmL2xwZmU2Vno4VFhlZXA1Q2lGaUVK?=
 =?utf-8?B?Nk1CSExMajRRTVRuTTRkQmZuQXVLejhPTzkzQ1VSaERnYTY4RkljbnZ5aWho?=
 =?utf-8?B?M3R6cUQ2ajBoeTA1ZkJWSlJpZnpiZjJ3OTl6Q2FTT3N2a2RkUGdCYnZzUzNR?=
 =?utf-8?B?dFJpUWRSMElpRkxvR3ZNejhsSWpZN2NTdnA4N09ycnV4WGFBS3BVZ05hTU40?=
 =?utf-8?B?ZVlGZnJCZ1hpNTNVZVh1dWxRY1RyZFJZbnFsTWprb096UnE3YVpUeFU0R082?=
 =?utf-8?B?WHFzVzlNYWpCVVlEYjhUcUFORTkzWUlremZuTEd3U1h1M3BQM3dhZWt2K3A1?=
 =?utf-8?B?TXl5TjI0Nythby9mWFRQLzd3UXB3UGxOdWFCanowUUx1Q1pKaGo2Nm04MTA3?=
 =?utf-8?B?SGNvZ0o5d3N5a3U2dHRJOGJoaFhNR2pkclhoQ2FHMkE2ZWZLWW5xWlhZRUVs?=
 =?utf-8?B?UU9XSk9XaHBVc1g2R0J6bVpaY0ZENXE2SkZ6NVZSZHZFTXc3eDY2YktnTUhH?=
 =?utf-8?B?YXhYUHl2UElBOWFZVjRCcVN1NHoyWWNCZ0Znd256MDU1RVhJZFZnZFFLdk1m?=
 =?utf-8?B?b3NpalIwcE1PY1FqWjNqM2lub1RKa3RNNHV0ZHBtZEs4dlBFWDhiWnBWejVl?=
 =?utf-8?B?VVFMSUtjdGpBY01VWHRxS0lTRWNKc0g5SmYrVmMxNXJVcE1WYkFOV2tsWWEz?=
 =?utf-8?B?R2hlVU10OVlQYXN3dEhGem41cTREY2w3V2pUeWtucUZnZHVRamM0ZUlENnZq?=
 =?utf-8?B?MHJoc3B3OXdzQ0tlbjM0V0ZkWktjUTQrQ3I1ZXp2bW1WakVDeTRGdjR0Z0hE?=
 =?utf-8?B?Z3dnb3RDV012dE9GbzR5bFB4QXlON2Mvay9OUkJnMSsvY3F0cENacFJqQkFK?=
 =?utf-8?B?bHNwMThyVUpaSGp3M3NkQVJLN0xxTi9RNVdyYzUrNW9NNVVjaUtnUXpmeXc1?=
 =?utf-8?B?dS9Hak81MXRqTDlQajdZb3pBRWQ4a1FKckhvQkxnbnQ5L3lKZlBsM0t5MEZn?=
 =?utf-8?B?bHMyd2x2UEhYWkJlQkQ1QWNLN3Y4TW5jdngvRjhDbVdJSUQzVHBLa1VrRDF5?=
 =?utf-8?B?Z3ZrZFp3a2NqNU9iUkhib3REWDhYb0xtSkxOVGF6c2w1UUxlSmJKc1JVa1J3?=
 =?utf-8?Q?bxOl2YEd2DC9gy9n74XujsqWmN2JX9oSRbLYleS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dc890e-f89a-4785-c303-08d9687991f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:09:19.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5aupfQYG47UryqF5XgpMrbtPv4sEeV1GgzEMY+9ouW7nud45d6BwqW53qdzdjZvzKr9ey4P3ZDdyxVh+EDhtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

By default all guests are permitted to have up to 1024 maptrack frames,
which on 64-bit means an 8k frame table. Yet except for driver domains
guests normally don't make use of grant mappings. Defer allocating the
table until a map track handle is first requested.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I continue to be unconvinced that it is a good idea to allow all DomU-s
1024 maptrack frames by default. While I'm still of the opinion that a
hypervisor enforced upper bound is okay, I question this upper bound
also getting used as the default value - this is perhaps okay for Dom0,
but not elsewhere.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -633,6 +633,34 @@ get_maptrack_handle(
     if ( likely(handle != INVALID_MAPTRACK_HANDLE) )
         return handle;
 
+    if ( unlikely(!read_atomic(&lgt->maptrack)) )
+    {
+        struct grant_mapping **maptrack = NULL;
+
+        if ( lgt->max_maptrack_frames )
+            maptrack = vzalloc(lgt->max_maptrack_frames * sizeof(*maptrack));
+
+        spin_lock(&lgt->maptrack_lock);
+
+        if ( !lgt->maptrack )
+        {
+            if ( !maptrack )
+            {
+                spin_unlock(&lgt->maptrack_lock);
+                return INVALID_MAPTRACK_HANDLE;
+            }
+
+            write_atomic(&lgt->maptrack, maptrack);
+            maptrack = NULL;
+
+            radix_tree_init(&lgt->maptrack_tree);
+        }
+
+        spin_unlock(&lgt->maptrack_lock);
+
+        vfree(maptrack);
+    }
+
     spin_lock(&lgt->maptrack_lock);
 
     /*
@@ -1955,16 +1983,6 @@ int grant_table_init(struct domain *d, i
     if ( gt->active == NULL )
         goto out;
 
-    /* Tracking of mapped foreign frames table */
-    if ( gt->max_maptrack_frames )
-    {
-        gt->maptrack = vzalloc(gt->max_maptrack_frames * sizeof(*gt->maptrack));
-        if ( gt->maptrack == NULL )
-            goto out;
-
-        radix_tree_init(&gt->maptrack_tree);
-    }
-
     /* Shared grant table. */
     gt->shared_raw = xzalloc_array(void *, gt->max_grant_frames);
     if ( gt->shared_raw == NULL )


