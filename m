Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CF5448A4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344912.570539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFH4-0004qF-0f; Thu, 09 Jun 2022 10:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344912.570539; Thu, 09 Jun 2022 10:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFH3-0004nm-Tf; Thu, 09 Jun 2022 10:20:21 +0000
Received: by outflank-mailman (input) for mailman id 344912;
 Thu, 09 Jun 2022 10:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFH1-0003pZ-To
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:20:20 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe09::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2e9ca3d-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:20:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:20:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:20:17 +0000
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
X-Inumbo-ID: c2e9ca3d-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha9OO4+1M3UBYk8ybev9pGOJZyTzGjeYTcPtTIovQn6VxYSIYDc/U+3msdTbfwpp66HzLpXaO8RJJPUk1kO8ALHjplrq+J4fKaFobZFTfTV0QmITV6WmcsICZJQvXtfkjNUM5XSE9nS+LTjCNIfQTo4KRaZIbk5CPf48BI1sL0OG6HmgLO1ckWExWK3RACgfVe3Pd/WJH37AyxDYQWvig7TMteRUNdW9PAMEXAPeQuuiINteV7ydt2mcjKRaHH5OnK1D0qeOO8ElrTfn/rePtJprJYZ831W9UXZmDMMRml4+PSdP1JsYqSK+QP7CIY0F0GEi8z+pQ47lO9mOIXsEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x0wNvPPnwdgiVsTXX9OqkK4ScAeymQhxLWbmrRAFA4=;
 b=TUZGXIqg9V9sQoAChk/pXd8TXeUojT1FHSRzhmeamhxwLWIOq5wqtxWhF7RpqMK7HzS20Qnn5q73EfXKbU3YUD9CJYqhuBBB3Vc7ARxqV1Yk7nf9FWrJXdhR53oBkuvScfXse0+d1+I2TfgmYfv/ejFWdmIJ29+HUhaFBbZJeQ9G1KbCvjpdo7ElQjRsnsyhmgjaZGHfdQsHhB/AbhYfLvv0wdONXWlhc0pL+DasVttmJHoC1rW0DQzfxPaHqF6DvG4NgvRuIYkRNLojI5BqGuoWU4ELN3WXLBpSDX+1aCKffUvkfuQTUeCFeBiDZlgoV/UGiNDHBBztlQWFrS9LCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x0wNvPPnwdgiVsTXX9OqkK4ScAeymQhxLWbmrRAFA4=;
 b=Q+S8oiRd2Zu1eRP1x8lu7kTkRLbcuW8TzVJ7IqaN1rFxyrVHYij9n7/ZHNEQEBKJq2HPrik4RgvleZ75ftE9ngmRtlaIpYhyeeuGFDoPcb7ymhujjixgpHheGnr68f35vNJy+DaQ/D6RQ8OU7mREM8eTYxiC3rdrnx2aA4tJgWwenuSb04BBezqLTi2duncrYirTve3shpXTgCB3duO4cLxTf+iRv++inAO+j4LVBxBT7GT+ptZ+44kxS0Il5qlJT4VBfmuN3cPaXxT/iR1K1/dXSFIpljyEp0Kpd3cqsdpt8MhqLJ2dkcSYmDtYZO4qPmuKMqJZ2oVR/S2qfBhJiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad82cb8a-5682-aec6-c274-0adeb1f48c64@suse.com>
