Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB77591DE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565716.884127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3k1-0003el-IM; Wed, 19 Jul 2023 09:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565716.884127; Wed, 19 Jul 2023 09:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3k1-0003br-FP; Wed, 19 Jul 2023 09:45:05 +0000
Received: by outflank-mailman (input) for mailman id 565716;
 Wed, 19 Jul 2023 09:45:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM3k0-0003bN-6t
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:45:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee76222a-2618-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 11:45:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 09:45:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 09:45:00 +0000
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
X-Inumbo-ID: ee76222a-2618-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMfRo7QmsXgLzIkGLJiZBqwWm9uvS7YFSJkHgKgPmekiOosLniTuIjazDYBEBdjdc5eFrNnTPySgLBvHXosGSki5S6XFBIYdS82ZnEMw0k9SgmBbw3FVYEMlIvVK1SAIRcAho+YrFR2NjmNuQDQeZJqkuPZehauncDO3kppUdMYPcKaSdBk1Hseo036dQOQIxUCxKx2qNTfA2f1VpaaXsJM9JPgMbTVJ2F/JTQpwQJ5zNumvhbQvkInQxY9ONSd3oUovTkajm1Sei2LW11R2+Y6wp/8t1jojDRPGOjbYTGpP1EbkgxuoQC8RGSXPqWg5B+hSe3EuP+bNSG0HYZMiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7fll069aCOGhw/Ujfnzc7eYrLnddgaGWv3jfKQz64w=;
 b=TsTvQHFqfbgJdU1pB2H+gYAj/GjP66KGw7cvjf7mhCEwE0jQSho4z48PbvaAYmuGoRHIpT4L5HHgP+G4CiiKWnAHi7mzeCZkGAZxJ15cL+bciLyPj3X45n+aRc60XaVbYOtbwosSRES3J8Pqr8P2j+X5Aa3P9rQ+hxLdck67Ewo6W0K9KsJ9+KTgpVlgYr6j/4/68HtvcxnF53ceEpFiTURllAVOuOkTwSnW+//gkUzt3+8b6vLIsGkRRuPa2zpIaoO+dOflq57J8JgILYZC+qVOImSiDKbj0nx5unncD3oQEVmJZdzII0JmuPKrRGQbGcZFQy9EQej0HNtSHoHkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7fll069aCOGhw/Ujfnzc7eYrLnddgaGWv3jfKQz64w=;
 b=ZUbi4UF51H2B6Msf3kUDA0flYx4UtPGUBlobZ6KYmy5YXqrIIwHUYeOTIlwccQ7speDPK5H0e3vQ6YaHlC4FfSn6nmHIr+JCQDvfoz8hkC7ofl8J2FMRaryiGdo0giBt6g1urkXnTMh3jlFUhkRGPROx2kIe8FdFkfmOBKWn0UTeEjO8keSwyt5kA5oGxE7JkkI6qWP1qU68aMf81qrpejxc9Z1PNLkK5mXWQQ7MaAb0qkXqtb7QBhs4/aZK1EqA2fucQ+r858Qwi00/XJhLs06mjtNyJFx6OLlSmTK+IUbe3WHmfmXOg9u1ivZ6pKv866CwCJRuYl9Gm16tOOINkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad0275d3-7146-b695-dfb8-f9269ce30894@suse.com>
