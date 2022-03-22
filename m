Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D272E4E42E5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293549.498681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgLz-0005Ub-3w; Tue, 22 Mar 2022 15:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293549.498681; Tue, 22 Mar 2022 15:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgLz-0005SA-0t; Tue, 22 Mar 2022 15:23:23 +0000
Received: by outflank-mailman (input) for mailman id 293549;
 Tue, 22 Mar 2022 15:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWgLx-0005S4-Gv
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:23:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012bdb67-a9f4-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 16:23:20 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-jrknOuvXO0WqQn9SvNt9BA-1; Tue, 22 Mar 2022 16:23:18 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4536.eurprd04.prod.outlook.com (2603:10a6:20b:16::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 15:23:16 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 15:23:16 +0000
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
X-Inumbo-ID: 012bdb67-a9f4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647962599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eElMPhyRs2St73kch0bjghxVKpqyLW6mx/DuTjqHLPk=;
	b=XhTJl9CLHcFV0MAcPZ4TS9L0t/pbO0vTC80E2wNxFp756p6dyiau/UQuJRpI6e3oCziDAl
	XWvQ1t2BfRuU053/x7NlfFClb3oFmdWmwBGbGEgKcyQcvzSFe68b2OKdltArKYq2eDIqmN
	1f6pKxbo+C6o6JLOjyFB+InvjkfJbaU=
X-MC-Unique: jrknOuvXO0WqQn9SvNt9BA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glE+5VmNArW7mUsNB58soeFY9cmMKtMSrjP5QZFZKe8uoApDqyfxU5U3ROPF4e6v1psDvUBSXpgdi+HLuc6f/hYVomFhSqZ5wMBJuQUVr54a+1HuW9JYtvMAvnifoue/s3yBk7NnORk9Ll9jjiuG225ON/ki9Pxga9M4dpuwC294hOxqm2PLYKA0bBU9YEJPivlQ4VURnH//05XlOzEwz6GG5qaMKI0bTpgaTIUQYMFD1q1kJb4SVEMuDaqUABVHZSOm7ji9nlz5o9arFDSSt2eRB+O7zn1h/6NswEeZ5jjc9zh//ENBm2XmWA0LX+3UZtnOW8r0w/3POOlfwkGS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eElMPhyRs2St73kch0bjghxVKpqyLW6mx/DuTjqHLPk=;
 b=joKVMFNzfl5yNQXKlKD65LigJ3373O58TpCKTkzE95z6h5Sy1QrrB9ZJ7FAoWJP/59cHkn0sBRDhGiAstwWnUhrQeJnhX1wuFLrt9I3+G1Aj3TTJi6X8rjOHfirVg/0k+QJ/DdhFtNbaulq2Hfy9J/nw/JjUCw+wPdC2swwDkGs1uvkU9Iv1O4UC0CRNmrEzdCRA3TrV23fgMpAXFNv+fqfQgWqLmUUhc37dslU1buG35b80nyXdBy4ih0SmumT+zsZYmUUuf1GW7dkU3NDrL/fszpwcCVc8rshzuagb20ByK0qAsVUpIlAJaSz3wXsJWuGBp+VfhzxzQZR22VLA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45de6ac3-7701-0b37-8ada-b46f4237448a@suse.com>
Date: Tue, 22 Mar 2022 16:23:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: provide and export ADDR2LINE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87e5129e-f71e-4063-123c-08da0c17e345
X-MS-TrafficTypeDiagnostic: AM6PR04MB4536:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB45367C5FB431B8934D760612B3179@AM6PR04MB4536.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JxbivQLySUsbduh9mfWIpSk2e0L7wq2uTY00jgUqXWh7BvAUYI+SJvYEytcE9fgNdxgkpva5Oo47wGFUk6jUzQ0HhlmH3Bsd86muf3q1XW52GqrYKKynh9MwFoE/dUuJcPyTBe5cXORJiHKlzY80J8SQua8LIbckex0mAmgEhZ9oGhyC4azaIxHGJvge+vMNtwndlHwSpuOj/mZCgUI2fYXua/W/6d/d8onQa3RTiliN/diWRIenk8Cn/ZWFEN3LTqNq0Sb69Ceipxe7RhLk7BkOIWvI9CeyPiH+c+VqazsX2itWe5Uiieudj3KWyKo1IZrd1biSt1syHc0pAMY321u3/u+MkoMEFKzxblbKhbWNDdgHn+dq+sUkYDqCyrOMkaEmYDid1LvGu+oByxAxczQiUOkgyi6WG1L7zl3gWq5T0KJ+79ngymHDzcnLD1mejlcDgrQu12pSixXBcGVxjZvdAiIQRs8wv0mEs7OpH/yrjaf3nOZnQyAaB1ZJonwkUZW1gCXy0hz0uqKfGEi9uyL+Y+Zv/vriSTmK2UxVhpYKvpGj4eEpnSNyB1yqKPWA9h/mbRn/H/pk4qCxjnhYoxoEDyxN+NKIPJ7FaAUELaf5zREQm0qoV6M3/5q/NC4y67Fhbfn/hIOAZsDn4OBe2kIYg9Tt+C2KEMZL2c68Zkm6UsW+lCB9IK5npbI/qy9tlM/JDSy8CJsis71REUQ0eud4QB0HHUmxETovw5s/WBXC+qgyeNbFzLvNmDhqk0mG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6916009)(316002)(6512007)(31696002)(38100700002)(8676002)(6506007)(66556008)(66476007)(66946007)(4326008)(6486002)(508600001)(26005)(54906003)(186003)(2616005)(5660300002)(8936002)(31686004)(2906002)(4744005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHcwQzhTZ3Rvdko2Z3N3UmtVZWtudHE3SWNlcVNjSTVxallqdTBna3FQT2RU?=
 =?utf-8?B?bmp3OWF6VmErb08vc2xMS1o0QzNuYkF3d1U1cWpjTXM0R1F0YkRQRGVnK3pV?=
 =?utf-8?B?WTBvR3ZPSWZ1bFpGRStWRi93Q2ZuNkRBTDQ0dy9HSkNmbTZVVGxuc1dBSTgz?=
 =?utf-8?B?cjhGNGN2djc1b1FwOHUvVW00ci80V0dPaW03NUJiUGEyUlZBeTdCOXdJQVlu?=
 =?utf-8?B?ZFRPL0thME1KZzBlTFYyREJaR2hOZ2hhdzUvUW1IQWN2Q2pLSGdtNmNKaURV?=
 =?utf-8?B?Kzd3NnJHODh2Sit6RHlRWERwVlB3MFFnWnQwaENQUXlIUjNWOXF1dy9GWGdC?=
 =?utf-8?B?YS9MMWpPMXJrKzU0QUdmdnV5SjZQL2dyL1Z4R2IreU92cGlJYXhaN1dzRmY0?=
 =?utf-8?B?cW9vNnJzMlZ4aWh1Mk9adC9pdjhCd2lpY3N5RjlId0RmSnNuUTcvQkthMkJz?=
 =?utf-8?B?VVpwdVE1YmdEVlJTSWNDWHovRnVaaWRlUEYzVmgwdTVlQy9QaVlCT2laS2R6?=
 =?utf-8?B?c0JuWjZHZFRNdVV6N3c4cVdaMWJ1aFNZaHVOWlEyamlKVjczYittYXVSenVm?=
 =?utf-8?B?cTJGckx6b3Y3Q09FYUk0ZjIvczJjdjQxMmE4cWlweEFBQS9jU3lZTHNhUXdt?=
 =?utf-8?B?RlhzM0xzVmNFaXJlWStpMndicVFQVEJpQTFQOU5FZXF1SlNVeUIvVGRTcHNx?=
 =?utf-8?B?MjBGZE5uRmVTUXJST3gramxMUkdmRCtwWGZkWlpoWDhzNFl0UXhUMXQvb3NC?=
 =?utf-8?B?NVdtSE54RVlBRXR1R0txd1ZlZDJrWmVWd2Z6WEtNaW9nYTNxbHFSTmNBbHha?=
 =?utf-8?B?VG5tMWp2SDJTYjRDK2M3dkFOZ3ZZK1Rld25qRUxKM3RsMnhaZzJ2S2lJVUtD?=
 =?utf-8?B?NmNTZGlkaUk4aFM3NXZKU3lsV3BVYzMyTVdkNnpLUlc0Ty94bnQ5aHZBYUxL?=
 =?utf-8?B?V0VLaDYrYW1PTFg3MzJkUHZ1cEQxcVduT1M4VEFkam5PUzZEdG1EZDYzQkJZ?=
 =?utf-8?B?WUhmeE5xb05FcEFsMjF4Q1Fibk14bDd4TTRjbGFnUGhBMTZzTjVLZlBvSFRP?=
 =?utf-8?B?eWxOL0h5eW1HendoODRlTXVBQitORC9vVldXRC9URnJ3akVYYmVpOVBpd2Jy?=
 =?utf-8?B?VG9WVmw4UlRoWllSZzExVGZCSE9KUTduQ1NDcHgrdFFlTjcxSWI5TGFGa2F5?=
 =?utf-8?B?UXd0aG56bGsvcjQvR2JFdGZuRlVHMUpxWEhNQWxJVFJwWVNNSm9ROVY1ckg1?=
 =?utf-8?B?Um1TWlpkeFlyTFNUUDRCZTllNTRlK2F1WE1nMW01R0w0czkzRVR4TlA3RjZz?=
 =?utf-8?B?U09lUm93L2s3U1p0N0ZHYXhVQ2NSU3RGWkVVYVJnd2w5aFN4WXdkcldWL3cx?=
 =?utf-8?B?TTBDYVM2MTBoa3JjcHJQekFPSE1LL0lwOFJUSXl4MEhTbThibzBZU0JwTy9Y?=
 =?utf-8?B?YjJVRUpXWWZtTWZDeVpZRml0V3l4OE9sYjgzV1FIK1lvQTRYK1MwU0dvTmxw?=
 =?utf-8?B?eVJqT1BWZUVQSysyckVKb3JLcmZJMUZtY012WEtJTUt3S2RvYnFkTW53M2Er?=
 =?utf-8?B?ZUdwNnh2em9hMVgvU2djbGtZVXpFbjAxSTBJZ3dlVk9XbVh0cDdvM2NnOVJm?=
 =?utf-8?B?V0RFRkQ3aGJhR3NYZ3NWWExOaVYyMHU4U0RNTTBtaGZoa2RkUElaMHl2OXFk?=
 =?utf-8?B?cUN1Ym54K0w3dDVwcm0rVDRUNGdLWU5DaUpXdUxMOWJhTHZVNC9GYjVPZ1hX?=
 =?utf-8?B?YVJ2VFhPaWtzc2pXWXJXOXRoeHE2Y2o2ckNFTnA0djFCRjNTSXQxWmlpcFB2?=
 =?utf-8?B?d3pHNVdqb3IwTnFFU3ZwdVVrUU1POVZ6WlpqbjJPT0FOQ0E3MzduTHJPTFlh?=
 =?utf-8?B?Z1hIeXBzeU1sTFBwL0lWL1pmTVhnc1NnMnFHYW5nei82OExKNzNNM1RMa2tJ?=
 =?utf-8?Q?qGkbl6O7ZjEfJ1clZEQRY9KmIG+X5ihu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e5129e-f71e-4063-123c-08da0c17e345
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:23:16.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EGecXHL54IxWvglUCjgkcmsfhL946+YLFju1FEsB2CQFevY/mxIhsUN59MvpxMuBuRj0ywgLHIqF+iMCjoftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4536

Now that x86'es check-endbr.sh script uses it, also make it available
consistently with other tool chain components.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/config/StdGNU.mk
+++ b/config/StdGNU.mk
@@ -10,6 +10,7 @@ endif
 LD_LTO     = $(CROSS_COMPILE)ld
 endif
 CPP        = $(CC) -E
+ADDR2LINE  = $(CROSS_COMPILE)addr2line
 AR         = $(CROSS_COMPILE)ar
 RANLIB     = $(CROSS_COMPILE)ranlib
 NM         = $(CROSS_COMPILE)nm
--- a/config/SunOS.mk
+++ b/config/SunOS.mk
@@ -3,6 +3,7 @@ LD         = $(CROSS_COMPILE)gld
 CC         = $(CROSS_COMPILE)gcc
 CPP        = $(CROSS_COMPILE)gcc -E
 CXX        = $(CROSS_COMPILE)g++
+ADDR2LINE  = $(CROSS_COMPILE)gaddr2line
 AR         = $(CROSS_COMPILE)gar
 RANLIB     = $(CROSS_COMPILE)granlib
 NM         = $(CROSS_COMPILE)gnm
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -55,7 +55,7 @@ export TARGET_ARCH     := $(shell echo $
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
-export CC CXX LD NM OBJCOPY OBJDUMP
+export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
 
 export TARGET := xen
 


