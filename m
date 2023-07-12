Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF91750875
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562462.879139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ4Y-000485-QH; Wed, 12 Jul 2023 12:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562462.879139; Wed, 12 Jul 2023 12:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ4Y-00045v-Ne; Wed, 12 Jul 2023 12:35:58 +0000
Received: by outflank-mailman (input) for mailman id 562462;
 Wed, 12 Jul 2023 12:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJZ4X-00045i-5I
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:35:57 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4f29abb-20b0-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 14:35:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9292.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 12:35:54 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 12:35:54 +0000
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
X-Inumbo-ID: a4f29abb-20b0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjQShAiwOaFbgSph6Kj/ZvoJAgwlcnzEAzyNcEYdA9CCAwIbDETjKd8jzrn0sOfPMwA7jD7vSUJPP03s1GRaOGYUpW5ulcPqbi1ObyqMJE7ct/qUFIXc8mIXuovZ3S66++5l1jg8A33vWcq7ufPjTuwqXKP/jQui1js+dH7lIBWP63OkbsOOGyZiaMPx4WZuXRrXpGI21qlyeaHaNezRRAAo3cWxtZIhfgGVQxOPlsTqGrcb+nN4E9LSKRVEbwJQ8hd0tyce0MImgbCEGdOKxuSLXmz3oz2GhdSZcD66VeXuckcVdY6KURMdfRtjpp53ccmpFq7pDgO4ImU5ZoaZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5JtolAVvt9vNKUFYXvoqYSCHPLwYP/pbhtLKnh3NpA=;
 b=FatYSdnA2vWWEnDskwApKZJ/eaPppF9G2yH2Rp2AUp0Ucjv3W4R/+COQAO1VMy2BJGZXpE9Gq6SyJ+Z1WQOu43yL0zrzHq9Vq7jmBW18fD6rOJssuBCNVrdVGzKBhRxMIbk2KwVYYmsXJiaptTQTbqzjVd6hf1ekgSozK6rmPzmMdybsTqIDzydlbeqdJeIfybfKlaQOfMt3E9nT8JrbnShTou2viMFF+J80U0xNejjnT78w3snES3M9ixgMGzXghbsUFbBAVla34mWbikLpuGeBSKa7aVUg9uygjPVTABjGcKKnAkrvvqwKCFKCi716QhAYcLjYdcrukKISson2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5JtolAVvt9vNKUFYXvoqYSCHPLwYP/pbhtLKnh3NpA=;
 b=rk9EAKCFh27vsm1/NVh2RdVth1pAh7oklfLmfhyr570YuEQpv75Ibke8tEoxSMo/vG64uPTxd4dUClc0qVMHxcXoNxoLX8vhtSmIHAUFSxN5sxpsaE/5Tz+ZnQYUbx68JisVL8k1+c5OWGm0LN82jDFxH7ImfKcGjqXcFq+EWVnyfwG0aoSZX/SsCt3eMjzUo5uvVLY7YbA2bq9Hd936K71nMDZdxA5Ll7fXdOtmDqozAc5DLSIVCxp0JkWzLbl4X+HYobHznnvd3FmBxKhE/7d8hfgjpxRGSxQs2ivhQd9hQQM3m5l38wBr1GrN5KwQfvWt0NYd7Eb6+3V/Q6cmZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60e79cc5-ad07-81e9-e7e6-f97a73a4df62@suse.com>
Date: Wed, 12 Jul 2023 14:35:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH 3/3] x86: short-circuit certain cpu_has_* when x86-64-v{2,3}
 are in effect
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
In-Reply-To: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9292:EE_
X-MS-Office365-Filtering-Correlation-Id: 86730012-e967-4df2-e553-08db82d488c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+nUgMRbacEqZxWIqG9oVukWfRiEoTWWsYz/XQ2A3RiZiLHRD2AzRSa2a0NmBHFiWCWE24Iogah2yzjaEYOFBVHTsM742Ro1xpoRP+qzM9PA2XSVUzVodNN9RX/0iYC4pUPULuAG6EzoehO8l3+IUeJhCl9hF1rKlPQgCrEA0UbmyqSdfLoSrnZohdXduRc0nGQUmG6bzMNhIlqESqiDuaTiDStEjpI8bzGo6TOW8Sz0qcGKez1xEbwkjNl0lDOOYjPAVKSoEfYXx3oEj9G1v+Mk+A4h76gj2ZydkhyxCyMzHZRPro8nLuMfjlIq/IbCLItiTcWZF/Mkobh4HArpkfJSM4azhqaryGnXjOlkEhxUX78U3zCuy/6diIKIsTOu+Gw6SihMsxtcPT2N/5iLw/nro80Ddbcdfy6ux/4+L1H1vr77trVNbRIL6Ub6sJmfGrxhHZ1YuZFFGJabmd1TVNPlVMDpq4z/QbZ9UPwS+ztLrsBZTJhQIWgV6oXAnqix7QUcb7iKjGH7vIiAqfhrh8l4R6/2OtCLWPWdKRSUDcREeMUwz2qLxn48tKSl/JvK9kEyevCEqQa5Wh0/NWt/5SHVjWZpEZw4OIZeGQQU50skcr7O8DnJfDAYxkZdfm9GOKFPCbILVaSI3cEZ9MyZjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(2616005)(2906002)(66556008)(6486002)(66476007)(4326008)(316002)(66946007)(54906003)(6916009)(478600001)(26005)(8676002)(186003)(6512007)(5660300002)(6506007)(41300700001)(8936002)(38100700002)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3hoeTFJdjdUM2k0Y3N4L0VudDRoUXNlcHNoeWJFaDlwbVpUOWpWc3d1SVZv?=
 =?utf-8?B?ZldNaUFaZ2FFMy9JdXRRUlB6VDV3OVFlZmVHVEJGQ0R4V2JnSXlKajAwdHdJ?=
 =?utf-8?B?QnVOOVNtcml2R3Y4c3BPQ2xQT3JSTHBCdTZmSjhhTkdUSEdZY1YyTVl3UUZj?=
 =?utf-8?B?dGc2R3ZKaEJUZVRYL1JmWVVaaHh5dGh0eFZGYitFTWRleGY2VE8zemN5djl3?=
 =?utf-8?B?a2NnZTZQN2w5TUFIcWhGUkg0MUpwcDlKL25Ga0J0TGxxU3p6Vlp4aTBJemRs?=
 =?utf-8?B?QVR1dzdMN3FVYzNXMkFWdlQyVjBBNHp4ZFVoaUNicHhwYmhIc0xOQ1JPK2VP?=
 =?utf-8?B?ZmVRRmsvaDZVY016dXdXdmxRclJTdTN1b2RjQ2dlM0VJTlVvK25OVkwwOWtI?=
 =?utf-8?B?SGhxdkI5Vm5PbnVIeWNvM3h1d3VZSVRMYnNTRUljUGd3TUhQbUhIcTZNZUtn?=
 =?utf-8?B?YzRaSkpRc1lzcnhMdHJMc2RBK2tUY0ZJNnRVR3V4ekMyMlJkb01VMlNxc0l4?=
 =?utf-8?B?RnBYbHRCOEpGRFlXRVR5ZnhNeXVwTERyWGNuWm5xQnhNTllGYTRrK25pSEVh?=
 =?utf-8?B?dFpOeGZ0c0pwUXpaMEJDYVIvWVFMZlE5TE51M29vbHBmWDNGdXYrTFZKYXBt?=
 =?utf-8?B?TGQ2MVA3S3JweEswODkySGVTOWFidkVCQ05CZmYyc1dRZlFzdFc4a1IrTGhH?=
 =?utf-8?B?azFjRUc5cVZ5aXJZZmM3NnUrSWN0Vk5naVFsUFhvZEFjOWp0Rm5EblJUZ1Jz?=
 =?utf-8?B?bVc1cVFlL0ZBNzZlQ2VScUlSUEt1MUs5K0djUUUreE9sMHRQUWUrS1FUdEpv?=
 =?utf-8?B?M241dkYxaXdWcUc2NWV6clRhWExSTzMrSS9hWVdDYnRiODFnSENTRnU3Yzgy?=
 =?utf-8?B?L3hwVnAxMU5VRzlKaDhhT3FRVEVBblUxZ3hoR1dnbjB4YWQ0dGlvZElUUmMz?=
 =?utf-8?B?WUtaWG9Gd285cFZrSTZZcVgvNGVQS3RFWUs1T0lxV2w2cUVQWWZHZ3R2bS80?=
 =?utf-8?B?UmZIRnNrMWpSUGpMcjliYVpOUUc3c0MwcHIxOCthbXJTelBJcGswVkVvT1lO?=
 =?utf-8?B?T0MyT3lqOEJlcVpCVnpFWmFra21vTTRlbS83bjhYZGQvQ09ZZzVPUkc3SUNw?=
 =?utf-8?B?dytXc0hZcWlMd2s2Sm5wbm5vYlk3SFhjUHpremFiTGxsTVR0czVSd0lRbE5J?=
 =?utf-8?B?aU5yb1J2bTNIbGJ5OEhReUpBN2pmaFlYei9BSllqWFlWQlBhQkMzQmtxdkpv?=
 =?utf-8?B?T0JFQ0MvOU5PVTg0UzhWRmFSMklrR1RYRTJhTDlSSDdkL0RKUHlhbXpiYXl0?=
 =?utf-8?B?L3JzVGlvbGI0UkMzR1pzd09LcGZReDBIZFpOTmV3YVY0TVRSSG12TzNFU1or?=
 =?utf-8?B?ZzFob0JCOGExR1A1K2FsRVB4ZWtoVXdXT0w2NnhNTzlISjNvQXl4K2xCeGRU?=
 =?utf-8?B?c2dMZ0d5eXN1dUgyUWtwcG0rWTgrYnRwelRoT0tiZytoUldqemZKSXdzK21h?=
 =?utf-8?B?ejhZUG1seVgwYU1ZWitOa0lieFZUWENjR1ZmdG5tTGZBUDdBMlJvTUNkWWJ1?=
 =?utf-8?B?UWROdUtnMGdBY21nelU1Q3pHd2xKV1dYK2IvNE8yaXQyVEU4Y01RYW9IMGps?=
 =?utf-8?B?OE1SaTFIbDljUTdmUWkxRDFRUE5Yb21xRlUrWkVlS0ozelpHMmtiSS9UV2pL?=
 =?utf-8?B?SlRoYXczL1YrWVc1akYrcUIwaTBpK2Y2TTFPUEJQMmV4MG03NWY5L1pFOFY5?=
 =?utf-8?B?Y1VmMVBDNzNWZWl1NnI0VWE5WXVLRkhOVFZhc1dadUd6OUdPWlE1Q3pXam8z?=
 =?utf-8?B?S3dWMkh0dWhGSkVIQjRWMmdZZ3ZzZmxMdkVBSjFON29NbmF3QnlVWDJoL3RM?=
 =?utf-8?B?ejY1TEhxYlFYdE9RWXJES3c4T1JVYWNXRFZxU3NYS25Wdkx6QXA1SG53WUpP?=
 =?utf-8?B?c2lFUFBmT3hFUkhnUFRnS3YySTJnaXlHeVptRDFBYUhNTGQ3MUcxLzlvMzBO?=
 =?utf-8?B?bWQzNE9XM3ZHd2lxMHp5TG9iWHdsR1pFdDl4QmtFUEpwOE9uSG53YklmV3ZF?=
 =?utf-8?B?eWVGeEFWQW1KMUtrZWZwbVFRYUNvNU5jYytHTnVHMS8ydnlvQS82eTN6bElj?=
 =?utf-8?Q?qEofYZZSBwu15YLRcpx4dhe8w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86730012-e967-4df2-e553-08db82d488c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:35:54.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0bslSMILy/x5wTnOLojhyTcIwFLZwprPq5tVjiZfys/fj0l0twMF9X7NjHWfLEl3s8SU5I5Pf/MHkIZRW5RbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9292

Certain fallback code can be made subject to DCE this way. Note that
CX16 has no compiler provided manifest constant, so CONFIG_* are used
there instead. Note also that we don't have cpu_has_movbe nor
cpu_has_lzcnt (aka cpu_has_abm).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but as
CX16 shows this isn't necessarily better than the #if/#else approach
based on compiler-provided manifest constants. While not really intended
to be used that way, it looks as if we could also use
IS_ENABLED(__POPCNT__) and alike.

We could go further and also short-circuit SSE*, AVX and alike, which we
don't use outside of the emulator.

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -76,13 +76,19 @@ static inline bool boot_cpu_has(unsigned
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
 #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
 #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
@@ -114,11 +120,19 @@ static inline bool boot_cpu_has(unsigned
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


