Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21D3A0FA8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139086.257291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquVV-0000iN-6D; Wed, 09 Jun 2021 09:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139086.257291; Wed, 09 Jun 2021 09:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquVV-0000fT-2X; Wed, 09 Jun 2021 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 139086;
 Wed, 09 Jun 2021 09:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquVT-0000Q5-Ix
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:28:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c343e9ff-0e8a-4e9f-b23b-3b508e18ced6;
 Wed, 09 Jun 2021 09:28:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-1qUaJkRgN0yKtsxnkFY_YQ-1; Wed, 09 Jun 2021 11:28:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 09:28:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:28:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Wed, 9 Jun 2021 09:28:05 +0000
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
X-Inumbo-ID: c343e9ff-0e8a-4e9f-b23b-3b508e18ced6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mANegH+ahRiJ8qcgWzaWhVXVsUaVgtH5xHgoOdjJtEU=;
	b=d4vkRo+sAQabZqK6NS1OiuFmLas71JcdTbkDiFVeLDituUsgZmgdZoDQ12EbOx9vUgUQs3
	/8Vf7TNAr8IwYVFp0cDc4zwNw2lW0FKNCKuDjhXnjzbf/6Cbc90BQrJ5V0kMbxpSXhyDwC
	9EIyUYpFhqmh3tjUkisv6erx+8AH75Q=
