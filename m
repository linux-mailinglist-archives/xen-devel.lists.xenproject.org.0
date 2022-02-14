Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF004B459B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271286.465688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXbh-00046B-In; Mon, 14 Feb 2022 09:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271286.465688; Mon, 14 Feb 2022 09:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXbh-00043y-FW; Mon, 14 Feb 2022 09:25:17 +0000
Received: by outflank-mailman (input) for mailman id 271286;
 Mon, 14 Feb 2022 09:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJXbf-00043T-T6
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:25:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 019c5b25-8d78-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 10:25:10 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-FVX4WaY3NL2bj_q26NJuLw-2; Mon, 14 Feb 2022 10:25:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 09:25:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 09:25:10 +0000
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
X-Inumbo-ID: 019c5b25-8d78-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644830714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCxscIvq6zLulNKcY3/NWbd2vQ3CrupkD38ZmXXmcn4=;
	b=IjK0pCrTHa7qvrMdV0z1bj+fdmCDhPevyzDv1upUqpouyGIFSkir/RbOTo/p0EU5x4S3Sm
	5zF5s0JjguopesyxkZc1hZGHuvmGzYO7ahVo8yEK+aWksGw2AN53e50q1mZL8aC84aX/wk
	V4Udg+Fb4zyEeqqw6rnGONB1l6N6SVo=
X-MC-Unique: FVX4WaY3NL2bj_q26NJuLw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me3rN0K44Qo1Dwa2BajlxJYcjyIZKXkdUv7ynhC5osN/BStBFZrYOAjR8e6veGNvV/7n72gb/YgvqFmuwnlf8uYMjmhsCJg6gAMh7Slm6HPG+7TX88oHVmrLLULHJ79DbS1IvOju9dyYjrhw1udvOEkOO2n4GrUWi+gTf5mWSDFtDnMD0AD5IL180KU1QpkPOhzyVsRkLXdEW90Df0OQavfDqi8Uteq0VrgWynBaDuJctVGE2PDQuSiWu4goO14F9YPtd2EE7oZlLrufh4lOV8ufAguvLc9rEmjDZL71wR796E1TYUe5RNl9S9lVIAjvsx58hTmUZSy5/abABxWqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCxscIvq6zLulNKcY3/NWbd2vQ3CrupkD38ZmXXmcn4=;
 b=G8q/9ZRn6bsNqFo7W3kv5VnUFpQDuPArOIMxB3pCRVwmi8GTfJ1/D2pEAzVMZItTa/K0U7+M3YOW822PI/KXijN8GpUesG1YSiHHgCejYQgj4x9cKVae/6DMBEEd4bT2WUet/Cr8WJx0wcOY+PkRzisZn/5tqYY5mgOo4MPiVfdC3FOZZZbNdclrqfQBa9KUAmiXXVSsNMVj40Ludb9nfMcfkIKucjJerSkF4jVpqOhgEDv0pZIphmei/TXsugECDIPcpvsf6zXoQ7mD5IGzI3hZIm8dbv5SvRY/FgyBk2RFBWrImMxO8p79+lfbHpatbElybt5z8B9OLfO4y9kLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
