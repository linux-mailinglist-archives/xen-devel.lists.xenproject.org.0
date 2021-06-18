Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30C3AC8B9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144409.265797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBew-0006Kx-O8; Fri, 18 Jun 2021 10:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144409.265797; Fri, 18 Jun 2021 10:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBew-0006Iw-KP; Fri, 18 Jun 2021 10:23:34 +0000
Received: by outflank-mailman (input) for mailman id 144409;
 Fri, 18 Jun 2021 10:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luBeu-0006Io-Pw
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:23:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c712d297-e757-4cac-9395-80a200201b2a;
 Fri, 18 Jun 2021 10:23:31 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-DXMgaPD9OluqSot4-rIl6A-1;
 Fri, 18 Jun 2021 12:23:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 10:23:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 10:23:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 10:23:26 +0000
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
X-Inumbo-ID: c712d297-e757-4cac-9395-80a200201b2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624011810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=am03MNqDtS9SZU1GGRI1+xD+TyxHlgkohOfTvVtAEEs=;
	b=YovsMkCQXfHQeZH0FxFhejiCgsFhsGxlHVJ/3fwXVgPw+e2eJEBGtuKn47Pb8szKay7Wur
	wbIAC8Pb0vHH4gNo5jOfwRtSTDADUS8kOBbLABFF9FzFvXHjfwGbcaDHo+UalSLT7TmREI
	0XhkkBtxbjJFR7QzxepfG5KQPvKD1UM=
