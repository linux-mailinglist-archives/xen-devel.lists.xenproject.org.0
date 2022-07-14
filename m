Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3BD574636
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 09:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367116.598165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBtfG-0000Uj-Ji; Thu, 14 Jul 2022 07:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367116.598165; Thu, 14 Jul 2022 07:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBtfG-0000SG-GZ; Thu, 14 Jul 2022 07:53:38 +0000
Received: by outflank-mailman (input) for mailman id 367116;
 Thu, 14 Jul 2022 07:53:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBtfE-0000S8-QP
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 07:53:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10067.outbound.protection.outlook.com [40.107.1.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fe569fe-034a-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 09:53:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8277.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 07:53:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 07:53:33 +0000
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
X-Inumbo-ID: 0fe569fe-034a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1NDioNQRY5uMEDQRD3MH64PseamVUiwIYajTbSBfJOD75UsfWb6wpjU64c99rhKuWVWh23UEdtgzb4bhHzF1vhGcntTBPHxTLqdjP97CF3DeV1KORbqnHqEBU3XkYTZs8sWuVIz79Vm9urZ3VwHgxVvyhpcbzRQOTMN85VRZXkHsE06IvBhRhnnwVQ7N7dUxTp1klWoHJ5DehSFMMvJLdTbWEkQR1lDaGjUxFT3P4Obv5js7flBCE4UqnaC9U9V2G8BaRUh2nWRYqc8TBSqfMNQbYgJIae+31E9xL+895TFncRzypg5c/yGsvkgZzEOj0mdyGay/v5shNgs9J62oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg2++ohbROKGuBuD1u7yvOVgR0jicqwjmakPmvGc0Gg=;
 b=N/pm0rk5/4wNn+fdlvWDGPI+yeCmmU0LnLaUauIrg+e8wTIOQLpCYoVvEk3M8b/ZTgApoDv4GZZ4YPLH8sdHwQVkMN06AgHQ7EAQzFjTKc1AbySNay6bwIgMotsFaCoQ/Kzl33jvuKsLbspmrVOus6Gcde0CHufvWJpbyHGd9e29FhnfzuKUJE63ebsvG2xcBIR/QhtmBQbsJKxZnoajJflVAus6CSEo2zJJukx5YZF6tOeAFq+ckWBAGFGoGJv/4oWJuzpCYwK4GyYg9KcP0LA8Z1hjAjKWyYXMTBaXlyEG4qZthT5mnZ+HM8pK0SGSwMgmgr9ugYxz1nMIpo9tvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg2++ohbROKGuBuD1u7yvOVgR0jicqwjmakPmvGc0Gg=;
 b=LdoCnC22UzDMTynogdfvEujOV45N7sRT8vrJ5yZ9k++toQDsijNGms9W+geD1dIY7IIGfnJYTt4lEDCIOCd/TS7OQx+pZ5X2EvhQ8hM4xAtKPOcnHvm8p1mRg8vpSI3d8PO6Wk2e2dPyI8XLotO8kDxXKUZokvrMbmKEtMj/sidPcBs0ar8vMq14LYJJ9uUvct7/QNzaBmGpUIL0JZYPxmEQJvuQTylXrn0ofma7sclCCJRU/k12V+4FiigFZzvWwVo5OVjU4u6p3rdyf+Rr6uz4zfaMQBPGBdeCG6fhVpItXMZRX7CPiGAfKc3JX5R/+iCGafV7QPxSDN2tQ8abHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c3f0ca0-94c2-6462-f4eb-a2ac54c09554@suse.com>
Date: Thu, 14 Jul 2022 09:53:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Charles Arnold <CARNOLD@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: deal with gcc12 release build issues
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79cdb4cd-1522-41b7-f19a-08da656df316
X-MS-TrafficTypeDiagnostic: AS8PR04MB8277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GhjG1VbqxeRzXcMEFqBsUy/PkM7/Sd4HQO9kEmxLQ8PPBOh3BjZsjjXY9pFV1DQ9gri+/S+z1pn8bJ8m/KUGtPYZYcXnTYbsfxJhe0n/BRUEYXi9RQJAeuqT4LtBn0GZk0lBm59eF1CqXKYA1oRoRQRBqdY+HJYfhWBtVPHfu23zA0M00IqupxFxPjllljQSVCcZsqY8Rb2r0ggHfRXalo5vRIsOZX/5RwX9DlZ0JGBFj43T+9PE7+y0aXlRAcinunSnDWfzvEmq1uEtl3OjvUl2Pt9ZYJozde1frvT3HSNbqDPKEFKE6bC0c/zyp0iFTrr+DVny42/qjyE+53ga0ar2OwQmREIiZMLPnVKnM4TlcCg/kbqdsdePWGj1p/1YSyw/MWrVh1WI1j34g6X5oDB4WXaIdUALlOEf8WnDIdN+2t8tEdBG8eB37/poyeb7CmadxLQxehqN098zAomlnnUpLmeCh3P/uHw+7IbaUKpTYTJlnL3awBzHVBjbnnKWXc799+Q9mv4IUwqiewHqCXuhAgiOepd2J/VqDwjnvLVI3nPCsj2HMlGY/YfswkhXy4qEAbuPrXX49At/We5Yryp80GZ60Tcw437JNOWYrPxois/FesUqA11dnc8Ef8fg3/2Oy1NJaIakzSKsuKtOoaiNNMSFMPmbeD+XQSZOJ6HrFnLu+CNGRUd/U10CGp95a9KWTuKzWJ8gXy0oE6hUd9z1ff1OazjRpejv/UP06g3lVRfjKLKPWbeQ5RjwnzznzuDUFLalifiIgoJYlxTSuCh4wJfF7+eNbjDYIpvEOW/c9HBcdDXZaHQRz8Pa8Z/raQ/Lqn+qLIrJtokfsOi1w1TjQvnO8/Xwk33L4FG7t+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(136003)(376002)(346002)(31696002)(5660300002)(478600001)(8936002)(6486002)(186003)(6506007)(66556008)(4326008)(26005)(107886003)(38100700002)(66946007)(86362001)(2616005)(316002)(31686004)(66476007)(54906003)(6666004)(6512007)(6916009)(36756003)(8676002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU1GcWg4UGVNZnJOZ0QxNU4vUWlNYmZVcmZFYTMvUlgzOE5tY09Gb3RIUW5r?=
 =?utf-8?B?YjAvREZkNTQyUFc1RnJBZFB3NmJFM0txLzBsWjJ3aUtGYVZ5L0lYQUlETTNQ?=
 =?utf-8?B?dkFwc3EvTmlPY01BeHJoOU1SOHB0YUMzT3N4Q016dHFObkpDUzUwZlFuRzBF?=
 =?utf-8?B?L0N4bkFyc3JLZkVxM3pzUmo5d3BCbDZDd3VHYTV1UzUyYkx0ZGprdzNUVmt3?=
 =?utf-8?B?bjg2MW8vMEU2ZERtSmM2b2FOZkVqRk1QZk1xM0dFSmt1UlpKd2ZzUUtSZ2Yx?=
 =?utf-8?B?eXlNVG93TlZIMFhkdU9XaEw0L3AwTTlmaEUzcUovTFBNLys3SG5BYU9Hd1dO?=
 =?utf-8?B?QWFHNklOQ015TzdqaDVjVFZVU3BHd2dDelN4VVo5WTJVREg1WnJlcGZybFdT?=
 =?utf-8?B?eWFOcWpPbFE1N3U4aGp4WWY0SUhrdmlDSzI2QnZsVzlOZ3BCODhwSi91S2gv?=
 =?utf-8?B?Y0s2aGMwdXVRR3JSdTNjdlZLcjFKc1RneDdrUmx1QjNRc3dEaEdGa2p0K1Fz?=
 =?utf-8?B?U0szeXV2MmtndERkZmdRS0tSRnZ6V1pCcWpsdkp0V2dDR1Q1Zng5azlSeFpU?=
 =?utf-8?B?YzRKYUlPQXEvMFI1V1FZekdrQkM4MDZvUWo4c3d6MlIxMktHVG05dEtrQndE?=
 =?utf-8?B?T0lMNVRzdk42WWVtZlAyZTJmWWw5UUJ4WVV1RWhOL3VyNWJIVk9ieWh5Mi90?=
 =?utf-8?B?VDV0cEtNVWlvck1uZElGeGVaMmhYaDNpWlFnU1RxNWRQTXJmVG5GUlF3UGM1?=
 =?utf-8?B?SmdDVWw4U2wwQlR3anlXN3hkWmpNYnVsWmgrU0tzbGh3blRVK2RtL2h3bEtF?=
 =?utf-8?B?R2FENDU4SmdvRzgxSVNEbU5mRVhSOW1qc1h0ZDg4bFVrS0I2SzFpSWdxZUVi?=
 =?utf-8?B?TGtEZlVpR1VySWpmK3o4a2d3WlAzdlAyY2pnZ3l2aFpMR0h1SUxLR3NjYUNh?=
 =?utf-8?B?eExRd28wcTFTNlIzTUE1TkJ1Vk9wTFJ6U1l0TTZMM3MrVzZUNCtLNFVmd2RH?=
 =?utf-8?B?VGFRK2QwQkswNUhMSzRHUVF0Rmc4eE00ZFJ2WU80T1dpdThNNlplQlRhTVlK?=
 =?utf-8?B?VHJhM0o0bG1MYytWeWNXdXNteWlqZExzWUJRd3h4SVR4MWlMSkxjOGtkenpX?=
 =?utf-8?B?aWZxNXRrcHRxVjN4Uk1LMmI3bWcrRDVpWWpRRU5WLzdmNUR1Sm5qYTFRV1pz?=
 =?utf-8?B?VlFlOUFVSEtvS1IvdjVmNXFUdlVnT2prcVd0Sy90emdaR202RWZhY0p1M1Vr?=
 =?utf-8?B?R1JVTXJvSGNqRFplTHpnSGZpWUFTOHhIK25iVkhiUlJBeXpVOW9CNDZHSE5N?=
 =?utf-8?B?SjRJUnhhbG1WcXhidTZtaG1xZUc2S1lxZUNqTmtGeXRPZGlXZTc0SEVRdU5v?=
 =?utf-8?B?azNSVDNXOTZUWGNDbzNzYzgwOWZYSUlSY2RHbitzWGhEbFd6VCtjcmFDOUtv?=
 =?utf-8?B?SUQ0T2dZQmtpanBmOWg2TklFV0xPUG9JblkwYlJNUll5dFc4VHVya0JERmJv?=
 =?utf-8?B?dWd6OVI3bmwzN1RtMHIwdVF4WUs2T2VDWFdLQld3Q25rZTU1M21sdGtBS0I3?=
 =?utf-8?B?WXVCakJYbktLSERSTXgyZ0NpWVJrSVVWOWRPRWUxbHhaR21OKzRwa2NVdzZp?=
 =?utf-8?B?MzdSd3A5ZTJCdExETTFXU1NNRzRIQ3NLWDBTVVRsQUptbWxmVlRlSFZlSkE5?=
 =?utf-8?B?Q3ZrazJGbVhOU3BGUkdaNU14N3NwQUc2KzhpNEp1VkFoODF6YXNneGt4dlRt?=
 =?utf-8?B?QTdCaVZtUnZjOERTQjN0M1N4clNRWWhGS1g4OGQ2eTdnRUtETW5JZGZibFZs?=
 =?utf-8?B?bThXNVdFcFNZeVhoZEEycTBObU82YVhjNGpUQ0xXNmN3cnQreFFmdktkTFJG?=
 =?utf-8?B?ZUsxa1o4bFl6YytYWlN4dzR2czNEMlEySmM4aUk0UmozKzNoMEx4TFNUeERO?=
 =?utf-8?B?SU9yWU81QWxIRWJYaTdLY0hDbkRVN0gwMCtGN0NsbkhFNzFqTW4zblJjL1B6?=
 =?utf-8?B?aFZNQkdMTENvZjN0OFJxbGdyODRNSmV5cysvRStMSXpDbVlWL0o3ZFl1eUti?=
 =?utf-8?B?N21DS2N3ZXNxWDgrUzJEbWFTRW5XNUdSMSt3MDFLQlg5d2xtS1NvODMram04?=
 =?utf-8?Q?5hhx1j9RABxOmqlDAglWzexxb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cdb4cd-1522-41b7-f19a-08da656df316
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 07:53:33.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfF0rv0dAdm7gJSavsdEm9xtaL+bVJQsIH+Y53FupAjJRqN8+V7QaCulgRexf24RIE6y9J00neav7hmLd9CRGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8277

While a number of issues we previously had with pre-release gcc12 were
fixed in the final release, we continue to have one issue (with multiple
instances) when doing release builds (i.e. at higher optimization
levels): The compiler takes issue with subtracting (always 1 in our
case) from artifical labels (expressed as array) marking the end of
certain regions. This isn't an unreasonable position to take. Simply
hide the "array-ness" by casting to an integer type. To keep things
looking consistently, apply the same cast also on the respective
expressions dealing with the starting addresses. (Note how
efi_arch_memory_setup()'s l2_table_offset() invocations avoid a similar
issue by already having the necessary casts.) In is_xen_fixed_mfn()
further switch from __pa() to virt_to_maddr() to better match the left
sides of the <= operators.

Reported-by: Charles Arnold <carnold@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Initially I had considered introducing something like END_MINUS_1(), but
in the end I did consider this uglier than explicitly dealing with the
two instances we have.

--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -677,10 +677,10 @@ static void __init efi_arch_memory_setup
      * appropriate l2 slots to map.
      */
 #define l2_4G_offset(a)                                                 \
-    (((UINTN)(a) >> L2_PAGETABLE_SHIFT) & (4 * L2_PAGETABLE_ENTRIES - 1))
+    (((a) >> L2_PAGETABLE_SHIFT) & (4 * L2_PAGETABLE_ENTRIES - 1))
 
-    for ( i  = l2_4G_offset(_start);
-          i <= l2_4G_offset(_end - 1); ++i )
+    for ( i  = l2_4G_offset((UINTN)_start);
+          i <= l2_4G_offset((UINTN)_end - 1); ++i )
     {
         l2_pgentry_t pte = l2e_from_paddr(i << L2_PAGETABLE_SHIFT,
                                           __PAGE_HYPERVISOR | _PAGE_PSE);
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -309,8 +309,8 @@ struct page_info
 #define is_xen_heap_mfn(mfn) \
     (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
 #define is_xen_fixed_mfn(mfn)                     \
-    (((mfn_to_maddr(mfn)) >= __pa(_stext)) &&     \
-     ((mfn_to_maddr(mfn)) <= __pa(__2M_rwdata_end - 1)))
+    (((mfn_to_maddr(mfn)) >= virt_to_maddr((unsigned long)_stext)) && \
+     ((mfn_to_maddr(mfn)) <= virt_to_maddr((unsigned long)__2M_rwdata_end - 1)))
 
 #define PRtype_info "016lx"/* should only be used for printk's */
 

