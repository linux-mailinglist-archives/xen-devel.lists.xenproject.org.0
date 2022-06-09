Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A265450EA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 17:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345582.571250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKCZ-0005Kb-BZ; Thu, 09 Jun 2022 15:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345582.571250; Thu, 09 Jun 2022 15:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKCZ-0005I7-81; Thu, 09 Jun 2022 15:36:03 +0000
Received: by outflank-mailman (input) for mailman id 345582;
 Thu, 09 Jun 2022 15:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzKCX-0005I0-HV
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 15:36:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf580c2-e809-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 17:36:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB3964.eurprd04.prod.outlook.com (2603:10a6:5:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:35:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 15:35:58 +0000
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
X-Inumbo-ID: dcf580c2-e809-11ec-8b38-e96605d6a9a5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpunpDOQDSuxpxbZA2XxgAuYRDSd/o6mpjpm1Ce/FFwODXgGm4XKDF82+/MQgVQeXMbX13RFu969XUpiDusLoSejCX3QlcDHJ3uAgFNwFXthoO7noSNG3O+tZ1ZTOy4N5UcC0qNNrzYHRKnOvdFUyl+Fz2GkxJa1Fyv04g+JxHCpmqjVB+vKBCbiaNxaOLOZSltYrKaTx24Qzagl6FkLkCOubK5KdjSohzh9UoNKwOluQ6nrkeZwWQKHG4/lpIevZr86ulsM1MaNziUDwiS8h9h5hkMLucn6yMldFKlArjueFVee7A53vzVEYTOWMpTYyn+OZ6viST1v7loegBZd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1K2KdFrhuJ8M4BNNSE8D0OJPk9QvO1yEUUoAbUs8YU=;
 b=Lb2hjNo8jfzeVzy9zzCJKLAA9HTpHAF7By+0urFUsEOP8LIBg6MVDvQAQB58aAXXC6rU/XT+RZrnYlfG5t8aL1mJGkG1XwODvxBoy9FGAloq2Zshp99y2YhXkZydJYsPJOY+JF0xd7RcoxMUgUwnTcZiK3V5cy6+Q+9WVBFMI4MSh/Ks0ElM3HAGxT6ZRT4gMvS80FzbNxIwF6Lt8JiOTkJyI8NTrBTdR4ujpLUW1AL7Gnh/IbjMsDoLRHJWyFaCmqivGUJbgtZUERIO0zjKbebUIqIFllcWzRpGyqlsdf/LUldGOmWPDudMmW2ekscjaG2B8WrkKvu7yfoLssglhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1K2KdFrhuJ8M4BNNSE8D0OJPk9QvO1yEUUoAbUs8YU=;
 b=PsHzWgtU17HpTbIm4+QODtIif9bTeKvV7C+C18aYlR1en+yihxNy2a43FxdcADY2wR5rrvFiBsM7PBXQSFoxgCtv9pRWIsCpSBYUhFD4AD/ZutthOVsMigkeafc/0gPQ4uSQfjs8ZbBhY5iBzTDz7jj3Li1mgU/ntBsmgvca/vsPZNZ2DstqKCQyiNS6cS9ONNBONznXTcDI+p8SRohToVkk+4frx8X0cUV0Cirk/kNUg3Q9tki/WSCOYXW1x2ZCQjUpaZdQg18K+wk7ZXiTBz66vL6dWAQLybn40PLuVTJLZnReMvYnvXf3xjZedDUXck5JfR/EzEml+fkKrO01mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e90402d6-0ea9-b977-1c1f-b3ace4e8f107@suse.com>
Date: Thu, 9 Jun 2022 17:35:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86emul/test: encourage compiler to use more embedded
 broadcast
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0347.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84995aac-7a46-49bd-d5a7-08da4a2dc009
X-MS-TrafficTypeDiagnostic: DB7PR04MB3964:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB39643333CCDF183ACDEB7DF7B3A79@DB7PR04MB3964.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tl2bVwMMX4bwi4WBEks0QZKJ8vv7nNhLHB6AbJywO8449ar5OzqQv4iB5QrgMM/i11begWbH7HR3EXOrBvOhZtZuSBH9ouL9zRmS9enRa7NTj0L+EdDAW+oImHXh2bZDC6xdWFB8mw9jgO15jEB1odUMBV9ZaLUeA26uDljQ3BvpERyizwH+KBCRX7mTSTQzLSZomcYC/WINM8Tt7AyWGsbglXYocrb95s8TIMrjXe0if2kh4EBGUxNyHTkC8Mja6p81kEkwi510iPMex131u6KIM9uwvJ6zpLvtUEfqQe/YBACKrC/uLN30NsYz+ZiC7xlA7RiL6FA6nLx4eWpBMqeE6y1XYzGCee4y8A16XotZZLSZS5s9PhDMKkCgT53cD2EzBzqYsdteu8KEoStUQ+7N8yLlWQjalU5lg/HE+SLd6GEeE4KRs0ef/QHUHsUysNwQJIfZv/fsclE89hHwaTB6PQVL5dMRR/TyTLb2xb+Y4aaXf33w2mgSMvBglMCmOXImAlmWvJdYbvVxkcmE3nLctC3hf8e04Ur20S4W1YA6/Lht+4mTyS1gOWPq0ib8ekmIQ3oODYlHIhukKudPouKWeUfqKbXI7CZ99dfmxSz8R32f/YoxU1I+JhziZBN0XPDO7TVMl/G+aM+QAwK5G8wa+b5vO8uEcEfHLVAKXHlF505MtjaPr+eu9I3Bi3OFUJOtsUs18Qzdne/52KPijUofBBp4qw3qtP/XPiRI2BiYGZfx0r2dRdtZ0cOviDmk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6506007)(6486002)(2616005)(6916009)(54906003)(186003)(316002)(8936002)(38100700002)(31696002)(36756003)(86362001)(508600001)(5660300002)(4326008)(8676002)(6512007)(66476007)(66556008)(26005)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktxQUQ0cktINmhiYThrRE4zeC9JMkJVSk1NeVlaUHZoaFV4QXdMZGNBUVBP?=
 =?utf-8?B?Y2VTTUJqSHhiRGJJSWZFazkvZUl1U2tqUWtZU1JKU2h0dlViUkpWbm1JVG1S?=
 =?utf-8?B?RXNvci9iaFNDMjE0VllxVjc3UTB5RTFTaXRPczQweVNmRjBqSTkzR3JiWS91?=
 =?utf-8?B?N21NYlozb0FDZGFhSkpEeWNXNnBHNjBHaXRlZWlCY1I5dDY2anRRWFZ0ZXBT?=
 =?utf-8?B?MTUyQjdSKzAzK0FDM3Y2WXM2UkJkRjhiaGFnUGR0azZseTB6V1dzY2o4UzNX?=
 =?utf-8?B?aVVZMnl3ZUdWeVpTclpqK1V5WFl1ZmR5WDR6UkZiSGZlSUsvazd4VG04L1lO?=
 =?utf-8?B?Zy8ycVUyRVN5ZEMzUjZWeTN3cm1ER0YvYjJha2tGd2pINmFhZk8xREgrS3pP?=
 =?utf-8?B?MUpFSTYzTm96SUUweThWMVdWNG42ZTZyNWZKM0pUL2NwemNpNi9tWGEvRWtD?=
 =?utf-8?B?aW9iY0F1Y2l0Y1hJWFEyNHJUM1ZTN0NudGhZaDc0VnhlendNdEdEeENlak5r?=
 =?utf-8?B?UEhpbjFHWVYyMzJ2N1g4TlNPZVlkMWh3ejVDeTRlR3ZDdGZnQk9XK1BwTVBX?=
 =?utf-8?B?MUxFUDFTaHRtRFJ6dlFVVTdaekpvS0VrZk9LT0twWmhGcVh2NFBXRno2cTZY?=
 =?utf-8?B?eFphSE5tMzFOMFAwZDNORFdnbVRGdTZWVEhCM0FlQXlmaTlVRzJTd2NjeWMy?=
 =?utf-8?B?WjVFcXNaWlo0NEQ4eHdqM1ZkYmE2V2xBUzBiOFNtamFrV1lJblFtVlZMWjIx?=
 =?utf-8?B?SHhMd3VGSmhjOFdXUnNHdjlmNzA3cHo2YjNCYzgyRzRjMFpaSis1L3NKSGtw?=
 =?utf-8?B?eE5pS3ZLSUhkaVR4dzFiYjM4SlVyakNpK0R6SkFadzVnNVhueVp5UjMzOCt6?=
 =?utf-8?B?VDl3d2MzZXRMWWxHSTFzY0NjRzI1djdKQVZBck9FbVNQMW9EcDl0UDZJYVpo?=
 =?utf-8?B?UEx1cHdVNE9vcHgvTmFWNm5VVm1jNVJSRVdiRFlKY1FXVnpWT3dLYko3TVZ0?=
 =?utf-8?B?WHNvMTdiWDVFd2tlUDVyZElCZ3B2SW1IYzE0S0hxcGo0KzBadk4vZk50T3I0?=
 =?utf-8?B?TFZGSzhMaVJ0Skxob3Q3WWhhcms4THNWaDFSY2Y1SXJzT3hPaGQyZUUxM0Vk?=
 =?utf-8?B?d2tlTk1jZWJsSnBXbUdwelNuM2NFVVJab2tpd0hXdkVLZVhJZ0RwZ1ppNG1u?=
 =?utf-8?B?b2Z5TFdyV1k4dXpaQXBrN3crSmtXZ1VhNVZ3dWt4cURGK1pLaXo1VmFPRW93?=
 =?utf-8?B?SEFrOUU0cG8xdy9NQU1JdEttY0tsN2oraTFyeGdCMXpoOU45RmVuNlFEUmVi?=
 =?utf-8?B?VzgybWsxWG45VmZLdHFuRE5nZkFteGNQZFpuUERhbGFuYTQ1bmJmeGt3VlZD?=
 =?utf-8?B?M29mczc4VmV6Q2FMTTQxNHVPbGVNOFVLRHljRWJuaTYyWEpGN1NwZlBXRnhx?=
 =?utf-8?B?WUNzdFRTa2hvK2NpTy9VVUpHaDVWUDhIdml0KytuOVZYTGVUUUI0OFJ6VTBy?=
 =?utf-8?B?REdCcXdxOWlxcFc1RjBVeUdyK2RDbHJlakI1TzU2WjJEY25DRmhRT2FKajJv?=
 =?utf-8?B?MVhXRGhCR3VOUEZ6SVEvMEpaa3VRcS94Yzdkdm4rMUUvWUM1NDlqQjBsM0RX?=
 =?utf-8?B?QzZMUTlDdUkyVDNhQ1czbFNrVDdmV21OUUJXaHorK1BzYldCV1J4b3AxSHJt?=
 =?utf-8?B?cGVxeGdDcytRMGFsNVJ3UUM2bkFlTDhVZGFKSE0vYWFFSWpFVCtLd3huUG9n?=
 =?utf-8?B?WGhHWjIwZzEyNHlmeFI1V0NRWkJhQi84RzhEK1N6R01SNDh1enBMcXNQR1hD?=
 =?utf-8?B?Q1c0cmdHb0lzMU1PdUdCNjVOZVprQlpITjBaeDNLYThyMG9UZmw1T1hnTHpH?=
 =?utf-8?B?VjBZYUhiNUJVRXNCU2Z5RytraEJQRFV3WUNwdG5CUlJ0dWJYdDd3VDJJRk40?=
 =?utf-8?B?Rmt3RGZxZTJXZlhndklnSTZYV3Z5cVBkVmIwTEtXUlEyclUycG9DMkxrNDJs?=
 =?utf-8?B?SmJVblprYmdqVHBHVEZwMFU0UndUanZWVFJFb0ZvTjM3cGlDZkY0cjFwbWpL?=
 =?utf-8?B?WlNlM29aOXRkVzc4UFEydU1yNGNuRHRQOGl2ZlhlK3QwbTZ4RzFHN0FzRC9T?=
 =?utf-8?B?QVNtaWVTSXdLdEtOV2xzNHR3SjRtb2taK3I1VGh1bGs0WC9IS0UzWUMyVDNG?=
 =?utf-8?B?eXZOMzRCRjgyRkpMRGxuSUZwQ0ZiRlZzZWw4RlVrcVM1eWFDMnUvMHZ5T3F1?=
 =?utf-8?B?QTUwTHl2aXNYOE54emwwSngzSmJyQUF4UGMxZVdYa1BrMXNYVUh5TDRaQm5R?=
 =?utf-8?B?bkd2UkdMWWtUM3JDZCtIOWFWZzlVNkUySjI2RkxGeHRySCtGT2I4dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84995aac-7a46-49bd-d5a7-08da4a2dc009
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 15:35:58.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOQVKSh9TlJTqX05Cb9gEHD5t7Y6byqQofXvT5WmU0x8T/OSP6nTtAc799+ZRnLaPZQWS+D+kZf5y8cAxQ2IYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3964