Date: Wed, 19 Jul 2023 11:44:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 4/4] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
In-Reply-To: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 70390515-baba-4c7e-f6fa-08db883cd1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SN3FhBNfC/WpRWz1ZOLtGEqbni9fO3DUjCxsEBbddoXmyXwAenS3K428UPeCm4NDBHGfawO1nFP8CjXwau69AEm99bBg0S9f6Aogcw1qoSQU5ilKXbJGd7bArlgdQifUGJKyGDh7Nsq/cogWrbjkT2nxWlmRolSQAPU3QMWsTNnI6InnegBu/VwQX3n9xkiNiBPtE3MfEoAR6Pwbdu1By5y7tVLv+9fcCJtm5TVlNdWVbHtJTbXbmfiMW9Fk1q4dY0Yn8eRyMub8iCoUkRnHRoGNFtdjCxSW461Ju2sZIuPTOEGjJ2ioMiUs1ea0PJ3F3+X0c8WDi2m2LMynq7sxAClXS9kOs1J4nuehPNkOdrSYEofZ/y4EyMvxCtQoB1rixaUJtbtV66gYsxFEuF89/ieFCKUG+K5NZxx0cNYVF41bumJWP+SyeUlXLWCh45kb+JKDyKFF4dt0qDVv4rcT4+cF0NntJKJIGlVR4J2BpQ3h8vzlBRLtsJuTWCGbBMmEGCMKkCG4Pu+l9zLpYozyKNSlhcQ5QxIjfBRDCoNjj15/lboD41ke4L7Upz+VgfgShI9XEHCDsfRjE517TRXDSQyzJiVa8y3lBBjQVxdF/HxS+7K3+ndv/6QOsWcH8nb7hHWdvnyyfudqJgvAAx28Yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(31686004)(6486002)(478600001)(54906003)(2616005)(36756003)(31696002)(86362001)(2906002)(26005)(6506007)(186003)(6512007)(38100700002)(6916009)(4326008)(66946007)(66556008)(66476007)(316002)(41300700001)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXR0LzdtbFF1OUJQc21pcCs3VitsSXJQai84b2tZV1BBV056cEFZVHp2eS9D?=
 =?utf-8?B?b0hzc3gycW9nYytlclNUYTY0OVVBTUtUK2I1ZERVM29XUEMwWVhUMFZxYzBT?=
 =?utf-8?B?Yzl6TjlpSE5zaVd1VDhpS3RnSkNYTVRzOENBdHFzeWI1TVZuQlowS0I0VGNT?=
 =?utf-8?B?c2hleittVklXcmlJTDNWcTV5RXY4dHRvTGtCQlY5NW9JZ0RzVVYxOEZoRENm?=
 =?utf-8?B?WDM5NGpUWlI2TzQ1MlVIc0FmdHFaOTQ1TDVMYkdKVlEzTTRVeWtFa1Jtb1F1?=
 =?utf-8?B?Y2ZJcTc1K0xHWVJEWGtQOGFPYXRQN2JuMTlHMHNnbEdyZ05WTEVRWjFmRjBF?=
 =?utf-8?B?MzlvMFlJSXdoYkI3eHBheXlxTUpDUzdmRTBtMW9mK1lqMUtJcmZHajl4aVcr?=
 =?utf-8?B?aUdGczhnZlNJOUtaeEpSQ0U4S1NDdjJuZVcyV2FGdGQzVjZOM095VUk3UWxI?=
 =?utf-8?B?aTNhbmN6MEZUUk5rZk5pa0lEcHFGblo5SmdqTHlGUjhOUHo1cXNXQkN0ODZu?=
 =?utf-8?B?Tk0weEsxeVl6M1dvRzBxUWowMnR4ZHVtVkh3RjltamoxWG5uZ1hkd0xyM1RY?=
 =?utf-8?B?bUdhSmhMMnFyd2ZmVlY0YmRod1RMMmZMbGRCYXpreHVBb2VYV2pyaVJwd0JF?=
 =?utf-8?B?OFRMSHdHQWdVV0hUVXVsZCtMWnhtb2xaOC9BRklWSFlBNzRoVHIzbldrSXZO?=
 =?utf-8?B?bkJUN0ZDdlZza0cyT2tIdGZnZURQWnVjcUo1SVo0aW9aZnFidDkvMGsyeU9p?=
 =?utf-8?B?U3NTLzFEaHdkSWoyZVdvb2JZVzhwV0hmRE5LU29LRDZqVGNMUzAxd3FNUHcy?=
 =?utf-8?B?c0NEcXdwMHEyclUyMWFvZk9NZHBNcDliYmFxMWFjdWxoNVByNVVMdnlyOG83?=
 =?utf-8?B?QllDZ3QwYnk2TWtoUUtWUEhxL0dNYnAvdFRtZmFCWEVaY0FuVjI5ZGxsTC8x?=
 =?utf-8?B?L2J0WVF1WmZWK0hLRzh5bld0Um5ETzFzY3pIc3NIalRzWlJTSVFZMWMyS1M1?=
 =?utf-8?B?WUpHZWJOZXVjeWRRUk9sQXJyVTZXb2xTYXd2WjIvZnBBUDdpK2ZJeXk1eEw2?=
 =?utf-8?B?Qkx4WVFuTHliRmQzdGlBMjZOWll0OXNsS3hRejh6Q0p2bGc2dmlBeG9LV0l0?=
 =?utf-8?B?STRDU21FaXRlbWFhRElzZ1ZnNVhZZStycWFBcXdvd0kxZ09QT25lQmx5eTF3?=
 =?utf-8?B?RkVYYmlOWDNPMXlEUzJ4SXV2QWd3VTdLOFRRNmJJTFVGVVRieEMzWkFwZnJr?=
 =?utf-8?B?cmJyVFYzK3Z3TkMwUzBQZjZGcWhrSGd0UWFIWm9qSG1UclNhelRRRnNsWkti?=
 =?utf-8?B?TGRIcmVQN3JDQjFpZTJrTXNZSkNxZ3ZuZlhKYlVaZ01FV1NGTmVUd24vMnoz?=
 =?utf-8?B?SFlQOG1oK0Qva3FiVmxLbi84SlhqWCtZSmdaNzNDUGhZVkQvK0xweFFxL0M3?=
 =?utf-8?B?STlxV09BTFd4U2E5eGZZN0N0YnVHNVZzZC83b0ROSk43bFh4VE9sMkM2Zk5E?=
 =?utf-8?B?M0ppek4vRHp2Q2plMG9xbTlMb05XdnU4NUprMndhSjVnSHQ4R2hWbFFHK1cr?=
 =?utf-8?B?OGZsc0xBOFB6VHU1d0l6WU4wM2s1c2JXT3BKUkpyWFVBNDRWTEkxQjdQNk5Z?=
 =?utf-8?B?aWNIcFpESDc0OGJocWphdjRKbXdEVldPdE5ReWlPbFRTOU40KzVHcXk1WUR5?=
 =?utf-8?B?SzlMaGdXM21DVTU4Z2dTdUpjeEUzc3M3RUtaMEtzU1I2Sm1iTzd2c3ZuMlYz?=
 =?utf-8?B?elkzckZBcjg5c1lFNTNtdXZYbndJQUEzYmlYa2t3akwvOWRTTzFDUGFIQkVt?=
 =?utf-8?B?TUhIZDB0YjhNckFvWEUxQlN2MHNuWHVib29tOGtVVFdDdFVPZVhid2hPbDJj?=
 =?utf-8?B?Umw1bE96TEh0aDFiMnQ0eGIrZ0VrYzEvR0JUMDg3WXA5a2FMd2N5Mk9aQ3Rp?=
 =?utf-8?B?Uk1sZGhQMTJrcFlOQkU2L2wxNEQyU3lpbWxJL2NUdjdvejlWMWNLUDBNSmpB?=
 =?utf-8?B?eEMxTEE2T0FrSUdabkxlSHUyRWpHMVJnZXpHdnRYeStRYTJLamMyQmhhSUhK?=
 =?utf-8?B?MFpZeGJPb05mNHNnQW9PYnVGeHhRNUdQbjVXY0xlWnUvaXIrNWtZQlF1eWxi?=
 =?utf-8?Q?M0uhWrNMW4CT6/Z4uPrlG+sxC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70390515-baba-4c7e-f6fa-08db883cd1a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:45:00.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 073F9Jyyrr5fzEQ0sg1wUtBS9fIPMht82CF5vbPhn22m3nV/698GjRkyB854yGz8IT5TFvepkiMFaQoeSV+DlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404

