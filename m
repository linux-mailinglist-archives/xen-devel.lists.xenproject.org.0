Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B817728F6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578634.906239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT22T-0003aY-Lp; Mon, 07 Aug 2023 15:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578634.906239; Mon, 07 Aug 2023 15:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT22T-0003YM-GZ; Mon, 07 Aug 2023 15:20:57 +0000
Received: by outflank-mailman (input) for mailman id 578634;
 Mon, 07 Aug 2023 15:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT22R-0002UE-P7
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:20:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 005bc6b8-3536-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:20:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 15:20:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:20:52 +0000
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
X-Inumbo-ID: 005bc6b8-3536-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7EIhWUx9X5MFM82gjzS3N796PCNg2Nx/b7Ir6pVDbp/uVXz5d2Nw6UGZO0VTTmwJAE0K3pqDF+XkzszyuUhVPB4Mp9wu8tx1u6Dom23xSd8xEm+Op40pwzQrtVhhiGUD6DvsLvORXA1BhxLRWIozCsCozEslAvhzOH0wn6qwqp9YUf5SAEwwuXxN1A3C2lDk0HKMstWxk5R3L1SlSg2dVH9Pn5aGNi8C101mqkMHi25G2/ST9CgMmsGY3HECkvZNXnyrqYGWblm6Dkc6I++OnBOUQ5mqxOTn2LdjrqV+2+yVqt0izMgdYvy/XmmPUQWpBaJV4wlwUyDwMYwbp60vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocRc9efOKOJP+qtfngHzEB0n57W85tzVY14dw9xIXQE=;
 b=WLiLcxkaw0Ek8Vy4iQDbmagLIhJ3bAWequn+l5sSfOfOQKHZ4EFxf32fzd2KMLrPOs5h67OSlAbGHVEKSwinWNuFaG04pJeSzwNdL2f6sKIzKXC8T1H9HTsD6mkwxo/UtB2ae4otFNGRjxYft8f8uYQQo64zacAadLmvVz7WKaBeG1AjbxzKUo4ylop4Epv8WSp3Wn/mWEWned+jSlWWATeL1ZCIWy1ukhFjEXQvmw9RMI+ND40wa7+/WGHcVo8HNO4z0gy0cKXMwAuif9ZmX/UDyy0/4OQQAPYHefUedbxEM3snewDYYa54WLIJnMP2OUQclfRNyMJWNGQuiE3Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocRc9efOKOJP+qtfngHzEB0n57W85tzVY14dw9xIXQE=;
 b=I4djyYTaUtunpN6LX87rVaeXayiK0p02oRxc/OwiWRMLH7g/lFIiE5M9pKiuhyqDkhHuoml+cxqEdrii2EX/vecGIwAPc/Dy+2yMgRy/jIjpeMzVfc82R9TukCvePYYLv7J8a+/PlIKmNTl+agZnygRzCJ+FnIwSuEHoPtEbMe76sKdOtkQUHFLT8M/R/lQundREKDZaRNRiSq9EZf+HCNkyT8fC/Zb5JkbjHPvHACv+iBhLNxWPSgRrJ6K0wl/7HsughBVGo4/jn1lMfcmNfNTZ819AKDTK8yycbOFXd66OowrA3UcVbQzzptECqVqKmcIYutrC75TXh/LrNMf+bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e32e9563-99cf-5273-39d0-4281ab4272b6@suse.com>