Date: Mon, 14 Feb 2022 10:25:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH v3 2/4] x86/APIC: calibrate against platform timer when
 possible
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
In-Reply-To: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f922ffd4-8132-4aac-11e1-08d9ef9be5cd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168E51243B8549A7B9B7639B3339@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SHdl4Z4XHmSQ2gTxzFX/8pyNdq/odi/ilnDIezipMC9QHCOm7QT6J7qlonGdFQKD0Dfe10yX3KuvxCHJF1p/OryNfM3uqQZYPjTLHs0KijGsZekf0ktwwLNtUbme4HSzjA4flMQDyw1/GirNoBDB2AdSOYG2GRw5s3JC0AFBqRHbQq9cbqqZynxVLGa3IIz4Z++hbisMRpALV310A9AiGB6rZV2EjRuNhVCR0agfy9JULi3gNhvqWthDPzzxg9Yz778Dhoainu3xs4+9crcOq6OwkiASonUgWlCjC4bFlnjIqbRkcEKRdZT9+OaWpfKt7R9VjScwgdnA2/EceRCvA48jVGW2YHSGVWTyUw/y2+JiQFtKwMFVVa6Wrf8kSvGQs5reozzQdhIthVLbDQTkp6/jJE2B5kyZ7TmDxoKy1QbA0bV/q5di09R5mfFv21hzXTGwYdcAJP5XGeKCxrzTPIa+vggeRt1qe3FqbJb1m1rwUI+a4Ra6GhhlMqbsaLVjU4w2E1KLI9iRKNx8p7o+bUGJo9IKya+YRCsqPfGvuGTMSuejhp/A6BjyNEMlxQOr3/Othm5Q0BLtCFaN1QzQVwYSkbEjTtBUSeETdsdABQOkWkHUZx4M6Fr2TYJ3gfA4lWN+EO2iNuqVG57imUFwP567Wf8Ai/D1BF5OM1WxJknswv1+LkpINxtk5mOMO8nWw48kpeZRifHIonIFAK2F/98ZQlGQYO8bciYqiTK+bI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(316002)(38100700002)(6916009)(31686004)(66556008)(66476007)(5660300002)(86362001)(54906003)(4326008)(8676002)(6486002)(508600001)(31696002)(83380400001)(26005)(2616005)(2906002)(8936002)(66946007)(186003)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVVqbUFVdkpsMHc5YTNXQ1creFQ0RHF2YU50NFlpbDZDa3NmcURJaDlraHk5?=
 =?utf-8?B?T0RxcDhUbGs5TmxBTHVSa2J5QWV5MXJIMzdGRTlaYXNRdHluRnBEaGtuS2tC?=
 =?utf-8?B?WjBlYXpqZTJZZ3IzKzY5M2ptK204S2JucUJkZ0E3MEQxVkg0cjVXSkZGN1hh?=
 =?utf-8?B?anBKaThOTHRtWE4vOUxrQXYyaCsvbldNRmpTNlF3MkRyT0cxWDJGOFVkZzZ0?=
 =?utf-8?B?cEZLME9VaHJoK3FLVEUwVEN2QTRVRThRNW1SQUVGYlFRZDQyVnVEc2tTc2Fp?=
 =?utf-8?B?YWdlZlRlSGRaZ3FwaUNPU3JuazlsNndsSzM1TjNCc0JHbXRSYlpSaUxRWVVK?=
 =?utf-8?B?M25RWjB5dlNwb09FTDRnYUplVzgwWG5GSTg2aXBRd0tsUkkrOFAvaEhGMG90?=
 =?utf-8?B?QnhkaW9nMHd0Rjl3allldzNZR3REdENkanZsWGNCeWRNOHVXNDhtN1JGSW5I?=
 =?utf-8?B?Y1hpcEVqMlBkUDl5NkJCaUNKdkk5a0N0QVhOb3FYNW4wTm0zcitHQ2c3b01E?=
 =?utf-8?B?M0M1aW1qQlVSNUhEM2o3OTM3NnUwTkVGWU04THR5MEoxQ1JoUHJXdEoxNldx?=
 =?utf-8?B?bzZ3Z0pXNjJUdE5lYjBOSktrRElTeHlHNnBHWkpodktnSEhWWTNWTkFUSEVE?=
 =?utf-8?B?S3BGcFlia3QrZFFMWlgwbWIwem95c0RMOUZudm5qNE8yMXFDVlZod25RZk9G?=
 =?utf-8?B?dG54YkxOREhEdWNEWEFQdEVmOEdTdlJmUjR2b3ZFUkVXRlErREhjeUo2VHpr?=
 =?utf-8?B?K3RoakQvQXFVczNDWUJpSkhpa3BidGJGWHJkVS9FcXE0d3VvNnd6eE51dlJ5?=
 =?utf-8?B?QWE1T1R2dXZab3hIbDhZU2FNQng0b1FETGxYVDQrZ01XRWtvUGNEeXk2TUN0?=
 =?utf-8?B?YkJaS3NlY2p0VFNwaCtzbmtwVHlQUHZYU1Q5djg3R1NTQlNrYjg3N3NCc08y?=
 =?utf-8?B?Yjc5UHpIWGJyNVZRSGJUSEtHOVpGT0pLdnErRUhKdDRxZXM5TENsYUdrMENh?=
 =?utf-8?B?OFRWNXNXZSt2UWJINXNrVlhRdmtyUHBiSW1SSDdIRHo2S0xNOVpibHc3NU44?=
 =?utf-8?B?TWVKeVFIZ3hFR3dHVVBOMVlwckpUTTZ4OHdGbHU2QnkrQmZlN2lUMjdWZVlF?=
 =?utf-8?B?T0NCL1prQ21sOFRMQXVpRExCdmNvZ3ZwL2tUcE45elVIOWpUZGJidEJCcjVv?=
 =?utf-8?B?ejU2dGxBSlFuUEdCakE3bEJVbjE1UThjcXB2V29VcE1PZVlWUzNRQUo5eHNx?=
 =?utf-8?B?dEZ6ZmNnR29xMUE0OTd1TWF3VXJwbGF3SE81ZTdPZFNiZCtIR210OUJ4SjBx?=
 =?utf-8?B?UFR6Snk4ajV3NFhMaEMzNVdOT0xQLzBoTXhLeS9RbDZHV3ZoajcyTW9LVUFV?=
 =?utf-8?B?cDB3RlVzdkFjUnN6QlJnbnFXOHZua3RPT1M2YlFwR1haY1IwNkw3OXEveU1p?=
 =?utf-8?B?STZ2YTY0YVdRN2JJTUdNRW1sNGJjbWtHNTdnUUwzM3YvS0lhTEhBbnprM2N1?=
 =?utf-8?B?c1FtM2NmTGtIdWhTNW50SmM2SzVqS2szYmtmdXJUVks2Zng5d2RTeGF4Q2Nz?=
 =?utf-8?B?Vys0SVMwK2U1Q1Y0ampselhWakJyTWVOZVdhN3RnNTRVVjRtdHpHb1JFTGxI?=
 =?utf-8?B?dHJaNEkyZ1NMYnV4alFlSFB0ZWh1TlBWaFo1aE1LOFY4THgxL0ZvcjA4OFEr?=
 =?utf-8?B?akUyeWkzbnE0SlFPbWdvYmtjMS90Yy9BVk02OTVrK3cyMjdjYVBGUms2SGpV?=
 =?utf-8?B?WjN6bTVQSU54dHp5T28xUEdFbWJlc2RqbWRrU0Fjb2lkUlhCdi9TME54cnIw?=
 =?utf-8?B?V1htZ0hxYm9ZbzFGc0FZWXBWMnJMcDZBTmhRQ25mL2p5VFJtUlA4b0h5Y3RQ?=
 =?utf-8?B?MGRhT0lmOVFJWlhVUE1wQ3ZhUER4MlV5TWxTYm15YWQ5SCt6Z0ZkcG42MFow?=
 =?utf-8?B?UWgwL1lJTDVEOFFXdFFUOURPaXNLSWtHWFpPU3VuN2JJZVIvcmUyV2dQNHBn?=
 =?utf-8?B?YnRCSmVkRXVOVnpYSUw2dTFCV0FwbVB1VmZvTUp2TzNwejdWb1RzZW5ud3FN?=
 =?utf-8?B?UlRHazRmV003Y3NURCtxcDhXYlJSUDhBWjhocnIrTEF4alp6WUx4QTFDNXVR?=
 =?utf-8?B?L3BWdUFLTXFPb2RQTElKYnhBSmRBQTJJR1JaRGIvNEYzVXd6VWJPT21md0Zk?=
 =?utf-8?Q?vwr12mSJ8CXZDyXrgvw0lng=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f922ffd4-8132-4aac-11e1-08d9ef9be5cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:25:10.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTMdktAVdtUzWkNAwAskxLRp3X4OBGh/tN6Sa7IEttAaQUfHkW5Qs3IG+VUpAF8EF66f7WbSsrS6sVsotzQHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

