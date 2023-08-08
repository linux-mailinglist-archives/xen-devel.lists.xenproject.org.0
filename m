Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C777739C7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579613.907667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKG0-0001ZA-2T; Tue, 08 Aug 2023 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579613.907667; Tue, 08 Aug 2023 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKFz-0001Wl-W6; Tue, 08 Aug 2023 10:48:07 +0000
Received: by outflank-mailman (input) for mailman id 579613;
 Tue, 08 Aug 2023 10:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTKFy-0001We-15
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:48:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7872f2-35d9-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:48:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9979.eurprd04.prod.outlook.com (2603:10a6:800:1da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:48:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 10:48:01 +0000
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
X-Inumbo-ID: 0d7872f2-35d9-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg4eshNPK0BogUBqtukGSJpyZVE37nMdSp+E4hZ1ygQdDDEo+JSh8kVrPxU7hrgGX+l7aj8V8nLKZW6vsCE/26lA/crjNTSSa9rNQzB17wPFuUAR2HwlS9lIG42I0/Ab8RPIrw7RL4TNyocvrM264B1R1iZZS4i22Bbk2Q0pDymbGUBZNGLZoobCYozMRfGqx2tFHUkgTykaAs5eM81VutbffAKky7jNzhVGaKJjH/P+Cg8wPtRzO8g6lOdfnR1V49EvMcDVy1/Sp5vGcieI7hDQrWxwulFxwdV08vBpl/LSckNVX/kPQVUubvb36+TNWMmIRguIX9PzG2KKnWk7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcYszhiG3WDt8qVSsB1WgPxqNNs02w+HO3DLk2/wK20=;
 b=b7pbgCuUuLmBxDLP6dOT4Rnx3n0GMDvuZQIR+YqUi9t6ePzJuEmiR9LK14cq6Xf54VpBuftuemtzcZb1+RgpJvtubIYYRpJL2Tjyz1m9tM5bHv38eWxuqlI+PKT1m73z4b+7jVXOEalKfMl3uMJW/3i1W/nLm8m8uOPIeOB9UnIIj93q12ZT+ZrgJxfX4GhvpEeVdptuou7Kjoh7odtXpwchqZFwceYDXRNgOU9mcCcLg/sfcPxis8JClN7T17gPVV8f+1yYw59QIQUwpbONJzpPGEQTuPDlUBEutCZyqV8lv4Me1pE10SwJevdmKZW5k/D7P1Grlqo4On2AYLrmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcYszhiG3WDt8qVSsB1WgPxqNNs02w+HO3DLk2/wK20=;
 b=311mBnHFR9oaMpqbVulG46Yzq8hLIHR2G9xnh5FLWmXLINAjf4vdkMk1gNIE2FZ74I82C39svkXkAAOFcXF2397GhbrlxCqywjAz9vOAmRfmebXnPFCiRn8AVBqkYesiuXNcG9ivCrE+JnqNvKOOwe40lNkMiRBqIghETELAJq4CGu3yZC7erEZF0S6Hb8Ee9rey4fxTpu9RFUGMdDZrVCRGRPqIWQvOnJGzav3UUx92dteq7DX6LxcJ5Rj5RP9AezqsZExHpl4gQhlVKc/y5U9kxclJYBCduW1dqUMBIY+WsMPYqBD/+eqJXu3tEAkqvK9bxDLmcinwJ7Osiz2gDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1653f8f-a2e3-5c91-0401-b5ab14415c86@suse.com>
Date: Tue, 8 Aug 2023 12:47:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] move max_page and total_pages to common code
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: f1faa532-c1ce-4350-abf2-08db97fcef9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LMHTQSs9uOy0LRrx142NjDh3RtarZxrOVUYaqrdLQax+dy+E4vsFturAPSEtfjAWsKJVUNlBodq6sDru7MAkfZiwmak8wAS2byzMATg+RV5J+1TiNnHuOL7NhtBkLwI0AnmVyd3vdzQsUHwOP/KiaUs9u802NOodTFVfVGhr6K7NjDvVniEZGaQ+pupG+Rp73TTSCcQsjKodIDOynXGrw4UtpQVPF8E+CFmjV9UsOtpvU2wN3SASY0AD3GlgR+YxqLFKKU848etKuGNwJtmlv5OwTA84Z7gcHuux0lBxHsZ5R1vZZhkqk2hpuBW2GH9f9xyCLvnmBbE+OOg1thbdz+SSaNoySnEuDeKuDEOwdgbovHhOBTf13z3NiuV7CuO/t2brM2zYTex4TBdVJkvbSDJpxpLWUYfHTGnYg4N8tcqRZk8tWTE9iiMjFE8Q+v09ELJ0xMt91oddALf5Vkc55z+UfQ+HlksxH79zseV04Krmq99XUmkNCW3izM0M9dAdpVguCQesY9fBNVyF6phh+OPbRRMhJxC5w4oJ4BANJxWLAwptIyQQ9wE/wN4mTeEXJl6e3jkYV4eomJraZPPh8spS+iMnS+4SnUJ8RQoYvXeS2mfVyN4Y5tz0xa8wvAv6pHQ2y2Zu4YdO3YF+r51gkbQk+4/EzFk5jpyPTvqyKCuCxyK6PXMY63i66JS+U882gPjq3cO6y1DWfjKGqJp8tA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(186006)(1800799003)(7416002)(8936002)(8676002)(5660300002)(6916009)(4326008)(41300700001)(316002)(86362001)(31696002)(2906002)(6486002)(6512007)(6666004)(2616005)(26005)(6506007)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnRTR0VQdExXOHpWZFo5TG9JMjYwZVpWUGJMYXNBZjF1bk8zWFlNaVI0b3Zj?=
 =?utf-8?B?bFNlZlBsU0I0OFMwK1hFRDVzN21UMndDTkc0VXFVSDlyL200eUF6eEVUR1Fu?=
 =?utf-8?B?VEVBM21wdkVnSHZaRlI5R0Y4am1ZeDJIQkVkeUx4UjhicWR4RDk4Q3dickJq?=
 =?utf-8?B?czJ0bTF1Wnc0RUxKRm5LWUJRL0owQklUSHQ4cTI4NG5yUDZTV2swZTJRVUlp?=
 =?utf-8?B?eTNheFowcWtoOHRvYWMvRVVwMFE1V3ROMTJ6bHg1czRzM0lmWUxrZ0o4MS9V?=
 =?utf-8?B?cWgvNkF6bXJqaWR5bm96SWI2V1dqaFdUT1ZqNkRjekppM3BaOG9ySjUyV3lF?=
 =?utf-8?B?Rk1KaHNzQnFLNy9TQWRrV2FMWUljSEhpQkd0TmdkNUYxeDZONE5kSzZRN3Ra?=
 =?utf-8?B?YjZMV3V5NVhVVVdhTzR2WTBzRWgvYTh2aFZzb01sQWl0a1JHMEpjbWoyaDd5?=
 =?utf-8?B?L3Y3azN0dExScVRXdkxWOEZ0bkNlaWwxTkF6eVNUdkcyZUdWbTdCa20wWTA5?=
 =?utf-8?B?OFpKMS90ODU1bTk4NTIwUWhvdWVtT3JTQjdybzRnakJBdjNwNmdwaWc2UExM?=
 =?utf-8?B?RS9ybHc2QUJYOERyajNxdlBsNFpMQ0lwS0ZEdUhJbE9PS1EwVEZKT1RDTHZS?=
 =?utf-8?B?QzRtK3JlRHNLcEtNMWJRd1Z1dWJWNkQ3QU5KTW5oSGxsRlpBWmJRdHBnOWxZ?=
 =?utf-8?B?Y08yRmMyVC82RFZoMjIzMnhGTngzRk5tQlh2V3kraXdpd0V4OUZzdUhWM0xa?=
 =?utf-8?B?Qk96emROd3ZGRXRMWW1uWnZVbExSeHNjYysxUzYrZnI1WkpmbGR0VDI5dGQz?=
 =?utf-8?B?NmZrR1B2dHIrMjVYTVgrOW1XSEM1UUdEc2tsdlBlNnlNTCt3K0RwbUtybHM3?=
 =?utf-8?B?Wm8wMFRyMlBjaE5tMEZEcXIyaGJSZUUwSGxIak5ybWJTRmI2UFJyMDkzRjI5?=
 =?utf-8?B?V0tpQm1vVlN3RDk0djVybjIwMWFXS0I0SlpqMWxQRW9mMGIrUThSbzY4WjBM?=
 =?utf-8?B?M2RRUkZtUkZuTWFsZ3JKRktYaUR4V2RhaTR5SWRWMU1VRHZjOGtMSG51Tk13?=
 =?utf-8?B?VlprS1lPeDN6dkMyb1NEd01LVWhnM0pzVmQyOFFYWXdpMHc1UkgyY3d5Q3hJ?=
 =?utf-8?B?aGtSaVBTZjNlSTRsVUx1S2tTY01hU0g5UFJKbHZaWk43bm10MVowTE9kZFlY?=
 =?utf-8?B?eGxjYThyOXZqTjEwNzg1Yytqa0VzZFR2WEVRcHNMYmlZTmlJQ0N4enFPSnVW?=
 =?utf-8?B?N0dqUmdHQjcyaG1FZ1RUQjVUWVJJMFVoS3FLUk9oUk9VYm5yUGdudXoyUnVr?=
 =?utf-8?B?SDBTNzIyalVReC9KdDVvdmJFMEJOdjBMUXdTaEcxdk1aQ1N3SGsxY3hPWHRT?=
 =?utf-8?B?Q3A5cXRYak1odER3OU9tRHZEWmF5T1NqcGJBdjZpVGNKakZ3TFFxMlpxOUE3?=
 =?utf-8?B?cENlUjlHeVB2Y3FtSDRWQ3prS1NwNmxBV1BleDMxUmxkMVg3ZThUZnBsR2p5?=
 =?utf-8?B?RXcxbXRMTEpDR21yMzA1bEtRbjNnTTljR2VmNUVlbUtNMXQrUXFhSmZpOWZz?=
 =?utf-8?B?cGtjYTBNMjc0NlowUXJGME1CMDB6UG1DMDdaVUFIZlVIUjZaVmNHRE95NThx?=
 =?utf-8?B?aVRreWJzNVM5NTdHNTVJYllPTzdQdFhoT3ZyVS9ucmJ6bzkwN3dQd0dURHJL?=
 =?utf-8?B?ak9Jem1GNnBzbTVUWlBLZFRNeVJIdDF1QmRwRHlWL09QcnBPdEUxZi9XcW5X?=
 =?utf-8?B?N1lZT1ovcjhvSFN2UTg5eFF1dmtnR1dQVGpKa3owcXBlN0hSWTdCeUVMTlFT?=
 =?utf-8?B?L21JcUYyOFBHbjRPL1NLWHhjcmptMDY2c0ZPUW4vTmI3SitNbGJPWkNXUmFE?=
 =?utf-8?B?ZzkwL0ZkK2VSdk5VQzROUlVhZmJKdnMvdWk5N0tCcFd3T2cya2srblU2V2pH?=
 =?utf-8?B?ZHBYTG9mUkpKUzh3S1MyM1ErWm5ibFhGNXhRVit5YUFDaWxWRUZSZnQ2T2Jk?=
 =?utf-8?B?aU9LOUxjY3ZYL0EvcnZHTkVjbElrK3NZa1V3WUpNTGJLRFk3YlBJNlVSZ0Vu?=
 =?utf-8?B?NEhINEsvSVRERzlsdkd4TXZUVGJ0N0FCQ0RwVXdQODhlWkR3Rm5DNS8vcjZ4?=
 =?utf-8?Q?0cziEcfa5FMFFpJYfjf0HlOUW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1faa532-c1ce-4350-abf2-08db97fcef9b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:48:01.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKu3gs1Bl77CCe0P+LIKkY96SUGETL25tZROw0/B9AxDd3AaUNz4rpPIKv2gB92fwINDV3EA2Etqv8jVsKSQzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9979