Certain fallback code can be made subject to DCE this way. Note that
CX16 has no compiler provided manifest constant, so CONFIG_* are used
there instead. Note also that we don't have cpu_has_movbe nor
cpu_has_lzcnt (aka cpu_has_abm).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but as
CX16 shows this isn't necessarily better than the #if/#else approach
based on compiler-provided manifest symbols. While not really intended
to be used that way, it looks as if we could also use
IS_ENABLED(__POPCNT__) and alike if we thought this would end up neater
(because of avoiding the #ifdef).

We could go further and also short-circuit SSE*, AVX and alike, which we
don't use outside of the emulator. This then would of course call for
also having a way to select x86-64-v4.
---
v2: Also cover XSAVE.

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -76,15 +76,25 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
 #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
 #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
-#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
+#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
+                                 IS_ENABLED(CONFIG_X86_64_V3) || \
+                                 boot_cpu_has(X86_FEATURE_CX16))
 #define cpu_has_pdcm            boot_cpu_has(X86_FEATURE_PDCM)
 #define cpu_has_pcid            boot_cpu_has(X86_FEATURE_PCID)
 #define cpu_has_sse4_1          boot_cpu_has(X86_FEATURE_SSE4_1)
 #define cpu_has_sse4_2          boot_cpu_has(X86_FEATURE_SSE4_2)
 #define cpu_has_x2apic          boot_cpu_has(X86_FEATURE_X2APIC)
+#ifdef __POPCNT__
+#define cpu_has_popcnt          true
+#else
 #define cpu_has_popcnt          boot_cpu_has(X86_FEATURE_POPCNT)
+#endif
 #define cpu_has_aesni           boot_cpu_has(X86_FEATURE_AESNI)
+#ifdef __XSAVE__
+#define cpu_has_xsave           true
+#else
 #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
+#endif
 #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
 #define cpu_has_f16c            boot_cpu_has(X86_FEATURE_F16C)
 #define cpu_has_rdrand          boot_cpu_has(X86_FEATURE_RDRAND)
@@ -114,11 +124,19 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_xsaves          boot_cpu_has(X86_FEATURE_XSAVES)
 
 /* CPUID level 0x00000007:0.ebx */
+#ifdef __BMI__
+#define cpu_has_bmi1            true
+#else
 #define cpu_has_bmi1            boot_cpu_has(X86_FEATURE_BMI1)
+#endif
 #define cpu_has_hle             boot_cpu_has(X86_FEATURE_HLE)
 #define cpu_has_avx2            boot_cpu_has(X86_FEATURE_AVX2)
 #define cpu_has_smep            boot_cpu_has(X86_FEATURE_SMEP)
+#ifdef __BMI2__
+#define cpu_has_bmi2            true
+#else
 #define cpu_has_bmi2            boot_cpu_has(X86_FEATURE_BMI2)
+#endif
 #define cpu_has_invpcid         boot_cpu_has(X86_FEATURE_INVPCID)
 #define cpu_has_rtm             boot_cpu_has(X86_FEATURE_RTM)
 #define cpu_has_pqe             boot_cpu_has(X86_FEATURE_PQE)