Date: Thu, 9 Jun 2022 12:20:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 08/12] VT-d: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0490.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 999a4e3c-cbf9-41ab-7945-08da4a01a66a
X-MS-TrafficTypeDiagnostic: PAXPR04MB8559:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB85595D9B9FADE356D7527F31B3A79@PAXPR04MB8559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBWul+2N8hKk7UzY2w/Ylocv14sNkIWIPfPrHK3vLSN8FkDhnz84EZYU3vEgXfYGdsib4mB7xfF5qI+1/SOj1IWyZ7ZO3n0voEr7UF0u1PxTWJXVytPaJsOjhGtrum1aayjOYPGUm8OV6b/g1ZdOzQpXTwj1fEpr63Px8wm005BGOwwSIcMHNcQARzRrKckzjiJTfJvXYL1emOZbPoQt3RVt6ITxSokfnG5R69tReereyhRq7pQ70MJzP8QgBU+u5U6HPuQqDWkXT7GPg8CTZlrQRqcqLyeWk/wG2ndFllUhnPRF9EDza7Ck4Wqxf3oQfUiEGCRj1YJosQRS0fuOq2IDc09IiqfLo+iO1JlWyRTVmb7+pgjjKHWrauEaD3E3wiZNuVxGqomwuGE8EIKRk1vVAd4mvWdeiILbk3rmL10gukDGVBvnFnNBEwSk4/guaamt52EGMAXJfY4Z6mFfI0XV5N6XIsWFK6dRqxQB70nljET/tkxTBUYgt2fqtn1Lx2LKk2h1y5p5kBtax6Qzt9MuQfR7SyyMGHh3fMmtfKBW0GuaiG/seoDtxzMGEpjplc90juDLv+H+qGdJ9ayT57syzMt06sLaDnoF6ZhlUOYnAJ6CbQ8RH1bLx2M4xRE5DIdKtcGYTkAzTsmEZm8hKIBqnWVoMvG9WjlqibDCiQJrMqqi7vDfZxWbF6UzuaV0PoX+T3sZ+8eaP6ruzryWHy1G6Ou92Nai51eHw3u+PAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(186003)(2906002)(2616005)(6486002)(86362001)(5660300002)(6506007)(26005)(6512007)(8936002)(31696002)(38100700002)(66556008)(36756003)(66476007)(316002)(31686004)(83380400001)(6916009)(66946007)(54906003)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T05rbndYYjhHbGx2TXBRWExhUXJ1Y2xrazBBbk1YdXV0ZGh3TTBPNmV0Mk1p?=
 =?utf-8?B?RlpDbnpvZ1NPMjVXWFVPNGptM205Yms0VVZQM1F2YnBYTGY1eEVWOVdvenZY?=
 =?utf-8?B?UUxYN2I5SU9QMWkvOVFDT0JvWUZrSVpZUDR5SG4yTHZJVHQ0ZzZRdmo3N2lk?=
 =?utf-8?B?YlpDOUJ4dDJDN2VwcEQ2VHJ0OFVEdHl4U0VLbzBEME1tc1M3bjFVaGhaYWZv?=
 =?utf-8?B?R3Erb0llVGxxQk9mR1lmUkhYRHl0M3FocEJXWDhvSjhDVHNTemNiOFNNbEs2?=
 =?utf-8?B?VWJwT1VZNEk0ZGNoTFB0enpOYXFYV0pjdjRuTURPb2VLK2Vpa3lXbndDM0w0?=
 =?utf-8?B?eEo5Z1NRL2E4d1FzaU5BNHI3NVlVaEE3YWFSWlRHdmZ5L25TS3BHQmQ2N2tY?=
 =?utf-8?B?aWE5M0lqSWxWQVJKWkxiUkMyaXB1Mmt2eVdUUGtsbkR5VjM5Y2NvcEIrelZl?=
 =?utf-8?B?MEt5c01HVUVIQ3hsWTIvb2lSWWlaMGtjNUxGL1NtL0h1T2JjV1lwVmhhaVAx?=
 =?utf-8?B?M0VYRm1BeU00M0ZGTTdKUUs0MTluSjFtOUhZbnNJd3Bqc1hEK1RTRFgzb2dK?=
 =?utf-8?B?VmtxblJ6Z1EycGY0OVhyam9OL3ltTEgwR3VMekJ1WHh0NTJQTFpZVGJzZitq?=
 =?utf-8?B?UzVUVlVYNjdZcHhLSXlDaWh3ckphOGwxbEhiV1ZUSGVOY0VWYnV4aEZkd1hm?=
 =?utf-8?B?aVM5UXI5QVNqRkYzUElZRWNVZkltME5UWFBNcDl1V0dKQndyWjgzZXFHL1g3?=
 =?utf-8?B?bytzeTc1VjJGYTByL24yVDEvdldwd1F6bkdMeXRXSjJwRzhwM0Vvdlg5eEQz?=
 =?utf-8?B?Q1AzUWgyTHFRNm5iT0JXZnZXSVB4TzJUUjY1RmNzYVRsVC82UVRIVTRUWTZ6?=
 =?utf-8?B?T0Uva1dwellBTVVVQ0VwZlpkS21FVXF6TnVyQXc1NmFGLzdJQzcxZ3RvSkhk?=
 =?utf-8?B?cXBXZ2NxQVBYVEh4SnIzekMxN0RUa0k4ek8zL3dyd2RySDJlYVdJNCtaSjJq?=
 =?utf-8?B?ZkpkbVJIVnZLcW50N2FQcFRZNEtaNDgycHBiS2JGNGtyTVJRcjI0MUhMczRU?=
 =?utf-8?B?Y2xDZG1nNWhkZG4yZ21JOVp5cWpiR3VPZk5yL2NMT3E2Ui8rbW5XRS9aalk2?=
 =?utf-8?B?OXRFM3NKSitVeTZlZy84bEsvcFZ6ZUp4YlFydStsSEZUK1FIOFMzU1Q0UFds?=
 =?utf-8?B?Qmkwc0J1MHV3b3I5VkJETDliTXdBZFByc0E0VmY5WDZyekJsSktwOUxJVVMy?=
 =?utf-8?B?aWdneEYvYjlNUDdydzMwQ2tNQmF5YTRObjNVVE9mWlpQNzFJbmp6ZDYwcXdx?=
 =?utf-8?B?VGtsbURoVTNDRGVzeWYvVi84cklxNFVCdDF4M24vQk5Id2NJL00rbGhoaUhD?=
 =?utf-8?B?M0pkZ1ZDZGVjYjRDSGsyYldVTUNFSlgzWmVyN2laR0xMcnRoMUN1ZGhmM2tM?=
 =?utf-8?B?QWVXMm5sRTdZMEo2MFhnVC9GWG0za0ROeDhvdnAwWFRXaStzNXd1ZjU3YWZK?=
 =?utf-8?B?bzg0ZGVnb1VqQVVENGx5S2dOcnR6dHA1UHo2Q2NPSUxFYklBZm52T29pTDRo?=
 =?utf-8?B?NEdsSm4rSlpSZmthOTNYVWVnSnY2Y2loYS9xU1pDbHJvUXh2YkxPMnVzdVEx?=
 =?utf-8?B?Ni9CbDQrME1kUjRESlErUWVkV3VBa0lXN1pBckNNcUNIbm1vRVFFa1Q5VFgw?=
 =?utf-8?B?T2VIcDBXK0xYcXE5Rm15c05QeFRYNndkVi9DblFwVVpRY0dYZHlEcHhCM0hx?=
 =?utf-8?B?c3hJYjJBWlFKYWp2L0VkY2Zib3QraXVONmgva3NhZGdXRDA4KysvZTBVQVFx?=
 =?utf-8?B?dFlCUkdWT0toOUszcVN4aTVCK1EzSlhGY25XYlR5dE9FU0IzbFZNR01HTWFX?=
 =?utf-8?B?ejExb0JxbERzL3NNTldweHBnMWF3L1ZKM2oyVDRuZDU1ZnNWc3JmOXpGeEV2?=
 =?utf-8?B?TVRlK1NVSG5HZWVxanNXbFVYZ2tQMFZoTG5QU21EaVREWm1lcWRGMEVCZWRp?=
 =?utf-8?B?YldyY1NXeVRGMFNBeTl4WW85c2twWUh5Ymowd2V0VE43MHk5ZTNkZkw3VHhv?=
 =?utf-8?B?NG0yMDZRZHdweDVWVTVWNGNKWnNXTWwwdWZuc29kYSs1NDFtMW1UbjAzYjNY?=
 =?utf-8?B?Nmhsb1hMMW1rYnNON3IxazRpOTVlc2lRWURvQ3owOE01TXorc0R2dUdieXdv?=
 =?utf-8?B?UFlKRzZsbVZ1RGtYMnpsSkhrdlQ4NWI3TGVUcDM0U0J2MHhtc291TjZWaTMw?=
 =?utf-8?B?cGxBZEpXdExNM2FjTVA1akd6Y3JHQjZ6KzJsRWliZzQ4TlNYNXd0VWRvUktS?=
 =?utf-8?B?SjdqTFYvV0lFRWlkaUExNjV6Nk1VMEhrY2RreFhtbFpJNU9YZ2Fmdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999a4e3c-cbf9-41ab-7945-08da4a01a66a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:20:17.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vrrtSeyijmSHkq+4iG5A8M/w3D3gFAwV3oEpaZqNWibimu9T8lywHFlJ4xiYoUV5pm0fVpk7lY1pInT/ZSohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Note further that while pt_update_contig_markers() updates perhaps
