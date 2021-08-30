Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE403FB6A7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175033.318971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgvQ-0007SY-U3; Mon, 30 Aug 2021 13:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175033.318971; Mon, 30 Aug 2021 13:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgvQ-0007PR-Pn; Mon, 30 Aug 2021 13:02:08 +0000
Received: by outflank-mailman (input) for mailman id 175033;
 Mon, 30 Aug 2021 13:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKgvP-0007PE-PB
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:02:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4774ae4-e7d8-46ef-9aa8-6a22c1931f19;
 Mon, 30 Aug 2021 13:02:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-dey-5gfhMm6qC3tRISn0WA-1; Mon, 30 Aug 2021 15:02:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 13:02:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:02:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0200.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:02:01 +0000
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
X-Inumbo-ID: a4774ae4-e7d8-46ef-9aa8-6a22c1931f19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o+IIgfHSi4F0KpiDSfgZRI6fCSfRdaE2STDllCN8w38=;
	b=AS1Zv13pN9RY20PeWAQEhAs+POoE4Krr2bDVw+jLzlcG9uK1HrzQ3M+9UXNrYkt/Ugen2I
	lIUAZhHteu5mukbLf4XPxhp8/QcNFb5mEihOvDzYSDfEN35yWDWWwsUzTypRcdavH0C76c
	Q228fAcmyMoZLCVyFSViclcBKhXChkk=
X-MC-Unique: dey-5gfhMm6qC3tRISn0WA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLyD6ZFtpwDP0aKo/ZisWwSyHsGIzm/DwVYdnMKFUCTj/s+SU0uqe/9+Vh4fCZIOZLxgPq0LMsSm2noOVwspb4bv15iJism58t1y+/G16FBQSWTUrbq86a43cAwgiYm0ReUgTyEq34EYZz+V86aIS5wnrB13/I1DMIerVWvLGjyGH9Uj/UlxrF7PDcR/0vIiZIxMY0gvWLpEP/yFYYgwyHx1rVqRt5pixXjw4Wh2EbbONcwr/VVYTwKsS/B8OiESL8zS/6wgNyGXEJs//0IRtZeZpRUbHUuYew7+00KqqKX+UnVh0uvRYxukgwj+3C2GMeZVb8xnfXnflTEyrv9D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+IIgfHSi4F0KpiDSfgZRI6fCSfRdaE2STDllCN8w38=;
 b=WzNJaYv7f0vOFzHt2urYv7YVLe/yK54nt/IxRK7mjraCGqDChSQm3tIMohel55DVAbcwmqDkH4gixWPt7Q935anHdr3AIkl5Mp62aJVEmCYpSaOe6uYcntJpKQCYuCPi5TA7TpPHrJdS5sivqgMm465aRUUpd0cs614h+p4S91funJ1j5GtTiFLDFUPPyTkZd9n3WAh/CzZSBakD4J8KTQ+WeKp5DUymiBIG6GzmONsXVGdavMa49gVMDOqVr2zhQYEv9zPAQ2v5bDJM7dlHr60CiyQOg2O/nNUYTWkG7PGpmggJXBlnRNjPezb8QDgb/NsLHnKL3eEKC4D5U7ZFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Message-ID: <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
