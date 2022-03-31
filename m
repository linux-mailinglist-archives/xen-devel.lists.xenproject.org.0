Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2D4ED6F1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296811.505361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr9D-0000hH-CD; Thu, 31 Mar 2022 09:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296811.505361; Thu, 31 Mar 2022 09:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr9D-0000fF-92; Thu, 31 Mar 2022 09:31:19 +0000
Received: by outflank-mailman (input) for mailman id 296811;
 Thu, 31 Mar 2022 09:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZr9C-0000f9-FY
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:31:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50e03e4f-b0d5-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:31:17 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-gRSW_mqeP9yo4G6zBTyBgw-1; Thu, 31 Mar 2022 11:31:06 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4785.eurprd04.prod.outlook.com (2603:10a6:208:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 09:31:05 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:31:05 +0000
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
X-Inumbo-ID: 50e03e4f-b0d5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6S1HpDENtJ7ubBweYtGrl5poiiLyhdsWba6MqBcEJhM=;
	b=QOn1Y0KXP5Ng5TnCmNJmGjITdOzhuA7NRwJcW61TIVGRleU4TdFOhN+ZWq38BVvITjD9oQ
	Tq3ajD/cG/9cYBaZMNpwojRBRHtiIgJABRqKrzobClXuGQX79Ug4UFFabHisyG27nIfZD0
	PORPYEB6X72ibnv2m5r4AXTNklPJNGU=
X-MC-Unique: gRSW_mqeP9yo4G6zBTyBgw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC0dpPWDisbFK77x9NKqkHvYBfBYBJC5/LqvKLpR/Ag6iCeOvoMYCAp6La3M8ivSqXZjgoXh9dIz0uoVKMgzltx7fOxL5Bvbm6774RO90kwIKibyfcid2ZGh9sdePSkhVurbUZMGzsyskLnH603NrUbUorJpSnmG4WQ8SkF904IluKnBVbO0ec68ERDbU3jCzDwfNJQDuRgMZfH6HpoHo1Hv70udwve94hLyn1cXIUOBpaLWQO1npjIuwGGtr6yqUdW5xSYwRVS6ONvE2LCFjz9BnMaV3o2+D29WO55kqkLGtv30VROx0ytcqBuTDVecRANtUEji9Y2RGOV62NxCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S1HpDENtJ7ubBweYtGrl5poiiLyhdsWba6MqBcEJhM=;
 b=G/CvAumSVmKG3+SKVSitG3KZ/o8Sug/S2l3Z3FUpLpEG6xTfL7aNn5/X/RgLkAWwrBXlyA7U1rkrjR5oudC3byxjrgl8GezSoa31CiTtK7z4P6yiyldicBEhX8E2V6xnYrhaKzLPzFz67P/ugVox4kF4uqzlYH190YTQyjwFtdB3EhUUtflzgZkte+od9kwuJMcogdbrhFynbw+P6l1D+aqxMg6hxNyx0WuIoW0x4G40htPRFxnmHNF+OWS15bNTvD8if6G+A8LlQMUvP0fg3qLWA83zvKv57K6eIr2GF+OYzJTFqBReUF1YyTGokRbw1ICvLliFCIcuMOolIU99zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a0cf101-17fa-cad2-e791-15d8d8cc5b79@suse.com>
Date: Thu, 31 Mar 2022 11:31:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 3/4] include: move STR() and IS_ALIGNED()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
In-Reply-To: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0084.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe9777b-35ee-4364-9c30-08da12f92d99
X-MS-TrafficTypeDiagnostic: AM0PR04MB4785:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB47852E13FA722A30466C51FFB3E19@AM0PR04MB4785.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bvotVQF+FjFhDv++DtZH9hiCfEvuwzQ9U3JALWnl7l968Lkay3EHtBUBOaBGxUS3tXQZG/N/12L814prU787IgaTRcE7AxpXATeNODS3v3qo0xCc8Hh2bjTHgijNke59ivEovq04aid9VEqTZSUUjgvUFnnw0blfHKZN12+agv/Ho/8TW2v2yURa7s5+XvgnbHi7xfQql/2VboymB4ndoCOH5C5VLqaA8lRspW4q+ESjVg26GPmpMmwOc5/n7kk+kSziGD4b4Uc1U1q6EL2leFpPQ3oy3n7Q5N305/ajuUBpy6DrTFbeVPV9ol1gNZBg3zDc4WaleqnFwVwJWe40apZ7xaClYH+xLXlRBZFsN4gots/61CU87y/+5fO7jACb8EwgR3ovD11JXQyAQ965llQRgJ5xvl8r7P6J3Vk6ladwfXLgtPKqcVChiKUXopXpIELxEGJrPcIpKkI7TA+7J4j6njtB/CA3h4BpEBupor5+DsoZ4qKKETXmzKOk3DZ62MGj2nG9v91OudH3dbwvkLwGCYpV0YMbZpP23szTuZcQEx5d8m/I3+ylJFA0o5Ve3ru2Jn9MviQIZPfPzO84X2GBI5lldzZzPbX9Mo2/YrR1G16nLuLitG762n0gOs1gV4pNzuVcIrdlEluSKDwigjiZ9OUgpgzAsQHCJcU8HNWkZEKK/cXN+oGua6gBRQj2BN0Bdvnh+xTVFDwPYiItg2LRMdmYQPifvWcN2h4ZaUwy+3T4+C8ML15Sgp7bOfvz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(186003)(6512007)(6506007)(2616005)(31696002)(26005)(38100700002)(2906002)(4326008)(36756003)(8936002)(31686004)(66556008)(66946007)(66476007)(5660300002)(8676002)(6486002)(6916009)(54906003)(508600001)(316002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTMzb2hodDBNT08zMzBEcVlPclVDZnVodTU1ODFqRVNjUXlLTzR4Qm9lc2J2?=
 =?utf-8?B?ZEJ4WnhiRnowZGdMN1RlNXEzdUtIWm9mWld5MzJtRG1HS0RmNG5JUzVmK2h6?=
 =?utf-8?B?S1IzeDIzZnd0bUNFOU5Tc2ExVjBpRmVJUWJ3VlptWUJyME5rTHJjcjR1dER0?=
 =?utf-8?B?MzFmTzE5R090ak1LLzd1dG81UER0YWRhWlhZdFI2R1BJTjlpNldva1ZnbmVH?=
 =?utf-8?B?MGdJVUMwTW9tcnZsR2c5ZFpsZmx2eWZYeG1Fd1JGNzJuRzd6T2l4OStMRmhr?=
 =?utf-8?B?ckZ5VkUyWUhMaGNxc09FZi8rR0RlVk56M0daa1I5dlVqejlpTng0akUyZEhW?=
 =?utf-8?B?cHNaOEdiOERSMVpFU01McDd2OFNEU0xrOC9pU3JMMkdrajdKZUFGcGZnSHZ0?=
 =?utf-8?B?OVBnaXVuMEJLWFJTL0tKaTQ2b1RSVFkvSVdlakpVN1JCT3FvNTBtK1h1MHNs?=
 =?utf-8?B?THQvYWR0RytPelU3YmlkMzZWN21MMFd3RjlYWEJxaXNoRWRqV3dCVWM2djhZ?=
 =?utf-8?B?OUZiL0ZFM3kyOHJMMXBmbnRPUDdnWXdVZ1pSaENwVHV1WUZrSHRYNUtPcmJK?=
 =?utf-8?B?bWJkbHhVdDVPUFNDVWFvSDJqOTNUMG9WQVo5SWo5My81ZVBoc2kvT3FkOXd4?=
 =?utf-8?B?WlBhOXRETmJ0UTQ4cnpiY3h4c3FPUzhwaHlZN0luNFBiNmRNU1pCZVNSeFVv?=
 =?utf-8?B?WStwTGZXYnlhaTlZUGF1aXVrdVpCWnlKbW42Q2ZINXAyVEJTRE50WkZac1Vo?=
 =?utf-8?B?WFZ4U2hCdHVmcmQxc0o4d3BrcmpuZkVUR0E0TWlzOHdmUFRLVngwY1VMbTNu?=
 =?utf-8?B?WDVOUTZkSmc5b0pFK01ZZ2RobkdPTmZuTE5US3BIL01kellCQ2J0cXRFZktW?=
 =?utf-8?B?eisyb2hGc1dmTUQyU2pRZmdQNU9vTXdCMGd5MFBxaUhmRTN0U1R4UTJTNkRV?=
 =?utf-8?B?S08wK2pNN011ZzRLOFVxaUF6dkJ3WUp5ZG4vUS92ZDlZc2F3Q2FwRFNLMk13?=
 =?utf-8?B?dGlBUDJONllRSkFyUDVEelNvWFloZDFIVjZNZ1hsektFQ1NidmxjdDFqSWhL?=
 =?utf-8?B?MGN4b0NzbVZ0VlhqRU9ETnRnWmhoMEhNU2NEWURKdWFjbHc5OGF2blR5WHhm?=
 =?utf-8?B?V3ZqNG53UVlBVEdUZ2N2QWFDQzBqZDc0czRlbmFxMDQrZXFROC84MVRqQnJN?=
 =?utf-8?B?MTFvOHZMdlorM2s2WkhsdENyMnZIaXRsckJ4VmFIOFNxb0lWTzlUTnlnTnQx?=
 =?utf-8?B?S1FxdExMSlNsSElCQU9QSW1INzMxeEpNYVVaTnphcmZiOTdQdjJIaXM4clUx?=
 =?utf-8?B?UVVqU21qM0xLSWJyV0p0ZGZkaEdaTGFFNTI0U3JFQ1ArUE1SSVYxVGlWOHk2?=
 =?utf-8?B?bjJkd1R6bTI4bEdwT0o5WXlVeGN4WitRSm02MjZVWG1sMU9wM0JGcmhPSUZX?=
 =?utf-8?B?RVlyYUdmVGVtYW1OaVJCTTdxYjJKQWRDTnIvMzJGNGlQbWt5TTM1dEN1K0JL?=
 =?utf-8?B?Vm5YR2d3d1RvMXY3bmcrQkxQaVVKemVneVRYUENQRWNFb0ViZ0ZaMmREMGZM?=
 =?utf-8?B?U2VhbHRzNkhVUnE3dkdGRjlGUjBadmhabjc1TUM4WFovRUYwUnZhZmxXa3lE?=
 =?utf-8?B?bUxveHdRbFhtTGpjanNKN01BTk9UZ2FzcG5rUHZERVpjL2VaNk9KR0k0eEg2?=
 =?utf-8?B?eldad0RwNGJhQzBBb1liYUJRRUExT3hZb2ludVhXSG5nU1I3WVFpdGNTNVZC?=
 =?utf-8?B?M205WGpjV0N0dlRLd2gxQWo5NlBVT1FUQWkvR3pCRzRLZXpWdWNsSVU1eVdW?=
 =?utf-8?B?KzlPOHRRMnJVOHR3Uzl4NGNGWEhXekxBNUFKOTkzc3RYZFQzMjBuYzBoVGFZ?=
 =?utf-8?B?WEM4bHE2dHV2RXN4ZWN3NE5OZUUyalZwZDlQcXJ5d081VkhGV1l5N2xjNVNK?=
 =?utf-8?B?VWsvQVVCblB3Nk03MnQ1ak1HWDFGeDlDMEdqeUQwL1VncG50aVFWSFNqMmJr?=
 =?utf-8?B?d1A4ckNkWHFHU1A5ckdBL05iempQVkExaUJLUHJ1djYyR1dIVzNoQ0NkK0Iy?=
 =?utf-8?B?aWxOQ0tiNGtOVTZlNW1kck8rRzlGMnVnVmpxMzYzeWl2cDBsWktHc09XeFZo?=
 =?utf-8?B?aXlXRjRTRFFJMTJTWWpma1hHcHdGcVowSURoQTBnSFZNNmNRZzQ2T0VPOGg2?=
 =?utf-8?B?djFEbDY3Qjc5QWxuMk1BdEpFZDdmTWo0VVkxby9vUXphMzJCWWZvalE3NFEw?=
 =?utf-8?B?NDR4ZzloVzNzYXZ0dStidWZ6TXQzNnFkKzJpUlB0SnJPTVdYdGt6aUpvWkh1?=
 =?utf-8?B?L0ppMXUzcS96VUpFb2JiUHJXRERZaENuM1A3a3JzOG9aLzB1emNqUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe9777b-35ee-4364-9c30-08da12f92d99
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:31:05.0513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyQo+QIxmnywGGchhQ7FiWugKU5JHj7Q2YpbMLh9pjeJs7pXaiSNg6/dQm+imuItCIJoLYUReW/A3furLsg9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4785

lib.h is imo a better fit for them than config.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.
---
Originally I thought I'd also move KB() etc, but they're used in places
where yet further adjustments (adding of #include) would be necessary.

--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -3,6 +3,7 @@
 /* Modified for ARM Xen by Ian Campbell */
 
 #include <xen/cache.h>
+#include <xen/lib.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -2,6 +2,7 @@
 /* Modified for i386/x86-64 Xen by Keir Fraser */
 
 #include <xen/cache.h>
+#include <xen/lib.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -82,11 +82,6 @@
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
-#define IS_ALIGNED(val, align) (((val) & ((align) - 1)) == 0)
-
-#define __STR(...) #__VA_ARGS__
-#define STR(...) __STR(__VA_ARGS__)
-
 /* allow existing code to work with Kconfig variable */
 #define NR_CPUS CONFIG_NR_CPUS
 
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -3,6 +3,8 @@
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 
+#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
+
 #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 
@@ -17,6 +19,9 @@
 #define PASTE_(a, b) a ## b
 #define PASTE(a, b) PASTE_(a, b)
 
+#define __STR(...) #__VA_ARGS__
+#define STR(...) __STR(__VA_ARGS__)
+
 #ifndef __ASSEMBLY__
 
 #include <xen/inttypes.h>


