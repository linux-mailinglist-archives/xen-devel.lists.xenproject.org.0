Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5FE4C1805
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277493.474018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu4u-0004Tq-Od; Wed, 23 Feb 2022 16:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277493.474018; Wed, 23 Feb 2022 16:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu4u-0004R6-KP; Wed, 23 Feb 2022 16:01:20 +0000
Received: by outflank-mailman (input) for mailman id 277493;
 Wed, 23 Feb 2022 16:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu4s-0004Fn-MP
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:01:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b427a3-94c1-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:01:17 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-x1nm9-4WNM6dlw1HnPAvaA-2; Wed, 23 Feb 2022 17:01:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 16:01:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:01:14 +0000
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
X-Inumbo-ID: d5b427a3-94c1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rZGfRwylNtAPsQ5UVyxgV9uPoIoLBQeDGzPZv56WOI=;
	b=MeY32wDFRHRbuA39k8rYQBh8XSVRkiUulFX+SVYoFi4FAK0WRxww85qqpmTbjZW8D7nq9D
	heuR+vsrkBckGP14M+myhklE9BlkL0HFHUs5BfKITseBGDoKnjHi44mawyyRgl9k+0p9eN
	2WJghh/B8/rzhOjqJQ3cwr8kCdKSBMQ=
X-MC-Unique: x1nm9-4WNM6dlw1HnPAvaA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcVBFhziv4YjjpxvCkhrDnq3RhXBZAk1bgPBcsRv8+8iZphoNkeSKfkB+owjdb8Pz3CAIVNUQIFlRRx1IiVTVK/aPgz4qMhFMjD/ZqcjmGe02CU0YYe4wwtNoBtQMA6So3Pf/vatwWageX/4q3I52a1nrGhvVhu/yJjwIVkMKSf2gHd10ftvKHZwsJ08yoFzWaSsl09ySwNbb2whk0Vz5g2GkTYBGw8aCeXvhFhqChgBa5CGaz8UUYAhMvpIv7327MP9QHpwactc6a/PtN7zz84yJALZoy8NqRcfUjZyUQ4f/OVDRGbObUY70GheAS3256/t/P060LqWEpVUASQrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rZGfRwylNtAPsQ5UVyxgV9uPoIoLBQeDGzPZv56WOI=;
 b=lqWnLKiXzqTim2tsz0fMe/9N4JM1Atmz/3RZXaJF7EIv6Ov8q6bcWuaxX9f4uL/GixgdNHpa5sYmWPUPgcvJa5ITlcOvt3B09AXvbscJjN8ky91xR072Q8QdgvsXRGLPX03WRNIdVeKuM7hadoeC337xbKcf6FhvpkISzVJ7Bckorxc+zEeaqfS6YTT4qpJU6KnpXqJU4RH05KFilHXGo6mRpSIHFmhp8ZnOhfItHckCfVqmdys7G3B/mSXxgjyebiSNh3NtvZxnBbwU90Gq/0yWiI3AhoOh4I6ISYvlvm7yNtilCgtsco87EUCok2DjIk4dyfQCAvlPQukWQI8y6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <556f793f-e4c2-8f05-44e9-edf8b300777d@suse.com>
