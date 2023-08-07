Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDF7728FB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578641.906250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT22v-0004FC-1e; Mon, 07 Aug 2023 15:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578641.906250; Mon, 07 Aug 2023 15:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT22u-0004Br-UF; Mon, 07 Aug 2023 15:21:24 +0000
Received: by outflank-mailman (input) for mailman id 578641;
 Mon, 07 Aug 2023 15:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT22t-0003Ol-Fe
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:21:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10540025-3536-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 17:21:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 15:21:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:21:19 +0000
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
X-Inumbo-ID: 10540025-3536-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxOFz3syf6hSkSnwsuWllqOeO3420Okc4hkKnIQi7UZr9gGJ2Q6bPME0/m8NRhHKkiDwN/ZTGv4s/lnI/3u27hJBugfqr/4fb6wx1ZFzA2DpqPYLb+C/yRpO4HWTpa+Wa1wx8LXSNnzkPBsy3//gcBDAZ25bJUSiHL9kWpgN/gAUDFjt1w9e9NJhnMrSJiYqeRBgDx2LnwnvZ8UTtEF1Odk1d+L8INAq71689xZBa2+y4vBoduHXp9lI/uGBnDZs6pZUyo3vckl4MTJlB3oF4U9vzDSp2dHVK6lIV2eMi3aOfxuahKtpw9zu4WeDjFsS8GsGfRR/so0QCUcmqnoLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhTNq5mY23M6wTZvUr+tr+W7Hwm3yXoZVbgG/A6dibk=;
 b=VK4Lq2CXDByO1Al2WWJHc4zrsDbTGO3aQuzRNmnNWO67jfaH9V06SYcBO66nqRQueHb3jvSrddhJtwfWxwgGsYVveM4Sl6x0qz7JN0HIINiH1B8J6N1VxExqY9S+GuzJudo8hXmT2cVWH5c3L/2qK8lssdUR58PIowYlUmmffdYJ+CK4B475P/ak8zVZIHnRkdnvn/K5Y0o9+JZJ+gRPJ1aJF1M2EfNDOGuVa//y+G3+QhnosR8GhpKlvAz/ENTzX6hC91xojt5cEJ0bmfkcX/4F/MLG/oyo0QgL7f5WyZRrAMTE2mz3Nzlgjk6bqQ1w9uaT1cX/cNRmEfM+bXTO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhTNq5mY23M6wTZvUr+tr+W7Hwm3yXoZVbgG/A6dibk=;
 b=tV+n5np/D8XBYUMsBRlXFm3hHKsC+x4OiUgIV633vcTGTJf3u2/AVd4uZecwn9iDIVlXEtzPXRMvBXkHN1bwmMURBuHIYl6c1ei+a9JMFs77/sLcWbWH3cunaLRHrN4s8fDu2ylzpCuu+OA7P1Wdoz2L3PE08QbgecqfqittqskIA2uzSbXDKCBYflxEcXzhvl8j5puM1AliNpdhnGvp47pcwUoFhKrsAVyaqwUArEnk77vQ7UWSQ+IIoXmPkyLCquwOgXU2GuFX6bfP35sh32dkQPCpgMWxbsyLFtGDgR8eHJpaQk2wZPWc3V9BACTjN9AZYBBHiY+4N4hyBpyUrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9df1c25-e901-20d5-851a-c03b06119972@suse.com>
