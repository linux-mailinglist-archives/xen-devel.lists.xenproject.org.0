Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6465319F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467874.726925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z5Q-0003FY-M0; Wed, 21 Dec 2022 13:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467874.726925; Wed, 21 Dec 2022 13:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z5Q-0003Dp-JE; Wed, 21 Dec 2022 13:24:44 +0000
Received: by outflank-mailman (input) for mailman id 467874;
 Wed, 21 Dec 2022 13:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z5O-0003Di-Qs
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:24:42 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2078.outbound.protection.outlook.com [40.107.249.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d22cd1c3-8132-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 14:24:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:24:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:24:37 +0000
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
X-Inumbo-ID: d22cd1c3-8132-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3oPNtpEZPc7CUjPI33oFsWSAU09vLntPVW+2nGh+g6ny1/QvsZuZRAAo+QkGt8mvl3P1IameSYqj4+m1h8E78/xPAsnNgo//bd1298apdurXwBuZMHQCpcvbaxogAbftL/nZKimhIJiaeK+HiZjjNs20ZrYsfyyBI8pE6HWBhnkzaOsipG4Qgl1rYUqR/YzeVib2CqG4qbe2eBJhv1nEPIv1zkAhZESnEAgGRPYsBYVf0FknyN9LlalnuzV1/pdM3eW0eqNAGFIeduO1SC4gXryjwasKL2QlYhwmCCOuNqzwwJfA9ncvzD17AJSDjXh6QB4gjjBKqb0pn3Nal8bKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEn4wFY2piqkVwEmqMEYH4wgW0zCNIYSpO4zFCRXgEw=;
 b=n4h9MrLskiw3URvwI78R+6xIf4yDtEogyBORsWRIsWEdz4DJNCla6cz1cw+vXHOC5E+/DYM80auhwxojN8+AvMhCxxQipdIY6Gc6acEa9tIHIk+w6sy7s9SZ0yZcma6Hu9hAJ1M0z/mttziJmaooiGWHZlDL3xLS2A/wXObJUyNv949nf8GAee/6PZfabozwRPuRvNdx+zEuNVO0X77BVSaZDeIEbZ7DrYmaPLwcZ/XbrHIUkSGks7Mgm4mxTMIeNJN4vqR+mCvbMo7Bt7aV9bUUAWelshTF8fhkXM4+TkegBSpbG0zAaAHPTeCwabBkQJjioAJYsAICWN2FMg1J2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEn4wFY2piqkVwEmqMEYH4wgW0zCNIYSpO4zFCRXgEw=;
 b=cRQqGTYQTnMC4eFmoMYKPX33yjXY3V6wnUTRJI7Vh1ddj+glADLxorgbB1bFkkKZOeGAtrJQNu0kAErYBYJHNqDgFdOXc56qq/QTjnhqHqly7obWD2CMj3PliyPCPCtJR1CVGQ3XuPts5b7xgwRuUwf/nSejDhw50s7GIQs86f9TOEA21cHolyP6UQM2/nuXscaav9tY2TuDeUnGvxDksNhh1R2W0D3WOtlT8mKbBkTgbXu5UVd1HuSEHMWY7I6NN1YlZPKzfCB3KKkOfRe/9r2m5MaFwdS4smkadF+QRpFGeiyLLJMOjLovbF6idsOFe/dpVud2OjYqRgI0T2J7Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <660507f9-87fd-1061-1fa0-2aeb42ac2eef@suse.com>
Date: Wed, 21 Dec 2022 14:24:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 1/8] x86/paging: fold HAP and shadow memory alloc related
 fields
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ea6951-5f20-4d28-a184-08dae356b527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qqf7vqyiawR0rcgHIH/Ox8Z2A8EPSMLSE7/Gd3OfuyUETmh0ZqIskLrMLHUrxFF6FCrUquJgy9m/nSWj/9O1F6PWv3tEx0szkEjNuKzCdXBvnqr0T4S3No0nK7CaduHMzj25WkrGVjaxQN0AQljzsg/cqL0IryiFkRSJAVU3TJbilBSpmsUvg++zafLlDlbdYG0WfHhBwYnEKb5apjZ+gjCF4QCdyw1JCjCw+t6mOi5mJ66VzLmmDircDek0L/3NrP8BVx2zQ/k5BrDfAfAGDjXmcICvqDNFfTjzsPSJJ6mhVi6tyKeiGjyXUx+e7WYsa2BD9WONQ4tf8fGaRCVjKhYZcPHTo67GymgL9hUcRNV0rNTVZXLsfqnFVHdOYtqZid6+uRuPm5ZjsFk+umYCZ8O6//qHjY35wx7vJIoBrExresWcv4okcpeJwCLft2rktOAZfYz8RuE+pfIz015p9cWRSmpdVYJ2c2X+oavsCFl+9dRzaKKLbOeQWFuEMRBTBftyCYb2wdn/aw1xb1+6182M80lRrw3ZDjzg2lUnsleQTmYI4B99DrOBIReHeuuj9BvXla1/1r1Gca1t7m4mSJJKYVy+zdvHbk/QKXCb+ooNdedtdnocK77xGT/lbONABEyOzKuMXx6SB+5oXPDvC9gmnV2BgbMnD18gsRb907jGmd8knkVMaschpZYHgqFMPZDcCxxDEYv78GmSXW+jTDcpMXQW2qMLH7oy9j+dEGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(31686004)(8936002)(8676002)(66476007)(86362001)(4326008)(66556008)(5660300002)(66946007)(316002)(30864003)(2906002)(41300700001)(6916009)(54906003)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(6486002)(478600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aS90Z3djZ0FYOXcyOUR1MExCcDFJNmFnZFg0QkNkcmNwWHM2OTRZQmR5ZHpw?=
 =?utf-8?B?bXFRTU5PcUxOR0M2VkN3RHMwNWNCYWhTU2k3aXFxSzdqLzlDZHNKRTgxeFMv?=
 =?utf-8?B?WS9oY05NN3RpcXhQWWsvc0RBY3RiYVAxZXIvQmNTUXRjbHpuL1JDbHc2dEhz?=
 =?utf-8?B?RkhzVmVaTENoMTBWMkZkbmRweU9VWk5qT1ZIK1JRMDNVNHlRQlpmL0pTbEMv?=
 =?utf-8?B?UHRLVE5OTHJpSXBLbWhNWXRtWlJ5OEZiNmdmd29jM3VwUnFmd1Z5MzJLL3pW?=
 =?utf-8?B?RG5mcG0zamIzYWVVaFpXYk5VRmh3ODJLOTNHdjhxUUVJa0dRVkRhaFZyRWhM?=
 =?utf-8?B?N2JKbmJDSVNDdkVtbUFtWktsTDd2aGhLMmJyUEpkSEJxZ3JPajd2Z3ZDeEpa?=
 =?utf-8?B?YjJCeHByK2RKeXZLSjAxbkdta1JIcW9jek1IV3Q1cUtCODVQanVTcFFhMWJt?=
 =?utf-8?B?R2tDRS9BazdwVC9EVDk0N0RLWG9JMnRGREtsWmNKSGJGSmpzUDJ4YW5VL3hF?=
 =?utf-8?B?WXZaNEJQa1BHczlUbzZ4WDd4SC9nYThrQlNIc3BRbE5INzhWWlVnUlMrNXFl?=
 =?utf-8?B?azJPVGNxRjhBQjhaSEplODJRVE5vTU95K2Qwcm5tSG5CY051N3RuUFZBclpa?=
 =?utf-8?B?c0ZhZHVVeXREdXhFQVZpVWVTNWxNcXZTTGNPaEtvNVkySjNYUkpOaVkvMU9r?=
 =?utf-8?B?SkdkNERwK3dYT0Q3MHNSRFJtYTM1bWdBQVFmSUkrL0RGeDBnOENIWnB5RWdw?=
 =?utf-8?B?UUxzV1VtcFY4YjlGeTg5d25TSGVlMVVCWXhjUzUxQlUyZzRmSWpkZnF4RmxI?=
 =?utf-8?B?OG0zZVB4ZWY0b1VvdG0rSlZnS0JoSVpYVVdydkhlWDdhN3N0d01LWW5xb2hn?=
 =?utf-8?B?aWppcnI0cndQaEJhK2Z2ZllXNFpwUXAzS1JldGx3bEVtaHk2djdQTmpkSEVL?=
 =?utf-8?B?Y0Vmc0JUQUNxc1UxZjBaYi9wT3lvOHRrZHZXbFYwNC9PYXV2SmZaSVZRWU94?=
 =?utf-8?B?c3NMRXlXSXVuNWJPbVVoM0lzYTRZV1NvS1NWMWpaVnErT1g4blp1c0IwUVlz?=
 =?utf-8?B?enNad1VxQ1VrVFJhMlVFcUpFblFpcjBrenRadWdaVXRYNUsvQVBhMGR6a1ZR?=
 =?utf-8?B?KytCU213bzZ1ZHljdXRSMnNjQ25QRUczTXN3emF3Vi9PUmVldTJQZ2RFeDhT?=
 =?utf-8?B?b0NtVUhXZHhnemFWdzhpc3pubnJGTkNURm1nWGFMZDlNQmpOUGQzRHRtd3Y4?=
 =?utf-8?B?MFZOVWtCOExnRFBQTmJ5ZEtkZ1paYjN3dUY5Sys1SkpPUDgrekVPcUZyNE9Z?=
 =?utf-8?B?M21BaThramlQUFMzSFRhS0o5MEVTRWhRNjdBYVZvRkliMXBxOGVoVjhqMnZw?=
 =?utf-8?B?WFZGdkt2LzJCVC9oTnRZNDlXK1ZjQm0xVFZQMUhTMnNTWnFuNmJ5aUt1QnU5?=
 =?utf-8?B?T0hRTE1QN2RPOGRmMWpaM3RJcEJ2VDlsVFNpV1NRbWkvL3RkbWZhcE1Fd3B1?=
 =?utf-8?B?SG1SRnNpV2wvVUg0U2h0T0duSEN2ejNiSHRHTjAzbng2L1BUZ0l2TzJQbmhh?=
 =?utf-8?B?Q3JGV2NLOTFHbGtXZ2dxUlB1aVgvSkNuWmpQRGdFU1d4R3dlTzNaWEYvdXdY?=
 =?utf-8?B?a2EzdmFIOGdVSG5jVEhHeGJoL1hJdG5PVmdqNzF5MWtLR3FxTDJyMDY4bHRs?=
 =?utf-8?B?NUlkWGZiKzk1OXRyeW54QkloaVEvUGNnTCtDVW9FaWo0cUh4ZlNhNm9aaUJm?=
 =?utf-8?B?eDFpUXJFZFF2Z0p0cDF1bG9mVDNSTnVGYS9XT3orcVZiUnpVQ29LZVNmUXph?=
 =?utf-8?B?dmJLUWQ0SWFiZVhoSGRHcmhzcnNvWlYzNUE0azczTC9WYWJVWmNGTlZWb2Ft?=
 =?utf-8?B?eEM0OGoxZTFudGJjTXd3Q3FRWnZJTzlDSFdmOE5raExjdHpybFlSaFI5Ymw0?=
 =?utf-8?B?NERmTnJCWWt3TGFqblpsa1o1azVjRE00Y2lQVDNmdGFOVTVmWXNkdVRWckQz?=
 =?utf-8?B?NjBvNTl6enQ3eTgzTkRsdk5xS202NXhobDhER1ZoKzZ4R0JRUFZMSWd6SWZ3?=
 =?utf-8?B?aDZMekJOTi9NdGhBL3lTcW5LRTNJNVpPaHYzeWYwOTV6cGt4QjdiQ0Zod1A4?=
 =?utf-8?Q?LA87t08npQ9mkwNN8po84Mnq6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ea6951-5f20-4d28-a184-08dae356b527
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:24:37.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eU/9Da6T9+KNFspDPZOlWN7P34KY6PWgALYkXF9LSmoaf1/OFK/snyHTRKzvTB6GaKKBjeSbcNuMze13TMfRsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610

