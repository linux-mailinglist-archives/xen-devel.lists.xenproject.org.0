Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4B690CED
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492592.762208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8p4-0005ue-Vo; Thu, 09 Feb 2023 15:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492592.762208; Thu, 09 Feb 2023 15:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8p4-0005rE-SH; Thu, 09 Feb 2023 15:26:54 +0000
Received: by outflank-mailman (input) for mailman id 492592;
 Thu, 09 Feb 2023 15:26:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ8p2-0005r8-I5
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:26:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c57745d-a88e-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:26:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 15:26:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 15:26:48 +0000
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
X-Inumbo-ID: 2c57745d-a88e-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhfrt6BTgik3eOsKMdEGv1J9PhYzFlV2TOTbovHqBb++zTkIv0+/sKwXmh8efBjpY7t+esODK/7LP9ecB66Pxg/PnHdYBqAYWXZ1+lHyMD5Cxaf6hiB3Tal2Vo09cn//EBfrszYHpVc2IbQ99LGXkTDwnHL7b3xeVYv9CLYK44xghOoUCU28o1awyuNRG2vxvmXD71RoXe9jkrgx3NEPm8AKSD8UQMD5jpOPcLv0YRQ9PcoTDGZSlXnJmVsZ0QJnJP99AfiXEOC4Df6KR7dfVlcsO+b/qj/xx0GYjOWWYmKEnuWybl58iPtQKWDBOAOT8QSz8fpX92b6Fd0onZNmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E8uy3EmUjVT0/Hgl1+aAmLi46INoWFLAroCorsyqrw=;
 b=aBZ5Rknwghj5IbJe4hwEdpgjqttZJNLuHDFxlzYIkxV/tNhCoX8o853wRSCY8i96tqc0IA8LhStR7KSLVviM6rczx2ixOQrHPdXhBGL3cUv+3+9MxEY08wZOSP9cm878sqHlQbVKh10yZnYC/LVP6Dxq3VIO72yMhhEsVgwbfFp6NWlGuDLACRuf5LsIdttUDGiKsGMdMuNlP4pcmekmGnlJyCYaM/zi86/5Ac/YkFqgy+FLyjqbZIRRQcJZcF6tbWHlAGmq9Lx9talbe7uTKhxlMf0JkZoOouQ3G38nXqbMEvEYH1aUhbfVIO3SATS9FrXnrpMJnNlHgKs4P/NZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E8uy3EmUjVT0/Hgl1+aAmLi46INoWFLAroCorsyqrw=;
 b=HcpDdjMEry6TVaOPASwuFz9XROFJU4vBBa0vlCs72hBf8yT3kPv3p/Ox2vzmMs2fwgN9C8Pi/y9TlQs/Cj+Igx71uHguswTZip6PfHTX8DqV9Mmnzy4ei+8gKESAErzxRgHM6Izp364kKpUWwIA/9ILu5P6KGUBvko5FhGqw1SuXT7aRpWYHoRDMi46UXoGTLbkFRPYnU6wzYO2JFFxPJjzVTWui0bp4wqKC4KvWAM7j2UdlrI7hrBhamHwn2x7h00DBqJTwj+FKDIxwLPqM8WSdLWr911hk9SgfQh3FfBsRGReigJ5mbeJi5hatNjHL2IxfNPQ6UH94/6iP0QBU5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6eecd308-b871-7826-a99e-57c6d7d52140@suse.com>
