Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2F5EF2F8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413581.657315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqPB-00084R-LS; Thu, 29 Sep 2022 10:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413581.657315; Thu, 29 Sep 2022 10:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqPB-00081j-IZ; Thu, 29 Sep 2022 10:04:33 +0000
Received: by outflank-mailman (input) for mailman id 413581;
 Thu, 29 Sep 2022 10:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqP9-00081Z-Re
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:04:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c008c1e-3fde-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 12:04:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:04:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:04:29 +0000
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
X-Inumbo-ID: 1c008c1e-3fde-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvUQGdyaR7bSnSU6XEy/TtnYBCmy4H45jRhdDNt2Z4IakQpZctJ8JSsiq2n2e8WCj9GDafgkuZSN5DSWnCElvFEudxTAFMbtjzCzhqBavqGlZQ23SJADlrQC4NisPXZZBJY798pgVyoc/grvvH64PUtYheLIPfvCc8c3ZypQlOj246T+vm1OCB85TGWh9kqCLUiu0G7xvbhWzPM5wpFxYGI0zcfnhVlGZPIXe9Zyly4NWqOc8lDLbRYTqfpYTwnE7URvSjJwOMF1/dBL/Nztk58s+k5n71tx5uoAjek/migKeCxnVrT3iwbS3hsuI+2Aa+cgLietOv3ERgRu81GMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=048DkF7cg76prCVEaBhWp817vBIbJM8wG6eU8S9ELqA=;
 b=LCCm1j21LyBijaABHeJwO6OS+J9JTrBARGcCowCe9iNYL/tAqDmFnqR9+oAWMCSlD5gPnStSgjL3E21Tqq13yVsBjhpHNTKC20mumKlNCBt+kBrp2HTO7MT9nwr8TU1n2ISHVjY2Zw+m2Bcm89HDbsNzhIvbr500vGaRVoc4tDc4bHx5Jyqevh877Pcwh3MUweRP1uzEYEkt5H6mT1i5wdFYFpu9gmdTVHMe8oFakFkcMVoKb+IHNSglkTmimyKoPZ8Li4LPWXzcp/CabWHApQllMvWoKUgippcNXrPsMaCvwWj93fVTdwW6jhQGPC/4YuMsPQuZzm0mkN/lfZATbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=048DkF7cg76prCVEaBhWp817vBIbJM8wG6eU8S9ELqA=;
 b=sOiusSbA2j+NDHpypxOKN6zTuuropyrLjnVButgMW1H0b3g9iU8QaawAoWSViSxaTOrlFRfISIkD1ArEH0tI/xVdK/xD5Ix3ElXq3wDmAPwbzS1w88RVa+HHRjsOYB053kvs1u7YGiSxowYQY9R61bO1EHt8G4QLieV8c7wV35/MqMMNffHS5ip/9udlwsBcGXrps9QIdT2Uu5zM7v+NTQRuSXcmAgi75EkGjkNvMWJY6usgPg9rEZRtry6U+L9Hp/3VT/izCOS3qv9PdNoXEf8gYbZvgBz5sVFEGbLuxchvrhU2lIbMBDr/GO/J3r1V175hwQSZNPkrVZTzwC0dQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4868cc00-428c-a315-1a5e-cada97957bde@suse.com>
Date: Thu, 29 Sep 2022 12:04:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH 1/2][XTF] build: suppress GNU ld 2.39 warning about RWX load
 segments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
