Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629C3F602A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171468.312901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXK0-0000X3-S2; Tue, 24 Aug 2021 14:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171468.312901; Tue, 24 Aug 2021 14:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXK0-0000Uf-Nq; Tue, 24 Aug 2021 14:22:36 +0000
Received: by outflank-mailman (input) for mailman id 171468;
 Tue, 24 Aug 2021 14:22:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXJy-0000UT-Lm
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:22:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8bb468a-04e6-11ec-a8dd-12813bfff9fa;
 Tue, 24 Aug 2021 14:22:33 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-EAaiN3pKMOCs2cTi7xXhKQ-1; Tue, 24 Aug 2021 16:22:31 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:22:30 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:22:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.5 via Frontend Transport; Tue, 24 Aug 2021 14:22:29 +0000
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
X-Inumbo-ID: b8bb468a-04e6-11ec-a8dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=so4Ky1V9NCja2VXT8wrI2XRvzJ/MB1YyQWdii1AitFk=;
	b=RSxw5IIkh6vKJSR+1eUE14ly6vLWXSWeVUUbbmcZZaW6py7Be3Bud0ILh8QK+QfPufqvSg
	yHfJH7wNX+hZ9q9haWspmDQEqO6mTpC4nJnAvwelL3+YZJYpCI/CLH/1g2hG3gjWBnhxyK
	/3QmdiEed5BSXxYtl48kkcjd8nfRWDg=
X-MC-Unique: EAaiN3pKMOCs2cTi7xXhKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5OQ56glue2IGjcQnXiv1GxbpS2z9UZ3jYunFpon6Ki4yT+NJP6+TsrO8ipEkmyENf1DsOZbiXS6B14Eo0ngMk/hx+ugVNbr7rb2QetnUPuRiVOxF3SNhQxSSMPv1B8968oZxb8Q7Sq50bsxJ35INzSWj2CCoCkHhRZVQjm1Vzgxe6cvw+RhQXuOoOA8C+Z5VS/QFv5kMHpRsed3ISCmROBXNF4ZZRZ8rt74GOpuuCYQNqNtKL2nlArDGS2/NiSb/OmF+RAjaLQokzNqU+6NiCnxEYNet0OaXl/+mFv1uGiVaXmatfui+M3FYe2rdquIXEBfyCnjvIeD8dyjWsozug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so4Ky1V9NCja2VXT8wrI2XRvzJ/MB1YyQWdii1AitFk=;
 b=Svs8+XK8AjLd4rn8JXBSr0Saej9T1Hzm+10qLbhMaSA9mTuaAbKXliKKPFtGZuAsyWL6CA1TICfRko6o73nokiMulZCbBwR1HaCAh+4qEx6LgZ8RV3svAEh+7lmuW3TNDJSzX5/5A92WCkXk38L+4PqOqu+yBx1jofKZ1JQRibNOO+y1rgYHtFkYYnHpbRtm7tN1aqoxhu9Xebn079GfZSHZ8wwqN0zXFF9pFVLI7vNwHg/kM78qcMNPkREk25Op89kqP4LD6dq4NmbwOiGoaaqs2Qb/oXTiTMRL0X1Pgu5VLAlmq0ZDhyUcGjnN+V0i/1F9M3Xhj2xs10j9YRKajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 09/17] IOMMU/x86: support freeing of pagetables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <41171b38-2e06-74e9-364f-02736f5d93b4@suse.com>
