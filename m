Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC76603ACA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425540.673429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3g6-0002S6-Dg; Wed, 19 Oct 2022 07:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425540.673429; Wed, 19 Oct 2022 07:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3g6-0002QI-AQ; Wed, 19 Oct 2022 07:39:50 +0000
Received: by outflank-mailman (input) for mailman id 425540;
 Wed, 19 Oct 2022 07:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3g4-0002QA-7X
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:39:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3452a975-4f81-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:39:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:39:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:39:45 +0000
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
X-Inumbo-ID: 3452a975-4f81-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6w6YLJXixG32gp7MkVWn1pFNyYczIDI8Iv8Y0ZCFl4M65GaATiaQUIGNN4Iung/wCv8sCYKmNVu644auOAiYcYuSNsTD3d5nMacOO1dsiUsiNkyCiS/VMfPf3Ma325x1I+OKwDgXblwv0aXvxSfsdI/OT8HsMKhEWIchtiNrz9Qm2TqMOTML4fds1mX7iZwl01+nszeBRnuZkw4ZGWjc9pvB0PnjKE4JJWd4aX2y9ifgmnZY2OGbpC+B8LqljiOy/0iiUDXdBLgIcwokMyT2KxsALHrtfTK6y1T0eYCLRrwmtQktmhM4aLTLUvh80JVJMD6ncYaUtRMaAxy7wL4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS+Ir87A7hMdS05pA5lIP70EV6ArkjcWoo9W2xzsvTE=;
 b=So1NOtATYJVmtiRge2gk5MynRXMX4dLUSk9JmBzBOS9sZLA5D1NnPCmauB2Mh+kXIfl/UxhbcpazrvP0B2KoabxaQ8+qcVZtfhmkJmD0g4USJ2DKNyuXlyKOTDrldlqai4b2nESU71gDi+GfGqEZxMEYprwHKs+ZxYj4/hINW7mxIgO8jWlB/WCUvAW/XgIYA5vqIBmmKMYqKx/TlPdBnk3NPYYe38hWC1pbRUuIz2cqBA8+wTcZAyGAZIb+ytUCUCSDymLU7zFSRNJzoymjCTYh0RNFBrCUFerOGM6H92gL9GebLlseEhVGZN006pYlyyb5k1GVfhp7LzbGNDQWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NS+Ir87A7hMdS05pA5lIP70EV6ArkjcWoo9W2xzsvTE=;
 b=wBQgNm+QtaOUJF79pfjWM9mpl0Tho6x2fpCWe/JlLu6xGVjNw+wL13LbtEFenLbrmJEsXTqsS8DL2gJiSXkpTQBtu1WhJhUgJzL6gI9iqih+tg4bVj1o/H9q65sI2VLtOCc+SDBH77/C33aMKUyaEdon8KlyZsKLkVJQZsu8ieMySkPYj1OQbEht3bqoQxVk7qvwTd06tD6GW1do6vAXkfHWU6RKfEO3AACz4eALd6aKdsVfVBa3JXL46hjVLuA9uMrPDnDuLiJImRWK1EMqA1Eal6Aavk4ieng3D+ebU+W6sK9VNMTXbzzXc5nW5XG/lnt9WghC5weCWCmDEATxtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ff84ed1-8143-15c2-2b4a-3ae8ef23677c@suse.com>
