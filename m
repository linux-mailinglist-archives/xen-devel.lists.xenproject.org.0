Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25D5448C5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344958.570616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFM9-00007c-Mr; Thu, 09 Jun 2022 10:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344958.570616; Thu, 09 Jun 2022 10:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFM9-0008Vh-JC; Thu, 09 Jun 2022 10:25:37 +0000
Received: by outflank-mailman (input) for mailman id 344958;
 Thu, 09 Jun 2022 10:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFG1-000264-44
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:19:17 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe05::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d8311c2-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:19:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:19:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:19:14 +0000
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
X-Inumbo-ID: 9d8311c2-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4Tl17E8XHTZoVwz1PEI6v2e0gSS8GxWHxUU6FNPRDySPytFRDzHpERGfVJYm0z0XprLHQcz7WYCsOE9mnvrFH2HdT6zbxKwpvw5VzfbcF1CHjma/efbamOVyPBftMiWBKv3hS0QRFfC9ha3gqT52u8YFHvTEHVZp/IOzlsXITlXalEfHWNceL9bNOg8MPTOMMYMOE3NKhpysTrbF8bGNiPhopp2/zod5731Yy5QdBxNBijqje9DwnNnQsEv74q5uX6Ea78A7QaYkcUwyxE/XVzemLr3Bn+Bjypc1s8eRsE9AwjH3qK0DuAD/vW+cDICe3C/de3YSyrhd6JmHxAnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd1OcMBHkK7Yj2mkyRz7GlV2YWhhqUm/Sfm8Zi4SK5Y=;
 b=iW6VrXM12rVjjBVQJQWUy7fgy9UZACYQVxVvl1RYc+qebagTI9OafFdPi9aTXT5zs/Mi/T2cgGqDIT4opzVC/aR3TGYfXM3lQB63r3fZpOPHFYbLGlm93bYW9TKInDXS117pf01y8tU/ixaKm8EkJaHw3QJEFtTIXk4dRFrHKRpNA5y7+EE7KT1ewgFpDXo/idpk73k2+jJLf0y+qJzaysWDY4vc/0KcOmSFBOFG/39BANCg55+bCS2tae458rDb/AWsjDYtGGghrk7NoSwS28XQSuDA+tpSvwWBhjJudWuALDDt/4VChDKnrPqJFeL1DgAzr8J4wtPvIjkU+WGyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd1OcMBHkK7Yj2mkyRz7GlV2YWhhqUm/Sfm8Zi4SK5Y=;
 b=eNRCsHzq2no7pRMrWKzaXWXjtYJuIjprLYlCyXvLEc6fFe/GpbEmKSj7vYjNcNX26ck73dClkA9PPBQurlW86bSUMEtV/LiUV7DwAZMPhP1j+DagqimmAymgIcNiaoHaZ3pxmRIpvj7Z8EwveVk9ZqIc7kUTVUpsfqr966cJVPliXDqApCx78vPTzE96igYW4S6KqEEqdIm1tKoNUY0HpyW86TgsruVew3aFzGDK/ZAiJkJIZaIl4UCORV11SxmsEWvsNcQWolrizatkMICIElJkW0hcb8g7lBoKoscd4DH8tZdDvvWKTyZU6ksXQUIhXe1KVmG7VXkUAotbhI0BkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e0d611e-b96c-2aae-1f0e-f5cafddde77a@suse.com>