several PTEs within the table, since these are changes to "avail" bits
only I do not think that cache flushing would be needed afterwards. Such
cache flushing (of entire pages, unless adding yet more logic to me more
selective) would be quite noticable performance-wise (very prominent
during Dom0 boot).

Also note that cache sync-ing is likely more strict than necessary. This
is both to be on the safe side as well as to maintain the pattern of all
updates of (potentially) live tables being accompanied by a flush (if so
needed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Re-base over changes earlier in the series.
v3: Properly bound loop. Re-base over changes earlier in the series.
v2: New.
---
The hang during boot on my Latitude E6410 (see the respective code
comment) was pretty close after iommu_enable_translation(). No errors,
no watchdog would kick in, just sometimes the first few pixel lines of
the next log message's (XEN) prefix would have made it out to the screen
(and there's no serial there). It's been a lot of experimenting until I
figured the workaround (which I consider ugly, but halfway acceptable).
I've been trying hard to make sure the workaround wouldn't be masking a
real issue, yet I'm still wary of it possibly doing so ... My best guess
at this point is that on these old IOMMUs the ignored bits 52...61
aren't really ignored for present entries, but also aren't "reserved"
enough to trigger faults. This guess is from having tried to set other
bits in this range (unconditionally, and with the workaround here in
place), which yielded the same behavior.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -43,6 +43,9 @@
 #include "vtd.h"
 #include "../ats.h"
 
+#define CONTIG_MASK DMA_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d, pgd_maddr) ((d) == dom_io && !(pgd_maddr))
 #define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
@@ -405,6 +408,9 @@ static uint64_t addr_to_dma_page_maddr(s
 
             write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
+            pt_update_contig_markers(&parent->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_table);
         }
 
         if ( --level == target )
@@ -829,9 +835,31 @@ static int dma_pte_clear_one(struct doma
 
     old = *pte;
     dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_null) &&
+            ++level < min_pt_levels )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
+                                          false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
@@ -2177,8 +2205,21 @@ static int __must_check cf_check intel_i
     }
 
     *pte = new;
-
     iommu_sync_cache(pte, sizeof(struct dma_pte));
+
+    /*
+     * While the (ab)use of PTE_kind_table here allows to save some work in
+     * the function, the main motivation for it is that it avoids a so far
+     * unexplained hang during boot (while preparing Dom0) on a Westmere
+     * based laptop.
+     */
+    pt_update_contig_markers(&page->val,
+                             address_level_offset(dfn_to_daddr(dfn), level),
+                             level,
+                             (hd->platform_ops->page_sizes &
+                              (1UL << level_to_offset_bits(level + 1))
+                              ? PTE_kind_leaf : PTE_kind_table));
+
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 


