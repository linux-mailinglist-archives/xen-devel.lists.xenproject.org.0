Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046826F5223
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528980.822819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7BI-0002RH-6u; Wed, 03 May 2023 07:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528980.822819; Wed, 03 May 2023 07:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7BI-0002Oq-43; Wed, 03 May 2023 07:45:44 +0000
Received: by outflank-mailman (input) for mailman id 528980;
 Wed, 03 May 2023 07:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu7BG-0002Ok-Im
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:45:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa575a0-e986-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 09:45:39 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB9PR04MB9473.eurprd04.prod.outlook.com (2603:10a6:10:369::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 07:45:36 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:45:36 +0000
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
X-Inumbo-ID: 7fa575a0-e986-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVwpTULunggPn9zGNavkWQdrBfER/3JzKbUwxmQQuBvL5y6NsqfR0zTDYuT+dGo0xMI8ahINwqUitkRjHIQInxqgz56y1gAIIeDc0PBlhKlM09IixN7zGF0XqnYKIcAmcBPaCAyUcuVEfcCnRngE/0Vp/90++vFjmeelEBy3gUKqUxrOeme746AxcsArLvPjbIOdtEMXKoPRWVFMIIqVdQHmZ7KikZntNMxnO8hIy4jl+FF6NeB9Op77XWNq+Zk4PLWgUy8uBj+NMlDZT5Hz296xbU1sfdTpEusS3P9xLdaRGKhFhqM0QBGAB8Fd901NeTWu4GStBFFQT2dPlEY9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IxiRtGBIVXxf6pXJPzRosvgwZ0y1a6EjJDShLld+2I=;
 b=OnpDf8i1UFnHn4dXivQCvc5vGX3LWblNBekF9O8uMcpthzsOKggoQtl5cZS4UxsF7Pvw2sttWf/G5pvMefA07p6MkU+l30hdwViXO7LZDZXPNF+9UMaBHEsgEzd4Eo2Cwo5kGmm2THZ9bFmSapE/MhuJYfmWju+ufkgCMGKKFTJrclYmXLrZi7effwIZIwb5SivPemK8Je48PaSAdJct0cVy70R6NJQqiBfeIBn/2zVbkNZbjYuUT8AU/VGb+5xHLDA7gABI8udZakTyeNpaeZlnZSVj/Nkvw9IszdF70qX2pFDr5BktOHw3sYV0H7m+8tjC8po473cIC09p4TVt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IxiRtGBIVXxf6pXJPzRosvgwZ0y1a6EjJDShLld+2I=;
 b=27Ujovh27GP56YtYNXdVelmelfOjDCZmmHIr+GF6UWFLLsb2VN3XA1BVQIi7V4+QiWkCT4dUGQ/7oUaxfyjX3qNB2GwEdhyoAx16z6kHXKsxW9EEohe3IvRhkfXnajZKMmvNwV77aCUbvwtaQ083xJd1Vr3fa1sAEJ4iK8vlYTXfscYKzAmDGc5V4BesAHRSOxbcZhHl8F/d0kcvqm7AksE9kmg7WSBxYfRyJ589fAjvbt9AopCPoB5OJNXEX6g0eFD6Q3TN7swGInqAPlg8y12KbVPtvdXD/wN0snOANbJOfFuMBDXDb+ywdcDMJweoBTdIvbtj19vBYLeGUsfglA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a06075c3-8e6f-a470-e8a0-58fd299373c1@suse.com>
Date: Wed, 3 May 2023 09:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Jennifer Herbert <jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libacpi: switch to SPDX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB9PR04MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c6e7c2-4981-4611-4c16-08db4baa619a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tH6/wwROm5mlGVc6kVk3AGjf+NOErREBA1FP9KvVw0jCF/w/5mEoF9x0ulh+lC2daGCpAETXAfXQ+04vn2dD8ks9HMY1fM0Urhm4HOtmbsCJbREL3CswnxaMIJqUvhsR5DHYGl5kZ7lupjbPt6kOtMZuUSokzeDihQ6dT4ocmzMDvxArw4jRVjd4Fu7nBTxdr9SqBVHPS1pbh27cwLrpoIiJZymScZCvYqLra8Ky6Hp7mbdvvw0IXhLdMyMHQH2gvU6D8tc340S7/HpvN506rxDD9ODIzmzM8+s5hXy27B4IXrn4a0ALlbnD778HfFgjH+d4fYMMKZe43Xw28Uc9VNKA1TH1y2IHfa4XspeaJPjX0CS1C1HlfDgPYm4DNRLEJnr9jOehNGOLr7RPZZjUzE8OX7V3ILii4EbW878euF7NLiYskcEBd4tfCinyyzjaNhlXpSxhJHJJkCaVM2BonfGCsTcakQiOh2S/u3P0qk5MVJjneeu1hv7J699nCcPckLOeLVwpR8HJtV6QFUBAoIa7H28xGG9f4dKoTuB+QiPHWHbHhiMRxvO7kYtLlt+a7WonWw9yTpVeDt6k0i5jKYxnG1V9dE2amcy3+BH2XEepAGBKze1WZEm3cXWNjjCoKTrzDgZtD7deTmysMb1x9bDWOXLMN5ytd9kDEwO13KmLxLW+h3aeF+GTVYynX65v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(83380400001)(31686004)(2616005)(478600001)(31696002)(6666004)(6486002)(66476007)(66946007)(54906003)(66556008)(4326008)(316002)(6512007)(26005)(186003)(6506007)(6916009)(8936002)(8676002)(2906002)(38100700002)(30864003)(5660300002)(41300700001)(66899021)(86362001)(36756003)(55084003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTlqUS9Odk94QWZDaE5VY0w5MkZ5TElLekpwS0VVSEw0RTVwaWEyeEx3bUg4?=
 =?utf-8?B?b3lXUDEvUExWM3IrM0xGdjh4enBKcnFNTTlodWdOR2VZWXUzNmNaVnJLREMz?=
 =?utf-8?B?YllqUnk2NVdzQTRNdFU4a25lSWd4WGJQZmJFbXVuWVowQmtwdTFtKzhwQjRK?=
 =?utf-8?B?WjZXdUUzL3ViVmtEcEhva1JSVmJKR3ZLNGlKcTVvZXYxaGxZc1FWYThOZzBj?=
 =?utf-8?B?YTRlVUVXdUFHSUxjL0ZWQWdHaURjUEVqL0pkemdYZkplUjA2QXFFcDJuSE1G?=
 =?utf-8?B?ajhqeER3MWZ4UlU4MUQvRkw4Q1JCclJNb2RtTkN2Ty9NcHhKN0ZHRmRsVG9m?=
 =?utf-8?B?VXJKSmpGQ0tPdjVjamJSb3owbHVQY3htQ3kvMGJLMVV2d0ZiTVpEYjViRVZn?=
 =?utf-8?B?cXUvcy80aTJrNVJFUDlOSXNBcTdNZW90RlVKdXcxZjdTbm96a29PeUFFcExR?=
 =?utf-8?B?U2padUcwRTYwWHlhU3E1clhGd1NlWFdkVzltVG9QQnNObis3cHFjc2VNcHU4?=
 =?utf-8?B?Z3hlU2ZIOHpQSkwrZnd1Rjd6dlZkUVZpYnMrajBrMU42cjlzdjNESjdSZGJz?=
 =?utf-8?B?YVE4RzlkSDdJUWhXRHpGNXNSMXRXR3ZRdzhiZ0FFTEtraDA0ZEJ4MlI4MXlO?=
 =?utf-8?B?NG5zTithODI1UWJXNHA3c00xalFHNzBiUThob3ZJenp5dCtHamNocVlYRVNi?=
 =?utf-8?B?T2tuQWJXRi9qaElSdWgyRXB3RHF0ZkV5Kzdvc0s1bHB5b0JWMzY1MWdtWlZE?=
 =?utf-8?B?U25CYlcyRGpIcW1DWTNOa3lVbUQwUGJFeFZzQXVhR0JKWHZQR1UzWWRPcVBt?=
 =?utf-8?B?bEJxZ3cvSVltSkplSzJNWGRhcFd2K0RCenVjSklLemdHWDRFbGdWWUMyemg5?=
 =?utf-8?B?T3pxdWcrK1JidjFycGZVM09CVzQwT1VKbzRCZkFqbnRNd0M4TTY4My83M01U?=
 =?utf-8?B?TG42VWdWM24wcTNBSnI1di9LNVpDZXQ0OUZlQ1ZTYnpORUZSa1BMc3pENWdH?=
 =?utf-8?B?OWl1eEd4R1VUTDlOUHg5ZkNyOFdoN2VKVmQ4NHp3UjFpOHc2TVpXVGl1ekdo?=
 =?utf-8?B?M3NtdHFIRUphSnlYT3ZDVmtHYlI5VHI0dFR0K1h3YWlndTdqbzNqV1V3RzJR?=
 =?utf-8?B?QkRDSkpaazBHUUgxakp4bW43eERSQ0h2eEVDOEtXb3QzaDI5YnVWYlZHQjFx?=
 =?utf-8?B?a1pVQ2tRcTVIMms4eW1tTEdhbE5VYUdURU5YVFVOU1JIbWlPL3RZWVZsZnQz?=
 =?utf-8?B?WEV2cFVnRFNmMFVSTS8wYkp5cWZmdVI2dExNUWx5MXBhZ1E2b3hvWEROejFB?=
 =?utf-8?B?Z1Zyb3FRSnU2bDVJeWcwb2VROXBGYlhjTWtRMjMxQThFa09pNkoyVjdYZFFQ?=
 =?utf-8?B?Uk9LYUlaUkIrYmYybjNPODRNWGFCUm5kb0VyRHBLS2FXRW84aklwejQ2K3ND?=
 =?utf-8?B?Rjk1ZFNFT1Y4Q1VTVC9xclYzNDE2SWpHU0NOTHRnMkNQVlhvNUR6Vnd1WVNp?=
 =?utf-8?B?bGRLL1VWSFZpS0dJMnlPbml6OWpkeWJ6aU0wTGtpcGpjVS8rYUNPQ1lkU2Ez?=
 =?utf-8?B?RXFDa2lyUjlEaHk1c01xSit3M3JuSFRqUkViUm15MHBVdFkrUVdmbGszUjVj?=
 =?utf-8?B?NHlKYWRydUt4RDdCYUNCdjVibDZFQityZmVjL3p3WWRKNFdxY0lNV2d4ckhM?=
 =?utf-8?B?dndrUmptL2xSRENpaUVSTEFveWc3TWlTTVBGbEFXTnNweld5VnY1dENNYzJu?=
 =?utf-8?B?NmNwQ1F5NHVUYTNLU1dFQzdEUmJCaGxxQU9aVFVZV0NQMGozaWVnd016T2s5?=
 =?utf-8?B?dzA3djJyTHdHbjQ4SzU0UDJTMWhDUjBIME5mVU9ERzZSVUcrWVprVDYwcnRv?=
 =?utf-8?B?NGFDMFZXby9rVjlQeUhqUDA2bW93T0U3RkJQbHN5SGhkTzRFa29adStSRGln?=
 =?utf-8?B?ZW1DTEFsTFZnOC9TaEEvcFhiZ2o0NTYzcW5RcmFmOW0za3hLbFNITFhLWVFn?=
 =?utf-8?B?c0ZnYitDejBvTG9jemhlalU0RC90TEdubWN3RG1qdDNYTUFUaXM3K3NPUmpO?=
 =?utf-8?B?Sm0rSysrSU5RNG00RjRUd0F3cHVlcUZSNnlmYVk4NEFFSmhZb3k5V1lIR0dY?=
 =?utf-8?Q?caeP69tsDf+JbNtEMt7FLrhy5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c6e7c2-4981-4611-4c16-08db4baa619a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:45:35.9128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNN7gMI9N8VQr6OCMAu2kS51qdefEUDRtI3MCE9EnK2QRbaC4C52GMG8YRA4Xt1zD/2kWMsth2WDDHqaNTuM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9473

Commit 68823df358e8 ("acpi: Re-license ACPI builder files from GPLv2 to
LGPLv2.1") added references to a "special exception on linking described
in file LICENSE", without actually adding such a file. Quite likely
COPYING was meant instead, yet then its text matches LICENSES/LGPL-2.1
except for some explanatory text (clarifying the "only" aspect) at the
top (and formatting). Hence replace the text in all the files with SPDX
references to LGPL-2.1.

Note that dsdt_acpi_info.asl had no license text. An SPDX tag is being
added there nevertheless.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libacpi/COPYING
+++ /dev/null
@@ -1,468 +0,0 @@
-This library is licensed under LGPL v2.1 to allow its usage in LGPL-2.1
-libraries such as libxl. Note that the only valid version of the LGPL as
-far as the files in this directory (and its subdirectories) are concerned
-is _this_ particular version of the license (i.e., *only* v2.1, not v2.2
-or v3.x, unless explicitly otherwise stated.
-
-Where clause 3 is invoked in order to relicense under the GPL then
-this shall be considered to be GPL v2 only for files which have
-specified LGPL v2.1 only.
-
-                  GNU LESSER GENERAL PUBLIC LICENSE
-                       Version 2.1, February 1999
-
- Copyright (C) 1991, 1999 Free Software Foundation, Inc.
- 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
-
-[This is the first released version of the Lesser GPL.  It also counts
- as the successor of the GNU Library Public License, version 2, hence
- the version number 2.1.]
-
-                            Preamble
-
-  The licenses for most software are designed to take away your
-freedom to share and change it.  By contrast, the GNU General Public
-Licenses are intended to guarantee your freedom to share and change
-free software--to make sure the software is free for all its users.
-
-  This license, the Lesser General Public License, applies to some
-specially designated software packages--typically libraries--of the
-Free Software Foundation and other authors who decide to use it.  You
-can use it too, but we suggest you first think carefully about whether
-this license or the ordinary General Public License is the better
-strategy to use in any particular case, based on the explanations below.
-
-  When we speak of free software, we are referring to freedom of use,
-not price.  Our General Public Licenses are designed to make sure that
-you have the freedom to distribute copies of free software (and charge
-for this service if you wish); that you receive source code or can get
-it if you want it; that you can change the software and use pieces of
-it in new free programs; and that you are informed that you can do
-these things.
-
-  To protect your rights, we need to make restrictions that forbid
-distributors to deny you these rights or to ask you to surrender these
-rights.  These restrictions translate to certain responsibilities for
-you if you distribute copies of the library or if you modify it.
-
-  For example, if you distribute copies of the library, whether gratis
-or for a fee, you must give the recipients all the rights that we gave
-you.  You must make sure that they, too, receive or can get the source
-code.  If you link other code with the library, you must provide
-complete object files to the recipients, so that they can relink them
-with the library after making changes to the library and recompiling
-it.  And you must show them these terms so they know their rights.
-
-  We protect your rights with a two-step method: (1) we copyright the
-library, and (2) we offer you this license, which gives you legal
-permission to copy, distribute and/or modify the library.
-
-  To protect each distributor, we want to make it very clear that
-there is no warranty for the free library.  Also, if the library is
-modified by someone else and passed on, the recipients should know
-that what they have is not the original version, so that the original
-author's reputation will not be affected by problems that might be
-introduced by others.
-
-  Finally, software patents pose a constant threat to the existence of
-any free program.  We wish to make sure that a company cannot
-effectively restrict the users of a free program by obtaining a
-restrictive license from a patent holder.  Therefore, we insist that
-any patent license obtained for a version of the library must be
-consistent with the full freedom of use specified in this license.
-
-  Most GNU software, including some libraries, is covered by the
-ordinary GNU General Public License.  This license, the GNU Lesser
-General Public License, applies to certain designated libraries, and
-is quite different from the ordinary General Public License.  We use
-this license for certain libraries in order to permit linking those
-libraries into non-free programs.
-
-  When a program is linked with a library, whether statically or using
-a shared library, the combination of the two is legally speaking a
-combined work, a derivative of the original library.  The ordinary
-General Public License therefore permits such linking only if the
-entire combination fits its criteria of freedom.  The Lesser General
-Public License permits more lax criteria for linking other code with
-the library.
-
-  We call this license the "Lesser" General Public License because it
-does Less to protect the user's freedom than the ordinary General
-Public License.  It also provides other free software developers Less
-of an advantage over competing non-free programs.  These disadvantages
-are the reason we use the ordinary General Public License for many
-libraries.  However, the Lesser license provides advantages in certain
-special circumstances.
-
-  For example, on rare occasions, there may be a special need to
-encourage the widest possible use of a certain library, so that it becomes
-a de-facto standard.  To achieve this, non-free programs must be
-allowed to use the library.  A more frequent case is that a free
-library does the same job as widely used non-free libraries.  In this
-case, there is little to gain by limiting the free library to free
-software only, so we use the Lesser General Public License.
-
-  In other cases, permission to use a particular library in non-free
-programs enables a greater number of people to use a large body of
-free software.  For example, permission to use the GNU C Library in
-non-free programs enables many more people to use the whole GNU
-operating system, as well as its variant, the GNU/Linux operating
-system.
-
-  Although the Lesser General Public License is Less protective of the
-users' freedom, it does ensure that the user of a program that is
-linked with the Library has the freedom and the wherewithal to run
-that program using a modified version of the Library.
-
-  The precise terms and conditions for copying, distribution and
-modification follow.  Pay close attention to the difference between a
-"work based on the library" and a "work that uses the library".  The
-former contains code derived from the library, whereas the latter must
-be combined with the library in order to run.
-
-                  GNU LESSER GENERAL PUBLIC LICENSE
-   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-  0. This License Agreement applies to any software library or other
-program which contains a notice placed by the copyright holder or
-other authorized party saying it may be distributed under the terms of
-this Lesser General Public License (also called "this License").
-Each licensee is addressed as "you".
-
-  A "library" means a collection of software functions and/or data
-prepared so as to be conveniently linked with application programs
-(which use some of those functions and data) to form executables.
-
-  The "Library", below, refers to any such software library or work
-which has been distributed under these terms.  A "work based on the
-Library" means either the Library or any derivative work under
-copyright law: that is to say, a work containing the Library or a
-portion of it, either verbatim or with modifications and/or translated
-straightforwardly into another language.  (Hereinafter, translation is
-included without limitation in the term "modification".)
-
-  "Source code" for a work means the preferred form of the work for
-making modifications to it.  For a library, complete source code means
-all the source code for all modules it contains, plus any associated
-interface definition files, plus the scripts used to control compilation
-and installation of the library.
-
-  Activities other than copying, distribution and modification are not
-covered by this License; they are outside its scope.  The act of
-running a program using the Library is not restricted, and output from
-such a program is covered only if its contents constitute a work based
-on the Library (independent of the use of the Library in a tool for
-writing it).  Whether that is true depends on what the Library does
-and what the program that uses the Library does.
-
-  1. You may copy and distribute verbatim copies of the Library's
-complete source code as you receive it, in any medium, provided that
-you conspicuously and appropriately publish on each copy an
-appropriate copyright notice and disclaimer of warranty; keep intact
-all the notices that refer to this License and to the absence of any
-warranty; and distribute a copy of this License along with the
-Library.
-
-  You may charge a fee for the physical act of transferring a copy,
-and you may at your option offer warranty protection in exchange for a
-fee.
-
-  2. You may modify your copy or copies of the Library or any portion
-of it, thus forming a work based on the Library, and copy and
-distribute such modifications or work under the terms of Section 1
-above, provided that you also meet all of these conditions:
-
-    a) The modified work must itself be a software library.
-
-    b) You must cause the files modified to carry prominent notices
-    stating that you changed the files and the date of any change.
-
-    c) You must cause the whole of the work to be licensed at no
-    charge to all third parties under the terms of this License.
-
-    d) If a facility in the modified Library refers to a function or a
-    table of data to be supplied by an application program that uses
-    the facility, other than as an argument passed when the facility
-    is invoked, then you must make a good faith effort to ensure that,
-    in the event an application does not supply such function or
-    table, the facility still operates, and performs whatever part of
-    its purpose remains meaningful.
-
-    (For example, a function in a library to compute square roots has
-    a purpose that is entirely well-defined independent of the
-    application.  Therefore, Subsection 2d requires that any
-    application-supplied function or table used by this function must
-    be optional: if the application does not supply it, the square
-    root function must still compute square roots.)
-
-These requirements apply to the modified work as a whole.  If
-identifiable sections of that work are not derived from the Library,
-and can be reasonably considered independent and separate works in
-themselves, then this License, and its terms, do not apply to those
-sections when you distribute them as separate works.  But when you
-distribute the same sections as part of a whole which is a work based
-on the Library, the distribution of the whole must be on the terms of
-this License, whose permissions for other licensees extend to the
-entire whole, and thus to each and every part regardless of who wrote
-it.
-
-Thus, it is not the intent of this section to claim rights or contest
-your rights to work written entirely by you; rather, the intent is to
-exercise the right to control the distribution of derivative or
-collective works based on the Library.
-
-In addition, mere aggregation of another work not based on the Library
-with the Library (or with a work based on the Library) on a volume of
-a storage or distribution medium does not bring the other work under
-the scope of this License.
-
-  3. You may opt to apply the terms of the ordinary GNU General Public
-License instead of this License to a given copy of the Library.  To do
-this, you must alter all the notices that refer to this License, so
-that they refer to the ordinary GNU General Public License, version 2,
-instead of to this License.  (If a newer version than version 2 of the
-ordinary GNU General Public License has appeared, then you can specify
-that version instead if you wish.)  Do not make any other change in
-these notices.
-
-  Once this change is made in a given copy, it is irreversible for
-that copy, so the ordinary GNU General Public License applies to all
-subsequent copies and derivative works made from that copy.
-
-  This option is useful when you wish to copy part of the code of
-the Library into a program that is not a library.
-
-  4. You may copy and distribute the Library (or a portion or
-derivative of it, under Section 2) in object code or executable form
-under the terms of Sections 1 and 2 above provided that you accompany
-it with the complete corresponding machine-readable source code, which
-must be distributed under the terms of Sections 1 and 2 above on a
-medium customarily used for software interchange.
-
-  If distribution of object code is made by offering access to copy
-from a designated place, then offering equivalent access to copy the
-source code from the same place satisfies the requirement to
-distribute the source code, even though third parties are not
-compelled to copy the source along with the object code.
-
-  5. A program that contains no derivative of any portion of the
-Library, but is designed to work with the Library by being compiled or
-linked with it, is called a "work that uses the Library".  Such a
-work, in isolation, is not a derivative work of the Library, and
-therefore falls outside the scope of this License.
-
-  However, linking a "work that uses the Library" with the Library
-creates an executable that is a derivative of the Library (because it
-contains portions of the Library), rather than a "work that uses the
-library".  The executable is therefore covered by this License.
-Section 6 states terms for distribution of such executables.
-
-  When a "work that uses the Library" uses material from a header file
-that is part of the Library, the object code for the work may be a
-derivative work of the Library even though the source code is not.
-Whether this is true is especially significant if the work can be
-linked without the Library, or if the work is itself a library.  The
-threshold for this to be true is not precisely defined by law.
-
-  If such an object file uses only numerical parameters, data
-structure layouts and accessors, and small macros and small inline
-functions (ten lines or less in length), then the use of the object
-file is unrestricted, regardless of whether it is legally a derivative
-work.  (Executables containing this object code plus portions of the
-Library will still fall under Section 6.)
-
-  Otherwise, if the work is a derivative of the Library, you may
-distribute the object code for the work under the terms of Section 6.
-Any executables containing that work also fall under Section 6,
-whether or not they are linked directly with the Library itself.
-
-  6. As an exception to the Sections above, you may also combine or
-link a "work that uses the Library" with the Library to produce a
-work containing portions of the Library, and distribute that work
-under terms of your choice, provided that the terms permit
-modification of the work for the customer's own use and reverse
-engineering for debugging such modifications.
-
-  You must give prominent notice with each copy of the work that the
-Library is used in it and that the Library and its use are covered by
-this License.  You must supply a copy of this License.  If the work
-during execution displays copyright notices, you must include the
-copyright notice for the Library among them, as well as a reference
-directing the user to the copy of this License.  Also, you must do one
-of these things:
-
-    a) Accompany the work with the complete corresponding
-    machine-readable source code for the Library including whatever
-    changes were used in the work (which must be distributed under
-    Sections 1 and 2 above); and, if the work is an executable linked
-    with the Library, with the complete machine-readable "work that
-    uses the Library", as object code and/or source code, so that the
-    user can modify the Library and then relink to produce a modified
-    executable containing the modified Library.  (It is understood
-    that the user who changes the contents of definitions files in the
-    Library will not necessarily be able to recompile the application
-    to use the modified definitions.)
-
-    b) Use a suitable shared library mechanism for linking with the
-    Library.  A suitable mechanism is one that (1) uses at run time a
-    copy of the library already present on the user's computer system,
-    rather than copying library functions into the executable, and (2)
-    will operate properly with a modified version of the library, if
-    the user installs one, as long as the modified version is
-    interface-compatible with the version that the work was made with.
-
-    c) Accompany the work with a written offer, valid for at
-    least three years, to give the same user the materials
-    specified in Subsection 6a, above, for a charge no more
-    than the cost of performing this distribution.
-
-    d) If distribution of the work is made by offering access to copy
-    from a designated place, offer equivalent access to copy the above
-    specified materials from the same place.
-
-    e) Verify that the user has already received a copy of these
-    materials or that you have already sent this user a copy.
-
-  For an executable, the required form of the "work that uses the
-Library" must include any data and utility programs needed for
-reproducing the executable from it.  However, as a special exception,
-the materials to be distributed need not include anything that is
-normally distributed (in either source or binary form) with the major
-components (compiler, kernel, and so on) of the operating system on
-which the executable runs, unless that component itself accompanies
-the executable.
-
-  It may happen that this requirement contradicts the license
-restrictions of other proprietary libraries that do not normally
-accompany the operating system.  Such a contradiction means you cannot
-use both them and the Library together in an executable that you
-distribute.
-
-  7. You may place library facilities that are a work based on the
-Library side-by-side in a single library together with other library
-facilities not covered by this License, and distribute such a combined
-library, provided that the separate distribution of the work based on
-the Library and of the other library facilities is otherwise
-permitted, and provided that you do these two things:
-
-    a) Accompany the combined library with a copy of the same work
-    based on the Library, uncombined with any other library
-    facilities.  This must be distributed under the terms of the
-    Sections above.
-
-    b) Give prominent notice with the combined library of the fact
-    that part of it is a work based on the Library, and explaining
-    where to find the accompanying uncombined form of the same work.
-
-  8. You may not copy, modify, sublicense, link with, or distribute
-the Library except as expressly provided under this License.  Any
-attempt otherwise to copy, modify, sublicense, link with, or
-distribute the Library is void, and will automatically terminate your
-rights under this License.  However, parties who have received copies,
-or rights, from you under this License will not have their licenses
-terminated so long as such parties remain in full compliance.
-
-  9. You are not required to accept this License, since you have not
-signed it.  However, nothing else grants you permission to modify or
-distribute the Library or its derivative works.  These actions are
-prohibited by law if you do not accept this License.  Therefore, by
-modifying or distributing the Library (or any work based on the
-Library), you indicate your acceptance of this License to do so, and
-all its terms and conditions for copying, distributing or modifying
-the Library or works based on it.
-
-  10. Each time you redistribute the Library (or any work based on the
-Library), the recipient automatically receives a license from the
-original licensor to copy, distribute, link with or modify the Library
-subject to these terms and conditions.  You may not impose any further
-restrictions on the recipients' exercise of the rights granted herein.
-You are not responsible for enforcing compliance by third parties with
-this License.
-
-  11. If, as a consequence of a court judgment or allegation of patent
-infringement or for any other reason (not limited to patent issues),
-conditions are imposed on you (whether by court order, agreement or
-otherwise) that contradict the conditions of this License, they do not
-excuse you from the conditions of this License.  If you cannot
-distribute so as to satisfy simultaneously your obligations under this
-License and any other pertinent obligations, then as a consequence you
-may not distribute the Library at all.  For example, if a patent
-license would not permit royalty-free redistribution of the Library by
-all those who receive copies directly or indirectly through you, then
-the only way you could satisfy both it and this License would be to
-refrain entirely from distribution of the Library.
-
-If any portion of this section is held invalid or unenforceable under any
-particular circumstance, the balance of the section is intended to apply,
-and the section as a whole is intended to apply in other circumstances.
-
-It is not the purpose of this section to induce you to infringe any
-patents or other property right claims or to contest validity of any
-such claims; this section has the sole purpose of protecting the
-integrity of the free software distribution system which is
-implemented by public license practices.  Many people have made
-generous contributions to the wide range of software distributed
-through that system in reliance on consistent application of that
-system; it is up to the author/donor to decide if he or she is willing
-to distribute software through any other system and a licensee cannot
-impose that choice.
-
-This section is intended to make thoroughly clear what is believed to
-be a consequence of the rest of this License.
-
-  12. If the distribution and/or use of the Library is restricted in
-certain countries either by patents or by copyrighted interfaces, the
-original copyright holder who places the Library under this License may add
-an explicit geographical distribution limitation excluding those countries,
-so that distribution is permitted only in or among countries not thus
-excluded.  In such case, this License incorporates the limitation as if
-written in the body of this License.
-
-  13. The Free Software Foundation may publish revised and/or new
-versions of the Lesser General Public License from time to time.
-Such new versions will be similar in spirit to the present version,
-but may differ in detail to address new problems or concerns.
-
-Each version is given a distinguishing version number.  If the Library
-specifies a version number of this License which applies to it and
-"any later version", you have the option of following the terms and
-conditions either of that version or of any later version published by
-the Free Software Foundation.  If the Library does not specify a
-license version number, you may choose any version ever published by
-the Free Software Foundation.
-
-  14. If you wish to incorporate parts of the Library into other free
-programs whose distribution conditions are incompatible with these,
-write to the author to ask for permission.  For software which is
-copyrighted by the Free Software Foundation, write to the Free
-Software Foundation; we sometimes make exceptions for this.  Our
-decision will be guided by the two goals of preserving the free status
-of all derivatives of our free software and of promoting the sharing
-and reuse of software generally.
-
-                            NO WARRANTY
-
-  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
-WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
-EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
-OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
-KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
-IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
-LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
-THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
-WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
-AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
-FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
-CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
-LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
-RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
-FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
-SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
-DAMAGES.
-
-                     END OF TERMS AND CONDITIONS
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -1,16 +1,6 @@
+# SPDX-License-Identifier: LGPL-2.1
 #
 # Copyright (c) 2004, Intel Corporation.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Lesser General Public License as published
