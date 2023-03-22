Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C36C467E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513228.793945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peupr-00005j-Fp; Wed, 22 Mar 2023 09:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513228.793945; Wed, 22 Mar 2023 09:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peupr-0008Ue-Ce; Wed, 22 Mar 2023 09:32:47 +0000
Received: by outflank-mailman (input) for mailman id 513228;
 Wed, 22 Mar 2023 09:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peupq-0008Cb-00
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:32:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f6427a3-c894-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:32:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:32:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:32:42 +0000
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
X-Inumbo-ID: 7f6427a3-c894-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ju5M9gjYGQGMaKENmKJuAXaM3SFeEfRPtreqgvrESg5vs6cvemY1MKyaZ2FGM/mUG/txSZcKvL846dxdwJBMy0cgOaXA3yHxoHwA/q7SiE6ss8ZME/P4Zv3KNsRqniylHYVa4HymiwUh2U5bgYhDGyCSz1y7LX2xk/R5yhuQmYCjkw085Yj3T3rg5E8EisdfNX7hcgNrEvrv73NrwtgnHOMu+/ltWe6QX3lgsGssqiAGwLaFGqzK+ZL3OqxYrinzgRnR5fZyTwykqqqkGI6rnF/6LzSUJQIAOupYGdL7Or0oFSq6WuM46N3h9PrC/N5zzQYUUCPBhttgChb2ltYfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq2CTH5rnfD4r3gVyLUiATIhZh4l20nM75mDa4ujbm0=;
 b=KM95882aE1qAodIkmxth74aYyC+cQOx6anIG5Uj2acXEXnwGJe8Xo9HDKw90J6pmc7Hel8yJ9wbtlp6iN18ko/Cu0/ck2KZ8Wbh2vtZGvhHdtRTuhUkXIOOvSR9ZnMfKcfwIvDs04bQkscehQowjuZrWy7wSU+zSDrkmVuYxpShfCeFSfXlbbnO8wjCFjKDIKZfv5dERp3vhfZiVrRfai8j5Xjqrjs9Q4EnJDZ7//OaTFgCah4QxPVuUzV0b8AVbfKI0WOS/KlqhUMJ0BU3R94t++jTFpE32ygj57erIYD6RoaBwiyoANoVqGJKFg/MwYLAYObVCYNud0g6vwdjCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq2CTH5rnfD4r3gVyLUiATIhZh4l20nM75mDa4ujbm0=;
 b=VVlgEBB6g493M86kftHwFKYnhd3rShOF+ITGFlHYYqoYzRoC94xAAi32/GWp7s9biinYnuhNfqGRiAyzXAHe7UkiWAw2VVgQU5ppsHqkWPtKDomCHlg33VN3QPnwixgKJvzWrl+9Zy3WUC0E93vHBMJcSWCWMT+NVr8nLJmoJfp8r/MLIrR//t8+aE5D6MAE1Ojx+Gx7AXoIv2CtYmf6xPc7QfMOA/T+YS+HZzGR1lvogM+2aJPBPYZlPdgVHsrjdaPhYOvqh1D9duQyhYefBT48Vg2HvQ3w09qezKsbKLz91jd8gJ7JY+2tIUU4MlCAAEcbBDJYI0fLlfw9Zvjm+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d36db89-cd87-06b8-bb02-395ec79662c7@suse.com>
