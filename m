Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95A76FA24
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576890.903552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoMF-0006H0-9b; Fri, 04 Aug 2023 06:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576890.903552; Fri, 04 Aug 2023 06:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoMF-0006ER-6N; Fri, 04 Aug 2023 06:32:19 +0000
Received: by outflank-mailman (input) for mailman id 576890;
 Fri, 04 Aug 2023 06:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoME-0006EL-O9
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:32:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a84a7ed9-3290-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:32:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:31:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:31:48 +0000
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
X-Inumbo-ID: a84a7ed9-3290-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BE8IazFiMcKlt9EJxkTDglsHSdtX1En1Utjyrg3afWbPKgs8Rcd93/EIhld5TOWfCIWjbXX7OeK/BVWUv5ZcqqzEy7+TpvHWvqjzukfBdTu7wbv7xSpuq21DS5BJ+M59hwfmSHc7d+XBp/J1yHclJXTuloan5JH6/vr2NUQDUAZJZ6nlw6MAU9fTxsxZkLSlZiKXkAcU7SyPtNttungAWfhVV42CHqWCziLIeFWA+FRk7F9BuZR5HqPRjnYRl5/+owP5yN1Hd0yhMkwah2TKPEBReBfBRQ3uqFmgbwI3cuJM9J1+voGFYZPxckXxZc32HgwCou0a4fhGAx6Z5prFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8ESduLaN901hoKEazmFjnm9TC717oIo0zL1AjWTDiI=;
 b=TZMSoqhzDlqo8z2+yG1eVTIeXzqzMpdUDHHGtDDCnIWZDntQrHkQDq6Nle5KI9r2KRPHP1ZOEIw3FZAGn1S/lQDqHQ0Nmlh9M3qblS5D+uH5R/URZKk+i+Ha6ZVVX4FUk135OXqLCz+/N0mFzNSQ3ErcONNwq9wCJlq63N2uQq37jzUUfhGevVSpJgRQ+NYOFdWSOwKMneInKZH/LFIHSoN8XujxqPMN5LKwTC7W/51p+MzrD+Qe5tqQ7FWScQ94bk0vp5YAkCo1/+9ekmVUzXX2003t9oBULppVtEXuNvcQvM1Rk8ndKIHXlGF9h3lgalsGIfJgTE+7jlz0qfkdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8ESduLaN901hoKEazmFjnm9TC717oIo0zL1AjWTDiI=;
 b=rl3zp4Y+kxfANDy6gJJaRy2qAPulxXM6RdBSKvC5csSmUqDvJzbARBOkC6klPf65Ptm5RZZNCtUufXzQsNFlfPJX/5UdtfCBtBxiJ6KkhrkP7UxNEtJXkkuCPO4KZCS+BwS8PFMCClalAWAJTlYwHWGml6Ok3k9JIgHx2rwC+r3cyp0+Lfzt6DgODTtTEBUkDb1nb4Ece0hEbtEwbJ64UCFZjK4WodTEFdgeFCd0P/vlxN3oWezQBG7M4sg0YseWCZHFYLdkDByW7hDuzkE8YUz0WqrTocr6mbPodjZ6D1sVvNKFWc7AJLwxENTZAvLZve95FIFREPZvWrWugPGuWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb27543a-a059-e9ac-5373-255a8f6edc14@suse.com>
