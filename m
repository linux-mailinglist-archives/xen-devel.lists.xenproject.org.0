Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB14698E0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239102.414454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExb-0003YK-Az; Mon, 06 Dec 2021 14:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239102.414454; Mon, 06 Dec 2021 14:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExb-0003UN-4x; Mon, 06 Dec 2021 14:27:19 +0000
Received: by outflank-mailman (input) for mailman id 239102;
 Mon, 06 Dec 2021 14:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEoO-00043L-AX
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:17:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49541680-569f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:17:47 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-t4lefXQdOmeyXvzdf7pBvA-1; Mon, 06 Dec 2021 15:17:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 14:17:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:17:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:20b:b2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Mon, 6 Dec 2021 14:17:42 +0000
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
X-Inumbo-ID: 49541680-569f-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCgwMX/P2r3dO1pV7Q9gj9sxLbIsHw+iCcJmAXUNoHc=;
	b=iENc5wEgYrnLdoQXins0weQ2ufbBFDuHMf8x+uFLwm59/1NunW3zeWzcy4Mh+vyn8dJKcQ
	OdbWgkAdIF7iOUIuyorQKfhnvPGuk+Eul+v9tSV772FLRbNNiJQSIp9gNnehnr+EOcVfx4
	aUxkYpSRlCxbh+nt3uGMldnaZ/rXe4s=
X-MC-Unique: t4lefXQdOmeyXvzdf7pBvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyS7k/UZxW+J6allgJCLFypcoBUz0aIcsK20irNRJw2WRQ1f5YFsYg2J3KMOZABB7QcJVRJiPYDWSuBhMWzycSO0SAzSL0Dsp/YLolLreC9IcMvDPt74xEouv3/I58lLq/i+onoH7l41rSmmLLCwRoSXqw4OO/cFBHMZgaAgDfYkCj+5ZjbO4En4lnGGBwBJyikdttgpxFJ+ydLMx8zi5QXkZ2q9FzdTFevA40qaUO1uQU657R68jGkvNc4FvL1reTvIH9tMeNmulgX1Z09e+jJvSbzNanZJNa6L9m+GbFI+SVm4ucIFTKDHBiPsn01aj27KT0DDVOWxiZrlzAe9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCgwMX/P2r3dO1pV7Q9gj9sxLbIsHw+iCcJmAXUNoHc=;
 b=NTKPL+yM3t5XHckJPP8SYkro39ZclmrVt9cRRsVAlBenNC+2LGs2t+Bl/W/AtM4+92Sq8jDdcj5pddRbsjEk++6hRHqXop8XohsNMulU+WaIQa27JzgBkFyQtNsapJ7oQ7+Gox3lJwBDE/GnAfs2Zm9juXFlz7FgPq9Z/chJ8UJoWsXcLsJv0vHM5OAl5uHXUJV0jAFUKkxCZInXYo7B46QboVc6mtZ+Xz3PDSFLWjwIl+zVxlw+VU146TJny1ogN+beznbtaDgvG27gyRi4sosp4+uE0Na165eSqbOHkOPPUBK+4kAOsSm8sn6MokBDCKBMngzfNkIKYU54VA/38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53325a1b-8777-0a4f-a334-b967662ec839@suse.com>