Use the original calibration against PIT only when the platform timer
is PIT. This implicitly excludes the "xen_guest" case from using the PIT
logic (init_pit() fails there, and as of 5e73b2594c54 ["x86/time: minor
adjustments to init_pit()"] using_pit also isn't being set too early
anymore), so the respective hack there can be dropped at the same time.
This also reduces calibration time from 100ms to 50ms, albeit this step
is being skipped as of 0731a56c7c72 ("x86/APIC: no need for timer
calibration when using TDT") anyway.

While re-indenting the PIT logic in calibrate_APIC_clock(), besides
adjusting style also switch around the 2nd TSC/TMCCT read pair, to match
the order of the 1st one, yielding more consistent deltas.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Open-coding apic_read() in read_tmcct() isn't overly nice, but I wanted
to avoid x2apic_enabled being evaluated twice in close succession. (The
barrier is there just in case only anyway: While this RDMSR isn't
serializing, I'm unaware of any statement whether it can also be
executed speculatively, like RDTSC can.) An option might be to move the
function to apic.c such that it would also be used by
calibrate_APIC_clock().

Unlike the CPU frequencies enumerated in CPUID leaf 0x16 (which aren't
precise), using CPUID[0x15].ECX - if populated - may be an option to
skip calibration altogether. Iirc the value there is precise, but using
the systems I have easy access to I cannot verify this: In the sample
of three I have, none have ECX populated.

I wonder whether the secondary CPU freq measurement (used for display
purposes only) wouldn't better be dropped at this occasion.
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1182,20 +1182,6 @@ static void __init check_deadline_errata
            "please update microcode to version %#x (or later)\n", rev);
 }
 
