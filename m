Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924E5983B5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389524.626504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfCk-0008IS-8g; Thu, 18 Aug 2022 13:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389524.626504; Thu, 18 Aug 2022 13:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfCk-0008Fk-4w; Thu, 18 Aug 2022 13:04:58 +0000
Received: by outflank-mailman (input) for mailman id 389524;
 Thu, 18 Aug 2022 13:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfCi-0007Vi-9h
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:04:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2049.outbound.protection.outlook.com [40.107.104.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a5d0c3c-1ef6-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 15:04:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4989.eurprd04.prod.outlook.com (2603:10a6:803:60::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:04:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:04:53 +0000
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
X-Inumbo-ID: 5a5d0c3c-1ef6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2HnhP9YZkSDdlmjNmJDXCo/StiUW5T4KzDiHbcUlonLeTTQcvnXC8i4eGtgOmZss5Ke4xMt7ScpJV6cMxYTI03jSY1o3M2raCk9y01v+IVFfc3aM3Pbn8aPOlUo0LB60ffnvnvHmK6NkQSy7Sm72oLCYXR36grhB1OjuikikzM5R0upr2Eq6NtsPyGWcaQhp0qayFrHcCj3PfzkMne3fCWhmZ2wc0CtYjCYA1HfOIZqDnCKxp3EerRrFv4bXBiFX4mMpHoxPAfs8pkN5q2cizXoMxgWCtQQZyfOY3tg8n3ghGzBXU6dZFe8sYiEPR3jIPt4OGTc0r0NfwvC//VuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmYPLXj1oFALypXZrKMo7JnkebrUsMPgDdXSnPxVHFw=;
 b=WVPxuo37uieUih/BDu/GG1ddNyaDCk1K4YVx81OanLyX57Mi6qfmsjbHZx8SgYvQB2q02rBiKr/blrOJTYzrE3dUP6YQaFwEiGbHZXrvdW61xxgwWJMcrB3vCeChc+T1OukoX9ISd3I2liiD9E9tuG4c2bfp4EVNGJssdMHRtmZ7mF+XMG2l2eV/iwITuwJHKlJLgC6NwSpwHoeLrWQ02G6TKd8SkJZ/2pmasUsqJI2DqtnJitybH/62G9mTE7jjb1+sdVvW2pHT/ABskClSYVxZXF+ilD5FUNyScAGcxeO5j/58en86whmjkTRVGwHcBBZytcnjYJ6kGtFEQaUPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmYPLXj1oFALypXZrKMo7JnkebrUsMPgDdXSnPxVHFw=;
 b=uJxfuBegTlLjvwt5XYGv1lSLV3o5+LQ0bycRE+3ywgjDFuwR9CcxOnkZxxoV50eat5yhm4mHl/KcTNB0hcK9GmrIyvSL+DE3c1KHgVKEi6uaG58U9yajhxBq/EuLOAWnuFjJ99BPhYRrkdg6PmIOcjbIgwBnbtMCWJJRjtPOZrXC2M1/8/swHq8KFVa4Zl2/I0Ju6a2Bcna+vX7yMm69KZ2MC6KxczEaNEN4OaezP5AnaT13zTd3ZUmigzP1gZ+M64QoNa8FAXcnuYMgtTbsdOjsZE33CP02EfzwMzvBI6sd5yqoSwkGvtBahzgVCdiYx7QM4kPaaqiXTpPJLsWvvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
Date: Thu, 18 Aug 2022 15:04:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c357887-08f0-4173-d826-08da811a3dd7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4989:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3K7O2bK21Hm30qOwqsF9RgskyhRv0bPWS+slnd8ack3OV9mnj/OP2pBj9pzuYmWWV1CU5wzWpj2SW99Ibs4hRYpsC+TkuHHhCTmnTU1ege4h3O0JPLVQHrufRIEcU8HygvUXdPv2XzTpQhZeJsspkoNVrQQwTsVQnxYocVhrxN6Zl2b3mwieE68q4N3CctqSo6Q7sLhgfen3mNJQNBXBSoenKDbfDyGhrjDd5/5vKB15RKUZlH85mMth1F7yLI1XwsAXnRwVMeY7OyZxHvtOETMkdePETvQX99mwPjEA52vsp7gXhbilcvHyNTrWj54w4j8epV3CT1S/6QYcOIRfQnP9EORiq1IXn3PFly9Xd0UcxBHO7g3IhTvfmBYFFRTPi9RxUnpgnEFrf2drlhG4MjIvd9FbhCx57Y4lcgRu5Jm3VmSqaKDJla7xkuHKeZ/nFAYpo2yp+ZwQzqk0XJVdCw8MLK+KxI1IW92Blqqi4NUhGuMXRQtsJx0JhnTdtuwLCBkm13csDvlwf3Zu94O5o/KdM6dFuJr5viQMm65hyEjyc/VeLPc0ttAN0rC9oF6c8xTSmqJLIVOJzUi3by8I2J02rvIPE73/TbRz9QXr0z6GFT0TfR/EtC3+AhtmN/5Jtg4zvjEIqQCSZd5f6EtlVV5ZVx15yxS2KQAh3J5EVaRFrpxtBZIkkhw0R6Xws0KRMkre7tJYxRqx+6Smb7EBr0603K5RL9FhuIKdN5Z3FVh4L8//Q2MB1TEUqYlYlu/6bWLBRnkXdtJOTlL3pT7Se/jejPKdV2zoaQcZbLLj90RiLxViFoRn4PZz4xKboqKqRfQIMBPpTkS/rW4JQ+dx4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(136003)(396003)(346002)(2906002)(66946007)(478600001)(66476007)(8676002)(66556008)(6506007)(41300700001)(31686004)(186003)(26005)(2616005)(6512007)(4326008)(6486002)(83380400001)(36756003)(86362001)(31696002)(5660300002)(38100700002)(316002)(54906003)(6916009)(8936002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3h2dWxGZjZFZEZOTTgyK3pSaXRhSWtCWG1lRjZ1bTY0VjZESkxadG8zZkdC?=
 =?utf-8?B?VndRYWxCOHoySFlvQmpkNS8yRjRWVU9mMHdVM1VRaldNWEZKTUZIRFdmV1JY?=
 =?utf-8?B?T3BQUzJYNTRvdVZOYVdBTEdsSjVsNHdrZW9xYlVINkRDbkpvc0piRmFOdDN6?=
 =?utf-8?B?cTBTV2loN0tDdU5Eblc5WHZROGRTWEg5bzFHQTY0c2NFa1E0TEphYUFXWVlh?=
 =?utf-8?B?Sm5wVWtoNTBnSndPcUVGZklteEV5V0RaNWVUVHg5K3NHejVTRWNvc3ZFa1BU?=
 =?utf-8?B?cVYxU092NVJKOERuRUdOZkhTRzNYT2tFTEdidEhKZTJLcG9tR1oyQ2tLVy9O?=
 =?utf-8?B?SVdYU2xCZ1MzZGJMNmZ3QW1SUHIxOGRmMllscHRKbU4yTUc5MWcrbTRUWjVn?=
 =?utf-8?B?S2xkeW5SRFNWYjVxUmhnSklXemFHb3E5RlR5VWdveGx3Rlp6VDN4YVNoWTlt?=
 =?utf-8?B?U2ZZbk1USndycHVlNVdyaEprRFVPYmhmb3lCdkdWK2h5L3VuK1BzUzk4SzJu?=
 =?utf-8?B?bVhvNFlsKyt3MERpWXZKRnNjeE03UDRibmJaQzkwc25OSUFhQ0VqTFVCK1Vn?=
 =?utf-8?B?NDV6MjgwZ2NiSWpYcnA2cjFBVnJwWDdPcVdMaFlYZ2x2VGxScTg1dGRJd2sz?=
 =?utf-8?B?bUtQWEhWcytFN2ZVc1QySy9IMUpaR1dsNjJJTTM0M2JYdmgyc2Jyai9PYXhO?=
 =?utf-8?B?RDFZSGNWSStib0wydnFoaHVRZThTRHpGM3dDSnE4Q2pKSGJzMldoOWJ6Y2k3?=
 =?utf-8?B?aklJRUc0a2NocnN4bmRlVXRkcDFrTTh1QTRrWFcweHNUKzJFWDFiRy9RZ2wx?=
 =?utf-8?B?L2R5b0p4VklLSnFtbW9MbDNRMW1TVWJXcFArV3krTUd1M282K2tkS2xhTEhG?=
 =?utf-8?B?MmdsYnVVeVZwYjFoUG5TQXNHWlh5SDRHbTkzSjFpUW0xaFZlenJidTBoSU1L?=
 =?utf-8?B?eW4yeW9lT1U5MlBHb3BWRTlWTzhoSW1pKzZqQ2pMdXdnd1FJSkRJYkZaWFVi?=
 =?utf-8?B?U0lhcndWVTFZTWEzeDlFRzNQcHF4WWZGUXp5dEhva1lnWG4vN1AxSWp1UTdl?=
 =?utf-8?B?cWdkM2kzdzFNUHlMcmpsYVYxVVliclU3cTJCUmNhQk9ybzNTK2dUdGMwOGtL?=
 =?utf-8?B?bHlIK0tCWnJZR3FLUzVsYzhqZDg4MDdVUjVQZlpkVVF4eHN1bldodTBOVitl?=
 =?utf-8?B?SzF2LzY5WnZtOFphR3o3RklwUHlyMFMvd2VKTDBLRGl1bUhXQlZYRlpUNE9m?=
 =?utf-8?B?aXRKWnMxcWRJRzc5ZVU0V1NQV0IxNmEzUzEyQStrS2NpWW1LdUxNcHRweTlG?=
 =?utf-8?B?aXJkT2lPNVFjUHkyVjBUbDRwRG9ucFUySUEyN0liUVBxQmR5UStETGNmTTRT?=
 =?utf-8?B?cDAxUFZKeWVDTW5GbmtuU0Fhblh3YUxhOXdTbERwYWhhNklGWHYxdFhRNDZt?=
 =?utf-8?B?Sndka3V4aFVNZlFaelBlMUpVVDZoWHVLTUpyNXhEeDhoa3ExaGMySWR0bkJo?=
 =?utf-8?B?emNBQ1RFeEkwdnpBWExsanF6OExmQXBobFFPYS9Ed3EyV2NUeXJQWHJFYWZY?=
 =?utf-8?B?TitMWHE5eUs2MVMwMTVDWHk5VHhqckJGV1hxbmMxdC9uT05SQTA0L1UraXJO?=
 =?utf-8?B?WlpFWnJWS2F1NTZzM3ViQ3lVdzJnMlhHdmdWQ3IxbFBhNVRDMTFVRXJFLysr?=
 =?utf-8?B?NlJRQXo4N1YzN0drcGJsUEhLZVNJcGNGNEFISHRESmRDNmY2QmU2MGQxT3Mw?=
 =?utf-8?B?dlJRYUtIU3JVSVl2M1F1bTVvWEpHNnBQQStIdlk3TWlSc2dNM1dGUWp6ZFNV?=
 =?utf-8?B?OU5qbTJZNWlLbGdtcExZNjI4Ykhla3k3dUpqU3NoREJubkJoL3lTNnBUZllI?=
 =?utf-8?B?dDFJU1hUZXRpd0h5RkpZNjVGZExBcWVuWitWb0hFWGpjVU5iQTVFVHRCSElq?=
 =?utf-8?B?b0tMUytpZ3Uxa3AxRm5yai9FRG1kWTZQdEYxZmJuNEk4TWY1SDg4aVZxdGxL?=
 =?utf-8?B?U2Z0ZUYydVYxQk9Edzh4VlBLaEt6OGtDRTVIbVMvYTBMcGVqcDBwSHNJZjdK?=
 =?utf-8?B?UTdWcTJKVlVQY1JFQ3VDMjhpa3N6VG82MytYczRuc0JoRUI1N1NTVTA5ZU5r?=
 =?utf-8?Q?lwudXdvheHyF/++NGsc6rOMCe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c357887-08f0-4173-d826-08da811a3dd7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:04:53.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmSCZbRzCW6ldhDNi3eo5ivZetIpG16ap5rzL3no3H698z2BKPFscANqPPgg3/xVp72HBrWRLfo9j19yG/oLiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4989

From: Peter Zijlstra <peterz@infradead.org>

Having IBRS enabled while the SMT sibling is idle unnecessarily slows
down the running sibling. OTOH, disabling IBRS around idle takes two
MSR writes, which will increase the idle latency.

Therefore, only disable IBRS around deeper idle states. Shallow idle
states are bounded by the tick in duration, since NOHZ is not allowed
for them by virtue of their short target residency.

Only do this for mwait-driven idle, since that keeps interrupts disabled
across idle, which makes disabling IBRS vs IRQ-entry a non-issue.

Note: C6 is a random threshold, most importantly C1 probably shouldn't
disable IBRS, benchmarking needed.

Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -141,6 +141,12 @@ static const struct cpuidle_state {
 #define CPUIDLE_FLAG_TLB_FLUSHED	0x10000
 
 /*
+ * Disable IBRS across idle (when KERNEL_IBRS), is exclusive vs IRQ_ENABLE
+ * above.
+ */
+#define CPUIDLE_FLAG_IBRS		0x20000
+
+/*
  * MWAIT takes an 8-bit "hint" in EAX "suggesting"
  * the C-state (top nibble) and sub-state (bottom nibble)
  * 0x00 means "MWAIT(C1)", 0x10 means "MWAIT(C2)" etc.
@@ -530,31 +536,31 @@ static struct cpuidle_state __read_mostl
 	},
 	{
 		.name = "C6",
-		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
 		.exit_latency = 85,
 		.target_residency = 200,
 	},
 	{
 		.name = "C7s",
-		.flags = MWAIT2flg(0x33) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.flags = MWAIT2flg(0x33) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
 		.exit_latency = 124,
 		.target_residency = 800,
 	},
 	{
 		.name = "C8",
-		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
 		.exit_latency = 200,
 		.target_residency = 800,
 	},
 	{
 		.name = "C9",
-		.flags = MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.flags = MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
 		.exit_latency = 480,
 		.target_residency = 5000,
 	},
 	{
 		.name = "C10",
-		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
 		.exit_latency = 890,
 		.target_residency = 5000,
 	},
@@ -576,7 +582,7 @@ static struct cpuidle_state __read_mostl
 	},
 	{
 		.name = "C6",
-		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
 		.exit_latency = 133,
 		.target_residency = 600,
 	},
@@ -906,6 +912,7 @@ static const struct cpuidle_state snr_cs
 static void cf_check mwait_idle(void)
 {
 	unsigned int cpu = smp_processor_id();
+	struct cpu_info *info = get_cpu_info();
 	struct acpi_processor_power *power = processor_powers[cpu];
 	struct acpi_processor_cx *cx = NULL;
 	unsigned int next_state;
@@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
 			pm_idle_save();
 		else
 		{
-			struct cpu_info *info = get_cpu_info();
-
 			spec_ctrl_enter_idle(info);
 			safe_halt();
 			spec_ctrl_exit_idle(info);
@@ -960,6 +965,11 @@ static void cf_check mwait_idle(void)
 	if ((cx->type >= 3) && errata_c6_workaround())
 		cx = power->safe_state;
 
+	if (cx->ibrs_disable) {
+		ASSERT(!cx->irq_enable_early);
+		spec_ctrl_enter_idle(info);
+	}
+
 #if 0 /* XXX Can we/do we need to do something similar on Xen? */
 	/*
 	 * leave_mm() to avoid costly and often unnecessary wakeups
@@ -991,6 +1001,10 @@ static void cf_check mwait_idle(void)
 
 	/* Now back in C0. */
 	update_idle_stats(power, cx, before, after);
+
+	if (cx->ibrs_disable)
+		spec_ctrl_exit_idle(info);
+
 	local_irq_enable();
 
 	TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
@@ -1603,6 +1617,8 @@ static int cf_check mwait_idle_cpu_init(
 		    /* cstate_restore_tsc() needs to be a no-op */
 		    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
 			cx->irq_enable_early = true;
+		if (cpuidle_state_table[cstate].flags & CPUIDLE_FLAG_IBRS)
+			cx->ibrs_disable = true;
 
 		dev->count++;
 	}
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -42,7 +42,8 @@ struct acpi_processor_cx
     u8 idx;
     u8 type;         /* ACPI_STATE_Cn */
     u8 entry_method; /* ACPI_CSTATE_EM_xxx */
-    bool irq_enable_early;
+    bool irq_enable_early:1;
+    bool ibrs_disable:1;
     u32 address;
     u32 latency;
     u32 target_residency;


