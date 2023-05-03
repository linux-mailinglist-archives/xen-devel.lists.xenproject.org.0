Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D076F5BA5
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529336.823660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puErN-0004d6-Nh; Wed, 03 May 2023 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529336.823660; Wed, 03 May 2023 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puErN-0004Zf-KJ; Wed, 03 May 2023 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 529336;
 Wed, 03 May 2023 15:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puErM-0004ZO-Hd
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:57:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad93c58-e9cb-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:57:39 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:57:11 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:57:11 +0000
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
X-Inumbo-ID: 3ad93c58-e9cb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ecl6OoeY3v9bYuSfyv4XwM4HHyOiqOqkPixZ2UG8OIn7hDHfwjANc11GAG5XUJP9H9cZDdUiSD/QKUk2Tlzqq4AAkW3O0FrFTnYS+HWBGl07akyZCsr87tGCSAJA1bWxzC8I6cj7fQLzGWsASxQdUGGEiel2hOUJdMqhWelguqaCK+6Ox+UN8fioKTxBFpkQMBXSGUnQ1lhmmINQIsTXy8Bzq7RqYZ3Bb5Zq08j6PfnUGowBT6c7p5Q9y13CLCXCL0w/TTFbyTJsdvPrzjvkfM4+jfV8EW4iPkyyvOhO6pxUUZF8VomcIXUxFTYNU9RqZekujizyJ4q6bB/FNnL5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH84g47tK7c4GlHoaAADCkWf+J2O8DieVbFkOg4ugNs=;
 b=Riy4pq1Vr2jZEw0jWPQCWBvh1Gzq2UkbXR6FB4EvslF8RwR8WdvsmllqgTXGcnbExY8lAYNReBHnxQSGSc/YhTky4W15b38Z4fHcmibXXqf/OT9kQ6WM6jTUBXPcNV9d7mUF9G1WsedKS2xci/lHaXmAe7LwJKW6Dg8QeArwewyWsL5zmYCgBP3Xbrun8jZq0YMnJfydhX6O6O2XZHNOakqvw5yuZtnH+LaGn0X0N/OkKL4RiS1Sg8RdtRZxp4xOZAJA+AgPOVFMnQ7WxD2DYGUVAPpd4FXmrfCJY3+Nft64nkyfn+pLJi5FpsvL3rhzFqaXP6bacWdpqXcYK6RQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH84g47tK7c4GlHoaAADCkWf+J2O8DieVbFkOg4ugNs=;
 b=AN+UqnCuIkVXFXGo75TS2i16XkYOfqjLHsaiJixrQWP6QljTr+mRTbhvMnR1KiEIXj+D/OdvKKLW+xksjr1pRwiDNn4FnupuljH+M4NOqedXj1hMWupWC4bvtYKj7fWME+Yn0/Yuu6PstWH+z6VzHgN96hFax3hm8a94tUnozA/XYK/cd/ya88DuRZ6skyvdypsLasIVZMbycOgePIV5b8tjYUv76S7rPSV+DHzRE+KI49rfNaRff+zUPQ52NbXDrGHDqhmkOcfNYmh8daT4Ua797b3mGpeBapdTL90jjNsLQa2ByAjVsMDTVZxlvJeqRGVLNTXSmXcHlYiJglRexQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <140e906f-07c4-ae40-1d37-ae9966709289@suse.com>
