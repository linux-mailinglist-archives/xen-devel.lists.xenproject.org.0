Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41AF6D65DD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517929.803943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji34-0002ey-1U; Tue, 04 Apr 2023 14:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517929.803943; Tue, 04 Apr 2023 14:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji33-0002cZ-Tz; Tue, 04 Apr 2023 14:54:13 +0000
Received: by outflank-mailman (input) for mailman id 517929;
 Tue, 04 Apr 2023 14:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji32-0001Yx-68
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:54:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e50941e-d2f8-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:54:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:54:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:54:08 +0000
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
X-Inumbo-ID: 8e50941e-d2f8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqMVr+pBuiHEIto5vREmKrSTnfKifscS241O+gZshjQfduCez2NvwjTQPS6brQAbUZEtX+u8a9Dd4tsC8LOjZhpp3Lb+sorgFqcpEe6wcmSIaHQ0o0MXIInM339zIncc8xeFVujdpFPfIsnAuTg5PBvIpUB/EVl1IFKXem185XgxNU+f5cxpho/pIScUgmjtHNb2RhOMoe07MGQ+7cWgnDCJHf2jIyCNVqxlVbOjjM69E1I+MQ3xEUB644TzlqnwtIMX5KXVf7zB1oJRHIDdw5JrZIL48Yc2NfbYm4NgQxcWVuicI8RmNmD/DInwIo+ps2P/ayU8zir1t/rc0NXR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgzA2b+QjSJL+b8+vIb+DCUzhUIrjTWFIjzTmH58pdU=;
 b=S2ePVGxgBeb2+di0/h/ZVhxwElxcKExG+Uq+HqR9pMXds19bBGNKS9VlNUFUGJdyQIbkoSvkyuqLzMrPWSdXzV8WJGu+B0Ox+Xkk631SnfOvdZa76gewsm3W+UBnPMsXjISzMoI7KjmP/yfsFZVs5pIFeYEOymRuDWorlD60nmZGUUvSZMudU6SUR5iWhLu1OhjKcFBOZETVVVdYFThrY3fTSDmJrUCvyggrfWHhLr4853YS1uF67PEvU+DT/sIbqzgvxJ3IjK4a7KaXUxUZyxvvhaJlkP3ArkjwbahuYIW5JlW49hZ0avYP9TQ+v91EwDf2NGzp4rXfv5mWr5D4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgzA2b+QjSJL+b8+vIb+DCUzhUIrjTWFIjzTmH58pdU=;
 b=Avscmj6hi8aM2ZxA2p40X0iBRXVU+5ozJKtMKLfRBszh7FNQbzgAFQs5N0uul6nYsCgHvZPBQQutXZniMa9b8huxeHvVPxZ4BViJK+iO/i3BIgyw5/puFAPfiH4OhKx5pwykcCmoKfY8MLqruVVDIJNPMow/vsGfwi0DAOH7nscJnTmsGDav8Eu59WB3vF5PkYivB5AmXe+hcQ9M53RbJfeOclC6Rl77gPRcMeFbxAD+gq+xQlFXDrjqweiyOfctJ4myZ+GAKDP3MPZ+7do1q0/xZxuNv9oTGVjzGgeI+O6rDt58C22rZvb2xsonLKMVceIUHA6iIwEQulxoOzCH7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5c21de7-8802-9226-82f6-505c8f4d6ac8@suse.com>