Date: Wed, 22 Mar 2023 10:32:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 06/16] x86/shadow: purge {write,cmpxchg}_guest_entry() hooks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4712c7-766a-43c6-b805-08db2ab86298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRP8SRKU7yb9YwCXjp3a/KhvxiUUvj5KIonY0i0L22HS+6DqAbR2VMq9zVP0FwPFmJdAN95DRwDe4p5jr2rx3YSBodt+sE+6OjJl/G+/8NaGfmGNnw1AQqvjtZuCzThSQ1oWBvBKuZjTkPX7QHKOcQ2HAfk2Wplaya7r7wT8N6e5yHdAc/2dZ7boNkS+b7ZQRVN1VUlrYU/loH6mDCEDSahHATXZEJTRgtgIfftoCvyMWPju5u2W4oXlYuKtCrh6+M1DWkgvy/xRlSKaeSbCTTlAARri+7ClcExHibn4SKsN6R7Yswdr6Hu5hgOGp2Hja9svYRkWjU+L5WoJiRmtXOKcFw+s1YN4ol2sith45Aq1AMzFFK+t31xjsUkmxUGKMsc3htgPEk7qGYI5aPGhhm94vY7sH/uQxnFB+3FIouC2GxL/fjRc1oX2LIS0J9enitbPJfjAwEyXrbMrl/ynlf3/AnbRWf9OegYcOp2y/oddT8sU8cwzlkBsMXB6F7dFHrHwRYHiCUV2MwjBGUb99CJlzCrJn4Pa3HU8jh/eyhu55PPm6WrfVqDUYcuUbT0N0yCE2skL4Nuig/5MAVdCo+Cw+Ct59D7I7uFBYgBIflPtU1p6gHtVBNIOyD+UG/bK8YhWea0SwG1M6J6h+5WdPrDUkGlY2Nti4NYyIyyyqGMxdKTrwDmm8+5JzyF+nU7YGV+vTMPKZ8ulMp7smhRMGKjaRR7ic2Pm1q047gnEPmOlQ1NlJaD0HiQyEqZccV29
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(2616005)(6512007)(54906003)(86362001)(38100700002)(31696002)(66476007)(8676002)(36756003)(2906002)(8936002)(4326008)(66556008)(66946007)(6916009)(41300700001)(5660300002)(6486002)(6506007)(26005)(316002)(478600001)(186003)(83380400001)(31686004)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJqcTlHWnNEMzZBdnBMUUUrd3ZNM0I1QkxxOHAvdTBIM2tFVTFrRVlZcUZ6?=
 =?utf-8?B?TXZ4N2o4NkZUY3BBR1lrZzZsdFJpMEtyQ3ltbnFrMmY5enZNTng1TThBcXhs?=
 =?utf-8?B?N3g5aGRIbTFuR0hsNTZqQ0NsR0R3MHNCa1NVV3ZyaGl4dHRxWFpmTzllV2xS?=
 =?utf-8?B?ck82M2hYWXFmNnBublFoa2s1NjlWZFBUK28raDVMUVZVVktiZHZNdmJOdGJi?=
 =?utf-8?B?dWhvT1E1K1dFeUxuNmxHUi9zQmFwZ0hiYXZEbTVXc0VLOVAvVjhmZFpGaXJp?=
 =?utf-8?B?d1NpaWxJSGlJRmZKTUwybUZSakNZQXJQNjk5eEN5cE80Si9LRHkydTRWTUI5?=
 =?utf-8?B?UTJzeFNtSG00cElISnROVVVBaXFnVWwrNVVLTjI2T0xKTC8zTzdkeklCcjl1?=
 =?utf-8?B?SEd2VnFHWFhaKzhWbldUcDJjYXlZVmlVMFd1L2xXMlJ3U2N0azNyam9kQVhI?=
 =?utf-8?B?eUsyMXo4cThWb0cwT3d1czZoSHkrK0NEdnZtVENyekdDL0w4WmFUeEFQVGZG?=
 =?utf-8?B?VzJuMklmeXpOM3hjcjRLL1JvUlIwWklOQW03UDFPa3duZzZlVyt5RTFYaDFW?=
 =?utf-8?B?OTc0N3Nra1lvMEF4eGRWUW9vb1A2czFmNWxpUk01WUFxYnRqQ09LTVpRakJ2?=
 =?utf-8?B?aVR3Y2EyWnlGb2EyQmh4ZWQ4R0JYTmNrYjBaa1h3WjBmSWt6RUlmQUZDL3I2?=
 =?utf-8?B?SlJCcGcwR2hid2ZYU2dvaFAySVZSTHU4WkZBQnhZenYrQU5zNHlmakZHYXZp?=
 =?utf-8?B?YWhseFhidWpVQXVWWTdWbkhWTm5VaWg1Wk8vU2VmcWNoUmRtVEJvWUlQMkRE?=
 =?utf-8?B?R0dRNXlGNzBVdzRQUkVldkc3RDRIRFRsN0V2ekJoNVhLYzFhelJrQVRVT1ZG?=
 =?utf-8?B?NmEvSHVCZUR4UytiYTlZZmNrRUtQUkVaQnQzNWpqajFCZVZ5cGNFMEJuL0pR?=
 =?utf-8?B?RlhPL0YyNVVGQTY4bXZiSHlsbzVFb2hndHF3RXpVRldVSEViZjZiSnNiYWwz?=
 =?utf-8?B?Ymh1U1ZVWnVlNTlzczJHcEgzcXhLQ0pLQXZTd0g4WitCclF1YVlHc2VXTTc0?=
 =?utf-8?B?THpDQTg4eTNVL0IrUy9CMHhUMUN6djJISmZPNGNnUFhZSGg1QU5OUDBudExu?=
 =?utf-8?B?N3FLeEdMUkpQRHNlNDFCUUpzaStkZjRwMGZzdU5odjJDNFI1bVRpM3J2bUZ2?=
 =?utf-8?B?UFgrcUUzMmdjeWFmVkhNK1hPcDlaMHpVYnkrZ3VPZ01RdzdTMitPckFtbkFK?=
 =?utf-8?B?SjRUcHpzajJPNkR3S3pJRzR4QkFWaTRpSlJyckNHSExEcm9pb1QzRkg0ZmVI?=
 =?utf-8?B?bHBRd05hZnFrWDVvRVJtcFZQNW5rOUZhVVZoRllzVTVUdXNNNVZMU1IyVWFh?=
 =?utf-8?B?Q2N0bWVTa05WbXkrVE12OVhlSGxUTHhMcU82RStPeDY0eWFKSU5aWlk1L3Vj?=
 =?utf-8?B?TWU0WmdwYWVpSExNUE10UE5OQklXeWtmRmpsNWlzeS9MYThxeHg0aEdjRG5F?=
 =?utf-8?B?OTlzdWRPaWpWWk54Vi9HaUVmVGh3Z3FmeTYzWDkwZnZiUC9lMEdRZ05Qb25G?=
 =?utf-8?B?N2VJUG5tSVRrZUJpRFZXTXJGVk5zZy9GWTZQL3YzZm1RVXJhUHBqZWV4ajV6?=
 =?utf-8?B?M1lhRVVsQjhrcTRnVW9QNWh5VXlETFo2SGV6M3RTNDdnRUZNb2RQbEtpTVBh?=
 =?utf-8?B?NW84R0k3QWdVY2NURUhOWHBZOWI5dlVtMkFkeDVlWkxmd1Z0a3NnYXpOTlJp?=
 =?utf-8?B?djFBdmN2U0xoUXNCYURqZGIrYWFTeHlwNS9HYTdzRm0wVXFKeFM1ZE80Zmtv?=
 =?utf-8?B?OXk5NXB0R01tVkY0RzEycVdxUGJibDcyN2FWWGNJSjJFa1VFTnR2SEcxN0Rz?=
 =?utf-8?B?ZzlvdktRRDNBN1l5QUVPK2ZUT0trM3ZBV3cyYWhGNjJ1K1VjQVNjMFpPOUhq?=
 =?utf-8?B?N1dydENkdktmeUdxMEFDTFFobnVTTmZzZ1BBM1JoS2M4Y2Y4NUcwbmxnUUFQ?=
 =?utf-8?B?Q3FwWU9SOWRReVpYaEFuSHdtcXE4ZXB0U2dHeVpPeWlnSU00Zk5zc2VqcWVM?=
 =?utf-8?B?SjEyeHRQUG9oa3h5MmtTU1JUNUJPS1NwNE5TWjRRdHhoVGZrOVl3S2thT2xC?=
 =?utf-8?Q?zwdtG0/PTZKNtRU9GY21JfB4g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4712c7-766a-43c6-b805-08db2ab86298
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:32:42.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81cYYG5+C3W+3CgJd7vgCt23L9j6stI/ZWaAv+veFELiC/v7NoXTmuxC46QkskiKJHPdPnjRSE21ZDZvQSGIJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