Date: Mon, 7 Aug 2023 17:20:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [PATCH 3/4] x86emul: support SM3
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
In-Reply-To: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdb9b20-dd5b-4f0b-dc56-08db9759e358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EiIDVZZVLe+Ztj5c8zIrt5ANmpysyjb9XP64OcOMR3pmVPzrTJb904jAVGaZRcwGMWVGMCIit6NScqo70ZfNWz94HwQC82FTr0bSLlX81WTXEJBr5R2/kh9+UC4SvlLbS1IdKikt+PgU02w1jhKnRFqQR2K1yrd3oydeuIs+v1Wc6BNc28kKx6P0HnOhfG83wGb9sAP+heCGR4XDywvPvcP+Ge0OQmHWFtGhVMvID7zoXgH7JV5aKDApbgjao4OS6PUlKLXMbok9ktzZPeG8S4DpHMphO4w2CKSERpWbjoRLHuOvjhOndMGg6jq6leS6kMJmrfXWRqxBIG/+wGa5kBq0SRmPbTw5kFx88ONmzo6Kg7zd+b5iuSfZAp6mnSQ5RKRcM96wdg9sLk7fc5wxviqdDZB8RXbepE5dY6SU4KQ78xKV85pS8jF8slrRUCNFFO0itraSNbrlvIJOgjYLd/QJdKOrM2JXwlbhbGiTag7wGX/4X193x0FV48VyTmjgtAaWZpwic/TNiyEGuTq4U5In+QzgoMaHpGfJYI2h4KkQzlE5TWMXr+zBfHtJBgvTzTZKk/YgypUx7WJV5442NWYEz+p7dkem/jZVE7vnfB1jMTsvviSv45TzqMBWBvyYoCSh53TaePekMuEYKTi7zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(6506007)(8936002)(8676002)(26005)(38100700002)(6486002)(2616005)(5660300002)(36756003)(2906002)(83380400001)(54906003)(31686004)(316002)(66476007)(66556008)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnFwQzgrK01CaDRrSFNTR2R3L3E3S0x6ZG1yM3R1ak1hYU1UajJHbS9wVUMz?=
 =?utf-8?B?M3VHbFk4TEgxODZrbDdTYldFMCt6US91b0E2V0NBUExvc2dQY1dFdEZ2SUJ5?=
 =?utf-8?B?N3RkV0hicXVTWC9VZGRoaVZFdnhpTUFmSlh3L0Y4STlUUXdlbU1jOUN1aXB0?=
 =?utf-8?B?YnNESUxCVW5MMTI3MVNlTFI5V0c3dzdoTEZtN3J3RnJ6WlBtekNnaXRUK05I?=
 =?utf-8?B?dndkdHBTaWl5Z1JIaSt1Q1pmaDN2R005bzQwNWlxWUtZSis4TmU2VWFEamUy?=
 =?utf-8?B?VytvQUt3dHVYek5KRDBtV2VmTUROT24vd3N2c1dQSEd1alhReGJsMVIweDR2?=
 =?utf-8?B?a0lEMWlCdDRaK1VwaUphR2lMdGhJMnFqRHI3cEU5VVZIWjNFdHZFSnBqYkFC?=
 =?utf-8?B?TU51UmJqamxyQ0V6RVlueTUyZWc2VDNSYnRJRjlWTGV5eHZwY1Nsbk5qQXd2?=
 =?utf-8?B?akxEQmV5bWlMZll6Ull4YUIzYWNOck5Zd21IVUIzNGRVaC9JQ0xLMkFmREht?=
 =?utf-8?B?ajRic0xmK2JEVUpDajNkQlJZNkVVUWxYMzJJYlBwUFZmMUFSZHArZzdZUkxm?=
 =?utf-8?B?ZWJ1aWJEMzR0b3Jqd0FneVhjVjFDblAzd1FTY0dQTlZFcE5nbmdkRDd2bVY4?=
 =?utf-8?B?dDFERmpuNDRRZzhOWVcyZGRtNFpBYU8zRWZjVngvWm9KbFJsTEJrbjVRb3VZ?=
 =?utf-8?B?OERQTGViT1hRTUtvVXRUUVVYenlFeTJtWEZ2Tytob2tYcmtOKzB3c3FOTlR4?=
 =?utf-8?B?STJkL1pYTE1Qemk4dXB4KzAwM2Zvemp6MWJBazhVTVVmUU12cDZOTTVIVUhN?=
 =?utf-8?B?b1pucVZwZDFrcEJNSFFpNnZWcFFWNStEU2ROaGpKRTYvbHRHbWpGQzZ6aGEw?=
 =?utf-8?B?M1FjQjBDNmlLblJCNC9ZL0FUSzFNWWJ1NkJuSUJCYWpzdld3SmxmajBHanc5?=
 =?utf-8?B?clNCT216UVdsK2xENlFKN21raEcydEVxUXRmY09TSTVpY2NDK0NDYmtvOWdQ?=
 =?utf-8?B?OHljeHFLVXNhamVUSXVmL1dmK2JQL2taZUhhMFVVb2VQSjZpOWVNSVpsUEVs?=
 =?utf-8?B?YXJlMTQvSkdrbit5bnMwQlZQWUFXalk3MVpkRW1DRGlnWVhuYjRpclIzdnY1?=
 =?utf-8?B?YVBWUFpQUnhvUEg4Q0llQkJBS1lpVTU5TUhwY2Y2RUNaTk93U1RlOTBQb0xC?=
 =?utf-8?B?Wmh0U3VSOTB6VGQvZWlGcGtDRWN6QzhYTHFjNVA1TnVXUzd5TWt0Rnpsa1Jt?=
 =?utf-8?B?WjFXV3RyeHVEd0VLVWpOVEtvRGRvc2VLNGNESG54YVZZWnk4SFFDWWQ5OThG?=
 =?utf-8?B?VjBUQnNUSlNGbmV5TTFwb05UTVp0N0ptcHh3Yk5kckF3RUlRUDJsbFpPVXkr?=
 =?utf-8?B?bUtZaFcxOFZXRllBU09Vb2szODd2Rk1DN0VzYjFpWnNpUmw2dFpKMXFLU25z?=
 =?utf-8?B?ZkI5Q3dFK1FzUTQxZHZRMVRMc3VNWkdWYU9GYlUydmsvY2J1OVBJbWRQTVN5?=
 =?utf-8?B?K0pYL0Q4UEtSS210NER3MVo2T1Vvc3FUZ2RDNXBEMmtXaGhoS1ptZmVsOTZR?=
 =?utf-8?B?b1BaY1ZTZ0QwcDZLRW90RGUvT1JyVkN6WVV4ZDBJQXB4MHZlSWlRTURtTGlJ?=
 =?utf-8?B?VkpwdDErcFBGSkRuS0Y3eXZBMVQ3R1ZJaVA2TUhlb0lVZmNkSzMyNGFpVzdm?=
 =?utf-8?B?eDJ5cTVuTVNoeVA2VWNYSTJmWmRJYS9rV3p4b2liVUhaSkZ1cWZxd21RdlNk?=
 =?utf-8?B?aFVyUHRMeSs1Nm5PcGFRTEV0dlhmb3lBSHdxL012VG00a2I5SWY3cHRKeGl6?=
 =?utf-8?B?VzIxU3U5TXE2aThiZlM4dGtOazFJRGh0allyRkxKRFRCdDhLMVNmRHhKYkVG?=
 =?utf-8?B?UmpaTVM2Zi9JY2hmMmV0ZTFtMUF4WTgyMU9TMFJTRS84ejhVbW9YeUVRTm9u?=
 =?utf-8?B?TTUzRllxTEFnM3VUZmxOZUd4UEhuclpkTzMzdmF4OGhTZFZOaUlGc2o2eUp2?=
 =?utf-8?B?Y1lOVnZqeno1QlZKNXFjRkJjV3FvYXNGeDYzQk5pMTI5alNVemhZMjI5eTJG?=
 =?utf-8?B?MVFDNHBLcFlTNWR1dkNIMWdFRDlQZWJaMEp3TkMwZm1VUlkwenFtcERtbkEv?=
 =?utf-8?Q?1K1AYYYcLOVTuJd1K2G5206Ru?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdb9b20-dd5b-4f0b-dc56-08db9759e358
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:20:52.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z29IhwEbF31gzUM8zL+QGNNyOnG3/fsyCdaK9wSIFwgm5MfFsP00p8WB7YvoJAdPMoyKGg6eIwoX51VKAyk/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014

