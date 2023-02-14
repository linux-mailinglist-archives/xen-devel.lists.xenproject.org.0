Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9656968D6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495268.765585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxtJ-0002Vm-0Q; Tue, 14 Feb 2023 16:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495268.765585; Tue, 14 Feb 2023 16:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxtI-0002T2-TG; Tue, 14 Feb 2023 16:10:48 +0000
Received: by outflank-mailman (input) for mailman id 495268;
 Tue, 14 Feb 2023 16:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRxtG-0002M8-OA
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:10:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2331b82b-ac82-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:10:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Tue, 14 Feb
 2023 16:10:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:10:44 +0000
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
X-Inumbo-ID: 2331b82b-ac82-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHKqHtymeg5pIoAYTaJzCv65oMHyTg50dbwr8+PBPq8W/Z+lrfeqrhF5GmRlX6FqQRuAHq7CGy9p8O7y0FKm2XlwLdd9zCuJt/36OPmJPfIi3G8P/M1Merpl83ix1WV1eixZ8baOJf1KseFIwSrnu7IYUGuEwlMr5Yj0elI90Sat0pU/Mwg/OIJ4RD5hJnqyCDlbGBYPNsjgpL64wcmApwFuSnvQGqq4LWIFRZBz6tKODMgHoJ/GrA53UImEGdwL2+6eo+KmZK/FR7uaKb6fCHRn9CExlfD09UcDwpD3jGi6mMQOFWzQ3wmT5z3aDNlFbEpf6k9LD1xrOSo/2V+cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qINV3D+ZcJrc3TgcCf9Vkqn39yRf5xgMpf87ZeAdksY=;
 b=MBJdaUF5CZYxI1cBaZt1i0YaIFapmY8uXsZAnwbfpa+cyjDg+pBAtTB0gYaKWP3eR+HWOBVg+xKJkyWo4ZA9u23F2nfMck91v9fcFv0hhpL/1BLlLmjfBGCZhkYhg1X5KJ9E2CmmXQeGEHCm3AhBraAF+wERkFw7A0EXZQc1HtTKW/erCQpTEcqpNMy/Wcx/itIeyJJGmueqvpNaF9pgz7JF9yMR9Gn4Tvqtr8jeMeb22GvR9HDbLbFKtZ5+LUwXdNDrkePYkSgZgwr9nlTiXELER4coy7KJ2pKgpL01gfpMfDDNrILmdxAmyGOQ4QMCOM+i8rX9L6nrc/9wFV3oZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qINV3D+ZcJrc3TgcCf9Vkqn39yRf5xgMpf87ZeAdksY=;
 b=JIk6Q64r4XADHN0wkRm+eFGpcSC+ZN/c6EpNS0x3QtZr/+XwBL/cVBj8xV7nmY7EcXAQ/xoVkmWbnoaiqhqHyYVhWinxKAUxeI/kvwu34KrqSOtUr2T0F5VCk/kUnojPGIepbtTsHUIY3iFvY0yfu4r4TTYHG9S3BdKXsPm0++2rmMMKzfLf0qw+QnwxAurRNz6A1Dx7LwZWy0gEwfPNFqwPdVHIYBTT+jTbJe8MCQQHkeTMAJcxnOPlGOT/0LoTVFf8Yn4Nh1TB4zrQz4xI3mGSXeYwWGVQgun+EiwYCfpFZciG/xxaRtX+8k8CH8wPgaMwJqqFMKnK+EsbMNLMeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31da79de-bd6b-af95-793a-c16516992bc7@suse.com>
