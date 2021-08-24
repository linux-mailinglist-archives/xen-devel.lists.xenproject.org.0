Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F863F6019
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171458.312879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXIb-0007dx-2x; Tue, 24 Aug 2021 14:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171458.312879; Tue, 24 Aug 2021 14:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXIa-0007ZZ-VW; Tue, 24 Aug 2021 14:21:08 +0000
Received: by outflank-mailman (input) for mailman id 171458;
 Tue, 24 Aug 2021 14:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXIZ-0007Z1-Py
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:21:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84e87454-04e6-11ec-a8dd-12813bfff9fa;
 Tue, 24 Aug 2021 14:21:06 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-kEsVKGJGMsOiwi6bXtTjew-1; Tue, 24 Aug 2021 16:21:04 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6161.eurprd04.prod.outlook.com (2603:10a6:208:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:21:03 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:21:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 14:21:03 +0000
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
X-Inumbo-ID: 84e87454-04e6-11ec-a8dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZ2YWkVaAC232qv91yH6WI7yyA59H3jwl4N9+n6GGng=;
	b=nzzGp1YJcSqqBvC90Fn64Pufvc/Ij3IYfOoT25YvKr1VCVrLOzt9D7nOQMGAQiewNT5We0
	U4Q5TQat3nWq4CJigEvdMucRUg0jvlTF5P9QMrQFnipf89AdD1A6l0P0BJpx//nXQCXt+A
	W4V9IOCdtkmIxQmKpB7cQ/90P0z/RQY=
X-MC-Unique: kEsVKGJGMsOiwi6bXtTjew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAW7OrmAfOrVrCdhj+Qfn9fYxxUifsj02FUeLYIzLwxD+DTOJTuFpBX2q/i1oUEC8vav7zF5wkX8RuanAQxnhobq0FzFJioVL/u8lOmpx9LAvT7I9svKFxVLS3DQVJjH1PpEtq+kwLjXKsxAxsPVX0Rymqzj4gv9DhMxUSIbWIrYtiWg6etyJJcoW+bn3N7+qSvcwmOAyzCXuArU5lOnMW5Pf/J4qP5agIvTv/GLfj2+68MIldijoS57YGDlQFJhu1OVvEVlI0o39TGIGh9Wx1KzW027QymYuDJKIBUk6Q7/X6m8pWm6VK5+S/+3ZuggRewa2X/0pM5i4vWL2xiKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZ2YWkVaAC232qv91yH6WI7yyA59H3jwl4N9+n6GGng=;
 b=OFRxqIIoZjDIf64HZrYSm6372xDD4RKXfGm1avP32EBLuup++VF+YiJyn4Hnorh6jm+T5BVDiiVBg+hxus0xj07GTXWl8TEbkyIF3q16TEYLnF8ONAfIKSUoqybl+QBangUYBpgdzOIgXYrRPblyyDlj0e6fBTAH4AwOZ+WGoUNs1gZC89xRawXWV2EEEL7qAqy76CsI8045A5YVTsByLte1LOCZfW8iWgpt/p79Pyero3DR/M7NbXNArNj9MEkrNxOK3NvRSYWKHVVTnUfXvBYEFwseve+qlVLIA9S6wK8mI2M99hcAUVvxyfZumit8hN9QIupsgLT2xce1w4tt1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 07/17] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <5d6e8360-7ba8-487e-0ac8-7f517e560520@suse.com>
Date: Tue, 24 Aug 2021 16:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::16)
 To AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ff444a-d65e-44c6-8c08-08d9670a6788
