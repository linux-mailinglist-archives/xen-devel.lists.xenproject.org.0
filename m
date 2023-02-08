Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FCB68F0F2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491839.761172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlZy-0006O9-2w; Wed, 08 Feb 2023 14:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491839.761172; Wed, 08 Feb 2023 14:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlZx-0006KO-Vf; Wed, 08 Feb 2023 14:37:45 +0000
Received: by outflank-mailman (input) for mailman id 491839;
 Wed, 08 Feb 2023 14:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPlZw-0006Jc-6G
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:37:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24b06bb7-a7be-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 15:37:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 8 Feb
 2023 14:37:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:37:40 +0000
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
X-Inumbo-ID: 24b06bb7-a7be-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbtCQ3Fj/naIk3mxntRfiOU2vyS+Lrro7KvreNTYOjgyzhIJPzlKhvfsRHVPwL/yYZCiTtvpyecp4OV1jZE9a6/DVkcsd7Mt4g8oBbayq5wPlxBeitLuQoXkm1G20Ma5H/ktFok5k1Shcd7U8dbZNN0zCEn4K7bTlZnaEzXTmwbrvQh2JuGF/M4xgJvCmkRAiJrOHfZAQDi6H1R7YZ5x7qET9DljqUIKq2wuOn4XJej37QsKvw0JWJ8QdJFJ8yLpq8rvBRl0IMB9knZiAj5TOsXCWzaGKgkoQZVxqz3LSmNeCQ9wTeJWq7maVr8e6P3pAKfmWNC0nDrQBpSwVgcLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EWXtpH9i4csdupIvMLjkJkLdXonRZOQV6uj0BrMrb4=;
 b=Xf2PPYj8eLALD3yFgK1POvzyG91HO0VMWx/LTkMDovigZVagv+seUfcanaYYrVbshPz1EP4mAu2JsmnroMmKoBY60axMfycNtmW/tqeVZj+AeDwMSZfaL7xIepppJPfsFbtofveCLk99iRPhldccky23Z5G3bYmqGifYuLaQs1gyaTPTyq1SLchU/31XWEbYvpVBFGOWgx+DLZ3mV5fGfgw0vqfIz2m85iQUrqt2jl9gQWVII3pnSt1SmbXhQoxccYE24HXa1KZlBM8Ffe0MGGHgF7QHmwMM0awXZ5saOYWI/XiU9V0tf09XsC2f4G5YMM2JgNS8LRGCIQY7Bsfc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EWXtpH9i4csdupIvMLjkJkLdXonRZOQV6uj0BrMrb4=;
 b=Qh1qHPV6wUp7LMfiGM3gQnJkKOnv0lVT95ZPlGeB49SFKvguHIE39ZasZUFu1wb/twDrnkHPEZFpK9nX2PVVhqd0vyJ37zHUTQ8nCYJkocZmJKEFw9sXbTfCRbt/gASSuuxCqXdT2bT7g+fVEWvGietZQhygGOG9pjROYAaOye8M3bBp8x6o5QK9TGp2Alo2qzua2lSnSnWqGtHg5OQVjBrhXKSJZjidizczDkCz7RLfN/xAheBW1h/zdWmmgM1QV6CPWXAML9YkKCVXfz9mJC8JJUTC2RQ8KGkbzRmDJQj5g/y33GVvw62nWnyw8BP/jmqpJ0V6jGaj9ocqzmydcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f9d6428-9cc6-ddff-a65f-25b7ef7556b7@suse.com>
