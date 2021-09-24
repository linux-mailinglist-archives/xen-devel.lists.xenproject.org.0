Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9195416F6C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195103.347623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThnM-0007Sx-09; Fri, 24 Sep 2021 09:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195103.347623; Fri, 24 Sep 2021 09:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThnL-0007Qe-Sg; Fri, 24 Sep 2021 09:47:03 +0000
Received: by outflank-mailman (input) for mailman id 195103;
 Fri, 24 Sep 2021 09:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThnK-0007QG-2w
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:47:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b352b52-7d7b-493e-acfc-50dd02446495;
 Fri, 24 Sep 2021 09:47:01 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-2haBhCC6OTyNDQtOH42hIQ-1;
 Fri, 24 Sep 2021 11:46:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:46:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:46:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:46:57 +0000
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
X-Inumbo-ID: 3b352b52-7d7b-493e-acfc-50dd02446495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOSbrpk9/qGJMr59gRB1vlnOjAUciScStVGaTjpeGYw=;
	b=g1JHjEThSty2Dew853P1LWg2/hWkZXRuMkcspy2mJYrwM+HYpYav9DbOl2Rg5G1Ldgw/Cg
	d25G5L2XCUjOti4NhgcArGBkCYw5xe3bAz6nkgpojE1x9662kNs2URc00KBMRnp1ExFTBo
	TZJn77SsqbJj8E+RhETDn5TEzpIU360=
X-MC-Unique: 2haBhCC6OTyNDQtOH42hIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZa79uOnGtugO6xxV8FnTvOdPgOqbVgBWyz9UWvJH5jETbpPKVbBKapFuDIPZcKAfBYBBrK3ZRDM+5zfSR7oj4h70fxQoKZImfN+klSQswlJ+xQ0RSSFR4J3CqwWPuKFos19SefY9F/jCVmJLUzCisrEI9lXEyySF3cvEjtQhbN+uqTSikQyrFj1keoc2fXXpAxLSA2MTtrMyOmL/D0qdZ0RYXHLJDQxYupzaL+QKn6N6jooabeHa7obMrAH+/c2RX7Xwosw9bDTTRJrb8QWT6Yb7rsggIgC5fQSBZA//Ca0flp5e9nTpU0nY24MdXZMPaWqEny1jwbey1+TZbCprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DOSbrpk9/qGJMr59gRB1vlnOjAUciScStVGaTjpeGYw=;
 b=LoOwsR3GnwqvnuOjj7JZGNfrqoID/QkJ2O/qW4WlUT16kK6OP29T9J9E5cIOo29bLzUcmwzQrMic6IJxQHthHA+zeG70C63KuV4CJEPCSdim3MfkusW0hPIDzeGKyPVKtUzaX2r2GN7eGXzQ+NGZZJQTJsJpycMYO5LY9zrJ50fQVeSmLJFzYHQRKODP1IxFyPlj7yBphUXiE5q//Cj1wcFdgqLa6u+jn4eBGKsXvlwtaSOtKlV4Fqve2vIf4Dc5PDesbdY/mEWMRvkGjwDLFAZXhwgENY2J3BUahzu+wj3I/+kTGtChja2N4Kkq0DDyRtH2jEUx94cbtF/weJj6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
