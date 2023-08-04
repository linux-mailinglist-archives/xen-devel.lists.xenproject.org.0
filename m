Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407276F9CE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576846.903452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnzD-00061T-3I; Fri, 04 Aug 2023 06:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576846.903452; Fri, 04 Aug 2023 06:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnzC-0005zm-Vn; Fri, 04 Aug 2023 06:08:30 +0000
Received: by outflank-mailman (input) for mailman id 576846;
 Fri, 04 Aug 2023 06:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRnzB-0005ze-3k
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:08:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 541563b6-328d-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:08:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9277.eurprd04.prod.outlook.com (2603:10a6:102:2b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:08:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:08:26 +0000
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
X-Inumbo-ID: 541563b6-328d-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJkieJVClUbZuo7frihDEx3R3KUmhCzBKkL0k9bMRB41nR2Y91ENGmZTdwk3SwqkuioM4C+ZKt3D2r6U2uJanDgDkz9paIPAAS4ZsE0W+6B+W8/yrqrBKug1nzgX1zkW0j3Q7vnPsKW2aNDGKZ+lDzmaLtUuJ/zBoheyUGN3rfheM3Gvo6WCXMoBFAS6s7lo+GYrAJl4wdcN3/BImXl7HY6wREs8KQvhnFHY+MidUXtxivUUMECsJRpVHVktUEuKMmetK1pNU/rs51pg8I1TRCS5cCaeVgF8BkQSUW0V8Ne+6DzTBTcqEctYZIM0YnU3izGo/sE9kAdwh7BqX3sSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf6ROw1N7SDrNgirVisezrz+LJOsU87Fio6c0G9uOlc=;
 b=gxKje1uPdMp8oe+7XZRKFmRbJMzki1IXg+4pffnQ/6brrPMxyXqUuYXJFAv9FOJ8z+MPrHAFLyDV11tcBI6QNi5xtMQ9kQX6ta1TaNqLS9Q6GO3ATy+Iuu6kOup1Q3Aq7BQdMyw9NTquwtepi2JXhJziHqOUptDsjEWJY79VFYG+xPCYj5iTon4B+HwFt3yp02xXc7xEde71RfQ6j40iEipUNZlq9WDuw+wpMHFxN3IwwZ5XhKRxATtGf0N19uwy6i6USU1oSQU7edvNt2lD1esSEzm4xY920cMuY2cmiY6olyhddBpeUFo+Avd7xAGCS6SlA6EmKQMznpsNhpLi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cf6ROw1N7SDrNgirVisezrz+LJOsU87Fio6c0G9uOlc=;
 b=2wF2+gAWWDW3lDGsScHjVG0HQ7Vi2xKHrj/xXr4h5EZUJ//0+XrPhsdonaOhfEBFU4ObLV6gvYuDhLUJaVT0O9ZB71c7LdA5Mmhd1tg9tzXlcRaeJpvLsO25y9plztEB1hJcy/PVQmuNekicqV+1UedV7nhRaQ24EffCQkjiUcK6xDy14coXGA46PcadazlT4Czm+97xlkooUKVhWneLwgKHUtoMM0DTcRwW/FmB4MrevW/5QgSn1Z2O2fwciakzboqFvNLQ0hguQOGmxFYqBI70wgRa9gjoIw6ZOk6QSxZ6TtLbvowezTIGS1o5GMaE65b2dp0hJPDorRrabwsIpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
Date: Fri, 4 Aug 2023 08:08:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v2 1/2] common: move Linux-inherited fixed width type decls to
 common header
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
In-Reply-To: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 0256e4b0-3583-4741-b550-08db94b13765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cN2NIV13AO3bVqdgqDW9LFGKx1Y/nGEXzYuaazpOuX9ogF5RD2Y8B1E4A9SQT221SVjpgOMH97iz/Th+eIi8FI+jIgEENc9ZNF0J9Z72SunJ5EkTWdA8BeDti1T0X5QrhQ7PzTkvMCBX/e+1ATxh70M55b/NSt+olkhoHKgQaN/fauFc30YqAC/4FHhz22gzx/Xm2xOd/b05y7W2nKdRw5CFy9lIjvV4xNOynuj1n4GBDI8IzdkZcHp2ZAAqcitTLI+WiQZr0FXI9Zokx+PDeLjgi2aY3Z4H0+4L2PRgFC4X8mfFl/6W/IHvo+Wstwg6pGBbMc/5tddfhP1iuSut2TV1Hw3AC0uf1PjpxiE62vpXSIy0UNPu0ePazRjWJ1uC2z2GMld8gTjk7MG6tOAHC3xqTx/H7TE227Y0x1NtF6cIAWPFkiR8OqzugYzqPpsA08FJZ++oU+Nsa5Oiy/bA6L0qWjQVPhzlbRJ4+RZIIw9+UaYumayqzz5d8mhDWiks3sFi/s545GFL1ij12jRq4F8BRJ4Qa6D5Bhgxf1pNxWFu8f0wUjm8PEcD0XhO2YXPUVjxhNEjLfqdoLqPh4ohe7ArX+3fBf9wX0JixroVVxcQ1RWrZn4336ggn0oKeVv4JloxKkv9yFEjz28doYUxmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(1800799003)(451199021)(186006)(2616005)(8676002)(26005)(6506007)(83380400001)(66476007)(2906002)(316002)(4326008)(66946007)(5660300002)(6916009)(66556008)(8936002)(7416002)(41300700001)(6666004)(6486002)(6512007)(478600001)(54906003)(38100700002)(31696002)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlnL3FIMUpzdlBJVjYzdEpxVmxCQ3pZL2hZSnlvdENKUWkvcXp5MlFBSDNT?=
 =?utf-8?B?ZDF4cUhMUHRCRyt5NFRQVlp5TUlBeDJ0d0Z3V2x0bzZURzR0Y2JUUWJ2QUhM?=
 =?utf-8?B?aHhTNGhZT3FRc29aRHBqcWtwMkFQS0hhK2hQVldldHE5d2NBcmJMbTJqM1R6?=
 =?utf-8?B?UUNzN0d3elhIVm90akdNbmhIZ2Y5KzZkMEZxODBzQk15MU5QRmVTR0hNU282?=
 =?utf-8?B?WHh6ckdaS0tUT1U5ZStqdnhGSjMvY2JHc084T01NM3ZUQkRIaXE3N01PSnRl?=
 =?utf-8?B?Sk1QSXVpQnNQRVVzbFQzeEF0U24wRE5GcFIzenFKVWVzbTVaK0VKMGZQQ0Uy?=
 =?utf-8?B?eE9Ic2ZBalAwUEpiS1hFOVV2YUtzbTU3N3QwdlcyK1VTWDRsMGtYV3pDYmVm?=
 =?utf-8?B?QVZDUzdYdE5WbytPT2JTalZtVkJlQ3Y3TjdzS29nUzBjYnNReGx1dkZVeUlQ?=
 =?utf-8?B?QkgvOXNuaENVNmxjN2FQU05KdU9YU25jNEd5aEtOcnc4RllMWHdPb3BxeE91?=
 =?utf-8?B?dENxcG1VNHFqYURaenF4ajUyeDNBU2l4blYyNUdCK093MGdwVEdJMDRnUGp1?=
 =?utf-8?B?MG9jTjlUQ0xPbzF1UVNoajlXNjR2T21uNzQ4RDkvaG84MlBsdFFMNWgxT2NI?=
 =?utf-8?B?NE03WXd0am50cGEwTDRhY1pJVGRRUmdldWhXVWwwc2xEQTdyYzdSckRIY0Y5?=
 =?utf-8?B?TXdQT0pmRnRsSk5zWUsrZ2VLRHpQNUdGWUhTWkZVOVhUVnNMTlVOWFZXVysx?=
 =?utf-8?B?WVhUbHUyT2VKVEtsVXpoMWs3N2JkS25uTmVyVmdxemltZ1dOS1lndWdFU0gw?=
 =?utf-8?B?Y1VjRkcyUjVDWEMybWIzbzFRTzBXMVBVczJFbWZ5WjBhOXhsRk85TWFVQlRU?=
 =?utf-8?B?MEV6cDdkejhaOVFsSE9UTTRiOXB6aUg4UHZyVU5jMTBjamk4T3hkcGVkMG1J?=
 =?utf-8?B?NmJmeEkvSWk5L2k2dGVuNmp2TTF2L1IxbzNOT2RmSEhrTU0yb0hkbnU4R09K?=
 =?utf-8?B?VVZMTnk4MzcvdStCSURsNFAzMXNidE1DamdweFZrazZSVFpUWkZHN2ZRS1Jr?=
 =?utf-8?B?VFZxVnNDSzBFTjd5QVRtQjNiNXd2N0F5bFNoOW1rNXdXNmdOdjlQOTJweVVp?=
 =?utf-8?B?Y3hGLzg4a2VTWVpWdWhGeVNRdk5maldoTmdOMlVDVUQ0SVdoR3JJSHhXR3pl?=
 =?utf-8?B?d1ozQVBMeXNxQ25YM0ZYdFV2Z0srK0NpeERNYmt5RWVLVENSVjRDK2VpRjdp?=
 =?utf-8?B?em52VUowR0tYL1IzZ3JrMGduRFE5S0ZOa1JGNCtGcmRBN2Y3TURoQm4wK1hp?=
 =?utf-8?B?bmNubS9lR29nNkU0YzUxanZxSVBncHRPbEV1V3dLUmh4ZmlweVFZdTRCZkor?=
 =?utf-8?B?UjRKOThoZXE3eXFxeWE2TlVzRk41YlhWeWh6RmFNclMzZjZzaUtVOHR3cU10?=
 =?utf-8?B?K20zM0RWaEhEVGxWNmhUSGhzeDNFSlVYamZhaDdHc3hjYmo4WUFxY1NaWFhQ?=
 =?utf-8?B?aEtlOVpwRFVzMktpdU1pS0x5bitFcXJKV2VBRkkyanZjR1A4cUZSbmxxUEJT?=
 =?utf-8?B?N0J5dmJaUHpHbHhhZ296YWdoZ3hhT1RQZTdWN3lwakRwVm1SM1owbnBCSGt3?=
 =?utf-8?B?b1hlVzdpT2dmVXM2NDRseHJPRUd3WmlPeEtsc0VpbkFqTFlJdWtaKzZCV3NG?=
 =?utf-8?B?d0EzQVdOSW5aY0p3MVF2djM0T3RpMkdaTzM1TzJudXdTcnJjdVRFaDNkREpJ?=
 =?utf-8?B?STloSEN3eHkrV0NrVWVwbkJlVTlPbGJPSTFJbWlma1BiT3NzTjZFalo3RHA1?=
 =?utf-8?B?SnRhdlZBOFE1T1ZqWWQrRnhOdm1EVXgyRFM3b0VGcGNiQXk4M1ZXUzl0ZGw1?=
 =?utf-8?B?dHJaTm9JNnc0aENrdWc5WGx0LzQ2WndUOWFSUmV0SGk2bkF3bXVZOVIxRG4w?=
 =?utf-8?B?bE9FSzF2SWJ4Tml2bktBUVl3Z2ZRbXJpc3FZek9VcHU4UXVLSXJsYzVDQmw0?=
 =?utf-8?B?UlZkbGVYNHk3Q1BnY1RKMVlzVmROSkRKN3NQRC9FdXdST0pWNUVSTTFMZFE2?=
 =?utf-8?B?cHZlSXI3WkJndkEvZ2J5UjZRUFNDYW9aQVlzb0xiQzdMNUpwWS81RVVSelZY?=
 =?utf-8?Q?IWQdniOgnGIy6QLfFKqrAa50u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0256e4b0-3583-4741-b550-08db94b13765
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:08:26.3890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3L8aJVwy++JCkCzTAcjbl9ITevmNNtfWf1yEpbIn7fhhOKclLze4n6FyqGjxOr/El4xc/k3eU84wJobD3yKRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9277

