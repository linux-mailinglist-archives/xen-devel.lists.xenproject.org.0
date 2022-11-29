Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F063C311
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449436.706161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01t2-0006BR-9M; Tue, 29 Nov 2022 14:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449436.706161; Tue, 29 Nov 2022 14:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01t2-00068M-5u; Tue, 29 Nov 2022 14:47:04 +0000
Received: by outflank-mailman (input) for mailman id 449436;
 Tue, 29 Nov 2022 14:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01t1-00068G-6m
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:47:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed82873-6ff4-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 15:47:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9488.eurprd04.prod.outlook.com (2603:10a6:102:2af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 14:46:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:46:32 +0000
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
X-Inumbo-ID: aed82873-6ff4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKj35mhKFKOpZErM/DWLt14BcvquE6CqfMWApGnjSAvEvEbGGKpBeHdzhDNqVjv6YGIs6jiDb7XkyAoNA6tBS3wdMKaPRobcz2IAI4nvjw/8OXetfoIrkc2JAYgAJeVOwDyQRkCVH+HB09qzBpNEr/00yegvll27aqOsLk21jxiz1bubl2UHtZicon9tT5EIUq7NTZAb3zH3TmfyiiPI0El+rdb317sNIdSKpxpapJHpZ7cR4l+Fuim87f4+nPsVP9VpHVlyY0lSpPUoWFpQ+9rlhJ6O8jJichp6MRZ3TpMn+PKlsa+mxsbx5s/t+bKQ+adsOXQtxD82ArNgJIV20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkwFHbC0MWN5CvPtGpC2i6/DPJmntDCL5dGfW1ggJPE=;
 b=Fs/BrAeO6NyQjclIaJdzTgCmiFAVmEfYa3CCKpowpkoD7AT9gEUBj7a1mFqZfo2aogYS4Siwj1BH4eg4rEtSw1L7kskA/yKngeVkUbU1ayHNs/uDo+F+9valbdFU6W2Cx8IYdU25/j8nwRKXDcvPY1xHbr4d05jyhym2qxEIOy+AumpBOGeQ3ihS5UepPseGcmlGTZGz2QYY/WsDx/hS6uHSMYVFTA5HQxeVlIdhgRGVAno+rJIBRPR1DqL3EA0zzGlfqMck/eKOGV9hIwRZu28IUVuKlOCv23PK3zY33Av9k278Ao6QyFv9JlI89gVYaNuCEmo4klnwWZq7ihtGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkwFHbC0MWN5CvPtGpC2i6/DPJmntDCL5dGfW1ggJPE=;
 b=xBFpDIdqzhS9++NH2iC9t6vBJP76pIIqOk+UE18Ktqfxp2ch6ZjIEZw18O9m3eZZbG52TUQ3nNur3qSzuAS0LbsFVlEdypD8x82+gsDDEYcXdU9P9R2L9Lw8CuqtKwyEn3jHI+hou34e8glk/w/viSQbiM/mDfzGdyLbYNFe6zMKaQmGcZ3IwJXllkHnk1b1QPD4eLlqxaogc5YupFZq9LZdvFbZFitxUO4HIHI7IJwdkf5gpvwWDVhrbOvatapMmk/ht8QfbbaZ35LNiHHjWQ/FQlxA3OI895sM/pjBgH+IRy0I6Lqx/9xTK82OWtHHBcnUhKKLOc5tpyWm/4v0HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54ee1bd7-9b6a-efc7-8bad-50aa7d6d955b@suse.com>
Date: Tue, 29 Nov 2022 15:46:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: make a few interrupt handler functions static
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: 288d22b6-8ced-49c6-df35-08dad21881ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NQ9OdSDjr7lx85f1Zl5mivIrB8gtrc/zdf623jw0knRnUGjPiVfnpZ/8toxjEwc3MtQdjwqgvj4AivMGMuqOfgZXih8J6SzxCPj+aaw2kFzHwS+gm1NRF7IxeojAvZlyp4bSgtZJ6h0pD22nuatONxX0zgS4mejMgtvtAlg4jgrh49f+8IbQIhreaxDEjvyWluLt15geVY+kPwmBybLqCuzy5NfOuTd46jVdfwWrLaFa03LIpz03oqSwcpXiEe3f+iwzuuCO2xNxfkarxXPALxPxDfYI676/UKogtxRgZDOywMqc/YF4ds3IxzoBaCohSCIbjyskcrw/u8DcRzOg4eEU3wfZJhH4GsuCdWrUvxNjhuU1y0HfC4dh429lDI0Ii2xIVfY/iqBJDPQBcELDn0wGiCtrK0KjTyoCAJHObLxiV5C9LTZvJYFIbMLqZMQNrJVDSFcPCYtVgj6Ywxi4MzNWt+b0neTeZhpE2PIazNaK4yfzh261FEYF06RZLwiI+XDpe4atAFC/8y+J40CYvj7ytnA9yi5EPWk3tsPNm1WFrd6NpREAvq5ErNCU9YfS3zc8e2soSX88HQPGoUAqSTe2UJLjqcazKXWxWk348D2znGkP/4R4cae3n4n0TJ9o9KMMVrCTYhwJAzXwqpKM6eoSz5GvqSYKHzKJmW3sYkr6mDuLh+9arQO0IB2xFwRT7uOqGl61z8W5Ou5V1ychfIfWbAcJQxxa7NtxiBkPHaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199015)(478600001)(31696002)(6486002)(6506007)(31686004)(6512007)(4326008)(36756003)(66476007)(66556008)(8676002)(41300700001)(186003)(2616005)(5660300002)(8936002)(26005)(316002)(6916009)(54906003)(83380400001)(2906002)(86362001)(66946007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3dKTXFlbkZYeUZUYlZmWWZBbTJMa0t6U0Y0T2xDUEd1ckk4NVlYdkQ5WkRE?=
 =?utf-8?B?L2sya2Z0bXJxZFpJcVQraHRxWEtUVjJhNHozS01VYVNXbHhSbW04MEU1MEZz?=
 =?utf-8?B?TjF3OW9ZRzAzYUFLTWQ2MTUvZlpKNDBwTW0rL251NFdNTEhYbkgyTnR4RHJB?=
 =?utf-8?B?UzRsQWUraXNIdkUzT1FocnNiMGMveTE5T0MzeTlBOFRLUFAyalBjWW9YOTdw?=
 =?utf-8?B?aVNwck1GR3pwY25qVW4xazFacXk3SlQxT2hhN2IxR2FEYnlLKzZhZVhyVEs0?=
 =?utf-8?B?RUZ5Mkhub1ZYVkllYWZjTzZaZDVTQXlSUnRzMGF1QVZIcDgvRzN4RXNZNnJY?=
 =?utf-8?B?NGM4aTVQZHY0bzBCNHNhRExSRTI1RVJZZm16ZjVwdXlJM1ZOcnBpSkIxYlhC?=
 =?utf-8?B?NWVrMHNSSU42aUlPaG52WEFZWTgyd3lTQXd1WEovNldDYVpwczNCbFhpUUJ2?=
 =?utf-8?B?cWptaTk5eXRpS1IyNVFFb1BYUVh1WWhPaW0wRTQvUG5QRzVOSlBWU1BTei9Z?=
 =?utf-8?B?UjBhZCtjaFkrb0dJc2ZuTGFyenQ5YXVBeFN3c0x3WHp2UnkyZnlKTXR3S3pQ?=
 =?utf-8?B?N3dLZ2NSVGlDMXNyVFBndGplb3V0Y05aRmVmK0Q1aGNlb0Fac1E5ZGROUHla?=
 =?utf-8?B?dXEyL3dZOVVacTE4QmNTNkVwYnFSVlI1RlVIbkkyNHZCWjM3VjU0a0YrbFla?=
 =?utf-8?B?Y1AvMS92dWlPbm9XUXJwMldsblFVSjAzdzhQdVgwbEIvK2xFeFhUYzdlMk9y?=
 =?utf-8?B?b2ExaWRYM3BOcnNCaktTQnRCSHZnYThTcGdJdWcremZTbGh5cnZYSjRMOTU3?=
 =?utf-8?B?em5OM3dCUzU4UXNHL3h4R0k1SDlrZFpWdVBjUWFPeDFHZS9DTGs0Q0tIenNT?=
 =?utf-8?B?TVhIbWM5K1JvbXFKT2s5OTdDU1J4aSs5NlhyU0UrNURsd1pMY3ROSllzVEgx?=
 =?utf-8?B?bzlhRzMxMkpFTWR2M1dHR3NWNkVSeDJDMjJvZVZrV2ZBWlBubGhKS202WHJ0?=
 =?utf-8?B?blNZalBjMnpZZWErMkYzL1U1U1V1Y3pHVXFCQWVKejlveDRWM3RIc3BYS0FR?=
 =?utf-8?B?M3lXRGNYZ1RNMVUzMStDbHNlM3MvcVl2N0ZiOUpGRlNKSnUwbU5IS0trMFJS?=
 =?utf-8?B?R2c1dWE4NWVZNGxPeFBtSG00eFVBbm9nZk1XbURrVmUyQkptdlp3SStzNHoy?=
 =?utf-8?B?U21GSnlXZVd3MVo2dFNpd3QydW8yYVNNbnZFMDJOWFpzMkFoMGpkdzVTTGJk?=
 =?utf-8?B?VjBkUTVFYnFvbFNMVVJvRlZoY2F5MnBzUUR3SE1rUEpKbXF5RWJvUVkrQjVs?=
 =?utf-8?B?YllIU0dvbG4vRzdnbHZ1MkFRS2F6SXlscUpJSy9tVmZQdGxXWWFRWitza0V5?=
 =?utf-8?B?dlZHQmdWZndpQTcyTnJkRUZKNjZES1hyNyt5MCtkQ3lTcHVSY3ZYaC9uMG4v?=
 =?utf-8?B?MzB1NVBGYXZ0YkgxUlhYWkJJMXFIQVd0d1VEU2JWWENVeCttYzdhNDdsU0JP?=
 =?utf-8?B?ZTJOUVpCajZwR2dXTUdiT2NyZjBDaFdac2RkMEIzaFlCSFZmdHliRFFjNk9Y?=
 =?utf-8?B?WFJSalB6N3hoTjBnT01DOE96dUxuSVRoWGZLQnVZWmIzSC9sS2tVRVJMTnVj?=
 =?utf-8?B?NlVYZkUvOE1XREp3SnFuQVVOaEVXeVpYMEVzQWlvUXV1NTNZQ3NTempHWFl2?=
 =?utf-8?B?anl1b3Rkdko3R1RDODFQeW9ra3hEbHk5RVF0T1QxV2RzcFQzc3AvWEUxN1NK?=
 =?utf-8?B?RHdjWTcxSjNZMC9pdVlBSmxOMWs3MGt1TUVKbWVrWGt0eFcwMUtrUTJsVFZh?=
 =?utf-8?B?cG84NHRiN1hJS0dsNnpCcUhKaVk5QjJYZDZHTm9iVSt6ZE1wanhiaW1Lc1hG?=
 =?utf-8?B?eWdjY29NTVk2RTNqOHVYVmNlUnBFUjRXR3VYZjdNcmtRM0xhbW1waXJ0Z3pj?=
 =?utf-8?B?UFRUYk1vbkxQVktNeXlwV0I4RVkrT2hSZ2FmRkZJSXd6cFpBQlp3Zk41TUtZ?=
 =?utf-8?B?ZTF5RGxvT3VJbUFRM3BjdXBMcDhsa2VaQ2NLaC85ODRDSndnTzZ4bllYS2ZI?=
 =?utf-8?B?TVVGM1JjcktDdlc2WFdLZDlpMEcyaE96enRoemFWMVplT29iUGhMTlk4L1hY?=
 =?utf-8?Q?vI4RYxfpW9ZnXAr+rKXSMzaJ8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288d22b6-8ced-49c6-df35-08dad21881ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:46:32.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7JByF+8Pk5nRO+8lDFD0s6fPRwf4zbUPrC6S4FPv3wRFwC4J49kKknm/BP7wbzhTCgvR4glW9KpR69pXWlH3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9488

Four of them are used in apic.c only and hence better wouldn't be
exposed to other CUs. To avoid the need for forward declarations, move
apic_intr_init() past the four handlers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -127,21 +127,6 @@ void ack_bad_irq(unsigned int irq)
         ack_APIC_irq();
 }
 
