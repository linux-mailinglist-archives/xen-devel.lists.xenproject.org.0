Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE616416F5C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195087.347589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThkT-0005Nb-Tg; Fri, 24 Sep 2021 09:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195087.347589; Fri, 24 Sep 2021 09:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThkT-0005LS-Qm; Fri, 24 Sep 2021 09:44:05 +0000
Received: by outflank-mailman (input) for mailman id 195087;
 Fri, 24 Sep 2021 09:44:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThkT-0005LM-Ar
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:44:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f33e3a7c-1d1b-11ec-bab8-12813bfff9fa;
 Fri, 24 Sep 2021 09:44:03 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-m4FxfhpNP7yuh-9v9GSWQw-1; Fri, 24 Sep 2021 11:44:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 09:43:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:43:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:43:58 +0000
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
X-Inumbo-ID: f33e3a7c-1d1b-11ec-bab8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gc5Okgblxwjveskkdg4CB+2OMoPev7pqS00OgVJvY3k=;
	b=bLE8jdOjvwwqVH6x+EgjvCE4YBpcKd+Xg05XRvHxKenEfOzeoUOqWPOhB3DuvJfLDhublL
	jEdJVH7HZeCbqXM9Lhm32CgvuBEyUH4RKZnOpPYYA4PQWJjXkL0Bw6+g5RUvt4ojQmfMFo
	MKRrdbSDVVJ8AfP0dEnFS127L5zH9so=
X-MC-Unique: m4FxfhpNP7yuh-9v9GSWQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8DjcxGPrgKvFECwwES6GBxG2VpJRSo6wDP4/e7f7LW4hg6wcRqlIuBwELAVx8fnurKaPidnBRrZu38GEXymFspr9tXXyQZSV+gmfAxUpLzLwg7CPVF+aRYsUYXujcO3uiVeTQCnKsuERSJpmlCY1nIBaw5UdtRigSreMQLvbfJDwr5/X+CiVszHU1B7sXax6zyq+LamZq/+ie4JLos3mT9ooDofL4CJvR2MlXCUw2GW2UeZB9wDGBHK8pAsTOoGT+9NwjwnqvcPsVyUcsP+xf9nAoNEK2gpZJzmccGnXfi8MCfQ8eJI+pJY7zRWDhNBw/tu+jgi8YyMJzBcvJypLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Gc5Okgblxwjveskkdg4CB+2OMoPev7pqS00OgVJvY3k=;
 b=JQ+H0OCA3zZWEtEGWTNHSM+GslqVpqhDon/zYmR//C1/zkIogay0wzSRTLzGrKQnHyGwC5OkpuRbOCTpyy7ZCvOHJYnOII//JJlViLIJvLHKvTYFmPYDP5pJ5bb0YJayi9Gacbh1HjUa3mAkzJsOpiNOB7XygL7jCTY+8cRFhN0tqYlS8d1Vacz6zvjj4x46TA6Qu+nzCHQtFA8Dj34Vc8dwG/62YQjEWHuuhzeGmAqE/0vHRGQrFTiossj/e9NIQMtZsXpXFI/3RugGNhE4uCrvgHjJFktEJZoiDW96yK/hNog77dnHYTm3z5YtzPOpApRpfjBNaNJyq6Vh9lGRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 03/18] IOMMU: have vendor code announce supported page
 sizes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
