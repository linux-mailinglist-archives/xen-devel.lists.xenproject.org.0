Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5026FB010
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531492.827207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw01z-0003EL-Ih; Mon, 08 May 2023 12:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531492.827207; Mon, 08 May 2023 12:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw01z-0003C6-Fv; Mon, 08 May 2023 12:31:55 +0000
Received: by outflank-mailman (input) for mailman id 531492;
 Mon, 08 May 2023 12:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw01y-0002dt-AW
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:31:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe1b792-ed9c-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:31:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:31:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:31:51 +0000
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
X-Inumbo-ID: 4fe1b792-ed9c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgUqpLVM9osGYUCCHVtiLDUssvjgYEB7tTIeQqFMUDUQM+2gNjFBQ2FkJA5viNURw89rBYUzqbe9RpfrDrrmnmmhoHUZtjjCsLD6W0c2iokMPpTSBDqxzypH0iL2/FOaIr9ZCyccvftw16TytMgLkfNWYiwzRpBSnwz3NI7zfsrDHXnQaDQEQWjPfbl8oSkAq/gE+R5qvPIN8FQWBeY6eUN/fb/D4YTlcnTXfbHzj4K3GDP6cLPOtACZuRtF55/tz2VbLSFOWfEuAoidfwOGnF9mzaKDbGWbzs/MlEBQvJspdM4nPQ+ztK9jW30ESu7LYg9untlwuxNqBrMc4ve5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrPGkiGtKBG+qztGkkVUfaZrvhhRCY5QnAOoKkRTviA=;
 b=DVk7adZOKnJV/1afhWsAxaH858C6T4nXKz1wjAUPbqiogaYdWg/TSgckBJ26jt2L+/HTqD3tRkY125XnA0I0yoqg8QseCH3+AIdGoyI3oRZ8yrqufaMugAcDaCXcVAruVlUp9FfLQTBAMyCd4VUyob8LQdCH2zXU+fx7cS4sOV8FjJWj+ZN7BQ13dHtk/ezr/RJoZRi9CzIkZ2jRGhroLw7kgBXHCSDuPKYHr/v7el3HZFkKx5L2mWT3/ARWz8O/ExhoWgszOmsd4F7LO0HoLLtZLzyihmkr+hH9GFIHK9x0EyQzuAqivTil+SP2PbqmsYTVftGeDAPIritDB86G5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrPGkiGtKBG+qztGkkVUfaZrvhhRCY5QnAOoKkRTviA=;
 b=XKCaGV2E+S4YRgwLx8E41DpuF+jIVfBqx4jiRB7x0/OJ6brmE76xlvkIDp+jjAxX39ViCo/C1sC/BecMei3MbXBwxu4UoefZ6ux94AIzW/YJcaqbLGHLaWcDqv5eY143fMm71XEqFz3vbmgfIxWUIWDv7q8JvesA76VVy4l551nc8472e3Bc6Sxko/0GOtZBVsaVEfWBQWtEqA1/azliUR0Mx3ajVGteVdgrpRq2fxn3tdV4Y75BWnJ6Ams3wq1AV77fTjkpNAP2OKpWuOxx570+IQiqIz9LOfGlTf36hYz64gS4FeQ2AOiAyhnqwSZi7y3p1xBOXCKV9Rv9o+0nxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45cc879f-5c98-e0c5-e791-7c297ed1eb41@suse.com>