For one it was an oversight to leave dup_{hi,lo}() undefined for 512-bit
vector size. And then in FMA testing we can also arrange for the
compiler to (hopefully) recognize broadcasting potential. Plus we can
replace the broadcast(1) use in the addsub() surrogate with inline
assembly explicitly using embedded broadcast (even gcc12 still doesn't
support broadcast for any of the addsub/subadd builtins).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also alter addsub() surrogate.

--- a/tools/tests/x86_emulator/simd.c
+++ b/tools/tests/x86_emulator/simd.c
@@ -912,6 +912,13 @@ static inline vec_t movlhps(vec_t x, vec
 })
 #  endif
 # endif
+#elif VEC_SIZE == 64
+# if FLOAT_SIZE == 4
+#  define dup_hi(x) B(movshdup, _mask, x, undef(), ~0)
+#  define dup_lo(x) B(movsldup, _mask, x, undef(), ~0)
+# elif FLOAT_SIZE == 8
+#  define dup_lo(x) B(movddup, _mask, x, undef(), ~0)
+# endif
 #endif
 #if VEC_SIZE == 16 && defined(__SSSE3__) && !defined(__AVX512VL__)
 # if INT_SIZE == 1
--- a/tools/tests/x86_emulator/simd.h
+++ b/tools/tests/x86_emulator/simd.h
@@ -49,8 +49,10 @@ float
 # define ELEM_SIZE FLOAT_SIZE
 # if FLOAT_SIZE == 4
 #  define MODE SF