Date: Fri, 24 Sep 2021 11:43:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d662cd64-4a70-4b29-aa39-08d97f3fd56f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6303D9FCC359D2C78AB78EB9B3A49@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pOb51MJ4veuL+KJH99uO1P4N/k2uUAZCTp9+XiUtQ0/+DRC5y8mPin0fFfXc5Foanq1FRXaiN1j8D4UZMCgncw4gzamBSGiizEjfsWHMtIfHsTJl0yvSuY13Kkx3mF/3LVZE1GcebAuNbTmA3VOsPJ4Z9on25t+Eu+G/zxPcQ//78dDSrFPv9EEcwd7jpJ2CK75BLX861saaD9m0xB4L8nBqz+QZw0xEX+dva0Bev6gJ8JVW7KOLGPIyNMYErBRph8zEQrIrfPw2OtN7P9+5GDjGJXvTNOPx6qlHRemBzp3bSpQSZV50g+t0RKBEd84JDQG8kp1LFAcu5RhIjbPz+AoRpbOwnqqStpBq6DXNHS81ofcKyJ1EqtX4DCS2e1+Bw1ClflHq40YvHBKQ+bBKfPcBfV20hmc130A6pHhH0KeX6g7rX6ehnoF4t0Z4Pg/CAP956oyB2LW5Wo9hB8w3dadVoKWll+0Dj7avrx+2HnRfFxHfNtOyIJmZ0n5GC71yNd1weOUQNNq3A9f5suoFtKyX6Sty7hlFLOougpFjIwEyVjGsBKIORcp20J/HPAv/4nhlI0RQA1CJDFiao4zVnIZgUD+LgIT+hnxBfEC+KyKKyal1mraki08E3aThh5U7FDiNTFLivTnPMJyQKBDa2kepjGAAj2rGx2QNDTNDIEmaW5zoPhB6yVnXZiLjrccCDv68pEGOcHLlrUV5SGiHeor6MdeOZGcnMpPDixqoLZ94uq7sl8/ikq+ZC6v74BWZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2616005)(38100700002)(956004)(86362001)(83380400001)(508600001)(66476007)(66556008)(31696002)(31686004)(36756003)(8676002)(16576012)(66946007)(5660300002)(54906003)(8936002)(2906002)(4326008)(186003)(316002)(6486002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzlFaUhpR25uT2ViblJTRmIrYzFMMHBPUkErQ3ZtRmtUK1h5S2FMeUUrOEdG?=
 =?utf-8?B?THQ1S1A1N3lIMkZZa0Y2RG95QTNQY1U3R21oUTV4MkwwWVNCMDF5Nkc1dWFy?=
 =?utf-8?B?NG9sa2luSzhKMERMaWFteC8zdjJJRmxjNkZXWnJzUXVFVnBscGN4d2tuRTJa?=
 =?utf-8?B?aUVIWkVIZW0wR0p6Nkh2R0JLbzRNbElRV2VwcCtlOW1SMDNiUGkzWnFRbjZp?=
 =?utf-8?B?SnNabDlpaVRoeitLTFZtOFpvRmlxZXkwV1ZiQ0RqZnFSajUyQ2VaSXNDZFpK?=
 =?utf-8?B?eUQ2cHRWYnZOTm9mcDNwOFo1UzlHRWlpL1Y1KzhUNU5lb1o1cHdEbDQ5OFo4?=
 =?utf-8?B?cDBaMiswRTRPTitmSGJwNUpJdGlKUE5pOGlSSEhXNEhUQ1BnMGNDNDhyaG9M?=
 =?utf-8?B?NzllOEpqSGJ4TEpoV2duSkNmcEYzZEg4RjJ4TnVSeWY3UDFJVTVyTlFkdS82?=
 =?utf-8?B?VTNOMXZTU3hEYWh6YXhNY0JBWlY5dkYxR3BINjdQR1lZYW5HakUza05rUXNw?=
 =?utf-8?B?Mys1ZE43UTQ2dUEzQ0krenIxYXVYWFdOcnZyUUxEejhOdVVjTlVJWXBpSytJ?=
 =?utf-8?B?NXlyWnZpZTQrMVlwVU5JNlB6blFmaE03RWlYN2hqTmxMWlZvcDl1OEtiT2lV?=
 =?utf-8?B?RUdlZ1Y2QUtPZFJWSjNHcEVOYTQ3dHMxYmVZeUNNN2M2bzNGenhSbHloSzFm?=
 =?utf-8?B?ajMwQk9CdnYvdm5nVVlpZjBOSHR4aUJydTN3ZW5DcXByUFBFZnJ0VDRWemFZ?=
 =?utf-8?B?QTRjd09YZ1FEQUJZYUxmMTJka3l5anRKRTJTYzRLN0F6TVhoU3BjR3ZZSkwz?=
 =?utf-8?B?Y2hyVlYxby9BZVlQMGs2SFpxeURDQ1Qya0M2WFI3ZXVNM2FURTU1N2pxRGV5?=
 =?utf-8?B?eGxndnBwdDVGYSt4S05ROHY5aFZJQTZ5U1RNUVlRalZSTkRMc2FVYTZDZWlq?=
 =?utf-8?B?YjM1eUVQWGJDMnd1bHFuVFNNd0tyS0EzMG4xdi9JUytxK3AxRjFJcjhQUHds?=
 =?utf-8?B?aXZsLzFUTk5GQi9LMUt3aW55NzRDZlZEMnpILzUwOG1uWUFoWEpDVlZ6TkNY?=
 =?utf-8?B?MWdyZStpbndSKyt6Vjd5N0RkQ1RpYkthYTd4ZFRzWmZMSmRTaDNla0RZTG1F?=
 =?utf-8?B?bExQa1BGZCtqRlI4c1Q3amVORStBZllPVVUvUEZLS2F0MzZPVkhPYU9FS2Zy?=
 =?utf-8?B?UE5DSmZUYXJKMmdhWXFqZkxZWEVDL3ZibWZhWXZhM0dlaHc5VU5QaENjMWRn?=
 =?utf-8?B?RG94dHB0SXBnN2R4Rkxkc0k5THFVMVNvME1LbkFQRnNQK3ljWVlJVlJxQmll?=
 =?utf-8?B?RHkxQXNyV0U0N0RSalArd1FnKzQ0ZU1PbU92QWJ5S3hrTHhRcCszNHUvRGox?=
 =?utf-8?B?dkZycE81cmw2cS9ydG1QbEh0cmNaT1dhODltZ3gvSVZPRmQvZW9xNGFBanZK?=
 =?utf-8?B?Sk55Mk1nOXJZR29TMEMrV1pKU0pEd0c5WlF6Ni9qYkhXNGRZWGVRcnppdzVk?=
 =?utf-8?B?NkU0UTdtTEZ5UCtaRlpoNHNiNDNZaHhBaEVjRDFITFpzMFRqeGZMVFJqbzR0?=
 =?utf-8?B?Y2NtbVNrRVFHWVg1aFVnOUZkUmNYUEFHNHZrbm1scHlveU04N1ROOXVoNHhY?=
 =?utf-8?B?dEZOTEQvVW9WVW5jUFRZbEQzRHl4cDBIR0I4TUJZek5JRExBcnQ2bzUwcjQv?=
 =?utf-8?B?bGtOeXdqYVByMUlOTTZRWUZsUHJyM1FhN1RUTlNCWWhkd3FyR01aL3prNjl0?=
 =?utf-8?Q?PKtfgQvHGNNR0EchOCVbBs8ekJ6ipNQ/u4qByEu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d662cd64-4a70-4b29-aa39-08d97f3fd56f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:43:59.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPkvg9i3Nsn3OPsUFQtdsdfRK/BjMvxJLgOrmR54+YY2DcGHRrfvS4ZJ2KZJLPcruIyzDU6qgPKvYZygjMgZOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