Date: Mon, 8 May 2023 14:31:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 1/4] x86emul: support LKGS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
In-Reply-To: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: a4af7b62-c000-4906-c034-08db4fc03335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HbLWawHKETiXsIm2+lJd9OK+CEWuGwwZMuYpw17Fl+SfP+NbDfSoZ0LmACpOBhWJgHagVpbTCNlJmJAas6DXataCbW2/TfMzED8W0fuUEK/xXLvmUAojg/mtuF92h5HhpPUbIUNKCnhbiKwu87cWy5OIbPT6l4P96kE/j3ZwWALUD+UBYpzilL2se3NN2Fpywtl2PyVM+UY9WgfjMTJLjNrCwZxuz9MwgIzrKrhoaRQA/z8DfxNSKgoHz38ZC2ch4Vvpm5AqvQU/rbFtfOwk7QjtTQP+E+j82mVSEAmF7VG5u687Ca6X/TJ+C+AMHlIrMc7r4jjrcMPVus8vjUJTg4JS8JyXJmw9B+pjqZWo1vF4rY8/M+lq0DVSyKSeN6j5lnFcPg1E15rUYB1Fd79n+/MxKj9h312JI2yakYYVTAitfUY3oOGotjuBfknAAqQcqrZEumyLXJtJ+XPu29y0MJot/k4kWKcv+NDR8ik5aENIh1QM+wEH/vGGBXP9oE9sT1dAuGMhlyJtH9ZpJXLg4tnCGNRJS6DDQx45Lf2FfA0ZqDqjJQC7IeRQ8qg6X+dy/DEAyxJNe0/cLhr00tyDT98Tr6eV9XmRKgtBixmX75hv51sEGTMPqwi7fpb3F1ejrnEQ9fjMJWy/cCc1VWOBNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(136003)(366004)(396003)(346002)(451199021)(66476007)(86362001)(31696002)(36756003)(54906003)(66556008)(6916009)(4326008)(66946007)(6486002)(316002)(478600001)(5660300002)(8676002)(2906002)(41300700001)(8936002)(38100700002)(186003)(2616005)(6506007)(26005)(6512007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnhUdkFFUjVtUWU3ZVhkbS9RQWt0RDVYSHR2VVdXSDNQRkFRNUh4V3AxT00z?=
 =?utf-8?B?SnkrRDltbUZlclJUaVVxalArd0xxT2xOa0ZwTGFaWFpjSm1rQ0pHUFkvaDJZ?=
 =?utf-8?B?WG0yNzd5cTczQ0pJWCtlb254MnJWMHlBWDBTSnVFZ0dGQ1N5K0l0UUY2WDI3?=
 =?utf-8?B?Tjh3dkdPc1hwS3VuSTJ6OCsyZThsRXBVZ3JTcldZTHIzNFIvRzJJQ0YrcVhO?=
 =?utf-8?B?NS9sU3VRY052UC9nR21yeDRaaGNYTGQ2MTJya05JaGI2M08rQkgweENDVHMr?=
 =?utf-8?B?T1VWeVg5bWU2WUVCSHV2OTJOaGsyODkyK3VMK0plN0FDY0IrTjNQWUhpclVD?=
 =?utf-8?B?Y2kyZzhZbkZmV1hXSGhpK1c0VGxaZkc2TmxuK1pnUUxxbnM0R1IzMWxkRWlO?=
 =?utf-8?B?RWIyWlJqWXJQMnV0L2Q3VUlYb0xSU0V4M09aRlY3QVBOc2VLMzN2TFRjczFU?=
 =?utf-8?B?Y3Zwbk1qTDJ5MFpYMG5xWWxudHFmK3R1MDV5ODJKWDZqaE1TODlXaFQ3Ulpp?=
 =?utf-8?B?dU9MZUJ0U2Q2UG1udEp4U2VFVzNIUm9GYVNYYUsrRHdYWTE2ZUwrelFubzFL?=
 =?utf-8?B?aTQ0Umx4K3gyd3pBbEdscXE3NWdvVXF4K2t3SWcyNW9jSzkzWkNXUGl5TVVY?=
 =?utf-8?B?WFAxbDFkYUZUZ0ZzS3FTZXZPU0Y1Q3JyZWpjbFYzYllYSG92QU9KSVhoK3Na?=
 =?utf-8?B?T2p4WHRtaFhWS3hpL1VVTXpSUlFQdWJlcW04ZWsyZ0g3SGZlQktXUHJKSlZ4?=
 =?utf-8?B?TjIzSFlyY1Fkb0E5aFFPQnFFM0h5SXlXWlRDYVpXYW00dFJUYTRvaVhKOXps?=
 =?utf-8?B?V0ZhOTVIU2RRbE5aNGFROE1yeUtrUVQ4VURsbzF0NUV0VC92NDF0c2hQUUNH?=
 =?utf-8?B?UG41ZTAzRGhOVmFuTllFVXN5Sk5qV0tDY0RwYkIySVhTdDZvS2NaakNmN3ZL?=
 =?utf-8?B?NVNodWlYK21rNFJKb1dTVEFLODNQMjBqR2tTYUtjRjdFZFJNbVJlUWtpMzhO?=
 =?utf-8?B?QTRURHFzSjUzWUtPOHJPSjVtakxaQnpNWEI0S29ZL05nK3Q0aDI5bktmOFhR?=
 =?utf-8?B?VmluOUNabzBFQVRGWVNTbG9KMzRCclVKRlljTE1UdXBndGg2YURveENWZ29R?=
 =?utf-8?B?aGNRYWxZNnpLS2M2cjROT0xGRVYzY05CNDM4VnBkZW9wMkluNGlmU3lsa0Iy?=
 =?utf-8?B?S0ppd0lnSERERE0zTjZ5SzRqS2xtSWg3Nk5ocjNVYzhnQXlKMEZwa1A4dkJH?=
 =?utf-8?B?WTRYeWZCaGM3STRRVE15dTU3a01GYjFHRWR2VzRaZDZ2c1lDeXJpS2NmSXRk?=
 =?utf-8?B?QStSL1BsTTlscVhSWDAvTG9yUWs5cFp4Q3ZERC9GcjgzSXpDc3BGWUVQZ2Q2?=
 =?utf-8?B?eWNZdElLV2p3Znp1WDkxRnZ0RW02SmZIQzF1dmU0bjRkUFNoMS9yY1psUml0?=
 =?utf-8?B?VHFIOWRHRWdPam5HTzJTRXlocE9KdXZFN0cwYWlwclNDWWR6dmkyMkY2VTUy?=
 =?utf-8?B?NGhXNWpxZk4wUUMvZmE4WTQxbVd0MG5aTEpEUmdUOXRYUGlPYUI2TDJwTmtv?=
 =?utf-8?B?d2YxaFFYYTBva25xdkt2SWxTclRpbG52bVVLUlBUTVNDbnMySCtDTEk3QU5Y?=
 =?utf-8?B?TDY1aUwwRDhVbTJQNU1jSDBCM1Baak83YmlYOEFaYVRENWNKUlNLRDNEMlVC?=
 =?utf-8?B?Q3JJQTA0N0JqOEdXVWxaeFJRQ1hvUjdDZE9oem1WVnMrekE2cHdxQ0lMRGFH?=
 =?utf-8?B?ZDZpd1BvZ1FMcW5Dc2JROGpLYU5xeURFNVJoYkVPRVY5bHFONXc2MHJLK0dR?=
 =?utf-8?B?enhyL2JTRWNTVDZUODRrc2libFlMTTRxUitDSzhaRkxQTGJrUTFSTC9rdXpq?=
 =?utf-8?B?dzQvWHg5V1Rob3lOblV2Y1FUakhYOHdIWGp4SHJZSjdkVG5GeW9ObURkWTE2?=
 =?utf-8?B?WFF3VFpVRlpUOFlaMVpldGZBZlJKTVpwZnE5SUlRd3Rnc3ZHWE1oeWhMR1g2?=
 =?utf-8?B?L2VNQVJOTzlyNnI3aWxHMEVma2xwSHhoMTR0NXNTalhrT2hnL3owR1Z3Zlln?=
 =?utf-8?B?RFJBZVpqZFNhOXVDWjdlc2tnNkZFS3VkVS9Gci9OUFEwSUY4TWlWRWIrZlhv?=
 =?utf-8?Q?HEfI0UcUamx8dRxvmOQcFFCF4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4af7b62-c000-4906-c034-08db4fc03335
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:31:51.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY3IlyLE57KTMgd9iqgBZl+wZ1u/2iZ2HWbmqt270FUcNdMBB6XuBIuJmQvHir+7g39vjPebMZ2hHumcjY19jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

Provide support for this insn, which is a prereq to FRED. CPUID-wise
introduce both its and FRED's bit at this occasion, thus allowing to
also express the dependency right away.

While adding a testcase, also add a SWAPGS one. In order to not affect
the behavior of pre-existing tests, install write_{segment,msr} hooks
only transiently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of ->read_segment() we could of course also use ->read_msr() to
fetch the original GS base. I don't think I can see a clear advantage of
either approach; the way it's done it matches how we handle SWAPGS.

For PV save_segments() would need adjustment, but the insn being
restricted to ring 0 means PV guests can't use it anyway (unless we
wanted to emulate it as another privileged insn).
---
v2: Use X86_EXC_*. Add comments.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -235,6 +235,8 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
+        {"fred",         0x00000007,  1, CPUID_REG_EAX, 17,  1},
+        {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
         {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
 
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -190,7 +190,8 @@ static const char *const str_7a1[32] =
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
 
-    /* 18 */                [19] = "wrmsrns",
+    /* 16 */                [17] = "fred",
+    [18] = "lkgs",          [19] = "wrmsrns",
 
     /* 22 */                [23] = "avx-ifma",
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -326,6 +326,7 @@ static const struct {
     { { 0x00, 0x18 }, { 2, 2 }, T, R }, /* ltr */
     { { 0x00, 0x20 }, { 2, 2 }, T, R }, /* verr */
     { { 0x00, 0x28 }, { 2, 2 }, T, R }, /* verw */
+    { { 0x00, 0x30 }, { 0, 2 }, T, R, pfx_f2 }, /* lkgs */
     { { 0x01, 0x00 }, { 2, 2 }, F, W }, /* sgdt */
     { { 0x01, 0x08 }, { 2, 2 }, F, W }, /* sidt */
     { { 0x01, 0x10 }, { 2, 2 }, F, R }, /* lgdt */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -666,6 +666,10 @@ static int blk(
     return x86_emul_blk((void *)offset, p_data, bytes, eflags, state, ctxt);
 }
 
+#ifdef __x86_64__
+static unsigned long gs_base, gs_base_shadow;
+#endif
+
 static int read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
@@ -675,8 +679,30 @@ static int read_segment(
         return X86EMUL_UNHANDLEABLE;
     memset(reg, 0, sizeof(*reg));
     reg->p = 1;
+
+#ifdef __x86_64__
+    if ( seg == x86_seg_gs )
+        reg->base = gs_base;
+#endif
+
+    return X86EMUL_OKAY;
+}
+
+#ifdef __x86_64__
+static int write_segment(
+    enum x86_segment seg,
+    const struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
+{
+    if ( !is_x86_user_segment(seg) )
+        return X86EMUL_UNHANDLEABLE;
+
+    if ( seg == x86_seg_gs )
+        gs_base = reg->base;
+
     return X86EMUL_OKAY;
 }
+#endif
 
 static int read_msr(
     unsigned int reg,
@@ -689,6 +715,20 @@ static int read_msr(
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
 
+#ifdef __x86_64__
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base_shadow;
+        return X86EMUL_OKAY;
+#endif
+
     case 0xc0000103: /* TSC_AUX */
 #define TSC_AUX_VALUE 0xCACACACA
         *val = TSC_AUX_VALUE;
@@ -698,6 +738,31 @@ static int read_msr(
     return X86EMUL_UNHANDLEABLE;
 }
 
+#ifdef __x86_64__
+static int write_msr(
+    unsigned int reg,
+    uint64_t val,
+    struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base = val;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base_shadow = val;
+        return X86EMUL_OKAY;
+    }
+
+    return X86EMUL_UNHANDLEABLE;
+}
+#endif
+
 #define INVPCID_ADDR 0x12345678
 #define INVPCID_PCID 0x123
 
@@ -1331,6 +1396,41 @@ int main(int argc, char **argv)
         printf("%u bytes read - ", bytes_read);
         goto fail;
     }
+    printf("okay\n");
+
+    emulops.write_segment = write_segment;
+    emulops.write_msr     = write_msr;
+
+    printf("%-40s", "Testing swapgs...");
+    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
+    regs.eip = (unsigned long)&instr[0];
+    gs_base = 0xffffeeeecccc8888UL;
+    gs_base_shadow = 0x0000111122224444UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[3]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         (gs_base_shadow != 0xffffeeeecccc8888UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing lkgs 2(%rdx)...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
+    regs.eip = (unsigned long)&instr[0];
+    regs.edx = (unsigned long)res;
+    res[0]   = 0x00004444;
+    res[1]   = 0x8888cccc;
+    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[5]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         gs_base_shadow )
+        goto fail;
+
+    cp.extd.nscb = i;
+    emulops.write_segment = NULL;
+    emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
 
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -86,6 +86,7 @@ bool emul_test_init(void)
     cp.feat.adx = true;
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
+    cp.feat.lkgs = true;
     cp.feat.wrmsrns = true;
     cp.extd.clzero = true;
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -734,8 +734,12 @@ decode_twobyte(struct x86_emulate_state
         case 0:
             s->desc |= DstMem | SrcImplicit | Mov;
             break;
+        case 6:
+            if ( !(s->modrm_reg & 1) && mode_64bit() )
+            {
         case 2: case 4:
-            s->desc |= SrcMem16;
+                s->desc |= SrcMem16;
+            }
             break;
         }
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -583,6 +583,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2853,8 +2853,35 @@ x86_emulate(
                 break;
             }
             break;
-        default:
-            generate_exception_if(true, X86_EXC_UD);
+        case 6: /* lkgs */
+            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
+                                  X86_EXC_UD);
+            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
+            vcpu_must_have(lkgs);
+            fail_if(!ops->read_segment || !ops->read_msr ||
+                    !ops->write_segment || !ops->write_msr);
+            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                     ctxt)) != X86EMUL_OKAY ||
+                 (rc = ops->read_segment(x86_seg_gs, &sreg,
+                                         ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.orig_val = sreg.base; /* Preserve full GS Base. */
+            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
+                                         ctxt, ops)) != X86EMUL_OKAY ||
+                 /* Write (32-bit) base into SHADOW_GS. */
+                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                      ctxt)) != X86EMUL_OKAY )
+                goto done;
+            sreg.base = dst.orig_val; /* Reinstate full GS Base. */
+            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                          ctxt)) != X86EMUL_OKAY )
+            {
+                /* Best effort unwind (i.e. no real error checking). */
+                if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
+                                    ctxt) == X86EMUL_EXCEPTION )
+                    x86_emul_reset_event(ctxt);
+                goto done;
+            }
             break;
         }
         break;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -281,6 +281,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
+XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -295,6 +295,9 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # FRED builds on the LKGS instruction.
+        LKGS: [FRED],
     }
 
     deep_features = tuple(sorted(deps.keys()))


