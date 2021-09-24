Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1B416F6E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195110.347634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTho6-0008AL-Bj; Fri, 24 Sep 2021 09:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195110.347634; Fri, 24 Sep 2021 09:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTho6-00088A-6m; Fri, 24 Sep 2021 09:47:50 +0000
Received: by outflank-mailman (input) for mailman id 195110;
 Fri, 24 Sep 2021 09:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTho4-00087y-EL
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:47:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56b188d0-db91-4d15-b6ad-625cb9512862;
 Fri, 24 Sep 2021 09:47:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-kIPxbBSXPkuyq9C-KpSDfQ-1; Fri, 24 Sep 2021 11:47:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 09:47:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:47:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 24 Sep 2021 09:47:41 +0000
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
X-Inumbo-ID: 56b188d0-db91-4d15-b6ad-625cb9512862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oyX0YzgcM98sgcoXD/7eRYbXR7J1MZ8Fv/UNIJmQ4Us=;
	b=bZevIhY4fsTtsOAlmoWzxY2125m59BhXLgZqW6JrPJDYCRQaryFIahPsOoy/MXCHahhW5o
	E8/s6JFmDlXPPmYHKb9I5ZkHfQMXGhU1e5ZVnoIQDBnbJX+HMuNm2vRH+g/296LYHfPfUX
	C/GE5CQ9QutyTTbZmSNI2nVevF9Ruvs=
