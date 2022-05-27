Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F774535F1A
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337986.562720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXyS-0002o5-1M; Fri, 27 May 2022 11:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337986.562720; Fri, 27 May 2022 11:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXyR-0002lb-TO; Fri, 27 May 2022 11:17:43 +0000
Received: by outflank-mailman (input) for mailman id 337986;
 Fri, 27 May 2022 11:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXyQ-0001xA-G4
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:17:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f73572c-ddae-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:17:41 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-U5vlanUjPPKZrKiI8f-M4g-1; Fri, 27 May 2022 13:17:39 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:17:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:17:37 +0000
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
X-Inumbo-ID: 9f73572c-ddae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOmd6nlV3KqMUXfqufTnFOwdi1OjszdzmaKj6+ae9bI=;
	b=co63amCtMSIcFcYCVdR0FBOQz7md9iwAmFLWYa7UPtoq+8oOFdZEHp9baaZXFqw1cwnvcl
	+7RJyJT7L3wyEMuJQrd8EJ2Mls5ddIDlTfeRiKWguclzOeoak1GJryAASXs5J5kXajYhmV
	FM1DVY2nxDpRKbWo54Yvidhxzwyh2LY=
X-MC-Unique: U5vlanUjPPKZrKiI8f-M4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cycgSMFvQJJguyJomSb4NqgXvqeY+u/O30zML15NWW5Glux3Y8sfj6ReU5ZgdDAj1Q2flBeC/HmYfAokeM/hVwLA/ZbRU0pXa36UGXxwTSWGS18b/R8n+KbrJmGH4ND5XMB9d4kp3BXDOJ9bKmTN99a6op2w7K09XsPOQ43rggXOjS+4gbyhJWMif8Xuwu5CIkyKvgHoMQG+s2f2FlFZIA27TpLAeW/Wjh/gshWP3z3VaOVtUvYg44fixX+aK19UZwazgqjY3jEu94OdekKWWhCmJGFOSEpqkdq14YiN8oIfXzu5cpiXdyg9ExkaVm2ac1oEfmCSnMvhCR0z+SYq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOmd6nlV3KqMUXfqufTnFOwdi1OjszdzmaKj6+ae9bI=;
 b=Oj7xDNdwkx7zT/+mG8fJQS6gKGyWDmGPk1FFfMmv4qvGrH7ZQUPCseG+EyfjliPlcjdpMMJ1ALW7ka6776izvPYke3BXc5KbLNUeXaLNVHXQ0jK86fbJoKXEhmbpqFwa6kWmsNuUU4ZepSSBJhOY0fqC7L0r64ag1bxp/Y4UuPo0pjg1emqqepywphrxiOLxNibLA5NdEpY/jCxJfr8gN8Xt+0rGI8Pvv3qhKx1vCaauK1OqchVzdPXT5/ofQ6kksnPaXplOl0fbJrH3SY6VSr8weaTwskvLGohyN4iLIxapuin3GkRMzoSHJ4Uvv4zF+vBVQ1UV3UzxLQgpIOOEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1df469a9-ddf2-2036-105a-f303f0554f06@suse.com>
