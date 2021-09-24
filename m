Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274CD416F68
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195097.347612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThmO-0006ZA-IU; Fri, 24 Sep 2021 09:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195097.347612; Fri, 24 Sep 2021 09:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThmO-0006WR-EN; Fri, 24 Sep 2021 09:46:04 +0000
Received: by outflank-mailman (input) for mailman id 195097;
 Fri, 24 Sep 2021 09:46:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThmM-0006WJ-Oi
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:46:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39f2bbb5-1d1c-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:46:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-59ajN07nOGOgxzxYJAVcBg-1;
 Fri, 24 Sep 2021 11:45:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:45:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:45:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:45:57 +0000
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
X-Inumbo-ID: 39f2bbb5-1d1c-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/xqY7vvGGkXpN8hylBtpj3jGQh5qHksSw0RnRhvYDs=;
	b=nOn+jCd+yqX5EKGTQj2C9wEqaD3ySdJh52qjDu9JBUl2nNdrsf3YT3FhQiwll5JQbj9ddm
	8vmL1CSuniV9WDVJuUbnWyIW6jjQlywJa2CiKLe2Kd23TqpBUjB0BtxRLBW6HB0rXeBVoZ
	n5R2RCnT5zQJWplfFs757nI4KKzQWhg=
X-MC-Unique: 59ajN07nOGOgxzxYJAVcBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNc2RIpnVnaqZHNOG2WnMYVTe89i6ol1WPN0xGE3jKUjfrIXQak94pNocn/1SosWtrJ8dcVuczMHDS0CJk2YhI95gs+Gh+UIo4i4477B7qtb6iT7s3pxQdquoOTDhsJtsp5Tvup0NQM4BjVlevU49r1DRDxySKiJtAsRpHwVsZ3Pi8Y0/2ppjIewf//W94z7jhFlZzqmGMPB/DsPGzErA5B1M3FBJBf8wbxMj9hEZT/l0GRlxiJxWzaGI63UhD5LoITGGWc/y0efi65e32Tsy9+bxlOeb+gx9zTj9cLcnAH1iutCQk60FwDObHSsYlmPICrY30PiDHocFDJjP/n7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=s/xqY7vvGGkXpN8hylBtpj3jGQh5qHksSw0RnRhvYDs=;
 b=QzCTRbv6cMqoEZYHQEZ9SWxXbyhf+A1bRCL9ABdK2dF8LWUU3OPGfl1FNo53XKJUdiPT9fz8t7y4cZd7ElmJKD+qDMnAQGwWd0WtkJ3YV8i0gm9I0Yovd5yFNXNNq7nBOoENXq8dAsOLiqD+WgcfrKICT+m1eYQheK68QaSJe/Bdccl2jaw2vd/THNyG+p7W2coASuVLNeYuvJ8eaudJ4ZZDvM83PRBFzEeT6Gz2XrJ/ndQMCMGSqPbsbvSg/NfxyPrkxcc4aM2MSEqaVZXmcQiQY1s5wnfHg8HtKfVCSjMtbRW+5vWqm5HqKeD1EFMdfyU2ZnTWSN768dDcdUalsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 05/18] IOMMU: have iommu_{,un}map() split requests into
 largest possible chunks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <134785fb-8ac1-50f0-de75-e0d6fe22f711@suse.com>