X-MC-Unique: kIPxbBSXPkuyq9C-KpSDfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU1c2h/q6Te64nCMhuZjMQKFgpkp507DkIyNYQ3+/X/pOvVkgooczSTN1Q8zIWceP8I45aQBGOCytGCB2c4tmxR2W4BSPZf/Cz7A/8Y7iIe1V8hNH8u174lQtjVLxFq5iEDirKU8j2Tr1/PAk+QWvt3L8Q6BWlv8A96oO4+9DDO/Lj7wjXAGAEaspqLur4fIAv2pjBZJtOKn+FbbRUygwlSd1X3/iVeHs8uLovq09LX0wUZKRsHiaRhG7PexVuCQhqIjhF3QJnqjDRBE3sl9/kJUDk7QUucURzfd6zB4bZqLqbfbFxxJaLMO2+qDPToLSQmZ8/G3EMPpW6afUtdljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oyX0YzgcM98sgcoXD/7eRYbXR7J1MZ8Fv/UNIJmQ4Us=;
 b=L6L/Vti8FWFeV+eAWkuC1YSOtOkoQYILXmWoX7dzlSUSfiumXXwlakI6n98nLTc+pKJLjsBVBAF2ZalAc9iTGWkvfjwlxxOYR8GNUabzbJj2tNHl6IHLqIVcPPqhI2Pdaa/bmlldQo2oq6eMLINcgYO6h/BYPmRHwiqkzIMxGI+XuxWT9KDAHzqkZTLywDKdp5C7uoCTtp582xsjViEGbCFaFCwD72jZpB5N2An07XkNhvVIep2rrhQ23kl+pcEO1reRXznlJKL2N2/8hg4nqVG1GK8Ixhvl2ouOB/w7dXCd8RB6f4itMliKh3pJoonqskvb/OEyvffem0QV935FSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 07/18] IOMMU/x86: perform PV Dom0 mappings in batches
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <cc183d61-f4ed-1cf5-185b-0673c9927892@suse.com>
Date: Fri, 24 Sep 2021 11:47:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3359d961-8103-4945-fb6b-08d97f405a78
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54706C786B90078EEC987FDEB3A49@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fmEq7vsEOaF0T0a3PEyqQrIxRDvtouCx1pDXmmZm4BFuaUZeFm0kqt4ugo1ZZprFe6cU7tveuuhF951h7QF/GiPG1BaMaJNrjq+WapevubTmjPK3QGRrLj3qs1Vd/LbVs0XdxcU8kf/NJ0MegS64DYNTzkYUOoNgzzFTTTuAWZM5R2ZmKXrLgQaC0hiJhAC/j7VJwQ2jQ255w+B1+Xjo+mIjqgp7YhYqClfoTnaUL8ofiguvxMBrDaSHgQGLQNtBdu8WhC8awJrA24/NpoAUGC6q+rm8d7KPLVZo0mFzwnyd/EP4VdDp+9EL0VCGJg/Jz33+DzeMCLc97BCeTDGWKa6JsLqTUpH21YIa09rjWGHXcSA4wJr77NHfX2J1vcGWxukdOSc0Bc/LY7lcppDtXBGK1uHHLLC0ElFSEws0RtL9RcFQd/uYhhfLGvppKgjINfVdhQjmfvoFzo1W+NxtS4tP+FVODsPCi4V/ax+UUfhgvDFqhg9C3eN8yRyiYQbkKyHEWM9lV5pJUzUjyM8243Cwvzvz+30plgiXw0pCwF/TPDtXa2OoUFUcwY/KZx2X6xxNpS6GJ8SSn2FchIqJqujVKu8NYhuHsKX+Y2pU/nLYkmFBysAU4iOx1N95Ji2Rzofks0Q61/4rAszDDt1L490cUcUrVy4tXSzkgEi6ci9fDomTxX5bZwcwpoqmreRs5Dz5bD4Af6aBE6Pp4k+x50filgGke5z8TPbEKyDlYLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(186003)(66556008)(66476007)(26005)(2906002)(8676002)(31686004)(86362001)(6486002)(66946007)(8936002)(2616005)(956004)(83380400001)(31696002)(508600001)(38100700002)(5660300002)(16576012)(54906003)(4326008)(316002)(30864003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnNzbkF0aS9FMFQ5RGI5SFBlZklKeGNFN2FRcW11TTRxTWlmQmU0bG5qTlBq?=
 =?utf-8?B?RFlYTnJHTW51K05oNEtOMGFkbkxETDYrWGJtR280QnBtbFFCVk9KNXdNamZF?=
 =?utf-8?B?V2xXK0xuZFhVTXNtckZsSmFqbERYQXUrQVdwcUtia1BETHRudEpXNDF2RlFL?=
 =?utf-8?B?RUlqSFpXbVFtWUpCQ2ozdXRram82bjNYZjJwU3hmR2pjTXVwOGxoK0l5Sm0v?=
 =?utf-8?B?Uk1kUHdjZThrMWNWbkNwUWMwUlROSE1ZZDlsWEt1SzlMYmdDcksyTFJwR3lT?=
 =?utf-8?B?MVJhWnB2VmtrZkR0dW1NT3pLTzZQdGVCeU90M2kzckJIL1AwV3BDSkFCUTV2?=
 =?utf-8?B?NXpSUWcrcW9jbzlsOXluWlo0aTEvaTVJZWJwZTVnTXdHOWlqOXBHUkZEb0p6?=
 =?utf-8?B?Y2tnZ2lRMFRjVXAvSUhlV3VjQ3FmL3RuK1g2eWQvYkhmUUsrSG50UFVrd0l5?=
 =?utf-8?B?NER0TWlMSjVLV1llZEZxQzNoRTZ1eDV2T2x6a3BETmNlSEFyY20yMDdpdHN5?=
 =?utf-8?B?eUwyOExiVkJkYTJNaFVZNWtsS2pzZXA4M0QxU1g2MU5idzBCcmt4TFJBRW42?=
 =?utf-8?B?Vk9pc3BJTzNWSmpndjZNelVQbW0yS0duS0pkaXZjSnVHYURmOHloR2dGZ1JW?=
 =?utf-8?B?ZWk1THBUTXRabmRCT2lUeWs5dGFybkR1dUNaSEt3TU9KdkRFT1M5YkZsejBw?=
 =?utf-8?B?TW9EeHpYdWlLdWloVXVJdTZTWEdGSHRzTUxtcUFxRll1UHU5VzloVHRSckFC?=
 =?utf-8?B?cjcvdVJrYXBlVWMvL3c2Z0xPS0E1bzJwdHhzclNSOE5ZSGt1cVQ3bm9GU1h3?=
 =?utf-8?B?a1l2bThjVzNqNkErV0VIK0IveVNlNHdIa0VVTjZ1SXFZOVFSQ1gwL2h0NjBZ?=
 =?utf-8?B?N2xzYXFPQzJGMkVuTldmNXRKSVZYemNzYlcyRjV0YlpWaUp5a2ErM3VhY25a?=
 =?utf-8?B?U2hIcUErc1NLK1RtdGhVSXZ0RGZ0d0ROdHdMdEVuS3RVVy9pV1RoY05TUnRk?=
 =?utf-8?B?UGZ6cXNxUUtQd1c2MlIydHFIblRqVmlzeDhSVG5jdDFmSHNGYjdHNEpDNmFG?=
 =?utf-8?B?ZnFveVIrY2x5dGRtS3hCWEFId1VOVGpkZnNLYnlvQnQyUTNBUVVWL0dvVzdU?=
 =?utf-8?B?b2ZzYVk1YTM0R1B0ZXVqYnFwcUNpdXZDSjdlczFGZCsvVVNTeVd1Q3Z4Nmo5?=
 =?utf-8?B?SDliMFg4QXR2cDBKUDRzUTVtSm5QcWQ2eCt5TVB6T1UyZVRjR1pKbnFIY0Qw?=
 =?utf-8?B?c0dTTFdvanFEQkN2OW0wWEVPbWpHYTRJbkg2TmlRUDNMUnhLSGlFNlZtd0dL?=
 =?utf-8?B?Z0xpQWlrMytqTjF3cHVxVkI3U2xPdWhLT2JlUE82dlVGNjQ0WmppYVcxdGp6?=
 =?utf-8?B?cGtCSDBMR2ZmTGFWU2J3dTRiYXJFWXJiNnp4TUQ5Z0xNd3BKSVVwWlprbE50?=
 =?utf-8?B?RVJOVXVuT0N2MlF4MmYxOFJ0N2E2Y0JRWnJZZDVoVWcwUERBUWtYeVpISGJS?=
 =?utf-8?B?L0MzeHMrdnoyVmloYzVISVRVU09vT2JBQWVEZlkwNkp4YTNkZ2lzWGpBa1Uw?=
 =?utf-8?B?OWhjQ1NyNXVWS2ZxUFQySXRmMUU4cHdiUHhZWHJsaHl2c21pcDlaQWF6dXRE?=
 =?utf-8?B?V25YN1piZGNhT1JLTHFyT2FyNmZnVFBmQ0c5RGtxaSs1VEN0Z3JvdkFodEhQ?=
 =?utf-8?B?VEY1bWhWeWRkTUJWbllxVk1IcG1uWHdqYy8rZ3ZIMVBPanppTHZHS1lWZ0xk?=
 =?utf-8?Q?jW0GJaqWJAqq5+rJ4UVpC4BVLcK+fxw5efC71mj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3359d961-8103-4945-fb6b-08d97f405a78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:47:42.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UvDYijL80joRxvqUXbDRrCFgBXI/RAWVyZyTTcJ/4obGxS6pVuqTJRaHMcDr9uTi3X/hCHD/KrFMQPrfT6rGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

For large page mappings to be easily usable (i.e. in particular without
un-shattering of smaller page mappings) and for mapping operations to
then also be more efficient, pass batches of Dom0 memory to iommu_map().
In dom0_construct_pv() and its helpers (covering strict mode) this
additionally requires establishing the type of those pages (albeit with
zero type references).

The earlier establishing of PGT_writable_page | PGT_validated requires
the existing places where this gets done (through get_page_and_type())
to be updated: For pages which actually have a mapping, the type
refcount needs to be 1.

There is actually a related bug that gets fixed here as a side effect:
Typically the last L1 table would get marked as such only after
get_page_and_type(..., PGT_writable_page). While this is fine as far as
refcounting goes, the page did remain mapped in the IOMMU in this case
(when "iommu=dom0-strict").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently p2m_add_identity_entry() may want to also gain an order
parameter, for arch_iommu_hwdom_init() to use. While this only affects
non-RAM regions, systems typically have 2-16Mb of reserved space
immediately below 4Gb, which hence could be mapped more efficiently.

The installing of zero-ref writable types has in fact shown (observed
while putting together the change) that despite the intention by the
XSA-288 changes (affecting DomU-s only) for Dom0 a number of
sufficiently ordinary pages (at the very least initrd and P2M ones as
well as pages that are part of the initial allocation but not part of
the initial mapping) still have been starting out as PGT_none, meaning
that they would have gained IOMMU mappings only the first time these
pages would get mapped writably.

I didn't think I need to address the bug mentioned in the description in
a separate (prereq) patch, but if others disagree I could certainly
break out that part (needing to first use iommu_legacy_unmap() then).

Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
They'll end up mapped via the later get_page_and_type().

As to the way these refs get installed: I've chosen to avoid the more
expensive {get,put}_page_and_type(), putting in place the intended type
directly. I guess I could be convinced to avoid this bypassing of the
actual logic; I merely think it's unnecessarily expensive.

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -106,11 +106,26 @@ static __init void mark_pv_pt_pages_rdon
     unmap_domain_page(pl3e);
 }
 
