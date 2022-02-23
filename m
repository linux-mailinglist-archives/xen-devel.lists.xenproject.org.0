Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E634C1820
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277555.474105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuAK-00010o-Li; Wed, 23 Feb 2022 16:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277555.474105; Wed, 23 Feb 2022 16:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuAK-0000xe-HS; Wed, 23 Feb 2022 16:06:56 +0000
Received: by outflank-mailman (input) for mailman id 277555;
 Wed, 23 Feb 2022 16:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMuAI-0000w1-6i
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:06:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d746bdb-94c2-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:06:53 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-OgQyaPfSOMqLrBABE6INEg-1; Wed, 23 Feb 2022 17:06:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3803.eurprd04.prod.outlook.com (2603:10a6:8:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 23 Feb
 2022 16:06:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:06:49 +0000
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
X-Inumbo-ID: 9d746bdb-94c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlmDT6QYqTFfeFQW5rElaxTqCBQLlgaE3LTl1YDteaU=;
	b=VAe75CrWyOGfLMQlt3P7rrpJuNuTw8ohUOj4SAm9vepWS8iHAdpicoz6A0K9sHiwpGpNaj
	OUuQ2EPtSlhSGjoQ3MfZJ5ubrmctvP4q9+atYN3VT3rIiYvifpbnhWycKxtaxz0oBdsFaX
	pj/24GLs+kEZEQdvmCp1GUpi+s6/SxM=
X-MC-Unique: OgQyaPfSOMqLrBABE6INEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0rWpJ3adE5GqoNa9SgQTtaJ+eUpHtkVXTZzjce326XuoKPTI5Slm7mCYmITPQ+L73bjI+TycUnxW16yaR5uWd6GESJvRsAJzYrS2423QqziQLT0VWHz9RbSN9NX7b/YT21+GxE82mgS3mc5pNNxN/wj8+ziL42VmnQ6cb9CnNCBqDZ2usgSmddwWp8iZxj1beVvBRJFWMmtCDiDYmF/SLx26xZL8425Zp3ASgpUc1uyRGRZn3rPI3r71ioGMJ9Deb4PYJIvNT3AoufEhwIQfHuHTYapXV2sPkAgXz/1QSM8twqF8GcfUQb76PsZLSommwRINmd2QBTlomFLyPhfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlmDT6QYqTFfeFQW5rElaxTqCBQLlgaE3LTl1YDteaU=;
 b=cF8jCESKRZkmQ+OcyrH9TQuev1Ri87bop1VEnASVIoyteix53WsOCJSDnxr2gBefU9ZsriwxWjML27gJpiyDqniWWm+mtDubzxkKD2pf3kQE/yO/D1KNUdNuHwCB9S0kOSuNPDI3Afqb6NIfK3EMKZiMFnL5RF25pRK84R9zmPLylYBdLA+P3AicHyyzj/+Yr7nYQx7ZuCYu2Rm6u5sw5cd9ooyDrl/DQNCDgcrbGoWhFMBfeJpQp1TAGOqL7Xys8HTeRF8Ya9OFloJeVX3gA8qEvX1D40bljk4Oc5uvLrsaJ6PtvJRijHxYe7ZnQHN8GwxBEvreYMYzMlzk5IQA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b964afe-635f-3320-ceee-2845ed079332@suse.com>
Date: Wed, 23 Feb 2022 17:06:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 14/14] x86/P2M: the majority for struct p2m_domain's fields
 are HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0025.eurprd06.prod.outlook.com
 (2603:10a6:203:68::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 409846ce-b77a-49d3-02ac-08d9f6e67fc8
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3803:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB38039F9FA2FE926233DBCDFDB33C9@DB3PR0402MB3803.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fwQCb6RFUx6V1ZzmK51tmdr339Y2T5qd7aqZ8Re5PnWpFpyJQ5wuzXut35hgVA54tb35v3rnXa8m0MX9LCTWcjAVfwF/Y9EoMZ3F3eGpAlBaN9QZiUNc4mDG/Gr2LSvRhgpgTffFizazcn2k45XE5t7pP2cQRlVkNFlIhSuxdHPCFhdlsCyRQTamXRcH6oPDa/8142WUvisi1BH11fWrj4R3gBeGN6kpFXm/z36wdUBbsU4+8aVWMsU4Gs58/ceqZktq9tNVUJJMy4rbzsNL/SxNRsyDVHFkzApnf3WDJTZOvsqQd2Csm9YauhmLtAhpxAhwIY79rIhUvAZbwzDloY7SbU9hWMSotErfbVakivQBqGldRO+G+JSaJ/aI5b4dUex+T6qJ7jdBhGzRsnZXEs22JYyEnwVu7ZmrSfyXXUtsNbllIMZXgYSH2mITwgF5AfyDC8g0ozG6yqrp0ANiGOrWduPpo05EiHAADtRTxad0Q/rwKcZwA4FPiJhrjmpubwWeBfcZFADlT7v3UWXxgx2BJH4C8AIEanDp7qLpJ9FcDIAzmuQ60tP3VOM4SX0tuBD47xGjcz+upwU4drGExniczfogqcC81E9bB1Ul8FqgahlL84b3fxMqcKY5SJA9T/6rTe3waGwYwkMW3gNTLhUiWJ3QtAXS/G8+9tdxZHEEceGKuwE8lTH+d/Sf0GrqTTbxd6A3EZE5Jr3E4U484xFEDlj2hFo0CCe1NcrndI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66476007)(8676002)(6916009)(6506007)(31686004)(86362001)(8936002)(31696002)(6486002)(316002)(66556008)(508600001)(66946007)(26005)(5660300002)(36756003)(83380400001)(4326008)(38100700002)(186003)(2906002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXkvbnhEQytZYVFtWUN0NWZaK0J3S0pvd2dsTHJOUFRZdFdHQ0hXWTduQkJB?=
 =?utf-8?B?V1dxOUNmRWxrdkUwQTZ6YTB0bkNkbStjMFd6NzNDRVdoN1IxQkszTFJyYTk5?=
 =?utf-8?B?OUdqdlVxLzdYV0RNUkJCdit1ZU9vZkRlbUlER25UcEVxbVkzNmtia3R0MExw?=
 =?utf-8?B?Q1ZPZlQ0elUya1lNcDR6dTZIT1ByWUpRaVk4clZIK3VFVTExUm5KWktOYzNW?=
 =?utf-8?B?cjRHQndmVXMwa05NQkU4SEJUa0dnNjc0Q1JobjlrOFkxNktwSUZlREdsckVB?=
 =?utf-8?B?UGMzc1p3RXJRWWtvSDducWFQcW1uektxaXVUYitDMGMxTGNzL2pIZFN2Rm9U?=
 =?utf-8?B?VHpmVDUwK3ViNmxPclZ4a0tsT2lCcEVvTDI0SWxLcS9lTjdtZlJNUzM5RHhx?=
 =?utf-8?B?aUxVRTJsbEFxMGhIUzkzL1VGWklPUTFQd3h5SSsrSStIVmgwcGVCckFTOG9z?=
 =?utf-8?B?SVlpWEF0SVRGWUhlNzZURVIyN3ZqUXVGK0RVdEM5YjZmZzN3Mkllam44d2E3?=
 =?utf-8?B?OWZPUDhSdUVKOFM1V01YZkVrN2M3ZmxpQnErVlVhN0s5bUYzaGdWczVUemFM?=
 =?utf-8?B?YXNpTGl3TjJ3RDF2ejk3R3F6dEZHcGs1cy83K1l3OFREbVkrTW4zRGNKSzN3?=
 =?utf-8?B?ZTRRQUI3VmNRcWN5ekgxcHFkeUZVY2N1TGtSSFltSVpYZkoyTTBhMkpFUlVx?=
 =?utf-8?B?R1VmeWk2cXF3VkRFcDNmM0xkWXV2NHdGRkV0dFU3SEJZTVRpR3NneXVJTHky?=
 =?utf-8?B?THIyNWMxcExOcHdialZDNkhrUVBoQ2xXdTRoWUR2VEFmYjhYZmVYaktObzdR?=
 =?utf-8?B?MkFSMVJqTDZLdTVROUhkd1BMMURaNDBTSTRtbXFKZ212Yy9Eb09sMnNkVXlQ?=
 =?utf-8?B?VWl5RnRqMTB4OGZPZG5zME9leXdqMW5BTUQ3czBGay9GUVBuOFRvOVY4RnBT?=
 =?utf-8?B?Zlk2R28vSXdPeHBOc3ZWK09Dd21PeWErUXVVS1VhM1BBaFFGMUwwL1NCOXRx?=
 =?utf-8?B?N2pBUlJxL3NlcHB3Ymw5Z1ptME9GT1plYzVZTXVYVXhHajhreGgydVFSU1Y0?=
 =?utf-8?B?UWMvc2FOcEROR1Z4bkFDOTd4RGVNZUpuRm9hL1dhYXV2emQ3QUh6Y3dzSWtm?=
 =?utf-8?B?aTZMbzlLVU80cWlSMzV4TW5VWlRYRzRKMXpJUURLYlVlUFd6bG4yU1Z3ZVJU?=
 =?utf-8?B?NG1mKzV4bEp5dW1ZQytoM1h0aEhDa3Q4V3NJOGFrWDR4WnQ0S1R6TVRUZU13?=
 =?utf-8?B?NVZOVHVabEtXMTdmV0lGR3crOWxNN2ROZXV6cXJqTmp0N1ZieEVlQ2tuOUNP?=
 =?utf-8?B?V0x0S0grSVdocVRLNWM5WTk5N1lnRzVLb2J2dzdMb0FlelNxS3NWOXZPNzJs?=
 =?utf-8?B?YXY1Kzh6U1JSZnc4VjRYRTRka1NZRWRvMVFTQmQzclRHYUNNYm0yQURXZ0lH?=
 =?utf-8?B?UHNCVUlHMi8yTStHM1dPbGFlYlZ0aUJaLzZKWVdtUkRYVExmanpWK2hacnU0?=
 =?utf-8?B?WElqVTNwSXd5VUFNbEc0YThkSDJiclBBeDRqWTVmMG5Ld1Z5RnRsOFhsKzVD?=
 =?utf-8?B?NGx1dk4zb1NUSmVPK1I2WjFhMk9DNHBLM3hPNnRVZjdmTmFBcWhxZVMrNnll?=
 =?utf-8?B?TDV6NkVSVVpKdTZhOHRiNU5ObjhDcHB2bEI1SGtncGhITlh6a3k5QWd2QTVv?=
 =?utf-8?B?U21DSlNvODVaRGZXZ1lwNDU1S2RHMklna0d5dE10RW8rNHpLT1BOeUtySmpR?=
 =?utf-8?B?KzJldjJ2N2srTkRsT2VQYXJicTFWZkdxSUc3NzRoV0pCNmdjVUtRblZZU2Ju?=
 =?utf-8?B?SGZoajh6Tm9Mc0ZGVWZUWHhIRytPNDd6ZTZhOWZVSVRVYUVQWlBRYWlmT1VX?=
 =?utf-8?B?MWZrcVJWblVmNUJjOThmRVA2SWMrUTdlYmFuK0tDZTZ3L3Z0ZUY2Vy95bnVj?=
 =?utf-8?B?R080RHJrNjVaVVE5bVRhOTNPeXpycUJQVVhYbEgrVkpnZU94c00vbWpLS3Jl?=
 =?utf-8?B?Q0FXTW9kTS9LUnVjd1pXWld0RzVHMSt4SjdVQnpHdmhBUHpWM0hFYkkyL3kv?=
 =?utf-8?B?cEtSUjk0M3J3bjNkQmJTUGJYMFlrZEpUTHZMWW4wZjdlNHdEV2ZqcGVUeGl5?=
 =?utf-8?B?T2NvazZ5TGFrKzd1OGNoV3BERC9FQlZCVnNLN1c2cm5qSnNueTIzaUhCZG5V?=
 =?utf-8?Q?unWBFNoJ8Z5q2BL3llg/DOg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409846ce-b77a-49d3-02ac-08d9f6e67fc8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:06:49.7611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Blpzr+W413RLbPKOOTb1kU9EJAOdM2VfEMhOqNc7KBAnDlIoAWB4Tqhx1+MPov0sCgh4qSxusKrByejwX+YJGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3803

..., as are the majority of the locks involved. Conditionalize things
accordingly.

Also adjust the ioreq field's indentation at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
v2: Adjust a comment.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -481,8 +481,11 @@ unsigned int page_get_ram_type(mfn_t mfn
 
 unsigned long domain_get_maximum_gpfn(struct domain *d)
 {
+#ifdef CONFIG_HVM
     if ( is_hvm_domain(d) )
         return p2m_get_hostp2m(d)->max_mapped_pfn;
+#endif
+
     /* NB. PV guests specify nr_pfns rather than max_pfn so we adjust here. */
     return (arch_get_max_pfn(d) ?: 1) - 1;
 }
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -237,6 +237,8 @@ static inline void mm_enforce_order_unlo
  *                                                                      *
  ************************************************************************/
 
+#ifdef CONFIG_HVM
+
 /* Nested P2M lock (per-domain)
  *
  * A per-domain lock that protects the mapping from nested-CR3 to
@@ -354,6 +356,8 @@ declare_mm_lock(pod)
 #define pod_unlock(p)         mm_unlock(&(p)->pod.lock)
 #define pod_locked_by_me(p)   mm_locked_by_me(&(p)->pod.lock)
 
+#endif /* CONFIG_HVM */
+
 /* Page alloc lock (per-domain)
  *
  * This is an external lock, not represented by an mm_lock_t. However,
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -48,6 +48,8 @@
 #undef virt_to_mfn
 #define virt_to_mfn(v) _mfn(__virt_to_mfn(v))
 
+DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
+
 /* Turn on/off host superpage page table support for hap, default on. */
 bool_t __initdata opt_hap_1gb = 1, __initdata opt_hap_2mb = 1;
 boolean_param("hap_1gb", opt_hap_1gb);
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -28,16 +28,15 @@
 #include "mm-locks.h"
 #include "p2m.h"
 
-DEFINE_PERCPU_RWLOCK_GLOBAL(p2m_percpu_rwlock);
-
 /* Init the datastructures for later use by the p2m code */
 static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 {
     int ret = 0;
 
-    mm_rwlock_init(&p2m->lock);
 #ifdef CONFIG_HVM
+    mm_rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
+    spin_lock_init(&p2m->ioreq.lock);
 #endif
 
     p2m->domain = d;
@@ -55,8 +54,6 @@ static int p2m_initialise(struct domain
     else
         p2m_pt_init(p2m);
 
-    spin_lock_init(&p2m->ioreq.lock);
-
     return ret;
 }
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -459,7 +459,7 @@ bool arch_iommu_use_permitted(const stru
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
             likely(!mem_paging_enabled(d)) &&
-            likely(!p2m_get_hostp2m(d)->global_logdirty));
+            likely(!p2m_is_global_logdirty(d)));
 }
 
 /*
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -205,8 +205,10 @@ typedef enum {
 
 /* Per-p2m-table state */
 struct p2m_domain {
+#ifdef CONFIG_HVM
     /* Lock that protects updates to the p2m */
     mm_rwlock_t           lock;
+#endif
 
     /*
      * Same as a domain's dirty_cpumask but limited to
@@ -226,13 +228,14 @@ struct p2m_domain {
      */
     p2m_access_t default_access;
 
+#ifdef CONFIG_HVM
+
     /* Host p2m: Log-dirty ranges registered for the domain. */
     struct rangeset   *logdirty_ranges;
 
     /* Host p2m: Global log-dirty mode enabled for the domain. */
     bool               global_logdirty;
 
-#ifdef CONFIG_HVM
     /* Translated domain: p2m mapping */
     pagetable_t        phys_table;
 
@@ -275,7 +278,6 @@ struct p2m_domain {
                                               unsigned int level);
     void               (*write_p2m_entry_post)(struct p2m_domain *p2m,
                                                unsigned int oflags);
-#endif
 #if P2M_AUDIT
     long               (*audit_p2m)(struct p2m_domain *p2m);
 #endif
@@ -310,7 +312,6 @@ struct p2m_domain {
     unsigned long min_remapped_gfn;
     unsigned long max_remapped_gfn;
 
-#ifdef CONFIG_HVM
     /* Populate-on-demand variables
      * All variables are protected with the pod lock. We cannot rely on
      * the p2m lock if it's turned into a fine-grained lock.
@@ -367,27 +368,27 @@ struct p2m_domain {
      * threaded on in LRU order.
      */
     struct list_head   np2m_list;
-#endif
 
     union {
         struct ept_data ept;
         /* NPT-equivalent structure could be added here. */
     };
 
-     struct {
-         spinlock_t lock;
-         /*
-          * ioreq server who's responsible for the emulation of
-          * gfns with specific p2m type(for now, p2m_ioreq_server).
-          */
-         struct ioreq_server *server;
-         /*
-          * flags specifies whether read, write or both operations
-          * are to be emulated by an ioreq server.
-          */
-         unsigned int flags;
-         unsigned long entry_count;
-     } ioreq;
+    struct {
+        spinlock_t lock;
+        /*
+         * ioreq server who's responsible for the emulation of
+         * gfns with specific p2m type(for now, p2m_ioreq_server).
+         */
+        struct ioreq_server *server;
+        /*
+         * flags specifies whether read, write or both operations
+         * are to be emulated by an ioreq server.
+         */
+        unsigned int flags;
+        unsigned long entry_count;
+    } ioreq;
+#endif /* CONFIG_HVM */
 };
 
 /* get host p2m table */
@@ -651,6 +652,15 @@ int p2m_finish_type_change(struct domain
                            gfn_t first_gfn,
                            unsigned long max_nr);
 
+static inline bool p2m_is_global_logdirty(const struct domain *d)
+{
+#ifdef CONFIG_HVM
+    return p2m_get_hostp2m(d)->global_logdirty;
+#else
+    return false;
+#endif
+}
+
 int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
                           unsigned long end);
 
@@ -792,6 +802,8 @@ extern void audit_p2m(struct domain *d,
 #define P2M_DEBUG(f, a...) do { (void)(f); } while(0)
 #endif
 
+#ifdef CONFIG_HVM
+
 /*
  * Functions specific to the p2m-pt implementation
  */
@@ -852,7 +864,7 @@ void nestedp2m_write_p2m_entry_post(stru
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
-#ifdef CONFIG_HVM
+
 /* get current alternate p2m table */
 static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
 {
@@ -905,10 +917,10 @@ int p2m_altp2m_propagate_change(struct d
 /* Set a specific p2m view visibility */
 int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
                                    uint8_t visible);
-#else
+#else /* !CONFIG_HVM */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
 static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
-#endif
+#endif /* CONFIG_HVM */
 
 /* p2m access to IOMMU flags */
 static inline unsigned int p2m_access_to_iommu_flags(p2m_access_t p2ma)
@@ -972,6 +984,8 @@ static inline unsigned int p2m_get_iommu
     return flags;
 }
 
+#ifdef CONFIG_HVM
+
 int p2m_set_ioreq_server(struct domain *d, unsigned int flags,
                          struct ioreq_server *s);
 struct ioreq_server *p2m_get_ioreq_server(struct domain *d,
@@ -1036,6 +1050,8 @@ static inline int p2m_entry_modify(struc
     return 0;
 }
 
+#endif /* CONFIG_HVM */
+
 #endif /* _XEN_ASM_X86_P2M_H */
 
 /*