Date: Fri, 24 Sep 2021 11:46:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac48827-7f92-469d-dbe7-08d97f40402d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383866C0D352EF8B42E20F3B3A49@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MLQCRiUl3XKfvd42bzVy5+IPs8pb0i0aWkNaOpkkFKOduQPo+u8sPkHT0KiViRrO1MvrJ+XGb0HzdwfI7KgAyOwOiwm4/IfGrE4LwA5f7RkkMYfzM3Luj75FezNoeVv5zrxt8D6rzXRWpf4wCI8pDObeDMUb5x11kTuriDQD6EOGNTCqsU+Ap48uTGaH2Kq8AHOd3WuuC54ss0U/zitPmDup25GzOGr9zFrjUu9K1FavAkWwYuphSXUeJ2yKrxopL3iSxk71eu0r0N4OH3nNq1318nd6C7vJYryYpGRCIjIrVWfSRNuVamql83WVmCCdtCMlIycR+7AtVGJdC8LiE1wwEPDRLuDiG1xRq4rekPYrKaOhnjwfDspvpKwvq8QDwDAhJ1rpaKnUDKLJ3kcnmNFV3I6AQWohGrkoOYYnuPV/UGDZkGiS7aPDtsa7lNqEM4itVBT2b2i8lbjGLfm6ohKZFkPxHw4gz2i9cQ/RwG9BhemYoZaQqci8ckgU1wxXAIlV1i4HTAgu+h0eU5liL+pGvnf0P2HRxz3s5KVuzKWAbuqPhlRzB/p++arwSDKbl81AfouTNc4wxW//7TII/EqlZG+A3G1f3WXkt2Glg3JfuozrQOL74aQryrB3sgEuFh+j8iRarWg9d8Kbw3N7WDFvtxXvtckYQcr3i1aMwi6J0wBgMb02I8D89P3g34rQ2Y/VYo5unSdf+txYtLpClOnHguBtVu53WfKBOjgbkKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(31686004)(8676002)(16576012)(38100700002)(83380400001)(54906003)(26005)(36756003)(66946007)(31696002)(2906002)(186003)(66476007)(2616005)(66556008)(86362001)(956004)(6916009)(8936002)(316002)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0hJa1kwQU9PWmk5bHI5YkZsaW1Ra1p0M1J3dlJ5b0lGWEFkVTErV09DNHVY?=
 =?utf-8?B?TFRHcVI5N1dPc1VYQ0lOcXY5eStkYm1KMUh6STM0N3VDNnY1UkNLT0U5N2hZ?=
 =?utf-8?B?cVBoRS8wQ0JpZldKTW8vSzZZTVJ2K2hPa2FRcXhveUc0Mkk1enhEVHBQSkZn?=
 =?utf-8?B?OGJDNTNFcDR1ODk5eEtXNDBJV05IZ2w1MktZY1NITit1VVdZZ2lJeTRKNDN2?=
 =?utf-8?B?cFgwNWFUUUlSSGJ6RmtIQmsxZXA0UzV3Q0Y1TkdXaFpaVnBqMDV5blFDTDlD?=
 =?utf-8?B?ZkdqWmkyTEdKcmVmUFBrenlrNWh0TnpPc0hvd3FnMXJUZG5kdDNDMEpmaHY1?=
 =?utf-8?B?aER4ZkxKOTREZXN0aWdmNDhJM3BDaXNUQlNhR0dCelJKemJOR3BXN1dXOHJV?=
 =?utf-8?B?L2tjbjRJY1pWNU4wWnMycnJUOEozWlIyNDlxUG5iQXNOcE5Gc0p6M1E2YzYr?=
 =?utf-8?B?aVlIS1A5YXZ1clBuRDBueEFhK3doeHRnV3UySUxUSTRvU1pHWnRkeE1EM0U2?=
 =?utf-8?B?d2VNQWdUdWxtSjNKd202QmNzMzQzc09rcHFscEhOZ0REK2RWSUtOdmVRRElE?=
 =?utf-8?B?VlpXL01OYmVNbkx0MEVBSERhRlVYN3RmZU1MdzZ3Ni9oc0hKbFBnZ0VkVzdr?=
 =?utf-8?B?V0tDczB1engzZEFJZXo5ZG9JUjc3Z3dRa3Q3RC8vYzBaUmxzRTA5SzFMUktL?=
 =?utf-8?B?aHNYYjlZRXZJZHhKaTJIZHpaMmd0NERxYmFKZGd3SXg1NE9Nb3BzblcvcU9S?=
 =?utf-8?B?R3U3bVUyWGpuNTBmc3NaQmhHaERKbWhhaTRQdExMVWRuK21CeTFMUEJaVkYr?=
 =?utf-8?B?QjhaejVqQzlGOGZVTGNXZFNucmY0K3BRdmEvRlh3MCtvODE5NFYyT0puS053?=
 =?utf-8?B?QW44RFlUdmFBcS9kOUhkL1BYWnBJTnFYbGd0RWxlMXNDNFBYd2NZS2tPSnJZ?=
 =?utf-8?B?aHJlcWtaRHJGU1B0cGN5YVJ0bk93RVJsekxYcnJTeVFWL1N4eWJOcG5RZ1Va?=
 =?utf-8?B?NW5SMm1pMlppdFErRWVWcHFjRDdnVHd4a2VKbzhrUlRSSUJOa2VtektkZUNJ?=
 =?utf-8?B?Si9CZmtyZ3pqUU9kSDZWMHhreHB4bHhFT28xUlVveVhxUTBZakVNUUo5d3RY?=
 =?utf-8?B?VzNBRVlMK0s4VTdwb0lVcHpPMVpxZDdXNllSRTM0TXBNSTRNY3BEUkFuUWZv?=
 =?utf-8?B?TFRZcVE2YlRsZEFtbGhvblA2MWE4MU1kdW5FYnB1Qm9Gb3JuTkZ1eGVrb2t4?=
 =?utf-8?B?alVaclVReEg5SlFjQTI3ZWtPSGhYZDI2d0pJSDdEcFE0UE41RHlFcTVzVXpC?=
 =?utf-8?B?QnZnK1A4T3VRUk5tc3BwSFJkWFZOTkRLRElEZWtHdnlJZ3VsaUo2SWQvZkx6?=
 =?utf-8?B?VjhYbHFORFVRRHV0SE9GVE1MRTlwTi8xVi9JYTRYZjRzcDlzWi9aTytsSlQv?=
 =?utf-8?B?ckFXcjE4emJxdC9rSnJ4M01TdFA0eXFKK3E3S2JBWlgxb3VvR0t0cnEzZFll?=
 =?utf-8?B?VXROOGp6OXZuM1hmS2xLckRQbXlSa25zT01FeGsyanBqT2pmVWh1diszWHc1?=
 =?utf-8?B?aXlobTJmT1E2SjNLK3RWbFAwU2J4R0E4cnJhS1EzK0pHVWVKQVFJa2VIQk50?=
 =?utf-8?B?TTFLMzZVcktSaU9lcjBrKzlBelZQeXZYdEtZR1NjQnZDVUVaMldRQVpzdEY0?=
 =?utf-8?B?L3Y2cUREbnB1SWx0TzUzYXJUVGw0T2swQUdKMEtyTnFieHQ5Q1FKR2wzMnJK?=
 =?utf-8?Q?YFRPNOqdxeOqZ1Nf1/qX0j4fJTXwmGu7VM0ThPz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac48827-7f92-469d-dbe7-08d97f40402d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:46:58.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gwnhEXx0zUCGaaw4yV3SPpOwbBnprqS+lTMZ8oq8dkkUDaYe9NgUZSrobX93HQzAzr+jXNIRTsc6hSyeI3yMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

