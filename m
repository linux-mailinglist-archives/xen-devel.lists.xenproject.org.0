Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155449B61A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260387.449774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMiS-0007UH-Du; Tue, 25 Jan 2022 14:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260387.449774; Tue, 25 Jan 2022 14:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMiS-0007Rm-9X; Tue, 25 Jan 2022 14:22:36 +0000
Received: by outflank-mailman (input) for mailman id 260387;
 Tue, 25 Jan 2022 14:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCMiQ-0007Rg-NL
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:22:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ca0d467-7dea-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:22:06 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-qjj0Z2mvM-SDXL8xRuBWJw-1; Tue, 25 Jan 2022 15:22:29 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by VI1PR04MB5134.eurprd04.prod.outlook.com (2603:10a6:803:5f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 14:22:26 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 14:22:26 +0000
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
X-Inumbo-ID: 2ca0d467-7dea-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643120550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLQMT3WnOIoEUw8dj+QiEsTiqBxuwTOTHtGRBseB2LY=;
	b=U6K00aZ69YbOcPisn/cuygaIgqrtcm0mBEYRkP33FeIcLh9DQSGviIDQH8435INVEbl/rB
	o0Q7o7z0qJ6akCzhpzhVJgZobf5Ff23QK+RESsbjnd3V8PwbB8y78KgLekHxM+QcEhH702
	jIYRU9U3XB10Ap8X6s+36XnKKcu2Nso=
X-MC-Unique: qjj0Z2mvM-SDXL8xRuBWJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhEQH8iA9effLCxIL0eqwzSVD14ergBLVyvdRp/GT/k5PYCqn690vVjyUeqN5rWMH8fF0oCPZxR3n5iep9+h6g1NRu4nlgakAxqS13SJ8N6jyM2qrbYIX0NIMy5zY8qRKYir4baTa+dHiWTeqQMFnLwGK2zenqOsXMObZVyyP3h9ga1VgpUliQMCVtznIT2LuFWm/D1QROP3DtGSYtWYoW3ycbJh3UTHiWqfSNQCYDkFtoW9yajszXWuFCMWFFvY1ZZxttOeWNrkP5E7rVa2B7yG5Mi9EopVcspg7QC/kpl45faBuaH6zBuokXkAsBezpjti0cE7N/K9JnbDXhnbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLQMT3WnOIoEUw8dj+QiEsTiqBxuwTOTHtGRBseB2LY=;
 b=bPFxKRJwrD5EUeXkBktgVSDPMZg5tm/sLd2IOj+ZtzTOeLdPgINM4aNYkxE78vlKtK7Lx5LRpQ26IX2AuDflhzYyqK7bFleF8DeUmZlvPtzWBv0YNnbY7DCgEIgCOFXBi0jnhGpF5uF67hH+Bj/N/8g3C8EcYAnY30lf1QD0eRXzk/BNlroAqT2MkTpyUBQxKEVGBUQbouVQBNgGESJ28GZgO2I9pX2ANowWcAifwn5wwMs+OTpBzetxLnU3NTnBTDt54yX86m9YOHeC++SrWakoSw7+6kTEf60bC/4xWzaL1NpawzapXCXYVwbERJZpZpTXDoFVIq7NkAfBy5bnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
Date: Tue, 25 Jan 2022 15:22:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: recognize CLDEMOTE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::24) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667e6e99-4f81-47f5-c29b-08d9e00e1ca4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5134:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5134493B9A2E4C55CE3CA18FB35F9@VI1PR04MB5134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fEnx4jJZPYTJICHhwfhkATxqeVTW+Cw7Zx+Gt3hbHhe4sf967p90rhF2Py7a4Go+SxemGZODX+W7Xl9081A5wZm1QhfVrL3/qSI+ktpe5XcFqVdAy3Rc2C5l1LWvIrN1MqoemdoFpOx0frHjGvgeIn0BAExGSqkT7nWbWJgbOkJA6DvJt/FcHYwHcMoqgwA/BuMg09ChOrIkmx8dtT5AaMsdVYd8l5YPDVX8LHqMjZWTFb9QrDcfY+euDTBsO4SoNJFO4P+dPG4BQkSvQdBVgJWD1lalvDGFTTQxbMZnMhbEECylGjEvsvY8MK5s6m6xFmJV6P9GbW3XD2fdp54+8PTAUHjBvPA5y9wj4IFcjmB2mApkKHkVQo/o0cxtpKvklma3Jq+HS79FaMTyj2yFeadKWy2oZsdREQTRMTL+aGTf9QU8jWd27mVqy9N1n7nLSImSpw4GgbLJMRqORg4s8eg7xTNNg/g1ek6k9c/9zFixa7luwrMYIGGJ9WPkkzdtJdzGCn89JYQRqZEpbLIW2Vhi4QUkryfG1nlfmWUeHowJJ7MWES/pjQNcGBKv0SDxFvxPm3EpWiAjEAqeDxWu4kORDAiURDMblyhQQcmlOoMN1PIvlr8S7a4jMlQfTtUHHHX0r2a7qAnez4ftc8y7iefjZnCAkVo8PMJ26occ4KfQjgAo/Js8CCnfBCVfmS7YTvLjslh+HTqGGu3ORdZ6lmDzJUkJrNJcknnryk9TWcWHhYro1g/DMph5xOmfEpNA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(54906003)(86362001)(186003)(8936002)(2616005)(31696002)(6916009)(2906002)(8676002)(83380400001)(36756003)(6486002)(66556008)(6506007)(26005)(508600001)(66476007)(66946007)(38100700002)(31686004)(5660300002)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHYvZUpMVFllK0VucDJqREQ3bytGWURhRENXU0xVamMzVkV4dzU3cUY0c2xR?=
 =?utf-8?B?MEVCWDU5ME1DUy9na3JzRVJxYmM2OXpQSzNRZ0pNNVZMbDJHaUowSmZOb2Yx?=
 =?utf-8?B?Y3B1aXJrU21vOTV3R1hDKzdGcUhLSmxCSWpGTXJmV0t4cHQvNGZLdVc0aG54?=
 =?utf-8?B?RmNFNkFuL2gxTTJUQWVVRDJxSkZSNzdSbVVpYkhTMEFlVXV1YTNFamc3N0do?=
 =?utf-8?B?QjhYTVJkbk5pcmlnUzk0NzJyaTQ2Y0Z5bElWOERsYUV4eXdtSWFiT1FMNmJ4?=
 =?utf-8?B?YVJIcDRjbnRIaWhrbWQ5NHdFanA0QzdFUHRWU1pSMVYwTXVrNTNkVU5NZ0lK?=
 =?utf-8?B?T2xnZmVuQmcvZGFFQWdSSEtKRkdrNE1qRStSdVFWYkEwQjNxdHdSMHAvWGRh?=
 =?utf-8?B?c3Z5TFRaS1dHWnFucVZKaDVoUEQ3cS9PL2Rtc2FJZ0d0TTJwNjVvUXhQSmFH?=
 =?utf-8?B?a1g1c1Z1a0wxZXE2YXZ1Z042NEpVdDN3U3JQUnRZd2x0dmp5VG15WEc5MjBH?=
 =?utf-8?B?TGUzOG5Gc3BNanU1VjhQaGlMdVNKRlU5MmN0akhWa3RqNG9CZkNrNzFyaHRS?=
 =?utf-8?B?UlQ3M2Z4L21OMklGOGh1SVplRHNqR01aUXYxMUlYQ3VETFNONlJ6QXBiOTlw?=
 =?utf-8?B?ZncxZ09xR0tXbS9Sa1dWTElXWUUrVXV6MENiLzlnM3FLVW9ISjRHOWR1dWxq?=
 =?utf-8?B?MkcxRC9MTFYwTkVKc2tPYkRsSzNMZE84VVI5a0E1cFVHWjFibDQ5SDhVZGtI?=
 =?utf-8?B?d3Z3MTlzejlxdW14MGhReHVIbGNtYU1WdWMrbGQxUGVGTDVaMnM3cVpZbVpR?=
 =?utf-8?B?MkNNNFlCdE90cHBpSk9GakQ4RzZyZlh4NE9YUFIvMUhJdFUyL3N4ZEhXOUJw?=
 =?utf-8?B?empuVGNEa2ZERVpidDcvZTY0c1lKam41MU1zNDVpUmJvUXNQNERpbm5VUEM4?=
 =?utf-8?B?YnM0QnVFQ0NNcWtjMXp0d0ZSc0Izek02WlYxY3ZodURSSEhCZlREekYxYVBp?=
 =?utf-8?B?bHdXOWJNTGNlSGxYTCtzdVBQKzNnUnUycVl2R0MrRU8rV0pMVVJEQVNFNlBT?=
 =?utf-8?B?cVEyeFNnODdBYnk0K1lVSTd2TlQzUjVBTkwrMmtad2FPWEdXN3g1ZU5XT3Fh?=
 =?utf-8?B?MjkvaW4reGhtMnBncUpOOWZCVkZxajhZZ3pGUmQ5RUpCcHZFL2MyNWQ0aTZS?=
 =?utf-8?B?eitEQTdGOGxIVDV1RU5kZFUxZzlPa2M4WTBzQndwK3lxbkNmU0ZnSDhVaXc2?=
 =?utf-8?B?MUpLZzV1MVhTNVI2TFRRbmJCNmg1Mk41RWZ2VStqT0J0Tm4vZHpsOFlGOHE3?=
 =?utf-8?B?OGJBMTJFQWRMeG1zRmhlK2h2WkQrVlROM1p6eU5HTFNZeWhMYnQ4SC9lRHlm?=
 =?utf-8?B?QVQyUUdicFBtMVZtUE5IQWVQam1meGdCZzFuTWV0aGk0VTBNUWpRVVAyVWxE?=
 =?utf-8?B?WG5SakdvaHlHbXcwTnl2MStQYUxDVWNKaHV0TlMvenhoLzlQaUdTOEY5eXZ6?=
 =?utf-8?B?ZmtHaDRxazFwVmxXY2t6bm45NEl5MTkva2plRjBKNWZ4dVc4dlBNRkxiRGhu?=
 =?utf-8?B?K1prMFBGVFdIS3BOV1NIVnUydnFVdHZ2aHloYWlBOEs5ZEVTY2lsSUNkUEkr?=
 =?utf-8?B?RHJDckdEYXcrOFVveDkzMTMzc21nYmtBK3VwS3RUTlBGT0IwSm1uQ2U1Um5K?=
 =?utf-8?B?WWsxUVNlRHVVYWJ1WkJOblNHekJSYzJqWk9EWTMzYytRa1N1UHZJc2xUYW9D?=
 =?utf-8?B?ZEp6citYMFlmbGxodVRNdUJGd2xXSHlIR3Vabjd3ZjAwS05jRmhieXIrOVdp?=
 =?utf-8?B?dG5xRmhCN2VEcHZ4SDBJRlZ2TTJYREU2NG5nWTNlY2ZWK0NUMTBxUU9Va3or?=
 =?utf-8?B?ZEwyalJmUkVuU0hTaDZHY0U5a1E5V3UyNEtLVjhKd0tMaHZKelhqZG80N0VF?=
 =?utf-8?B?enNZWjRJZmloL3pURWhPQUlQR0pBSGhhM1l0cWVLa2l2aFdqSXAybVNWNmVo?=
 =?utf-8?B?VDJrNlVYZU10dmo1YU5sQkNsSXphWVlrQWhQcTBzMmx1MCtJU1hwbWMwRXFr?=
 =?utf-8?B?RVYvU0hkUFFsalVXd1hhZHlsdE81KzdRTVRod0lYOXVkRk05MUVjbllxcnpP?=
 =?utf-8?B?NEkvUE1SMGFmNUV1TzhCOStHejJHU0ludU9hcTJhOU5EbUJpenFHSDVwbDZF?=
 =?utf-8?Q?LKsn/yeT68rb0PhK+LBfzfY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667e6e99-4f81-47f5-c29b-08d9e00e1ca4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:22:26.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYtwU/yWDlJFpq+qkC0xSHc3fVjzIM/nVP24KHXiNen8o/sVSnruCmwUcmvxl9YZkTqkXd9JyLtioaeZ8xWroA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5134