Date: Mon, 6 Dec 2021 15:17:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 2/7] x86/boot: obtain video info from boot loader
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0006.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f5b9ca-ab7d-4963-3558-08d9b8c32b1b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377402EC80E9EC3F9C00E784B36D9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BZax0OFq0NJtjfgHMsgjBU0kJFftiMv9PlhmapIEkvsCMrmoLJFNCOZdDdLu244OW5lrIiSlfeJ/VNh0RitAX6xs/tmwQBzOGroczHXlQ51Z7A8Gc64BGYrNyrtoVsHxslwYhplGxYHEDpHbPZbhZTAWz72zv8WzLX2oCZAYJHm/Zw/RR+RSqPevdgO7XDhA4UdQzu0OOFMCz+u+VVQZXQMdFM1TkVIZdhcHOUcNsuUcaNJcvAE0qpW605u3CiW952uD+eMzt5HC/Sx3vI+XkFrtSeHEbTxSqK9Sy0uxOQn6yQ41U5cWW4cS9trxiyzrYxD49NPE5gcM/AjDLLR2Krqva/vZMfutV2Luo5YkP4BPGvlS62k5NCetaLm/rsNB0YwH+X7uCFQCPvur2pareoKnREsU8yBaIoszU4ljtfMEVExKQ4wxVBxY4YJysd+O7TrG8uK5FmcqFYyK9s2SWkpSKH1WnXva7tlRggzDvgPL2GgLhxmAlAPLq5GSniDD3kM2s8RhzVgJrtKDbNLbDg3AUQdjezbNMxqJoGNsDe+6b7+QzgTSw+Vsdc3DgneALTpzzc2tENLSUuN3R+2DaOa4jEsUcc/A+IrkNydII3GnKCiusRPQvOnYrZyqeYn/MWgST0RhLCtMGoiNqAtVswr+Uq7NI3Nz/YsKHMb0MgTClfbxpcIE+kXdb4R+KhRQ6/qnTKCiR2AC5p/3IF1orA5OTmexZzopMcAPo5BGjdU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(66476007)(66556008)(66946007)(8936002)(31696002)(508600001)(31686004)(6486002)(8676002)(6916009)(956004)(5660300002)(186003)(54906003)(2906002)(36756003)(16576012)(316002)(2616005)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC83OUdraSsvMUtiVUlvakNVQUtuTG9uRHJTVVVRb2lIbmxGTTdkZVh3bWd1?=
 =?utf-8?B?aXErd2ZnVWxSbmdjMitlemNYT0lxQzcrbCtnRnZtOWlRUGFrZW1Xd1dEY0dW?=
 =?utf-8?B?a0hxK3NFc1VZZGpIZFRYWkRpTkE4WHYyU1NtSzBpRm9veVoxbExMblBDeGVy?=
 =?utf-8?B?SDlMa25kZDVNamIzYlpMUmQ1Nno0VDRTZnBEWWozWWJJWmtIMWM1akFBSnFD?=
 =?utf-8?B?TExnbVk4bjFOZFhJM2huNzJnYy9aeTJub0Uxd2hxL0szelVoVkVHSHYxaDdP?=
 =?utf-8?B?VnhBTG5KcWlpNFVLS1Y2c3g0bCtLaVl1SXFCY1d6WUhYR1ZVN1EzcXNVVkQx?=
 =?utf-8?B?ZmhnTWZsNThzNmFhS3NqbHQxdml6bHQ3eW10bWpYODlyMTZuU1dCZTM0Uy9N?=
 =?utf-8?B?RHNvQ0w4MWtRRG5paXRWVW9TR0I1M0l5dTBMakxucGVWUEJ6U3NCUW11cWdj?=
 =?utf-8?B?angxSVdiano2cXNFcmkwTjFnRGpmem5QdHVZSUM1YVh6OExTYmRBNXZ6V29M?=
 =?utf-8?B?akgrUUQ5UXlUOWFlSDVYVG9xa3RwdXdKUXFJcnIzVGV3aHlHZnc3Sm9nenR0?=
 =?utf-8?B?aDdwS2s1NHQwd0EwYzRWYVlRRU1JY0ZXbVZFeUtueG1xMVB2VmVaQXZZRFlk?=
 =?utf-8?B?MVpoZ0l3RlJXdHNpVmZmaTI2MFZhM29xL3ZjRXdLSjVsVENBNDhYN0lwTTRD?=
 =?utf-8?B?WndTeWFiWU5LZXkwb2lGZk9uazdncEZrWGdmSjFscENYeFRyeVlHMG14eTRw?=
 =?utf-8?B?MnU1eHpLUHczeitGVGZaTEVsaTBKRnhhaVkvWGNQRDBCeDJxSW1yMkRTdlNo?=
 =?utf-8?B?eGlKZVNYeC9kSXpzbnlXek81N01Zei8rL3BsT0dFZ2hFa1RmVTNDSzJmckZs?=
 =?utf-8?B?bitieExvQzZkaVY5TnFMRWhBR2VINzd4ajcrSGEzYzJxYklGNGV6L0N0d1JG?=
 =?utf-8?B?Qmd6WUVISFlnSU1SSXA4d3lDK212NFFZelZueGxBZHgrcXgralN6VzhNOW9k?=
 =?utf-8?B?MUtRUWk1bmlhcFpJcGM5N2psTVJHc2R3ZjZXZm55cGN0aDF1REtpcXZkVUNP?=
 =?utf-8?B?Y25nK3FFT1NxZWxjL3JmMTJMMFlaYndCRnREeWZjK0R2QXcvdGN0MjVUaFR3?=
 =?utf-8?B?NllLSnlIMXMxeUc1Q0xjRTQrNklmV0U0eDBtQ1FaVU1YeTRSQnJzeVg2Z1VJ?=
 =?utf-8?B?ZkpWZkJQZGxGOVA2Vzc2eGpQcTU1UEd3RzVkOXNCOWpDeC9TTTlhRmp0WkZZ?=
 =?utf-8?B?RDc0TFdjQ1ZQU09PR1lEQ0EwaVY1ckl3L0RpTHBha0k5ZFp5ZDBMbWdSaEli?=
 =?utf-8?B?TnNvNFNFbXBmQmt0NkJBRFlDc1Era053QnZwa0pHTFpHU2FTWFVoQXVqd0dx?=
 =?utf-8?B?aGpqdGhFbS8xVGZTS0hnK0x0NlhSd3BEc0h3eitxaE1qdVZRSXdaUUlobnFD?=
 =?utf-8?B?cDRmLzR1VTBrU3ZzekU2TFA1MjBaUzFyNS82TnVNWWpwRE5yQVBkWWlUY2RB?=
 =?utf-8?B?Q1lBSGxrL25SakJIS2t0U00rNkdYVkwvNzZpaklHbXQ4MllCQUk3ZTRjWEZV?=
 =?utf-8?B?N1RoempmVjRUVXU0WkJzV1RUYTBtOUU0SnN6c0NPOFdicHl4MWUwcWVHNnYr?=
 =?utf-8?B?VUZCL0RCVmlYcE4wRXplNUZWbG5pYkExSTQ5RzNCWG85RTFQUUpWYzFkb0F3?=
 =?utf-8?B?SytHQVdYdjRXMHpDZmFldDl2QUgrK2laKzFNQlRBUUV3Y29YOWZ5NDhlZDFv?=
 =?utf-8?B?bUd2RmxrK21HRXdoa2Jnam13dnlxMFp4R3lwVHc4bnJJUnEzVW9wY3lRWjJu?=
 =?utf-8?B?NG9idDdqSi91STZRY1NjRjEvQ05LNWcxbVpEbzkxcmN0YXl0c0pBUnNPL1A5?=
 =?utf-8?B?MHJhbUk3bndRT1daTVV0emJlcHRSSERaU3Y1TDJLb3hQWkJsQk1qQVYyYSs3?=
 =?utf-8?B?L2dBZUY2cDBlRk5yT1U3MCtpWEEwa3N1dmcvRGtOYUJmYnlaUnk4VEFSUjhv?=
 =?utf-8?B?SjBPdTQ1MkdQTHRQbDRUSDFMRDdQSi9jeWhSaERMck1WZk5sMm5yTzA0TWp1?=
 =?utf-8?B?Q1V4SlFmMGxwY0J6clZ0a3hoamJNYThVWTFZT2RxK09mY2xzTmEvV1pIMnNI?=
 =?utf-8?B?ZW1RRnhKcmNsWnRjdnN4TWR3dTF3T2hRK25kWWE3NnBLcG5tQnZNZ1k5V0E4?=
 =?utf-8?Q?Df3cGUFLrRjGuTDqI+/093s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f5b9ca-ab7d-4963-3558-08d9b8c32b1b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:17:43.2312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjqE855dXw2D5qDfUQC5qdVV/MtSB/Xk6xQjSuzUIcy1NUV81o5WZ5DCi+2pc05FcwW7nWaHts8ly1OOjeoQFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

