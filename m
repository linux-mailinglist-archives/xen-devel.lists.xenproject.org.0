Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B244BB457
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275216.470987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyja-0006fI-2J; Fri, 18 Feb 2022 08:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275216.470987; Fri, 18 Feb 2022 08:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyjZ-0006c7-Ur; Fri, 18 Feb 2022 08:35:21 +0000
Received: by outflank-mailman (input) for mailman id 275216;
 Fri, 18 Feb 2022 08:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKyjZ-0006c1-1Q
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:35:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b31d1eb3-9095-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 09:35:17 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-htTExiZbPtevkipbiCnJyw-2; Fri, 18 Feb 2022 09:35:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5813.eurprd04.prod.outlook.com (2603:10a6:20b:ab::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 08:35:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:35:12 +0000
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
X-Inumbo-ID: b31d1eb3-9095-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645173076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRyQl3XXjMIkv3EC1aE9ooEVH9T0PmKRPMUQxTpYUAA=;
	b=g8jRxyqEI+Z/65MuUhp1vFtbRykS/0jfcIO2Tbrj6JM+98YYPN3gC45HGiYWZQ/B/sLEPw
	ApNB4fHXp0xsaYfFc3N79SC+6dUGiEN69tNvRzfVP63cYpAHyqjpUmXhCmJVrU5hMo5xfc
	yzOXumrF4OuSSvzedHwreAtpCuBraA0=
X-MC-Unique: htTExiZbPtevkipbiCnJyw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfYXQ8Be+P4mdNmoFO2gEb6w7qUgIsPWjM3spf/rNqqgl4A2rt792eHxSkuc5Y8gEPwBEUxO9XzbqproJDyi+dUOwoMWqPU55KG7ry2w+e9D6UsBW7cInp/lQq3zt25pdG3e4ahxEtwyr8FhVvjTIa2EMaMVB1T2RWvtT97smhTCbg9yg48wmah5mAX+79GKFITrdAhUBrFqRVgXla5gA3CkVW9ci2Gj7nR9n4PynDGEZF04h/CuWLcSdRQ4sT55fbLAutDQuQFB/1eMlXKHoPd86iUeWDVstweGZ0nod7IzZWXi2L6EtnA6CT3a+jUi7x5i0LBiN4ZnIvIwIpLvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRyQl3XXjMIkv3EC1aE9ooEVH9T0PmKRPMUQxTpYUAA=;
 b=N8nJxz3IcEAzSafOE3q/41uXsB9mn9fzfBIKKQCQMJMWaR4YG59E/Q6ieKvLbVbvWLHSW3ZwzQTxDP1RRH+pfuMEav6gVRowEGCMXcrBRn2m2UFtA2xOnvn7Mix4DE3BDlBYTZWr//SQDiGk7RogD1lipAL5i0TdCmR6rCDnCKV3a0c90cyqs9TBeLUm298Bub8QYZOi3VInIhQ+burB2ep+LqGgKwyr0Bv+JJ1KgJYE9Lw7WGCaJby76QsoANZjEXcsmzsWIB2I7YJZJ8Wj5NFml7Ls8FltWGYPg2TZxCoEMhxPZ192ndVNo0LJ+GTiZe29v0Rqh1z+4a6STEjCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2db7bc79-4fe4-abf6-9e5a-83055af9a78a@suse.com>
Date: Fri, 18 Feb 2022 09:35:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86/mwait-idle: re-order state entry/exit code a little
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
Content-Language: en-US
In-Reply-To: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0026.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e163a9d8-b02e-47ee-1910-08d9f2b99485
X-MS-TrafficTypeDiagnostic: AM6PR04MB5813:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB581317F4ECB65825FAB12364B3379@AM6PR04MB5813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3lwXCsR/576G0CT/xY2Xuq5Eq8BXlNefjwPfqVuoahKDv4GlipwlACH3ybxf4Wmjrhr1Juu/Dmzxd+bzqpz9dDHWbQCc0RhExGKULeBs4CuYDCbwVzNdJZHJfv3cACwx5eIW/ZX92Na6GXi9rAIUvjMt4/CP5PBpVOKwPdX3RXtSGccUxiLaqDBWnhoZBYdnnKpc2Nj/OIWq8xr4eIb7N/Ww/cN6UM63undbLxOX+BgpD/ckcyUFTS3AnKWsS5EedY4ICV0Eg2Zx2Mn6FIyf7kscnwfxYzfVU1jE/aUmMLjSJ/CBvxzjAsfqeF6Tldhxrb4a+rFdpgjs6N3YUK4xpjIDUCP+AEr+NOuFE57UlvBBPpW0cNKiCy4WgZEvw3FNX2lhze+mqEEGYEvU5fYKhDMXxDual90Rc8g1FfuYQju/wUVV4lKvK6j2zbbdCGJ1EALc8Tn+kaPXfLMYSD7VWkIISmaJnLRfiIIpcMb/5kqttpidPA4X+EkRPFuhC8eQhUXYeIEjqNNhUyT3ru2XHz1GquQr+fjtSb9FUqxyUvv43+OuC8x3Hj4Tkaf1nbm0oX34QpY/LJkmBJ0GOxrPZg1atlAnLJFDGFP8KxK13ehIMWGcr0XjnfGNzBO4Wk2h+O4VVuQTQAEkMRxZ7KWkddh80ja/eE8I1Kce+Zf8xZdAlR+/43tRxXTE3ET0IipYdFjqUCLCUIr/p5EbmHCETW0UrC2pBUU+yEPLuzEcSMZPNJIGUPpNEj16JS/ac0KLqQbrbRTT9fW+0bhisWVFcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(508600001)(2616005)(66556008)(8676002)(2906002)(316002)(31686004)(83380400001)(86362001)(66946007)(54906003)(8936002)(186003)(6916009)(5660300002)(6506007)(26005)(6512007)(31696002)(36756003)(6486002)(38100700002)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEIwbjFtMEJpUlRmb0kvNGdFQnpoNDFtRSt2aE9Ub0xpNGRGcFI3TjQvZEJG?=
 =?utf-8?B?cDdRUE1xRGxYWnZndGVKa2ZyRk93NTVWdVRKUCtKYU42am9od0FhWm8ydHd1?=
 =?utf-8?B?STE1cE5MTDRWSXRtV1FMU0ZORStPa2ZUUzV1NUUzOEpNNVFjNk1YOFJzSThG?=
 =?utf-8?B?SDVhZDVOY2NpczJjL1EvK0hubDZvb2RLK1pRTlVNNUhTTzVobkxldDU2T1ZW?=
 =?utf-8?B?RXVPUTM2WWpicmJWOTRyUlQ0WFZxRHF0NkdiMXpFZmg0V2tzNWJqQ1hTZGgv?=
 =?utf-8?B?Q0w1SzBuOWlvK1lLbkhaUzM4d2YvaVBDNmZmaTlmTEpSTVlmazNpakxSN1g4?=
 =?utf-8?B?YVJpZm1aY0lzd3FydXd5TUJLOS9CYkRuemxMakFzdkNjUng2ZUpSaS8yVndw?=
 =?utf-8?B?QVpIdDluVjV1N0RDTWYvYStqdkx0QzZGK1BBdTN4em1oUHVQb3RFdEpPSHFk?=
 =?utf-8?B?emg5STVvSmZ5QVdiNHJteHdPeHJUa05WQ2VCUTIvZkNjb2o3bVMxWDI0TDNS?=
 =?utf-8?B?T3krak16L2VtNjRYK0JVL2Radms3c3ZGcVpzSE5LSDdxY3c1anpVQll0Y1pW?=
 =?utf-8?B?d2lha1dLVllJV0dnQlMzRk9sM2Z5TWNSOCs4VktaSjAwVTZNNkRrdEgrOTF3?=
 =?utf-8?B?UGtBUDcxUG5RM1l2RXV0RVBTRWgxUGZuUmxmMmNYZ2Z3OU5SK1Y5WFoyTENZ?=
 =?utf-8?B?V0dmeGhCUzI0bUptS1lHSjI4U1ZreHQwd1M5ZzcvRVN0RGpVT3E0V2k3bDVN?=
 =?utf-8?B?VTZKT1hxOEVhMnJuek42dHVIaDJ6WWFMRnA2bVg4ZE9tWkRaZ3QxL2lPcEkz?=
 =?utf-8?B?aThwS2JLZTNTVWIxbDNySUUvRURIR09oY1ZwNUQ0TEE3TTR5eEc3OC9ORGNr?=
 =?utf-8?B?UTJuYzA0QVdMa3FxbWsxUDh0Qy83S05aK0NhZG9JWkVDYTZUczhHM2liMkhO?=
 =?utf-8?B?VmpPM2tWbzJMUmEyV09HWFZreURKaVVsNXh0b0pFYWlPUUF2dDhSU0VPNGVW?=
 =?utf-8?B?b3ljNlFHb0dHNnplc2pVK2ZCVnVML0pvSzYvVkFmMUhoZFpGdUJseVpkaVRL?=
 =?utf-8?B?YXlabXVjT1ZvSHhtd0NCUnZKbTVGNEF4YStoUUh2OXJ6akk1RUlYMjhXT0dr?=
 =?utf-8?B?MUNwQi8wZTRuQnQ0b3pCUWdSbjJpSTJjcURsTE90UEFHZFJBejZtdjlGTVJH?=
 =?utf-8?B?N2diRkpnellyZmNQWjM0blZiQTFtSXhBZDV1Q2VJSDl5RjlieGNwVUhhUWY5?=
 =?utf-8?B?VTNGcGZLK08vMmVDWjZ1RVJpczliZTk3cEloaG4weUFFU3VwaG5LbXhIRTQv?=
 =?utf-8?B?d29JOHd1WUlVWDVzbmZieFV0aTJoNkZwckx4YnRRVVJTWFA5MVhxYmRhZjVX?=
 =?utf-8?B?MUdaaWs5Ny9NMll4RVN0YVhEWFU1RnZuQlppTFoveTByQ1NhQm5GU1grNFl3?=
 =?utf-8?B?MjNWS0JVRWdWUEdDMElLcklMNlRocTFqNkt1SXlYcXhMejd2MmpKdE5FbkQ3?=
 =?utf-8?B?MEUwM0V2YlpjZVJWRzJuQlZySi9MWEw2dUF2YU1VblUycXpZRHU1UEUybllB?=
 =?utf-8?B?M1J6U3gxQ082Qjh1cE05c0tJN0hOazM1OEZTaStKd0VzTUVqQ1R6aWFjV0dl?=
 =?utf-8?B?Tjl4YkFrMlFzajBZSVh2NVVKY1VnRWV0aTJwVk13SW9leVdqS1VQMVdzbG1w?=
 =?utf-8?B?S0xydXpMdHNFSU9uaS9jM0hKR0NTak5jUGpweXRTMSsxQ3FZeHh4MFh5eE1Y?=
 =?utf-8?B?cG9OTHI0ckNadDgvY2huS0tBOTg1c3R5NExIM2EvRzg1QW1wMml0VU8vYlZ0?=
 =?utf-8?B?cnJLVFdlQk5PL0VyMk44aGc1RkxsUVJyc25PNGhsaHJreTkvcU9oSmNDeTIv?=
 =?utf-8?B?blIxNnMySGtkeDFKaE4vUW5kWitaT0VDcU5EZWZKWDUzeEpmVVgrR3RCcTht?=
 =?utf-8?B?eEFKNWZKTDFNY2ZjS0VuMWdieHd6OURxOUxwNXJuaUNZZXJGT0UvRERMRGNm?=
 =?utf-8?B?SEVBa3BrT3o5TEtlTHNDUFlHM1NPQURCL3Z1K3QzWDFoQjlTNWpDNSsyMkNs?=
 =?utf-8?B?c3BrSHpOdGkxTit1OEFRYVo5eEhEcEhXZ051UGt3cnNoSmZidng5dW9lelNt?=
 =?utf-8?B?Z1J2ZVphSmVVNjdUUXRLRlplWEpFM0hhelF5Z3VVeTIwRTlpbjRvclRhUUg5?=
 =?utf-8?Q?bu3Afg27wzJcT8yug2tky5s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e163a9d8-b02e-47ee-1910-08d9f2b99485
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:35:12.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvDyd028BHTXDZwt5ofSqeGrFP1Keon+xr1qgLlpNj9uttLAPBHHUeE695YMYSSDZ8FLHt0xTd+hjsMCZi9lHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5813

The initial observation is that unlike the original ACPI idle driver we
have a 2nd cpu_is_haltable() in here. By making the actual state entry
conditional, the emitted trace records as well as the subsequent stats
update are at least misleading in case the state wasn't actually entered.
Hence they would want moving inside the conditional. At which point the
cpuidle_get_tick() invocations could (and hence should) move as well.
cstate_restore_tsc() also isn't needed if we didn't actually enter the
state.

This leaves only the errata_c6_workaround() and lapic_timer_off()
invocations outside the conditional. As a result it looks easier to
drop the conditional (and come back in sync with the other driver again)
than to move almost everything into the conditional.

While there also move the TRACE_6D() out of the IRQ-disabled region.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Moving the TRACE_6D() may be a little controversial, as this could lead
to a sequence of trace records not actually representing the sequence of
events, in case further records get emitted by interrupt handlers. But
with us now conditionally enabling interrupts around MWAIT, that issue
exists already anyway.

Unlike said in the earlier outline of the alternative approach,
errata_c6_workaround() cannot be moved: cpu_has_pending_apic_eoi() needs
to be called when IRQs are already off.
---
v4: Different approach (and title), as was previously outlined as an
    alternative.
v3: Also move cstate_restore_tsc() invocation and split ones to
    update_idle_stats().
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -847,26 +847,25 @@ static void mwait_idle(void)
 
 	update_last_cx_stat(power, cx, before);
 
-	if (cpu_is_haltable(cpu)) {
-		if (cx->irq_enable_early)
-			local_irq_enable();
+	if (cx->irq_enable_early)
+		local_irq_enable();
 
-		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
+	mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
 
-		local_irq_disable();
-	}
+	local_irq_disable();
 
 	after = alternative_call(cpuidle_get_tick);
 
 	cstate_restore_tsc();
 	trace_exit_reason(irq_traced);
-	TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
-		irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
 
 	/* Now back in C0. */
 	update_idle_stats(power, cx, before, after);
 	local_irq_enable();
 
+	TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
+		irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
+
 	if (!(lapic_timer_reliable_states & (1 << cx->type)))
 		lapic_timer_on();
 


