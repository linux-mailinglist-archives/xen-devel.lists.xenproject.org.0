Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855465B2FB4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 09:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403863.646118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYLr-00025j-S6; Fri, 09 Sep 2022 07:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403863.646118; Fri, 09 Sep 2022 07:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYLr-00022G-P7; Fri, 09 Sep 2022 07:22:59 +0000
Received: by outflank-mailman (input) for mailman id 403863;
 Fri, 09 Sep 2022 07:22:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWYLp-00022A-En
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 07:22:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 393b55f1-3010-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 09:22:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB9013.eurprd04.prod.outlook.com (2603:10a6:20b:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 07:22:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 07:22:54 +0000
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
X-Inumbo-ID: 393b55f1-3010-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJQo4EkoYn85e1604VR5I8Gm3gV6slaHToBFyp0rBlo+8HggCCpoZnkvbuOovaTmlgCWs3SrsDJWIDTLeDheIgOTWq1uQJ4EswEbFEBu8XjAfnYUZGd+xKU+fQ0b8S1vqfTEdlPT+acTiV1aVFzA23BQlwcCPJKf68pFJDHp9YBd0OG7LN10tzWa+zQQlYxhIuxFjq91gFT4tYEgOxXTGqQiw0sWF6ocX98Z9wFjb0RfF18k3jhkURQAvtXCsCEhh8VY7X9RlNsMxgyOtQwmmq/tul5ue1vk0DVzQi2qOmvYy3lGTPqVlPE4ROBl0iUW9rf21eh4Y4d/JMn1LkqEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w64Ecx1+8EL+wrspYIaDYT1Izwreh0mSF8hsvv4Kvz0=;
 b=UzQ1dvHbvqBiWQepYGmtPtlurjiVtQ9yj+GNChj7O9mOyZepTdDlZOoDzkYaGymIMJOPmIagbQlRcA72aO5qQi2L+xgRMEZs3dLvTgO0gZYSH+bDRTCWeW8wcDwds3OOhNYgVuOo8mU6ntIys6TUUHSjbTtkhcH5Dp/tY3T4Uw+sUUNt1ytdarzRQwNiMhx9w0waK7DULTWjZjoIlZRGnyFcQ0RKGDAWVCiVDWcPzAmdoLJlUtYDHJVPSyJlevMJFW06lzTTn/L1+E8IKcZ1sZC+k9KKmR65/+lIt1PBKxZJronwhaacm8EqXi3lwUCPg28301ZpZzweLU3hqmqAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w64Ecx1+8EL+wrspYIaDYT1Izwreh0mSF8hsvv4Kvz0=;
 b=EgEw314XzgmtbkgNb9clilLM3mKxRl0rblvLMwplDtZKj3kpiWTaysX2Qs9wvmCJiNuav0mAqYbbCZ1NsKqmhlBcI70B41b3FenAkwUGB0zCiBxwDfsf6kdUDr6+I8HgxpYUytMzGderTB6loqgZMtUhBQ8GWg+zkbDssoBO68hOjeEYOWcTU7jCJhAtGoO8SjIbh26C5YYVTvspfzxaFBtqX94Lb+5P7O38/UWtyC83f6CQpnmMmD7hn91hi/rO+GNN8ZCE8mT0U6LacJmaws6ch//Seed8zV6/Xux9qZpL0SdlQEnXUYplbKOZK9PBmK6m4h86IOY3pd+z3sti3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
Date: Fri, 9 Sep 2022 09:22:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd4a91c-138c-4ca0-d199-08da92341c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XJxaXwHsd0BC7GHH7oulhzduW4grWkUQQiuPiqhRu1I9t80TUiVeQIgVpVqlwtf76unAW1CupUAKyxczRTBUNAau4PoJfd0FzeqCk96IQaVBohfQJQS6tHO30//LZ7rZjYwoaCOAexi50xORsnhPRxfnrwHqsrL2Wpt16mw/G/4UaigcTT715wulED5IfX576HZSDkPPsdkKhopbzVDQylzGwoHBSAD0DEm+PP3KeoYwU+kKPJyf+Lj3C02IAC6fzICPtT8cR5ZB9MJUDKPYIL8sNDKCPZvF292UwDEEuU9Z3gUJ8fCevzKxcWGNwfLfwUdR7Wb76cqW2SOyxLH/CdtdiiAExWyl9oy8fXwwPnVIt73MPb0Jvq/K4TwEzDEBxTBnriKmiKynLR9BmgDhyEzzonl0I85IZGFHd+8XkVGrwTm6QC3bB5uTLHnAFQzKjUDWGMONzsK3demq+R8zU0tWWVunkbo0vNBc4EGQ9R5Pj3vGudWkZI9yISHb6aEZuNhJRaohMmHGpd7p6AdOyETR5CJDMSpJtNlKC5/jYwPFXtGYwUv9y96WNRqy5kwWFhXXlyfOz6r0bFm1yof/6n2AyOn7cOMbOfXQ9JTmcwN3GBLkV6ydkVGV88cD6hD2ZVceNrMTe05kzG8vuwps0kI+lUtyUUJ1dyq+rl8CVj6/fmoPQ91gmvlFez29YZ4OGWqR2f3BT7/bfXC7UIEwy4o2lRlqwrefhI2aNmOb3f6VmdXSfg6SMad6wiUQXWR9s9ewarBjY5yYmCKM2CiSiw5UYwTlXMESlgpUAJjzSzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(366004)(396003)(346002)(31696002)(86362001)(54906003)(6916009)(316002)(6486002)(31686004)(8936002)(478600001)(6506007)(186003)(6512007)(26005)(2906002)(36756003)(5660300002)(41300700001)(2616005)(83380400001)(38100700002)(8676002)(4326008)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZktQWUxmY0lESmdyRmVHczhRMXZIb3FrYWs1UFVUb0JQUWVBekZraXIyU1Vu?=
 =?utf-8?B?SWlBVlB5aGo0KzN6NTdqRytYUmRjK1lpbU50dnNldVIyeG5LVitVbWpZMElN?=
 =?utf-8?B?ZnVuQ0N4Tm50Ymx3eUE4bFFRL29oRlBnWWV2UUc2RVNQcUxaak1tL0k3QjFF?=
 =?utf-8?B?ODdWclk0V2VBZ0FNNWhmQ0Z3SjFpSi94dmV3aStIWUpOVXdvQmJWdGdVWFB3?=
 =?utf-8?B?bGkrWUZ6aDgraWRJZHBXN0JXVC9BaXNNNHROSk1MVlpZdUxmNlVqcGhiN2VZ?=
 =?utf-8?B?K0NObDhJK2dIbUVPNExIWXJJZy93L2NUNm9JWmJDeFRCS3VlbDNLanN4U2p2?=
 =?utf-8?B?U3Jud2hUNEROeG9NLzlFYTBVd3VTVTZ3LzVqZFJURG1JcUgrVndWWmhpZmhJ?=
 =?utf-8?B?aGxJalgxTlBET3FLRHRySElFVTRsNk1BYzhHWDE1cHRUNzIzQ1R6eGhOVEdQ?=
 =?utf-8?B?K0RwVHRZWWhJMW5FK2M5cXZnd1V0NDZMcUlZSURERHk3VUtOUVpoMmRJY3Er?=
 =?utf-8?B?cm8zR21WWDNpa1prREd5bzZETEdoVXFiQ0YwTnV6RlZPN1Q2ZnZkOS90b05p?=
 =?utf-8?B?a0hWOGVwSStORFA3RzFtd3daUWRYOC9FRFNaUXc5bDNjb2NRNTFqT0JRM2tM?=
 =?utf-8?B?c0w5WVZwUXQrM1pXcXZJa0V4UWtWclJWVDl0Z3JVTlEyQ0JDSzQ4TDRFZjQ2?=
 =?utf-8?B?S0QxWTQrSnRwU2srcE9NT2I3ekVubEF2emZmaVM0L1cxZEV6eDdOVnExaVp4?=
 =?utf-8?B?bFl5d0tOZVlEb2xLd3RJUThrbis4cDByM2hzWmYzUkVNUjFveHA0b2J3dlBl?=
 =?utf-8?B?WFlLUjgrbEcycFlSbzN6WGhjdFdET1EzdkZ3TDhWL0h5TmwydmtGQjFmQjJQ?=
 =?utf-8?B?dE5lOVJsVElLYjh2M0dKYlJsK3dkV05HbVVoc3R6SXo3VVdaN2VJeW1BSEFz?=
 =?utf-8?B?bnNVMlBmcDBDd3kyWEtvRmM1Y2JJZG5GNmgzNkF6Q21NdUpCSzhySG9mR1FY?=
 =?utf-8?B?OWZGd1ZDNUJ1QWtmSkJzZWpwZ0VQVERFd0FtcmdLd1NzRTM2UjNWNEFqMmpa?=
 =?utf-8?B?ZWo5aVhmYmV2NDJZWVRFMFdwcDJRdWE2eVJkZG1sN2JWbExSUnVkYUhvYUk0?=
 =?utf-8?B?UFRtYXZPeU1HalV3ZnljZ1FkcUxHSGlwVHZnenNzYXA4cWNQdjM4Ynk0ZklU?=
 =?utf-8?B?OVRJUUlJbTZwdVlrY1hUakRpZmRqak9WMDk1bzN2QUdma0ZvekduMHg0djlT?=
 =?utf-8?B?YTRZem5GNnpzWjhmS3h5c3BUTEJFUysyYVFOUHpHeWQxUUdGU2tYWXJQYUtq?=
 =?utf-8?B?NDAySG1aT0VIVjNIUHdZbHZmdGJXcUt1MDNWOFBJKzFDRHZ6THZPdERyaHl0?=
 =?utf-8?B?UmtodjZhRVI0OCtTOWR5U05WSXdMZnRSbUZEZ2JaekpEbjQraWYyQ0w4NUVa?=
 =?utf-8?B?cWRQQitDRnJXazZramU5U0V0RGMrcXdZSlpTcG5ONmdST0duN3Q2eUtJVDZP?=
 =?utf-8?B?QjdQYjI4TTZlbUkwM1UzUGpvWjdUcnRwR3lYWHNWNWVMY05UYTZUYlhzcnlo?=
 =?utf-8?B?RGFaN1VuYlAxbHRzek9sOWhiQ0lqUS81ak50bFFWcnFmMVhXa1FXNFZyWVFn?=
 =?utf-8?B?VFFwRHhwVVRlU1BPK05QRDQrOEpxZHIrMmVndDBKMkloYVp1bWxkUzRvNGo2?=
 =?utf-8?B?cS9rMEorWG1EVTRBVFVVWmJRYjVVTHU3Vm5QTHVydkJZV0o4UFVRVituNEtw?=
 =?utf-8?B?S0o0dFowQjVjOTQ4MHM1Vk1IVE9INnc1bnplVTVyTU92UnVuZXBPSytuNDhi?=
 =?utf-8?B?a0dQbVM0ZXZ5NWcwZXRNRTdZeUZuZWhiN2JYMS90eW1ndndiTk5YWmxwbUhM?=
 =?utf-8?B?VzMwUnUrUUlza1VTdUk4LzgwRFgzVHBaUXRaYVcwOFVzOHR5aTBOMDVkT1cr?=
 =?utf-8?B?RDJNTWJncExDZ28rMWVnckJZUlNNUW05NlhlYmRDNGh1ZWxGbVlWdXhxOER0?=
 =?utf-8?B?TTRHQVNMdmVWczJkRElEd0VPWVozSjhaQlhlOUJ3cS9obTYzZ09pSWRtSUhn?=
 =?utf-8?B?cjBDM2VtTlA5Qkl1b1R5WlVBWUZ1UU41RFhvN095bHJhajVLQlF5aDVETWp4?=
 =?utf-8?Q?qm3D7mkcON9WWZ3VW/vvENqdW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd4a91c-138c-4ca0-d199-08da92341c99
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:22:54.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB7MzE48THrPkP/Z4JLM/80rBXSqloqQ65a/7T5YTiq7xOD6bUh+veFp+gboixnrZflutQsC+bWaEk5tL6fD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9013

While I was suspicious of the compiler issuing a diagnostic about an
unused linking-only option when not doing any linking, I did check this
with a couple of gcc versions only, but not with Clang. (Oddly enough at
least older Clang versions complain about the use of '-nopie' now that
we actually use '-no-pie'.) Filter out the problematic option in all
cases where the variable is consumed for compilation only (which right
now is everywhere).

Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
compiling, the option could be omitted from that variable right away.
But if any compile-and-link-in-one-go use appeared, there would be an
issue.

--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -13,7 +13,7 @@ endif
 
 CFLAGS += -Werror
 
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
 
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 CFLAGS :=
 include $(XEN_ROOT)/tools/Rules.mk
 
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
 
 CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags)
 
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,7 +1,7 @@
 ########################################
 # arm-specific definitions
 
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 
 # Prevent floating-point variables from creeping into Xen.
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -10,7 +10,7 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
 
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
 $(call as-option-add,CFLAGS,CC,"crc32 %eax$$(comma)%eax",-DHAVE_AS_SSE4_2)
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -12,7 +12,7 @@ endif
 $(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
-$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-options-add,CFLAGS_x86_32,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
 ifdef building_out_of_srctree
 CFLAGS_x86_32 += -I$(objtree)/include

