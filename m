Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620076FB019
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531511.827238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw04d-0004zw-M0; Mon, 08 May 2023 12:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531511.827238; Mon, 08 May 2023 12:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw04d-0004y7-It; Mon, 08 May 2023 12:34:39 +0000
Received: by outflank-mailman (input) for mailman id 531511;
 Mon, 08 May 2023 12:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw04c-0004xq-Ev
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:34:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1017243-ed9c-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 14:34:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 12:34:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:34:07 +0000
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
X-Inumbo-ID: b1017243-ed9c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxdU93t7+5+vK03c3Y/4FxpB/K5u62wQDgU25mATLLyA7LuPENXtBeLQe4MpsU51Rjfu17FWskKLE8nK2O84bKDvWXZ9qQvORSm8NQvWeKdrzuqBZVDUPB5y8I6BYwbAyWwFOwm2K0p1d5Xg+xN4qsfu1hhHQq57K0XA5s2xcwHNML0+nnK5dJGLW3i/kxOEcVP3Ssrr6HCC9HXT1KZyz8wpCSNiGRND8MfFXY2Ntwpj5ZxzdeDRA+ltjHgoLgsBglcxmvKHbipUHHwXwCm8BZ3AgqPFfJMD9bCisa+IPDX0jqRNsZrn3o31vWxY6RW3olB2DRYJf8N+ocOrPu9DnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2BSQaE2keFaf3Lw5g+cGKquavmTPmGFtbCScr9TRZs=;
 b=P4sPCkoHlNmXsNGABwFD3JrUM4tbY7H1MGYIDUNnSeoIyObUZSxeCMeJTEoILO+GHLRERm2svdW0jZC1PXwHIkF4C9kNT7ZBdrnV6LIhE9nXMvp2QOmBdmUeg6T206GCWG0dmuetOv2hAlQnTuWWXhXx45nYVSQuRmGGThSgnuvo0gYaHjOaf/qBr308Hew2MwPPBMW2i836JI/V6WJQDvWAfCRMQqumkzqzgpLo1/65AvaF+28MVXCdtDjS8yeJQVObUdsbZdWYYCytW2Wu+qtQGk7mx4yRIChbEKoVCNA77Y4kKsZsmhJSsEPjDHlqn7V2fkfc5cMU/5F/FfMaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2BSQaE2keFaf3Lw5g+cGKquavmTPmGFtbCScr9TRZs=;
 b=occT+vGWOTEB5LzRpJeqdLOyJT4GtsUNGeL/HgtckEb6HFzx8lT4T7aFOAAer6RY5Q3zq8wUp1XNxCvOMn1Zp1wdewoFU+rdSYaHKDjYclCIMjb4JL6l/xO2LpgiyVyGOsquYfSjVUVy96JGibm8cqE4ZYrqo5kwvnwZ6lGXxqqNqkE0kuXKQ4vsw4xRCawNXlsLW4qYv8QHl0/mxp9prVW4y6ukzPfyH90aoI1pxv2q90G44JP84T/z6DffB/W3wiunr6wjTTtlL0ueej+DIoggBeBO1eUvMyuQ1KcZFblEvK9VIVnGm2RU5DAKfkar0aWePfPexDZ38ttMY0N1Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87e7af8b-67e7-1bf9-ee91-48547b2e5a39@suse.com>
