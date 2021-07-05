Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCB3BC184
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150524.278305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RFe-0003kJ-Vr; Mon, 05 Jul 2021 16:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150524.278305; Mon, 05 Jul 2021 16:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RFe-0003ht-SK; Mon, 05 Jul 2021 16:15:18 +0000
Received: by outflank-mailman (input) for mailman id 150524;
 Mon, 05 Jul 2021 16:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RFd-0003hb-8d
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:15:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0c01110-17f5-4feb-bf78-3aee15f5569f;
 Mon, 05 Jul 2021 16:15:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-QofTHA8xOuWANYvNt19zcA-1; Mon, 05 Jul 2021 18:15:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 16:15:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:15:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:15:12 +0000
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
X-Inumbo-ID: c0c01110-17f5-4feb-bf78-3aee15f5569f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iQ7NFvbW+C8AVXqVXivhOo4ScWJDlsGayh6E5RebDA=;
	b=VTMJdj0DlDgkqRvrk6trBQF2WiU+I5xSefMhgl9E1bzjRAwSEefTtGmWSTWY/i/XORRyy5
	ENp6HnzKA3hOBoHmXJSDecp/PWw4nW6bEti1oEoPbg9WrqrdUzJEB0EvtpJSl1An5rbzqI
	/65gy1TCiIrMUWiPpbhixGB1tjyAM6Y=
X-MC-Unique: QofTHA8xOuWANYvNt19zcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvxk71p3QR6z/zusqPx7xVWThBcWaQYHX2jGEWDbXize9feHNtbZmKkHRSxCQfNCZVP71BvNaj4kT0CbOsTCtUwhNrVf2bDhy11dBQglKsUTb3X7D8Cwdtc3v4a1ue+W9vozpJz/mv4VTbiHIMeZVF5JgZyT6iAyZKut1wOhW2PrznDuLSXA/Mpy1ewe/FwICMhkDjMQIC2sgEoObuWQKIlj+I9xgQQlG+60ZlgshA34HEhFHYdmul8fYTvN4UZZ97CBStCIb9Y7KmPYKp781FYaRSpqNWgQWWeml+7rzrrOSyXEuqiENGmyeGDVcSYcdY7FSypdAc4cnDzP/7MTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iQ7NFvbW+C8AVXqVXivhOo4ScWJDlsGayh6E5RebDA=;
 b=kTj5xYCcklD3WCzDAdIxQAk/pEp8/L6zo7xtvgsWLarNADYt5Z2aa1WluFgF/gjxNBmdiQ8Nv4ZwogJfr3fwFrFqxTpOoEBYc6KA9ohJnb3FFrj5lLtaXaqun1eHLBxafVPpdJvBXJG5hPXAKB0lkHRSQjWGxirY4GJtiIC1jvwtajvzXadokO9kCBe1a7s1gihAl0cBMwYvBV3yHkT5QJYJnVKZqzcm18o0YgTGEaDxSRIJ/SdKY5gVekcvM+tVFElOWhxlUbcThBH9Eo+FX8aNahwtuPA0MEgnr7DkJ7XENda7KSEoYGrQkPVES3fTA8aRBnQSJV6B0Y4gfCneCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 16/16] x86/P2M: the majority for struct p2m_domain's fields
 are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