Date: Mon, 7 Aug 2023 17:21:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [PATCH 4/4] x86emul: support SM4
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
In-Reply-To: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: e58b85a0-e3c9-4ff0-9b1e-08db9759f36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tfNOxMCUMpmUDTGMaO7wSEou8YhMCsikPHTexh9QHK1uVJLoHHo0LgrFoqRM+v2AXlSGqZ6eiP0Gb+7qzQ1u5BumXQsHgEVzAU2/HHiS1EJXRUGp6enRcgCdJemWolgnH3HrZ0evmwOR5pNOpbp2CI9eV5sjjTF004dZ+2eAt0Q3qRpTYCgX/3zxomv6sA9ftSrnHs/v4EQ0J4DZOmbo6wgkorgilsvfs4NNhngFC1Gfi9+rFQhuemtYg/av8bRYyEgUJ1CvW5hzEasGS/MwMPtESn/r78eJsEsP14rJnZmP8WVBg3/bUTdkCQr1r4RsZHZhff6Gr9IOirA2GPa0T6lVDHysYVuT3KtApdTrFdJqFPylAJHcXv095FjD8T39nUv9cRWx/R8UOpvkpr9i58wiRHTDnSjOZAwO/l8GQsb9w5KlTd1RyMopt1cR9mVfAGAV9sqhVP3GTu1MfneDmZVLf74wCg98i5utjcpxkn/kNI7/0WlQRyxviaPOPIa4MZpN3sZkhLW8a1bk47+OvF2zulPVOZg4wEDEOwyqcmxGYK9/N2gBMFQei02NOpnJjaJmU1LT89kfgVMG5ytby9i60Xca8PIQJFKLsH8txercybGaWPZx5nE7gJXEc0LB6t1MtmqDrFoBAQVRYOfuLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(6506007)(8936002)(8676002)(26005)(38100700002)(6486002)(2616005)(5660300002)(36756003)(2906002)(83380400001)(54906003)(31686004)(316002)(66476007)(66556008)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNaZE03U3g0ZlBleS82U0J2a2IzZnJLKzdic2EwajVKWTdkbmpXL29tekRy?=
 =?utf-8?B?UWtsMUdSOStDaTc4WVIwNUYrUXovZVErR0ZGWGxEd2hxN3c4ZDRMQXk1eXFz?=
 =?utf-8?B?eGhSZFJxR2tuOTF2Um9hZVNDVDNCcmROK3FLTUsydDdOcTNnZWZVcDlMbld3?=
 =?utf-8?B?UktJWkJDNkJ2aFAxUGNwSlVrcmJOVHVCckdJTFRCcTByT1FWRSthTWFseWRT?=
 =?utf-8?B?R3dHOS9YMWVIakhidHBJT3ZvaFhjVlZONitCT3FaMUtTYzlTZzVUQ251NDZp?=
 =?utf-8?B?UXQxY1JFSlBBbU40dUx5R283NWZCekpCbEhkNkh6eGpqSHMvUzRTLzg3akRO?=
 =?utf-8?B?SXpTbXk2TTlaMmZTeDdvaGlLSGEzZzdFOU5kSG1jQlhETGN0NmZRMkw4aUZH?=
 =?utf-8?B?Tjl2YUdlTlRiRC9mTDFSOFpVSld4R1BIeThUcUZsaGQxbnJsd2M3S3NRQVYr?=
 =?utf-8?B?YnUrbUI0S2FYdk1BajdxS1BCaHorZjJSQXkvWU81YWtsOVJKbUNFRWx4MFJh?=
 =?utf-8?B?UGJqTkx2YkVGT1dWdWkzM0dQako3d0IxWFY0aUNHY0JLOWw2NjBzS0FqeDB1?=
 =?utf-8?B?WWFFeUdlNmpQYzhaRkZ2OFdUa1FBeWFuL1ZCbEJVWXBKbEl3dUNaM2FzeS9l?=
 =?utf-8?B?OFdLQ3RDa0JDdVByd1k4R1I4WGZCcjJlazFwMUJaa1VHdGNEWWg1ckdzZVlD?=
 =?utf-8?B?cE5Idi9FY1J0aG1GQjJURklPSGhqWHpUbXFsVTZpZUFKT0wwYWhacnBIZk9v?=
 =?utf-8?B?cGtPdG1Na283M1MzaWlnOFhFc1V3djRvSmNXem0wcnBVZFNBRU9CRHFaVkZj?=
 =?utf-8?B?WkMySHRkUTlZa1c5akFNS0tyQmFJdXdNMURCSGxURzhuQXRNTEVtL2trWER1?=
 =?utf-8?B?bXB0Nk1DT2JkMDYxUnpTZzZ6VFAzbXBFckNFalZWL0dqUkZISkNja2VDOS9Q?=
 =?utf-8?B?K2g0WmZPVjZrSWhrUE5PUTA4cjRVNVc2VFB3NHhGcTJjNnVvU3l4OUVRU01x?=
 =?utf-8?B?enlQaFEvMEpWOU1wSkFtL2V2bUR1SEliaVdGS2toK3lMTWxlVElUU3k1UzRY?=
 =?utf-8?B?YVhiR3Z5dGEvWVdqbFBPVS9PVjJ4MzVkM1l2WFZEZVJBd1l5enFneXp3endB?=
 =?utf-8?B?MDcyZGl2Y0NlR1kzaXA0b01OUG01TVhXZ3FDWjhhc1doY1R0Tkl1ZDVUNjR4?=
 =?utf-8?B?cHhqY09LVmEvVWRaVm8vQVdNcEh5ZVAyb0JnTUNxK2h1V3Z2QXRrcmV4MDBL?=
 =?utf-8?B?ekluU1BxWXFYekVhNlBWK3dWbFNxVjNpMmQ5N2QrdEl2enBLWXcrMXNldWxE?=
 =?utf-8?B?ckFTWkI5NFlHYkJnbXhJZENhN2l2NnF0Qi9uMWdtM0RBQXViVGpyNndldDdF?=
 =?utf-8?B?OWVTbkl1OW8yY0xiT1MzVnFRdTFMdU9ocGkxUWRyejY4SzdlM0l6K2V4RSs3?=
 =?utf-8?B?bVNob3dKellRTStZRXpMRUxDR1IwODhXVklYd2JVRitKWmtTNytDWCtJdVBs?=
 =?utf-8?B?bmlkZFlZODlNM3RtNThOZWlmelRjVzM1bjcrcWE2KzNjdUY0ZVZNODg0WDh0?=
 =?utf-8?B?OVlwK3JERXo2c255NlJHUWhnOWZsMVNyMjRwb2h3bFZBcFpHWTFncCtQRnYx?=
 =?utf-8?B?aEpoYjZwaXdNZ0pOMVhJcVBneDhQbmM0QW01V1RQZTNDUGZZYXlHOCtqYWxB?=
 =?utf-8?B?OThFQUpjZFJQSmtrNm42TVdvcTNhQlVNK3gwUTcxNm52UHZpS24yVHJJTitF?=
 =?utf-8?B?dFI1UW1RdlFlSy9DOUg3MWlkdCs2UmMwWUZnTTdBNURoN01rdklnMkdCZy8y?=
 =?utf-8?B?NHBSc2szYVZIOHNnQXp5NXRwVm9OYUJOdkl1Y3Z3OXdIZDJVKzdyM1R1SGVD?=
 =?utf-8?B?Qy9SOEk2M0Q1SWFMYWNjM2ZkUGtZc0poWStPMWpWT3B0VEtsSEhXV3NYRStO?=
 =?utf-8?B?TTFRVTE1emMxUXZGcmRLOXNvMWQyYzBXdjMza00wQ2lXTFZTNkRxL1VTazZw?=
 =?utf-8?B?anRyMitueThxc25VTXhZOXgvbzlLR1RxN29vMzFtSndxVENGQ3Y4WG9WK2V2?=
 =?utf-8?B?RkhFdTJqTHpNUGZkVlNISm1yTStjejJDSHEvMEM5MkVVMFZYR0FQSkZUZGk4?=
 =?utf-8?Q?pScVT2jRlOsE5RjhRi6JjF86W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58b85a0-e3c9-4ff0-9b1e-08db9759f36d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:21:19.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E80O/ODRKrtHB0f7XDdOnNXH4+Ba5RQAk0A7vMJUbq0UPjxKgfT7SKsAUQ3DzbEqdk9qFe8cJjI21K/9w0RLGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014