Date: Mon, 30 Aug 2021 15:02:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0200.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29e7a721-3af0-438a-948e-08d96bb65c03
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59016C12048E857DDAEF0330B3CB9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CSmH0VwjGDz7tMo2hfIvi9ozMNMp4HjYsnabHpsybWwUVIKbSOyHFF2Rari5MMFlt+0Zz2ieBM2Fr/tV2QCZE6/ETSt6Pmdp0g0cwiyJB68cK3B/tCEoFfgxgBTQ3pgYy7keJzI5W9mabCryV54d+wfVyXtpqqo6DEae09df7pYdUeCMt7fmpf5IyOfhcpdk4J+iQ5dtuCN+FTsac4m0h2HWoz/FU5UOG8mvRSnr8SGpWjGDgUIazv5xzZ8DefhiEMrcCMjnRqAjEMaoBG/QVewDOwZxFyt8ZFs7tKxBSvshQTRK4tAjW+tVyKPh8sDs40umoBQEe4SmwnxRyksndbOBY6rZQSAyxHVLesoV17UxXuPPit7fCJ4MlX5IuQQsKsDwhk1xINojNZCsHWgjCckk3wU6DWzi019NCjfQREqjj6S4Jt2EqktZNIu5KyLFTyWdHUTAEXvtgdIQVPGQpU01WcSdLLUpeS9jYrRLQjKSaC/7xhMJy49x+LKawUmBLyrnrfiTYiKs0lWO4tvH/V8DU72yn4tBWKl/AzFwPvp00MuQ6LsgP4LwQTsk70SJxivgT5wkqHawwrGTcveM1HqG1fIBykXI82PFTalgHmdOAs7Uepe1VQ5aDnOvn7+PbiJmFKDMqMaqoxIPRm0ObTc1Vo4C9aVQ1wRY2DpNLjXh1yH8vCYL6S97hfSFbPnDQklBFOFeAYy+dIfOHyH0GN9sFzx3PPc59d5gtQZwrFDq4hspz1FKJlAZexf41YIF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(316002)(66476007)(6486002)(66556008)(16576012)(6916009)(5660300002)(8936002)(83380400001)(54906003)(8676002)(36756003)(66946007)(38100700002)(186003)(2906002)(4326008)(26005)(86362001)(2616005)(956004)(478600001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnpJZkVIVUZ3Slhkek5vckdZN1Fkbk9pRkViaHY5ekU5SU1ibHZJNUQzcVJs?=
 =?utf-8?B?RCs3MEY5OTdPT255S1RsMndUVVhSNzBCV2tBVTAxS0toRk9Sc0dYWDlOUFFk?=
 =?utf-8?B?RmMya1lSdHBLUmRMbGhyY0FJTWM0R2QzYXF0d205ajBUekk2OG9JVXc1Zldl?=
 =?utf-8?B?dGtITTNha2ROci9CbkROODExM0xJWldNdkdxVE9wUXFRcXZIR0JTMkhOVjIw?=
 =?utf-8?B?bmFCbnZpTGlxcVFGSE1aQVoxZC9NeitBSSsvbkVNcU9qVXhORTlaKzNNTGhl?=
 =?utf-8?B?Mi9jZGlralJMWHArdXFzRWFrWVE3eXIyMHY0YWkrYks0Uk5SdWI3di8wQThC?=
 =?utf-8?B?VVFUbThrQjYvTmhWNFhqL2YwakJFSkVwaGczYlNNN1BSTTZVV2FPZ1JNaGFX?=
 =?utf-8?B?YUdqNmw3dEJWVDVMRnRiaC9mbnNaVjZJMmkxb1VjaDdyL3JvbGM3RlpNNXNT?=
 =?utf-8?B?UlJMQm4xTWZZdmZKNkpGdE13dWVsUkI3K2I2WXhOaXEvMFBjNHd3TG9mbXJC?=
 =?utf-8?B?WFJWNmdDcHJXaTdhRHo4SXM2ckVIanBrQlhmZ05NR25VSk43Z1VxMkYzZ3NK?=
 =?utf-8?B?SW1sbnh1Z01jSzVPdVpPNGdST0RicG1XTUVwWG5idUhCUnlScW9HOHhHc2Ry?=
 =?utf-8?B?MzZnazlmR3ZvZFVpb0g5Q1cvNjJBYjh4blRsL2hkaU5zeFJ2Z2k5T1hqQ1Rl?=
 =?utf-8?B?SGsrQWExSGJPbEtJdDM4OTlIaGozanBzekVqWkh2SnBpNndSdFpWc25YMGdy?=
 =?utf-8?B?aGI2dm5OK2Q2K0xRTGh4VFJVbU41RndZTi9pell2Y2JhUmFNMXM1b29hY2RU?=
 =?utf-8?B?YkRoeWJCUkJ0YVFaOFRGNERPaXdGNWJOYVRmU21lRC9BQUZ6TDFYblhPL3Zx?=
 =?utf-8?B?cWVoQUlZMUFTQVFUZUp1akVyN1JaampYUU1jWWl2TVBRTS9WZkdtc0VQRlpV?=
 =?utf-8?B?NkZhSy9ieWFMVTdMeXFSQVVJNFE0OHY1TXc3LzE2N0cwcENxbjR3bGRvVk9Q?=
 =?utf-8?B?ZVd4a2p0S05iNFJXUnMwS1hvbjFOMEpZYWN4SENvVEk2L1pVOEpwSEM0bmM1?=
 =?utf-8?B?WHN3NWN3cmRUSFFjbjVUUmZrNG0wV1FvY1RTYWxXaS9UOC9KUGV4dnpRNXc0?=
 =?utf-8?B?TjhCQ3NsQzdqL2Y0aS8remt0aTZSaTVMSGc0eFhCQUxYWnRlcmw4bzNjRnVi?=
 =?utf-8?B?WEdKZ2Nzay9UcWovWnRoTHAybFZLVll0ZkhwQ2x3Q3g3SjBjU0tibkswQmFp?=
 =?utf-8?B?TDB1LzVIcE5WZWlHSSswZ1k1TWMvemo1RDlCRXZkL0pjcjFONGMrUXpTaldz?=
 =?utf-8?B?aXQwek9yOTl0VnhJWC9kaGZFZ3RrUXdkNmRrQ3FKOTJFR3A3bDI4aVRHOGxO?=
 =?utf-8?B?S051QXQyUHkrNXIyZlVIN0w4eVFQeVFDY0k4RnNicU1YN2VMUzBhaUhneU0y?=
 =?utf-8?B?SXBoZ09GeHo1VlVJSXoxb0V5eFdaYmltNk5QVCs2MHNoQktSWmJ3a01wTTRF?=
 =?utf-8?B?YmhyRTlNV0xuaERkOE9iV1pIYWNxNDdqUEFHeG9uRUptZ2hBK0RUdHY5MVpj?=
 =?utf-8?B?Z0JqYnZHQlFpTjlrZEliakNMbURTN3hKRVorTmRCYWt0K2xVM3pJUytJS1di?=
 =?utf-8?B?OW1MU0t3TlAwOFVDOXFwNFMzcXpsaEhUVEF3bkVsMk5qZVNnTGRLaEY2RTVj?=
 =?utf-8?B?b1BuTStDK1ZUN2xNQzJRcEs5QXhuYXIrZ1Fhdm4rbjNvTEZNdml5VnlqbHlJ?=
 =?utf-8?Q?+QXO0BRgdS1SrxC0UYwyu3RO9ffeGkMHn1Tck42?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e7a721-3af0-438a-948e-08d96bb65c03
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:02:02.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB7+mFdfXP9QpksOHRfKWj/Dfi4tZBHL8ymdUg3cAbrNmcPuxWYKEn7Ccq19aIupmWumdFv+AR46vjw5pjmycQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

One of the changes comprising the fixes for XSA-378 disallows replacing
MMIO mappings by unintended (for this purpose) code paths. This means we
need to be more careful about the mappings put in place in this range -
mappings should be created exactly once:
- iommu_hwdom_init() comes first; it should avoid the first Mb,
- pvh_populate_p2m() should insert identity mappings only into ranges
  not populated as RAM,
- pvh_setup_acpi() should again avoid the first Mb, which was already
  dealt with at that point.

Fixes: 753cb68e6530 ("x86/p2m: guard (in particular) identity mapping entries")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note: Conflicts with the previously submitted "IOMMU/x86: perform PV
      Dom0 mappings in batches".

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -430,17 +430,6 @@ static int __init pvh_populate_p2m(struc
     int rc;
 #define MB1_PAGES PFN_DOWN(MB(1))
 
-    /*
-     * Memory below 1MB is identity mapped initially. RAM regions are
-     * populated and copied below, replacing the respective mappings.
-     */
-    rc = modify_identity_mmio(d, 0, MB1_PAGES, true);
-    if ( rc )
-    {
-        printk("Failed to identity map low 1MB: %d\n", rc);
-        return rc;
-    }
-
     /* Populate memory map. */
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
@@ -472,6 +461,23 @@ static int __init pvh_populate_p2m(struc
         }
     }
 
+    /* Non-RAM regions of space below 1MB get identity mapped. */
+    for ( i = rc = 0; i < MB1_PAGES; ++i )
+    {
+        p2m_type_t p2mt;
+
+        if ( mfn_eq(get_gfn_query(d, i, &p2mt), INVALID_MFN) )
+            rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
+        else
+            ASSERT(p2mt == p2m_ram_rw);
+        put_gfn(d, i);
+        if ( rc )
+        {
+            printk("Failed to identity map PFN %x: %d\n", i, rc);
+            return rc;
+        }
+    }
+
     if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
     {
         /*
@@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
         nr_pages = PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
                           d->arch.e820[i].size);
 
+        /* Memory below 1MB has been dealt with by pvh_populate_p2m(). */
+        if ( pfn < PFN_DOWN(MB(1)) )
+        {
+            if ( pfn + nr_pages <= PFN_DOWN(MB(1)) )
+                continue;
+
+            /* This shouldn't happen, but is easy to deal with. */
+            nr_pages -= PFN_DOWN(MB(1)) - pfn;
+            pfn = PFN_DOWN(MB(1));
+        }
+
         rc = modify_identity_mmio(d, pfn, nr_pages, true);
         if ( rc )
         {
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -337,7 +337,13 @@ void __hwdom_init arch_iommu_hwdom_init(
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
-    for ( i = 0; i < top; i++ )
+    /*
+     * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
+     * setting up potentially conflicting mappings here.
+     */
+    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
+
+    for ( ; i < top; i++ )
     {
         unsigned long pfn = pdx_to_pfn(i);
         int rc;