Have these in one place, for all architectures to use. Also use the C99
types as the "original" ones, and derive the Linux compatible ones
(which we're trying to phase out). For __s<N>, seeing that no uses exist
anymore, move them to a new Linux compatibility header (as an act of
precaution - as said, we don't have any uses of these types right now).

In some Flask sources inclusion of asm/byteorder.h needs moving later.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: This is the residual (extended to PPC) of an earlier larger patch
    which was partly replaced by introducing xen/stdint.h.

--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -1,18 +1,7 @@
 #ifndef __ARM_TYPES_H__
 #define __ARM_TYPES_H__
 
-typedef signed char s8;
-typedef unsigned char u8;
-
-typedef signed short s16;
-typedef unsigned short u16;
-
-typedef signed int s32;
-typedef unsigned int u32;
-
 #if defined(CONFIG_ARM_32)
-typedef signed long long s64;
-typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
 #if defined(CONFIG_PHYS_ADDR_T_32)
@@ -34,9 +23,9 @@ typedef u64 paddr_t;
 #endif
 typedef u32 register_t;
 #define PRIregister "08x"
-#elif defined (CONFIG_ARM_64)
-typedef signed long s64;
-typedef unsigned long u64;
+
+#elif defined(CONFIG_ARM_64)
+
 typedef u64 vaddr_t;
 #define PRIvaddr PRIx64
 typedef u64 paddr_t;
@@ -44,6 +33,7 @@ typedef u64 paddr_t;
 #define PRIpaddr "016lx"
 typedef u64 register_t;
 #define PRIregister "016lx"
+
 #endif
 
 #endif /* __ARM_TYPES_H__ */
--- a/xen/arch/ppc/include/asm/types.h
+++ b/xen/arch/ppc/include/asm/types.h
@@ -3,17 +3,6 @@
 #ifndef _ASM_PPC_TYPES_H
 #define _ASM_PPC_TYPES_H
 
-typedef signed char s8;
-typedef unsigned char u8;
-
-typedef signed short s16;
-typedef unsigned short u16;
-
-typedef signed int s32;
-typedef unsigned int u32;
-
-typedef signed long s64;
-typedef unsigned long u64;
 typedef unsigned long paddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -3,19 +3,8 @@
 #ifndef __RISCV_TYPES_H__
 #define __RISCV_TYPES_H__
 
-typedef signed char s8;
-typedef unsigned char u8;
-
-typedef signed short s16;
-typedef unsigned short u16;
-
-typedef signed int s32;
-typedef unsigned int u32;
-
 #if defined(CONFIG_RISCV_32)
 
-typedef signed long long s64;
-typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
 typedef u64 paddr_t;
@@ -26,8 +15,6 @@ typedef u32 register_t;
 
 #elif defined (CONFIG_RISCV_64)
 
-typedef signed long s64;
-typedef unsigned long u64;
 typedef u64 vaddr_t;
 #define PRIvaddr PRIx64
 typedef u64 paddr_t;
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -1,17 +1,6 @@
 #ifndef __X86_TYPES_H__
 #define __X86_TYPES_H__
 
-typedef signed char s8;
-typedef unsigned char u8;
-
-typedef signed short s16;
-typedef unsigned short u16;
-
-typedef signed int s32;
-typedef unsigned int u32;
-
-typedef signed long s64;
-typedef unsigned long u64;
 typedef unsigned long paddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
--- /dev/null
+++ b/xen/include/xen/linux-compat.h
@@ -0,0 +1,19 @@
+/******************************************************************************
+ * linux-compat.h
+ *
+ * Container for types and other definitions use in Linux (and hence in files
+ * we "steal" from there), but which shouldn't be used (anymore) in normal Xen
+ * files.
+ */
+
+#ifndef __XEN_LINUX_COMPAT_H__
+#define __XEN_LINUX_COMPAT_H__
+
+#include <xen/types.h>
+
+typedef int8_t  __s8;
+typedef int16_t __s16;
+typedef int32_t __s32;
+typedef int64_t __s64;
+
+#endif /* __XEN_LINUX_COMPAT_H__ */
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -4,6 +4,16 @@
 #include <xen/stdbool.h>
 #include <xen/stdint.h>
 
+/* Linux inherited types which are being phased out */
+typedef int8_t s8;
+typedef uint8_t u8, __u8;
+typedef int16_t s16;
+typedef uint16_t u16, __u16;
+typedef int32_t s32;
+typedef uint32_t u32, __u32;
+typedef int64_t s64;
+typedef uint64_t u64, __u64;
+
 #include <asm/types.h>
 
 typedef __SIZE_TYPE__ size_t;
@@ -40,15 +50,6 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
 
-typedef uint8_t         __u8;
-typedef int8_t          __s8;
-typedef uint16_t        __u16;
-typedef int16_t         __s16;
-typedef uint32_t        __u32;
-typedef int32_t         __s32;
-typedef uint64_t        __u64;
-typedef int64_t         __s64;
-
 typedef __u16 __le16;
 typedef __u16 __be16;
 typedef __u32 __le32;
--- a/xen/xsm/flask/ss/conditional.c
+++ b/xen/xsm/flask/ss/conditional.c
@@ -9,7 +9,6 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <xen/errno.h>
@@ -17,6 +16,8 @@
 #include <xen/spinlock.h>
 #include <xen/xmalloc.h>
 
+#include <asm/byteorder.h>
+
 #include "security.h"
 #include "conditional.h"
 
--- a/xen/xsm/flask/ss/ebitmap.c
+++ b/xen/xsm/flask/ss/ebitmap.c
@@ -10,12 +10,14 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
 #include <xen/lib.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
 #include <xen/spinlock.h>
 #include <xen/bitmap.h>
+
+#include <asm/byteorder.h>
+
 #include "ebitmap.h"
 #include "policydb.h"
 
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -22,12 +22,14 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/string.h>
 #include <xen/errno.h>
+
+#include <asm/byteorder.h>
+
 #include <conditional.h>
 #include "security.h"
 


