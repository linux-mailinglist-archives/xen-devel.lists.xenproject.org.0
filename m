Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876F416F71
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195117.347645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThoi-0000PN-MR; Fri, 24 Sep 2021 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195117.347645; Fri, 24 Sep 2021 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThoi-0000NC-JT; Fri, 24 Sep 2021 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 195117;
 Fri, 24 Sep 2021 09:48:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThoh-0000Mx-Cn
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:48:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9034335e-1d1c-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:48:26 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-As5PKxn4PvSSFiflEF4zwQ-1; Fri, 24 Sep 2021 11:48:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:48:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:48:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:48:23 +0000
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
X-Inumbo-ID: 9034335e-1d1c-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=151rl1mGGzZn83HuceugMX8Iyq5H3jwKYMBAqhoHteE=;
	b=lSVyiqs+8ghGfNwz4Q+1WzhguZ90YH903I5yv76w85ORSo2hvH6vt49lqHBRNbBGU4OS+Y
	bo/z59uZqWxSyOPkqTvJ1zjxkVKoduyFygGC+V3Yi4rt0rAOfP539wDLW1uu+DScG+aDjz
	XZjq1djoJCdUhzJ3SMigGNwXVgGhEu8=
X-MC-Unique: As5PKxn4PvSSFiflEF4zwQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJe3Ed7vXfSsY9jLwApv6GWY9JcwvFKdo5gXdBn7+vlj1GgNEKBY+4HtRfp8Mf+P/X7Yhw7CWWa8W8ucjEFWE1KBox9qTmCr5g+sdXFo+4CyF0Oo5et8P+hLdgc3i2rt7tSROt8gPARSLo6dx/0RXzeUhcSRkckErwWq/e+uQ9ar3iS3T612YWn0PSV5vYevStNZct+CrZo9EY+rJx+9OzuZEgjGkB0nO5a0h7A+sywg9JFcINh00GjBkKTR2C1MKCEsBLUbcIjxEhPJflhz/LriDcqIZD1gUyrpl2RRIyDjSGZYMYcqBP1aDqnqXxBrBZEv9N1n+sNX2HL30rfWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=151rl1mGGzZn83HuceugMX8Iyq5H3jwKYMBAqhoHteE=;
 b=Flz7lE5uXkmVdwABDcL8Qc2JFrMX57bzmt0R2EsR0qglV517fogxDcmsLt8focPsp+oUjnUU2SeUxofC1DEcmsrOlc3EOFtOCLI+1PVIk/grT1cSH4JM4uSdbljwcYNNBLa9XUIqk+tpHT5cCyd2+AeIH7f206RdEL8SVz8YlPriJ1kMBgXlW8lOxlfvQVgyWIEJxRNH8tvCqXsku2xz4Ewq33Sfh/g+yn9tyqGwtVQziFImkuuhpAYj1ZBBzkzY+Hridqkm+ujsHFNPGoJq96dXrD7/A0LLEITcQNO1Snf1iEj97352UXvgsTLA16H24zQv9ztPJFNYB3/+H8L2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
