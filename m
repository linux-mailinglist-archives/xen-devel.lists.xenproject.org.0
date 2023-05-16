Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B070469F
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534987.832527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypHS-0006H0-MO; Tue, 16 May 2023 07:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534987.832527; Tue, 16 May 2023 07:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypHS-0006En-JK; Tue, 16 May 2023 07:39:34 +0000
Received: by outflank-mailman (input) for mailman id 534987;
 Tue, 16 May 2023 07:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypHR-0004Mf-7H
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:39:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb7542dc-f3bc-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:39:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:39:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:39:29 +0000
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
X-Inumbo-ID: cb7542dc-f3bc-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDPVE/Z4asX9ZXnmIE/WOq0THHrkc0SjH2nA8mdYdrj6wbENfEcl0FyPveJ0rCpeTVfkibpzeyYUuXVHgSc0lvxzcd0Eb/07E3q0tkeaM6XJ8oXFB2UbMhjloDSglcyT1XkivHSSQwawzHnMmswXlnJlXp4/Ze79M5VgqcHxe/obJMSUtNOwjBeKCcZ0gOnSkLC03HQTEzXFPNHmuOsF2hmLE9WIzcCvUYY/+y6DYqT8I4A/C2OyOOUYRAk2HgVUKLR7OtWzy67zHoEw7XWOGlY8LOsGxJV8rH7VWF8D80jx/REnN2UVhJa36Eq6vuRIb1U2F7zshLYbhN9WWEW7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2eGJ4bTNYS/eWskMfePPdrR28QdCcEy7mZkgRqWnNI=;
 b=CGAobNkzyOE6UyjvFVimFYkCt+Fc3XJO3sYS4N/a0oHn5SXeBnm9HpLKf3//Kzzr9hiV64QgNpmGUkVBYh4y4oA5quJ5RpDJi+q12+h9EVFxWjqJLNvMBhrliF7uMDmOAqP4fhxLvy1FA6hz+JujcC1XpDk579TNWASlVrfhVfRAIKSx7nwF36zLGib6QjGJExEaCLhhvRDQhTV4k3HtWqv771nXr7XGHeZUm8XUtIJll9YpCygg5nYC306pN9v6vDkpjzUv0iBY+mgxzTvnv1mlNB4lhxhGXvKk797sz2zh8G0imkGZYxy+1WfknaMunPXZnGmUgoCC6dh/TvYHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2eGJ4bTNYS/eWskMfePPdrR28QdCcEy7mZkgRqWnNI=;
 b=fVAeEWi2ZYMtKMQi4kRrmDiWFYPSGG9j1shKVTelxLkELt+sV61k6+ygH/jBhc64jcPkjImEtNHXAGJnATJg1UYPeODuzxlFLDvogZDQQ/qXMq9Eka5ls73mZ1Au31DxKcQqKg1Bxuz6aOyZQvMFA1fByTk5zpNRDj4z7fOn+NVvLyP/rBkFcUfCcy6FV1wn+XuEBX1sZy7ARgHOEj6he4XcsQQOESqiaTxP9AEvf/+CzJ61Jioj8jZ4oLphPUKh3V1tRLJ9PYBEQDNoHocPYe3x6I1pkiyva94YFH2pP9c08FBJXbItYKR1gHJCDs6V1aQj0iEmXxd28sQXU/vOpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7684392b-82b4-a7cb-35dc-a5de8142eea2@suse.com>
