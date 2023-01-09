Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A4662760
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473650.734371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsP7-0008UF-Af; Mon, 09 Jan 2023 13:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473650.734371; Mon, 09 Jan 2023 13:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsP7-0008RD-7M; Mon, 09 Jan 2023 13:41:33 +0000
Received: by outflank-mailman (input) for mailman id 473650;
 Mon, 09 Jan 2023 13:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsP4-0008Qk-WE
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:41:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51afb927-9023-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 14:41:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:41:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:41:27 +0000
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
X-Inumbo-ID: 51afb927-9023-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtmaXcXgS4IYt11xQ1Y8vbtpaMjDLWD9QtxAfrLcN2h22vqk1LIYlXhlwrAJengpnqQype31VEk70YlCffD0DQOTesj351CGLyoA1KUtZ9q288HPoZdTjGTKjmzt6cwP8oqkpI1NVJO/1MiKk56KMbWwcAu5/a1G8WjhUEww+AaMEnm4xGenu3ZpQ+UX5sxHHIPKxHlRY7YwVdXPFE4dNi+Kp3Iakj3CAEv8d0vv2DHSRIp/sm4hbZKwuIjcPTM91Zkx31dtWKlBSMM5dqZhNtOI74jVDbjygQKXRTb5Ou8HWzEEnE1uue9LAxxYUOBkLzhOOx42BJcFGhlKd7VLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKVxpWRnLLsiXUS1L42o6OfU5C2lD6jrUePiBTdkwDc=;
 b=iHbeyBn/ssFl0VWeJAeZ/KS9Tio7CdbHTyepVjQzUqgOQyYhW2P95xCyvU6HGcqxwBmG5OwvOEt34tN6QFiIuvHLr9EoIP+aPBl4MJ/fyKlj9vK6knCqX5LJX66nKff+wplprgVxeriDgIZ2qgVXTGaNbEUrfdNc/E12d8xdBOQ8mcEqE63lDCv7ftGnLfHaAMepTB2KK9VZUEjTUywHrTL9HM4bg/kGi+AUhTGsTDQtPOG2iAgFWhT1dIu4tMo38AOuSm/SASQgYYZCks2GfE6/YNNasOPo36zAadOCJ+RmHEXctyjiCvqIk9NjCOoz6evex/kEC+fpJlDuIBxTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKVxpWRnLLsiXUS1L42o6OfU5C2lD6jrUePiBTdkwDc=;
 b=vMcMN10EbPFfT4G1KVaVUqa9ZSuTYv00rVEh7EAlmIcvHyfwZddIQ6VtD/EZCXVfpRYz3buWTr1ruyrZRDZO52FS8DsKkcirQ/2U5Zl+P1C9dTfAp4hIY478Go014eDjFSXTtTrUkotMYN3+frr27UfzY+Qyvkixu/FRrF1t5il1yTXyu0jtofT/acYuNmn3ZOTVSJhC29Fh6RrVz8jhu1kHsAIIuD2HOBr01JDRX2HR3toPSOSFXVSzSFzKZqyYZxqML2vg6SIk1VLET0SFIsHfJj3wcNIFxJ+M7sDXotNJPUguJWKjSBJantpXixdR5nuKIuvXsNIqi/ZtOX+Dpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cab2c132-130c-ce2c-de04-cf45143efa80@suse.com>
Date: Mon, 9 Jan 2023 14:41:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 4/5] x86/paging: move and conditionalize flush_tlb() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
In-Reply-To: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: bfde1e5e-1d07-4bc2-69fd-08daf24734f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0unLGsazmk15rLIvSqnFfWdz5C1osJOQGM1aoaq8KPwUdnc8n5+Abhqz+YpnFOPry4ZNZ56XAZiZz9AEERMkoJpayuTgOmnd9kBYS8G/ukVsHBKCiZXHcUcA4RaKhj3ZTv7NP9vMJUjxjiLo965cw+mFKGqgst2U/sJflSxb/rLL0txNlJD+G7nKYLBsIiiIkQPWXz1tP9SHF2iCoelV8PgBB5oc00SkiV+Obffjp/E6f39Xohf8+qhJweEhkNk6HxSFbTy8+768XSoP8Ji6iv8ECrieHApxorqSrlv1BfXwZTTKnVWTlO6QKyFlQ69GoKWPxyo/8QrwZ+06zAv/bfTyP/tC0Pb9vnAl3mbMxlztpXP40K/VFj9tnaYlFU6BhlYQ3tX6SkJyzWcYbelx3sm51dTTDd9N59xvgLWPWZPnTRvX5Tbn1jEr8UGB6OjXQfhBHy3iguns61+Xl6nLlGZg84niKnXEDJhwnR9YXkrH6NjV0FmIyi9EvoR2tMdnYybxwHNMHW9vDVsRkLLYv8RVYtWbp4ghjActDeGJfwLxLcrkmyK8QPI4f2Rxd4aRa7UYOkyRexj7mwFmjZHGUAI5AmCSQyPV+XNpfEHzk13i385t1uQ0cfNtxeqrrXa1H5Y85NEy6xqnqQfWJdVAyLLw7yCi6OAQF5e8ZU8Vxu7J/K/TY/qDC+I73FexcetisPHGTpQOx68NJaBDaMLtecNN/aOHn/WNrY7TwCl56ZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199015)(478600001)(36756003)(86362001)(54906003)(5660300002)(31696002)(4326008)(66556008)(66946007)(8676002)(66476007)(38100700002)(41300700001)(316002)(26005)(8936002)(6486002)(83380400001)(2906002)(6916009)(31686004)(66899015)(6506007)(6512007)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0owdkk1eXM1TjFOUW0vTFByZllScUU0MjQ1RWkyNWpmODNRYnRrc3E5RDVX?=
 =?utf-8?B?YytJRlRaa0toQm9aVy9aWHNLUFJQbUFsYXFVSktuQWdtcTgvWGV2R0wvbURX?=
 =?utf-8?B?M2dkUmZnWTAyWjZuUDJzTmRXM0UraTlUaFM5eGRqSjM4czBUUjViQ0dRSFUz?=
 =?utf-8?B?ZWgxNEI2dXpjZ3kraHhjOEs3S29GbWx2cmprMDZCc1gwdjJJTGRjdGZ3WHdG?=
 =?utf-8?B?ODM5cm5tcmV4TWw0d3hpYTN5aWhJQVNoRk1FR0RCamM5akoyZ3pBTUwvZFBZ?=
 =?utf-8?B?ellkdlN3OFE0TFdydWtUbTRrUEpQK2pmRTZ5R3VLRkMvZW42dmRacVpKUXZl?=
 =?utf-8?B?dVd3azhpR3BNVEJPLzlsR0NxSHBIZm1IczVhekF6OG5nclJtcUoxbnpET3lp?=
 =?utf-8?B?U21QdG9yMGtreEpib2w2bG1JUHFwY3JYNTJxY00vTHcydEVoREVqY2ZEakc3?=
 =?utf-8?B?b1FUUVNlWmJCeVBPQTJ5WmJDM2VhZWFHakozaGNBakcxR2E3OFhtN1Q2ZGNO?=
 =?utf-8?B?Yk5Nd1l5elIwdmhlN0M2SGlhUnVlQkRqMFYwT0VQckdEcE45dVJjWk5QY3Ux?=
 =?utf-8?B?WjRCS0kzWmZ6dk9ncmEwQStXb1UzWkp5a01xVUdWR3Y4Q2dYMUcvYTFKclI5?=
 =?utf-8?B?bjVGZXdSQ25STnpLdENSclZHTmZESHppcUxqVmJubDc2Q2p3cDU2Q1lIenpJ?=
 =?utf-8?B?UFdyRXVJa0tNNlArcXZOTHd4dkFjV09sSWtNRFJCZ0d5YTlFQXdieS9CdDgw?=
 =?utf-8?B?VnJPMXpwZ2h5aU9wTDUvTlE0ZVhmZjVWZzRYYkFzUEE3M3VIaEUzbnk2SVF4?=
 =?utf-8?B?NnpSMis1NlZYekF6RE5MdFQxSEdhYmhRME9vYndlb3VCSmkxUGYxMGpiWXND?=
 =?utf-8?B?cDl1eEc1T213ZkVPVjNPbmVFRVpjN3l0Yk13bGlFdTFGbVM2c3k5YVRXN2Zv?=
 =?utf-8?B?RHg2N01OWUNxd2h6dDdGcHNaTmwvVTdXbWE3MUhiVmRIM3gvamdaZmt3U2lj?=
 =?utf-8?B?WDdFcWNoMlEySC9ST2U3LzJLclR1d0crVExpSDlpWUxFM3ZUTlMxYXM1bXho?=
 =?utf-8?B?VGxnSFF3VVhDOStSUmVsMXFYamZoMDBybC8xU09CbncydFN5MGxpMjV3VUlL?=
 =?utf-8?B?TVcyOHgzamsyanIzcWNMRnVIcW81NXZ4MURyWFEzS1RJbkR3dC9OemNvWGUw?=
 =?utf-8?B?N0tjYXhRU2tFMG1IR0IrU01qR3pHdUxCcnJVaW9kZGpTNWxhMm9WTE52K0NC?=
 =?utf-8?B?dTlycFBjSEh3dEMwdlZNeC82K0pta2VBZmVKYlNCVHIra1hjNjJnaEFnTm9C?=
 =?utf-8?B?ZDBkeldNVXhpUXBZbWdpZDRhcnl6VS80M1pyS1ZlR21UU3lrdVFHZVEyL0Y0?=
 =?utf-8?B?SkJ5bUI0ZkNacmhma1F2Uy9YQUZzVTJOL0xORXpha1Z0WDZkWFVla1hTQ0V6?=
 =?utf-8?B?Y0tzVlYyUkU4UGJiZkQrWnp5SDFBb2NxWXBLdUNlR2UwNnZ2bnNvRTNnYzNR?=
 =?utf-8?B?ODk5VzkxS1hOYmVNZXhGYVhDazFoaGZXeDlmb2IwWEdkWDRrRWVTeEcyQ3ZQ?=
 =?utf-8?B?V1lmMjZnRDBCTFl4cURuamVZRThpT2tYUHU0aWJuc1dHdXdSWlFBd1NjdFJ6?=
 =?utf-8?B?dU9zZms2dDhBUGx4aUNqamFSOEV1VjJMZlIva1ZXRysrdFphZ3dRK2tMdUZ3?=
 =?utf-8?B?cmRVKzM0OTljTHBMTURGWmZzK3V5bFZtUXZaZ1NSalVJc1VYMjhkUFVPb0Fm?=
 =?utf-8?B?TytTR1NmS2tiRS9hd1pPcm5kSURObUJ3NUNaZVlyUDZQSU9LdUhUMVhTd09K?=
 =?utf-8?B?dFFCQ3dMaG93NUhMU3FKL0c4cllNMkJ0MHpJNWh0cy9acm5LNmJIWnpNMVVh?=
 =?utf-8?B?NFVxVkg2R2ZGZU5Xcm9ZcHYyL3NzNG1PZ0dBR0pxd1ZtRC9zN2JBeHJpZ2c3?=
 =?utf-8?B?VGlncXFxa2xlUTNDZEZZcmxSUDk5TkNITFVJVGFyT2dzdnZxU1NDQ3F1LzYr?=
 =?utf-8?B?dVBaczlsMEl4bzYrVFUyL2dUR3c3OXlDQmZBc2VHRHF2a0xMVytnaHhmZC9v?=
 =?utf-8?B?QXNla1VObFN2STRqSFMvcjVLWUdOZ3EwaElieFhRSlZlWjVPTEVjQ09vSFh6?=
 =?utf-8?Q?27WHGR8KeH/U0QQGCA+UcojOG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde1e5e-1d07-4bc2-69fd-08daf24734f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:41:27.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81YsYPoRvEOYWZRseE3AHjHUeqUF1GH5K++BWi6muNxpn31yw4f1XSTE/Rrw8M/wv0Qy4yZ+TTkqECabKDkKAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

The hook isn't mode dependent, hence it's misplaced in struct
paging_mode. (Or alternatively I see no reason why the alloc_page() and
free_page() hooks don't also live there.) Move it to struct
paging_domain.

The hook also is used for HVM guests only, so make respective pieces
conditional upon CONFIG_HVM.

While there also add __must_check to the hook declaration, as it's
imperative that callers deal with getting back "false".

While moving the shadow implementation, introduce a "curr" local
variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Re-base over changes earlier in the series.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -237,6 +237,11 @@ struct paging_domain {
     void (*free_page)(struct domain *d, struct page_info *pg);
 
     void (*update_paging_modes)(struct vcpu *v);
+
+#ifdef CONFIG_HVM
+    /* Flush selected vCPUs TLBs.  NULL for all. */
+    bool __must_check (*flush_tlb)(const unsigned long *vcpu_bitmap);
+#endif
 };
 
 struct paging_vcpu {
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -140,7 +140,6 @@ struct paging_mode {
 #endif
     void          (*update_cr3            )(struct vcpu *v, int do_locking,
                                             bool noflush);
-    bool          (*flush_tlb             )(const unsigned long *vcpu_bitmap);
 
     unsigned int guest_levels;
 
@@ -300,6 +299,12 @@ static inline unsigned long paging_ga_to
         page_order);
 }
 
+/* Flush selected vCPUs TLBs.  NULL for all. */
+static inline bool paging_flush_tlb(const unsigned long *vcpu_bitmap)
+{
+    return current->domain->arch.paging.flush_tlb(vcpu_bitmap);
+}
+
 #endif /* CONFIG_HVM */
 
 /* Update all the things that are derived from the guest's CR3.
@@ -408,12 +413,6 @@ static always_inline unsigned int paging
     return bits;
 }
 
-/* Flush selected vCPUs TLBs.  NULL for all. */
-static inline bool paging_flush_tlb(const unsigned long *vcpu_bitmap)
-{
-    return paging_get_hostmode(current)->flush_tlb(vcpu_bitmap);
-}
-
 #endif /* XEN_PAGING_H */
 
 /*
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -445,6 +445,7 @@ static void hap_destroy_monitor_table(st
 /************************************************/
 
 static void cf_check hap_update_paging_modes(struct vcpu *v);
+static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap);
 
 void hap_domain_init(struct domain *d)
 {
@@ -458,6 +459,7 @@ void hap_domain_init(struct domain *d)
     paging_log_dirty_init(d, &hap_ops);
 
     d->arch.paging.update_paging_modes = hap_update_paging_modes;
+    d->arch.paging.flush_tlb           = flush_tlb;
 }
 
 /* return 0 for success, -errno for failure */