Date: Fri, 24 Sep 2021 11:48:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c925c99-869b-44cc-d280-08d97f40732f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383D3F380362AED5E2D87D0B3A49@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UoTjbOIIz7dQ/dbSoFlRrQkf4wXyncZyCIjeAq1Ir4b1ieLk8hDbar30qp3snUKZbALNgdEWcjJmePwdR/g1TaLjlw18JIPU7lME5/GFlKiRyfRKye4ZMxgCButMTVFuSIuWUKYDFdqIYvxZ7d+2K/Z4bQJOqnKKgL8m8K5k3q46Rlf/1wY8Og3Sf9sUbVfb5UQEbv21P1aBFLOO13Y0KGrA75Yq362rl2mXg4rsz4CTC9A8x7goEHtT4AYepTjpsm9qDxeIn54ou9N2CEYS3tYCXs2R37uyli9WhehzGO64QO/lSQFmc3lJ0LkTNYak5ehz6IjZbI7HSjkWYsYMuMd/4pVAbj+6j2iXwVbmyhFz9ifKui57Lr183VCKu7SCswmHev92+AWQwWhoSINAxStNFpn4vfevXr1cylGt4d43hMqdMb/U6YVLOVfKPRxMEQy+4Bd0go8+1MbgjxFgc7azsToAMjp8TEvohyJxv15yFwtuDPRcDtybLaqPqDte7ZT1PL4mgccW8y3nYGsplC91qTFAGRajbesNRa26g/oRIQBGL085MdRgZQgdpIBWKOto7Va+jdMdpNjCRVoLURzkQulirwUIFR1nY1rwApWJTgPs7/t7PAvVHVul6yV1JZ5hYODnsjFvWUmyNbICANn6BKXi8JTvsIpiYcLG7tsJH7T85dJLqrpSlLrq8oGOkIKuxQUMGs6Jq8/tf6qbUnIxFmHqtxDfeD7rnJ43RaYOkvcRT70a7vSpDAx+UqQdrefKquQoWhQT3ldikF6hYef8NroEeEcBa5dHSI5DVXv+qQ+3HciZ2fSWXsbCiyuC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(31686004)(8676002)(16576012)(38100700002)(83380400001)(54906003)(26005)(36756003)(66946007)(31696002)(2906002)(186003)(66476007)(2616005)(66556008)(86362001)(956004)(6916009)(8936002)(316002)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUE2d05HK08zYkNJUUw4a1BYQURXV3RSQkptM2pBWU0rQWt4eW4wMG50K0lC?=
 =?utf-8?B?TkVrblhnK255TU5PKzhHUDZZU2JJS1JueGFDMC94SHhBNDVwMWdKUnlzRU1o?=
 =?utf-8?B?cXpGazFGT0cvWHFJUGJPN0Qyei9kcWNmZjN4blptbDlLT2lCaEJUZkJOSk1S?=
 =?utf-8?B?dEZaMklsbWEvZTlsbFRUUWZtbHlaSERFbG1mRmFRMVR4R3NtNFhHQTc2VlNX?=
 =?utf-8?B?VnIxY2J1cENoQ0tjLzhmbTYxVWpUYnhvYWpIWDNDMWEwY2xLVFJBWWxRZ1hl?=
 =?utf-8?B?eXVLZU52VGk0b1VtNy9oUURYd0FGazcwTnhzN2FzZW01TmI0b25QWmhZWHZI?=
 =?utf-8?B?ZGFkcEdEeGdGSUxSWXg4OW9RMkhuTHlsS01KNllNOFU2d09YdjF4d1NnMjdO?=
 =?utf-8?B?YkhwY3BiOVBCVk9sR0Q1SWJ5ZkpsTjlrOTFZN1ZJZ1lzLzF2VE9SWDZVSU1C?=
 =?utf-8?B?Z1JNdUZtSzUxN05SSzRFY0RjUi9QL2ZNOTVlRG90dDRtejBVS2I3T0pTL0xa?=
 =?utf-8?B?K1N0VlM2aEo0OWpsUThVMTkvelFUS08wc0xWdXFTTmNUTnB2dnQzbjhkS3hY?=
 =?utf-8?B?a2hEa3RuQWVIZitDWWpjU3BTb0w4WStEZTRRellodWpMMzl2TFZ6bUU5WWh5?=
 =?utf-8?B?M1JEWE9PT3dMdjNnWENsTXNUZTNXRU1DaEpWTjF3dG1zVEJXU04wRDFnRjJC?=
 =?utf-8?B?RHZFdFlzZE9Camc4dEc1YTVsV1RsTm40QXJ5VTF5ZnNVVWo0c09yK2FJNFZw?=
 =?utf-8?B?cGJEY280SlBvSnlpUllOejBVeUxTelhTeE1oMGU4QnVjdS90MThyYitIRTdq?=
 =?utf-8?B?ZEJIeGVNdTl5bDRtV3JENGMrdVQydzFpNEhKVDNIRGNFMEVlVmpucVJVazBI?=
 =?utf-8?B?amk2cFRPTzgxMUNpbnFZRWhNQXVXczRFeHVVNjgveVFEQ24xUjF3OFdpSjc1?=
 =?utf-8?B?RWJOZDI0ZWVObGorbTNEeENtZ2pkLzNLejNjQW56MUVZUWhPR1R1V3djY0tM?=
 =?utf-8?B?dVJqWk5TaHJXbUQvdllIKzFxZEtDZHV1RmF2V2swNDljWXZRYTBwYVlKVUdL?=
 =?utf-8?B?SEhYS1p3cThScVJ2QWxRV1pTRUV1ZjMwa1IvcVdYcnpudjAzYUcwUjB6OGRr?=
 =?utf-8?B?emlIYmFzbTV6eG85bVNNOEtWZTBOZytXOGpKZEJzWDNWa0w2VlhyYlRncHpx?=
 =?utf-8?B?cldlNzNpdzhqY0oxbVVZOXRaMFFVWTUzOFAvcTVmV2g5MkM2Rk9iakZKRWkr?=
 =?utf-8?B?OXp3YVBvT3lrMUs4Q1gzQ01wQ21DTitBUkxBS0Q5S2ZSdTNuWjZET3FkZDV2?=
 =?utf-8?B?YzVzRHlwTGdoRnF1VVl4MFdHZU5EMG9DVnp0dXBIVHRabjdvR3FNcjZ2RVB3?=
 =?utf-8?B?dGdscjZqSUowSlV5alZKOFVNQTJnTEpkMjBIcUtZYTk2QUlHV2ZZSFB6blBq?=
 =?utf-8?B?dXFEdmVpbWRNUEtLek9OajJRNlYzekhPR1lPaUM0dlJpY3lkY1ZGY25tak0y?=
 =?utf-8?B?a2tXM2s1ZUs3MjZjR0E2bTlOMlhMWmMxeXlWMVBsNThka3VjVEU0L0JxejQr?=
 =?utf-8?B?ZEgzVGVkdDdJOHZKQ3kvcEZua2ZHU0ZzSHIxZ08xQm9yZUprUHl5QXpUdXVi?=
 =?utf-8?B?Rm9HZnVGZzFtR1VISGNrRzRuUmVrMVFOUTJPZGtVc1VBTWdrWXJuTzErYlZ2?=
 =?utf-8?B?NlFRTDdocGNaY0hmTkZKZ1F5aWhYNHVlZ1gwcW5pSklXdHh1S1FRQlEvQmw4?=
 =?utf-8?Q?YHSA9giPmNOhzj62C0kWcKMclvhR2k7N1iStJAQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c925c99-869b-44cc-d280-08d97f40732f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:48:23.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxqJ3sjyiF3LvzhDjXITQDQjX3bVXyPdSskhWGKLxAIxRGIoCKTjrj8lpVCPKchXTBuMslIPosBDkB/is+Vnkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

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
@@ -463,6 +464,85 @@ struct page_info *iommu_alloc_pgtable(st
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
@@ -143,6 +143,7 @@ int pi_update_irte(const struct pi_desc
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
+void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*


