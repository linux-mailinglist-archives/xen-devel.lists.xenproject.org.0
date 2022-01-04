Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2072E483F5F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253118.434178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gRi-0004a5-BR; Tue, 04 Jan 2022 09:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253118.434178; Tue, 04 Jan 2022 09:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gRi-0004Xo-7s; Tue, 04 Jan 2022 09:49:34 +0000
Received: by outflank-mailman (input) for mailman id 253118;
 Tue, 04 Jan 2022 09:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gRg-0003gL-T4
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:49:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9db13e11-6d43-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:49:32 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-Ck4OqX7YOq6lAnU2hsquOA-1; Tue, 04 Jan 2022 10:49:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 09:49:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:49:28 +0000
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
X-Inumbo-ID: 9db13e11-6d43-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EubbiLSoJ7gBkAT814XkFnEd7VOT3g+5pVKJpSG0l1c=;
	b=LjD5fV7nVxal/vZMNpxu+3XzUrZxVzIQRALfkNCoUjS29hFCumUl+ll5qXKrD/7QNqk7+N
	W9gUojIaed6RCA4ECdMIxXyzBVhvaY+TEXex8AT9fMd7UXz4vjiaHAlpKZ0U9rRUEgVXap
	J3d3fwPyUE6VzU02FwFABPjKg2VDJq0=
X-MC-Unique: Ck4OqX7YOq6lAnU2hsquOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KswNQ733G5AG0qTy7/Ks91J6+NIyOnIY0cyvVRRdGE7+F3OnDssVSEOH+X6vCNGC5FxwKBoRtctSC0sqJANRVTumXudNxZ79isUP3aSfQXtHcSuQUbGyhjf7f8pIFSmNa3/VP0c9jTZockfpkSKbj3R2wodWt5fqGQfKXiZ4F0cvt+BcZzTeZ9Q+e7vQKFS69gwHJaTGlZKKirqZyJEdyWn336c9INH9hF/O6yywtPnlcDC7NWVB417IsZqEU4UelSqDV9UY94dxyH/CLCPmD++ckOH2x9Th/aMYTRBV0efeOnGMai6KAWGEByqTYYpQOzCBuHN4GZ0CzSX6tr902Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EubbiLSoJ7gBkAT814XkFnEd7VOT3g+5pVKJpSG0l1c=;
 b=Sk/uAZpaHlWrsvY7yXbMbuNMeJdqKVZ2V1MlHhK+aM3T6aofESwMINZEvbxgCCpNkomW2O4MRIAe9HNF3twlaUIfbB8CbzE6jnmkTH31YqgkXnQiK3hJuWEC3LBsMhdIdHGX0DG38Wf7qEecsRuBYR+FvS/1goZs/2YPeAoDCYI/r2EIi+Gu0dx3YQa93bNBkEDFxdHXkraGG0uhsDBgQCajKrauki3DBK2GCpfDNvlhKLxmP4Os1Siwvfk0G78/7NVjwI7042UL5YhzYQmibFqSbwcHs2cNxxXnxCN/LMnuNbeWYrXQ1UZDiq7S/Y+eQ+4IPI40cU1l71fkPWo4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com>