These aren't mode dependent (see 06f04f54ba97 ["x86/shadow:
sh_{write,cmpxchg}_guest_entry() are PV-only"], where they were moved
out of multi.c) and hence there's no need to have pointers to the
functions in struct shadow_paging_mode. Due to include dependencies,
however, the "paging" wrappers need to move out of paging.h; they're
needed from PV memory management code only anyway, so by moving them
their exposure is reduced at the same time.

By carefully placing the (moved and renamed) shadow function
declarations, #ifdef can also be dropped from the "paging" wrappers
(paging_mode_shadow() is constant false when !SHADOW_PAGING).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -98,13 +98,6 @@
 
 struct shadow_paging_mode {
 #ifdef CONFIG_SHADOW_PAGING
-#ifdef CONFIG_PV
-    void          (*write_guest_entry     )(struct vcpu *v, intpte_t *p,
-                                            intpte_t new, mfn_t gmfn);
-    intpte_t      (*cmpxchg_guest_entry   )(struct vcpu *v, intpte_t *p,
-                                            intpte_t old, intpte_t new,
-                                            mfn_t gmfn);
-#endif
 #ifdef CONFIG_HVM
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
@@ -326,44 +319,6 @@ static inline void paging_update_paging_
     v->domain->arch.paging.update_paging_modes(v);
 }
 
