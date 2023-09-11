Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC879A94E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599542.935007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiPr-00037D-5W; Mon, 11 Sep 2023 15:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599542.935007; Mon, 11 Sep 2023 15:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiPr-000362-2k; Mon, 11 Sep 2023 15:01:31 +0000
Received: by outflank-mailman (input) for mailman id 599542;
 Mon, 11 Sep 2023 15:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfiPq-00035w-7U
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:01:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe02::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a47b7f-50b4-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 17:01:29 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 15:01:24 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 15:01:24 +0000
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
X-Inumbo-ID: 15a47b7f-50b4-11ee-8785-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtyZac2883dqnYA4sgSE4aaK2S4Gk+ZaksGC2ihZeJArpNaXjIKVrzdiR/5TmIrTu3NkiSJj6/I6F+9L2DWTjdBB7r+BuZ4aFc7ZjevfK4ly1onV76L3OMynF+iXByICitebFGbCbKFQngrxeDfiUbIkuMmNcHxfRktHT/0X6RELXnK3m9a/JO7uLNuFCL8ftmVWAXbJYSmnJyVuT1BIgmYNElrprStu7S2/+qGdSErwc4TmQYgdKdU4t1fVpAhIYewNYGxyao8ck2M92Fd7VhqTTDp87SasBD0BDOKQDLA5vqoqV3rHv//PVlusCWMc0Is/mikrh1OX5NvvGy154g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wZzragR6dHZQaqQMxHMRGLaSjpZaxuGWKw5+kLPuGQ=;
 b=WeLF1ld7B6F0yQxnBoRGldrKAqE8Y/zuq7yunL1z58oWDaQwf14qe4pNczSkJQ3rI1ocOl7YYDUDU6gk6cgIa0MstUw7bUAUQvEcvzS63aru9ctlco89irS5Jb0Ttksb++6+/SUyUDzgq74hWBfTzrn3yaTHTMyyeg/uHVjOumg9+hbmj7xs9hF8FcdJAisflaatiszPkNikQ8AfqYy4PWqOzVEDnDDrRZJF4Qp+1Ndfh7JHuc5ZTHTlHWVau87tCAZGTP/GD/KWa184Mkm6xycwh9xWlHnLEtq4n/EO0pTAbGZZ+yY7u7EyOnm6J0tCMhvb3RGEknbkdnTB7e8mnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wZzragR6dHZQaqQMxHMRGLaSjpZaxuGWKw5+kLPuGQ=;
 b=jJ8oBLGlaScT/Ao+oTVFVVRaQQcgwYd9iSjLtrd8qMqIUj5HUaSxHoMELlL+ZUqjrHL3oWKSIZNEi3Nhup2pJB7VtpTNupaI6MGxwgN8Xue9hSm/sb+p5UV3ol1O2AMRKvljcxR0EHOSzyxTpp7Pdee+Cc4zjuX7c3YDyhIo4rPVfMkDLyo2w3aiHTpHZA1Sl6C5UJ7/m31tqEDHkDsERox5CkqgljX5ndp/svhQsUefdDyOElehYR2TQ4YjdJak9fF8K7hyo904wlsMsDagZ0rZs3xcs78A5Vt8iJPEZId69SREquyfVdRRLFfyHzKtTY/AycbGGAvgpsZPDRt7rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
