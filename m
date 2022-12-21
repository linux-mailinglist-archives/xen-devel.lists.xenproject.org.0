Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9366531B2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467897.726958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z7K-00051E-PZ; Wed, 21 Dec 2022 13:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467897.726958; Wed, 21 Dec 2022 13:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z7K-0004ye-Mq; Wed, 21 Dec 2022 13:26:42 +0000
Received: by outflank-mailman (input) for mailman id 467897;
 Wed, 21 Dec 2022 13:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z7I-0004I8-Pw
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:26:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19bfbfdf-8133-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 14:26:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:26:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:26:35 +0000
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
X-Inumbo-ID: 19bfbfdf-8133-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqUoZ67qtEQOON11Ly4g4gWSBcXDwioQWHBlLtsSaZAQ3SGW3U+PzfMdTyVpbsRYfKyDdLCsEwOj8dEcuHV6gatjPxw851XyjhUVLovOiRXNT4uLpCK0YZNhPbj14+3J+PdMgTkrmEsO0XyQzoGzjQBZCtISNYmMKB8ewAQM7kUxxQVUknY9G/TgrcpHc3dp4l0//l52UHJ9SRvduw/k+LWdl7pSU9OpbK/sIGzAEj6wEboPIqIxDDp7IkQ0B1eF1LqzMdTCVbZZmSosdmOqepoSGOadH8tEGBDyj/Ykm4OTP/7fb1VUiEcUrRHsNNdXd9hJY3/zzernfzmgMlqK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r07Xy42pMGGEVQDplutw+NfWm8QrmcB72FHciyULsR0=;
 b=gPltjaS1/SHfHAcoXV7SgxGLRGislKlp31HVKYoJtADDMJznspPNa5akUuoF6TK3D/y2DvTMJwL/wHVsYQmTblKi6eDvJrCSZ0Rj4dEjLPeabaOYCXPa6xuXV9S8RWdmjWQW4NGjNJFIh4tmdLkoyrII+X2jnuDRwito3NO4WCYR5MfW96I0KqZz8mgGsX6F+HQ+K2BeJNnovAEGK5s+Deq/sov/xfcO5UnFS13u2urbLIPkaUJ/wcrsoghumC0Fs4Xrtu5CJW6g7JKehKsOEyHcwtUvOogmr7NHCiEKOJXHYvguc0pwot2zK0Oo1o55T52GMXTYYlxKaEO41mRN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r07Xy42pMGGEVQDplutw+NfWm8QrmcB72FHciyULsR0=;
 b=mgQAh+eHNV09xflz6SG+P1eaGCBTtujN7xSKVYKTVuqTgfU6Z0wsi/4DqGgYLmq8aUn/OmXOS9tGoUhZoPoA2QFNHM8Z4Jk0/JJqC/DTkvb0McuNBgGPofeVJ6ESyUY+C3xyV7RpZPqihjy0TA1MvM80FtJHC0boxiD9+rpNLnesYl+jbT4x/Q3FDl7CWSQcNJCe9BREv37tKxz93I7ZQhIhb/hr4YNQWakPAOxvZmoEQrdLceHGjS0YLdHjtNhgesAOis3GIUAwpOKE+TR013M2hSGojAs/aUpcqp/Kqk2VgqXYlI1O8G3NlvggAK2qrbR2orb2Dn/IgjER+0hWtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <584a986e-08ea-d064-9447-ed23c6e39721@suse.com>