Date: Fri, 24 Sep 2021 11:45:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bee5668-25ff-40b2-1e4e-08d97f401c46
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383E6CC4CDC61DF1FB193B0B3A49@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yo0pDFLvICmiv31hJub9ecyxA+bFBlDU40VRVGYb7N41qolLU6/m2UjCnfjIkZKQ4vzwcbn6TsGabGGEb0gr8IQuAiHmw8kq+yBb/Bup4VhT5M0SJGaucSCUXghLuz9g0mRiMYJU63py4hglNop8bVMo+ovVb0A+XycLkbvcONKh9Wvy5LgzVSqmRBYauNSZs0jkYBGb/Z2sfhXHWnmLEzCJql9KXfCgZQopUHSlxnVZPzAGp7z6sqKBqiXk/kvMBmtrB+UYJ/8lkSURjb4qHxAqCAC4wRe92v5/f9QTh5mnq7LjB+0uoXnfwGlBs7cTjp8w42lW0egEb8kdDGwKH/dqaNicRhi8SVTHjy5FvvhugJw7p3VmgEQ0GCz3aQYav77fV1Fa+F2xkiT2FeEJhcpNvbGno7by0gQWF/R4gMWJL32K+N/PPKzlvejVd0ZMvfPhADhwcEmNMWImNYbkRYOJ2iP5a30pxtMzg8TUY4noJktx+Rx2laai85oNHzm/dxZLPOQmdwMDYwPoSSZyXh3anwv5ND+1wZ86RWdP+JjmFjlZmisKmQ9KyhvU4Hrp5tVoSVcsiMT3ddtw/XF0rAleNSh/0g/nltkuAx9dcz9/jruImqaovNzGnh8/BTSM5QMMWz+TDvJKHPP1S3vr3zdbvknSP7B3ieUZQAEiTtcjk7rx7aqW/+UgYFtUIjXkDU2pOMlcMqx8oyu8gUkXkkzgXIsuWqn3NYytaR0fjpQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(31686004)(8676002)(16576012)(38100700002)(83380400001)(54906003)(26005)(36756003)(66946007)(31696002)(2906002)(186003)(66476007)(2616005)(66556008)(86362001)(956004)(6916009)(8936002)(316002)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGNUSWZMKzFicjJOMXhjQWhJWDkxbVdEMGY4bGNtMWRrQ1JxVVlDOXFQdEx1?=
 =?utf-8?B?UmNqMjlCQy9HemFvS2luOWtIL2wyYWdXN3ZYTFpFLy9Kdkg3SDBxVmU0dU1a?=
 =?utf-8?B?Nys1M0RLNjRhUWFqenlDNUt4amh4WVU2MTA0YjBUZ01GL2htSXRBUGpuUHFn?=
 =?utf-8?B?dFhWRVhrRkgybHhHbHR0N0lPYWJlT3prcEtINThhUUhkbkphVlNKNEp6MDBn?=
 =?utf-8?B?OVZXZ29TcWY0TkdJTWJHSTgxN1l1Zyt5Q1RoVnFBa1RpOWFSR1RBUkxycXdJ?=
 =?utf-8?B?VHdqQnBpRFZWSE9McUl0QnFibUo4TGREWjFuZ1VCWDZ3NUFBWXQvZ2pmSkNv?=
 =?utf-8?B?VUNGRzcwMTM3OElQam1vNFpPVVdSUW5LTXVBc3NEYUdLRFZ4TXdmcTBYNW9x?=
 =?utf-8?B?L0cvb1ZsWXBFWEYzWi8yTWF0M0x1UVJBWHliWU85SmpoNnFiZWQvY040Z1ZX?=
 =?utf-8?B?Q1ppZHhRYUd5WmZld1BKRVpRNWJLdzkzK3o1Vk04UEJKWkVBWHhoV0Z0VXJ3?=
 =?utf-8?B?cytUbEwyK0lJQWxpbmlQbFV3YytWS1R1N3lpNDFrcC9HY2RSdzdkQlJZVGJI?=
 =?utf-8?B?OEJ0dG9rU0NGcnBsSnIwUlllS1d4ekJmdExtZVQrdlhoK2hVYnFQTHdXeG1p?=
 =?utf-8?B?UkxHajZhUlRHdmVOdGRaeU14MHN5NSsxYXBDTE8yUGhDOTNyWnRtUVhMOGd0?=
 =?utf-8?B?QXRLWEJtcHJmSzBxdG9aMER5QjhYQXpvRVpJWlVoMGlrWFN3OS9DK2F2dkVK?=
 =?utf-8?B?QlpFNXpacXEwVFc3cDZ4N3hob3lxanNqS0lCVVRpcGJ2UjRxV1hpY3VJNE1B?=
 =?utf-8?B?M1p3YlNOaCtDbFNhc1lJVXMwQ1B1QTNITG5DeUpwOEhRdTJwbUxvSU9nVncw?=
 =?utf-8?B?clYzdnM2MHBxbzYxbTBEc0U3dzdSY2dwaGZuTHJMOEZOWHdKcmJlZG5ZZFBT?=
 =?utf-8?B?dXRUR05VVGkzVXZwSUlaOXFPNlJUOTlueER2Y3lTU3cvTjJKdEdSSEk1YUdm?=
 =?utf-8?B?NURFRWhKNHVvN3kvMXJMYWlMdTFtZnhGemdZMFVoYy9ReEJOZnhtZGluTUtG?=
 =?utf-8?B?SVR3TkplTGh3MTM5TmQybVFENlZRd1NWaXpPT0xCbmJ5QXp1QVAwUEJ2Z3I3?=
 =?utf-8?B?dXVkcXo5QXhjdEJ5aEdDV2R2MEJlYVFQdHp4T2Z2bUpFcFV0MkNwWjEyTVJk?=
 =?utf-8?B?VVhDMVk2TmpiV1pBaFFPL3JqQ0NKYmsyQzlTZ3FFMnB0YTV3Ym9EeUhOK0VZ?=
 =?utf-8?B?NEFlNlZTSUpMdmNLdFJoVDVUZGhFenB5VGF0ZnlaWWs0Yy9pbmlJL2pEa1g2?=
 =?utf-8?B?c214YWdrNjh4cWVoTTNyVmlWVEZIRk1DdWs4enlhUC96dzJTanNGdlJVTC9t?=
 =?utf-8?B?SmJyTGp4eVJ5U2RaWUwwdDh4ZHNrYWM0Wkd1dVVITnU0UjJaYUJhYW5MeEx1?=
 =?utf-8?B?bVZrNGdKWkxaKzZ3SW1jWjI0bml4ak1JRWl5akRRUEc2Z21BM2JsakhnT091?=
 =?utf-8?B?WUZvUE55RERFelovNnpVdm80SUFuTU81OEkrdUZnUVFsd2t6L2JXNTZ4K3Y4?=
 =?utf-8?B?eGVmYnVKY3cyQmxaTTlMWGRBSkM2eWxRSUFZekk4TjE0K250VlkwKzlPUi9Z?=
 =?utf-8?B?ZnJwNTFYQnJ1VHY2NlVWMEtyVTBUWTlyS1lSMGd5RWhnK1ZoZEpjWEhZTHZh?=
 =?utf-8?B?S1FZV3N2NktISVBpWEhXeUEwdTZCdXh0ZERLTzh2MGdrMzRabnJmdHdVOVIz?=
 =?utf-8?Q?EdniEpeja+Y27b6FQee1ujltuFhnZY82FEWJ0jY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bee5668-25ff-40b2-1e4e-08d97f401c46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:45:57.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF/11JB0CpfQDFHdLGJYfxGBwxlEPSpV3e77QoVf3Tkwyzf6tqZTggYotoKUkTsSMv3xKYaeqnP2RKR4Zs+VaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

