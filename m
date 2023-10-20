Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7F7D07E7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 07:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619641.965060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiSP-0003ys-Ol; Fri, 20 Oct 2023 05:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619641.965060; Fri, 20 Oct 2023 05:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtiSP-0003vz-Ln; Fri, 20 Oct 2023 05:54:01 +0000
Received: by outflank-mailman (input) for mailman id 619641;
 Fri, 20 Oct 2023 05:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtiSO-0003vq-5X
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 05:54:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0edc3e31-6f0d-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 07:53:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Fri, 20 Oct
 2023 05:53:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 05:53:54 +0000
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
X-Inumbo-ID: 0edc3e31-6f0d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYrnvBTwcSHrB4hyOGuSO3BCVSLi+NaiOQ3u+D5ekkkeNOfgvGLhGNEpabqeFMlQIaOnlTAATQO3yRJCTsAxGUCZYCP8Jigwte52uN2w0/felXoPf8WvlNzxEZMkE5G7xx3zjpWeZi9LrRTzt0zhC6QQu8RCK6ruTdzdmSKmJm4tosotnb/yEnXtgkrgQabNo90Muo9MVp2du8d6J3Ljcf5SaR/Jr9rgAWdjMeIWDyvNzDNCT/ej3bdY4PDuY/B5WYgg5h29zjYOWG2iVeRUNftO14BNR7vUUcB+C8x+bCeVpbA7X6QC3HvP5LdLyZuKo0MTYWH9os0TCc49w8VZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnXed6+FlfRXN+vh2B6dVIZu3+1w6I3UU8BVo/S6jkw=;
 b=Yi8BolCCC02+kQmF56m/NotM6VycRMfpgayVEB3pv8HQ6eQvFxoBCu6KU7UeBo5ckhRh4ngjmycdYWWhI7zvHJsFC+tMawdZ9YfUqR3iKWRjN3ZlJ22lEc3Z9Y40bUBP4MUQHEpcFga4Ep+cO/LexR4zJYirEs+nTPSEq/ilNoKuIuX2s/lOImh0IS5oe7b9Lm5UBaPGdVt5NTFplfDjTGWPm+/V0I2+hhWRr058Pcpk65Nl6gKHmpbu4C6dQ4gpSog6dZAprzVqI4kMpmGlDjmLVO/fRNZJXFhCuHKI6fvT5nGWo2nOKcco0V1CzYPwBnpOTV+IFxNfDID5blL7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnXed6+FlfRXN+vh2B6dVIZu3+1w6I3UU8BVo/S6jkw=;
 b=pt2aUqsKmiSeddHqBUkNVxX86ToEiwsQskaPkkRct8t1UNO2VVhORdChGQRUdID0SfytTL1zxYl+3lNN9cJMpqtMPET+Bxt0zptQ6ndBLb6mJvnT861/2i93YLaNFiSqgAkijo+mgRz9shMZ/v1b/ZAsbGtlaxuyOcGhYl5n2n+K1eGmCy36i5Y1fVsSU72yD4NnbzxQAR4uCqltnEbh6vDdQwMV5TX4v2zvbI60zlJ+E+PLtmynJftWptVrCuLKFP5eKRZ7L1RTKu7PhM4yNasAy19+Ccrf5KOVrxZitB3p805uLFsQDl4p8a0ftplIVczz6zh06/XgSBFySDcvRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34aefb5f-252d-2992-c561-a73941429c4e@suse.com>
