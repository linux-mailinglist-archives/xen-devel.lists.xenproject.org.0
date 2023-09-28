Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F167B148A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609317.948344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllGZ-00084e-Ah; Thu, 28 Sep 2023 07:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609317.948344; Thu, 28 Sep 2023 07:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllGZ-00082h-7y; Thu, 28 Sep 2023 07:16:55 +0000
Received: by outflank-mailman (input) for mailman id 609317;
 Thu, 28 Sep 2023 07:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllGX-0006Ef-Ka
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:16:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe02::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff87a13e-5dce-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 09:16:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 07:16:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:16:50 +0000
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
X-Inumbo-ID: ff87a13e-5dce-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRdCXcFMZD/dDg2QepxbmOXYN383dBovQj7Qf2G2B+Yr3w/vRoTXgd+Bg4fHclfW7zfkB13XYbvTvVGBfzZ1RWRA/DXLiMFaPL4u5O4w/wGAPHedSzA0ofUhUf+yhobqosd+Pc5LBV0vulx6MiAR7E2LQPkASNXYMMlMQqbA6x0KI9ML3x+WWfvgfFluDNs4rlQ4rm3MO8UHpnIUC0uFDW/28Sr4pYsK/5wzuE2FuVQaaEvM8naM8ZvF78qGAhYvjzIwv0vrDwaVVPSTmumW6QEOPcZrJbyVQLqSVHJidk3WZ0cNa7MMZqt17kHYj/a41UNvL8kLK9t9ioOor7XXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdVm0Th937N+vCPEHX+Fu1YV+tgza1dfXYx9xJHohDc=;
 b=Vc0c6IlTEEWGFNwmGAmgRWOG8lxHlxqo6Fdw/W2K4ptxYPFiNNI6rp8vkuhGHJSdAEscfCbIWXW0c/HuhrKk45vDLkUGaFwMT9nqUdLnRgcjFxbuXPiBlj+RA0fldk7X2+i5mXeqeMO9jZMghUMJeLpJaEG/pNgua8wx8Yexr4JX9M0D+3Q/GNhjKXA21j7XnW03x0CGRYp9xP5F9QNq6091R/ggGzobCOIrejB4EtFvaWYqQCTOVwRvAe618ZjFCfRz2ucDzQucGYkM1Zxp3WApVMErmBSKvl/f3vvYk5Cohgr7CTlpNGk6h8AUZVzZyZaiRFkF7WozB4f8Uzq1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdVm0Th937N+vCPEHX+Fu1YV+tgza1dfXYx9xJHohDc=;
 b=vvK/cUQW5B84WIIKvJ0Vu/0pZpjuTBvczb1JL97KLnUWO7Qc3azK+GUtEoKSHLDoD5L28urNOfXGnK/I88uWZL/94awiWqBFV1ZEGzW/EgPLfWPlcusH59W33x/Rb78LMQGAaCfPmSs3g1eY9T0t7aECLNSE9+nt2e0HxWtS3dPL8byhtF5PV8e043ni4CUiIeTLn6MyDp3rvcX5CWMDv5K5JbYGOeN0Qh20RiIO0EeJ58uFqw72wPBv8l7suZqhnznp92H61JSDH2P4O2R+FgRJKcpxWxM2D0CCDTkYHmyoJDUtIlh53pey639fTsozrdZiU+ZTTU1QcobSGkBJ7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a34cef71-d60f-43ae-f61d-13d6c846eaa4@suse.com>