X-MC-Unique: DXMgaPD9OluqSot4-rIl6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiB/hRNMUFVLL4X8PtBjATMaJmhVOiqh6IlIUerfthYw4G/KRXQzFbg4mxNkwM+XWWAv0c0f8i300NwkHgiRFFOvS4pOVFRCAStM+tEYofV7OVgJKbqcvbmvNN9Y+t4gCbQ0ZpirHCv107wek4ywpvz3Uh6HmfCxxt9wzUtsjVKLCa7kcTrQF2wf8boNo60rwU1X1EkKaUW0kFVITouo90xxT3Ubc5vpA0ALLTWCSN/y4oVhaHRepMtwRm2n+dwtwqFtPJtaUugQLrknpqpYbw0nui+DF6KIgKP9S1TOjg8IebED1vzVtO5ghqdLX6/LAUy+mHpe/2ngzDxIAwgiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am03MNqDtS9SZU1GGRI1+xD+TyxHlgkohOfTvVtAEEs=;
 b=m/kQyUHT5UKi6rLD6NVF3IO1yNgRpa3Kc+JxpQLA09BGKsbFiL0K1GEOCwGHLf/wUR1SAzmir7lAI7IiVGpd8kRtj0q08ER6Czxyepq3kZJSX6RkmvQt/m6TZVZK/L/14mfdNgUFivVIwiws4fcYQe1EsGFhVId5jjG71VTCVANAecpJuvph3MSiDbt31TiCcTkFs5WGBhYGxIcvjOIJPblerZvvYXNelku+b/gIJV29vJrXKLP5BHyIxc31AatPUphlPnspVtMxuPYq2aiC/chveOUkR0xb3CEIEqiUJRFbj9KS5nsS85u4hXcl11+9iOCsAy6kjbPJT1unwn0GGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/5] x86/HVM: wire up multicalls
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Message-ID: <c3c5df61-32f8-1ffa-aac4-0c83d620d385@suse.com>
Date: Fri, 18 Jun 2021 12:23:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667b54ce-321f-4e77-ea13-08d932431c26
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68646CE29D933180C12C150AB30D9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SpKeuOYxzfWL62z6QrSobIJ/O7wHY9N7AZJFcj9SQo1yax1TymzwOPOnf0CzhZ75ukxYu366tvF7pSJtQl6EVdGoeHtWbDsJMxgvyT52kjdZoO7IuaBrGVzt72v8j8+Jg5/VZfW+pV+/EWIgsY2XoPDRxFY8VUXcxsRGDY4guPaPzyPediZuERst5aO4NTTL8jnSSYvSUetazwdkEX3TsaBXvzMet7Hf7CuJJz4IpPQycB1LXQsw+WNjfoeLTs2O0tSzAka+IGu7oLlFu/KE4MJr3B9sgMBb2+gUEeA50N89pcqFs4SB+bs7aoXU6aRRRNrw6oqF4EmPlvFbAkCiLiI0ou8OjFG3Ut4uQX2RGAHryvIhp8rNnpFN1oUlXlOc7W0ZiOJ0s8WVzhP6Kb6d/jeuVDgzdiSf/vi2pn2E0Y1BY5gMe4QkObqXOJIRFGkbgRo/Vi1A5cD6EQB7wFCz1HJJdVfIQYpIjBWQRGMwmAk9H+8mp3Nkua254X9osZGSyAifOnW2tLAqsQ4HkWrYviq7jILADectC9MHRnG2WA8uMQ9biTVoWsnQfgJ92cVhwu2tUqBBJyM5kUnU3QyW/PtpF1EQ1Ojv5nzkcoP3iy58yGagx6TLpSFv6mNLmXPoa+7aWRSb16MgDlWmSteR3GZbk4cbpxmUaiy0IbGMtBBCodI/M/JSodRTNiEnrtXs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(2616005)(956004)(83380400001)(66946007)(66476007)(66556008)(6486002)(316002)(26005)(186003)(6916009)(16526019)(478600001)(54906003)(16576012)(107886003)(31686004)(38100700002)(2906002)(8936002)(8676002)(4326008)(31696002)(86362001)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0FWdUR1R1Nyd0pBNllKdEowM1o1SllXNGp3V29OeWFLQmV3VkRhcnd6cHQ3?=
 =?utf-8?B?SzRDUzZHeXpGbWs3NE9TR0MzalZ2STREc1JKVXlVOVlUYnI5ci9sU01sR3g0?=
 =?utf-8?B?SncwZlBXdDY0UXhQZFp3M3h4VUxhUlhOYWRVQzZ2UXBEcHFyaGY3N2N1MWlq?=
 =?utf-8?B?NFdiSWhSNVlZWnA3YnM1aWY0UjBPUkFiQlRrdXBZei9DZURiODNSZWQvcG5Y?=
 =?utf-8?B?UWR1dXdSMWt6TVVCak9jUHBLN1p1blRlWXFzR3pNdkM4YTZhU1ExaDQ0NHdp?=
 =?utf-8?B?NG1DOE14dmNuUE9VQjVjaHhmNmo1ekRaZlNqdHlBbFlaQUdvR1hEMnFyZml4?=
 =?utf-8?B?WHovSWdraTNjajVJLy81UDNSN0NQTTdEL3NRZ3AxamFiYmVlTkNDSHljbUlR?=
 =?utf-8?B?STVpR3pCUHZWT3pWVm1ZYTVCbzdNN25LR2pZclQ4TWJzQkJmVUx3RnlYeTA0?=
 =?utf-8?B?TmV5dnR4bDA3WnZtTmlBelFvWmJMMzZpampCSU1yS3NSR1YzanhqREJFMFV4?=
 =?utf-8?B?cWlISC9ybXFxV0tQbHFDdUpPM2Fob0NWWWtURFFmOWc4TGl5MXdGWDI0cVNW?=
 =?utf-8?B?ZzJJT0hjNVZQanh4Lzk1aWZ3VVNjZWFkbS90RTg4enRTRUFGcS8vUWJRQW03?=
 =?utf-8?B?RUZ4VkFnKzFDK1VQZnpabmFLZm14SWFaSmtoMUFwbFUzdTlNcm01dzJFUnpr?=
 =?utf-8?B?YVRzNHFQUlFVUHhoZXJWRW4zczczUTdzN2hxYjdzbk5uUHdHdWNaYWY3RHhu?=
 =?utf-8?B?c2NBUE8waXpVeXNESVdlZk1IUE80ZldqU0EyLzA5UHZqOE5sTFJob0V6b001?=
 =?utf-8?B?Z29oZXMyZHJONjd0dTZRMlRsRUFTNHROL0ZMcmNlejEvWHFLSlh4OXdhdk9O?=
 =?utf-8?B?RkhNeDBXOTE4dUEyOVFnOGV5SzhPZ08wcFBVWmRxYmwvbEJER2pTQW52MVRO?=
 =?utf-8?B?b1NsbnhiQmFvME1IVTJTSEJpSkE5UWZiWDhTaXRkajJGUzdhYWpnNXdNTEtV?=
 =?utf-8?B?c2d5dWhvejU5UEE1L3R6SWp1TytTdENuWURVMnRkVmpUc25SckQ3eC9GTUd1?=
 =?utf-8?B?WjZhZUVsN2E2WUtRZENSQmhWdXJXWVBmNllRb1dSWEhSSmk3N3JvVWNReWlv?=
 =?utf-8?B?aDdXdHBMbEJYUE9KTUJEUUMrNGJBNEJhSFArS3ZJTEhSa0d3ZjdUa1BmOXVP?=
 =?utf-8?B?U2IxOFl5dUx5anVWdmdiVUhVTDluSnBwUkdLcVh4R21PUTdkS2poM2UzTEVG?=
 =?utf-8?B?Nkpid29rVE1ncEtiemRtTXFpbFFHbUhPbTVrbCtyUndxV1VZQlJlM0QzdjlH?=
 =?utf-8?B?OHRnbkRSSkM4bEg4Q0E1dzd5eDhGc2UxYy8zVnlmSFF2bUtsVHJuSnB0LzZQ?=
 =?utf-8?B?VkxuaFZ6eU5CTGFpeEwzS2Z1VE1UNzBRWllaMG5wVW9Ec1dhODZvODM1TzB2?=
 =?utf-8?B?QmU2NVMxS2Q0cHgzMlhnRjRLRStIRC9QZC9nTmNRb21lamZnNnJJbXBDYnk0?=
 =?utf-8?B?YTU5ZVkwb1hXRkw2bi9FTmd4b2VpdlkvQkx6NzdKUlBHc1NGbWIzNFc0Qmdp?=
 =?utf-8?B?VjRNSllOOS8vZ2FEeWpUQm9SWFlUYllFTlExSExuSkMwZnZKOUNZSUFQNnRt?=
 =?utf-8?B?bUY3dVdtcVJSc2YrK0YvOEI2Ry83SDAwOUJUR01ja053MmU5TGIrczl3YzR6?=
 =?utf-8?B?SWlJWjNwY2JQRmptZEtJVjQ2SG9MRnFURVA5YWNuVloxR1M1alhpTEhIUDIy?=
 =?utf-8?Q?tuSGY4iwz2cFeN/bEiKG+9cu8WuV++V8VI+N/7D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667b54ce-321f-4e77-ea13-08d932431c26
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:23:26.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWuUAzJ6QklGopWelo6pGPVxxX6Yi3uzwXqndQk13mLUTSwVVju5QqlIRWxGnOW1VwYDNP47XWGlDVrj06v4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