@@ -847,7 +849,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_real_mode,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_real_mode,
     .update_cr3             = hap_update_cr3,
-    .flush_tlb              = flush_tlb,
     .guest_levels           = 1
 };
 
@@ -857,7 +858,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_2_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_2_levels,
     .update_cr3             = hap_update_cr3,
-    .flush_tlb              = flush_tlb,
     .guest_levels           = 2
 };
 
@@ -867,7 +867,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_3_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_3_levels,
     .update_cr3             = hap_update_cr3,
-    .flush_tlb              = flush_tlb,
     .guest_levels           = 3
 };
 
@@ -877,7 +876,6 @@ static const struct paging_mode hap_pagi
     .gva_to_gfn             = hap_gva_to_gfn_4_levels,
     .p2m_ga_to_gfn          = hap_p2m_ga_to_gfn_4_levels,
     .update_cr3             = hap_update_cr3,
-    .flush_tlb              = flush_tlb,
     .guest_levels           = 4
 };
 
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -68,6 +68,7 @@ int shadow_domain_init(struct domain *d)
     d->arch.paging.shadow.oos_active = 0;
 #endif
 #ifdef CONFIG_HVM
+    d->arch.paging.flush_tlb = shadow_flush_tlb;
     d->arch.paging.shadow.pagetable_dying_op = 0;
 #endif
 
@@ -3092,66 +3093,6 @@ static void cf_check sh_clean_dirty_bitm
     paging_unlock(d);
 }
 
