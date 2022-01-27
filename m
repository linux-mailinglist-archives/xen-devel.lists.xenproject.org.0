Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720D49E58A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261557.452996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6Sm-0005ks-QZ; Thu, 27 Jan 2022 15:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261557.452996; Thu, 27 Jan 2022 15:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6Sm-0005hS-NU; Thu, 27 Jan 2022 15:13:28 +0000
Received: by outflank-mailman (input) for mailman id 261557;
 Thu, 27 Jan 2022 15:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6Sk-0005hJ-W7
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:13:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac8f9861-7f83-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 16:13:25 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-BfUHM7SqNve5cQ3Vb8572Q-1; Thu, 27 Jan 2022 16:13:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6683.eurprd04.prod.outlook.com (2603:10a6:10:3c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 15:13:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:13:22 +0000
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
X-Inumbo-ID: ac8f9861-7f83-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643296405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBd6EFlOt65MszPeXwWMNIdktA8qG33hlxukXA8/vBE=;
	b=KRR3BI6L2c1tx0Q02MLsParR0TIVbOdQrdthbisLFKrzvTiY7aJd/C+8w98V3byDe6M0Ud
	PPDaE3w/0hgKx04Pzn09P1i+Ohhz54xbhLcxg4NIXN/6s4mLXI+PctmEb8OBZRA/W7H9jc
	xZwF4BjBP3J0YuPPWyNoIQOwEluZLos=
X-MC-Unique: BfUHM7SqNve5cQ3Vb8572Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK5hqaJymP1J8v9KIJp2fp/U3QGJIxgYQmN4t/T6anHFCx48SB6qhBs32Oz7BiIlgD6Y7ugeI2SZ5vhk8rtl2ShXLo2knU7in6ost+fmaqAcmq+vmdpi2SsMuPXUSks7CaCAVbGOinWTbT9XL18VEO6rCT1XHm+6Cs+tWAwqftSBB5jpAbRmOBBY0YnnZM7guAaeeAp0xkkDEoggTjb5siYSWLdP6xi5g/W917R0Df3Jp5c9V/0Q3ZvqXi1CaaQk9yQZ3nuo3wuYhkjteyrAOe9ChRBJVSCkLTnvAs2K0dF18xrcjK6a74MVScP+ZCy3uYVCidstaiY59aXqR5zB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBd6EFlOt65MszPeXwWMNIdktA8qG33hlxukXA8/vBE=;
 b=BAqtBxbgaP/Wfy09QXl3gOfOqjkrj1XvRUkBsOguuc0NYfwBAXGTG9uYtGJkhGhNLFtdvWNquvJqM+p9HSWcauKDv9GpbOCd5uvQ6Jzy+syg5hziFPLhB9WsjKG2K3gBafXB5di2EDp0zqGV/02fLuxkU38lBG2wtHaGKEHDKS2gYFOncEvPTgH1uBe94M7mZtGgX3IdfXhSgpzlVmZlX/6F3h4PhUYKu7Y2ob9TfVRVgRAP6E3AtmpnXMCwhj41xWuwR3CAMTyGY9WPymqQ22wblh0ILAJeUwNZQ/yxJb8mp/M4GPIOSFOfETKS3nU7k1t2wgy2SP0Ru/DkXioY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <379483c7-fe7d-16ee-454f-8f8dd001dc48@suse.com>
Date: Thu, 27 Jan 2022 16:13:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v3 1/2] x86/mwait-idle: enable interrupts before C1 on Xeons
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
In-Reply-To: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 048d5f07-3993-4d26-eb03-08d9e1a78f1f
X-MS-TrafficTypeDiagnostic: DB8PR04MB6683:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6683DF13CE0E1E2949CD7C71B3219@DB8PR04MB6683.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHH/7rqJw9li9YW7NVWdQKajLlaSMfPqL/uU6lBoYk1+uaYTr1PZISrzp6RnWtOSlxh1c4iqH6ZanyQFgOm2+9o40fVWwRf+yCKcHvF957zIBmsC4Loh9bQY9q/58SVNEOsvZ1oVYJKEDKb1qqm6eND/6WdMEDy1GxHrbMykZGzQqxizu8OXcPTy9oXSYyUR4lQnGA1+zA2DiO3PIHwFnyUWpsBGdS4MsRccHYXREyZZn0zZ2hY7zrLOft3GvOaRcZksYk7pAyQnTvJlAG+999Nq3BOeHMo7PDTAOUO7K58U27aid6c4UEZE+arpnXUFdHZ3jiVB3sZDMhDFCYk3XIKH0b989nx6nTNKvM6hGV2m4P/JQZBqJ62StnXcC6ZlqE+Jk4Zu2jR/7oTl0iN6FbiQMqMtKfkRrl0Z3TpT7CiJDLfMg7B9kNlaOSYw2XPs30dOt549e/py/loJWREc1LYVRI+zV86Zea6wNxkmIPuyh7Gp/7OXiOzBg2P5/Fbzh9IfR3vVD8FzGoWgSfCZA16vbYM67qPagqz/C3/KvalzgG3txCKNynTyhq8rB8DZRBL6SjF69VO9jk8erwGvcAx0hvikuaXAoWS2D0L8rBo37+WUOsz13cZATI7hADNCXpi+BcSxV3vn9DCCM9Y7QmYqJkDqVfS0TsQsJCEfrAUXaKJNXsY29+k6yxrz9i/s7aSwoF8JfgslOVaHnHN25QrDOvkhgoU85z8s13y6bPpKSHJpcUimDl73x+mMFFYDWp5OEPRtSSMS7J588grmrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(508600001)(2906002)(26005)(86362001)(186003)(2616005)(6486002)(31696002)(83380400001)(66946007)(6916009)(316002)(54906003)(5660300002)(36756003)(4326008)(8676002)(31686004)(38100700002)(6506007)(66476007)(8936002)(66556008)(21314003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnZoR2JtbWFOT1cwYkZkWE03M2FkNlNFcEFSZlY0bWU0YWh6Ulg1bm9oaHZi?=
 =?utf-8?B?VlNyellCTlZDeEt6dXVQYzFpTHB2OUptZUc5YUthVndoUFFxaEl4c3J5bjZp?=
 =?utf-8?B?L2FpMUhEeHAvZ2YyaGNkWEx6ZFlOcFB1M05KaWY0Y3ZQbDlGL0p6dW5RUUFQ?=
 =?utf-8?B?NnV5ZjdWWEhIZjczTEhSTzMyK3VudEJCVHdTMmN1Vi9SZTlObDVpN2ovdi9Y?=
 =?utf-8?B?TnFJOXhJRXZleHJ1Wko5SkVvenZON3FlK2lrN3pWZlBRZTBoam1IdHZGTWdF?=
 =?utf-8?B?eVIzaGhTMitBN1g5MDd1czZBZTBwT1lidzkvSnk4VlJac3dIY0V0MWV5WVAr?=
 =?utf-8?B?SVVFOUtQZFRpcEk1WUg4UUNKVzlETkEya3NCRTA1L096Sytkc2Jrdzk5QklZ?=
 =?utf-8?B?UFNhc3dKMUREMzA3WkkwWTJLa3I0K0NuR2lnQnFhallQVkU3QlVRUDkxUnRT?=
 =?utf-8?B?eWZLVHJ5SU4rTFg4MXU1WVZWcEs4UjZqYU5sbXM0ajlxNzlmUjFnWjVwdk9B?=
 =?utf-8?B?aFBENWJidHRkR0N5a2tUdHdDQkZyVmYwNXNnMHVlbHI5V1RzM1FGMXA0ZzYy?=
 =?utf-8?B?R0E2S2c4NURKWmhPeHlxSStuZTQ0SEEzT0h4ZFRCR3ppNjJ1Q1FnZUltSVFB?=
 =?utf-8?B?M21VRG1Icko1WEJ0U3JhRDJoMWFkMlBBVjRGLzBraXNlNDRVWjFpZVl4N3dM?=
 =?utf-8?B?dUlhSzZKTzF0V0UybWg4NnU4aXZwUW0xNVB0Ujd5N3U0NGlRT2VydlEzdzRY?=
 =?utf-8?B?OG5uOVkvSllpZkg5aVY5VjNsS2RPalRNcXRrTnV6dGZZNjVaVUlEWmpDelps?=
 =?utf-8?B?c3lzWHlzbjJna0VUWDdjMDZydGlpOTNvSE9HNXJoQzNFYXBuUUFyUmFzKzlF?=
 =?utf-8?B?bUZsNlZNYzE4RkxFN1V4QXpRQWp3R1d0ODRkcnpnamxsQUJXTkRIZzc4OVNG?=
 =?utf-8?B?ekZpWFRrMG1KN1NrV2VXQ0xkYktJTFJQNHpJYjhvV1N5M21aWWRwQWQ1TDlV?=
 =?utf-8?B?S055QnFUMTI3SEJuYlNrd1NNMExhdlhDMHRTWjlGbWYzWVhUV2hlNnFiVk5Q?=
 =?utf-8?B?dk5MMmhsZWZlQXI1WCszcWdIS2pVT2VrZk9QdVVZNzJVY1VLOFdNU0FwbFVM?=
 =?utf-8?B?MStyTS9sdGdOUDc2MEZnU3FPczFIbmtqUUFvN0pZWFVLZzlyVVYzMldqZGgz?=
 =?utf-8?B?U1J2TXFCTmhEdlFiT2IycW5JdndJVnUyMzZMTHMxd2FscWlMUmhvQTM1UGls?=
 =?utf-8?B?SDZqNTl4QXE5MGlSVFNrMmNJSEZOdnMxbldiWVUrSzFGWHl4Q2FjU2szQ0dy?=
 =?utf-8?B?TXMzenA2WjdYdVZ0aFk4OTNGZTVrSGU0eGlxczdVNXNTQVF3MDlUTjcrZFM4?=
 =?utf-8?B?Y2hhTmFLemFTaEdzQUlKVG1ZKzgvZnQxVU1DWGllOFJMeERmWHhDZGtCVTRS?=
 =?utf-8?B?ZzBGd1kxeHlzaXhmYS9hVFFpclZFV1N2aHZRWEJTbUVlK3FTeCtVTU1LMW1Z?=
 =?utf-8?B?Q0ROdDZPWTZ4VURDREIwTG9EQkxINFVWYkdzaGQwNjRlNnQ0UFB6WWg3Mks3?=
 =?utf-8?B?Tm5LdCs4Mi9qNWVmeVpYRm9yQUJ4eGVSUU5CTmRNbVB3cThWRm10M2FUSkVY?=
 =?utf-8?B?ODczVCsvRDFEeXhSOWZzZldiRkFMN2JSM3U0cDZJZHhnTk9reGVObnZGNHNF?=
 =?utf-8?B?bm1SY1VnVXFHclUycVV4NnVNOWdJRk5OblRoVkVYWVJTZUgra1Q2Z0ZwdnZC?=
 =?utf-8?B?NEU5cEY5aEF5UElOSENsZFo3SlNxYmRkNUw2b3czcjI3Z0NiS0NtUVFpUUdU?=
 =?utf-8?B?c2dBL1FFOThrYkU2SkZRQ1ZOVjVnZW9DUHpwcnFjVE1zQjF5U2ZuSnIxdWtB?=
 =?utf-8?B?cFVDaUE0S2g3YWtlbjlnTG9PWnNyU2kzcDFycS9yeXdJd3lEQVFNOXZMZ3lJ?=
 =?utf-8?B?ZlgxWTIydXkwZHQ2akVRMlh3Nk1HR0hzMEl1RWhJSVNlSkFHblpFUXZvZVpu?=
 =?utf-8?B?NnBQWHZVc2tWdUdqcXM0SmtXVmsrS1NFWFA5R1VRdE05ZXFzTTlzblhFWVhU?=
 =?utf-8?B?eXY5SjhaK2NVVzhIWno2QVcrejI5QUJvd1JwYkx3ZUhrWnBGOXpDeUFtS1pK?=
 =?utf-8?B?K0d1V0s2V2ROUWNyUXByRkZHSFRENWNLYjI4NDJvc0wrZG5YM3pjNWVtUU9O?=
 =?utf-8?Q?uWR6rjF7PSOuc7cONukmpIs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048d5f07-3993-4d26-eb03-08d9e1a78f1f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:13:22.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q18XtsG3DTNpb9Wb9JRcMuVRco87c/+MvE/SAB8Hm7nZwKjrAZR80pBCv8tZWnJ61VVMpwui1Msgz3JWW9fhoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6683

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Enable local interrupts before requesting C1 on the last two generations
of Intel Xeon platforms: Sky Lake, Cascade Lake, Cooper Lake, Ice Lake.
This decreases average C1 interrupt latency by about 5-10%, as measured
with the 'wult' tool.

The '->enter()' function of the driver enters C-states with local
interrupts disabled by executing the 'monitor' and 'mwait' pair of
instructions. If an interrupt happens, the CPU exits the C-state and
continues executing instructions after 'mwait'. It does not jump to
the interrupt handler, because local interrupts are disabled. The
cpuidle subsystem enables interrupts a bit later, after doing some
housekeeping.

With this patch, we enable local interrupts before requesting C1. In
this case, if the CPU wakes up because of an interrupt, it will jump
to the interrupt handler right away. The cpuidle housekeeping will be
done after the pending interrupt(s) are handled.

Enabling interrupts before entering a C-state has measurable impact
for faster C-states, like C1. Deeper, but slower C-states like C6 do
not really benefit from this sort of change, because their latency is
a lot higher comparing to the delay added by cpuidle housekeeping.

This change was also tested with cyclictest and dbench. In case of Ice
Lake, the average cyclictest latency decreased by 5.1%, and the average
'dbench' throughput increased by about 0.8%. Both tests were run for 4
hours with only C1 enabled (all other idle states, including 'POLL',
were disabled). CPU frequency was pinned to HFM, and uncore frequency
was pinned to the maximum value. The other platforms had similar
single-digit percentage improvements.

It is worth noting that this patch affects 'cpuidle' statistics a tiny
bit.  Before this patch, C1 residency did not include the interrupt
handling time, but with this patch, it will include it. This is similar
to what happens in case of the 'POLL' state, which also runs with
interrupts enabled.

Suggested-by: Len Brown <len.brown@intel.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
[Linux commit: c227233ad64c77e57db738ab0e46439db71822a3]

We don't have a pointer into cpuidle_state_table[] readily available.
To compensate, propagate the flag into struct acpi_processor_cx.

Unlike Linux we want to
- disable IRQs again after MWAITing, as subsequently invoked functions
  assume so,
- avoid enabling IRQs if cstate_restore_tsc() is not a no-op, to avoid
  interfering with, in particular, the time rendezvous.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: I'm not entirely certain that we want to take this, i.e. whether
     we're as much worried about interrupt latency.
RFC: I was going back and forth between putting the local_irq_enable()
     ahead of or after cpu_is_haltable().
---
v3: Propagate flag to struct acpi_processor_cx. Don't set flag when TSC
    may stop whild in a C-state.
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -108,6 +108,11 @@ static const struct cpuidle_state {
 
 #define CPUIDLE_FLAG_DISABLED		0x1
 /*
+ * Enable interrupts before entering the C-state. On some platforms and for
+ * some C-states, this may measurably decrease interrupt latency.
+ */
+#define CPUIDLE_FLAG_IRQ_ENABLE		0x8000
+/*
  * Set this flag for states where the HW flushes the TLB for us
  * and so we don't need cross-calls to keep it consistent.
  * If this flag is set, SW flushes the TLB, so even if the
@@ -539,7 +544,7 @@ static struct cpuidle_state __read_mostl
 static struct cpuidle_state __read_mostly skx_cstates[] = {
 	{
 		.name = "C1",
-		.flags = MWAIT2flg(0x00),
+		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
 		.exit_latency = 2,
 		.target_residency = 2,
 	},
@@ -561,7 +566,7 @@ static struct cpuidle_state __read_mostl
 static const struct cpuidle_state icx_cstates[] = {
        {
                .name = "C1",
-               .flags = MWAIT2flg(0x00),
+               .flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
                .exit_latency = 1,
                .target_residency = 1,
        },
@@ -842,9 +847,15 @@ static void mwait_idle(void)
 
 	update_last_cx_stat(power, cx, before);
 
-	if (cpu_is_haltable(cpu))
+	if (cpu_is_haltable(cpu)) {
+		if (cx->irq_enable_early)
+			local_irq_enable();
+
 		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
 
+		local_irq_disable();
+	}
+
 	after = alternative_call(cpuidle_get_tick);
 
 	cstate_restore_tsc();
@@ -1335,6 +1346,11 @@ static int mwait_idle_cpu_init(struct no
 		cx->latency = cpuidle_state_table[cstate].exit_latency;
 		cx->target_residency =
 			cpuidle_state_table[cstate].target_residency;
+		if ((cpuidle_state_table[cstate].flags &
+		     CPUIDLE_FLAG_IRQ_ENABLE) &&
+		    /* cstate_restore_tsc() needs to be a no-op */
+		    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
+			cx->irq_enable_early = true;
 
 		dev->count++;
 	}
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -42,6 +42,7 @@ struct acpi_processor_cx
     u8 idx;
     u8 type;         /* ACPI_STATE_Cn */
     u8 entry_method; /* ACPI_CSTATE_EM_xxx */
+    bool irq_enable_early;
     u32 address;
     u32 latency;
     u32 target_residency;