With MB2 the boot loader may provide this information, allowing us to
obtain it without needing to enter real mode (assuming we don't need to
set a new mode from "vga=", but can instead inherit the one the
bootloader may have established).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base.
v2: New.

--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -6,7 +6,7 @@ CMDLINE_DEPS = $(DEFS_H_DEPS) video.h \
 	       $(BASEDIR)/include/xen/kconfig.h \
 	       $(BASEDIR)/include/generated/autoconf.h
 
-RELOC_DEPS = $(DEFS_H_DEPS) \
+RELOC_DEPS = $(DEFS_H_DEPS) video.h \
 	     $(BASEDIR)/include/generated/autoconf.h \
 	     $(BASEDIR)/include/xen/kconfig.h \
 	     $(BASEDIR)/include/xen/multiboot.h \
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -53,6 +53,7 @@ typedef unsigned int u32;
 typedef unsigned long long u64;
 typedef unsigned int size_t;
 typedef u8 uint8_t;
+typedef u16 uint16_t;
 typedef u32 uint32_t;
 typedef u64 uint64_t;
 
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -562,12 +562,18 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        mov     sym_esi(trampoline_phys), %ecx
-
         /* Get bottom-most low-memory stack address. */
+        mov     sym_esi(trampoline_phys), %ecx
         add     $TRAMPOLINE_SPACE,%ecx
 