Date: Wed, 21 Dec 2022 14:26:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 4/8] x86/paging: move and conditionalize flush_tlb() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: f49f167a-0c38-4e81-9cd2-08dae356fbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LN79KCfHRqYQKkt34XcYtPV2dokir+tnsskLmurLicJyN8H4Hh0xQyOx1gN16D5rAjIXEL94P29+4MBaoiTYt/kGXtdHRaY+7nk9MfMbL5e+G8Wlle/2sLdWlz43ZVzPM60emVC310t2XcxPL9BqVMbMFdHp+9BwR8SzNO0OQONtBuhUMSL6AOqpy74rwkadxuG6ToylihJMWqjXODystPnxE+Lcr3PI1io8UeNNEE9vBuXH84CwwVYRMxhE6i0veNt5gz+4blRyUL1XR8cX8Orb0BC+xmtla/RO+mQvjY6aWJUGz8iInxxKWZVzqf/oJMQh1RtrYA5VUekQPVmr0CkzXop3LRBdui3p8fspRnAd6NQ7+HEzuVtW8lOUoSH0NPrue2ll/TWjuiV10sC9wgpr3WScPCbG+JMTCWRk2SK+b9DGGLtYIO00eWNsD+chHRGcvl687nMuxFwqcaC0QuCllpHtpvtm7Ptc/ueaiNGu6jVXF1tbgP1o6+Qwkplvu1Qv2hSUHDafWkt86vxqmBECiZah7Qt+C0gi0Zw+MsoIS76ybVzwDTjJQP+Hx+P+KguFf6SXjPmaX1koBzNF+d3F1HQlZrQhuEQEM0FX7l+UluQ0eIoLGEIiOaZGbe2v3cvl72ySys037PJy05J4MEkLm1ZB8+rt0drxdbLrjHGv+0+qcDADfyFN/vYagPLqqu6veDWz3G5r11pL87KeCW6x4J8lcGltW+33bNtt6dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(83380400001)(86362001)(31696002)(2616005)(38100700002)(36756003)(478600001)(26005)(186003)(6506007)(6486002)(6512007)(66946007)(66476007)(5660300002)(8676002)(4326008)(66899015)(316002)(6916009)(31686004)(8936002)(66556008)(41300700001)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z01sWTZPL0dWMlIrZFl0a3h3TmdVbytEL0NvSy84OWhwczMvZmNBaWhnN2ZP?=
 =?utf-8?B?c3RMczQzU3ZrUDZ6OW9jRnp4cmQyV0x3Z3BOSDVYWlJETWNQTjFMVG96L1g3?=
 =?utf-8?B?NXlHWHFublNiRFFwdFgvc2t5dGhUZG44NHJRNmlENmdUWjNYVDJqY2NYMlBq?=
 =?utf-8?B?cUw4eXdOREdrb2dGOVJLdVZGMHBNeHIwZ2orWmtGMHpCU3h5cVFvckQ5ZWg4?=
 =?utf-8?B?cmdMTDZJVG1uWUZNcS9mVnZGWnBZam1nVkR3V0JaaUVOb2gycVNSdGIrRWM1?=
 =?utf-8?B?MnMwOXl0dG5nMW9jZk9RTWpaK1ltU2hFR1gyc2V0bzVNcDg1MzdQOWdRdWE2?=
 =?utf-8?B?K2xDNURoTS9XOUsvQ1RqYTludXVJQWVSTjhhRUFqZUFkZHQzekEzVFFnT2JH?=
 =?utf-8?B?LzZSYkhkNkc5OWhNa2dSb2MrbmYxOVE0b0tMQXJoNU83UEpmR0plN0ZJRXNO?=
 =?utf-8?B?L0hDbWY0ZmZEQzN3Ky9lZlBDcjh2ZStKNUhkM2N4KzdzY3FGQnhmeEtBUjZJ?=
 =?utf-8?B?cGZDOU94Z0RnUVZHQXhyRlRwa20vckJITWt3M0huU3VZd2t5aDluQWNTZkov?=
 =?utf-8?B?WEF5WmZLMFlJenZJcCtHLzNnNjA2cGE4cFFuVzh1YVhhdnZSV2t1K2ZjSU1D?=
 =?utf-8?B?ZnF2LzdFUmczZHJsRUswdkoxa2FmSC9oY3c5dWswVCtZUlhQUGtWaVhaaGZ4?=
 =?utf-8?B?dTE2QVg1WTBzaHBZSVhBMjZnNnNuRHdvUE9pNWh0QUgrenJlZ0ovV0owcHp0?=
 =?utf-8?B?YTVnbGYvYm9SM2hRRVlSOUdmMndGcXhibjllY09xRGRjSHh6R045dlM4c2s0?=
 =?utf-8?B?SUFISDdGSlU0enpzQmdROXNhRStWYmZab1N1UlhibGFzeC9DbEdqTWVHUkZw?=
 =?utf-8?B?SVVIN2dVSldTb1JCeVJhc1Z4czV1TWFWaFRoQkFxMjZYQmZySWxQeGUrelZz?=
 =?utf-8?B?dTJtN0VGcGpRMDRFSENVRkY2ZTVMWTh2cE5abjNiU3J0bTJIS0JqaXJvTENz?=
 =?utf-8?B?TDUrRjNzUnArbDNCR3lnSzU0V2M5aXdwa1dRcDF1UUt0N2NxdzZ6ZkNUVjFG?=
 =?utf-8?B?QlpXZ2YyWCt6c0dNSzlHR0QvOXY4ZVNwRVNLM2Yzd1pOV2VQY3AzaVNtOWlu?=
 =?utf-8?B?UWVBd0s2MFRFMUROaVY0ajMzbVA3Z253S3dpbDA2MEhMQnR3ZUtqdUY5V1gv?=
 =?utf-8?B?a1MwMzdvcDQ3aVhTd25tUUNhMExlUHl0a3g4Rmx2WXFKbHk3bzhvUERXOVIw?=
 =?utf-8?B?V1pvMllaaUErVU9hOGlTcUtJOHhQaXF2Y3hDbWZ2RzQzZVZpMXFvMHZacTJm?=
 =?utf-8?B?WlV1Y2ZlK0tmV2JlTGFQQXEzRlBYVmp0K0czaWtyMFU0bjRyK0lCTDFnNzlJ?=
 =?utf-8?B?a0h4djhmRmVsQnZ4UmczUVNqWkdrcUgxaElYQ2VwWWlUVytSalpLRk1XUjhO?=
 =?utf-8?B?UmEwZGk2VXpjWlFmOHVLdmJwaHl5MXJjMmdqOUFIZnBKOWlmWlVBNHl5ZTN2?=
 =?utf-8?B?ajRoUml1cytXMW5sMG12aW5ybWtGZk9NU0pERjRpY0VxdDArdE9JZXJ5QkhY?=
 =?utf-8?B?QjB2djRGMW05SllqVEpoM0Zia2dTRmJYRHJTQzNzT0RQQTZrOFJ2a1RYazAy?=
 =?utf-8?B?cFpJeXVEeEJCTERGMzVoS2ZwdkRYWkF6eHNoZ3g1YkRsMGFURXplNEpDb0JS?=
 =?utf-8?B?NXJXbTBuaTNVTHlxcUZ2Mzk4aXFpMEVNZG5oeHA2enhrNmYxd1U3MEhjbWZk?=
 =?utf-8?B?TysxSzhyQmpGcGFHSEhkSUlmTHVWWlBqZk0xeGdMMGFHMXp1R1NHMHErSHlo?=
 =?utf-8?B?elJlK0kxRHU2alB4dXByQ21WSHBaRGZ2MFRvR3NRYWxHK3BLR0ZOSHVxOHBR?=
 =?utf-8?B?SGc5RzI4QzRmWVlXSS82aFFXdExiU1ZOWVVyVldXdEQzd0tPeXcwVHFOZ1BH?=
 =?utf-8?B?YXRrUjVuOEFOWFNQeVZGZkNvWEZ0RVp6MWNnelFrdTN3aXhjeE04RzVIV25Q?=
 =?utf-8?B?RGQrSUh2eWF2Z00ySW9kWmlKU2hLa2lSNlV2UTRTazV5Q0VndHE0a0ZtSld6?=
 =?utf-8?B?RXEvekpMN1BxWWVYVlJGKzMzaEdlZEEzMUJPemxRNkxyL1prRnUxWVk4OU1M?=
 =?utf-8?Q?3j4MuTxNetE1AvTJXPCVwMCx8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49f167a-0c38-4e81-9cd2-08dae356fbbe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:26:35.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ssBx8hmaHvfkmcAHSUOFJZ+9jZGGTDA5Z9tLxG866td7caX28oDoWlmv1WC7bAGKHSwzGioBSVGMeJRs4qnIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

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

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -237,6 +237,11 @@ struct paging_domain {
     void (*free_page)(struct domain *d, struct page_info *pg);
 
     void (*update_paging_mode)(struct vcpu *v);
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
 
 static void cf_check hap_update_paging_mode(struct vcpu *v);
+static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap);
 
 void hap_domain_init(struct domain *d)
 {
@@ -458,6 +459,7 @@ void hap_domain_init(struct domain *d)
     paging_log_dirty_init(d, &hap_ops);
 
     d->arch.paging.update_paging_mode = hap_update_paging_mode;
+    d->arch.paging.flush_tlb          = flush_tlb;
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
 
@@ -3134,66 +3135,6 @@ static void cf_check sh_clean_dirty_bitm
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
@@ -688,6 +688,66 @@ static void sh_emulate_unmap_dest(struct
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
@@ -4198,7 +4198,6 @@ const struct paging_mode sh_paging_mode
     .gva_to_gfn                    = sh_gva_to_gfn,
 #endif
     .update_cr3                    = sh_update_cr3,
-    .flush_tlb                     = shadow_flush_tlb,
     .guest_levels                  = GUEST_PAGING_LEVELS,
     .shadow.detach_old_tables      = sh_detach_old_tables,
 #ifdef CONFIG_PV


