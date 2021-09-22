Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CD414C31
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192870.343584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3NN-0003DE-Re; Wed, 22 Sep 2021 14:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192870.343584; Wed, 22 Sep 2021 14:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3NN-00039d-N6; Wed, 22 Sep 2021 14:37:33 +0000
Received: by outflank-mailman (input) for mailman id 192870;
 Wed, 22 Sep 2021 14:37:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3NN-00039P-3K
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:37:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e2aad00-1bb2-11ec-b99e-12813bfff9fa;
 Wed, 22 Sep 2021 14:37:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-XzJ_7qFmMF64tdWfjv1idA-1; Wed, 22 Sep 2021 16:37:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:37:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:37:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:101:16::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:37:28 +0000
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
X-Inumbo-ID: 9e2aad00-1bb2-11ec-b99e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73rBnD5E2FMoCGn+vOvsFjvD7EEVJfzmIbJDfM5L9dI=;
	b=M74c+d+aHzoTjuu9rAlta0Gd22luR8rqINPmPtk11DBXP5VlXyqcxwc/nBi0lO36VXox8c
	NPussEIkRJKZshbt4JGz0sCJkLY0XBjR3SmVQZTZvMkSIWZuqP5erXNnm35+37iUi8Mcn1
	oR3EyE+x1EZVMePAAa1Lp00UPZKd4iQ=