Date: Wed, 19 Oct 2022 09:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH 02/10] x86: split populating of struct vcpu_time_info into a
 separate function
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5e30ed-1ee7-4ea8-56cd-08dab1a517ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FXsLKYJshS7GEnqLwf3tWxbapiQJw5SH9CV7KNtJNmrfum7Z8yjghnpOdfay2n4Kn1KZL/rEx5fxrzZytbufIg0KvKzgLp+6+6l1lCKetYc7GCHLwCZ/1a57UXsdZf7fUgjYlbCzDos9DqEQW2F+wAmq1nxYRyINjIOxCC/tdbMprynjqkQW61VGbNdbtSFkP07lsnBlm6JwFoinoocDJDQQ97uxn95kuWMXCxezb/qm4yBEPmdjYUYIC5VUOWyuFkuneFEAaUM+R79WOpjeu4Hu+Z9pDi91bcxh7Z37m0oZOTvKrX6IWSBqaaaDJtDlC2+t21/kq8wl+IgL7jNe/Xi2MO+Pk1ma19WP7aOmavHWWdk9ZQRx4dkHHHZyZDeVYy+UxEgazP+YAi1t7JBOfe8is3ysHJeiMZVnbjWgBphYHGUV6vrBacz5dWxRmb45q5jelJrL4G5AA+A7tjpEaQTttRLu+YK8iS6aqMM5Ey+8oNeB1MLN1lo3AIb7R+KZWVgMlx8WzER5mjfF8LsD1b7kAiegcjzqoadkQ5OgcUv+gPrh/7h7IW5og9VsoyU3c+HZjb/ELEhn41QkugJ3OxL+Ua97SoKXc8L9KmvruUmnQ9oB6t61AgEB6kqcen/BqemKczhktF3T9CPQNM8iRPznTUcRnM30IfamLR+GReEKN809lVgJlIABVRIwXUqVF96pBgsFJadiE61MuOA66ES8L0WmBpF0kN0wsb6+iUkBViIa/FDffmuZ208VkKfblsOahy9BqTITBKwBDL0z9prAuAnJLNAfkcP8y7MKJt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(41300700001)(2906002)(5660300002)(31686004)(8936002)(316002)(6916009)(54906003)(6506007)(478600001)(6666004)(66476007)(66946007)(6486002)(4326008)(8676002)(36756003)(66556008)(38100700002)(31696002)(86362001)(26005)(83380400001)(6512007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a21lMWZkWDZLRTBlYW1ZdEQzTkppQTJBZkcwUmV6aFcwOEZYVTZZY3dnRzZn?=
 =?utf-8?B?NGFWV0dFRHcrVVc0SjJjTlJMUGtxYmNXUy9OTkkrQ2d4N3p1Ykt2Ujd3aGp3?=
 =?utf-8?B?ZEttNDNwZUg1U2FpeGlPMTczYW95a2JsNkNtQlZaZXVUY0ppV0dySlZwVG8v?=
 =?utf-8?B?amlTOWxiT3VFZ09ramt4c0E0TkxGeWxzUnRJeGwrU0M1bEpxNmtIejRQcVpG?=
 =?utf-8?B?NWpXeUJXOGN6RFczeWtvYnlEVnJxY05yNHVYdUROSnNOdVFUUzNRaTFhQzNa?=
 =?utf-8?B?VmVYLzNhbGRnekxtTThMUWt1d1FzT04vRlRwbkFCUVlEMmhMWXdZeWdxRWRz?=
 =?utf-8?B?QmFrZlhRRGRua2dHUnl6V3JGUDNnZm91YzJ2Vi9LSXQvUHg3Q25oN25RdXRq?=
 =?utf-8?B?QjBYdUlreFhheUt2YjJyV3JTRFJIbjZZMkNGY1ByV2FiTFpUL1hQV09zS3Ar?=
 =?utf-8?B?NWJFeTRZS1RTd0VWRE8ycm54M2RZbXI1bWs3TmtscXUzQ3JSYWFkay9uWHNQ?=
 =?utf-8?B?ZGc2SkpVVmRVZmYwUklrenUwTmlYNk1kN1hIZDVIVElFNFVMRW53MlFzM3pY?=
 =?utf-8?B?dWV0VmtLTXRlMVdxUGN6RU1BRkFIS0VidlVpemhTNFFJQmMzOFNYV0lQdk1u?=
 =?utf-8?B?ckV4cktKcVlNWG53Z2o0cVhzMEVkSlkvZUVtRTBoQU9ZWklqWDQvcUx0VVNG?=
 =?utf-8?B?c2w4L1BZYnd1c1ZKMXQ2V1ZxNVJFakR0Rm5ncWRvMUxZaTEvYmQzL09PTTJN?=
 =?utf-8?B?cVRaMWw2Vy9yemNqS0REOU1XYW5YeGxkN1ViRmpYKzljNHhBdFJldnBISEQy?=
 =?utf-8?B?Nlc4dnY2eWs5eE5MVEtkREl0K3Fvd1NiVUgzNmpOY3RidDhBU01pcU9mZ21R?=
 =?utf-8?B?Z205ajRsc0FlT1VOdk9rbENnWkg5eDJxZ1NZeThsUnI0TjVpb2ZndFZRQ0tv?=
 =?utf-8?B?ZW1FdUYrbk9GT1dWTGxjR0Fybnd2TjJFVjVyeTEzQVh0aTFZT0dUZW0yT1Js?=
 =?utf-8?B?MUVWSnhwMC9COHN5WSt4RHJuTFBxeHZBc2cxWWorSlB2UjBoWmNoZkE0QjVY?=
 =?utf-8?B?ZjNNR3YvajdQQXpHWC9STlBEQ0MvRmdtMXJJUitTYWhJUXlka1YwZ2l4Uk9P?=
 =?utf-8?B?UEZVbnVqVTBvUWVia2poV3MyeGhDVDZTai9sSER6ODkvNjNtZ2wyUjFBdGNC?=
 =?utf-8?B?VzYrU2pQc1BWbS8yc3l4a1Q3N3VEOXVhVGNGNEUrelFnK3dnaE1DcGd5K1ZP?=
 =?utf-8?B?Z1hTVEc3bll6TFAweStBbHZuQkN6Nm5KQ01nUEMrV0lVK2p0Y2lEdUxjMml4?=
 =?utf-8?B?TGNBekhIT0U5NTl5YmFkbGJBNk9GQUQwTUtyTHkwSlFpSlQwejk3aUNiNkNp?=
 =?utf-8?B?UEdxR2FSdThxdEFsbUlLMkE1Y1BqbTd5Q3NLb3FXa1EyTUlCZkhKeEl4aDFT?=
 =?utf-8?B?Mk9jYUlSL0k1c05NMXE3eXFIdUlEbkxJMlF3M0d6UFBhbi9uNjhTa3k4eU1w?=
 =?utf-8?B?eUJ0R09nWGl4bzh6ODBjVFFzY2pKZXEwK2Z6SUhBUFZFNGRHQys1QWRqWnVv?=
 =?utf-8?B?QW8xTEhtTEF2MHV1NVQvRlNtNTB1bjNDZ090emc4L01iR0h3dW1wTlBaZVgw?=
 =?utf-8?B?eVkzNENpZFFOcTg1MkU4eFU0aDJ0dHhyd0RWMW5lYUlPMEV5eWlVcEpFNUpp?=
 =?utf-8?B?enRNMHNwYWF1cHBsaUlsWXhLWUI2c0ZNc2VCZFJGRlpqMEljL3lqdks0dFNx?=
 =?utf-8?B?MUQwYzNRRzVkOGFnS1VLVHl5SGxYTDdNei9keVl4WVYvcnJ1aEl1N0FBVjZT?=
 =?utf-8?B?Sm5LV0pIcXVuOTJtRnVPYnVyRlRhbitDL1Z4N0MyajdwUnI5MTVTYm5DNVQv?=
 =?utf-8?B?c29lUnpVS0NBVnFIVXRybWZjQ2laRnB4YkdUOVcxUW8rYVQyOVErcmUrVFdG?=
 =?utf-8?B?WllBeklwM0xqWVR5N1pQaGphME8yTDlMSjZ3NkYrRFl1WkdYRmlWV0tPZ29Q?=
 =?utf-8?B?TFZzWlVMa0NHWlc0dkhwMk5ISDhjQWRvMGJTYmpDMkQxTVNjNU9kd1pReW1U?=
 =?utf-8?B?KzNuVVJ0R0M2cVZsTURLZjloSGErLzRWOVB1VE5LbjlxM0huc3d3VnhJU0NZ?=
 =?utf-8?Q?RgQMynEFrJTjlXeWU+WTnxQUB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5e30ed-1ee7-4ea8-56cd-08dab1a517ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:39:45.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvMxJBohBNqiJdxwoY+KRk27By85ROdgGfuIu/7Wsv3Vh9uxdyRYNRNtTVb4LVdrBbkAtgh772uk29OSQnH51Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7053

This is to facilitate subsequent re-use of this code.

While doing so add const in a number of places, extending to
gtime_to_gtsc() and then for symmetry also its inverse function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was on the edge of also folding the various is_hvm_domain() into a
function scope boolean, but then wasn't really certain that this
wouldn't open up undue speculation opportunities.

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -52,8 +52,8 @@ uint64_t cf_check acpi_pm_tick_to_ns(uin
 uint64_t tsc_ticks2ns(uint64_t ticks);
 
 uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs);
-u64 gtime_to_gtsc(struct domain *d, u64 time);
-u64 gtsc_to_gtime(struct domain *d, u64 tsc);
+uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time);
+uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc);
 
 int tsc_set_info(struct domain *d, uint32_t tsc_mode, uint64_t elapsed_nsec,
                  uint32_t gtsc_khz, uint32_t incarnation);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1373,18 +1373,14 @@ uint64_t tsc_ticks2ns(uint64_t ticks)
     return scale_delta(ticks, &t->tsc_scale);
 }
 
