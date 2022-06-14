Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA554B4E7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 17:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349172.575358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18eg-0003CD-E3; Tue, 14 Jun 2022 15:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349172.575358; Tue, 14 Jun 2022 15:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18eg-00039p-B6; Tue, 14 Jun 2022 15:40:34 +0000
Received: by outflank-mailman (input) for mailman id 349172;
 Tue, 14 Jun 2022 15:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o18ee-00039i-3U
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 15:40:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 521e92fb-ebf8-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 17:40:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6791.eurprd04.prod.outlook.com (2603:10a6:20b:103::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 15:40:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 15:40:29 +0000
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
X-Inumbo-ID: 521e92fb-ebf8-11ec-a26a-b96bd03d9e80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWwyGwcuL+wCJ6bbRq+lDvbH9TnOgvfV13rH1Rc8vUX77OlK72oTOoPjdp3gtqzMCeuQVOg6Tqhkjo1eUPl30LPpCW8++SUtuZqXWlCp1ba3/msGJANngmHBc8W52DmDO0lm+UHr+G0FNRmOEki/MnqAeQWoOlJsFZ/y6WUBfNjPSu2Q+6iehpevMFGhj2x7hb24q/NaDmhDnCLdIo0AESohgz9H4N7Zapx7rXZpfi98qIYFHAeM3FxaZrsEBnY4MAiLkN/SrOGLO42XWEdlgPnBkSv88e/T6Fbk9DygES3NDO9pyZJMaQJsV2fkFH+ZdcKdeQwM6j9cULQe9j2bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rPrl1eBGcU7xfrrmUE+53DCIfx8v3Nqjcf5+80E71Q=;
 b=K9FeqAxjxVzfiY96Vax5PdD07ycbB183RKmoRZydyRiqA/VsZGCwQmrxlPykedc2gOaOnVALfWkNt2KtLDXYUOHwdVw+BoveglmgqYHPjfeyHBQk/GhrYqP7ZNdMbtdR6NR3O2u1Ji6r3VPkBAusMaj9mbZYZrpBXOJnStLhAr14jVXMta4x2YP1BkdZfZrBkwAsv+w1kXPHi0N3HKXNcg4V4BwNvY161A6AD1elebFgsTyGd+IlpjJsw/AxEP7hKnr/UThLPRgRRjm3hHEt/BE3gWSB20VditiQmSYjcle6iMwKsYH4Wg64qOsPc8nNtKB060Kc56z9WtU0vElz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rPrl1eBGcU7xfrrmUE+53DCIfx8v3Nqjcf5+80E71Q=;
 b=oupRs+ysWQ1ohI8IxXrG6APGCMpPX+FvMOeurdLvlOVtB+wwA5j/fDg6qttF4k+8EMnvTXKz3oFycFNFZW5T/htth1vsfr5f/Jxupg+1EjPzoHutGUk1ca1nmzZ+7jdbsmj1qM+3UJ/7dLs1fW4FjNs3sgnACPWt2MUdgeta1+O7rz7F2ABZkFrV+J9alxTlfGt5s9VvX6abyKpTnWgOSNBBT9UQl5JZz2QQzVqfO2/Bc6MSUBWXWA+rk10x8dWMjSwsmYV2TXVLJrKv68nH0yNIPocPsVmy5bpUZLk6ZEHUeqm3Mj/d1gWueCq2wfFJ38qa8LH5hnzvo20cigrhoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9282329e-ad08-b6e7-ec9b-7e827a8b66ba@suse.com>
Date: Tue, 14 Jun 2022 17:40:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: fix exporting for make 3.82
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0337.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78303dcf-1990-45e1-e293-08da4e1c358a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6791:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6791FB8B864AAFF78F14E56CB3AA9@AM7PR04MB6791.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rprscq7x9ExrGUZpb425f2kqFcwlDyHhaQf53K+brkQs9Dqf6QPWyyIditbL+ACh7I7kCRUw2JpJsiUmEck7jX6Z2mvnsqcij4g7cWDTbDgbSjJ+bue7Tf4id14gJ1JXkPYtnyJSlIHgw0hSlaft2hGt3/hxOLUTgZVx9kA0dAeLO9vv1HmeiyTczrSxvVTkRn1lUB+cDdXyr0DkuVHqaG23MbyKwfSbcdSigYOT8BQTs55a+VfCK+5DxXpqLIIZ3Upak79Bqt8UqbR0zpvMEa5dRBP62CiKEVizhxYrtZPQezYV2lUO2+VTj0st/0HN9l8opgtiYRIFYt9UDfbtHma4M9c1H8/NNEEPNVfdvaTtANcreF4aoVazw1gFawrK7e6hqNCLA3dyxSyoZygT/+6/6CemPhzr1zD0YbENSUQkRmUBo9B/1IYDf7AxOg0t1nu+SOrEl5fSK9ZgFU1jRQBzNY+ej2vIz7sYFI701pEgLfoynEQ7AOpuPupj4tOeQkZ8uCz3QEc4xRFw1Ou4+JaNSsAwGpjUg9DsojbIghemSlV5aRrj0pCxGH56bZgco/hPEdC7uoEzVVK/HBpbhEibtANC4mj7t8VEvR0PGEzNlCUVEGtTh3d3zmA/+uG92ExCkSZr8Psos/os3E13SY+fhT68CSZYuFCrU7jyX8hT38Qf8mKvlu7YqFQh6y73qXcEDbosyAxGcO7thulWCs69XdRnnzJ0FZI0HuVC/u0bM8lZSNiyIfCIuOsiNDJU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(6512007)(54906003)(316002)(26005)(4326008)(66556008)(6506007)(6916009)(31686004)(2906002)(5660300002)(36756003)(186003)(86362001)(6486002)(66946007)(66476007)(31696002)(8676002)(508600001)(2616005)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnF0Rk5NdmFCYVpZWE55bFVLSDlMS1ZCbmx0M1p1VHFUcWJEdE56SW1tcFE3?=
 =?utf-8?B?VUNkUUd5aXpZKzAwOWNMdk8xZjBxNDdSMzJFQk5EWmJuWmI0WjlLTC9Fa3F6?=
 =?utf-8?B?dDk1aHlVSVFXNGxJOHJqcGJudlRRZTFHNWMrQnBPZzhuR3VaTVR2UWQ5ZW1I?=
 =?utf-8?B?MjJMYkxjVlNjQVBPNjljd01LRWNobDBtb2tCbjNDQ0EzZlR6QUdVdlYvYm9h?=
 =?utf-8?B?Q0J3QzAydWl2clo4Q1FNU2JWNFFPdVh0dTJ5UFdWclNnbGdhSlo2U05GOEFr?=
 =?utf-8?B?QVJnS29QN0xrQzJsY1lNY3JwYUVtYlJDWnVDL3VnWnB2cXp5YzFXNUpLakR1?=
 =?utf-8?B?cHFpbzQ3K2UzNnh3L3FtMUtUYXVNM0daU0xlUXJmY0xzQ2xQTzVkRERIM3FW?=
 =?utf-8?B?UUx2ZUxvRFNpR3kyR2RaS2xjUm1BUFBuRWcvNFhmZWVuR3Bsak1FV01ra0dy?=
 =?utf-8?B?eGxuWURJQ1E3RjQ5WHkzZUJzM2RXL2czV0l6eVdrNHdrQ1NEQ2I3SHpWcDdC?=
 =?utf-8?B?RHh5aEJSZ2FMWlE4OXNpc0h4ZEp5dk1zSjNoYlFOaTY4VjlHQzF4WXdMOFZ6?=
 =?utf-8?B?eDZZUUxsSWY1VnlUWER4Vm8zQ2JsRmR5b3hkV0JVWHdVK01vL3M4K3Q2RWsx?=
 =?utf-8?B?bGZjdFpoQWR6RXRzTG9wMFZEcjlxZXJUckoyTDYyOXdLd2xTeU1RNnhtcTFB?=
 =?utf-8?B?SWtmNEZtOWJnMU1naHlYeVFvMkpUQWZzYmN2dWpzbXhtdGJ6TkJKaURaQTkw?=
 =?utf-8?B?N1paeUtnYkdiQWVlZUp5c2FVMUxkNm5YZTNUQWJIRVdLcDY3enZYREdwV0tZ?=
 =?utf-8?B?T1BCemJ6NWNPSk5xcE1ibnRxZmNsT2kwdU5CeGN5MTU2c1NaY0xBQ3NZYVp2?=
 =?utf-8?B?eGRNVmlJbjM3TmJ6aFVyVXF6dnJyT2FINlhFdktzUE9oZENoQkFYY3d0MXVH?=
 =?utf-8?B?clJ5NTJGUnE1ajVHeWI5VkwwdUVvcldDWUppMVJCdkVXR3NXczQxT1Z2TGdx?=
 =?utf-8?B?dkNvaWZlM1ZzV1hWdVgxbHhXU2Mycy91QVhwMDJNNEVwN2hFSFNabThDa3Rl?=
 =?utf-8?B?VkpGL3FoTEhYNkEzQzN2SHpYK0lrT0IwV0Fod093OG13aVgrc3p1dWtZOHFv?=
 =?utf-8?B?M3loNUlXK3RCSEl5R1haOHhLVzNmM3QwL3BydFRhc1VWdUZOZUdGS1Nxa0dS?=
 =?utf-8?B?djFTcWQ3VHlKMEFwcUliNVdaYVNNb2R4MjZ5RzJacWcxcmdKb2tRSFVIcjVU?=
 =?utf-8?B?L2dsaDJRanh0WXRndEZGTzZwU2ZmS1J5b2UyUDJ1Y3FoVkpiVTcvaDBuTzFx?=
 =?utf-8?B?OUR3TkJUc2lVb1BjRm4xcHE3M1p0dUdTMXhuRnVLUjJiM3FJZGErSFM3N21I?=
 =?utf-8?B?ZXB1dnhReVFRNmswbS9XSkQxTk15MW5qclQzMis3RmR0MjRRWkI1OU4wSlVV?=
 =?utf-8?B?RGFLNDIram13TXdHVlpabU8xNE44K2U1d25HbG9aSUxiVUcydERtQVg1VmdZ?=
 =?utf-8?B?NUt4VjM0SHJ2WFBUTDJhZVE4MXgwanh6UGpDRlZLR2JxOUI0SmhFdkdjaEhs?=
 =?utf-8?B?YlA4cHpRdHVPRUV0TGQrck84a2RCZ0grU3JDM2NFUHR6SllyaHJzYmUwUnFM?=
 =?utf-8?B?dXdleVpBT1U3aTllUFc5WjdKdEFIL21IS0tmSllVU1p5azlJUGRjdDJzK1cv?=
 =?utf-8?B?WmJVZzJ0alQwVlpmMkhNN0RUR2l0ZEtEamhPSXdNTld1NWRpWDRLdWVTSGty?=
 =?utf-8?B?Wjl6Wk9OWlJRY240RVZjUXpzWXR3WWZ2Um1FYVJubURQK1FoU1AzeTRXZHhO?=
 =?utf-8?B?ZjUxd2hIaFo4RkdKZUx2MWdPcXpUMXZwaVQzMkZJNHk4QXZ0aTFhcE11M25I?=
 =?utf-8?B?UG9HZGN4VmsreVVTenl5aUVjb2ErQndjQUYvYitqcXJnVkRwQ0ZjZFdsRlU0?=
 =?utf-8?B?VnVhRHZCeHdWR2c0bkhweWxQaExkQWFUcjBuMXVkUlJ5a3lWM01idU9janBJ?=
 =?utf-8?B?aEgyNDE5ZmJiaE1PRzZmY0VmN3B5b0QyS3YxcHlwQkRlMUEydXZ2ZTFiVDQr?=
 =?utf-8?B?OXc2YjhDUnRTRUQzVVlEVlZiOFcvM1pHdHhoemZNamZhV2JRWFNBRm9Ic2Mx?=
 =?utf-8?B?NzBXb2cwNmFoNm83SVI4dW5sK0tqeEhSTDduOSt1Q0dPc1FSWTNFQXRpS29s?=
 =?utf-8?B?L3JJbXBoZEJ0MHhVK0hNbE1BNTh2eWdYeFd6b0Rpd2ozUnptbmxuUUtNQ055?=
 =?utf-8?B?S0FwZ0o5WmZKbW93WHpzKzBFU05SVHljRWNxeUVNSEc2Mjc3QSt5Rm5XSkVX?=
 =?utf-8?B?K2lYOVRmZk8xaEprNHI5WFUxUFhWc0djUTN4a1ZCWEN2ZW82dUdEQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78303dcf-1990-45e1-e293-08da4e1c358a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 15:40:29.1941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJBUvXsHy5shnf9w+sfEPYOXntYtgX9CoSl2t6ghT9NF47x+Sf5iKSkxljEwsN1AiK5V8cQEInm5uf6fAgz8eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6791

GNU make 3.82 apparently has a quirk where exporting an undefined
variable prevents its value from subsequently being updated. This
situation can arise due to our adding of -rR to MAKEFLAGS, which takes
effect also on make simply re-invoking itself. Once these flags are in
effect, CC (in particular) is empty (undefined), and would be defined
only via Config.mk including StdGNU.mk or alike. With the quirk, CC
remains empty, yet with an empty CC the compiler minimum version check
fails, breaking the build.

Move the exporting of the various tool stack component variables past
where they gain their (final) values.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There may be further factors playing into the described quirk, as I've
also observed that simply running make as 2nd time would lead to
successful building of xen/.

While this wasn't a problem until several weeks back, I've not been able
to identify which exact commit would have caused the breakage. Hence no
Fixes: tag.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -44,8 +44,6 @@ export ARCH SRCARCH
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
-export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
-
 export TARGET := xen
 
 .PHONY: dist
@@ -244,6 +242,7 @@ export TARGET_ARCH     := $(shell echo $
                                 -e s'/riscv.*/riscv/g')
 
 export CONFIG_SHELL := $(SHELL)
+export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
 export YACC = $(if $(BISON),$(BISON),bison)
 export LEX = $(if $(FLEX),$(FLEX),flex)
 