Date: Thu, 9 Jun 2022 12:19:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 06/12] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0121.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12aa2a13-4c96-456d-8ace-08da4a0180b5
X-MS-TrafficTypeDiagnostic: PAXPR04MB8559:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB85590B057B951531A8EB3F46B3A79@PAXPR04MB8559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KnG7lqmCP//t8u/KZbcr+1apZ/keyGyqIZVeFMzU9N8SgqT2mBxNAjBII9lauXx0odzP6Y9m2x6y8eLvTMKds/SAsj0yrEUE9H9h+S1aFchUwMtlj/v/bI1+qoZRoSPrYoqsuibYuAfQJUOKblGxqrFO3xhTBA1iBL2hS9s9qHj/wMkN+UzqNYPUM+9/3DzI4CBD8Yo/OqWhdBtAlbLXooROnam3kGhO/bYa6afm9KvtwxRg+QUhhjwERCmmAsQOtTtcRlP1gxHqIENler3C9uCeoY1LBIVk4H0V6jPkGo3phcVNsLPCo8r+qSTzgz5d4RphmyWwraE12W+vh4tcGbBRmta/mML6kxjJn6mx5iuiVzWtY1b6OIUGYPphNRdkWMPvgpXgDNFNa3eBnQI758JaZ6Y+90UGvanc9QitoO970YbVEhK7xHj1HA2NVPrn0wxwzZm0TZOJ7EkOOn00TKcpzxQKhIcQ7khbSNcgSeQ9rZ+WvGkbnXxzQXiwKHlcjD3RMOyHTucEuqSRyrR1nqlKgdfvnU9e/A/6LANx79O7H/JAIEzU9PLHWH5rZq6C8B7etaqeylZS4tpJnL35tkU5/Vorqys2Zz5RBYieMQ9x33EtUX2htFXy9Bj2SQrLqDrXSjhvrsyAlu1vZBQQoHf2T5j9GiDFfLPxzArojABS6Pg5DvyeUr2EPkaCHNa88LbC0YGt6jMU0riTw2BRrH/NYU14ZAkkta3h/lOF179KwLM/wbyCPYlMnKUOqdH2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(36756003)(66476007)(66556008)(66946007)(54906003)(6916009)(8676002)(4326008)(83380400001)(31686004)(6486002)(86362001)(5660300002)(6506007)(2906002)(508600001)(186003)(2616005)(38100700002)(8936002)(6512007)(26005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M21TVGh2WG5wZHRyVllsKzhVSVZWSCtEeXZ0bDZLd0ZkWUgzWUhqT05uUWRG?=
 =?utf-8?B?cG9DM2NiR2M0NXBFUjFXZTUvM2J4czBjS25leWNNTUt3NEpwbUVORmJucld2?=
 =?utf-8?B?aTU4b0xCS2d6SjNlOE5wbnRUei9EcWRYSW9sY3BVODBmdUdVUnc3ZFNUNG9a?=
 =?utf-8?B?QWZQRXVDRS9IMEtabFBSUEl6ZEtPQnFEUkFIK01ZSXUrbjE2K0pJeGRXQkZL?=
 =?utf-8?B?Z2ZpZ3htL0NUaW03NzNPVThGSXhVLytIMHdTTTZpMHR1dDBXVFJXN0ZsR0RJ?=
 =?utf-8?B?bENUWFFLSTVsVU9seGpBdFhKMk4rSXZ2ZjZ3R3ZmTitGUHFvZmxSWHZmTkIy?=
 =?utf-8?B?Q1RJZW1MZEVmTWdQUlh4QmRqbGFhcTF5blAxc01YM05MY05ZMnFPd3ZOcUxL?=
 =?utf-8?B?elUrb3lXYkJTVWd0aHNzODBDSzAzb2t5Zlk4ekxNQlIvQXJqM0tSOWdrNnJl?=
 =?utf-8?B?dWdwdXE2aHBwTjVta2xrTVBqN2hYOEN6VCtnSmpud3g0c3V3czlLUGVsUU1W?=
 =?utf-8?B?MlBKcGZ1OFoxRkx0RkZUMVJrc2Q4NENwRit3UlRCNStUQ2dGd2N5TUFGQW5l?=
 =?utf-8?B?bk5hZDdleUlDK0twRnhFaTZZd2ZzR1d1eTZ2bkk1OWo1UWNFZGRyN1NGTWww?=
 =?utf-8?B?K29mSk9nM0lzRU94L1Q5ai81UVFNMll3bjJwcnhCT0VHd1d0bjN4QVRVaTZr?=
 =?utf-8?B?UkppNHlQbDBwMmRBRi9PVHFKcnJXZEJRc1RISDNqb25XZi9pMXpmeGNQQk9W?=
 =?utf-8?B?UmZOaVZwMWRibHUyMWdjV1Y0cjdPUFZ6eXZlOStRZGxJN01WaUo1aWE4blFx?=
 =?utf-8?B?NWxVTlV3M1ZPOHUzeGNPSjRFa2RBOEtnOUhSVmF2QlFuWlZleGNSSmpiNXJB?=
 =?utf-8?B?cVlnTjkzQUdmZVFwL00zbCsrems5VG9acVUyVkUwQWlIcDJta25rS2dHUU5h?=
 =?utf-8?B?cUlPRDZWMCt6ZHFkcWtUejRKSndZYWxUb1NWNGZMV3NhOEtvZmk3MjRtS1pQ?=
 =?utf-8?B?TlF5ZlcxeEtrZm9veVBMQmJjTVdDU1paKyt5bzVrK05jUmlNZEhwMndJSkNE?=
 =?utf-8?B?M1dmMGVtekFpTzB1cnE1ZHRsVnR5R0hJYUNEVGROZndxazcyNnlrZ09nYTdC?=
 =?utf-8?B?bUVqdjVaZnQySVNlYjg5cVovTmFkQnIvUEZmVHEreWdEcXNHUkxXR3lvbXA0?=
 =?utf-8?B?Z3NHTWVVOG5MakVjUHVoQ0tFbllUcG5uQlJyVXJKVXJ1Ry9DYm9qc1Q1YjZS?=
 =?utf-8?B?NVhacVZ4QWJlTHV3dHpLWEpDOTBTNTlVdS9nTktIMU1XTWY1clBaWHV1aWxF?=
 =?utf-8?B?ZENKK2FDQVJiLzU0Qmg4bTNHaytqRm9udkxUWDdXdjVWZmVIOW05ZDF2RWlm?=
 =?utf-8?B?c2RkVHRraU9FNDBGR2daaVdGd05Galh6RklvSFJWSFIyUG4rTG4wV1dRUUVz?=
 =?utf-8?B?UEQ1dk9RU09XZ3NSdnhYVXVjZUdVckYzVVZ6RVpuN1pYNXk3ZEc4QkZYeWQx?=
 =?utf-8?B?bk9DV1RPMzQvVmQrelZIV3dVUTVKRDRvMW1sV3BsMWpqZDJvYlRNSmV4a3pH?=
 =?utf-8?B?Mm1nbmE5cGJMaGp3cXlSTk80cEVUN0o5aUgvU1Z0eWx2Yy9meXo1MlhNb01k?=
 =?utf-8?B?emx0YUx4VFRQbENFaUdjVlNtTjYwcyt6Y0xPdEFRdUxoejk3a1RKaURvMEJ2?=
 =?utf-8?B?eVZEN2FkcXAwTXEzOHpPYXBrVXRKUEFOZGxTeWRaSENQRVdtaFdHRldkNTJo?=
 =?utf-8?B?dkQ5T3E5WUNFZnpuN2d5UEtpUktrczFCK0VITjZjOXJkVHZIeC93RjlEZlNj?=
 =?utf-8?B?TUJ2QzJFcWpBV1M4OHo3K1VDNmMxMUFONHdUSVM1eDNtTGFTWjRhMHJOV2F6?=
 =?utf-8?B?aW9zWjdzVVZ2TndGOU54Nm9ONDV1R21LcTFYY1NKd2ZlWUFCZGQ1LzdEdkJ1?=
 =?utf-8?B?MGVLSHJTZzZZMFRxeXFuL0RqQ3JYdTAwWTJVTGxPdTNQVzUrZ0xpWTVMaHFs?=
 =?utf-8?B?S05BQ0lMVFQzSkFsTThORlN1K0I0a1FweSthYUNsdVdGQnBCNW5uanNzd2Ew?=
 =?utf-8?B?SzNVT3Y4UGNTSXlub0FZalZ2S3dMZGJGQVJMWlFLZHRwTXdPS2p4M0pscmVm?=
 =?utf-8?B?ZjRXZ3FUb29PWEx1WXFjaWRtZFE5Qmg1eXBHUDA2RWxEY1JJckpteEJtR3BY?=
 =?utf-8?B?TmZhWWhVOTdCZmpkTGtnQVRza2lQTWhySUNOd3c0QWoxWWxiejhFWUVpY3F0?=
 =?utf-8?B?UVBYRndQWnhzWGlKMk5aTS9qNVlBUjB6ZnR0bHVBMXpIWXptdEhHVjdjM1BO?=
 =?utf-8?B?OElrb2lERHFHRmtnY0E5anhIczJqeHRTV3V1R0hrUXNKVXZ4dEExdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aa2a13-4c96-456d-8ace-08da4a0180b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:19:14.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gvk5mqf1sb7xrJdh7xLVZv9zRgO8cyk5nVb5ahEarn7RLUGEcyUwREj7N8gOFWHtyCchQdQJEXjkr3Jx8AI34A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