Date: Wed, 23 Feb 2022 17:01:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 06/14] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0251.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f68c61e-8e29-42fe-57d2-08d9f6e5b7db
X-MS-TrafficTypeDiagnostic: DU2PR04MB9179:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB9179E8893B15A8C83935E094B33C9@DU2PR04MB9179.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2MMwojvcXXA7wozS4kgd12WMgQ0MUCZA2JXvAvEkD6Aei2DzIl3CxhRiIFiPWycirlBaV8LRzR9Ei1WwNQCJweKQ4L38pwaKvD4LP3GIOPHsqHQPhD29X4qH4OSjncSAGPNmT66lMeULN5dOZWoHByzsaM23B6fRoYUrzQXy6GW3Jt2PVRMIB1/8iVimKgd6F5qMRx4piGE8mdJOK5SQbNAK+BWV1Kbo1vRGquilirjvSMU9yRK4jnCxkchf9jYY2UaXAaPog1v73H659Gdjgy72KQNDq+T/ZhE93kGDXEOdw7ezlE1eRrJmHIMrkiP8eAG4JtT4e42frHhlMQ9RIqanvue2gcAvReSnXnLe9xJ5hzW152DBH1t/W6Y+zNG/GfcU1meB7BTDFDci8cQBFaP4achkSfsziUhRF7Ck9iUjSp72JbKKr5ncaHl4Ehg+jOOzGi5hnqbi8M5uUg3OBm46gDi0v9+J7eUOI2cio2lDAuqkeRY+Ot0lFCQbJiWAzDuDsgdgPLU20Kpo0AYLXK05j4xA8JAnuPinwuROZmGqvsuk8AZY6s09UDlGJY/XrynSlipxLb6cRZIH01+1euop1SzbSo5ycC2lMCM0DWDZLVi4viELtCScX1+kihLbAKbaQxbEVl4AuMapmGWT0w3lS2iMXghztmDP+hnf5t4ELXbKLHUcTbF7ybdtBTRdhLuv7kZDdTgOuDBkpRhnDmJcbVxa/EkbWqDGlzEowruE8OPILmhey+0RvKMlYAyfoN+URtucBW76MXBi7jH5T8ceBKSUu1smFpoRErjA1/1eEe93PSJAN8MEKPD9KQ2r4De2cCV8mkXEWICKR6R5CQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(66476007)(66556008)(31696002)(6512007)(8676002)(66946007)(54906003)(4326008)(38100700002)(6916009)(316002)(186003)(508600001)(83380400001)(31686004)(6486002)(6506007)(8936002)(26005)(2906002)(2616005)(5660300002)(36756003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkU1TWYyem80WmtzeTdDS21lamFjSXNGK0VQQW5tenpOMEdDRUdid0FPZ29L?=
 =?utf-8?B?Rkl5eURzTDdWeitJNXc3VGxaWE5JNlN4L0puZjErdkxuWlV2S2dxVkkzL3V4?=
 =?utf-8?B?MWNLSnNRODVackROT1VlSTRnOHUybGlzaDVYQ0d6N09DY2ROZUFEQkttampQ?=
 =?utf-8?B?U2NMNyttcmJFQy9wQ0tSVThyMmNlbTczSDdteGNHY3BJSnd0UGhjdCtNbUlV?=
 =?utf-8?B?VDlIYmNJWXJJK1FPUUJITTRqcExVTTRsc1N1SmNyTE1KVG84c3JHc1VqWi9V?=
 =?utf-8?B?aDhSbDJ0ZHVlT3JJVVVyalVtN3psS3oxWE5iVFEyQVBlVkJMQjdGbUEweW5H?=
 =?utf-8?B?UGxJUUdxSUJtL3lFTTVnOVdWSnlza1RXOGwyN25VVi9QQThQRGpmQ1ZaWkpi?=
 =?utf-8?B?NTA4ak5xTlo1SUxJVWhYNmorR2NpOTB0ZU1WOTNubXhSbENiZC8xdjFGMk9X?=
 =?utf-8?B?VVVnakdVZmd4dDc4VDYwMFMzdVQwWmdyTGxmSUhIeE9VWkw3eVlGejdJeXpM?=
 =?utf-8?B?Nm5pOVU1NHVoTzd5UlZBWFlpNVNlc3RpSUVvUWIwbzNVL3NqSXVFVnlhYmh0?=
 =?utf-8?B?OWlxeWZZUjBCQ3RtWWlWaFp0T2YwdU50WXJzWGp4bC9XSXQ1V1B3a1llSlVT?=
 =?utf-8?B?ZXNiSks2b1VBNTBRRVAvM2JhRGYyKzZwUlhpSjRhTE4vRFlzNEVJZ0FZZWM2?=
 =?utf-8?B?Z3VRMjFja3ZoWXN2TFJReStGVzBoTjdaYnNrN21TeVdXNXkzdmtiYlZQM3Zh?=
 =?utf-8?B?MUxwOHBRbUpLTVJrZFBRT0lwWDBZd0hVdURIWlVHNGt6eTZKdHpmdVVBaThS?=
 =?utf-8?B?UlUzZW02NHJnLzFndnYzNmJNeHBYcFhEWnBiOXVYTnVvZkRmL2lXeEpNR0JD?=
 =?utf-8?B?TFBOV1J4T0s1T3VXVnpzcDFJWUF3QWRFNEVVT2ZGdTArN1RpbzFYRVNsMUVv?=
 =?utf-8?B?cmNRcnVVRGFXOTl5cDI0QzVTVzNaSzFVSEQzcFV5VE9PSmZmMkF0NTBqdXdJ?=
 =?utf-8?B?eG9DVzI4bmpYcFFMalZOdFdRQitMWjN1emJ1cURWRUR0T2dSSkphSG9yamlO?=
 =?utf-8?B?WUluN1hpamJGcExiNUFqNFBSY25QOHFQQjQyMGxxODBramM4RTE3OU9sVXAw?=
 =?utf-8?B?Ni9zWUY0T2M4YW0xeWMxYUx2WGo4aGk0REVBaksrb2NRcHU3NnJmcUJGeXBq?=
 =?utf-8?B?aFJxM1A1dHFwUHBwU0RwL1Q1RFc2QVJWb1orbjFXTlVpZjlBc2xjTmRSVldN?=
 =?utf-8?B?ZVpNdlVLb1BUQUgrMEJhK0RDVEZSb1FwOGExNWZDVzRBQWZuYW1ZL0h2c3d4?=
 =?utf-8?B?YU5YRG1TR2lrb2JtbzUvZmxTaTlwcnMyd21JcUQzeVVKbHl4ODREQWc3TkFl?=
 =?utf-8?B?MEoxZ09pMXR0cGZWQVJ6ZE83WjRKSzZmVFVSTzFlaHRtcStJbUZqMXNnS21O?=
 =?utf-8?B?cXdkNlRydVA1YUJOTlllcER3MXVMcXZlWjhTVmF0d2s4NFpNYlMzZzJMVnZE?=
 =?utf-8?B?NXdiMFVPa0l3SFFlYU9uVy9wcDFGOVh2OE5LTG02R1c3Z1FUc25OOW0zOWQv?=
 =?utf-8?B?U1BuNVU5TlprL1VjUTlWekpLeEhnUWpYNFhDbTc5MU5NTEtHMm44M1NRc1hu?=
 =?utf-8?B?bVcyTXZQOGxZRGlLbzZLaWJMbkdWSktRZ201czFnMk94OXd3WU93b2FnanZm?=
 =?utf-8?B?VWtqc3lIV3ZINDVDcHpxZE5zS05aSGpTTkRwTFhGV05JZkpwWFhrWmNUOUtX?=
 =?utf-8?B?NHh3cWpsUkk1cGJTL0E0bjUzaVJZNi9idWd4STVnZklydEZKNWQ5U2lPYmNs?=
 =?utf-8?B?K01xc3REKzJvbVhpN0NIUGExZGVXTDRMQ1hXRVhpWmJZWXcyN0pmQUszRWFD?=
 =?utf-8?B?VmhKZEVvNXhmR2Z0Yk5jMEhnMm43ZTJCOC9BRGJLcW9IRE1lTkthZnNQSjB5?=
 =?utf-8?B?VEdFbEFqU0JRRS9oL2p3c3BVZFFQRzBtbkdCZXRoUW5QMm0zZTdYc1J2dDJU?=
 =?utf-8?B?d3RIR2llUVNRREcwM3BRSm5QR1NDMi9CKzZMaHk1RnZkcU9VNTRaWStybU00?=
 =?utf-8?B?eC9oMkYwZUZaZkRNTkZjOVJUOFhKQnViaFo5RlBwQjZWU0oxaWxBVE0rd091?=
 =?utf-8?B?WG5taFVoYW1CZysvNUFEamVPWlJiNlhpTmd1QmwydFpKQ1JpQWtSUVU2M3VS?=
 =?utf-8?Q?IBMWfknG9mk+PNTPuVcTHnE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f68c61e-8e29-42fe-57d2-08d9f6e5b7db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:01:14.3903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54kOxSZlZIbZ0cgNTSDnJ+jR+wqok+ZFOfpE94HyAqyZZp04s/75ezskm1rm/jzpBNEH1ZQlhg7J+H1D+rGxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179

There's no need to initialize respective data for PV domains. Note that
p2m_teardown_{alt,nested}p2m() will handle the lack-of-initialization
case fine.

As a result, despite PV domains having a host P2M associated with them
and hence using XENMEM_get_pod_target on such may not be a real problem,
calling p2m_pod_set_mem_target() for a PV domain is surely wrong, even
if benign at present. Add a guard there as well.

In p2m_pod_demand_populate() the situation is a little different: This
function is reachable only for HVM domains anyway, but following from
other PoD functions only ever acting on the host P2M (and hence PoD
entries only ever existing in host P2Ms), assert and bail from there for
non-host-P2Ms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also guard XENMEM_{get,set}_pod_target handling. Re-base over wider
    p2m_add_identity_entry() exposure in earlier patch. Add missing
    inclusion of "p2m.h". Mention the p2m_pod_demand_populate()
    adjustment separately in the description.
---
Perhaps p2m_pod_init() could be invoked from p2m_init_hostp2m(), leaving
all other p2m's PoD state uninitialized. Of course at that point the
question would be whether the PoD pieces of struct p2m_domain wouldn't
better move into a separate structure, present only for host P2Ms.
Together with the p2m_pod_demand_populate() adjustment this might then
better be a separate change ...

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -43,6 +43,7 @@
 #include <xsm/xsm.h>
 
 #include "mm-locks.h"
+#include "p2m.h"
 
 /* Override macro from asm/page.h to make work with mfn_t */
 #undef virt_to_mfn
@@ -101,6 +102,9 @@ static int p2m_initialise(struct domain
     p2m->default_access = p2m_access_rwx;
     p2m->p2m_class = p2m_host;
 
+    if ( !is_hvm_domain(d) )
+        return 0;
+
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
 
@@ -258,7 +262,7 @@ int p2m_init(struct domain *d)
     int rc;
 
     rc = p2m_init_hostp2m(d);
-    if ( rc )
+    if ( rc || !is_hvm_domain(d) )
         return rc;
 
 #ifdef CONFIG_HVM
--- /dev/null
+++ b/xen/arch/x86/mm/p2m.h
@@ -0,0 +1,27 @@
+/******************************************************************************
+ * arch/x86/mm/p2m.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+void p2m_pod_init(struct p2m_domain *p2m);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -30,6 +30,7 @@
 #include <asm/p2m.h>
 
 #include "mm-locks.h"
+#include "p2m.h"
 
 #define superpage_aligned(_x)  (((_x)&(SUPERPAGE_PAGES-1))==0)
 
@@ -1162,6 +1163,12 @@ p2m_pod_demand_populate(struct p2m_domai
     mfn_t mfn;
     unsigned long i;
 
+    if ( !p2m_is_hostp2m(p2m) )
+    {
+        ASSERT_UNREACHABLE();
+        return false;
+    }
+
     ASSERT(gfn_locked_by_me(p2m, gfn));
     pod_lock(p2m);
 
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4810,7 +4810,9 @@ long arch_memory_op(unsigned long cmd, X
         if ( d == NULL )
             return -ESRCH;
 
-        if ( cmd == XENMEM_set_pod_target )
+        if ( !is_hvm_domain(d) )
+            rc = -EINVAL;
+        else if ( cmd == XENMEM_set_pod_target )
         {
             rc = xsm_set_pod_target(XSM_PRIV, d);
             if ( rc )
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -679,8 +679,6 @@ static inline long p2m_pod_entry_count(c
     return p2m->pod.entry_count;
 }
 
-void p2m_pod_init(struct p2m_domain *p2m);
-
 #else
 
 static inline bool
@@ -709,8 +707,6 @@ static inline long p2m_pod_entry_count(c
     return 0;
 }
 
-static inline void p2m_pod_init(struct p2m_domain *p2m) {}
-
 #endif
 
 