Date: Tue, 4 Jan 2022 10:49:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change() should
 honor present page order
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
In-Reply-To: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2265aa29-24da-4215-521c-08d9cf677fc7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608187F7A14A8F11C8DBC4EB34A9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CeMFi/pFQ8t27qxHfdIk3Vti9YdjqmN7QJQ9NHMVhiQpXBE2et9MLuLjCNW0OeY9TH0iEpMxT/IFcV8/1EL0dzrmssT0OoFrG/F4KOxUEt3TbTeOH1CQt/lmxccKP7r94Obh0o5+S+SDmOsMbJXMUs6ARApLAPi5zk3wnrYcuMUghlnysNjCN9YKxgmjWTphAUi6bMTp6dPxxKhBIwsPABF5/ak8DdOsjh8CL9BTJ5/x6b3E/q7huGNXuvj6eZwj99wbsQan7P3sHMEeU8h/1zh4EiLtJ2TeHlbTVwEQit54JylJdwo7Ca1Nrqff/8jrUr5Lfa2o0s/s8VXfqNnrEp6sew4QSCUT9PIH70Tso0EF6Zh8SDXbZPJM+64Cb4rXKKa+A97ncu8c89evgEIZTxjUVLTpT+7M4VnurnUHLYSt3e1iAdUj7ZfMrpZ7sxpQ3bRAy+H/5dZmCU52ndkwpsazxR+8sVJuomemGAlkhPD2V32pjXL9jrMvZWHT7N9N9YIt56cmYVFUW6TYmlJ2cTEmIfWG2qXC2NQojPtuiMYIzTAjqxvd2DFiSmuCaqDfkt4hzGdRgBy3fkiU6BtOfa2dNIpFwA5slqcUhNoyw/LyVFxv5xiAcrQXeOtw0M8qdUCH+ssBMawEABoaCGgOn5XxuXqldqEM4EkwV0gSjv75QJo+FML9+5mBFyqAbElWfCyntOiHJXP40Xqsk6gSbR15nPmpr1riix7Ko8YT7IMERmSUPxKO9KLy1nhDMyOS96D6R2GtXNwiEWrhr5Rmvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(316002)(6512007)(5660300002)(31696002)(6506007)(8936002)(86362001)(66476007)(8676002)(66946007)(4326008)(36756003)(66556008)(2616005)(186003)(31686004)(6916009)(38100700002)(54906003)(6486002)(83380400001)(6666004)(26005)(2906002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzdwQ0Z1ZnJyM05LUjh5UTNNdUt3QytqdVVTYTFJcTNXaFFtVlBTUDU5UTE0?=
 =?utf-8?B?bEJCUmg2V3JkNlhvbDVtdU9KeDM2bG9YQTVoZmR0ZnovNGxIbVpqbVJSNkxk?=
 =?utf-8?B?WjdScml2TzFvMkpXM2NET0h4Y3MxZTdKdndVMStrVnNsd1pjY2NmRGNGU2JC?=
 =?utf-8?B?ZElaNEpHdnZkQkhBMnJyWUZyMTl2aXByWlhVRVkveE90UjZYZ3UxUVZhSnc2?=
 =?utf-8?B?N1dDMW50dk5YeUduQ0VBUGZFZWZzTHdVVnBIUk5acllnME12dkFSRG9aK1Fo?=
 =?utf-8?B?dmRhbnhuV1lvOEd3YmxTdkpnMWhMZ2lMQjFlcG1BQ0JDaDNRQzZOU283Y20r?=
 =?utf-8?B?NUI1TFF6WU9idE9JdjVJbStmMzJsRjQvYXFoZzJvSTd6VjU4VzVyQ3FpYTZv?=
 =?utf-8?B?U1lCdENPcSsvUVhtNHkraVZKcGg4YllyQ0JlTm03WXhrTm0wM05zN2NTVVFI?=
 =?utf-8?B?SXFjNUZ3WEpvWFJNZnRRYTdhM0J6Y1N0ZGUyMktqYU9MS3hybDcyK2hsMTRh?=
 =?utf-8?B?a1RJWXhjYzdHUnhhaEZEZDAyRUlqN0RUZGZXTTlYMmlyUnRoYlkyQUJ0NlVh?=
 =?utf-8?B?STAzdi81K1dCSmhOUHA3eGl3cVlYamw0NHhFY0Z1dmVkMXhzNklSclg1TE9N?=
 =?utf-8?B?dTFSeGRPczJpRytYanRIbGVWM3A0d1hWOUpuZWZHMDJUS2ZXTW1uclRzcHcw?=
 =?utf-8?B?OWF6SGhlanNqcTc0YThGYlF4UXVSQkc0bnV3NzVLZTE5NDlzcFVvZEl2b0h2?=
 =?utf-8?B?bTVTOUMwNHlSeUVZMmhrajVjbnZmS0dkOWdCTmN5ckJaZzVNZU1EVkcyVURP?=
 =?utf-8?B?WjkvZ3VnRnJtLzU4OEh0ZjdDYy85dE5Bd241VW5mTDJFT1JuVlo0Mm1hd1hl?=
 =?utf-8?B?U3kwYWExNW56NW9Cd0NmT2xTS3hMWUtEWTFNRURsNDA2ZnU1YnBWeEV0K2tO?=
 =?utf-8?B?cXRETFE2TUpMc1M3U3A3blBYWmdtdVhJRTNrQlE2WjNDQlNNcGpSWWYvWjVB?=
 =?utf-8?B?SWtvRU5XUWhvbGhSTmZlbC92Y1BrODNqNTNsYVVyZzMxbjB0K0IxRFVJejMz?=
 =?utf-8?B?NVdWd1A0RWt0TXRzWHNxNGpsekxzWC8zQkVnNnJ6QmJaKzErcXR0Y0RWR1M2?=
 =?utf-8?B?cmZGRjlLNkhMYStST3FyejhHTmlYcWVkSkg0OXhaVnlsazlWQW1XL0hVRG94?=
 =?utf-8?B?OXdOcmgyMnUyVnQ5b2l3c1ZnMDNYbEh2UVFTN1pvQlBhdVVlTnVFY1NVTitM?=
 =?utf-8?B?WVkyNElYc09ac3A0SjNMUXN5Q2ZmUjBLbEhYVUQxdzFSaU5FVEloNHB1QXpk?=
 =?utf-8?B?djYwRHpBcWpNSlQ5NlJBVlk4bzQrQ1FxZEhVakhMV2x6bVYyZDlqd3BMRWJl?=
 =?utf-8?B?LzFjUlVEYjEzbkVCWVNKVHZmTlR4THBJcHFUYnM2RFlheTZ3N3o4YjZ4U2R0?=
 =?utf-8?B?NUV5ekpkWE5PRzlPV3BMWXFYK0N1VnJpKzN1KzlhQ0t2V3JxdkZ6ODBkUGNr?=
 =?utf-8?B?OW1ZVkI2bWlYSFJadlEyZFNjd0Jta2ZpZytYRi91enB1YitPWi9GU1RkUWhD?=
 =?utf-8?B?VVR2V1VKcVV0WThmSjlxOXZ3NitHcmhJY1JGODNTd2o4MnpCUVJGNmxOMjNJ?=
 =?utf-8?B?Z3lyblVaZThvanM3aVQ2Vlk3TUcxYnN4NklpOVJ0cVRoZE50UXJoUkppZHZ0?=
 =?utf-8?B?YzY1YXhwSEpuNDlaMG9mNlFDQlV5Zk40WXE3VE9YWnlLM3lMdXFtY0R2cVk5?=
 =?utf-8?B?ZWVKOWFMWElPT3VKTDVoOHBQMkUyYjlGVEZjNWhRTlV6M3ZSQ2hrVm9qa0c5?=
 =?utf-8?B?ekk0U1Z5cldhSHZvOVNDMUp0M2lsM3NNL25PZ2ZGYTlhSEx3YWVhdWpCZHRh?=
 =?utf-8?B?U05ENFVsWjJvcUNlenBvRG5HczJNMzEvdU9jSk1ITTNRQ25iZVhicnp0ODhD?=
 =?utf-8?B?Ums2QXB3ZHZXN0g5cW03NW4xenJlQzdCT2J3cDJHQ2RHK1BvRDhEbXRreUk3?=
 =?utf-8?B?NnNHTWdlN0tNN0hOR09DUGo1UmZqb1JFN2lGNjNiUVM0M3llL05aRmgvRUdT?=
 =?utf-8?B?dFpGU0VYZ3h4QVZYelJETnhROTg4N29FL0xuOWRFWkRkNzJZQVBkN1NKV3Ev?=
 =?utf-8?B?dlQ2YTc3cE5WZUFYRXRxeFpnUFVaeWhCOFNXbEF0eDBDYVZUR1FidmtjVTVj?=
 =?utf-8?Q?gBx/cRKS5E5ISGX26Nsx7nU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2265aa29-24da-4215-521c-08d9cf677fc7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:49:28.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtxLhc/B1XDIWGKxhB4i9DKqDwKr2V1QPXZv2ma0upGBsWAfWDNGTijdnJF5WT/PieA3ErdvRGV0/q9uHtnXOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

For higher order mappings the comparison against p2m->min_remapped_gfn
needs to take the upper bound of the covered GFN range into account, not
just the base GFN.

Otherwise, i.e. when dropping a mapping and not overlapping the remapped
range, XXX.

Note that there's no need to call get_gfn_type_access() ahead of the
check against the remapped range boundaries: None of its outputs are
needed earlier. Local variables get moved into the more narrow scope to
demonstrate this.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I may be entirely wrong and hence that part of the change may also be
wrong, but I'm having trouble seeing why the original
"!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
goal there to pre-fill entries that were previously invalid, instead of
undoing prior intentional divergence from the host P2M? (I have
intentionally not reflected this aspect in the description yet; I can't
really write a description of this without understanding what's going on
in case the original code was correct.)

When cur_order is below the passed in page_order, the p2m_set_entry() is
of course not covering the full range. This could be put in a loop, but
locking looks to be a little problematic: If a set of lower order pages
gets re-combined to a large one while already having progressed into the
range, we'd need to carefully back off. Alternatively the full incoming
GFN range could be held locked for the entire loop; this would likely
mean relying on gfn_lock() actually resolving to p2m_lock(). But perhaps
that's not a big problem, considering that core functions like
p2m_get_gfn_type_access() or __put_gfn() assume so, too (because of
not taking the order into account at all)?

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2532,9 +2532,6 @@ int p2m_altp2m_propagate_change(struct d
                                 p2m_type_t p2mt, p2m_access_t p2ma)
 {
     struct p2m_domain *p2m;
-    p2m_access_t a;
-    p2m_type_t t;
-    mfn_t m;
     unsigned int i;
     unsigned int reset_count = 0;
     unsigned int last_reset_idx = ~0;
@@ -2551,12 +2548,30 @@ int p2m_altp2m_propagate_change(struct d
             continue;
 
         p2m = d->arch.altp2m_p2m[i];
-        m = get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0, NULL);
 
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+        {
+            p2m_access_t a;
+            p2m_type_t t;
+            unsigned int cur_order;
+
+            if ( mfn_eq(get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0,
+                                            &cur_order),
+                        INVALID_MFN) )
+            {
+                int rc = p2m_set_entry(p2m, gfn, mfn, min(cur_order, page_order),
+                                       p2mt, p2ma);
+
+                /* Best effort: Don't bail on error. */
+                if ( !ret )
+                    ret = rc;
+            }
+
+            __put_gfn(p2m, gfn_x(gfn));
+        }
         /* Check for a dropped page that may impact this altp2m */
-        if ( mfn_eq(mfn, INVALID_MFN) &&
-             gfn_x(gfn) >= p2m->min_remapped_gfn &&
-             gfn_x(gfn) <= p2m->max_remapped_gfn )
+        else if ( gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
+                  gfn_x(gfn) <= p2m->max_remapped_gfn )
         {
             if ( !reset_count++ )
             {
@@ -2566,8 +2581,6 @@ int p2m_altp2m_propagate_change(struct d
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                __put_gfn(p2m, gfn_x(gfn));
-
                 for ( i = 0; i < MAX_ALTP2M; i++ )
                 {
                     if ( i == last_reset_idx ||
@@ -2581,16 +2594,6 @@ int p2m_altp2m_propagate_change(struct d
                 break;
             }
         }
-        else if ( !mfn_eq(m, INVALID_MFN) )
-        {
-            int rc = p2m_set_entry(p2m, gfn, mfn, page_order, p2mt, p2ma);
-
-            /* Best effort: Don't bail on error. */
-            if ( !ret )
-                ret = rc;
-        }
-
-        __put_gfn(p2m, gfn_x(gfn));
     }
 
     altp2m_list_unlock(d);


