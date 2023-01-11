Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13020665D17
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:54:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475351.737022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbYI-0005vw-PJ; Wed, 11 Jan 2023 13:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475351.737022; Wed, 11 Jan 2023 13:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbYI-0005t9-LE; Wed, 11 Jan 2023 13:54:02 +0000
Received: by outflank-mailman (input) for mailman id 475351;
 Wed, 11 Jan 2023 13:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbYG-0004QI-RZ
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:54:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2051.outbound.protection.outlook.com [40.107.13.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 653476f0-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:53:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:53:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:53:57 +0000
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
X-Inumbo-ID: 653476f0-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0w5MUipcezPpMUOlCjSz2ReCrpCgkG9lPNmv3iD7VmzNEWNdmJLYZtq+XQLEOkOlFXpEI9Hei1gleUCfdjCcgeV+2QtyWyFhdhGlxSOmsE7DIQ/3TTW5rnEadV+sG8sp+ahqRpvmiOoVndK3M6eD4o+YEVMTCFhMLgqbf0OxmRB/q0tZxSJdF9Uo3nDr0wOX7kyGxhmORKbrxYUAYBXrd2m4N8fNgR1MjwAiMn7vSvi1ktJwPldr/z9mDoP8qo29HW7YYADRyPm79vtciKYE2EWuzzFoscOKVXHYsf/7LjoAY60TuENiJdHygt3Dzpc58O2PAmwPnlp0gixrgcJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0kOuEOlEby+rFnQkiCiFwCOaJzxSnerJCBJ3RDmWQU=;
 b=Z6ElVhyAMUi/UwJCJs0O1u01DefWMHCUB6Orz4joRz3nsuR+7CSxK48xhD1mD28p+VrJ+yeTxgQyDIyxoWJhXBAgRT8WXr/MGmqcjMsbFCcebXkS03u8RXwtxpz82tQz46+96qqZNlKeBI5KEILWpcNCymTESy7jLHDAQBcHKQa2+hK2qoL3LRJuiQTVHD161KIm8RcKA7cKo+XuzcGeabWUIXaePO8kwDzhCvBps/d7Qa3aXgReAO79veKISZbe6wFWU85y8B8S6yyDoFeZ7KXDsJH0S87eK5nsbEqcsjc77YYSa+jPdF9R9gF6TlQ5tX0brDIpOxHQ2nRV4+RvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0kOuEOlEby+rFnQkiCiFwCOaJzxSnerJCBJ3RDmWQU=;
 b=D+iPzFj9uOvdTyzl/BAlIXp31Pl3eVfEUU3POWmMLcWWE0UDYEutYc2eyAsDd/peGUk91ys93mLbgvkQsoyJrrP9idcDJT09Tq9f7d0z/mFQA9kBn5R7gM0p8BeWrQ8iJ3KII1rdM3kuyq/S1VNsLQqdK6/OovgD+0EgD883JmubfcbeeZ4+BI3ddE7zWhuRP5xE+BnfnqF65O8cnjnpT3uHscJj3OEz6MXv3+gJR76/CBNiLxapS3mjNQ/dGdUG0kJcH+pDgFNquheRhx44ZLnruPY55/seIrfrf9vIncUTeXycddt2kPj+FVNZkhU8SSpZbHbI7SPO2zzAQCLQCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd8028ec-3188-3422-881e-28a3a6d8451c@suse.com>
Date: Wed, 11 Jan 2023 14:53:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 4/9] x86/shadow: drop a few uses of mfn_valid()
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
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb18629-2864-4b6a-72c9-08daf3db48e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HeLBCjs5tZLaz/qQDn4lvkeEN/9Cdqa8kSMhZ4egsF5HzfvJUHan2fT2Qr2uW4F6Dg06aUVRBT0md5Ubu2dE2dbt7XY2M+fgJBuPHjg7S6Zt84zfkma2wQX7kf5dkk9zmjryw2srlxX6OUUvOi3/C4tHIubAfX9Nc7gYEYMrMOIGUroUcHHkzd9Ipqd92wM3PDgQ61tNY981XLpk5nqgJiXJAQQdWCuVs4LdWCZsP9Z+CK1aEmmmFyLUplg7YTkyORoZsgvYBoFiMrD9mS/UVe3zRjsRq76eIbPKKwwgfC0mkGkcsS/eGA3/QugG5SHukS88rL0zU7ZLoQaFnr7Sv4KiWbSpQNnNc3+KvHMcAqaSJ+N4rGxZRpqmWH6ifWlKN2Jr7ZtKa3cIVZmer+p3AlktquNgHDle7PoLt2T4rCuMBhGnFjyMO6YW6aksn55wT6npZ4g+6FbI/5RIwHU7Kw4c7zq0SzPROkvYn5/2rn+wUo7YLzRZMmQ2DAmcgkNVnKjBd2gU96wxDUngSy05ydKGwS0RoqLBomr24MudNBgBLl/FCFrqCQ8V10iaey80GgpULBzDokB1iZ4YBotoH3w/uPv/IVV17aby4cTf4c/8eY2sBcL9+GPS4Y/HSo5bR9wiRvKSIbjH6ueTw9CnyVaJEHIITnpTUPfkd7IiAzufF4VX362Moy1aWdaacuHQFmLFkC+f8EUbW7DnonXvHCL+Prq/Be8TkMdc0RoSQJk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnl2Ykd5ZUliTlh3cU1GbkFuQ2hlcTJDL1JnMUdGVHNtVCs5SG5MS2hrY0gx?=
 =?utf-8?B?TkR3WWR3SGhNWVFwWDJ4dDBuVVhaOHAvYXR2dTBZQkNCRmQ5cWdmcmlFaFBQ?=
 =?utf-8?B?bW1uUTROaEhCT3pycGRVWExGN0RTL2NxU2dDaFhlQUZuZ3RUUFE2TVhFNUcz?=
 =?utf-8?B?OTdRSi8reGIvU09sS2tIcUQxV1R5UTV1aWlkVVNYWXFFODA3em91WTNsckJr?=
 =?utf-8?B?QWt1UUdXVGppa3kzZ1VzWFM5L0RHcHY2MUlKYURtSlg5aUxzc2dvTEZoa3RJ?=
 =?utf-8?B?c2ZiL0duZGxuUXFzZkhXd1ArU1hkZGVOL2J0a3pxRTl5V2lBdWNXZDdLZHJt?=
 =?utf-8?B?QWZhdmR2ZHBMWWJKNks5NEErMkJCcExVZzd3TmsyZ0pHRTBSdENpcExEUTY2?=
 =?utf-8?B?V1pTd2JxVWlHaWd3U2NtbnBRTkQ2eHl5M0VneHdXMTI3MzFlUFFzN0wyV2I1?=
 =?utf-8?B?N3N1bkJiaUNXSDkvNDdRbkhBdW1NWjd0SDRkV3ZvUnlRTWFKOXFFUzhBUDRL?=
 =?utf-8?B?MllOQ2ZRVURlTVpvMWw4YitJZFZLcE9mRmU3OG52VC9FNi90MTF5VzFPcEpt?=
 =?utf-8?B?cElCQlpOY2kxRi9LeHZXR2pRQkJTTHFKSzNkdUd1S2pZbEpCaUN3dWV5SnlW?=
 =?utf-8?B?ZDZPalROeGNnYzNQYnBGSFVwQU5uakFWeDl0djgyWTFmUDIvdlptVHRYbER3?=
 =?utf-8?B?dnI4M1Bld2pYcmx2UXJITzY2SVlIWEVPN2x1NExhVFk1Q2gyMVZHZmF1bUVQ?=
 =?utf-8?B?Uitwdkx0cmJKT2hzZGJGRFFxVzNQelFvdEpFdFppc3ZVNkpmLy9sdzdWU09F?=
 =?utf-8?B?d215MHdjRHBneEZtdUowZ2hvRkpuQWVFUFRiYUZaVE1LZHpkYlhqMXRuRVgv?=
 =?utf-8?B?OWdGTGVHNGRaK3BORWpPcGczbEZia21TTnhGTVhoQWNKTTFXdURWZ1FrQ0Z2?=
 =?utf-8?B?amxuck0vREEwLzhscEZkZytGYW1sQ1VrWjhSWnAwYUY5VkRGbllWLzFBYVBF?=
 =?utf-8?B?UnhmL2hWWURvdWQ2ZE5RN2tJRmkyK2VBRmxQSkxRMGhjRXdSWXZTTW5wbStK?=
 =?utf-8?B?MzlPNUMzYnRLOG85dkxPN1RSeEN2SG9YN1FMNXVvR0dVN0NtTUhlYVdEOHE5?=
 =?utf-8?B?QU5Oek9IZkZaMEM1MmFLNytaN3pBb0t3ZDVHN3g3ZFZMZisvL3docnFEajdx?=
 =?utf-8?B?bjVQdEZKcDZZLytPWk1QcWtSRk9wUDlDYlp1SUxVRkF2SnVTS3JYM1R4VEZW?=
 =?utf-8?B?dkk2NjBaWlVoNGdnaFk2MXB4TWROUVQ4VFpWSmR3N1hEQzZkbWFMKzd3cDl2?=
 =?utf-8?B?NGdlMzUra1lub1NGNmFTYXZ1KzBqSjFRQThRcHQyMzJWclJPc3NvYmNzeG5y?=
 =?utf-8?B?eGtlY05Qdk1qblBSTXg3MXBhVHNvQTRsS1dqcjJIU3dYb2tCN1QrTjJYNzN4?=
 =?utf-8?B?TU1wOS9EanpwNGRoQlhuSm5LQXFOREtGd3VPZHlXT3FwemRvcjJ0NWlrVXpa?=
 =?utf-8?B?RWY2MmgreXJxYitaV05XdHB2Tmo3YmZadXMyZlcxaXhycHlSWHYraUlNdERC?=
 =?utf-8?B?SGV0TFpZVXhjU2lnWSs1YldNem9NRWVtL0RiaU5ra3l1WFp5M0JwN2haUW9y?=
 =?utf-8?B?eUw3eWFzZlY4Q0dSQkkrV1lxMXNWbGtQVmZhMkJHTXlLSXhqRkxyZ2wwUWlQ?=
 =?utf-8?B?U0RTam11Q00xWHVIMHZpcWlVMktsVUZsMWxhOU9lT3Q0SERKUVhoV2RBS3c5?=
 =?utf-8?B?ZkFFaE5MVkRKUDRHeUN0cTFGSTFvSFUydi9RWm9DQmpXOVRXa0dOVmxxSG9y?=
 =?utf-8?B?dDQ5a1FzT2c0V1BUREVsWDRoUzJ4cEpzYklnbFA5QmNCckV3NW5vR0k4cldl?=
 =?utf-8?B?OGRiUjlHM28yQi9MaGZJaVhldlllL2JPUUYrMnMxaCtLNlExenpnU2EvZmhi?=
 =?utf-8?B?OUV6QkRHL1ZHS2lNWEpnV3ZSNHBjUDZDNUZtSEJ6a2R3U0YrRCtiSmdqLzJK?=
 =?utf-8?B?MHhycFNsNTVHWUhlWU1BZStnNjYySlhmNzNnNUpxQmNrME1XaEpXNlAyNnE1?=
 =?utf-8?B?ZXQ0TGJaa3VPNUMvMDRqbjdCUE1QVU4wZDY3MDZjQU5FQ01pZDlDMDJEbjBr?=
 =?utf-8?Q?wb8CzMJUXneG6IIDT0sm82yoL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb18629-2864-4b6a-72c9-08daf3db48e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:53:57.3733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdZUxOQLlrgiCcJthcHQjk82pY9X6E/noJvMiC7aCIPAwcRaIVAlDxqWnDHzLPf60dASdU8f+U646z5H7AyNeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

