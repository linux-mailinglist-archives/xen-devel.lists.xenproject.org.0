Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FF677E7A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482965.748805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyEb-0006hO-1g; Mon, 23 Jan 2023 14:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482965.748805; Mon, 23 Jan 2023 14:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyEa-0006em-V4; Mon, 23 Jan 2023 14:55:44 +0000
Received: by outflank-mailman (input) for mailman id 482965;
 Mon, 23 Jan 2023 14:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyEZ-0005Sn-Tl
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:55:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018eac98-9b2e-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:55:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:55:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:55:40 +0000
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
X-Inumbo-ID: 018eac98-9b2e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc1jUsF5zpEMTdM153Sh1Emw9hxaXTbuRZo1w/gkXd+1i/S+X2yCBcPddRzrWH09H9EtachrDNOY1W/4Xsd8XYJoHtJHjyKog9Y69JG/4cpUbaTDWJ/Sq8sXSjDDm5VIaNjzbngitvKLqu7GfdxkJGY4hzRmF2KvHygYdqNzFaMX7La9z+7a/YzpMum2dNo0nWqT3s8g1TW+ahOdAHqjFxFME7rlnXzEYqZ01KkmGthJuwDNvNezh469LG3RnbluQmLiRTkxdFLvhmcGu+h8BgY/SOrvJayDYhNenngcv6AURTE1PhtKXZI58JtBsb2MuxzRNOJ3dmTlP84DPuBesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH84g47tK7c4GlHoaAADCkWf+J2O8DieVbFkOg4ugNs=;
 b=WMwwg/BSil6G2g/lHcPOgyQuua3v2JhAXTl49rQ/fFHFpWxuq0dCTyzGTiwYovWkkg1EdtM72zVeeq4KwMDYaN58pBq9QH8TA9GqJNr07JVfIbJrlqkOtDwLwe5PkaAaBuFvgXG9en2Z3PzVAHW5rNzQemUe6rD3Y6MfqgAB7JsnMXhh9hziDHXIWCrb0kCxGJcvaLGNQvTOPrvR2HHqvgEPpU2v7MS1rAQr4SglO4aH3Ba/PRrO1400Hq56r7m7kT9gMDuEN00Eyhuv691MM5rcxQQm/yuIN6kVXLup9x93gTZNjczJwOD6CkRlF/G6MdA6mvmQoSXX9vNQ62SAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH84g47tK7c4GlHoaAADCkWf+J2O8DieVbFkOg4ugNs=;
 b=ZwGhTso2bJR7mowMbRUgbABSW5WEdw/Rk8ERn4A4LxuthJp3bthQyjtdET41/alfS45V4j9Vo1GXt7JRTmZxjiHNBKPr8eBDP0/tLVwXhepLWODmi9NVsV2iszjfchkQZO8ePAlqIAps4VT3DJvUQt/EJsxwVhoX9/gA4rvMagxpeQQgx4beTRFq3fpIjB8ipeBk7bGICO6UL4Gc+7iRGVn8WVtT0ExINxLU8hKXXbsya8gtBFp2i99CyJ+qvS4MOVyUZfgotCKgWCF1slIwSRMF3Dq5Ij6oh6cfujjEVtl1DngX3Q+YbXxM99zB4586krao7DY/xHRGscVv7ehoIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab024dbb-cd79-83aa-9032-ad0ff78927f7@suse.com>
