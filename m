Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D513E665D10
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475332.737000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbXI-0004Ut-30; Wed, 11 Jan 2023 13:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475332.737000; Wed, 11 Jan 2023 13:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbXH-0004RJ-Vc; Wed, 11 Jan 2023 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 475332;
 Wed, 11 Jan 2023 13:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbXG-0004QI-Lp
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:52:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2084.outbound.protection.outlook.com [40.107.13.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fde7629-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:52:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:52:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:52:54 +0000
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
X-Inumbo-ID: 3fde7629-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs5ktteQeAbjbF3OaY6w1lsapMxtJ+FEdx2EF+KXaa6Hg8XKaz4GOvsnsyPutwzKL8aBDDw44EXosht5S/FQ+QhYD4utSdOypESW8XhogJpvymhla8IqWakzLsoJJk9aGJ04BPGwkBtdgoncLruUdf2KbkfESdvI6xGg1PmAQSAlWPCqrYORBbG9DVtqovdIRMk1/RdlQcvkBmXTEp1E0/QAwqU7lxGhKXUmRl+qgWVd91lnWc/a6+FjNTo/de8A1txd5uPhv3cJuBESO0nxsxQ2s5Rtzv7jVAiZpHUrLT5bNZ2+zxkzYRnpl88U/YrSV9HLXGXgEDAouBWYyOG3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQVzcV/aXrmtFWKLwSeA0Wp+ghnodUCv9vHrPOZHrwE=;
 b=HczbtIbvSt7k/ToZ2QyGMzLYTX9L5rNUgcvNfo5aRLIBiXrVya3bu6RTir5TLbcl9FSmIhfursO2Flk5MJLqd3U2cb2NwEER4+rM9t+PvMgv/zzTLkJc8vZ0P2sJ1usGsVjGOde5El+njYW4JvXkEsFL0E0U908xNJXZigyYFi9Fb5va4jhC+n2LyDD2RNHnFDGQKn3EYwDjfvDJkSVumavXa+exn3r9DBkbcGCYggSxRjooUjUdiOvkD/EzF/kIESR6eb5UnccqyPMjRisjLXCyZIHXbJ1GqgIPQriTKbEMpUgiEVVR/e1NE6/mPqeLiKl4OAXzXNGnT0OILwL7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQVzcV/aXrmtFWKLwSeA0Wp+ghnodUCv9vHrPOZHrwE=;
 b=uuLYYp2LtOXjuTjT8YtjEvA90DwT0rzNHs1DifEbBz+1TlOpIeHmxxoelpKhRWFbZUbdEUbCDrU5+CwkPh8Rm6FFcBtp1UsGk/IIv3/khk6nC7kz7oFlB+LUoqmcOlYnS6mFfWRm1sC+9pB81XW3dM82Kw9Hi5LUOSE0pABS8MNgcpyxsigTlOqyNBRkdGpN8M05Uj8nLw2v29JWFz9pwMMqCn2x2DUfAnlXB8TLA1s2w5pzo+cbKc4GNk0dT8E4mWDOwe6SwjP/PDipBbDLEKPIdMBT4uZbmrUAbBuM4f+oPz8zZZ7ohuW78AZU5khiQnxWW5B3JI+cJziZ7/6Gqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17d7ca95-4c94-93e3-9a42-cc95512a66cc@suse.com>
Date: Wed, 11 Jan 2023 14:52:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 2/9] x86/shadow: drop hash_vcpu_foreach()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b15711-5617-4149-eee7-08daf3db2365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	//0zVOYkBlk+vQJ/HfhyC1nKEJ73BQcACHluRZQHwt1COJ1q0xHggOfsLK1du3af0W586iGfWutDDVxt/dJhPlg3nZPHpys3cR7DpoD4wjwQQBqN6fCreliMMlY3OmagV0nibsPrGP8EYEibCDNHG1+3BcRxvgLiYHACzXYWbsG/qNEDefVQxeu0FzX/98T3OkaJ6xwxtXC5zx9M8P/TkYv2Vpr42fVhziSHviHt3N3kvUK0q5Nu0XNJP3lOTkdQZswYf1Gqunj+xIbkR0iqTIlPKeTPC8h25xA0SJEltAEdHzu4jcXmB6s6h8ez2RG3lDnbrQTFe3rqMuoUKJFwlSqzoZB4h99FNIzvU7PvG3Wm4Puiu3svE7nUTNhxEsGEajhevxaGZM9cL7d9YWCl1bSvYROkrZk+0Xe+PpW+ApDQ4QcKUeTX8ddvvESG+sBp3OzI9sMW8aKPRhv+oEbEFaDlzyCwKX0mdfi4/MytrB3KKEq+VfsLWhly6PqabYM4uXcY33rsoNN+vtpbd5YQ2KaaZUpciHt4Q91431y9QbkyYWQhdgl3+b4IrsN7UrR5uI6pmcbSiTe4Yj9POB6YL0cu7vKRvgD5VFYwPQZ2S3mv/vTRahc1NRsGiYtekAm22W2XTlrx0XsU/FTcIFd+/uOIv1iux/VXBA1//PUlijP5DLi7hHORhDG2MlofUwpgxAlBa03qfbW2Qje/KZ4p9RRtTirloIYOol5/1YL68DsWV5M7HNzEtSN+4E7xL3STdMSkfzd5ekK1uXaI+XCLAavq0+aSE4OVUYNE9Q6FiPBwoIfwzLDwmidvv/MMOmhS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3YrVXZZNzRXbnV2eDRYY1FmTy9CSjh4UDVPK0lvbzRKWHlLSXozZ0RhMjBp?=
 =?utf-8?B?ejE3UWJhQXp1VEVmOXU2dmFhQmZSSnZMdFlrclYrK1JyVzhBckd2UVAvc2FS?=
 =?utf-8?B?cG9Mc1ExNlNJZm4zWjBtdmtuTzFPZXI2MzdmdEpZUjN1dGJpVHQxZXZOTHow?=
 =?utf-8?B?QXdnTlcyZlAwZS9FQXZYS0U3SHdpem9wRFlkd2RkUzJ4OGFydWtUSmR4UEM3?=
 =?utf-8?B?SXRVZkZEaXl0NlUxczhoTUVNWGtiWlpHVzN2S25VWkROcmZWZUJiQW9FYnBV?=
 =?utf-8?B?bXRzRmxpMEU4OWxVUHg2M2JaakpGSFkvMmNCSnprUEVnVWc2bjNGV3ZVOFNN?=
 =?utf-8?B?TUZTOFJDeG8rdzdteEQyeXQ4SE45QmNuRkViRUQ1SytoOEV3M283SFpUemFV?=
 =?utf-8?B?TlRPQnJMYlNKd3NUcStSbEJHYVkvK3dwaGpEa21nUjA5ZzM5M0pvSU5QZGpY?=
 =?utf-8?B?OVBhRGJYMUUyVHpVWEJUbmROdEtQWlorRjBLZ2FjN2Q1Ykhxc0VLVVoxU1o4?=
 =?utf-8?B?ZlcyNFNqazJhWFdjSFRwWU5wb1VxM0ZteHJtRnQ3bkVVb3BJTjZTU2pXcE1Q?=
 =?utf-8?B?RTdhazVvVlU4bWt0TFZmR25ZaHBOZWtRbFlSVHlmNEN0SDZ4L05DWGdmNTAw?=
 =?utf-8?B?anpTR1ZOaW1rdFpqbk9LQW93WFBxb0tDSEZobThkNGpRLzIveFY1VEZ2aGNP?=
 =?utf-8?B?MGtENkxDRFRtZnNUKzZGU0Y4TWtkTWhpOXdOVXRuNjdoNHdZcHpGNUtvSzhG?=
 =?utf-8?B?NkFmSEIzVHYwaTlISyt4YXJrTEttOHdCRTZPOG9kRDd1dzdpTjJmUVljNmlt?=
 =?utf-8?B?SXJ5ajFxQkhXOGhvbElMQmdPYTBQK1ZnUnp1N1FjL25WY1dtOEorbmh2ZDNJ?=
 =?utf-8?B?V2QvRnpVRUI2N3R5UmVtNnhUY20zbFBmZHB4SmltVnRSZm8zSy9aWGVXYW8v?=
 =?utf-8?B?dnlzcXM3QnVFeGE5bjh1TjdkZlRVL0lFWUVTRkpaVkZ1eVZQNW5ja0tSOGdo?=
 =?utf-8?B?aHRsQnJHMStSSThEMG9aUHVoTWIyVzdmYWRGYUFpV2lJNlc5Z3h0SDZ5RWl6?=
 =?utf-8?B?Y09VRDJqVUdpdkFmcE5COS9PY3o4cmtWU3ByalI0WmFIZEcrMUtkNDZFczgy?=
 =?utf-8?B?QW5ZMXovdHRXSDBPY2tXNnVkNEVCK2VWSG94cC9iYlVhd1QxdTZsZmJXcVpz?=
 =?utf-8?B?a1k4V29zaG1DUDVYRWhKbDJxYmN4R1pSbThnWjYrcWhqeXNTTytRTVFmOWVC?=
 =?utf-8?B?elFkV2c4RkU1YzlLUFZJRzFpRmhNNTRBYjhya1NCV051R3Y0VEtwQnQwSFUv?=
 =?utf-8?B?ekFyWWRtSWFyeEc0Qm8yZGtFeDRiMnRNOWxrZXduNjdFN2ZabGZoaHJNTWFl?=
 =?utf-8?B?SHFYQW1oNjQyNXFzdzVuTGl2aTdsOHc5NU1sTTBsSy82eFYveHFaaVZramhC?=
 =?utf-8?B?VW5aYmlqZVRsUzV3UE9XYkVOb05BMm1zVlc1T1YvenF5S2dvWldJNGdwTXJl?=
 =?utf-8?B?OTBDZGRrSTUveDhEZm1BaWtRcktyaTM5ZFBkZVBNVm5JN21RdHBxQlZEQ1B2?=
 =?utf-8?B?RlowRlF6YUdkZFNhZWJ6c3BWUkdIeUQvN2V0eG5USVAyZjVlN0VvcmRJL0VL?=
 =?utf-8?B?dVRrWlZYcGtFVElwZnVoV3RhU2dkM1lFUndYTVhKRHVTZXNObjFycVhFVERM?=
 =?utf-8?B?TlRBTUkvK2F2YlNxcHRvZEd4QTdhUERjQVMzOFROVU4yZG5TV29ZSHBBY1hm?=
 =?utf-8?B?NTdIeHpJUmVSaUI4dFhiRzRrR3pKSzBWZEkwUEZXdDBmTEtLTWVicmwxRzI2?=
 =?utf-8?B?RUN5cUNZcEpqTGp2UDQ0Z2lNcS9pUTFaK3BxaDhkaFFsSklsUW1BUExLU3Bq?=
 =?utf-8?B?eHhPYVpwVld3YUhrdnRaTmU0V0JiZDRVQm8vRjduSjRjQWFleUNGNDQyVllz?=
 =?utf-8?B?RW1NanIwOFQxSUlOWmI4SENLMWU0R0FaQjZlVlpnZGI2ZG5Pcm5zekUwZExa?=
 =?utf-8?B?Yk83Y20zV1BHb1NwQ25Ha1ROdEVGcERnODFnZWZBcld3dlpSS04ycDFxRWlM?=
 =?utf-8?B?WmdPUjJYZ1paWnh1bTJhZFN1dlExV1BPNnB2Q1BFVExJZ0JMeDBud2lLb1or?=
 =?utf-8?Q?MfeOd0ctzwRdkbVgvuafHukvB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b15711-5617-4149-eee7-08daf3db2365
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:52:54.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MS4y41vVZFF7t+NIy7x67Bf84MUqL61ubBx1bn82Z+aeb1Av2lyXupvPjeLD7C/kV6tyqgUnrbHL7/F55l8tPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