v->arch.paging.shadow.shadow_table[], v->arch.paging.shadow.oos[],
v->arch.paging.shadow.oos_{snapshot[],fixup[].smfn[]} as well as the
hash table are all only ever written with valid MFNs or INVALID_MFN.
Avoid the somewhat expensive mfn_valid() when checking MFNs coming from
these arrays.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There are many more uses which can likely be replaced, but I think we're
better off doing this in piecemeal fashion.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -171,7 +171,7 @@ static void sh_oos_audit(struct domain *
         for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
         {
             mfn_t *oos = v->arch.paging.shadow.oos;
-            if ( !mfn_valid(oos[idx]) )
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
                 continue;
 
             expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
@@ -327,8 +327,7 @@ void oos_fixup_add(struct domain *d, mfn
             int i;
             for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
             {
-                if ( mfn_valid(oos_fixup[idx].smfn[i])
-                     && mfn_eq(oos_fixup[idx].smfn[i], smfn)
+                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
                      && (oos_fixup[idx].off[i] == off) )
                     return;
             }
@@ -461,7 +460,7 @@ static void oos_hash_add(struct vcpu *v,
     idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
     oidx = idx;
 
-    if ( mfn_valid(oos[idx])
+    if ( !mfn_eq(oos[idx], INVALID_MFN)
          && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
     {
         /* Punt the current occupant into the next slot */
@@ -470,8 +469,8 @@ static void oos_hash_add(struct vcpu *v,
         swap = 1;
         idx = (idx + 1) % SHADOW_OOS_PAGES;
     }
-    if ( mfn_valid(oos[idx]) )
-   {
+    if ( !mfn_eq(oos[idx], INVALID_MFN) )
+    {
         /* Crush the current occupant. */
         _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
         perfc_incr(shadow_unsync_evict);
@@ -607,7 +606,7 @@ void sh_resync_all(struct vcpu *v, int s
 
     /* First: resync all of this vcpu's oos pages */
     for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        if ( mfn_valid(oos[idx]) )
+        if ( !mfn_eq(oos[idx], INVALID_MFN) )
         {
             /* Write-protect and sync contents */
             _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
@@ -630,7 +629,7 @@ void sh_resync_all(struct vcpu *v, int s
 
         for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
         {
-            if ( !mfn_valid(oos[idx]) )
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
                 continue;
 
             if ( skip )
@@ -2183,7 +2182,7 @@ void sh_remove_shadows(struct domain *d,
          !(pg->shadow_flags & (1 << t)) )                               \
         break;                                                          \
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), t);                       \
-    if ( unlikely(!mfn_valid(smfn)) )                                   \
+    if ( unlikely(mfn_eq(smfn, INVALID_MFN)) )                          \
     {                                                                   \
         printk(XENLOG_G_ERR "gmfn %"PRI_mfn" has flags %#x"             \
                " but no type-%#x shadow\n",                             \
@@ -2751,7 +2750,7 @@ void shadow_teardown(struct domain *d, b
             int i;
             mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
             for ( i = 0; i < SHADOW_OOS_PAGES; i++ )
-                if ( mfn_valid(oos_snapshot[i]) )
+                if ( !mfn_eq(oos_snapshot[i], INVALID_MFN) )
                 {
                     shadow_free(d, oos_snapshot[i]);
                     oos_snapshot[i] = INVALID_MFN;
@@ -2934,7 +2933,7 @@ static int shadow_one_bit_disable(struct
                 int i;
                 mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
                 for ( i = 0; i < SHADOW_OOS_PAGES; i++ )
-                    if ( mfn_valid(oos_snapshot[i]) )
+                    if ( !mfn_eq(oos_snapshot[i], INVALID_MFN) )
                     {
                         shadow_free(d, oos_snapshot[i]);
                         oos_snapshot[i] = INVALID_MFN;
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -110,7 +110,7 @@ get_fl1_shadow_status(struct domain *d,
 /* Look for FL1 shadows in the hash table */
 {
     mfn_t smfn = shadow_hash_lookup(d, gfn_x(gfn), SH_type_fl1_shadow);
-    ASSERT(!mfn_valid(smfn) || mfn_to_page(smfn)->u.sh.head);
+    ASSERT(mfn_eq(smfn, INVALID_MFN) || mfn_to_page(smfn)->u.sh.head);
     return smfn;
 }
 
@@ -2680,7 +2680,7 @@ static int cf_check sh_page_fault(
                 mfn_t smfn = pagetable_get_mfn(
                                  v->arch.paging.shadow.shadow_table[i]);
 
-                if ( mfn_valid(smfn) && (mfn_x(smfn) != 0) )
+                if ( mfn_x(smfn) )
                 {
                     used |= (mfn_to_page(smfn)->v.sh.back == mfn_x(gmfn));
 
@@ -3824,7 +3824,7 @@ static void cf_check sh_pagetable_dying(
                    : shadow_hash_lookup(d, mfn_x(gmfn), SH_type_l2_pae_shadow);
         }
 
-        if ( mfn_valid(smfn) )
+        if ( !mfn_eq(smfn, INVALID_MFN) )
         {
             gmfn = _mfn(mfn_to_page(smfn)->v.sh.back);
             mfn_to_page(gmfn)->pagetable_dying = true;
@@ -3867,7 +3867,7 @@ static void cf_check sh_pagetable_dying(
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), SH_type_l4_64_shadow);
 #endif
 
-    if ( mfn_valid(smfn) )
+    if ( !mfn_eq(smfn, INVALID_MFN) )
     {
         mfn_to_page(gmfn)->pagetable_dying = true;
         shadow_unhook_mappings(d, smfn, 1/* user pages only */);
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -769,8 +769,10 @@ get_shadow_status(struct domain *d, mfn_
 /* Look for shadows in the hash table */
 {
     mfn_t smfn = shadow_hash_lookup(d, mfn_x(gmfn), shadow_type);
-    ASSERT(!mfn_valid(smfn) || mfn_to_page(smfn)->u.sh.head);
+
+    ASSERT(mfn_eq(smfn, INVALID_MFN) || mfn_to_page(smfn)->u.sh.head);
     perfc_incr(shadow_get_shadow_status);
+
     return smfn;
 }
 