Date: Fri, 27 May 2022 13:17:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 08/15] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c85d85b-2366-4447-e41b-08da3fd28184
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB58312E9046B86F241BB99BFDB3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DCW/+L1wfhFMsE1TCd+QyiYZjHhlmKkANqwjQywJ6vex93MOk7PteQcygzBqzluK30h5p0illniaC2v4vbhoJH5AvwKaItTxBXHqdzSw1XTnVlcy7FxZire6oYEHofhCjWshkrfWhXyY0hx5cQ8E/CLTK7dDqyF+36sOVpwuyVho4yx2LTpgc4nUvk1RTc34eEYYpJSRIORAeeyZPhDN5Ek+wMyAY9vzdr/nyuiA49IumpGDGTiN+45r2YOujR3lboAWxZVwWJGXAboZM0vcCOgM1/yPN9GBeqSLt5o+NfJJjA88Y/SDdYuTpm0Wj4iF2mhhtbjOWrHlsUBpcv/KTgkM3xnCz6/Ix8RL93a2IZDSmUnJhtE1p5oH6d79mx4vdswAGKPhvxuQKiwuX1CATs5FdQ1s+eBn6UrpB3lZA9YuAona+4w5lkziGG2fZHeXckYZPTvlN9b3FnB++s3wjt9xP5Pux7BRMOcI2eEtyCWmJGpz5jgEGS9rMhokbiaigQQ+PN3pMQ/iyn1etDVkeh6fr1mO5KvXCHeFrGkiASCNOa6onuupXAVtRdGbTpp7Wy6f9nd8QZy41mZa+kYfRfa+Hyh/mjSZMY0KU3OcPdxYE0vSepPSte9m5dbc29CtyzzGdsp9D66nD/sEtFGWib9kPZA2n2y+3YPk47OMUekfvEttgPPZEOGE6LGsMNQRsMgP4guph4FjrrocUQQR1/8aBTy/vCNBQgYCiYcsqiGdDvdP+t4gGIG9dXOizKSZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZETWUwY05oS3VZaWhQSTJMdHpYMEJUWjVWQndQYkYxZjhSaTBCMDRjYVlY?=
 =?utf-8?B?TTc2WjRYZy9IZmJLTDVlTHZLL2s0T3RmcGVaa1UxeU5hcWNSOTZXZmx3VkhF?=
 =?utf-8?B?d3IycjRuVXc1azRWR0hLb3AxUXBscFlIN2xRcVYrTHNOdWIvVjRDVmhnSU0w?=
 =?utf-8?B?V1J3ZldEbEgxTHl0RTYrN3FZRmNneGpkZWU2TmVxcG85OHJ6QWVuZUl6Z2M1?=
 =?utf-8?B?UDQ2WW51SUJtSW1jak4zajNlVmYzU3pOM3FIbWs3SnpwNWJSUXhyQmtyS2t6?=
 =?utf-8?B?UTJPUFhOVWZxK3pKL2NGM005b0gyUkhBV0pYbWRrWmFEaWV5RGlYK2NHQnhM?=
 =?utf-8?B?ckVQeG5tYWttdk9rbmFobUxEUEFYWFBsekR6a1B3MzFNZS9Ddm01VnhmVVBq?=
 =?utf-8?B?eVZhUVVVZEdBN0QxeGtHVldVUkpQNlp5ZVJaSUVZRzVWc0NTaWtZa05rVWYx?=
 =?utf-8?B?WEVxNnl5RzdBUXhQck9pcHRYVlV0OWhLeVpoWkdSZm1aZDQyb3BpZFkwdFB0?=
 =?utf-8?B?K2RQVVk5SnlOVnBMcWE1M29YYkp4ZlFDcW5Ha3FVZEFJUnl6WEFNd2p6anVk?=
 =?utf-8?B?bXB0bkFZcDNtajRyMkF4Q0dYdmMxUnJKNVJxS0VxZk5nbVRJZmsxZ0xNYnBm?=
 =?utf-8?B?WE15UW0wa3h5cjNLM2ltT25MTWczdk91UVhPUEd4OWI0WGp0N2RTbUF6QmRX?=
 =?utf-8?B?Uzc1TC91T2xlMVZDWHJwL2JxM3E5ZUh6RUczZjVlWW16bWZ0R2FWMVNUYVZT?=
 =?utf-8?B?TnNKaTBENXdGNGpHL3FZWHNHdU1sRXYyMGM4T0NITGRiUXZMQUZJR0hyNFhw?=
 =?utf-8?B?RXljRmFrUzMzeWMxVUk0SGg4Q25vZWtsQnN6a0x5UzF3bGVGKzdsbFYzTHVX?=
 =?utf-8?B?VExPVmhHVDVsZU51Y0JLNWtPMzhiV2pRMGpDU2VVclhCM25jRDRXNVhRdVdu?=
 =?utf-8?B?UC90ZFJ1S01VLy9SbHZ6NmRFWi8rVDh6cUthTWhGV3BzcmljMFBmYSs3cDJE?=
 =?utf-8?B?UHdtbHdCS3dSSXEydklZSmZZM21ScmVENklON1h6ZWtJZHQyTzlHbEFYUldP?=
 =?utf-8?B?VEVkNVJWUFNuMk41eXZEUEpQdHNVY201N0tYQ29QRlNkeDMxaUgvamhiZm5D?=
 =?utf-8?B?OWh1K0NEeWtNdk9UK2FSTlVtZENqc1NvOUdwKzhHdFBrTEZYWGREei9CRzAr?=
 =?utf-8?B?M1BPZWMzTWFMWWhkTXQ5bjZ4UU16MW1HQ2xGTmtEZFZOSzNwMk5ETG0vZU93?=
 =?utf-8?B?Yi9ONnM3WFpGMjgreHM2aXdjMklUT0I4TFF6MVduUW1UeVlZODhGVEFpK3JQ?=
 =?utf-8?B?WVZEUzZBNVl2SjhLZjN5YjljL3VMRFJEazZ1bi9Gem0rWDRCL1oxOHdPTjdm?=
 =?utf-8?B?Q3dPcW9TL2Vxb1lWR3lwU25tQnMyYmlseldRVlJRamlwZDgzKzk2dnFSWGFU?=
 =?utf-8?B?T1hkRWZFRElKclliWGZwa3VlRThmWkVvQjVlSTJRc1VkeWNUWCtmVEFSbWRx?=
 =?utf-8?B?d0RnUmJiaG0vSkhRaDVoZTI5YUxpcnRVSWI1eFpCM09lckFsUDVJQUY0N0s2?=
 =?utf-8?B?NGk0R0VTMEx6d1prM25abGRtUXBQL0pVVXdQcWQwM1lnc3BPQmwyQWVRT0xk?=
 =?utf-8?B?Wk53Q05NUXdzYVlUcU4wRDFrdWJoMFJkOFU0c3doZVl3R1NWU3JHSmp4Q3Qy?=
 =?utf-8?B?QWxTUTZUU1htYy9oU0FPY1J2NDkxR2FlNi8zb0RVR0UzaHZWWDNRWXBJNVov?=
 =?utf-8?B?UkRveHlHS1JDbkgwRWt0czkvR1dnUnpMVkpOQzErSFhjWnl0Sm93a1JaSisx?=
 =?utf-8?B?Rjg0NWJUS0o4MGY0Y0FMWFJ6MTVXdzVKdTlQRUdLU0JtTjREOXV0M1g3VzEw?=
 =?utf-8?B?UDUrNkl0ZWhBbEtWOEZheEp0VGhFK0E4bklaaXdjY1RhL1IvRHNWeDFzVkV0?=
 =?utf-8?B?cmxHWXp2OHZIQjNXbzhtSG9SUHMzRU1MMEJoc0ZldWl0WXZVcHhzOXdPVzdY?=
 =?utf-8?B?LzlDNG83YlVEQVJhTVJJa0JYOHI2d1FHSUgyT3g3Uk13NnpRamJNa2lia2oz?=
 =?utf-8?B?UWZLMndVYWhtMGpzMVg0NndtdjVvYkVveG9yUzUyNlg3emdjS3RiNysrZERL?=
 =?utf-8?B?b1ZUNlprVm8xS2ViY2lDejhCSmR4ZHNwRWRoR2doOGUrNTF4ZUpZRHBwaGZL?=
 =?utf-8?B?RVV4eG05YU14YzdkbUdsWm5yL1VPaXRJZ0pWUTFQeHIyaHZac3BZL2lSa09M?=
 =?utf-8?B?ajllV2tYT2JWOG16NGpFM1JidXFxTlRmSjN2MG9wRXBCZlVPbmV2THVPTEZB?=
 =?utf-8?B?SlRZWW9kdndUcnl0bzUrcCtxMmx1M1BtcnNxRG5XOGJPdktuNHRBQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c85d85b-2366-4447-e41b-08da3fd28184
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:17:37.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xen5K9JNHfQeTxp7SGpY3wvV6jDteF7P5UormBq3gGRLo/EfYSc2d+KrrXbeCIxYDk2DbC9Yoq4qx+BgarlPbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

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
@@ -2176,7 +2177,7 @@ static int __must_check cf_check intel_i
     if ( iommu_snoop )
         dma_set_pte_snp(new);
 
-    if ( old.val == new.val )
+    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -3064,7 +3065,7 @@ static int fill_qpt(struct dma_pte *this
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -3121,7 +3122,7 @@ static int cf_check intel_iommu_quaranti
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
@@ -538,11 +539,12 @@ int iommu_free_pgtables(struct domain *d
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
@@ -554,7 +556,29 @@ struct page_info *iommu_alloc_pgtable(st
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
+        for ( i = 4; i < PAGE_SIZE / 8; i += 4 )
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
 


