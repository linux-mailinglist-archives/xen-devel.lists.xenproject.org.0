Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5BD6D65CD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517924.803933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji2T-00024w-Ng; Tue, 04 Apr 2023 14:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517924.803933; Tue, 04 Apr 2023 14:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji2T-00021q-Kf; Tue, 04 Apr 2023 14:53:37 +0000
Received: by outflank-mailman (input) for mailman id 517924;
 Tue, 04 Apr 2023 14:53:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji2S-0001Yx-7x
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:53:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe02::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78833a08-d2f8-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:53:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:53:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:53:32 +0000
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
X-Inumbo-ID: 78833a08-d2f8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBoZfzhvl+G8C00sLGUlmDgErx4+maPHAcSWakkZ5tBvwz/EUag5Bz/YX2NJerTBrblty7kAcO+wGWK8dgXvH1eL3Td21xsL01caoHSsbvaOatpfkwCqzvT32c+gSNhNpyXAM0wk2Xow//1WWV/NhKdLSM668niB13IuAgpHHFsl3EHesX7gL+VFbMSGhqY/pJEppHVyiotmispZqXWvBPnDc9SuIdzw5gCPaHoa9mfJelLuMeStwNGsWZMs4j5d4wIeAEHEEUTRbJEAhH5Aow/AC2di1Inb5D9E59ZIP7YInCVVymoDQj5acHkz/GRfj+K/Yl3BlSne0eh6xj6vWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuO8e/fNBYfvRmo/WVweSQll7opiYTXixAvlnnhA5lc=;
 b=Sb41/HGtjtrtam1xw3R49Yp/5HL93DS5nqthIHfWW2+zl9VPVPh+L5hY7samnFQWrW9qYw04k7h4ShM/JnqwRb3kkL6AHXo81o8hMHJVMxqPERRNf+elI6YLtEdLwfZ/7f5yOOQWFkwZ//c+azP+Tz4kLZM0NJfbX3naquaBS12jJiBzTC/Su6J7TE4FEEYxeX0NKvkMWKnNhheg4LGTrNsPzwzFRKLKqnFvSNiEjT5uQ39wWK6rHtfftKpftJvFzAzPmucivPDc6wrqajQfbFB7Q+AFBFIQfya5xdnXneQwo8sOHUe24zD6/qVZ1f2X3GR/cu0kemq2W7WjE5MaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuO8e/fNBYfvRmo/WVweSQll7opiYTXixAvlnnhA5lc=;
 b=p/CCwAKTuvzf8J5fl1KK68jMW1UeQfljCloVXPCWm0Wv9eJqJSDjQQhGElngAuDuVbE3t7aYWkeATnJEE17WIwhrR0Wx6hwhku78PU6ntzww8Fuoxfz1L/1W8xU2LtF4Gn3oxk0MiP0yOgZ7IX291y1Gf0YmebyrFsDlqregalIr/rkf7s86xccfUMWWuiDhDs5LCWjiNaWP3yUO7w6CUniACr6TenxtfirHjHu8SAmBqFGEhCF9lnF3NcCmq5WcP4i990o1qCAbbsArSjbSNg9h452zc/9Fiz3LdVsJIWTJX019JZlrD3MTmbZ4ymWdqPw2OOfHSBD9fJ7O1mqztA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5358413-2638-23c2-4d44-a925c6f08d49@suse.com>
