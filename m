Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD16F5526
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529065.823040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu94S-0001Nv-0K; Wed, 03 May 2023 09:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529065.823040; Wed, 03 May 2023 09:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu94R-0001Ke-T7; Wed, 03 May 2023 09:46:47 +0000
Received: by outflank-mailman (input) for mailman id 529065;
 Wed, 03 May 2023 09:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu94P-0000NW-M8
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:46:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 698984d9-e997-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 11:46:44 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 09:46:42 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:46:42 +0000
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
X-Inumbo-ID: 698984d9-e997-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaR0A5tp8fMh/lROh/quBvvsVXHbFyPUdvPfJjuVjjyQRZZuJBQOo0LApaCs6cVHp87yH2bgp/Sa5Z9DyZIdrKe3+dmqxP47joldFirb/eG+Wy78vsTd7Nu9Xyq2qGYCz/SBsf+07yLLQIX/wjvc2AgUbUCuH8++U8X8zzzqWbKzX0i5A+jXE2XM3MZ3et/QBI7jSCguqOPA7Nxa15NfYy8LC+2DnfISTnsVnsTrHyUPucKgX/q2aFml3F9hDJieEwRnOTDbHQj2A+4ZcSl4tk3S1caj+1J9jleBLTmTaX6yuO6LFtHsgrLD9E1ZMNsoX+JrwW1MNyz45YDDGMsWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sedWtunTwKdoeXFOwuCOGYeVfeFrxIMCs6hPZD4OxMU=;
 b=N1pcB5tDRlN0LlN57NvJ5aF40rJTwHSKxP3kG44dClPY1SNKXzF3A3OqnEY3aotZffpCw4qVAF8TRHHc3TsTQNPkw9LrIgur5VbWFkfMzYcQNEjynCNjRAOX1uc0eEjWOqSAq8RPwY0x4mcLKL+BcJiWLvEIt8JxurkyfbtfiIV1RT3O9Mr1Ehyn0vhlc5WC1sosOuokalGkAjkRQsJY5CYS6C5gxcLdtlrvCawBRfF9LdKElPxFzuAmYPNlHJrbZVih8gg+MrFSZB0XTZ9mWgnAaR4OV1VjJZpt0FuLMmoCfhmx6LS5f2nj5Z1o/TvnyUsFe8bCTIAxjbhOrBsq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sedWtunTwKdoeXFOwuCOGYeVfeFrxIMCs6hPZD4OxMU=;
 b=Za8+QXovpFpczNGsYnFlYDIa+np3IluLtYet1NBmSLVW3ZHAk3/gDmRmmW2xManq7N58K1y323lr/9vKQ+OBOrifqwwNpyyhmfek7+4l7kSMIF9xFKnTxIVA54CAWunJjd/vUTpiJktvWLMgvvx/H++yRKfOiA8tYq2kgKsXgeRoBDpMU3wjMZRW/OAmITlA5EbXyUt1102hZAVHDPahDIVrEK0gnBF1UWhFREbYnoP49cqx14ppXHXdOQDVMp6VbHflegDgn2+Yux2aoHpU9jZNLbbJt/iAuSM2rO3+ywb4NesbPqTxcqk2SuukTSzGd1vY2Q+inKVvvvUT2CK6ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca63920c-b349-bcd3-8c1d-c869d8de4d99@suse.com>
Date: Wed, 3 May 2023 11:46:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 5/6] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
In-Reply-To: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: c2546fdf-8b07-4440-6e49-08db4bbb4cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fpRL9bnhCOhnsC6alSfEVtWe8YJYTJaE2+JHcW9qTIonFtJjgm7EYSzObIfQ1vQRifbWAy3nvRlXyZwI+IrftptNWbY9jM8AuTfbkBg+oa46wl2OwhEt/3DZoaDg92anp+nA/7eEui9hQqhnhVC4/yn0110QK1gPAAK3c6PQTFfMH6ibSEUFgvmClWAbO9HlryKswV4aoqcIfbQxnD55OqiqLC03TyZhHELFhf8U4oGvYCWpDPX5MUdxU9sQIUC22jZIMA06xeXPBkSlHBir+OQ6DAgO4uK9PZMXzCfkZFq36TAU/NCUcabVG1XDwpfBeWHzRjDMsSjmOq0RjVA/bOpCRqgTi1SbAQ9fzp5wOzC0kmDvAckavSRbX3SwKuL0Ej0Ht0N/54vRMj53qmiw2dFUoLSFI+HJDIgsqXu2V6D9kj5hlum75vDItSwcdzlkhgeBpAY20rtqmFaCMb6/OgZjrF1Sa5wslNiIP+Gx0nj2BqkY51JqG+qqHn0l9T10gRqkeN/NomuFcpcw+mEE6wDYIqF0la2FOs1Yyyg/7sgWzw+O306RiHl0QksDfJjjV0FlMuGOoc7gXj8LOU3wiEIJvOwAfGZ8EOVjVz9dH4wt5iYaNWURSDCk3qhQ3VMZpNxp4kHI9oDJJQ14QJwshA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(6506007)(26005)(6512007)(186003)(31686004)(2616005)(2906002)(5660300002)(83380400001)(8936002)(8676002)(6486002)(41300700001)(36756003)(478600001)(54906003)(38100700002)(66476007)(66556008)(316002)(31696002)(66946007)(6916009)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0EvZ1VtNjZCMEg4amc3Tmkra0EvMWFhVTgwbjRSTVByN1FCdTQwYzVWcUg4?=
 =?utf-8?B?c0NNSHZsS2ZRU2p6S0dYSi90a0RiRUt5OFNVdk1OTWp0VkpNOGhtd0N0dVAw?=
 =?utf-8?B?SDdVVloyK0ZTaGI4bDFOdUFwVnljdkQzVnNiSlhMMDFtanF3NGpmWUZaaDVW?=
 =?utf-8?B?UVhITVZaTmhnejdqL20yNWdCdTltcDJYUytIYWZwMWxpQlFTTHRhVU5lWE1L?=
 =?utf-8?B?R0loUzgwQWU2cldLRjhjWUR3Ym5ncHpoYXdiOVNQZWVZUDVENWJhNUpOeXU3?=
 =?utf-8?B?V1hJYVBCZWZIOEMwbXZ6SkdvMlE4V0l3M0VBYXJMWUFKalBlcldtNnB3eTN1?=
 =?utf-8?B?cHFmMUVPTkJpdlN5dHEvZHhVQ0R5ZFIvWlY3TWVFc29EK3cwMlZxSE1lRWlK?=
 =?utf-8?B?WkNoY3lWRDRiSGxwVEoxL0owVUQ1bFN4STZnUkduQ1lXaWRjWlU3QTExbk5x?=
 =?utf-8?B?R0RGUlNITVFVbWRyWjA0WmdZOUladmlQQlRubWkvU3ZzbnZWOW9wNTFSelZq?=
 =?utf-8?B?S1JkblBUUnZ6enU5c0ovdWQvejNucEFJMEVhS3hxVU0vV3FlbGNENVhEWGht?=
 =?utf-8?B?M3c5THB2YWh5RnlrYzdnUkpHZ2lTR3pYMWFCUExheFF6cEJkQzFmZWJwM2hZ?=
 =?utf-8?B?UkVlZ0pHNUQ3NkxPeDNOUmoxZVQwcEFzSk1hM21yd3ZrRmZXTDYzVzRybDBG?=
 =?utf-8?B?MGk4WDZvdFJOMXY1bG5CUnJCbkp4bGxtTlRwdURydGYraEFGUDU1LytueUJF?=
 =?utf-8?B?UzdtOGZGVTlXVGNGQzNHcXVGM05iTXpxUklIUnROY3o4eUI5OUk4RnpsV3BB?=
 =?utf-8?B?ZWFUNFlpRFFSWnBqSmJIVDg2WEpNbitUcWlUWTRFS0lIQTJvNG9WQldPVHpT?=
 =?utf-8?B?b2VaL1hlTGgwaXZmNkhrbUR0U0N6amxzN3hxTnowMW5hMU5rSFZPckp2Rkp6?=
 =?utf-8?B?WnFNVGZHaTNBWlhkUHlYR3VwdDI4K3A3YUJKbHFFUUVEZmtnQVh1cDhOZGI0?=
 =?utf-8?B?S3JWTjV6TWZCSHhVV2J5NkRqMXJwamF2ZGYweDBqbmozTGsydytieUNBOUMv?=
 =?utf-8?B?TlF5L0dDcC90bURvc0loTjFPcTNXdGFOdG50WWpNUEdtZ1JOSFlOVFlQN01F?=
 =?utf-8?B?elRwRmk4Q0ZUdFQzS3R0cmRUYlBRNXFsNm1UUWdKb3dSVVdIMC8waHlTYTZT?=
 =?utf-8?B?OUlTakdJSlhYbU11bWE3OUp1V3VSRno1YzZJNGQyd2x3eTZSR25NbkVzTFJQ?=
 =?utf-8?B?WitZbURxUTRuUXBQZnh2WWRad0ZmMzhJeFFBMmJKeDh1VGVBNFl4RnoyRElr?=
 =?utf-8?B?WFV3WFJSL2ZuYWZCb2d1L1FTaXB5L0NFaVl2djIwL09yZHA3amQ3a1hXWWlp?=
 =?utf-8?B?NmZ2NUp4d1hzcnc4ei9nTml4TG5FUkluRW5zR25aVDJXV3FNdUdHd2pBVWpz?=
 =?utf-8?B?djlkQ1JmWVJCNlowekdpUWZXa1ZVOUJMWnJwaWJzWjh1UUR1RnI3a1o3V1Bv?=
 =?utf-8?B?blhtK3lZNHNWMXl3cWJIK2RiMEU0aVg1OFFZTUY2MUdJbWdEWG1lVHJyMis2?=
 =?utf-8?B?MTErajVLQjdnWDZiRU9GZjlPbFpiYTIvWWRXRzgzTTI3NHdBaW1mKzBBaHp2?=
 =?utf-8?B?bStvVjVoczBSWVo2OFVGNVljaUhZZ3h4bWJxYzNtWU1EaElnSWFsSVNpeHps?=
 =?utf-8?B?RFBHYk91Qmtzdzg0U3l3cFoxODZYUzZ5aEtsM0pmV3FvYjZrV3doMFA3SzJK?=
 =?utf-8?B?dFVwMWRwYy9LN1F2UGNkRGQ1VWNqMVFtM3czNWFpMFJwak1NSDA5QlF0b211?=
 =?utf-8?B?ZkFpOWJWTWdhWkJiN3hDak1BV3dmeG5WZlRYY2JHUW5CZFkwMGYvczRtUmFZ?=
 =?utf-8?B?T0pzZjhXanZ1Ymx3aGZjSm1JdEkyL1NSS1ZxSnpLN0lhaG1naHFHQzFtc3lW?=
 =?utf-8?B?NWVSNUpRRHlDUUtkWXQwbHdJaUpDK2dBWEszUjdORDVOVDVheWEvM1Jvdnpx?=
 =?utf-8?B?TytrRDFjODM4WktURFRCeVlaME5MZDc1aUo3Z1VYRlU0enhwUUwxQUxMdVF2?=
 =?utf-8?B?SnZQQndKalltVkpjcjJtRzhpd3RmTGsvS21jNnVxaEZPU00xTC9EakdEWUNj?=
 =?utf-8?Q?SMk1duqpQVan/4rXP6UMAz3wg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2546fdf-8b07-4440-6e49-08db4bbb4cf0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:46:42.6204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAbjnMzlOUvnn1zJGckmhAAb86n+GubmED2soiX7lSxTEnNaTZRkLr5UBhYyPwfCpCMDaHSs8fAZ12vNbF69VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980

