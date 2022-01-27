Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C349E58B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261559.453007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6TB-0006DS-45; Thu, 27 Jan 2022 15:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261559.453007; Thu, 27 Jan 2022 15:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6TB-0006BZ-0R; Thu, 27 Jan 2022 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 261559;
 Thu, 27 Jan 2022 15:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6TA-0006BI-62
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:13:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbd9c594-7f83-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:13:51 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-mg8HBOwMMyuE2qd1UH2CQg-1; Thu, 27 Jan 2022 16:13:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6683.eurprd04.prod.outlook.com (2603:10a6:10:3c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 15:13:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:13:48 +0000
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
X-Inumbo-ID: bbd9c594-7f83-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643296431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmEKu/9ca5lmYiJgoL5lXi4Mn2sZqGXi0uK5GeeQpB4=;
	b=C2oHqi4ZXxrvi8oVER2MvJpNLxYFuhZzmmdnqUU3GuAE5Oq0btFlp3ZSZVzQKLDGVDjyMZ
	UhqkGVRig6F9CCCxWxnEUW6+y9qycGm192w6KCMvAC0cWyCwVi0j+q+0r/1KHfprmApnSW
	5L76Ibbsf/jDr9Z/a9FDj+JJfCcY70w=
X-MC-Unique: mg8HBOwMMyuE2qd1UH2CQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsNlr4oZpKp8GfZFfN1suIJmAwFxkcE2Cq9YIIs5dZQpKRVs1kocqzfFPojCME+3eOqTT/nm1RjqU+hY4YEckb8PSsFveyIrlhMHEpbcbghyvYNp3JF9FKe6LyAxVPkzn98NdMVysqrJUJ1e5MV+GpH8+fNNMqkkjyDQ1NW3AlFBD7aj1ERxWiqlwYa97Nmam+Fw/CR5A/IutI1CGoBOFgnhyeEW1qEXBh1GRi6vc3qqFzsakv435J0pdkSGVW0zWuIjt8UjxkH3F3LE+USDHol8jOb7ptDD0xA6EeUW9DfYuSKiFH5FS+TNGxL3i1Je08F+lGvOsdjt1t3JQuVK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmEKu/9ca5lmYiJgoL5lXi4Mn2sZqGXi0uK5GeeQpB4=;
 b=Ydc+5pSntp53rD5K+N2zq86zxPtNt7tilcg4t3L0ovdgkYTHUbQ82jnMb3755wo965CuWPsbmx3ERdPhBy4Gx7jBAhZJ98F8CUs43Xq/t8F+mwJjmxnrB8zqnWKvqwTFPtmQH/b8yP7r/tYKiekhyp+1AoftkGSjft3mN3UmEBIvMRMph/iHgjbHjUPlL4eUau10r0q47+A3GpWONi6zi7eHOmeBs8EviRLhjILclgGDYZyfd6zNaiggkgOfSgg4hoGrhrRBXibfKctYAMmxJTvecRvtSiZVO3nuwBXjArNZTIsXsbqjlI3jT8gg0WR7HkHSmD9Jl15qmrT0mDOTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a9152e5-1a7d-c569-3483-66f022027597@suse.com>
Date: Thu, 27 Jan 2022 16:13:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v3 2/2] x86/mwait-idle: squash stats update when not actually
 entering C-state
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
In-Reply-To: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917a67c5-ee72-4c07-7e0c-08d9e1a79ea8
X-MS-TrafficTypeDiagnostic: DB8PR04MB6683:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB66836DCBA8A0F81309E3F595B3219@DB8PR04MB6683.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJcZPDBMuG0vJrK1J+pjqi9GyilvI6u1x+H3hCH3FrHO4kqCFKKZ9HilYiXAIDSc0TeKLnLLO/9E7m56oWbasUOv8KyBJLpmjlWktmK/SHBCS/eE8WkiESNlL6CzY7XQzioTG7RlHFzeqtLdg8kDpIC1TwKbfN8dQUBZgwjiOb8DCu990zb49V+PFjJlLLHr4LRCQXnCMrNu9ELAcsPt3Xywbphd9LZ6+6vepo5AawYq52vU4QB5sxpePXvn08f7PX9f7LYN2Whwife4e/iHD5X+5e7IhJtqvq/pX9BTyxFj2i7jn5QLhHeIAgEFtu0ZySQT9WVc75kNTF4gl32ogi2PBlw4GYhbI4OevHpWlPen1IwJTZ7Y/VE26ADbV2ln6pAQRVy0A7Qb5okvfn4+vMctiQKHgUSoQZ5Kc4/ArbblCMuoZHzp+e/l+J0BPvlRf5Q9GZkfTzOvJoGJTbaEUQBVijSbzz+jZc0dpecc+Mw0QbnLLEAG/XoPWccSOmtPR+2n7FIZKW6xymCM2tY4cCeoeE2ONo47b7fQ1C10KWFOmsMyw+8fsupiC82b99FdeEDYxH72iCooeLYIW8bqRO1X3tOHxLrksVa+mE6lKU9e8qnQxpjCMUka48EA7a1C0jrGo26D2NS7wy4XAfOn3zGNpx0mig0HUqCwrLIP13RfKbxUIOSeru35vPtftXRGSeFR7Be5JboXOPJUbr2MdYyZiKBdPabwtzqfujVmcavqNzKHvs9l8AOJOozmlI1T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(508600001)(2906002)(26005)(86362001)(186003)(2616005)(6486002)(31696002)(83380400001)(66946007)(6916009)(316002)(54906003)(15650500001)(5660300002)(36756003)(4326008)(8676002)(31686004)(38100700002)(6506007)(66476007)(8936002)(66556008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVdtQk0yWW10akh5WEpINWlCZ0cxQ2N6djRlZzV4eEFJeHVpNWxFT1JGbGl3?=
 =?utf-8?B?ZEZRRmlGMy8rSmw5cVh4SHhOT0hzQThQbjFNNlFyVSt4ckozYjRzeW5UZ3Iz?=
 =?utf-8?B?WUNWTlhTLytlVDNuNzRtdGtiSHVWdzhhbXJHcDBzQ2h2R2hicEJzbHhVdFQ2?=
 =?utf-8?B?a3FSNGlDUXBheXNsbE50c3VGamR2RUUrWkFFZUdIKzZ2VjRMZHJ3NDhrM08v?=
 =?utf-8?B?ZkV6VFBuZGk4TklYSjFBU1pBQzF3L1lxVEJ4eDFYOEVpMzdXbjlmT2lHdHFW?=
 =?utf-8?B?b0Z4NXViM1c0VEJwVHRpcnA1L2FNRXI3UmRORXFmdFU0cFp6NDRYUWFqalNw?=
 =?utf-8?B?KzJQdlV3cFQ3RHNPWUNNRkNiRFFhTTErc2tIYmNXcWZUTUd4eHByM3JBczdX?=
 =?utf-8?B?RktHQnI4NGUwaTBFbEs5YnREYlhFR2I5ZFZQZ3ZFVEI3d3ZMUTN3dHJIY21M?=
 =?utf-8?B?djNLZEUxTGx0NWw5SVZkVFRwOGhISUtrME1uODZFV2cwVlNiWTB0TXdBa0ZI?=
 =?utf-8?B?ZTQ0UFlXMWlVZ2txTUpVUU8rK2JBNDVESmt3UjhOdWllOTcyWmhNMVk5d01J?=
 =?utf-8?B?cmwyWUo2SHZWcUlMZnA2L0l0bld4VzczTkNjd3ZTOG5hcjFCcGFvRGFZMWov?=
 =?utf-8?B?RkgzSFZrWGFreHNZd2t4a0hlZStxMTVqZStzZEZxMXFCVXcrRVRxdE02MnpJ?=
 =?utf-8?B?ZHg3cHd4bDdJbE1ocTlPNTRSNUthamUwT1JNT0F1MzluS3R0emZPdXJSeFJw?=
 =?utf-8?B?TjZYL0xZQlpndzZ2YXJoaTlyRDl0ZkdSUEZZd294TjVHZWo1ck1aMlNJSSsv?=
 =?utf-8?B?YUN0b3dkM3o5YnVRTEx2L0srb1NMditFUjZ0eEpwZlVUZXdQZnRBeDJhTkhQ?=
 =?utf-8?B?UGNScXhyQWhNWjhkSWZWUExJLzJtOVNUcHlmOEU2VE8reEtCZDlkSUdvd2Ry?=
 =?utf-8?B?dlZ6dElhUzR0bEx3STJGelJLQ0RoMUFjL0tCYUl2K0pTSG1OYkhJYmhtVXRQ?=
 =?utf-8?B?eHdmQ1YvMnBFTThMUm1YL1BSMnlWbjdzZkYvazZwVnQyN1lUK1hxYWFxQU9B?=
 =?utf-8?B?NW5ldXVOUGU3WXlQcGwyd1IwcVFWQW5adS9wSS9XZ2IzZUJhR0hkOU95VXk2?=
 =?utf-8?B?aitXNUV5UzNvRVN5WFFtZ2s4K3p3VzdaMlBwd3JwRktGMXpwbTdya0pSTTUy?=
 =?utf-8?B?dUJkNUZDZ3BvL0tlNEFmUkQ1QjdrbXFGRW41TFQ0enVEek5mSCtEM3ppTmxs?=
 =?utf-8?B?dDNSdER5Rnk1Sk0zYkpjeTYrcmwyTkoyWS95djJ1MWdwWW5VOE9SRkEzNGZ3?=
 =?utf-8?B?bmp2WW9kYkJYdFdKdVlRTjdacS9Dc2o2aHROME54aGhLbmwrOTFPZDJsVktU?=
 =?utf-8?B?MDF5WXdSMlM4YmJaY24rYlR2OHpmbmlLZFk1eC9WNkxiUG01c1lncTdYQjNC?=
 =?utf-8?B?b1QrU2dWQmtkSFdBTWV4TVFKcy96TEM3aFhWeWNSZmkwRTMzeHZTUDlOQUtl?=
 =?utf-8?B?eVkyMndZQjlJT3krVlVWck9HZC9qODk2bjR6SjF5dXA0dWNWNzBodVE0U2tM?=
 =?utf-8?B?NkR6Ukl4L1lNelhpZitBVVNRSVlQV1h4NTY5dURaNDUvQUdmdUlwL3JhRUcr?=
 =?utf-8?B?bTljaGgyVkZuVmVGenJicEFsanJnaERwZmFNemRYbHBpc1VjakJBOUVxZW4r?=
 =?utf-8?B?VnUyL2ZScngrN1RIUmEwZ2dJblBOc3JZaW94N0U2ZHlCS3FlZEJreldjcWFx?=
 =?utf-8?B?Mk5uWnB5VUlER085VTg0WGdXN0dQZGJmdno2d0RNWjhuZHl3RktHK0FXTjkx?=
 =?utf-8?B?ZWtjTzcwZnRweXN1TVZJZXkyMFRPUE53QXFyc2thNEIzaTlCTlozeFZnWklW?=
 =?utf-8?B?ZjFvc3FRdEFuVjFXRjZIR3dUU2NQY2w1cmQ4MmVDNlJScUp1U0ZJVzJpYWFF?=
 =?utf-8?B?SXorNEJWMXgwZVVqSTVUMkN6WENJckdKa3E1V29TVVk0QzU1QVRKM1pDTWtF?=
 =?utf-8?B?RDVrNURoRHkzS1ErRjdmM1ZrUzUwUCtNTVVlNkk1M0k2eTllQjhkYXM2eWxk?=
 =?utf-8?B?VG5SdlpwQ0dieVFHVlBJRUR0ZWlUL0ROYS9KM3p4djhiZExoQXBSTnJLYkFC?=
 =?utf-8?B?UFRMTGQ5WFV3dUoyV0NRbE5ZN3YwaEdjOUpheVhrdlpDdmxOVS93Q0tnNjVB?=
 =?utf-8?Q?ase7J5p0s5KnQ3mL1cCRz5w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917a67c5-ee72-4c07-7e0c-08d9e1a79ea8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:13:48.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SszrsmfOrgtHE1Q8VPFjGX3ABaL7clHQsdMb9m3tI/DN3uwTY+0mlNufUE20N90N63rdBj19jxZtGyrTw3xvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6683

While we don't want to skip calling update_idle_stats(), arrange for it
to not increment the overall time spent in the state we didn't really
enter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: If we wanted to also move the tracing, then I think the part ahead
     of the if() also would need moving. At that point we could as well
     move update_last_cx_stat(), too, which afaict would allow skipping
     update_idle_stats() on the "else" path (which therefore would go
     away). Yet then, with the setting of power->safe_state moved up a
     little (which imo it should have been anyway) the two
     cpu_is_haltable() invocations would only have the lapic_timer_off()
     invocation left in between. This would then seem to call for simply
     ditching the 2nd one - acpi-idle also doesn't have a 2nd instance.
TBD: For the tracing I wonder if that really needs to come ahead of the
     local_irq_enable(). Maybe trace_exit_reason() needs to, but quite
     certainly TRACE_6D() doesn't.
---
v3: Also move cstate_restore_tsc() invocation and split ones to
    update_idle_stats().
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -854,17 +854,23 @@ static void mwait_idle(void)
 		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
 
 		local_irq_disable();
-	}
 
-	after = alternative_call(cpuidle_get_tick);
+		after = alternative_call(cpuidle_get_tick);
+
+		cstate_restore_tsc();
+
+		/* Now back in C0. */
+		update_idle_stats(power, cx, before, after);
+	} else {
+		/* Never left C0. */
+		after = alternative_call(cpuidle_get_tick);
+		update_idle_stats(power, cx, after, after);
+	}
 
-	cstate_restore_tsc();
 	trace_exit_reason(irq_traced);
 	TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
 		irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
 
-	/* Now back in C0. */
-	update_idle_stats(power, cx, before, after);
 	local_irq_enable();
 
 	if (!(lapic_timer_reliable_states & (1 << cx->type)))


