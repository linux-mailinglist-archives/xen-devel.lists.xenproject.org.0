Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0E6A81FF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 13:19:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504902.777343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhu8-0007LL-7x; Thu, 02 Mar 2023 12:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504902.777343; Thu, 02 Mar 2023 12:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhu8-0007Ig-55; Thu, 02 Mar 2023 12:19:24 +0000
Received: by outflank-mailman (input) for mailman id 504902;
 Thu, 02 Mar 2023 12:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXhu6-0007Ia-9D
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 12:19:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75212c3d-b8f4-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 13:19:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 12:19:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 12:19:17 +0000
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
X-Inumbo-ID: 75212c3d-b8f4-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD4KWVh/fyNZFV/h3tWhjtLWeTLLCL2ommuxuM6HddJzPRbUJe/Ye/0D4ilJLp3ctXdvuAMxfHpWnBvpFSsF0J0jSzvy1NzSZxQYyt3juv+Km3BKLeGMhV8vOYcWvc3aGfH0lxH844+lrJOd++XumoIpADCXyP+++K02XxQ3E1NQbUsdxFGwYv07dcGdJopT3bG8kMTSzcjuMqiZp0a/+jmmyF5EGLDOLzAGXwOOYIHhbFzyunJmKnYKl5KhT+O+PdR839Eqr5U19vCfY6D/NP8lGtM/Hwod27GEdKobJdJUqXz44+NCdVrbpikH2OFvvnmgUb7JCZRxhoxrT9il3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrVEgBlMpRTRt+XXHAZ6F1H9I6+vzH85aLQss1aoQA0=;
 b=afTuEGJ9B9aYhwmafdppd3AVxKq+1QU4IjhYHsYJTq4D/uwnB4f9FnZsgLTYFoWzqdLwtP3QegUz0rCjX860xaRfMWqMzJnncdx+Rwwb/xh7GAGZV9HooDDTV4/EzfCqrfbpMWQEqAEpGec9oAMhxgQmmNFOWIWB4fLbnTp2BuSdZ0gp+0T7jiyV9o4rbXq3yodSgHiQYwJfTbA2+38LXZsswRGtr1W/IvzjATBppbDgTjmC+HECztXMPzVaGPwt5yZ0Kv2HPVFO0oGAU7Tni2FKQjWJNW8D64U8GstnhP6UsaNnrcmekk4emywHcJcBa9BMxk3r2Jd9H99wcyaTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrVEgBlMpRTRt+XXHAZ6F1H9I6+vzH85aLQss1aoQA0=;
 b=kvokg820jKT0WtMDie10FKu7NcLqcZ3T0wWNdYF+zvqLCqvY6EBk9LVpPAUa44ZmPfdtbGs6vZ4D/HsRzYhCBJgkR0FLuAOYKDJJR5qBTldO0MNdTSA6PqJtlJwMzHKNxa7HgIrx4+zQRZ9YUmsgYusOwR+S3vt7R4DObrB2IaxA7b3R0t048brmCEDiQNEs3lzXVQSVL4Fl2iO7zfDQeHAXc48kxYch40L6kTr/OLwrfbmzbPG3KjFkQBfvCWgG2MQLp8VsaeBy0LbzR20/H+PPGCLeAhULY4AOChIAhhwjNCBBeXPGNtPIIdthMt3Mf5YPBR6PJBgeznU+1Gpr/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cf8092b-368f-0f99-d898-3cceec91e078@suse.com>
