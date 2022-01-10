Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06B5489D8D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255437.437716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xXx-0007kF-V0; Mon, 10 Jan 2022 16:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255437.437716; Mon, 10 Jan 2022 16:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xXx-0007hk-RU; Mon, 10 Jan 2022 16:29:25 +0000
Received: by outflank-mailman (input) for mailman id 255437;
 Mon, 10 Jan 2022 16:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xXv-0007Vn-Hg
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:29:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c6679a-7232-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:29:22 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-xvkBGpQSOV2P-mvOG--_0A-1; Mon, 10 Jan 2022 17:29:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:29:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:29:20 +0000
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
X-Inumbo-ID: 77c6679a-7232-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVu1EpoAiIfYG6a5LNRcVAhOOz5L/xyuYRwwEDTGZIQ=;
	b=JM0JuOcKceWGGh605DTFLQEG/miMn4Pw73gL28c9H97nS+GbJE6SACkN+zzbA6LBk1hP2C
	6OM/zKvgWOpONWPzEJjb7g5v4DCidA3+PfComMcvzOlkDmBfNOHE3RNLc3NmuqqJYomVm1
	lPE+RWI7pIxoSWvCHZRI8wAJiqAKtSM=
X-MC-Unique: xvkBGpQSOV2P-mvOG--_0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwlQGnMQF5G0/7vW1AaQIFFC2zbmkkGhDi4CCSgdL0ygWSrEJW1gD5VdzyCrQlsuc2bqWJPCj+xtf0kYRn/J0kIrzAFiHDhoKinWjuiKLKAVWI9nQN+g97rD3AXBrzqNqb/N1AO1SL7Iy8kvTw8WKCn7G889studJPTNfVrHo4cFdkYpkU9Vn22f/jqNS2u4TiQQ5H2imus7tcNVD27XOgQrE5ZZwsILHPXuJY/m9eF34MfFsR3cwrVcwNEpHqATZ/N+PGiRC3Lc7XCTYgbtlTTUhwFpLi7LNHnriHSHlGAGR0G+GyWBurlZJv3bVplONadBbX/31qppDT7YJGz7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVu1EpoAiIfYG6a5LNRcVAhOOz5L/xyuYRwwEDTGZIQ=;
 b=NUoaxZRuX81VuadzV5iT+n3ZRbx1UQ+O5kySjoZqbvSJ5KDZsNKXPspvGj+xXkJJU82+PV2K0sFB5upBf+LcCK2ReAP5x6K5gKrRDwx2zieuz705h5PQ7SfLploAvgqNUlAOvc5p4w3TYMXjj0rQf9JLSd3lCD87sMMUmhUlYRZViRnSahgkTax9ygh7fYpR4+Q/stcvSBSkrnzCyE7xP/YL7THfHTGVx+QRQaHFLLmuw6z7i2wAMi3vtZiVLMkiZ31mnGwKf+lNTrPiGXCO8p5vb/0TryDIfiILaHdHhQexa3JmPbtqZu6A9aT/uoddvjtwOk1swZV/0yLWZRgmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed570e4a-2ccc-bbf1-ceac-819e13ad5f8f@suse.com>