-
-static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
-{
-    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
-}
-
-/* Flush TLB of selected vCPUs.  NULL for all. */
-bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap)
-{
-    static DEFINE_PER_CPU(cpumask_t, flush_cpumask);
-    cpumask_t *mask = &this_cpu(flush_cpumask);
-    struct domain *d = current->domain;
-    struct vcpu *v;
-
-    /* Avoid deadlock if more than one vcpu tries this at the same time. */
-    if ( !spin_trylock(&d->hypercall_deadlock_mutex) )
-        return false;
-
-    /* Pause all other vcpus. */
-    for_each_vcpu ( d, v )
-        if ( v != current && flush_vcpu(v, vcpu_bitmap) )
-            vcpu_pause_nosync(v);
-
-    /* Now that all VCPUs are signalled to deschedule, we wait... */
-    for_each_vcpu ( d, v )
-        if ( v != current && flush_vcpu(v, vcpu_bitmap) )
-            while ( !vcpu_runnable(v) && v->is_running )
-                cpu_relax();
-
-    /* All other vcpus are paused, safe to unlock now. */
-    spin_unlock(&d->hypercall_deadlock_mutex);
-
-    cpumask_clear(mask);
-
-    /* Flush paging-mode soft state (e.g., va->gfn cache; PAE PDPE cache). */
-    for_each_vcpu ( d, v )
-    {
-        unsigned int cpu;
-
-        if ( !flush_vcpu(v, vcpu_bitmap) )
-            continue;
-
-        paging_update_cr3(v, false);
-
-        cpu = read_atomic(&v->dirty_cpu);
-        if ( is_vcpu_dirty_cpu(cpu) )
-            __cpumask_set_cpu(cpu, mask);
-    }
-
-    /* Flush TLBs on all CPUs with dirty vcpu state. */
-    guest_flush_tlb_mask(d, mask);
-
-    /* Done. */
-    for_each_vcpu ( d, v )
-        if ( v != current && flush_vcpu(v, vcpu_bitmap) )
-            vcpu_unpause(v);
-
-    return true;
-}
-
 /**************************************************************************/
 /* Shadow-control XEN_DOMCTL dispatcher */
 
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -719,6 +719,66 @@ static void sh_emulate_unmap_dest(struct
     atomic_inc(&v->domain->arch.paging.shadow.gtable_dirty_version);
 }
 
+static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
+{
+    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
+}
+
+/* Flush TLB of selected vCPUs.  NULL for all. */
+bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap)
+{
+    static DEFINE_PER_CPU(cpumask_t, flush_cpumask);
+    cpumask_t *mask = &this_cpu(flush_cpumask);
+    const struct vcpu *curr = current;
+    struct domain *d = curr->domain;
+    struct vcpu *v;
+
+    /* Avoid deadlock if more than one vcpu tries this at the same time. */
+    if ( !spin_trylock(&d->hypercall_deadlock_mutex) )
+        return false;
+
+    /* Pause all other vcpus. */
+    for_each_vcpu ( d, v )
+        if ( v != curr && flush_vcpu(v, vcpu_bitmap) )
+            vcpu_pause_nosync(v);
+
+    /* Now that all VCPUs are signalled to deschedule, we wait... */
+    for_each_vcpu ( d, v )
+        if ( v != curr && flush_vcpu(v, vcpu_bitmap) )
+            while ( !vcpu_runnable(v) && v->is_running )
+                cpu_relax();
+
+    /* All other vcpus are paused, safe to unlock now. */
+    spin_unlock(&d->hypercall_deadlock_mutex);
+
+    cpumask_clear(mask);
+
+    /* Flush paging-mode soft state (e.g., va->gfn cache; PAE PDPE cache). */
+    for_each_vcpu ( d, v )
+    {
+        unsigned int cpu;
+
+        if ( !flush_vcpu(v, vcpu_bitmap) )
+            continue;
+
+        paging_update_cr3(v, false);
+
+        cpu = read_atomic(&v->dirty_cpu);
+        if ( is_vcpu_dirty_cpu(cpu) )
+            __cpumask_set_cpu(cpu, mask);
+    }
+
+    /* Flush TLBs on all CPUs with dirty vcpu state. */
+    guest_flush_tlb_mask(d, mask);
+
+    /* Done. */
+    for_each_vcpu ( d, v )
+        if ( v != curr && flush_vcpu(v, vcpu_bitmap) )
+            vcpu_unpause(v);
+
+    return true;
+}
+
 mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
 {
     struct domain *d = v->domain;
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4203,7 +4203,6 @@ const struct paging_mode sh_paging_mode
     .gva_to_gfn                    = sh_gva_to_gfn,
 #endif
     .update_cr3                    = sh_update_cr3,
-    .flush_tlb                     = shadow_flush_tlb,
     .guest_levels                  = GUEST_PAGING_LEVELS,
     .shadow.detach_old_tables      = sh_detach_old_tables,
 #ifdef CONFIG_PV