This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that this (of course) collides with "x86/HVM: restrict use of
pinned cache attributes as well as associated flushing".
---
v2: New.

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
     if ( flags & FLUSH_HVM_ASID_CORE )
         hvm_flush_guest_tlbs();
 
-    if ( flags & (FLUSH_CACHE | FLUSH_CACHE_WRITEBACK) )
+    if ( flags & (FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK) )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
         unsigned long sz = 0;
@@ -245,13 +245,13 @@ unsigned int flush_area_local(const void
              c->x86_clflush_size && c->x86_cache_size && sz &&
              ((sz >> 10) < c->x86_cache_size) )
         {
-            if ( flags & FLUSH_CACHE )
+            if ( flags & FLUSH_CACHE_EVICT )
                 cache_flush(va, sz);
             else
                 cache_writeback(va, sz);
-            flags &= ~(FLUSH_CACHE | FLUSH_CACHE_WRITEBACK);
+            flags &= ~(FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK);
         }
-        else if ( flags & FLUSH_CACHE )
+        else if ( flags & FLUSH_CACHE_EVICT )
             wbinvd();
         else
             wbnoinvd();
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2228,7 +2228,7 @@ void hvm_shadow_handle_cd(struct vcpu *v
             domain_pause_nosync(v->domain);
 
             /* Flush physical caches. */
-            flush_all(FLUSH_CACHE);
+            flush_all(FLUSH_CACHE_EVICT);
             hvm_set_uc_mode(v, 1);
 
             domain_unpause(v->domain);
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -614,7 +614,7 @@ int hvm_set_mem_pinned_cacheattr(struct
                         break;
                     /* fall through */
                 default:
-                    flush_all(FLUSH_CACHE);
+                    flush_all(FLUSH_CACHE_EVICT);
                     break;
                 }
                 return 0;
@@ -680,7 +680,7 @@ int hvm_set_mem_pinned_cacheattr(struct
 
     p2m_memory_type_changed(d);
     if ( type != X86_MT_WB )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
 
     return rc;
 }
@@ -782,7 +782,7 @@ void memory_type_changed(struct domain *
          d->vcpu && d->vcpu[0] )
     {
         p2m_memory_type_changed(d);
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
     }
 }
 
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -113,7 +113,7 @@ void switch_cr3_cr4(unsigned long cr3, u
  /* Flush TLBs (or parts thereof) including global mappings */
 #define FLUSH_TLB_GLOBAL 0x200
  /* Flush data caches */
-#define FLUSH_CACHE      0x400
+#define FLUSH_CACHE_EVICT 0x400
  /* VA for the flush has a valid mapping */
 #define FLUSH_VA_VALID   0x800
  /* Flush CPU state */
@@ -191,7 +191,7 @@ static inline int clean_and_invalidate_d
 {
     unsigned int order = get_order_from_bytes(size);
     /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
+    flush_area_local(p, FLUSH_CACHE_EVICT | FLUSH_ORDER(order));
     return 0;
 }
 static inline int clean_dcache_va_range(const void *p, unsigned long size)
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5193,7 +5193,7 @@ int map_pages_to_xen(
     if ( (flags & _PAGE_PRESENT) &&            \
          (((o_) ^ flags) & PAGE_CACHE_ATTRS) ) \
     {                                          \
-        flush_flags |= FLUSH_CACHE;            \
+        flush_flags |= FLUSH_CACHE_EVICT;      \
         if ( virt >= DIRECTMAP_VIRT_START &&   \
              virt < HYPERVISOR_VIRT_END )      \
             flush_flags |= FLUSH_VA_VALID;     \