Date: Fri, 4 Aug 2023 08:31:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 8/8] common: honor CONFIG_CC_SPLIT_SECTIONS also for
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
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5d8f3f-4935-408d-cb3d-08db94b47ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LRTipeec2RrFtz2YmC2S3V75mz6J9IVrn8Cz6aEK2EgsbF1KXjISQJCcd/taM70zyOjMAI076W5ePPMThodJMnGkB1r+EjUSiZZQzy0JZ5Rha2e8ill4++Nm6ZtEWDMm86KY9A5ODu7DsqcVUdQ6zwOO1CBfqha6B+j6Y6jWIVVixJFCDnEveFq4XH8wbO1H7sOC9JOKiIywmmatIORRM2ef+XjfmJ4NYcIAQudDWaS2k3gUbq5jf9fDaposn+z9eLQz83HU7He+wFGmoY6FCsNyty+F1dch/MGxINqyh8ADKezpeoRw+5LkpIEvusv8YBQBVkJeePuF2lVjdG8Z3x0sCztApDX36GZWIm9OUe67AdiuSbUuR+xUab1gU3qmMss5u6jq1exnnkAPQ2GDbTJ3R+Yh5cMy51znEyAuhIWZAbsPINdrnB09hGPuWffWVZVA1woivJ1T5pY6fHf4SWLu2LNIraldcOFz/pPnmQLdkWPcd3x1RGc+Hnx6CTikzJ357sEMVvOYeqRegqQbd2s5FjXsgx8x7vAZmjeuBwECTRrW7MN1+33pEvN1jP0kz1ff15NZXCTltTxWXf1e0/qL2nrcfPW/bfW9nZJv4yZC4sk8sd9ARs2Ma9uQoYtvo5j1p748nLHebn9RROhwYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(7416002)(6506007)(8676002)(8936002)(31696002)(54906003)(6666004)(6512007)(6486002)(478600001)(31686004)(38100700002)(2906002)(86362001)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FLTmNKazJndVBrMXY4MDY3aXQrMmo5N3hITmN5TmowT2xHU25oaGltS0tm?=
 =?utf-8?B?YjRBRnByNldrWDZWSHB1UHBvVHd6U2xuekdSYXRyNlVZbW9NenFHdWNPdVBH?=
 =?utf-8?B?ajFzam00ZTI5YTkxb3V1WlFEdm9TdEZ5anRocG9vOEhUVUd0TW02em1MeXd4?=
 =?utf-8?B?aEFUalFtL0kwbzl1VkhPeEUwMERUU3hHWThxYjVhajlKYnFBaUR1Uzd0Q1Zj?=
 =?utf-8?B?NzJQbVdPSTBPQ0ZhNEZkOXIzMjhkYUZ0em1DVnEwRGxFdmtKVTZrZlVJZFg2?=
 =?utf-8?B?K2Y3bkFVN25YWHMyUW1xa1Jid0ZLUDkwZ0hFZkRqK0Yrd3B3N1VrZWNnVXpK?=
 =?utf-8?B?aUNHa0d4azN6RFJ4Mkg0ZTVhQi8vNWM3Sjc3NXpLNFNmakc1eitZMFpLVTBO?=
 =?utf-8?B?TUFNaWxOQzl0NHJMZHUvVjJHc2xsSnFiWHhYR0NBeTdxeWI2azdvcTkwL05B?=
 =?utf-8?B?ZlJWMmIrY0l6VXQrQnJwWmR5TEVDd09lWHpUTEVtYVRjMlp1c2pqQ3ZTWHhW?=
 =?utf-8?B?NjBMRUhrWlJxdGVzTU83VDJ0VnM2SXR5QlVYUXZJczQ3SDNhQXFtUWlUZ3Bs?=
 =?utf-8?B?Z0lhVTZtTzhpRmhuRndSN3R2cDl5bHV4dE40Vktydm5WWXI0clg3MDB3N3Av?=
 =?utf-8?B?V1hwZVBLUHRyQkRXOEIxRVl1b3E3TWpObkVVdW9DdVFwUE1kQ3VlU0ZLRFRD?=
 =?utf-8?B?bmJlclNMQzFIbUR4RUROam9UTnJkN3VtQWRpempZQnYyQ1dIRGo3bTlzbWNs?=
 =?utf-8?B?ejZweXQzZnZ0YkFnSWpqeFlHa1NFYVluV2xwdVZKYkc1dmtXcDBBWUZUVDl5?=
 =?utf-8?B?Vld6M3VXT1hHNEljbHVjMHlRYkt6T1YxbEZsZjcvVzNKUzNjK2N6ZUdESS9v?=
 =?utf-8?B?YU40eHQySjVXVFN1SDNKaWtUVW1IQWE5ZzBJTnFzbE11ZUlOcUtGMmhCZjRP?=
 =?utf-8?B?NWl2QVdpbkgyR0trMG5JUUxSN21FWHhRMldrTXQzcGFYS2hTSFl0QUM3SGR1?=
 =?utf-8?B?VklUU01BUFZpSDYzOUR3cGRFdnBJQVpjTFEvd3lCQitGbUFNeEFBWDc0V1lT?=
 =?utf-8?B?MzR3NWlPdVI2eWhFSnJ0emloY3ljczJMbVYraytlZmkrVHZQYkpwSGtQZG5S?=
 =?utf-8?B?cE16UG45M0xDMGpITDF1QmVoWG1ETzlPZkYvSjNDSnNGYUNXbXlOaDBIeFJv?=
 =?utf-8?B?Zmxsc2RBelVqdk9KZjZyMDNtU1hSbjBZdjI0N1ZkREswQ3kva3RhaGNpYWRM?=
 =?utf-8?B?cFFReXl1RGREdUxXQTBBa2NkTVFuM0JZeWRXT2cyNW1BQ1pMNmkyWHdpOHBJ?=
 =?utf-8?B?K3J4a2U3cWRrbk81VmJwcjBKVU5VNWVaMitISUFFcGlFdEFFTTVwb1RURDgy?=
 =?utf-8?B?Z3lFT3g0K0hRUDRCd28zLzB0ZEFkdGlDeXVqNVh4Qk96c3kyQk0vZlFxNnE2?=
 =?utf-8?B?UWZ0VjFOUmI1NVVjUmVsVUV1YWVIWFI3OGhGU0NXb1dydm41cTdyREpmZDZS?=
 =?utf-8?B?dnNlL3lhcmhKcTdGMnFlVFBKMVBnOXJWaVRlL09MeUFYVTZlVVMybDJIcklx?=
 =?utf-8?B?NkZYUW1oK3RxR3o3RVkyNEV2WVNGSUZ3QlRwL2w5YXB2anNBcCtCWUJ0QXBt?=
 =?utf-8?B?N01QWHA0Mm8yV3RnT0d6WFdwODRQcXFkK0hIU3E4REFpSnkvNXhrVmVwNENX?=
 =?utf-8?B?aS8xZU94cDB3T2tjRDM3U2ZJMi80Z21zTVljN0FHYVdwWjNHUFQwS0pCbHkv?=
 =?utf-8?B?UDFwbHVKWFlCMm54YnhjUW5XSEFEQTZOTkVLSWQzTTQvK0h1TFdQbGNQRHN3?=
 =?utf-8?B?ai8rbjRkT05KWEFMTFNTM0JGYUZCWFJBS2ZYRWJZMlFwcDVzU2hlV2ovZ1pF?=
 =?utf-8?B?b3BYSk5LbG9tWlRjWE9iOHllSWRPNTFWMGtlZW5SLzN6RXlTWmEvclZuTVBv?=
 =?utf-8?B?bGZrTjIwMUx0STh6RXlHejRSdjlLb3E3YzNvZVozTkFtdzQ3bm9sNSswditU?=
 =?utf-8?B?ckkvU1d0eEcvRjhoVTh6YW5qRkExZmlsbjdETWJDbm5yemR2WUpZUDFML21C?=
 =?utf-8?B?OUpOc1NQSUdlazBOTk90SkZ2dXlmYTRWY1NHZUQvZG5xeGZjQklSZG5MRVhS?=
 =?utf-8?Q?E6GMYFG9kdobM9Oae9VA/V3Lp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5d8f3f-4935-408d-cb3d-08db94b47ad8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:31:48.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9TZGOuYH95OnhlSGTOwIFYrkRapOM9067qrSi2f29oS+b17cfaF8fOgy2C+31Aa3LjdjWqW+Tvv7MK9Uaim9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Leverage the new infrastructure in xen/linkage.h to also switch to per-