The domain based variant is easily usable by shadow_audit_tables(); all
that's needed is conversion of the callback functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1640,59 +1640,11 @@ bool shadow_hash_delete(struct domain *d
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
@@ -3211,7 +3163,7 @@ int shadow_domctl(struct domain *d,
 void shadow_audit_tables(struct vcpu *v)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
+    static const hash_domain_callback_t callbacks[SH_type_unused] = {
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
 # ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
@@ -3258,7 +3210,7 @@ void shadow_audit_tables(struct vcpu *v)
     HASH_CALLBACKS_CHECK(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES |
                                          SHADOW_AUDIT_ENTRIES_FULL)
                          ? SHF_page_type_mask : 0);
-    hash_vcpu_foreach(v, mask, callbacks, INVALID_MFN);
+    hash_domain_foreach(v->domain, mask, callbacks, INVALID_MFN);
 }
 
 #ifdef CONFIG_PV
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -326,32 +326,32 @@ static void sh_audit_gw(struct vcpu *v,
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
 #if GUEST_PAGING_LEVELS >= 4 /* 32-bit PV only */
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
 
@@ -3950,9 +3950,8 @@ static const char *sh_audit_flags(const
     return NULL;
 }
 
-int cf_check sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_l1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l1e_t *gl1e, *gp;
     shadow_l1e_t *sl1e;
     mfn_t mfn, gmfn, gl1mfn;
@@ -4019,7 +4018,7 @@ int cf_check sh_audit_l1_table(struct vc
     return done;
 }
 
-int cf_check sh_audit_fl1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_fl1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
     guest_l1e_t *gl1e, e;
     shadow_l1e_t *sl1e;
@@ -4045,9 +4044,8 @@ int cf_check sh_audit_fl1_table(struct v
     return 0;
 }
 
-int cf_check sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
+int cf_check sh_audit_l2_table(struct domain *d, mfn_t sl2mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l2e_t *gl2e, *gp;
     shadow_l2e_t *sl2e;
     mfn_t mfn, gmfn, gl2mfn;
@@ -4097,9 +4095,8 @@ int cf_check sh_audit_l2_table(struct vc
 }
 
 #if GUEST_PAGING_LEVELS >= 4
-int cf_check sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
+int cf_check sh_audit_l3_table(struct domain *d, mfn_t sl3mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l3e_t *gl3e, *gp;
     shadow_l3e_t *sl3e;
     mfn_t mfn, gmfn, gl3mfn;
@@ -4145,9 +4142,8 @@ int cf_check sh_audit_l3_table(struct vc
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


