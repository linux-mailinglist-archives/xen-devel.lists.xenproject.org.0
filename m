Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6C65F0AA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471993.732077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSet-0000ru-Hj; Thu, 05 Jan 2023 15:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471993.732077; Thu, 05 Jan 2023 15:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSet-0000pk-F3; Thu, 05 Jan 2023 15:59:59 +0000
Received: by outflank-mailman (input) for mailman id 471993;
 Thu, 05 Jan 2023 15:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSes-0008Jw-Ef
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 15:59:58 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00508178-8d12-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 16:59:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8498.eurprd04.prod.outlook.com (2603:10a6:20b:341::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:59:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:59:56 +0000
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
X-Inumbo-ID: 00508178-8d12-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBAGFaC+7XaXEaS/dMOryNP8HQJjZaJgWlsPf8YSRNoX2nhTcHx8BN9OPCZ0ghGj2h1mfpcHcxFYWugMFPKXx656Ui1k0WuaWoc0w6b3tBV4el8J+UZ1Uu7uw9ONtKCbUq6MS+Xfq6Z+ehawsia9QN33tmh8bzvxut0cKRvx+sJBlJuBJGgSk80vX92j97RfcIdLMxlcj8Twv/Z1A6Qc9fnLEVQSu3xM7T/1DIec4/nhxrEL6p220Ovb9eSOHt9B/VbPsR3gcITTXVc24NOLyvTBYfbgBhSsjQkfnso54zsfVmW6SqrODVyqdoVch/GiZ2QhIyULe3AtHbQGltzGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MAeVXjSAqbPszhTtBmGKP8+Eqtn6/71idrhhw4dk4U=;
 b=cIi/8cE5EczZeXkInl+/1Cs8QWA8mtfdQytQCHE3xg+bLry2lnI7eCVAwAfo9pUdUViw6IsyuZQo5D+qmt0xmKaOzecmby/6M7yUCZjVvN9r1vDyqt5ph4Ppgz/f60xE34HQo7jmvpoS5IR/1U5vUVuMy3OFD07DFPKMaf2+V4kMtpKq6paxBW54qkMR8M+UHek/eNpylprBkzrRWBqY1fR22xcPj/7qk9Cyuyxcgx6x0cCBVcG/+vI+7b5t9jVCad5+aXPUCrjLjQyjh70Nf3s0c7qblO78qeFM3a6GAElP15Lj+EjmdOx27kxNnzEW0WQamr4WjWBO4CM2B9BbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MAeVXjSAqbPszhTtBmGKP8+Eqtn6/71idrhhw4dk4U=;
 b=CLHNi215qsvBFMX1AQSq46LskidQpk2iR6B37Zv7cfzoL5vw/IpazCn8HHcqPfX/19KQOldOxZJ+NEGitxt02Yh1nwd9ZKrrVbiIp94j38GqNKsbDHj3SXha73mk/4NQu1K0FzJ17jojiFwpr5ng/hurKwRy4fUemfWhnoh2EAdmgSXObAU7qHBH4TGRKdzP/q0BWkI5ENTerJ6+fMBO5IcWj5e+/VMLWRY9xQ7P2QaBUL/5AIwvBFZkKXOb25FNUSw2FJXdiZNqlKLtTFgS9bf6wbxTzYpWeW8cWHhU/xpW5ZyVMIZw3qUiNL+34s66JxgMg0Xkv+bwupAF37osYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9096ecd9-b3ec-4d06-8641-f8d6cef19027@suse.com>
Date: Thu, 5 Jan 2023 16:59:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 03/11] x86/shadow: drop hash_vcpu_foreach()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7b9a27-cbaa-4d0c-29be-08daef35e3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wMA0ow7UH2i2HFI6MYvE66D9IP3H0N4cmahrWnviOiahEWb7sz+WfCQwhn/hTtN0iG2/CLnILb+7ft3cFxkIi5s0h3wON6DmsR7CeZprOaHsvIqHasBJIQKcW/DK8evOSBXFDJebmRcgSjc2EoR5TDkTFLPQqE/KPl8xUJJ1xq2ZRwku/o47QjDsWbTcqzhZf0p07jXebdGkSrs01R+fAosvvylKxK3Uc0bNT0DARD4k4xrK6rOGzdUy3sSBTMVoA44xq/6ZZwmRZhQhd/pB0VLxpqbltW1FlEiryclG4SwHeWfeQywyzO7QuClIAQj9clD/N4I+/+JLsX3/3/8Wf7FWc7KXLuCllg8wxm3aKmvis7ZQb0Gu5AeNrGrcLl+gMYzOP+eMqWJt1xFG/cJ3mEiJXGR9sQ+hk3KZP35vEIuYe3goCGvX7MOWJdIKQNajYmWoHO9kVDQ/Q5OkN7JzW1kbAlTIG6MsfKuvAQ7bd2s8OqShANB+058L2qbiNCU7US8r62xNBr6ln3iqvoeAG3ov7JXgqY1Fii6hM8xR0xj5Ava/wUuahIPuoB9zFLI/hj1N5mkMgwADMnlnpB9hnae65nh6TEtTL5+XRGhFKavpY0j91dVWngn/9W4HJfPsfujZBAgwx2QXBxxOZsuUEn82BLVWkmu6+MbzhUgngf6vrJo+zB8YNVOIff/+zc1uGbYxHYhZ1yssCmFb95pyV4vSIqXdoKenE3wUhktYFIMbYBswtd4uPyy+ZL0KFdhQkV8rlqOe4AhscWeZdbq6gduh7zxFwbOtnT9Od6G4h40c0+dWEvVJpcRNJ/NwZ2D6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(38100700002)(41300700001)(36756003)(2906002)(8936002)(5660300002)(83380400001)(186003)(6512007)(26005)(478600001)(6486002)(31686004)(6506007)(316002)(66556008)(6916009)(66476007)(31696002)(86362001)(8676002)(54906003)(4326008)(66946007)(2616005)(45980500001)(43740500002)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejlnMWhta3N5dXBNdHhxNmhsWmdTWU8yL3Y2RTVpcjluVk93OTF5L3NQeWhS?=
 =?utf-8?B?Yi9RbytQUFVGMDQxNDFxOTJESUhIcUJKdFlKWDZoak9WNmhvcHRMYThkR095?=
 =?utf-8?B?RDVvS3BoR0UvdEVqZ1NuSjhiR2FydkJHNkpTNzhJYmJMR3VUMWZHbUs3emk3?=
 =?utf-8?B?VlQ1Y3hwOXNHbmNMT0NKcGdHNkdJNVg1UG5QQ3YwYjVwdE92K1YwVWtQNUxZ?=
 =?utf-8?B?TDhkMWFRdkhvMGFSOEZwWFArd1pHTE1iTlhsbEtnWFRFQnhLZXJlL0NiWFFl?=
 =?utf-8?B?VkM2TTc1clh4aW5qcTJmWUZhWTlpek5PRjRxc2JGVXJkNE9FSHhVWFBMMmMy?=
 =?utf-8?B?U3lBQUpodFFSbFhFSE9TMUNDaFhOUnpwOHVIeGJCZit2VnFCZEpyQ2traExM?=
 =?utf-8?B?M1Y4NmpLS0RNZTF0ZDZYYzVobHJnekhpYWdVMUVXZlRwWE1RRi8waGZWS2pY?=
 =?utf-8?B?VDBhVXR1VWJQQm1qSWsxSTVEZzIrUW9KQmV5UCswMjZNUUE2MVBDaEd2R0RB?=
 =?utf-8?B?L25sS05QbmVnNU5QK1hsWlVsZkdzRk94cGNQWW5ycWhiNlBpLy9ZNWNFbXJa?=
 =?utf-8?B?MEdDRytUY25DTkQwdmxzUFNiOFBoOVdQNmdGTTg2ZVExcytwUmFhdW02WVFF?=
 =?utf-8?B?akVUYitwRHFrTTFNSHgyTXJlTXVlbG90MFEyOVM2aXVRT2hUMjdkaytUQWFU?=
 =?utf-8?B?Q1FodkJoYmRwVjNQUGtKSVhYVHRJcnBKK21UTkVnUCtnSDRQQzJzaCt3T2dp?=
 =?utf-8?B?djFKbTBEQ3NkMlY2dWRTa3RydmVRam9qVTRiL2ptS1dFa1dOV3hSZWVGMkJL?=
 =?utf-8?B?YkNOa2ZFYkx5K1pHT2QrbHVUUUdRODdEZEVubVFFN0dEQkZSYlN0SWo0cWVQ?=
 =?utf-8?B?VWZzTG5SdnlSdURnUzA0NlZBUWV0ZWJQS1hHSUtPbjYrdjFDNTQ4TmF5OUxG?=
 =?utf-8?B?dGZ1U0RWUlRyVjZqWng0Qk0xQURDbHlQZ2twVWRIK1FqOXFxb1Q0TXVVU2FG?=
 =?utf-8?B?SVZRbjVpaVVMSTZ3a2I1eG1paWtjVWwzY2hEZUVnM3ppZWhIbkNKRzBma0tr?=
 =?utf-8?B?U0V4NFlPQkV0eDhwRVlValdoSmFwOXhkRGxMSFE5Mjhnbk5kRVA3Uko4dkhq?=
 =?utf-8?B?clNEZ1VzaDQ0SmJvc25XZUhIV0NDd0wxY1M0UDc1ZHJGa1NwUXNwK0VoUHB3?=
 =?utf-8?B?L2RIVExaZTNTdWduQ3phVS9rQzQ4U2tBYmY4bS94LzV4YlZjcVR3Q2M4Q3V5?=
 =?utf-8?B?Q0p0NlRNS3ByNTA3aEJrajU2QW5iZmRvbEJWUy93ZVZadkZub2pNaERjS1Y5?=
 =?utf-8?B?ZnVETWNEYS82dUhmSEJJeW51ZWxyMS8yT24yUDUyS0szeVBmdElmblRHUzd6?=
 =?utf-8?B?ejUrMXczUzEwN1ZvQ2k1YU1ZaDVobzBNWUp0US9LbE1YaGUxQXhpK1FRc1Ni?=
 =?utf-8?B?SENFemR6UXBjUmFJWTFOU0hjblIyZ3NvMUNqcW1GZlg2WHBkSXZPUGppUER3?=
 =?utf-8?B?WEpEMCtQbC9oeGRHWHZIT3g4emJKc3M5bnp0TlFEMEFEVndINHBNY280dkFQ?=
 =?utf-8?B?Z25hNElXbVRKY1RrcmFMVnZIT1UyeG0zSUU4MHVlek1ReWpZUTROK0VkcFJT?=
 =?utf-8?B?c3RpT3BISGJJdzZCd3BURXAweVU3bDlPdk5oVUdVZVd0QVZ3NjRCM0M0ZEdu?=
 =?utf-8?B?RkFRaDU0bUNMRDA1YWRiTWpqSjV3SEE0RWZoMnh3cHY4TDhLVnlNTmgvb3g5?=
 =?utf-8?B?c0xjTzE3cnFIaEo0TmJvbzlRVDgwOXFTc1c0a2ZPQWtqeTUwMVZzYThIL25V?=
 =?utf-8?B?MEtJUURMR1VRc3dDaWNrRjR3SlZ1UWVWSGNBUFQzVjJ6bGMwTkRVdnYwV3U1?=
 =?utf-8?B?TkEyY0RTaVlhSHF6aWJOdC9kN0phZElWblNDdCtqY1RUR1BaNWlMa2RIVW1p?=
 =?utf-8?B?Nk9BOW9iQWRaYjFDUndPYUF4cTlPSDMwaHhsamh5RThlY0xYZlpGem95MU1X?=
 =?utf-8?B?dmNQSkxZTGhldnlEeGRPaVZGRlFpakRncVFEZ3VvRnl1ZmVvUEZkS2FUc2xV?=
 =?utf-8?B?SXBTK0VVS1RLNTBhditOUzRxWE9kMGs4QW5UUElBVEpSeGVPcUJYRzZRaGhC?=
 =?utf-8?Q?E0L7ERpl/SYCFvPQ5RpMUUJMz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7b9a27-cbaa-4d0c-29be-08daef35e3e2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:59:56.3307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiJSv7t2nDH/vrExr8DiKaQCocO2Paf1PDFdzbgsUuVqoUuUFHSeXzPGQqkyQSJankupVF5RQhgRkEbKst6Qfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8498

