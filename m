Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC17327B8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 08:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549996.858846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA34A-0007ik-8t; Fri, 16 Jun 2023 06:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549996.858846; Fri, 16 Jun 2023 06:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA34A-0007fz-5g; Fri, 16 Jun 2023 06:36:14 +0000
Received: by outflank-mailman (input) for mailman id 549996;
 Fri, 16 Jun 2023 06:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA348-0007ft-CF
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 06:36:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 128df4fa-0c10-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 08:36:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6883.eurprd04.prod.outlook.com (2603:10a6:208:17f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 06:36:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 06:36:02 +0000
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
X-Inumbo-ID: 128df4fa-0c10-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKW0G0jXBoKSz87fmpk4OqLWXHICiRh/FXIwcjbpZXvcZ0euxOlWey3h0OZDxPu1AxFiXQaXK2ooktNycAu8VwY9Ia3jGh84vznWyaf49ST5VoE3hzoGktxv6kBG8Arua6W5LO/JYvVOma4lR8Ur5VjbToq6jpoKexiRzEkOILbcmGgL3CqDY1Rkmf8FodIg3nNjnhgRWYuIZTB7f1i4KJz9xdgDtGoFUJwparnUi5WliljOTj2vscmaFbTUm4t2ZILM+o4V+bwA/etDpMD82XOW3a4MBUzIk6Rwto0WbQK7JeiTSEzZUzvq12lYgjf6So0TCFxLdzjBT2Lkb9r84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKNMScvce+2jl5Vq9PHbxuEgQYwxAYNtD6/4s4nkuRs=;
 b=OZmww18hM8o0vdOamuixCOtsgGX1KlGJiN+Hx1sfOgQUKZ5vIpjvR3E/rcd/SDgd4FiQ6p8+oD9arpV+6J2J8mU3RWwZHzevKIlZQqC5RLXxnSWbgidNfO4MJOsmrszTxJS/LLoXbPDdYMWgx+Kbypzf1jK0iqrk6jEip1sxnCTpRHPUwUH0dAwOZfptPSruEexmh9eUfwL+WJTUmH0YgvC/cFZo69QtmABWv4qNcCTlHXrfZ3IGEi2bO+OAfKt8ykpKp7qfeGDyuc9RbUk3mjW2fHjHrBnW8pCY1ZVSgP5kQi76zPXcunMA1ptJO4fYYSZtp0Mm2QMpYEQ+loBIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKNMScvce+2jl5Vq9PHbxuEgQYwxAYNtD6/4s4nkuRs=;
 b=oDAQcb0torV6C6bRwvBCsjuEDReuvwU7HOKSI7+qNsQLWuj1Vlso9pgsEWl2GKK4ECJySRyVZ6k7lk6/dfcWGcynQ5SKWhpkToYMVgq35PcTzvbFCrO3xf+EelFBf9SwPhtQpVYeI76hgcIj5KML0I9rXOANHup6v2FlsZvFnIq2ritaMsCtZgBP2PvxZf6JKU7PJL4ZZrZE4lkL1mRZI/xgbS1SYXQKjBgkcB1zu5QwMI0UjtpPWqNJEW5jsVakEnGXIYdr6iWwSxHMpxwq6Kdythq+sEsdYz2el0IYMniiRVkrmBgvEc2FOmAM0q7x5giSBDqYHeyHOhoN0a9mQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f99bacc6-2a2f-41b0-5c0b-e01b7051cb07@suse.com>
Date: Fri, 16 Jun 2023 08:36:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/Xen: tidy xen-head.S
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f7dbd6-05bd-49e0-c7b5-08db6e33f46d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mIaJIeUMqjIRN43rePnn6YG3m2DBrGobJQPxI4fPnB2Ww0nMaMqWKJXoY7R0ju0cAO+o8hA6b+nnLyhO7YLLBEcKun5BRNwRmWuTzIDohk8VybBO8Q0CcFTx0hyuI4CvNPW3MxvMa7wItph+wBFgANbdh7cDWwz3y1RBEtMEfd7+nW4Hk8VjXiL+QlEJ1DQTai81LVHhc1MbP64XEB/QyOEISgvj7ko0fJe1zczR+Flgb2Forpl/NaLKFWpcxuQbD7N0AfzXfxx07u5ZH21LcYQMaoLkA25pvs1pxHBVNga1Q4j2Tu3Gi/stcfGbKWro0V6895n/7Jfgpnd+N6pRzAf1Hm+NoMhtPR2ku5kMie3CXz/8I4RERx9LJvstdIkPKg3Agr2++7NiVEVBrZpwsQhL+/9hQC/qZBuxFsSnIUWJ9+oQelNpzxbw+/a3t65lrNcRF3QH8W7QC1DOXBuHY3iEsoNLaSkerOJT+aHVUcp66lA2M7PfVZ6dbAGcdx24JWyRwM+uIk8I9Eq/dp336jSslpjBjrEf9Obnvt7SAeQpX+EJidp9VYnZonKQM4qthD4CT4Zj7dqKLleGtympyGPsT00HweMuprOfoDpN3JI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(5660300002)(83380400001)(38100700002)(2616005)(6506007)(2906002)(186003)(26005)(6512007)(478600001)(66556008)(66946007)(66476007)(316002)(6486002)(6916009)(8936002)(86362001)(41300700001)(31696002)(8676002)(4326008)(36756003)(31686004)(54906003)(84970400001)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm1ZWENHdnJVV0xwSGg1bjNKb3V0d0FQUmVyUGs3YzJNdVgzbFU1R3NNR3RT?=
 =?utf-8?B?MVkwSTVvOXpaR3NBTTlPaTFaVk9ZOXAwdXdSQjBmRWcxYTA1UWxWZXBhdURq?=
 =?utf-8?B?VlJLR0dJdENCUDB3UG0xSHZWdThxeENSUXJlQlBSZGQ3UVNiSGJxR1FRZjE4?=
 =?utf-8?B?bTZaRk1zakI0d1VoaCtYaTNVOEF2bjZEeCtPNjhySUszN3ZxWGQzQnRyQ2Nx?=
 =?utf-8?B?bzlwVGlZSitGdC9XY2RnQ3d6a3ROODJNK0ZoaVE4TDZiMFh2QUhuemZkbnhU?=
 =?utf-8?B?aXV0RTFRMldrT2MzR210OTd2cnI0dVRIL1RoSzd1cVR2UnRERDJOOVVlenZk?=
 =?utf-8?B?UkFqNVQ5ajcrTkgrTVdGVmxBc1lmZUZkR1FxVzFoMVlFRkFWUHF5NnVrditH?=
 =?utf-8?B?VmRhd3d6MjYwWW1TSmxCdndZOWR2aWN0VTlIQjJzcWVFR2phYlBuTHVOWTUr?=
 =?utf-8?B?Y2l1akdCU2xTVFBYNzVTYldSb2VPaEl4TmNzd1IySVRxc2FaMDdtN040dksy?=
 =?utf-8?B?L09Mc1BoRjd4MnRwUUxCTU5XRXhZcDRIMXpaNUJtc2N2TlBWdk92d2ZCb0tt?=
 =?utf-8?B?Vk5nY2tsT0VXcGdrZW5EdmJrWFpVMjYrMzZFQWFHV1NSdUV2Ums1N0hoZ0xo?=
 =?utf-8?B?Y3RBNjRRcGVCL2VJcm9nY2kzenA1VDJzWHZNQklqQVg3bDZ1UkJ3cWFNVmNr?=
 =?utf-8?B?UHBlS3VGNnBaRm5LUzhjRWc3THIvZTdLVkVvOFJhbDRlRGFMb05PL1pqeGlI?=
 =?utf-8?B?V2hpbExqeE0yRW1WNG1NZnRPNnBDN1p1UitRQk55a3Y4VjY1UnZGKzQ5RDJm?=
 =?utf-8?B?aTRBR1V1UjBVZ0ZSVmJuSUJOU0xrb3UwMW8rN3dkOUdIVkVySFZjOXJ6ZWtQ?=
 =?utf-8?B?aHhHRmEvSGtYeEI4QkJ3MDVYVFRWYlVmSlo5amJGaTZJalFUMTFUaXMxR3R6?=
 =?utf-8?B?UUo5VTRBZDVpd2o2eFBORUUzUFcyL3lkT2hKYlo2T2tTMVNiMjg2ZXZNQjVE?=
 =?utf-8?B?MnVkd08vdjZOT09aNWdhK0FXdVpqVEd1TVRrbVhCM2Y5QmVYOHR4MU5QR2ht?=
 =?utf-8?B?ZGpMd2VURUJyOHYzcG5PWVJHNzhKbU1zODZoRlVmM3B1NUpQNlcrMDBOWjJr?=
 =?utf-8?B?VVFOcENYTy8wTExjaFdsbzJwWUVNK0xzVW5TQnJYcVNVcEJlRzJHZWh6cjRa?=
 =?utf-8?B?T0ZLbDgxT0JXOVVCTUlVR0hXdkQwTGxBclF1cWZpWnBWWTdseWdpYmJrK2F0?=
 =?utf-8?B?NG1oeUJqUGo2QVVaNS9FazdoSkFvWGwrL1gxbndudEZSU1k4R1ovNTdQWnBO?=
 =?utf-8?B?VGlyWU1xcDMraUVnUnVtNmxub3VpUUpMRnQwRFhhdDBhT3hjQzJRM1V2V3FH?=
 =?utf-8?B?RDV0cHBucE90TWhaSXVUVXpMMndRRlQ0OWxURTM4ZVNMNmllYlIzMmg3VkUz?=
 =?utf-8?B?RkEvOWhSUG1Cd2pzWDc3ZlMyZE1vT2hDYzVWSllTWTlrK2NXUUt6SFdJNWRE?=
 =?utf-8?B?SFArYnFKaGhCckZIR3FxQ2VpaFoxR2ZZdkUrWHVtdThOV3NxWWlTbVNuU3Nt?=
 =?utf-8?B?REF2bDJIQ1dnTVdMcW9DeTh6TkhSai8vRHpYKy9XK285eVdYaEUzVkdodGxY?=
 =?utf-8?B?SDlkaTgyUkhKMUc5cXhpOFBKekY5MXk1aTJTYlAwRDdpWlpSd2FUWXk1VW9J?=
 =?utf-8?B?TDcxSlJBc2pxbTd0VmZsMVdaZlA1a1lGT2psL0xnSk9jRERDSWZHZXVuWlRM?=
 =?utf-8?B?bVkzaGpmKytJNEp2b0RBM2pURDlyZi93NDBIZ3VNazZVUklxSkRpWFdMdUov?=
 =?utf-8?B?cmdwYXRNaXRPTHVzb1V5RU9PTGE1Zlh0UTZacGZHeDZ0dFR3UUZEdUZnVXFS?=
 =?utf-8?B?N2hUU0VnNDQvMDVrUnBWcGpoaDBuMWdocUtLcXJPL1RKVHFjSi9kWXZFMTd1?=
 =?utf-8?B?ZE9BcDN1d2trbmRZaG01UjJBRE8vNUlmTktENlU0Nnk4cXdCWXVIL2l3d2tU?=
 =?utf-8?B?ZDlxOW93eHk3Qm5tYzV6QytoTnJkM3ZEcS9oVXlYM05NM3p1WWkydEJSQlJu?=
 =?utf-8?B?a3RHYUJ4ZjhONUVDR3JKdmR2dU0yVGVsRWRyc0xpSkNvU3VtVG80QVV3UEhH?=
 =?utf-8?Q?VxN2V7GOXuwKPgRSlhTP/7XRz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f7dbd6-05bd-49e0-c7b5-08db6e33f46d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:36:02.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qlqc9fdBKfjsqhiLYSp0lA3nlYijR/+UoWygESF9Zu6Cjgy/Qq4f4XRYm881kVtPGsngCg9HeMSly9DxY0yyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6883

First of all move PV-only ELF notes inside the XEN_PV conditional; note
that
- HV_START_LOW is dropped altogether, as it was meaningful for 32-bit PV
  only,
- the 32-bit instance of VIRT_BASE is dropped, as it would be dead code
  once inside the conditional,
- while PADDR_OFFSET is not exactly unused for PVH, it defaults to zero
  there, and the hypervisor (or tool stack) complains if it is present
  but VIRT_BASE isn't.
Then have the "supported features" note actually report reality: All
three of the features there are supported and/or applicable only in
certain cases.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
PAE_MODE, while in principle meaningful only for 32-bit PV, subtly
affects the start_info structure handed to Dom0. I guess I'd prefer if
that subtlety was first dealt with in the hypervisor, but it may well
turn out that it needs leaving as is.

SUSPEND_CANCEL is questionable as well: It was only ever consumed by
xend.
---
v2: Correct 32-bit non-PV mistakes. Drop HV_START_LOW. Also move
    VIRT_BASE, INIT_P2M, MOD_START_PFN, and PADDR_OFFSET.

--- head.orig/arch/x86/xen/xen-head.S	2023-04-23 21:02:52.000000000 +0200
+++ head/arch/x86/xen/xen-head.S	2023-02-15 15:43:03.000000000 +0100
@@ -90,30 +90,35 @@ SYM_CODE_END(xen_cpu_bringup_again)
 	ELFNOTE(Xen, XEN_ELFNOTE_GUEST_OS,       .asciz "linux")
 	ELFNOTE(Xen, XEN_ELFNOTE_GUEST_VERSION,  .asciz "2.6")
 	ELFNOTE(Xen, XEN_ELFNOTE_XEN_VERSION,    .asciz "xen-3.0")
-#ifdef CONFIG_X86_32
-	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __PAGE_OFFSET)
-#else
+#ifdef CONFIG_XEN_PV
 	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
 	/* Map the p2m table to a 512GB-aligned user address. */
 	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
