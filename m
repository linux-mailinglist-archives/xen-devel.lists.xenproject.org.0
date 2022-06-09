Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE954488D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344864.570473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFDZ-0000Wq-W4; Thu, 09 Jun 2022 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344864.570473; Thu, 09 Jun 2022 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFDZ-0000Ty-T9; Thu, 09 Jun 2022 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 344864;
 Thu, 09 Jun 2022 10:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFDY-0000Tp-BV
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:16:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 426952f3-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:16:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6297.eurprd04.prod.outlook.com (2603:10a6:10:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:16:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:16:40 +0000
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
X-Inumbo-ID: 426952f3-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NINFdV5wdugjbFGv+VeBa0HOfbxcLzdRpzCI+uLmjTn7geSfuN7QuYBH+DfpQr3tCU5+jyHjIUSNPvldFzTWWDyP+gql68TEjfmX3r/3Axfg9ZH7LgXo7ahbM3ubHV2aX06vsKZJeYZjk8dPlJa9mQTQI/0wkI5PlrBg2l5YFo0K2HTaJt05ZoRMy3nAi/cwbXkQ6bKowXyhKG0s87YiFEwnlFNY7p7lwf5392O9M4oUnnamPqwxmVZdGBcL99dTkqOvBXQROPRaQ/yxIzPgwYls3BQ0YUgfiN0K3y5DhpmkqseoFOAmQDe3LPuwXaoRMeRfmnq4mTRDylZzrhb1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht+gcaO8t0HFmkoBoateZqPcuX/ukcu9CpBSQf8lM4E=;
 b=SStxS6jrPCDvvEeUj2EVq6vPntsqTq6mKsMl74/IsidWfBsIo6ioKqBH34D64ZmUSWgH7sjHShNVxBA4aYJlUI9paS5uUAAXKauoWySJCBG55FMB/MBSr5UgvILNDk4cNcr6RnBjSolae3PHjG2wEZEBgIK3WJ/rMefqP+zgbIE6/dwswhwPz3/1aSN2Yr6BqwIV8y7nZmDp+Nyn+SONYdM0hhsbw4k8V8AkNgpTFNuWdgKnlhYr3tmh+sgnze6aKgdhwfdcaEZA/OKg76Du/m+uXCdxyO3cqF2IHqJDEPo32lu8UkJ6QyyJU2NcdsPY12msXwEIBbdWr50jFbbn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht+gcaO8t0HFmkoBoateZqPcuX/ukcu9CpBSQf8lM4E=;
 b=al6pmNttL96AmQH75aiOumkwO8AmMxEd3EIm7f1c39KvCJGoCWxyQVTp3n+00u2+Ul/SXYDm7Al8xfW64tSoxCsBUN7FEOp5uEpZSI4C7i2qkN9YCBy6jDLZDKU6d4Lr8j8VJspba7NQIZ8w212x/e503hCoqF0Nfpc51lXQbtWcdeZwChySWLg+07k5w7QDEfDoualaNdRMgioQQGDf/vPbuRY/04u5X/axZQo54EChv8dxLnCeSIC9Wn5kd0ZQEY0VgYgTkc4nVY6dJeNdoCABEe63Jt/94G1bFchEQk69OSs33X+YAE1U5lA3jDoXEOWJuoE4G1vJS1q2wQbqCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24eb0b99-c2c4-08aa-740d-df94d2505599@suse.com>
Date: Thu, 9 Jun 2022 12:16:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 01/12] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0045.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb4dec2-d371-4f9f-136c-08da4a012515
X-MS-TrafficTypeDiagnostic: DBBPR04MB6297:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB629736244C0BF3CB904CD791B3A79@DBBPR04MB6297.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/4LkUC97aHneSm/krzy/YdIb6CsGLuxPwJkvPW69rAMjFAnLzhVIVemhY0875FG6wP1qFiOpZFUHlnQPA8Nl6bbc5S8BUtDyFmVpf2/x7jQ0Ks4E7aXHayV8a1psIPNdqpwolswCBOCqJRS0i8zlYCnnJFttS6L5Hv932dOCCbLw4DUSHDgcd6veOmh7pteu37AjlnMC8N6jISXpFlSipvJYNIsE4tsrOIVkLzetFpl55L4VolC3ySqzVGeEEC/6v9FENiQ9BfEmzccKqQNvqrL2wuKN8+AnuneoU6O7o3qD2tXgOwVTAQ+UcLPTZ+Jxox+lRly1moML9aO/5WTypzfDLmFyvIX2BK6hQgf9AYgTsg6CV56KHp4+h3d0bRHl3XjcoGs3g2Yp4bj/HANvGip65YcWDcwPe+esuERdU2nt9hdzcyHrjiwkewuEL/ujaU8ubHDx8Ru/yFPPEubxp/VuTbsagWzn4oIx0alVPxsOB5Usj4/exhmTe2A1eiiCl/j/Stf6XEbj0wI4abtdaFKrSUhk5tQAjuH3zz2/apqDXSBRo+O7a5b+MJXM0wdYrs5ae4ZCajSbDkxlixQvyH8iv9xI1XMArg9NdJx5kZhnUww7HvbqmoUiiOgqQSbAseQky+9wkAkygMwq4mQPd1Fx4lz8XCVJcgwgE5vj+V1uxwj2kRKAgbxhTkmlqDG9Mqa1yAUCyM1XmkFufUwJzZAWwCau4Aa5eoZ5cNgLdXyiL63ipcpz3DvfGJD5w7kt+A741t6rAU0fujmjdr8w6VkR/R8k3h2WGvThzrmSn2dZ22cC8fBwY9BljfURHNbH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(36756003)(83380400001)(31696002)(26005)(31686004)(6512007)(6506007)(2906002)(4326008)(54906003)(8936002)(5660300002)(316002)(6486002)(6916009)(38100700002)(508600001)(86362001)(186003)(66556008)(66476007)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUU5TnJkL3RvTXRTWjd0bjZUMHNISGRudXYveFNBclcwbVF0cGQ2UThnSHZu?=
 =?utf-8?B?YkU1MW5Nb29HMmJ2bzYvRjZnY0Z3ekF0OTRBZXBrWG0vTTlHdjUxYmlVT0dL?=
 =?utf-8?B?cnI1WElFcEhWWXIxYTUrNTBzZk5iUktoZGtMQmdoL1BUSU9rdFBReitXanlu?=
 =?utf-8?B?TE0rQWNMTEtqY2pQWHlLVUdWdWRYTmFYeU9Qc1MxSDlGUXk2UmpENmJmYitp?=
 =?utf-8?B?R1c3d1MzRWdyNXNHZ1J5eTF6VHVmNHRRZDdTaW1JdHhMSUZyQXA3K1pmck40?=
 =?utf-8?B?dEsvU1pYUWp4a2ZXbElHU2U2YzI3aFZqbjB4Y0h1MHU3cXloVXhTQ1J2RXox?=
 =?utf-8?B?NHc3SG8vbXhOR2x6TjZVWmtmUVpxVUZwM1BYV2FReUJ4K1RielhRSW56YkNL?=
 =?utf-8?B?V3k4Ui9TMjlyVXBTam1XVDJjTGFqWGc2ZlltRWxxNS9ydk0rQ2pyemx1ZG8y?=
 =?utf-8?B?MVBqaEswUHpuWU5FdzVQTEVoMFV0Qm92SzFWTS9zcjhKUUZzdGNkSDN6dWk0?=
 =?utf-8?B?S1QzVXJORk84OHNQdlhDbmhsWHpjdWYrTmJBOHFYRVlWODR0OXRMVkQwQ2xW?=
 =?utf-8?B?NzQ1Lysza0NxOVpVZWh5VlRRTjVnME5vWjNWQ0NjRWdtam84WUtkV3ZiOGcw?=
 =?utf-8?B?WDJqY2RwQ3hnWVY3TTRlQ256WVl1WEFXdXhBOWFOMk9MdTI4Ty82Q2k4cS9S?=
 =?utf-8?B?VVBzSjJhUnJoMSt3ME4xSGlyK2dERXp2TVpucElSQzd1WlZXT1FTeHovdkUv?=
 =?utf-8?B?aldRS1V2Ym5qWDBYdEJXbmVSOWZxNkI2d0RPQjVkSHlEajdrM202a0pSR3FS?=
 =?utf-8?B?eUhqbklza1ltTlFtNGhNN1RsS2tuaEsrRDVINWNHTE1KNnd6em93dSt3TGhR?=
 =?utf-8?B?amJWLzdJQWh2bmpEMVZPUXNqbFZYbDBzcHNpM1N3Q09IR2RreEdGNmR4ckk2?=
 =?utf-8?B?T015MlNyMDZnOFMvclQ1cm5tbjV0LzBPeUVqc096WGs3WjlLUXIvb2RsMnN6?=
 =?utf-8?B?bm9WWnl6bmwyRHdNdU5pODdHQURQVk15SUlKYnduWUFiemhkUmkvQnE1ejZI?=
 =?utf-8?B?bU5ibW4wYmM1d3U1UFJpeEo4NEw5ZXpHK0pUTjhMOGh2MHl2VDBTc1I4Nmkv?=
 =?utf-8?B?SHB5QW1IL3BqQVB6TE5hd0hrWHlWaU5oT3lVV1lCUjJzRjBUNSt4VG1XMnBG?=
 =?utf-8?B?NEVhcGw2YXFNS3NsYTdnUWg4NjRqQldXU0luWWtGWXRWVHl0WFErRDNjNHJM?=
 =?utf-8?B?RWFuYklaaWZCaFpWL0c5RjFQWEltSG1naUdyRVE1ODgxbWtYdDZTczg5M3Ja?=
 =?utf-8?B?SmFMYkhWMDFIQ1ZCQmpuajg2RmRVZUtmNVl2UzVQcW14Uk5ZRDZxWlAwQTRY?=
 =?utf-8?B?OVJkOGNBckdFcThkK2JOM1NjRWlQRzVuei8rVXZiWEF2SHRBU3IwaFBTMTBy?=
 =?utf-8?B?RHNEYXgycGVFYkdkMVNNYWNiODBmNGYyeXY0NXJ0cEdoSUNzd3ZFenNiU2dX?=
 =?utf-8?B?TUgrNDBtZTA5eFdkc0kzMEtOUHZIeFlxQWFneENsNWIyRnZ6aC9iclVoQ2hJ?=
 =?utf-8?B?MFR0cDZUZVhWYzJ1amQ4M3lOZVpzSm9OcHhqQWIzN3AzYnJRQ05PSGh0TGZw?=
 =?utf-8?B?a1JNeFlHaW5Vb0tzVTQ2U2krOEtsZHhDOFFPazM2eU1qR0d1R0Z2UW5TSm9K?=
 =?utf-8?B?TnNzVTh0MG5CMFNBZitrdzJuRjhSMTlkOGNoU3FmM3U2S08yQVNQVENIWDE5?=
 =?utf-8?B?UkZqVDlvQkcyVkVzM2Z0ejM0WjVmTXo4U0tDdC9HSE5vam5kRCtuNVJ1R3l4?=
 =?utf-8?B?QjFndWxBQW5WUGRpcE5xWUcvbmp3MjBSNW5YSjQ5STNBaEw0cHlNSE5hcDk2?=
 =?utf-8?B?c1V0ajFvNVBiVE4yYkZMdkRlT01NbVRLTWtLWENVcWM5b1NFOGhnSGJpWVlq?=
 =?utf-8?B?bC9xTDBGMFI4UE9FUllsaU54TTZwMzhETnpYanF4a2ZEa1hKRXVSdjMxRm0v?=
 =?utf-8?B?dFpKNnppN1BJY0hnbWl4TlQ4RlRMdGF2UGRNbFFSNEhWTVdnSCtkSWlpMFBq?=
 =?utf-8?B?blYzTy82azJGVTVlRnpNV0I1Q2U2cXVoWWM1WFlqWHhmRkNQRUhML1VwRHJG?=
 =?utf-8?B?ekl2d0hCdFFlU0VGNXhSbDdrVGw1N3N1WWZ5cnVLNjBMMHYzM1U0Yy9mRURR?=
 =?utf-8?B?VWIzRGtnbEttQmprM0U0ZWtkMkhuMy9La2V0azFXT21GUXBFQ0E4bGRSUC9O?=
 =?utf-8?B?QXpCK1l4anB2TnRjeXpoQ3N0eXZkbkxoZ3h1ZzgyT28rZTZYUlNPd1F4UXRq?=
 =?utf-8?B?Y2xkUDlOczA0b0MyVVJFWk84UStNRWxxNjZNTEhDTk1kdDc4WVhndz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb4dec2-d371-4f9f-136c-08da4a012515
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:16:40.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXmYS6QAkDhzJ4I+YoqdChPw7Q9V8mQIvBdvaF01LwSdtStsMpsoejum6Ir0c1CjnkSBTSabnP44pvFHL+sK/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6297

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
v6: Extend comment on the use of process_pending_softirqs().
v5: Fix CPU_UP_PREPARE for BIGMEM. Schedule tasklet in CPU_DOWN_FAILED
    when list is not empty. Skip all processing in CPU_DEAD when list is
    empty.
