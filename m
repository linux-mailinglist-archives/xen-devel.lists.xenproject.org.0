Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726066FF112
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533330.829903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px54p-0001jG-4w; Thu, 11 May 2023 12:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533330.829903; Thu, 11 May 2023 12:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px54p-0001h2-1s; Thu, 11 May 2023 12:07:19 +0000
Received: by outflank-mailman (input) for mailman id 533330;
 Thu, 11 May 2023 12:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px54o-0000KI-3M
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:07:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e8ca344-eff4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 14:07:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:07:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:07:14 +0000
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
X-Inumbo-ID: 5e8ca344-eff4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLE6lLNvVHuSw/fdKAAzSm3vbMHlxyKjSYP1wn7xnBhFEAgjwWTW63L1poNNwN1UqW4DwHMwPbZhQq3+wz4BalLFpaS73N509zDQpmQr+WG6eeJZutserc20TH0r6XAjrUPqHY//t+DwqMXSS3UWj91LQqQYGLUNuQiGsVFCMoSzO/ywD9zyxg3S692T914FJNgbg8g6WuWhh5cQEunOdW1d/MvOLOIgDQN8QTBMyeJ7m94wHM9D2h4g+g+uqX/buceQMWdR3ohgVyA0GUPYzLGtRQq/G/HfvjcWoOuzByC77uYg+tsZOzfYkSEcYDD+fzJAMhEh3JuHqcu9m9bZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8K8rfTh8nTzrnw7JpPtZZMmTWFZSgvhcqiMn1zjH5Y=;
 b=ZssgIDn4uYLKy92R3VrnrvWrVB4GnVJYeKzmqHKi7FO8BBW9bcq3wB7A0EXpzd2o77eN4y6PFhm2RdzAVWOIPpz6tI9Umlwf9musXSnswLoZncxgrZvfPS/akNjmunZ0vAdbLc6oL4oT5Jd32gZ99V18xLMygL38i8Tsu4ru7edz6CzK8A2RScgUP2xfjXrsIgrrXt0/rPcHVqYyrG1EsBIoJUYtQUy+M/zHbTpDmZdOj0uOM3cBjYHlu//iesPkY6pvV9RdgYcYiliG4x19rQ0aEUasl+ZTvMxh4mLpUPh5gc5s/TtG30V9aundapwsOLf0R2oWcyqnfxROifTngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8K8rfTh8nTzrnw7JpPtZZMmTWFZSgvhcqiMn1zjH5Y=;
 b=JhCfwXzO0baWy9CqDtDbNLF9ZaTgt4sYVeyB4ea1qSpYiZqRYrogTS10Q1ryKf/ViF45BPCHQifQn9gX6vd422yOn2pwGg4vgTK+58Zal310WAE2KRtzO5pSNZXiTxn8ZW+rLAaoIdPUSAxJ5WK01+vfYU23U20Xn8BBrH5vygdPCw6kKglPGY9r1txhbsKpJKpPgfj4MJe4rlb3QL3xFHaLddUG3rs5mlUsWHeipf/hf5XVYBfbMQku83fb2cW/dvHe8dyDzjdvrDNDkJNOfpIopAu02s2gtvtD1WOaTv+gwLo9GY46NkRBT6pGJ658hNP++TkQu1A3LsWa3PB/9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <042f76dd-d189-c40a-baec-68ded32aa797@suse.com>
Date: Thu, 11 May 2023 14:07:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 5/7] x86: detect PIT aliasing on ports other than 0x4[0-3]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a83702-e00d-411a-3ce5-08db5218420f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Piw6xsXWIlRnmjXfRN6ILvU41a/F2MUffr1rvlRQAgppIDeqYvesIV98II/UysaHxr/WmArp9kARj2198WkAr+2PhkRUlisFg+6qYr+EUHDS3EZRsB8CQRrTaiTUMe/xje18lRQllTIV0FneYeglDwdDijoipoYbsgy5+s5CkR+ARor9ReIesOOfluOK9L7naOHnYo2XreX+Dq2ENkIMlmXJrQG1OcOj6tH1tIqFaCyEGWbqcMn5nJh8KYKWJoJ4ZSXUrKHlLYeS3gzEwzRjVHWXr9M+ruD6/KrnGkaJ42Hkk6WDrOtxEqlR4iKF1fAOnrN0ADOe6ybJY8HALQmU1S4YOGdsMCZy/XB+17LIGD21clyYrIvLaoZplZrmK4l5wkx3KgF2hX7BeKQuBEFMRRh/g3/A1QHc9V9wgaPmZQl0Y0UF7Fw3rxwhgQnMFIXiJ4J6Zla1V9wG+HhFMlBh0pssqOtbLZa+fvz79qHKj4EOy/L82S8SRFHIi4tyPOwYyde8HWS2g/5Fb68y8u9psa63Zpfq+vov06zkWVNrbhZp3QTyRF57LCkGPVZDnoqxwc1BIxkz3Sz3Ea7E2WHxELr5g5qDcDLtFQ5QnWjkK2RXw0CFbIoQvzhuA7+YTsZqGlbJv5Dut8FmrbKZQwO28Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(31686004)(36756003)(2906002)(41300700001)(86362001)(38100700002)(8676002)(31696002)(5660300002)(8936002)(4326008)(316002)(83380400001)(478600001)(66946007)(6506007)(6916009)(186003)(6486002)(66476007)(66556008)(26005)(54906003)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXFETDJWbjlyY01PYm51SHpQTFhmNWI4c05aZUZ0VnNKNmthb3RLYktlVUFN?=
 =?utf-8?B?TXRRWGk2NXlWdmp5MmVKWEhCSjBCbXVBVkkxVTBTV0hUQXNuU3Jva1Z0UkZ4?=
 =?utf-8?B?Tlk3Qzk5ZkFXQkxEMzVPZ1liMkFxR2JuYlpuMXM2aVJ6cGhtWEF2a01Jek1R?=
 =?utf-8?B?VytBODlybWg5bUFZSUZCS0l0cXl0WVpTVTNVTGdRSWZROEx6azhERTB5T0FT?=
 =?utf-8?B?QWNKNzUrSE9rSHYvM0s1Qy9NS0hJS1F2dVdMYU1yejBBSEowaW1WSXlaakRV?=
 =?utf-8?B?T2w3TmZNRGc4TzI2bUxpWkdqWEtKa2tzc3NYaEkxeDQ1WXNUKzlFLzh0azVU?=
 =?utf-8?B?L3VyNDRZMWJBdUJmTnhMaU5jaTgyVmZpWVlRazJxNGl3K0RjU29XdDBjSEM2?=
 =?utf-8?B?bzdqd2lsTFliZkUrZU5pRk8xbkdjYkdwM2NSUXdlWmhOQit1cjZwa25iM2pP?=
 =?utf-8?B?NitCOXZobmJDdi96TlB1UUZqQlVwMTh4MVd5TnJmUnNXZHNlbUxIOGRGTFNU?=
 =?utf-8?B?RTRpV29JNEZQV0xQcTVqNDA3WFBpcGdrMmFTcUxwbTVySTZ3N2NpbVo0ZXNy?=
 =?utf-8?B?V3A0QmRTQXRkd3lFN1MyMWI2d2dUb3hOR29KTERxQ1NjTUl2S2h2SmVac3dq?=
 =?utf-8?B?VmVPVS9mdmVzb0hRUDJFanM4dUZoQ0hCK0R0WVVmSWdyOW5kTERRWENrSlpJ?=
 =?utf-8?B?cWtIRGJKWjZTRWxhVHh3cmxycktqZzNNOEhKTjJEMXVhT1grWjNnMWpJd0Zs?=
 =?utf-8?B?Zkpob1dRNlErSldMVk9BcUp2VVFlaG9IaGtZNmxCOUdyOVV0czZTMXRRdlZV?=
 =?utf-8?B?RVZWczBXNis1M2NpeGxETjFjZGRJdmgwQjRUN3ZDQlp5WW9WQTUzNURLMHJn?=
 =?utf-8?B?MWxEQkZ0cEllRTRHK0xVYVRVTEF6UkFvem5GSjNKbWZHU0ExSkQzOGd2bFAx?=
 =?utf-8?B?ZTNsV3VjZ1VQYytFS0hqV1ByQ2VITDlTeTRSd3JMUVpiZjUxcEdTL2dja0xh?=
 =?utf-8?B?YUpXR2xoU3JhY0htV2lNQ01INjVseFMvTXlNanZnVDVobUUwK3VKcEVjSGU4?=
 =?utf-8?B?UmhuTy9HR3hvRm1HRXE0UGFpZGdZbmY3R2NEaFFtenBncjVsVnFuWW02Vld6?=
 =?utf-8?B?My9UZTQvVGRhRG9TSCszejlEbXFsMmxDQXJueWxCb3NjZ0pEVHdBQkJlWity?=
 =?utf-8?B?cVZkNm9YQ3l2VHBYM0c4WjMralhlaktjazl2VThVZTRZeUZDZVZrQk1uOFph?=
 =?utf-8?B?a3FBT2trWmVFdmdja2JXZG9IMDBOM1R0K1FtUGUzdTJPLzJiZzRRd3gvR1Mr?=
 =?utf-8?B?eFBIbzBGRjd4UmE2cFhmUGZXWFduVkpTQ0N2ck04OE9nWXIrOURwM0lmd2tY?=
 =?utf-8?B?d0o5bkxENWIrRFRRNndIOGhEcVN6RWNmTzZmcEtIR253bXdRa3hOdE9idTJo?=
 =?utf-8?B?R1N3Q2FQeEtnQzg2Uzh2bVR6cWNHaUpZa3BIYUFaN2lPKzVxcTMxQ3dnNjhj?=
 =?utf-8?B?SUlYQUVZTXdGRDlYOWkrZkFYN0JaVloxRitKb3RobEZjeFdxUnJOYUxBOEF3?=
 =?utf-8?B?TFk0WUFQbkFSY3Ztd0lDcWtQZ2MrVXFEMW9hWjNkUHdYYkdqWE9NTGhVQjIw?=
 =?utf-8?B?QnMrYkpucGxCMGhPNHZ0OXJOYktvL2JSZmVYNmlBMGJiVzl6K2NYZmQ3V0cv?=
 =?utf-8?B?RWdpa2dGWjkrbWhRWDNPMW51dDJZUXZJcG9lUVBqYVc3REgvV0d2amNKcVA1?=
 =?utf-8?B?T0RqTVE1VkNpZ2xUNFEvUU02cTVwSXRodDJzb2NBQ3hqUE5rQ0E1ejNYTUht?=
 =?utf-8?B?bXlNVjlMTW5kek5iMi9RS010SWs3V2xUdUU3YzAwb3M2SGZ6YWN3OTYzdkpr?=
 =?utf-8?B?WG5UbWZENXQxcjVZVHRDOTRzcjVQNytGMW5RMFFpalM5UWlwNFVkTnhYTFBa?=
 =?utf-8?B?ZU5sd0ZiamtZQ1NyTDkxeG5tMlNhaHRuMVpCQmQrQXdJZHlJNUQ0VUp4YWJ3?=
 =?utf-8?B?b3FUSTNzMU1FOHZCanY1YTQ3dWpKd1NLTkcxaVBmUGxUTzVhQXRmcElSdlJU?=
 =?utf-8?B?QnAxOGZ1aGI1bTg4S1pZR1JXbEk4aExPam83L0RrcUN0MzhpRFpVRDVreGVG?=
 =?utf-8?Q?pzFGROsaQU26Z4WUpawlDJppk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a83702-e00d-411a-3ce5-08db5218420f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:07:14.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YOKnAJl09OcsZ+ZZzuKHL3FKqG08+tHX1y4K+dqtN+HaGc/c0hfJSjxbKqtebzTKJUiW/8vvY+KZkFpDBpCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

... in order to also deny Dom0 access through the alias ports. Without
this it is only giving the impression of denying access to PIT. Unlike
for CMOS/RTC, do detection pretty early, to avoid disturbing normal
operation later on (even if typically we won't use much of the PIT).

Like for CMOS/RTC a fundamental assumption of the probing is that reads
from the probed alias port won't have side effects (beyond such that PIT
reads have anyway) in case it does not alias the PIT's.

At to the port 0x61 accesses: Unlike other accesses we do, this masks
off the top four bits (in addition to the bottom two ones), following
Intel chipset documentation saying that these (read-only) bits should
only be written with zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If Xen was running on top of another instance of itself (in HVM mode,
not PVH, i.e. not as a shim), I'm afraid our vPIT logic would not allow
the "Try to further make sure ..." check to pass in the Xen running on
top: We don't respect the gate bit being clear when handling counter
reads. (There are more unhandled [and unmentioned as being so] aspects
of PIT behavior though, yet it's unclear in how far addressing at least
some of them would be useful.)

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -504,7 +504,11 @@ int __init dom0_setup_permissions(struct
     }
 
     /* Interval Timer (PIT). */
-    rc |= ioports_deny_access(d, 0x40, 0x43);
+    for ( offs = 0, i = pit_alias_mask & -pit_alias_mask ?: 4;
+          offs <= pit_alias_mask; offs += i )
+        if ( !(offs & ~pit_alias_mask) )
+            rc |= ioports_deny_access(d, 0x40 + offs, 0x43 + offs);
+
     /* PIT Channel 2 / PC Speaker Control. */
     rc |= ioports_deny_access(d, 0x61, 0x61);
 
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -53,6 +53,7 @@ extern unsigned long highmem_start;
 #endif
 
 extern unsigned int pic_alias_mask;
+extern unsigned int pit_alias_mask;
 
 extern int8_t opt_smt;
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -425,6 +425,69 @@ static struct platform_timesource __init
     .resume = resume_pit,
 };
 
+unsigned int __initdata pit_alias_mask;
+
+static void __init probe_pit_alias(void)
+{
+    unsigned int mask = 0x1c;
+    uint8_t val = 0;
+
+    /*
+     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
+     * count is loaded independent of counting being / becoming enabled.  Thus
+     * we have a 16-bit value fully under our control, to write and then check
+     * whether we can also read it back unaltered.
+     */
+
+    /* Turn off speaker output and disable channel 2 counting. */
+    outb(inb(0x61) & 0x0c, 0x61);
+
+    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
+
+    do {
+        uint8_t val2;
+        unsigned int offs;
+
+        outb(val, PIT_CH2);
+        outb(val ^ 0xff, PIT_CH2);
+
+        /* Wait for the Null Count bit to clear. */
+        do {
+            /* Latch status. */
+            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
+
+            /* Try to make sure we're actually having a PIT here. */
+            val2 = inb(PIT_CH2);
+            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
+                return;
+        } while ( val2 & (1 << 6) );
+
+        /*
+         * Try to further make sure we're actually having a PIT here.
+         *
+         * NB: Deliberately |, not ||, as we always want both reads.
+         */
+        val2 = inb(PIT_CH2);
+        if ( (val2 ^ val) | (inb(PIT_CH2) ^ val ^ 0xff) )
+            return;
+
+        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
+        {
+            if ( !(mask & offs) )
+                continue;
+            val2 = inb(PIT_CH2 + offs);
+            if ( (val2 ^ val) | (inb(PIT_CH2 + offs) ^ val ^ 0xff) )
+                mask &= ~offs;
+        }
+    } while ( mask && (val += 0x0b) );  /* Arbitrary uneven number. */
+
+    if ( mask )
+    {
+        dprintk(XENLOG_INFO, "PIT aliasing mask: %02x\n", mask);
+        pit_alias_mask = mask;
+    }
+}
+
 /************************************************************
  * PLATFORM TIMER 2: HIGH PRECISION EVENT TIMER (HPET)
  */
@@ -2390,6 +2453,8 @@ void __init early_time_init(void)
     }
 
     preinit_pit();
+    probe_pit_alias();
+
     tmp = init_platform_timer();
     plt_tsc.frequency = tmp;
 