-#endif
-#ifdef CONFIG_XEN_PV
 	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
-#endif
-	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
-	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,
-		.ascii "!writable_page_tables|pae_pgdir_above_4gb")
-	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
-		.long (1 << XENFEAT_writable_page_tables) |       \
-		      (1 << XENFEAT_dom0) |                       \
-		      (1 << XENFEAT_linux_rsdp_unrestricted))
+	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
 	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
-	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
 	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
 		.quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
-	ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
 	ELFNOTE(Xen, XEN_ELFNOTE_MOD_START_PFN,  .long 1)
-	ELFNOTE(Xen, XEN_ELFNOTE_HV_START_LOW,   _ASM_PTR __HYPERVISOR_VIRT_START)
 	ELFNOTE(Xen, XEN_ELFNOTE_PADDR_OFFSET,   _ASM_PTR 0)
+# define FEATURES_PV (1 << XENFEAT_writable_page_tables)
+#else
+# define FEATURES_PV 0
+#endif
+#ifdef CONFIG_XEN_PVH
+# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
+#else
+# define FEATURES_PVH 0
+#endif
+#ifdef CONFIG_XEN_DOM0
+# define FEATURES_DOM0 (1 << XENFEAT_dom0)
+#else
+# define FEATURES_DOM0 0
+#endif
+	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
+	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
+		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
+	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
+	ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
 
 #endif /*CONFIG_XEN */