v4: Change type of iommu_queue_free_pgtable()'s 1st parameter. Re-base.
v3: Call process_pending_softirqs() from free_queued_pgtables().

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -147,6 +147,7 @@ void iommu_free_domid(domid_t domid, uns
 int __must_check iommu_free_pgtables(struct domain *d);
 struct domain_iommu;
 struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
+void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -12,6 +12,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/cpu.h>
 #include <xen/sched.h>
 #include <xen/iocap.h>
 #include <xen/iommu.h>
@@ -551,6 +552,103 @@ struct page_info *iommu_alloc_pgtable(st
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
+        /*
+         * Just to be on the safe side, check for processing softirqs every
+         * once in a while.  Generally it is expected that parties queuing
+         * pages for freeing will find a need for preemption before too many
+         * pages can be queued.  Granularity of checking is somewhat arbitrary.
+         */
+        if ( !(++done & 0x1ff) )
+             process_pending_softirqs();
+    }
+}
+
+void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg)
+{
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
+static int cf_check cpu_callback(
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
+        if ( !page_list_empty(list) )
+        {
+            page_list_splice(list, &this_cpu(free_pgt_list));
+            INIT_PAGE_LIST_HEAD(list);
+            tasklet_schedule(&this_cpu(free_pgt_tasklet));
+        }
+        break;
+
+    case CPU_UP_PREPARE:
+        INIT_PAGE_LIST_HEAD(list);
+        fallthrough;
+    case CPU_DOWN_FAILED:
+        tasklet_init(tasklet, free_queued_pgtables, list);
+        if ( !page_list_empty(list) )
+            tasklet_schedule(tasklet);
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
+static int __init cf_check bsp_init(void)
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


