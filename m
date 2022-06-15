Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564254C609
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349909.576101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QFO-0002zG-B6; Wed, 15 Jun 2022 10:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349909.576101; Wed, 15 Jun 2022 10:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QFO-0002we-6V; Wed, 15 Jun 2022 10:27:38 +0000
Received: by outflank-mailman (input) for mailman id 349909;
 Wed, 15 Jun 2022 10:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QFM-0002mz-Ed
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:27:36 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe09::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5df4b41-ec95-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:27:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 10:27:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:27:34 +0000
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
X-Inumbo-ID: c5df4b41-ec95-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlA/jvSaQ8VNS/FZXyxJMY6+SLIRHz2cZ+YJdpzHH86yvIK5MoOhEMFAxjcUydKIWUx7aFXzRCSbawIWW2VuGHdMdSMxzCGy8IA9k1M+GiQSKuqmGH8TYNN++ffX9c2pZwZDa6K8wFqWitqMWtr7DBHUhFqfrZIPFVBZnug2HQryTDIGVScfeqT4apMuoxm0UoXIRb0EyeHDYXvgr6UfcgdWhbtLXkc+/QGBUfjBPuv+sPsRdLvAUv2jxJU8lfZeMaGn/068etCAUby35OwVFm2Db3zZ+CyQgr4rtvUPvyFb1qFDeZNj5PJELrfxFQUKcuDYlC79+3hHDnmn2Rc0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhN1mnRm3C+eBZ3ZOnL1xkngzkdjxzdw7LWEKU7f9gk=;
 b=iR5+piM3XauZ4tYzNJtB9+SdnfLP8JItA70U+hn7bVySDA3F0Mgso7Fz/RlQ/8392a5lZntCENjbDbs9X9ZGPLZD5Y/9MI4tLqhDPOo2OQ5K59bNOrol+VtB3yrRc0bErAjUPKkH77BC4hxSORLo7hQQHdnPy4csMASvfd73XiXmAc0D1n0jpT/CiEMfJpcOuLzvil3RAaujJHFYj80zf6IR7ECitGmwbvw4x+SG4y7KbwBnaglbnB1IbJa1S8JVdp7fdl2Y9UJ1GRwCpatDxz/hNKSO2xbpKOhL5g5sWWTxDmBoWFP+RBOnsAUkzVaCvKb/KhhVT2nO3z2loBelgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhN1mnRm3C+eBZ3ZOnL1xkngzkdjxzdw7LWEKU7f9gk=;
 b=OVM2p9s4vA/KHto0bZpl2oZteOOiJwRge3OaRkpXS1RfLFc4MYjSkZSxKfhhHKab2bUd+WhfgOCOkARD/phGdoqcVHWbgqFmzfwi77YwGCyM2Cm5vxUOG2BXqfr7f/exFZMfbWhicqd/ECzZQ0w0NYrvKLqeZGj7Wf6fMkB7G3roQM512zxdMYLnSU7wZS/gT6/9QQiGTDodmG9CdSvhDTYwRTAJUAHitilylaYV6hqDXrQVw3fnSCOPMt7jAqDh6LpE02SBIOY2VBUt4rJ0gcHJ4Sgb+KJYavH9nV6B2FWyx4rEF4SCYwUVGpzgxde6HeARaDZ/i8mU6Tgkjzth4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5dc84e7b-e3d6-92cf-8ffb-c4bc0a3e6c74@suse.com>
