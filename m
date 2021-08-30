Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C8D3FB6A9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175043.318993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgwe-0000Bl-Ir; Mon, 30 Aug 2021 13:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175043.318993; Mon, 30 Aug 2021 13:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgwe-00008b-DA; Mon, 30 Aug 2021 13:03:24 +0000
Received: by outflank-mailman (input) for mailman id 175043;
 Mon, 30 Aug 2021 13:03:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKgwc-0008TI-An
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:03:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5ee4862-0992-11ec-ac87-12813bfff9fa;
 Mon, 30 Aug 2021 13:03:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-5hhDC0mZNTqVg6rGr1Oq0Q-1; Mon, 30 Aug 2021 15:03:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 13:03:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:03:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:03:14 +0000
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
X-Inumbo-ID: a5ee4862-0992-11ec-ac87-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Vo4Dkwt5tDPO7OINdISKIs97Cf1OIMtewg4ko0cXdk=;
	b=dPZT6bgkv0JWkP/m7KtNuWJxv7OxoA1k/t6jB9hZy0hIX7v9uRyp9F35KetVYeU5cKjjke
	9xsy2to1HXl5/+xnZtI1e5MoqAfghpeHHw2afhZ8btvuKZIDUlu5n7y4lJbsQR7269o3cl
	W1ogKD2srsLd79rWDpcKPWizQo5xcOM=
X-MC-Unique: 5hhDC0mZNTqVg6rGr1Oq0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4IQooAn+HJd4MfKZk/G78eDewM0T7ANn9HppOYZjlhRC2mh72iZxrl1AiSyMWZ/RuwkoyOu/zgnHYr4zxj9jcCQOqzrnOCERUGB1gsIWYWiBIRVl/XTyyPdio9T3nqgpliQSMIiRf83E+25ngJEDiSvPOgStynZtNj9SHU+m0AjrU1Cz3DUGrJk8n359tHzcAq9fNtbdLkHVk21SUAaQbx0XRGeqzsMrtW3ZAv7X0YYKx76rP/U7cZ25zsrWl2kw1Zm4cNID9pY7Nq2Y/Z9h6U2il7tCRKmQqvHzfhEyHz2j0E8333EamulKdMpqM24AVm2Ogu3H0IQriyX50p8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vo4Dkwt5tDPO7OINdISKIs97Cf1OIMtewg4ko0cXdk=;
 b=ctN1sDxY9EEHTl9xG02Wx5tW+UZKpSwq275EfztG3aCbblc2NtW2db4hDgOAWjVhII+4Z5svCUK2rto6F9gfIfWfjYsTW8WeKzuNjjsm0o2xzqSGLjOPhtmvPZEmSBOQEIhV/RsxpIB7QV9zhfvKoNf3F+ggngJgBPYY7aOADtTKspfjBVVFsrBig0iJWGvUaWBrdQ1x6y4iJATVorev+uamN1l1A4Gk76wMpdQaMLMxxSSalgryY7AR59TFCI4FuKxoPNdG/YGiG8sm4FDMG83EsaGhS4V6QAuZ2zaYzKSRJ0zieOw3FddSWNiSWXUwCL7SMiObK5QYLynKjjhPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/4] x86/PVH: improve Dom0 memory size calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Message-ID: <a1c71c0a-8bc7-3f6f-ef5c-a0ef854fab33@suse.com>
