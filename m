Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C350DB6E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312562.529876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuI3-00051T-3C; Mon, 25 Apr 2022 08:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312562.529876; Mon, 25 Apr 2022 08:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuI2-0004xg-Vo; Mon, 25 Apr 2022 08:41:50 +0000
Received: by outflank-mailman (input) for mailman id 312562;
 Mon, 25 Apr 2022 08:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuCB-0005mk-Vq
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:35:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b427c536-c472-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:35:47 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-GyOr7XTDMV6Y45BrJtxeOw-1; Mon, 25 Apr 2022 10:35:45 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:35:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:35:44 +0000
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
X-Inumbo-ID: b427c536-c472-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpBRkm9Z5IBvu/NQMA+LCq2v737PicnDjxA+STnwy5s=;
	b=LHQLpS2dJwvVnjaLr852QknCwsaIN6y/ZBujl3QH7KjU6bU0MjKxlQ+rCsYhTWG2XWJr5N
	A/jxvGWDB59unjvm4HY4Ed9lbKih9CLBdjlvhP+bgK+XJNpQpWzxfkPdYrkzneKsmlLD3f
	e4VICLe5JwriFBA7RC6lY1ckdfjtGhU=
X-MC-Unique: GyOr7XTDMV6Y45BrJtxeOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clhCJyuyPVJOkk/RFMeOsimStHG7DCGYFXLt4YDz5r7m30pbzjTHaYPtIZ/z/rWV9aQm/a5m6a/TG1Hta8pypf05RuyxseGsaCRM5W1IZppl9ZglDaXJ+Ap6WL73TNDKjLkNENETX0Z3t8zIC3RJu96fW0hTarqpdGzmpCUI6iAIAcJVmtIbM7sq+weppRmThFxXkEh5OM6IlkDNUsLH8fuLcesNpDU61YZbuWXSisj0KowtDM0WlBDwoRmHNnsNNdci4j0UNTdteE3jaFHJtqFFzEdXaBNqf8zXXoxLvctq/qyn6nNxnndmsTp+YmVnkIe/YsQa5rL24OoNxw8NTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpBRkm9Z5IBvu/NQMA+LCq2v737PicnDjxA+STnwy5s=;
 b=gslz2pLKZdGxIaWIJvr2T70alvPIBleVYreJxfZlcNzdaogpZkPPHKfZw8dApDN1lD7Vphr5IWxHAnsKN5bCGb8XUePSvv7MjB/6zY7cYlc/Q3qAISIhJf4+frVsVP4uxNyFCyjEsVYS+dMPLYVozEKhrVR5Gw+ROmdwpP7rCIguvOX9nmUITUwXEnGhLRV4puml+ENnSRnLAyjmIrwClZ6fTdFYZSIqLr4m8xydtoETXZ/y8tHdjmEtlrtUDQJiXSQzpIUpZ8r5d619u4CyIculyN7jjerDAgBYKaeSHjeClah8bs7dTq3gKHNX3RLoBpcUWJCHmDpcLYznsAi4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