Date: Thu, 2 Mar 2023 13:19:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: support LKGS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a24b25-36fa-491a-5523-08db1b1857f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z3eTMR1zFGGysUGQmhOfyNxaiqdV1HnMVb+RojrAD7BCgLLRSycjukBVI5Th+i9ueNWg8chf1EZB3I1BzAnZxkOWE1q7ZonOxCGVgP5y4CO7qxTbmqnwgGpHrabeQQqh5p/71Ds6uYGjJ5qqwUgXh0IVw36jYdZRjrILPSSW2d4Z1GvG467YXFA1yRU+SBqbgUU/sncTko3J/jU6kgHz3WN7GdTnKmlMycFpXAi+8TZPLqlhHOPpS5dYnPc3yLO5nO2JwNn1qapT6QMKNmd9PKj9DXD6HVPk5vJbuG3Mdf/mT+2zJvjuRNkVqTykR1Lxnrm73zrv3D3aJqyaIFaDyeNbtNEevs8DlrMjbLKlBvDNGv+xJ7OqlrD3ycIUoVyKK8buZZE0gBYThPLh8gh77bo8vPraK2A7LWkvZNvmCCRtTrdt7X5HZRmqwSRWf7aomGJB1GhM6jJudpIy+pGtt0/jHli/EkMWm32Rkhs1RPSVbvFde2X3R+yknw4cExMDGSK+tmiFQXlFTjDd26RuoESciR6q/nWA+VgXC15edE5Rhy+WYACDDBPMTIAW/JhGLlY7BIYJ6VIh8NBy28Fa4XG1LvqwXJwptu8hqCIJP3o7MnJ/+FK7dbIfk903zrHpp0LKrimgKoatPbg9lP0IvaLPxcluErUu1wIPAxZ/TUNyf3j+mj23sR+/Rt32kuxlmXHPOUsX/qPgpVPJETxpLr13wryqE0zHXzkQ4BR8iYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199018)(31686004)(66946007)(83380400001)(478600001)(316002)(54906003)(36756003)(4326008)(31696002)(6916009)(8676002)(38100700002)(6512007)(6506007)(26005)(186003)(2616005)(6486002)(66556008)(66476007)(5660300002)(86362001)(8936002)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS9td3hsc2dGNU9uZnFFUFFxVkUwcDNXY0k5VGVZOHNXcEhuV3hYT1pDTHov?=
 =?utf-8?B?QnlTTXJncUdZeGwwaWdSbmVSendnNmNzWmJjeHByRlZzTi9KZWpybVk0Sk1N?=
 =?utf-8?B?THhUNkxVZHR3WC8vcy81bnVTUDI3TURuMnR3WkxoNVB3NDBwcnNuUXRGNkhw?=
 =?utf-8?B?N1ZTanJ1YnRaRVBES3ZBdXBpbjVBbGFXN29RY2N5Tm9oUERkbFI4czBlRHRI?=
 =?utf-8?B?OGFTcisxVldvMktMNWZ3YlA4ajhQeFVXNUF5anZwdzVuTngvSHVhdGRiZU45?=
 =?utf-8?B?anlUQXZxdXpVeVp4OVdIMjU5SkhZbXNXelFldUdRMHBGRmVSYzRYN0Roejh3?=
 =?utf-8?B?blYwQUJleE5OalhIZ3RlbVlLeGRsTDNpS2ZFc3ZsYUE1QWdBakdtNDcrRmM5?=
 =?utf-8?B?dG9IeHRkem1TM3ZNbUpGRTMrVU90ci9iOGZMVTlvRW13VnUxTm9aTGVBVjdS?=
 =?utf-8?B?ZXdRS3BwcXc4aXlyK01mM0JuSDRtWkxrSElZQ3orUHlTWUEyMjVsSEZ4N3hV?=
 =?utf-8?B?TDlBN3h2Qld1SnY4ODM4b3BkZGpmRm8yRi9uYVhVOFd3RmhZVGR4VUhHYlhS?=
 =?utf-8?B?WEVKY055Z2F3NUR6amN0Y0lVN0tTYkpxaXpMSVNBWVIybWJpd1IwNDRPRE0r?=
 =?utf-8?B?aFBFdm56dlFxV1V4QTBwSVM2T2dveVhDelVjcFEvODRJelVPRmU4K3B1NGpu?=
 =?utf-8?B?L0Z6Y0pVR3k2WGJ1UFFxc2Zhc202aWxVUm10L0pjeTdySnE0cS9DUER2WlZS?=
 =?utf-8?B?bWpGS012enlTQnVIL01IaUVsWVFva1ZaSkt2QkVPSnBUVjQ2NEZrQXN2dFND?=
 =?utf-8?B?TVcvN25DWkF3eVZXejMvamhjZE4zQlcrRmw3ODRIeHg1Q0phTTBlWVFLZ1Bi?=
 =?utf-8?B?eXNmRitjWnJselVseHhWVDdmZTVYOE1FaVg2WThxbmExZE1ndnZNZjI2VFo4?=
 =?utf-8?B?TDc2d29SK0pNK2t5NUhsZWJOMmE0aGNNQW1yV3BqYXVheW5LRnEzSC9GQzBH?=
 =?utf-8?B?R3BzVklxSENabFAwcUhaMDN3N1VGb1p2Nk9JQngxRG9UcTBVanpkSjk5NFpq?=
 =?utf-8?B?aGZsMk4zTUZFREN0R0JVZCtWeXhEWkxsaUptRUc3SjBadnRRZXFzMEgyWm13?=
 =?utf-8?B?TExHdVdDZ2ZwT1Vza21Ya0VoY0V4ZWcvYllNWlFOekcyN1Q0VGh1K2VPZG4z?=
 =?utf-8?B?eGtVVW5LYUZJcDIwZm9KZ3NJVWltczBVSWV1cGsweVhsR3hnNVNFcTI3OWdW?=
 =?utf-8?B?U3pkWDhRaE5qVjJIOHpNdkVhMllQbUE4Tmo4ZVN3NHVGeWhDd0Z5dmJQSkZI?=
 =?utf-8?B?WVhud2M3cHZaZ3cwRlYzOS9TNW1oQUdUcUhnV3JkZHlIMC8ya0pONWNkaTly?=
 =?utf-8?B?NUphUllsQXVuMjJHMXFFTFN2UkF2eHRZcm11ZUJjTisySlVKV2Rka3FkVlV3?=
 =?utf-8?B?WVlpMXBpMG0xTWtkMDR4ckFkZVFGN1pUTmVJZ0JsMC8vL1AwLzZudE5lREJD?=
 =?utf-8?B?ZlhQY3ZrODN4MUcrLzV6djhkQzR2ejNWVGMyZGxwOFQrMGZhUXdOZU9LVG1B?=
 =?utf-8?B?UkRvVzc3U1IvWWdEWm5DS3liMWw2S0U3YlljdFVNUmdsdU5vN3FOYlpiVkRu?=
 =?utf-8?B?ZFM1UjNHMzM2YWNiOFl6dTZtRjh5LzM0SURsVUlPNXUxcWVqK3JkaFJHMU1B?=
 =?utf-8?B?MXV4Y1NFaG8zLzM3UFhGeER2dGljUUhHN0VGY3Y2TU1qRzFiNjdNRTdrWDFY?=
 =?utf-8?B?VDJaNTRJR1ppMnhxL0FwcGFPTmpKK2lJamRkcktKRlNWT3BTRHAxSEg3ZDBT?=
 =?utf-8?B?K3lzTWRybGd1dXpuSWlLTURvUXpSbkQvNlBnUlZYY0w4cWpXcW94Z1V5ZTNH?=
 =?utf-8?B?QWdub0ZwbWY2eklXdkE4cmdYcFplMWZKSWh0VVNVQ2s2Z2Z2MGQ1UFVvNEF2?=
 =?utf-8?B?bjRSMFFzbmhZSnNKQktzQlJ2NG1NS0xTaXpiVFJWNmR1dExjdVNYZUpjQ1dZ?=
 =?utf-8?B?d1o4NlQyNEhPMEpLT1RPREJPQis3THB0YzdQYWUyR0VVaFUxMU9nY3dmaXlh?=
 =?utf-8?B?aVJQT2YrQXd0Z1huOWxhZTNrbElRSmd2NFdEc3BPRkp6aTBBZjlNS3l5WlBq?=
 =?utf-8?Q?pZAhzDzbY2xrIK86e97J++2PP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a24b25-36fa-491a-5523-08db1b1857f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 12:19:17.3389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57VOU8WlMbIZECb2jJFSctbQBdutiJHFBYOauW7IpY25gPqbtBaMxKlgbE5v/QjFzvTxJGwJCs51UYVcm9kLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Provide support for this insn, which is a prereq to FRED. CPUID-wise