+#  define ELEM_SFX "s"
 # elif FLOAT_SIZE == 8
 #  define MODE DF
+#  define ELEM_SFX "d"
 # endif
 #endif
 #ifndef VEC_SIZE
--- a/tools/tests/x86_emulator/simd-fma.c
+++ b/tools/tests/x86_emulator/simd-fma.c
@@ -56,13 +56,27 @@ ENTRY(fma_test);
 #endif
 
 #if defined(fmaddsub) && !defined(addsub)
-# define addsub(x, y) fmaddsub(x, broadcast(1), y)
+# ifdef __AVX512F__
+#  define addsub(x, y) ({ \
+    vec_t t_; \
+    typeof(t_[0]) one_ = 1; \
+    asm ( "vfmaddsub231p" ELEM_SFX " %2%{1to%c4%}, %1, %0" \
+          : "=v" (t_) \
+          : "v" (x), "m" (one_), "0" (y), "i" (ELEM_COUNT) ); \
+    t_; \
+})
+# else
+#  define addsub(x, y) fmaddsub(x, broadcast(1), y)
+# endif
 #endif
 
 int fma_test(void)
 {
     unsigned int i;
     vec_t x, y, z, src, inv, one;
+#ifdef __AVX512F__
+    typeof(one[0]) one_ = 1;
+#endif
 
     for ( i = 0; i < ELEM_COUNT; ++i )
     {
@@ -71,6 +85,10 @@ int fma_test(void)
         one[i] = 1;
     }
 
+#ifdef __AVX512F__
+# define one one_
+#endif
+
     x = (src + one) * inv;
     y = (src - one) * inv;
     touch(src);
@@ -93,22 +111,28 @@ int fma_test(void)
     x = src + inv;
     y = src - inv;
     touch(inv);
+    touch(one);
     z = src * one + inv;
     if ( !eq(x, z) ) return __LINE__;
 
     touch(inv);
+    touch(one);
     z = -src * one - inv;
     if ( !eq(-x, z) ) return __LINE__;
 
     touch(inv);
+    touch(one);
     z = src * one - inv;
     if ( !eq(y, z) ) return __LINE__;
 
     touch(inv);
+    touch(one);
     z = -src * one + inv;
     if ( !eq(-y, z) ) return __LINE__;
     touch(inv);
 
+#undef one
+
 #if defined(addsub) && defined(fmaddsub)
     x = addsub(src * inv, one);
     y = addsub(src * inv, -one);