Introduce a helper function to determine the largest possible mapping
that allows covering a request (or the next part of it that is left to
be processed).

In order to not add yet more recurring dfn_add() / mfn_add() to the two
callers of the new helper, also introduce local variables holding the
values presently operated on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -260,12 +260,38 @@ void iommu_domain_destroy(struct domain
     arch_iommu_domain_destroy(d);
 }
 
-int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+static unsigned int mapping_order(const struct domain_iommu *hd,
+                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
+{
+    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
+    unsigned long sizes = hd->platform_ops->page_sizes;
+    unsigned int bit = find_first_set_bit(sizes), order = 0;
+
+    ASSERT(bit == PAGE_SHIFT);
+
+    while ( (sizes = (sizes >> bit) & ~1) )
+    {
+        unsigned long mask;
+
+        bit = find_first_set_bit(sizes);
+        mask = (1UL << bit) - 1;
+        if ( nr <= mask || (res & mask) )
+            break;
+        order += bit;
+        nr >>= bit;
+        res >>= bit;
+    }
+
+    return order;
+}
+
+int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
               unsigned long page_count, unsigned int flags,
               unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -273,10 +299,16 @@ int iommu_map(struct domain *d, dfn_t df
 
     ASSERT(!IOMMUF_order(flags));
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
-                        mfn_add(mfn, i), flags, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        mfn_t mfn = mfn_add(mfn0, i);
+        unsigned long j;
+
+        order = mapping_order(hd, dfn, mfn, page_count - i);
+
+        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
+                        flags | IOMMUF_order(order), flush_flags);
 
         if ( likely(!rc) )
             continue;
@@ -284,14 +316,18 @@ int iommu_map(struct domain *d, dfn_t df
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)),
-                   mfn_x(mfn_add(mfn, i)), rc);
+                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
+
+        for ( j = 0; j < i; j += 1UL << order )
+        {
+            dfn = dfn_add(dfn0, j);
+            order = mapping_order(hd, dfn, _mfn(0), i - j);
 
-        while ( i-- )
             /* if statement to satisfy __must_check */
-            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                            0, flush_flags) )
+            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn, order,
+                            flush_flags) )
                 continue;
+        }
 
         if ( !is_hardware_domain(d) )
             domain_crash(d);
@@ -322,20 +358,25 @@ int iommu_legacy_map(struct domain *d, d
     return rc;
 }
 
-int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
+int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
                 unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
+    unsigned int order;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    for ( i = 0; i < page_count; i++ )
+    for ( i = 0; i < page_count; i += 1UL << order )
     {
-        int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                             0, flush_flags);
+        dfn_t dfn = dfn_add(dfn0, i);
+        int err;
+
+        order = mapping_order(hd, dfn, _mfn(0), page_count - i);
+        err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
+                         order, flush_flags);
 
         if ( likely(!err) )
             continue;
@@ -343,7 +384,7 @@ int iommu_unmap(struct domain *d, dfn_t
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn_add(dfn, i)), err);
+                   d->domain_id, dfn_x(dfn), err);
 
         if ( !rc )
             rc = err;