Date: Mon, 5 Jul 2021 18:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89328dc8-2bea-42e8-ec37-08d93fd01178
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829D43EA906FAE8F8D00EAEB31C9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kBgnuxcckez0tquYpN98TWJmV6IcLHtavT7e/OFTJCUWCa2cEpfWNEph5osySZTINf+6/ieVF8o8Na77K/Sr8GnemS8a2YMaj5aNosDOPaCuqlDL3biy8SBCHSOhl+31AYssCIEITpIVBzIccvBju13n1sDimnXtGVNdNGm378H0tx5MMR+jkxQKUdW5QmmD8KDqWOezoTO7qc4I3Sd+BNr9crA3HHAYNOT5Wrs28IeX7oGs9hiw6fEtYzmdffVin1hrzf1xy14t0HOs5KwEHAYUbxVqGWCpfYoM+dL5RcbFY1G0PrUlA3Yb/MAw+t6EOFzclwtH7ay0ow4KpFMAMX7ixlI7qQLcbLcp0PQhxu2VEG0JXdNhUgxA9uxoOt0Fvg0/dvDbDlJ/Vx0iVWbODp9C6x2uDseFt/7TyN0Y9lRpfPC2teEdTBkwIZID9Tj/K2rVQJqZ2EYgQqVWr2a9DsTqLZznmhcT2cexbsaop0HynaCfMSimICNus7uAQ3LM7Sp/YjFMRlaNwVkAEf8ZxWE7wOwjsYKVwPntk4JeusGfO4lBq1yxR6KEIPXxVcy4h0xP7A/yubaL+78moyElNJXP+iTHJeB/i6rKLhYkjSqOW3FRYwyALsce3udjGDKuwbmOcV/g0oARFGedKFZLbjGu5dqTayET8n74n9FmrxaqAdz5cXnr9GwK6sR29H5l/OYMLeqJxCTHZ0HLoQyMOv+qDzd7V/jDZeCIkKTYbe0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(6486002)(26005)(16576012)(478600001)(2616005)(956004)(86362001)(2906002)(6916009)(316002)(83380400001)(8676002)(16526019)(66556008)(36756003)(8936002)(38100700002)(54906003)(31696002)(4326008)(66476007)(186003)(66946007)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXlZMGtQb1h2enVJdFBLdFM2eDNVNkJORGt0OEhOemQ1Z1FpQjJtbytiUHRN?=
 =?utf-8?B?amZIalZDVTFiaC9uYVN6T1hRYnlwM0svYlpvYTJrMTJDYTh5Nkl2b1Z2UzdH?=
 =?utf-8?B?V0o2d05peERweU1yZlk4YzFDNy9peWN0Z3lsRzNyZU5Kck1lME9CQlY5N1do?=
 =?utf-8?B?TERoM01lcWR1SFBJYXBzQmtFQzYvNUZoMmNOSHJrTW91MnBmeEJEb2w5WnVl?=
 =?utf-8?B?YUFIN0NzdTZCdktDdGEyVy9iMlNvWmM3OGpqenV5MGdRRUhpSHV5RXFqaVBN?=
 =?utf-8?B?U1Z0VjJ1SHY1K0dHVzk5dzJ6SUFYVEZSN01yMTFVdHFLZnZGcDFIckF3ekd5?=
 =?utf-8?B?NXFUYnhkcWxPekgxRnhHaXQvV2Fha2k5MHp0ajNtallFOG9zS1hZSGloMkRq?=
 =?utf-8?B?b0JTUmh5U3RVaVpPNU1ITUI0bXl6cnhSY2o1QzJPdExBUGNqQ0dNYVJIV3Rj?=
 =?utf-8?B?dHhSUnNnU200djVSV2EwcDRhckI5Q0JnamthWVhWYUhNMnExc2FZMzJ0NHUy?=
 =?utf-8?B?bjBSVmliWmFNSkxRNWRLM09Pc1dEemdtYUYrR0FYMmIwcVk0ZkR1TzhDc2Zx?=
 =?utf-8?B?cTdCMWJJc0VFZzczaTZ0SVBmTUM4MUNHclZaV0RDM1lXanFoUEZMeHAwZHRQ?=
 =?utf-8?B?WDJyNktyekpQTVBKYXFNYWY5bzRaYmg5VzZSMytPYmhsV3pwVVJFd2FiemZv?=
 =?utf-8?B?Zzh2NnRObm9HMnB2UkgxNEppcXBRaktYMjdaMmRRT3pRU3FYT0tBVGJrZGh4?=
 =?utf-8?B?UEtKMmxKVWJYZnRZYVI4QjNmb1JOcndSSlRjcllrTHB2dXIvditxKysvcUFK?=
 =?utf-8?B?TWR3K1h0TDNnRFRkbElNZkMxUmFabm8wY3hacmRQWmZaQUlrTVp5WGUwYXJt?=
 =?utf-8?B?MlFRaFU0d2dhQzBJWit2UUhvbUhieElNdVY5TCtxdUh3ZUZsRTJnYXljVUd5?=
 =?utf-8?B?dVdnWXdzWEd4MHM0WmpwL2JuVzhYWWJGbENvOHVoamE5K2N6UXp3K0NJRk4y?=
 =?utf-8?B?WlJ5czdsWmFRZlZ5ZlJ4YTN6VWxwaTFCOFdabDBMTEgyMGNjaTlzaTdML0Nx?=
 =?utf-8?B?aWhsc3RjRTJiMllFTGNndmg5VTZNNUl6eENhcHZpTm8ydWluWU84OHk3N3cw?=
 =?utf-8?B?cHVaZ3JFNzhMdFkyNXVRTXRRUEN4N1pORzlBdnkwWnlVN1JHUEtHNWowM3lL?=
 =?utf-8?B?YlpQcG4ycnM1Q2xvOXJDc05qQ01GSVZJc1ZxR1ZXVGFqWGVjUlJzQVVqelpT?=
 =?utf-8?B?RU56bDcvcENOMlVkaTl6SVlHMWxpcW41a3VhUFpzSi9wS21TYUJqK0ZhdmNU?=
 =?utf-8?B?YzZkRmNTblNocDJSRldlWFRSS3RBeS9Xa0RDK2h3anc1ZFlnaXJ4M0s5c056?=
 =?utf-8?B?b3I5UkNBQ1c5U2hDb05uVFJFVEZJdWhINkVtKzZrakRCSEpXcmpBMThjQmpJ?=
 =?utf-8?B?ZmNsaGUrNnNDckxRSHNMcXlDd2RZaDZaTndiRHBnYk1NdHBpWFN2cHlzQThK?=
 =?utf-8?B?VFpKemtSeklhZ0ZLa2lWSllROWtCQTJHNTJXZGVmNzFUT1Y3SE1hRmJUQm1T?=
 =?utf-8?B?MjBxdU5VVFBHNmk1NElNVUd1bE1xNkJYZEdWRUpwVXhuL0hZVDlWd1NlWlpy?=
 =?utf-8?B?QldzOTY5RUcwaEhRV0tqNnRHOUp4dnlpRUVnY0VBNy8xMTRrVzBpZ0M1R1dQ?=
 =?utf-8?B?MS9CMFJ3WHExS0lwTkR5Q2k2TlhieEgvOUgyQTdhL0Q2S2p3S2J0VGY4ZzFH?=
 =?utf-8?Q?VVX1uwJtD9CgQyX5krkZRdqde3NgtPJas5IzYMQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89328dc8-2bea-42e8-ec37-08d93fd01178
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:15:12.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAXSYouP5oqQROLj/oh5fZPvO6vhavgpVtp27wNU8yxebLDqwJg1+mp0Lqaf9rd5GWWTmbqNyeGFZVYnocF5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