Date: Mon, 30 Aug 2021 15:03:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d38b6e6d-3f34-45f9-1c93-08d96bb68744
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901EA2CB0388CC4EF8A73A6B3CB9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S3ylkW9CoSVK4xSXaZ0CXLHGVibFaTqY2xdGil4nzZc0uE/a/frcIrKgmDq9TaqHOkoJk6Xsme6ORWPZsYE5rYCuoMQL4IwjLC85Z0kFZLZ+lWcO+7Z9AVWrMGjrAeHgf0x/QvUO6wS+/3cWianYqMesR+J6TEoz7qX4epp2N6g8d1xbkRGZ6KUUos2RFdy3U418ZX2wDooq/oetaYt81PQ3SalP7tnx1DEQXsjSag5qe6+ptdb0JZiB4ScBk8FAHyeeFPu7dUbdsP5yt1XrGPaicVFQ7hXKHmHx1tGZgqmlhr4zQ7ltRYvYU5zGoAvnlZyh6ZuDY5c+msX9sY/r4xTED8B3WCur6ecbiFZbFwUSBnZfkgWHMPW+R/JMGNO1nbgJoXEnzoQbA118mFdY0uKaaCdU1hz1IhpEmCQDO7KWjhEALjTgP+sUPyaoSXiF/DPpjWsPSkJyP/9xU7F5OZ6cYpWsouU4lEIkpMTJVEaWzJCSSxzSHInkBM9t5SqJu2mawUQfAkvurhBw6dc4umgy0y711Ws80CDiXOvQAy1zivjR4mtw+AtPZRpJL3MuaVC4BZF1x/MfWg9EL05D41uppE3ch7rNJ0ZjmR1xBDLwpmFE67ZWXL4gI9KU7/e8zGWEAKflsUxEawjFt6uhKvbvwbQ9FK9uLoepaQuZxc5NGyVt0VImoDjCqOXPt4urZWkbE8TRr1MzHM6Hx5dGzOIg9ItvWJvC9hv1ARNoe+Anv1oCrSXY5TWI32Vl3VepIjisbo+/wFgH3OhDkRZnXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(316002)(66476007)(6486002)(66556008)(16576012)(6916009)(5660300002)(8936002)(83380400001)(54906003)(8676002)(36756003)(66946007)(38100700002)(186003)(2906002)(4326008)(26005)(86362001)(2616005)(956004)(478600001)(31686004)(31696002)(25903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWwwN3h5bGNXRzNMWjEveWlYbDRReVVYOFJpMDhoNjBmWWk1cFNCV2NXVXdV?=
 =?utf-8?B?dHVLaVFFV0ZZSUpTcXVTc2IzemVkRjRRNE40RzN3QnU1T2lzd210akgvdDlt?=
 =?utf-8?B?bHRJblB6QmFRZEV6U1U5N1JpVDN4UVIwWDlFYlNGU3FMSlBmT0RvZjh6aWE4?=
 =?utf-8?B?dE1qSUk3QlVuOTAyYmkvbWJnLzNFdjlEelNMYUI4WlFmOUZ2Sy92UkptaGdF?=
 =?utf-8?B?ZUVlODVBdzBHSnJEdnZ1Y3hmT214VUhxOXhZUWdrSjFVTG52S1lDNnpGREJV?=
 =?utf-8?B?Yi9BRlg5emFqY0c4MUtwTENBSHA1Q3IwblJ3b2dZc0xEaFU1MkpzNEVlNHQv?=
 =?utf-8?B?VEtrS1p6TTQvZTVIS2JySnJ5TTkvRVBlOHFvSGYxTlcxSzVoT2FSRXhsMDcr?=
 =?utf-8?B?blZJVW82THVjZGxIUndMUnZ6S3lnUnhUanUvbGtPNHRadkRMUmd4MmxhaTJZ?=
 =?utf-8?B?eDR3UkhEbDlHcUhibm9jeDhHY2I4M0I4cjJQeXNrdHdVRFNHN25COURCSVJM?=
 =?utf-8?B?QlN3OERoMjJneUlUdnd2cHNqdDZQRmZtTm85ZHlORFpuT2V0VDFIOVYxQUE0?=
 =?utf-8?B?VmVCVlkxbFdmV2NyRHA3bGlqcjlrNkJYcElZNWc0dkUvOVo0M0FxY1NnQWt4?=
 =?utf-8?B?ZWxnVk5IODJOaDM2dDFXQzRvMDFaNXFPRTNsSUl3Mkd3bzd6WjlHNStPVC9Q?=
 =?utf-8?B?QUV5ZGZnOHVucnN5U21Za2w2bWZId1ByNHExeVIxd3ZQRmVwa2RjZ1A2QXpK?=
 =?utf-8?B?K0haUEtFWHFrSzRGN2k2ZGhSNkVjV0RKRHB6S2VLMlAvQU9zNlkzOTlCSXF1?=
 =?utf-8?B?eEhQYlBSL3dqTFRXeUgxb0RLL3Q5OTlIK1FpN01yclZYanh2bXAzQ2cxQytx?=
 =?utf-8?B?U09LVHhLcDhQS2hyVDRmN2c0cTNVcXZtbmFSVzF2R2RqbHpSM0tGMytna2Vk?=
 =?utf-8?B?QlNlRUpTSFhmalV0VzVobVpnQm4zbk9WVGZ0a2kzR0Z5RlJ3NFpoc01YZDRP?=
 =?utf-8?B?QWxwSFZYVS9PV255MEN5b0tLN1BldlNrN1FkRk1CbEhIS3NtUzlBbG5rVlZr?=
 =?utf-8?B?SmRNOTA5cmxlVTY2VURxWGloU0syVVVkR2V5VWZKZyswMm41OWFjVmo1Tmc1?=
 =?utf-8?B?NDdCdnpHYUlmb2xSTmdlTitUbFR1Zjg1MTF6Y05oSTh3NWt0ZmVuanFPa25E?=
 =?utf-8?B?VzBhdHE4OGVYMXZjNUhpME01NjNvcTJpOVpUZEJBRFZUNGRPTkIwNDhZSzhT?=
 =?utf-8?B?dUlCVUpXUnlnSGNwOFI4ODJzVFdtYktmYTBya0Ztb3ExeWMvMlJlaXQ3SnNG?=
 =?utf-8?B?SmdTQkQ5cFljRjhOb0swQmtaWmIyYzdFd2w0UEs1c3lVTUUzR1dMVzFaT2Zo?=
 =?utf-8?B?WjNIWlVVb2pXd3p3em5oVUowTGxoRm12b09Qdm8wTWsybDVicVJLZ0RjTG4z?=
 =?utf-8?B?QnNPZG1vSlIyY3FnQVQxNHhkWUgxNld0cE5HMjhHdFgySSsvMUlBNjlIVTJi?=
 =?utf-8?B?NTlraWtyZFJpa1JQMFhnOTNrczZGY0VQaEpjaXRIUDl3ZDhTaFJhKzUyeVJQ?=
 =?utf-8?B?LzdqZ3NFVWx0bzErb2Z5UVZvSXovaU54anRRYmo4SUdjcmRyUjYvQ2pMWjh5?=
 =?utf-8?B?UnpBWTFydHQvdE1GZldncXl3Q21Kc1owM2ZpT0tKd3lCWUswdjlpNTBIY09T?=
 =?utf-8?B?b29RRWVwcnhaTjlvK3NaTk1Ldm5aRlJNd3ZvcEVsR2hPejBrcllNWVNlUTNU?=
 =?utf-8?Q?nnwFgys6MZHaZEwBgfqWUxBqQ2+QKME4PaClC/G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38b6e6d-3f34-45f9-1c93-08d96bb68744
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:03:14.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYK4CWYjmMjiVYQTOqfr1uxzwY0MvyALIR+QV1e92vY2LszhmLeaBKNer8SL2eZykwIF4uMGNDfQlf2DyIbC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

Assuming that the accounting for IOMMU page tables will also take care
of the P2M needs was wrong: dom0_paging_pages() can determine a far
higher value, high enough for the system to run out of memory while
setting up Dom0. Hence in the case of shared page tables the larger of
the two values needs to be used (without shared page tables the sum of
both continues to be applicable).

While there also account for two further aspects in the PV case: With
"iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
none need accounting for. And if shadow mode is to be enabled, setting
aside a suitable amount for the P2M pool to get populated is also
necessary (i.e. similar to the non-shared-page-tables case of PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -318,7 +318,7 @@ unsigned long __init dom0_compute_nr_pag
     struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
 {
     nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages;
+    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
     bool need_paging;
 
     /* The ordering of operands is to work around a clang5 issue. */
@@ -337,18 +337,23 @@ unsigned long __init dom0_compute_nr_pag
         avail -= d->max_vcpus - 1;
 
     /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) )
+    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
     {
         unsigned int s;
 
         for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            avail -= max_pdx >> s;
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
     }
 
-    need_paging = is_hvm_domain(d) &&
-        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
+    need_paging = is_hvm_domain(d)
+                  ? !iommu_use_hap_pt(d) || !paging_mode_hap(d)
+                  : opt_dom0_shadow;
     for ( ; ; need_paging = false )
     {
+        unsigned long paging_pages;
+
         nr_pages = get_memsize(&dom0_size, avail);
         min_pages = get_memsize(&dom0_min_size, avail);
         max_pages = get_memsize(&dom0_max_size, avail);
@@ -377,11 +382,20 @@ unsigned long __init dom0_compute_nr_pag
         nr_pages = min(nr_pages, max_pages);
         nr_pages = min(nr_pages, avail);
 
-        if ( !need_paging )
-            break;
+        paging_pages = paging_mode_enabled(d) || need_paging
+                       ? dom0_paging_pages(d, nr_pages) : 0;
 
         /* Reserve memory for shadow or HAP. */
-        avail -= dom0_paging_pages(d, nr_pages);
+        if ( !need_paging )
+        {
+            if ( paging_pages <= iommu_pages )
+                break;
+
+            avail -= paging_pages - iommu_pages;
+        }
+        else
+            avail -= paging_pages;
+        iommu_pages = paging_pages;
     }
 
     if ( is_pv_domain(d) &&