We claim to support the insn, but so far the emulator has been handling
it as a NOP.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While handling x86emul_cldemote separately in hvmemul_cache_op() means
to carry some redundant code, folding it with CLFLUSH{,OPT} / CLWB
didn't seem very attractive either.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -23,6 +23,7 @@ $(call as-option-add,CFLAGS,CC,"xsaveopt
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
 $(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
+$(call as-option-add,CFLAGS,CC,"cldemote (%rax)",-DHAVE_AS_CLDEMOTE)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2351,6 +2351,28 @@ static int hvmemul_cache_op(
          * to be sensibly used is in (virtualization unaware) firmware.
          */
         break;
+
+    case x86emul_cldemote:
+        ASSERT(!is_x86_system_segment(seg));
+
+        if ( !boot_cpu_has(X86_FEATURE_CLDEMOTE) ||
+             hvmemul_virtual_to_linear(seg, offset, 0, NULL, hvm_access_none,
+                                       hvmemul_ctxt, &addr) != X86EMUL_OKAY )
+            break;
+
+        if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
+            pfec |= PFEC_user_mode;
+
+        mapping = hvmemul_map_linear_addr(addr, 0, pfec, hvmemul_ctxt);
+        if ( mapping == ERR_PTR(~X86EMUL_EXCEPTION) )
+            x86_emul_reset_event(&hvmemul_ctxt->ctxt);
+        if ( IS_ERR_OR_NULL(mapping) )
+            break;
+
+        cldemote(mapping);
+
+        hvmemul_unmap_linear_addr(mapping, addr, 0, hvmemul_ctxt);
+        break;
     }
 
     return X86EMUL_OKAY;
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -37,6 +37,16 @@ static inline void clwb(const void *p)
 #endif
 }
 