X-MC-Unique: 1qUaJkRgN0yKtsxnkFY_YQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWXoUqqU1ASNj3QxKBMfrOmehvEGHmmIWefTp8hInHTtpet7ZWsjr55FiSdpKsWieUFuf9IrmXLGmekNOnxLJAQBwMpmJLe7R6TuYr+D0Whi5pTrvnnUtAeGFvzcr4ss9mEEVnz+Ig5W3RkFdtvGnh84BIUn6sJlUPdw43qCOR/OoL+8Rn+cftXfz3DOoBlIDTzWT2lDmlPKX8DqVYnQTUcvc/THz6hUisxN8SiY/IikfIwDXMgQYHlXAoaR/4Vj4IuL2Z1IuLUSJ1viL6oPh7IkPtSKvyrvhWNO21EN/ix4MODavYFKMnlSToDyTU9f+ympwppBg0uVz7aYG0CnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mANegH+ahRiJ8qcgWzaWhVXVsUaVgtH5xHgoOdjJtEU=;
 b=nTgcUPHSxx1aujN/DSE/kSsDGv8qtbo3VxRKkif1L5GRZcKbHlrQrA8/rr1ii9TogTgdXIGqBhGEb6OvRjZdBhXa21H0UE/kGuotTKwHSdxpTPZSwCa6WQNKOpsU29Wc3h6s6uOfJAX+vLlMgKcFTxwhRV9F6NtqPW1U1MmJndh5B7Bfs28r05rXd8+JlqQd0x8C/z7TDFNVRP7oeSQwzvEpX1Rr7/wVCJSgg9Eat9AsbIHVPYuum3TyUEdj2vd/CVWKmIKr1dNkVr/obyHL7yIvLypCff+K4cq33ayoGYJ8MxCyQMmUF2ynCZZV08xYVi5tMRAoJrUg1KBE8cNHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/9] VT-d: adjust domid map updating when unmapping context
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <be453d69-dfa8-1f75-b30f-918229c73d02@suse.com>
Date: Wed, 9 Jun 2021 11:28:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 862e2902-a531-4e21-16a9-08d92b28e2cd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845AC4BBE792F71DC25110DB3369@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wJB3rfqD93rkArIx6w47OGzy+pLaykv1quFMUv/tAVTjalCwGmrPSSdt8IWB5ltip+4ysLyLNkb8qSkYDnOzETYKAKSIzxcERHeUumZDUfNre5u5cXoCHfsCM3RhMzKdWLTZLL/H+a/uwok+mzWk0RhgqqyqtCagTmaYJ2a8n3AgS4QHqiAqlwO4llWZHxTAqOo7tB79r2FOB5wYn0U3SffLFc76pvOCj/XeZ/QqtbeZZJzBzZlXGEP+W/sOoYsEq6euMQU/iC9BDx6Zvrrm3GpRFm0e6TabeiU4C5PLTWz8jNm6ic3NqMx/PSfPI3Xj7nOu3FAwZcUTgk/LqnSi/soOSEFlJIchTDa2r3aKZsBzCUu+krrKUwz3KAQY1rn2Urnr5e38LckreKycWWUSUMAOtp4kEsna1vHGsI9iEZIXVCj9pAII1OuMD8zIcNRTg9MLe3q6me67Em8xpXk9tmhy/RYKLVFkVtjjWe7xwOBPbtstw9dmueRf9NeLAsalUsLbEJ6xOH7gn3YOFtiyGXgOS1sTrIq99IeovsiVkY+tRZszBF1fR3PvRg07gGglUlQvTS/rXWdVyRafrN2NAvcJcuafKgWb9gU3FoPRvfsI3K8upnaFJvfNn6QTCwzWq8auHanaaLyblLk3imZsHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39860400002)(376002)(346002)(316002)(478600001)(86362001)(8676002)(38100700002)(83380400001)(16526019)(26005)(186003)(36756003)(956004)(4326008)(2616005)(8936002)(5660300002)(6486002)(31696002)(6916009)(2906002)(66946007)(54906003)(31686004)(16576012)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?cUR5T2toMDZxZU9xVEJscW5raW1yUERyZFFSaG9rTFdscXZQYjNjOFI4ZnBa?=
 =?utf-8?B?b2JCN2trNU1KcGlud2Nxd2pmMHNUM3ZCYkdjb0NncXZZQ3lRTFlZeDFuUWMr?=
 =?utf-8?B?YXFWMjZ3MEFwaGVZWWtyZlFPQ3oyMVV0cWNqN2VrQ2FEOTVPRm11ejVHTFgx?=
 =?utf-8?B?ck1JYW9NcS9hdHN1VFdaakdKVytoUExwcjBHb2VCdTB4aXIwVFZjYXFVbGJx?=
 =?utf-8?B?anlLMU9pQXdhSU9QZG15Yzd5YWlmYWFTeWJwZUp6SlVoN002Zi9IT0tXamNO?=
 =?utf-8?B?NHpMbTJkVWtNZUVuMGxqbENHQWZSWHkyVURiM0ppeVRwRkh4UjFmbmpiM0VH?=
 =?utf-8?B?YU9JczZFSHQ5YVFWUnJQSjd5dXZSMkFOc00vdUROUFBhVStKVlFjbGxraWFI?=
 =?utf-8?B?cjlLZ3lJN0lqcVpFQjNta3lLcE1FMFZuVVVVOE9GWnZ0UzB5ZUdPMnZiQXhq?=
 =?utf-8?B?R0JobDVGamQ5cUxGK3ZTUytNOU41dW02OG8xdEZBNjFkbnB3cld3RWpZazRX?=
 =?utf-8?B?ZVh4dlpFZ0JoZXNhNmhrSHBFRnlTc2ZQcXBoTXpDZFdYUndOcDFRZUpOMjVW?=
 =?utf-8?B?R1dnZmZOd0drQ1Y3QnhhdnJOMXhyU2ozcWtsOGFMTEtCdGxUYUhzSlhiRnBL?=
 =?utf-8?B?ZE9iR3NXSDZ0RXBBQXI1eFJkVlFEdmVIcHBYOFVIdEVUeUVZVzZGU3lMK2hr?=
 =?utf-8?B?Q052UHN4dlFOYUplMkZiT3A3R1VySkNmWjUwWlNQUHVmS0NKalI3Tm9lT1Nl?=
 =?utf-8?B?bjdpdDkzbU9kYmt4M05SZFNQN2I4V2lFczN5T1VuVmo1MTAzZzhGYkFoMEtn?=
 =?utf-8?B?bkJOSzBDTlFoaEJNQmV6c2hxMXMxeTNGU0NpVWFITXlLK2tNdkVpUUNVRWFz?=
 =?utf-8?B?NXBqV0pOQStoc3JvVTNwZlVPc3BIOWlEa3RDaTVLQ0h6MEdrMDBTQTkrYTc0?=
 =?utf-8?B?Q1g0VW9vUVh3UHMrb2grMXFkQSswQnc3ZWh4ZEM1dFpLNFJCc0d1bDNUZU4y?=
 =?utf-8?B?S3VwTCtjOTNHQitGbkNHUUg1TmVrVTYwSnpHWTZiakJDRHZuWloyZVh3VU44?=
 =?utf-8?B?L3MwVnI2QTJWNFQ5cFNzZ0hwY1luMzZWQ1dlREpINTV5SnFXd3dBNTZaZ1J2?=
 =?utf-8?B?QnlvdkhHTzQ0aGttK1lnSHpoQldwRE9ySFc2QjFjRW1yN3lEWG5PbHl4dk8v?=
 =?utf-8?B?QU5wRTYyb284UkFoKzNzbVJ4T2dMVm1JRjNSWEFYUXpGQkk1UFE0V21jbmNq?=
 =?utf-8?B?VmhmQ0lodGxSWjdmOFNYMkFYb0NCV2FGaDhHYWh6KzNVb1pUUS9HMXFmUC9S?=
 =?utf-8?B?U1Flb1lTQU02b0tiaERqaHZrYy9Wb1RKZ0J1alExaS9mWUZZZ3VQZ2JPUDdu?=
 =?utf-8?B?N2YrR1pxdEM0bDd0NU1xNHhRTGNNdlk0NGtTUGZqRk9EODFsM2lod1VKaUVU?=
 =?utf-8?B?TFJtRi9aLzYzbWtzNXo5MlRrM0J5VWFuTEhZUElqbS9RMHp3bllMb2p6S1NH?=
 =?utf-8?B?QmpKWWFDa2o0aHEzVENQcEp1aXZkNTZ2cWMvTHNacUNnbHJQd2dTZ1FLUVo2?=
 =?utf-8?B?cXByWDJKRU5aK01CaitmQjhFQ3VhYVoyM2VZWUlxSnppS2RSOStrTmNNNWdV?=
 =?utf-8?B?U01KNUJjZGxTVnU1cFhPRkF0TVJJYTR2SXhPaVZoQTRuVG1iUlZabkZJTWdB?=
 =?utf-8?B?dzF3MkVDMlRTYWpiRG8yT3FrQ1BMOFFSNXhJVVZFZy9teTgwYzVNWHFaKzlz?=
 =?utf-8?Q?azTlMkIayyTESo4HNPWnuO42LshTfYoPq834VES?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862e2902-a531-4e21-16a9-08d92b28e2cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:28:05.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSrSppcoRmVLvYDhZT3JZdzcdZdWHRVbO0wNdl3lYgbs1jMd7FwNOGnJqW9vKxzTHFnXG/+RSyHiwTv1u5gS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