Since the insns here and in particular their memory access patterns
follow the usual scheme, I didn't think it was necessary to add a
contrived test specifically for them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -arl, -lnl, or -future

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -185,7 +185,7 @@ static const char *const str_7d0[32] =
 
 static const char *const str_7a1[32] =
 {
-    [ 0] = "sha512",
+    [ 0] = "sha512",        [ 1] = "sm3",
 
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1406,6 +1406,8 @@ static const struct vex {
     { { 0xd3 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuuds */
     { { 0xd3 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusds */
     { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
+    { { 0xda }, 2, T, R, pfx_no, W0, L0 }, /* vsm3msg1 */
+    { { 0xda }, 2, T, R, pfx_66, W0, L0 }, /* vsm3msg2 */
     { { 0xdb }, 2, T, R, pfx_66, WIG, L0 }, /* vaesimc */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
@@ -1490,6 +1492,7 @@ static const struct vex {
     { { 0x7f }, 3, T, R, pfx_66, Wn, LIG }, /* vfnmsubsd */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
+    { { 0xde }, 3, T, R, pfx_66, W0, L0 }, /* vsm3rnds2 */
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
 };
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -179,6 +179,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
 #define cpu_has_sha512     (cp.feat.sha512 && xcr0_mask(6))
+#define cpu_has_sm3        (cp.feat.sm3 && xcr0_mask(6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -177,6 +177,7 @@ static inline bool boot_cpu_has(unsigned
 
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_sha512          boot_cpu_has(X86_FEATURE_SHA512)
+#define cpu_has_sm3             boot_cpu_has(X86_FEATURE_SM3)
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -439,6 +439,7 @@ static const struct ext0f38_table {
     [0xd3] = { .simd_size = simd_other },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xda] = { .simd_size = simd_other },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xf0] = { .two_op = 1 },
@@ -519,6 +520,7 @@ static const struct ext0f3a_table {
     [0xc2] = { .simd_size = simd_any_fp, .d8s = d8s_vl },
     [0xcc] = { .simd_size = simd_other },
     [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xde] = { .simd_size = simd_other },
     [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xf0] = {},
 };
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -588,6 +588,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
+#define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6890,6 +6890,12 @@ x86_emulate(
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
 
+    case X86EMUL_OPC_VEX   (0x0f38, 0xda): /* vsm3msg1 xmm/mem,xmm,xmm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xda): /* vsm3msg2 xmm/mem,xmm,xmm */
+        generate_exception_if(vex.w || vex.l, X86_EXC_UD);
+        host_and_vcpu_must_have(sm3);
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdc):  /* vaesenc {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdd):  /* vaesenclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7762,6 +7768,12 @@ x86_emulate(
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
+    case X86EMUL_OPC_VEX_66(0x0f3a, 0xde): /* vsm3rnds2 $imm8,xmm/mem,xmm,xmm */
+        host_and_vcpu_must_have(sm3);
+        generate_exception_if(vex.w || vex.l, X86_EXC_UD);
+        op_bytes = 16;
+        goto simd_0f_imm8_ymm;
+
     case X86EMUL_OPC_66(0x0f3a, 0xdf):     /* aeskeygenassist $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xdf): /* vaeskeygenassist $imm8,xmm/m128,xmm */
         host_and_vcpu_must_have(aesni);
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -277,6 +277,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
 XEN_CPUFEATURE(SHA512,       10*32+ 0) /*A  SHA512 Instructions */
+XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -262,7 +262,7 @@ def crunch_numbers(state):
         # for the XOP prefix).  VEX/XOP-encoded GPR instructions, such as
         # those from the BMI{1,2}, TBM and LWP sets function fine in the
         # absence of any enabled xstate.
-        AVX: [FMA, FMA4, F16C, AVX2, XOP, AVX_NE_CONVERT],
+        AVX: [FMA, FMA4, F16C, AVX2, XOP, AVX_NE_CONVERT, SM3],
 
         # This dependency exists solely for the shadow pagetable code.  If the
         # host doesn't have NX support, the shadow pagetable code can't handle