-static void __update_vcpu_system_time(struct vcpu *v, int force)
+static void collect_time_info(const struct vcpu *v,
+                              struct vcpu_time_info *u)
 {
-    const struct cpu_time *t;
-    struct vcpu_time_info *u, _u = {};
-    struct domain *d = v->domain;
+    const struct cpu_time *t = &this_cpu(cpu_time);
+    const struct domain *d = v->domain;
     s_time_t tsc_stamp;
 
-    if ( v->vcpu_info == NULL )
-        return;
-
-    t = &this_cpu(cpu_time);
-    u = &vcpu_info(v, time);
+    memset(u, 0, sizeof(*u));
 
     if ( d->arch.vtsc )
     {
@@ -1392,7 +1388,7 @@ static void __update_vcpu_system_time(st
 
         if ( is_hvm_domain(d) )
         {
-            struct pl_time *pl = v->domain->arch.hvm.pl_time;
+            const struct pl_time *pl = d->arch.hvm.pl_time;
 
             stime += pl->stime_offset + v->arch.hvm.stime_offset;
             if ( stime >= 0 )
@@ -1403,27 +1399,27 @@ static void __update_vcpu_system_time(st
         else
             tsc_stamp = gtime_to_gtsc(d, stime);
 
-        _u.tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
-        _u.tsc_shift         = d->arch.vtsc_to_ns.shift;
+        u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
+        u->tsc_shift         = d->arch.vtsc_to_ns.shift;
     }
     else
     {
         if ( is_hvm_domain(d) && hvm_tsc_scaling_supported )
         {
             tsc_stamp            = hvm_scale_tsc(d, t->stamp.local_tsc);
-            _u.tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
-            _u.tsc_shift         = d->arch.vtsc_to_ns.shift;
+            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
+            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
         }
         else
         {
             tsc_stamp            = t->stamp.local_tsc;
-            _u.tsc_to_system_mul = t->tsc_scale.mul_frac;
-            _u.tsc_shift         = t->tsc_scale.shift;
+            u->tsc_to_system_mul = t->tsc_scale.mul_frac;
+            u->tsc_shift         = t->tsc_scale.shift;
         }
     }
 
-    _u.tsc_timestamp = tsc_stamp;
-    _u.system_time   = t->stamp.local_stime;
+    u->tsc_timestamp = tsc_stamp;
+    u->system_time   = t->stamp.local_stime;
 
     /*
      * It's expected that domains cope with this bit changing on every
@@ -1431,10 +1427,21 @@ static void __update_vcpu_system_time(st
      * or if it further requires monotonicity checks with other vcpus.
      */
     if ( clocksource_is_tsc() )
-        _u.flags |= XEN_PVCLOCK_TSC_STABLE_BIT;
+        u->flags |= XEN_PVCLOCK_TSC_STABLE_BIT;
 
     if ( is_hvm_domain(d) )
-        _u.tsc_timestamp += v->arch.hvm.cache_tsc_offset;
+        u->tsc_timestamp += v->arch.hvm.cache_tsc_offset;
+}
+
+static void __update_vcpu_system_time(struct vcpu *v, int force)
+{
+    struct vcpu_time_info *u = &vcpu_info(v, time), _u;
+    const struct domain *d = v->domain;
+
+    if ( v->vcpu_info == NULL )
+        return;
+
+    collect_time_info(v, &_u);
 
     /* Don't bother unless timestamp record has changed or we are forced. */
     _u.version = u->version; /* make versions match for memcmp test */
@@ -2476,7 +2483,7 @@ static int __init cf_check tsc_parse(con
 }
 custom_param("tsc", tsc_parse);
 
-u64 gtime_to_gtsc(struct domain *d, u64 time)
+uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time)
 {
     if ( !is_hvm_domain(d) )
     {
@@ -2488,7 +2495,7 @@ u64 gtime_to_gtsc(struct domain *d, u64
     return scale_delta(time, &d->arch.ns_to_vtsc);
 }
 
-u64 gtsc_to_gtime(struct domain *d, u64 tsc)
+uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc)
 {
     u64 time = scale_delta(tsc, &d->arch.vtsc_to_ns);
 