X-MC-Unique: XzJ_7qFmMF64tdWfjv1idA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9ZvOcIjJjphRQ9dBFZK6l11mtyJRXLh1VrsY/ZDs9Bx87l4imURxLSYFy2zqJE7o46KqdXT/Kdp4jvwM3/BIyKUgn6JgKDgzaZ6yJWAsqGTtVY16hXGm6GWnfCIuABUMf8hTyPz5VlYKVDhBTOWZqPoN6di9PMsaGyq2hDrwObt7LOqji6OZzTwivTVnjWaqR/TDDJZUsiVlBR2dtEyMZouI2ay9GUraTB7jTsb+i8EplpGrVnK8i1emPQhVJ+RU2Jzf5wCNdNktfZn9LRgr5zzzR6WEZI23JGoekh9stE7RkPPBt2Miqmk5oILnuu4xqn2uRdIHTGFcKIPrN3f/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=73rBnD5E2FMoCGn+vOvsFjvD7EEVJfzmIbJDfM5L9dI=;
 b=QGaMDTiRfSVZNMsJDnAGFVAhQ4nZMkUZUDPpL63U4Z6x6uYsguq5U7h7lsgBqt3UBjp4zS2xlCAXwhN/fzht1bbqW5lVObvDnb++PZRJYpbwyfE/+Oju3Rc46+FpbanCWp+TVcck+GG16aZGxU3GR9t2qyIAw7fYFUOPqSzuTo9d6pOzhDyYSALyvzgVu9bl1FQZgqoHAMihofnQeyp7UfkXBdoWJB2rO5liAoh60MEN7Gc+NgTKcmkSr9DfT4ejtigqOAkq1CRkiyYiQXKzRsErwL+RPPwv6jOiu5ZOWaYm5N1bxxOZHApfq5mdDPsrKAbXergXT5Gpyp6OSX1TEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v8 3/6] AMD/IOMMU: check IVMD ranges against host
 implementation limits
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Message-ID: <4ab0e244-e5a3-4b76-cef4-01d43345369c@suse.com>
Date: Wed, 22 Sep 2021 16:37:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:101:16::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db108d3a-2307-40d0-fa88-08d97dd680d6
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024C40E0442993546355878B3A29@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	19KpKtvyQpYV+LoHCW8lM0qI0MvTAxYiUf9T4jzeUgyjHZQ9AC2O1k0FVMbAFeTjDk9iEqrw03vEdxELOHTdclvn3bvvjrMJFMd6JLdYiIiigQ2pCuT/4uuAK9fAhNbFncvyjaAMVjR6NU9Qa2CrRLQJp+47Rdm6WGyvk+quYMErmoSh+wGolHwxxMTZliJlC7unAvafiOko08LZdsQk20zp82Kqrpi7dIOjdHr2JboBqiqeziE9agVntvkBatexAwkd74KWPpDD1fW3jo9tsMcQE6zLxd2iNe3nMK5oHp1+GYKna1GI7fcATQIGOqX4Y+/O3aUc7y2N18F+c9Gl1mmu0AJHDNYcBaLNmXb/D0VTwLS18fuE72gh/6RHTUC9sKFhL68H26HfIqtuQB+FCxf/IIpJNg0g+JNupyfbrppLTBQVBaJebHv9ePnJqrJvl6N09OenHozaVrHMZOEBlDj+DmRtizKZTfYEhbiayqOaZajrOqeQZduyp5+f3G6U2FXiuD21JQj/lXP8QTAeXK4nHD9r4dnmQVJTXww/0Df+2PXc/2R6PiWSiX2vpTWd9udwg4D1nN4mlT1djO4bW2XNADxYAFun9LqxjhqWR3BeHubn1Y8e+2sh7juSl/qchgQlKeiFBdcSOiYa/rLjxval0nQkefkSwspGCFUE6O2H3vaTPy6h0LciahyPVyPtPtVkwnGO5d3EpyE/jefVeuuiXtL7md5IjZCIA75gaz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(16576012)(2616005)(316002)(6916009)(4326008)(66476007)(2906002)(508600001)(66946007)(86362001)(5660300002)(956004)(26005)(186003)(38100700002)(54906003)(31686004)(31696002)(8676002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1PSzdYQlNtbXg1YjNSUlhpaEVrMmZ3QjdlelplWUxXdmM4WDU2Z3ZUREZM?=
 =?utf-8?B?VzNBOWxxWmc1MkFEbUNtUEp0Z3g3R1BwL25HOUFDSTlBNTB2ME01ZERHdlEv?=
 =?utf-8?B?YWhsaUllc3VDWFZicks5NzRnb01qeTEwWGw5LzhNb2EyTVBiQXI5Ny9Yek41?=
 =?utf-8?B?V0xUME5adVAyYXpFcnFOcE9ZdW5md2E4RUJZR2dJY2paNXZWU2FoeEdnaWlw?=
 =?utf-8?B?K3JkKzFNSGlXalROZS8wbnB3bExRcUFDd245aGF3WUs4ZFdjT0xtYlRDdDF0?=
 =?utf-8?B?dmllU1F3Nm1PNWVST1Q1VlhkL3NzeWhYdVg2UWFtaUtOVmw3TmZUb3FRaUFZ?=
 =?utf-8?B?bGUrZktOdTFTSkdNMWpQWVVRWDNIYWRpOEpSbENVTFptVGpocXBXbld4YWl5?=
 =?utf-8?B?Z0luMnZnNWhSN04wOEFoQmh0dWJ0bUFzUjEyL1FJOUtwVzdGK3JXRkxrc2Zw?=
 =?utf-8?B?eW1pVDlsMzdqakJXcWJlS0VhTnZjcmJyY3U4TnZrU0kreEJGVWg0NlFxTXRL?=
 =?utf-8?B?QlVzcnhIcnVrSWorOWVJNEdNVEk0aXQ4dkJZMVZLTWN6U1U3NWw2NG5xOVpR?=
 =?utf-8?B?TFdnMXFLQiszdXFHUmVEQ0ZMWWs5MWM0L0RDSXlDQVFRUFdEc2ZnYkw2eWtm?=
 =?utf-8?B?a3ZOQnJTY3BRODVBTGdEVTZsUG96SUVwOXJNTjM2ajdFSjBERG00VVhJUUNa?=
 =?utf-8?B?WGVtTHF1MG9nUmVHZTN1YndEUVdycVBCSlhOV1I1Y0JROEt5b1dLZDNqQ2Vo?=
 =?utf-8?B?NHk3bG5BVGx1MEtOTWFRSEZra2x0OFpndHBYVHYvQ0hpNVdzb1E0TzBEMkpa?=
 =?utf-8?B?c083MWM2a2hNeGdiN3doaSsvK1IyQ3cwczVUWDNnbFdnRGVGUnhHd25wMU9R?=
 =?utf-8?B?ZHZlRGlvUytBZFZQTGE1SDgzemo3Tjc5RE5xRWxkdGxHUWFEZEhka296WCt1?=
 =?utf-8?B?bnhmZHhhQ1BDWHhXMldnZ1oyV0xnOHR2TE1tdUNyeS9Xc3pDR2tCNDgzdm11?=
 =?utf-8?B?Zk16REJRQ3YzV2xXcGFiZy9tLys1TzIzcitEdjVtenBuT0xpenVCSkxFMDJS?=
 =?utf-8?B?WnorTjk4N3pmR0ZSODdrM3FDVWNuclBUaUtSbjdMenNIRUVLUnFZMWFyajBT?=
 =?utf-8?B?UlowOVJXMmNsMkF1dW5ia3JWM0kzUFdqUytsWVhsUmU0NXlianAzbHo5ODlH?=
 =?utf-8?B?T1JqUFhsK2Zva2xMcGMrWFJTd01qSWVSM2xpVFRSUFNrMlZrMXVJYWtsMklk?=
 =?utf-8?B?SnlXc2l6L1VkdjZtd1pMQ2tqUDA0SG5iUGdnamRXUFRxbzVxUUdoSkw2R21B?=
 =?utf-8?B?ckVJSHNiQ0l5eFBnZjBjVzhrTUNYNFdXdnpjRDhCaW9UZCszSVIvUEE5WEhu?=
 =?utf-8?B?YVI0YWdpbk02MnZFL1MzMUlpY3llbUNOK1VwREZsbDBZKzFmMlg2b3NsVno0?=
 =?utf-8?B?T1REcThEVVhnNjF2M1JSNGlFcFo5R3h0YTNkMm03WjYrMGlkbzEyai9yWjRs?=
 =?utf-8?B?VHlsS2tVQjY2RnFzbFI5SXhrVnhsZkJGUHZCV2F5dlhCd0ZxL09ubUw1aXRu?=
 =?utf-8?B?aS9MSS9Eb3NaWVZNRm9ycTgzeUM4dHZoSVZTSlJYdXlFQXlsRm43T2FVdHhx?=
 =?utf-8?B?dGpNVVVJVWpaUzZ5ckQwOFZGSTVzQzJpbkUwcVZQNUdRVE5INnBnZTJLSDRz?=
 =?utf-8?B?SjgvZGVTWlprYTFKakZYYUU5UGhLS1BaZUdjRjJQNWIrdjJqbWZncWpzVVQ2?=
 =?utf-8?Q?Hvvej9iQT5YiKRhwfRSUf+XbaWEEXzmCemUGz0s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db108d3a-2307-40d0-fa88-08d97dd680d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:37:28.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcUrxD8nX1+6P/kugBiZ4pQ8sQIoq2WCdOwQAqg3q2TGGuwYQMXHO542fLbQD8Oax6+DE9zyDJX/3NW5Fifuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

When such ranges can't be represented as 1:1 mappings in page tables,
reject them as presumably bogus. Note that when we detect features late
(because of EFRSup being clear in the ACPI tables), it would be quite a
bit of work to check for (and drop) out of range IVMD ranges, so IOMMU
initialization gets failed in this case instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v7: Re-base.
v6: Re-base.
v5: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -307,6 +307,7 @@ extern struct hpet_sbdf {
 } hpet_sbdf;
 
 extern unsigned int amd_iommu_acpi_info;
+extern unsigned int amd_iommu_max_paging_mode;
 extern int amd_iommu_min_paging_mode;
 
 extern void *shared_intremap_table;
@@ -360,7 +361,7 @@ static inline int amd_iommu_get_paging_m
     while ( max_frames > PTE_PER_TABLE_SIZE )
     {
         max_frames = PTE_PER_TABLE_ALIGN(max_frames) >> PTE_PER_TABLE_SHIFT;
-        if ( ++level > 6 )
+        if ( ++level > amd_iommu_max_paging_mode )
             return -ENOMEM;
     }
 
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -378,6 +378,7 @@ static int __init parse_ivmd_device_iomm
 static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
 {
     unsigned long start_addr, mem_length, base, limit;
+    unsigned int addr_bits;
     bool iw = true, ir = true, exclusion = false;
 
     if ( ivmd_block->header.length < sizeof(*ivmd_block) )
@@ -394,6 +395,17 @@ static int __init parse_ivmd_block(const
     AMD_IOMMU_DEBUG("IVMD Block: type %#x phys %#lx len %#lx\n",
                     ivmd_block->header.type, start_addr, mem_length);
 
+    addr_bits = min(MASK_EXTR(amd_iommu_acpi_info, ACPI_IVRS_PHYSICAL_SIZE),
+                    MASK_EXTR(amd_iommu_acpi_info, ACPI_IVRS_VIRTUAL_SIZE));
+    if ( amd_iommu_get_paging_mode(PFN_UP(start_addr + mem_length)) < 0 ||
+         (addr_bits < BITS_PER_LONG &&
+          ((start_addr + mem_length - 1) >> addr_bits)) )
+    {
+        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not IOMMU addressable\n",
+                        start_addr, start_addr + mem_length);
+        return 0;
+    }
+
     if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
     {
         paddr_t addr;
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -67,6 +67,9 @@ void __init get_iommu_features(struct am
 
         iommu->features.raw =
             readq(iommu->mmio_base + IOMMU_EXT_FEATURE_MMIO_OFFSET);
+
+        if ( 4 + iommu->features.flds.hats < amd_iommu_max_paging_mode )
+            amd_iommu_max_paging_mode = 4 + iommu->features.flds.hats;
     }
 
     /* Don't log the same set of features over and over. */
@@ -200,6 +203,10 @@ int __init amd_iommu_detect_one_acpi(
     else if ( list_empty(&amd_iommu_head) )
         AMD_IOMMU_DEBUG("EFRSup not set in ACPI table; will fall back to hardware\n");
 
+    if ( (amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) &&
+         4 + iommu->features.flds.hats < amd_iommu_max_paging_mode )
+        amd_iommu_max_paging_mode = 4 + iommu->features.flds.hats;
+
     /* override IOMMU HT flags */
     iommu->ht_flags = ivhd_block->header.flags;
 
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1376,6 +1376,13 @@ static int __init amd_iommu_prepare_one(
 
     get_iommu_features(iommu);
 
+    /*
+     * Late extended feature determination may cause previously mappable
+     * IVMD ranges to become unmappable.
+     */
+    if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
+        return -ERANGE;
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -254,6 +254,7 @@ int amd_iommu_alloc_root(struct domain *
     return 0;
 }
 
+unsigned int __read_mostly amd_iommu_max_paging_mode = 6;
 int __read_mostly amd_iommu_min_paging_mode = 1;
 
 static int amd_iommu_domain_init(struct domain *d)