Date: Wed, 8 Feb 2023 15:37:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v3 2/4] x86/shadow: drop hash_vcpu_foreach()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
In-Reply-To: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: bfed1094-557c-41a1-f566-08db09e2082c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oyus828w65Ulom6Fw9Ld1C96VHblAak5+1JTsFg4zy76P9K2uwBw8VokHmE9F9A2T7Fy6GE9J9YOV1YTYEuF0OpCnsxxeLKTQMcLMQkqroPwMjSy4ahcqg663Vd2+35coR4kMQTRuFHBPEW3j6kMSYusi5RVrT6KjxXWxTQz4Q5mXRHCWHif7Kt8tSaYIPZtqL9MvQu41wDMXZ4sQJxMVj/uYfcd3OvId7gMYWYYWGXGFi/YffVFGC6RZvMrzPHSD2XmNYQfZSLcR5DcMhzm3aRL6v5PoHQDlmXLCMiVcMqGqk5+7gjKKE14SBGBLKmtTf5Y0K/u+2oBILydtxxX1BfXAU61xJnojP9KKGAyDTH+CcIyMlETTgvl25mzEchTTvPcBcZSWarXX02MhPtnUsVLIGo2F0Mw2SQsHkTL7gRVWVkTCcOYNYgO7VHEioADV+VYYryMmaCz0t/XJ4ekRbZnNd/ONhBq+n+gmFHMp5D6fBqnjMhpNgCoi/z2xVYkqd5aimuEdtzs/2EZXIiRE0uKinuzuZxB3VsUjb+9CvZcthHobUftFMvu8EwYwqztrzoIXp/jbNfqHZ3JCp1VdKOsHSwAaOKo6JW/+yiNp8ajhUbvlf9xhFP0jQ03DDEyoP+G9Nnpqxypw+K/oyKuPbxIWKRrBMpumuEy7Eg3YayopQ9mQBeLIadlIPLElaWyskSI7Kz9YOePNtkh+PSFw5zjvaQw+GXK4iOFoov3arCSM3pucBZvsqR8wQP3RNoO0NnSlocV2h1hJITjU+ndSrVbPlNyUa6o9mB9F/rM6nIz952g41ATZ6o76StHXuLL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31686004)(83380400001)(6486002)(36756003)(5660300002)(2906002)(26005)(186003)(31696002)(478600001)(6506007)(6512007)(41300700001)(54906003)(86362001)(38100700002)(2616005)(316002)(66946007)(4326008)(6916009)(66556008)(8676002)(8936002)(66476007)(43740500002)(45980500001)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDN0ZCtRM1JUdzZBczZmRGwvOFRrSXVpM0xTNm9oSitZbGczNDFzMDBnYmow?=
 =?utf-8?B?VHJxaHg5MllaRnJSY3NqMjEvZFlBMGlvQy9QdWtYelE5WE5mTjdhOFhZZ2ow?=
 =?utf-8?B?YTIzNVJ0MllWWnlBVytJUnhDSkt0WkRwQ3NiTm9oOGhQVjQxLzZCV1BESHU3?=
 =?utf-8?B?Z1lKS2dLeDJBUWtPS1gwMUdPNlROOEJycHVLaTNRenFqR2FSRlZ3ZEw0NmxT?=
 =?utf-8?B?ei9hcHQxcG9JdnpTdno2MGthNGZPdUVPb254Q1ArWFRKV1hOaEpzb3VvNHV1?=
 =?utf-8?B?NzR5T0JQZko1a1VJejc4bU55Wm4vN3M5aHN2VHEvSGJWeWsrMnBZTDNVRkU2?=
 =?utf-8?B?NGQ2bXV4TnRuYUVXS010RmhmNWNWclU2WnEzZ2lpcUI4VW9UNVNZRStsMDJ5?=
 =?utf-8?B?RytMUG9PYWdTOTZkSU9HdGtVNXFPcmJzeVBMR3MzSFh3UVNNWDRBRFAvR25i?=
 =?utf-8?B?dzRaVUhIT0I0ZUZScDFrV0I3cVRlc295ejlVbGxLOFpiREJRNTgzR3h2cWx5?=
 =?utf-8?B?UkhQY1VhTmJ5VGdJQS93dk5nUUNQN0U0QWdhR0xMbFM1Nm9DdEhMbXZjbDBM?=
 =?utf-8?B?c210TGxrQk5IYkt1Tm1GeDBoWVdZY1BXQ241MHk5b1Vlb0VtbW9Lblc4UUEr?=
 =?utf-8?B?YW9QQThWakxtYXBlYVJxQ3RiQVlrQW5sTDNDL1BpYUQvV3RqbUFzUFlkOHlM?=
 =?utf-8?B?ZzROOTNxOXQwWUJhYnVGdzFUa3hwR3Z0eUJrZ1kyWnJOTmgxb1VOd01OQi9Q?=
 =?utf-8?B?SDkrM0pObllDRFFMZGJRUXBwZWxiNEpxOE5xdWJKSzVyZkpsZzd1OXZKM1Jt?=
 =?utf-8?B?TjZFa00xV3FOTUowTXRTVnQzRjhsRmttODJUNlNNd1RBT0l3Znh6Y1RNeTJK?=
 =?utf-8?B?WEtLNEpFZDE5b3NmbmJqTy8wbVJPUFpjSVV3MURHMnZwRk44SHJYcExiQ2Mx?=
 =?utf-8?B?aXdoN1g2alU3QXBtK0UrZGVBVDdISENvc1dUQm9QUWp5NjFqK2ptRUVhcmR4?=
 =?utf-8?B?UTUzSDhiTFA3Nml0Ny9uMmx0UktXc2VvQmVWUEVYNDJxMDBoRk5ETThKQjVj?=
 =?utf-8?B?QW16MWJPQzlJdVJIU3EraEt5eE9JbmRhU2VhRjMzQzYxQ3VNRm4yZng1Mzhq?=
 =?utf-8?B?c1lRektBU245cHFDelRrRng0K01adVJtcWxOL3lhbWRicnZCdGhGc2ZaN0tp?=
 =?utf-8?B?Qk1WdHZJUkUzY1I1dDFGNWp4YXlXQnd5Q1dlZWlNTEEyeWVHNGhpOHV3bWc0?=
 =?utf-8?B?VWppNVFuN2QxQWNTTEhuMkRlVmFqLzl0NmkydVNKM0JaMHNVcngrQUwraEV6?=
 =?utf-8?B?R3JlNG1wZjA5L1J3cmVWN0xld2FzeThtT1U0N2pLZVFDNDl4aWpEUldPU2lI?=
 =?utf-8?B?d05nYTArZlJac1R6cHlES3dYMUllRkFyeFdtTmFIQTM1cDlIVlBjVGlBa3E0?=
 =?utf-8?B?OHhKY25NRXpXZUpuMWdNdEdrTlFtT05qT0FuZ29OTWphQ1NHaGVvVi9nWERm?=
 =?utf-8?B?VWxadTM2WVFsb1dUOXVJZ1hIdE50WTVib3lGbGRnaGZXZTFQb2JmYW1Uc1dh?=
 =?utf-8?B?RDhzN2E5Zlo3aStrWmRMVmZ3Zjc3dXRKZWM1R2dnR0djdENKWmVoTFo2WUlV?=
 =?utf-8?B?VWhXazk2bktTWks0Sk1rNm8wWUJDZWE1U2F2QUlOamw3aWR4NUpVdFJ2TGpN?=
 =?utf-8?B?d2FjRFR6RHZiVEZBR2lYRlRJbDh0ZGUxUFBqS1phWDhFNnJTKzZ6UlFLMzk0?=
 =?utf-8?B?QmdWMVVCcHdOTGFZb05GQ1c3ajZuQlh4a0JZaFdWS01vUCtGTGs1dGFBU3JN?=
 =?utf-8?B?VDkwbU15bFpxbTQyWG1PZXhMTW9MRm5MQ2Z6dm9yWm0wN3hKRlJ0OU0venlL?=
 =?utf-8?B?SVJMejI5bGRLb0lyWFg0RDgrM2ZEd2hHU3dKUC80eXc2dmpucE1BTDB3VE9P?=
 =?utf-8?B?Q0xSMkg1VDZZYmxCcEFQQldOYkk4VDEzSmluVCtodlNvTW4rYUZGZE1TUHlw?=
 =?utf-8?B?TUtmZnRHUDhuRzFIN0xBNXRFaUJRY3k4MEM5TlYzYzdwVFhsTFl6V0ZHb01p?=
 =?utf-8?B?b0dGWVYrbTJwdjh6c0F3aUlKVTBubGVSOHhLVzREMW5qTit6VXp1UzBlOXZX?=
 =?utf-8?Q?f7D/ovlylvtKegyOvcfqGjclr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfed1094-557c-41a1-f566-08db09e2082c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:37:40.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qi7RMSmI8R0LN+SMJZj8MT/lBkghHjLLSZZ64ktBxK6ip/pNc93t6utOAoOSl0wEFKB629GV7oW3zCSV8/HY3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343

