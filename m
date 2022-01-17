Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D211490B64
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 16:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258191.444374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9TyE-0000hT-W1; Mon, 17 Jan 2022 15:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258191.444374; Mon, 17 Jan 2022 15:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9TyE-0000ew-Sm; Mon, 17 Jan 2022 15:30:58 +0000
Received: by outflank-mailman (input) for mailman id 258191;
 Mon, 17 Jan 2022 15:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9TyD-0000eq-5g
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 15:30:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b4deef-77aa-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 16:30:55 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-TMPVKCSiO4uWYorb4a-ucw-1; Mon, 17 Jan 2022 16:30:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5796.eurprd04.prod.outlook.com (2603:10a6:208:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 15:30:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 15:30:51 +0000
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
X-Inumbo-ID: 75b4deef-77aa-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642433454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q6gv1h2RMdK7i0YYgTFmkOi5GuFSDjmi48ccDRTcOR0=;
	b=Cco5tZXGukFcenI5xEC0jM3mUvlveIL5RLkbHrtTuLR2WwXyHQp+wu/nWCU47WURx3q9WI
	zlyyq/4HPOyXMxEL+om1YoNyCZxGnbqzidfvdU6ZrKgyzVVpZ5lHUgqJVhMK1Pq9jaCxMG
	NK+jYhTCy9oLyLZVdMne/C12KlGX7lQ=
X-MC-Unique: TMPVKCSiO4uWYorb4a-ucw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRX2kFvuU02W7KsP9O9ZKSGvG3kZ4XNZwQbqttl/ndoAMXvsPNh/tOVBdrkVau4XYSMlSwdHhcPbNW3J/hihovP42yU4U+QF4a4+C5UNR/+hJeMJz6hPiippw7bb0h53xay5d/F4M7CCyrY+H9bbiVXFyXGCVPDyeaK3O/AUuBLWGHcJhtXD3ibcbGixCPHkX8z/Oi6mIM0/lJ29pSsc9MPY3IbZrOeAifrBZFx8k66NR9FQ0SgEvoGAHSA1V8w7EqQB7QdkWxaYJdbFSv02aEH4NyVd0JC033vzNZK1iXMsouZpSdsaulODZyseVKryOWk7ELOrdyN6y28/sgVSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6gv1h2RMdK7i0YYgTFmkOi5GuFSDjmi48ccDRTcOR0=;
 b=VspefEDu7/VxhTPb9Ve9KEX85ecMZeknBzE28FqZ9nJrbzpClBiYojRgpL6pZnPGJ14JcjDEhAUbK2tAi9jUmSxnfjMUI6665Sx5+XCvnQMll4PyoYE5heUQ3DThrgdI5B4DzEV9BYV8Gos643bCGRYpRJAvaEfBn0oIuiTM23dF8XdYPJuu1kCPYfcp7DqMUQbf0bzkYvSiJewNTlyYKPzTjmaC62qQzqmP4kWi64eongqAzgm3dtID45ovhP/NxCWY49QdTgPG/mnkGJ3zz22vY3sq/791wqNUoOOLLCfzDCWrjZ3f97wSeQ8nrv70YYAZVjSRkq+1XENhuU6NUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>
Date: Mon, 17 Jan 2022 16:30:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: use CPUID bit to determine PPIN availability
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0050.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a73ab39-7b25-4930-73ba-08d9d9ce5819
X-MS-TrafficTypeDiagnostic: AM0PR04MB5796:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5796E866B6E9562FD64941BFB3579@AM0PR04MB5796.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OXjIUlp0WnshiL+LQ7bOaTKzOicT5gcWd9/FX5pww/DCmxdKSF5vCijt6XkGX4xqxNA0gjc3pkuyQtMBhTgq/2IYA/A0qa7qPO96w8g1frCFHQ2YCfUTfwwbTv0ykIvPvByuH98/9YGEscGpgoKZpQDhK5yGz5uiWTmf6IZYA8Ao1gVi9nUb96Ux9exf3S14Jl+M9x917Y2JAAKVxylmsBOI2dAPPg26tdo4lBXrdhSrYxvAsuBm0Lbyebr317AReU9dthz+YJhCMpK57mYp4S/rRNdkXAGX6RsU/Qg9hpMEiqEZ/LPeCbBmNk3oEpqmacnsUcNK0ypHEgwvI8G3pd9iXBgk3FtuQG0LkU9A765J4cPg3ItMy6lsjXcvPhvrp2pvqpNUhPq/Ds7BaipA/jIUJWGdosw77TmltAIbk+ejTejb8peLP7Urpb04femogslwxvz2ZBWN8QvUjSX8eJ027whMm2jjkZk7DBm6El52tgkfdaxN3kzRawb5MINTtLlCG6zG4Un2UavQylZNbkpEGSweJdEr2SL/FZMMjk5sZNLxJXP/tX+pAEYEiBXXrmdf3vJqG6r/cg+44fx5lful5Nxewclf40VG1pxzlz70zgbPT2gQeySgzN4JPwch2gva4E0ADIb2vsnun6DPoh2FZbCjq08Y6c7R53UNwQCAfHUf+W/IVoOl3/bXzOOV3SRjXl3aEUCdnC3xklDm09Rip3iPbNk8aKYKh1vTF5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(26005)(6506007)(508600001)(38100700002)(83380400001)(86362001)(31686004)(6486002)(66946007)(6512007)(66556008)(66476007)(2906002)(31696002)(6916009)(8676002)(8936002)(4326008)(316002)(2616005)(186003)(5660300002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2hFN1lkOThuUXRBcTlTK1JTQi9zenRKV0tKTzZKVXg1bFhteTAzWTMweTBn?=
 =?utf-8?B?OGVjc004N0xaZHZKM2NURzZPWnNWUi9rRnlsa1ZPRGFaR1lJODk1ZnYwZWVo?=
 =?utf-8?B?OUo5TlBVak1uVEN0S05sWlZJaUUxR21QbytjWndwVy9GZm1HaTVteVkzWlNa?=
 =?utf-8?B?TWJNOWp5NDdwTy9lcUVEL1p0czNBMWMyMWRuSFZCRTNYU0hOUS9uUXhSUi9M?=
 =?utf-8?B?RjVGdmZReFh6dUNKZlNiaTUvU1Z4aWlpMDl5VmFMWDVDc1l1TXhEazJya0t4?=
 =?utf-8?B?OWN2ZGFpWkdoTjFiUlNyTnczcmVlczZlekF0aExqYkZ3dDdlc2JaT0lIc2pC?=
 =?utf-8?B?ZzhjbW42WDRzdjVRdmFCZWFXQmxiUXF1bTJsd2xUMzhidFFUa0xKc1ppSUw5?=
 =?utf-8?B?R1dPWDBPUGZPZHJmV3ZqS2s0T3prOXBBNTVUTEdpcWVDWXdhd1oydllaR2lU?=
 =?utf-8?B?QW14QzErL0RkaVpHN2YvK3IvelVkMTRBZWVDcUFMS1p2djJtWk45SVFCU3ha?=
 =?utf-8?B?WC9aSVJESHVxTitFb0g3VTkrMjVxWEVIMnF2d3llUVh4K05VbDA1c0x1VGY2?=
 =?utf-8?B?RFF0WlVrWG9ST0t2ZnFTbDE0QmxRYVhWSDNnbFF0S2hPLytFbUZzRjZyWjlr?=
 =?utf-8?B?ZkZpeERvSmxUN2VMK0c5dmxLZFNmbDhsVGlDT3RuRWlmN3RzYndKbHk2Vml2?=
 =?utf-8?B?WmtXUjJ6SE1RQWJLVEE4NlFYZDB2enpWb0VYWlY1MmtnVUtPZGxZMFQrNXBv?=
 =?utf-8?B?dlpyZHR1T3Y3QVR3QkFRWnRTVlBtUHdWYlhQa05PWVVLZjFGWURzY2Jic2xM?=
 =?utf-8?B?SUdoTDN1Y25ZeEVueXhST0U3dzF1ZmUvSTlaYXVxNG10eG5Kcm1aTU5uamNo?=
 =?utf-8?B?N2tieU4yV2xKVlVHMWtRdGhzcG5hRGRwUExncndTSHliSXo0MWZ4QU5Yd1lM?=
 =?utf-8?B?dTdmNTFtL1kzMmZROTAyU3dVbEw5RFpuZ3J6ZXYzWWc1Z3dDMWN3aVlVak10?=
 =?utf-8?B?aXlrOUNjdVVFaDlXL2oxc2ZHUHBjVEV4RE1Xa3Y4cGhrUHZyVFFXdVBGdkxv?=
 =?utf-8?B?N0l1LytTOXM4V3ZmSVlobndxbmVJUmU1TTIvUEwwNytQeTQ5UWJieFdVQTIw?=
 =?utf-8?B?YWFuamkybjYzRWZ1Z01WSjg0N25NbkttRE5JSGMxOVh4VnNIM1ZsTnd6OE9k?=
 =?utf-8?B?ZzVnNEZYNnBYS3FjcGVaRXFGWkJuY3Y3dFlmOStQd1NKc1g0VzRiZzkzQVI3?=
 =?utf-8?B?SmZRWHdHaXNUbm9wSllFN0k3MjBuZEladmE2UURWK0dHN0Vkb2F1V0hPdkFx?=
 =?utf-8?B?YzQzRHo4bTBaNHBXa2Frb0tLRFNFQ2ZhdU9FdWNKWlkvc244Wk5TUTB2RTh2?=
 =?utf-8?B?OVNzL1dRYStibkJQU0ZGNDBNQmdCUFhkVEpkcjdaU0F3V3JVMWF0YThjQ0p6?=
 =?utf-8?B?bzhMdFJvWm4vQXhPYXBOdGJYd2dMWWlSSkZuMVM0cnJ4VVFoR3F1ZndxTVJS?=
 =?utf-8?B?a2lCZzdsNGEwcXFDbkpaOStnVnZiMXg3bnBxeHYzUnlaWWhENlgzL2VjOEk3?=
 =?utf-8?B?RW5UWnU3Nk1NdUJFRTZNakk5ZXhQNnZvQVVXTjRJZDFGOElPVndIRGN2aUo4?=
 =?utf-8?B?RHBuTGcyYVdtSGZkV1dhYlJpc2dzc2J1cjRwdTVEVXFZMlJuYzMvSjVFaEgz?=
 =?utf-8?B?cTlpUElMR2lBcE4vMFRZK0VKWWhnbGtWWXlLM2JibE9FMG5Jbis2UlhYcmU4?=
 =?utf-8?B?ZGNoc0NZRGE2NVpOMFBNTTZ6elhsb0pZQy96Z2RDOUJkS0tJb2MzZStFMzRJ?=
 =?utf-8?B?UzI2SW84eW9haVdFWW8vcmJ6cFdRK3I1QkFFb3FJR0hsVGlHSXhBL2dWS0ox?=
 =?utf-8?B?Wmdaendmdm1yOEVnWDR1NnAvLy90TlRsMjh2NkNhOFhSbGpuNWREQ3NDZzZ6?=
 =?utf-8?B?WnY3UHYyc0xuUE1ieWpQRFhLbGpLcGcrbFlYTE1FS1Z3R2F5a1M1V3l0YXly?=
 =?utf-8?B?VzdSWHdicTZsZS9tNEp1SHl5bWZSdmpOemVINEVnSHNPcE9PaXRpY0pKZ2pO?=
 =?utf-8?B?Z0RzbUROMGRUd3ZXdTQ2ekgwVjQxNC9hRTZFSlNwZHBKUE5UMVUvZkJtbWxq?=
 =?utf-8?B?cXgvUTlOSkVqOFJpUzZUZFB2cDhNNm5ONUxuRzc3ZXVHU2NoQ2o4cGFBWEZp?=
 =?utf-8?Q?a+/OE18FppLc7xH9yAEMkq4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a73ab39-7b25-4930-73ba-08d9d9ce5819
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 15:30:51.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOw/5/xH4o19q3iGG0u+5l2XKmBwGJhcn51GAAIlxtsasVAkHD1MrgT1GZqs2HYgAuHPWZr6NqlAs0J+hsQ6iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5796

As of SDM revision 076 there is a CPUID bit for this functionality. Use
it to amend the existing model-based logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In xen-cpuid.c I wasn't sure whether it's better to put the 7b1 table
next to the 7a1 one, or whether tables should continue to be placed by
feature set ABI identifier.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -156,7 +156,7 @@ static const char *const str_e8b[32] =
     [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
 
     [20] = "no-lmsl",
-    /* [22] */                 [23] = "ppin",
+    /* [22] */                 [23] = "amd-ppin",
     [24] = "amd-ssbd",         [25] = "virt-ssbd",
     [26] = "ssb-no",
     [28] = "psfd",
@@ -188,6 +188,11 @@ static const char *const str_7a1[32] =
     [12] = "fsrcs",
 };
 
+static const char *const str_7b1[32] =
+{
+    [ 0] = "intel-ppin",
+};
+
 static const char *const str_e21a[32] =
 {
     [ 2] = "lfence+",
@@ -212,6 +217,7 @@ static const struct {
     { "0x00000007:0.edx", "7d0", str_7d0 },
     { "0x00000007:1.eax", "7a1", str_7a1 },
     { "0x80000021.eax",  "e21a", str_e21a },
+    { "0x00000007:1.ebx", "7b1", str_7b1 },
 };
 
 #define COL_ALIGN "18"
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -865,6 +865,13 @@ static void intel_init_ppin(const struct
     {
         uint64_t val;
 
+    default:
+        if ( !cpu_has(c, X86_FEATURE_INTEL_PPIN) )
+        {
+            ppin_msr = 0;
+            return;
+        }
+        fallthrough;
     case 0x3e: /* IvyBridge X */
     case 0x3f: /* Haswell X */
     case 0x4f: /* Broadwell X */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -299,6 +299,9 @@ XEN_CPUFEATURE(FSRCS,        10*32+12) /
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
 
+/* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
+XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -16,6 +16,7 @@
 #define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
+#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
 
 struct cpuid_leaf
 {
@@ -188,6 +189,10 @@ struct cpuid_policy
                 uint32_t _7a1;
                 struct { DECL_BITFIELD(7a1); };
             };
+            union {
+                uint32_t _7b1;
+                struct { DECL_BITFIELD(7b1); };
+            };
         };
     } feat;
 


