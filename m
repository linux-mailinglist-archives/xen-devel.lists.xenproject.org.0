Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182457728F0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578628.906229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT229-00030T-Cm; Mon, 07 Aug 2023 15:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578628.906229; Mon, 07 Aug 2023 15:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT229-0002wr-7e; Mon, 07 Aug 2023 15:20:37 +0000
Received: by outflank-mailman (input) for mailman id 578628;
 Mon, 07 Aug 2023 15:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT227-0002UE-7Z
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:20:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f43b0c1c-3535-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:20:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 15:20:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:20:32 +0000
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
X-Inumbo-ID: f43b0c1c-3535-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhRrAuVFGrXQ4ZjiZFwc/9PX+5iUJL9+yyA8u0joia2qzxM43X8yTYJarqjQhjA6C0G1kmKFBuSx9DZz5VuR+lrUC+Ckivt+aGralYd108T71pQk6SdvjGF+inkY4adL9YltuQnb9jpgWhZYKvxbacdPj8aVy6jEQ3QXSFvg4x1il+b7D+u6B8MK3cCxpnHhoxXn+sW27aRwnhZ2jAjhlHrkeT6UR10/siSlOr5rSiaDMsVyx+cpSQYmmJT3H1B/XUusPkjlNR6wCM6zRlRlQutb2dspaVFICOzzTmkYwtjNR5HVL9GP27lCaftHKZ2SQFngRUskSbpkKQy5FCyokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chCYjHiB2X502WJCa9ozvQcvLibaEFQQSSLt5qFEcLs=;
 b=C/FrrOGEZMyqxv+/zC7ofBhI7YNVyUOPQEA6uJdfY2mrVqz4TWNxfiewb8mrPu04Y9GYIvYYpg5/GeHVx1sA1G3TCoyx4SsaUo6yBy64a73vUwV15/23nENbsmEcq04o80CZmjNlBFbDSWfX2KV5HomZ7eWwkFnxqppL1ZhbzGYtouVPiYFYd3J1m4ounylV1vLOCizziZWfNsEUByhlP0Mf18aJsqLdLmDi8wJOHLhkGRSJTpdtFbHhBVfONnfrLjXVwvc1MiTYnbffSNZtuuOyMD7e5rrriQqpUKOzBWEkfZlRwTef7nz7AojS1/DJJY2hu+PG/9gIXmCZ1W0vXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chCYjHiB2X502WJCa9ozvQcvLibaEFQQSSLt5qFEcLs=;
 b=Xt2yRSz4PEbXaea7Vt9Rtft/WFqHQ/1sToKrvCFxggX3E79losa3bZ8+XX3Patc3pp5ifEGM72cxe+00YepiEnDBrIHPXtJzaNcUPEbgeYHZ7ttx5lSbAnZ03FSROW4Dq5KioX7N2/13KUEvp5iBMXg9oslVsveKwFhFAXX5A8kEU/yYU6nrMFILiXRDnSMZtfev3ZOtHDEXFYPMQTc4THauNayhfoJv1fbKVsjWwQNKJXfBzTNVv38Y8s5Ek79n9eTfz+PGu+YLvh0G3OaxlpPCCO78RcOJ/JZQ5cK22+efYlkJQQPXPTzjA10xwRwCwdqPKjlRrGS2/CFIttBbTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a77e584-b6e5-8f1a-d1c7-c4ca0de7b425@suse.com>