The domain based variant is easily usable by shadow_audit_tables(); all
that's needed is conversion of the callback functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3: Re-base.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1680,59 +1680,11 @@ bool shadow_hash_delete(struct domain *d
     return true;
 }
 
-typedef int (*hash_vcpu_callback_t)(struct vcpu *v, mfn_t smfn, mfn_t other_mfn);
 typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
 
 #define HASH_CALLBACKS_CHECK(mask) \
     BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
 
-static void hash_vcpu_foreach(struct vcpu *v, unsigned int callback_mask,
-                              const hash_vcpu_callback_t callbacks[],
-                              mfn_t callback_mfn)
-/* Walk the hash table looking at the types of the entries and
- * calling the appropriate callback function for each entry.
- * The mask determines which shadow types we call back for, and the array
- * of callbacks tells us which function to call.
- * Any callback may return non-zero to let us skip the rest of the scan.
- *
- * WARNING: Callbacks MUST NOT add or remove hash entries unless they
- * then return non-zero to terminate the scan. */
-{
-    int i, done = 0;
-    struct domain *d = v->domain;
-    struct page_info *x;
-
-    ASSERT(paging_locked_by_me(d));
-
-    /* Can be called via p2m code &c after shadow teardown. */
-    if ( unlikely(!d->arch.paging.shadow.hash_table) )
-        return;
-
-    /* Say we're here, to stop hash-lookups reordering the chains */
-    ASSERT(d->arch.paging.shadow.hash_walking == 0);
-    d->arch.paging.shadow.hash_walking = 1;
-
-    for ( i = 0; i < SHADOW_HASH_BUCKETS; i++ )
-    {
-        /* WARNING: This is not safe against changes to the hash table.
-         * The callback *must* return non-zero if it has inserted or
-         * deleted anything from the hash (lookups are OK, though). */
-        for ( x = d->arch.paging.shadow.hash_table[i]; x; x = next_shadow(x) )
-        {
-            if ( callback_mask & (1 << x->u.sh.type) )
-            {
-                ASSERT(x->u.sh.type <= SH_type_max_shadow);
-                ASSERT(callbacks[x->u.sh.type] != NULL);
-                done = callbacks[x->u.sh.type](v, page_to_mfn(x),
-                                               callback_mfn);
-                if ( done ) break;
-            }
-        }
-        if ( done ) break;
-    }
-    d->arch.paging.shadow.hash_walking = 0;
-}
-
 static void hash_domain_foreach(struct domain *d,
                                 unsigned int callback_mask,
                                 const hash_domain_callback_t callbacks[],
@@ -3280,7 +3232,7 @@ int shadow_domctl(struct domain *d,
 void shadow_audit_tables(struct vcpu *v)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
+    static const hash_domain_callback_t callbacks[SH_type_unused] = {
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
 # ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
@@ -3329,7 +3281,7 @@ void shadow_audit_tables(struct vcpu *v)
     HASH_CALLBACKS_CHECK(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES |
                                          SHADOW_AUDIT_ENTRIES_FULL)
                          ? SHF_page_type_mask : 0);
-    hash_vcpu_foreach(v, mask, callbacks, INVALID_MFN);
+    hash_domain_foreach(v->domain, mask, callbacks, INVALID_MFN);
 }
 
 #ifdef CONFIG_PV
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -333,32 +333,32 @@ static void sh_audit_gw(struct vcpu *v,
     if ( mfn_valid(gw->l4mfn)
          && mfn_valid((smfn = get_shadow_status(d, gw->l4mfn,
                                                 SH_type_l4_shadow))) )
-        (void) sh_audit_l4_table(v, smfn, INVALID_MFN);
+        sh_audit_l4_table(d, smfn, INVALID_MFN);
     if ( mfn_valid(gw->l3mfn)
          && mfn_valid((smfn = get_shadow_status(d, gw->l3mfn,
                                                 SH_type_l3_shadow))) )
-        (void) sh_audit_l3_table(v, smfn, INVALID_MFN);
+        sh_audit_l3_table(d, smfn, INVALID_MFN);
 #endif /* PAE or 64... */
     if ( mfn_valid(gw->l2mfn) )
     {
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2_shadow))) )
-            (void) sh_audit_l2_table(v, smfn, INVALID_MFN);
+            sh_audit_l2_table(d, smfn, INVALID_MFN);
 #if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2h_shadow))) )