Date: Tue, 16 May 2023 09:39:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 04/12] x86/shadow: use lighter weight mode checks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e2b02d-7925-46a0-142b-08db55e0ae94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ZkAHOcAlLgOWO9jz9nPPQVVtUDaAm5QZpjWazjYap8tJASDEghQbAAzXG0gqq02FVeD5f0VvNEIB2LUuUcUKC5QJUScz6omr4IKvXUa6T4cZyQDdBGVacsz6ZGtIjHJ8uWeUw5+VaMmDBI9Ne9hvUKdS+K6ddUfF+sEPfcvsiO+WMaUi4hxXnZb7QMqSZajEt/fbC/fISR6vKGEVkWsjdJYxRDaDAJDrxItAQlO1TaHD9/mUPJYTVydB0J88XAn7SWGrZWY0uCw+0pOmJTDH5RI/Mu7PxPTdFow19kJTLbEXyZiZjPQt/ttT4rSSjqyHVFEs5t2WJQidOnPlgjiQh0wRJGRcpbElaZ13Rq2pzux/mpacGosE9yxsIune+FVPxGdphTtT3hOnCxoyGPrTNnj/54OVvgOnRlHjeKAqxixhqzGxyP/bTNxs1bKlVCT4EtkTuaBBzk9dh9Az5W5AHdO5kofW4BLpz8AFeH1/JW9CLHxSCkCUZYpmZtu1LHkDp4MGpdubTMzMPx6cA1ac8rtboytHXsPoE7W/UhFBld044/VZqIDwfsjPtxctxixFVM49GPe5xD7RPq0e6BP9EeAvbrgbwA+lXPRkgOjjMp9PZ2Vbtd3ThzzdACbrBrqpM+Hw166v0j/TElyD+Des6uqWUi+lSiUdbmOIEtJX1T8Y77bjmQ62uaAZB7McEW3Vnb/ADzwb2nAiENq6k09e0hbpxhuzV4C3noBjektlC0AzqbWQuQrh9/mAT5GQkXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(66556008)(66476007)(66899021)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(16393002)(45980500001)(43740500002)(473944003)(414714003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjYzK3crWlpsTVV5Z3gxR3MvaHZvL1MxZjM4MnZ1UGZPMlBEbXdMTFRCSi9m?=
 =?utf-8?B?eTd1alZ0MzI0Q0hvamVKNnBNRmsyTDBCa0NRUyszQUtPaS9aVk02WG9kQ0Vs?=
 =?utf-8?B?RCtTazhLL2RCSFFjNFFBZEFCTUdndit6aTJHZDQ1aDBaaE56SDFZWHNEK0Zl?=
 =?utf-8?B?QUZUTFRlbzhnZ2NjeGdkZkN3TDlsNVo2SEZ5TW1vT0pMTE1yeU9hWk1LMEZi?=
 =?utf-8?B?V3B1b1ZRTk9ld0JITGJ3Q0w3N3RwQUt4SjQ3aDBGOWpmbks2bXdVTFBUc1pR?=
 =?utf-8?B?d1lleUk5TS91bGFSWkl6c1d5cGI3V0IzS0dzL09vcElFd3pQVFJPa09GZ0FZ?=
 =?utf-8?B?Z2dHcW9PeHViTjFRbWgrUDBha0IyamNiSTBOZXlxOHRlWjByWmpVVkVhRTdx?=
 =?utf-8?B?djNPV2ZlYzRxVVpIQ1ZZdmpFaTlmRGd3Si9FVjZVWXV2VVdNblE5TkE4Q3ZV?=
 =?utf-8?B?VE45RWlBNGhxbEJRS0RoWTRQbVlPcFJDY0txSHd5bE1FYkdjenRlRWsrVGxr?=
 =?utf-8?B?eXp1UjE4cXVJSndVZlNFNFRIaVh5UUtQRENOSGgzQ0t3dmNtRGtBTEhDNFJr?=
 =?utf-8?B?QWZWZnYzbXBxQVQ4dzFLSkJNRnhaSVVnQ0N6eUN6RzJCcXVYUXFWWEpYU3Zs?=
 =?utf-8?B?ZEp5QUVwcVFRdlhNUDVwdnBaM2R6dzEvQWlEY0ZQbWJ3OTk0NFkxREhmMFJ1?=
 =?utf-8?B?QWhmSWdLUldyT293VlU2WDhPV2lkL2lhaU1pQmt5aEU2YnM4SEZVb1o1bUc3?=
 =?utf-8?B?VkhTQVRoVFFNYWNabnJwUmVRMytoNnJ5Qk9vc1lScDZZUXdBdnc5RjlOWTV1?=
 =?utf-8?B?NmU4Qi84ZjZsOWR5b0EvUHlVd0UwSVlwK3Z2N0tlTzBNQUxONE96cjl6djdx?=
 =?utf-8?B?NkdCNXpDYy9KNVBCaUtZcTIyY0N4QnlUQ2NieU9VSUFQY0s0aHVQZzZzK1ll?=
 =?utf-8?B?dzVQSnA3YnprUklsVHhSNjFZN3BpbWNCeUtVOUwyRk9tS2xDbE8yU01XM0dx?=
 =?utf-8?B?KzN5d3hlem40elVBQ2MraWVCejB2aUdNdEI4cUgrS1VVcUQyc081aTZnZUIw?=
 =?utf-8?B?OFVYMDlsZm1uRHB0MlJWQjh3RkpMVDV3dWNMajlBd3ZLd0JCL1JrMG12VTI5?=
 =?utf-8?B?VDlZekpuTStBYndLVzM3OFNCeG1MYVFzaWtlb2NOWXRkWGZRdFBhWUlKMVdZ?=
 =?utf-8?B?MXNNUzZRN3A0OTNhVmJMQkg1RXRLQzdvajBobmF2dUNETUdycjQxVEpjcmZz?=
 =?utf-8?B?aDI2WE1BclNnckJxOXcvWWJ1TUllcGcyMTRmbGh1TkMyQXhabGVxNHVrUHFP?=
 =?utf-8?B?UlROTEZoVlB5Rm5uU1VDMzVQUG1SOENTck5XQ3ZnY1pGYUZsNVJYUFcvMXgv?=
 =?utf-8?B?S2YyUWwvMWErUmtZNCtQRjB4NUtiZUhsUlpaZTRNMlZWcDVBWk1jb1grVk40?=
 =?utf-8?B?RWliUG9jM3NtSzh4dGxLdjd2a0NGM1BVSUQzQXRTYm5hK2NjVVB2SGlZWG1N?=
 =?utf-8?B?a1pTaFJ4Wm9kUGdYeWloQkxINzRVamFUTTYrd0FMRmR6Yk5CUytqcGUxMDEw?=
 =?utf-8?B?aTBZN1kyUHA3ZnBrcjk4bWUzZEFpUEcyRzR6YjRTRHdxM1k1LzI5RlYxWGln?=
 =?utf-8?B?V210aklQd3d5bURaYjcyVlduV2VrbjZXYzlCV2k3ODk3K3Y4Y0duWkxBSk5L?=
 =?utf-8?B?VC9oeDVGMEs2ejExMVFPS2hFUlVvV1FJL0NVelJpT1FCWjVqcExNU005OU9o?=
 =?utf-8?B?U01CQzRNaWdtc0dNMlI3RTEzKzI2TXVUb3hUUk5pdHVYVlEvRzR5ZmFKZEJy?=
 =?utf-8?B?cEIzaEF2N05QTXR4UndLVUo4b2RvcW92N1RzUUhrYjgrUmhjNzFQa3RJS0kw?=
 =?utf-8?B?TGwzMWdrVHhvMzFhelFGZmw1ZEhibWtIR0lkM2JPS0hPMXBwUjdEaEZGcHlk?=
 =?utf-8?B?RFBOOGpHNXdZZlRTdnRqbG1XMCtMTUVjU0FROS95TXNQZkpFZ0FoenJ6RFpT?=
 =?utf-8?B?NkpORnQzRG5ldHFDRXVqZkFvWFNNT0xOSllOL1dZZElDM2g5eEhraE9DL3pX?=
 =?utf-8?B?bHRVb09Gb05WQVF6bmp6WlRIdlNHZjI4K1hFRGVoaGprMHpWZ25lbnF4VkRv?=
 =?utf-8?Q?4q/zJl0uQwHiiaYxwxppVLyCv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e2b02d-7925-46a0-142b-08db55e0ae94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:39:29.4364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcBQmd/3vec2PpS/PRcPgnxoYJhCzSaX2dEQ+ESbZr/VNrRWVJbA40HdTD6k21VI53UG5w8blx0BjmPJqiKmpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

shadow_mode_...(), with the exception of shadow_mode_enabled(), are
shorthands for shadow_mode_enabled() && paging_mode_...(). While
potentially useful outside of shadow-internal functions, when we already
know that we're dealing with a domain in shadow mode, the "paging"
checks are sufficient and cheaper. While the "shadow" ones commonly
translate to a MOV/AND/CMP/Jcc sequence, the "paging" ones typically
resolve to just TEST+Jcc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over new earlier patch.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1843,7 +1843,7 @@ int sh_remove_write_access(struct domain
      * In guest refcounting, we trust Xen to already be restricting
      * all the writes to the guest page tables, so we do not need to
      * do more. */
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         return 0;
 
     /* Early exit if it's already a pagetable, or otherwise not writeable */
@@ -2075,7 +2075,7 @@ int sh_remove_all_mappings(struct domain
          *   guest pages with an extra reference taken by
          *   prepare_ring_for_helper().
          */
-        if ( !(shadow_mode_external(d)
+        if ( !(paging_mode_external(d)
                && (page->count_info & PGC_count_mask) <= 3
                && ((page->u.inuse.type_info & PGT_count_mask)
                    == (is_special_page(page) ||
@@ -2372,8 +2372,8 @@ static void sh_update_paging_modes(struc
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
-        ASSERT(shadow_mode_translate(d));
-        ASSERT(shadow_mode_external(d));
+        ASSERT(paging_mode_translate(d));
+        ASSERT(paging_mode_external(d));
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
         /* Need to resync all our pages now, because if a page goes out
@@ -2760,7 +2760,7 @@ void shadow_vcpu_teardown(struct vcpu *v
 
     sh_detach_old_tables(v);
 #ifdef CONFIG_HVM
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -514,7 +514,7 @@ _sh_propagate(struct vcpu *v,
                || (level == 1
                    && page_get_owner(mfn_to_page(target_mfn)) == dom_io);
     if ( mmio_mfn
-         && !(level == 1 && (!shadow_mode_refcounts(d)
+         && !(level == 1 && (!paging_mode_refcounts(d)
                              || p2mt == p2m_mmio_direct)) )
     {
         ASSERT((ft == ft_prefetch));
@@ -531,7 +531,7 @@ _sh_propagate(struct vcpu *v,
                        _PAGE_RW | _PAGE_PRESENT);
     if ( guest_nx_enabled(v) )
         pass_thru_flags |= _PAGE_NX_BIT;
-    if ( level == 1 && !shadow_mode_refcounts(d) && mmio_mfn )
+    if ( level == 1 && !paging_mode_refcounts(d) && mmio_mfn )
         pass_thru_flags |= PAGE_CACHE_ATTRS;
     sflags = gflags & pass_thru_flags;
 
@@ -651,7 +651,7 @@ _sh_propagate(struct vcpu *v,
      * (We handle log-dirty entirely inside the shadow code, without using the
      * p2m_ram_logdirty p2m type: only HAP uses that.)
      */
-    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) && !mmio_mfn )
+    if ( level == 1 && unlikely(paging_mode_log_dirty(d)) && !mmio_mfn )
     {
         if ( ft & FETCH_TYPE_WRITE )
             paging_mark_dirty(d, target_mfn);
@@ -807,7 +807,7 @@ do {
 #define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)    \
 do {                                                                      \
     int _i, _j;                                                           \
-    ASSERT(shadow_mode_external(_dom));                                   \
+    ASSERT(paging_mode_external(_dom));                                   \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_32_shadow);      \
     for ( _j = 0; _j < 4; _j++ )                                          \
     {                                                                     \
@@ -833,7 +833,7 @@ do {
 do {                                                                       \
     int _i;                                                                \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                        \
-    ASSERT(shadow_mode_external(_dom));                                    \
+    ASSERT(paging_mode_external(_dom));                                    \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_pae_shadow);      \
     for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                 \
     {                                                                      \
@@ -854,7 +854,7 @@ do {
     unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
     ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
-    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external */ &&    \
+    if ( is_pv_32bit_domain(_dom) /* implies !paging_mode_external */ &&    \
          mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
         _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
     for ( _i = 0; _i < _end; ++_i )                                         \
@@ -896,7 +896,7 @@ do {
 #define FOREACH_PRESENT_L4E(_sl4mfn, _sl4e, _gl4p, _done, _dom, _code)  \
 do {                                                                    \
     shadow_l4e_t *_sp = map_domain_page((_sl4mfn));                     \
-    int _xen = !shadow_mode_external(_dom);                             \
+    int _xen = !paging_mode_external(_dom);                             \
     int _i;                                                             \
     ASSERT(mfn_to_page(_sl4mfn)->u.sh.type == SH_type_l4_64_shadow);\
     for ( _i = 0; _i < SHADOW_L4_PAGETABLE_ENTRIES; _i++ )              \
@@ -965,7 +965,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
 #endif
 
     // Create the Xen mappings...
-    if ( !shadow_mode_external(d) )
+    if ( !paging_mode_external(d) )
     {
         switch (shadow_type)
         {
@@ -1367,7 +1367,7 @@ void sh_destroy_l1_shadow(struct domain
         shadow_demote(d, gmfn, t);
     }
 
-    if ( shadow_mode_refcounts(d) )
+    if ( paging_mode_refcounts(d) )
     {
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
@@ -1464,7 +1464,7 @@ static int cf_check validate_gl4e(
     l4e_propagate_from_guest(v, new_gl4e, sl3mfn, &new_sl4e, ft_prefetch);
 
     // check for updates to xen reserved slots
-    if ( !shadow_mode_external(d) )
+    if ( !paging_mode_external(d) )
     {
         int shadow_index = (((unsigned long)sl4p & ~PAGE_MASK) /
                             sizeof(shadow_l4e_t));
@@ -2387,7 +2387,7 @@ static int cf_check sh_page_fault(
     gfn = guest_walk_to_gfn(&gw);
     gmfn = get_gfn(d, gfn, &p2mt);
 
-    if ( shadow_mode_refcounts(d) &&
+    if ( paging_mode_refcounts(d) &&
          ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
           (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
     {
@@ -2611,7 +2611,7 @@ static int cf_check sh_page_fault(
     return EXCRET_fault_fixed;
 
  emulate:
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         goto not_a_shadow_fault;
 
 #ifdef CONFIG_HVM
@@ -3055,7 +3055,7 @@ sh_update_linear_entries(struct vcpu *v)
      */
 
     /* Don't try to update the monitor table if it doesn't exist */
-    if ( !shadow_mode_external(d) ||
+    if ( !paging_mode_external(d) ||
          pagetable_get_pfn(v->arch.hvm.monitor_table) == 0 )
         return;
 
@@ -3204,7 +3204,7 @@ static void cf_check sh_update_cr3(struc
     /* Double-check that the HVM code has sent us a sane guest_table */
     if ( is_hvm_domain(d) )
     {
-        ASSERT(shadow_mode_external(d));
+        ASSERT(paging_mode_external(d));
         if ( hvm_paging_enabled(v) )
             ASSERT(pagetable_get_pfn(v->arch.guest_table));
         else
@@ -3229,7 +3229,7 @@ static void cf_check sh_update_cr3(struc
      * table.  We cache the current state of that table and shadow that,
      * until the next CR3 write makes us refresh our cache.
      */
-    ASSERT(shadow_mode_external(d));
+    ASSERT(paging_mode_external(d));
 
     /*
      * Find where in the page the l3 table is, but ignore the low 2 bits of
@@ -3260,7 +3260,7 @@ static void cf_check sh_update_cr3(struc
         ASSERT(d->is_dying || d->is_shutting_down);
         return;
     }
-    if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
+    if ( !paging_mode_external(d) && !is_pv_32bit_domain(d) )
     {
         mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
 
@@ -3354,7 +3354,7 @@ static void cf_check sh_update_cr3(struc
     ///
     /// v->arch.cr3
     ///
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         make_cr3(v, pagetable_get_mfn(v->arch.hvm.monitor_table));
     }
@@ -3371,7 +3371,7 @@ static void cf_check sh_update_cr3(struc
     ///
     /// v->arch.hvm.hw_cr[3]
     ///
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         ASSERT(is_hvm_domain(d));
 #if SHADOW_PAGING_LEVELS == 3
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -407,7 +407,7 @@ static inline int sh_remove_write_access
                                          unsigned int level,
                                          unsigned long fault_addr)
 {
-    ASSERT(!shadow_mode_refcounts(d));
+    ASSERT(!paging_mode_refcounts(d));
     return 0;
 }
 #endif
@@ -520,8 +520,8 @@ sh_mfn_is_a_page_table(mfn_t gmfn)
         return 0;
 
     owner = page_get_owner(page);
-    if ( owner && shadow_mode_refcounts(owner)
-         && (page->count_info & PGC_shadowed_pt) )
+    if ( owner && paging_mode_refcounts(owner) &&
+         (page->count_info & PGC_shadowed_pt) )
         return 1;
 
     type_info = page->u.inuse.type_info & PGT_type_mask;
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -81,7 +81,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
     struct domain *owner = NULL;
 
     ASSERT(!sh_l1e_is_magic(sl1e));
-    ASSERT(shadow_mode_refcounts(d));
+    ASSERT(paging_mode_refcounts(d));
 
     if ( mfn_valid(mfn) )
     {
@@ -342,7 +342,7 @@ int shadow_set_l1e(struct domain *d, sha
          !sh_l1e_is_magic(new_sl1e) )
     {
         /* About to install a new reference */
-        if ( shadow_mode_refcounts(d) )
+        if ( paging_mode_refcounts(d) )
         {
 #define PAGE_FLIPPABLE (_PAGE_RW | _PAGE_PWT | _PAGE_PCD | _PAGE_PAT)
             int rc;
@@ -375,7 +375,7 @@ int shadow_set_l1e(struct domain *d, sha
 
     old_sl1f = shadow_l1e_get_flags(old_sl1e);
     if ( (old_sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(old_sl1e) &&
-         shadow_mode_refcounts(d) )
+         paging_mode_refcounts(d) )
     {
         /*
          * We lost a reference to an old mfn.
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -262,7 +262,7 @@ int shadow_set_l4e(struct domain *d, sha
 static void inline
 shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
 {
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         return;
 
     put_page_from_l1e(sl1e, d);