The domain based variant is easily usable by shadow_audit_tables(); all
that's needed is conversion of the callback functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -3215,7 +3167,7 @@ int shadow_domctl(struct domain *d,
 void shadow_audit_tables(struct vcpu *v)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
+    static const hash_domain_callback_t callbacks[SH_type_unused] = {
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
 # ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
@@ -3262,7 +3214,7 @@ void shadow_audit_tables(struct vcpu *v)
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
 
@@ -3946,9 +3946,8 @@ static const char *sh_audit_flags(const
     return NULL;
 }
 
-int cf_check sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_l1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l1e_t *gl1e, *gp;
     shadow_l1e_t *sl1e;
     mfn_t mfn, gmfn, gl1mfn;
@@ -4015,7 +4014,7 @@ int cf_check sh_audit_l1_table(struct vc
     return done;
 }
 
-int cf_check sh_audit_fl1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_fl1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
     guest_l1e_t *gl1e, e;
     shadow_l1e_t *sl1e;
@@ -4041,9 +4040,8 @@ int cf_check sh_audit_fl1_table(struct v
     return 0;
 }
 
-int cf_check sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
+int cf_check sh_audit_l2_table(struct domain *d, mfn_t sl2mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l2e_t *gl2e, *gp;
     shadow_l2e_t *sl2e;
     mfn_t mfn, gmfn, gl2mfn;
@@ -4093,9 +4091,8 @@ int cf_check sh_audit_l2_table(struct vc
 }
 
 #if GUEST_PAGING_LEVELS >= 4
-int cf_check sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
+int cf_check sh_audit_l3_table(struct domain *d, mfn_t sl3mfn, mfn_t x)
 {
-    struct domain *d = v->domain;
     guest_l3e_t *gl3e, *gp;
     shadow_l3e_t *sl3e;
     mfn_t mfn, gmfn, gl3mfn;
@@ -4141,9 +4138,8 @@ int cf_check sh_audit_l3_table(struct vc
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


