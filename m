Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F6050DB6A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312552.529854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuHG-0003n5-Dw; Mon, 25 Apr 2022 08:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312552.529854; Mon, 25 Apr 2022 08:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuHG-0003ka-9N; Mon, 25 Apr 2022 08:41:02 +0000
Received: by outflank-mailman (input) for mailman id 312552;
 Mon, 25 Apr 2022 08:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuHE-0003e7-3Z
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:41:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dee6dec-c473-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:40:59 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-qKVd713AP8u-SNmZDmSHuw-1; Mon, 25 Apr 2022 10:40:56 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3024.eurprd04.prod.outlook.com (2603:10a6:802:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 25 Apr
 2022 08:40:54 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:40:54 +0000
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
X-Inumbo-ID: 6dee6dec-c473-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9yc1zY4O0b+hMzg6Cm9cySZnRsS6KKgNE5TEN/QJ18=;
	b=CikhCdS8ajxONqf5C6XjXIWuO+bWXh8QViRTJh9R/n/MCwINRvaH949NCWwLHAfpt9QK8y
	6m74sz4zgrbINCWPREuSKQC1WMnmE4zOXwzGZ2EmoSKDQAnYxVuuJPRSm1dbHMMxROcdQn
	uz3uLaviBln6h305CGUjSZtRHEySzxk=
X-MC-Unique: qKVd713AP8u-SNmZDmSHuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZ3B+4Gko45DPdGlbaO0jJGgyVkv98b2YSclDN5loclZQ9blMzSMKSWk+pym9uK8qp/qf9VJf1Jd0M+VBbhL1ey62j89w8Ncr3x+ZcPlkqCduVz7lLw+3l9ubMeRgV1qOTaBeHCs7JUp/U3EqWp5Nhaur47qBE0JLDD/BlZuyZAcujlikoQU5CVtUSf5xMEC2/hqs4DUBy+NenOtVw5RGgaAHELwVzXedxp/cxxf2JycTZgMN930vfhjJg2+rknsAYFCmR/L+iIEX4Mw2ICO6GgvcP/aw1nBuvs8feFXkG8bS0EqMmbg5vqvYpvMrboSvH9wCm++a2USIpd0mA1HNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9yc1zY4O0b+hMzg6Cm9cySZnRsS6KKgNE5TEN/QJ18=;
 b=Og3m297lwLlYjVavG2aYsKXYvsoX1W1AAH2lUQ9aqS9qz7I4pQKXqsKe3u/V6lGcoAJM7aamhP0GzibROlqHK7uO9SHkejQzIf/OKNOotGYX969gHGPcwQDu/g/iZuDpR4I2Uupu9x3El0ig4BSZyLG9S5RRPIvNX4a25aSOXcGiZ+ii6acBhOKdCA7lR0kWnSz03xuv5cY0c0kVz78LKR0IIIPZ+TCruWTkxvyK5QTCnyRiOfMniqKf2sBFtnobGlLfUhXR2moEyT/v/g/PtbRxf4icqgudNbYjI5YwEUsEUoKwL+D7UCy3qcVEMyKZREtzbSz2SkW7CxIQPH0ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
Date: Mon, 25 Apr 2022 10:40:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 555bda5b-d73c-403f-75b0-08da26974fb0
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3024B9415DD75825B8461FEDB3F89@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tfcakujOkl5oXtmD+8ssxSE6hPhUjc+RpA2hOuPX6ogxJJTPSHZwCoTb3SZE4gv75gsmVA3ElV9E6nimjzLI4NI8mwCMAG4ucEPKxbKo6iLN28QeqAQyGFRdHTDPXFJMpqUiphV1HRwZ+S3nBZG3bR5lRdw2qJ/oj2VVKU1rBhL90RQo9ndzo7VtW1BJ29J9p47xkcDhwTlSLcaS5syZSVj7rH5vSDmqpbDIOp8BPCwh3DuylogMc+BAK1UdsN+nIa4p38qZyiFh0VAP2YQbntsOdkbB13/ipgiL2ULea72R+gNM0yIzX/KBp0OqL7d6kZSn5+UH65YDOSXcaFhCwgSGyaIWrFCxKfBYKyAX2xnatV5nAOGQ9wsL7+2Q3eMoDgUIlKGmpU+pjzeSjSOKa7rcOfPVwvIU56Zg1A0tOTNPfF6wLHCcVVEcDMsJw2PX4sCOl+KuAqW0dAjpDwu6N5UWKYxScJI+LbFX2PKWYlnAhkECyqbl26adq7hDw8272VwfPF4uyLu3A3m2n+6lpGy3pj6v1v+MDiMaPAPt3Rn3lCe/HrAHzoyxcREBq8bTIfCzSegkb5N/pFSuUlTfwN+6USWx9Ipv5oyywDJmUWVeCMn8KbEnXkpGCUX1iP8K0FOxz9HXJLbvCdgaDsNomwbQkJBDz5a7GVyjgRlfYnKhJeZSsCD5hvdTTZ0v2RLoyY7/y5DPrzJZc82HWijGz2Ax+DHTv/52Z83AgiKQoXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(86362001)(38100700002)(31696002)(508600001)(186003)(2616005)(83380400001)(8936002)(6486002)(26005)(6506007)(66946007)(6512007)(66556008)(36756003)(2906002)(6916009)(66476007)(31686004)(54906003)(4326008)(8676002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjJjL0xHUWhGZUgwUy8vOWRSNXV2dnhlWnBrWnd6S2FLMmdrdGZJSzRYL3Rj?=
 =?utf-8?B?TFZrNUdwMlU2NVM0SWk0TFBzMk10ZkVla3VUZUZNVHlKVjVwY3hYWmQycWJn?=
 =?utf-8?B?dDNKdVVJTVhRM0RHNHVjR1BvOC82Y1VyZmVRZkRzMlp6UHpRU3VDM2g3dVU1?=
 =?utf-8?B?RzNoWE11RHpxRUU0MVNxS0R5OGNtd05xV0hneU5NNkdpTFFialRqOXA0Y2RW?=
 =?utf-8?B?RVQ2RWZaSERxcjFlWWdVc1kzYXk3a2VUK3djWU82akx5Qm1KckpSUGg5bkFX?=
 =?utf-8?B?ckpRMGt4WXdBdEU4eHZQQlF3cWN2YjRwUDNMOThDam55Zmp2RlY5OFhoUk5z?=
 =?utf-8?B?TjdWVUQ5Q25vNGNKZWlWZDByMm1OTi9yYzI5eE8zaGZCQkxpRmRJVDh3N2xq?=
 =?utf-8?B?VytQaGRFUWhYYUd0MkduR1lnRFZEbUtvMXFsVlc5N04zZFlOdGtqTDhDTHFl?=
 =?utf-8?B?cVNjNkVSZWlEUFUzbWp6WngxZHFEaEYwM1BXRTRkeXB1UFRrcTJrSTRpYVd2?=
 =?utf-8?B?eW0xWkhvUmczVncxWnZWUWEyRGtnYmx5UlFtYzIwaFZvRmVUR3R6TVF5dGVx?=
 =?utf-8?B?QkRYbTA2QmFnWWhRK25LcjhScnltTlBxOVNWSTVja05XbnNIUWYrZDVrNzdq?=
 =?utf-8?B?Q0dPR2lvS2xNZXFkMGJ0bW1oaFRNYVhMVGVUQWxtYmlRTzRRNXVtRy9VZzZs?=
 =?utf-8?B?UFNieG5WQ3FUTUZqQi9vY3d1cUhsZzhGT3ViZXBRbDk3UFJOb3ZHMWVBZXdz?=
 =?utf-8?B?aFZFdzllenNlL2Zrd0dNdmRBL3lFUFR3YU9SNjdadGh6SnRZOS9Va00wU21i?=
 =?utf-8?B?M1M4Q3dxK0I0bjFtQ2lCUmdjOUUrMmtnVGhMRUZNcldPcE8vanB6WHlhV1JY?=
 =?utf-8?B?OUpsM0FPRzlHSS9yZWJmcVdoWm5KNkJrN0xjTUJjenBBcEJBaGZ2cGY2Q0Ri?=
 =?utf-8?B?RitYeTlRNVUyUDVVZVMxYWhHM2EyRWhGbE9WVGtHUUV4WnlhU3JlSWVUc3cv?=
 =?utf-8?B?YW5UcVFnMHFvSTRoelZHZzlUZnkxK2RzTlV3RkJIY2E0Q1lYaG9FdWZDQjkw?=
 =?utf-8?B?amt3TDJ4M1dGM1FYVWEzdDYyeEthVE8wbUlIMSs1cmozUnhyKzMwemVpQWEv?=
 =?utf-8?B?V2xMc2ZNV2VhTFRoU0ZlR2x6YWZsaS95UytFUjFXajN2U1lHZUNEK0hzcW9M?=
 =?utf-8?B?YzJaSHBCNkpGYnltQWYxVGVzcFVVaDJDUHNIa3BoUlpEUVlWWUE2L2JDakVY?=
 =?utf-8?B?QndpdXJOenZJbEU5UEZabDlTWE45cUFPd1M2enhtbDI3c3BZbSt3N2o1RkJ0?=
 =?utf-8?B?WEt1TzVCN1c5M1BuU0VDcE9KQW5Pa2ZpMG5GSlMzSXo3aHpMak1MMDk3blpr?=
 =?utf-8?B?YUNhYWdmeWEwdUtwd0RuclVTRzRzQ1o4djZMVHhzSy8xNzZQeWVzUVl5ekIw?=
 =?utf-8?B?cWhGenJoZjdjcmRhVzdEYW4yaC83RkFRSCtPc05NOWc1bHhJYytZUkkweHFW?=
 =?utf-8?B?d0wrR2JGK055ZUd0OWhWZTBhUWNiQ2lhSFdHanJWM3BXR0I3SG1JSU5XOUc3?=
 =?utf-8?B?MVZyUm1NVmRqT0Q4TWNBNWIyRWlMTkRtcGVnZkFMV2xCMlpIYVNxZ0NhckdW?=
 =?utf-8?B?SWMvRHZ3VTNaZld6R0plL1FvdmJiS2RHK0hQTlhzMFd1eWNuNTlLaWY3NmU5?=
 =?utf-8?B?eWlBQ1VaeURLY2h0N0VKeWs1dld5T0UvSU9RT3VQSnRJWXdRVVJXTURvMWlI?=
 =?utf-8?B?dG1pcktXZG5tM3ZySDV0TVRoYmR6MWNNVllOL0V2UE82SFhnVzFRK2w4bzJV?=
 =?utf-8?B?SGxhdUovd3ROVGRwSlJobjEzb3JpczgzTHVtMFVMcWQ4eFJUKyszT3ZHeUxD?=
 =?utf-8?B?dENTRkFjUWxEdXczS2p3cm1qdkxxeXc1RGhwcURWR0NwVHlsVTV3aFhobE5U?=
 =?utf-8?B?R2RrVEVudlVrVEVudE10cE5FaWhLWUdVbWxqT1ZIb3pJalpPTEprL3BBeUk0?=
 =?utf-8?B?ZDZOT25WVDlsQkRNc1FzK1JsMCs0OUdTV3JBZlgvdkhIQXZlb3JwZWJPVW9y?=
 =?utf-8?B?VjZVamdVTEZ2RDhLc2ZmazdUWllMaUY4Uys5dHZnSitCOHVjdld5SDQvVFhs?=
 =?utf-8?B?VE9Jemt2TlBWbnVScFUzaUhFanFaakR2T0RZT3hTbjNobWFZTFhsSitzYmx5?=
 =?utf-8?B?aTFZNC82WWlQNEpjdVJkcnZiRjYzaGdnZ2pwQkg4K1ZKd1RKZThYbVNKQXZq?=
 =?utf-8?B?cE4yRXMyWklPM0lXaFZOa0JOYUpsM3Z6M0dOVWhwaG1BVmlnbmdvY0tERlNp?=
 =?utf-8?B?bXJ1RHlEYlhLdmxoQXR5cW14alUxUDVFdjVoSDBPZGxUcTkzU29Pdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555bda5b-d73c-403f-75b0-08da26974fb0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:40:54.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cWnBrVPL2oHVweV5swGEksjW6qJ/A9bBdlKBQ0B0qI2xYw/JFmwTOqtWLwSQK8rBDD5Ld9eotQe0+udFh0dXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024

Page tables are used for two purposes after allocation: They either
start out all empty, or they get filled to replace a superpage.
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
increasing MFNs, each one suitably aligned for its slot, but also a
respective number of all non-present entries.

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
@@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
 
     while ( nr_ptes-- )
     {
-        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+        ASSERT(!pde->next_level);
+        ASSERT(!pde->u);
+
+        if ( pde > table )
+            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
+        else
+            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
+
+        pde->iw = iw;
+        pde->ir = ir;
+        pde->fc = true; /* See set_iommu_pde_present(). */
+        pde->mfn = next_mfn;
+        pde->pr = true;
 
         ++pde;
         next_mfn += page_sz;
@@ -295,7 +307,7 @@ static int iommu_pde_from_dfn(struct dom
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = iommu_alloc_pgtable(hd);
+            table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
             if ( table == NULL )
             {
                 AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -325,7 +337,7 @@ static int iommu_pde_from_dfn(struct dom
 
             if ( next_table_mfn == 0 )
             {
-                table = iommu_alloc_pgtable(hd);
+                table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
@@ -717,7 +729,7 @@ static int fill_qpt(union amd_iommu_pte
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -775,7 +787,7 @@ int cf_check amd_iommu_quarantine_init(s
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
@@ -2173,7 +2174,7 @@ static int __must_check cf_check intel_i
     if ( iommu_snoop )
         dma_set_pte_snp(new);
 
-    if ( old.val == new.val )
+    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -3052,7 +3053,7 @@ static int fill_qpt(struct dma_pte *this
                  * page table pages, and the resulting allocations are always
                  * zeroed.
                  */
-                pgs[level] = iommu_alloc_pgtable(hd);
+                pgs[level] = iommu_alloc_pgtable(hd, 0);
                 if ( !pgs[level] )
                 {
                     rc = -ENOMEM;
@@ -3109,7 +3110,7 @@ static int cf_check intel_iommu_quaranti
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
@@ -522,11 +522,12 @@ int iommu_free_pgtables(struct domain *d
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
@@ -538,7 +539,29 @@ struct page_info *iommu_alloc_pgtable(st
         return NULL;
 
     p = __map_domain_page(pg);
-    clear_page(p);
+
+    if ( contig_mask )
+    {
+        /* See pt-contig-markers.h for a description of the marker scheme. */
+        unsigned int i, shift = find_first_set_bit(contig_mask);
+
+        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) == PAGE_SHIFT - 3);
+
+        p[0] = (PAGE_SHIFT - 3ull) << shift;
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
 


