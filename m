Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89C48D34C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 09:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257014.441380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7v3t-00024y-3E; Thu, 13 Jan 2022 08:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257014.441380; Thu, 13 Jan 2022 08:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7v3s-00022M-Vz; Thu, 13 Jan 2022 08:02:20 +0000
Received: by outflank-mailman (input) for mailman id 257014;
 Thu, 13 Jan 2022 08:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7v3r-00022G-PQ
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 08:02:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 206fa658-7447-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 09:02:18 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-qFB_-AylO7m9vVlyqTcsVA-1; Thu, 13 Jan 2022 09:02:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 08:02:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 08:02:15 +0000
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
X-Inumbo-ID: 206fa658-7447-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642060938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jbsZhfvujc8V448+GlEv4cmwJEQQGxNc8cpkHh4FCGc=;
	b=mvM/AvzHD2ORCWSj5Y0tVNbTa/WC9DZTDZBFzcGkFoV+C2Ee/7ekA/AJXwPWA7pyLXap5H
	lCSAa4Dt6h07jJoyNEuSEt2V/kpGBBGrEmipuY1bjyNzSz5GNbo43z1q8Tzmo7M2uhjR7y
	3xzirpcOUANc5NmtxuhfLq1+HXOhZ4A=
X-MC-Unique: qFB_-AylO7m9vVlyqTcsVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwCTaN0NjJcdzsMcvS0owFer5rRbr0pC9DuzpXSDF+PqXsDfbzJKUod+8i7yWfjpTHBexFG9HEpcEMswg8HdNwdz+YBs0UaPSTlZCHPZ/00rjknsfw+rRLI53LJGjherW6fTwV5xduVBTiZXigOGXNvvJ6Zahz+gZUnMgaBIXROFBRRTQ1vs/DZUNww0mcn+U1FnhiFUJS49JxhbzHcsrfT9jKjMcK0kknxwYlxb8HMLniYDI6TnAUJl9gSWSkyqRNg3lP/rJc7fWZ3TMydmCze0454Uu13s/XaAT9NNzOJULXIQAdhTJgtGaNy6Un6WmD9xqgx5yUhQG9pVe1A5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbsZhfvujc8V448+GlEv4cmwJEQQGxNc8cpkHh4FCGc=;
 b=JuEtPFGUBElDO7c4QpDSAyF56E5GRCZxf914XUHs2e6PIejQDk5cccnHnZ6ZS9cTm6RULtgp2peE3n2t6vq/zrX4WSKvElr3fnxJFrK8eWQNMsZEPohAlzx3idk0Eg4wJsW/JR1XW8HuTZesD+7CprcdRx62eB0Yv+DUrQzbCqqVb6nyg36Axph43GE43lLfMXlGzt63xeS49sBsc8CQb+qY9tELSRYXgANZURmIhtNdCPr5laaj22IydGYlpfPuGaB26Mnfd0+8JnhvfO4EC779qzMp4mPMMOgSE5Z6SOPtNNtCpW9Acfs85TtQEM2vpPsBh7wVmNgszwtGZS8ccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09369d40-a974-2f7a-9b70-836b9210904b@suse.com>