Date: Mon, 8 May 2023 14:33:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 4/4] x86emul+VMX: support {RD,WR}MSRLIST
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
In-Reply-To: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c2dec3-9676-42a7-31ec-08db4fc07899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mqermCcjJ7CNjtr8TCFnVo88SHAcII3kvUaX5lnoIiEkKqhYOqfXqBkiCPpubkkJS8VZ8U+G1d08TEHexF/wW+AgTmJxuqrARJVNxSAgxAz2twp8QPqNbrqJZ9Yx0r9Nde4i0snrJvZDK6qV81YzRPBGIobQyNg0sLbNYBD7hSHzdgeUiOhLIhGZH1/USd4FwK+AK3nuIxLHV5Udn+0sYxKQ45CphMUZcKuqZPysSe5sEfbfE7Bfan7bRFz+2OOdpJxyTZ5BVqKK2GJeZqGAxqhhmNsKaowZXLXH5tpipoRXm9S3Qp6Zj5cpvVB9zqogVCN52eA7MBf2xCsEUHTSOvCmQFUltBOtRkJiVTReTzK3aKF20rW3+6z+077T8ACJcgk7Dbb8Vitd/uN5Tqln/s1AYzt2McCecCQOVwLT4Y7122vDmU299PX8zMxsfGv0jK2BUYgNsEWpj9P2HQgXZI7PFcM69EgblLQTtzVB3Qo4ZtWj8tD3141Qt8t5o27AOUoMJyov7oueneyosMaxYFMrhXzTl5UrwZhmNbY32oghiTvnbnkr4AzfXNOv4M45JLzDfQSCTkHbvMB24+WB6ndK6UFF3dzPGms/Lh/UAvPKFEC/fpfWGoV4ocqNDmhAXfiH8YRxa+lgCr2HG474wQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(31686004)(36756003)(38100700002)(2906002)(30864003)(8676002)(5660300002)(316002)(86362001)(31696002)(8936002)(6916009)(66556008)(66946007)(41300700001)(66476007)(4326008)(83380400001)(186003)(6512007)(6506007)(26005)(6486002)(478600001)(6666004)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRIT3IzcTVwdmM4ZUQ4ZE1sb3VUSERFaVQ0d0RVMnROTzhybUVIdldHQWtV?=
 =?utf-8?B?VUhDQWIxTmRMOWFCSW12UU12Y2k5bnpoSnRsamdwSXpxUEJ3MS9xYTlMd2t3?=
 =?utf-8?B?VTNwTURhWDd3QXdqUkFVQjRqamJyV3dhWkswK1dJLzk3TWlqS3ZUN0lzT3gz?=
 =?utf-8?B?WDB6ZGhSV3FQdEVEdVRzSER0NklDOS9xQ0VFWTlrMFIzbkhmWkxFTVlMem9I?=
 =?utf-8?B?SXZ2ZlpkZEFRZzZyTk9IQlBtNkxFR1dTa3RtclhlcmdydFlxZEhweEZzVEtK?=
 =?utf-8?B?ZUJpYktiNy9mNkZKd21KckZvWU53T2xPQjdzL25GSlpTQ3FGV1lma1FYMHJz?=
 =?utf-8?B?cnlOVER1eXl3eklIT2pIWFUrYjExRVNMaXhSbXJ1aStoUUtFSU9Pam1DcjZV?=
 =?utf-8?B?eUdQODZkVzlmWCtuMmVIUFpyRERHYVNmKzlMcGd6OVZPU3czUTI0bGQ3a2J2?=
 =?utf-8?B?MXFRbUJiUFFTMXVzSFAvbGdkNGkwVGlGdUdiQTlOVDlJM1R5d3BOV2hiWXo2?=
 =?utf-8?B?akpSeG1zcEVXWi9wd1l5RjhkRmZTc09QSDJwM1JBN21HVGxvOU5ReEN3THgw?=
 =?utf-8?B?OFAzK29ZTjViTTlJbjZ1UGlBSjkxSG1WWkF4YXFSbmZaN0lmVk1iendNVXBB?=
 =?utf-8?B?TllTTXpKK0JKVytFcUlGc2NIakZ3eVBIazc2dndXSkN4UjBMSWpQNTExdE5N?=
 =?utf-8?B?Z3lnSzFGU2g4SDFSZnJyUFcyNnJ1ZWpyTjNwK2JJSHB0bjFhRXdVNFJ1azA0?=
 =?utf-8?B?bUxXS1Q4WHJzNkJDc0xWWCtZM0w5VUl2cWFpKys3UXFzY2M0TXZSWmVoWGNt?=
 =?utf-8?B?Y0pKd1JpUFpOVmJOb3c5QjdyT2JaOWx1emZxSUFhRER2Zy9wN2F1bmt2L2Nl?=
 =?utf-8?B?a1dXbk53bE15Y09iKzFDbXNTQTN0UTFzWnZ2ZkIzSk56NlRXRy8rNnV3SjlU?=
 =?utf-8?B?NHpxUEdOVCs4R2VTZHdIRUNMZVQyYktUNmRveGVOd3Iya0FndnlBb2JiTzRs?=
 =?utf-8?B?QWVqeXl3ZnBWdjNLSHdHZldsY2pMWkFERjk0OFVad3JldTNuS0hZczVHU0ZI?=
 =?utf-8?B?MHZUbC9nWDVzNHZhYVlsUDZJblhFQXVIOXIyT0JkUlRVaE1uNkhITnI3UXpr?=
 =?utf-8?B?NkhYdDBiZ3NtYmpqNm0yREdMTFBOVld3QXNsNGRIMzNqeGR6OTVmM1hoN1gw?=
 =?utf-8?B?S3VPTWVPTjJhcnNvOXZoUG0zc2RObVRMV01QVEd2VkIxR3hUeUFsV3Ixamp4?=
 =?utf-8?B?M0NpN3c1WGR3aWN1Rnh5enNKNWp2MURYMzREeXBtU0sxWDF6MU1kc3BVQ0lk?=
 =?utf-8?B?dlZjbWVBek5ORWlFZE1RRk9CRys0Zit1bGluakpGS0kvb2lMa256MkpjN3A5?=
 =?utf-8?B?Y2RRemdOSWZTbmpmenRqdDZhc1pvOHMyL05zZGQxd2RqaC9mSC90NEl5WEM0?=
 =?utf-8?B?bUx5bUdzUU5rU2NVelA2Z3o5NFZvdDNoV3ZlTTAvdlpTK1R1U0Nha1AwOUV6?=
 =?utf-8?B?MzRMMFdjbE11TEhPNi9UMld4MmJDZHRPbnMyUXVpTGNUQ3hIOFdxS2dVSjk1?=
 =?utf-8?B?K0FhOVhrTkZ0K1pmRG5mdXg2OTFTTkIvMFRUdzNWSWVJRHJHRmxFSDNUaVFM?=
 =?utf-8?B?NEgwWkpkYVRRVHp0aTNsOGVUQmFLK242Zm5XTXBNeHF5Sllod1NLZWExWTlI?=
 =?utf-8?B?V010UUc3UU9sUmVScWRVWVVYMVRvd0tLVG9LWklCb29Bc0h1aHhmam5tTCtD?=
 =?utf-8?B?ZkZYdHRBVGVmZW5vYjdTNk1YV2JXQlNmRXAzai9Ud0s4Rjc0Ui9vM0NmYUhx?=
 =?utf-8?B?MFBDNHhLbXA3am84aEptWU5iUm5JSzhiZHdXeFZZSkkyT1lCejRMdzI2eVJN?=
 =?utf-8?B?Q016bFhLcHY4VU9FeFVRc1p3RVArSmFaTTZlWXJCVUpuUFMzdDFQSzBVSm0x?=
 =?utf-8?B?YWpJdDhRUzErZWdVWWNmODJQVktMWUt3YXIvSTBVdTF3TjZSRGNoUHRzOEgz?=
 =?utf-8?B?bnI4aW1FMXpIYlJ0Z2hzRTVjZ2RwV2hoOWVSMHdyMmJzTWE4ZkZqSXBDNnAv?=
 =?utf-8?B?TDdIaEFSR3hVa3FCWWtpM2VTbXZZMk9yZFM2bmpsNVkzYVNTRU1JQUtiQXZr?=
 =?utf-8?Q?K5Xx5uSFm+l9Kl71u4N+yYlFJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c2dec3-9676-42a7-31ec-08db4fc07899
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:34:07.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zf3fX9RteFjaRak6P5mo6iD+aEOpSQ31gUsAfZZkEnIMQxwDs5iaBc9+mDhcmk8GaYyERxWinxL/YBSGY+mZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318