Date: Wed, 3 May 2023 17:57:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 5/8] domain: map/unmap GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4925db-50fc-4a26-627b-08db4bef0e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VdbsEsxYOJZLI2yg0DerlCvyJ3okHohulxga3CtEn+dyKuFWyhHj8GeRDd7BhLWOmO0k3U42VG+RbLWWLxeMtVB7sCocOTd4YFe+nePU4KjNvG9dv0Jb67AsRetRN8IVbMaCXSFDxmuN61N+b+nbl8pMVM+ODzGxswu8TyusXsJoPpot1MocdrNuDo0IYAdbGp+NE853JC+SB7mBzyQunjudg5Q36Tt8CRdMPU0krLmkRn3GD2Qrtg/trLgLofs2WnGfja6aYx0idpAQePzMuFncI4DXrTdDSmbM04GFalU0Qgv0wEAdO0H+44awXnBDpUHeaJKtj+bSzxA2t+7ypyLXzFEvpeIucgUqSsjkE9jNm8E5OrPUhddzQBwJLgPWcS/6giBDA25K6wsq6tZ5CiRG63nLG2lti8MPl0+44E8fZUHshNO2NOhfEkG6iT9zuf82nNkk1EvV583GjlFzA+OSDZZaTStVV+wolbnae2ZwzsMTkhEiyjiG8gkF561pDp3AWg2E+PZeE3TMJ6sqSq2Dc/CfW3cHfvYX8z1trmM2uozFRzt17F3TKBZuI6hYC2GqcHGbIKLWSVGd4PLy9U/7d4IZIQBzO4c436/5h/HhOx4zQIAmX5/y5UurzbptreLqK5lICp+45OGGO9lENw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(2906002)(38100700002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6512007)(26005)(6506007)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXhmcjVYNC9ZeUVhVzZkOXg1M0hrTUVFdUYrUlY0Y1g1WlFPQS9PblJXY29F?=
 =?utf-8?B?eXc2QWJPdmdmY2FZT2ZXZGVYVmhQMVRiV2gwRWp6OVFIQ2ZPWGlSUEcyRy9q?=
 =?utf-8?B?TkxzMjFRV084RlFwSGY2eFhMbFdTQUNoRHpRTFNBTVBkT2Nzc0NwOFJteDE3?=
 =?utf-8?B?N3pJT0FyUVd3cUFTY2s0SlAzUmFWZXFnZDd3R2JaZzBiNGRSUzlQU2o2UzBP?=
 =?utf-8?B?V3RzZ3E1RHhxaVFSNUlMazNqVm1zQk5OVVFpemxuUld6Q2JKeHVZWHVwVzFh?=
 =?utf-8?B?ZjExa090SHNNdWd4QTZsVzJHZ2xxaThkWExESzI4TkpUSlBCOGg3NWlaUWlB?=
 =?utf-8?B?c1JlMWg5ZTJVOWlmUHo3akNIS3huNjUvNE1CZTdiTHFpMi9QVkpsYVpCL0lL?=
 =?utf-8?B?ajJVZU5iMTk0akxxRStDazcxQS9pTDhaUkVsUE9hay9pUHZhSEIzY1NjT091?=
 =?utf-8?B?ZUhlNVlhV3ROTUpEWXV4K3ZVa25uSUlVT1pwd1RtQ1NaRThkb3cyZmVBYkpn?=
 =?utf-8?B?L0tXWm1vWHFXaE5aOFU5WmdXY2VEa2RkdTUvaFNmOGQvUVJJMDVjbXFTbXpn?=
 =?utf-8?B?YlNFMjg2dmdsaERtVG5NdHFPYUh2ZitoL0dxb1F1NElibGkwNjhtYVM1VU1H?=
 =?utf-8?B?U3pJNzE4c0o5NnN0cHZVeWR6VjIySWtQWDdlRi9uNlc1V3hLSERwSkx1MjJl?=
 =?utf-8?B?YVBiYnFqSGt6dmVtVjBXNHltV0hubDd6VHBxUmgxTHdLWVRIVis3TnBiZ1lj?=
 =?utf-8?B?MWNmYk5jZzE3SzZsK2JOZGs0ckJKbTNRRkdXY3BzenEveFdOZlp4K04vb2Uz?=
 =?utf-8?B?MDZnV0E1WEJoMHdnNDJKT2tWK21lNFRyL0pIRE9DSXpPam1tdVYydXRFajBo?=
 =?utf-8?B?VE1vQ1ZrQXFHRVFSOFpuQ0w5MGxUOTFoZmlBNTNRTm9mYkplVWxSSlVsbTFB?=
 =?utf-8?B?RU1HODZ1ZndxQTVqOUtWRE5mQzZtUVM4TWhsYVM5UjFRTFQwQVk5aTlMZ1cw?=
 =?utf-8?B?TmNzbC9JWk5wWGtzZlNPL1RkMWlqdDZJanMrOGM2WjFBbzFZZmJTMnRjbTdu?=
 =?utf-8?B?bUg0ZEdnSjFoZ3JTQTRwK3VVeTJlVHNCRElsVnZFdVZtZ3RveU1hc1dUMlhR?=
 =?utf-8?B?UUYraUVYTkNqUUg5ak9PL2Q3bG9jOVZJMGxqbGhORHlsdGRYVWhQS1Ztb241?=
 =?utf-8?B?anQ4ZXMzQlhtZmpJVGxiTm1XY3N1VU1YbXlrRHFMQzMvOXUzcjNpSllaakp3?=
 =?utf-8?B?WnhXRWVncFp6UG9SRlpUeUlnMDY3c1FucC9ZKzNtdXBZQ3RZTGRZL3pFU0Nh?=
 =?utf-8?B?K3JSRjdGNTZVSHk0Q3JDRlM5YjJSNHdqWkR5YndONklJUFRqVGlNQkRwV0dr?=
 =?utf-8?B?VmY0b1BhVEh2eHlHLzRHeXdYYm5EdGVJMjJxbDRUclZScE5HQnhsdzArc214?=
 =?utf-8?B?YW9DZTZMRjQzRTRIOFZUU3FDVWFZSVpvM0VuRGovNk1HK1NVdk82M1lqY253?=
 =?utf-8?B?Sk9MNHYvcGNHZk1OWmVFU2J6RnhnNUl3Z3dwcHQzV3pNcEhwS0JCN2hUV3dS?=
 =?utf-8?B?WnVZOHJVZGhCdHNqVHl1aDYwdERXdTFHMHFpOXkzZFNwSGNUMktaZWJOOHIr?=
 =?utf-8?B?NTBlbzdSZmFNWUwwb05NVFBFVkR3dGcxbU1yVzFuVnhXbHZzdmM2SUJiOVZl?=
 =?utf-8?B?WGxJakxrZU8wRTZHc2RmS1Q2SEw5U2NrNU5KNVUvNGIwVDdTLytEeXJhcmdN?=
 =?utf-8?B?Y2JaQWlacVp0L1VldEpjOUFOanFGajhBR2xGZG5xV2t2b0VOYURQa3hYbGNm?=
 =?utf-8?B?Vzl0eTRyWktsUWUwOGlwZGY2cGZFZjNOQ0F1ai9VRFJzRmZSMm1vTk9mNWxO?=
 =?utf-8?B?QUFhdXVVR1NYNHlTMDJyWkgzZWhPejJBak9iWUo5bWhWcGVnUWZpbjNZZGVX?=
 =?utf-8?B?RnJtR3RpblRwNGt0bkNOR2puSTRmbW1XMHVYaDQ5QTE4dVhhaEVub01KbnMz?=
 =?utf-8?B?U21lVGFiTjRyN1FVMWdBUlRhQlhpbWcydWxpYko1dWRVWGozWGJzSkxmSExp?=
 =?utf-8?B?RGwwOHc0QkRmZkpFVWk0WGFnWHlSbWludjNZbzN0WHhBWmVqRUxuN21abW9T?=
 =?utf-8?Q?uFEgIwLhpGdzxZ0nUHOjmHLsw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4925db-50fc-4a26-627b-08db4bef0e49
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:57:11.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmD79uMgkBcmhtDa0F3SJ3rz3sD99yKkN/378NoEOkjHiRuRQFin3v3khjMrvG1gGlo5CMPsaA3dvEyifSaLUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