Date: Fri, 20 Oct 2023 07:53:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 for-4.18?] x86: support data operand independent timing
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
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 315fd15a-ccbb-4502-6ed5-08dbd130f15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kynz+dElTRj+PsLpTjslcRePI2hlvwl389iUI8PHKBrJV1/3/ECJcY4g6QNMJAeOdIMHjcwOULjJuCK6g4+LjM+bdcE1qKGPpWDvRVei7OT2IjE1btYBmllVvmhNunNRS02JSGA1kFhojgOrch+11RoUFFhoJk4ncaXa6mRB9GB9yyIBty4CAa1iq0Ajj2Au7SSVXlclKya2c00HVClREfw4+UEoxwhJ0y/HNDXdo/7/uQFUHYanm7qLHh00sGb4k3enujLNeYrgA4UOvQ21ipYVVOPOx8Z7BmEvnkVFimzGLVlcyVdUnoKZQMj4pszdVToQX9YVYyPzMbNzDhssaS8o84+oheBF+cfjueCpYTQX8MF6aofOS0X9HcHaznqa5tSNEIuGNULPXaPVInmxyGPYAlA6iDTCPRnYaHmYVMRdkhpGa/H01p9TruHRCxxt8IOeJ2+RyDX5CthHLDIg4t9nqunEtVk4dd0RlmUBXaTCdP8uwRvatdbKwxXcmZU1OpSRzLnE7pKCkxBQmZrPTHwp+y2cDqKCkhv6BmC8I61nbCWf9X6s74C+p3mwKjQDxsYg4vLLvagHzbFdDZAykjQ31hh7sTHRK70QFnTAVWbOZ+WY0M+3ScqaTI23hF4+4sP/b8RcxicwA1wL8EVHfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(36756003)(31686004)(966005)(316002)(66556008)(54906003)(66476007)(31696002)(26005)(66946007)(86362001)(38100700002)(6916009)(83380400001)(2616005)(6506007)(8936002)(6666004)(2906002)(6486002)(478600001)(41300700001)(8676002)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5kekJLQ0hrZXFkbXEyN3BZRXdMMXFlZ1puOXN3S3Y4RlZzSEIxOU42eFZZ?=
 =?utf-8?B?ZHVwVHFzZTdVUnFiazVhSTNTQzRLZDhneUdYb1hkZVkvaFQ4aS9SOXg3UXp1?=
 =?utf-8?B?M1RyeUpUS25xQXQxb1U4SG5YU3QwSGtFQURZNVBCdXJyQXNIa0RSWHgydDg0?=
 =?utf-8?B?QVA1ME9MWVpFSWYvN1lRSnMyUzhMRXorbUFQZm5iK1dqdzg3MGJXd1pKaGRz?=
 =?utf-8?B?eDZLQkt1REY5UjZTT3dqcnluMGRBYlhhRTJleDZBeEU2bHR4Y0ZCYWtKOGFE?=
 =?utf-8?B?bytENTBlUnlKb0VQMHFQRjFheHJPUHIxaDluQ3ZvaDVYZHN3MXp5U3ZMeEg3?=
 =?utf-8?B?MWdBdEt5WkxIdU1QVk93NFRuRFpXZHQveGhYaXlDM0RPTUpYdFNFRldCbEhE?=
 =?utf-8?B?YzZ4UVNsczUvRWVKd3dnM1NaaVcrbDdCTndrQ0NSc25GVTdHWlJxUTRXUXB4?=
 =?utf-8?B?SFRoYUU3WFVNRjE4N2dCQ3poZEVPVGpjZGcyMEZrTmd0c0lxckFFMW1pZTBY?=
 =?utf-8?B?MUNxVStKL3hSMlRPclgwa1pzSEtVT3I3VS9XcjlpcW5hdGdEZWN1SU1uY1hl?=
 =?utf-8?B?R0FUdHZZZWtGOWptVmtFdlRQMS9SYkhrR3BYVEVqWHRFS1NmejlqMTN6WHdv?=
 =?utf-8?B?eHhZcGJhR3hpQVQ5VkRPU25lNGxXbnIwL1RPVG9iL0xhMGMyOGtUODRmc2Rw?=
 =?utf-8?B?eE94K1daZ080U0pTMmhpc0UySFp6SUhGL2NEaUFHUmVqTm1Ic3N6c2FCM3NU?=
 =?utf-8?B?blBSVWtHanlBeTlJVU1KeTBpRnFERSt2RzJIVHE1ZTZ1c24wTkE4aHM5RDNX?=
 =?utf-8?B?RUJMVFBZa3FHMFBuSElGR2psVm9FVmswZGt3RXk2UHE2aG05K010Ym1aU1VR?=
 =?utf-8?B?ZmhQWU1BZEt6VVd1UFBvYjhUSkVscnRlZytmbmZ0M3hoNzQ4WHFMNVBzcEs0?=
 =?utf-8?B?eGFtb3pnTmQySTlmS1N3aDJOTk4xQ25vRmg2ZkN0cVdDVitQZ1cya043YUpW?=
 =?utf-8?B?cnBZdE1pL0hoVDZEajlVZG8wWE9iOUJ2czFWSkU0SnVHRnl5Znl3dk5VUGc4?=
 =?utf-8?B?OG9id0gwTFVNTXlPaGxpaVAvY3orVzA2ZHFyOUZIdUZ1NzFac05mbWlZc3RI?=
 =?utf-8?B?d29Ld2FLRUNjK3lVN05udkY5NWlSVFQ1NG1xbW9QTnN4K3l2Vm5hU3lpVlh2?=
 =?utf-8?B?SDAvUHE0U0cvQS9VOG8rc3ZFUW5zOFZtZWJFaXVER2owZjhFZjJrWkdnRDlT?=
 =?utf-8?B?SVhiWm5PV21TeWN6M1JXdVZhTGRkME5iZTZ6aE9QdWJ4ZVBPZ2JXNk5nVlZQ?=
 =?utf-8?B?L0plR2JzWmVpbWthb2xJMDhNa25mTEErMUVNUWFzWHJxYU1Ia0xuRVZxcVF0?=
 =?utf-8?B?T2N4cDFCeDExUmw5RmorUnY3K3NNQ2VGRXdOSTBCNWs5MUMvT1pra0hOWDc4?=
 =?utf-8?B?WUNuQkNHUEpBbkY2dXM5NitxMEZSaGxadnlGYXlrbHkrdXF0SllRTGZqOExO?=
 =?utf-8?B?WVhHcGxzTWJRNnBFOFE1a3dPVnpmSTNpQXoxaDNOUFNDWjFSZm10dFRuZ0Rk?=
 =?utf-8?B?UVVrUmNSaFl2Q2x3TWxsV2Mya0VRMkxPYllvWVozV1NFeWlLRDRkdXVycStU?=
 =?utf-8?B?aTY0OUNYMzQ3RmNtcUFYK3grYzFkdTBndVJXZ0V2YUd2emRtQWVCZENMeElN?=
 =?utf-8?B?d053d1lnQmZEZVhIQmprRU1ROENBamFuV3JFVWJkV1hZbWlZRzF5Y1dSWnpL?=
 =?utf-8?B?K2R2c0tOdWFReVVaRUtrVWRmQ1Z4ek5hRGlSYUM1SnNPTHI0TG4zSFhwSXVz?=
 =?utf-8?B?YWFjdGp5ekpGL2pibFltM0lleWkyYThLV0w2bTFocmpuamdBc3BTbVg1Ynlr?=
 =?utf-8?B?QlM2MTZVM0J4UytZeVFSWG9iakhZZFhNLzh2ZGF3YThYM2lsMnV0Wkx1RzN4?=
 =?utf-8?B?OFNlY2Y1Qm5RWFVQWEZycUhNZjFUVGtXUndyVCsycmRNcXlIdS9wTkQ4OEdY?=
 =?utf-8?B?ZUNxTHd3MmFMYnhyT0wyNWdpVVZxaXpPUVFQS2FieVMyL05kbTl3Lzd6MjdG?=
 =?utf-8?B?WFVPYTBZSm9TazYwSE94SzVWUjE5T3Fnb1lUaWJsMXpMcG9hVVhKRjVZK3Vo?=
 =?utf-8?Q?ZHQwMLRBHKSjVrbR1J6lsTtU4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315fd15a-ccbb-4502-6ed5-08dbd130f15a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 05:53:54.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW18qSEJfa7uCMnb+ube3b/UaXeIg309eJynxeLHjrBE4VboAlbMIPYUEpKz/8k4RORJIAm+AolEQvtKi/HQJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726

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
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
This may be viewed as a new feature, and hence be too late for 4.18. It
may, however, also be viewed as security relevant, which is why I'd like
to propose to at least consider it. Note that already for 4.17 it had a
release ack to go in late; just the necessary normal ack continues to be
missing.