In-Reply-To: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d9526c-f30f-4f7d-1737-08daa201ff8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YejrkHy0VpJYtu+yPb+rwzck9kCbd8bH5dYsOjT82vRFgKaxf1r5QBsMf+EpJ+W+h5Hn9SASDC1nd3JrEUZzM+FQFPzhHpysUoouD2LMTT/4XtYxk4f3fEDAUE+Zenbpic+T8mH9L3k+aqxKYginkRDo036NCiuNskCr6Hx8NYZEr/uQjy2G/bH14Y/Z6BTHxoaYh1JEOzc7dGgEvJgKwJNajymV9fRGZuf6RL4n/xqsJFd6I3fZD9y79vo/OkxmXQ0cO61U4mh+0wgwIuYiURulkYv5AYNGR9XsrC/q/7zYYtEYjyJ4iwx4AggtTYcuJWtpWChWQgnb0YSpiI0ZpgcvrVyDRaFkDA2RmmlHasmwi/1LeqDywUAgyvlFArTZ+oxTKFVlb5C7xUU+TC3c5/g4uDywvlnx0HHZYWqoEqZQdmaoYBSduR7Kd8RaVUkxVKfpYqyxVfynBdH6xZ4UizRh646MBb343HrCEDAANgLVvFP8ZeQ58IYMnmA+F9wK5pnnf2CfE7hBwS/3wL2Ls1QA5YXcKwOeNfbDIJrXGkm6/GuMhWap5jWWIQ6ZHSr0BEkA+M3ChJXZVMz857r4zrr9UiNKfdy0Uo9rM02mmNMu0zJ2IEa3IL2WS2BTyoJ+FGTXSOHQWxVDfk+59JxuZXMj0TPq5Ra9JRuLlJfw160hdrSF3DlvVWtbT54BCwbv9p22bK1P0bTjHbeMQNvg+yXMrq1g657ZJ2VIHmmlxAFOXduE3mMzpyWJ5IAQ7PKU1vVIpvEsB7b9mb09rr8k+sKskA3Na5JTgxWhee2oUq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(31686004)(6506007)(66556008)(66476007)(4326008)(8676002)(31696002)(86362001)(6916009)(38100700002)(36756003)(316002)(83380400001)(186003)(2616005)(26005)(6512007)(478600001)(6486002)(66946007)(8936002)(41300700001)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2ZlZUgzUWczaVdrMEVYWENzWm5uZnpQOFk2YzBmdzJyZkppajIxdHo5OFZT?=
 =?utf-8?B?RjZndVZ4bGJWQlVOL3ZMUTltTDMxaUVWVnVoRzhSTjFXSW1RdEZCOGRmd2VP?=
 =?utf-8?B?YnpMcFYyS0UveXlUOGFFNHcwM2tzVmxkdk54bXFuSFZJbnBSYTIxcGNoL2kz?=
 =?utf-8?B?UFM5eVA2b0hVRlpoWms2bDM4bS9UV0JSWVpVVGlqVzI5OURuWXFDaWJKd3Na?=
 =?utf-8?B?d3RUZGI4UXNGYkx6SzhRYVBxdnEwNVBoS2hKS0xvY0hvS0NwRFY1dkY5Nmhr?=
 =?utf-8?B?aUFSY0hGUURxMkJiYjN1ZEo2MDE1WmZmZi96V2Ezby9PeWdwZ0JLTlJlRkhi?=
 =?utf-8?B?cDVyL2tVY1hqcmJWR0xVNGI5akV3QkdzNkx1RmtDUDQvT1k4eVBqbFBwdmxD?=
 =?utf-8?B?MzY1WjF2TWxyL1liMjErbjZSeTFjK3BhUzdJd3AwQS8wTGREZ3lTUVRrZnZG?=
 =?utf-8?B?OHMxdDV0M3p1aStBa1h0M21Fd1o3QUcxTU4xSWtEQ0lJSjNGVTh4cXlNVURO?=
 =?utf-8?B?dFluV21JWVhGaXJseGFhblBjZHVDYXBzUG94U2dha01NVmR6Y3VWY3hDRmQ2?=
 =?utf-8?B?V1FTajNDcVdqeU5tVWdXYW1SdnRTQlhrdVFwQ0hTNHdvWGpOUis0RnJ3WWZw?=
 =?utf-8?B?cUZJdlNFQnVtRjJNajhWYlIxMHUvaGpRSjRnRUFVb284YkFGVi9VRTBsVy9v?=
 =?utf-8?B?aTBtNklFRUtLNWo0dWdtcGlEUnNJd3R2RkJvTzI5N0duRDFtQmRmMHo2elI0?=
 =?utf-8?B?WDl1eTRKNUpUb1UyM1pRSGgrc0dWVGNMNGRyZG9nYWpkcTRPZkhlNitXa3lD?=
 =?utf-8?B?YmtXOWZTZnEvWkRVK1dSVW9LUGlkcHdUY3k5eFZleWRJWFdQamtLZDJuWnhU?=
 =?utf-8?B?dW01dEJWSzRjMW01R2RVZG5UZjluRUhZdnB4UURWdEZiTGJDZTI0TThOTzlo?=
 =?utf-8?B?QWZXbjFKR0lPcHFuVlJ2emZta0dSR2cybVpOY3JkSUhkejdkWUpmWG00RmYr?=
 =?utf-8?B?OFFtYVpuM3d3RUNORS9zM0ZMbmdLMTFLK0ozNnNCRzIydmdSVEx1Yi9pMDZI?=
 =?utf-8?B?Q1E5RzJWd05xekhIb1RQRUUxVDlMaW1ZbVpNTXo3NzU4YmgrMFRncTY1RGlI?=
 =?utf-8?B?YVFGd3puL2pMOFNmZjdlSitUNlNwSzNrTjJTODc5Skp0MVNBRGRJMUtUZ1JF?=
 =?utf-8?B?UnBwc2FPbVgvMzVNdWx2cFhRZ3F4QlNXM1o3OG5LaU1TVkpIelJBNVFYbkFl?=
 =?utf-8?B?N1dCcUQwRmgxbGMwcVFpbDh3cVhjeHlXTmpHVHEvQkh4VmlZbGNNUTFNcXRr?=
 =?utf-8?B?a1V2QjNhZGFmZ3RmQ3hsRE12WXNEWXVJZVY2Mkt1QVhjMGwydmVzTmdZS3cr?=
 =?utf-8?B?N0Roc1lQd3BURWhTdUpwczhmSnUwOG5UUjF2NFBXeG5HbThVY2cvMXFQMXla?=
 =?utf-8?B?bW1jNml5cUFvbjBBemZHVnRZUnB3SS9oWjFsNkN1d3ljc3dNOWRwVFJRbk1Q?=
 =?utf-8?B?alJidGV4N2ZrME5EcHl4bE81T0srNE1KU1Q2Q2R5U1ZJaEJTd0hTVkVUdW1s?=
 =?utf-8?B?U3MvOG9CS2RRZzZjV1FxWHI1SmNxQ2c4c0NTUHhycVZuckY0Q0lKejJwUlpx?=
 =?utf-8?B?d3ViUWQrbFpPcWRrWjYwaSs3Q0RxQ2hGTTJFZHd4M2ZFUlV3SG02L2lSa0JJ?=
 =?utf-8?B?M3hxRU03ZDhRUkJhYitIVE9heFJTWVBTbzA2cmdka2hmSG9jdERhaFBub1pS?=
 =?utf-8?B?QWhtV2ZUVm5tMlZpdUkwS3QyN0JOTndmR1NXNU51b0hFU2R2SUs0Y0NDY0tD?=
 =?utf-8?B?TTJvWWdHNy9DMTJBNXRrUDVhRzBtTnRzdnh2Zm84R1hhS3FBVGplUUgyMGFu?=
 =?utf-8?B?amMxQkFkeE1jeEFjQWxKTHgydlA2WHFVZm9iUDBCdkl5TlhpV3RrUU9jZWwr?=
 =?utf-8?B?bmQ4THZJalZpUGpGS0JyblBxaWt4aEdlSjFMMEhsZzI3eTNLZFdTblFDc29W?=
 =?utf-8?B?bitDN2dyS0pyQk8xTkF0dllEdFJ2NjVOeERjRmRocHF1OGdRenZ5QVU2djNW?=
 =?utf-8?B?L3JpSnhrZTZmRDFlK2xDU3BuaG1OdnhFdTZWTFJrVDd3NjRHeTd1aVNUK2RV?=
 =?utf-8?Q?JXR0kdOKkRM+xwb2zusDP7ZVC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d9526c-f30f-4f7d-1737-08daa201ff8e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:04:29.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBNBAktvYu4iPWK1WkTBQNrc4S5QT4jAKMHEiw703xEklpq4mp011Pd9UCI26a72YfFIv1FchfG4+XJ/ecwC3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

We cannot really avoid such and we're also not really at risk because of
them, as we control page table permissions ourselves rather than relying
on a loader of some sort.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/build/common.mk
+++ b/build/common.mk
@@ -20,9 +20,15 @@ COMMON_FLAGS := -pipe -I$(ROOT)/include
 cc-option = $(shell if [ -z "`echo 'int p=1;' | $(CC) $(1) -S -o /dev/null -x c - 2>&1`" ]; \
 			then echo y; else echo n; fi)
 
+ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n; fi)
+
 # Disable PIE, but need to check if compiler supports it
 COMMON_CFLAGS-$(call cc-option,-no-pie) += -no-pie
 
+# Suppress warnings about LOAD segments with RWX permissions, as what we build
+# aren't normal user-mode executables.
+LDFLAGS-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
+
 COMMON_AFLAGS := $(COMMON_FLAGS) -D__ASSEMBLY__
 COMMON_CFLAGS := $(COMMON_FLAGS) $(COMMON_CFLAGS-y)
 COMMON_CFLAGS += -Wall -Wextra -Werror -std=gnu99 -Wstrict-prototypes -O3 -g


