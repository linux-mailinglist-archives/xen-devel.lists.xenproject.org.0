Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7A589EA0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380566.614769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcjL-0007L3-Lo; Thu, 04 Aug 2022 15:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380566.614769; Thu, 04 Aug 2022 15:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcjL-0007Il-Iu; Thu, 04 Aug 2022 15:25:47 +0000
Received: by outflank-mailman (input) for mailman id 380566;
 Thu, 04 Aug 2022 15:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJcjJ-0007II-GD
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:25:45 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20059.outbound.protection.outlook.com [40.107.2.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b43deddc-1409-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 17:25:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8181.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 15:25:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 15:25:40 +0000
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
X-Inumbo-ID: b43deddc-1409-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT2f+RSb9+MqtTP7wQyy7kwBfjjYhJ063qpg6uDydMDY6z73MYs6zusnm/cpNMJJZrPqkJNOrI+nh1Ci0xewDqJLAFpLmJptAkqYoURgiRxk/5M3y13MwXkIrLXI9g8kD2kBM1qefYdsVQ7Uz9zKMDRDOiiZ/9INj51WFVQRxKMPlviQ2EF/2vmbZlnPiTyIuW+FGALEcxhz4T7w7m65cR7caET4/bDkwUeNnhiWRJ+cV6249jVF8nwjKq8DTRdaTuIf9PeEMg/VwFvJmmK+OOE+Sw2KB+2PrbDhSySk1L8GRhU22RcCtXl5rBlMMFUL0GTRGT477c+gB1DyGkwFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hDLDcDGzOVi4qA042+N2xPrue3wYIbHmU2gdBcKRFY=;
 b=jPLPs+zS/m/1C9WdiVN2Kb3okyK1dlG//d92hiALe+u4ZzNvGnLoGHZzRryusElKfVe5tOgE/A+xjPBoKKcFDk9TtAFvQHuflHQXXJeHQ22xbGLg13YII2o4kXkgjBsI92WTnnfMrbpW5uTSk5JuUbqZqG04dn67QYcv/hqK+crxKFpV/MjJnqQim+/WMtIAY6mqHyc6w1SiRoyN8WUpZTWyy3jcmxSY+TEVBlw4xi9nrcumQW4zYO/izjHLygISKXGKoKlJho/x17zqMhigTR2TwFuidtw02vxSBq/QuBtwaWaLQXzjm5pyNhfi9+zYvAzycZCC8LV8JqXexn8chQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hDLDcDGzOVi4qA042+N2xPrue3wYIbHmU2gdBcKRFY=;
 b=cpZjZfuq4KLrSwhYaySKtxisRsYfyqiohsq1ivOAlUr3LTCraZqC1VUtESEpJTC1ItCpEPQkGcbhL4NUSwHEIPJ5+xv4VnzPm9/sGXuzj/KGKhhyd29XlakVOY6wW/fWK1SSpcwNS6fZoMlbVl2Xtpl37BeFJWrOfLkdRxp/1rRAwGimPRhhhUZehCZ1IzbZ76P/FlfIXei3puPo1iuraUQMTk31bKCQv3K5sFRApTip/D4QrDHmJI+qa0nsfh1mHSG5p+HZZ6Boul3rYYJTe7oifERp88j1VXg1wzMTxgM9UHOkEVT9i+YrZJ5Dlteri2uWFTLiVXRvLc4aZmj2MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <961b9bed-29a0-30ae-09a2-001698453be4@suse.com>
Date: Thu, 4 Aug 2022 17:25:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ChangeLog: mention IOMMU superpage support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c43b71cb-d98a-420e-0b9d-08da762d971a
X-MS-TrafficTypeDiagnostic: AS8PR04MB8181:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5zjXP9C6ZG/K8sar1U7HtDqn1bT3KnwlixqY7vtgUkNgpGKXrkw4X8h7Wx64jGJFkbbJ6BylUkjjQyJIN2beb5iWnu+e2F1updTx1ppqQVTne42Nu39J2fQXdf8Yp4ozuDJAkPffqCII9fdc65eexAYrnAhOa5ro4f7sYxIxEx+NuV/yqHgwSxfEkmtb7Jy0IyPjN+0infyWjf5xnuSrXCOhvE2giNAQA+anMR5Q8XWh4rMOyRnOaNA2XOMZQoF41FkPtULv4w9HmKHTyJF5/Rixgmyj2+8gz1LWPChmPXmOGNWbxgl0MBb9ACh7xl0emLOJeHzGzz9aFWwqnEddxR62AnVq6nW/OUln/ion7k99M64uOrBRitoPe9viYMh3YgknpPr2rancwDKqIR2Xz9ccP/NXy3WNermTFlEqkijV6fBfECoxmQpbj/dKJkMkZLahTP66ljAiK3lJodeYR0+8/C7TD5p7HgvWcVRl4hrxKSWeNmethO9VOnpCHt51M5CYU9yRrciWWXvb2eGX9/GA4U9z0S9ZJB9Tl1OWkPEMAnOguSVuKkg86RUeGnPvx847MLhkO6G3k4RD4xYK6KwEphO4Bq90du2cBVwZ0fvjTtSdCy8qyVA3f5kvuNPiFQECjdKepMZF/Wwp/AnGQUktO8gqlvOv1MRHruH2l/IlaXJfkzAcFZ2m0SaSYR7b5NoPXjpdlPIub+8UMcZEpK1Zd5m57h9rSRlrGrwfxX5HJpcmV0Z0lJpfcDv4XLfO5mo4hf+6rt6Hrh1eIVar6qOIq59U38+H37O2Ek7plDvFet9xde6On5zl+Iygrub5DJYeT1OjAuUBLGVcrclhG+KjcchQkmI6PSLm9TtAAGfuT6S/BKXWfze0fqUf6S+psoTYorUwW7vJj6ECmmqOLEKNDz6XSe7u8ZTaEeMv5Ys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(396003)(346002)(376002)(2906002)(4744005)(5660300002)(41300700001)(2616005)(186003)(38100700002)(6506007)(6512007)(26005)(54906003)(316002)(31686004)(478600001)(6486002)(31696002)(8936002)(83380400001)(86362001)(66556008)(66476007)(36756003)(4326008)(8676002)(66946007)(6916009)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhpZ0ozSSt1UkxXUWtoZHpNMjkxYXBjUEdwSTNNYVRGRXpkbS84WGxpZ2d6?=
 =?utf-8?B?MCtPQTY5WEtWMnNCL2RIa01OcDIwbXo5Z2dpNjVBSWpFeFcxWmRBenFWYzF5?=
 =?utf-8?B?cEUvdTEyM1NBai9qOFhpWGFGa2E4emdobUNzS0ZBUWMzMjVrNFdVK3dQQk5X?=
 =?utf-8?B?QWszOWNNZlpIL3pCWGhLZDdhYXh5bTVXMlAvSGFrbFhvY1dOYlVWOURMNU1V?=
 =?utf-8?B?UkhJOExOUTFBVFpGS0tLTGgwcmhWUzJqc2FnYzFlM2sxd1VEVmtGd0Z4dkR6?=
 =?utf-8?B?RFZPK2hDZDlqdU1YTWFSdUx5N1pFWlBzWHJVN04vaGpmWDhRcE44OVUyaDds?=
 =?utf-8?B?c0t0ZWxUNGZrcDR3ZHVXSlpzQWlFMExxOHg4b2s4WG9rWXVRYU9HRS9ZSzJt?=
 =?utf-8?B?YjEvQjFEVHAxbzZETzNtT0NENzhOYzRkWEdjT3ZtSklFMklkU2RHdFlmeFZn?=
 =?utf-8?B?ckY2QkpkVDlpZHlTaS9tVlFtdVRybmRVMzJ3TjVmTm5wc3lNdnBEWUxWeWtK?=
 =?utf-8?B?NFpldTFZa3RTN2ZYejJyN1VEUmkrN0lWZ085WHVDRHpGZTZzQ2ZyZHl0OTRV?=
 =?utf-8?B?cGwyeDg2Q05MWXI1djMzRVhYWXVIeEtRNm4vNEZuZGdkWkxJbUhmQWtuYW5W?=
 =?utf-8?B?MmIrK2NodkVrbG5XZkx0TU1EZ3hya1RZZ0hxWW1vK0JicHJXTXlRVmZ5Ulgz?=
 =?utf-8?B?VGdsVUpaNWhQaXZ0dkROM29pdDRwTHE3L3FmUTlwVGM3VmdiVzNXZnBwa1ZH?=
 =?utf-8?B?Ym5tbUhCUzJMdWJmbFFFL3JhRkt6a0tpOS9EUmFyTlY1dTlKU3VSTlZzYk9Q?=
 =?utf-8?B?S09hb2RFOTcySWZjYnVvcUFTTUNrUkpzdytFYXFpQVRLT2JqbWlXZlp0SHZU?=
 =?utf-8?B?ZHp6SlFLQVNndWVDcGl4MENLUGE2U3NnQU9wWEhibHlRZVBKL2c3ZjJ0bG52?=
 =?utf-8?B?YUtTQlhCbE9sdjN2OENpVW1JWmxrZThGSGJhQWhiR3dRK2hRSFpRVmRqMUVE?=
 =?utf-8?B?U08zRjA1REVhZjQxbjBWa1pnZGFWRDUrRlNnL2xic21MR25JZVUyMTdLcFha?=
 =?utf-8?B?c1Jyc0l4RGRodERMUWVHUnBmNU1RbVJBZzU5VmlVZDgvODFwRkE3NjQ0dFh0?=
 =?utf-8?B?S2VEOVdXMjY5SkRqMTVhREhnNE9zaWxLYnpMdG1QMzBjQk1jc2JNdkNveUw1?=
 =?utf-8?B?MUlKVTlreXhuSDNPS0lDbnV0dFhHdVhaY0trQ0ZDY1YvUDNXR3dLZjAvRkQx?=
 =?utf-8?B?QkNqaVFPcXI3VUFZQ0lpaWVyQlBlR3BrQkZkOE9zaTNIQ0xIOXNtcm41UTl3?=
 =?utf-8?B?VzN5WTRVMUZCRnFkNDJzeDZBajU1NzN4M2dNeFFtajJpeERKdEg5M012ZGph?=
 =?utf-8?B?TEtFMlNLZnVnYmRnTXJ6NDQ1WXRoL1RNekJXOVhDMDdzN09hMk1rTm4vRXpQ?=
 =?utf-8?B?azF3M0pZcTdNektCeWpDcWtHdUtjR3lDTDY3K2c1blUxVys3VnFPVUpDbmJR?=
 =?utf-8?B?Rk51R1FSc0FoQ3VkUHV4NkhKM2xCUTBOcmZqK0oxUGN2RDE1c1RVNkJCVzFU?=
 =?utf-8?B?OENUQ0F3VTlwdXRiNjJOOVgyeG5GclVZQlk0c3R5dmkzUDZUVm82alphb05J?=
 =?utf-8?B?bEE0VC9lTy8yZEltdTVoUlZCOFhLaThYczVuSEN4VEFJNzZGRmI5VklybEQv?=
 =?utf-8?B?bzRZNzFrNnNqWHRTbVNJY2czcXNYekNYOU9tYkdNc2lrV1ExUlNNeFhzTE1S?=
 =?utf-8?B?ZWlLazdtRUZWbjE2a3ZzVHlHanI0S2U0QUVOaEdkUFJUVmt3WnZQWjVrZ3Zi?=
 =?utf-8?B?OXRtTmV6bklRWitDOGlQUVo4ZitNbjByRUFwcWlJS0t6bTNNZnNQN0Q4ZTNE?=
 =?utf-8?B?SUlKZHFBSm5LeDFlR3NBTnRjSEMrWENDWDdhbk1TWURjb0RmNUN2R2s2ZVUz?=
 =?utf-8?B?REMzbDA3Ykp0RWhHaXdaTm9oZkF5MEUybm9PU3VHYVBFN3JxQTM5N1ZoaEc3?=
 =?utf-8?B?WVhDS0lGM0dBdXZLZUs5MnlSMnE1N1lOY3lmditNVmJRUzJRcnRoY0ZGanBI?=
 =?utf-8?B?eEltcFZrNjFXM05HZ0Jtb05CRjRkUFgwM3VjZ0dXNHR3ZHJ6WXpDRlFXUmdS?=
 =?utf-8?Q?MzU2jFgVx4+HGZGHepJu/QttN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43b71cb-d98a-420e-0b9d-08da762d971a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:25:40.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fPjxx+atX8GUIskvRkl3dVKUCV+Ti8hDVLuStmYIp9F0K2lQ1CsxKJaq/bVg8C4jIuUkQgbAQUx0Wq0HvNdLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8181

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,10 @@ The format is based on [Keep a Changelog
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
    this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
 
+### Added / support upgraded
+ - IOMMU superpage support on x86, affecting PV guests as well as HVM/PVH ones
+   when they don't share page tables with the CPU (HAP / EPT / NPT).
+
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 