Since the insns here and in particular their memory access patterns
follow the usual scheme, I didn't think it was necessary to add a
contrived test specifically for them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -arl, -lnl, or -future

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -186,7 +186,7 @@ static const char *const str_7d0[32] =
 static const char *const str_7a1[32] =
 {
     [ 0] = "sha512",        [ 1] = "sm3",
-
+    [ 2] = "sm4",
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
 
     [10] = "fzrm",          [11] = "fsrs",
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1408,6 +1408,8 @@ static const struct vex {
     { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
     { { 0xda }, 2, T, R, pfx_no, W0, L0 }, /* vsm3msg1 */
     { { 0xda }, 2, T, R, pfx_66, W0, L0 }, /* vsm3msg2 */
+    { { 0xda }, 2, T, R, pfx_f3, W0, Ln }, /* vsm4key4 */
+    { { 0xda }, 2, T, R, pfx_f2, W0, Ln }, /* vsm4rnds4 */
     { { 0xdb }, 2, T, R, pfx_66, WIG, L0 }, /* vaesimc */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -180,6 +180,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
 #define cpu_has_sha512     (cp.feat.sha512 && xcr0_mask(6))
 #define cpu_has_sm3        (cp.feat.sm3 && xcr0_mask(6))
+#define cpu_has_sm4        (cp.feat.sm4 && xcr0_mask(6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -178,6 +178,7 @@ static inline bool boot_cpu_has(unsigned
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_sha512          boot_cpu_has(X86_FEATURE_SHA512)
 #define cpu_has_sm3             boot_cpu_has(X86_FEATURE_SM3)
+#define cpu_has_sm4             boot_cpu_has(X86_FEATURE_SM4)
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -589,6 +589,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
+#define vcpu_has_sm4()         (ctxt->cpuid->feat.sm4)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6896,6 +6896,13 @@ x86_emulate(
         host_and_vcpu_must_have(sm3);
         goto simd_0f_ymm;
 
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0xda): /* vsm4key4 [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xy]mm/mem,[xy]mm,[xy]mm */
+        host_and_vcpu_must_have(sm4);
+        generate_exception_if(vex.w, X86_EXC_UD);
+        op_bytes = 16 << vex.l;
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdc):  /* vaesenc {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdd):  /* vaesenclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -278,6 +278,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
 XEN_CPUFEATURE(SHA512,       10*32+ 0) /*A  SHA512 Instructions */
 XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
+XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -285,7 +285,7 @@ def crunch_numbers(state):
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
         AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8,
-               AVX_VNNI_INT16, SHA512],
+               AVX_VNNI_INT16, SHA512, SM4],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


