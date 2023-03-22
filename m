Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFC6C468A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513246.793996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peusJ-0002xc-HK; Wed, 22 Mar 2023 09:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513246.793996; Wed, 22 Mar 2023 09:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peusJ-0002uD-DL; Wed, 22 Mar 2023 09:35:19 +0000
Received: by outflank-mailman (input) for mailman id 513246;
 Wed, 22 Mar 2023 09:35:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peusG-0001G9-VQ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:35:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8cd8f19-c894-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:35:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:35:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:35:11 +0000
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
X-Inumbo-ID: d8cd8f19-c894-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBacKu1HBtn4XA0TbCLxrVWhcEuDsJ3xgxo+9ZBB7vvWFb+H4y2bqQskOuQTFW2ugytpyig9GYgULouUqDGQhM6VJE/0Ws5GQv+0sQ6TmN0pcxq8TSRokxKhTpe67tuypHW8ejNXK4lvCU8Uzktl6GkLlXEqS2a85eKnLwwiBZ8PT4HZe7nC5P5bisRUG8Pd6Xu4DMiTrwNjodHoOOi7hLLVdzIfkmMzyVT/tKBhPPYNR7lPraYi7CW2OHhFi1dilyODUqiPDuaZizlaClkbUcmYYdDLsnEJ6c1MLInx/en2FocIJ7XelS5c15Lt0a6xxkVgM2CXO9qTPRoDsjIOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvUW0Gbrjt/U9iuVJHfGxVNqo7A4AhQKwK2Sj3ofS8k=;
 b=Dej8ODfXnkZiK6H34ZSs4dr8ddAj8Oo2+B50wiGFYG5U3o+NzGzI7jY3VNYlnWXZHb+UsUnMZ8DU/wo1141ujfHQszat7N/LnuepcLbjsI55Dilesuvy5oY3gopnvGADRkcJGzNdS4rQ/46VNjQV4LKTq18fu7TE0OHaI8j38S8EHYOMT6JA5Ykwe4s+Kz6bLPuowtYx97wewqeOG0kt5I3BjjprD6pgU8p5+LEqqFAlZSlB8LE1tx3IbEr+k1GXOhucfgD/JwUNDqzPJN826jGrcG7dTgV8EPG8RAvQAyRFVE60CG0GhM/LcpiJrapjyWRDP1175pUJn+6fv8mISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvUW0Gbrjt/U9iuVJHfGxVNqo7A4AhQKwK2Sj3ofS8k=;
 b=PiyDJyNL3lwEsAgHiPmfq3FKFTmpbEYJxJAl4UHuaJ9ncO7J4UPyXF+Kpt6KrkD/yzhNtRnovDab7RTb6iYgFqJeP+P+nIbhUx6I+abiuheBLY0BcrrA9okkbULLI5FEgN8gjUrTcL0E8FqGHphdmJ6ccr7Lce6EJE3timy1VS/F1FEcSY+gQAmiGqdv4EkrqdvubBaP2ds70j+rWERIC3Hau/ygnZyxhnQN0D3gIEd2mHYzewQO5K5dXkZVn7M0AiFby3elPfS0nZtc0Y79siOVWXj3a/8JGryHwpULChIJwKAh2rocVzskcGXXkEhhVRbfdgjcjdWd+aejEj8SGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88be7d2e-325b-2a32-fe9f-ce762bb7b606@suse.com>