..., as are the majority of the locks involved. Conditionalize things
accordingly.

Also adjust the ioreq field's indentation at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -338,7 +338,7 @@ bool arch_iommu_use_permitted(const stru
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
             likely(!mem_paging_enabled(d)) &&
-            likely(!p2m_get_hostp2m(d)->global_logdirty));
+            likely(!p2m_is_global_logdirty(d)));
 }
 
 /*
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -199,8 +199,10 @@ typedef enum {
 
 /* Per-p2m-table state */
 struct p2m_domain {
+#ifdef CONFIG_HVM
     /* Lock that protects updates to the p2m */
     mm_rwlock_t           lock;
+#endif
 
     /*
      * Same as a domain's dirty_cpumask but limited to
@@ -220,13 +222,14 @@ struct p2m_domain {
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
 
@@ -269,7 +272,6 @@ struct p2m_domain {
                                               unsigned int level);
     void               (*write_p2m_entry_post)(struct p2m_domain *p2m,
                                                unsigned int oflags);
-#endif
 #if P2M_AUDIT
     long               (*audit_p2m)(struct p2m_domain *p2m);
 #endif
@@ -304,7 +306,6 @@ struct p2m_domain {
     unsigned long min_remapped_gfn;
     unsigned long max_remapped_gfn;
 
-#ifdef CONFIG_HVM
     /* Populate-on-demand variables
      * All variables are protected with the pod lock. We cannot rely on
      * the p2m lock if it's turned into a fine-grained lock.
@@ -361,27 +362,27 @@ struct p2m_domain {
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
@@ -645,6 +646,15 @@ int p2m_finish_type_change(struct domain
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
+#else /* CONFIG_HVM */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
 static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
-#endif
+#endif /* CONFIG_HVM */
 
 /*
  * p2m type to IOMMU flags
@@ -942,6 +954,8 @@ static inline unsigned int p2m_get_iommu
     return flags;
 }
 
+#ifdef CONFIG_HVM
+
 int p2m_set_ioreq_server(struct domain *d, unsigned int flags,
                          struct ioreq_server *s);
 struct ioreq_server *p2m_get_ioreq_server(struct domain *d,
@@ -1006,6 +1020,8 @@ static inline int p2m_entry_modify(struc
     return 0;
 }
 
+#endif /* CONFIG_HVM */
+
 #endif /* _XEN_ASM_X86_P2M_H */
 
 /*