To be able to use them from, in particular, the tool stack, they need to
be supported for all guest types. Note that xc_resource_op() already
does, so would not work without this on PVH Dom0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/viridian.h>
+#include <asm/multicall.h>
 
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
@@ -125,6 +126,7 @@ static const struct {
     hypercall_fn_t *native, *compat;
 } hvm_hypercall_table[] = {
     HVM_CALL(memory_op),
+    COMPAT_CALL(multicall),
 #ifdef CONFIG_GRANT_TABLE
     HVM_CALL(grant_table_op),
 #endif
@@ -334,6 +336,39 @@ int hvm_hypercall(struct cpu_user_regs *
     return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
 
+enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
+{
+    struct vcpu *curr = current;
+    hypercall_fn_t *func = NULL;
+
+    if ( hvm_guest_x86_mode(curr) == 8 )
+    {
+        struct multicall_entry *call = &state->call;
+
+        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
+            func = array_access_nospec(hvm_hypercall_table, call->op).native;
+        if ( func )
+            call->result = func(call->args[0], call->args[1], call->args[2],
+                                call->args[3], call->args[4], call->args[5]);
+        else
+            call->result = -ENOSYS;
+    }
+    else
+    {
+        struct compat_multicall_entry *call = &state->compat_call;
+
+        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
+            func = array_access_nospec(hvm_hypercall_table, call->op).compat;
+        if ( func )
+            call->result = func(call->args[0], call->args[1], call->args[2],
+                                call->args[3], call->args[4], call->args[5]);
+        else
+            call->result = -ENOSYS;
+    }
+
+    return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/hypercall.h>
+#include <asm/multicall.h>
 
 #ifdef CONFIG_COMPAT
 #define ARGS(x, n)                              \
@@ -273,13 +274,18 @@ int hypercall_xlat_continuation(unsigned
     return rc;
 }
 
-#ifndef CONFIG_PV
-/* Stub for arch_do_multicall_call */
-enum mc_disposition arch_do_multicall_call(struct mc_state *mc)
+enum mc_disposition arch_do_multicall_call(struct mc_state *state)
 {
+    const struct domain *currd = current->domain;
+
+    if ( is_pv_domain(currd) )
+        return pv_do_multicall_call(state);
+
+    if ( is_hvm_domain(currd) )
+        return hvm_do_multicall_call(state);
+
     return mc_exit;
 }
-#endif
 
 /*
  * Local variables:
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -23,6 +23,7 @@
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 #include <xen/trace.h>
+#include <asm/multicall.h>
 #include <irq_vectors.h>
 
 #ifdef CONFIG_PV32
@@ -245,7 +246,7 @@ void pv_hypercall(struct cpu_user_regs *
     perfc_incr(hypercalls);
 }
 
-enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+enum mc_disposition pv_do_multicall_call(struct mc_state *state)
 {
     struct vcpu *curr = current;
     unsigned long op;
--- /dev/null
+++ b/xen/include/asm-x86/multicall.h
@@ -0,0 +1,12 @@
+/******************************************************************************
+ * asm-x86/multicall.h
+ */
+
+#ifndef __ASM_X86_MULTICALL_H__
+#define __ASM_X86_MULTICALL_H__
+
+#include <xen/multicall.h>
+
+typeof(arch_do_multicall_call) pv_do_multicall_call, hvm_do_multicall_call;
+
+#endif /* __ASM_X86_MULTICALL_H__ */