introduce both its and FRED's bit at this occasion, thus allowing to
also express the dependency right away.

While adding a testcase, also add a SWAPGS one. In order to not affect
the behavior of pre-existing tests, install write_{segment,msr} hooks
only transiently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Since I was asked to post this work, I've rebased it ahead of most other
emulator work I have pending, _except_ "x86emul: a few small steps
towards disintegration".

Instead of ->read_segment() we could of course also use ->read_msr() to
fetch the original GS base. I don't think I can see a clear advantage of
either approach; the way it's done it matches how we handle SWAPGS.

For PV save_segments() would need adjustment, but the insn being
restricted to ring 0 means PV guests can't use it anyway (unless we
wanted to emulate it as another privileged insn).

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -235,6 +235,8 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
+        {"fred",         0x00000007,  1, CPUID_REG_EAX, 17,  1},
+        {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
         {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
 
         {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -190,7 +190,8 @@ static const char *const str_7a1[32] =
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
 
-    /* 18 */                [19] = "wrmsrns",
+    /* 16 */                [17] = "fred",
+    [18] = "lkgs",          [19] = "wrmsrns",
 };
 
 static const char *const str_e21a[32] =
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -326,6 +326,7 @@ static const struct {
     { { 0x00, 0x18 }, { 2, 2 }, T, R }, /* ltr */
     { { 0x00, 0x20 }, { 2, 2 }, T, R }, /* verr */
     { { 0x00, 0x28 }, { 2, 2 }, T, R }, /* verw */
+    { { 0x00, 0x30 }, { 0, 2 }, T, R, pfx_f2 }, /* lkgs */
     { { 0x01, 0x00 }, { 2, 2 }, F, W }, /* sgdt */
     { { 0x01, 0x08 }, { 2, 2 }, F, W }, /* sidt */
     { { 0x01, 0x10 }, { 2, 2 }, F, R }, /* lgdt */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -666,6 +666,10 @@ static int blk(
     return x86_emul_blk((void *)offset, p_data, bytes, eflags, state, ctxt);
 }
 
+#ifdef __x86_64__
+static unsigned long gs_base, gs_base_shadow;
+#endif
+
 static int read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
@@ -675,8 +679,30 @@ static int read_segment(
         return X86EMUL_UNHANDLEABLE;
     memset(reg, 0, sizeof(*reg));
     reg->p = 1;
+
+#ifdef __x86_64__
+    if ( seg == x86_seg_gs )
+        reg->base = gs_base;
+#endif
+
+    return X86EMUL_OKAY;
+}
+
+#ifdef __x86_64__
+static int write_segment(
+    enum x86_segment seg,
+    const struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
+{
+    if ( !is_x86_user_segment(seg) )
+        return X86EMUL_UNHANDLEABLE;
+
+    if ( seg == x86_seg_gs )
+        gs_base = reg->base;
+
     return X86EMUL_OKAY;
 }
+#endif
 
 static int read_msr(
     unsigned int reg,
@@ -689,6 +715,20 @@ static int read_msr(
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
 
+#ifdef __x86_64__
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base_shadow;
+        return X86EMUL_OKAY;
+#endif
+
     case 0xc0000103: /* TSC_AUX */
 #define TSC_AUX_VALUE 0xCACACACA
         *val = TSC_AUX_VALUE;
@@ -698,6 +738,31 @@ static int read_msr(
     return X86EMUL_UNHANDLEABLE;
 }
 
+#ifdef __x86_64__
+static int write_msr(
+    unsigned int reg,
+    uint64_t val,
+    struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base = val;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base_shadow = val;
+        return X86EMUL_OKAY;
+    }
+
+    return X86EMUL_UNHANDLEABLE;
+}
+#endif
+
 #define INVPCID_ADDR 0x12345678
 #define INVPCID_PCID 0x123
 
@@ -1331,6 +1396,41 @@ int main(int argc, char **argv)
         printf("%u bytes read - ", bytes_read);
         goto fail;
     }
+    printf("okay\n");
+
+    emulops.write_segment = write_segment;
+    emulops.write_msr     = write_msr;
+
+    printf("%-40s", "Testing swapgs...");
+    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
+    regs.eip = (unsigned long)&instr[0];
+    gs_base = 0xffffeeeecccc8888UL;
+    gs_base_shadow = 0x0000111122224444UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[3]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         (gs_base_shadow != 0xffffeeeecccc8888UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing lkgs 2(%rdx)...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
+    regs.eip = (unsigned long)&instr[0];
+    regs.edx = (unsigned long)res;
+    res[0]   = 0x00004444;
+    res[1]   = 0x8888cccc;
+    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[5]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         gs_base_shadow )
+        goto fail;
+
+    cp.extd.nscb = i;
+    emulops.write_segment = NULL;
+    emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
 
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -86,6 +86,7 @@ bool emul_test_init(void)
     cp.feat.adx = true;
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
+    cp.feat.lkgs = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -744,8 +744,12 @@ decode_twobyte(struct x86_emulate_state
         case 0:
             s->desc |= DstMem | SrcImplicit | Mov;
             break;
+        case 6:
+            if ( !(s->modrm_reg & 1) && mode_64bit() )
+            {
         case 2: case 4:
-            s->desc |= SrcMem16;
+                s->desc |= SrcMem16;
+            }
             break;
         }
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -593,6 +593,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2890,8 +2890,31 @@ x86_emulate(
                 break;
             }
             break;
-        default:
-            generate_exception_if(true, EXC_UD);
+        case 6: /* lkgs */
+            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2, EXC_UD);
+            generate_exception_if(!mode_64bit() || !mode_ring0(), EXC_UD);
+            vcpu_must_have(lkgs);
+            fail_if(!ops->read_segment || !ops->read_msr ||
+                    !ops->write_segment || !ops->write_msr);
+            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                     ctxt)) != X86EMUL_OKAY ||
+                 (rc = ops->read_segment(x86_seg_gs, &sreg,
+                                         ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.orig_val = sreg.base;
+            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
+                                         ctxt, ops)) != X86EMUL_OKAY ||
+                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                      ctxt)) != X86EMUL_OKAY )
+                goto done;
+            sreg.base = dst.orig_val;
+            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                          ctxt)) != X86EMUL_OKAY )
+            {
+                /* Best effort unwind (i.e. no error checking). */
+                ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
+                goto done;
+            }
             break;
         }
         break;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -281,6 +281,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
+XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*   WRMSR Non-Serialising */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -295,6 +295,9 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # FRED builds on the LKGS instruction.
+        LKGS: [FRED],
     }
 
     deep_features = tuple(sorted(deps.keys()))