While already the case for PVH, there's no reason to treat PV
differently here, though of course the addresses get taken from another
source in this case. Except that, to match CPU side mappings, by default
we permit r/o ones. This then also means we now deal consistently with
IO-APICs whose MMIO is or is not covered by E820 reserved regions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
[integrated] v1: Integrate into series.
[standalone] v2: Keep IOMMU mappings in sync with CPU ones.

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -253,12 +253,12 @@ void iommu_identity_map_teardown(struct
     }
 }
 
-static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
-                                         unsigned long pfn,
-                                         unsigned long max_pfn)
+static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
+                                                 unsigned long pfn,
+                                                 unsigned long max_pfn)
 {
     mfn_t mfn = _mfn(pfn);
-    unsigned int i, type;
+    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
 
     /*
      * Set up 1:1 mapping for dom0. Default to include only conventional RAM
@@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
      * that fall in unusable ranges for PV Dom0.
      */
     if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
-        return false;
+        return 0;
 
     switch ( type = page_get_ram_type(mfn) )
     {
     case RAM_TYPE_UNUSABLE:
-        return false;
+        return 0;
 
     case RAM_TYPE_CONVENTIONAL:
         if ( iommu_hwdom_strict )
-            return false;
+            return 0;
         break;
 
     default:
         if ( type & RAM_TYPE_RESERVED )
         {
             if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
-                return false;
+                perms = 0;
         }
-        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
-            return false;
+        else if ( is_hvm_domain(d) )
+            return 0;
+        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
+            perms = 0;
     }
 
     /* Check that it doesn't overlap with the Interrupt Address Range. */
     if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
-        return false;
+        return 0;
     /* ... or the IO-APIC */
-    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
-        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-            return false;
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
+                return 0;
+    }
+    else if ( is_pv_domain(d) )
+    {
+        /*
+         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
+         * ones there, so it should also have such established for IOMMUs.
+         */
+        for ( i = 0; i < nr_ioapics; i++ )
+            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
+                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
+                       ? IOMMUF_readable : 0;
+    }
     /*
      * ... or the PCIe MCFG regions.
      * TODO: runtime added MMCFG regions are not checked to make sure they
      * don't overlap with already mapped regions, thus preventing trapping.
      */
     if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
-        return false;
+        return 0;
 
-    return true;
+    return perms;
 }
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
@@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
     for ( ; i < top; i++ )
     {
         unsigned long pfn = pdx_to_pfn(i);
+        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
         int rc;
 
-        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
+        if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
-            rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
+            rc = set_identity_p2m_entry(d, pfn,
+                                        perms & IOMMUF_writable ? p2m_access_rw
+                                                                : p2m_access_r,
+                                        0);
         else
             rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+                           perms, &flush_flags);
 
         if ( rc )
             printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",