-            (void) sh_audit_l2_table(v, smfn, INVALID_MFN);
+            sh_audit_l2_table(d, smfn, INVALID_MFN);
 #endif
     }
     if ( mfn_valid(gw->l1mfn)
          && mfn_valid((smfn = get_shadow_status(d, gw->l1mfn,
                                                 SH_type_l1_shadow))) )
-        (void) sh_audit_l1_table(v, smfn, INVALID_MFN);
+        sh_audit_l1_table(d, smfn, INVALID_MFN);
     else if ( (guest_l2e_get_flags(gw->l2e) & _PAGE_PRESENT)
               && (guest_l2e_get_flags(gw->l2e) & _PAGE_PSE)
               && mfn_valid(
               (smfn = get_fl1_shadow_status(d, guest_l2e_get_gfn(gw->l2e)))) )
-        (void) sh_audit_fl1_table(v, smfn, INVALID_MFN);
+        sh_audit_fl1_table(d, smfn, INVALID_MFN);
 #endif /* SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES */
 }
 
@@ -3920,9 +3920,8 @@ static const char *sh_audit_flags(const
     return NULL;
 }
 
-int cf_check sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_l1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l1e_t *gl1e, *gp;
     shadow_l1e_t *sl1e;
     mfn_t mfn, gmfn, gl1mfn;