Date: Mon, 10 Jan 2022 17:29:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 10/23] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0104.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a138e73c-25bc-40c0-0a44-08d9d4565a64
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51653FFE9964093D9BF7F6DDB3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QS7EHsMMXXgE4tr8D5zGH5pQ2cTprwqHb/5jroBYdrpg2xLNBbNgBBlR/KO8eYgnLHMkA/KjbwcM+8iI6oLtJNZACll3ov4ubvDPdOLTTcZEsyV4Yw6i9+/HRVUKwROOqZiAWL9zJavkMpXTnKFz7F+ru2L6B+hPxsk3kFFdMMsx82YPHWEVA+2tV14HcRER2WG7k/c4fA1PkS1ec2q4gotutYVZYo3s6AOLu1MX+JrjaBNnBSYCPyXcQRkN5IXErCmmCgkmLH4B8AsGeTQskqJigLeqVlfrO2BoJCDNY5Q/sVBeRbu+CCUVEnVQR+C+74gsQVk1yjeZCiA3tnLLHwU5d3O6IqbRazi2GZXr4LBYrHkeZy7HWaH/BwQx7n7asoh7EuyYMvUpW4QUbDObyhJ1Bre7n6GFNxTY062AVR592MtwCJ6L1o4C5wAVPa72XL5E1P3AjlNAEb//VLcqUFxTJI9DqY8qt9OdVsdNA7Ilc1FoYYcthOM9ewkk+HcT2Ta8e7+C3wO/90tGpG4hW7CHHZ7qSD2xjUn3yN4fNXlSdsEzkg6APmp/gemRYwZhgHS/eyJZW6Qgprog9m08OQe4WRwUBewcilL2lBqu5PFUBJw03GFpFRhEJ7b+EMqBUIDhWim661yyCX4w9CNnxN4u8katNQdnbdhnlmg7Db89SdygV36jV8PebX4/mSZwNfixywHwtXiN0ERGIORCWgJOwfwuZseD1mJ6ZdR6qmswcmTD50hFaC0nXoDlwNcjU7EpizdNl2yBpKdpbVYwxnKiDUsmn8QhUAqCkvU4BvO70GSS6Q7LbAbCA/3oAvgi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW5MazNrV2FkRW1mdmNxQjVoWWg2V2pjdmxZTVRrdkdOQ2tvTk84TzV4VDNk?=
 =?utf-8?B?WFRENGtlVVY4RklYYUNsRHI1WWtxT00xSTJlUGF4azZCUmVTSkFsbTdWZ3Rn?=
 =?utf-8?B?WVZ4RVI1bVYwNVhlUmkyUkRjdHBJNjFSTUpsdG03TnU3UVNxc3hTZEs2TnhB?=
 =?utf-8?B?T00ycU1USWF5SmxZOVJRY3I1S3pHNmlGdm9zczNKSTFPRXAvcVVxSFUvMVNj?=
 =?utf-8?B?REc4RzBNQk15VDdnbFRiSUc5QkRyRThLMXRtSFVpQjRYUjF4TEowb3QyQzRa?=
 =?utf-8?B?dUVGS0c2S3lHQjNKVmhaVFVMT2lmZ1hFMXNQUlNrTVlPZVBsUFFlQ1VlSEs0?=
 =?utf-8?B?QWtKYzJDSVdlSWplZVhvWnQycXNHTERLa200aU96U3g2eEcxWU53NXAxZUpU?=
 =?utf-8?B?QTd2UzRZeVNKYms1U1FiR3ZMVHl6THZNbTNOUUV3ZXVIRVhiVEZhdW9YZU42?=
 =?utf-8?B?cnhSSVk0NW8rd0wwVEU1cWxFSTlFN291Nkh2SUhkN2M1Q0phWjAzQUZoRGdl?=
 =?utf-8?B?dnh4UkZCME82eDYrd0l2c254ckhqRnhMR3p0ZWFWTmFzOTgzQnkva2JIcmF3?=
 =?utf-8?B?U1VGUjdqNTlTUFRtaUNNam9jbUdHOFdwNEZRS00xRUJDNGQ2ei9hMGhNcjRT?=
 =?utf-8?B?czlKYlZRclVBeDJQN0l5VmQxMWNJWkI4QWxURFcxM3YzVHhOdEpjZXk2N0FF?=
 =?utf-8?B?ZFBSWDhqa0hRa1M1bWdLbitRWXozcVNSTjJiUjd0ak1qL05ENEc3MHk0TXdk?=
 =?utf-8?B?VEhmY2svTUJMMlhrQXBWOGhiTkFkeVRZZWYvaURCcGtFeGpuRkZoaHJrUzlq?=
 =?utf-8?B?MnIyaUtaamQ1VUNIOUFXc0RYWmpmT2UzdEFYR3NzK0VFZkRPd3VhUUZDbFNh?=
 =?utf-8?B?NXl1R3k0ZjBPQTVVMmN1eWF2WlRqZVgzUVl2RzBHYnp4d0hGREZzbnRMTGlW?=
 =?utf-8?B?N2NOS2xGQSs1MC84U2NNOFBWTEtKUFRKaEVucnZBQWRzZEh0TXk0cTdFZXBH?=
 =?utf-8?B?N1NUem5xM09iMnBybkQvSWl2bXY1SjRBVExNOUJxTVIreUVzbjdjU0lFdDRO?=
 =?utf-8?B?UGQrdWFiS1BhTXRnbEtSOU9qSC9ERDB6YjhrQmxDL25PU1FEUmxBSVh2M2xH?=
 =?utf-8?B?WEp6bGJCMStNODdaMlVPd1lJSlBXaTFOZC9iSis5VzlXRFRjQzFWd3p4RlFs?=
 =?utf-8?B?SlhGd0NOZlVvVWpBclZaY0dQV0wwZklqdVNiNGlBeVp0eHJuUGx0aTdkcHJE?=
 =?utf-8?B?SzlBdTIwc0pmQ2NmeExUSEZnb0VoY1VpNStIVXdCaTlxdlVRb2JNY0NlWUlh?=
 =?utf-8?B?UU9HdGQ1VnJTZG93elJwRUc5RHlRNVFiQ0xXNzBYS3ZMRlh3WjBBSFZTL1lh?=
 =?utf-8?B?M2lxYWtSTm5zRjBRNjVGY1I5bEVIbVZZaTlicHZaKzdQOTFldU9XYTUrRyt3?=
 =?utf-8?B?MWN3amE0dWUyQjVOMzF3VEs1eFJTZjJCd2ZxTGV3Y0VMenJUeVNsTXV3R1ow?=
 =?utf-8?B?TWVjaHp6S3lNaUtxclpHMjlRcmtrMytXdERRRXJsZTdEOGpLVjJEb0tqU0xK?=
 =?utf-8?B?cVR6SmJKRGt6NWJXckdSdmdxcHVnU2FWMUR4VExUbFZNVDhySWZSMFBDVXB5?=
 =?utf-8?B?aHF2b1ZHTUNXVTlQVVF4UGl3RTh4c3Z6SnBTcjVCVEUvbHNuVDV0NDBPdnNl?=
 =?utf-8?B?c2d5TDJEbTZKYzQzczl0a2FUT2Zld0hiRlYreTRqR0lpVVpON0JNN2I3QklZ?=
 =?utf-8?B?WWlUdURXeHdnN1dGZlZBVGY2bktHK0NHdjlhcktUdWwybkVhNjYwb1YzVTRZ?=
 =?utf-8?B?TndtWjE1U0FrUVhFeTBub0tzSmVGUUkrRGpnNHZHT2xuRFc0MU44cUw0YzRH?=
 =?utf-8?B?TTl4Z21VcG9mV2k3R2NQMG9LNGFUNzgrRFV5MXRaZFNMTlFjZVVOdFI3NnFN?=
 =?utf-8?B?SjI3Vm96aVRPRTVoendYRytIV0t6K3p1RUFJa0RPTGdrTVJRamp2TlRza1VZ?=
 =?utf-8?B?ZXB6c1ZqVVpPTklNaHZvWDI3bDVZWkNyeWpvYXJoS1dzelE4eFlpTVBwQkR6?=
 =?utf-8?B?VXQrcmsrUXVNbUszcjR6RzF3bHp3MWFPdTBvazNHS3NtcTZiTEZjS2NrdkFj?=
 =?utf-8?B?TXIyUTltbG9QYVFWQTczMGx5bTB5anc1bzRsdWdpRXlvNERKVFVEOWJocDFy?=
 =?utf-8?Q?zrHZejAEpOWPCvaEdJsmwEI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a138e73c-25bc-40c0-0a44-08d9d4565a64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:29:19.9446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+7i+WR+4yNcmGlLAz0VyyBWi00NegzxtqpmMPr81AHZSB7Y538SxeEbS6OqXomntndDJqc0YqjTDGXjZggRIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

For vendor specific code to support superpages we need to be able to
deal with a superpage mapping replacing an intermediate page table (or
hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
needed to free individual page tables while a domain is still alive.
Since the freeing needs to be deferred until after a suitable IOTLB
flush was performed, released page tables get queued for processing by a
tasklet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was considering whether to use a softirq-tasklet instead. This would
have the benefit of avoiding extra scheduling operations, but come with
the risk of the freeing happening prematurely because of a
process_pending_softirqs() somewhere.
---
v3: Call process_pending_softirqs() from free_queued_pgtables().

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -12,6 +12,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/cpu.h>
 #include <xen/sched.h>
 #include <xen/iommu.h>
 #include <xen/paging.h>
@@ -491,6 +492,92 @@ struct page_info *iommu_alloc_pgtable(st
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
+    unsigned int done = 0;
+
+    while ( (pg = page_list_remove_head(list)) )
+    {
+        free_domheap_page(pg);
+
+        /* Granularity of checking somewhat arbitrary. */
+        if ( !(++done & 0x1ff) )
+             process_pending_softirqs();
+    }
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
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -143,6 +143,7 @@ int pi_update_irte(const struct pi_desc
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
+void iommu_queue_free_pgtable(struct domain *d, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*