Generic code will use this information to determine what order values
can legitimately be passed to the ->{,un}map_page() hooks. For now all
ops structures simply get to announce 4k mappings (as base page size),
and there is (and always has been) an assumption that this matches the
CPU's MMU base page size (eventually we will want to permit IOMMUs with
a base page size smaller than the CPU MMU's).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -629,6 +629,7 @@ static void amd_dump_page_tables(struct
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
+    .page_sizes = PAGE_SIZE_4K,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1298,6 +1298,7 @@ static void ipmmu_iommu_domain_teardown(
 
 static const struct iommu_ops ipmmu_iommu_ops =
 {
+    .page_sizes      = PAGE_SIZE_4K,
     .init            = ipmmu_iommu_domain_init,
     .hwdom_init      = ipmmu_iommu_hwdom_init,
     .teardown        = ipmmu_iommu_domain_teardown,
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2873,6 +2873,7 @@ static void arm_smmu_iommu_domain_teardo
 }
 
 static const struct iommu_ops arm_smmu_iommu_ops = {
+    .page_sizes = PAGE_SIZE_4K,
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3426,7 +3426,8 @@ static void arm_smmu_iommu_xen_domain_te
 }
 
 static const struct iommu_ops arm_smmu_iommu_ops = {
-	.init		= arm_smmu_iommu_xen_domain_init,
+	.page_sizes		= PAGE_SIZE_4K,
+	.init			= arm_smmu_iommu_xen_domain_init,
 	.hwdom_init		= arm_smmu_iommu_hwdom_init,
 	.teardown		= arm_smmu_iommu_xen_domain_teardown,
 	.iotlb_flush		= arm_smmu_iotlb_flush,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -470,7 +470,17 @@ int __init iommu_setup(void)
 
     if ( iommu_enable )
     {
+        const struct iommu_ops *ops = NULL;
+
         rc = iommu_hardware_setup();
+        if ( !rc )
+            ops = iommu_get_ops();
+        if ( ops && (ops->page_sizes & -ops->page_sizes) != PAGE_SIZE )
+        {
+            printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
+                   ops->page_sizes);
+            rc = ops->page_sizes ? -EPERM : -ENODATA;
+        }
         iommu_enabled = (rc == 0);
     }
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2806,6 +2806,7 @@ static int __init intel_iommu_quarantine
 }
 
 static struct iommu_ops __initdata vtd_ops = {
+    .page_sizes = PAGE_SIZE_4K,
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
     .quarantine_init = intel_iommu_quarantine_init,
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -231,6 +231,7 @@ struct page_info;
 typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt);
 
 struct iommu_ops {
+    unsigned long page_sizes;
     int (*init)(struct domain *d);
     void (*hwdom_init)(struct domain *d);
     int (*quarantine_init)(struct domain *d);