+/*
+ * For IOMMU mappings done while building Dom0 the type of the pages needs to
+ * match (for _get_page_type() to unmap upon type change). Set the pages to
+ * writable with no type ref. NB: This is benign when !need_iommu_pt_sync(d).
+ */
+static void __init make_pages_writable(struct page_info *page, unsigned long nr)
+{
+    for ( ; nr--; ++page )
+    {
+        ASSERT(!page->u.inuse.type_info);
+        page->u.inuse.type_info = PGT_writable_page | PGT_validated;
+    }
+}
+
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
                                     unsigned long v_start, unsigned long v_end,
                                     unsigned long vphysmap_start,
                                     unsigned long vphysmap_end,
-                                    unsigned long nr_pages)
+                                    unsigned long nr_pages,
+                                    unsigned int *flush_flags)
 {
     struct page_info *page = NULL;
     l4_pgentry_t *pl4e, *l4start = map_domain_page(_mfn(pgtbl_pfn));
@@ -123,6 +138,8 @@ static __init void setup_pv_physmap(stru
 
     while ( vphysmap_start < vphysmap_end )
     {
+        int rc = 0;
+
         if ( domain_tot_pages(d) +
              ((round_pgup(vphysmap_end) - vphysmap_start) >> PAGE_SHIFT) +
              3 > nr_pages )
@@ -176,7 +193,22 @@ static __init void setup_pv_physmap(stru
                                              L3_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
-                *pl3e = l3e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
+                mfn_t mfn = page_to_mfn(page);
+
+                if ( need_iommu_pt_sync(d) )
+                    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn,
+                                   SUPERPAGE_PAGES * SUPERPAGE_PAGES,
+                                   IOMMUF_readable | IOMMUF_writable,
+                                   flush_flags);
+                if ( !rc )
+                    make_pages_writable(page,
+                                        SUPERPAGE_PAGES * SUPERPAGE_PAGES);
+                else
+                    printk(XENLOG_ERR
+                           "pre-mapping P2M 1G-MFN %lx into IOMMU failed: %d\n",
+                           mfn_x(mfn), rc);
+
+                *pl3e = l3e_from_mfn(mfn, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L3_PAGETABLE_SHIFT;
                 continue;
             }
@@ -202,7 +234,20 @@ static __init void setup_pv_physmap(stru
                                              L2_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
-                *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
+                mfn_t mfn = page_to_mfn(page);
+
+                if ( need_iommu_pt_sync(d) )
+                    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, SUPERPAGE_PAGES,
+                                   IOMMUF_readable | IOMMUF_writable,
+                                   flush_flags);
+                if ( !rc )
+                    make_pages_writable(page, SUPERPAGE_PAGES);
+                else
+                    printk(XENLOG_ERR
+                           "pre-mapping P2M 2M-MFN %lx into IOMMU failed: %d\n",
+                           mfn_x(mfn), rc);
+
+                *pl2e = l2e_from_mfn(mfn, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
                 continue;
             }
@@ -310,6 +355,7 @@ int __init dom0_construct_pv(struct doma
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
     struct page_info *page = NULL;
+    unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
@@ -572,6 +618,18 @@ int __init dom0_construct_pv(struct doma
                     BUG();
         }
         initrd->mod_end = 0;
+
+        count = PFN_UP(initrd_len);
+
+        if ( need_iommu_pt_sync(d) )
+            rc = iommu_map(d, _dfn(initrd_mfn), _mfn(initrd_mfn), count,
+                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+        if ( !rc )
+            make_pages_writable(mfn_to_page(_mfn(initrd_mfn)), count);
+        else
+            printk(XENLOG_ERR
+                   "pre-mapping initrd (MFN %lx) into IOMMU failed: %d\n",
+                   initrd_mfn, rc);
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -605,6 +663,22 @@ int __init dom0_construct_pv(struct doma
 
     process_pending_softirqs();
 
+    /*
+     * We map the full range here and then punch a hole for page tables via
+     * iommu_unmap() further down, once they have got marked as such.
+     */
+    if ( need_iommu_pt_sync(d) )
+        rc = iommu_map(d, _dfn(alloc_spfn), _mfn(alloc_spfn),
+                       alloc_epfn - alloc_spfn,
+                       IOMMUF_readable | IOMMUF_writable, &flush_flags);
+    if ( !rc )
+        make_pages_writable(mfn_to_page(_mfn(alloc_spfn)),
+                            alloc_epfn - alloc_spfn);
+    else
+        printk(XENLOG_ERR
+               "pre-mapping MFNs [%lx,%lx) into IOMMU failed: %d\n",
+               alloc_spfn, alloc_epfn, rc);
+
     mpt_alloc = (vpt_start - v_start) + pfn_to_paddr(alloc_spfn);
     if ( vinitrd_start )
         mpt_alloc -= PAGE_ALIGN(initrd_len);
@@ -689,7 +763,8 @@ int __init dom0_construct_pv(struct doma
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
-        if ( !page->u.inuse.type_info &&
+        if ( (!page->u.inuse.type_info ||
+              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
              !get_page_and_type(page, d, PGT_writable_page) )
             BUG();
     }
@@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
     /* Pages that are part of page tables must be read only. */
     mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
 
+    /*
+     * This needs to come after all potentially excess
+     * get_page_and_type(..., PGT_writable_page) invocations; see the loop a
+     * few lines further up, where the effect of calling that function in an
+     * earlier loop iteration may get overwritten by a later one.
+     */
+    if ( need_iommu_pt_sync(d) &&
+         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_pt_pages,
+                     &flush_flags) )
+        BUG();
+
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
         shared_info(d, vcpu_info[i].evtchn_upcall_mask) = 1;
@@ -793,7 +879,7 @@ int __init dom0_construct_pv(struct doma
     {
         pfn = pagetable_get_pfn(v->arch.guest_table);
         setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
-                         nr_pages);
+                         nr_pages, &flush_flags);
     }
 
     /* Write the phys->machine and machine->phys table entries. */
@@ -824,7 +910,9 @@ int __init dom0_construct_pv(struct doma
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);
-            if ( !page->u.inuse.type_info &&
+            if ( (!page->u.inuse.type_info ||
+                  page->u.inuse.type_info == (PGT_writable_page |
+                                              PGT_validated)) &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
@@ -840,22 +928,41 @@ int __init dom0_construct_pv(struct doma
 #endif
     while ( pfn < nr_pages )
     {
-        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
+        count = domain_tot_pages(d);
+        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
             panic("Not enough RAM for DOM0 reservation\n");
+        mfn = mfn_x(page_to_mfn(page));
+
+        if ( need_iommu_pt_sync(d) )
+        {
+            rc = iommu_map(d, _dfn(mfn), _mfn(mfn), domain_tot_pages(d) - count,
+                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+            if ( rc )
+                printk(XENLOG_ERR
+                       "pre-mapping MFN %lx (PFN %lx) into IOMMU failed: %d\n",
+                       mfn, pfn, rc);
+        }
+
         while ( pfn < domain_tot_pages(d) )
         {
-            mfn = mfn_x(page_to_mfn(page));
+            if ( !rc )
+                make_pages_writable(page, 1);
+
 #ifndef NDEBUG
 #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
 #endif
             dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
 #undef pfn
-            page++; pfn++;
+            page++; mfn++; pfn++;
             if ( !(pfn & 0xfffff) )
                 process_pending_softirqs();
         }
     }
 
+    /* Use while() to avoid compiler warning. */
+    while ( iommu_iotlb_flush_all(d, flush_flags) )
+        break;
+
     if ( initrd_len != 0 )
     {
         si->mod_start = vinitrd_start ?: initrd_pfn;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -325,8 +325,8 @@ static unsigned int __hwdom_init hwdom_i
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn;
-    unsigned int flush_flags = 0;
+    unsigned long i, top, max_pfn, start, count;
+    unsigned int flush_flags = 0, start_perms = 0;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -357,9 +357,9 @@ void __hwdom_init arch_iommu_hwdom_init(
      * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
      * setting up potentially conflicting mappings here.
      */
-    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
+    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
 
-    for ( ; i < top; i++ )
+    for ( i = start, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
@@ -372,16 +372,30 @@ void __hwdom_init arch_iommu_hwdom_init(
                                         perms & IOMMUF_writable ? p2m_access_rw
                                                                 : p2m_access_r,
                                         0);
+        else if ( pfn != start + count || perms != start_perms )
+        {
+        commit:
+            rc = iommu_map(d, _dfn(start), _mfn(start), count,
+                           start_perms, &flush_flags);
+            SWAP(start, pfn);
+            start_perms = perms;
+            count = 1;
+        }
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           perms, &flush_flags);
+        {
+            ++count;
+            rc = 0;
+        }
 
         if ( rc )
             printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
                    d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
 
-        if (!(i & 0xfffff))
+        if ( !(++i & 0xfffff) )
             process_pending_softirqs();
+
+        if ( i == top && count )
+            goto commit;
     }
 
     /* Use if to avoid compiler warning */


