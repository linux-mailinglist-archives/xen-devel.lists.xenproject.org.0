Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5E40C659
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187605.336537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUuP-0006lB-L9; Wed, 15 Sep 2021 13:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187605.336537; Wed, 15 Sep 2021 13:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUuP-0006in-Gu; Wed, 15 Sep 2021 13:25:05 +0000
Received: by outflank-mailman (input) for mailman id 187605;
 Wed, 15 Sep 2021 13:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUuN-0006iX-Gp
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:25:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 546d14db-1628-11ec-b51b-12813bfff9fa;
 Wed, 15 Sep 2021 13:25:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-2zwv82RQO8y2_KMNFs9QPw-1; Wed, 15 Sep 2021 15:25:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 13:24:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:24:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 13:24:58 +0000
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
X-Inumbo-ID: 546d14db-1628-11ec-b51b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVFjmh6RimoQpMTq+9aSlOOru1h888tl/hV8Nfxcv+U=;
	b=UoI5eWcTEuPelH+UjG/6jBbt0/fjMQV7be6GXemrRrjeoFMMMiDmfxm4zS/q+Yo7KcdvJG
	O/7Q00yFsEPYnCAvgWCHFX7SUGQlhpVM26QTMoVhirx5N9T1rYIKlB0KtD/ZXOKrP/IP9H
	I99y5Nrx/IK+bL94b+Aqs8sDrWzQTQE=