Page tables are used for two purposes after allocation: They either
start out all empty, or they are filled to replace a superpage.
Subsequently, to replace all empty or fully contiguous page tables,
contiguous sub-regions will be recorded within individual page tables.
Install the initial set of markers immediately after allocation. Make
sure to retain these markers when further populating a page table in
preparation for it to replace a superpage.

The markers are simply 4-bit fields holding the order value of
contiguous entries. To demonstrate this, if a page table had just 16
entries, this would be the initial (fully contiguous) set of markers:

index  0 1 2 3 4 5 6 7 8 9 A B C D E F
marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0

"Contiguous" here means not only present entries with successively
increasing MFNs, each one suitably aligned for its slot, and identical
attributes, but also a respective number of all non-present (zero except
for the markers) entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
An alternative to the ASSERT()s added to set_iommu_ptes_present() would
be to make the function less general-purpose; it's used in a single
place only after all (i.e. it might as well be folded into its only
caller).

While in VT-d's comment ahead of struct dma_pte I'm adjusting the
description of the high bits, I'd like to note that the description of
some of the lower bits isn't correct either. Yet I don't think adjusting
that belongs here.
---
v6: Use sizeof().
v5: Assert next_mfn is suitably aligned in set_iommu_ptes_present(). Use
    CONTIG_LEVEL_SHIFT in favor of PAGE_SHIFT-3.