function sections (when configured), deriving the specific name from the
"base" section in use at the time FUNC() is invoked.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
     wanted side effect of this change is that respective out-of-line
     code now moves much closer to its original (invoking) code.

TBD: Of course something with the same overall effect, but less
     impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
     instead of $(firstword (3)).

Note that we'd need to split DATA() in order to separate r/w and r/o
contributions. Further splitting might be needed to also support more
advanced attributes (e.g. merge), hence why this isn't done right here.
Sadly while a new section's name can be derived from the presently in
use, its attributes cannot be. Perhaps the only thing we can do is give
DATA() a 2nd mandatory parameter. Then again I guess most data
definitions could be moved to C anyway.
---
v4: Re-base.
v2: Make detection properly fail on old gas (by adjusting
    cc-option-add-closure).

--- a/Config.mk
+++ b/Config.mk
@@ -102,7 +102,7 @@ cc-option = $(shell if test -z "`echo 'v
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
 cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
 define cc-option-add-closure
-    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
+    ifneq ($$(call cc-option,$$($(2)),$(firstword $(3)),n),n)
         $(1) += $(3)
     endif
 endef
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -407,6 +407,9 @@ AFLAGS += -D__ASSEMBLY__
 
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
@@ -90,6 +90,9 @@ SECTIONS
     .init.text : {
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
@@ -89,6 +89,9 @@ SECTIONS
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