-static void __init wait_tick_pvh(void)
-{
-    u64 lapse_ns = 1000000000ULL / HZ;
-    s_time_t start, curr_time;
-
-    start = NOW();
-
-    /* Won't wrap around */
-    do {
-        cpu_relax();
-        curr_time = NOW();
-    } while ( curr_time - start < lapse_ns );
-}
-
 /*
  * In this function we calibrate APIC bus clocks to the external
  * timer. Unfortunately we cannot use jiffies and the timer irq
@@ -1211,9 +1197,6 @@ static void __init wait_tick_pvh(void)
 
 static void __init calibrate_APIC_clock(void)
 {
-    unsigned long long t1, t2;
-    unsigned long tt1, tt2;
-    unsigned int i;
     unsigned long bus_freq; /* KAF: pointer-size avoids compile warns. */
     unsigned int bus_cycle; /* length of one bus cycle in pico-seconds */
 #define LOOPS_FRAC 10U      /* measure for one tenth of a second */
@@ -1226,39 +1209,38 @@ static void __init calibrate_APIC_clock(
      */
     __setup_APIC_LVTT(0xffffffff);
 
-    if ( !xen_guest )
+    bus_freq = calibrate_apic_timer();
+    if ( !bus_freq )
+    {
+        unsigned int i, tt1, tt2;
+        unsigned long t1, t2;
+
+        ASSERT(!xen_guest);
+
         /*
-         * The timer chip counts down to zero. Let's wait
-         * for a wraparound to start exact measurement:
-         * (the current tick might have been already half done)
+         * The timer chip counts down to zero. Let's wait for a wraparound to
+         * start exact measurement (the current tick might have been already
+         * half done):
          */
         wait_8254_wraparound();
-    else
-        wait_tick_pvh();
 
-    /*
-     * We wrapped around just now. Let's start:
-     */
-    t1 = rdtsc_ordered();
-    tt1 = apic_read(APIC_TMCCT);
+        /* We wrapped around just now. Let's start: */
+        t1 = rdtsc_ordered();
+        tt1 = apic_read(APIC_TMCCT);
 
-    /*
-     * Let's wait HZ / LOOPS_FRAC ticks:
-     */
-    for (i = 0; i < HZ / LOOPS_FRAC; i++)
-        if ( !xen_guest )
+        /* Let's wait HZ / LOOPS_FRAC ticks: */
+        for ( i = 0; i < HZ / LOOPS_FRAC; ++i )
             wait_8254_wraparound();
-        else
-            wait_tick_pvh();
 
-    tt2 = apic_read(APIC_TMCCT);
-    t2 = rdtsc_ordered();
+        t2 = rdtsc_ordered();
+        tt2 = apic_read(APIC_TMCCT);
 
-    bus_freq = (tt1 - tt2) * APIC_DIVISOR * LOOPS_FRAC;
+        bus_freq = (tt1 - tt2) * APIC_DIVISOR * LOOPS_FRAC;
 
-    apic_printk(APIC_VERBOSE, "..... CPU clock speed is %lu.%04lu MHz.\n",
-                ((unsigned long)(t2 - t1) * LOOPS_FRAC) / 1000000,
-                (((unsigned long)(t2 - t1) * LOOPS_FRAC) / 100) % 10000);
+        apic_printk(APIC_VERBOSE, "..... CPU clock speed is %lu.%04lu MHz.\n",
+                    ((t2 - t1) * LOOPS_FRAC) / 1000000,
+                    (((t2 - t1) * LOOPS_FRAC) / 100) % 10000);
+    }
 
     apic_printk(APIC_VERBOSE, "..... host bus clock speed is %ld.%04ld MHz.\n",
                 bus_freq / 1000000, (bus_freq / 100) % 10000);
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -192,6 +192,8 @@ extern void record_boot_APIC_mode(void);
 extern enum apic_mode current_local_apic_mode(void);
 extern void check_for_unexpected_msi(unsigned int vector);
 
+uint64_t calibrate_apic_timer(void);
+
 extern void check_nmi_watchdog(void);
 
 extern unsigned int nmi_watchdog;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -26,6 +26,7 @@
 #include <xen/symbols.h>
 #include <xen/keyhandler.h>
 #include <xen/guest_access.h>
+#include <asm/apic.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/msr.h>
@@ -1004,6 +1005,78 @@ static u64 __init init_platform_timer(vo
     return rc;
 }
 
+static uint32_t __init read_tmcct(void)
+{
+    if ( x2apic_enabled )
+    {
+        alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
+        return apic_rdmsr(APIC_TMCCT);
+    }
+
+    return apic_mem_read(APIC_TMCCT);
+}
+
+static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
+{
+    uint32_t tmcct_prev = *tmcct = read_tmcct(), tmcct_min = ~0;
+    uint64_t best = best;
+    unsigned int i;
+
+    for ( i = 0; ; ++i )
+    {
+        uint64_t pt = plt_src.read_counter();
+        uint32_t tmcct_cur = read_tmcct();
+        uint32_t tmcct_delta = tmcct_prev - tmcct_cur;
+
+        if ( tmcct_delta < tmcct_min )
+        {
+            tmcct_min = tmcct_delta;
+            *tmcct = tmcct_cur;
+            best = pt;
+        }
+        else if ( i > 2 )
+            break;
+
+        tmcct_prev = tmcct_cur;
+    }
+
+    return best;
+}
+
+uint64_t __init calibrate_apic_timer(void)
+{
+    uint32_t start, end;
+    uint64_t count = read_pt_and_tmcct(&start), elapsed;
+    uint64_t target = CALIBRATE_VALUE(plt_src.frequency), actual;
+    uint64_t mask = (uint64_t)~0 >> (64 - plt_src.counter_bits);
+
+    /*
+     * PIT cannot be used here as it requires the timer interrupt to maintain
+     * its 32-bit software counter, yet here we run with IRQs disabled.
+     */
+    if ( using_pit )
+        return 0;
+
+    while ( ((plt_src.read_counter() - count) & mask) < target )
+        continue;
+
+    actual = read_pt_and_tmcct(&end) - count;
+    elapsed = start - end;
+
+    if ( likely(actual > target) )
+    {
+        /* See the comment in calibrate_tsc(). */
+        while ( unlikely(actual > (uint32_t)actual) )
+        {
+            actual >>= 1;
+            target >>= 1;
+        }
+        elapsed = muldiv64(elapsed, target, actual);
+    }
+
+    return elapsed * CALIBRATE_FRAC;
+}
+
 u64 stime2tsc(s_time_t stime)
 {
     struct cpu_time *t;