v4: Add another comment referring to pt-contig-markers.h. Re-base.
v3: Add comments. Re-base.
v2: New.

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -146,7 +146,8 @@ void iommu_free_domid(domid_t domid, uns
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct domain_iommu;
-struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
+struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
+                                                   uint64_t contig_mask);
 void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -446,11 +446,13 @@ union amd_iommu_x2apic_control {
 #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
 #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
 
+#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */
+
 union amd_iommu_pte {
     uint64_t raw;
     struct {
         bool pr:1;
-        unsigned int ign0:4;
+        unsigned int ign0:4; /* Covered by IOMMU_PTE_CONTIG_MASK. */
         bool a:1;
         bool d:1;
         unsigned int ign1:2;
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -21,6 +21,8 @@
 
 #include "iommu.h"
 
+#include <asm/pt-contig-markers.h>
+
 /* Given pfn and page table level, return pde index */
 static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
 {
@@ -113,9 +115,23 @@ static void set_iommu_ptes_present(unsig
         return;
     }
 
+    ASSERT(!(next_mfn & (page_sz - 1)));
+
     while ( nr_ptes-- )
     {
-        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        ASSERT(!pde->next_level);
+        ASSERT(!pde->u);
+
+        if ( pde > table )
+            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
+        else
+            ASSERT(pde->ign0 == CONTIG_LEVEL_SHIFT);
+
+        pde->iw = iw;
+        pde->ir = ir;
+        pde->fc = true; /* See set_iommu_pde_present(). */
+        pde->mfn = next_mfn;
+        pde->pr = true;
 
         ++pde;
         next_mfn += page_sz;
@@ -295,7 +311,7 @@ static int iommu_pde_from_dfn(struct dom
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = iommu_alloc_pgtable(hd);
+            table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
             if ( table == NULL )
             {
                 AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -325,7 +341,7 @@ static int iommu_pde_from_dfn(struct dom
 
             if ( next_table_mfn == 0 )
             {
-                table = iommu_alloc_pgtable(hd);
+                table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -726,7 +742,7 @@ static int fill_qpt(union amd_iommu_pte
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -784,7 +800,7 @@ int cf_check amd_iommu_quarantine_init(s
         return 0;
     }
 
-    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd);
+    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
     if ( !pdev->arch.amd.root_table )
         return -ENOMEM;
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -342,7 +342,7 @@ int amd_iommu_alloc_root(struct domain *
 
     if ( unlikely(!hd->arch.amd.root_table) && d != dom_io )
     {
-        hd->arch.amd.root_table = iommu_alloc_pgtable(hd);
+        hd->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
         if ( !hd->arch.amd.root_table )
             return -ENOMEM;
     }
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -334,7 +334,7 @@ static uint64_t addr_to_dma_page_maddr(s
             goto out;
 
         pte_maddr = level;
-        if ( !(pg = iommu_alloc_pgtable(hd)) )
+        if ( !(pg = iommu_alloc_pgtable(hd, 0)) )
             goto out;
 
         hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
@@ -376,7 +376,7 @@ static uint64_t addr_to_dma_page_maddr(s
             }
 
             pte_maddr = level - 1;
-            pg = iommu_alloc_pgtable(hd);
+            pg = iommu_alloc_pgtable(hd, DMA_PTE_CONTIG_MASK);
             if ( !pg )
                 break;
 
@@ -388,12 +388,13 @@ static uint64_t addr_to_dma_page_maddr(s
                 struct dma_pte *split = map_vtd_domain_page(pte_maddr);
                 unsigned long inc = 1UL << level_to_offset_bits(level - 1);
 
-                split[0].val = pte->val;
+                split[0].val |= pte->val & ~DMA_PTE_CONTIG_MASK;
                 if ( inc == PAGE_SIZE )
                     split[0].val &= ~DMA_PTE_SP;
 
                 for ( offset = 1; offset < PTE_NUM; ++offset )
-                    split[offset].val = split[offset - 1].val + inc;
+                    split[offset].val |=
+                        (split[offset - 1].val & ~DMA_PTE_CONTIG_MASK) + inc;
 
                 iommu_sync_cache(split, PAGE_SIZE);
                 unmap_vtd_domain_page(split);
@@ -2168,7 +2169,7 @@ static int __must_check cf_check intel_i
     if ( iommu_snoop )
         dma_set_pte_snp(new);
 
-    if ( old.val == new.val )
+    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -3057,7 +3058,7 @@ static int fill_qpt(struct dma_pte *this
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -3114,7 +3115,7 @@ static int cf_check intel_iommu_quaranti
     if ( !drhd )
         return -ENODEV;
 
-    pg = iommu_alloc_pgtable(hd);
+    pg = iommu_alloc_pgtable(hd, 0);
     if ( !pg )
         return -ENOMEM;
 
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -253,7 +253,10 @@ struct context_entry {
  * 2-6: reserved
  * 7: super page
  * 8-11: available
- * 12-63: Host physcial address
+ * 12-51: Host physcial address
+ * 52-61: available (52-55 used for DMA_PTE_CONTIG_MASK)
+ * 62: reserved
+ * 63: available
  */
 struct dma_pte {
     u64 val;
@@ -263,6 +266,7 @@ struct dma_pte {
 #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
 #define DMA_PTE_SP   (1 << 7)
 #define DMA_PTE_SNP  (1 << 11)
+#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
 #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
 #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
 #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
@@ -276,7 +280,7 @@ struct dma_pte {
 #define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
 #define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
 #define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
+            (p).val |= ((addr) & PADDR_MASK & PAGE_MASK_4K); } while (0)
 #define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
 #define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/io.h>
 #include <asm/io_apic.h>
 #include <asm/mem_paging.h>
+#include <asm/pt-contig-markers.h>
 #include <asm/setup.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
@@ -529,11 +530,12 @@ int iommu_free_pgtables(struct domain *d
     return 0;
 }
 
-struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd)
+struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
+                                      uint64_t contig_mask)
 {
     unsigned int memflags = 0;
     struct page_info *pg;
-    void *p;
+    uint64_t *p;
 
 #ifdef CONFIG_NUMA
     if ( hd->node != NUMA_NO_NODE )
@@ -545,7 +547,29 @@ struct page_info *iommu_alloc_pgtable(st
         return NULL;
 
     p = __map_domain_page(pg);
-    clear_page(p);
+
+    if ( contig_mask )
+    {
+        /* See pt-contig-markers.h for a description of the marker scheme. */
+        unsigned int i, shift = find_first_set_bit(contig_mask);
+
+        ASSERT((CONTIG_LEVEL_SHIFT & (contig_mask >> shift)) == CONTIG_LEVEL_SHIFT);
+
+        p[0] = (CONTIG_LEVEL_SHIFT + 0ull) << shift;
+        p[1] = 0;
+        p[2] = 1ull << shift;
+        p[3] = 0;
+
+        for ( i = 4; i < PAGE_SIZE / sizeof(*p); i += 4 )
+        {
+            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
+            p[i + 1] = 0;
+            p[i + 2] = 1ull << shift;
+            p[i + 3] = 0;
+        }
+    }
+    else
+        clear_page(p);
 
     iommu_sync_cache(p, PAGE_SIZE);
 