-#ifdef CONFIG_PV
-
-/*
- * Write a new value into the guest pagetable, and update the
- * paging-assistance state appropriately.  Returns false if we page-faulted,
- * true for success.
- */
-static inline void paging_write_guest_entry(
-    struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
-{
-#ifdef CONFIG_SHADOW_PAGING
-    if ( unlikely(paging_mode_shadow(v->domain)) && paging_get_hostmode(v) )
-        paging_get_hostmode(v)->shadow.write_guest_entry(v, p, new, gmfn);
-    else
-#endif
-        write_atomic(p, new);
-}
-
-
-/*
- * Cmpxchg a new value into the guest pagetable, and update the
- * paging-assistance state appropriately.  Returns false if we page-faulted,
- * true if not.  N.B. caller should check the value of "old" to see if the
- * cmpxchg itself was successful.
- */
-static inline intpte_t paging_cmpxchg_guest_entry(
-    struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn)
-{
-#ifdef CONFIG_SHADOW_PAGING
-    if ( unlikely(paging_mode_shadow(v->domain)) && paging_get_hostmode(v) )
-        return paging_get_hostmode(v)->shadow.cmpxchg_guest_entry(v, p, old,
-                                                                  new, gmfn);
-#endif
-    return cmpxchg(p, old, new);
-}
-
-#endif /* CONFIG_PV */
-
 /* Helper function that writes a pte in such a way that a concurrent read 
  * never sees a half-written entry that has _PAGE_PRESENT set */
 static inline void safe_write_pte(l1_pgentry_t *p, l1_pgentry_t new)
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -248,6 +248,12 @@ static inline void pv_l1tf_domain_destro
 #endif
 }
 
+/* Functions that atomically write PV guest PT entries */
+void shadow_write_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn);
+intpte_t shadow_cmpxchg_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn);
+
 #endif /* CONFIG_PV */
 
 /* Remove all shadows of the guest mfn. */
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4131,10 +4131,6 @@ const struct paging_mode sh_paging_mode
 #endif
     .update_cr3                    = sh_update_cr3,
     .guest_levels                  = GUEST_PAGING_LEVELS,
-#ifdef CONFIG_PV
-    .shadow.write_guest_entry      = sh_write_guest_entry,
-    .shadow.cmpxchg_guest_entry    = sh_cmpxchg_guest_entry,
-#endif
 #ifdef CONFIG_HVM
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     .shadow.guess_wrmap            = sh_guess_wrmap,
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -428,12 +428,6 @@ static inline int sh_remove_write_access
 }
 #endif
 
-/* Functions that atomically write PV guest PT entries */
-void cf_check sh_write_guest_entry(
-    struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn);
-intpte_t cf_check sh_cmpxchg_guest_entry(
-    struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn);
-
 /* Unhook the non-Xen mappings in this top-level shadow mfn.
  * With user_only == 1, unhooks only the user-mode mappings. */
 void shadow_unhook_mappings(struct domain *d, mfn_t smfn, int user_only);
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -28,8 +28,8 @@
  * Write a new value into the guest pagetable, and update the shadows
  * appropriately.
  */
-void cf_check
-sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
+void
+shadow_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
 {
     paging_lock(v->domain);
     write_atomic(p, new);
@@ -42,9 +42,9 @@ sh_write_guest_entry(struct vcpu *v, int
  * appropriately.  Returns the previous entry found, which the caller is
  * expected to check to see if the cmpxchg was successful.
  */
-intpte_t cf_check
-sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t old,
-                       intpte_t new, mfn_t gmfn)
+intpte_t
+shadow_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t old,
+                           intpte_t new, mfn_t gmfn)
 {
     intpte_t t;
 
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -1,6 +1,8 @@
 #ifndef __PV_MM_H__
 #define __PV_MM_H__
 
+#include <asm/shadow.h>
+
 l1_pgentry_t *map_guest_l1e(unsigned long linear, mfn_t *gl1mfn);
 
 int new_guest_cr3(mfn_t mfn);
@@ -32,6 +34,35 @@ static inline l1_pgentry_t guest_get_eff
 }
 
 /*
+ * Write a new value into the guest pagetable, and update the
+ * paging-assistance state appropriately.  Returns false if we page-faulted,
+ * true for success.
+ */
+static inline void paging_write_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
+{
+    if ( unlikely(paging_mode_shadow(v->domain)) )
+        shadow_write_guest_entry(v, p, new, gmfn);
+    else
+        write_atomic(p, new);
+}
+
+
+/*
+ * Cmpxchg a new value into the guest pagetable, and update the
+ * paging-assistance state appropriately.  Returns false if we page-faulted,
+ * true if not.  N.B. caller should check the value of "old" to see if the
+ * cmpxchg itself was successful.
+ */
+static inline intpte_t paging_cmpxchg_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn)
+{
+    if ( unlikely(paging_mode_shadow(v->domain)) )
+        return shadow_cmpxchg_guest_entry(v, p, old, new, gmfn);
+    return cmpxchg(p, old, new);
+}
+
+/*
  * PTE updates can be done with ordinary writes except:
  *  1. Debug builds get extra checking by using CMPXCHG[8B].
  */