@@ -3989,7 +3988,7 @@ int cf_check sh_audit_l1_table(struct vc
     return done;
 }
 
-int cf_check sh_audit_fl1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_fl1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
     guest_l1e_t *gl1e, e;
     shadow_l1e_t *sl1e;
@@ -4015,9 +4014,8 @@ int cf_check sh_audit_fl1_table(struct v
     return 0;
 }
 
-int cf_check sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
+int cf_check sh_audit_l2_table(struct domain *d, mfn_t sl2mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l2e_t *gl2e, *gp;
     shadow_l2e_t *sl2e;
     mfn_t mfn, gmfn, gl2mfn;
@@ -4067,9 +4065,8 @@ int cf_check sh_audit_l2_table(struct vc
 }
 
 #if GUEST_PAGING_LEVELS >= 4
-int cf_check sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
+int cf_check sh_audit_l3_table(struct domain *d, mfn_t sl3mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l3e_t *gl3e, *gp;
     shadow_l3e_t *sl3e;
     mfn_t mfn, gmfn, gl3mfn;
@@ -4117,9 +4114,8 @@ int cf_check sh_audit_l3_table(struct vc
     return 0;
 }
 
-int cf_check sh_audit_l4_table(struct vcpu *v, mfn_t sl4mfn, mfn_t x)
+int cf_check sh_audit_l4_table(struct domain *d, mfn_t sl4mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l4e_t *gl4e, *gp;
     shadow_l4e_t *sl4e;
     mfn_t mfn, gmfn, gl4mfn;
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -83,19 +83,19 @@ SHADOW_INTERNAL_NAME(sh_remove_l3_shadow
 #if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
 int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l1_table, GUEST_LEVELS)
-    (struct vcpu *v, mfn_t sl1mfn, mfn_t x);
+    (struct domain *d, mfn_t sl1mfn, mfn_t x);
 int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_fl1_table, GUEST_LEVELS)
-    (struct vcpu *v, mfn_t sl1mfn, mfn_t x);
+    (struct domain *d, mfn_t sl1mfn, mfn_t x);
 int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l2_table, GUEST_LEVELS)
-    (struct vcpu *v, mfn_t sl2mfn, mfn_t x);
+    (struct domain *d, mfn_t sl2mfn, mfn_t x);
 int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l3_table, GUEST_LEVELS)
-    (struct vcpu *v, mfn_t sl3mfn, mfn_t x);
+    (struct domain *d, mfn_t sl3mfn, mfn_t x);
 int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l4_table, GUEST_LEVELS)
-    (struct vcpu *v, mfn_t sl4mfn, mfn_t x);
+    (struct domain *d, mfn_t sl4mfn, mfn_t x);
 #endif
 
 extern const struct paging_mode