X-MS-TrafficTypeDiagnostic: AM0PR04MB6161:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6161080AE3D5F75531A010F7B3C59@AM0PR04MB6161.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RT+3mFNBw+T0Q8MOpnDDKXVnrdOH1aNSynx2wJxg3GUleqrei6wbdVw11n0PoNMXCKYX+QqVLN1wHovy1dexuti7h6RjExEe9AlqujvH9io4i0I419VbSvSU/AueuT8Z+97qwGteyancubOMeezyYHq5vzkCmlSNeoPlQXLts8tfkbjyQetu2K+bT9S8giDT3+3GZ5tr/vntbbxytt2pTJTiv+PZvjhzXaTHaK4KqvHGjWRlOnJdDUINOW4mcN5z6ZlqiNFQ9rxF8Vf71jhPe7l2DLW8ssF0NLxOFfnO5yNixRuPSiLZcjhBYc9vSRJy0ED46mZEAwEdBIlt6nhsxTQuAfvuOfxtqk6vPoG86ZFfZb5bPanRaVhsp+j6GAEGiijCATM8KhZK119Kt4/rdLGkKS3kW1a0y681/Lx87P70qJfZUT+IAfOcLOilnZSmzgQh4ZBV/d13IyCUPeJBUv9cH8d5hYlw/ASM5rb1EsCfJC0+N4f43SDh0bdLnaLKl4Clq7PSjopBbjulkMfOm3TM0fI18EwPwacHciPh3/wFnae1p4YZaIntMbUUEoQ+Wf6kFjUy2fGU4xIz2SHlyEbV2y2Nt4s1zdmU/N4wPZvDMEy0PHQtXfqfzNZuNao2sSRU0ovT/gZFzhu2LcUUszdPUiK2BWofmR3VS78axA3kNQXSzfV9+RB+lCv/nQgOmsNHiYayMZks3mL+UKh/2MgBes8OguoZlCZGBiDnwjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(5660300002)(66946007)(26005)(478600001)(66476007)(31696002)(8676002)(186003)(31686004)(38100700002)(4326008)(8936002)(2616005)(956004)(66556008)(36756003)(6916009)(83380400001)(16576012)(316002)(54906003)(86362001)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2w1SDdGUGJvVlBYSWsyaXg1SVdFK2k5MHdFZElEV0ZWdk9EL0Z6U3I0S3Ju?=
 =?utf-8?B?VmZaa0FrRG9pMlZTNzZ2NUNValpZMUU4Ym01VnBXeUI0clhrY2ZUSG1ING00?=
 =?utf-8?B?SHZEdUFKbVYzUlBrY0NFOWR3MXFtdFBrMFhiQ0dLazM4MGdvM3BDcktYOGNy?=
 =?utf-8?B?V2NYQzZuWkx4OU9BL2xYVWVVNjdUcUhvekJacWJESkdoV0FpQzNCaExlbkI2?=
 =?utf-8?B?YThGUVlma2luQ1FNQlMyV3F6aWkrcmpKWUo2SE5GL1JqdjhHeDV4R25BRTRp?=
 =?utf-8?B?OG9xNEhzZklvOUgyNW5LNTB5SStNNGdzM1Q2TjBLTXZ5SzIvVzRPWmJoZ09Q?=
 =?utf-8?B?N2Q4dmg0RzhDTGd6M1FPUFJRYnQ5WUx3ZThjUGhWV0ZFREVFMnE0eHpJcTBY?=
 =?utf-8?B?amJYWkdmd09JdE51cXlsRVN3THBnV2NXYUJ3aGUvU0c3dWlIU1JCQTVYWDZG?=
 =?utf-8?B?Y2pnUHhoV3N0UzIzSkxTWjYxZGUwMGRreTBhc1l2RUJaNU5qTVR5ZTNiSmRW?=
 =?utf-8?B?cnV3N3grYWNWQlZRd0JqTzQyeVhKS1lZd0w4T0RjMkV6QlN2Q3ZEYXRlSmdV?=
 =?utf-8?B?aEZOeTFEcFlJREN4am5Ic0Z1dWoyTEpyS3lycUgzaGY3cE5EWVlYMWlPMmVU?=
 =?utf-8?B?VStkZ1FONkdlWGZ1a3d2RVpWbUVzNVNUc0FJcG9xTk5zQ2FMZXFpL0hEeTFu?=
 =?utf-8?B?ZEtIOTl1d1JIM3lERzFUcm15ZmlmbHVSaC91eVNFWEpsdHlHRmdpTEN5Vm8v?=
 =?utf-8?B?N3M5NzNtU29sOGZ2UlJxcGhGeHY0alBDYnBXaFBHcFQwVEE4RnU2cEZiQUh3?=
 =?utf-8?B?SzA3NmJlQ0dnVGVrWGdabXFCd1c1L28xMFlBR1FZUUhoS1czM1k4a21adEZB?=
 =?utf-8?B?Ylh5MStaNlVtcHAzYXVxWWZFUkNBYWdnc0JUQS9iVmRYZ2VsL0Zkd0NLVzVP?=
 =?utf-8?B?NXR2SW4rSGs5WDJKcFIyQ0tiZ3dQUEZzSzZjaGtCSkRrdnJPeGpEZ2Fybi9S?=
 =?utf-8?B?MjNzN3FtbWZnTU5FWmQ5MFR0eUtrUGp3ckpBcTR5Y2o4UVE0ZkxzNmNBMXE2?=
 =?utf-8?B?OW1PMVB6d0ErRGJ6Smg3R1VtS0xhQjRrYUI1QjBrNFFxZ2lsR2dMajVFa1VW?=
 =?utf-8?B?TExUNDRZOCtLbTI1TG5QOTF1WTlUTE1UYlFxSlYrbVJOaVZ5QlR1YUp1dWE4?=
 =?utf-8?B?SVFtS0luNExucGVuNURWSzdPNEEyQnVENStvSjRNK3pwa1FZaUFlVTZpUzNP?=
 =?utf-8?B?ZGhmY00yOGNKMzZES2xrczM5Z1ZVT3lvRVZxQTFxT3ZsNFhYdHNVbnZPWEhr?=
 =?utf-8?B?Y3A0cDBVS1d6Y3FEZVZESFZRSVV0ZjlseDZpQmhaaFRDRGtLSm5odmR0UFJG?=
 =?utf-8?B?eEZ4UEM1Q2ZtbWdUendFZ2NjZWpFMUl5T2tEaWFJNm0xNVRuVWNoU1R6cXZ1?=
 =?utf-8?B?ZCs1bEhUNndwWk4wOE1LYVAxRlI1MGJ3QXdhbDBMN3p6Y3o1M3NhZEdpYVZj?=
 =?utf-8?B?Y2x6cU04c3lFT0wweVVCYlQxWnJRRml2VjZQRUdWdjFneVRWbmpmMDlCYWFX?=
 =?utf-8?B?YzhYZ3ZhYm9neSsreUZBVWZPNmhsSjYwNkVmaGVVRzhHY0k2KzFVSjU3RWYy?=
 =?utf-8?B?QzNJdzhxeFo3NUpXalNqRFF5c1NtNE9kbTJhRGJoNjY0LzRvamkvK3M1YU10?=
 =?utf-8?B?OURHMjN4V281dExUb2FUNXlmR0ZMQzZRQlFTMmlueWo3Mm13bTlhaUMra0lH?=
 =?utf-8?Q?dD85E/+uGtaHVcxQxRqT5gC5CiP9xpS1E/WHwkO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ff444a-d65e-44c6-8c08-08d9670a6788
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:21:03.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s367gf9yDttaV+7zmvBbc/+CMGjXgqR+0vMMKlFE/1XixmvtWoiIJf8EV2hUUXIzL/w+dXgc2++F0QmfRXv9Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6161

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
@@ -159,12 +159,12 @@ void arch_iommu_domain_destroy(struct do
            page_list_empty(&dom_iommu(d)->arch.pgtables.list));
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
@@ -173,44 +173,60 @@ static bool __hwdom_init hwdom_iommu_map
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
@@ -246,15 +262,19 @@ void __hwdom_init arch_iommu_hwdom_init(
     for ( i = 0; i < top; i++ )
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