Date: Mon, 11 Sep 2023 17:01:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: c920b283-087c-47d9-cc23-08dbb2d7f783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDuiHkHOmwE7+kcsMoJLPw8HSmax5T3PCtw6mNU040OvA+fPzQuoV/ihLRzCIkVYSDlPJjCn6ZYzyMShgHqfsxbp7Ijvvt7pD5sqnHnZLJ+zxfxxaluV39bCxwLwmklrSzIutWve5W0LI9aSUz0f8JV2cN6xTPrAeu/KsKNrxLv/96rJ11J+KyWVqNpwdZGZw/XgvZmxJiR14RagIRdbxNqz4Uh0VXIdiRXIESDyTHu8vd/DNnMv6tqAPNf/f3temPjXHGo4kHBByd6iFkVrPFSprAllO5RqvYQmNW2CzvjL2vtdD/wDgOJnEAZA0kVmUL4zq9CmHUHPUg4r5/9t9SvtQ1Qci4a72VWFusRY5GLcEUoKTF1SL6LWLMv4qek+UFd1zwknP9w3fGBHc8aT/G7uYdC2GhIsnCuOcabOd1r2Yq02RbnL/3PlVRWbSnhnSY5bTJRS7qBubOUuLj6FWCfDs+s6VgpYagF5r2HXtwjKnsoYXx49y+A5BIxZ3wLSAH4jLlJeiyMhnqDieBzeIYKP15SVbFxscELK6IWWQPtpUjYQ5e30SGlM2h6lQOTIgyX3OePBvhbhYAsTJTvzG8fh0UcTTasEJ8ciJpkiVfKDlTzTrAjgo9RJw/IhPeQQP5olUFiHmEFPqbgdItFgAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(346002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(83380400001)(478600001)(966005)(54906003)(6916009)(66556008)(66476007)(66946007)(2616005)(41300700001)(26005)(6506007)(6486002)(316002)(6512007)(2906002)(38100700002)(5660300002)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEFWNTBEUDEzMFZad3NENjRVU3dDeDE1WFNHVnFvZEZEeTJMaXQrc2c2elBy?=
 =?utf-8?B?NEhUejZxbWg3QTh6Z2ZDdFlVcWJFVWJUNGxVaFdCd1paTCtLd2dBUlRMMXVO?=
 =?utf-8?B?RnpEeDBxU3ZCUTV5bW4zcG9wSnZtMURGZUJFOWdqWjlqZUtMSy9pL1dOODQw?=
 =?utf-8?B?MnNmWFdiUUUrRk9Nb2hyOVJCcDdTcXVuRUhmZHZzYkVDa1VzUE9Dak9zTVhO?=
 =?utf-8?B?cHFGancycTVKMCsyZkpvdWRtV0NsOVJKRjBYcDcrTEo3bjZtRzJCcFJKVFdj?=
 =?utf-8?B?Vm5laUNwckdpWlFiVFkvQmdBWStPWjlvUGlHTVBsb0tXNm9mU3ozSDFQOHNw?=
 =?utf-8?B?NU1pL3hXd2xOOXhRUi9SN0dYaUV4ZHNZb1VCQ0NtSElXNW83T1VUeTUvbXE4?=
 =?utf-8?B?aFMzcmVZbE9peDZtM1pGNUNoVFNvektST2t3eDBRSTVTZXQ5VEtWOE1nMmc4?=
 =?utf-8?B?S1JJckpyYURJTWpYRWFDL0VhUERhWW9lZ0hEZGd1N3Q2WEhHbjAycUdSc21P?=
 =?utf-8?B?NzYvd0lQakJBWmVVU0c2TGpPSk5tTlEyM2NzYXFGcVJ2akt5ZUwwaVZZWU15?=
 =?utf-8?B?WGxFLzVTdzA1RDdBYUN5TFJhdmFvTU9rcHVQSHFTTFJjd1pOK2VFSW5UdFlk?=
 =?utf-8?B?MTJPTldoeWpXYWRrRVZWWGk2MGxCYkxsVDI4NzMreUorakhoMThGWWhGWVRH?=
 =?utf-8?B?SUVVQmJtRGlZbUQ0MDZVY3RmSEV4allVVXRtU1BIenpiYVVBM0c2bkt5Zi8w?=
 =?utf-8?B?NXRDdG1pdHhUR3ZPdDE4amhCa0V0Z20ySkF3aFlzYkJXL0xyNCs5SU83VXJm?=
 =?utf-8?B?aGEwT2N1NEdidVpva3BpVU0waitibzc1WnNnTm40dllzRWp3ZEh2UVZiL1Z6?=
 =?utf-8?B?OHJZNk41ampvdGFQOWwvQlpPNUtjRk1uYkQreXBvQlY0ODY5Z1JOQ3pYUDZa?=
 =?utf-8?B?N25sN2xYRy9VTWZjN0h3UExNeXR5ck1XZ3VVdlk5VjBnTzBDK1NzN1FobUpH?=
 =?utf-8?B?bWN5UThPOFROQUduNUIzZ2RSek41VUdNWkJUeGFraGs2YWVCb0hNWGhERU4v?=
 =?utf-8?B?MzhiR0RhcGdYbXFWZm1yamdKRFE1aTZSMEQyVkJobkFuaW93c0N5YlJUWXgv?=
 =?utf-8?B?NnZCU0c5cUcwZEcwUXRJY1VoNnNmTXpJWDF3eXM3S3RFQzNlSVoyaEVjQVJm?=
 =?utf-8?B?K2lwQVhMUWZNRlVDSW9renl2UXJ4bmU3bndocEhWL2c0Wi9YQmpuTnZla1dZ?=
 =?utf-8?B?V0VNRE5XMHp2YXNnV0FXcUlUL05jUTFzRHVDb0diWjlQb1lXVU00M2tkWEY5?=
 =?utf-8?B?bGZIOE1jV0dSQU1jZ1hZeWpDaHFrQWliTkdFTWhvV2tjUmdzeDVqMVU1L3Ew?=
 =?utf-8?B?RlM5bzk1WlN2dlpZMU5kUmx4K0xFN0cxcHFocTBLTnU3TFRpdFhsdXp6RWMy?=
 =?utf-8?B?b0JEdWpCcjFjRFF0UHQvMC9EUEhqV2dhdERTT2JPZi9HaW9id01lanBlU3JN?=
 =?utf-8?B?OUxFR1NnbUMza3lpd2lVY0srV1dKbUhmZjBpd0tQT1ptckN4TWt0Y1QwRUdV?=
 =?utf-8?B?dExmSTFqbFdNYnZ2b1NFSjkvcVZsWi9LTnd4YkcxNVpXY0t0YXM1aHNXTlAz?=
 =?utf-8?B?eGRKYzhyclF3c29jZFh4OEUySG5MeEpBVWxOd3VvUmw3SG5Rb25MUDZIdlpZ?=
 =?utf-8?B?Y0RUOVdnTlJJUXhOb2ZNMWNEZXgyVGI0S3Axd21mRFhLRkdrQzhudWRkamNF?=
 =?utf-8?B?SkNLMHhwUjhVTEhKRllaLzk0SjdDbXRjYzcySnc1NGJoRnlWTnhjaUZEbWpT?=
 =?utf-8?B?S3U4RkJqL1ZOTld4VElQTGlGMmtNcURBZkVkZmJyVVVnQzBoY2d3NHliYW9p?=
 =?utf-8?B?cCt6SGZVbGV5T3RuVHljOHpYNEpINy9ROHJ5THlUMGFCblo5NVlNTVF4T01H?=
 =?utf-8?B?U01iTDEzRTA5RVZqQjd4eU4zb3JxNDN4RXh3ZEtqREtrcUdDT2pQZ29QRWhs?=
 =?utf-8?B?d0tyQTh0bnRxQWVHZGFHRGhhMUZUVk1sQVd4cXU3eWp2KzR3cC9PQU16cHY3?=
 =?utf-8?B?b2x4QjdvRUNBcEN6d1h1ZWhRcnBUbDJDaHNGaWY2dVZDVTB3Q3FQbEVKWjRW?=
 =?utf-8?Q?NidSj/jOQcB6u95jfOGSua35K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c920b283-087c-47d9-cc23-08dbb2d7f783
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 15:01:24.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85b5pw6VMmZx+mgzhqxrT030KacAwDDNysloDlb5LzIr73Z7BK/marpE0ljsocdvUkF9yXUQUMTn6rxYRMY11g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895

[1] specifies a long list of instructions which are intended to exhibit
timing behavior independent of the data they operate on. On certain
hardware this independence is optional, controlled by a bit in a new
MSR. Provide a command line option to control the mode Xen and its
guests are to operate in, with a build time control over the default.
Longer term we may want to allow guests to control this.

Since Arm64 supposedly also has such a control, put command line option
and Kconfig control in common files.

[1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html

Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This may be viewed as a new feature, and hence be too late for 4.18. It
may, however, also be viewed as security relevant, which is why I'd like
to propose to at least consider it.

Slightly RFC, in particular for whether the Kconfig option should
default to Y or N.

I would have wanted to invoke setup_doitm() from cpu_init(), but that
works only on the BSP. On APs cpu_init() runs before ucode loading.
Plus recheck_cpu_features() invoking identify_cpu() takes care of the
BSP during S3 resume.
---
v2: Introduce and use cpu_has_doitm. Add comment "borrowed" from the
    XenServer patch queue patch providing similar functionality.
    Re-base.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -788,6 +788,14 @@ Specify the size of the console debug tr
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### dit (x86)
+> `= <boolean>`
+
+> Default: `CONFIG_DIT_DEFAULT`
+
+Specify whether Xen and guests should operate in Data Independent Timing
+mode.
+
 ### dma_bits
 > `= <integer>`
 
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -15,6 +15,7 @@ config X86
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
+	select HAS_DIT
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
 		alternative_vcall(ctxt_switch_masking, next);
 }
 
+static void setup_doitm(void)
+{
+    uint64_t msr;
+
+    if ( !cpu_has_doitm )
+        return;
+
+    /*
+     * We don't currently enumerate DOITM to guests.  As a conseqeuence, guest
+     * kernels will believe they're safe even when they are not.
+     *
+     * For now, set it unilaterally.  This prevents otherwise-correct crypto
+     * code from becoming vulnerable to timing sidechannels.
+     */
+
+    rdmsrl(MSR_UARCH_MISC_CTRL, msr);
+    msr |= UARCH_CTRL_DOITM;
+    if ( !opt_dit )
+        msr &= ~UARCH_CTRL_DOITM;
+    wrmsrl(MSR_UARCH_MISC_CTRL, msr);
+}
+
 bool opt_cpu_info;
 boolean_param("cpuinfo", opt_cpu_info);
 
@@ -589,6 +611,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 		mtrr_bp_init();
 	}