-# by the Free Software Foundation; version 2.1 only. with the special
-# exception on linking described in file LICENSE.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU Lesser General Public License for more details.
-#
 
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -1,15 +1,6 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 #ifndef _ACPI_2_0_H_
 #define _ACPI_2_0_H_
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -1,16 +1,7 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2006, Keir Fraser, XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 #include LIBACPI_STDUTILS
--- a/tools/libacpi/dsdt.asl
+++ b/tools/libacpi/dsdt.asl
@@ -1,17 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /******************************************************************************
  * DSDT for Xen with Qemu device model
  *
  * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
--- a/tools/libacpi/dsdt_acpi_info.asl
+++ b/tools/libacpi/dsdt_acpi_info.asl
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 
     Scope (\_SB)
     {
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -1,18 +1,9 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /******************************************************************************
  * libacpi.h
  * 
  * libacpi interfaces
  * 
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
- *
  * Copyright (c) 2016 Oracle and/or its affiliates. All rights reserved.
  */
 
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -1,14 +1,4 @@
-/*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
- */
+/* SPDX-License-Identifier: LGPL-2.1 */
 
 #include <stdio.h>
 #include <stdarg.h>
--- a/tools/libacpi/ssdt_laptop_slate.asl
+++ b/tools/libacpi/ssdt_laptop_slate.asl
@@ -1,17 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * ssdt_conv.asl
  *
  * Copyright (c) 2017  Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 /*
--- a/tools/libacpi/ssdt_pm.asl
+++ b/tools/libacpi/ssdt_pm.asl
@@ -1,18 +1,9 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * ssdt_pm.asl
  *
  * Copyright (c) 2008  Kamala Narasimhan
  * Copyright (c) 2008  Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 /*
--- a/tools/libacpi/ssdt_s3.asl
+++ b/tools/libacpi/ssdt_s3.asl
@@ -1,17 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * ssdt_s3.asl
  *
  * Copyright (c) 2011  Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 DefinitionBlock ("SSDT_S3.aml", "SSDT", 2, "Xen", "HVM", 0)
--- a/tools/libacpi/ssdt_s4.asl
+++ b/tools/libacpi/ssdt_s4.asl
@@ -1,17 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * ssdt_s4.asl
  *
  * Copyright (c) 2011  Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 DefinitionBlock ("SSDT_S4.aml", "SSDT", 2, "Xen", "HVM", 0)
--- a/tools/libacpi/ssdt_tpm.asl
+++ b/tools/libacpi/ssdt_tpm.asl
@@ -1,17 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * ssdt_tpm.asl
  *
  * Copyright (c) 2006, IBM Corporation.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 /* SSDT for TPM TIS Interface for Xen with Qemu device model. */
--- a/tools/libacpi/static_tables.c
+++ b/tools/libacpi/static_tables.c
@@ -1,16 +1,7 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 /*
  * Copyright (c) 2004, Intel Corporation.
  * Copyright (c) 2006, Keir Fraser, XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
  */
 
 #include "acpi2_0.h"