Date: Thu, 28 Sep 2023 09:16:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 6/9] domain: map/unmap GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b1300c-26e7-422e-445a-08dbbff2e254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PmZ41yt+6DG856FdpwT8OaP3ILcSwVYtrwbmb4kXDTjqk68qKFQPyxxe2BqyGZDRJ9ToMwJ1kd+NrhAOVK7EDTA7rIQyfWhCM+pujl13VKRwLv+KUkWvR6JEDsm3TR8uZV+zpC9YXosaiT9Uc5hhkv2CLqT2VKUqAS3u/Eex54ETdSTlQqjSYSDJ96fUR2ah2yM5HOPkKgdklrB8W+A1EyTu9vXJYer2HdkS3v/o3C6Q6PSNURlkluvbKUGIuIW85g01digsSL0ZTnU1vxrJqjW5zuPZTlZKNmhdFscUnDifd3Fz82xLNwGhF5NtN2bNvzhVhGWQtZ+f/syty96X9etGzd4r3sDQdsVgoUW0ob2iDDfAfV5ZGGHjkikqgHgDnBxSM+fhUqNrGl5cVre8TT+IdKtj7/br0xRnJEFo8QQJe+UIGOhK9Hodni4TwcZ+UzD/RSCDcBFbiOioNUgKQl3dL02WuNNtv7Hbteoss8YH4qZ/thN20G6trM/X37O/Ax8aqjXXRk3C4FZOxRf1icjnaQTR3fXd7wkr9RTJdZeGAB8/u9Jnzj7/hvxhuPsHYEiwTMJMau20qXvC6gueiOkQXxM/LpK1v+EHWp3ojpqWi39nV5QxKoYUAXhMC+41ETF+DmGIcmBn95W1t/qDjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2616005)(83380400001)(26005)(31686004)(478600001)(36756003)(6512007)(6506007)(6486002)(66946007)(66476007)(316002)(66556008)(54906003)(6916009)(8676002)(41300700001)(8936002)(4326008)(86362001)(5660300002)(31696002)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUg4Z3VvakdtZ0tlOVRRM0pKdjNYeXJzRGtiU05vVTBDcnR0MmJEWXdIbjI1?=
 =?utf-8?B?Wit2aG91U2FyVlczNDBtMW83ZmlDWXI0V3VaWDN3MmxZb1JKZ0wvcjJsZlFt?=
 =?utf-8?B?aFp3dVgzdWV2TGJLMitZRVc4dmUvcERtNEpXTk50SDBJbWRPRmVXWHBId0Q3?=
 =?utf-8?B?TkpySnBrVWJjR2ErMFMyS0RuVERWSXRtalplcVZBS0xKRlhmbDIzdkpiWTQ0?=
 =?utf-8?B?SWV4bDFlRHVlMGhuaVFPTitaUVNoYWgrRTFzSEp6Z0NGeFJZekdjdWhNemxy?=
 =?utf-8?B?dkl4T3g4WEk2NlRsSkRYSnJCY1ZWKzlKRVR4VmJSR3pYenZUSm9SdnNWaXFu?=
 =?utf-8?B?QTZWc3RYdFNxaGlIRlFoVFhKdGl6Nk9jVm8vWk5uNXVuWnJzckhabUZEbi9O?=
 =?utf-8?B?Vys2WGw2NzBVOUxFM013emx3dzVhc3RvY2Nod25UY0Y2RjNNRGxDZkJVKy8x?=
 =?utf-8?B?QjcvRTIwMlNaMWhSME1NbFZTNGU2R3lwcWFIQzdzOTZPRjJDSGdvcEhvR1BR?=
 =?utf-8?B?Y0E4ZTF3NlpZVGxBM21qL1EwZyt2aWQxOEljZHVlRTBkWVlhNlRZbGZCUlBL?=
 =?utf-8?B?QTlsNm5ZYzdacDVkRnJEdm1yTEtud2xvaTdqdWxPYksraE8ydTdlN1MxRGNH?=
 =?utf-8?B?bUFYY2l2Q1Y1TjR3U25XcnRKS3pBRHE4WVM4MkN5cUpYcHg5NVIralhRQ0lh?=
 =?utf-8?B?Y1BWK1V6OTdPNGNqRTZMaC9FSFlBOWVFOGdLWmVXdVNwVldseXl1VE0yeURM?=
 =?utf-8?B?T25hVTVhbG1GVzRLN29RUC85SlpJUXRXSTNFNGZmam9GYWgyenhQV1pRc3ZX?=
 =?utf-8?B?M2N4M0NxZ3NobERaT0k3am5DZ1JUYnZQR04rQUhnUnJXeXU3WGRkZXh4YjFH?=
 =?utf-8?B?YWc3dGVIeUh5N3JwUWVQZ1BJS1RoOTBEdmlkRzFKSGpzMGFLYU5GQ01SMTdJ?=
 =?utf-8?B?eE5Ndjk4SC9DRkN5UkVEOElWaU96Rkd1eklDNVRTdGQyWHN0SXVXUU50cjdx?=
 =?utf-8?B?V2pmbDh2UzFZN0FJRDV5ckhXS2twSVJRZXF6Rnl5T0RmUW9ET1k5elBtSjJu?=
 =?utf-8?B?RjNnMUtrN1JsdGxaOWZycFFQc3M5UXFnTExXUGsyMlZ6d3ZVUTM3dzY3L3lL?=
 =?utf-8?B?aFhjMm5WdGdkUnIyN2VzckwwY0d4cmM3TFZuQzdkdXhzNXBCWXByTllJTGNB?=
 =?utf-8?B?UWIxMDBrM2RyaGZNN25ZQjVTditoZHVKQ0lRd0ZpTmZBMWdJL2NaK1lLSU1G?=
 =?utf-8?B?YXF2WmlReWdMK0JQdFJ1dkd2U1l4SFJPdUxRNnFlM1NMUnN2bFlaUHNtaWJi?=
 =?utf-8?B?dkFmR2dJRUxGRXRTZ2FSUUpKd2w1cG85UVpIdzVXcHF0aXBRYU1EWHVCelB3?=
 =?utf-8?B?djB1WkxMSDdtU095bTBMR1krR2V6S2dPazNCb0dZK2ovM0xybWJXUWdsVFlM?=
 =?utf-8?B?TWliY3l5TlUzd2NrVWlWQzRzM1dOc3R5ekc1c2RiRW0rOENha3lWMkF4ZFV5?=
 =?utf-8?B?RjlqVTRMR2dTR2ZNbUhwSnpNVlZXSWNpK3gvQXBicmNYaEs5djh6TUkyeFc0?=
 =?utf-8?B?cGNrWVJsQWNYNk16YTBuRkpma1VHLzNGWDRzVkJGM0o3M1NHWTBQZjNuM2Mv?=
 =?utf-8?B?aDFIR2hrMGRxSmNVeStkc2V5RzcyZHZKdko0VHFGM0lzZ2cxTUZtc0NrNE1K?=
 =?utf-8?B?U0Q4eE84cjhhUGJ1UzlwRnB1cURSaUc0Z0pPY0hUZDlOTGNMSW5YNXVUWUl2?=
 =?utf-8?B?TlNzNENSM1NNNGJ6UVdmOHh2N2NzOTVLOFRsWHVmaitxUVUrNlpxa3NBakNQ?=
 =?utf-8?B?T0RtMENONnhuY1V0ZldiRW9zSDMwQ3drUU9rVzVoLy8wNFRaQnFWbG50d2Rh?=
 =?utf-8?B?SlBNQUtnTnN6SVdwd0pDb2RadG9hL0ZScjU0MnFRVmhxNVQ1d1hzU2RFRnVw?=
 =?utf-8?B?UkZiZXkxWXpYOXUyUExleEVSamxWUWkrZ3VtN2hNb3V4NXpoM2xmbEhzb2t6?=
 =?utf-8?B?TlRWb3lnR2FwVWgzQ0VTalBUUUIrMC9jREpPWStYMGZIK281NlhFVzRGNUFY?=
 =?utf-8?B?dEQxN3pZN1pmbWJ4OU1tNC9HMS94WHBmMFlLbmdGUStmc0I1K1JxQzkxT3lo?=
 =?utf-8?Q?/NESz3i3iKqbuXo8P6VPgQ2HA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b1300c-26e7-422e-445a-08dbbff2e254
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:16:50.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2N6kSdbpwh4Rp0vk+49qovBzPiq/Gu1xyKIaWk4qyliFiRkt1Nlr1WL8QlfPRiabOHh1+CNBqh3aX5DdLmTaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

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
v4: Add another comment. Use IS_ALIGNED(). Add another NULL check.
v2: currd -> d, to cover mem-sharing's copy_guest_area(). Re-base over
    change(s) earlier in the series. Use ~0 as "unmap" request indicator.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1605,7 +1605,82 @@ int map_guest_area(struct vcpu *v, paddr
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
 {
-    return -EOPNOTSUPP;
+    struct domain *d = v->domain;
+    void *map = NULL;
+    struct page_info *pg = NULL;
+    int rc = 0;
+
+    if ( ~gaddr ) /* Map (i.e. not just unmap)? */
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
+        if ( !IS_ALIGNED(gaddr, align) )
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
+    if ( map && populate )
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
@@ -1616,9 +1691,24 @@ int map_guest_area(struct vcpu *v, paddr
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


