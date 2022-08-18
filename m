Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899875983B4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389522.626493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfCM-0007mo-Vo; Thu, 18 Aug 2022 13:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389522.626493; Thu, 18 Aug 2022 13:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfCM-0007jT-Sf; Thu, 18 Aug 2022 13:04:34 +0000
Received: by outflank-mailman (input) for mailman id 389522;
 Thu, 18 Aug 2022 13:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfCL-0006az-EI
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:04:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d041472-1ef6-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 15:04:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4989.eurprd04.prod.outlook.com (2603:10a6:803:60::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:04:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:04:30 +0000
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
X-Inumbo-ID: 4d041472-1ef6-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+jvnZ8muiIRzUeYLyORqxCzoLjA4q7DZPqaVESFX8WSJ1KNasXJOeZeTRDop4wwibtA5PsyByOYbCiZq3iaOH+mrJ77mDHkYb1R/2/IWVqALM/rNJpTDzun7rcIQWlVUFsXZ0dPsekG0nmYAgwE6yfF5uYfkI6tBVuK3UB6/hHHwNfOq6vW+vcJVixYf5S215PfampiKih5oXH81O71d1mRUY4qDcyppH7/tkFI+BKNxKyXiuyTKJlfI+k9KGohnkMx3rM2UVxGLzlYXNk3IowqJDHlkqEx8JfZrhCjhOoLPZ/WBzY0wKHaviBsxfPmbS0JCtbDgB5c2RuMytzGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9X+XMAiX9Z2/4F6tWFKbA2kUecCTVCdhQW9aZDeJlQ=;
 b=X53v8JUgmQ8B2HSt3c5z+q7fcxj3P7L65ub9zhRgof7FqSPYJt/LAFf5AN6zlWrA6hGdhbFPaq/FkO70ZE7fImYdTWWw6hKYy9WS8ieiAOfQGoh4Ah4PtUhvVFEhEU7BPOGwD3/fkCugo+GA7LYRaS+Bipu1DrLhpK/4MI4vfBus4euv5UAEiM9B4r09L31tmw1hpQ2yxVMJDOXn5EvduAFnnAQQL/i/2lz1dRcUx/n8eVutJzhfAzeiQRd/fevikTl+U4GPq5Tuw5n5cRQLo4HGqzBXLfBDrvB2JDqr4wjfBbnky1hQas/jBa/rQUg6U/2s7rEI2Y6CBu7pYhOywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9X+XMAiX9Z2/4F6tWFKbA2kUecCTVCdhQW9aZDeJlQ=;
 b=crEGkO3DjIWu/AAvqIQnmlx2RL0gUQHxf2prme2wHGLspMayIvg7PnZ9ZiLYK47YZu198hMcdF2dG407/dfghIebmFBUvdYevJsQ16/hAi57X2AOnx63kWhNWsbqJm19E1pwBMQOLt5e5uc2rxJLXtDuLh1KgWDczrVWxOyFG3jpAnluoLHd8FJgB62yCjH9b58jvIj9pQCoz+RsTGQTwxBLxbCX92HebGI2xofBnDwqrpI3pFP25r/lHNeslI5j5lVhHcU/orufd4uj2WCwxvgCw5iejv/OFK3TRB44tQtYZOs+ZM11/kvQDks59BE99HqpsDXeBLqiTYERtC4pbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1ca24c7-0031-7ed7-d4a6-a5686cc7fcf1@suse.com>
Date: Thu, 18 Aug 2022 15:04:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 3/5] x86/mwait-idle: add AlderLake support
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d28e4f59-5232-45f7-2fee-08da811a2fe2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4989:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fhWX9NZg/8RU2fhR6il5Oa07amCwE54+hAEW0fi5LGDEXJAXLAy0KdDQzJEwjMtVqL9vJ3kb+xHL3TSiogFIw3u9Dl5kidHEEK2mjSW+crFFj1h7Pm0ZCR/32668G61cYAHaNQHqfu7+YeLGcu4cImKGhGHzDby5/WfhIloNDUZwP9EzJ4HpsMAH5CthLQpcIklmkTrBqYn8RvKwuQ2vtqBtsqP6Xi3Bgrbd/ju2h/ARtHmi4W6tsS/Yqws0bjmMcgaKK3954DrORRGf8wsUwibmRLmsNYQ+1dttZ1FgDTFr41wkCE2x34wStjjXGpvnelB80DazWd1PBmWMLiqMFDD1Hb9Hj+eXPA5bY6TSDXUxlxYCuKc3moz8+2Y7nQYx/o4jrTwrhzao//rL4hejoCmOKNBc1s7vN4uulCFAN/ezkfTIXhc4mDKmogd95oOnL4n0oRcaFrRmLEOAYm5J9WwUkD9a/bCkXoKpr59Kaw+XiLTRPQRXPEFnbxcbaJfujaIVRPT9ZrDO/PJmY52IEF/maHW8XOXSiJLfnas9IEG3R+qlxNoWI+yd11bsdu8tMJHls0i6EqoNL9NckW3eeEWA+vIkHr0eIDWamGttjBJh72+A/1zGPZJJSI+sVBOF/uqk6JcFR7zt3Lu8FrPtsum/CCuJASaLZrgNIT7GYu74R9GUphYwgynIz5FY/v5Q0+xWhLO3zNKsy+VL9ZJEyEJ5FccOS/HVSngv+en1RDI3AAk80WIJIEfFGAeoV8IA9wike12ogJXFeAVYKOAsj4aZF5ZE/cZLDx6UsS/5/T4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(136003)(396003)(346002)(2906002)(66946007)(478600001)(66476007)(8676002)(66556008)(6506007)(41300700001)(31686004)(186003)(26005)(2616005)(6512007)(4326008)(6486002)(83380400001)(36756003)(86362001)(31696002)(5660300002)(38100700002)(316002)(54906003)(6916009)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVVqWGlCMGRvOTZHRXprVkJvUTRkV1FwUXZCbWN4c1UxVnI4aUhXNkVQeUg3?=
 =?utf-8?B?RlBmdHU2WndpMVZLeXVDeUVUTmFNeVNFRnNqRTJSdE1kaWxmNHNtWGF6YWFC?=
 =?utf-8?B?NzFmUmlOVkdpZlQrR1dWNmRxS0tTb0tCZk82S2kzczEydnZPdXZIRWxJNWdp?=
 =?utf-8?B?YjllQmtsTFBqakorMnl1RzZYd1Jza0ZKZHJCNk1GallMNXpOUzVZU0thN29j?=
 =?utf-8?B?S0FSeVQ5QW4xemN0K2FyY2VCYkNuQXdqZ1h5UjFpZndJbDdIV1ZPQ2lwWGxY?=
 =?utf-8?B?UDhhTVJBc24xdjl1bFZVRVhDTG9iL0IzSHNOd1FlczBZMTc5QWYyMG9Jb3pT?=
 =?utf-8?B?SVlRQXpiNlFNR3k1eG9iVFkzSTFLVkRvOUxNUDM5THBmTno3YjFkQTlUaVN1?=
 =?utf-8?B?Mkx5S0JPdk5CeGlBMktQL1daa2J1Z1p5UlYrODczTVN5MjVGQVViY1gwSkFn?=
 =?utf-8?B?ME5aUkt5MHNkUG5SVTJZTGlZeXZ4ZXQrWitDdHZNdEE2anlPRmFZbm1maksr?=
 =?utf-8?B?c0lLTmN3SDFlUFpJZkh3dmZSTmtxVnhYL3Q4aTM0R2hYSXFYQVZNUytpVlY4?=
 =?utf-8?B?eFRSWVJVTFgzN3ZHMTVabXcvODg2RHF0QkpnNVlGNlJ4bG9yS0VmNXd6c0lp?=
 =?utf-8?B?cTk3eStCbDRCOVliS2o4Y3llYWFOT0xZSktZOE9lMmNDS2wydHpiUm9HL05v?=
 =?utf-8?B?TW9lcmdXMTE3c2srVmNOSUZ4YjZJWGdHdVhZbUE5MFNsT2ovenp5ZUxvYTR3?=
 =?utf-8?B?ZUtobVA3RXQvcUV6UHlpZVE2TXV3QzhoNUZyTnAzeldZZXlRUkMzaFBDODJx?=
 =?utf-8?B?bWZqSmxUYVYxTGdsYlQyUXM4SHRDdWhmVnlZNEFIWWprS3ZrcXVhUUVHYVpX?=
 =?utf-8?B?TElHaSsweTVwb3A1V2tseFk3STNVQUlFRER0YU5ublEvbGJWeFVmOXpxMXYz?=
 =?utf-8?B?Qll1cTJraE5NVVRWMjNKTTdLeEdoOHphOUhzQmhUTHVKbzZZd0VXMHdLNzZn?=
 =?utf-8?B?c2dhb1J1ZGpLUTNIR2VTaW84VnZlQ09wa3RXbGxiNE5UbzkzZ3pFMTRKZmlx?=
 =?utf-8?B?YnhnTS9yWUJhb3ljYmp5UlI2L3lkUlpwWXFJaE5hOHVPdEQxeTBEOFpPQlZT?=
 =?utf-8?B?NmRDSS9LR3FqSS93UmhyRGJNNjhFRHhuNG5RZmErZlM1Nnc0d0pYZW1QcEVp?=
 =?utf-8?B?eEVzTit6V1Y5ZE02SmpKWi9ac2NRRlpWUmlpOTFHR2FESlBva0h0VDlhRHlU?=
 =?utf-8?B?LzNYUnRHdzRJalRSRFN4aXhVdjlxWEd6RjR5a1QyMlFDdmh3STZCbjNIQnpv?=
 =?utf-8?B?TEFBdXZiMWlCTkJuTExrOXFieVlUVHFzUDhMS3E2ZHQ3Wmxhbk5nZHJ4UG5O?=
 =?utf-8?B?SHlUQ2Jnd3NJS0M3OWhkZjlxYVoxODdqK1RJZG9BN0plRlN2K0hjbnBwSWt1?=
 =?utf-8?B?YkhraFByVzkvREU2SFY2RWdHaHduTlRvRFdFaXp3RTRMakZoTUVNQjFWck5P?=
 =?utf-8?B?UTkzMmtXbkVwWWlMVW9mb3VZTlRIdzZMaWk5L3hmQnd2aEhIWVY0Y2x6MVhS?=
 =?utf-8?B?T0FBNklCOGpxUllKQ2RYd1g5UnZJZGlyVk9JL3dJNUdKQXZrVmFvUG52cmoz?=
 =?utf-8?B?dWhNTmVPcUZHYkhOMm0rUGJPazkvNEoza2gwcS9ZSklwZy9TbWJNdU5aRkpL?=
 =?utf-8?B?emFVb2FjeERZV0hlUzgyWFVLSlE1Mm9wMFMzQXhqRElLckVlT0RqYWdpczUr?=
 =?utf-8?B?ZWlwekRuOHdORVB6YU5aOTQ5SjYrb2pCdE13TVUrWkIwV2hoKzNIZFplY00r?=
 =?utf-8?B?Zlg4WGk0VGpPRWkzS25QRzZaV3NLM0U3S0xiL1doN1lEaFNEeng1ZjVpb00v?=
 =?utf-8?B?QUZYUG1uZWtpU3l0L09FUllLNnlibUg2UWE4V1ljVzNVSmo4bVE0UFBlNTNK?=
 =?utf-8?B?T3BpZy9FY1FtZ2h4OTl3c3NZMlFlcnZscGxnaTdQMUR0Um1EYVJRWlFJMmNt?=
 =?utf-8?B?OVo5UTNnYkdYSDFHeGVuZUIyVTBwRlR3bDI4bGFNMm44V2t1VnR2Z2JPTkQx?=
 =?utf-8?B?cWdrbjRVK2xaN3dTcklMVWl6OXFyRkVzTFlta3QzOEE0dGVva2ZLQ05NUVhP?=
 =?utf-8?Q?wh0veUebANepppkbBhoi2XQi9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28e4f59-5232-45f7-2fee-08da811a2fe2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:04:29.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpdKpgHbXUmtAT2RWWCsotvTquB8dhfroMK+GZYIp0cufLE2dq/9Og7ilqaF3ZEk/6iQSIbl6CT18OwxPpvtcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4989

From: Zhang Rui <rui.zhang@intel.com>

Similar to SPR, the C1 and C1E states on ADL are mutually exclusive.
Only one of them can be enabled at a time.

But contrast to SPR, which usually has a strong latency requirement
as a Xeon processor, C1E is preferred on ADL for better energy
efficiency.

Add custom C-state tables for ADL with both C1 and C1E, and

 1. Enable the "C1E promotion" bit in MSR_IA32_POWER_CTL and mark C1
    with the CPUIDLE_FLAG_UNUSABLE flag, so C1 is not available by
    default.

 2. Add support for the "preferred_cstates" module parameter, so that
    users can choose to use C1 instead of C1E by booting with
    "intel_idle.preferred_cstates=2".

Separate custom C-state tables are introduced for the ADL mobile and
desktop processors, because of the exit latency differences between
these two variants, especially with respect to PC10.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
[ rjw: Changelog edits, code rearrangement ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d1cf8bbfed1e
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -606,6 +606,84 @@ static const struct cpuidle_state icx_cs
 };
 
 /*
+ * On AlderLake C1 has to be disabled if C1E is enabled, and vice versa.
+ * C1E is enabled only if "C1E promotion" bit is set in MSR_IA32_POWER_CTL.
+ * But in this case there is effectively no C1, because C1 requests are
+ * promoted to C1E. If the "C1E promotion" bit is cleared, then both C1
+ * and C1E requests end up with C1, so there is effectively no C1E.
+ *
+ * By default we enable C1E and disable C1 by marking it with
+ * 'CPUIDLE_FLAG_DISABLED'.
+ */
+static struct cpuidle_state __read_mostly adl_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_DISABLED,
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 2,
+		.target_residency = 4,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 220,
+		.target_residency = 600,
+	},
+	{
+		.name = "C8",
+		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 280,
+		.target_residency = 800,
+	},
+	{
+		.name = "C10",
+		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 680,
+		.target_residency = 2000,
+	},
+	{}
+};
+
+static struct cpuidle_state __read_mostly adl_l_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_DISABLED,
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 2,
+		.target_residency = 4,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 170,
+		.target_residency = 500,
+	},
+	{
+		.name = "C8",
+		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 200,
+		.target_residency = 600,
+	},
+	{
+		.name = "C10",
+		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 230,
+		.target_residency = 700,
+	},
+	{}
+};
+
+/*
  * On Sapphire Rapids Xeon C1 has to be disabled if C1E is enabled, and vice
  * versa. On SPR C1E is enabled only if "C1E promotion" bit is set in
  * MSR_IA32_POWER_CTL. But in this case there effectively no C1, because C1
@@ -1032,6 +1110,14 @@ static const struct idle_cpu idle_cpu_ic
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
+static struct idle_cpu __read_mostly idle_cpu_adl = {
+	.state_table = adl_cstates,
+};
+
+static struct idle_cpu __read_mostly idle_cpu_adl_l = {
+	.state_table = adl_l_cstates,
+};
+
 static struct idle_cpu __read_mostly idle_cpu_spr = {
 	.state_table = spr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
@@ -1099,6 +1185,8 @@ static const struct x86_cpu_id intel_idl
 	ICPU(SKYLAKE_X,			skx),
 	ICPU(ICELAKE_X,			icx),
 	ICPU(ICELAKE_D,			icx),
+	ICPU(ALDERLAKE,			adl),
+	ICPU(ALDERLAKE_L,		adl_l),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(XEON_PHI_KNL,		knl),
 	ICPU(XEON_PHI_KNM,		knl),
@@ -1269,6 +1357,30 @@ static void __init skx_idle_state_table_
 }
 
 /*
+ * adl_idle_state_table_update - Adjust AlderLake idle states table.
+ */
+static void __init adl_idle_state_table_update(void)
+{
+	/* Check if user prefers C1 over C1E. */
+	if ((preferred_states_mask & BIT(1, U)) &&
+	    !(preferred_states_mask & BIT(2, U))) {
+		adl_cstates[0].flags &= ~CPUIDLE_FLAG_DISABLED;
+		adl_cstates[1].flags |= CPUIDLE_FLAG_DISABLED;
+		adl_l_cstates[0].flags &= ~CPUIDLE_FLAG_DISABLED;
+		adl_l_cstates[1].flags |= CPUIDLE_FLAG_DISABLED;
+
+		/* Disable C1E by clearing the "C1E promotion" bit. */
+		idle_cpu_adl.c1e_promotion = C1E_PROMOTION_DISABLE;
+		idle_cpu_adl_l.c1e_promotion = C1E_PROMOTION_DISABLE;
+		return;
+	}
+
+	/* Make sure C1E is enabled by default */
+	idle_cpu_adl.c1e_promotion = C1E_PROMOTION_ENABLE;
+	idle_cpu_adl_l.c1e_promotion = C1E_PROMOTION_ENABLE;
+}
+
+/*
  * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
  */
 static void __init spr_idle_state_table_update(void)
@@ -1324,6 +1436,10 @@ static void __init mwait_idle_state_tabl
 	case INTEL_FAM6_SAPPHIRERAPIDS_X:
 		spr_idle_state_table_update();
 		break;
+	case INTEL_FAM6_ALDERLAKE:
+	case INTEL_FAM6_ALDERLAKE_L:
+		adl_idle_state_table_update();
+		break;
 	}
 }
 