Date: Tue, 14 Feb 2023 17:10:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
In-Reply-To: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0435f9-ef97-44bb-2f03-08db0ea60687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n86WPBjsffWLWWt3UNQYbrITvMKYI6KPsOnBeEVWiVhy83TzhLqiP7+G7loRTEqbQxSUJlkUO0FH+RhcGysigISHOzxKvD2FEPIlMxsnC1DjfIFixVzjQPYMehEA2zJBIZHelO1vLsRdapktmI+4paxUux0v5Hr6URpWiOvCpwOWOFm2m9S0j19I1yrjsde+T8qzMPuqTDjBYcD+X3YLHtg1TFnUB/ci8jBSeY+ClgUbnoizZ24ZngCFermN3mliMFZ64lgnK2qHgYm8GxUZqOy08fIsAuDPcIvZSYWB+eIFnjOAHG+LHHzOG4njLRIJLHfDHOkKipGO5kOT1+ZFDdDauS0HBm5sG+RaYdxssraGrTBcAKm9W2bY04ET96JIlMf8/dJWp1ZEIOzZ5V+hfPd2WgEwROqmLzHmQumHjboaQKyWYqkLZi8NQ1TxSZ8J5V7Y6es/a7zSdvD53qw+ABX4Z841F00hKxFSWVtiPT0S5CH87Y839JWZQ4/YSAgnETcrx1r7sSMdg+Coj05HwKR+ytuVC7dYIqToR37gEeJn3SVoFxxpKD8kXAEt+HkfinV7Bh6AtRPIa/UUnJ6/MxC1nHSRuvFMl9Q4rYnZkF36HLTraOwC1KBYrClDiB5bSZxN7cBZMji0FyvLAZi8Zy8ekdOgwLMw7uzT93gOp3ri9zjBSJBuvHltYc8221Azs9y55RyGAgel7HcLOZjjTdSkz2LlyvceNhQDUQT+GtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199018)(478600001)(36756003)(38100700002)(66946007)(54906003)(66476007)(83380400001)(66556008)(6916009)(4326008)(8676002)(316002)(186003)(26005)(6506007)(5660300002)(6512007)(6486002)(41300700001)(8936002)(2616005)(31696002)(86362001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDJBTzdUMmV2d1I2a3d3V1UwcjhZdEtzQ1V6SUxyRGlLVVhPUjc4YVZmYTNF?=
 =?utf-8?B?ck9BRlV5RnB0TGpwQzdNQ1haS3NkOVh0VE9wVDVsZkpVNGZ5REY1a0tPV0dB?=
 =?utf-8?B?bTZvbXQ1Y21qTmRkSWFlOEFTekpBYktlbGhuSVl0aktxdFk4RUFMZENkaExk?=
 =?utf-8?B?ZzZncFhwQTFxa04xVVJvQWxKRmZsQXI1S0FITWFBdXIzV0xyRm5NZHFJT0Zw?=
 =?utf-8?B?VVczL2JsdGdTM1IvcUpPUVZKbXNYT3BGQ1ZENWxGRlBWd1hoTWEzV1U5ZS9V?=
 =?utf-8?B?R0lHUE8xSlh4bkFEY2FIUFBMSkFqSWpWeHNwdTl2Slk3aVJ5Q0JISnJORElW?=
 =?utf-8?B?V0VzREVJNVJDNExvdDNMNFFCZHJrRWpueDN1ZE1Pa3hIK1RFWXBETUc0K28y?=
 =?utf-8?B?bVpyVHVKcG9LOVRPRUFJa0hKcUlQYkhPdU1XTE01NDNXZ0l6dTcvTHkwSmZx?=
 =?utf-8?B?UXQ2R2hSVjEyeFhoK0NSR1dmZDlYYXMzbEk0aG9aelBLRm9xb0cxTlcrZEpI?=
 =?utf-8?B?STg5WDZ6dWtHSUJEMHBmbmxmM1dqdTh6YisvL3piQVJ3VnE2RDhCSld3SVJw?=
 =?utf-8?B?WjN3aWpiekFqRkU3elpJdnc5bEMxY2NFR2pEbG1GUGR5amt2eGZBUHh1cXk2?=
 =?utf-8?B?blZ3aVJsSkRiWkZYdThYaFdkZlNvblFwcWtJL0JscHczN0I1YXlCKzR5RzhY?=
 =?utf-8?B?S3A3Y00ySDloZU9rS1JTWHh4WXZVdEIvVWc0M2crNkZBZ0JyenFyVUNhZnB6?=
 =?utf-8?B?RWVnUUNEbGJFQnFvMDg0TE5DRDhRcHRYMU9sZEFOWjJoKzRzUjVKOTVkR3NJ?=
 =?utf-8?B?RjZOQ3BUWmhqNWk1SE1nMXltcHlaSVZFbVI3SGF4REIxVnVVUWptMWVCVXhT?=
 =?utf-8?B?RWVGTzMyTUdPem82Qm1Zd3JkcXZ2c1pVaWozYnpub3JSRXcxbHF1UitmMzUy?=
 =?utf-8?B?UVhmVUhSL3B2c2FSZzE4d2p1QkVvdkd0K0RRTjVhWkViUm8vMU1YM2s2cDZ2?=
 =?utf-8?B?ZTFNVmYwbEpsNVUwY2I2emhYYzFWUm52cUhaSTVsaUcrN2wyRE1adndZenVX?=
 =?utf-8?B?WXpjSUZWTW5vZmFCSEJtMDJpeE1PNkNiblA1RXVDR2Z2QjFKakZqeFRObjBH?=
 =?utf-8?B?QjBZbzh2RE9LV2JKVmthWmRDSmdQR3Zob0xDSVJmLzVpdmdIcXNWOXl2bE12?=
 =?utf-8?B?dXpmdk05VkhBVTVWeTRzbWVQVm9yYkdqYUM2VExmTlc5OG9zOHJXQ2NXOXkz?=
 =?utf-8?B?bTNqRnkwMkdKbXRjakZkTTdsVlpLdzlYSXNUbFM0SWlMWnpTc1RNT2tHZzdE?=
 =?utf-8?B?NTF2bXVVUi9udmdEb0pGaktkcDRNRGFUTEhUMkxyaitUSTdwZWtSS1l3NUk2?=
 =?utf-8?B?eW1KNDBPa1QycDYvekhxTTh3VHdYdGt1YjMrOUs3dENyWjlJb0lmR3pUd1FY?=
 =?utf-8?B?anFBVVpKbzJkNlNNU0hhaTFBOEJzamxJUGNlSlVpTkhzQkc4MjRjYlhIazNv?=
 =?utf-8?B?ZUQ2YXFuMUp1N0g1QWE4TTE2NlhpL1pTdWtrVWJxVnl6T3hCUm5sTTY0NUtW?=
 =?utf-8?B?SkE5U1ZvL2lmT3hJK1ZTL1VzNDZCaU53Sm5rUkVwdmswZUNIbnJWOGI3TzB0?=
 =?utf-8?B?eldadDRzQVB3Rll3dWs2NHpyeTFja25UY1dDTDVMUEN0ZzQ4NlArQ2x1UWV1?=
 =?utf-8?B?bWtUNUd4aWR1aXdtdk42SnVnQS8yUFVuSkZzdXJlMUxQZjVVajByZ2dyMnEr?=
 =?utf-8?B?dWFENitVeCt5RWZxY3ErcnRFTmtlZDcvRWtSa0RwNzA1VXNLNGFMYWlpU0Fo?=
 =?utf-8?B?MXJGVW1vNGRtMXo1Um83c0xDd3Q1aWJFTlNkU1A4dEZDWEt4dC9TNys3Mmxl?=
 =?utf-8?B?N2NranhKRW9NN0I3UjlmdEluRXBsbnJzUmFKaFgzeWthS0NzQWhMRk1KVXNP?=
 =?utf-8?B?VVE0SlJZOHp3NEx5Z0l4UjhQQW5Da0h4czN2UXJYSGtkY2ZJdGc0MUdRdFJY?=
 =?utf-8?B?RlR4SStRYTJtM29BMjFWbW45ZkpQR1A5Wm1LV2tvem53a3AyM1BEdnJzcVli?=
 =?utf-8?B?WVJ4Q016a0ZScjg2MWRDTFhweTBuaWlaWjArWlpCQ3N5SW9QcTdKenkyZkVQ?=
 =?utf-8?Q?cfAXrVtjEpyY8dbP7SzswKsvX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0435f9-ef97-44bb-2f03-08db0ea60687
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:10:44.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSR4vY6U+bycIlNrgNO352A+Mq3+4nIL9IdVRDSRhDvccPhRwgfZmBdSf5m8IPSC4k+3jqkfudCtOCeC3adbFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762

In order to be able to defer the context switch IBPB to the last
possible point, add logic to the exit-to-guest paths to issue the
barrier there, including the "IBPB doesn't flush the RSB/RAS"
workaround. Since alternatives, for now at least, can't nest, emit JMP
to skip past both constructs where both are needed. This may be more
efficient anyway, as the sequence of NOPs is pretty long.

As with all other conditional blocks on exit-to-guest paths, no
Spectre-v1 protections are necessary as execution will imminently be
hitting a serialising event.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that I'm not really certain about the placement of the
IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
entry".

Since we're going to run out of SCF_* bits soon and since the new flag
is meaningful only in struct cpu_info's spec_ctrl_flags, we could choose
to widen that field to 16 bits right away and then use bit 8 (or higher)
for the purpose here.
---
v4: Alter parts of the description. Re-word a comment. Rename flag and
    feature identifiers.
v3: New.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -75,6 +75,12 @@ __UNLIKELY_END(nsvm_hap)
         .endm
         ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
 
+        ALTERNATIVE "jmp 2f", __stringify(DO_SPEC_CTRL_EXIT_IBPB disp=(2f-1f)), \
+                    X86_FEATURE_NEW_PRED_CTXT_HVM
+1:
+        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET
+2:
+
         pop  %r15
         pop  %r14
         pop  %r13
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -86,7 +86,8 @@ UNLIKELY_END(realmode)
         jz .Lvmx_vmentry_restart
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob:    */
+        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob: acd */
+        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_IBPB, X86_FEATURE_NEW_PRED_CTXT_HVM
         DO_SPEC_CTRL_COND_VERW
 
         mov  VCPU_hvm_guest_cr2(%rbx),%rax
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -39,8 +39,10 @@ XEN_CPUFEATURE(XEN_LBR,           X86_SY
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
-XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen for PV */
-XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for HVM */
+XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen when entered from PV */
+XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen when entered from HVM */
+XEN_CPUFEATURE(NEW_PRED_CTXT_PV,  X86_SYNTH(30)) /* issue prediction barrier when exiting to PV */
+XEN_CPUFEATURE(NEW_PRED_CTXT_HVM, X86_SYNTH(31)) /* issue prediction barrier when exiting to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -55,9 +55,13 @@ struct cpu_info {
 
     /* See asm/spec_ctrl_asm.h for usage. */
     unsigned int shadow_spec_ctrl;
+    /*
+     * spec_ctrl_flags is accessed as a 32-bit entity in certain cases. Place
+     * it accordingly.
+     */
+    uint8_t      spec_ctrl_flags;
     uint8_t      xen_spec_ctrl;
     uint8_t      last_spec_ctrl;
-    uint8_t      spec_ctrl_flags;
 
     /*
      * The following field controls copying of the L4 page table of 64-bit
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -36,6 +36,8 @@
 #define SCF_verw       (1 << 3)
 #define SCF_ist_ibpb   (1 << 4)
 #define SCF_entry_ibpb (1 << 5)
+#define SCF_new_pred_ctxt_bit 6
+#define SCF_new_pred_ctxt (1 << SCF_new_pred_ctxt_bit)
 
 /*
  * The IST paths (NMI/#MC) can interrupt any arbitrary context.  Some
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -117,6 +117,27 @@
 .L\@_done:
 .endm
 
+.macro DO_SPEC_CTRL_EXIT_IBPB disp=0
+/*
+ * Requires %rsp=regs
+ * Clobbers %rax, %rcx, %rdx
+ *
+ * Conditionally issue IBPB if SCF_new_pred_ctxt is active.  The macro
+ * invocation may be followed by X86_BUG_IBPB_NO_RET workaround code.  The
+ * "disp" argument is to allow invocation sites to pass in the extra amount
+ * of code which needs skipping in case no action is necessary.
+ *
+ * The flag is a "one-shot" indicator, so it is being cleared at the same time.
+ */
+    btrl    $SCF_new_pred_ctxt_bit, CPUINFO_spec_ctrl_flags(%rsp)
+    jnc     .L\@_skip + (\disp)
+    mov     $MSR_PRED_CMD, %ecx
+    mov     $PRED_CMD_IBPB, %eax
+    xor     %edx, %edx
+    wrmsr
+.L\@_skip:
+.endm
+
 .macro DO_OVERWRITE_RSB tmp=rax
 /*
  * Requires nothing
@@ -272,6 +293,14 @@
 #define SPEC_CTRL_EXIT_TO_PV                                            \
     ALTERNATIVE "",                                                     \
         DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
+    ALTERNATIVE __stringify(jmp PASTE(.Lscexitpv_done, __LINE__)),      \
+        __stringify(DO_SPEC_CTRL_EXIT_IBPB                              \
+                    disp=(PASTE(.Lscexitpv_done, __LINE__) -            \
+                          PASTE(.Lscexitpv_rsb, __LINE__))),            \
+        X86_FEATURE_NEW_PRED_CTXT_PV;                                   \
+PASTE(.Lscexitpv_rsb, __LINE__):                                        \
+    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET;              \
+PASTE(.Lscexitpv_done, __LINE__):                                       \
     DO_SPEC_CTRL_COND_VERW
 
 /*
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -8,6 +8,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/desc.h>
+#include <xen/lib.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
 
@@ -156,7 +157,7 @@ ENTRY(compat_restore_all_guest)
         mov VCPUMSR_spec_ctrl_raw(%rax), %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: acd */
 
         RESTORE_ALL adj=8 compat=1
 .Lft0:  iretq
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -9,6 +9,7 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 #include <asm/processor.h>
+#include <xen/lib.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
 
@@ -187,7 +188,7 @@ restore_all_guest:
         mov   %r15d, %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: acd */
 
         RESTORE_ALL
         testw $TRAP_syscall,4(%rsp)