Date: Tue, 24 Aug 2021 16:22:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73ce02b5-3dfc-46f0-8df6-08d9670a9b42
X-MS-TrafficTypeDiagnostic: AM8PR04MB7841:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7841235A1A8BB97B0D5F6217B3C59@AM8PR04MB7841.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QqaAmhj6g8c0NqW0JFQL/GJxdp5ctMfsLW5GFKGtV/qrWZlj4Zj6SA7kjX3+5OSv6hy4c1NiWocj9o9Agkz9y+gTXQsZv2W8JtAJBum1fYGEZaHRSc+nBg7JG+BzlxuPedq3JDG7SFfKLgo3b9wD1ilGupEt0GXEnHzYJN2VBHrdHSGF8GrlvnGJOnZNgKzhJTtlAJuM3sE3Hu7zyaiq6QpNf8ZjUkL54+8F2/mFPJTnEjJcQiQVifRM/5TbG3gflqJSGQwjllUIu92A/Ba1CWyK8a1vauzQnIpHHOXCLo8Wij8R1oDs4kUI+4yavQtoL8kCmJL+OU0IMXAlLynIK4Jg3WZN7mK4TnN0pW6T2KdPpjIoM8C60We1iZqHskmsXkLl+6XA/ETzN+QKlFaGlEfLw5c+AvVHoATfB8QrUuOAbP9wq1mXctST03+DzPBhN547rXdGHIkhQdasRkwyDTIV4gsToBQeBdY0ljYHIlZ/E5q5uVTkH1xrSCo63NatCJ0ca/PGdvdBFEC21ZaeI/sQiWSk3XlXekcmp3v46kCYewiUqn51IHAE/FpFIuR0TIcGZOLOigRJZ/T3jflh8HunWi6dW48q9It7icjd4FKO3HFGsSk9GZ+0HhppGaSyjgRQuQsjJ1DeJ/HVSDUaVxsx1lTy3OoPck2qkwW7V75t6irn9+ZQEXO8YXTdX3H3hlYyKwiCARrG6hDHEWP/LS0YM3QojcSFFFFaAhhvq5e/t2Z5nUjAXy320JcXB9jbBwxD4MnkW0QLW2MqvjZLs8lWhDaOJJDCa8Qr/NUBpM/xcvhOZ/N7YRIvN+Ab3S1o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(396003)(366004)(376002)(136003)(38100700002)(8676002)(83380400001)(26005)(6486002)(31696002)(31686004)(5660300002)(86362001)(54906003)(956004)(316002)(478600001)(36756003)(2616005)(66556008)(66476007)(16576012)(66946007)(6916009)(4326008)(8936002)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm9KVEJkMTJiRG1tUnE3cFN6TkpnU1NubFUydkltYzBPYjFaN2Nwb2VnYXdT?=
 =?utf-8?B?bThuQWREL0NnSkRSWWNpQmo5VWxmV1dqWjQ4RmVUV2wvTHpDRTN0VVY3S1k4?=
 =?utf-8?B?dmtWaVFKZlZwWE9MSUtDc1pPa3hna0kxNHJ1SlN4SW51a1FPMitTQm56SFha?=
 =?utf-8?B?L3JjT3JrM1k2b1pDRnNCeFczci95cmwxaThpSHlFMlh4K2dnc0pFS0xJSitU?=
 =?utf-8?B?YzVSaStDRDdCaDlJelIwVFZTZ1EyWENRbEE5NWdhYXR4d2hSS1g2M1FmMkFJ?=
 =?utf-8?B?cnBpNDZ3aFhVZXFyeHpWWjh0UkllRjNVYVBKdlZDaWFvVlYzTkpvQ3VtaEZx?=
 =?utf-8?B?YUM3OUJxVHBCOFk1ei9DYy9HT29jOHV0eVIzN3pPNTlsbWJTY0JyU0FBcmxO?=
 =?utf-8?B?SkkwSlpZYWJZR0RkejF3a004aXhXOXY2ZjJVZFlrTW9sWFhkWkVndzJ0cnZ1?=
 =?utf-8?B?aHY2Sm11MkkyTE42K1VYZ3VEVk0yNzhLdkNpRWRoeHIzWHhsWmFXV0VETksr?=
 =?utf-8?B?NGVLdjBSdlM3ak8rcVduM0J5K2JlUk1XK1pyUG1qa2VySnhIQ2NMcjdVQmx3?=
 =?utf-8?B?SE54dTEyVldRSzBINlQ0V0ZiVy85dFZVVXBMenRMYUtwTkIrelE3Z1VTVUY3?=
 =?utf-8?B?K1A3YVRtYjVnS21sbk1yUEVPbEsxS3A1WDBDaFBmclFwdFpiZGdvLzArQ1Nn?=
 =?utf-8?B?T3JEUVRvbnVFZVZkczVxSjZ5QndOWUQ0VFNqRCtzRjFldFZ4dUFFK0FrWW9L?=
 =?utf-8?B?Tk5PWHNsZTF0ZHA5enY5dUhoS1E5TEwwS3pVQ2pZS3BsdGlENVFuQjBSVDhV?=
 =?utf-8?B?VjZIdjhKTFA4NEg0OHpLbVY1SHROMGE0T0NaOWh5Z3BiOS9Bb1pNYi96TkZD?=
 =?utf-8?B?Mk5iV3BieFBPanlwbDVkTGs5OENLYkJVWkRrWUNGelh0QW5HV05xOWRyQmVs?=
 =?utf-8?B?M0tibHRmQzFSeFJzSjUxK2xUNHNDcFU4MDQ4VnRKUjFELzUxU2J3V3VML0dG?=
 =?utf-8?B?aktYUEhmUzRDUHNJZTFTbzlYU2lxZUhuOFFDT2lmMFAwR25uU00rNE9TMU8x?=
 =?utf-8?B?Mk4vMW8rT0ZQeWhUSEk3eXB0ZzBXSWpTL1NwWW0vUlRXVDgxVk5RUTNBYnYw?=
 =?utf-8?B?NXFkZ3NEamdhRU9YbmdtdzIzK3N1aEM4OUlJQzBFS1NIK3YvRFk3RFlRdm9j?=
 =?utf-8?B?ZE15dW9mUDNrMmVKY1RIYUxVbWQya1JrY2FZc01mdk1pdjl6V2VRazBGbWYy?=
 =?utf-8?B?dTV2ejZtRVNKUmsvT1N4UkEwNit2TXNoWjlGUDlWVlZINHkrWTd6cnFtdTVm?=
 =?utf-8?B?MzAzWDMrbGp4Ynp3dWQwOC9xU1JlckdoUjVFL0twTmI0L09LWEVOVk5sejAw?=
 =?utf-8?B?cjFXMUR6Smh6Q1ZxZVp2WU42TWp5QWxuVGU1Z0xrd2FoOFU4ZFNDK0RwYzg2?=
 =?utf-8?B?K3VUa0dTV0pheTdxdFVKRjAyelZ1YlJCVUVoMThXYm9GVXY5MjkzVmtpWTVM?=
 =?utf-8?B?UkhvY3VzVi9lLzIvSXBSYXY3YUMxckFwbWxLSFpROElPL1Q3MGcxWDdRNEw2?=
 =?utf-8?B?SnRMT2UvNGNSYldvV2hFMExqV3dueGhrS2dqbG5raU9DMktaRlhIeWZFY3RF?=
 =?utf-8?B?bFdwaytsOWlhL2pqdDNweE1rdm1idTdLTzRvTFQ5bEphZXlMRWQvT1I3T1Jq?=
 =?utf-8?B?K3E0MENaTkdxdmdxZW4zL3M5dGJUUFROdU1Td0JSd2hhb2w1YVN3SW9UcnFU?=
 =?utf-8?Q?XECWTDys0DSTMdkhsDkp0tUJYtGtw6C+DYS/rBX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ce02b5-3dfc-46f0-8df6-08d9670a9b42
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:22:30.2809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5FO5k9kw9BodPkSGAFMIW1l+nrDOxvRb7GeDG0jxkbbBWmIL9ib1+KZl2NP4ktgbHzh0u1S8AbRo0Y4zUuxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