Especially with struct shadow_domain and struct hap_domain not living in
a union inside struct paging_domain, let's avoid the duplication: The
fields are named and used in identical ways, and only one of HAP or
shadow can be in use for a domain. This then also renders involved
expressions slightly more legible.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Quite likely more folding of code is possible with this. For example
{hap,shadow}_set_allocation() are now yet more similar than they already
were.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -99,12 +99,6 @@ struct shadow_domain {
     unsigned int      opt_flags;    /* runtime tunable optimizations on/off */
     struct page_list_head pinned_shadows;
 
-    /* Memory allocation */
-    struct page_list_head freelist;
-    unsigned int      total_pages;  /* number of pages allocated */
-    unsigned int      free_pages;   /* number of pages on freelists */
-    unsigned int      p2m_pages;    /* number of pages allocated to p2m */
-
     /* 1-to-1 map for use when HVM vcpus have paging disabled */
     pagetable_t unpaged_pagetable;
 
@@ -179,10 +173,6 @@ struct shadow_vcpu {
 /*            hardware assisted paging          */
 /************************************************/
 struct hap_domain {
-    struct page_list_head freelist;
-    unsigned int      total_pages;  /* number of pages allocated */
-    unsigned int      free_pages;   /* number of pages on freelists */
-    unsigned int      p2m_pages;    /* number of pages allocated to p2m */
 };
 
 /************************************************/
@@ -218,6 +208,13 @@ struct paging_domain {
     struct shadow_domain    shadow;
     /* extension for hardware-assited paging */
     struct hap_domain       hap;
+
+    /* Memory allocation (common to shadow and HAP) */
+    struct page_list_head   freelist;
+    unsigned int            total_pages;  /* number of pages allocated */
+    unsigned int            free_pages;   /* number of pages on freelists */
+    unsigned int            p2m_pages;    /* number of pages allocated to p2m */
+
     /* log dirty support */
     struct log_dirty_domain log_dirty;
 
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -47,7 +47,6 @@ int   hap_track_dirty_vram(struct domain
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
 unsigned int hap_get_allocation(struct domain *d);
-int hap_get_allocation_bytes(struct domain *d, uint64_t *size);
 
 #endif /* XEN_HAP_H */
 
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -97,8 +97,6 @@ void shadow_blow_tables_per_domain(struc
 int shadow_set_allocation(struct domain *d, unsigned int pages,
                           bool *preempted);
 
-int shadow_get_allocation_bytes(struct domain *d, uint64_t *size);
-
 #else /* !CONFIG_SHADOW_PAGING */
 
 #define shadow_vcpu_teardown(v) ASSERT(is_pv_vcpu(v))
@@ -110,8 +108,6 @@ int shadow_get_allocation_bytes(struct d
     ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
 #define shadow_set_allocation(d, pages, preempted) \
     ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
-#define shadow_get_allocation_bytes(d, size) \
-    ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
 
 static inline void sh_remove_shadows(struct domain *d, mfn_t gmfn,
                                      int fast, int all) {}
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -249,11 +249,11 @@ static struct page_info *hap_alloc(struc
     if ( unlikely(d->is_dying) )
         return NULL;
 
-    pg = page_list_remove_head(&d->arch.paging.hap.freelist);
+    pg = page_list_remove_head(&d->arch.paging.freelist);
     if ( unlikely(!pg) )
         return NULL;
 
-    d->arch.paging.hap.free_pages--;
+    d->arch.paging.free_pages--;
 
     clear_domain_page(page_to_mfn(pg));
 
@@ -274,12 +274,12 @@ static void hap_free(struct domain *d, m
     if ( unlikely(d->is_dying) )
     {
         free_domheap_page(pg);
-        d->arch.paging.hap.total_pages--;
+        d->arch.paging.total_pages--;
         return;
     }
 
-    d->arch.paging.hap.free_pages++;
-    page_list_add_tail(pg, &d->arch.paging.hap.freelist);
+    d->arch.paging.free_pages++;
+    page_list_add_tail(pg, &d->arch.paging.freelist);
 }
 
 static struct page_info *cf_check hap_alloc_p2m_page(struct domain *d)
@@ -293,8 +293,8 @@ static struct page_info *cf_check hap_al
 
     if ( likely(pg != NULL) )
     {
-        d->arch.paging.hap.total_pages--;
-        d->arch.paging.hap.p2m_pages++;
+        d->arch.paging.total_pages--;
+        d->arch.paging.p2m_pages++;
         ASSERT(!page_get_owner(pg) && !(pg->count_info & PGC_count_mask));
     }
     else if ( !d->arch.paging.p2m_alloc_failed && !d->is_dying )
@@ -328,8 +328,8 @@ static void cf_check hap_free_p2m_page(s
         pg->count_info &= ~PGC_count_mask;
         page_set_owner(pg, NULL);
     }
-    d->arch.paging.hap.p2m_pages--;
-    d->arch.paging.hap.total_pages++;
+    d->arch.paging.p2m_pages--;
+    d->arch.paging.total_pages++;
     hap_free(d, page_to_mfn(pg));
 
     paging_unlock(d);
@@ -338,24 +338,13 @@ static void cf_check hap_free_p2m_page(s
 /* Return the size of the pool, rounded up to the nearest MB */
 unsigned int hap_get_allocation(struct domain *d)
 {
-    unsigned int pg = d->arch.paging.hap.total_pages
-        + d->arch.paging.hap.p2m_pages;
+    unsigned int pg = d->arch.paging.total_pages
+        + d->arch.paging.p2m_pages;
 
     return ((pg >> (20 - PAGE_SHIFT))
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
-int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
-{
-    unsigned long pages = d->arch.paging.hap.total_pages;
-
-    pages += d->arch.paging.hap.p2m_pages;
-
-    *size = pages << PAGE_SHIFT;
-
-    return 0;
-}
-
 /* Set the pool of pages to the required number of pages.
  * Returns 0 for success, non-zero for failure. */
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
@@ -364,14 +353,14 @@ int hap_set_allocation(struct domain *d,
 
     ASSERT(paging_locked_by_me(d));
 
-    if ( pages < d->arch.paging.hap.p2m_pages )
+    if ( pages < d->arch.paging.p2m_pages )
         pages = 0;
     else
-        pages -= d->arch.paging.hap.p2m_pages;
+        pages -= d->arch.paging.p2m_pages;
 
     for ( ; ; )
     {
-        if ( d->arch.paging.hap.total_pages < pages )
+        if ( d->arch.paging.total_pages < pages )
         {
             /* Need to allocate more memory from domheap */
             pg = alloc_domheap_page(d, MEMF_no_owner);
@@ -380,22 +369,22 @@ int hap_set_allocation(struct domain *d,
                 HAP_PRINTK("failed to allocate hap pages.\n");
                 return -ENOMEM;
             }
-            d->arch.paging.hap.free_pages++;
-            d->arch.paging.hap.total_pages++;
-            page_list_add_tail(pg, &d->arch.paging.hap.freelist);
+            d->arch.paging.free_pages++;
+            d->arch.paging.total_pages++;
+            page_list_add_tail(pg, &d->arch.paging.freelist);
         }
-        else if ( d->arch.paging.hap.total_pages > pages )
+        else if ( d->arch.paging.total_pages > pages )
         {
             /* Need to return memory to domheap */
-            if ( page_list_empty(&d->arch.paging.hap.freelist) )
+            if ( page_list_empty(&d->arch.paging.freelist) )
             {
                 HAP_PRINTK("failed to free enough hap pages.\n");
                 return -ENOMEM;
             }
-            pg = page_list_remove_head(&d->arch.paging.hap.freelist);
+            pg = page_list_remove_head(&d->arch.paging.freelist);
             ASSERT(pg);
-            d->arch.paging.hap.free_pages--;
-            d->arch.paging.hap.total_pages--;
+            d->arch.paging.free_pages--;
+            d->arch.paging.total_pages--;
             free_domheap_page(pg);
         }
         else
@@ -462,8 +451,6 @@ void hap_domain_init(struct domain *d)
         .clean   = hap_clean_dirty_bitmap,
     };
 
-    INIT_PAGE_LIST_HEAD(&d->arch.paging.hap.freelist);
-
     /* Use HAP logdirty mechanism. */
     paging_log_dirty_init(d, &hap_ops);
 }
@@ -484,7 +471,7 @@ int hap_enable(struct domain *d, u32 mod
 
     domain_pause(d);
 
-    old_pages = d->arch.paging.hap.total_pages;
+    old_pages = d->arch.paging.total_pages;
     if ( old_pages == 0 )
     {
         paging_lock(d);
@@ -566,16 +553,16 @@ void hap_final_teardown(struct domain *d
         p2m_teardown(d->arch.nested_p2m[i], true, NULL);
     }
 
-    if ( d->arch.paging.hap.total_pages != 0 )
+    if ( d->arch.paging.total_pages != 0 )
         hap_teardown(d, NULL);
 
     p2m_teardown(p2m_get_hostp2m(d), true, NULL);
     /* Free any memory that the p2m teardown released */
     paging_lock(d);
     hap_set_allocation(d, 0, NULL);
-    ASSERT(d->arch.paging.hap.p2m_pages == 0);
-    ASSERT(d->arch.paging.hap.free_pages == 0);
-    ASSERT(d->arch.paging.hap.total_pages == 0);
+    ASSERT(d->arch.paging.p2m_pages == 0);
+    ASSERT(d->arch.paging.free_pages == 0);
+    ASSERT(d->arch.paging.total_pages == 0);
     paging_unlock(d);
 }
 
@@ -644,14 +631,14 @@ void hap_teardown(struct domain *d, bool
 
     paging_lock(d); /* Keep various asserts happy */
 
-    if ( d->arch.paging.hap.total_pages != 0 )
+    if ( d->arch.paging.total_pages != 0 )
     {
         hap_set_allocation(d, 0, preempted);
 
         if ( preempted && *preempted )
             goto out;
 
-        ASSERT(d->arch.paging.hap.total_pages == 0);
+        ASSERT(d->arch.paging.total_pages == 0);
     }
 
     d->arch.paging.mode &= ~PG_log_dirty;
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -651,6 +651,7 @@ int paging_domain_init(struct domain *d)
     if ( (rc = p2m_init(d)) != 0 )
         return rc;
 
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.freelist);
     mm_lock_init(&d->arch.paging.lock);
 
     /* This must be initialized separately from the rest of the
@@ -979,17 +980,17 @@ int __init paging_set_allocation(struct
 
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
-    int rc;
+    unsigned long pages;
 
     if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
         return -EOPNOTSUPP;
 
-    if ( hap_enabled(d) )
-        rc = hap_get_allocation_bytes(d, size);
-    else
-        rc = shadow_get_allocation_bytes(d, size);
+    pages = d->arch.paging.total_pages;
+    pages += d->arch.paging.p2m_pages;
 
-    return rc;
+    *size = pages << PAGE_SHIFT;
+
+    return 0;
 }
 
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -55,7 +55,6 @@ int shadow_domain_init(struct domain *d)
         .clean   = sh_clean_dirty_bitmap,
     };
 
-    INIT_PAGE_LIST_HEAD(&d->arch.paging.shadow.freelist);
     INIT_PAGE_LIST_HEAD(&d->arch.paging.shadow.pinned_shadows);
 
     /* Use shadow pagetables for log-dirty support */
@@ -936,7 +935,7 @@ static bool __must_check _shadow_preallo
     mfn_t smfn;
     int i;
 
-    if ( d->arch.paging.shadow.free_pages >= pages )
+    if ( d->arch.paging.free_pages >= pages )
         return true;
 
     if ( unlikely(d->is_dying) )
@@ -958,7 +957,7 @@ static bool __must_check _shadow_preallo
         sh_unpin(d, smfn);
 
         /* See if that freed up enough space */
-        if ( d->arch.paging.shadow.free_pages >= pages )
+        if ( d->arch.paging.free_pages >= pages )
             return true;
     }
 
@@ -979,7 +978,7 @@ static bool __must_check _shadow_preallo
                     0);
 
                 /* See if that freed up enough space */
-                if ( d->arch.paging.shadow.free_pages >= pages )
+                if ( d->arch.paging.free_pages >= pages )
                 {
                     guest_flush_tlb_mask(d, d->dirty_cpumask);
                     return true;
@@ -991,10 +990,8 @@ static bool __must_check _shadow_preallo
      * hold Xen mappings for some vcpu.  This can never happen. */
     printk(XENLOG_ERR "Can't pre-allocate %u shadow pages!\n"
            "  shadow pages total = %u, free = %u, p2m=%u\n",
-           pages,
-           d->arch.paging.shadow.total_pages,
-           d->arch.paging.shadow.free_pages,
-           d->arch.paging.shadow.p2m_pages);
+           pages, d->arch.paging.total_pages,
+           d->arch.paging.free_pages, d->arch.paging.p2m_pages);
 
     ASSERT_UNREACHABLE();
 
@@ -1122,7 +1119,7 @@ mfn_t shadow_alloc(struct domain *d,
     ASSERT(shadow_type != SH_type_none);
     perfc_incr(shadow_alloc);
 
-    if ( d->arch.paging.shadow.free_pages < pages )
+    if ( d->arch.paging.free_pages < pages )
     {
         /* If we get here, we failed to allocate. This should never
          * happen.  It means that we didn't call shadow_prealloc()
@@ -1132,7 +1129,7 @@ mfn_t shadow_alloc(struct domain *d,
         printk(XENLOG_ERR "Can't allocate %u shadow pages!\n", pages);
         BUG();
     }
-    d->arch.paging.shadow.free_pages -= pages;
+    d->arch.paging.free_pages -= pages;
 
     /* Backpointers that are MFNs need to be packed into PDXs (PFNs don't) */
     switch (shadow_type)
@@ -1153,7 +1150,7 @@ mfn_t shadow_alloc(struct domain *d,
     /* Init page info fields and clear the pages */
     for ( i = 0; i < pages ; i++ )
     {
-        sp = page_list_remove_head(&d->arch.paging.shadow.freelist);
+        sp = page_list_remove_head(&d->arch.paging.freelist);
         /* Before we overwrite the old contents of this page,
          * we need to be sure that no TLB holds a pointer to it. */
         cpumask_copy(&mask, d->dirty_cpumask);
@@ -1249,15 +1246,15 @@ void shadow_free(struct domain *d, mfn_t
             free_domheap_page(sp);
         }
         else
-            page_list_add_tail(sp, &d->arch.paging.shadow.freelist);
+            page_list_add_tail(sp, &d->arch.paging.freelist);
 
         sp = next;
     }
 
     if ( unlikely(dying) )
-        d->arch.paging.shadow.total_pages -= pages;
+        d->arch.paging.total_pages -= pages;
     else
-        d->arch.paging.shadow.free_pages += pages;
+        d->arch.paging.free_pages += pages;
 }
 
 /* Divert a page from the pool to be used by the p2m mapping.
@@ -1276,7 +1273,7 @@ shadow_alloc_p2m_page(struct domain *d)
      * paging lock) and the log-dirty code (which always does). */
     paging_lock_recursive(d);
 
-    if ( d->arch.paging.shadow.total_pages
+    if ( d->arch.paging.total_pages
          < shadow_min_acceptable_pages(d) + 1 )
     {
         if ( !d->arch.paging.p2m_alloc_failed )
@@ -1284,8 +1281,8 @@ shadow_alloc_p2m_page(struct domain *d)
             d->arch.paging.p2m_alloc_failed = 1;
             dprintk(XENLOG_ERR,
                     "d%d failed to allocate from shadow pool (tot=%u p2m=%u min=%u)\n",
-                    d->domain_id, d->arch.paging.shadow.total_pages,
-                    d->arch.paging.shadow.p2m_pages,
+                    d->domain_id, d->arch.paging.total_pages,
+                    d->arch.paging.p2m_pages,
                     shadow_min_acceptable_pages(d));
         }
         goto out;
@@ -1295,8 +1292,8 @@ shadow_alloc_p2m_page(struct domain *d)
         goto out;
 
     pg = mfn_to_page(shadow_alloc(d, SH_type_p2m_table, 0));
-    d->arch.paging.shadow.p2m_pages++;
-    d->arch.paging.shadow.total_pages--;
+    d->arch.paging.p2m_pages++;
+    d->arch.paging.total_pages--;
     ASSERT(!page_get_owner(pg) && !(pg->count_info & PGC_count_mask));
 
  out:
@@ -1327,8 +1324,8 @@ shadow_free_p2m_page(struct domain *d, s
      * paging lock) and the log-dirty code (which always does). */
     paging_lock_recursive(d);
 
-    d->arch.paging.shadow.p2m_pages--;
-    d->arch.paging.shadow.total_pages++;
+    d->arch.paging.p2m_pages--;
+    d->arch.paging.total_pages++;
     shadow_free(d, page_to_mfn(pg));
 
     paging_unlock(d);
@@ -1345,7 +1342,7 @@ static unsigned int sh_min_allocation(co
            max(max(domain_tot_pages(d) / 256,
                    is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0U) +
                is_hvm_domain(d),
-               d->arch.paging.shadow.p2m_pages);
+               d->arch.paging.p2m_pages);
 }
 
 int shadow_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
@@ -1361,15 +1358,15 @@ int shadow_set_allocation(struct domain
 
         if ( pages < lower_bound )
             pages = lower_bound;
-        pages -= d->arch.paging.shadow.p2m_pages;
+        pages -= d->arch.paging.p2m_pages;
     }
 
     SHADOW_PRINTK("current %i target %i\n",
-                   d->arch.paging.shadow.total_pages, pages);
+                   d->arch.paging.total_pages, pages);
 
     for ( ; ; )
     {
-        if ( d->arch.paging.shadow.total_pages < pages )
+        if ( d->arch.paging.total_pages < pages )
         {
             /* Need to allocate more memory from domheap */
             sp = (struct page_info *)
@@ -1379,29 +1376,29 @@ int shadow_set_allocation(struct domain
                 SHADOW_PRINTK("failed to allocate shadow pages.\n");
                 return -ENOMEM;
             }
-            d->arch.paging.shadow.free_pages++;
-            d->arch.paging.shadow.total_pages++;
+            d->arch.paging.free_pages++;
+            d->arch.paging.total_pages++;
             sp->u.sh.type = 0;
             sp->u.sh.pinned = 0;
             sp->u.sh.count = 0;
             sp->tlbflush_timestamp = 0; /* Not in any TLB */
-            page_list_add_tail(sp, &d->arch.paging.shadow.freelist);
+            page_list_add_tail(sp, &d->arch.paging.freelist);
         }
-        else if ( d->arch.paging.shadow.total_pages > pages )
+        else if ( d->arch.paging.total_pages > pages )
         {
             /* Need to return memory to domheap */
             if ( !_shadow_prealloc(d, 1) )
                 return -ENOMEM;
 
-            sp = page_list_remove_head(&d->arch.paging.shadow.freelist);
+            sp = page_list_remove_head(&d->arch.paging.freelist);
             ASSERT(sp);
             /*
              * The pages were allocated anonymously, but the owner field
              * gets overwritten normally, so need to clear it here.
              */
             page_set_owner(sp, NULL);
-            d->arch.paging.shadow.free_pages--;
-            d->arch.paging.shadow.total_pages--;
+            d->arch.paging.free_pages--;
+            d->arch.paging.total_pages--;
             free_domheap_page(sp);
         }
         else
@@ -1421,23 +1418,12 @@ int shadow_set_allocation(struct domain
 /* Return the size of the shadow pool, rounded up to the nearest MB */
 static unsigned int shadow_get_allocation(struct domain *d)
 {
-    unsigned int pg = d->arch.paging.shadow.total_pages
-        + d->arch.paging.shadow.p2m_pages;
+    unsigned int pg = d->arch.paging.total_pages
+        + d->arch.paging.p2m_pages;
     return ((pg >> (20 - PAGE_SHIFT))
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
-int shadow_get_allocation_bytes(struct domain *d, uint64_t *size)
-{
-    unsigned long pages = d->arch.paging.shadow.total_pages;
-
-    pages += d->arch.paging.shadow.p2m_pages;
-
-    *size = pages << PAGE_SHIFT;
-
-    return 0;
-}
-
 /**************************************************************************/
 /* Hash table for storing the guest->shadow mappings.
  * The table itself is an array of pointers to shadows; the shadows are then
@@ -2708,7 +2694,7 @@ int shadow_enable(struct domain *d, u32
     }
 
     /* Init the shadow memory allocation if the user hasn't done so */
-    old_pages = d->arch.paging.shadow.total_pages;
+    old_pages = d->arch.paging.total_pages;
     if ( old_pages < sh_min_allocation(d) )
     {
         paging_lock(d);
@@ -2888,7 +2874,7 @@ void shadow_teardown(struct domain *d, b
     }
 #endif /* (SHADOW_OPTIMIZATIONS & (SHOPT_VIRTUAL_TLB|SHOPT_OUT_OF_SYNC)) */
 
-    if ( d->arch.paging.shadow.total_pages != 0 )
+    if ( d->arch.paging.total_pages != 0 )
     {
         /* Destroy all the shadows and release memory to domheap */
         shadow_set_allocation(d, 0, preempted);
@@ -2900,7 +2886,7 @@ void shadow_teardown(struct domain *d, b
         if (d->arch.paging.shadow.hash_table)
             shadow_hash_teardown(d);
 
-        ASSERT(d->arch.paging.shadow.total_pages == 0);
+        ASSERT(d->arch.paging.total_pages == 0);
     }
 
     /* Free the non-paged-vcpus pagetable; must happen after we've
@@ -2959,15 +2945,13 @@ void shadow_final_teardown(struct domain
 {
     SHADOW_PRINTK("dom %u final teardown starts."
                    "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                   d->domain_id,
-                   d->arch.paging.shadow.total_pages,
-                   d->arch.paging.shadow.free_pages,
-                   d->arch.paging.shadow.p2m_pages);
+                   d->domain_id, d->arch.paging.total_pages,
+                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
 
     /* Double-check that the domain didn't have any shadow memory.
      * It is possible for a domain that never got domain_kill()ed
      * to get here with its shadow allocation intact. */
-    if ( d->arch.paging.shadow.total_pages != 0 )
+    if ( d->arch.paging.total_pages != 0 )
         shadow_teardown(d, NULL);
 
     /* It is now safe to pull down the p2m map. */
@@ -2977,13 +2961,11 @@ void shadow_final_teardown(struct domain
     shadow_set_allocation(d, 0, NULL);
     SHADOW_PRINTK("dom %u final teardown done."
                    "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                   d->domain_id,
-                   d->arch.paging.shadow.total_pages,
-                   d->arch.paging.shadow.free_pages,
-                   d->arch.paging.shadow.p2m_pages);
-    ASSERT(!d->arch.paging.shadow.total_pages);
-    ASSERT(!d->arch.paging.shadow.free_pages);
-    ASSERT(!d->arch.paging.shadow.p2m_pages);
+                   d->domain_id, d->arch.paging.total_pages,
+                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+    ASSERT(d->arch.paging.p2m_pages == 0);
+    ASSERT(d->arch.paging.free_pages == 0);
+    ASSERT(d->arch.paging.total_pages == 0);
     paging_unlock(d);
 }
 
@@ -3000,7 +2982,7 @@ static int shadow_one_bit_enable(struct
 
     mode |= PG_SH_enable;
 
-    if ( d->arch.paging.shadow.total_pages < sh_min_allocation(d) )
+    if ( d->arch.paging.total_pages < sh_min_allocation(d) )
     {
         /* Init the shadow memory allocation if the user hasn't done so */
         if ( shadow_set_allocation(d, 1, NULL) != 0 )
@@ -3049,10 +3031,8 @@ static int shadow_one_bit_disable(struct
         /* Get this domain off shadows */
         SHADOW_PRINTK("un-shadowing of domain %u starts."
                        "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                       d->domain_id,
-                       d->arch.paging.shadow.total_pages,
-                       d->arch.paging.shadow.free_pages,
-                       d->arch.paging.shadow.p2m_pages);
+                       d->domain_id, d->arch.paging.total_pages,
+                       d->arch.paging.free_pages, d->arch.paging.p2m_pages);
         for_each_vcpu(d, v)
         {
             if ( v->arch.paging.mode )
@@ -3082,10 +3062,8 @@ static int shadow_one_bit_disable(struct
         shadow_hash_teardown(d);
         SHADOW_PRINTK("un-shadowing of domain %u done."
                        "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                       d->domain_id,
-                       d->arch.paging.shadow.total_pages,
-                       d->arch.paging.shadow.free_pages,
-                       d->arch.paging.shadow.p2m_pages);
+                       d->domain_id, d->arch.paging.total_pages,
+                       d->arch.paging.free_pages, d->arch.paging.p2m_pages);
     }
 
     return 0;
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -809,7 +809,7 @@ static void cf_check sh_unshadow_for_p2m
      * If there are any shadows, update them.  But if shadow_teardown()
      * has already been called then it's not safe to try.
      */
-    if ( unlikely(!d->arch.paging.shadow.total_pages) )
+    if ( unlikely(!d->arch.paging.total_pages) )
         return;
 
     /* Only previously present / valid entries need processing. */