Date: Mon, 7 Aug 2023 17:20:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [PATCH 2/4] x86emul: support SHA512
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
In-Reply-To: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b5bfb5-30a2-47d9-9550-08db9759d75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gsgFHMdXv6AUopgztrfhNE8B25nd0dk+wKB+RYRQNmu0Wxzz2c7z7GOViEtR9soEF/QT+iru/JvMRXkQ5bt1xwbQOOFfdy1R4PkB4WQv55e69C8ox9I+i2oU8S1hf91mTUuRPpMKoks4JTKr2Hf89gZML7sV5ZjddUjNvbKcVnenWfXDpx6KpLvj+kqRR5+pTipKL4RT3PyU6g0ew0umq6awuR7W9cbToonZiiChLFG4oXJfcMq9JPj/3W7IJnKMrqH1HGXzx8Xd3f0xvf+qGVwFJ2Y8ZpEr0ZYoZMs8FApbuqPdfXvsz3HkNGaY3n8j8Hx6HXwbaXhXJFj4C6jAeVeftRJ2/S0p2oEqo4UGeRbKSMR7adsFyZT32uM/HDaSqig68nphD631qKsWOm/i5rc2QjxYMHuektOE7Znk8ucUeV6/h3ZOu8seil8IMgSSbcp5G3TNOgEETFqWEE7zoPR5gSxrvtJF5ygosXpTwy/cSw/cvJh3MCzfOCU6Ex16XEC38+r+IdH7ixdcu/T4rJzwztkWUs+qVe1l/Hz5EIceV2far7nxaPy/pAAljOkL4q5aFZNj7H1k20a63R+RjG0D+CwtdIdLunUNnkFurZZAS8W8JxcGrkwsnc2/EkWcwURrWYTmJBHfw8YXrKKH+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(6506007)(8936002)(8676002)(26005)(38100700002)(6486002)(2616005)(5660300002)(36756003)(2906002)(83380400001)(54906003)(31686004)(316002)(66476007)(66556008)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGl6VGNYYjNObm0wbkdaYXp2Y2o3eE5vaTVpdU9HSnpXYkEwNFVXSCt0L0gw?=
 =?utf-8?B?QkJUaEluY2duZUIyYmlMSFlxSjBNQTIxR3k4emh4T21GQkNmVGZCdFZOQ09a?=
 =?utf-8?B?dEFGSVNzcFh2MXJRaUllVXUyNmFKTEJ3Z2xoaEU2V21tZEVLd1pqcitVQUJt?=
 =?utf-8?B?UHpLNlFpMTZvUU1QK244SXRqZll5UjVndHRrSlhvdU1rOGtUSHpPYVF3VTgv?=
 =?utf-8?B?NHE0d1QvdEtYdzk4MllLUWd6dzJmdnVZMi83dlBCbGZqenNrQU9zR0Zxa25s?=
 =?utf-8?B?NHdwdEs3MFprMFQ1VEI5VnRURSs5VFNMeDVOdllCL2NlbG5rcE13UFZKMktB?=
 =?utf-8?B?ZVZHWVllWWJpL1ZuUFZaU1I1UUxYZldIMWt4ckh2b3ZKM2NNeHRSbDRXNDJq?=
 =?utf-8?B?dDE3N1U0YkErVU1KcmszRzNlWEt5YnU3VmU2WDNNdmlJOTV4dWJqYlhIL0ZO?=
 =?utf-8?B?azMrY2RxNmxIRnIxbzNhbDZuQVN1TDg2VGxpREgvWCt6eERtajRQMW9nNzcy?=
 =?utf-8?B?VmRrTlNzVkM3U3VmZ2hHbmkrSlRsSEJrL0lUT2kybFVkVlFocm8zNmR1SGxo?=
 =?utf-8?B?MW83WHFSRk44VmxaZHljaXR3SVo3NmtOVTVYUUdjRzVuY3dENG5YbW9CYnY1?=
 =?utf-8?B?NkQ2eXBzZVhnVHV2VjZyRnZPaFBwM0diSmtvZDZpYnRDOHdGaGJQaWlmc0pt?=
 =?utf-8?B?UVNIeGU3N3Bha0gyakRaMWZKTmJqb2JBbXZoUXNjYkVtRHZKZVJRcDNrcGk5?=
 =?utf-8?B?UVNzZmYvalMvSm5Ic2k2VmtFZitSMEJNYkc0Wml5a3RwWHo0cUVKNExkZ0Rx?=
 =?utf-8?B?TjJEZjFER1pPOVc5Y1lEYmo0TkwwalR5NFZscU44Z3JEcVZYLzVRTFNVWDNI?=
 =?utf-8?B?a2JpWHBGN2twaVRyVnZNWXYzOXBKcnh3Nk1EUWlpWVlHdk5RM1dGa3dkVEJk?=
 =?utf-8?B?OXQycTZ1REU0RnN2bjZMOStTdGMvbXFKeWtYOFMxaEdKMU9nblgvRHFpYytS?=
 =?utf-8?B?a013bnVjeFF3MTY0ZDl4ZXE1RTZPNmpmTG9mOXNpVkJKYWZaNHpmWnhCZlVj?=
 =?utf-8?B?K1RLNTQ2WWRON3J6eXNWWVZESFg1cjdLU2k0aHQ3VkN5bFFocm5pY1hFbmVh?=
 =?utf-8?B?dGNIWm1HeE01VStJWWxmNHVvcXZoSXhHZEJoZVg4VDc3UVhEY21GUkEydlNo?=
 =?utf-8?B?YTJVOXJVbzl2STkzOE1jUE05ZWw0b2VQMm81VFVJOEQzTUhBT3ZpKy84S2t3?=
 =?utf-8?B?KzJvWkpId2xUQkdZWkxoeTRiL1l6a044UVo3ZlpML1E4STF6QlBUaHlVbVkz?=
 =?utf-8?B?UXRxQS84aTBFUEt5aUtoWmNzQTBkVzNOeHpEUCtKTFlIeklyY3N5aC8wTzZP?=
 =?utf-8?B?alQyckNUN2V5d1ptZ01KZng2Tjhrdi9sNFJSTWswbG1aaGxld3ViTUpUNVRG?=
 =?utf-8?B?WVB1S0FLM3RvbTVDVm00YkMybXptKy90WlM4OHNmV0dHL0dLK2FNVzl5SGt4?=
 =?utf-8?B?dTlWaWZta2tpaUU0R2FRbnJ6WXpOam5ZZ2xWNU5mTytaZHVobEU1T3d3d3Ey?=
 =?utf-8?B?ek9VTHlZR2tTM0RVQzFTQ1JUMUN5OHM3SjgwWU1mbm9HalM3ZytpYzdFazg4?=
 =?utf-8?B?VnVWeGV3YVZ5Yi9taXFDQnJCa0NYZTVCWWJFM3VDZFZzZTB5UGo3RVhKOGRM?=
 =?utf-8?B?ckNKT2YvK0RyYm1FNDFXN0lVbmZadWJnOGk4UDAvZmZkV2J0WGJCUUtCdWtI?=
 =?utf-8?B?K2JXazIyUy9xcGxlSHN1WjdnV01nSEtieEZmSW5IUlNXVWJyY0pCY1ozY04w?=
 =?utf-8?B?bEhCNkJmdmZkc0hOR2hXekxFVzYycU5XOHZTMzZiOFQ1WjUvSUdDUkxGcVZH?=
 =?utf-8?B?VUlheExaZWhZNHU4ZWdrTUVqZXA0NHZ6MzdJV05jZmF4a0hOczVUU1RwRkxR?=
 =?utf-8?B?b1hJTXlpZnhZQ0pONHZ2UlJ6OEdTaWJ3S0pyZk1tQWc4RnRwc3RoSUFxMDQ4?=
 =?utf-8?B?SDQrVmQreDNGcXV6TmNaY2FQMDdsT0dVaXhKM2VrVDNPWVlHOFJiZDA2SWpG?=
 =?utf-8?B?MnZuTC9zek5ib0VMK3VYLzJTZUxFRGg4LzFhZnJmdGcvYjQ3R2ZqNFIvRklh?=
 =?utf-8?Q?oNKwAnLXVHAXaQrp2XxSuzt1b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b5bfb5-30a2-47d9-9550-08db9759d75a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:20:32.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAFsKXT2ZzavNlcgcoShdJIDelcJNNXDLbR46W4K3/eDRx6eYBU+RPYtXO/wqzVvCXR7D/KSDN5UTPPCe5AO6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014