Common code references both, so the variables shouldn't need declaring
and defining by every arch. While moving the definitions, add
__read_mostly (__ro_after_init would only be appropriate when
!mem_hotplug).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -198,9 +198,6 @@ extern unsigned long directmap_base_pdx;
 /* PDX of the first page in the frame table. */
 extern unsigned long frametable_base_pdx;
 
-extern unsigned long max_page;
-extern unsigned long total_pages;
-
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
 /* Boot-time pagetable setup */
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -134,9 +134,6 @@ unsigned long directmap_base_pdx __read_
 unsigned long frametable_base_pdx __read_mostly;
 unsigned long frametable_virt_end __read_mostly;
 
-unsigned long max_page;
-unsigned long total_pages;
-
 extern char __init_begin[], __init_end[];
 
 /* Checking VA memory layout alignment. */
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -337,8 +337,6 @@ struct page_info
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
-extern unsigned long max_page;
-extern unsigned long total_pages;
 void init_frametable(void);
 
 #define PDX_GROUP_SHIFT L2_PAGETABLE_SHIFT
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -146,10 +146,6 @@ l1_pgentry_t __section(".bss.page_aligne
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
-/* Frame table size in pages. */
-unsigned long max_page;
-unsigned long total_pages;
-
 bool __read_mostly machine_to_phys_mapping_valid;
 
 struct rangeset *__read_mostly mmio_ro_ranges;
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -162,6 +162,8 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+unsigned long __read_mostly max_page;
+unsigned long __read_mostly total_pages;
 paddr_t __ro_after_init mem_hotplug;
 
 /*
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -159,6 +159,8 @@ int assign_page(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+extern unsigned long max_page;
+extern unsigned long total_pages;
 extern paddr_t mem_hotplug;
 
 /*