Date: Wed, 15 Jun 2022 12:27:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 01/11] x86/CPUID: AVX512-FP16 definitions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36073096-f08b-4e27-b831-08da4eb9a8e8
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5113AE74701AECF17A9F0576B3AD9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BBQf00mfNF94/VmAiokwJ2CRAuqgiFeBt6VOPvC6ls0f3bDqnK8WtXziNuCL3/j2SfRn9pI6g0FRGIUc26unbAtkKug7Vbdz/jTcRVnB0X7OyPq9CmRsCZmaPHtM3vYx+bTuPHa4QJGSwTRwEgTG1Uz3TRbAv8OTJyN2/+VksLpsmOO+oBjggGborUEw4piExjh6UE7ykvG5VQMttqthRKtiMdJnEKCNJr61g76WGGkIgE8vgmViqTP4HVs96bMEPHIyh6Nw/TJI3SfngUd5OOnv8NCzhjZEUOqRzCt1PFJqSIrb0NJXq+ND+xIQjHyjRQuBznLz0Ya4D9MVj3sG7BViEExUrFqlCZ4gvXhhvgGaywL8mZRanz/r9EypzvxuFr6GKmpj30/7/hqKYNHpFMSOAYeso2imQUfwqMSil4B6HdquoxUGpeqDBElpheqbxK9ucvNJKdrrsx1Y9rbD6lXj0p8UqACFC/bCDMQib5RQGw3xozHQqoXFjAmdHx59VJh7bmFi+BuTu6tOo4J7o62UAYyDLBSLgnCvJYJUqmvMJvG8X+eI6uv+/DwEUNHjp7fFRfBCdbMQ79g6afdC9P0ZLHpB3D/hFVk7abYdaZ2PTVR7OE9Gmbu/rS8/hC5mLOILp3nC7EC+IP/sc+agPbpj5PNblIJBa6z5XMHaexj8JqqJsT2uYLax5ay5YQpvIZQYFLFbwudc85XQ1Y1pydIFd4ZVtlRQXAwijFd/sbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(36756003)(508600001)(38100700002)(6512007)(6916009)(8676002)(31686004)(4326008)(6486002)(26005)(2616005)(66946007)(66556008)(66476007)(2906002)(31696002)(5660300002)(186003)(86362001)(6506007)(54906003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3I4TUVFNGJqa2RlZGJmTWFaNGxZNHlCNUJEZ2NNeEhzM3RlK2dPZzR0MElE?=
 =?utf-8?B?MUFJWW5kbDhvQWRkUm1nbWgzNHVaTGlnL2JtSEthWHAzRm82bU1CV25rdzk3?=
 =?utf-8?B?a2RmUzg0NHkyTGlSV2pRVEZOY2pyd2JJTDk4am9mTUpJUGxzMDQzTW9lMEha?=
 =?utf-8?B?WGdyUy9CWnVjR1FueG9XSUIzUXRZeHl5NnQ2VWZ6cm9nZE1yQ1pGRnZWbWRT?=
 =?utf-8?B?MzFHNk5yZFpIN2dDVU56Ykx6djhwQk9vWStzbzJDanllSi94RXFWM3BrRERY?=
 =?utf-8?B?dE9FN0wrZkVBNjdOazBzSnIwVlpkeW9OVFFlSVBYSFpHUGYwY2VwTDdnbjdU?=
 =?utf-8?B?ZmpRVU9FZmNrVmt4UXIrejZzQU1BbDJWMUVUVkR2UTJtd211V0VrdmQ3czha?=
 =?utf-8?B?TUY1NXViemdDQ3J5dzlLV0p6NGl3czVURVg3TVBscWRFZ0xsUmlEN1VDSlFy?=
 =?utf-8?B?dUwySFd1UUlRYU5HTnJLSGJSWUVJZXhnUE4xSTN1VzcrRmc3VWcyZytab3oy?=
 =?utf-8?B?QVFRTkFZL3lMcVFNSVRON3k1cmsrVWtLNFhvZk9VcEU3ZFpOY3JnM1hNcXFV?=
 =?utf-8?B?VUhRbjViNWxDOHFyREVIcEdjQkpWQU14UXBQY1h6UVFGVVVIQ2tJeHNGSTg4?=
 =?utf-8?B?ZjJqaERSNUhaUWd4dnVueHF3MDR5cm0zK0hwdXJpS3ZWdkVDaG5GRm9ZRGJ4?=
 =?utf-8?B?dERSbEVLU2ZjWWRWRkNla3ZpcXN5ZzBlTVJJWTFtdk5oZUFkN2RuM25Ec2JP?=
 =?utf-8?B?Nm14ZjEyVWdWbWZxSzZYQTkzblNiWnlBOHlqYVBOaXlSRnRiK1lsd0hFYzdW?=
 =?utf-8?B?bnZ2R2ZiOElqVEdQWnA3VWJzaDYrNVBBTEg2M0FzYkczcVByY2ZyQ250OEVO?=
 =?utf-8?B?YW4rc3ZBV0ZoRnpRaE1zNlBtaXpjZENtcENIc1o1ZzY3RnRONG5MT3Nlak83?=
 =?utf-8?B?elJmZ2xKajdjRmxSMTdZOHF0M05qSXF5aFppZkNUejduTlFQQ280MDJMTHJE?=
 =?utf-8?B?SzYzVklLcWNsd1FPaVhlbm1CbU9wQWRXa295WE5lTmRiYXhseTRvZTJSZ2E2?=
 =?utf-8?B?MjlmbnVDUTdwMy9SeXFCblpyUnlPcm9vanpNVzNOU2lpaGlQMDhFRjAxWjJJ?=
 =?utf-8?B?d1EvT1I4UGZCeFVzSmdlKzJZY0kzL0NEc3ZraDA1UEZPdVVHd01jMG45QTg0?=
 =?utf-8?B?UTlGc0RmWmZtK25FeU4yVFhHbzJ5UVJkMzN3VDVnTVQzZkpmK2gvT2pXVUdz?=
 =?utf-8?B?RFUyanpBVGV3MUF4QUZCdUtWUXc5Ukc4L2Rzd1hOOU1BaldVNmQxSGVCbzlv?=
 =?utf-8?B?VnNOd3p6VHdUQjdxaW1qYk9wdHcvOHphTU1pRVBsRHNsd3ZaVzl3MS9DV3pF?=
 =?utf-8?B?VDllZFJUalJuUitVazVhbFMyc2UxbngrL1RPSHVXWkZJZmhranFZYS8yTjgy?=
 =?utf-8?B?MDk4dDY2V0dCWW50ZWMveVg0NEJxVHhlM25hMlNmbU9sUVRCblo4a043Vkxr?=
 =?utf-8?B?K2d3b1JUV3JWU3JmR3A4ZG10L0tFQy9JUjN0a253eGlsakZ1WmNyL2FXbk81?=
 =?utf-8?B?TEkyQmdxNUJwSHlzMm0vY2JvYXozOWFvSDZRMlNXUFRZRnF6RDVkRHd0VCt1?=
 =?utf-8?B?M0RuSGxJTHFyMFZrOXVmNkRGN0xNSkVVK3FNTXBER0tOK1M2Ylg3N0RxK2k1?=
 =?utf-8?B?YlF6cm5ScVN1QzBqUVl1WTlvYmd2Y2lUSWFQTFVtV1RwRnBBMGF5RTlOdEh0?=
 =?utf-8?B?QTBVUlh6UXNmazVKTUpKWEtFLytrVFh2UmpTT21GeThTNDVtSGkzcXR2eXY5?=
 =?utf-8?B?UUZXaWVsT2dlVk1SZW90aTFUMTdEdGlDUE5GYktZWVJxZTVZSTlxMytoeUlM?=
 =?utf-8?B?Z0E4bnpPTjRSV3BKVk5wcFBoMDVQUll3MWVqR2h6WWtNUmdSWVdYVEdHR0k2?=
 =?utf-8?B?UUZTYTJoRTZOM2FmT3Z0a1VwZ2psbnpPZ0hEK01adnJNQWVHbjUzVXV1ZmJX?=
 =?utf-8?B?bEQwSXJ6OTczbWhxWGhEZWRTOGIydExWU1R4c01iWkNhOXVnejNyRXhsREtR?=
 =?utf-8?B?cEJRM2JSS0NvRmJUVDBxQzlhVzYrbTZoWEFYUmNpNE5VV0Nwd2ZLY0dNSlhN?=
 =?utf-8?B?cTFleWVPTVJ0L1FDSk40ditlbklOSkNqVXVlR1hxdHF6NkF0NDVvWUFzZFZB?=
 =?utf-8?B?VFQ1aVAyWVRON0lXZTRFNzFPWWlESmhJanhXaHF4Z2tiUEZIZjBSM1JJS3N2?=
 =?utf-8?B?NnRGK3ZsM0w4Qmp6dzVKVXpSSnZRSXpkWnNPa1RldU10YitxaVo2WjFTNGtX?=
 =?utf-8?B?N3JTRU5LY2VaN1paOHdQVk8rbHFCanl6ZDU5V25najl6Q29UUDVhZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36073096-f08b-4e27-b831-08da4eb9a8e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:27:33.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6QlyTTOekx/5tOquLxD+l1jfCdlm4NpYA4e6nRZRGEW/fEz3KUfciYc2OBYAR9rBw1Y4tNDV0c3M4WYtl+JoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -221,6 +221,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
         {"tsxldtrk",     0x00000007,  0, CPUID_REG_EDX, 16,  1},
         {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
+        {"avx512-fp16",  0x00000007,  0, CPUID_REG_EDX, 23,  1},
         {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
         {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
         {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -175,6 +175,7 @@ static const char *const str_7d0[32] =
     [16] = "tsxldtrk",
     [18] = "pconfig",
     [20] = "cet-ibt",
+    /* 22 */                [23] = "avx512-fp16",
 
     [26] = "ibrsb",         [27] = "stibp",
     [28] = "l1d-flush",     [29] = "arch-caps",
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -138,6 +138,7 @@
 #define cpu_has_rtm_always_abort boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
+#define cpu_has_avx512_fp16     boot_cpu_has(X86_FEATURE_AVX512_FP16)
 #define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 
 /* CPUID level 0x00000007:1.eax */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -281,6 +281,7 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13)
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
+XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*   AVX512 FP16 instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -267,7 +267,8 @@ def crunch_numbers(state):
         # AVX512 extensions acting on vectors of bytes/words are made
         # dependents of AVX512BW (as to requiring wider than 16-bit mask
         # registers), despite the SDM not formally making this connection.
-        AVX512BW: [AVX512_VBMI, AVX512_VBMI2, AVX512_BITALG, AVX512_BF16],
+        AVX512BW: [AVX512_VBMI, AVX512_VBMI2, AVX512_BITALG, AVX512_BF16,
+                   AVX512_FP16],
 
         # Extensions with VEX/EVEX encodings keyed to a separate feature
         # flag are made dependents of their respective legacy feature.


