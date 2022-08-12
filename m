Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D4590DDF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 11:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385435.621079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQds-0004kB-NS; Fri, 12 Aug 2022 09:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385435.621079; Fri, 12 Aug 2022 09:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQds-0004hA-KZ; Fri, 12 Aug 2022 09:07:44 +0000
Received: by outflank-mailman (input) for mailman id 385435;
 Fri, 12 Aug 2022 09:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMQdr-0004h4-Qs
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 09:07:43 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10084.outbound.protection.outlook.com [40.107.1.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38fe4dcc-1a1e-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 11:07:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3625.eurprd04.prod.outlook.com (2603:10a6:7:8c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 09:07:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 09:07:40 +0000
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
X-Inumbo-ID: 38fe4dcc-1a1e-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foRN3xhVj3qZj8RpGozm97yNse2n+uqAsoIzefBk6ElJp4bkKjkc6ARGUXeTz8gSxp4BXNBrS6Sg38SymspkBDEnBbmgfZRP6ZWmTwnI4zE4cp7lVC0Sdk4nYTtQWNrUEHI/sPXiApUjLcKkg4ZLZDpWThNZX6m0X71huZainEx/pbtaaaEvtFwPx0YngeX67dOIlEE/xqvnQ8HpbJ8+9ajMG2SYqfR85tkT2sfqd1PZK3AV3fgqHOu1yGqnWvYWdkcOIaxtDMSkB1t3/r5EWs7EdGjg41NKzNrP4LPahpbSFDycRg1T/t4RmNTuQ1wmYahTLsjo9LKnwrG0KNkjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAkNLNti5tN/FMTZtk/oG1FE7N2XTZC09fvb59IEIK4=;
 b=TN9mrn7x74DGuURL8zMRfcJxQQ1FH6AbXKkpWSUTcSBoiEJ/HCryI1tT45Vh7vCIp5bU5l07Pib8duFwjMVEJrLRQmtXcUDb8Z7o4J4Tv8kSj/NrPcosWd71F7mZniVHvMIpQ+40WG94Rp3vlrTjf7u4g9Tm1Qeor1PY2blGw9wzwSVo1pAWXbgzym072LcW+H2itXd3/jo6Kk4D7cI9GZxFCpfO2XeDqZhIyw2t/1/3NKTaKBcED/JeYAp+SmgpLDgFa7zTRrexPfU1APWuoyzpi6OAjlOlEoU+Ejmy1K80I+BlKQSP2sY2W+iJhTNsdW9VTR9juPulbSpdDssmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAkNLNti5tN/FMTZtk/oG1FE7N2XTZC09fvb59IEIK4=;
 b=2pGjZMkTop19VUDlioA4kW/Vao2ko+jc9y2KsCWBp+nqMBb7i1LksiAQszK/fvyXhyVcBrM3aNqVSSjDlMIoNN9edKcVIPHb5m+e0jdIiX+/j/mby0eE/e23NZu2XGcbHVppzvAuY9AqC6JnInKqFrYbNABVxPs7Of3fFpeK6R20w0Cf3Cy4ugwZAu9cytWGu00IB/vFN+N5T/iThkfTQQJkO1Qry9RLjAo+y+wbnmACGo1OOdlNqhtPaZtPLwxvTWA2kLyjLqRXZzjhf826HzYW43c53o82s88j7J/RP49a1yV6Y022xXOKaWuZ0rgmPt71ELLCTSNNT1GIU1++8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd5bff98-a112-b83b-fefe-e310468d9e88@suse.com>
Date: Fri, 12 Aug 2022 11:07:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: show_hvm_stack() requires enabled interrupts
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35aa8ca6-ee61-44ce-472e-08da7c421ba1
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3625:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cl/2xYVFcwHIVh6a6Otu3EjLzlk7SFScwvmuuGaxyDQXxC4pLRFK+VFGX+A8Hwt0ylF++CmT2FAw0nNivolgNofeb20uyZUZ0uKFnoomRIOigJx1RsxIGwWdcoPUIIXcgugiW+Hm0vk8UvU9PB+KlRNM64zBugI5XwSOrM4aQ1uOeQ8FNsBzKZtQU2S7QQ29JlqmKTZzVq2SgMP9ZK+Id2AePghXeeZMJ7erafTqU9ydRLZDpbRQhhYAMuuQWYB5oFOlJNFh8Bv+wpzHE5RDeZxZydWAz7GAxi0gOWSdFNUG7ubOl+Y3UIsvcZZYbHoh1Lrk72CxxYfZ0KrrIBG6K9Wv37cxFIS7w6rJOQsYzHQrhBIpQY2IMtiP0jShFvisTpOtkRJhUncFMoH26zCeO6xN9E4mcKW2LZdhgzsnaaWVoqD19ORkxzSXIKEtqD9yKyO1W9AkFTnPngvKfLHRP2FIqhnwFr/M+TjANz9WlWd4ItQx17lP780zhRLwLx7nEtH+0do7mDPL1dGCrKN9AKh70VGy16aqQpyy03oNGG6o3qelFZHZvD8Oi93W9mIu8EUyu8exTrhhnzJopGicraRJVgh9Z8x36IHDpPENL+85H9ZODoU8oBO/gLl7buS1uDjJK1R0T6ajJb0SfY8ZTMsEWTV/6v5QzrfU+gCpEM/Dhs2JrvFNzTdTFuNF2ReBIimRPtd2Y9LWGN3vNCkceI0MMb79QHQECP8nGHaZXS9biyh04wiJYmoSCIiUqBbdkv9CtDCEE3dKsxW+Jtx7o3rlJAu0nQWFUhBv1xGs0TWGe44cClmpRv/J8PvzlEUSU2JNPBgpT5k2R4ltVPO5BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(376002)(366004)(39860400002)(86362001)(31696002)(66556008)(8676002)(66946007)(4326008)(66476007)(38100700002)(8936002)(2906002)(6916009)(316002)(5660300002)(54906003)(41300700001)(83380400001)(6666004)(186003)(36756003)(31686004)(6506007)(2616005)(6486002)(26005)(478600001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW5aTllGUS9sRUhWSVJabUk1Zy9oTDZBclFoeksrbWJDTUVsdVNDSTA4QUpW?=
 =?utf-8?B?cXA4NFZkcHRHTDhyZENXRXZwR21wZkRBQWxYSDVyQ3hPdHBXcHAvcm04UGtD?=
 =?utf-8?B?MGhIWE1jWEx0bEFLZ3JzREN1YkdFUFRsM3J5YVNiNWNUMHNHK3h2ck5PZVc1?=
 =?utf-8?B?Y1p1QjVENkRneUUveldjVU4xK1AvK3RnN3F1aVNGRkVnMi9FbHlKWUNhcVpG?=
 =?utf-8?B?RDB5Z1lvU2U5eFZ1bnkrajVsZFd4andZV2lsem9EdnAreEVSUC8vUnpTTmFq?=
 =?utf-8?B?TmZWU2p4S1RqUUtTZU8vNFI3QkQ5cCtuNm5RY2UyM3YzaDB1MTlQZXR3a1Zz?=
 =?utf-8?B?R2xwSW15REU2STc3MTN1WE1SNnBYRWxXRnRCT05Ya05yYzVCMzArUjBpUTAw?=
 =?utf-8?B?SHZLMjRGdmlhUExGRXYzdkl2aEswK2w4d3JRbTVFVlVlRXR3aVhuSm1NREJt?=
 =?utf-8?B?dnZsejM2alZxZ2p6TGNXTUN5US94eEVxdGVNMGFHOFVRS1FVZzkrQkdPa0pD?=
 =?utf-8?B?WDlvbWtzWW5zQUt1dTlvanEwTE8xTUpHNGtuRTlOcFVlYXBDRFlEQWNNdWF2?=
 =?utf-8?B?WjFWRjlRZSszSDhIc0JZNW52eE8wcE8vQTJtSDdzUHV0WGIzellYMDRqdGRS?=
 =?utf-8?B?RUNadTJmZ3pyTGRQYjU0NktYQ3lzeUtkemdObks3RDBMWGpwMlhsMmt2cmNm?=
 =?utf-8?B?T09wTWtlWCtjcjFQcEJ2ZHNGYnl3eS9nRktzbXFKUmY1ZVJERkhXaXRsbjFX?=
 =?utf-8?B?bUhKb0kvRTVEM0dWVHkyUEE0Z1drN1lhREl0dGhWVlExVjJCYndVQjNldHpw?=
 =?utf-8?B?STRZTVNCcjJIVmZqaDFMRjRCbFBIamVJbFRGZDB5WlB4Tnk4U1dHU0N5cFcx?=
 =?utf-8?B?a3dzREFrRVROSUx4ejFabm5FTVZIOXVja1BNOVJIemZBMUNHUEk3WWRsQjVl?=
 =?utf-8?B?My83NlVZTVlkRTBKWTNjYlBRL2pDdXVFWk51bVdwdHRiVVV0Y0FNd3MyUVl1?=
 =?utf-8?B?SSs3RjJST01QdXB4Y005bjU1aVdLWGgwczJreUk5bUgxckpZeGpOTFJaTXRZ?=
 =?utf-8?B?NmRUUGo5VEJSTjgzOHdzMlhHenRUM1gwaDZZOG1nK2pzRERVSXBpelBFcmxi?=
 =?utf-8?B?YytGUnhPYVpkeWFmT3FDSjJ6Q2tvdUJTV013VHUwZHcyVWtKWm16bEYyZXg2?=
 =?utf-8?B?MG9ldmdKR3F1VHZDTm8xcjhGTiswNjF1N2Jqdk8zc3JFMFJyL0dLTUxrV3Bt?=
 =?utf-8?B?UTYybmVLZ1k2SWd5SVVmcUU0elA5NGIyb3VCVlZIb0IyTEJkbmkxL3JaS1RN?=
 =?utf-8?B?VDRaK1ZJa1JlWCtXTjBvMnp4ckRFZ3o0YUJtaVI1V0Y2UDJRdk1iK0dVSkgz?=
 =?utf-8?B?VTBteUdSMWdYUXF6d2lDWlB6NXIzNkVLcVFQcTBJa0tIUDVVOE9UeVpLcjZX?=
 =?utf-8?B?MnNSUXdQcG1ZT1Fyam8zdXp0bHBaMTdwSm9wNS9yYXZtNmRoUmtVektnYkNk?=
 =?utf-8?B?QVFiQVVDM1dsaTQwZG9mVEtjYWJmcmJJUzZOeDh6TjJGb2RMUjJXZkgxakpj?=
 =?utf-8?B?UDFxSUpFMHFMVDBuQjNqSDdJemJ6dHZHZ1djM2dDS0NWanY2ZDVLSTNBa3By?=
 =?utf-8?B?MU1XSEVSZ2d5aTJERXhUY3k3NmV0ZHRwQWY3U0dGcHd4Uis3ZXV3cWx0ZlpY?=
 =?utf-8?B?Qm43SVVodEM4TkJFZ2h0cm9QT0JsNHdiS29IWTZIWWRicEIzTHBNNUxhNHFR?=
 =?utf-8?B?ZmkxWGxHZlllWDk4RVFsTHdWdzRlS1hvYnc4aVRzNW9OeU9na0d0TEFQN1hk?=
 =?utf-8?B?aDRTMWpSRlc0VFhuTDVtRVB2TnQwdG9yNUxwak1neExrOHhwR3RieWxRQUps?=
 =?utf-8?B?OThOY1UwTEJ4QnBpcmpteTJ5TTN5MURqWHVRY3VwSVBETmppeFU4WW1xeitq?=
 =?utf-8?B?NVViZE1JMjlLbGFtWnBTVTRXcVAzazNEeCtNdGZYRVh2Q0Z6RXg2aW5Ec3lR?=
 =?utf-8?B?SmI2NGk3QktFaTdWeTVxSUxOSzVLSXhSd09UYzVZZVFDUWdqbDFTUGFOOHMv?=
 =?utf-8?B?bWJIa1orZldVdnhmV3RoVTBIUVJOVUFUYjczckEwRDBrWmdWOVl4bENvWHlq?=
 =?utf-8?Q?rdsKSMPyoj86A0B+eTezLFsU7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aa8ca6-ee61-44ce-472e-08da7c421ba1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 09:07:40.0680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Qu6oMusAxgnXvtrM/vUcN3bvwckxfFHl6PD1tSBACNDHc3ACJFipdsjfvczznq8hWj3lbycgvNvPlFqrOnYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3625

show_hvm_stack() requires interrupts to be enabled to avoid triggering
the consistency check in check_lock() for the p2m lock. Add a respective
check. To avoid this check triggering when coming through
spurious_interrupt() requires adding reentrancy protection / handling
there alongside transiently (re-)enabling IRQs.

Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_state()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Check IRQs enabled before calling show_hvm_stack(). Re-base.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1384,22 +1384,40 @@ void smp_send_state_dump(unsigned int cp
  */
 void cf_check spurious_interrupt(struct cpu_user_regs *regs)
 {
+    static DEFINE_PER_CPU(unsigned int, recursed);
+    unsigned int cpu = smp_processor_id();
+
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
      * a request to dump local CPU state or to continue NMI handling).
      * Vectored interrupts are ACKed; spurious interrupts are not.
      */
-    if (apic_isr_read(SPURIOUS_APIC_VECTOR)) {
+    while ( apic_isr_read(SPURIOUS_APIC_VECTOR) )
+    {
         bool is_spurious;
 
+        if ( per_cpu(recursed, cpu)++ )
+            return;
+
         ack_APIC_irq();
         is_spurious = !nmi_check_continuation();
-        if (this_cpu(state_dump_pending)) {
-            this_cpu(state_dump_pending) = false;
+
+        if ( per_cpu(state_dump_pending, cpu) )
+        {
+            per_cpu(state_dump_pending, cpu) = false;
+
+            local_irq_enable();
+
             dump_execstate(regs);
-            is_spurious = false;
+
+            local_irq_disable();
+
+            /* (Ab)use is_spurious to arrange for loop continuation. */
+            is_spurious = per_cpu(recursed, cpu) > 1;
         }
 
+        per_cpu(recursed, cpu) = 0;
+
         if ( !is_spurious )
             return;
     }
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -660,7 +660,9 @@ void show_execution_state(const struct c
     {
         struct vcpu *curr = current;
 
-        if ( is_hvm_vcpu(curr) )
+        if ( !is_hvm_vcpu(curr) )
+            show_guest_stack(curr, regs);
+        else if ( flags & X86_EFLAGS_IF )
         {
             /*
              * Stop interleaving prevention: The necessary P2M lookups
@@ -671,8 +673,6 @@ void show_execution_state(const struct c
             show_hvm_stack(curr, regs);
             return;
         }
-
-        show_guest_stack(curr, regs);
     }
     else
     {

