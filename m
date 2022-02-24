Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4794C2CEB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278291.475483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE7G-0007ti-9g; Thu, 24 Feb 2022 13:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278291.475483; Thu, 24 Feb 2022 13:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE7G-0007rK-5M; Thu, 24 Feb 2022 13:25:06 +0000
Received: by outflank-mailman (input) for mailman id 278291;
 Thu, 24 Feb 2022 13:25:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNE7D-0007q3-UC
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:25:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3d5eaa-9575-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:25:03 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-gj4dPI3HOky1O1Tkms3XBQ-1; Thu, 24 Feb 2022 14:25:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5971.eurprd04.prod.outlook.com (2603:10a6:208:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Thu, 24 Feb
 2022 13:25:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:25:00 +0000
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
X-Inumbo-ID: 2c3d5eaa-9575-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645709102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJj7Nd1zQ5C3uR5AotGLWuOQOjAHBSXWP97Y2JLCbGE=;
	b=aAQfIFptKYIKqGc9PWkCFUJrATvk1gnJ29+7deT9cIYDakXvANus0pRgKTg8iOs4UhysZ1
	EsMfpYtsIIM/BG6P9hdxvX/Zx0mIHcTE468rZ5I7D4ZudFs/E01nuKNcwaVgz8x72v1pa0
	Gs0RWLX1C60bOkYFQm5bVJoLJs3HQWg=
X-MC-Unique: gj4dPI3HOky1O1Tkms3XBQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCOgu/EhVO5gB8Z0g8wfEuDIikrY2SN+Yt3tfCwfxziXFKa2RAeeLHoj2FtnDKkvp7mCc0JkcCGNIUMA62PwARkoq8Pc8XzOEf9nyCgLLVBun7EcgFPgirvtqUC3VvSnQyTmoCMQa/10lOkDAW1UZ3O2Uw1QnrE3K3nD+s2OEXI2AiJzDo/VN3Hw3jf62ZBLM0y+duU+Hm1nI4KMAlZhuLwRoFD1ahKkm3DhrYSZagUsZdi8eY50VDQoK2cKcxjLSu4xyRvivbgw1Tj5XovD9AyelMNOKR0sBKRDvK2A/e5YDHCBwrb8Ik/kiDuDsM/xRgSUf0GXnqdC8QxRDPIh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJj7Nd1zQ5C3uR5AotGLWuOQOjAHBSXWP97Y2JLCbGE=;
 b=BadaGglrufTEw1s7lHHbwtwPce1gtObUFokR8nAC/P1du50v3FsuN+RfjtjfhyoLRJH7BSXcMYQ/QZxpgmoChXa/S80omn9GQ9PU4QBX/NdFr9JtQ3b7ubyxsEEzzFu1dVtUopd7N8FzFjXGtRQ3vXOc6eF4NSOdYk6oVQBGgkgIo1vxsiYlDQ8nH9OBUVLIBtX7albbmhA/NNkhcyeB+xjxgadDeqk0Ft2zLboHDG1Mi1yIx26kO7IO2oH6HntNkdrXUsyR5TY9CdjacShNYm172Rvtv51aGm2EW5lwLGi0u4gWASmtGH3qwG6jFR5wTQbPCwz/TCtlQXTXLi/RrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58f9bf8a-a086-4c23-75d6-f490df2e0718@suse.com>
Date: Thu, 24 Feb 2022 14:24:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 2/2] x86: correct fencing around CLFLUSH
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
In-Reply-To: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a530dd74-bf7a-48e7-8192-08d9f7990eea
X-MS-TrafficTypeDiagnostic: AM0PR04MB5971:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5971B101E10F0095F84794DCB33D9@AM0PR04MB5971.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AFHENVLP144M/g5csPuqyN0DyG93UWW9QiPWDxTWiqJfCCwiXH/lzsWJSJwIwfnMIFMgtUtJptUvCCLXi4wg1nnfJG4kNy+cIEb0s5+7RVXEVsU9eJ5bWc/8xbBy2vP/bX8Xe+BnPgA2SwB/td31OjUsyaeEUOmWtsohgFq7BjZ6LCDk/rRxacbxk86Wi4tmSG5GMHBRd7dOpqBF3tlihOZnQP5u8H1F+V1opkfOLdcDEMw8dLKv1NEO87NjkzqkeDUmrsbYxuCLWEMyPXj+UOyTfsjWsFjulZXMXn5hxtGnP9NjXJA7BvBhEw8ZjH0QK5ifpe/iaGU2hROuDKiMchfjlnFwnPMh6nS76hdYtut2jS/XzLvNuoeUx/ww8ijsDBkIG+o7leKFwrXhbQ/FM/ZYzv4eTQE78gO9zGuH3+an8mopOq2V5AbOZUPmp6A77faNwdkdRiwQlgcXEin69bpf8vyWO2CnXGFwK9KI7MDvIOqyWj5J0OXlbeeACoCgqot6wLvtiWaaNdtIrCr5xuYk7v4WJ6PDOarJEssl0Q/NBef+XCZ5U5va53yrjoWP6p+KRy+KpvcS/N6wjXfAo4MwVxiG8/0bcYB1agRV35FPzY7v0KelZKYQ5gQUENfqrj0hRe/k931oNiFe+j7GMEqoaPiG8mMDkzQYnkqSKqwndIH1UFIsvRxz505LJyWnHuMCWEp+fsKFo1WkModqhNAm0NWU67+D1q5RNkJbbt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(31686004)(86362001)(508600001)(36756003)(6506007)(31696002)(6512007)(38100700002)(8676002)(6916009)(186003)(2906002)(5660300002)(66476007)(316002)(8936002)(26005)(4326008)(2616005)(6486002)(83380400001)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZBZW5BbVRKNldNdTY2bnFaeUZ4cXJMczlBYnByK2F3THFTS3BoRTlWaTRa?=
 =?utf-8?B?UGM2ZmlaNnVISytJZUJOUFdaQmlMbU42RjIwM0xFeDVIdHYrcTFOR3RCdGNt?=
 =?utf-8?B?TWpOb3BmM3liREIzLy9zanlxa0lZY3g0Q0lxUHlxZEx4MU9Ha0lkbDJ5eTk3?=
 =?utf-8?B?U2FrRklwdjcyU3F4S3U1WDhwcEEzTWl4VXBnOHNQSk8vdEZsa2VrZTZSQmkx?=
 =?utf-8?B?RHBGK0h1RDZQRFNZVmUraXdqWlBmaFVtL0VUcXJDVXljVzNJQ3BORVZydUp1?=
 =?utf-8?B?WCtUay84MUhhMTBTRUxVdU15Y3RyM1g3aWp6VUpCMys0ZWozQys0Rks3QjFB?=
 =?utf-8?B?blBLRWxYb0FDVHhpd0dYVkJyZzd2Rk5BdUE5aFQrd1BxaU81b1J2aTU5andD?=
 =?utf-8?B?ZVBIc2hXZExZdkVrQUNRNWhjTTlIcGtxSzhpSUFNZFltT3Nvd0M1bjE3eVhZ?=
 =?utf-8?B?SzBJOFRGSGlHYWVRT0s0L0RLS0RnQlF1TmNWY0E1UWZ4TG1oWWFUOHN0UEZV?=
 =?utf-8?B?eWNZakk1cTRvVkltaGhDVkNFSkRncVdHbFNRVkJidUlDVmppenRKZXh0NWds?=
 =?utf-8?B?V3gzSjFHYUYyMTJJcEp5anEzSFZEVkppR2hScUg1RzEzTjVHcm1qVnBOYitt?=
 =?utf-8?B?OGx0eE03NFVqNXc4Tkl2QndmdHluQUwrOWF5ZnZHcWpMRDdGY0s2VWFwWjlx?=
 =?utf-8?B?RXNFamYyTmYzQVJPWmtqb09uanZ0SDI2ZlBzUmR3RUdRUHAyOEoyUHdGV3h1?=
 =?utf-8?B?NVI5NHZOaFZxR3h4OTVYS1RlM2FCY2VBNDZvUDAyeWNRVDZLeWlVdjh0ejQ4?=
 =?utf-8?B?VHdPODVJQzlzMEVLRzVQeEpSKzV2VktTY3kybzlrQU9EYnMyUG56NGNLQUk3?=
 =?utf-8?B?MnZyd3dIQVAyV0l3ejE3VUNkUUY3Rm8rVVRLNnYxaURsdkxhcUtZQjNHLzNu?=
 =?utf-8?B?WUxvRnMvN045eG0wS2ZMMGJRRTN3NExSaGZwVFRhV1dxQ3UzdHJOaVdDODZO?=
 =?utf-8?B?WGlEUFBLU2Fab3NTeEQvYkdmQzNzaXptNGMyK21ETEpVaHFuL2ZiMVUxOE9G?=
 =?utf-8?B?RUFaS0Q0YlBWSm5YYy9XV3FtcTBKNFpPYTY2UTdVOUlENWFDTmJXVnN0c2ky?=
 =?utf-8?B?M1UzT2xtRERlcVBQeWZYTFI3cEhSa2ZTZnRtQ1U3cE5nWWVrSzBuUDAvdk8y?=
 =?utf-8?B?T3Z5Ykw0Z2kyRzVONUlISHdBck9jb3VHRU5vZ2dCb0p5NnErZnk1RjdZQmJp?=
 =?utf-8?B?MHg5R2JtVGtIOStSeW91bVJoanpmL3VSRGNuV3N1Lyt2Sml2dzdtck9YUnM4?=
 =?utf-8?B?R0lPajk5NTRmb2pQdUpNQjliSDFaeFVUYU9KZitYNDJQemdQTDVEcitPTTdm?=
 =?utf-8?B?a1hmd0ZYMUtzV3UrREFvQ2ZaWkZvOVJmcGNyNFBOY3daMlowWGh2NGQyWTRt?=
 =?utf-8?B?VzJHazh2NnViZEtiM3A3SUVuTjZteGVMZXdhb2QvOEVHZGI3WXljTkdwKzdE?=
 =?utf-8?B?blZNVTYrZTFOVUdXclpiMU1WaTJldVhHWjFBV1U3cnB0YlZBQkhWbGtUdzlC?=
 =?utf-8?B?V2VtcW4rd3Z4blpURVBGOWRYUG5VMW02VjA1by9xSm0xdklKZm8vU0lEZVd4?=
 =?utf-8?B?emRzVlA2bXd5Y2JuSHpxaUZ3Z2dRY1A0MktObk5GMnkzUDFBMXFHS0J1UUJY?=
 =?utf-8?B?aUJYeFRVMHlONHkrbG9IZ0NhMHllc1JJYzB1SVYyMmJKY0xIZDF4OXg3S3RE?=
 =?utf-8?B?Tk8xL3VlNFNDaUVFNjVPUUx3cllGdDhvYWUyNHF0bWFvK2cxZ3B0U3BYcVFw?=
 =?utf-8?B?c0sxTlNvdGlUZ0xLQ2VVWWRVRFpZY0JRRGt0RmtmWC9BTHdMREIvWlgyQXNK?=
 =?utf-8?B?VndUMiswWmpPWFNWVXU4a2dhVHM4enE2c2FLbTFGek9wVnY4MnhRZU5ucSs4?=
 =?utf-8?B?RmpVZUh1WURtMHlRbyt6QXUrUTV1MThLd3BISURsUXF6MzRTckhNM0pKM01O?=
 =?utf-8?B?S1duQWw5UXNzYXVqemVCYzI2SGZMek4vUUdPVDdrWlpORDFVTnc4Ti9iVTMx?=
 =?utf-8?B?REs3YjJqbW5mYmcvRldJVkhWZDVOT2huN2V0dUlWRlgvTVhyV21ud1lhSEsw?=
 =?utf-8?B?Nmk1QnJFVXJxSy9Oa3REN0IzRjM1blVpQ1Eyc2dwWmsvbkxTb3dpd0VScitI?=
 =?utf-8?Q?B/uegxezQzfpEBKHqcNZt+c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a530dd74-bf7a-48e7-8192-08d9f7990eea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:25:00.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+5trbyvSpiWi7KOnqNv7WgLR6c1r78D3tzFDr8uZO14VligxG+lgyQuJiBmmZMZXHuLX3UhFXPf9KMl15/mkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5971