Date: Mon, 23 Jan 2023 15:55:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 5/8] domain: map/unmap GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: aac43901-a08b-4007-d180-08dafd51e517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u0/JCnzpkejrBcum1BE2PLcjhwJtRdw2NzObYkkj+LXqwpQp6OXmQg4nlQCFs31GZBda0TZejZX3ePBd/wHYsoTVdMKh1qw8gkvZ0ymR1ycJGcj06uytYm1ACtW1GcIWLDj5Cpa4U+HzSFyKHs3JfWqZHGX2+axAdgPW3ShIqLZmBTfGeAg2LZ75qrOckdYPsQm/SxbEBmmM4zwifOOpGxAty5wqj60aNRPM/4gS7ng7/Oe/Xw60nD5TibuSS8cPB3AD0BXB4tTDg5HgdZxnSAPVJk0XAqBwVJknRllsC/JM73AnKfXZWWZxPwcN8YwNmDUdOpr6P8EBgojGRBqxIeLmCglRyR17FR5V4kmHklEe6vkou86iroecyrmaFHxnUwqN3NX62sSU1YqcwvHWg1KPbZigvrryhAp/ZRWxF9WiBhF+2lrcQc2dqQSBczKEZU/mtQnf6KFoWV9lEqN+GPUo1RM58Vgv5DXHybNYF8k59WyEzvUUVsZK0d26bOvEj92eyjL3P0VWR5KHvIhZch7PfmA5PnIvxIf1+raTiUKR2UHrw9JAEowwfitZTQvIutP2cGArstRpY/rsXHZC3fDtRN81ovesY/kWH3ABT7revjnvBA4S1SqjLAO3vM72yvkH5ZOTIzGQI9X/5XSh3pAp2WgyRi6vkx8HvJaf6wDzpOfcxK9f8o/GsNe2/3DnFbUGXMl4EK8mbbXm/Y9n1y1AFVNWh1ZwBG+SxNPqlcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(39850400004)(366004)(346002)(451199015)(31686004)(2616005)(38100700002)(31696002)(41300700001)(2906002)(8936002)(5660300002)(4326008)(8676002)(6916009)(6506007)(316002)(54906003)(36756003)(83380400001)(66556008)(66476007)(66946007)(86362001)(478600001)(6486002)(26005)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWJacmoyQmRjZ0ZkZ3U1blNUS3JIajd4MFB1Q2xNbnR3cGI5Yzd3cXFVaEoy?=
 =?utf-8?B?aklGTE1UNHdDZE02ZjdFR05nMmV6MEpNQzZrUC9MZU5DTEFhbWE4T3h5QTE2?=
 =?utf-8?B?RGJRZTJRUVVVMVhyREZ5TVdsZWlqajlyY2MxSjhsNjBLNUtyU1lMNGYrRWU3?=
 =?utf-8?B?MVArREdIaEw0NzlUQytsYjF0ZW1yOUc0ZEt2cDRqL1BwS3NlSVFkVG54dExi?=
 =?utf-8?B?dGpiUEtEWGFRWndrOC90MHkwc0FRMHlMMzJBYnRjVkh3SmllSm50S2QvQnIv?=
 =?utf-8?B?aHFuRGlmUlZldFNBWFBzaWJWK1JaVDVxM1ExSDlRWkNGeTVlb0N5YkF5SXJT?=
 =?utf-8?B?SDQ2eUtybHoyemJQZlkxcFV5eVRwZE1sVW1NUDFDK3A4YlRHQXd6Mi96VjRy?=
 =?utf-8?B?N1Zmcm9oWG1McFUrOEVLL0NOem5ENzJ2Y0RHd3FJZjh6VWY1MjBIUElYVy9j?=
 =?utf-8?B?YzVqZEtYVHlPNHFCamorT2ZrdXc4d205c1E0TFhZOGpkRzJEM1dOZmpOOHlL?=
 =?utf-8?B?cE5pTGhIVWR3QU1HL1h3K1hkY0FuUm9WYm5UNzc2Wm5BSWhvdkp2ckJBOFEr?=
 =?utf-8?B?SUk3Q01SYWpUT0xCTDRxeENLWnBncFBCQzFJVmFITmticFUrZWtnNTM5dmc1?=
 =?utf-8?B?RC9XUEJ0V0lQaTdtT3pJenJvRTJJbGZONklVWU1wdEdLai9qcG94MGorODll?=
 =?utf-8?B?ck5Fd2lIbG9xakVPQURSOHEza0N0YkxXN1V5cmd0TzFvSmxudHdKQmd5Qkp0?=
 =?utf-8?B?RlJFY2lVYUFLdE16MU5QaXFEQ1NwL2dKUVF0c0s2cWJZd1M3Q3lMbXV0azZE?=
 =?utf-8?B?YWdPMnByZEhnMG9hMlFUNEREU1pTMmlDNE1LKzZQVENZeGtpTDAwZHhCbXA1?=
 =?utf-8?B?dGZ5ZjRRRktCOVoyZkI0Y2F3N1p3eW9USFJLODBEUndpZDBTSGp1bmNiNDFV?=
 =?utf-8?B?VzRsSlIwbjYyY0Fjd2ZXbGpkWHdOckdlN3dURGkwWWpWOTluMDRmeDFEMnFZ?=
 =?utf-8?B?V2cxQWYzZkhWT1o4RUhMZXhya2ZxVitFcTlpTnV5RElES0NpOGx3YWNuRVZs?=
 =?utf-8?B?ajNZUXRBcUEwY2JSVDcyaDVZcDI1UUZUMi9mZHpGek5aUjdMNU1USzJ2L0xL?=
 =?utf-8?B?VjhnK2UyOHFyNnlpMm42V25uaCtXNmk0eFB4eU9sUm9RV2tBOXMxNTQrV1dp?=
 =?utf-8?B?R3lwbjBpNWdZdlRQcmF2MExFL1FzTUJaU0NuRVU2dUVmc0E1dlVaTU1ERjlZ?=
 =?utf-8?B?Qm00M2djUTIxTEs4RzNuMzBna3BTNEMrTmlOVWVjeW5qUjRDL0VZcTI0Mytv?=
 =?utf-8?B?ZDRXcW9HbmdXWXB2eEFSVXR1dzVJMlE4NjhlVUdzbXIxSVRXYkFkT3ZRMFlN?=
 =?utf-8?B?NUp2ZTU5TlNWZi9VOEc2a0dPMGNmZWRhdmZRTXQ2U1NZSmxIY040bWRGaG9S?=
 =?utf-8?B?NXdKcFkzNmo5a25NTFlJa2ZUZFNWMkg4dlhjWjdQck8rTUdwQkI5ekpNR0JD?=
 =?utf-8?B?N0hleGZaeWxtVlVyYUJMRXlhcHJ6MTI4cmVVUWJocDZjQUNzUlpJRExUUWRI?=
 =?utf-8?B?T0lRR3FJczRXNjVGMEJ0UEFlRmd1NGgwT002cTdyRHArenNOZk1FQXljVnRq?=
 =?utf-8?B?SFMxWTN4MERUTWJmSmp2ZFVhSFBoYklUZmpYMmJJQ2picnkzUnFibkNxTkVB?=
 =?utf-8?B?YURNeVF4U3BJSjdEd3hDbnNjVU1yb3FBeHRUREVRWGZ5bWZRSEVnR3F1T1JE?=
 =?utf-8?B?VGJMRW4ydnora04zTlpXZzZ4akJ0a1dBVTNlY0pkRktPWE95OHB3dGNQZkFK?=
 =?utf-8?B?T01pUUduYXdhRExFL1NvOGNQU2pZdWdSZkhiRUh4NGRSRzZmQkpiRVVWbkI5?=
 =?utf-8?B?UERibjJqNmhnZXdUVEtCVHFqUTJQR2RyVnRTQUVHK2J3d0VzdnRWL01vcmh6?=
 =?utf-8?B?UUhHb3B5b05BLysxZHNpSXlhcWJlb3RlQ1VUWlBoSFNVWGdCc1BYQ3JidjBJ?=
 =?utf-8?B?SEZRV0FpNVlLYzFNc2I1VDl2M3lzeDR3MEZVUE9kQTdtZjlROHJONkE3OW85?=
 =?utf-8?B?dWs4Z2w4RGdYV05jdDJ0TnhzNXBnWUVxYnpIN1dFSUVrSGkzSTNFS1NFcDVQ?=
 =?utf-8?Q?8ZaAp7TUCZdiXOAOzUwSqT8Yb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac43901-a08b-4007-d180-08dafd51e517
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:55:40.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3hVn7lvVOwZo3wwL++zponi9ue8r2Ik+Kh4Fpa+dODjiyc17E0KOuWmCoHb4Togu7mdxtRsocCMJC3buUCLeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

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


