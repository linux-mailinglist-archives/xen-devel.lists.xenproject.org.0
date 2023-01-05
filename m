Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C39A65E98F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 12:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471812.731823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDO9s-0000OO-Qg; Thu, 05 Jan 2023 11:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471812.731823; Thu, 05 Jan 2023 11:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDO9s-0000Mc-NU; Thu, 05 Jan 2023 11:11:40 +0000
Received: by outflank-mailman (input) for mailman id 471812;
 Thu, 05 Jan 2023 11:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDO9r-0000MS-HE
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 11:11:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2043.outbound.protection.outlook.com [40.107.15.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8ef1ecb-8ce9-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 12:11:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 11:11:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 11:11:36 +0000
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
X-Inumbo-ID: b8ef1ecb-8ce9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1z2ouDNT8Y943IKrK5OPbF8jF8m6MCFsdtr+V+6cJsi3bmuxH53N/8wHACn+oML4Ke7Howg7PYwVhbzikQccmyqYsHiVvvKFlNmF0OcI1mO7GPQnG67MPHBREBY10MUZ2qkObj9++TYnKxtUm1RYzaMN5Le1tZQx2DWMVgnIZqBiXk35HrLjyPqhtCyMRxrChaLiM4wKu2E2p8uY8/HjJsMofnIcqx4yr++jq/9rralAiJJyBt/J5auKHNjJn1E7qca42auMHX1ZIa4YSgY/cwccK8bGRKMLNDXV6HnXHd3jOd/dC2WW+IQE1wA8HkFSn/Q//cnFjOG4B7PpwX13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm9QUjQ0OiBxmbXmS8go9kS0Co5ZCYy7d8B43NW/X6E=;
 b=hjpnfc4CEnTc4m52gTccQVOKhh6EERJJ3QXkgHZV9kP+LApWQfe8JZ6n1cbkeIpftSlnL8u9mQQzCJrR8K4WXQFsEjaJXnyfMhPNavRI6tvCDtzvjM62SK+LU+XmLfj1Dhg9aJdxRv18yFrnrVn4UQ6LdZhkqkTsJEuHLcBiYIb8X/vfRw4z5SF8xTpfTYHOdPdvdveK7YsOgqUPpStPy8REvlzCwlk3W92i7GRAgGsh6T6Apw58iU6x7HQ0VlTIAHQol+ccM4VxTqFPrN3zk31rbqLpieZ4uHioCkx20AC9WhfcMVZqmUrPNpt+YIUsUd2xAjAZ1ln+BK3PRuM5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm9QUjQ0OiBxmbXmS8go9kS0Co5ZCYy7d8B43NW/X6E=;
 b=KAqDODOOtOkq3Mn+Wr7k3Ag2w3gvH9whJUHp/ycOF80s+d1WUhTHxEM13EGsUHNs+3kO3DHADoRhXaFfqDd5w6qJyAETlbGKDJ/DObnwPhJuN9HsZnakdXqvtiSISGGlUsSgW1Y9S/MNlURRJ6Qn+HV8AZi2DXK01Mu+prhMdBdm/Le89nH5jOAuHTpptkkk/c7QYxgmzJaJGIqrFct/ZQ3ZL3nOBqbjg7clSTd34OfQ/aXrW9HifbkWiytZu4wXt7gqSMWzi4C8ZP0s4GwQCA5tq2USLlYWVC3d+S98unBoE3/nqPCXwf+SPTuPhfvfjBvmTBnfGu3N7XxG0GAqig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87efc536-3344-0459-b756-62a035db4090@suse.com>
Date: Thu, 5 Jan 2023 12:11:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 1/2] x86: macroize switches to/from .fixup section
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
In-Reply-To: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ffbc2c-292a-4dd4-e515-08daef0d9c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4N2lcKCBikWndPU9hdaDzG55Qa/GnydCdeHJ61KkwZaXURg31s15l8EWZg3sK1vlkfBuRhkesWYeq1X9sDJZ5v3DyNs4O9GJGMcq4DBNoiijigX2IG07XA2ZD1Q5MfeQxmlGD75xROJhU9VGrdYWAph5cJmoCMBjr23Tb5RogET0+qCnsubVaYCdOHFAn0aDuLL/vgRmeKj2PQj5tKP0N1dUKfIpaJdUbf9iDce/2DJyCNPYnx5EtYhAVJ4U5sFL+c2HuAr/3IYYXrtrwNCT4S/zIA4BQ0OUsx1xl6wtSUVlR0CW8c475yPFURteYjwBFjYHCkqqqH+IT5IRdt/zWHQzSZsiODwRYW8caCO20UR7qkzy1+RBaOhJLODIipRLzl1ZVdARYLLZVx6sPiqd8w4KR7w++jdM26Vmo+EuHMjK7GIHg17xInfDUCbHD/P+bKlaDJdLwtfNtRH9m4X66+cuhBgLY1eXGurRUQHcCS3D8AXJBpEp/5cENjWSYGxhg9/KZhEeqUjDt93fCS6GJO+ronNZVhDGqVj250ltpCGMq09J/izlxGygNAnV/o/+moHi26BI4bP3sE9t/PrFboSasg5Mp44pVcU+mfnn02UG8kuaax9c1fQ97wRK80wHRMlq++JZvxyqRP5CqdJl09rs1TYpTOqrHFyvVUPqHm5wW3qZe/BwdDVaSk6TtY1s+84rLYKSaVMrtJP1FZQT4Yhv1se9KX5dSK+foGRzSFyTYmgyaBFB4KuOT2/EkZhk/Wlwx6A2VqRCzarKzuaFCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(31686004)(5660300002)(30864003)(316002)(8676002)(54906003)(6916009)(2906002)(41300700001)(4326008)(66556008)(66476007)(8936002)(66946007)(6486002)(6506007)(478600001)(36756003)(83380400001)(186003)(86362001)(26005)(2616005)(6512007)(31696002)(38100700002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTdiQVRlY3ppcWVZUG10b09TcVZ4NVZhdWtrQ0RETWhFeUE2amM4aUVlY1Ft?=
 =?utf-8?B?YVNteDhyMHE5TTJEYjZSV0lnN3IrTk9kSnZoai9WclpxU1R3WHNidHlzNkhX?=
 =?utf-8?B?VlZxMmQ2a3hJcnM3SHhqRnBHRUNoMS9IS1AvOXdKSFh2MGEwUzRqS1hoT3dl?=
 =?utf-8?B?MjVzMkN0NW5RZG1yVnA3UWh6VnZvQ3NkS2M3T1BRMVlrS1MrM0pNZzJkMlg5?=
 =?utf-8?B?NTUxZEVENXQvUzBkemR5V2VlMndUNnUwcmkzSFMxQVQ0Qm15eXRZZjRyYzRn?=
 =?utf-8?B?Z0kzVDM1YlNDZzk3WmpJeXV4dWE2Smh2VXFTQmxJMnFWVnVkL3RQcVV6TnpR?=
 =?utf-8?B?TGI2M0lvakc0U3IxQXNua3AvRFRLWm9pRWZXUXpxVVlLbGVzSzRJNHFGZVZx?=
 =?utf-8?B?cmpETHNJaEFpQVRROVl0eVgzNWllU0VRTFhnMUdTSnJQR1JXVVJxbnQ0dlRE?=
 =?utf-8?B?K0tGNDRlVDA5c1UxanFTUGdZN3JjRHJrQnhxaVdLdlJFeGk3Q0d0d05uZWdK?=
 =?utf-8?B?ckhpVjREVkpzYzA2SjNiS25XSWlhbjhLOFFhTExPMW84WHptMWdEZnVYaFBK?=
 =?utf-8?B?TUR6ZUNIL05hWEhMeVE2WWl5aVdMSlU2d3ZOczF0RzgxeGVtY045akpxR2Fy?=
 =?utf-8?B?WmdrWUpPS1pVRnFoNjRzZ2NieXdvdy9zRDBZQVlvSnlGWjk0U0orbVhhcWxV?=
 =?utf-8?B?UXVMS0lta2JTNkh5dU85TldpTUMxc3NoSjVVV3Z2Z1dSQ00wRlRrVXUyWEV3?=
 =?utf-8?B?SERCcTZSYm8zMUEydzZDVlJtLzFWM1dvYUdWWkxFME4zbUpycVJiRHdPSW5u?=
 =?utf-8?B?czJPR09KVDB4MXpBajVrZzZEaU9uMHdkb2FSd0tNSHE2ZjkrTDg1S1lTeWts?=
 =?utf-8?B?K3p4QkpRSVlTcnRSQ1JlaGJrMlpYbWpPbE45N3pta0tndThRMkd6T0t5MUw2?=
 =?utf-8?B?K2NoenRqb1JsbHNWTzlud01wdmNZeWFab3kybUw3dkJmYkFOZ1VQQzlTckVW?=
 =?utf-8?B?R2RFcXd3KzhBNkNGNHVxcFJFQ3haMDJxdWNRc3FnYlNDcXNFaDZybXYzWmt5?=
 =?utf-8?B?bDdIelc1NVZ6dXRlYlJDdFNpeFBEMXFwclFybmlNcmpCeHM3MWdENE1Kb0VX?=
 =?utf-8?B?WGRWaS94T1VLWHQzcVpueFRaVk1nbWV0K1Z2Y1lJcjB0MWI1bFpoTTZXd29W?=
 =?utf-8?B?dHJzVlRkL1U3UTNranRBdnFxRFFaOGZYTTRGd1NQZjFpbnlDc3hnMmp6SjlB?=
 =?utf-8?B?R09OWERONjBzajRuZzNkK000blJpSHlYaHRaLzh6Qi9VakRoby9LUlgwbGJl?=
 =?utf-8?B?UGhoQnQrNm9LR0dtaTRJemxIak1NOENILzFwbHcrYXNIWWEvQUEzZE9MZ05j?=
 =?utf-8?B?cXZqQ1VRZmpwTURiY1ZiemJqdDJzOGx4SDVCaWpzQ3hja3lrNnhHS05TWTBa?=
 =?utf-8?B?ZnM4UDRtdWhVYzFQTysyalJDWVRnbWpaZ3kvUnZvL3AyYTNZMDkwbEpTSlp5?=
 =?utf-8?B?cHFaRVUvWEFYd3BlcC8rR2xSdytKSDZocEZGYW9iQ0s1T2dYNFJ3blpaS0Ja?=
 =?utf-8?B?KzN5cnp0Y1lPaGNtV25ydlUrMGVMdGFmdXgzOHk5cjB6c3FyZW5HeG1pQzY1?=
 =?utf-8?B?OEFIZXNGVklqUEtxZkQ5TGpUNDlRaStkdGpHTkd1aTIySmZaVU5TYVphWDRW?=
 =?utf-8?B?VFdTREYzcllOdEFwMWY2QTdSc1pRbWhlb043amJVTENNVTVMbTd4QVBrL1o2?=
 =?utf-8?B?OU0yY1lRamJ1alJ5cm8zMnRLWTBPOERHUmFZSityenEvSnNpbHAweXc3VDV3?=
 =?utf-8?B?dklqWU9weWw1RGVRWlB1VkgrNkxKYlI4VkVSRkRLT21lSVNhMXNvLzN1S3RZ?=
 =?utf-8?B?VlVwSXFINjk2WlZkOEZ6YVNLcHAzM2o3MkE1WmdFN294T013ZUxGMndGYWZ4?=
 =?utf-8?B?RGhQQW1uK1I3U3hpVG9MRDN5MllBVDAxK0NOR21WdWJYRnloWjJrVEk2TnEv?=
 =?utf-8?B?ZmxtaGdhVXNCU2lIR2o4SDVsYmdpakgzYjJJYjh6WnRhak9hNmJnd0pEZGZL?=
 =?utf-8?B?RUljYW1UZE5TRlhSN0p6WWl3SkpXbmIyL2NSMjd0Y0RFbUhySTJTQVdNMW5M?=
 =?utf-8?Q?Z/dBPvNeG5CkirnDqUylLSDNf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ffbc2c-292a-4dd4-e515-08daef0d9c45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 11:11:36.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtYRtnUuOTh34jTC7v99gUGKdyAvXUTJ6Q5xC1y9n0jzXfoi7mQYLrs1DUj1boSZ3Rg/Cs9zJQMtuLAj2KHx2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929

This centralizes section name and attribute setting, thus simplifying
future changes to either of these.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -57,10 +57,10 @@ static inline int rdmsr_amd_safe(unsigne
 	int err;
 
 	asm volatile("1: rdmsr\n2:\n"
-		     ".section .fixup,\"ax\"\n"
+		     _ASM_FIXUP "\n"
 		     "3: movl %6,%2\n"
 		     "   jmp 2b\n"
-		     ".previous\n"
+		     _ASM_FIXUP_END "\n"
 		     _ASM_EXTABLE(1b, 3b)
 		     : "=a" (*lo), "=d" (*hi), "=r" (err)
 		     : "c" (msr), "D" (0x9c5a203a), "2" (0), "i" (-EFAULT));
@@ -74,10 +74,10 @@ static inline int wrmsr_amd_safe(unsigne
 	int err;
 
 	asm volatile("1: wrmsr\n2:\n"
-		     ".section .fixup,\"ax\"\n"
+		     _ASM_FIXUP "\n"
 		     "3: movl %6,%0\n"
 		     "   jmp 2b\n"
-		     ".previous\n"
+		     _ASM_FIXUP_END "\n"
 		     _ASM_EXTABLE(1b, 3b)
 		     : "=r" (err)
 		     : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203a),
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1607,11 +1607,11 @@ static void load_segments(struct vcpu *n
 #define TRY_LOAD_SEG(seg, val)                          \
     asm volatile ( "1: mov %k[_val], %%" #seg "\n\t"    \
                    "2:\n\t"                             \
-                   ".section .fixup, \"ax\"\n\t"        \
+                   _ASM_FIXUP "\n\t"                    \
                    "3: xor %k[ok], %k[ok]\n\t"          \
                    "   mov %k[ok], %%" #seg "\n\t"      \
                    "   jmp 2b\n\t"                      \
-                   ".previous\n\t"                      \
+                   _ASM_FIXUP_END "\n\t"                \
                    _ASM_EXTABLE(1b, 3b)                 \
                    : [ok] "+r" (all_segs_okay)          \
                    : [_val] "rm" (val) )
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -164,11 +164,11 @@ static int __init cf_check stub_selftest
 
         asm volatile ( "INDIRECT_CALL %[stb]\n"
                        ".Lret%=:\n\t"
-                       ".pushsection .fixup,\"ax\"\n"
+                       _ASM_FIXUP "\n"
                        ".Lfix%=:\n\t"
                        "pop %[exn]\n\t"
                        "jmp .Lret%=\n\t"
-                       ".popsection\n\t"
+                       _ASM_FIXUP_END "\n\t"
                        _ASM_EXTABLE(.Lret%=, .Lfix%=)
                        : [exn] "+m" (res) ASM_CALL_CONSTRAINT
                        : [stb] "r" (addr), "a" (tests[i].rax));
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -67,7 +67,7 @@ static inline void fpu_fxrstor(struct vc
         asm volatile (
             /* See below for why the operands/constraints are this way. */
             "1: " REX64_PREFIX "fxrstor (%2)\n"
-            ".section .fixup,\"ax\"   \n"
+            _ASM_FIXUP               "\n"
             "2: push %%"__OP"ax       \n"
             "   push %%"__OP"cx       \n"
             "   push %%"__OP"di       \n"
@@ -79,7 +79,7 @@ static inline void fpu_fxrstor(struct vc
             "   pop  %%"__OP"cx       \n"
             "   pop  %%"__OP"ax       \n"
             "   jmp  1b               \n"
-            ".previous                \n"
+            _ASM_FIXUP_END           "\n"
             _ASM_EXTABLE(1b, 2b)
             :
             : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4), "R" (fpu_ctxt) );
@@ -87,7 +87,7 @@ static inline void fpu_fxrstor(struct vc
     case 4: case 2:
         asm volatile (
             "1: fxrstor %0         \n"
-            ".section .fixup,\"ax\"\n"
+            _ASM_FIXUP            "\n"
             "2: push %%"__OP"ax    \n"
             "   push %%"__OP"cx    \n"
             "   push %%"__OP"di    \n"
@@ -99,7 +99,7 @@ static inline void fpu_fxrstor(struct vc
             "   pop  %%"__OP"cx    \n"
             "   pop  %%"__OP"ax    \n"
             "   jmp  1b            \n"
-            ".previous             \n"
+            _ASM_FIXUP_END        "\n"
             _ASM_EXTABLE(1b, 2b)
             :
             : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -79,6 +79,15 @@ register unsigned long current_stack_poi
 #define _ASM_EXTABLE(from, to)     _ASM__EXTABLE(, from, to)
 #define _ASM_PRE_EXTABLE(from, to) _ASM__EXTABLE(.pre, from, to)
 
+/* Exception recovery code section */
+#ifdef __ASSEMBLY__
+# define _ASM_FIXUP     .pushsection .fixup, "ax", @progbits
+# define _ASM_FIXUP_END .popsection
+#else
+# define _ASM_FIXUP     " .pushsection .fixup, \"ax\", @progbits"
+# define _ASM_FIXUP_END " .popsection"
+#endif
+
 #ifdef __ASSEMBLY__
 
 #ifdef HAVE_AS_QUOTED_SYM
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -579,9 +579,9 @@ static inline int __vmxon(u64 addr)
         "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
         "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
         "2:\n"
-        ".section .fixup,\"ax\"\n"
+        _ASM_FIXUP "\n"
         "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
-        ".previous\n"
+        _ASM_FIXUP_END "\n"
         _ASM_EXTABLE(1b, 3b)
         : "=q" (rc)
         : "0" (0), "a" (&addr)
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -44,10 +44,10 @@ static inline void wrmsrl(unsigned int m
     uint32_t lo_, hi_; \
     __asm__ __volatile__( \
         "1: rdmsr\n2:\n" \
-        ".section .fixup,\"ax\"\n" \
+        _ASM_FIXUP "\n" \
         "3: xorl %0,%0\n; xorl %1,%1\n" \
         "   movl %5,%2\n; jmp 2b\n" \
-        ".previous\n" \
+        _ASM_FIXUP_END "\n" \
         _ASM_EXTABLE(1b, 3b) \
         : "=a" (lo_), "=d" (hi_), "=&r" (rc_) \
         : "c" (msr), "2" (0), "i" (-EFAULT)); \
@@ -64,9 +64,9 @@ static inline int wrmsr_safe(unsigned in
 
     __asm__ __volatile__(
         "1: wrmsr\n2:\n"
-        ".section .fixup,\"ax\"\n"
+        _ASM_FIXUP "\n"
         "3: movl %5,%0\n; jmp 2b\n"
-        ".previous\n"
+        _ASM_FIXUP_END "\n"
         _ASM_EXTABLE(1b, 3b)
         : "=&r" (rc)
         : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -160,10 +160,10 @@ struct __large_struct { unsigned long bu
 		)							\
 		"1:	mov"itype" %"rtype"[val], (%[ptr])\n"		\
 		"2:\n"							\
-		".section .fixup,\"ax\"\n"				\
+		"       " _ASM_FIXUP "\n"				\
 		"3:	mov %[errno], %[ret]\n"				\
 		"	jmp 2b\n"					\
-		".previous\n"						\
+		_ASM_FIXUP_END "\n"					\
 		_ASM_EXTABLE(1b, 3b)					\
 		: [ret] "+r" (err), [ptr] "=&r" (dummy_)		\
 		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
@@ -177,11 +177,11 @@ struct __large_struct { unsigned long bu
 		)							\
 		"1:	mov (%[ptr]), %"rtype"[val]\n"			\
 		"2:\n"							\
-		".section .fixup,\"ax\"\n"				\
+		"       " _ASM_FIXUP "\n"				\
 		"3:	mov %[errno], %[ret]\n"				\
 		"	xor %k[val], %k[val]\n"				\
 		"	jmp 2b\n"					\
-		".previous\n"						\
+		_ASM_FIXUP_END "\n"					\
 		_ASM_EXTABLE(1b, 3b)					\
 		: [ret] "+r" (err), [val] ltype (x),			\
 		  [ptr] "=&r" (dummy_)					\
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -251,11 +251,11 @@ long do_set_segment_base(unsigned int wh
          * re-read %gs and compare against the input.
          */
         asm volatile ( "1: mov %[sel], %%gs\n\t"
-                       ".section .fixup, \"ax\", @progbits\n\t"
+                       _ASM_FIXUP "\n\t"
                        "2: mov %k[flat], %%gs\n\t"
                        "   xor %[sel], %[sel]\n\t"
                        "   jmp 1b\n\t"
-                       ".previous\n\t"
+                       _ASM_FIXUP_END "\n\t"
                        _ASM_EXTABLE(1b, 2b)
                        : [sel] "+r" (sel)
                        : [flat] "r" (FLAT_USER_DS32) );
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -550,9 +550,9 @@ static void show_trace(const struct cpu_
 
     /* Guarded read of the stack top. */
     asm ( "1: mov %[data], %[tos]; 2:\n"
-          ".pushsection .fixup,\"ax\"\n"
+          _ASM_FIXUP "\n"
           "3: movb $1, %[fault]; jmp 2b\n"
-          ".popsection\n"
+          _ASM_FIXUP_END "\n"
           _ASM_EXTABLE(1b, 3b)
           : [tos] "+r" (tos), [fault] "+qm" (fault) : [data] "m" (*sp) );
 
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -38,12 +38,12 @@ unsigned int copy_to_guest_ll(void __use
         "    mov  %[aux],%[cnt]\n"
         "1:  rep movsb\n" /* ...remainder copied as bytes */
         "2:\n"
-        ".section .fixup,\"ax\"\n"
+        "    " _ASM_FIXUP "\n"
         "5:  add %[aux], %[cnt]\n"
         "    jmp 2b\n"
         "3:  lea (%q[aux], %q[cnt], "STR(BYTES_PER_LONG)"), %[cnt]\n"
         "    jmp 2b\n"
-        ".previous\n"
+        "    " _ASM_FIXUP_END "\n"
         _ASM_EXTABLE(4b, 5b)
         _ASM_EXTABLE(0b, 3b)
         _ASM_EXTABLE(1b, 2b)
@@ -81,7 +81,7 @@ unsigned int copy_from_guest_ll(void *to
         "    mov  %[aux], %[cnt]\n"
         "1:  rep movsb\n" /* ...remainder copied as bytes */
         "2:\n"
-        ".section .fixup,\"ax\"\n"
+        "    " _ASM_FIXUP "\n"
         "5:  add  %[aux], %[cnt]\n"
         "    jmp 6f\n"
         "3:  lea  (%q[aux], %q[cnt], "STR(BYTES_PER_LONG)"), %[cnt]\n"
@@ -92,7 +92,7 @@ unsigned int copy_from_guest_ll(void *to
         "    xchg %[aux], %%eax\n"
         "    mov  %k[from], %[cnt]\n"
         "    jmp 2b\n"
-        ".previous\n"
+        "    " _ASM_FIXUP_END "\n"
         _ASM_EXTABLE(4b, 5b)
         _ASM_EXTABLE(0b, 3b)
         _ASM_EXTABLE(1b, 6b)
@@ -149,10 +149,10 @@ unsigned int clear_guest_pv(void __user
             "    mov  %[bytes], %[cnt]\n"
             "1:  rep stosb\n"
             "2:\n"
-            ".section .fixup,\"ax\"\n"
+            "    " _ASM_FIXUP "\n"
             "3:  lea  (%q[bytes], %q[longs], "STR(BYTES_PER_LONG)"), %[cnt]\n"
             "    jmp  2b\n"
-            ".previous\n"
+            "    " _ASM_FIXUP_END "\n"
             _ASM_EXTABLE(0b,3b)
             _ASM_EXTABLE(1b,2b)
             : [cnt] "=&c" (n), [to] "+D" (to), [scratch1] "=&r" (dummy),
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -321,11 +321,11 @@ __UNLIKELY_END(compat_bounce_null_select
         mov   %al,  TRAPBOUNCE_flags(%rdx)
         ret
 
-.section .fixup,"ax"
+        _ASM_FIXUP
 .Lfx13:
         xorl  %edi,%edi
         jmp   .Lft13
-.previous
+        _ASM_FIXUP_END
         _ASM_EXTABLE(.Lft1,  dom_crash_sync_extable)
         _ASM_EXTABLE(.Lft2,  compat_crash_page_fault)
         _ASM_EXTABLE(.Lft3,  compat_crash_page_fault_4)
@@ -346,9 +346,9 @@ compat_crash_page_fault:
         movl  %esi,%edi
         call  show_page_walk
         jmp   dom_crash_sync_extable
-.section .fixup,"ax"
+        _ASM_FIXUP
 .Lfx14:
         xorl  %edi,%edi
         jmp   .Lft14
-.previous
+        _ASM_FIXUP_END
         _ASM_EXTABLE(.Lft14, .Lfx14)
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -580,7 +580,7 @@ __UNLIKELY_END(create_bounce_frame_bad_b
         mov   %al,  TRAPBOUNCE_flags(%rdx)
         ret
 
-        .pushsection .fixup, "ax", @progbits
+        _ASM_FIXUP
         # Numeric tags below represent the intended overall %rsi adjustment.
 domain_crash_page_fault_6x8:
         addq  $8,%rsi
@@ -616,7 +616,7 @@ ENTRY(dom_crash_sync_extable)
 #endif
         xorl  %edi,%edi
         jmp   asm_domain_crash_synchronous /* Does not return */
-        .popsection
+        _ASM_FIXUP_END
 #endif /* CONFIG_PV */
 
 /* --- CODE BELOW THIS LINE (MOSTLY) NOT GUEST RELATED --- */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1260,11 +1260,11 @@ static inline int mkec(uint8_t e, int32_
     block_speculation(); /* SCSB */                                     \
     asm volatile ( pre "\n\tINDIRECT_CALL %[stub]\n\t" post "\n"        \
                    ".Lret%=:\n\t"                                       \
-                   ".pushsection .fixup,\"ax\"\n"                       \
+                   _ASM_FIXUP "\n"                                      \
                    ".Lfix%=:\n\t"                                       \
                    "pop %[exn]\n\t"                                     \
                    "jmp .Lret%=\n\t"                                    \
-                   ".popsection\n\t"                                    \
+                   _ASM_FIXUP_END "\n\t"                                \
                    _ASM_EXTABLE(.Lret%=, .Lfix%=)                       \
                    : [exn] "+g" (stub_exn.info) ASM_CALL_CONSTRAINT,    \
                      constraints,                                       \
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -45,10 +45,10 @@ static inline bool xsetbv(u32 index, u64
 
     asm volatile ( "1: .byte 0x0f,0x01,0xd1\n"
                    "3:                     \n"
-                   ".section .fixup,\"ax\" \n"
+                   _ASM_FIXUP             "\n"
                    "2: xor %0,%0           \n"
                    "   jmp 3b              \n"
-                   ".previous              \n"
+                   _ASM_FIXUP_END         "\n"
                    _ASM_EXTABLE(1b, 2b)
                    : "+a" (lo)
                    : "c" (index), "d" (hi));
@@ -403,10 +403,10 @@ void xrstor(struct vcpu *v, uint64_t mas
 #define _xrstor(insn) \
         asm volatile ( "1: .byte " insn "\n" \
                        "3:\n" \
-                       "   .section .fixup,\"ax\"\n" \
+                       "   " _ASM_FIXUP "\n" \
                        "2: incl %[faults]\n" \
                        "   jmp 3b\n" \
-                       "   .previous\n" \
+                       "   " _ASM_FIXUP_END "\n" \
                        _ASM_EXTABLE(1b, 2b) \
                        : [mem] "+m" (*ptr), [faults] "+g" (faults) \
                        : [lmask] "a" (lmask), [hmask] "d" (hmask), \