Date: Tue, 4 Apr 2023 16:54:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 7/9] x86emul: support AVX-VNNI-INT8
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: f819c972-c97e-4025-a410-08db351c71bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DWC1w/V8N+y1potYInB97EcDZQSxNdQ06+hBP5SQ22WoC8xATDtCJ0RaAn3VcdByWa6rmeirEzyx0ZUphZXTcY4LLUkBWJC+ug+ry1KnSMDlzoRR7c98ory61W9ofGyB/rFmDKTLIu79vElBlNkPRAaqaNMdzD5MUZSF6JxquFTqyi9AwdOsT4uFMFp11o2mYYZzJZmPOdnMahq7y82XPqPGfshbLkU5SUYv2WVvVbK4dP1btjmOl06TTGkk94i4HeSntXLYM2oGJdlR3FL2s5Yp6gOKpgVgU6jUkMyh9/YREIg6Xzl8bA3FMuSPBUo86N46tTXBYW42AUweWKZq5g/oSbo3gPn1CeHtFU1takj73cC2yd5BkiCgZvjwlnE1sV5icBShMdZi0PtSuPVd3ZHKCZytgqT+paZ04N7nQRYT481XNgRmMaWtQcBDMEbiBKZxqdnIBMqplWOxBjwoY4bFJrAwJJkappOmbwqRLnWgrmsu/rUOBvy8zNQTrysQor2D0Ho+6uUti8nLLJU16UnsQ911CfoM0Z1eQv0/Uxvto+dL18SQjc3sYp5MHQmVMqkUxMVG+le2Zxiub+tt0awx+apyP6jkzOaCHrAxotL9CQt83yEiEkpKBXMcm19LQmlEuKNeH0TfNt4tUQysYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(66556008)(41300700001)(8676002)(4326008)(6916009)(66476007)(66946007)(316002)(5660300002)(8936002)(31686004)(54906003)(478600001)(6486002)(26005)(6512007)(6506007)(2616005)(186003)(83380400001)(31696002)(86362001)(38100700002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3d5TlpxMmpQOCt3a2N4cWdqOU9JYkhaYU1ScDMrbVpCVzJ2WFF4cHFjZHdX?=
 =?utf-8?B?S0ZpUE5EQm9TQjFFMTBiL29XY2NESlY2dkdaRXYxbjNNaDVEWksxeXV4bFNr?=
 =?utf-8?B?S003alZDTGlrdUVRS01DbVVXQ1FHa1hZbTEyZWRDWlFSTDMySVlPU2tWeWxC?=
 =?utf-8?B?YnhmR3h1QmQ5WEZzTlRMZ3pNSUpZQVpxbDVtTzg4SDJFL0U5NnQxWCttQ0pF?=
 =?utf-8?B?cTA3YjcvQS9ldVBHZEU0UDl6YXoza2ZhM1lxdDJtTkk5OWdIeWpWWExwdHEw?=
 =?utf-8?B?SkZ5eStRTDNkUUNaZmFNYXBvUU5NMmI0dkpIRWFqUWRyZHBPdysyYS81ZitH?=
 =?utf-8?B?NVNHN041ZHVUenpyUCtPUzhLbWpycUMxTksvZ3VkZGVXSTR6QUk3WnhZNlVU?=
 =?utf-8?B?OXFZcWZLZGxsSUxJOVR4czd0bElVNVVGbEhYd04vSkxwM2tKck4xdUI1VzlF?=
 =?utf-8?B?UHBxVVMwemZBdlV0eEJGUDdJZmw0TGhLOVhjNXBadVp6elN6S0pITWdpbTZP?=
 =?utf-8?B?dW9RdG5RNGd6UFMrVVhFMWtpQlpoOS9rMHo5NVg3SWdTVHVrOUFtTXI1Ulhy?=
 =?utf-8?B?ZXRLQm1KVGRJWDJ3L2F2c2tRUDdja0VLTGwzajhUaHFiR3YwejI2QUpReUJS?=
 =?utf-8?B?alRFdldYSXhNUVMxNzJ0ZWF0ZGxlZkpJTmU5aCtHR2NYTWNWaENkK0lTczlk?=
 =?utf-8?B?MjhEck5JczFoSnNoRllteld6MXp1S2F4TVNzZUpKdnRvQUxiZ1Voa3RkUkx4?=
 =?utf-8?B?aXJwVXJNK25IYWY1cVBlVGNhTXk1ZFNCS3lSRGZhTEF5elBTNklWSjJKcW9K?=
 =?utf-8?B?eDl5dklRUHVHZmpsMHZOMVg0MFdZYmhuaVQ5b25ZWGNxVG5sem5jVC9ud1Ur?=
 =?utf-8?B?S1UzVGV3bnAvSVlPMmp5bjI0UHNySmxlNU1pSW11UlJ0WDRpbzhwUkdXYzM0?=
 =?utf-8?B?Z0w3Z1hEdExFajdUMmFldFI3RmdXVGtKRTJYOU54U2RtN2lZSSs0V1orTS9m?=
 =?utf-8?B?WHZEQVprUEp2dDRWZkNScy9LQ0tXRmRBS20wdHlxcTFNTVJmUUpqK3htazdw?=
 =?utf-8?B?YlV4RHFLZitBRC9pRlhGT0QxN2xqQmE3MlNKR1lXRTFMdm1jWXpJQkc1aXV5?=
 =?utf-8?B?QTRqZmtmV2pKR3FFRTdza0cyODJOQlhuMlI3OEpWQ1UwaERwZEVqdFNFbXl6?=
 =?utf-8?B?M3NpVHVmM1prMThPbVZURkovdEF3SmVGUThKbjZMVDBNb3VNbFFaeU9jYThy?=
 =?utf-8?B?NXd5YlA4Y2FCNmptMjBIbVl3MXRKekdXZzVtYjBhM3hhOXY5cEhpU0ZLSDRu?=
 =?utf-8?B?TnFMUWRnUHUxL05hMjBUZFZHWlRSanJOSnlYbHI2ZU5ka0xPcWpkcDVTMW9w?=
 =?utf-8?B?RnRlMWhvMUlFbEwrZWZpSUpRQmUwQXBLRER4NVFlMENpOGFTZVduOGc5ZmhV?=
 =?utf-8?B?eG9TOEdveXpnc1JQUHgwQUxqQUNYRU12b0puem5BRWttS2VTc2ExZ0l0ZGFY?=
 =?utf-8?B?RnM2QWN1ZEx4c0tLWjZPZkxTTG5ka3NnWmRReG1QTzlUMzJVWnRQYkd4aTJw?=
 =?utf-8?B?ZzR5NHdqbmE3TGJ5RzY3QS9tNDNsTlhLdXRkcSsxUURIZFVxcy9ZUHlLekJZ?=
 =?utf-8?B?cG1lSEluczBQY3hlR1BCMDFEem0vSmNsekl1V2doNW5tOVZBblVoZ2dPakpB?=
 =?utf-8?B?Rng5cUxFM21XTTI2bjNRbE5heHM3OXZWcWN0ak1vQmVUTTUzRDcxbnpZd2pu?=
 =?utf-8?B?TnVZWFRSV3BPeFF2MVk1SDg2V29KQ0QxOWdXZ2FJN2h1WENXTytjSmNkM21l?=
 =?utf-8?B?dGkvckVuMjFOTGlLMEthL1dTNzl5b3NhM0ZzYmhQakRoTFY1U09NSkxuRHlx?=
 =?utf-8?B?aHkwNkUwMFVtOGtBbmFvMDVpZWxzZ1lDeWlFaGsvMWwvcnU5bWNiMHVvem9H?=
 =?utf-8?B?WlpJcWJheXBpYnkvM3g4VUUwWkU1ZnVxbWk2L3dzTGphMmtjZ2FUMW9XRlli?=
 =?utf-8?B?YmZXZ2YybVd3WVR2Q3hZS3NmeXNHU01OZExwNFFZM3NXMmh0dG91NzBUcHpN?=
 =?utf-8?B?YWRraWxkOGFmS3Z4RUdoVCtrNkhYc2g0bFgvaWx2UTZSc053L3JKeTcwUktx?=
 =?utf-8?Q?D3aLiEKRmXlV3usLQw768beWQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f819c972-c97e-4025-a410-08db351c71bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:54:08.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxV+/LR6ER9vkq5LIrPPGeHnYL7/9QtLN1mrGYfNQe3N/LfXEc5dxFM0u2XzwYzOTDs+Egtv2rSWOCEoeGyi/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

These are close relatives of the AVX-VNNI ISA extension. Since the insns
here and in particular their memory access patterns follow the usual
scheme (and especially the byte variants of AVX-VNNI), I didn't think it
was necessary to add a contrived test specifically for them.

While making the addition also re-wire AVX-VNNI's handling to
simd_0f_ymm: There's no reason to check the AVX feature alongside the
one actually of interest (there are a few features where two checks are
actually necessary, e.g. GFNI+AVX, but this isn't the case here).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -241,6 +241,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
         {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
 
+        {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
         {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
 
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -214,6 +214,8 @@ static const char *const str_7c1[32] =
 
 static const char *const str_7d1[32] =
 {
+    [ 4] = "avx-vnni-int8",
+
     [18] = "cet-sss",
 };
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1337,8 +1337,14 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
+    { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
+    { { 0x50 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssd */
+    { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuuds */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
+    { { 0x51 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsuds */
+    { { 0x51 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssds */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
     { { 0x53 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssds */
     { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -187,6 +187,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 #define cpu_has_cmpccxadd  cp.feat.cmpccxadd
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
+#define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -173,6 +173,9 @@ extern struct cpuinfo_x86 boot_cpu_data;
 #define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
+/* CPUID level 0x00000007:1.edx */
+#define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -600,6 +600,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
+#define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6077,13 +6077,23 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         goto simd_0f_avx;
 
+    case X86EMUL_OPC_VEX   (0x0f38, 0x50): /* vpdpbuud [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x50): /* vpdpbsud [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x50): /* vpdpbssd [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX   (0x0f38, 0x51): /* vpdpbuuds [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x51): /* vpdpbsuds [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x51): /* vpdpbssds [xy]mm/mem,[xy]mm,[xy]mm */
+        host_and_vcpu_must_have(avx_vnni_int8);
+        generate_exception_if(vex.w, EXC_UD);
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x53): /* vpdpwssds [xy]mm/mem,[xy]mm,[xy]mm */
         host_and_vcpu_must_have(avx_vnni);
         generate_exception_if(vex.w, EXC_UD);
-        goto simd_0f_avx;
+        goto simd_0f_ymm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x50): /* vpdpbusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x51): /* vpdpbusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -305,6 +305,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
+XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 #endif /* XEN_CPUFEATURE */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -254,7 +254,7 @@ def crunch_numbers(state):
         # feature flags.  If want to use AVX512, AVX2 must be supported and
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
-        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA],
+        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