Slightly RFC, in particular for whether the Kconfig option should
default to Y or N.

I would have wanted to invoke setup_doitm() from cpu_init(), but that
works only on the BSP. On APs cpu_init() runs before ucode loading.
Plus recheck_cpu_features() invoking identify_cpu() takes care of the
BSP during S3 resume.
---
v4: Re-base.
v3: Extend command line doc. Add changelog entry.
v2: Introduce and use cpu_has_doitm. Add comment "borrowed" from the
    XenServer patch queue patch providing similar functionality.
    Re-base.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -33,6 +33,8 @@ The format is based on [Keep a Changelog
    nodes using a device tree overlay binary (.dtbo).
  - Introduce two new hypercalls to map the vCPU runstate and time areas by
    physical rather than linear/virtual addresses.
+ - On x86, support for enforcing system-wide operation in Data Operand
+   Independent Timing Mode.
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -788,6 +788,16 @@ Specify the size of the console debug tr
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### dit (x86/Intel)
+> `= <boolean>`
+
+> Default: `CONFIG_DIT_DEFAULT`
+
+Specify whether Xen and guests should operate in Data Independent Timing
+mode. Note that enabling this option cannot guarantee anything beyond what
+underlying hardware guarantees (with, where available and known to Xen,
+respective tweaks applied).
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
 
@@ -599,6 +621,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 		mtrr_bp_init();
 	}
+
+	setup_doitm();
 }
 
 /* leaf 0xb SMT level */
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -202,6 +202,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
 #define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
+#define cpu_has_doitm           boot_cpu_has(X86_FEATURE_DOITM)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 #define cpu_has_gds_ctrl        boot_cpu_has(X86_FEATURE_GDS_CTRL)
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -56,6 +56,9 @@ config HAS_COMPAT
 config HAS_DEVICE_TREE
 	bool
 
+config HAS_DIT # Data Independent Timing
+	bool
+
 config HAS_EX_TABLE
 	bool
 
@@ -187,6 +190,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
 
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

