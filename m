Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB2E74D0AF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561122.877464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImhK-0000xm-8l; Mon, 10 Jul 2023 08:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561122.877464; Mon, 10 Jul 2023 08:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImhK-0000vG-4n; Mon, 10 Jul 2023 08:56:46 +0000
Received: by outflank-mailman (input) for mailman id 561122;
 Mon, 10 Jul 2023 08:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImhI-000090-FT
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:56:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b15cb6d7-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:56:44 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8255.eurprd04.prod.outlook.com (2603:10a6:102:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:56:42 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:56:42 +0000
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
X-Inumbo-ID: b15cb6d7-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbc1KKsKJgEyrBjg5ntpwXl0dwQGj2DHkhDarLkIpZ2CDX5KWgxtpjt87qob0R1GJ3D6abnIB9rPJIHBC8KDbaCuV5NtKZcZ84qcyackOQKYtMaEDDcABVT1+mQjexXIYZCfyoA0v+5XYlp24o8UCFn0tcPnANFVk5Iv7gZ1EQS/mWJAUqYd5LPv+Y80CbzySPo6F9nk1jemXJCFbtIBuPL30qENHemBWxFtt0iocWZ50oA4yVflaP7mgf20PL8VuvRUcLgtlbIiOfT29569ERWvwGP5mVKdZ+GnQH7ldHEuyPviSIkap2gqcqom+LVqPxL/Dqkg9fTNOOy4ClB7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/xR6YkWfKWV2eWIcLISE9nlBCFQDkrQgA4AhpXFs/s=;
 b=lwMzKG62PzYz2I4EwF3zFqhFpADK0C7AwcfJVIPCXPO0JENLH3ok024POdCuoE9DWgWr7RchKlyuw3Mfch7/kpMva7AgqW+cPfEDP5kRoyDjHeR5Hi4/qEG6zGqCjSZ5ex7j4TrZsFJeGVBim9VPxh7dARcdHlf0al49/IMVIlb5PqIFNLQPFbPQ6S8aL6bTR8/a+3PTv2Tdb1yvjAxBKp+VNyRWG7FZbiMwRdr/ukPwXvYdJci4SOUNyZQyL0rEtDIU177trmN7DozW6mb0GkCMrA9D6w0a/vM+2eFBt+Z4C0FZ8UAPbTksSgq2rrWEknlFWsJB4WBN+lQrhX3j5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/xR6YkWfKWV2eWIcLISE9nlBCFQDkrQgA4AhpXFs/s=;
 b=iE3+MhXgnraMQ/sMwPAF1lQOq030esL6uo6gN3W7PECx+PD8N/UAqpwALoCo6Fj07Mzpj9qdLcmNzr+D497hscgLoHOaKq5GTrf7TObMktUfZgGYOAYYj6YcwLqT2v2zegqNiau8Gbll7pTjVM1VSsqoCwiqwz0weLcVdwju8bo0TlykGsuLmCE6yX8Y25rPIHxm4FZD8/quPXtEDDvZRFNiPT4bmv7FLKE/R1xmjXe90RGmlmW2tBSpf0XjR5Et1AUotAarSxagqc275psq4IaHK4MUWjOIa4612E2C7mGwZlhQrDIp/WMjvtgoDf7GOwLV1Sgf2aRz3zeOdfFsGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <283fbba2-4d96-2ed0-4e0b-8d432c612667@suse.com>
Date: Mon, 10 Jul 2023 10:56:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 7/8] PPC: switch entry point annotations to common model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: acd97017-f6ca-4644-3057-08db812394af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jb1qfUgs4w1fY90Z1rsvsG/1iOWdHl2Vsdm7UhKZSmXimcUWPPqAdhR/vU9Kk0BUwmEsaVYrmrjPgnuueVKUhJimFOsBHFrfnG3xeKztpT/7OAufstyPZd/R23jxbhAkZZwkWsvqCQEzeBd8iEiCgAKVx2s84Pmt5Lq5/BRaSk+lX7oS4qug8SuvNrLmFbZKSWsMBybMWGqF7zn2GkyyTgR1vWHeddXdjnO0fYQ7qi2rixPNIYXiuv2OZgF2vJIpjSW5J2P7N0EiPgXaRqj83a2Sp2kCwgxf57MRAHNEYrDt0vyvYoHU6D+yPImPiEwfLJ+anY+/P3iZQOeljHTWDw6W73hIArDIPim7zhryhcNKz8j5f0WmpElvejvZcJIe2fpIXKjSrcFDiYYoT40BqaT9AG6TaHNt+Vv8HUWNWcJQhQAg6aS1KoWKnGCa8b0F83cnEaNoKmIs12E+enxfD/l06VSZOIrPg/LtQ/ab53TK67ccyUiaYS6NujSKfV/eWRcmeameik+sias/2YagaLBMwHLt8+dyLsDUXGQVHsjr/mmBws6U1l/G0IzYKSGtQz9I1uY+xrFTYzbHc/QE7+XbxC7itLumPkBsnbxKd3hgOsWJ+AM+G8IUVRryvepjwEOSqZ3SaiNXF26vqPwIRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(83380400001)(41300700001)(4326008)(6916009)(2906002)(66556008)(316002)(5660300002)(66476007)(8676002)(8936002)(478600001)(66946007)(6486002)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alNvUVl5S1d6ZXlPbFhKa1l1YjJzci8yNXZUTkdFU0FWSE5DNVoxRzhueExm?=
 =?utf-8?B?MzNBV09GbFBFYmJqQzBnYm0wSmJtUkFyUTgxUUd4T3RYSUlRcHR5S2lXQlc2?=
 =?utf-8?B?cGJVbWtpWVRMVHQ4YWNsYm9xQ1N2TXFwbmg0MlhvTklGMTFjQUl0ajJHVU9h?=
 =?utf-8?B?NElwTlFiWFF0ajUxRDA5NTMya1NXdHlxRTNaMHBIUHhUeDVaWHBMNkE5dWl5?=
 =?utf-8?B?UnMzMFhhZkEya0w2UEh0ZVEyc3pZL05jVE1nZmZDQlV6bDRhNlZUekp5SVpn?=
 =?utf-8?B?dlo2d0c5a1dvN3dabmI4dk5Na3pqYU5FZnJMZ2Q2WndXSVJ1dmpWRWRscE84?=
 =?utf-8?B?VFBHVk1rcUJOUkZBYTd1M1R4Y1NLVGt5NGY0YndwZ3BCZlluMk03cjgvbjdC?=
 =?utf-8?B?RFhjUlFuYWxCaXFGaksveWRva1dKMGp3RVQxWTZZc2xrR0ZocTcxRVNEeEpt?=
 =?utf-8?B?cDI4c0lLWFA0dTVaQWxKK2gwU3pQWmJRVUV6MVJzaVpnUTd0L2pKZnZhZ0Qr?=
 =?utf-8?B?VThHT05mdjRIclgrU1BOcDRQeWF3bGNKa2I2eEppUlZybWlMeDVQMW1URWxX?=
 =?utf-8?B?TUhwN0ZHMC9IOW9YZTA1d3VkUWlRU3dIMHdoeWtaTVVJYmEyeU96elNZaGZa?=
 =?utf-8?B?bWhCOU1kUHp1Ung0bnN2b2o4Z0w1ZFlobmJMS0RZZFVlb3BNQTJNek11ckcw?=
 =?utf-8?B?bXpHKy9DdXAzQzkxaVNOa25yWGxFNkZoRFRYMDlIVzFBejFHa2lZS3pGQTlp?=
 =?utf-8?B?V1BNMHFaL3hVdmdDblp3MGlrZ2lvTlJFeHN4UUZhekN6ejM2b3pONGpxUkZu?=
 =?utf-8?B?VGtDUFJ4akVnbW8weXFqTHhxTXhKSk16KzFXMlBEZGFIUGVlVndxOGJsSy9H?=
 =?utf-8?B?dDE1TGxJTzhvaVpnMmFLMFN4dStQRm5acjduZmF3T29udTQ5bXRrV0NRZ2t6?=
 =?utf-8?B?V1BSUWduWDF2WUIvMXpiVWtBSHFCZ2JxblAzS2NIdlBMejJsdXljVFJCUy9a?=
 =?utf-8?B?aHRtdnFidmluWHorNXdmck9VTXl3R29rVVdZVHhvN21HM1MyT3phMk9WamNm?=
 =?utf-8?B?T0Z3b2xzOFEwKzZTWWF1NzdncjhIWEg4bkZGMXpGeWxIR3VMQXZidHIvcXZF?=
 =?utf-8?B?N053RXF2RVM4Y0FGaWx4V3J6STFOZU12UVNEb3Z6SkxhK29qeXFacHpCWnkr?=
 =?utf-8?B?MSs2VGlSZUYzRW5qZmlrNFVpOVcrRGljZHczTWxDa29HNWg4K3EyRDFPSStH?=
 =?utf-8?B?VWJsWll3QVNITUFtSzFEanFwdjZSWjhGSjVVNXZaSGd2b2lGVGY1NjI2RHly?=
 =?utf-8?B?VXNGNmMyWFc0L3BmcklFcllmNW1lZnJYSnVWVUxLNDBaTTJadllmVjdXTm54?=
 =?utf-8?B?eWlXenRqaHpIOHQ0NlM2ODVuY0loRkJ1N2FqMDFnS3dlNWY2VkxNK3dSaDFH?=
 =?utf-8?B?T3N0S04wZVZxbU1sTFNhdTJRWjYvOVg2d2FEdjNIOVZqcFkwcmFrOVZPL0hN?=
 =?utf-8?B?VDU0U2RiNWllZFcyUFpCS3hvbzRacEM0UlVreExnY2Q2YnNuZmkreWRkMURw?=
 =?utf-8?B?QnJ2c3ZqY2JQV1NXZ2lRbGlLaE85c0dQdUtvVndUK2poRkV5dnd0QWdHT3R0?=
 =?utf-8?B?bStwdjc2VEVFZHlYNlFTc2ZVbTZSeWJhNXJFSlViQ3l0RzhaYzVscE02eVgz?=
 =?utf-8?B?WDI4L3Y2MkFsVDUvT1ZhUUY3UTBjcVFDcnljQ2hsYmhtOXN4M1RCOFZFb05n?=
 =?utf-8?B?MGFycEkvY0cvaG03YWRtN3hNMEozWmpNelYzbDhZV0g5RU96R2lWdW1wQzJk?=
 =?utf-8?B?Z0RJdytaYWE2c2JCSE1oaXgvSnliVlFFak15N0ZZWGpaR2I0TlJYTmZWYjla?=
 =?utf-8?B?SkN0Vkp6em8zOWFUd0xvTW5PdG5ETDdCR3Z1WjkrZGg4V1ZUTGx6YWJCbm5L?=
 =?utf-8?B?VmNhdGZIT2E5TWxHdDVBYktOeHNwMnJaODFrUjd0ajBXS3B6aGwvaUJ4bEVJ?=
 =?utf-8?B?TllBcW5TSkpPMzQ0UXFsVFNOVWNWbEVremRxT1M5YWlCYTN6Z3J1UWxrNVpP?=
 =?utf-8?B?bWxQS3RKNm1uUTY0NmRmWjhOcElzVno4TFJpN0hoOEhCZW1IU2VZM3hOa3lL?=
 =?utf-8?Q?5BnIWm+QNj2RmGY+8Dftoz40h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd97017-f6ca-4644-3057-08db812394af
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:56:42.2309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prxM7UAnXhvqIVNjvipszabTyUjWP4EhDwOecgCAO4acjTgmtkzQ/db2VQ4SvaoC+uE9MJQYv7Cgikm8dDRiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8255

Use the generic framework in xen/linkage.h. No change in generated code
except of course the converted symbol changes to be a hidden one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -31,12 +31,7 @@
 
 /* Linkage for PPC */
 #ifdef __ASSEMBLY__
-#define ALIGN .p2align 2
-
-#define ENTRY(name)                                                            \
-    .globl name;                                                               \
-    ALIGN;                                                                     \
-    name:
+#define CODE_ALIGN 4
 #endif
 
 #define XEN_VIRT_START _AT(UL, 0x400000)
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -1,8 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
+#include <xen/linkage.h>
+
     .section .text.header, "ax", %progbits
 
-ENTRY(start)
+FUNC(start)
     /*
      * Depending on how we were booted, the CPU could be running in either
      * Little Endian or Big Endian mode. The following trampoline from Linux
@@ -25,6 +27,4 @@ ENTRY(start)
 
     /* Now that the endianness is confirmed, continue */
 1:  b 1b
-
-    .size start, . - start
-    .type start, %function
+END(start)