Date: Mon, 25 Apr 2022 10:35:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 07/21] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0194.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4786ce58-5143-4d8b-b37b-08da269696cc
X-MS-TrafficTypeDiagnostic: DBBPR04MB7641:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB76413E83A5449C54140D84B0B3F89@DBBPR04MB7641.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jqOyCAWCKznMvypUKtfiWpUP2kDn3ZGwvltvR/p04I4Y0KYqdjiwQFNuJ81ToF5ofpWd91XXDnBv0eTz5Mxxx3H8JgQZtMbdntPdPMiwq8jtxrZ96+bDsUHasJXhCXVbYxdWp8YDhm1ITD6h+wEFX7BQkuhFp4wqPqvIlfn2ofCggFiJnO1K2St0+xgPm5BZ2+sCYvT8b3kj8Z3tJ+s0Q40H1mDu4vLHH0OZrd/JB+iy9RhtoAiMx62G8Ha8d97/qtPlY/wXZcXoTfgOXVcHdKEHZxfAfhB5aBkRXU6FTyRWS0gcsV3ev90zCox471CX91nhcV7miSNaqBDY3a9G9QLnjFYQrhy9q8BvTaYb3kfui0/pQfGKL2hPiFN/aiWYNoO8SMBeRveTB93PdJs4eQGIjsyWV5527679joyshpTcIh6okipFU4i5pepm58u1zY939EF+9w7CdHx3fycw608BZREFJg7KTyM3Bpo+iuZCwebCJVfwBL+QHrE2LD74Q6IIlOeQDI+ErLCc86EO/oFFGzXfK7VM0oDen7fsuS91M7zEPdE1OcEvTPMS6KCe2U/42RB/rgGJOA0Ya467H3D++eQpUiszXVk8AwDB5bKhHN6I3N4ZCBqky+Y99p9OUPt9xuo4hXCcJkIjgrCFgWd7BvIIgUmBp59A4/i2lz0atUcgCZVRH83GmN4atsTdkbvW0iqZe4ItBuY4r06TO/hAVXEOqM1StW93MseFNLzZhjm34yV7URDwKophxPQwkMC4JsFsipiX58/NBt00f6JAjArhp4hx056gi2IYikeoLB/fttGn1/LRWV1iZ52I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(6916009)(31696002)(86362001)(31686004)(8936002)(4326008)(8676002)(36756003)(2906002)(5660300002)(508600001)(66476007)(38100700002)(316002)(26005)(66556008)(66946007)(6506007)(6512007)(83380400001)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENSczdJWDEvL1JlcFpJb1Y5NmF2NXUrSWJUTXM3ZkFBNU1XQ0xuNTFhTjVs?=
 =?utf-8?B?ZVd0dFBHOU54dDAwRjBEYzl4aHJqK1BzazFlb0JnUWd6dzc3djhvQWN0OVo3?=
 =?utf-8?B?NXBYaGhIK05VZmNoUDlVeUczMVVaWFF0VFBONkEzVnhyU2V4SDJpZThHVGpV?=
 =?utf-8?B?c0R5cE8rK0ZtMFVVNDdKMCs3SW0rQXFxU1pvUldZSkxxanUySDQrdWpjUGs5?=
 =?utf-8?B?U3hFd1BNMzFEMlVHbmdCdUlEZmd2OWt4K21pY2JORFFCSHhaLzJNNUlEc054?=
 =?utf-8?B?Wkl6dVM5aFVVMFluWHZZc29BUEhsZkpwcUE1c2FEaHRLOWUvV2JZVlZRMVA4?=
 =?utf-8?B?R2NsaUZuWTN6VEFBRXdMcTlrT2RzbFFVTWV0MnVKSFVDc1ExbjNNNWIvK0lG?=
 =?utf-8?B?Mk5VWVhFaUFzUXdlN2RxOVFUQ0RDRXFCYkI3V09aaE96V1RuMFY4b0l5aGs2?=
 =?utf-8?B?TUVVbHBVa0tmNjY5Z1dwd3ZaR2VvVG1NSW5QTzdJeEJHUmNZNndCMWwvQTBo?=
 =?utf-8?B?T2o2Z2U2eE15QTZYcDA4eFNCcE1tRmdYdzNBSC9SeWhxemNLVG5HeXBTcnpP?=
 =?utf-8?B?dHJ6TjNzRlhsaW1xMUxCQUlFK2FKMUZXbjdsM0czQkRtbkkza2xobFlmd0lQ?=
 =?utf-8?B?Rkk2ZjN6WEM2cDlsS2ZZOVQ3eEoySmQxeG1sTkRKTG5PQ3BZclZtdzhockd0?=
 =?utf-8?B?bWNuMFc3WDUvcXRFeHUzYUw0QWVTQUtOMC9WOTZmeGFIbGRYeFdmcHNxcDJ1?=
 =?utf-8?B?TVpSVzArODBtRWYzeWxpcXZQZi9ILzRvVStSaTFnU1prdG5FajE1SWpZOVlV?=
 =?utf-8?B?SmhsaG5zNk5GUXZsekV6ZXhHTVA5RWRvN2JoeGo0b0hmdGFzaWdyVDEzdFA2?=
 =?utf-8?B?ZUh5OUUycEcwOURlOTNBRWFELzYvZmFWSXhjU3Zoc2w3MGp6QjVpMGw3THZw?=
 =?utf-8?B?OE9hQlZ6MnU1TkhnUDZyNEsyL3ZFVUJEdG94UDg4YkhvRGdBL1gxRzhpUzRx?=
 =?utf-8?B?TXFJbHBJb3pOTHFnejhDTVlnWGtmTWphZzJ5OHV3dWpaNzdRazREckx3cnBP?=
 =?utf-8?B?ZVFVSmtNWUM4M050MFd0Rmg5Rno5LysxZ1Z3OHp4eDZnRnFQMnhWUVRLZWJN?=
 =?utf-8?B?eEhmNFFpR1hROWYwelQ5OWFCQkdLQmVPdWF6N2VKdGh4NjVvcXlyRG5kc0pY?=
 =?utf-8?B?V3c2ZVFDOWQzelo1SXNCN081dDlrZjdLNzlKY2VaaElUTFVsMlVKOHVnejZW?=
 =?utf-8?B?WThwdDlOZFdqWXFhMCtNSkJaT016eUttUVhUalYvcjQrbmFKNmRRS1VxNmlO?=
 =?utf-8?B?Q0tNeTFVaThuU2M3SjhhYXBFRFdqUUlOSTN2UnlrZVI4VnVBSW92dXJZa0s3?=
 =?utf-8?B?WVJoTmJ2WFp1V0JWL0R0aDk1a2hUbkpHYXdmTDJCT2ZPQUhja2dOdDF3VmFY?=
 =?utf-8?B?Q2ttcSsrTW93T0ZzWXdiNmUvMmdxbkluNTFMN3JSd0wxNm1GVEN3bHhsUk90?=
 =?utf-8?B?d2JjQUhyL0xYU3VWQWgzaW5wOVhUOWFxUG1OSkQwYzAvK1h6elBBb2cycTY2?=
 =?utf-8?B?OHJJQWVVOXY5dTRiVXdzenhoSmRXek0xWGMybnkram03R0JLRmwwUWRxNVZV?=
 =?utf-8?B?R1NCSEcwRDZOQjFiYWZmMTh2ak1oWVRaZFdPc3crYWZWQVlaN0lsWjlHMTR4?=
 =?utf-8?B?MGwvSFkxUXAzUUFWUDhpT2FiOEwrbkg4R1JFcStpYm5yb01sZnhRRkJJOTI3?=
 =?utf-8?B?MjBOYldjRFQ1dDB0TC9iOW1pYXpManZEcXZOcDdFYUc1REJYZzg3K2xMWHMr?=
 =?utf-8?B?amIvZlhwLzVPamtnNkZOd3RSUjRmNytuNVhzZVlnWXJIMWo5bUJ0TVp6bEFX?=
 =?utf-8?B?elhSenl6Y1FoOGxyOWxNcGlhRndQeFYwaTNnSWlMUFpVWlpTWklMMlphR0FH?=
 =?utf-8?B?ZExVOVl0SmdZQ1BHWTRnUExQN2dWUmNCZld1U2djZ0FNWU8zQTdUYXVpeDht?=
 =?utf-8?B?alFNUG1oRGpGK1gzSGNRVDNzbHhsL0hvMG1CK2tid3R4K3lXM1I3eDlOd1Qr?=
 =?utf-8?B?T3RSaTZQRXVweDRTZVFpRVA3cU9ibG84MG9pYUcvekhoaHpjYzZxcFZIM1RU?=
 =?utf-8?B?aERXaXN0ZVNOdVBtcXZhcXhyb0RxdmFyNy9qcTBORDRxQmhhbjhVemlram1m?=
 =?utf-8?B?UE5COC90SG9KZTlTb3ZOcmVwLzFaZmJlR0IwM09MeS9sUmJvOFVDczBheEFm?=
 =?utf-8?B?a2NQWVZ4RmlONnl4bGt0aGJNZmRyWHg0TjlnUFNGOVMwZWpaTDVLbllvWTU1?=
 =?utf-8?B?eHlIV3dRYnRlTzZoanYxVzMyYWdYeDMvZE9yT0VmWEFyRGNlMG82dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4786ce58-5143-4d8b-b37b-08da269696cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:35:44.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ehietAuHGSpWwSk1Qjh5wrMwLnBLbCvBD9PZjVgRIwxWA6zLSizU2Hkt2RrQIjf5gI11iykMfDt2lyI3sStcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

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
 #include <xen/iommu.h>
 #include <xen/paging.h>
@@ -550,6 +551,91 @@ struct page_info *iommu_alloc_pgtable(st
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


