Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C8590DF2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 11:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385449.621101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQkH-0006hk-MB; Fri, 12 Aug 2022 09:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385449.621101; Fri, 12 Aug 2022 09:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQkH-0006fo-Hj; Fri, 12 Aug 2022 09:14:21 +0000
Received: by outflank-mailman (input) for mailman id 385449;
 Fri, 12 Aug 2022 09:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMQkG-0006fg-Gr
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 09:14:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 256dd813-1a1f-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 11:14:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3625.eurprd04.prod.outlook.com (2603:10a6:7:8c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 09:14:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 09:14:17 +0000
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
X-Inumbo-ID: 256dd813-1a1f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQEbIH6tLLIx6koGT2eDSvitG7LG4ITN/xt8lZQ8m3IzVO5R8izJWch/yE1WE4wTNDlGiejk3g1ZsWa3O8vb5zGe5xQY1GO0YmdqTPBjH0q0Sviw++3Cq0KzByOAW9zq72lg5yzJx36h93pwJ/rkbenJATMxdqnZqXNcdPQeTPCFzdNkZSjp80xb5e33HmTbO6AwWvsUAPsN8zKgtL9mrrSQXBXNSXI3xLAN0Y/uQ8Ny2aQdQ/0jsJS+99xQWTMH7Z4jSfawtfRj+3IdjU9hgbyLDfaSwN5M+uhNZjqst71+M+GMAm/o63JWDMQHlMGgGl7J7QJRG7CY3qhqTXHXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqpMOTaZxDtYwoblaF22Ik5Dgt5Lak3ElJ+MWxm/G5g=;
 b=FnZWQWE4UwFXYKgBJgEYoJRLVCGqZO7cCp1F+6EvbiTEr2aea6U5virHiT/+AJNBpMj8CIpyqUNENrCrI60cLwqpRnsdDy50hlK9r+ZcxnzC23VIIShFB3NjlMG3uINRZx/pzT3+q9e8iFSjtel7oHMk3q/u4nJwuWTb0RspAcMQo/dEiCAWJweCW6Bs2SrIAhnQIkxsmcO2HLoYtEZT1DWula5PtLUUuFL3MrFKKfthqIJWFNkA2G/5+7MOI2IwixJk8JYxdi3mbyyAoeiIL6K5G9emDvR7gtIfOwudhpOFSjv40bI6d9Pg3CoYwKNX7gRoQme8Rl5hichIbtM4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqpMOTaZxDtYwoblaF22Ik5Dgt5Lak3ElJ+MWxm/G5g=;
 b=BBO1lJrH9rBfB9sE4m+E02Sq+h/m3Hdd/X5ZW0IN3LQZZfVckev3nLWGI8Dw3eApRay+KDLrCj4uT32qtvCQA+uFbOCsBgyaLQTWeRK/jRPryHV5krv/4KlM4i8wc64Gtr0uuItV9CPrADNykrpzjFzJ0bdNkePP+2UUyPB37MHPqRdnJEmzyr67FWlXNlw8XQDi20vTeY4sINBmV9kRSgm3yO3JzraTOFToAzPWKy6oruUy283zSBh1YkEKJOEMh6X8mjC4Mjzp6bG5tvjoTHyEyJJPKH10/KOTRVKEY8b5VH0r/Ir2H0esxEquJ+2XazdT+QPw3V2zU7xvGUqZ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1eb61d7c-3668-4a9d-ad33-682f2fd12071@suse.com>
Date: Fri, 12 Aug 2022 11:14:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: help inlining of functions involving
 alternative_call()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0361.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed4b44a-e646-4d5e-9693-08da7c4308a0
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3625:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNzQDsP2S9BTt2O1yNwIxOzJcqvRQBY0lo5pDE25s7CaFDJieGf9ymdZmVIWiQjP9Q6mhK3ATYqKx8Rn9UVtk+EwvEIFC9hwNlFON/8vXR/R7crWC7kXLo/pCGMp9vK3vsa5mO/9TTs8JcK1mnkZnYjBhtStEUdaMIs1pHL7fy4OSqSXhfxaFgTJFx/Jw35CuXsMKE7JGKtzPiuWkduYqukNfkph9AzVJImANrCn6W8raW5B3fgcEIWrzTN6kl+Sya8QHpb0C3/1WVbxEIq956atBDZevKPrppISxjRTUPFR4pItYNgv5doP+hI0mOKHCPDI1QJxgQE+G5PKnVZqdxOQlrL9tedyCdRP5xtwQGkVIVj85WHooUsKQspbMJGSXhWqgyhDj4c0rb3rYt2bJPT2YAGVclcCxsX/k+KX8NxzfcxvZYU6ga7Tapzd+7lPrAI2APacAN7XJ8EixqCIWKGVDWk34fE/TVGRdjFHFVrkym3f/0k5T3kCo27oKaTZ77zRfaFi3nSO3tlYjnJiZEucR6LjClFcoSybZvbIYetS7kLJzWORYd9lZ7lBe91KqTL+ia3EMt2QjZ9jppNnJuC4+eLkG58Eqn7NZGqKk4wi4Vbj4FiXm32dvOzA8G5rcqxUDhrJyKEhHldVue3NkRwS5M+Milhhtq8tOgx0XBpJMh/mlKPzDLR5CUmk4PFP3bx+oTjwarXMta4gdRrwAJ7zJGE4QEX/WDG1uHEuF+IjtHqGUsCHLNR4+kPjeubtAp03L+2sh4nvL5OqxhTLt8dwb2UEGyhRzgWHVH5yO254ZyYdx+gSeaXHRkPgmtfmGWywBS4Z0ckdFFJbAxvLwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(136003)(396003)(346002)(316002)(54906003)(5660300002)(6916009)(26005)(478600001)(6486002)(6512007)(186003)(6666004)(83380400001)(41300700001)(2616005)(36756003)(31686004)(6506007)(8676002)(66946007)(66476007)(4326008)(66556008)(86362001)(31696002)(8936002)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDVyL3hjTG1mTFBHTkdhTk5HcjVmR2FSZmpQd0hKdm1mQjhzTndubURBMEhL?=
 =?utf-8?B?Mmt5cVZ0all1TjkzNDhVaWxVZGkxRW9jSXJSQU9pVlRJU3huQUYvWVBkWWZ3?=
 =?utf-8?B?M2JUd09ZbFgwNTZCSVZuOEo5TmNybDlIb25XTWQ0SVd2dmJZY01HL0tWa0dw?=
 =?utf-8?B?OFpMMHhCMzdQUW1Nc1ZkTnBsck8ySmFGTXFpdkZTM1pFeXhaZndsbkt0VXFa?=
 =?utf-8?B?REI2Nk5Ta1hkc0k0S3ArNWF2ZWc3RkZJUHJvRnUwQm5ycUxqczFRZWtSNTQ0?=
 =?utf-8?B?K0lsV2pSY3hvZ0YrZGlrWDB5RUdGKzFVYjRacGFWV3FUZ0lVMzMxd0hEWkFx?=
 =?utf-8?B?SVR0ejRSTys0Y2p3d3dtTTNwSlYyV1NYSiswSmhPeEY0MENSVGppcEJ4bjJs?=
 =?utf-8?B?ZHZRNmk5SldZUjRBTkN4QzE3S1JSMlFzeVJqNkZqME1EQmpvVERqb1NZdTR4?=
 =?utf-8?B?TklIT2tQUmw1QW1XaGR1MzArU2pKcGR0b1JzS3hyMldXK3lGTWgwa1o5NDkw?=
 =?utf-8?B?NkxHN096WEF3dVorRkxIZ1FTRFdqSTNNeWhSd1l6c1RlNVR0NlhFUVZsZWhs?=
 =?utf-8?B?bUhYWCttMGl1MnRZQXR3R2Y4WTBzKzRrQVNNdFpLQ2MveG5XMHI5WHdLK2dx?=
 =?utf-8?B?dHJVUlNSRHZxcG5UNlVyYXZ5a3h4akRCcUk2YWsrR0NScGhpSnNwU2ROcWJQ?=
 =?utf-8?B?TzU1Nk8wTUF5dzVmK2JpUGluUlVrYjZ3VENGZ3JlM0JEazg1RzdJYzNoK1lw?=
 =?utf-8?B?Wlc1TjlKS2orQ2lpdXExQ0hvYmhtZ3U3eHVSM1liS1JJYnNRWVc5Z2JqdGxH?=
 =?utf-8?B?UWtGM0tOYmU1M1djRUZHcjN4d0FyVTZWVFo5VWd0NnJlamVDRE9uSHlpNjJw?=
 =?utf-8?B?eU0xRFZSTllLOVh0Ry9obC9VQzhEeFUydk1GZWgvdkUyTDVTUks0QUg5TTRa?=
 =?utf-8?B?N21UQ1NNYWFZRTEyQitKVlJNYzliY25qaEp4ZlhKc1p3dTBPM2pXemZzdGsr?=
 =?utf-8?B?Yk10bE53RHhBcklJKzN2ekZSMFk4YlBvUWRsWkVGT2h3ajhZOFhlS0RBeWJi?=
 =?utf-8?B?Yjc3ajJnckZEbUxDbVo1Qnp6RHhjcnNLaXZWWHpISnQzVHJsZzZnWGVqRWlr?=
 =?utf-8?B?M0dnWTFsZlFDUlYvSjdXczgrYmZrdytaemIxS0piZHpBVXpDSEVmU1RNdTk4?=
 =?utf-8?B?RGY4UDZTaTZ1d0JjMDFJemZDTjEyeWRrc09EUWZVVVB3ZTN6MlYyQWI2cjhY?=
 =?utf-8?B?Si8xRzRNRExTeVdLWXVkendWRytGMEFTS0pNYjJhUE1tcHRsY1JadWZ2aUdi?=
 =?utf-8?B?VXZUV21TRU80WDYzYVRrZlc1bHp5Lyt0ckovcndHNUtKcEJNRm43cFRDUTVq?=
 =?utf-8?B?S2pjTkZqaUlFbTA0Zzc3Y3lOM0M2MldabTM5dnNnenp4SWhoYmpuQXlpcDNv?=
 =?utf-8?B?V2Iwa3V0bWdTWTcvYWNWTE5odVk5VlNQUEhwSFdmb2NWbjBHaGNYRERoNGtx?=
 =?utf-8?B?NkJmZFFBQk55TFd0TFpNRkp3d29Ua1dsR1VWbTFUR25TbzRMUWxBelhpV0d3?=
 =?utf-8?B?eVpiNnBGWnJDQWtMM0NPek1BUnJIaFlnRUJRTkdtNGwrSkoxaVZseDhpNTFs?=
 =?utf-8?B?QWJhdkdGZ3ZPRkl0Unpna3VWeWo3d3k1QVI0THFQQ2ljOTRHYU96dUdFWG1G?=
 =?utf-8?B?NXplcWJ1c2YyZ0RPSExGVHRKNjVDZytsRUhacEh0bjdveldoREdrZFNKc1Ex?=
 =?utf-8?B?NUVIK2dQNTZoRU90dk9FL0lQWExDWTFYMzUxL3YwdjBxdHVrcFdOeEowQ21B?=
 =?utf-8?B?YmpaWTJNVEJhc0ZrSkxJQ1hiYm1GRmVtL2JNVVpVb1ZrVVhIbWtnZVFmbHpF?=
 =?utf-8?B?L1ZnOEJxVjVKTEdwekQrTWFWYWFkVitnMlpXbk83c3JKQTFZN2NUbXJzVFhk?=
 =?utf-8?B?Vm5xUWI3SWZ1cUxIT0RkeEp0R25DcWxGanVZQmYrNUh6bkZnSHF5Ujdhbk0v?=
 =?utf-8?B?L3lsb0ZpaytkRWRZS0ZlSHFGNmZTQ3NpZkFoNkM2elIwdTBUdWh6YmRIcnRS?=
 =?utf-8?B?WnRkdmZhOGRLc2pxaUNPMDlpdmJscGFQYnNEYTlqL3IyRDdlWk9wMXl5VEdm?=
 =?utf-8?Q?UMGRE/IURIh9mSMN+/u2gfram?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed4b44a-e646-4d5e-9693-08da7c4308a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 09:14:17.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kViFRrzq3XZwOXlbENBSIlSrXI0p/e0jhnWFAuk5iOcKZBA/jyKU7r4FjU2IjKJD15+L8h5rMKxUSbnZVyfbkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3625

The involved asm() expands to large enough a construct that often the
compiler would decide against inlining when a containing function is
used more than once in a CU. Use the "inline" keyword when supported by
the compiler in conjunction with asm().

The INIT_SECTIONS_ONLY dependency is because in that case "inline" gets
expanded to "__inline__ __init", which obviously can't be used with
asm(). But for init-time only code we're also less worried ...

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.
---
Perhaps this wants extending to other asm()-s involving ALTERNATIVE().
At which point the question is whether instead of altcall_asm we'd want
to have something like asm_inline.

I understand that Linux uses Kconfig for the feature detection. The
discussion on whether we want to generally follow this model continues
to be pending / stalled. In this particular case the error output from
the compiler when "inline" is not supported can be huge (thousands of
lines, partly because of the many nested levels of macro expansions),
making it close to impossible to recognize what the actual issue is. Yet
that's what would be happening if one switched the compiler from one
supporting the feature to one not supporting it, without remembering to
explicitly have xen/.config re-generated.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -386,6 +386,7 @@ CFLAGS += -Werror -Wredundant-decls -Wno
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
+CFLAGS-$(call success, echo 'void _(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null) += -DCC_HAS_ASM_INLINE
 
 ifneq ($(CONFIG_CC_IS_CLANG),y)
 # Clang doesn't understand this command line argument, and doesn't appear to
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -203,11 +203,17 @@ extern void alternative_branches(void);
 #define ALT_CALL6_OUT "+r" (a1_), "+r" (a2_), "+r" (a3_), \
                       "+r" (a4_), "+r" (a5_), "+r" (a6_)
 
+#if defined(INIT_SECTIONS_ONLY) || !defined(CC_HAS_ASM_INLINE)
+# define altcall_asm asm volatile
+#else
+# define altcall_asm asm volatile inline
+#endif
+
 #define alternative_callN(n, rettype, func) ({                     \
     rettype ret_;                                                  \
     register unsigned long r10_ asm("r10");                        \
     register unsigned long r11_ asm("r11");                        \
-    asm volatile (ALTERNATIVE("call *%c[addr](%%rip)", "call .",   \
+    altcall_asm ( ALTERNATIVE("call *%c[addr](%%rip)", "call .",   \
                               X86_FEATURE_ALWAYS)                  \
                   : ALT_CALL ## n ## _OUT, "=a" (ret_),            \
                     "=r" (r10_), "=r" (r11_) ASM_CALL_CONSTRAINT   \