+#ifdef CONFIG_VIDEO
+        lea     sym_esi(boot_vid_info), %edx
+#else
+        xor     %edx, %edx
+#endif
+
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
+        push    %edx                /* Boot video info to be filled from MB2. */
         push    %ecx                /* Bottom-most low-memory stack address. */
         push    %ebx                /* Multiboot / PVH information address. */
         push    %eax                /* Magic number. */
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -14,9 +14,10 @@
 
 /*
  * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - 0x4(%esp) = MAGIC,
- *   - 0x8(%esp) = INFORMATION_ADDRESS,
- *   - 0xc(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
+ *   - 0x04(%esp) = MAGIC,
+ *   - 0x08(%esp) = INFORMATION_ADDRESS,
+ *   - 0x0c(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
+ *   - 0x10(%esp) = BOOT_VIDEO_INFO_ADDRESS.
  */
 asm (
     "    .text                         \n"
@@ -32,6 +33,39 @@ asm (
 #include "../../../include/xen/kconfig.h"
 #include <public/arch-x86/hvm/start_info.h>
 
+#ifdef CONFIG_VIDEO
+# include "video.h"
+
+/* VESA control information */
+struct __packed vesa_ctrl_info {
+    uint8_t signature[4];
+    uint16_t version;
+    uint32_t oem_name;
+    uint32_t capabilities;
+    uint32_t mode_list;
+    uint16_t mem_size;
+    /* We don't use any further fields. */
+};
+
+/* VESA 2.0 mode information */
+struct vesa_mode_info {
+    uint16_t attrib;
+    uint8_t window[14]; /* We don't use the individual fields. */
+    uint16_t bytes_per_line;
+    uint16_t width;
+    uint16_t height;
+    uint8_t cell_width;
+    uint8_t cell_height;
+    uint8_t nr_planes;
+    uint8_t depth;
+    uint8_t memory[5]; /* We don't use the individual fields. */
+    struct boot_video_colors colors;
+    uint8_t direct_color;
+    uint32_t base;
+    /* We don't use any further fields. */
+};
+#endif /* CONFIG_VIDEO */
+
 #define get_mb2_data(tag, type, member)   (((multiboot2_tag_##type##_t *)(tag))->member)
 #define get_mb2_string(tag, type, member) ((u32)get_mb2_data(tag, type, member))
 
@@ -146,7 +180,7 @@ static multiboot_info_t *mbi_reloc(u32 m
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(u32 mbi_in)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -154,6 +188,9 @@ static multiboot_info_t *mbi2_reloc(u32
     module_t *mbi_out_mods = NULL;
     memory_map_t *mmap_dst;
     multiboot_info_t *mbi_out;
+#ifdef CONFIG_VIDEO
+    struct boot_video_info *video = NULL;
+#endif
     u32 ptr;
     unsigned int i, mod_idx = 0;
 
@@ -254,17 +291,64 @@ static multiboot_info_t *mbi2_reloc(u32
             ++mod_idx;
             break;
 
+#ifdef CONFIG_VIDEO
+        case MULTIBOOT2_TAG_TYPE_VBE:
+            if ( video_out )
+            {
+                const struct vesa_ctrl_info *ci;
+                const struct vesa_mode_info *mi;
+
+                video = _p(video_out);
+                ci = (void *)get_mb2_data(tag, vbe, vbe_control_info);
+                mi = (void *)get_mb2_data(tag, vbe, vbe_mode_info);
+
+                if ( ci->version >= 0x0200 && (mi->attrib & 0x9b) == 0x9b )
+                {
+                    video->capabilities = ci->capabilities;
+                    video->lfb_linelength = mi->bytes_per_line;
+                    video->lfb_width = mi->width;
+                    video->lfb_height = mi->height;
+                    video->lfb_depth = mi->depth;
+                    video->lfb_base = mi->base;
+                    video->lfb_size = ci->mem_size;
+                    video->colors = mi->colors;
+                    video->vesa_attrib = mi->attrib;
+                }
+
+                video->vesapm.seg = get_mb2_data(tag, vbe, vbe_interface_seg);
+                video->vesapm.off = get_mb2_data(tag, vbe, vbe_interface_off);
+            }
+            break;
+
+        case MULTIBOOT2_TAG_TYPE_FRAMEBUFFER:
+            if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
+                  MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
+            {
+                video_out = 0;
+                video = NULL;
+            }
+            break;
+#endif /* CONFIG_VIDEO */
+
         case MULTIBOOT2_TAG_TYPE_END:
-            return mbi_out;
+            goto end; /* Cannot "break;" here. */
 
         default:
             break;
         }
 
+ end:
+
+#ifdef CONFIG_VIDEO
+    if ( video )
+        video->orig_video_isVGA = 0x23;
+#endif
+
     return mbi_out;
 }
 
-void * __stdcall reloc(u32 magic, u32 in, u32 trampoline)
+void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
+                      uint32_t video_info)
 {
     alloc = trampoline;
 
@@ -274,7 +358,7 @@ void * __stdcall reloc(u32 magic, u32 in
         return mbi_reloc(in);
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in);
+        return mbi2_reloc(in, video_info);
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
--- a/xen/arch/x86/boot/video.h
+++ b/xen/arch/x86/boot/video.h
@@ -28,4 +28,45 @@
 /* The "recalculate timings" flag */
 #define VIDEO_RECALC        0x8000
 
+#ifndef __ASSEMBLY__
+struct boot_video_info {
+    uint8_t  orig_x;             /* 0x00 */
+    uint8_t  orig_y;             /* 0x01 */
+    uint8_t  orig_video_mode;    /* 0x02 */
+    uint8_t  orig_video_cols;    /* 0x03 */
+    uint8_t  orig_video_lines;   /* 0x04 */
+    uint8_t  orig_video_isVGA;   /* 0x05 */
+    uint16_t orig_video_points;  /* 0x06 */
+
+    /* VESA graphic mode -- linear frame buffer */
+    uint32_t capabilities;       /* 0x08 */
+    uint16_t lfb_linelength;     /* 0x0c */
+    uint16_t lfb_width;          /* 0x0e */
+    uint16_t lfb_height;         /* 0x10 */
+    uint16_t lfb_depth;          /* 0x12 */
+    uint32_t lfb_base;           /* 0x14 */
+    uint32_t lfb_size;           /* 0x18 */
+    union {
+        struct {
+            uint8_t  red_size;   /* 0x1c */
+            uint8_t  red_pos;    /* 0x1d */
+            uint8_t  green_size; /* 0x1e */
+            uint8_t  green_pos;  /* 0x1f */
+            uint8_t  blue_size;  /* 0x20 */
+            uint8_t  blue_pos;   /* 0x21 */
+            uint8_t  rsvd_size;  /* 0x22 */
+            uint8_t  rsvd_pos;   /* 0x23 */
+        };
+        struct boot_video_colors {
+            uint8_t  rgbr[8];
+        } colors;
+    };
+    struct {
+        uint16_t seg;            /* 0x24 */
+        uint16_t off;            /* 0x26 */
+    } vesapm;
+    uint16_t vesa_attrib;        /* 0x28 */
+};
+#endif /* __ASSEMBLY__ */
+
 #endif /* __BOOT_VIDEO_H__ */
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -519,35 +519,7 @@ static void __init setup_max_pdx(unsigne
 static struct e820map __initdata boot_e820;
 
 #ifdef CONFIG_VIDEO
-struct boot_video_info {
-    u8  orig_x;             /* 0x00 */
-    u8  orig_y;             /* 0x01 */
-    u8  orig_video_mode;    /* 0x02 */
-    u8  orig_video_cols;    /* 0x03 */
-    u8  orig_video_lines;   /* 0x04 */
-    u8  orig_video_isVGA;   /* 0x05 */
-    u16 orig_video_points;  /* 0x06 */
-
-    /* VESA graphic mode -- linear frame buffer */
-    u32 capabilities;       /* 0x08 */
-    u16 lfb_linelength;     /* 0x0c */
-    u16 lfb_width;          /* 0x0e */
-    u16 lfb_height;         /* 0x10 */
-    u16 lfb_depth;          /* 0x12 */
-    u32 lfb_base;           /* 0x14 */
-    u32 lfb_size;           /* 0x18 */
-    u8  red_size;           /* 0x1c */
-    u8  red_pos;            /* 0x1d */
-    u8  green_size;         /* 0x1e */
-    u8  green_pos;          /* 0x1f */
-    u8  blue_size;          /* 0x20 */
-    u8  blue_pos;           /* 0x21 */
-    u8  rsvd_size;          /* 0x22 */
-    u8  rsvd_pos;           /* 0x23 */
-    u16 vesapm_seg;         /* 0x24 */
-    u16 vesapm_off;         /* 0x26 */
-    u16 vesa_attrib;        /* 0x28 */
-};
+# include "boot/video.h"
 extern struct boot_video_info boot_vid_info;
 #endif
 
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -158,6 +158,59 @@ typedef struct {
     multiboot2_memory_map_t entries[];
 } multiboot2_tag_mmap_t;
 
+typedef struct
+{
+    uint32_t type;
+    uint32_t size;
+    uint16_t vbe_mode;
+    uint16_t vbe_interface_seg;
+    uint16_t vbe_interface_off;
+    uint16_t vbe_interface_len;
+    uint8_t vbe_control_info[512];
+    uint8_t vbe_mode_info[256];
+} multiboot2_tag_vbe_t;
+
+typedef struct
+{
+    uint8_t red;
+    uint8_t green;
+    uint8_t blue;
+} multiboot2_color_t;
+
+typedef struct
+{
+    uint32_t type;
+    uint32_t size;
+    uint64_t framebuffer_addr;
+    uint32_t framebuffer_pitch;
+    uint32_t framebuffer_width;
+    uint32_t framebuffer_height;
+    uint8_t framebuffer_bpp;
+#define MULTIBOOT2_FRAMEBUFFER_TYPE_INDEXED  0
+#define MULTIBOOT2_FRAMEBUFFER_TYPE_RGB      1
+#define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT 2
+    uint8_t framebuffer_type;
+    uint16_t reserved;
+
+    union
+    {
+        struct
+        {
+            uint16_t framebuffer_palette_num_colors;
+            multiboot2_color_t framebuffer_palette[];
+        };
+        struct
+        {
+            uint8_t framebuffer_red_field_position;
+            uint8_t framebuffer_red_mask_size;
+            uint8_t framebuffer_green_field_position;
+            uint8_t framebuffer_green_mask_size;
+            uint8_t framebuffer_blue_field_position;
+            uint8_t framebuffer_blue_mask_size;
+        };
+    };
+} multiboot2_tag_framebuffer_t;
+
 typedef struct {
     u32 type;
     u32 size;


