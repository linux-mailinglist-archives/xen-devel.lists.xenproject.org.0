Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10805690513
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492282.761752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4Kc-0000Gn-Aw; Thu, 09 Feb 2023 10:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492282.761752; Thu, 09 Feb 2023 10:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4Kc-0000Ec-7i; Thu, 09 Feb 2023 10:39:10 +0000
Received: by outflank-mailman (input) for mailman id 492282;
 Thu, 09 Feb 2023 10:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4Ka-0000EU-Kd
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:39:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faca7aaf-a865-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 11:39:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 9 Feb
 2023 10:38:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:38:35 +0000
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
X-Inumbo-ID: faca7aaf-a865-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMCrkf98kIMouAlCo/62YTxWBCI8/x0p0vF/cgQNOiEgRLI/iJoCCDcOpyu5dO0t7ibIDqlpG49njqMdqvo0bn4U4Kl8vUUoK8Vw+G70gO3RVmP416crU+7Fyr61u02OhDRmLADdWc5zAzw4y2wqqlnCjp5whdOu+DOVqivBgkpnRgDC0jTOGUAVMSu6yIUKr1MoouNU/+CnM9x+KW1yaFuBCngcgcNIoWmtZiEwcBw2IED7erPfSkvuhzUOWdGgwqwJK1duZAFyXcmPQJ09QdGrLAqf04Ur5TTHxSAWHqTd4xW/dhs4/iidE8C9d2VQC8AUCSDgLDaP4CVzfFRsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rILu2n+55PxWhIc3uZf00lTC9CxB/k+P+ibUVXcR5pE=;
 b=kRNb/Hr5WovfO5ROemcIzfmjPBIEL3viad6d2WP5sGxkNzTR7hzPOaCE5eqiFtfLC6yiypiuFZ4LLlZUPPUSLNJoCkZkgNI0mD5ir28Bb9agKEbK2j+nxm25Q3bMktmfIsKtiilTfqSLVYvCK9Y+yqj1Ln9skJAnkYnh6iuX5+DKmWoIVQB7ytdifM0hpP1hJHe3dVKqnu16kVG3aLfhASBMvEsr3WOOsmBJa5NhvdPHWf/8zmbaF4kSetqF0C494c2nGLY7+h88s1NKf6WikQL+2a3tq+lKHSGlyFDHMY+i1t+nyACqPnd5hcwrld5Qyg4HK37kZIggh8MLc6WqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rILu2n+55PxWhIc3uZf00lTC9CxB/k+P+ibUVXcR5pE=;
 b=h+4Ct9hinHdoKZaCNytvCOQEa7ck9UMC4Nc6qV+jhtJ8KI+fcOtaqt7sdA7QqoQCmxbKsWHNYXDs0rxoxTA6MvMnnO3tDaOIQdnGtrVCzJH1XZ4EV+HroDe2RvpFqEAwIcTAHj75k7/pxEqDKj93Rt2SgPP56cLNC9s4kP9uNf+k8R9svqWqaLhoAnZtZoAvD0xWQyQKSe/xF3sSh1tPpF0pGaMLbpiuHN1YORS+PDiCsEcNHyY2n88g2H2D5hXvMIkFGN1Oj70Mia0V+yvuUAaU4Vq0ngu9XjmDKvHdVAf+R002rnMumHrjiG+LqAeaduoFSoz3sXmt6cY6KhWQmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <862a1076-4be6-79ac-4243-7d690a2f88ca@suse.com>
Date: Thu, 9 Feb 2023 11:38:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 2/6] common: move standard C fixed width type declarations to
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
 Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
In-Reply-To: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: f5787135-ddb2-4de9-b95e-08db0a89cc30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZDN7h274UmwGO384UrUp4P7Mlql0OI9lp2zKjToRlzW757DdLfRh1nJUD86GqPUMjwRw8btEr1eUTT6z4HRg1ji19AHyiHArzyWIogeWO4qX1S12o37DywPBN/LVhIX44TCWVpg/Q/0lwXG+tDWpVqm54gEqL5ZDkzl106LQxB6dEV10HpOY+MhxAsMGyGoMI4cGBPK+ILczJfFxElFtgX62QwHdEqAJrqQxk/5ylsKs/AsvnPNpC1uZtP1sbEdS4HEdWQX/QDaAuYvL5LOigDhK6zTMelKvJkKv79WbswYjK8aaawn0sTC56WLFeophoQRNEaGtoz2T99ckW1G1Dj8Jyx7dxAqkanqi2yNnp+0NU8IqBNPUz8gWsSce1Jl9sOO30l35ED0EIJUm0km1g8i3aa1tom9AJrPkiXDT+KuIPu/ywKOfmikpuFN3qEVVL0OwlWSlgYs3pKPhNCIOQwILxFhBZOZX/skIt15VR5oInyofoTVlVUS6XNNHD7EA2EomBMAcaRmDiK+kn/46NlmsdpAISZEZXbNTXe4h5kBVl1l0SFhHULBaEcvcwkjBfKXuAmcny6R0BzUqlJGosxlmIqanfI/VzbF5Pvt+69HVwPEstVETRzp5t2up9aGh1CXpjPiCsKni4f7sRSb9dtAunrlKQXlEtMEgyBQ04uz6bdueDUhaXS1bSXauaA42hVh+pmlUqt713qtA2lSSxyPdNLmJWGt+qCVSpXTW00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(5660300002)(7416002)(86362001)(31696002)(186003)(8936002)(2616005)(26005)(38100700002)(6512007)(83380400001)(54906003)(66946007)(316002)(4326008)(41300700001)(8676002)(66556008)(66476007)(6916009)(478600001)(6506007)(36756003)(6486002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVPVlB4SnUzU09KYmFNbE5CRTN5RExFRElPS2t4Q1RRVzM4bENkZVIzYzZB?=
 =?utf-8?B?aUFUS3BsbzFEc2NweXA5eDZYY0Y1eEtiNGFkQ1ZvZVRHSEV4ZElsSk1CZ0dy?=
 =?utf-8?B?TG9pajRvQTY5elJ3RTc4Q0ZWVktZMmVpUmZmUFk3NkFrdThWZTNSSndqUTBL?=
 =?utf-8?B?WXVZMlZrbXg0VUJPWGhxN1p5VzhMNUJ6V1dtSmk5UWRQbFNWVk1RbDZjL0Vk?=
 =?utf-8?B?dXVJd1YyNmt5by9XTzlMVyt4SnFNSjdWTnp6cHR2Rytlempvck53WFNpN251?=
 =?utf-8?B?Y01YNTVuYmhsbzR0ZWtPZ3N4T2MvWE9kbTJUc0lCZVA5OGlySit3dUFOQ3Vt?=
 =?utf-8?B?M0UyR3Q4c2JUcjFuSldZYmtvcU9wQmVuRjlBdEcveVJ1WGtkK1cyd2dWM0Nu?=
 =?utf-8?B?V3pjaVVZMy93TUN1allJM1FHMzlBenJPNnVQTHVnME1LMnZraDgzdVZuTHJw?=
 =?utf-8?B?dzR2Z2l6RmRWMzRzMzBRWVJBMlZVcUtnZkI0Y1FPNU5EbVR1cWw1Z1A4ME43?=
 =?utf-8?B?cmNLdTRhbThTNEMvQW5kQUNIcjVRNE1xc00rd1ZScjhxRHNDcll6TVhKVHJw?=
 =?utf-8?B?dHRDUnV4U1RQSzRFa2dGY2lEd2NyYVI4dWNIRnZibHVnSlFONW8rTkgya3ZH?=
 =?utf-8?B?UEZHYXNhSVhQaWtiM3MrNHl2YlVNZE5wUEkyK090ZTdCdzZUZHVaQncvenFH?=
 =?utf-8?B?YmpGRitGRzk4V3hlcjlZSVBXakc5dlFQeVdQSHg0UmVHUVV1YzVmS1FBVzA1?=
 =?utf-8?B?SmRNckt3TUpQVzRWOGYyS2R2S0F5SzRxbE9BcXZvSGt3LzVkRDJMOC9IL3VV?=
 =?utf-8?B?Rno5bmROeWZTV3VCK09wNzBnbXY2dGluWW5tcDErSUcva00ybThTMkZKditl?=
 =?utf-8?B?WEU0cFN1N0t6SFZJUytCcittUXJORkZxSGJEMVpWSEZIZ2xzR0FySWNzL0dU?=
 =?utf-8?B?Z2JpQjV0RmxXY1ZyVkxocWs4eStXdm9XbDN6T2owa3VjVlJ6UTV6Z20ySkRS?=
 =?utf-8?B?MGd2Ulg5MUc2K0tYRUVuWVEvU2lxYmE0cnB0RTdlejhaQmc5Y3VQbFZSS1Ny?=
 =?utf-8?B?YndjNldHaXpNTGpxWWdsSzZoT25ja2VyM1NHbktvV1FtNkpCa21BUHVnRDJq?=
 =?utf-8?B?OXNvTUIzYk5GZERMSWg4YWxBU3BoYXNQa2EveXJWcjJGMDlpUDJVejYvaGtt?=
 =?utf-8?B?b0Y2Y1FJL1dRWGVWWDVDSmtMR2FIbDh6OStLUWhpZ2x3T3hhUEpTR2xkWXdj?=
 =?utf-8?B?MnBlNzNlbStxZVE3eDFKamdXdmZrYjM0TFkrMWYxeFo3WU5CaW1oaGhMS3c5?=
 =?utf-8?B?SEFweDRVcnU1dEl6UnFBRGl0dzZCaW9ibVJDaVZLdTVtWU4yam1kVGNVM2RS?=
 =?utf-8?B?UVl3MkNabVpiZ2YxeGFYSlVxUVN6THRYbTViRjdLQU55YlR5Z3pFSytISXZD?=
 =?utf-8?B?S3pWYzhCcHRlcUJmVm1Qd1VpRTlNc1BHQVZOcldhaWFrUnhNV3Q4czBuVEt5?=
 =?utf-8?B?WktqRlAwN3RzbUh6alF5eVNCQ0pOZWpEUi9STi80dStIcGJEUTk3SE9EL0pa?=
 =?utf-8?B?T1A4aE5jR3BBaFBNNWsxMml4Q3JtY1I4eUQxZEkyZFo5U2NNdlVNNG9KMmZ2?=
 =?utf-8?B?YTB0bmNtSGJxMDNMTHJSb2RHU1BoVkxaTDF3V1RLR2RqdnU4WFpRZ1JERmZO?=
 =?utf-8?B?NjdzUUVoamxucjlhRGtIRy9sV2tVT3AwZW9Nb1Q2b01kWERHSWlMNld5NDlG?=
 =?utf-8?B?aVBJTnUrZkxobG12YzMwVmlvcEs4dkg2OFowOHdTajQ2L2I1d2dFSjhGR2NV?=
 =?utf-8?B?dXpjdG5nQnNIUXZmY1ZLZjhVNDh1OUhtR1M3SjJoSlBPdHF0Y2E2LzdtMGh3?=
 =?utf-8?B?WjNaRGliTWcrVW54bWZJckZNMzQ0VWQ3MW91UEVwZ3J0NW1LZ0lodjFFK2xE?=
 =?utf-8?B?eWFueFcyYVV3YkRPUjFSVStJNmliNTByOFlsbEllTHQ4aWxGaGU2MTFaL1R5?=
 =?utf-8?B?YVU2cDlnQUhLZ0RLNTBEdWNBRGIrS21XZWl1bFhpYWoySVhKMGYvWjRtUHJx?=
 =?utf-8?B?bXhmekJXWjBseXpYa2VEQ2U0aGd4alhMb2VoeEZqMTlTS0xieERBamJwOTZM?=
 =?utf-8?Q?WanG7VLBzrbysN4JIhST8Vh+/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5787135-ddb2-4de9-b95e-08db0a89cc30
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:38:35.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri+eI6HX8DtkrxNlqljsJdvmUy3/yfa7COjsdEh+Cy7giW+eEbWPZMBD/2MuhQjdMzgSWxU9ltDaIX7bIL633A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812

Have these in one place, for all architectures to use. Also use the C99
types as the "original" ones, and derive the Linux compatible ones
(which we're trying to phase out). For __s<N>, seeing that no uses exist
anymore, move them to a new Linux compatibility header (as an act of
precaution - we don't have any uses of these types right now).

Modern compilers supply __{,U}INT<n>_TYPE__ - use those if available.
Otherwise fall back to using "mode" attributes, but this can be relied
upon only when bytes are 8 bits wide. Should there ever be a port to an
architecture not matching this, it would need to define the fixed width
types locally by some other means.

In a few cases inclusion of asm/types.h needs replacing by xen/types.h.
Further in common/trace.c take the opportunity and also drop the
apparently unused inclusion of asm/io.h at the same time. Finally in
some Flask sources inclusion of asm/byteorder.h needs moving later.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: I know Andrew would prefer these types to move to a new
     xen/stdint.h, but not being fully convinced of this myself, I was
     hoping for others to voice views.

--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -1,37 +1,8 @@
 #ifndef __ARM_TYPES_H__
 #define __ARM_TYPES_H__
 
-typedef __signed__ char __s8;
-typedef unsigned char __u8;
-
-typedef __signed__ short __s16;
-typedef unsigned short __u16;
-
-typedef __signed__ int __s32;
-typedef unsigned int __u32;
-
-#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
 #if defined(CONFIG_ARM_32)
-typedef __signed__ long long __s64;
-typedef unsigned long long __u64;
-#elif defined (CONFIG_ARM_64)
-typedef __signed__ long __s64;
-typedef unsigned long __u64;
-#endif
-#endif
-
-typedef signed char s8;
-typedef unsigned char u8;
 
-typedef signed short s16;
-typedef unsigned short u16;
-
-typedef signed int s32;
-typedef unsigned int u32;
-
-#if defined(CONFIG_ARM_32)
-typedef signed long long s64;
-typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
 typedef u64 paddr_t;
@@ -39,9 +10,9 @@ typedef u64 paddr_t;
 #define PRIpaddr "016llx"
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
@@ -49,6 +20,7 @@ typedef u64 paddr_t;
 #define PRIpaddr "016lx"
 typedef u64 register_t;
 #define PRIregister "016lx"
+
 #endif
 
 #endif /* __ARM_TYPES_H__ */
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,38 +1,8 @@
 #ifndef __RISCV_TYPES_H__
 #define __RISCV_TYPES_H__
 
-typedef __signed__ char __s8;
-typedef unsigned char __u8;
-
-typedef __signed__ short __s16;
-typedef unsigned short __u16;
-
-typedef __signed__ int __s32;
-typedef unsigned int __u32;
-
-#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
-#if defined(CONFIG_RISCV_32)
-typedef __signed__ long long __s64;
-typedef unsigned long long __u64;
-#elif defined (CONFIG_RISCV_64)
-typedef __signed__ long __s64;
-typedef unsigned long __u64;
-#endif
-#endif
-
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
@@ -43,8 +13,6 @@ typedef u32 register_t;
 
 #elif defined (CONFIG_RISCV_64)
 
-typedef signed long s64;
-typedef unsigned long u64;
 typedef u64 vaddr_t;
 #define PRIvaddr PRIx64
 typedef u64 paddr_t;
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -1,31 +1,6 @@
 #ifndef __X86_TYPES_H__
 #define __X86_TYPES_H__
 
-typedef __signed__ char __s8;
-typedef unsigned char __u8;
-
-typedef __signed__ short __s16;
-typedef unsigned short __u16;
-
-typedef __signed__ int __s32;
-typedef unsigned int __u32;
-
-#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
-typedef __signed__ long __s64;
-typedef unsigned long __u64;
-#endif
-
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
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -16,8 +16,6 @@
  * it's possible to reconstruct a chronological record of trace events.
  */
 
-#include <asm/types.h>
-#include <asm/io.h>
 #include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/sched.h>
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -1,6 +1,7 @@
 #ifndef _LINUX_BITOPS_H
 #define _LINUX_BITOPS_H
-#include <asm/types.h>
+
+#include <xen/types.h>
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
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
@@ -3,6 +3,66 @@
 
 #include <xen/stdbool.h>
 
+/* Fixed width types */
+
+#if defined(__INT8_TYPE__)
+typedef __INT8_TYPE__ int8_t;
+#elif BITS_PER_BYTE == 8
+typedef signed int __attribute__((__mode__(__QI__))) int8_t;
+#endif
+
+#if defined(__UINT8_TYPE__)
+typedef __UINT8_TYPE__ uint8_t;
+#elif BITS_PER_BYTE == 8
+typedef unsigned int __attribute__((__mode__(__QI__))) uint8_t;
+#endif
+
+#if defined(__INT16_TYPE__)
+typedef __INT16_TYPE__ int16_t;
+#elif BITS_PER_BYTE == 8
+typedef signed int __attribute__((__mode__(__HI__))) int16_t;
+#endif
+
+#if defined(__UINT16_TYPE__)
+typedef __UINT16_TYPE__ uint16_t;
+#elif BITS_PER_BYTE == 8
+typedef unsigned int __attribute__((__mode__(__HI__))) uint16_t;
+#endif
+
+#if defined(__INT32_TYPE__)
+typedef __INT32_TYPE__ int32_t;
+#elif BITS_PER_BYTE == 8
+typedef signed int __attribute__((__mode__(__SI__))) int32_t;
+#endif
+
+#if defined(__UINT32_TYPE__)
+typedef __UINT32_TYPE__ uint32_t;
+#elif BITS_PER_BYTE == 8
+typedef unsigned int __attribute__((__mode__(__SI__))) uint32_t;
+#endif
+
+#if defined(__INT64_TYPE__)
+typedef __INT64_TYPE__ int64_t;
+#elif BITS_PER_BYTE == 8
+typedef signed int __attribute__((__mode__(__DI__))) int64_t;
+#endif
+
+#if defined(__UINT64_TYPE__)
+typedef __UINT64_TYPE__ uint64_t;
+#elif BITS_PER_BYTE == 8
+typedef unsigned int __attribute__((__mode__(__DI__))) uint64_t;
+#endif
+
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
 
 #if defined(__SIZE_TYPE__)
@@ -46,18 +106,6 @@ typedef signed long ptrdiff_t;
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
 
-typedef         __u8            uint8_t;
-typedef         __s8            int8_t;
-
-typedef         __u16           uint16_t;
-typedef         __s16           int16_t;
-
-typedef         __u32           uint32_t;
-typedef         __s32           int32_t;
-
-typedef         __u64           uint64_t;
-typedef         __s64           int64_t;
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
 