-void __init apic_intr_init(void)
-{
-    smp_intr_init();
-
-    /* self generated IPI for local APIC timer */
-    set_direct_apic_vector(LOCAL_TIMER_VECTOR, apic_timer_interrupt);
-
-    /* IPI vectors for APIC spurious and error interrupts */
-    set_direct_apic_vector(SPURIOUS_APIC_VECTOR, spurious_interrupt);
-    set_direct_apic_vector(ERROR_APIC_VECTOR, error_interrupt);
-
-    /* Performance Counters Interrupt */
-    set_direct_apic_vector(PMU_APIC_VECTOR, pmu_apic_interrupt);
-}
-
 /* Using APIC to generate smp_local_timer_interrupt? */
 static bool __read_mostly using_apic_timer;
 
@@ -1363,7 +1348,7 @@ int reprogram_timer(s_time_t timeout)
     return apic_tmict || !timeout;
 }
 
-void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
+static void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     perfc_incr(apic_timer);
@@ -1382,7 +1367,7 @@ void smp_send_state_dump(unsigned int cp
 /*
  * Spurious interrupts should _never_ happen with our APIC/SMP architecture.
  */
-void cf_check spurious_interrupt(struct cpu_user_regs *regs)
+static void cf_check spurious_interrupt(struct cpu_user_regs *regs)
 {
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
@@ -1413,7 +1398,7 @@ void cf_check spurious_interrupt(struct
  * This interrupt should never happen with our APIC/SMP architecture
  */
 
-void cf_check error_interrupt(struct cpu_user_regs *regs)
+static void cf_check error_interrupt(struct cpu_user_regs *regs)
 {
     static const char *const esr_fields[] = {
         "Send CS error",
@@ -1446,12 +1431,27 @@ void cf_check error_interrupt(struct cpu
  * This interrupt handles performance counters interrupt
  */
 
-void cf_check pmu_apic_interrupt(struct cpu_user_regs *regs)
+static void cf_check pmu_apic_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     vpmu_do_interrupt(regs);
 }
 
+void __init apic_intr_init(void)
+{
+    smp_intr_init();
+
+    /* self generated IPI for local APIC timer */
+    set_direct_apic_vector(LOCAL_TIMER_VECTOR, apic_timer_interrupt);
+
+    /* IPI vectors for APIC spurious and error interrupts */
+    set_direct_apic_vector(SPURIOUS_APIC_VECTOR, spurious_interrupt);
+    set_direct_apic_vector(ERROR_APIC_VECTOR, error_interrupt);
+
+    /* Performance Counters Interrupt */
+    set_direct_apic_vector(PMU_APIC_VECTOR, pmu_apic_interrupt);
+}
+
 /*
  * This initializes the IO-APIC and APIC hardware if this is
  * a UP kernel.
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -96,10 +96,6 @@ static inline struct cpu_user_regs *set_
 void cf_check event_check_interrupt(struct cpu_user_regs *regs);
 void cf_check invalidate_interrupt(struct cpu_user_regs *regs);
 void cf_check call_function_interrupt(struct cpu_user_regs *regs);
-void cf_check apic_timer_interrupt(struct cpu_user_regs *regs);
-void cf_check error_interrupt(struct cpu_user_regs *regs);
-void cf_check pmu_apic_interrupt(struct cpu_user_regs *regs);
-void cf_check spurious_interrupt(struct cpu_user_regs *regs);
 void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs);
 
 uint8_t alloc_hipriority_vector(void);

