Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF13535F0A
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337955.562676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXu8-0000El-Hg; Fri, 27 May 2022 11:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337955.562676; Fri, 27 May 2022 11:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXu8-0000C6-Do; Fri, 27 May 2022 11:13:16 +0000
Received: by outflank-mailman (input) for mailman id 337955;
 Fri, 27 May 2022 11:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXu6-0007su-Nw
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:13:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000aced3-ddae-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:13:13 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2171.outbound.protection.outlook.com [104.47.51.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-1QpSct_ePjua-SOYLNkHqw-1; Fri, 27 May 2022 13:13:12 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:13:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:13:11 +0000
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
X-Inumbo-ID: 000aced3-ddae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653649993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwR4uJvcM3qrVCLzIeP2CVCTgiXaow7zHN5BzR104SM=;
	b=EnhP/dpcHTRxWZiJjF2cuP8Zmu24lizho1YZ86AxI+HVuK31nNlf6GIzcz23UUT7Gi4tlT
	EOsQV1vkHnZ/3w+THLTBOtOSE8OvidVqkWV7ESeLe2MZ3JGLza6a170/5ZiwkBrD51guNf
	WyhQOayhA7u3LW5wli4tMZgiWw44Ht4=
X-MC-Unique: 1QpSct_ePjua-SOYLNkHqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW0aKbEr0PgBv+J3viEw8PVACE+OLI2m8h2Af7C1VD5Tu4gelkB4S+cAMyu0cZuyApgzAVmiMgHsc5WDMpiBhlnKEUcT3BaqZxUqHTr6eFKCUbeYsQ1nTrzI1EhUvuHV2nnd4u/o1YSVlNg9vGxHDAu606347pXR4Mmp/cTUxaxoqaWsyuRssDICp/wj9m+J2lWxtYz3yEffusrwfDFKhEClhe2nIhwgjQ1qD6DzN7lRM0rKOdqEK599UYGKzvIiSh9X++wu3/nPXwWRDCBrfPvUWZws5IEe7FLywrpRsAEluje7xDekwdHTf7ZMBoqlK6OuCvWOtFM2pFHewtVwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwR4uJvcM3qrVCLzIeP2CVCTgiXaow7zHN5BzR104SM=;
 b=V2MbilDINZdogmHtx/isqzIuw8M85hgopi6syu0t61LE9Yc/3iW7QCDdogIs7CjUvFJieiffrbgfISy8+LWKXxkIzvTFol+3dX8WvZHsxQYArbrQJxG7JHZbLBBjaHCz9RMjYPwowVjLUmwHCH3TKNCk4s6GVaGcOCSV1ADLyXIlZABzkjV3fE+kKUtC5fpM52NlkevWtOkrp8RyTv9SO7xCAfqq4bxvUqZsr2BsKoMUhytn5oeKrPfWHWQUJyMxGNpYaJn66CnASFS8k8CwSnH2ixthPSs2Q0wBIPhaiN9eBP/2fhhCvKxHLc6kGLDWQe14K8j3EdORCiB4WuVDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <614413d8-5043-f0e3-929b-f161fa89bb35@suse.com>
Date: Fri, 27 May 2022 13:13:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 03/15] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0089.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 944c75ec-6132-4d5d-9366-08da3fd1e2d2
X-MS-TrafficTypeDiagnostic: PR3PR04MB7210:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7210534787D6FA906E96B55BB3D89@PR3PR04MB7210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OLQHv9i5XNduo5s2Fnt6mz/HqWTdcpmjzijsEnRg1o728tT+D960uHUCMKXJ0ZDfU3VeU723zRBaxAgmOsUdGKTXedQ2LOm/xb89eFzuJToil++7OqNa++skLbHOwx7pv8uJZVQAwSy7Bh/RMM4ie0H87p+J7ol90xbLE+RDJtxKKrrknI/D1brVzKNVPpvcLaYUTITFqL7oy9yEUQXEDEehQHs+9XYlGfchpZaXiCAixLhHuuWvEVquBCUDdmkoBWLCgpBDdBacM6OCXWjKK4RiJaphHI+8GYntuFDLO8bh2bI0XanPv3hF225xIepN+tIY75VK1WGHk15G6rq5t5/SWPUUsdNzfqNEqOmN2Ka16GDyD3HWTbEwHwGWDjWCFIi3eAK8UPqIuWKMd02+BhKhsUwlrE1LqDvBgB96a/OT5oeMvnFDQLZ6oqmCamB+XGZvgiGqesqdZuGvmcSSuZn5jxUVcgTfYk3d9do2MM0UEBu5Ecweru8n2SpP6N6bfppaPRjWwDVUw4VWejhtyXuv9AV+Vg7UYeiVHgr8egHiS2N3C+PW1DlrNBd2hFdRyNx2jU4lTWx5ymUHepQGb+uDAbY0kCvixa5N/Bl8EgX6WyYnYcipLZtjameHvhEjRNfQBLF2qnrpBPG+hL78h8p9jX2Yu8x+cYlQNDsBznjuRk7wJjoVuOespFkY7S8D20/BUAMXOzUF5GIVewU1IHD414VZs3VG9OsEOnGjuJ18CVGhjE8o8NYNyvcOWtYxCdV4PFARIzqIQj7bA6VvxlGXQQt3C8ofZFP2QfKTZj9+o+mqjcQREymHglO/bAux
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(8676002)(66476007)(6512007)(83380400001)(8936002)(508600001)(5660300002)(66946007)(66556008)(26005)(38100700002)(2906002)(86362001)(6506007)(186003)(54906003)(316002)(36756003)(6916009)(31686004)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0dZdjk0S3dUeDE2dVlHbEk2VUkvQTlUSU8rNDJaWHpaWVZEcnJxSE1hdmRh?=
 =?utf-8?B?OHo4ZHVHcEtkWE90cC80ZWc3aldLblp6a1FXUkhwQ2d3dEhmMlFVNTNWNzlU?=
 =?utf-8?B?RHVNcDRoU1NpTWlTdEdaRlFJMXR6a3hoT0NoZE9CWEQ5R0kxNGFudVNmUUVX?=
 =?utf-8?B?MDV0SWo3cTJBRXhZWEVTdDFOSmp6dlNETDhWZ3FzRUZ2cE1yY3k5Qnk2Y2Zy?=
 =?utf-8?B?WnpjR1VFZGRaUDVNVzEyUmFMaFJBV0hZcmdHdzAxWU5zMVBKcmZKNnBoN2Zz?=
 =?utf-8?B?Z1ZTWEIvVmNPWTFwTnA0WUxCYmtpc241NHkvSVNjM09YYjFZbjdnNit2cCt5?=
 =?utf-8?B?TmQ4WUVxa3BIT1pOcmN4TzhhcG5mTmxqODVrRGxPMzhiMnFmOS9sZnQwL2lm?=
 =?utf-8?B?d3ZMRU1UN010WE9aSUdvODZHeDFUTkNSRm9XZCsxbnhuNmZ4QmtNcXl4WkJJ?=
 =?utf-8?B?YVJ0MEtZajRxRldlaXRkRy8yeU5VOVZDOHhPOWdDYjl4dGNsUnpDeWZUeFN6?=
 =?utf-8?B?Vkt2SmQ0NFFLcGFnNUhlUnZnK25GbTZSQ1llTGVtSzd6amtQZkZuK1dBak04?=
 =?utf-8?B?WFBGSWlkcWg2OGZlU1NjeTJjS1VqZnB4c3pKV0MrK3YzcDNPdE5KcTY0d2h1?=
 =?utf-8?B?LzRKYzRXYzdxYUJxZzZJRHVMMzRTTDdtV2RwT0NUNndrT2dqNmJjZk9MTFMx?=
 =?utf-8?B?blc4djVSNWNHQXg5ckxLT2t3N0xUWkg1YTJZaUVya2t5QWRTR0R2WGZEZ21k?=
 =?utf-8?B?cUxyd3NxQU5wMTFzTzhQRlpiR2IzWmRBMnpsSmNYTkZTVjBuSWZrU3NxU29W?=
 =?utf-8?B?aWVFSWdzVjduWEx3OFBEVkVxZjF0MWJKZmhkaVZ0Nm9yNWorSlY2VTVwWFBk?=
 =?utf-8?B?bU05OUNaTm4wUmFNcFViUjRDbXRPN3VtVjJlVVJCSTlOalpNSGpKR2RQMitu?=
 =?utf-8?B?SzFza0YvTUsweC9qamVNZldiVjhQMXBQSmdQSkFRay9GdzB6SHBEZVJzRFN1?=
 =?utf-8?B?enFxVk9LYnFncnAvdDVQM2htRzA4MHdDSEx6eHl6RkxDVVJScHdldlZMd0ps?=
 =?utf-8?B?cFBWQXJIWWZrMXRJa3gyNm9pbWp5a0Znc0xkbXBUS291RmlYcnBLU05CcmE0?=
 =?utf-8?B?U2pXcDYzbTNXTGRZMDJZeVo4NFZWbzhsdm82SEFEK2kyMU9RRkZseFBWTWhM?=
 =?utf-8?B?NnYxdUl0Z2RnMXdkMlE4aHU4VndpU05VT1cwQldiN0UyTDVqVmtMUUVUUHRB?=
 =?utf-8?B?UXV2RDJraFBwaXFnK2wrUkpKYVhBZjZ4VEtoZEs5UGsxK1ZOQVliZ2dUWmZv?=
 =?utf-8?B?QkE2ekF1UlByalVUWXdiSExyN3lnSHFDcCtiMWJob3MyMzVQaG5CbE90SXNa?=
 =?utf-8?B?ZlNYcElHZDEzcVJKdkdUNW1OWGZwNC9pQXMyb2E3d3hUZHRGSGs1K2IvVWI0?=
 =?utf-8?B?QStPZmxBeE1zVnNFeG1sYW1GRjAvaGVkT3hGRHFMR1VQM1p2VlZOU2dMbnIz?=
 =?utf-8?B?aGMxbjFzK2h1VnFva3NSVlFLdS84TEVhSGxyQjZYMHViNnFlMUh1VDYwL0Jm?=
 =?utf-8?B?TDhQUTN2K0k5QUpQNDhRNmFPT3BLWk1OV2hwOE9MV1Rvc2s5MTZTd3IrOVRM?=
 =?utf-8?B?bmFlOVdxbk8ySEtWTkNPYkhaWUlKSXlzODNQRjV0a2hQT3JXSG1qOWVYZXB4?=
 =?utf-8?B?R3NKLzU2VVhlZ2gxSy9xSHhqVG5pTERtZnVHYTFDRHUyVjllNXNzZ1pidmZx?=
 =?utf-8?B?VnVjNVhLcjBQNzUzSFZJdjR0WU13QTE2YmRPMHNnWWtDdmpFSmVXT3FGdWhp?=
 =?utf-8?B?SjR5SDYwWmtGMEFoZE9wWmo2Vk1OWG0zbk9hN3Y3THdGblJPVW1aandTY2lv?=
 =?utf-8?B?bkxkUzl1QWR3OGJOcExVbWt6ekIveHQvZXY0VThiQXJ5SkcrZzNBa1Y2Yjd4?=
 =?utf-8?B?SmM2czZtWi9ieFRKajFYKzlIT000R25aUEhJaVR4dS9jQnBQZXVsSHR4NFVo?=
 =?utf-8?B?a2RTSUNkU0RtbGZYTlVXaGIvcC9yeVkxbGdUUWdldVBmM0MwclUzRUd3Unc2?=
 =?utf-8?B?V0ttTEFXNDkvSmVCTWVyUVhzNWgrN1pHbFpOam43UjdpUEl2Ym5oUVU3Smd0?=
 =?utf-8?B?NlFaRTlyVVJTY0NtNUM3Tkt2enlkK0xDdWNMS0IzV2MrU3RMelhETDJVMTVs?=
 =?utf-8?B?N0d3MXF3NFVVN3EzdjgvcGxsVDZvZ0hGd2t0QXJ6V2M5aFl0ZVBxeHNzbWFu?=
 =?utf-8?B?MXFNZWpmdWpVTjVnd3pmckVFanZrUjZ5cWRob0dFeE5QSW9KSDVrbmV6TEdi?=
 =?utf-8?B?ZTJjWEdrVnRUWXJuVzRyQzRuYlUvN2F3QTJQT2xTNmZ5aE1BZWNZdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944c75ec-6132-4d5d-9366-08da3fd1e2d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:13:11.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzhVvwcenFqUYNbNfQZt8g7UTFQ0+Hlq4+O5A6QWkvXQs8V0/s7aPPH8s7/a3pm3jr+mlOhWtqqJzczjKT/ydQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