Date: Tue, 4 Apr 2023 16:53:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 6/9] x86emul: support AVX-IFMA insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e77b752-406a-4250-39ee-08db351c5c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C2D30WIKNGZhVtk4eZwoxkSPbGLZHVP/zQHR6w6G4ILCiecx0RYX5Wzc+7PheyAKD31MjFvcuFaBxUbyXJ5Jl8zbtAzfsAk6vN10CgOTpw5M/GJXifYUZXvvODp8P5HjJJYDQl/O0j6gh13s8M++4237nim7QrextKN21ABj6jg6DIfveyf5CNzZVz+xoYUjzCTHKybqp7uf9chS1cVOLo8CL9V/xRouYgtBFHg4ysmRqpTk6gV1BSoW8wuB9PHFzrgHf+QazklC+CpKv9lwQihfvEcPOLet1edp49B+Xa94V420svh9ToepY6mwsQlKKaMQFFBkTSwlXIKOS6rEy9rJYIznrqWIA01WNqwwEzfOWoGl7CXSPN8r0Sh/mnqGta81NMwosiZw6N7Vl6nO2mmI3QATXfCWvpNMB2gEL9V1yLXmhCNNnSRVuxriOfGREeU3cGJLnOpFQkgJ1XXfNNFzJYoHeZADS4WHdm7E5kDCW3ENxS9soN4x9h3jinzfMTDHpwmg8rZf5+KDt4t42+3EkY8Z8EIP4McHH9aAYsDA+Ib8spujT02hPHnLQ+vS4yrpsEfOze0AI5QzbR7JXP1M6OdMEKOcgXnr1PHZO96Dl3M3bIkVqiLU/jEPtxCfPMVAbMJTp3RU4ygyALmVyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(66556008)(41300700001)(8676002)(4326008)(6916009)(66476007)(66946007)(316002)(5660300002)(8936002)(31686004)(54906003)(478600001)(6486002)(26005)(6512007)(6506007)(2616005)(186003)(83380400001)(31696002)(86362001)(38100700002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alBRMEtzVUovNHFRdnQ2NU05ZmdlU3RCSFJ0QzMyU1BPbGxtd3grWXp0MFpR?=
 =?utf-8?B?UUpjU0Y3RXZvaUhTelpxdGV6VjB5ZUx3UnJ0aVNqVUNJUHBiUU5iWTYzTUhj?=
 =?utf-8?B?cnNNMXI1RlNLbFV5aEMrN1pZMVVnZnRROEpNZUR6QnZ4SWs0YUVqN2tySnlM?=
 =?utf-8?B?RlI5YTY4SG90QVRtbmg5bTBaNFNGM3U0eEtLbkx4T1R2S2ZTWWRCRkZMOUd3?=
 =?utf-8?B?bXBsTVVsd3lXM0NwcTJ2S3hYVDRGVmNXaVU0TWowQTZCWHpuMkZUNkd6K1BC?=
 =?utf-8?B?NjdmU3FmL3dFY3l4dlVQUk9yODgwMzdQenkzSG5hTkQwSTRiMzlMWnoyb252?=
 =?utf-8?B?UjQrYjQyamVjZjlzQjQ2ck9WalVTcGRMTnI1VysyZkN3eGlsaGFnaU9ua24x?=
 =?utf-8?B?L3RieC9aN2gyK2JUaDBOZlJqTU9KZFg3aVpTOVI0MGE4c3pIemY4OHVqUld5?=
 =?utf-8?B?ZWhvVkNtZkJhellrUWcyQ3ltbFlqT1dLNWY0M2ovaEY0Znd3Y3U4U2xKa1Vh?=
 =?utf-8?B?KzUyK3Bha2N1dTFUd09ZaVdGaUlKZDhyaXBadWRpVFQwazAwd3JVY1V2Q1Vr?=
 =?utf-8?B?QVRLU0IwVmdIRlJQNGdRM0dRbG9UMG5WTE9KVHVQenRaRjVHU0ZyWW8ybmNE?=
 =?utf-8?B?Ry9Za0tyNEtJOTg4ZnZaMjkvWGI5RGdabHJ2WDZyZ1lYTmNueVVHc01xdGYr?=
 =?utf-8?B?V2VZSEdMZkJmZm1ISE9acU8rQ2tlOE5XS3hrcDZ6bk50Si9Ld0NrT0s2bjRz?=
 =?utf-8?B?aGZTSjMyTExBS0ZwdVV3WHA0R3V3SlFuSkROa3IzOEVrTUE5YU9xR3BxbEdN?=
 =?utf-8?B?ZVR5SjNTQm45Z0Q5WGt5ajhRUXV6WStiK2tYT09zWUd2bzdqRzYxZGNadXZo?=
 =?utf-8?B?R2dNOXh1cmwwU24ybThrMjNQMVA4bVdIdlg3bGM5RitVMm44N3FkbmxtWmpS?=
 =?utf-8?B?TU1aQ2Z6NEVRbDhOdWdsUitrUytTSWtHSE9YNlFEU0JPem1tTFNRdnpXazVC?=
 =?utf-8?B?OGdCdUhaVlJKNmR4T0gvREk0TUhIMzdKWGFROWNLMk5yYXJ6c2FPSjhCMjN5?=
 =?utf-8?B?bFJacHRrRTA0OTl2cVc2OWMwSGNuOE9MS0d3ZG5aOEdwUlJzaEkvZ1dvMG0y?=
 =?utf-8?B?ejQ3VjJoZTZJNjZEVHN6cmJLelRoM2lsVEpGVHVKbXJpbHZ2cmY5ZEFCYmN2?=
 =?utf-8?B?ODJzcmFXenFnbFVoSVpkSFJiblVvbXllVUk1M3ducHpDcHJEeDVXLy9zZTV3?=
 =?utf-8?B?OGxGSkVNVHFxZkNvYU1CWEd5RWhHKzVlTWFwdUl2dTZUZENMUWNoUFc1SkVC?=
 =?utf-8?B?R1pwVEFlamFVLzRYaXZ4cTZvRDFHTEppTVRJL3c5MU9HVm1iNUV5L3RMZHVV?=
 =?utf-8?B?ZWREYVZybUhFZ0xTT0tQNE1uVjdlSDZDMWhVZTJsWnU4MUZvc1RLUTRWUzhl?=
 =?utf-8?B?Nk95T2t6c2Z2U3NvUWRpeVkrcWpzYTUyT2xIMW5wbXVLVnoyZTFlVGlLNFV0?=
 =?utf-8?B?Y1RJcU80OUVKVG5ibFJ1THVIMnVjWEhSSzVJV0hHeTg4eUpqQSt1cHdCMGdY?=
 =?utf-8?B?OXA5Q1lndG9RTk45Ym5yN2tnVEVxamtkQmZXTk5xSmMvbmZqNGJ2Zk4zVEpC?=
 =?utf-8?B?ZjdVVkhmN2RmeFl6QVp1SnF3bGl5a2JMZGtsVk5MRzE2ZUlOeVhJTXpxblBH?=
 =?utf-8?B?NUVhTnBMUWxIZFQ1d3c4c1NuOEtDam01VE4yRlhQRUxubWgvVmFTaXdRZ2RD?=
 =?utf-8?B?dFdiMUcrNkc1aHlhd3NIN3E1WlpTOG8zcXlqWld3SGY1MUhOeEwyMmJkS2hp?=
 =?utf-8?B?dUJoQ2NXaE5uOERFenFxMmV3M21FZFUrNEJFZGd6UCs1ZUhRQ0hTdlpnY1FR?=
 =?utf-8?B?M2k1eFhZOEVUanpEcmM2c29kR1ZVYllQYWt3LzFXSDlOamtqVlVtUmhwNThL?=
 =?utf-8?B?Rk9FY0RlaDZ6WHlDbE9BeThCc3lLQ21PQWJsNzFSYUlLazRmK3ExRFBvL0Q5?=
 =?utf-8?B?YktVb0oyQlh6Q1o3QUQ3QUhlNlJpOGhCNHdzZ29ZSnBOVHBlK3BMNjBHRnVU?=
 =?utf-8?B?WWozeC90WU1SZ2Nld1g1SEFIMmhkVFdBeVR0M1VZeC91Szh1NDJxZnF3a1l2?=
 =?utf-8?Q?r5ePGJoN/z/6395lFf6YcvC0x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e77b752-406a-4250-39ee-08db351c5c2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:53:32.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4lbY4WiC4GDnqnPoFsiLGe0fYWtTnDfGPyf6ObN16f2Tzx24/C3h2YGrtgCCR34eDSMeuR03e7YTDdngOHv8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

As in a few cases before (in particular: AVX512_IFMA), since the insns
here and in particular their memory access patterns follow the usual
scheme, I didn't think it was necessary to add a contrived test
specifically for them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -239,6 +239,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"fred",         0x00000007,  1, CPUID_REG_EAX, 17,  1},
         {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
+        {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
 
         {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
 
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -193,6 +193,8 @@ static const char *const str_7a1[32] =
 
     /* 16 */                [17] = "fred",
     [18] = "lkgs",          [19] = "wrmsrns",
+
+    /* 22 */                [23] = "avx-ifma",
 };
 
 static const char *const str_e21a[32] =
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1372,6 +1372,8 @@ static const struct vex {
     { { 0xad }, 2, T, R, pfx_66, Wn, LIG }, /* vnmadd213s{s,d} */
     { { 0xae }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub213p{s,d} */
     { { 0xaf }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub213s{s,d} */
+    { { 0xb4 }, 2, T, R, pfx_66, W1, Ln }, /* vpmadd52luq */
+    { { 0xb5 }, 2, T, R, pfx_66, W1, Ln }, /* vpmadd52huq */
     { { 0xb6 }, 2, T, R, pfx_66, Wn, Ln }, /* vmaddsub231p{s,d} */
     { { 0xb7 }, 2, T, R, pfx_66, Wn, Ln }, /* vmsubadd231p{s,d} */
     { { 0xb8 }, 2, T, R, pfx_66, Wn, Ln }, /* vmadd231p{s,d} */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -186,6 +186,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 #define cpu_has_cmpccxadd  cp.feat.cmpccxadd
+#define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -171,6 +171,7 @@ extern struct cpuinfo_x86 boot_cpu_data;
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 #define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
+#define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -599,6 +599,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
+#define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6727,6 +6727,12 @@ x86_emulate(
         break;
     }
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xb4): /* vpmadd52luq [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xb5): /* vpmadd52huq [xy]mm/mem,[xy]mm,[xy]mm */
+        host_and_vcpu_must_have(avx_ifma);
+        generate_exception_if(!vex.w, EXC_UD);
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_ifma);
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -285,6 +285,7 @@ XEN_CPUFEATURE(FSRCS,        10*32+12) /
 XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
 XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*A  WRMSR Non-Serialising */
+XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -254,7 +254,7 @@ def crunch_numbers(state):
         # feature flags.  If want to use AVX512, AVX2 must be supported and
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
-        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI],
+        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