Date: Thu, 13 Jan 2022 09:02:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: help inlining of functions involving alternative_call()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72cc61ff-c3d7-41dc-c842-08d9d66b02f3
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB736059F6D7DCC6F62BE6FE9DB3539@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvFk5GZogf8/g8e5RmKAfD3my9IKMSwNLAB07BgR2P/1XHkRJ0pw8zFmWn2+bnztN/+wJxSx3V2xjWsPpLP/9SheJfmmTUG/P/WvOm0aziukbvB5lpsDxgvSu2fj0ALmnRcg/4OvGn477wYIOflEcqh32z3vLWT2xYDE/tHMteTRveKYB5icWSfIQ5/0IVTMYCRgbfwWFmZAJ5tCdL6t1A/OUG+LD1hLm2Vk6qVGGVNXLt0z4R/Kl8+uLqrnzsoEKXNq3Gk00W6lDJUpXlfQtuASij4xf3fZ425kAYbvoU7XBiTyzaaULi2x1OTpEhuT6yw2Vx1N3+O+I90zRVe0kJMauns8RElE0icFwMUM4G7I0yXW7adb+O+KzZ6GhrE7EWy03wsSgxoyFfHKv7XuiPaDKnNHeq8LKAzemCcPoIwKe2S+HsRTHQHf2VL1OMyot4AmndW8uFKXxxTialzXic5TzmsHFcFaLOSYzdwXpA7yf2YILKkwpui2hLhXwVifp8POue9KMIzbwU13AbMYc0amPkXXwuK23IWqyR5gGgkoEkgn9HDJsSueSBNoqq7EOZZYwZpYAdArdkaxVtWPj4ZQytlP6oU/jiHtVCLAyPymQWOIMPfbiM49TIUPUsERNmtl29al/g5yEu/yaKOi4E1FggS384I2eOF6C2HPDQW+w+7xSymC7BDtM4Yi8OXdaqU8YjDmhpegs3EaZkq6uzIGSA2AjroASeROHwUUFmMrvLFdCVOpUHec9Kl1nact
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(36756003)(38100700002)(6512007)(66476007)(54906003)(66556008)(26005)(66946007)(316002)(508600001)(6916009)(4326008)(31696002)(86362001)(2906002)(31686004)(186003)(8676002)(8936002)(83380400001)(5660300002)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEwyWGJZeHBsRWlBWW1LZDRCTzdhd1RzMk1zMXFxb2lWZDhJejNEZkJ2ZEd2?=
 =?utf-8?B?dVlGbFRUZldmZjFTVGErNG9OeVphMStkdytBYmZidzhZbHFxcmwwY24vTzFm?=
 =?utf-8?B?UWFmL2Z4ZTZZYndUdHZlb1cza0VISXZNYlVxVHFZSzRpTDJHUlJyZkd5eE5T?=
 =?utf-8?B?K21STnJrZUQ2RzdFZ2FXL0ZBTGg0alArVUZic3MvY3B0dnVGNHdyRnRWRjVN?=
 =?utf-8?B?NVM0WFNwZkFEelE5WGFIQVNZbDMyQ0MzUXd4ZEQ0SDRoZUdzL0ZBcVMyRkk2?=
 =?utf-8?B?TXJCdTNVK2syWVdWQ1ArWlhGVjJndkd2ZUExMEE0bUIxaVFnZGo4NUxIWmY3?=
 =?utf-8?B?S2pNd2wweHpRS0dhOXZiekZFRG9DUVI0ZVJlbm01ZkV2WTRMZUxoaS8xWnFU?=
 =?utf-8?B?cDF6NWQ1OUZkWkxpOXZFUU1TNmdYR1F2OCtEblN1UCtBb3RnNnEwbVFxM2ty?=
 =?utf-8?B?OVMxQWlEcW9keVdQN0RMK21CZlQrbGd5dmxoRW5OYzVzNDRkNjhBSUlZMDFT?=
 =?utf-8?B?cEY3N0c3aXJhV1VBR1BKb1hReWhTcStlYnUvQUhxdUIrYWsvR0h3aTc4NCtq?=
 =?utf-8?B?VFM1UFpGZGpkWFhwNVNtNUhZdUZwdGZST1BZRVlyYng2MHBORWwzVHBZR2lx?=
 =?utf-8?B?MzZiaVdyYm9mQlBibTBNQzBhM0FlYnlQZHVsN09tZXM4YjJQUnhpd3JiY3N6?=
 =?utf-8?B?d1k1ZkkvYkF5OElCUWs2UEVIdFpwNVh4dzliUHdSaFdhM1JoZTNrRHpaVDI2?=
 =?utf-8?B?VXBHZmpIVGdNSVNzY0RoTnhZZStJSG50WUJ3SnBsanBUMzhqbzVTMllXUXdG?=
 =?utf-8?B?Q00walBDNm9JeGVlU3NicDRxV2lNMHJycTNpL0FZQlJtVDVWVmVxQk1ZalNL?=
 =?utf-8?B?d3BCdTV4d1NIMVlzZ0hXTzJINC9nMWJZKzViQzBKRmowUE0xUVJtc1RTNTR3?=
 =?utf-8?B?NGhQWGpHR0o4NGFscEhnUlpVUm9kMXZMNTFMbitUV1VkU1lMeFZCdFVOMlR3?=
 =?utf-8?B?UmJYb0Rndmo2dmttUDZOR1ZRZm8waDJ5aEU4VnhTaEVHUEtEVng5YTd1TVkv?=
 =?utf-8?B?TnV5TGxrcHZYNWFmYkRYTFhHSGhiUDZiTXhHUEhKSFRYc3RmRmVGcHkveGJy?=
 =?utf-8?B?c0hqcDB4cEhpa09yL2ZnbC9sRnFUQjI2enY5Rkg4L3Fidk1HM214aWVudTc1?=
 =?utf-8?B?OU9ib2d4WmUvUlFVcXRlYTNnVURtWW9XRkw0azZRMW1nVWVhUTF6WTlmQjVo?=
 =?utf-8?B?UnBUakpzYmRPb3h0dU5IRGI0elIxS1pJTVU0b0JvcXcxdzRJLzNCUkd1TWRB?=
 =?utf-8?B?RDlsY3E5czdSSlgwbThpMk1KdVdUQ3hvSUdZYzdJNEF0MzcvV0QzcUV6WGhM?=
 =?utf-8?B?OExHT0NHSU9UcC8zbnhuWGY5ODZvejNPWGpjdTdwZzg5bHNyL3NkU1orK2oy?=
 =?utf-8?B?WStvK21oZHg5eEhBYWg1ZEIyNkNRNmFybWwwQUlKaWNCK2NCSndtSGVDSGla?=
 =?utf-8?B?SVZjQzBzUmhVSEE1SkhRak9PaW11UXV3NDFKcU5NdzRFNVA1ZXg2UEJ5Wkhi?=
 =?utf-8?B?ZEdLWkZQdTRYNFBabm1jMkR2S1lyaTFBOHg4QUM3SUs1WC8xYjJuc0F2UG5l?=
 =?utf-8?B?aFBwQkZnUjJJSVMyblFLclpLbkt1aE1EeHQyajlCdnJySlRnTEM1NHFCMktP?=
 =?utf-8?B?Qy9IWlcxdVdsVlNEMElkZ3piKzdtRUxzeFJ5NDlrQm4vLzJCWlI5RzlTMUlq?=
 =?utf-8?B?WGQvejNEWmVRalpGMFUyM0FvUThBV3BJenUrcTVWM0lvTnRyMVJ0UWduVlRN?=
 =?utf-8?B?VnZxcktWdXl0KytvcTdZQTBRcE1kRXRJWC9ZaGRJaDhrdmZzcEdDU08vUTh0?=
 =?utf-8?B?RFAvNGw0dkdnUnFsWkFvb2VFVjlodzFEQU55MWFvU1NuNGFxcXlOWkYwTHN4?=
 =?utf-8?B?eGQyUllEZ2lnNXFRV1VrT1BTa2pEN05OVWZDYXkrYTRrM1NlTkpxZUdSVGlX?=
 =?utf-8?B?dENvam5JUU5HRjFQOUh1T2owdzlZM2NPT3hydmJad0l2NTVZWnVXRmhPM0ha?=
 =?utf-8?B?TWpMQm4vL0xNblpkcTNyQ2ZxaXBMSExPRFVEVVo0OXBzSjhPZDJOSjdva0g1?=
 =?utf-8?B?cEw0WVptdi9ucXoxM3kzcW1Ec3FXQWRxaEVXQmdSYTBPcnNZQWRGN3lqSGlt?=
 =?utf-8?Q?s2RiY3fsv/mzWISUF2xhXas=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cc61ff-c3d7-41dc-c842-08d9d66b02f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 08:02:15.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed7vya2iF2mNRl/ZDl421gIW7gZA8OeDiNeprRYr8SzKDjKAW60U/NgWeRBuohIv5BaPYZl5FRc+lRM51bCbjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

The involved asm() expands to large enough a construct that often the
compiler would decide against inlining when a containing function is
used more than once in a CU. Use the "inline" keyword when supported by
the compiler in conjunction with asm().

The INIT_SECTIONS_ONLY dependency is because in that case "inline" gets
expanded to "__inline__ __init", which obviously can't be used with
asm(). But for init-time only code we're also less worried ...

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Perhaps this wants extending to other asm()-s involving ALTERNATIVE().
At which point the question is whether instead of altcall_asm we'd want
to have something line asm_inline.

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
@@ -250,6 +250,7 @@ CFLAGS += -Werror -Wredundant-decls -Wno
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
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


