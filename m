Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D37FB04930
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043053.1413154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQTH-0002L5-Is; Mon, 14 Jul 2025 21:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043053.1413154; Mon, 14 Jul 2025 21:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQTH-0002JY-Fw; Mon, 14 Jul 2025 21:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1043053;
 Mon, 14 Jul 2025 21:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=naOb=Z3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ubQTG-0002JS-H8
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:12:22 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2406::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 394cf39f-60f7-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 23:12:19 +0200 (CEST)
Received: from BYAPR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:c0::35)
 by CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 21:12:13 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::35) by BYAPR05CA0022.outlook.office365.com
 (2603:10b6:a03:c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.15 via Frontend Transport; Mon,
 14 Jul 2025 21:12:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:12:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:12:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:12:11 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:12:10 -0500
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
X-Inumbo-ID: 394cf39f-60f7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPp4zK7oB/yC9k0l8nNs5M3NakDOkJqu1fS22EjOs3J3ZM+wnhUlfkGGDn2hZDAb1ZeVH3v5arN/ywigO1vpVjSd+VdwY5TZsB5ByxBEOIAKgE3SsiPDFwg0nUnFqPjL6x7ELfnnz4HRikWuMbK2qqQhW967/WPEn+gz3CCwf9I2on6K2D86uTEyracC096SFx9/MT42uZyA2yPzEATE6ZX7kk1ZMKaT4fTdP9pnULRZ1/AUnvn+PTMt6AMWVH6WSYdK6y2nmnCrOL5AKuW4XiT3T0cWO8sZdJMREo0hKTraF2jcyiRqMlxFCjJEDlDTdtWogGTgj0WHS2p83ilfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvkVuPvgIaNiZ5qpJaPe9V3OeJKGt5AOsjmG5PfQ5ew=;
 b=eLK5mldUePjmOv5BloohqhkDRzeX8wSSDiyAQ0isign1H99AOJpJaekXe+EBOw2nQX992uwdAyZN0Kt0gAEoshVRcN71aa7a0xpbObJ4KRYyZ1mCyh92QWXBZ8rh1R8TMwhitVdB4xNioEhLuzSgWTb88Jv1wsW42CVTQF+sgSEU6YlgaKZ6lO4ZcbCbfguWEQiX9Yag/hCMo3uzMyWmnA1N4YIhJ83RMoF7aZBEBGik9hvNHUfvmhmoKmeA51A+SZ0iJq5r+hElmj23m3Xb6cZ+wrsLWxsCpotbADBPU00nmfNgz6Nszzyxep6earm5mbVjkHDmO2wKWn7jTyNuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvkVuPvgIaNiZ5qpJaPe9V3OeJKGt5AOsjmG5PfQ5ew=;
 b=0e9FyG2OKtPSpjOEQFcYya1qQVY/+UzMLOh8/0KdkdSyn52DHAhXrESoldXtdGl4aWIAfqXrCryR+6OtM+FSxw+czv/qREGG1tXdl429oRBcVH+cX6ziJMvqlQ8OQvBWiPTF6aq4QTWIm2cpvZTNBwVypmizyoU0gSiA/xm2oKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e3a03602-656e-4efb-b9b6-3a6d33781ca0@amd.com>
Date: Mon, 14 Jul 2025 17:12:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rahul
 Singh <rahul.singh@arm.com>, <jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
 <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|CY8PR12MB9033:EE_
X-MS-Office365-Filtering-Correlation-Id: 907b0fe9-230a-4cba-3b17-08ddc31b1a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWt6U1d6U3duZGVseU1QSExWYXJrQm85d0VxakkrOUlYV3NKWmh4Y2JYSjg3?=
 =?utf-8?B?NytrNnFJdWd5YzhUR1FkWU16WktsOFd0L3B6aUFrM3N1NzA1R1o5VEVzZy9Y?=
 =?utf-8?B?TzVQbWt5cEdOSkZTRk13MksxRE40YkRTNTc0cFRLcVROWm9xcWUwYVUwa280?=
 =?utf-8?B?K0IxM1hHazBHdFM3WVI4NFBiYy9xbHlkR1ByZEoxT01VSEhTK2dUc1EvMFNC?=
 =?utf-8?B?Z21jSjVlbDdvZVc1aWM3d0NpM2ppZmtuK3lLUDIzRFpJb0RJU2gyaFFNMDBo?=
 =?utf-8?B?bUxTSmNaZ3B6aFBlSGxNb091WGkwSDB2MWN2K3hVM2tCYlBnd282eFNRUVdW?=
 =?utf-8?B?ck1hb3hJNEFId1BxWlNqdVBPMSt6b2UyUHVJL0xFKzZJZWExYkdhZFlsUVBW?=
 =?utf-8?B?WFUvTHBZMStOVTJNZjJxVXZjM0M0Zmw1OHFsOHpvT1E5cWZURVJJcXZJSy9P?=
 =?utf-8?B?MHJ6Ukc2UXpHclljZEVNVXBvRWR3bStTa2JFZDNqOUxrclFFNldFM1F0Z0xm?=
 =?utf-8?B?cUR1SkMrSitLSndTNFVJckFNai9ZS0ZzdW9zVEhlZmh0NHh0R0R1bjJkU2dB?=
 =?utf-8?B?NEJCZUxvVWRTeUxaMVQrTHZTMmVjY3BiejVqM1dNUmltWmJWUkNGMjdRdTlE?=
 =?utf-8?B?OW90RzhhdDZnekhrSHlPSjRvRnhXOGdnVkwvek5PbTZnckp4MU51eDdwbSsy?=
 =?utf-8?B?ZFJwcWRVRklBTERidzhudWdGK0k3bmd6QkRNQW8xWjdXeUZDN2ZYN2taSnc4?=
 =?utf-8?B?S1ZOT2VZUUprTEkrSVR6M0hiaG01YzRzaDRneG5WdnR3SnBPMTR3SENDbjc5?=
 =?utf-8?B?YXAxdENoUWE3T0gwMlBtbk5tWHlNREhESG9YcVNRREFNVjlhYjcrSW5Ycjlw?=
 =?utf-8?B?dmJDSzcreUl3aGF0elh2S2tZblhNVjFieXV4S1N1ZXpWeFVaWWhEWkIxT3Nu?=
 =?utf-8?B?cDcrYTRSLytqZFdoM04yb00vSEE5SG1nNVpRM21PWkZncjdsODkzWWtsZHF1?=
 =?utf-8?B?NVE0b3RSaUozUDA4dUtNRDl0MnlLeS9Tc0JETzZzYU5BallCWTlGK0VsWU1U?=
 =?utf-8?B?N3BzU2k5UkVMSEs3VkR6TXZWcCtJejE4b0xkbitUR3ZuSVlTdmFIUlFWbGFI?=
 =?utf-8?B?MGVkZUNVRnVud1k1NjAzbmw0ZThiY0p3WnZUaHRGQUJNU3Y1K3BtYjdOQmdv?=
 =?utf-8?B?NmNSSjF2QXdhdnFaRkdqTXB0S3cxQStKWlZaNUxuTlVwSUw5WnliM2doNVM3?=
 =?utf-8?B?UFpydkZ3WnhsQXYvNUV0Ly9kNWF4UitYWDNiTzhjT0tBZUIzM3dXMllkWGVo?=
 =?utf-8?B?d0V6WW9aUVZTRTU5WGhMTDdlMjV6WlRLTC96cWdtRHFqd2Y5T0o1VlRaKzMr?=
 =?utf-8?B?U05IcENzMGZoQ3pQRE16WlAyWC81V0gzb0dmK21UcGVNL1A5SGovSjZrNjFF?=
 =?utf-8?B?dUZ3QmlOUXZZOFNTK3VSUEs3NEsvYjE1WmZhaUgxT2RPVFhrbXprV0lvU2Iz?=
 =?utf-8?B?RDdyUGxmcE0zUThjRUkzMVExR2JMMERFOTl1aW5WZHllaTVYRkZ3dTcvdWVX?=
 =?utf-8?B?SThGV2diTHlBY01TS1UyNG9wVWFoS1kyUnREWW1MZkFGNFFNemQxSFNnbWV2?=
 =?utf-8?B?VU1QVkdoMmNvVkZBMVB2YVF6ajhON2N1OWNoZDFXZlZRRzJSNWtRT3NPd3o2?=
 =?utf-8?B?LzhYcEMvamk5MkJLMDZMb1pyVWhSOEtLcm9XaXJ5RXVlT1NVKzBFbGRrT1Yz?=
 =?utf-8?B?MDAzdEV4Nit3dzdrRHdKaUM2REE0Y21HRU8vTE9hQm5DVElWL2lXSStPYXlh?=
 =?utf-8?B?YUNYREJYalNoNGRKSHJUNk5pait0SGdZOFNQK2VXbXU0YkRNOTJuQVpGUDZz?=
 =?utf-8?B?NHFJeFluYzB5WGc2NmpHTitnZGZJYjhYa1ZGTExUMTdzWWRLS1FxQTBHNitI?=
 =?utf-8?B?aWNUbnppQzl4dWdwTXNQQnk5aCt4WmJibnlLb2VCMnRXQnNlVmd4MndDNGtk?=
 =?utf-8?B?c1o4R1VSR0x6Zlp2cjVHZWlEWGQwUTZMZldkZDJ2bkN3RS9pSGpDditETS9q?=
 =?utf-8?Q?QlfA1t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:12:12.9445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 907b0fe9-230a-4cba-3b17-08ddc31b1a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033

On 7/12/25 06:08, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/07/2025 01:25, Stefano Stabellini wrote:
>> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
>> index 5cb1987481..dae5fc0caa 100644
>> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
>> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
>> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>>   {
>>       p2m_type_t t;
>> -    /*
>> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
>> -     * returned by the hypercall is the MFN (not the IPA). For device
>> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
>> -     * p2m to allow DMA request to work.
>> -     * This is only valid when the domain is directed mapped. Hence this
>> -     * function should only be used by gnttab code with gfn == mfn == dfn.
>> -     */
>> -    BUG_ON(!is_domain_direct_mapped(d));
>> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
>> -
> 
> Shouldn't arm_iommu_unmap_page() also be updated? It would not result to a crash, but we would not be able to
> remove the mapping.

f9f6b22abf1d didn't add any calls to iommu_unmap(). As this is still
only hwdom for now, hwdom is not expected to be destroyed, so the
mapping is not expected to be removed for now.

With that said, in the future when we expose vITS to domU, you'd be
right. In the xlnx downstream we have something like this:

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ef8bd4b6ab33..2f5b79279ff9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -133,7 +133,8 @@ static inline int p2m_remove_mapping(struct domain *d,
         mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), &t, NULL,
                                          &cur_order, NULL);
 
-        if ( p2m_is_any_ram(t) &&
+        if ( !mfn_eq(mfn, INVALID_MFN) &&
+             p2m_is_any_ram(t) &&
              (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
         {
             rc = -EILSEQ;
diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index 04b7e98e4aae..d59a9cf5a48b 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -63,14 +63,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags)
 {
-    /*
-     * This function should only be used by gnttab code when the domain
-     * is direct mapped (i.e. gfn == mfn == dfn).
-     */
-    if ( !is_domain_direct_mapped(d) )
-        return -EINVAL;
-
-    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), INVALID_MFN,
                                      order);
 }
 