Date: Thu, 9 Feb 2023 16:26:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: move double-$ into as-option-add
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 8796582b-3663-4736-5a54-08db0ab20f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RIC7RGBFIIW03kn4fEZo1rPnKZPH9WD+9I7ZR3hVfn71Iaw7ISFhxXkzrfSLzVs3yhVo/9ZJIFsqnU4NOxKNMBQqHvn5xu2YrmM33L63M3YLS4fAySQH1AIkZFSFGbD2sLUmXeBGDJbNJquB1TVoibbmNHal8Nld4IYUXO5E5wA5BTZvtv3aXhBoGnZFqs7mYufZtN3Sz4xlorCSTTSLCprhCOFlnMNQoUq+OIBQn4Uo/L56kLOzHTOfPAXtGFYYekWg73FsdxpGsRWHBMvWSn3dkVgrDRzYrsc/lG+Qv9JwTVhxzeQ/q9D7RlqNJA87+oR6xGiWAFQM16EU5s7IMqjmROFwYAxcFxovLw5S+gSK9MmOFbHbMeU/jUjVMYGNyPrMgwan9B68cF6L4nMo0tk9XGGz6wauTil9YSFmjvVdqzr4LiIEntferi1V5unCuPBNvQxd+cR+X2iFVuyOOgOIrLD7XVE7GUaBckWqLEx+gXmF+9DP/6G2kt9fk162jdJFUoiV0XObXKp0dzMnj9n8GrJSvjf7WSu5biu9H8Iw4yteR/0mpbbILQdQoegczWxXr4uj0TLQ1KG5jj0Y39HWFdTZDxeBLync3erdEP2iGl75Qc7cIlq5R31dQmKwi4rM4hwSBSXE5SzM8hSiCBaLKXYo+IdDkTAMegL+tLsWEZAP59K/7jHqqcWN2UeShGjvV6/M63o96ozsHa2qhXgIdjKfoHcp7p1XfEUfCBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(2906002)(186003)(31696002)(86362001)(2616005)(8936002)(5660300002)(26005)(36756003)(6486002)(478600001)(6666004)(6506007)(31686004)(83380400001)(6512007)(38100700002)(6916009)(316002)(66946007)(41300700001)(4326008)(8676002)(66476007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nnk2UURFMUU5UGEvNGZiRU9QbkJBM3NVL1VEbWwyTk9USnZ4Y1NLQXloZWJh?=
 =?utf-8?B?WWgxK2VLNG5pVjBUbVlxTFB4NmZzWkpkUW1CMll2RVRHU2Q4ZHZpMmR0K0hD?=
 =?utf-8?B?Sm9USzFXQW5tNFUxV3VVcDJXUWlmR0VLcUlHTExxZFdURnBBOUdaQlNBMm1Z?=
 =?utf-8?B?dWsxOE1Eak8zcUJyZGxiWUxCU3B5YSs0SzJjYkpYS044UkJWV05ualQyOWly?=
 =?utf-8?B?VXZwQ0lGbjNLZHpWUEthL3EvOEQwSXVSbnl5WVJyYmF0RFVINWpvMkpQbEdT?=
 =?utf-8?B?YjR4Ung1S1gxL1d1YXE5THB0UDZvVHFoc0JYNGsveGJBWW5xOTRoU1dQWnJT?=
 =?utf-8?B?ZkZJZGkwQ0xUQWZ0QURXN3hWSUlOejdXV1NlVWJmOUo5WUoyaXFDTUduank2?=
 =?utf-8?B?M0R6S3I4Q0pQSDE0YS9KcSt1SVZ3RlNTMitzNEtKbmlienNhcEJsV280RW1U?=
 =?utf-8?B?OFRrTmZaS2xlYUpVdFl3aDJHdHhqOFNjbFAyUjdzRmVFbm10ekNXWTdGWEJR?=
 =?utf-8?B?SGRkeWwvdlRGdEJOb2dtWkN3Z1VXTExwZTZPc1RuSGdETGszbm81QkVsOUZ6?=
 =?utf-8?B?bFV5M1FtT253QnV1dlYwSDdlRGphOXBpYUtBelp0SXJXYWEzbHBhd1dSQTZs?=
 =?utf-8?B?U21GU1krbWE4SmpMeDZ5OXdEby80MGdBcWhJL1Jlb2FaQmt2WkduUlpZeDMw?=
 =?utf-8?B?YWVnT1hOYWVwdzRJZWxpRTVOazQ5TURLaCt5K1hOKyt3SHR3OFoxMHc3MFRT?=
 =?utf-8?B?QlltSUZHQnNsRXpTSklGMkdHdFpYZWpuRE1YbXU1OVNvdUs1TWJaS1pjYzhQ?=
 =?utf-8?B?Y0UwMS9oMmZPK2RwUXJraWlqdC82QUx4REY3UWVvYmloK1MrcWcrTHlyOWp4?=
 =?utf-8?B?aGhDVjhCQ3Z2TWtYMUFlVE5KcXhFMG9HSTZzMkZGN0d2T0xsckdNMzdnMXlk?=
 =?utf-8?B?aHhHQmdaSE1rQWUyTEtlVm0wUE1lbjFBVHhONFI2c0dYdmExdk5xMHhhTGln?=
 =?utf-8?B?NmdJUFZmYXJRdTREbDVoRW5WNEhFajA3V3V0dmttaU9rNkV4azdhVExtV2NV?=
 =?utf-8?B?YkU4RzY3engzUXNhUVhDdFZQSWVPMm9vMzVXUGFEQ0lHSUU2RmN1blY0YmJm?=
 =?utf-8?B?MVVjQlVxbUR6WlpFSjlSeFZVSEc2SkU5eWxNYjRhcURwaEZCcUp3T0ZPNkZV?=
 =?utf-8?B?aTdsc09nRE9VZmNQQlFSbzhUcHJEZ0djYlgrZWg3U1MwU1crazJ5TFkxZUl6?=
 =?utf-8?B?bUZJVi93UE0yL2FrMzBCSkZFaDlPRXk3MGpwTU5jYnJRS3V6UXNMZzZvYnRP?=
 =?utf-8?B?anZOVUhuaXhBa1JsKzh2U0F6RE5hYjBXTlJzWSs0aHdzVWJ6VE41S0JuYkFq?=
 =?utf-8?B?WjE1Y05WMU5TZVlzZWZucG5JRG9FbVd5cXQ3MUlUcDdxRFZ6SDRhcHRxWDFW?=
 =?utf-8?B?aTY0N1RKZmxJRzlsYzRxbTg0VERHaVlMcEhra0wxVUp6dk94YkJPTUlmMWRr?=
 =?utf-8?B?aFNiVE9pTk9UVy84K2tGdXJOQktlazIzQ2lrN2Y3VHJiNjFHRWx2dnVVaWZX?=
 =?utf-8?B?ZTJCaW1oMGxHKy9yZVBmdVl1SWJreFMrM2o0TVhIdzh0L010T1dtZ0xldG9v?=
 =?utf-8?B?UStCanFFMmJrOGVyWDB6MjhYd296TVpXd3VkY0w4VkF4QmVMQ0lVVDlpWlZK?=
 =?utf-8?B?VHQ2MncyYjVOd085bTRrandWb0RyNVA3YWEvRElVcG1tdWN5RDB5eDZ6Sk52?=
 =?utf-8?B?MnEvbXc3d3ROZFE3YkRGQlhmckNWL1ZiS3Awb1lxd25DN01OMkF6QkFMVUEy?=
 =?utf-8?B?MVRQaUdxN3ZWNVhKNUNyVjdPZzBpK2JSYytuNVFVYlhVZ3BXODZHejE1K1dm?=
 =?utf-8?B?R1FzM2lTR3BJaDhzYnkrbEV6NjlEc3lqU0xvVzM5VWZVVGZkMUlueHVBUXZJ?=
 =?utf-8?B?TVQwY2pUWHVCdk1uTDhtM3dndDVvUUdPRTBhNjRSbUovOHF0T0QydjVJN0lt?=
 =?utf-8?B?VVZQMGZmd0NSQmRYNXB2S2J2RWI4c2J3cFd6TTkxU2pHeFB4S3hqM0NpbDlF?=
 =?utf-8?B?K2xDSm1WczFWVUJBaGFNbEdnMVhxcWFBZTRZZVpXRXBSemE3dVR4emNMTnI1?=
 =?utf-8?Q?uUQN1l/+/Y7aX/oqW5QNE4eKG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8796582b-3663-4736-5a54-08db0ab20f31
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 15:26:48.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRAhRC0XqAtoYsAvoQ3QtWUJbIMVgUFNAXIqsAVP0Apb0DxcHCfb4mSN6kme5gwTUEQExspLEZJCGRz1F3oi+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509

It's imo helping readability as well as uses a little if properly
arranging for sufficiently late macro expansion is part of the macro
itself, rather than all (applicable) instances of its users.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -13,8 +13,8 @@ CFLAGS += -msoft-float
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
-$(call as-option-add,CFLAGS,CC,"crc32 %eax$$(comma)%eax",-DHAVE_AS_SSE4_2)
-$(call as-option-add,CFLAGS,CC,"invept (%rax)$$(comma)%rax",-DHAVE_AS_EPT)
+$(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
+$(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
 $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
@@ -21,10 +21,10 @@ $(call as-option-add,CFLAGS,CC,"rdseed %
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
 $(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
-$(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
-$(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
-$(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
-$(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$$(comma)%rax",-DHAVE_AS_ENQCMD)
+$(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
+$(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
+$(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
+$(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
 # GAS's idea of true is -1.  Clang's idea is 1
 $(call as-option-add,CFLAGS,CC,\
@@ -32,7 +32,7 @@ $(call as-option-add,CFLAGS,CC,\
 
 # Check to see whether the assmbler supports the .nop directive.
 $(call as-option-add,CFLAGS,CC,\
-    ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
+    ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
 CFLAGS += -mno-red-zone -fpic
 
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -66,7 +66,7 @@ as-insn = $(if $(shell echo 'void _(void
 # Usage: $(call as-option-add,CFLAGS,CC,"insn",option-yes,option-no)
 as-option-add = $(eval $(call as-option-add-closure,$(1),$(2),$(3),$(4),$(5)))
 define as-option-add-closure
-    ifeq ($$(call as-insn,$$($(2)) $$($(1)),$(3),y,n),y)
+    ifeq ($$(call as-insn,$$($(2)) $$($(1)),$$(3),y,n),y)
         $(1) += $(4)
     else
         $(1) += $(5)