Date: Wed, 22 Mar 2023 10:35:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 10/16] x86/shadow: move OOS functions to their own file
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
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 03712753-949b-457e-4ffb-08db2ab8bb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z/eakspQlqP+eKsZmZKZR5sH0CYIR3mTcUmkwq6uRded/9sXVblMDnCsJJMeEfIDgCSSbieHTd7Nc/ecsGdiqIgBWuCyT9vN7yqTbmQIdgV6OyHNjPJWBKMLyZVrG4LT2MpBjshk0jHpmZcqmxd8OxtLwxz61SMneFUDnOohCrl1pzs29q4epMuEYy3ENJe4XHW5TVj4fDKlVUS+4R3osdBYv391vXOgbzo9bEdakdI0vo6vgLLsUlL7wL+BQH5IJmqwkfrBmyOV1r38+hQjWbhUauC+m4jvAZiapSG87aydSWZCCbAcYrN9u/MavnD8C5CBVWtiKvhO/sO3Ns2ruZijP+z54N6qkDRqhfWhGFf3wDBs/EUU2QGZOL57vzWorZF2mAxxAcrVpX+8egKl55osoCViTCVnYXXvD7YMoJUHFFXeDYsI9jRPeuQhRL1XoOtOUyv3xEXoj8UZDkoOBYR7TrjV4SpS18/K7Ey7j/82KDLk28UjJDjKEwOWKcM2aRx715h7KgfDjZiVR7joNkX1uK/9BmOZQUHFWmDgMjZdNPr9PJXl1dxyeiScFTNwRQJtsuCLe9HuDgFm7DZTSxpD+9pGkcw+qiVAsRQJkZeJ8YuK7+I1dn8WktzyIdNANUb/Cj+f1ANWma03ELa1ApBESDDUQwcHfsuGtNtMAbImvZTI3oxhIQfDlVnzXKFD/DnqhWp4yMxRVDBCPSN7bI+H0nYTJ6AnV2U8L0aeR5tn5svvGq51Qcy0su7fYjPTTjaGnVP/uU9czOUtiFIEQcjD2kjfYg5MmN3eSoyl0Cg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(31696002)(36756003)(38100700002)(83380400001)(8676002)(4326008)(316002)(478600001)(54906003)(66946007)(66476007)(6916009)(2616005)(6512007)(6506007)(66556008)(6486002)(31686004)(26005)(186003)(66899018)(5660300002)(8936002)(30864003)(41300700001)(2906002)(45980500001)(43740500002)(579004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHMyRVNMdTZGL3FGbXhtdExQNmZDUFdNT0pGVEdRb2xURDlqcm9UUFRCbWk0?=
 =?utf-8?B?bEV1eFZTNnFDT0tESmlMbDU2V1Z4MTdhL1pnanUrOUp4NSsyeURVNUJYNWwr?=
 =?utf-8?B?TnpxRzBSVjVidUhzYkFYalU1K3U1bVZQUDFya0g2UVIxMU5tR3FibElKQjlm?=
 =?utf-8?B?cHR2UlJNRnpUYzB0YkhNV0lxdVZ6ZFdpcFJWdVFIK2s0MWhFc2Uwak9XUHRm?=
 =?utf-8?B?TnNKbTl1TklpaW5pWU5OdUJROEVXWHpuSDB5dTVvazc3bmJwL1diUVNhdXZD?=
 =?utf-8?B?OWVpSDl5UnNoUkxXRlBFNVFRRUxGYXRrWVdMR2EwSVdSVG9sdXE4dTdTL0Rq?=
 =?utf-8?B?T2dlUDE4cG1zWHJ0R1VVYXBXUmRGMVA3MnhKZkd3aXpKOVFzcDN0QWxOdW9Z?=
 =?utf-8?B?WXIwNUZrOXJaV2ppS042K2hnbHR2Qkl4c0o3NUJ3dW1wOTV3VEpZMXk4YW15?=
 =?utf-8?B?NWRhUnpsVFZZaTZYZzI1ekNFZmtQZkt5NlNwd1dVK1JYME5BaUljR3FjMHVs?=
 =?utf-8?B?Vno4YTUrWCtMc0NZS3AydDBHdkdWREErdnFhWTlDSTFFYmQ5R29HdUxIRTlX?=
 =?utf-8?B?K2p2cGdycjdvM2ZJb2J0V2lVUG5qbEsyOUhBZXh6RWwvNkxXNlhDUkQ4WUlj?=
 =?utf-8?B?bElmc01ZLy9pdUlvMU8xUitqa0Fna3FYWGNMbm1IeVdZNFBkdG0yN3VsZ2xk?=
 =?utf-8?B?aEw3WEhSV2dLVTBkMEp2RWkrSWVVM2lxbEdrcDlrVVBjNzN5Sk5QNWJVMG0z?=
 =?utf-8?B?NnRSSmV2ZFRTZkdUNExnYm9rcW5oYjd6L2xpYTd2MHNobDdJam54bXV5d2c3?=
 =?utf-8?B?U20rRnZoc2VXQ1pSQWs3ZTIvNGM0Vk10azA3NkdvaGl0RWg0Z0hVbktkQ2ZN?=
 =?utf-8?B?NmdOay9pd3FRU1JrcXBQU3lOekFoSlBrR1dmNUNTZFhiNDl3bE9YaGVTM0Y2?=
 =?utf-8?B?aXUrTzFnQVFreHlvVTlvMUR0M3puSU1VQXY1RE9pRnNScjFnUzcybVZ0S0w5?=
 =?utf-8?B?WnZ6SGpVNENCeHZtMnd4eHQ3SnlXQXRrNWY4c0NPeFluclpwR3RkbDdYd0dz?=
 =?utf-8?B?aWVQOWJjbHZ1TUZPeElQQkFkZmNBR0RwOW4vRlRSM2JSRm9ZaXF1dzlRaStu?=
 =?utf-8?B?MU16aWh0RU0vZ3ZuQkVYai9SM0ErQ2IydVNkQTM3REoySnFHY2lKcFVoUDFs?=
 =?utf-8?B?MlBYRmE4bDFndTB3RVJTS3ByN1pXeVpWUjRqVDk5R2VOMC9zSE9BbmF4Ymha?=
 =?utf-8?B?TncwU1Z6ZE9qeEVzTkgrQ0V3a0pBa084NjFabVNHS2JMWmNSb2EzcWhJRjFx?=
 =?utf-8?B?amRzellZSmc0em1LQndtMmVzbEt6UTFYUkppdm96TVVsdkhXWXdoSzNZRHlL?=
 =?utf-8?B?T0NWOHlHOStDYzIwaEVjK3FiVjFBVmhuUEp0WmNOSFFhaGdWMmhHbTNSL3lZ?=
 =?utf-8?B?K0V3ZGxMRkZYMEZMalFabGlpOTBGY3A1aVIrb0ZrZm5iU1lzTVZLcTQzYm4r?=
 =?utf-8?B?ZXJoQzhIK05raDZxUlRmdE1hcEpDRnpSTUkzVDZpc0hoaHVMRFBhYkNOVnp2?=
 =?utf-8?B?d2xjMmFMOTdOamlYNjVMQWEzMENHUCtzK0RPOGVwd21qNGRuR2pEMEpOTTUv?=
 =?utf-8?B?dTJXSGxOWjVIdVRzeVlObUlNeVNGeWlGdHkxRXEyL01RdzZjNTdOMmlobE4v?=
 =?utf-8?B?UllQMWtJZHV4ZStkaDlJcU5kSGhjbjkzNGtSSEs2Yk5zRlRva1IwWS9mT1RN?=
 =?utf-8?B?SlpJRHpuK0FCT3FETXVrQ09SazhmbWV3c2hKT1JJdjE2ZGg4cnVsek5kK0dy?=
 =?utf-8?B?anA4YThYSlRQU0VEc0JjQ3FNbW9qL0ZWVUVPUjBhL1VLNU9HQ0pzTFZWaTdN?=
 =?utf-8?B?QWdaNHd3Z0tUUTk0dlkzcXF0YzBSUXRua2lhRFNiaXllNmNJbXlVL3k5bHoz?=
 =?utf-8?B?ZGhhbVZ3NWZzV2k3aE53V2VzQm5Yak1UUGdmaHlUVVhQZWtXSXdxNzRiR1Aw?=
 =?utf-8?B?dG9nOTVSeUcvREZmdFZUZ3pIV3NhVmlnSFFrc3pqMnBkaTRGUDRCQVE5eG9y?=
 =?utf-8?B?SHNwQXJHUUJNT2NySkovNGpXRHZPeisrcUt0dFZDRjJ2THEvdTlDYk9Fb2xx?=
 =?utf-8?Q?lc75FtZaBPZty+VArA+daL6/k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03712753-949b-457e-4ffb-08db2ab8bb69
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:35:11.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuspAe25L5zJMeBG0P32lT4x8Kx7VM/UYh+Nwfp8OEafndNj1SU5tQsleKki5fDglG/8q25hPXiTiAHOHByDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

The code has been identified as HVM-only, and its main functions are
pretty well isolated. Move them to their own file. While moving, besides
making two functions non-static, do a few style adjustments, mainly
comment formatting, but leave the code otherwise untouched.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -1,6 +1,6 @@
 ifeq ($(CONFIG_SHADOW_PAGING),y)
 obj-y += common.o set.o
-obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o
+obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o oos.o
 obj-$(CONFIG_PV) += pv.o guest_4.o
 else
 obj-y += none.o
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -152,576 +152,6 @@ static int __init cf_check shadow_audit_
 __initcall(shadow_audit_key_init);
 #endif /* SHADOW_AUDIT */
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-/**************************************************************************/
-/* Out-of-sync shadows. */
-
-/* From time to time, we let a shadowed pagetable page go out of sync
- * with its shadow: the guest is allowed to write directly to the page,
- * and those writes are not synchronously reflected in the shadow.
- * This lets us avoid many emulations if the guest is writing a lot to a
- * pagetable, but it relaxes a pretty important invariant in the shadow
- * pagetable design.  Therefore, some rules:
- *
- * 1. Only L1 pagetables may go out of sync: any page that is shadowed
- *    at at higher level must be synchronously updated.  This makes
- *    using linear shadow pagetables much less dangerous.
- *    That means that: (a) unsyncing code needs to check for higher-level
- *    shadows, and (b) promotion code needs to resync.
- *
- * 2. All shadow operations on a guest page require the page to be brought
- *    back into sync before proceeding.  This must be done under the
- *    paging lock so that the page is guaranteed to remain synced until
- *    the operation completes.
- *
- *    Exceptions to this rule: the pagefault and invlpg handlers may
- *    update only one entry on an out-of-sync page without resyncing it.
- *
- * 3. Operations on shadows that do not start from a guest page need to
- *    be aware that they may be handling an out-of-sync shadow.
- *
- * 4. Operations that do not normally take the paging lock (fast-path
- *    #PF handler, INVLPG) must fall back to a locking, syncing version
- *    if they see an out-of-sync table.
- *
- * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
- *    must explicitly resync all relevant pages or update their
- *    shadows.
- *
- * Currently out-of-sync pages are listed in a simple open-addressed
- * hash table with a second chance (must resist temptation to radically
- * over-engineer hash tables...)  The virtual address of the access
- * which caused us to unsync the page is also kept in the hash table, as
- * a hint for finding the writable mappings later.
- *
- * We keep a hash per vcpu, because we want as much as possible to do
- * the re-sync on the save vcpu we did the unsync on, so the VA hint
- * will be valid.
- */
-
-static void sh_oos_audit(struct domain *d)
-{
-    unsigned int idx, expected_idx, expected_idx_alt;
-    struct page_info *pg;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        {
-            mfn_t *oos = v->arch.paging.shadow.oos;
-            if ( mfn_eq(oos[idx], INVALID_MFN) )
-                continue;
-
-            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
-            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
-            if ( idx != expected_idx && idx != expected_idx_alt )
-            {
-                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
-                       __func__, idx, mfn_x(oos[idx]),
-                       expected_idx, expected_idx_alt);
-                BUG();
-            }
-            pg = mfn_to_page(oos[idx]);
-            if ( !(pg->count_info & PGC_shadowed_pt) )
-            {
-                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
-                BUG();
-            }
-            if ( !(pg->shadow_flags & SHF_out_of_sync) )
-            {
-                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
-                BUG();
-            }
-            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
-            {
-                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
-                BUG();
-            }
-        }
-    }
-}
-
-#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
-void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    struct vcpu *v;
-    mfn_t *oos;
-
-    ASSERT(mfn_is_out_of_sync(gmfn));
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-
-        if ( mfn_eq(oos[idx], gmfn) )
-            return;
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-#endif
-
-/* Update the shadow, but keep the page out of sync. */
-static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
-{
-    struct page_info *pg = mfn_to_page(gmfn);
-
-    ASSERT(mfn_valid(gmfn));
-    ASSERT(page_is_out_of_sync(pg));
-
-    /* Call out to the appropriate per-mode resyncing function */
-    if ( pg->shadow_flags & SHF_L1_32 )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
-    else if ( pg->shadow_flags & SHF_L1_PAE )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
-    else if ( pg->shadow_flags & SHF_L1_64 )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
-}
-
-static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                            mfn_t smfn, unsigned long off)
-{
-    ASSERT(mfn_valid(smfn));
-    ASSERT(mfn_valid(gmfn));
-
-    switch ( mfn_to_page(smfn)->u.sh.type )
-    {
-    case SH_type_l1_32_shadow:
-    case SH_type_fl1_32_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
-            (d, gmfn, smfn, off);
-
-    case SH_type_l1_pae_shadow:
-    case SH_type_fl1_pae_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
-            (d, gmfn, smfn, off);
-
-    case SH_type_l1_64_shadow:
-    case SH_type_fl1_64_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
-            (d, gmfn, smfn, off);
-
-    default:
-        return 0;
-    }
-}
-
-/*
- * Fixup arrays: We limit the maximum number of writable mappings to
- * SHADOW_OOS_FIXUPS and store enough information to remove them
- * quickly on resync.
- */
-
-static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
-                                       struct oos_fixup *fixup)
-{
-    struct domain *d = v->domain;
-    int i;
-    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-    {
-        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
-        {
-            sh_remove_write_access_from_sl1p(d, gmfn,
-                                             fixup->smfn[i],
-                                             fixup->off[i]);
-            fixup->smfn[i] = INVALID_MFN;
-        }
-    }
-
-    /* Always flush the TLBs. See comment on oos_fixup_add(). */
-    return 1;
-}
-
-void oos_fixup_add(struct domain *d, mfn_t gmfn,
-                   mfn_t smfn,  unsigned long off)
-{
-    int idx, next;
-    mfn_t *oos;
-    struct oos_fixup *oos_fixup;
-    struct vcpu *v;
-
-    perfc_incr(shadow_oos_fixup_add);
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_fixup = v->arch.paging.shadow.oos_fixup;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            int i;
-            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-            {
-                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
-                     && (oos_fixup[idx].off[i] == off) )
-                    return;
-            }
-
-            next = oos_fixup[idx].next;
-
-            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
-            {
-                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
-
-                /* Reuse this slot and remove current writable mapping. */
-                sh_remove_write_access_from_sl1p(d, gmfn,
-                                                 oos_fixup[idx].smfn[next],
-                                                 oos_fixup[idx].off[next]);
-                perfc_incr(shadow_oos_fixup_evict);
-                /* We should flush the TLBs now, because we removed a
-                   writable mapping, but since the shadow is already
-                   OOS we have no problem if another vcpu write to
-                   this page table. We just have to be very careful to
-                   *always* flush the tlbs on resync. */
-            }
-
-            oos_fixup[idx].smfn[next] = smfn;
-            oos_fixup[idx].off[next] = off;
-            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
-
-            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
-                                   struct oos_fixup *fixup)
-{
-    struct domain *d = v->domain;
-    int ftlb = 0;
-
-    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);
-
-    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
-    {
-    default:
-    case 0:
-        break;
-
-    case 1:
-        ftlb |= 1;
-        break;
-
-    case -1:
-        /* An unfindable writeable typecount has appeared, probably via a
-         * grant table entry: can't shoot the mapping, so try to unshadow
-         * the page.  If that doesn't work either, the guest is granting
-         * his pagetables and must be killed after all.
-         * This will flush the tlb, so we can return with no worries. */
-        shadow_remove_all_shadows(d, gmfn);
-        return 1;
-    }
-
-    if ( ftlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
-
-    return 0;
-}
-
-
-static inline void trace_resync(int event, mfn_t gmfn)
-{
-    if ( tb_init_done )
-    {
-        /* Convert gmfn to gfn */
-        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
-
-        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
-    }
-}
-
-/* Pull all the entries on an out-of-sync page back into sync. */
-static void _sh_resync(struct vcpu *v, mfn_t gmfn,
-                       struct oos_fixup *fixup, mfn_t snp)
-{
-    struct page_info *pg = mfn_to_page(gmfn);
-
-    ASSERT(paging_locked_by_me(v->domain));
-    ASSERT(mfn_is_out_of_sync(gmfn));
-    /* Guest page must be shadowed *only* as L1 when out of sync. */
-    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
-             & ~SHF_L1_ANY));
-    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
-
-    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
-
-    /* Need to pull write access so the page *stays* in sync. */
-    if ( oos_remove_write_access(v, gmfn, fixup) )
-    {
-        /* Page has been unshadowed. */
-        return;
-    }
-
-    /* No more writable mappings of this page, please */
-    pg->shadow_flags &= ~SHF_oos_may_write;
-
-    /* Update the shadows with current guest entries. */
-    _sh_resync_l1(v, gmfn, snp);
-
-    /* Now we know all the entries are synced, and will stay that way */
-    pg->shadow_flags &= ~SHF_out_of_sync;
-    perfc_incr(shadow_resync);
-    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
-}
-
-
-/* Add an MFN to the list of out-of-sync guest pagetables */
-static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
-{
-    int i, idx, oidx, swap = 0;
-    mfn_t *oos = v->arch.paging.shadow.oos;
-    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
-    struct oos_fixup fixup = { .next = 0 };
-
-    for (i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-        fixup.smfn[i] = INVALID_MFN;
-
-    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-    oidx = idx;
-
-    if ( !mfn_eq(oos[idx], INVALID_MFN)
-         && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
-    {
-        /* Punt the current occupant into the next slot */
-        SWAP(oos[idx], gmfn);
-        SWAP(oos_fixup[idx], fixup);
-        swap = 1;
-        idx = (idx + 1) % SHADOW_OOS_PAGES;
-    }
-    if ( !mfn_eq(oos[idx], INVALID_MFN) )
-    {
-        /* Crush the current occupant. */
-        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-        perfc_incr(shadow_unsync_evict);
-    }
-    oos[idx] = gmfn;
-    oos_fixup[idx] = fixup;
-
-    if ( swap )
-        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
-
-    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
-}
-
-/* Remove an MFN from the list of out-of-sync guest pagetables */
-static void oos_hash_remove(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    struct vcpu *v;
-
-    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            oos[idx] = INVALID_MFN;
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    mfn_t *oos_snapshot;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            return oos_snapshot[idx];
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-/* Pull a single guest page back into sync */
-void sh_resync(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    mfn_t *oos_snapshot;
-    struct oos_fixup *oos_fixup;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_fixup = v->arch.paging.shadow.oos_fixup;
-        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
-            oos[idx] = INVALID_MFN;
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-/* Figure out whether it's definitely safe not to sync this l1 table,
- * by making a call out to the mode in which that shadow was made. */
-static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
-{
-    struct page_info *pg = mfn_to_page(gl1mfn);
-    if ( pg->shadow_flags & SHF_L1_32 )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
-    else if ( pg->shadow_flags & SHF_L1_PAE )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
-    else if ( pg->shadow_flags & SHF_L1_64 )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
-           mfn_x(gl1mfn));
-    BUG();
-}
-
-
-/* Pull all out-of-sync pages back into sync.  Pages brought out of sync
- * on other vcpus are allowed to remain out of sync, but their contents
- * will be made safe (TLB flush semantics); pages unsynced by this vcpu
- * are brought back into sync and write-protected.  If skip != 0, we try
- * to avoid resyncing at all if we think we can get away with it. */
-void sh_resync_all(struct vcpu *v, int skip, int this, int others)
-{
-    int idx;
-    struct vcpu *other;
-    mfn_t *oos = v->arch.paging.shadow.oos;
-    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
-
-    SHADOW_PRINTK("%pv\n", v);
-
-    ASSERT(paging_locked_by_me(v->domain));
-
-    if ( !this )
-        goto resync_others;
-
-    /* First: resync all of this vcpu's oos pages */
-    for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        if ( !mfn_eq(oos[idx], INVALID_MFN) )
-        {
-            /* Write-protect and sync contents */
-            _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-            oos[idx] = INVALID_MFN;
-        }
-
- resync_others:
-    if ( !others )
-        return;
-
-    /* Second: make all *other* vcpus' oos pages safe. */
-    for_each_vcpu(v->domain, other)
-    {
-        if ( v == other )
-            continue;
-
-        oos = other->arch.paging.shadow.oos;
-        oos_fixup = other->arch.paging.shadow.oos_fixup;
-        oos_snapshot = other->arch.paging.shadow.oos_snapshot;
-
-        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        {
-            if ( mfn_eq(oos[idx], INVALID_MFN) )
-                continue;
-
-            if ( skip )
-            {
-                /* Update the shadows and leave the page OOS. */
-                if ( sh_skip_sync(v, oos[idx]) )
-                    continue;
-                trace_resync(TRC_SHADOW_RESYNC_ONLY, oos[idx]);
-                _sh_resync_l1(other, oos[idx], oos_snapshot[idx]);
-            }
-            else
-            {
-                /* Write-protect and sync contents */
-                _sh_resync(other, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-                oos[idx] = INVALID_MFN;
-            }
-        }
-    }
-}
-
-/* Allow a shadowed page to go out of sync. Unsyncs are traced in
- * multi.c:sh_page_fault() */
-int sh_unsync(struct vcpu *v, mfn_t gmfn)
-{
-    struct page_info *pg;
-
-    ASSERT(paging_locked_by_me(v->domain));
-
-    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
-
-    pg = mfn_to_page(gmfn);
-
-    /* Guest page must be shadowed *only* as L1 and *only* once when out
-     * of sync.  Also, get out now if it's already out of sync.
-     * Also, can't safely unsync if some vcpus have paging disabled.*/
-    if ( pg->shadow_flags &
-         ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
-         || sh_page_has_multiple_shadows(pg)
-         || !is_hvm_vcpu(v)
-         || !v->domain->arch.paging.shadow.oos_active )
-        return 0;
-
-    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_out_of_sync);
-    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_oos_may_write);
-
-    pg->shadow_flags |= SHF_out_of_sync|SHF_oos_may_write;
-    oos_hash_add(v, gmfn);
-    perfc_incr(shadow_unsync);
-    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_UNSYNC);
-    return 1;
-}
-
-#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
-
-
 /**************************************************************************/
 /* Code for "promoting" a guest page to the point where the shadow code is
  * willing to let it be treated as a guest page table.  This generally
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -0,0 +1,603 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/******************************************************************************
+ * arch/x86/mm/shadow/oos.c
+ *
+ * Shadow code dealing with out-of-sync shadows.
+ * Parts of this code are Copyright (c) 2006 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ */
+
+#include "private.h"
+
+#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
+
+#include <xen/trace.h>
+
+#include <asm/shadow.h>
+
+/*
+ * From time to time, we let a shadowed pagetable page go out of sync
+ * with its shadow: the guest is allowed to write directly to the page,
+ * and those writes are not synchronously reflected in the shadow.
+ * This lets us avoid many emulations if the guest is writing a lot to a
+ * pagetable, but it relaxes a pretty important invariant in the shadow
+ * pagetable design.  Therefore, some rules:
+ *
+ * 1. Only L1 pagetables may go out of sync: any page that is shadowed
+ *    at at higher level must be synchronously updated.  This makes
+ *    using linear shadow pagetables much less dangerous.
+ *    That means that: (a) unsyncing code needs to check for higher-level
+ *    shadows, and (b) promotion code needs to resync.
+ *
+ * 2. All shadow operations on a guest page require the page to be brought
+ *    back into sync before proceeding.  This must be done under the
+ *    paging lock so that the page is guaranteed to remain synced until
+ *    the operation completes.
+ *
+ *    Exceptions to this rule: the pagefault and invlpg handlers may
+ *    update only one entry on an out-of-sync page without resyncing it.
+ *
+ * 3. Operations on shadows that do not start from a guest page need to
+ *    be aware that they may be handling an out-of-sync shadow.
+ *
+ * 4. Operations that do not normally take the paging lock (fast-path
+ *    #PF handler, INVLPG) must fall back to a locking, syncing version
+ *    if they see an out-of-sync table.
+ *
+ * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
+ *    must explicitly resync all relevant pages or update their
+ *    shadows.
+ *
+ * Currently out-of-sync pages are listed in a simple open-addressed
+ * hash table with a second chance (must resist temptation to radically
+ * over-engineer hash tables...)  The virtual address of the access
+ * which caused us to unsync the page is also kept in the hash table, as
+ * a hint for finding the writable mappings later.
+ *
+ * We keep a hash per vcpu, because we want as much as possible to do
+ * the re-sync on the save vcpu we did the unsync on, so the VA hint
+ * will be valid.
+ */
+
+#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL
+void sh_oos_audit(struct domain *d)
+{
+    unsigned int idx, expected_idx, expected_idx_alt;
+    struct page_info *pg;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        {
+            mfn_t *oos = v->arch.paging.shadow.oos;
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
+                continue;
+
+            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
+            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
+            if ( idx != expected_idx && idx != expected_idx_alt )
+            {
+                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
+                       __func__, idx, mfn_x(oos[idx]),
+                       expected_idx, expected_idx_alt);
+                BUG();
+            }
+            pg = mfn_to_page(oos[idx]);
+            if ( !(pg->count_info & PGC_shadowed_pt) )
+            {
+                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
+                BUG();
+            }
+            if ( !(pg->shadow_flags & SHF_out_of_sync) )
+            {
+                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
+                BUG();
+            }
+            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
+            {
+                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
+                BUG();
+            }
+        }
+    }
+}
+#endif
+
+#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
+void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    struct vcpu *v;
+    mfn_t *oos;
+
+    ASSERT(mfn_is_out_of_sync(gmfn));
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+
+        if ( mfn_eq(oos[idx], gmfn) )
+            return;
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+#endif
+
+/* Update the shadow, but keep the page out of sync. */
+static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
+{
+    struct page_info *pg = mfn_to_page(gmfn);
+
+    ASSERT(mfn_valid(gmfn));
+    ASSERT(page_is_out_of_sync(pg));
+
+    /* Call out to the appropriate per-mode resyncing function */
+    if ( pg->shadow_flags & SHF_L1_32 )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
+    else if ( pg->shadow_flags & SHF_L1_PAE )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
+    else if ( pg->shadow_flags & SHF_L1_64 )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
+}
+
+static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
+                                            mfn_t smfn, unsigned long off)
+{
+    ASSERT(mfn_valid(smfn));
+    ASSERT(mfn_valid(gmfn));
+
+    switch ( mfn_to_page(smfn)->u.sh.type )
+    {
+    case SH_type_l1_32_shadow:
+    case SH_type_fl1_32_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
+            (d, gmfn, smfn, off);
+
+    case SH_type_l1_pae_shadow:
+    case SH_type_fl1_pae_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
+            (d, gmfn, smfn, off);
+
+    case SH_type_l1_64_shadow:
+    case SH_type_fl1_64_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
+            (d, gmfn, smfn, off);
+
+    default:
+        return 0;
+    }
+}
+
+/*
+ * Fixup arrays: We limit the maximum number of writable mappings to
+ * SHADOW_OOS_FIXUPS and store enough information to remove them
+ * quickly on resync.
+ */
+
+static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
+                                       struct oos_fixup *fixup)
+{
+    struct domain *d = v->domain;
+    int i;
+    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+    {
+        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
+        {
+            sh_remove_write_access_from_sl1p(d, gmfn,
+                                             fixup->smfn[i],
+                                             fixup->off[i]);
+            fixup->smfn[i] = INVALID_MFN;
+        }
+    }
+
+    /* Always flush the TLBs. See comment on oos_fixup_add(). */
+    return 1;
+}
+
+void oos_fixup_add(struct domain *d, mfn_t gmfn,
+                   mfn_t smfn,  unsigned long off)
+{
+    int idx, next;
+    mfn_t *oos;
+    struct oos_fixup *oos_fixup;
+    struct vcpu *v;
+
+    perfc_incr(shadow_oos_fixup_add);
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_fixup = v->arch.paging.shadow.oos_fixup;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            int i;
+            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+            {
+                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
+                     && (oos_fixup[idx].off[i] == off) )
+                    return;
+            }
+
+            next = oos_fixup[idx].next;
+
+            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
+            {
+                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
+
+                /* Reuse this slot and remove current writable mapping. */
+                sh_remove_write_access_from_sl1p(d, gmfn,
+                                                 oos_fixup[idx].smfn[next],
+                                                 oos_fixup[idx].off[next]);
+                perfc_incr(shadow_oos_fixup_evict);
+                /*
+                 * We should flush the TLBs now, because we removed a
+                 * writable mapping, but since the shadow is already
+                 * OOS we have no problem if another vcpu write to
+                 * this page table. We just have to be very careful to
+                 * *always* flush the tlbs on resync.
+                 */
+            }
+
+            oos_fixup[idx].smfn[next] = smfn;
+            oos_fixup[idx].off[next] = off;
+            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
+
+            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
+                                   struct oos_fixup *fixup)
+{
+    struct domain *d = v->domain;
+    int ftlb = 0;
+
+    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);
+
+    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
+    {
+    default:
+    case 0:
+        break;
+
+    case 1:
+        ftlb |= 1;
+        break;
+
+    case -1:
+        /*
+         * An unfindable writeable typecount has appeared, probably via a
+         * grant table entry: can't shoot the mapping, so try to unshadow
+         * the page.  If that doesn't work either, the guest is granting
+         * his pagetables and must be killed after all.
+         * This will flush the tlb, so we can return with no worries.
+         */
+        shadow_remove_all_shadows(d, gmfn);
+        return 1;
+    }
+
+    if ( ftlb )
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
+
+    return 0;
+}
+
+static inline void trace_resync(int event, mfn_t gmfn)
+{
+    if ( tb_init_done )
+    {
+        /* Convert gmfn to gfn */
+        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
+
+        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
+    }
+}
+
+/* Pull all the entries on an out-of-sync page back into sync. */
+static void _sh_resync(struct vcpu *v, mfn_t gmfn,
+                       struct oos_fixup *fixup, mfn_t snp)
+{
+    struct page_info *pg = mfn_to_page(gmfn);
+
+    ASSERT(paging_locked_by_me(v->domain));
+    ASSERT(mfn_is_out_of_sync(gmfn));
+    /* Guest page must be shadowed *only* as L1 when out of sync. */
+    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
+             & ~SHF_L1_ANY));
+    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
+
+    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
+
+    /* Need to pull write access so the page *stays* in sync. */
+    if ( oos_remove_write_access(v, gmfn, fixup) )
+    {
+        /* Page has been unshadowed. */
+        return;
+    }
+
+    /* No more writable mappings of this page, please */
+    pg->shadow_flags &= ~SHF_oos_may_write;
+
+    /* Update the shadows with current guest entries. */
+    _sh_resync_l1(v, gmfn, snp);
+
+    /* Now we know all the entries are synced, and will stay that way */
+    pg->shadow_flags &= ~SHF_out_of_sync;
+    perfc_incr(shadow_resync);
+    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
+}
+
+/* Add an MFN to the list of out-of-sync guest pagetables */
+static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
+{
+    int i, idx, oidx, swap = 0;
+    mfn_t *oos = v->arch.paging.shadow.oos;
+    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
+    struct oos_fixup fixup = { .next = 0 };
+
+    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+        fixup.smfn[i] = INVALID_MFN;
+
+    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+    oidx = idx;
+
+    if ( !mfn_eq(oos[idx], INVALID_MFN)
+         && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
+    {
+        /* Punt the current occupant into the next slot */
+        SWAP(oos[idx], gmfn);
+        SWAP(oos_fixup[idx], fixup);
+        swap = 1;
+        idx = (idx + 1) % SHADOW_OOS_PAGES;
+    }
+    if ( !mfn_eq(oos[idx], INVALID_MFN) )
+    {
+        /* Crush the current occupant. */
+        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+        perfc_incr(shadow_unsync_evict);
+    }
+    oos[idx] = gmfn;
+    oos_fixup[idx] = fixup;
+
+    if ( swap )
+        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
+
+    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
+}
+
+/* Remove an MFN from the list of out-of-sync guest pagetables */
+void oos_hash_remove(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    struct vcpu *v;
+
+    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            oos[idx] = INVALID_MFN;
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    mfn_t *oos_snapshot;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            return oos_snapshot[idx];
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+/* Pull a single guest page back into sync */
+void sh_resync(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    mfn_t *oos_snapshot;
+    struct oos_fixup *oos_fixup;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_fixup = v->arch.paging.shadow.oos_fixup;
+        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
+            oos[idx] = INVALID_MFN;
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+/*
+ * Figure out whether it's definitely safe not to sync this l1 table,
+ * by making a call out to the mode in which that shadow was made.
+ */
+static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
+{
+    struct page_info *pg = mfn_to_page(gl1mfn);
+    if ( pg->shadow_flags & SHF_L1_32 )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
+    else if ( pg->shadow_flags & SHF_L1_PAE )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
+    else if ( pg->shadow_flags & SHF_L1_64 )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
+           mfn_x(gl1mfn));
+    BUG();
+}
+
+/*
+ * Pull all out-of-sync pages back into sync.  Pages brought out of sync
+ * on other vcpus are allowed to remain out of sync, but their contents
+ * will be made safe (TLB flush semantics); pages unsynced by this vcpu
+ * are brought back into sync and write-protected.  If skip != 0, we try
+ * to avoid resyncing at all if we think we can get away with it.
+ */
+void sh_resync_all(struct vcpu *v, int skip, int this, int others)
+{
+    int idx;
+    struct vcpu *other;
+    mfn_t *oos = v->arch.paging.shadow.oos;
+    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
+
+    SHADOW_PRINTK("%pv\n", v);
+
+    ASSERT(paging_locked_by_me(v->domain));
+
+    if ( !this )
+        goto resync_others;
+
+    /* First: resync all of this vcpu's oos pages */
+    for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        if ( !mfn_eq(oos[idx], INVALID_MFN) )
+        {
+            /* Write-protect and sync contents */
+            _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+            oos[idx] = INVALID_MFN;
+        }
+
+ resync_others:
+    if ( !others )
+        return;
+
+    /* Second: make all *other* vcpus' oos pages safe. */
+    for_each_vcpu(v->domain, other)
+    {
+        if ( v == other )
+            continue;
+
+        oos = other->arch.paging.shadow.oos;
+        oos_fixup = other->arch.paging.shadow.oos_fixup;
+        oos_snapshot = other->arch.paging.shadow.oos_snapshot;
+
+        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        {
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
+                continue;
+
+            if ( skip )
+            {
+                /* Update the shadows and leave the page OOS. */
+                if ( sh_skip_sync(v, oos[idx]) )
+                    continue;
+                trace_resync(TRC_SHADOW_RESYNC_ONLY, oos[idx]);
+                _sh_resync_l1(other, oos[idx], oos_snapshot[idx]);
+            }
+            else
+            {
+                /* Write-protect and sync contents */
+                _sh_resync(other, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+                oos[idx] = INVALID_MFN;
+            }
+        }
+    }
+}
+
+/*
+ * Allow a shadowed page to go out of sync. Unsyncs are traced in
+ * multi.c:sh_page_fault()
+ */
+int sh_unsync(struct vcpu *v, mfn_t gmfn)
+{
+    struct page_info *pg;
+
+    ASSERT(paging_locked_by_me(v->domain));
+
+    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
+
+    pg = mfn_to_page(gmfn);
+
+    /*
+     * Guest page must be shadowed *only* as L1 and *only* once when out
+     * of sync.  Also, get out now if it's already out of sync.
+     * Also, can't safely unsync if some vcpus have paging disabled.
+     */
+    if ( pg->shadow_flags &
+         ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
+         || sh_page_has_multiple_shadows(pg)
+         || !is_hvm_vcpu(v)
+         || !v->domain->arch.paging.shadow.oos_active )
+        return 0;
+
+    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_out_of_sync);
+    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_oos_may_write);
+
+    pg->shadow_flags |= SHF_out_of_sync|SHF_oos_may_write;
+    oos_hash_add(v, gmfn);
+    perfc_incr(shadow_unsync);
+    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_UNSYNC);
+    return 1;
+}
+
+#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -452,6 +452,7 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
 /* Pull an out-of-sync page back into sync. */
 void sh_resync(struct domain *d, mfn_t gmfn);
 
+void oos_hash_remove(struct domain *d, mfn_t gmfn);
 void oos_fixup_add(struct domain *d, mfn_t gmfn, mfn_t smfn, unsigned long off);
 
 /* Pull all out-of-sync shadows back into sync.  If skip != 0, we try
@@ -477,6 +478,7 @@ shadow_sync_other_vcpus(struct vcpu *v)
     sh_resync_all(v, 1 /* skip */, 0 /* this */, 1 /* others */);
 }
 
+void sh_oos_audit(struct domain *d);
 void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn);
 mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn);
 