Since the insns here don't access memory, I didn't think it was
necessary to extend our SHA test for them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The need to set op_bytes here is a little odd; I'm inclined to move the
generate_exception_if(!op_bytes, X86_EXC_UD) at the top of SIMD handling
(near the bottom of x86_emulate()) into the "ea.type == OP_MEM"
conditional, as it's relevant (used) only there.
---
SDE: -arl, -lnl, or -future

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -185,6 +185,8 @@ static const char *const str_7d0[32] =
 
 static const char *const str_7a1[32] =
 {
+    [ 0] = "sha512",
+
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
 
     [10] = "fzrm",          [11] = "fsrs",
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1396,6 +1396,9 @@ static const struct vex {
     { { 0xbd }, 2, T, R, pfx_66, Wn, LIG }, /* vnmadd231s{s,d} */
     { { 0xbe }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub231p{s,d} */
     { { 0xbf }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub231s{s,d} */
+    { { 0xcb, 0xc0 }, 2, F, N, pfx_f2, W0, L1 }, /* vsha512rnds2 */
+    { { 0xcc, 0xc0 }, 2, F, N, pfx_f2, W0, L1 }, /* vsha512msg1 */
+    { { 0xcd, 0xc0 }, 2, F, N, pfx_f2, W0, L1 }, /* vsha512msg2 */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
     { { 0xd2 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuud */
     { { 0xd2 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusd */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -178,6 +178,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
+#define cpu_has_sha512     (cp.feat.sha512 && xcr0_mask(6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -176,6 +176,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 
 /* CPUID level 0x00000007:1.eax */
+#define cpu_has_sha512          boot_cpu_has(X86_FEATURE_SHA512)
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -916,6 +916,14 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
         break;
 
+    case X86EMUL_OPC_VEX_F2(0, 0xcc): /* vsha512msg1 */
+    case X86EMUL_OPC_VEX_F2(0, 0xcd): /* vsha512msg2 */
+        s->desc |= TwoOp;
+        /* fallthrough */
+    case X86EMUL_OPC_VEX_F2(0, 0xcb): /* vsha512rnds2 */
+        s->simd_size = simd_other;
+        break;
+
     case 0xf0: /* movbe / crc32 */
         s->desc |= s->vex.pfx == vex_f2 ? ByteOp : Mov;
         if ( s->vex.pfx >= vex_f3 )
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -587,6 +587,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
+#define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6856,6 +6856,14 @@ x86_emulate(
         host_and_vcpu_must_have(avx512er);
         goto simd_zmm_scalar_sae;
 
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0xcb): /* vsha512rnds2 xmm,ymm,ymm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0xcc): /* vsha512msg1 xmm,ymm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0xcd): /* vsha512msg2 ymm,ymm */
+        host_and_vcpu_must_have(sha512);
+        generate_exception_if(ea.type != OP_REG || vex.w || !vex.l, X86_EXC_UD);
+        op_bytes = 32;
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_66(0x0f38, 0xcf):      /* gf2p8mulb xmm/m128,xmm */
         host_and_vcpu_must_have(gfni);
         goto simd_0f38_common;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -276,6 +276,7 @@ XEN_CPUFEATURE(CORE_CAPS,     9*32+30) /
 XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
+XEN_CPUFEATURE(SHA512,       10*32+ 0) /*A  SHA512 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -285,7 +285,7 @@ def crunch_numbers(state):
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
         AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8,
-               AVX_VNNI_INT16],
+               AVX_VNNI_INT16, SHA512],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