As noted in the context of 3330013e6739 ("VT-d / x86: re-arrange cache
syncing"): While cache_writeback() has the SFENCE on the correct side of
CLFLUSHOPT, flush_area_local() doesn't. While I can't prove it due to
lacking a copy of the old SDM version, I can only assume this placement
was a result of what had been described there originally. In any event
recent versions of the SDM hve been telling us otherwise.

For AMD the situation is more complex: MFENCE is needed ahead and/or
after CLFLUSH when the CPU doesn't also support CLFLUSHOPT. (It's "and"
in the flush_area_local() case, as we cannot know what the caller's
needs are. For cache_writeback() fencing ahead of the flush is
sufficient.)

Fixes: 623c720fc8da3 ("x86: use CLFLUSHOPT when available")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: I'd be okay with not touching cache_writeback(), for only being
     used by VT-d right now.
---
v2: Mark AMD behavior as a bug rather than a feature. Retain quotes.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -761,6 +761,13 @@ static void __init noinline detect_bugs(
 	 */
 	if (!cpu_has_nscb)
 		setup_force_cpu_cap(X86_BUG_NULL_SEG);
+
+	/*
+	 * AMD CPUs not supporting CLFLUSHOPT require MFENCE to serialize
+	 * CLFLUSH against other memory accesses.
+	 */
+	if (!cpu_has_clflushopt)
+		setup_force_cpu_cap(X86_BUG_CLFLUSH_MFENCE);
 }
 
 static void init_amd(struct cpuinfo_x86 *c)
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -245,12 +245,15 @@ unsigned int flush_area_local(const void
              c->x86_clflush_size && c->x86_cache_size && sz &&
              ((sz >> 10) < c->x86_cache_size) )
         {
-            alternative("", "sfence", X86_FEATURE_CLFLUSHOPT);
+            alternative("", "mfence", X86_BUG_CLFLUSH_MFENCE);
             for ( i = 0; i < sz; i += c->x86_clflush_size )
                 alternative_input("ds; clflush %0",
                                   "data16 clflush %0",      /* clflushopt */
                                   X86_FEATURE_CLFLUSHOPT,
                                   "m" (((const char *)va)[i]));
+            alternative_2("",
+                          "sfence", X86_FEATURE_CLFLUSHOPT,
+                          "mfence", X86_BUG_CLFLUSH_MFENCE);
             flags &= ~FLUSH_CACHE;
         }
         else
@@ -274,6 +277,8 @@ void cache_writeback(const void *addr, u
     unsigned int clflush_size = current_cpu_data.x86_clflush_size ?: 16;
     const void *end = addr + size;
 
+    alternative("", "mfence", X86_BUG_CLFLUSH_MFENCE);
+
     addr -= (unsigned long)addr & (clflush_size - 1);
     for ( ; addr < end; addr += clflush_size )
     {
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -47,6 +47,7 @@ XEN_CPUFEATURE(RET_SIMPLE,        X86_SY
 
 #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
 #define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
+#define X86_BUG_CLFLUSH_MFENCE    X86_BUG( 2) /* MFENCE needed to serialize CLFLUSH */
 
 /* Total number of capability words, inc synth and bug words. */
 #define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */


