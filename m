Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793B5B2FB5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 09:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403866.646128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYMS-0002Xl-4e; Fri, 09 Sep 2022 07:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403866.646128; Fri, 09 Sep 2022 07:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYMS-0002VR-1Q; Fri, 09 Sep 2022 07:23:36 +0000
Received: by outflank-mailman (input) for mailman id 403866;
 Fri, 09 Sep 2022 07:23:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWYMR-0002MU-AT
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 07:23:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f4bee16-3010-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 09:23:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB9013.eurprd04.prod.outlook.com (2603:10a6:20b:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 07:23:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 07:23:33 +0000
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
X-Inumbo-ID: 4f4bee16-3010-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwQuvMRaZjQoJeHigZFpAk2s/OTwkP7dyOu1rRmpqwGx4Abzn+RHntdXY0uIelZOl2cEbJzuV0CtzSn8sslQMsVDHbrhmHatjGg3QBYsTQ0ZKk3At52qt1I+SeECzvQM6AZcA1UVDS9edv1AxvW1CEe6JOuZI8xqCrfh2sW1OnRaGsecqDZE2WB0oOzZmeFO71CHRZma4+IMn2cF9x90L3AS9K2SBwnRDnVsSFHn2QyFk0EW72n8vtPPT+qBShv+LqFavg838FyggdEa0tN70+2BhAWTxh1XxY9IGxvK7R07GUgMUBWKd0PBlhoJO/toZwt7UUEqkwMayHdw4ooDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6h3D37U1hyV3ZOoYMiLCX0lzV1VnQzToPpFi7OtJOk=;
 b=L7qnRNvUI/EoyVMjCesYYrtfDe7kMjVJu5+BZOtHGGdbo5vWWSl4Q0GKBXzTJ09AKx5oTw9cAm7CBO8VJH+qwSKoq4QOmDkpdh8RuBoUIhSCFwNJuMYxdvkYBR64QNWeSHyZJhAZiCsibRB2yXcapuOKZ00nj4nDuY0vO4gSigQoMFxV7701hgV3WbSQEn/BHl+FMKvtxUA6ifTpZN0c6IUXgSbexSZMM6jhsLEaD4vX4PnQp40zi8f27NWCVKhckH8Wj/ydBZp+2+xRxghvnXoei3GJ89tfYoRhUVp0CiSNbQ91Qr5Vqzv5nYpbHmOs5kNzQIGt2rywf4I2HIqQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6h3D37U1hyV3ZOoYMiLCX0lzV1VnQzToPpFi7OtJOk=;
 b=rzEB/t4sMa0h23/y5Vh0+bE+UX4bizjJ26uFTBxWyRHe28PtCfW5O4cqQQdO16KFXx1Wz0YvW/z/P9GWiYO0FahJJpdC5UNr4hxZ5PGkLLQySUfsPCjLc5ZLIQQO/evAf2Qqg08HtcJmh5u9x5Nh0laKeveQUxUpRuTR66izugnsq3BdfYYJrKQmgXe0XzdQXC+xFZnZx1e5tJiY62rC731exxnIzquTL59bw6AtyhC0ttyfojikkLeiqdr3NodEkizhczB73swTjV7oYtr6nCA8pSFdhM1/nMzThJdSyZv3TZFtWAqkSYdNte7XFt0srwU38B757t35KM0+ohGtbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26c58539-8f58-4727-e327-442f02cc3aac@suse.com>
Date: Fri, 9 Sep 2022 09:23:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: suppress GNU ld 2.39 warning about RWX load
 segments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 10749452-7eec-4eb5-c13d-08da9234339c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aSI9eg/hLWwLF2aDpLMeNniXKSdZ9UghQCPzPklKBpf29W/kVrmOrmKkfknnVCbN049ceymmHIf8+g8ng/flWVp/nlhZTUc9nrTySKI0YFBrT1NqAs6dqWr1q3WnNOsLSj2KDqJZQw/kQsCpQp5hCpLsCIYz93kW244W+DyJ0CqUOEsaLTHp9e/M7gR5vtvKjyCuUAwqH/BFd/ts2DF2PdC//TmuhU1ySgv5CXwIgYhO+/4z1ioD1+yTKRuanWuKtqrxUQ3OoWchThAy4iggCnT8CVb7Mefnmf2YQpog7fE1ZvgfJFN3Xjy/xLKbFfV4A2qvApGeTFdpCMPJ+BlN6Uyk8ytak+jF4RVLXEpWzXpSj0SnGXsnl7lYW6Zy54Qvo2EPbZGiRyusyupcyhkl3QUocNRt2sJ78zFt/5dGSC/silQmmTt/3Cqi6psOhkIQPtkgEDQizv5v7AJfg453g1ms3quOPEYBpQpUhDL0rzmEfDGK66mshvhDuC9G4V+nqEmPftjvZz92b0ZLmWNrrLLIL8BmAf02McA7gsBn3x5VrEI3Q/V9sZ78oor2otfD2XiAWa1uafv8Ytxd6B7nSmTRbJNBYfARZLschHJHuSos1IgAkblEWORXuCSmR2fwkcq6LY4w4zrZUoFNTK7s9RQAf9eRrAIqpgsnbq5fDLsR0f7Bh17wl9cn3r4w8AlqwOc7SQ1GChaNvd9FjSCYqA6vS/vIkfPlw2J+cqe84Ixv4hgxwvd8aphUj/ooZRUhUlZU0DTH+JbT8dCfJTlIhsoohSBq7dMq5WdthAAWybs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(366004)(396003)(346002)(31696002)(86362001)(54906003)(6916009)(316002)(6486002)(31686004)(8936002)(478600001)(6506007)(4744005)(186003)(6512007)(26005)(2906002)(36756003)(5660300002)(41300700001)(2616005)(83380400001)(38100700002)(8676002)(4326008)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERjQTBDR3F2MkZldGU4dHoyZmYrN2UvYlQxcE03R2UvQ012R2JqQmpkcnpz?=
 =?utf-8?B?ZmRydXFBNTNuZ3BLbzQ0YmRnaWk4T1R4UlRZK0VHY2dpUGQ5dldyd0tiZ3lB?=
 =?utf-8?B?WkdhblRIRlRYYTZIQXpXOUtZRkRheHZYelVDMk1FWERhczVGcnZNK2pGc05n?=
 =?utf-8?B?aXlxNnRRcjIrcytnMmg3S2JnZzYrMmNFNTZqZ3l6Ui9qczJvYWhwZVpmZEZw?=
 =?utf-8?B?anE0OGFsczF1MTNWTXRjTjF2dzVmSmNqMU9mTVJrbCtzY1krZjJVenc5dmF3?=
 =?utf-8?B?ZEk5WEtpRThYT1IvVWw5K3AvdWlndDdpR2J0dFVNTjZRQ1pFV21XWHI1ZWxH?=
 =?utf-8?B?aXRMajYyaXZQczVEdnJBelI2bTg2ZWswRGdoKzhsVnFtQTB2M3l3YmNydmtD?=
 =?utf-8?B?VUs3bWtlc2d3V1N0dlBRclBGR3BKbzMvcDc1aHdTdWRwSW8yOEVzZ01DeHVr?=
 =?utf-8?B?WFV6WkE1bVVUUTVEZW9wZFRsMUNJREM2VTFhY2ZyMnpIRjdxQ3I4c3lQQnRi?=
 =?utf-8?B?TytBSWMyT2hwRllQWHNtNTFSVDQ4L1BvbmxKQnppWGc0cEUzL3A4K1ZBTnZT?=
 =?utf-8?B?R0hnOEpvaTdmUnlQQ1FabUM1cnFMZW1yRjdlQk51bVdTSXZhU0RuTUtpLy9r?=
 =?utf-8?B?c2RiRFJEVHJvOGM2U25tTnZ2bXFRK1FuLzZ6ZTljREhCS2xieG1PQ2t2Wmhk?=
 =?utf-8?B?OGRWMjhSQmxhcjBTSVB1OFlvTkdwenVKelI5c3NFelRCMFloV0lqTlAxOTBG?=
 =?utf-8?B?dTZkajc1dkNDVkxzUHBuQTJLdEZjRGJ4Tkx0MHJMVlNTUVVwdkhOTXVwRzVL?=
 =?utf-8?B?NkNMa2JhbWhpRVZNN3pIRDVkUDgvd1RyZElQUW1ZdUFOSkQ2YzFwOTNkQXlG?=
 =?utf-8?B?TGN6NllNdGI5MGNIblFjY3A2QUhFTGZPQlZHK1hWbzM0b0FNS3huS2J0U2Zu?=
 =?utf-8?B?V2dicmtMRUh6UlB2eVBDRUFtSm9ZWTFJemJOV1JGd1dMV0M1NjdhY1hyQmRq?=
 =?utf-8?B?V2lwM2NjUm1QZHRpYWRETW9waSs1b2IxOTJxZ3U1S2hHK0JsZllnQzJuY1By?=
 =?utf-8?B?eU83KzVPSjNXYStieS9hZ1FmaVlOUXpDS1pZbHFmZG92dEZudFZoREM0Mnlx?=
 =?utf-8?B?RFFaMzhIYjNMVHFZVk1wQytMZlVMOVlPZSs3VXI0QVNvUzlXTlRnZjRYY2ow?=
 =?utf-8?B?U3pCMFJDUXF5RkhUMnQ5RnpqTUR3WVcyR0FkWVdWOHNPd1UxMnVUSTFIc2xB?=
 =?utf-8?B?VEFRMURBTUlWWjVBNTNXYi8wc2E5Wk1ZSlFyV1BqL254OS9RQnVCallCQVRC?=
 =?utf-8?B?enRrZUU4UmZTaXpNbXZCSitBbzBzemlPcElCZi9OdUdXd3dJMnNDWDVNUzlU?=
 =?utf-8?B?UWRXZThHUmF1T2NpNDN2L29KbGJVNFVybUJFazE3d2g4b0tnMVI3dCtURUNS?=
 =?utf-8?B?UVhKeVNWVFFuWHlOSGdpaDhsd3VsaFBJbTZ6WFpnT214WjdnMEtGbG94dmxq?=
 =?utf-8?B?MWNpQTRvNFBBQTlCRUp1dy9peTNYN0d0QTNrSGtDd2FaeXNVeWlCM1pLdG5t?=
 =?utf-8?B?U1F5aHpwaytFUlFWNkthR0pSOGFVd2EzZnRaampLVDd4TEl6Y2dDdzA1bkFr?=
 =?utf-8?B?eXZvZFdKakpoUHNjNEM0eW84VUZvOGRTQm50enRnYThYUXZsMmd6WmE3U1lK?=
 =?utf-8?B?RjFFQ2tmZVpIRGpsamh6aWc4S0lhRWRsdnd3NzM2N3drQXlRU3RycU04L2Jm?=
 =?utf-8?B?NUJ3a2ZJamJpMFFBa3dSdC91Z2tWVkhqTnBxdnBJMmF0MVRDRGN6VUdIWi9D?=
 =?utf-8?B?d0sxOU12YWRXU2Z6SFlmOHZYdm5sa05WY0VTOVJac2ltYkhJd0Y1UjdBdGg4?=
 =?utf-8?B?L2RsMVQ2KzhiaXQ3b21vMGJFMXVGMUhqeUF2aXZhYUJlQzRxK2NTN2dHZFl4?=
 =?utf-8?B?WXJzbTVkWExjUzArR081ekFOUDFhSWpXQWRYQ2NhMEtQTXN1d3BPVGFScisv?=
 =?utf-8?B?Qk5PdUhjTVl3U0tHeS9jdnFsWHpFWmNqcDl3L0FjekR2SUpsQ3hjUVZWcnZH?=
 =?utf-8?B?OFozVVFUSGhQZjlJY29jNVZSWnJUNE9uc1JNUXhKYWZJNVkrcUl4LzBRWE51?=
 =?utf-8?Q?Xn0gwhECSCFF8NG492oNTuygF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10749452-7eec-4eb5-c13d-08da9234339c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:23:32.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxB7Z8gTfA1Jd9NJ+JxDBjD3uWTIfHRyVSgtjWU6MJlu2J7clLXkwediOgj11tlsdoVCBH66V7PebMJB8wwanw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9013

Commit 68f5aac012b9 ("build: suppress future GNU ld warning about RWX
load segments") didn't quite cover all the cases: I missed ones in the
building of the test code blobs. Clone the workaround to the helper
Makefile in question, kind of open-coding the hypervisor build system's
ld-option macro.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -6,6 +6,8 @@ $(call cc-options-add,CFLAGS,CC,$(filter
 
 CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags)
 
+LDFLAGS_DIRECT += $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2>&1 && echo --no-warn-rwx-segments)
+
 .PHONY: all
 all: $(TESTCASE).bin
 