The registration by virtual/linear address has downsides: At least on
x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
PV domains the areas are inaccessible (and hence cannot be updated by
Xen) when in guest-user mode, and for HVM guests they may be
inaccessible when Meltdown mitigations are in place. (There are yet
more issues.)

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, flesh out the map/unmap functions.

Noteworthy differences from map_vcpu_info():
- areas can be registered more than once (and de-registered),
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: By using global domain page mappings the demand on the underlying
     VA range may increase significantly. I did consider to use per-
     domain mappings instead, but they exist for x86 only. Of course we
     could have arch_{,un}map_guest_area() aliasing global domain page
     mapping functions on Arm and using per-domain mappings on x86. Yet
     then again map_vcpu_info() doesn't (and can't) do so.

RFC: In map_guest_area() I'm not checking the P2M type, instead - just
     like map_vcpu_info() - solely relying on the type ref acquisition.
     Checking for p2m_ram_rw alone would be wrong, as at least
     p2m_ram_logdirty ought to also be okay to use here (and in similar
     cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
     used here (like altp2m_vcpu_enable_ve() does) as well as in
     map_vcpu_info(), yet then again the P2M type is stale by the time
     it is being looked at anyway without the P2M lock held.
---
v2: currd -> d, to cover mem-sharing's copy_guest_area(). Re-base over
    change(s) earlier in the series. Use ~0 as "unmap" request indicator.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1576,7 +1576,82 @@ int map_guest_area(struct vcpu *v, paddr
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
 {
-    return -EOPNOTSUPP;
+    struct domain *d = v->domain;
+    void *map = NULL;
+    struct page_info *pg = NULL;
+    int rc = 0;
+
+    if ( ~gaddr )
+    {
+        unsigned long gfn = PFN_DOWN(gaddr);
+        unsigned int align;
+        p2m_type_t p2mt;
+
+        if ( gfn != PFN_DOWN(gaddr + size - 1) )
+            return -ENXIO;
+
+#ifdef CONFIG_COMPAT
+        if ( has_32bit_shinfo(d) )
+            align = alignof(compat_ulong_t);
+        else
+#endif
+            align = alignof(xen_ulong_t);
+        if ( gaddr & (align - 1) )
+            return -ENXIO;
+
+        rc = check_get_page_from_gfn(d, _gfn(gfn), false, &p2mt, &pg);
+        if ( rc )
+            return rc;
+
+        if ( !get_page_type(pg, PGT_writable_page) )
+        {
+            put_page(pg);
+            return -EACCES;
+        }
+
+        map = __map_domain_page_global(pg);
+        if ( !map )
+        {
+            put_page_and_type(pg);
+            return -ENOMEM;
+        }
+        map += PAGE_OFFSET(gaddr);
+    }
+
+    if ( v != current )
+    {
+        if ( !spin_trylock(&d->hypercall_deadlock_mutex) )
+        {
+            rc = -ERESTART;
+            goto unmap;
+        }
+
+        vcpu_pause(v);
+
+        spin_unlock(&d->hypercall_deadlock_mutex);
+    }
+
+    domain_lock(d);
+
+    if ( map )
+        populate(map, v);
+
+    SWAP(area->pg, pg);
+    SWAP(area->map, map);
+
+    domain_unlock(d);
+
+    if ( v != current )
+        vcpu_unpause(v);
+
+ unmap:
+    if ( pg )
+    {
+        unmap_domain_page_global(map);
+        put_page_and_type(pg);
+    }
+
+    return rc;
 }
 
 /*
@@ -1587,9 +1662,24 @@ int map_guest_area(struct vcpu *v, paddr
 void unmap_guest_area(struct vcpu *v, struct guest_area *area)
 {
     struct domain *d = v->domain;
+    void *map;
+    struct page_info *pg;
 
     if ( v != current )
         ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
+
+    domain_lock(d);
+    map = area->map;
+    area->map = NULL;
+    pg = area->pg;
+    area->pg = NULL;
+    domain_unlock(d);
+
+    if ( pg )
+    {
+        unmap_domain_page_global(map);
+        put_page_and_type(pg);
+    }
 }
 
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)