When an earlier error occurred, cleaning up the domid mapping data is
wrong, as references likely still exist. The only exception to this is
when the actual unmapping worked, but some flush failed (supposedly
impossible after XSA-373). The guest will get crashed in such a case
though, so add fallback cleanup to domain destruction to cover this
case. This in turn makes it desirable to silence the dprintk() in
domain_iommu_domid().

Note that no error will be returned anymore when the lookup fails - in
the common case lookup failure would already have caused
domain_context_unmap_one() to fail, yet even from a more general
perspective it doesn't look right to fail domain_context_unmap() in such
a case when this was the last device, but not when any earlier unmap was
otherwise successful.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -80,9 +80,11 @@ static int domain_iommu_domid(struct dom
         i = find_next_bit(iommu->domid_bitmap, nr_dom, i+1);
     }
 
-    dprintk(XENLOG_ERR VTDPREFIX,
-            "Cannot get valid iommu domid: domid=%d iommu->index=%d\n",
-            d->domain_id, iommu->index);
+    if ( !d->is_dying )
+        dprintk(XENLOG_ERR VTDPREFIX,
+                "Cannot get valid iommu %u domid: %pd\n",
+                iommu->index, d);
+
     return -1;
 }
 
@@ -147,6 +149,17 @@ static int context_get_domain_id(struct
     return domid;
 }
 
+static void cleanup_domid_map(struct domain *domain, struct vtd_iommu *iommu)
+{
+    int iommu_domid = domain_iommu_domid(domain, iommu);
+
+    if ( iommu_domid >= 0 )
+    {
+        clear_bit(iommu_domid, iommu->domid_bitmap);
+        iommu->domid_map[iommu_domid] = 0;
+    }
+}
+
 static void sync_cache(const void *addr, unsigned int size)
 {
     static unsigned long clflush_size = 0;
@@ -1724,6 +1737,9 @@ static int domain_context_unmap(struct d
         goto out;
     }
 
+    if ( ret )
+        goto out;
+
     /*
      * if no other devices under the same iommu owned by this domain,
      * clear iommu in iommu_bitmap and clear domain_id in domid_bitmp
@@ -1743,19 +1759,8 @@ static int domain_context_unmap(struct d
 
     if ( found == 0 )
     {
-        int iommu_domid;
-
         clear_bit(iommu->index, &dom_iommu(domain)->arch.vtd.iommu_bitmap);
-
-        iommu_domid = domain_iommu_domid(domain, iommu);
-        if ( iommu_domid == -1 )
-        {
-            ret = -EINVAL;
-            goto out;
-        }
-
-        clear_bit(iommu_domid, iommu->domid_bitmap);
-        iommu->domid_map[iommu_domid] = 0;
+        cleanup_domid_map(domain, iommu);
     }
 
 out:
@@ -1775,6 +1780,7 @@ static void iommu_domain_teardown(struct
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct mapped_rmrr *mrmrr, *tmp;
+    const struct acpi_drhd_unit *drhd;
 
     if ( list_empty(&acpi_drhd_units) )
         return;
@@ -1786,6 +1792,9 @@ static void iommu_domain_teardown(struct
     }
 
     ASSERT(!hd->arch.vtd.pgd_maddr);
+
+    for_each_drhd_unit ( drhd )
+        cleanup_domid_map(d, drhd->iommu);
 }
 
 static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,


