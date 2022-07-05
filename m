Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FB566E96
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361139.590478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hur-0002ul-78; Tue, 05 Jul 2022 12:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361139.590478; Tue, 05 Jul 2022 12:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hur-0002rt-3S; Tue, 05 Jul 2022 12:44:33 +0000
Received: by outflank-mailman (input) for mailman id 361139;
 Tue, 05 Jul 2022 12:44:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8huo-0002H7-LV
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:44:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140058.outbound.protection.outlook.com [40.107.14.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35fa6309-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:44:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2613.eurprd04.prod.outlook.com (2603:10a6:4:37::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:44:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:44:28 +0000
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
X-Inumbo-ID: 35fa6309-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL8LBiaAEBvf7qLD6agVUNSxaTLmrvXLZaej+LJWW3qFbNMkgF9h36ISRbMYC4iif0KhHR6B8pESs39SbVa7du3+EAAgpA+devYBut8AfLQzhVmkh15NijePUi7dPLzYjs5EZApaGrlkb/J9x7Hf4SBL3WEmlIT1LyHv+HtTywPkI4AqPyKk19X0yy0v6HyIGYwVEXjw7NTW4F6KswyAreCIoaZoKgRUArupkdT/s91xqNm+9iHs+sM1wBT15NbIA+qjBVVJHMp6W+BaklMXc/Q0IclL8f9RRe9uubm1ZfI8cm/RBMe1CfNkNmH5uaJniPDM7Lnu/255Uk2ktI+LRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tz6ozk9S/AhujlkpGh0jwCZXiL+OVP402DUlNiNYn5k=;
 b=RtJiwQGL9MCjvyeyUHPnBI6SCug4Vvpc6W0yvPQWdG4oIjgjkzxLsFf22Lu7v517BFqAPi0I1LOy+EbazHfkX6YvsAzBudz8Em4MQZpHgaiA5kbr5I7cac4Di9R52jGy+6S3S/966rOvpRPHd4kPuH+xn0x7hcFJR2OL0QuQBpMoQECHAW37TMp62CGway32WsRIvO9d8+ThX3goe7cS4t/xJjz0jTfnd6sibhKopAPjWmdAs/DTJsRNUg5oM3jY2qiSbFJvDZ9zzvp1pBmNRwSAmWlApBAYGwUuqmZ6b87enQeBlw5TC07BZiXo0tQifS9KPVGkv71qKa0VvUXS3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tz6ozk9S/AhujlkpGh0jwCZXiL+OVP402DUlNiNYn5k=;
 b=FeIksqwS0FJlZsZx6jYdT7bMGr/qfRUWBYrjmngzaUI5d9Sx3McvBbVqh/wF2Km1imrisK8fCKYcIQrOGXOajUzJ+wk6JTtF/W841tbeQud+R2TYpeDhSgSoEHGdGowl1YQNYEFPFmePQ5sBxsBKR+YLqSRIaxGUBnv9vIAORCzYpExK9Ewzz/y7hUdaG7yZyP0wSFp8JTnbobImr8p3qV71uCn2wea924xGVltovkM9SNmNmUvFwIcCt5kBqwl/7P5WXfneD2h8Q+L8H3hFXO9z2OQkkK0ncAuKqQKCrIdVdkHY78bhCNN+nZ6pl3wx4p1vQGSq2jkmcXP9kkvC4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d948cf6a-5ebf-177f-9437-07d62ae80d20@suse.com>
Date: Tue, 5 Jul 2022 14:44:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 03/14] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0058.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45afa46d-ca31-40b4-164e-08da5e841954
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2613:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YBgGshiM5C7vrHVxGj9SyG2zYY46XA2p++bdqO5mwSmRLOgTJUOhm3BVCxOv2O+45ezR/2kNGwkQuWyp40Z3LogBx3JdS8MxkRWL+FHRS6BxIdcMxZKnBwkq7jVW7hctPKh43dCmkF1vDymp/p93pRXZpZBXJQ4rMRXBiheM4IWiT2ZqVxEh4VkmVFXB58ywAAXioFt+xM5c88YRT/i9dpiyDaqu3e7jxOyF3rJ+KkNOBtnGd+nka15V/BQ+E8xu41gsQBqvWiTcouWwbiryXVCA93fWelaMVENUOA27y8rESqCg9QurSD5gcgIOQchT+6rAZJ7xv7HnhOSSGXJ11w+ryIzfoy7fUAgs/ejXHxUG6nxqkS8eQ7W9GmNznmTSVmHFcnPpnRLAAdPPaclqHeaP7duv51KzS+IKg7wKUJppd4p9GbhII8w76LMjvBmZ9aPP0GGU0q9el44jwfHH9A0yjOu5TaOLdGb5guUJbj1ZTlm3YytSzEqNj5l6/tCTdUndHMPc5B8kIJBnQHFnNMyXPTRPEd+ljDWIsppx0FlXwh/DpXc5FLO5O4fOKdwfMQ3rYTo+lsN0eeHRQiARbErZ/4xI67i/lierYdOGRC67tyaGWZiEs6OM0rE0qRpqwrA/lWaLsyIILw/a6+0KThwQGFsX1wfvxDGPu2Cqv0F3tYtf2exNHGlkdgUM1ilq/9CxZ/K8khbcV3rtpfuKmpH/yCriJk8osif/YW6YPHPbscNtFPIN/lXfIFOu54htv/ATwWMm4a69CVddt5JPQVr7weyRks302g01fdhvbsMaBdyjsJXDFfgl38MrzueiQ+jjcPB3MU+lH/uIBfF/rdpZXyAj7ych1mMFauHPwrEDTSGNWaPFnoWTpp5HsLnp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(31696002)(38100700002)(6486002)(478600001)(86362001)(66946007)(4326008)(6512007)(8676002)(66476007)(66556008)(5660300002)(2616005)(26005)(186003)(36756003)(316002)(6916009)(31686004)(54906003)(6506007)(41300700001)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEd6aWpZZkpMR0hLQ21oRWx2R3RwOVRmL1RHYkhNMGZ0M01mR0JTaDlOTE9y?=
 =?utf-8?B?Z1BkaHdiZUpKbldhRmdIRFU2dTVpLzRYS0tBbk10RkxNVXZ6UzlBVmxwU2JT?=
 =?utf-8?B?cmRRR3M5bGZiaGtUNjkzTXdtc2w1L3lGcWJZR1FMQ1lnM3JYSzZjUUIwenBw?=
 =?utf-8?B?SWRtUWQza21qajNmWXJhTGV3MFVlQnZKUlRXTTgyT3hEdm85aUcxbTArQjBj?=
 =?utf-8?B?UlFDMlA2dXJiL2ErMGNYeWdjSkFicWFHRE1IT0t5SGR3VjdQZzF6emhScFVB?=
 =?utf-8?B?aVVEY3pzbStaQXhWSTRSZDhxVzUra2hleVFqMEdxQjIvdytLWGhueVc3cTFN?=
 =?utf-8?B?WlY2R01CSndDSlE4TzAvTlk2UnpkQ0xaeGRzTWM1ZHdCclJRRFpOU1pCQ0Jq?=
 =?utf-8?B?MjB3bSt0NHVDV21tc2RIbzZaeURLVEJ5akszMHV2ME9JeWtXUncwdml1M29F?=
 =?utf-8?B?aFlkQWJxQ2swVjJuWldqQ3FrTW9BeUxNYk0vTjdOZEVFdjBuZlVoR3JhME1a?=
 =?utf-8?B?SlRvL2EvTjNYbFpHL0VIeUM5QTBFemh6VnJVTXFSVjlyVWovaXAyaERxcWNt?=
 =?utf-8?B?blBCQWxvMWxpUllSSmVlZWxtOWVnaitpMEJ1ZS81Q1Z2a0RieFpLZGQvMGJS?=
 =?utf-8?B?ZTFjb3IyUWcxZmU4NGd6eEtHay9hVDlwRmhoSXdSM2dwbEtJdWNwWWZLV005?=
 =?utf-8?B?a2NYSjBPejFNTDhRSHp4N3JMYnNkRkxmNXA2VkN5cHQ5NzdmelFtbWJWdHRD?=
 =?utf-8?B?UWlPcXR4TUVVa3ltaTJLUkN0Nm9CelZzdFhXS0FRcDlhNnU2cGVoQ0dWN0Mv?=
 =?utf-8?B?akkwbzI1emtKWStRbUhaTFptenBuVGp6Q25TcU1jZGswUGpFZk5vVTIyYlNx?=
 =?utf-8?B?QnduT0o2SXAxWlB4Ym1XZ1Rka3lKTVc4QzVpcTRYek9jT0FIaEtKQ0hCR2VD?=
 =?utf-8?B?OFVMNnJhS1VmdVR3cEZDeFQ2aFB2dnNYSzlUS1FOamRXNDBPVnlPR1NFaEFP?=
 =?utf-8?B?MXpnakdGVGxxNDY1aWYvZ1BOdWhmc1RMTUtqbjUyeTdkdXlwdFZ1R2ExWlZi?=
 =?utf-8?B?RDJVbGxwYS9mMk84WmtpWDRoTXlGZThSdUppTUxMRlFWQUhLK3dXQjhLQTQw?=
 =?utf-8?B?VmVOZ0ZPY2UvaUZsV1NPMm9SamM5czBJaXNpbmZ2TGZpZHRqUkpTNjd3d2ln?=
 =?utf-8?B?QXlJeUZOelFHejNaY1lpeFhvTmpFVmtJWHdzYWhjRW9HTUQ2cXVPd1daWFRW?=
 =?utf-8?B?YXlhckV3VTdtT3llVUhKbDRIRGc0c3pTdVoxQ1dnd2w2ZFZDM05DSW1CU1Jr?=
 =?utf-8?B?dXJGMTZJdzhHY3lOV0piaHM1akhTUFZGamtxSkxOZ2duR2Z2NXluTFlGTjVF?=
 =?utf-8?B?bE9tS1RpclROYjZOSTlDSktydW1va2tyRlp0U3VaY3E3N2ttaVVGUDRxb29J?=
 =?utf-8?B?L3YxT0c1YW9EaTlLSnlzTWVEOERlZnlkVWFJbmxzL0JZUXlVd2xPbDhYdG9v?=
 =?utf-8?B?UHl0K2ljaXdzMmwyeTJIS0I3RlVIU296VlpRY1dqb3BQOGNUVXJoTjlKYUJT?=
 =?utf-8?B?UFB5cW84bll6ZnhObVdNeE83OHVxR0lkU3NlZGhaSC8vYWk3OGhpbjJzWVBB?=
 =?utf-8?B?Mkk4endhak1LZGhmYlNOOGxjT3VpOHd1c2ZPWUhyQjNyeTJvQ1gvWXNDZXA2?=
 =?utf-8?B?UWw2ampCb3ZjNkJOQXdta0dwU1Jpcmk4UTJWNXB3TWxTQmxWMXd5Q1JYekMr?=
 =?utf-8?B?aFM4TTRCcWhzajFBWkRsbnZkSGxGbEQ5clpMc1VpVkdqMStMVVdzVm5JQ1NB?=
 =?utf-8?B?OWozSTZyQ0JicHZQNEZiK2Flb3F0a3NuUDJwbG84eFRsRVRlYmpLTHkzVS9Q?=
 =?utf-8?B?ajhJNzZQamJ2ZUZkTmN4NHNLaUFCY1ZMbmFtNzM4MHJDV1NKcFYvamZ5ZkRB?=
 =?utf-8?B?alpNenZtNzc1UldYc1hmYnFmYjR4ZXZXRkhTVGdCRTVIaWdVdTd1MDdQSXBp?=
 =?utf-8?B?cjY3WXQ0RFd0aWdGM2JEQXdESTExRnk3Q0JQSUdRTnB5YnBhbDZXSnk3NTh1?=
 =?utf-8?B?MTVSalB4cmVrbEgramVQTE0zLzRMOFRCb2dKUzFVRHlwNWl5Wm95ZGgvbTVH?=
 =?utf-8?Q?CLE9jaeTHOQZYm/6HK0Aeov2q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45afa46d-ca31-40b4-164e-08da5e841954
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:44:28.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yED7xdMjgOAjActLXaU6gROgDvYZs4R4SKA/m5jVvFlV8sD5B1WBxM5n1mcrSqNA0MwgyoY22v+OvtKweJ7W6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2613

For vendor specific code to support superpages we need to be able to
deal with a superpage mapping replacing an intermediate page table (or
hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
needed to free individual page tables while a domain is still alive.
Since the freeing needs to be deferred until after a suitable IOTLB
flush was performed, released page tables get queued for processing by a
tasklet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
I was considering whether to use a softirq-tasklet instead. This would
have the benefit of avoiding extra scheduling operations, but come with
the risk of the freeing happening prematurely because of a
process_pending_softirqs() somewhere.
---
v7: Add cf_check to free_queued_pgtables(). Add ASSERT().
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
@@ -556,6 +557,105 @@ struct page_info *iommu_alloc_pgtable(st
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
+static void cf_check free_queued_pgtables(void *arg)
+{
+    struct page_list_head *list = arg;
+    struct page_info *pg;
+    unsigned int done = 0;
+
+    ASSERT(list == &this_cpu(free_pgt_list));
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