X-MC-Unique: 2zwv82RQO8y2_KMNFs9QPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c10jtRtCSc/aamTWBhR/uKwKGjDpCtEy7tA/aT8/f0t4I7XIBZ4ccs/DnJwxcSCCu/K232fsVOXCPNizv4V3pfBfOsLgfKxrNQQkL5zv4y2K9XM4FLt15rVUgZJX56e4xO8GsIz11ZCz8ccOfqoXuC94bm4jmd5oqfl/Qq9T8lUc+dRh+Z5X927S3/bNawVXWwGNsbSRUneTvpnb9xkA4n4RJnrAWUlUVpbo6Cc4kkLzKjEm92T9jXM7MOZNBueXlxQOd74uhCmreQrUVdEJ/RLcaz2eTHsRqV8vSjcjJlLnwAfEhVXEXhCYGErVbLuQ4bZkZ2DyggX0u5wLR9ttjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lVFjmh6RimoQpMTq+9aSlOOru1h888tl/hV8Nfxcv+U=;
 b=KPY/lMCh8V7A0Kd972Y1gL4crxtgK6JJ8bqTj4o30pRNCjI18/tH9KHpSs/RDa6+6UCX8A2y4Ou6AA07yYp/LzsiHjOfa3ig94Q0lgFDwsnQMzrfK/YLD6reW0BEcM9c+XaQimhL+7jMogxJXwkjvnqBmrn2wfA1kWZDOw8UUHqAZu3WPCV+d+ZJ3O5qV+NZiODtnTvQOh76ZKrvE2A1tkyir8K9LrkckCGzQNvE4kTAyGFMsXxbZw9NWsRMfDjyHfuKkcx3K7272vyilndVdsjWfEULHSaaqt3zg9QEa8TBcSdQOg+KRK5cvv5xzXWalMwnwW3sGPOuJTTcpYtezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/7] x86/boot: obtain video info from boot loader
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <bc7fb3a7-ee1f-8859-f1e0-a6cb04fa9d33@suse.com>
Date: Wed, 15 Sep 2021 15:24:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eaf84d3-140d-415f-ff02-08d9784c3704
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435210F95093A46215530010B3DB9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VAZ3eqvwgtXtQl2XGV/x/51BXeOhmq7cY2CYfvlwNPfbfNRxVEupdQfDTQ+BJLLaEBVgGxiQQHCihV/0GiN51Dl6vaqCyz0R3MB6xjjZJtjrb5v53aM8j4esn3recxyH/4Y1CUhgC7XJgRuSdT2P6lBxoTNrgTfqp00pSpMQmvnvXZ4EpcEMHAyXZjulVHyJHnu0wNXl8UuRCu3O7C4oGbPIbQu8+StRykYhHX4Fk8dvD9921bQxcSVznSy8xaCuTLNKKMMhPXEdWXrKCiaTEXCR4dGWuQHXsEsXlaP8mWZZixTCS9H6BvI4UMynWhE6mAMZ+BFolDexRoGrH185bZ6xN21a7jL8IIl6bIK2vV6TLXKWKPHoyDhsXVnNsdEmbaw025s5lQ2K4UWXu9293fTUmF6uuwAJ4cD2Nfjiraj8edbiOPhtq9Dx+A1jz1bt76EKytRArFxXaWSwKfJ9VYkPzopziJUtKzhJhy6tmC0Nnb5zmIRSEcfk3UNBRSQhWl+haCYwjP6gYGL8E/SYdDeTZOx/CqIp44MMdFGhtl2FJTBhxzFfrZJzDTTm+6wMBgvLUk792SLJAZvqXEAbTcr6fxz5e+exz6X310py6oqFK6MzQ2h/MEN9Oc1jMpNJkcMo4zWSV3v3492o6pmrHDtn17il6m9c7Bwz+Wa7PT3G/KCU/v2h4bicIKiuLQCw+kfgtN8G/YC8lYeWbG+qcUZVSUP5VDPCD+u7lZTRTzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(366004)(396003)(376002)(31696002)(316002)(4326008)(16576012)(26005)(6486002)(38100700002)(8936002)(36756003)(956004)(66946007)(54906003)(66476007)(66556008)(5660300002)(2616005)(6916009)(8676002)(2906002)(186003)(86362001)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlTQzU2cVZQM1VGZHdtZThtdk14OG9JM0luQWtnVnRLTWQ0MVdjUjU1Wkp0?=
 =?utf-8?B?RVlCb1FZdlQvdGhVaUlqNmsrdmZ3L0JGU2h3RDN1UlE0aFFDSEJlZi9ucEVY?=
 =?utf-8?B?QlVrSWpOYjBhcklPSWVqZFZ5M2E1akxwUHFiZVUyV280WVpUTUY2d3pBMyto?=
 =?utf-8?B?RjFCdHdaQ2FXRHY5TG5CM2NYVmRkTWU1SUoyczlkRjM1MHlpZXhlMzZzdHBv?=
 =?utf-8?B?YTFvNEN0NHAyVUVSOWFqL1A1Sk5QR25VRFBMWFo0MWQzMlFlK3RyVGFNRkVy?=
 =?utf-8?B?azJzbkFSb1ZWZmJFV0FTRGwzdXpyZ1JpMVd6aHY2WGZFM09RcytURVI5Y3I5?=
 =?utf-8?B?dERQZWYrNUhLNXE0MWRrZlFvL1l4Sm1GVENlc3FrT1NpMS8wNnJ0NXdsNEJp?=
 =?utf-8?B?Q0pONjRsQklWbDhrelhKeTVsRENkSzJsKzVsMGE4QlMrNUhhc1dOYnQxVzlF?=
 =?utf-8?B?UGRCOEM2bXhGdEJxRmdGMFlvU1B4N0lqVkF0clNUQ2d6T2ZQYWpUcVh0NjEz?=
 =?utf-8?B?WUJtUDM0K0FmU2Z0RS9tR3U5N3hwc3NRYW80aHhXdWhGYm5xYmRveGRjb0FZ?=
 =?utf-8?B?STNPcGtmdmZ6L3J5ck1aRG9qc2J1ZjZIK2FpTWJwaHdoSGZFOWV2dWpoYkl2?=
 =?utf-8?B?c284UnkxSmN4K0ZNVm1aTnpLbnc1eS8xVnpwUnFlOUY2L2E0UVo2eStlaS9G?=
 =?utf-8?B?WHppZStsc29WTktzeTJjWWVPVUxuTWErcnFnTnBmcUZOWSs1RkFsR0gzMWth?=
 =?utf-8?B?WUk1NHY0Z0dRRWt1eGUyMmpnbUhXS2xzdnNEMUJ0TjR0dTcxa3JCYjFNWWxN?=
 =?utf-8?B?WFhHRXN6eWZubVpLNmdtWFVFL21sMndERDZ3MkdzVWJTUzdsZ2VzTEJUZUFy?=
 =?utf-8?B?UGV6NVVBVjkwV3UzSWdnYVkybGR0YzVuUUJPejBzWTdaMUsrQ0ZadEZOL2Fq?=
 =?utf-8?B?YTNXcGRPQ1lOK2N5Mk1wQXhiclA2eHJTYjFDcEpNOVcwWFFrbmdnMjV2TzEx?=
 =?utf-8?B?WklkTGFvVXBQL3kzTWQvQXVncWtGbThHYnVFZnN3MGxNdEtBeWxISGFGSnkr?=
 =?utf-8?B?eWVqVXVmWWRRSndDWkdCWjZoQldpMEhoWGNHbjRxZ0g1dXBwT1FISXNPRStu?=
 =?utf-8?B?MlpuN0IwOGREWVdmSUo2TGR2RitXSlFuczZPOGxxWERQTTRFYlM2S2FlaWJn?=
 =?utf-8?B?N2lRMUVMRVZNM3ZXVDJrRDc2UkhDSHJDdllVTnpFZi9kNXA1T0cyTVpTTUh2?=
 =?utf-8?B?ekdvVXJEeHYxeEtyc1liaHUzV1pDUlc5OTluYW5HOXNnei9wWFdIblgvcWMw?=
 =?utf-8?B?WER0aTl2M2xXQ3BCODZaaW9SYUZiUkFqQWFlYTM5b1U4U1VQYWMxZ0VtRU4r?=
 =?utf-8?B?M2tLbUJpLzhPZ05ybCsxV2Jta1c4bGRqS3NvQWl4NGQxVW1KWExyZWpaNGoy?=
 =?utf-8?B?czN3NVlVY0ppbUFPQy9Zei9oTWE1WmhzZEp1d2hzYUtkNVgzVWt2aHJRNXVo?=
 =?utf-8?B?NVZiRzJiQ292TkgzZ3g2SFVzUkhhOG5mSjFGSXc4QXNnU2x5Uk1pdlJBQmU2?=
 =?utf-8?B?Zm1LUi9Yc2FkOERETFhlb3ljUmhEQ3ZoOUtQaGovL1RtdzN2YlE1ZC95OFI4?=
 =?utf-8?B?YWhzTmFmWUQ2L255bU9qbk5ZYVRYTUNNOXd4K011cFpzdzRkWGR0emZaRTNB?=
 =?utf-8?B?b083aUFxQUpDaVRkS2F5ekJONEVZcTU5ZUh5L1dTMDN0Uk1pMG05L3d3djU4?=
 =?utf-8?Q?5hgq6YLTvnzREtwqjE5NjgVbXp4+MOclBvwwQpD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaf84d3-140d-415f-ff02-08d9784c3704
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:24:58.6197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEXiPZt9/9HCnCrR+vSUhr+qj6BhlyWEJowYkVfON7/N+Y5gt+P657Daf40ZvgSljybZzb/vAzZJGLXredBXWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

With MB2 the boot loader may provide this information, allowing us to
obtain it without needing to enter real mode (assuming we don't need to
set a new mode from "vga=", but can instead inherit the one the
bootloader may have established).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -4,7 +4,7 @@ DEFS_H_DEPS = defs.h $(BASEDIR)/include/
 
 CMDLINE_DEPS = $(DEFS_H_DEPS) video.h
 
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
@@ -515,35 +515,7 @@ static void __init setup_max_pdx(unsigne
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