For vendor specific code to support superpages we need to be able to
deal with a superpage mapping replacing an intermediate page table (or
hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
needed to free individual page tables while a domain is still alive.
Since the freeing needs to be deferred until after a suitable IOTLB
flush was performed, released page tables get queued for processing by a
tasklet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was considering whether to use a softirq-tasklet instead. This would
have the benefit of avoiding extra scheduling operations, but come with
the risk of the freeing happening prematurely because of a
process_pending_softirqs() somewhere.
---
v5: Fix CPU_UP_PREPARE for BIGMEM. Schedule tasklet in CPU_DOWN_FAILED
    when list is not empty. Skip all processing in CPU_DEAD when list is
    empty.
v4: Change type of iommu_queue_free_pgtable()'s 1st parameter. Re-base.
v3: Call process_pending_softirqs() from free_queued_pgtables().

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -147,6 +147,7 @@ void iommu_free_domid(domid_t domid, uns
 int __must_check iommu_free_pgtables(struct domain *d);
 struct domain_iommu;
 struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
+void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -12,6 +12,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/cpu.h>
 #include <xen/sched.h>
 #include <xen/iocap.h>
 #include <xen/iommu.h>
@@ -566,6 +567,98 @@ struct page_info *iommu_alloc_pgtable(st
     return pg;
 }
 
+/*
+ * Intermediate page tables which get replaced by large pages may only be
+ * freed after a suitable IOTLB flush. Hence such pages get queued on a
+ * per-CPU list, with a per-CPU tasklet processing the list on the assumption
+ * that the necessary IOTLB flush will have occurred by the time tasklets get
+ * to run. (List and tasklet being per-CPU has the benefit of accesses not
+ * requiring any locking.)
+ */
+static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
+static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
+
+static void free_queued_pgtables(void *arg)
+{
+    struct page_list_head *list = arg;
+    struct page_info *pg;
+    unsigned int done = 0;
+
+    while ( (pg = page_list_remove_head(list)) )
+    {
+        free_domheap_page(pg);
+
+        /* Granularity of checking somewhat arbitrary. */
+        if ( !(++done & 0x1ff) )
+             process_pending_softirqs();
+    }
+}
+
+void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg)
+{
+    unsigned int cpu = smp_processor_id();
+
+    spin_lock(&hd->arch.pgtables.lock);
+    page_list_del(pg, &hd->arch.pgtables.list);
+    spin_unlock(&hd->arch.pgtables.lock);
+
+    page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
+
+    tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
+}
+
+static int cf_check cpu_callback(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    struct page_list_head *list = &per_cpu(free_pgt_list, cpu);
+    struct tasklet *tasklet = &per_cpu(free_pgt_tasklet, cpu);
+
+    switch ( action )
+    {
+    case CPU_DOWN_PREPARE:
+        tasklet_kill(tasklet);
+        break;
+
+    case CPU_DEAD:
+        if ( !page_list_empty(list) )
+        {
+            page_list_splice(list, &this_cpu(free_pgt_list));
+            INIT_PAGE_LIST_HEAD(list);
+            tasklet_schedule(&this_cpu(free_pgt_tasklet));
+        }
+        break;
+
+    case CPU_UP_PREPARE:
+        INIT_PAGE_LIST_HEAD(list);
+        fallthrough;
+    case CPU_DOWN_FAILED:
+        tasklet_init(tasklet, free_queued_pgtables, list);
+        if ( !page_list_empty(list) )
+            tasklet_schedule(tasklet);
+        break;
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
+static int __init cf_check bsp_init(void)
+{
+    if ( iommu_enabled )
+    {
+        cpu_callback(&cpu_nfb, CPU_UP_PREPARE,
+                     (void *)(unsigned long)smp_processor_id());
+        register_cpu_notifier(&cpu_nfb);
+    }
+
+    return 0;
+}
+presmp_initcall(bsp_init);
+
 bool arch_iommu_use_permitted(const struct domain *d)
 {
     /*