For vendor specific code to support superpages we need to be able to
deal with a superpage mapping replacing an intermediate page table (or
hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
needed to free individual page tables while a domain is still alive.
Since the freeing needs to be deferred until after a suitable IOTLB
flush was performed, released page tables get queued for processing by a
tasklet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was considering whether to use a softirq-taklet instead. This would
have the benefit of avoiding extra scheduling operations, but come with
the risk of the freeing happening prematurely because of a
process_pending_softirqs() somewhere.

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -12,6 +12,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/cpu.h>
 #include <xen/sched.h>
 #include <xen/iommu.h>
 #include <xen/paging.h>
@@ -363,6 +364,85 @@ struct page_info *iommu_alloc_pgtable(st
     return pg;
 }
 
+/*
+ * Intermediate page tables which get replaced by large pages may only be
+ * freed after a suitable IOTLB flush. Hence such pages get queued on a
+ * per-CPU list, with a per-CPU tasklet processing the list on the assumption
+ * that the necessary IOTLB flush will have occurred by the time tasklets get
+ * to run. (List and tasklet being per-CPU has the benefit of accesses not
+ * requiring any locking.)
+ */
+static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
+static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
+
+static void free_queued_pgtables(void *arg)
+{
+    struct page_list_head *list = arg;
+    struct page_info *pg;
+
+    while ( (pg = page_list_remove_head(list)) )
+        free_domheap_page(pg);
+}
+
+void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int cpu = smp_processor_id();
+
+    spin_lock(&hd->arch.pgtables.lock);
+    page_list_del(pg, &hd->arch.pgtables.list);
+    spin_unlock(&hd->arch.pgtables.lock);
+
+    page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
+
+    tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
+}
+
+static int cpu_callback(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    struct page_list_head *list = &per_cpu(free_pgt_list, cpu);
+    struct tasklet *tasklet = &per_cpu(free_pgt_tasklet, cpu);
+
+    switch ( action )
+    {
+    case CPU_DOWN_PREPARE:
+        tasklet_kill(tasklet);
+        break;
+
+    case CPU_DEAD:
+        page_list_splice(list, &this_cpu(free_pgt_list));
+        INIT_PAGE_LIST_HEAD(list);
+        tasklet_schedule(&this_cpu(free_pgt_tasklet));
+        break;
+
+    case CPU_UP_PREPARE:
+    case CPU_DOWN_FAILED:
+        tasklet_init(tasklet, free_queued_pgtables, list);
+        break;
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
+static int __init bsp_init(void)
+{
+    if ( iommu_enabled )
+    {
+        cpu_callback(&cpu_nfb, CPU_UP_PREPARE,
+                     (void *)(unsigned long)smp_processor_id());
+        register_cpu_notifier(&cpu_nfb);
+    }
+
+    return 0;
+}
+presmp_initcall(bsp_init);
+
 bool arch_iommu_use_permitted(const struct domain *d)
 {
     /*
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -136,6 +136,7 @@ int pi_update_irte(const struct pi_desc
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
+void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*