+static inline void cldemote(const void *p)
+{
+#if defined(HAVE_AS_CLDEMOTE)
+    asm volatile ( "cldemote %0" :: "m" (*(const char *)p) );
+#else
+    asm volatile ( ".byte 0x0f, 0x1c, 0x02"
+                   :: "d" (p), "m" (*(const char *)p) );
+#endif
+}
+
 #define xchg(ptr,v) \
     ((__typeof__(*(ptr)))__xchg((unsigned long)(v),(ptr),sizeof(*(ptr))))
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6290,7 +6290,8 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x0d): /* GrpP (prefetch) */
     case X86EMUL_OPC(0x0f, 0x18): /* Grp16 (prefetch/nop) */
-    case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
+    case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1b): /* nop */
+    case X86EMUL_OPC(0x0f, 0x1d) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
         break;
 
 #ifndef X86EMUL_NO_MMX
@@ -6627,6 +6628,12 @@ x86_emulate(
 
 #endif /* !X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC(0x0f, 0x1c): /* cldemote / nop */
+        if ( ctxt->cpuid->feat.cldemote && !vex.pfx && !modrm_reg &&
+             ops->cache_op )
+            ops->cache_op(x86emul_cldemote, ea.mem.seg, ea.mem.off, ctxt);
+        break;
+
     case X86EMUL_OPC(0x0f, 0x20): /* mov cr,reg */
     case X86EMUL_OPC(0x0f, 0x21): /* mov dr,reg */
     case X86EMUL_OPC(0x0f, 0x22): /* mov reg,cr */
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -177,6 +177,7 @@ enum x86_emulate_fpu_type {
 };
 
 enum x86emul_cache_op {
+    x86emul_cldemote,
     x86emul_clflush,
     x86emul_clflushopt,
     x86emul_clwb,