These are "compound" instructions to issue a series of RDMSR / WRMSR
respectively. In the emulator we can therefore implement them by using
the existing msr_{read,write}() hooks. The memory accesses utilize that
the HVM ->read() / ->write() hooks are already linear-address
(x86_seg_none) aware (by way of hvmemul_virtual_to_linear() handling
this case).

Preemption is being checked for in WRMSRLIST handling only, as only MSR
writes are expected to possibly take long.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TODO: Once VMX tertiary execution control bit is known (see //todo)
      further adjust cpufeatureset.h.

RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
     blindly. Alternatively we could consult the exit qualification and
     process just a single MSR at a time (without involving the
     emulator), exiting back to the guest after every iteration. (I
     don't think a mix of both models makes a lot of sense.)

With the VMX side of the spec still unclear (tertiary execution control
bit still unspecified in ISE 048) we can't enable the insn yet for (HVM)
guest use. The precise behavior of MSR_BARRIER is also not spelled out,
so the (minimal) implementation is a guess for now.
---
v2: Use X86_EXC_*. Add preemption checking to WRMSRLIST handling. Remove
    the feature from "max" when the VMX counterpart isn't available.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -240,6 +240,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
         {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
+        {"msrlist",      0x00000007,  1, CPUID_REG_EAX, 27,  1},
 
         {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
         {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -195,6 +195,8 @@ static const char *const str_7a1[32] =
     [18] = "lkgs",          [19] = "wrmsrns",
 
     /* 22 */                [23] = "avx-ifma",
+
+    /* 26 */                [27] = "msrlist",
 };
 
 static const char *const str_e21a[32] =
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -342,6 +342,8 @@ static const struct {
     { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
     { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
     { { 0x01, 0xc6 }, { 2, 2 }, F, N }, /* wrmsrns */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, W, pfx_f2 }, /* rdmsrlist */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, R, pfx_f3 }, /* wrmsrlist */
     { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
     { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
     { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -589,6 +589,7 @@ static int read(
     default:
         if ( !is_x86_user_segment(seg) )
             return X86EMUL_UNHANDLEABLE;
+    case x86_seg_none:
         bytes_read += bytes;
         break;
     }
@@ -619,7 +620,7 @@ static int write(
     if ( verbose )
         printf("** %s(%u, %p,, %u,)\n", __func__, seg, (void *)offset, bytes);
 
-    if ( !is_x86_user_segment(seg) )
+    if ( !is_x86_user_segment(seg) && seg != x86_seg_none )
         return X86EMUL_UNHANDLEABLE;
     memcpy((void *)offset, p_data, bytes);
     return X86EMUL_OKAY;
@@ -711,6 +712,10 @@ static int read_msr(
 {
     switch ( reg )
     {
+    case 0x0000002f: /* BARRIER */
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case 0xc0000080: /* EFER */
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
@@ -1499,9 +1504,53 @@ int main(int argc, char **argv)
          (gs_base != 0x0000111122224444UL) ||
          gs_base_shadow )
         goto fail;
+    printf("okay\n");
 
     cp.extd.nscb = i;
     emulops.write_segment = NULL;
+
+    printf("%-40s", "Testing rdmsrlist...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = (unsigned long)(res + 0x80);
+    regs.rdi = (unsigned long)(res + 0x80 + 0x40 * 2);
+    regs.rcx = 0x0002000100008000UL;
+    gs_base_shadow = 0x0000222244446666UL;
+    memset(res + 0x80, ~0, 0x40 * 8 * 2);
+    res[0x80 + 0x0f * 2] = 0xc0000101; /* GS_BASE */
+    res[0x80 + 0x0f * 2 + 1] = 0;
+    res[0x80 + 0x20 * 2] = 0xc0000102; /* SHADOW_GS_BASE */
+    res[0x80 + 0x20 * 2 + 1] = 0;
+    res[0x80 + 0x31 * 2] = 0x2f; /* BARRIER */
+    res[0x80 + 0x31 * 2 + 1] = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (res[0x80 + (0x40 + 0x0f) * 2] != (unsigned int)gs_base) ||
+         (res[0x80 + (0x40 + 0x0f) * 2 + 1] != (gs_base >> (8 * sizeof(int)))) ||
+         (res[0x80 + (0x40 + 0x20) * 2] != (unsigned int)gs_base_shadow) ||
+         (res[0x80 + (0x40 + 0x20) * 2 + 1] != (gs_base_shadow >> (8 * sizeof(int)))) ||
+         res[0x80 + (0x40 + 0x31) * 2] || res[0x80 + (0x40 + 0x31) * 2 + 1] )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing wrmsrlist...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.eip = (unsigned long)&instr[0];
+    regs.rsi -= 0x11 * 8;
+    regs.rdi -= 0x11 * 8;
+    regs.rcx = 0x0002000100000000UL;
+    res[0x80 + 0x0f * 2] = 0xc0000102; /* SHADOW_GS_BASE */
+    res[0x80 + 0x20 * 2] = 0xc0000101; /* GS_BASE */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (gs_base != 0x0000222244446666UL) ||
+         (gs_base_shadow != 0x0000111122224444UL) )
+        goto fail;
+
     emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -88,6 +88,7 @@ bool emul_test_init(void)
     cp.feat.rdpid = true;
     cp.feat.lkgs = true;
     cp.feat.wrmsrns = true;
+    cp.feat.msrlist = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -601,6 +601,9 @@ static void __init calculate_hvm_max_pol
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }
 
+    if ( !cpu_has_vmx_msrlist )
+        __clear_bit(X86_FEATURE_MSRLIST, fs);
+
     /*
      * Xen doesn't use PKS, so the guest support for it has opted to not use
      * the VMCS load/save controls for efficiency reasons.  This depends on
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -830,6 +830,20 @@ static void cf_check vmx_cpuid_policy_ch
     else
         vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
 
+    if ( cp->feat.msrlist )
+    {
+        vmx_clear_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        v->arch.hvm.vmx.tertiary_exec_control |= TERTIARY_EXEC_ENABLE_MSRLIST;
+        vmx_update_tertiary_exec_control(v);
+    }
+    else if ( v->arch.hvm.vmx.tertiary_exec_control &
+              TERTIARY_EXEC_ENABLE_MSRLIST )
+    {
+        vmx_set_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        v->arch.hvm.vmx.tertiary_exec_control &= ~TERTIARY_EXEC_ENABLE_MSRLIST;
+        vmx_update_tertiary_exec_control(v);
+    }
+
  out:
     vmx_vmcs_exit(v);
 
@@ -3700,6 +3714,22 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
+static bool cf_check is_msrlist(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
+{
+
+    if ( ctxt->opcode == X86EMUL_OPC(0x0f, 0x01) )
+    {
+        unsigned int rm, reg;
+        int mode = x86_insn_modrm(state, &rm, &reg);
+
+        /* This also includes WRMSRNS; should be okay. */
+        return mode == 3 && rm == 6 && !reg;
+    }
+
+    return false;
+}
+
 static void vmx_do_extint(struct cpu_user_regs *regs)
 {
     unsigned long vector;
@@ -4507,6 +4537,17 @@ void vmx_vmexit_handler(struct cpu_user_
         }
         break;
 
+    case EXIT_REASON_RDMSRLIST:
+    case EXIT_REASON_WRMSRLIST:
+        if ( vmx_guest_x86_mode(v) != 8 || !currd->arch.cpuid->feat.msrlist )
+        {
+            ASSERT_UNREACHABLE();
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+        }
+        else if ( !hvm_emulate_one_insn(is_msrlist, "MSR list") )
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+        break;
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_secondary_exec_control;
 #define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
 #define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
 #define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+#define TERTIARY_EXEC_ENABLE_MSRLIST            0//todo
 extern uint64_t vmx_tertiary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -352,6 +353,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+#define cpu_has_vmx_msrlist \
+    (vmx_tertiary_exec_control & TERTIARY_EXEC_ENABLE_MSRLIST)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -201,6 +201,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_RDMSRLIST           78
+#define EXIT_REASON_WRMSRLIST           79
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -24,6 +24,8 @@
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
 #define  APIC_BASE_ADDR_MASK                0x000ffffffffff000ULL
 
+#define MSR_BARRIER                         0x0000002f
+
 #define MSR_TEST_CTRL                       0x00000033
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
 #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 76
+#define VMX_PERF_EXIT_REASON_SIZE 80
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -72,6 +72,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
     case MSR_AMD_PPIN:
         goto gp_fault;
 
+    case MSR_BARRIER:
+        if ( !cp->feat.msrlist )
+            goto gp_fault;
+        *val = 0;
+        break;
+
     case MSR_IA32_FEATURE_CONTROL:
         /*
          * Architecturally, availability of this MSR is enumerated by the
@@ -341,6 +347,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         uint64_t rsvd;
 
         /* Read-only */
+    case MSR_BARRIER:
     case MSR_IA32_PLATFORM_ID:
     case MSR_CORE_CAPABILITIES:
     case MSR_INTEL_CORE_THREAD_COUNT:
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -11,6 +11,7 @@
 #include "private.h"
 
 #ifdef __XEN__
+#include <xen/event.h>
 #include <asm/prot-key.h>
 #endif
 
@@ -28,6 +29,7 @@ int x86emul_0f01(struct x86_emulate_stat
     switch ( s->modrm )
     {
         unsigned long base, limit, cr0, cr0w, cr4;
+        unsigned int n;
         struct segment_register sreg;
         uint64_t msr_val;
 
@@ -42,6 +44,64 @@ int x86emul_0f01(struct x86_emulate_stat
                                 ((uint64_t)regs->r(dx) << 32) | regs->eax,
                                 ctxt);
             goto done;
+
+        case vex_f3: /* wrmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
+                                  (regs->r(di) & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->write_msr);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                base = msr_val;
+                if ( (rc = ops->read(x86_seg_none, regs->r(di) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write_msr(base, msr_val, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+
+#ifdef __XEN__
+                if ( regs->r(cx) && local_events_need_delivery() )
+                {
+                    rc = X86EMUL_RETRY;
+                    break;
+                }
+#endif
+            }
+            goto done;
+
+        case vex_f2: /* rdmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
+                                  (regs->r(di) & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->read_msr || !ops->write);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                if ( (rc = ops->read_msr(msr_val, &msr_val,
+                                         ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write(x86_seg_none, regs->r(di) + n * 8,
+                                      &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+            }
+            if ( rc != X86EMUL_OKAY )
+                ctxt->regs->r(cx) = regs->r(cx);
+            goto done;
         }
         generate_exception(X86_EXC_UD);
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -588,6 +588,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
+#define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -100,6 +100,9 @@ bool cf_check x86_insn_is_mem_access(con
         break;
 
     case X86EMUL_OPC(0x0f, 0x01):
+        /* {RD,WR}MSRLIST */
+        if ( mode_64bit() && s->modrm == 0xc6 )
+            return s->vex.pfx >= vex_f3;
         /* Cover CLZERO. */
         return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
     }
@@ -160,7 +163,11 @@ bool cf_check x86_insn_is_mem_write(cons
         case 0xff: /* Grp5 */
             break;
 
-        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
+        case X86EMUL_OPC(0x0f, 0x01):
+            /* RDMSRLIST */
+            if ( mode_64bit() && s->modrm == 0xc6 )
+                return s->vex.pfx == vex_f2;
+            /* CLZERO is another odd one. */
             return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
 
         default:
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -286,6 +286,7 @@ XEN_CPUFEATURE(FRED,         10*32+17) /
 XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
+XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   MSR list instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */


