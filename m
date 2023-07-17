Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9683756634
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564623.882175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLP3x-0004Ic-Jm; Mon, 17 Jul 2023 14:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564623.882175; Mon, 17 Jul 2023 14:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLP3x-0004Fh-Gz; Mon, 17 Jul 2023 14:18:57 +0000
Received: by outflank-mailman (input) for mailman id 564623;
 Mon, 17 Jul 2023 14:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLP3w-0004FR-1k
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:18:56 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe16::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc4ee748-24ac-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:18:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8979.eurprd04.prod.outlook.com (2603:10a6:20b:42e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 14:18:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:18:52 +0000
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
X-Inumbo-ID: dc4ee748-24ac-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gu8kYuM2JX70fkP7sPPTy+9hIUC6XxdPTInF+Dv/vIpSGBFVUIWMc3bBDBlMM82u9WBaG5n20B0ekos7gRR2c/vb3YobSOw5ComvnCtpb+ktZV10aTwfkiy/7gXHStX5NI7PzqOLynr8LC7pcg6yfevQ6Y5MU4mAKLoaZZ+uzJWXQ1Slp/77tsUFQrOWznL73zw8vmbNWCUBBqs6mv9X9ySDB21Kkm/GReLR0wVhnCJ3dtdsRyBl8k95RaL1MOxB5EYhNMa6rVP61TAXeq0ZvhE66SahBhaT3BNDgsi4B2MaVCMU7R4Aoq6jrt0D1X2CbpjPzUNWhtBOrUu5+sWnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuCRAFGTJjX+O7Q9upuBdqcebOL1clejJevbyHOYW7U=;
 b=Y/BO+eJ6didkn0EkhD+YF5mZrrj/Lb71vk/cG9X0mA1Z82CKrD2PGpoo2ZVHg6y7HRL/dAmD6vOUO4J9hESqiM1JOnXpcut5BJWzHcxUt2Lf3QMF3yf8XXeCH4+PGlf02AxjE4Vm5QXdXENeDsgSBfzMOGXWD+yvAJS2CCqyfST+e+ciR1On6mlKkV1Zc5QPJ2Vc25Ik0DClD69WAswqIaATWEmPpz3SFmMcmmRugam8C+HWq0WXid8XPsrKNn+qekILQyOh6X3lKJYZFmqKrHbHy2naPISJQmDVu16GmMmGLMB+EC0LRaUiRNV1U9IP3Dz4hykz1oURDmDnueCOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuCRAFGTJjX+O7Q9upuBdqcebOL1clejJevbyHOYW7U=;
 b=nPm90ROfs7/5yz7mJ6xylqj2nSpjACziRJMsKlesKSS+eJJYDBKcbZFglBZAjSqbXe0zRODhKG662GkNw1PLz/rn2OfNtuyfIE2l09F789wreQO/5+AXXf6hI180QiArMOp1TrAOjE2Jrt/dYma7bzub5iXJK2HlRsITevqPXlx9vV1Z6up7kY/usYMF83mS9KARlHDaTVRI5/le4RgVID6gJcmNQNVQI0ebniLfYIvfBHk2qpamw0EhR6WV65umMUfJFdDn9b+3FYcqJrad269rXQC1sSIJCM/v2auvZUfg/h3ypteZ7Df79Fh3sYwvDqCO36AOUUrnWxiZXbo4PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a84dec51-bad1-bb36-9be9-fbf343987e11@suse.com>
Date: Mon, 17 Jul 2023 16:18:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 9/8] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: 7212d941-238c-4221-5021-08db86d0bf6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PPmGgFwTFK628vuaR5TeHoshEUf65kQOVupv0qQjVkG+sG2+85vfB/aC23sW+QR8YewdWsmsdbXcds+mc+l73dRP6M02xxRwfm9yFFVmaFJQucwxi3WHhtjuMbkafZPr8iLNnNq6nEV1/BU33u4sWTpS5panGNW4/PaxDc29j58cmv+kfH8fKdxvxqS5lXaP2+AMOnIHcmUJZwegy331BVtYJQOWfd4KE4DUeW4nsSfBKVlI6H994z0QVxRtOYfcvUnHX28pebuc49zPp00OFCsMy0TOpCgbo+wc1m+WvbdjvWGrD/61wL/PegebiDeCZcSD2sWNeU/qkWCzIOf64R5ljQNvvgXe7vfpFELx+csbBZjnSKQIVsJL+fPBNLC0VZBpfskU8kV7qy+DVYlFfNZXjxPaQuHIGnlwx6THIhQUHmYQT3waRCCG8cGz8cZawqXXsZevZKJpqPg/jQv+qicVO5PsKno1SD3oW1IPmj7dyB5gGkGtNtsN4vefxTu3G1HE9XUqWISi+fbivntym700a1bdwtoXS5zp4IYxv6q4bjwXC16NRn1sN046KmBL4hM27f9u3N1fIEMze9BL0y3es7L/TQJFanT7IErMfrQgH6rd8AUfK2pdMHgmOAynFC65UrJ/dO8FUWf5hqsUtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(31686004)(6486002)(54906003)(478600001)(83380400001)(2616005)(36756003)(31696002)(2906002)(186003)(6506007)(86362001)(6512007)(26005)(38100700002)(66476007)(66556008)(6916009)(66946007)(41300700001)(4326008)(316002)(5660300002)(8936002)(8676002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEZFRVY0SW1wVkNwc2pqaU1Sd3ozaWtVRG1ESThFS1JSN3IzTHpnR3N0ZXlR?=
 =?utf-8?B?U001MzF3bmxKb0Zwdm85b1dVWWVOVTJDdDR0cmNiT0pIUVdnWEtpTStUZ3R6?=
 =?utf-8?B?QzBDeTNqY1Z0QS9jRithR2dEemhHS3MzZHJKTXIwYlVBTncrZ0ZFUHoxekxt?=
 =?utf-8?B?NHVEekJzM0dRQzRYeEY0V1RoOVZCTEltV0NRc2pxSmxmZjRxeStsWGpRZUpF?=
 =?utf-8?B?dHRVcWxXTm4xaEZhNHcvVEk2TE9RVVdNcUh4dkxOcmtreWpEYkp4WFpRUmRt?=
 =?utf-8?B?NWZ2NlYweUxlWUxYWGE2Y0l2Y0UvMURrWGZFdld0ZXVLTkoyOU1hajRyZEJl?=
 =?utf-8?B?UlpsSkJjeWVYSndSWkx4emdsVGhIVVpiTjFjeE5NT3NPK0JtcXViTG5oQldz?=
 =?utf-8?B?V3FPZE5MOEQ5VnpUSGx5Nk1SSnAxejdGT2pQaGwwbHd3dGJxcnJXWkswc3dB?=
 =?utf-8?B?YmtPN2xUQVl3ditweEErVHpTcjBVRzlPU2s2WVAybHNEMWJaZW5oNWQ1UXZV?=
 =?utf-8?B?QVNkTkhUQzRtTHdxRFNQMnNWcWdNWCthQS9vTXB0Y2tuSnBZOU93TnZCWGhE?=
 =?utf-8?B?YTRGSk5GT0JOSHF4em5RR1N6alplZ3c4V0N6ZExjTE5ITUlWeWl6MTR2Y3gy?=
 =?utf-8?B?NWRBb3BWYTRjQlRyampkbVdJVldTaHY1cnVBRk9JalBDWDlBWGF3VDNGQjNq?=
 =?utf-8?B?aWxXYU1iSFhMRlJydHhIYmM1UEJPbVZyUnEwUzRKR0JpcWNMaUcxUkE3c3Zx?=
 =?utf-8?B?UXN6Q3VXWHN1ZE5XMnI1YU0reVlqTEYvRVRpczJSQXJQcnozYjRxUHI3R0U3?=
 =?utf-8?B?RzJYUnVZY0c2eHVXYk5zcVdWZkloc2dmRnN3V1JwRHArOHRCYWVKWHRndnJy?=
 =?utf-8?B?Q0pMZENpSzVwZjhGaW9DUWNwMmsrV0JPcWpISWZqTkVieWMxTkRJbzV1cnhJ?=
 =?utf-8?B?WVJYSXVpekdBb2xHek9IQUFqVmpSd3RHek1zenJ5NndoWDdmRXhEV0ZBRjZy?=
 =?utf-8?B?dDQ2TjhIRTVSSm1JMHd6ZXUxVmNPU3JkU2IzTWZQc01zN29QQzdwS2I5R3lP?=
 =?utf-8?B?TW5DVDFqQ0lmc3M0TndHZGpRTHZISUJsWm9JVUVQamJQako5d0J5akZjS3lX?=
 =?utf-8?B?dnZhUG94RXZ1V3RiNnBqQWZiM3pwd0lna0tZSkZub25tZTFDTm5OcVhWb0ZH?=
 =?utf-8?B?VndaaStBL0tiakIvVmUzTVVYUnFuMEpOd01JS3c1cHgzeHA0VWhRL21KR2lk?=
 =?utf-8?B?cHlZWjFsZ0daQWNtZkJKeW8rUENUdks5T3p0b2toTk8yZVF3dGN0Y3k2bFdM?=
 =?utf-8?B?Y3ZKU2dvakQ0R0N2YzFjS281K09ldGhlbGNpVzJyVWNXdXR4SnE2cllwb25y?=
 =?utf-8?B?akhPdTU4YjRZM1FOWFc4TVI0K2RjQVA5bncxUVFZQkFYQnhOckM4N2w1bzN1?=
 =?utf-8?B?aG5VVytHV3ZkQ1lSWG95dmswZ3F0YjFjcENrbHJKQzB2d24wSFdRK00zZ2pT?=
 =?utf-8?B?R2pHY3RGRklFMXp0dnBwdy9VRmYySjgxWjhMWnQvSStvYUkzWE4rQkpQWGN0?=
 =?utf-8?B?ckdIN0h1OW9lb3JPNzBOV2FHOUd0V3YxUnNheGhBRTc4bFVLelBMTUxoWXZF?=
 =?utf-8?B?U2dqQjNuZUtkR2pYUjJEMldHa1pxNXNFeng1TElubnVweHhuUCtEbml1YnNa?=
 =?utf-8?B?V000M25WeEhBTTB1cFpLZUdaY1I4UzdSK2djQXM0SllpV2xoandkMnVjYUpI?=
 =?utf-8?B?VzFveFJxeEUzK1Vza2V5S2lha0dSVmZMcTJQbkQ4OUFscjVBZnNMK2wrT3Nk?=
 =?utf-8?B?SXdJY2FaTXk2aTV6cklXSUV1RFFWME9EU2cvaWp0RkpVTFNxSEk5eDRJUE9W?=
 =?utf-8?B?aGd6alhrNUZpTzg0SDl4cHRCM2VkOHRyUDRnWEFoZkVzUmlCeDBQNVQ2anNK?=
 =?utf-8?B?RGw4OENtWi9RRmI2MEJ2cHk2NWZkYUp3Ymtab1BrQTRucG5HNHA4VWF3WS9T?=
 =?utf-8?B?Qjh1YVcrQ0dMWVVHVnVKTkdtdHprK2o5RzVEUm1ObUlXYkJIMDRzYUpidEpz?=
 =?utf-8?B?WmR0bHdZTHA3WW9rbVRPaDRJVFRqQnd5ZVpxb2VFSklZajNqR0c5VkUzcDkx?=
 =?utf-8?Q?EMjn3ODrNGjxsl2cehPwg7qxw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7212d941-238c-4221-5021-08db86d0bf6a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:18:52.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygw5Gx3bUQ3MTGFzzd81u8CnjgZO4fBtQ8MArH1rYCupmTLdtgwJ8kEAH4DOfcAF97iCh/KVIwlKDhajnrz5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8979

Leverage the new infrastructure in xen/linkage.h to also switch to per-
function sections (when configured), deriving the specific name from the
"base" section in use at the time FUNC() is invoked.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Since we use .subsection in UNLIKELY_START(), a perhaps not really
     wanted side effect of this change is that respective out-of-line
     code now moves much closer to its original (invoking) code.

Note that we'd need to split DATA() in order to separate r/w and r/o
contributions. Further splitting might be needed to also support more
advanced attributes (e.g. merge), hence why this isn't done right here.
Sadly while a new section's name can be derived from the presently in
use, its attributes cannot be. Hence perhaps the only thing we can do is
give DATA() a 2nd mandatory parameter. Then again I guess most data
definitions could be moved to C anyway.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -399,6 +399,9 @@ AFLAGS += -D__ASSEMBLY__
 
 $(call cc-option-add,AFLAGS,CC,-Wa$(comma)--noexecstack)
 
+# Check to see whether the assmbler supports the --sectname-subst option.
+$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)
+
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
 CFLAGS += $(CFLAGS-y)
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -154,6 +154,9 @@ SECTIONS
   .init.text : {
        _sinittext = .;
        *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.init.text.*)
+#endif
        _einittext = .;
        . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
        *(.altinstr_replacement)
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -106,6 +106,9 @@ SECTIONS
     DECL_SECTION(.init.text) {
         _sinittext = .;
         *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        *(.init.text.*)
+#endif
         _einittext = .;
         . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
     } :text
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -92,6 +92,9 @@ SECTIONS
     .init.text : {
         _sinittext = .;
         *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        *(.init.text.*)
+#endif
         _einittext = .;
         . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
     } :text
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -86,6 +86,9 @@ SECTIONS
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
        *(.text.entry)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.entry.*)
+#endif
        . = ALIGN(PAGE_SIZE);
        _etextentry = .;
 
@@ -214,6 +217,9 @@ SECTIONS
 #endif
        _sinittext = .;
        *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.init.text.*)
+#endif
        *(.text.startup)
        _einittext = .;
        /*
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -21,6 +21,14 @@
 
 #define SYM_ALIGN(algn...) .balign algn
 
+#if defined(HAVE_AS_SECTNAME_SUBST) && defined(CONFIG_CC_SPLIT_SECTIONS)
+# define SYM_PUSH_SECTION(name, attr) \
+         .pushsection %S.name, attr, %progbits; \
+         .equ .Lsplit_section, 1
+#else
+# define SYM_PUSH_SECTION(name, attr)
+#endif
+
 #define SYM_L_GLOBAL(name) .globl name; .hidden name
 #define SYM_L_WEAK(name)   .weak name
 #define SYM_L_LOCAL(name)  /* nothing */
@@ -35,7 +43,14 @@
         SYM_ALIGN(algn);                          \
         name:
 
-#define END(name) .size name, . - name
+#define END(name) \
+        .size name, . - name; \
+        .ifdef .Lsplit_section; \
+            .if .Lsplit_section; \
+                .popsection; \
+                .equ .Lsplit_section, 0; \
+            .endif; \
+        .endif
 
 /*
  * CODE_FILL in particular may need to expand to nothing (e.g. for RISC-V), in
@@ -49,6 +64,7 @@
 #endif
 
 #define FUNC(name, algn...) \
+        SYM_PUSH_SECTION(name, "ax"); \
         SYM(name, FUNC, GLOBAL, DO_CODE_ALIGN(algn))
 #define LABEL(name, algn...) \
         SYM(name, NONE, GLOBAL, DO_CODE_ALIGN(algn))
@@ -56,6 +72,7 @@
         SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
 
 #define FUNC_LOCAL(name, algn...) \
+        SYM_PUSH_SECTION(name, "ax"); \
         SYM(name, FUNC, LOCAL, DO_CODE_ALIGN(algn))
 #define LABEL_LOCAL(name, algn...) \
         SYM(name, NONE, LOCAL, DO_CODE_ALIGN(algn))