+
+	setup_doitm();
 }
 
 /* leaf 0xb SMT level */
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -201,6 +201,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_doitm           boot_cpu_has(X86_FEATURE_DOITM)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 #define cpu_has_gds_ctrl        boot_cpu_has(X86_FEATURE_GDS_CTRL)
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -41,6 +41,9 @@ config HAS_COMPAT
 config HAS_DEVICE_TREE
 	bool
 
+config HAS_DIT # Data Independent Timing
+	bool
+
 config HAS_EX_TABLE
 	bool
 
@@ -175,6 +178,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
 
 endmenu
 
+config DIT_DEFAULT
+	bool "Data Independent Timing default"
+	depends on HAS_DIT
+	help
+	  Hardware often surfaces instructions the timing of which is dependent
+	  on the data they process.  Some of these instructions may be used in
+	  timing sensitive environments, e.g. cryptography.  When such
+	  instructions exist, hardware may further surface a control allowing
+	  to make the behavior of such instructions independent of the data
+	  they act upon.  Choose the default here for when no "dit" command line
+	  option is present.
+
 config HYPFS
 	bool "Hypervisor file system support"
 	default y
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -28,6 +28,11 @@ CHECK_feature_info;
 
 enum system_state system_state = SYS_STATE_early_boot;
 
+#ifdef CONFIG_HAS_DIT
+bool __ro_after_init opt_dit = IS_ENABLED(CONFIG_DIT_DEFAULT);
+boolean_param("dit", opt_dit);
+#endif
+
 static xen_commandline_t saved_cmdline;
 static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
 
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -184,6 +184,8 @@ extern struct param_hypfs __paramhypfs_s
     string_param(_name, _var); \
     string_runtime_only_param(_name, _var)
 
+extern bool opt_dit;
+
 static inline void no_config_param(const char *cfg, const char *param,
                                    const char *s, const char *e)
 {

