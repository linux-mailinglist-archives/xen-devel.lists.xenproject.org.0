Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8A3EEE8C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167911.306591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG07D-0007Xk-OT; Tue, 17 Aug 2021 14:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167911.306591; Tue, 17 Aug 2021 14:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG07D-0007Uy-Kl; Tue, 17 Aug 2021 14:30:55 +0000
Received: by outflank-mailman (input) for mailman id 167911;
 Tue, 17 Aug 2021 14:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mG07C-0007Ru-4t
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:30:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f48bceb4-ed6f-4765-8b5a-93d02dc53927;
 Tue, 17 Aug 2021 14:30:53 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-eyoYgbpyN8qcgqj0e9yoxg-1; Tue, 17 Aug 2021 16:30:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 14:30:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 14:30:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0073.eurprd07.prod.outlook.com (2603:10a6:207:4::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Tue, 17 Aug 2021 14:30:48 +0000
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
X-Inumbo-ID: f48bceb4-ed6f-4765-8b5a-93d02dc53927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629210652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wpikJq/gpX+eW/kmpDHrbMcUyBVzKq0Z21NGYTmiMck=;
	b=FHSh+ZtVXa1HLRFmo04/S3NfubA3GKR331mpFxFCHK8qhCLrQtF3eFL+FH1zcAZoFOqYi0
	uUAY6FLFiCBBvAqIa3PBKDSfLs5DKlR9SGdM+pdYG0eziDyp3jz0z8T6hciDRqi4VHgdl7
	29n1YKXsV5IyTmRZ1lPcoqOwY2ujoxo=
X-MC-Unique: eyoYgbpyN8qcgqj0e9yoxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXQNDPcoJ7RR8zeoyejcleR/6JpMZa2R+k31ifCscYBEX8bPYMKYMW+kX8EmMtPMpdQp5giBdkxgaD4QN1zll+wL61LdGf4fojUgAjxdAjBjSbVE6rmCmh8OijEHPw7xOw0oEwoXDCOtM3W/mgI4QYYGL1OGCduHa3+2G9C+kUIu1yYeloASTB/6NCDBloTumNQ0qrlX1nTuPox0nyfLPh+9X5WpX/lqPCAx3AiY1IUaXGE7xwergZ/Jhky4+4eLHTqaeTRs/8lkoi2U6Ny8cVzEdm8DUeltC/UojDuV5Njd5GoghiWshw/yKMbgzbi/Am/pQGanKxgbtkJgAnqz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpikJq/gpX+eW/kmpDHrbMcUyBVzKq0Z21NGYTmiMck=;
 b=fxg6Gk1t/46bbB/DWGGhQcXLk+HhwmNDCBkkcnydQDWvNIS/1rv0Kkklr2XDr59l3lXA5jWgPihPzLI3VOzxGPbv2gBf54hJEervMM3199a1SvRoJ/Xt3smIh2w+rFASuh7r4+UbXI+Rn6kBoU6FivaT06F2oFAzeyDqR64Komydh89PWBBg1kZkCSBrcKUhvyVEEIGIfo+dZeWrtsvA6FmGeFXcX26VAwme2HLErBxhTYi51SIBAdoKbl4kNkb1nrNptzufcdJp6VEKAszbEmMx3gPKsDhbxEs5ygy4S1hLmIzhMQt/e+qSDNpotJ1JdddUfeilWN4+axT12aLNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
Message-ID: <6ba722ae-53ce-34d7-129a-621da0fadd48@suse.com>
Date: Tue, 17 Aug 2021 16:30:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0073.eurprd07.prod.outlook.com
 (2603:10a6:207:4::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d57ca22-9a31-487a-7246-08d9618b9b88
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447FC79CE53ABE397F95F80B3FE9@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lQ7xDPmlDQ/gC54i2InRcaOIX5MLcKOjbCNeOTsbjDjlAavmffYtnHBUerJ4gsuHikb9JvDw3RTrgKK8p+0r1sYy2VPw/kiDGHg/H67Abi5KgeS9iXxIhLcTZ/l0sofb/ZhxJ4Wn9SbgEA1jSSEQFQg8RvuHupTlqSyeX/A+omXHC/xRw4OG0/93wy04KqUok781ulsMi5EpXRzculn3L0SUo7VnaHnH3GhVMf/4BpUjO/kf9+3MZvsr14BlJVkh9UdZYzFWiZRcPz68GmzwpdkQ6d79CVZF72A6MYJQIfHh0HsiKRNYicQEpX/X2WBSI6IIOPKvX2fMl5/jWuMJDatL75lLTrAGBxfL0gX2G2NXIpmUPuvZo77+wde+DJNQS7o5fMebT0czUcmqCfEbfufLGvdOu1pN04R8pHLjwA0oM9y/AiYrRcxkgVmaOv0/uxgbE30LY3Orjl/4/byzRdmgPVcs+OkiwSVNXRkcfh5lCWNu9J4+fljVqJhBx5I6c9ZVjw6MY0ZsrHwzRUAgOGgcIuQbrXrU6kAY5XzgFXjGoQcg8mqbD7F1cztWStIpmdB65mSqYD/xeEcI8OzUNMJyP+IxHnJ5DsyI/UB2xUZZh4NWsYahNR90+lazo/LPB6s0EcCl8c9QQVw3UsbOkSf2Tx7Q2KzndpY1Ni3X86KIwFcSGsXx50a1cZBTi/9BKUcNT0ES6Q5wK+v5iUMehwEK9czOVUMPTHSUmAnhauo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(346002)(396003)(136003)(366004)(66946007)(8936002)(66476007)(66556008)(86362001)(6916009)(6486002)(2906002)(8676002)(31696002)(956004)(5660300002)(2616005)(316002)(31686004)(4326008)(36756003)(478600001)(16576012)(38100700002)(26005)(83380400001)(186003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2NCa1ltNmtDYkJ6NVBTdU4yUjNVdW5MWmxNdzdsT3k1eGd0aVQ3TDJEUHZi?=
 =?utf-8?B?Nnhua2RHeTRvaE41Z0JQbWdOVXo1cGRyQXk0MFJ1ZUpWa0FlMVVSaWgvZkpW?=
 =?utf-8?B?Y0JONElpZWVpQ1cyY0VXZDF0ZEt6b2RFK0x1ZTZzSnQ3ZUhBZnlLb0FjSXo3?=
 =?utf-8?B?U2N6NEFvM3ZDN1NpYzZoVlFhaHo2ZjZqQXRuYVViZjVLWFhJUEZML0EzdGxU?=
 =?utf-8?B?blpNU1B2ZGtRVWUxSXlnLzd4ZGFXK0pUd1dVTEpCQTRUMGpZN1ZoYTAzZDAy?=
 =?utf-8?B?N3F4M3JVS0I0WEk1WXZHQ1o0ZE1Qc1g1TTkzNU45QTlMOGQybGxaLzlBdVZn?=
 =?utf-8?B?cklSWVoxUm4vZ2g5QzJSSnhoWllYeXNTUjBlVlpRWEVjQWtad0F3RmxMSms4?=
 =?utf-8?B?YTB1dW8xeGhwUmE3eDlLRFlUNEsvckw3cldUeU5OZkViM005VGRJUVhHdDNj?=
 =?utf-8?B?am45aVJlNTdQWHcwZmZzYVhLRnpTQ3JwNTRic2tySy9SVDZrRHdZN3N4RjZk?=
 =?utf-8?B?YlVtTHpMa2Q3bHF5d1BPVnJmRnVkZjcxNXBENmY0SWhvRzhaeG5kSXg2eEg1?=
 =?utf-8?B?NWNYUVYxTXk0dnloS09LanJmUExHUk5rQjc4YzJlbmlwTjhkSlZOdlEvOXBH?=
 =?utf-8?B?WmxKaHdtYUlic2x6L2lldXYvOEM5Qmhrc0hGWlhzQUd5OEFrZS9HQkp0Rm1G?=
 =?utf-8?B?d2tYZWtQRkpJQzZCWWV2NWJUMW4wbFlXNXVxUVlJRHQ5SnJwcldaQzFpNElj?=
 =?utf-8?B?ZlB2dkFvREtDUXBETzV5bEZxeDlVQmFoN21QRjJXbDRuTndza1dTSG1zdmpB?=
 =?utf-8?B?QWdCWUpoS3pHbHVkN2ZSUk1OczJZcy9QVHFtcUwyR3lHblRYOFNTZHBpR1Vn?=
 =?utf-8?B?bDVzTzhPdVRPb3pFczdrQnFCQWtJOGk4T1c5QVNtWTBlbVVERjNXd2M2dElU?=
 =?utf-8?B?VG55ZC9VV1pVNHRURUFiN05mQU1wZDZWenB5SlUvWWVoNVpKaDRNTG1MWHpQ?=
 =?utf-8?B?TFVlcEJrVlVkM05pSVRXd1dvRGhrQWc1bHZSdU1kL1c4NW9yQUo4RUkxRHN2?=
 =?utf-8?B?b09OMHROcXRLUkI3K2RmZEVLUm5DQ3BRVmYvS3M0TFlieXZyN081c0xoditP?=
 =?utf-8?B?Ni9HeDFpYmRwUmhJRG04WXppSUFNekpmT1JtdmY3b2dMQ0dMZzVha010ZCtl?=
 =?utf-8?B?dHl4ajVyY3ZGdjBDQXVlR2pvak92cEU3NzltcFJEejY3ZUliV1ZBTEx4cmN2?=
 =?utf-8?B?a000dG9ZeTY3ek1uTkhoRDVZdGVnUkwwU3ZweVZLOG1RUjYrNkpQWVVFU2Vx?=
 =?utf-8?B?amt1b1Y5Y1VBeHlPNTM4S0NoWkdiU0I0Ym9yUmhhK2lNU2VTVXhPM0E3UFhk?=
 =?utf-8?B?QXhyOEwwd1ZBYVNqQzdSM2FscDA3c3hmdSt5RHZ6SDVFN2JFemREYTkwRFd1?=
 =?utf-8?B?ODdOdGVUMVMzYTRYR3ZjRmVOUmtnMTlCM2pzenVqLy9yYlFyY2c3Qzkvdmlw?=
 =?utf-8?B?QUJhdE5sZFFZQXNhZ294cWFpRFp6S2dyMk5BRytyZ0RIaVkwSEVZMnl5VVNr?=
 =?utf-8?B?dHpJdVVTRW9kMjZuekhEZGorVCs3TWhqcTBDK2RsTWZYQitYWWhHL0VrclZ4?=
 =?utf-8?B?QUxFQllYZG90dVliNU5YaHZNOElpWmJSTjVKQTZlbzY4VEhYajl3MFhEcDV6?=
 =?utf-8?B?cmMxVzZhMHJBdXI5blhvdlpYbnNRQlk4SUwyVGlZT3VJVVVrOGpsMnZheWRp?=
 =?utf-8?Q?GIsbOQSL/irpxDUv5jPyX10wqUc4T7e+CBgdIEr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d57ca22-9a31-487a-7246-08d9618b9b88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 14:30:48.8554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9CEJpFh41y9rr+Ucwbo8oX6eour3LnjholrxXorINS4YDDFKpavoi0WJVQ8ooDStHolSP8H7SJ8ZMSf0hNdBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

While already the case for PVH, there's no reason to treat PV
differently here (except of course where to take the addresses from).
Except that, to match CPU side mappings, by default we permit r/o ones
(which then also means to deal with IO-APICs whose MMIO is not covered
by E820 reserved regions).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Keep IOMMU mappings in sync with CPU ones.

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


