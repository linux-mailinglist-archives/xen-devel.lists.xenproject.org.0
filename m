Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7C6E72D1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523126.812880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp0u9-0007UN-H6; Wed, 19 Apr 2023 06:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523126.812880; Wed, 19 Apr 2023 06:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp0u9-0007R0-EY; Wed, 19 Apr 2023 06:02:57 +0000
Received: by outflank-mailman (input) for mailman id 523126;
 Wed, 19 Apr 2023 06:02:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp0u7-0007Qs-KV
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:02:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d238b77d-de77-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 08:02:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6926.eurprd04.prod.outlook.com (2603:10a6:803:133::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 06:02:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:02:51 +0000
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
X-Inumbo-ID: d238b77d-de77-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlP2Otp2DW50qExZ1izKhOtTAYzfEhmPwo8izZTFIgLgsK2NyODY6MeUrkwACLgQ0PAqGJbI1dOcalB7wiHEpYG5czk5mekRfu3NtYQztceLS2AfvjMTFfyKt15A7uD8Io1eWmm9r0Gd4ERbrVrZ88+VtxT/mQcT49qF2+MEtlzbd3kAeETDmh4ue2Cii4R7jeLqPA/YKUX404wyDfGMihIwNs7Bl4cUBIfqfxtPcX3l/eZHT/WFJQozWKpXt0njR7CBPbl0h8PWqreiTdK8zRdupxni64OhgzkklHZCP/RlYzU4gTk975dsJ3kw4Ekg+ZQOXHiKSLJL1VnPKUMdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=estOwcJE9BExonNG4DxDXubZ2rM29t7xao74rS6T2RA=;
 b=HE5nfwe848dwTfUKslXU2+hR7Cj5DYtjaK4QesVUdwv28ZYK+lcH3c1z2undmiMhK1tgNariF6pGGITebqw9luddALGE/R1PCnZkqQQRp7VVwL1Irb9MdcKkZ9lEjtc9/tChgzSPu/QrqBfZvyhkXlL1T6NbUD4iMKcj4YCTe/AqSVtkzNs4/OdrB3+PtAiKXbcbbnE/jgYEUC7x06tVmy99okXRk/gC530FnF123ntR98XTSNmfC7xbsXB/cIfHzn9hdPVqr/MlHkb+wDjzEs708HcyigeZIbwbB/d2AFOHbjdwnTIslQ9mTBRVXsX0o/Pp3++6QL/u9JC5SylQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=estOwcJE9BExonNG4DxDXubZ2rM29t7xao74rS6T2RA=;
 b=wtsp4o7l+cDYabScDKyG/i/BfE63pmKDzztdk7IsH7gLCInmPddLc4f5gON4OhIk3lpud/q9JaC4DQ569y2B3nm4oKsrP0rMdIazRfh2Gv5IRH6gPGxr0MYGQ5R0WBQCm5KlLoqWloJnvGhUIfCTH6UNlSqXWsHdnR/HfqjkqhUYHUVYE7pI/vCnDK76RBOKrS6Oh4dy25sG1CYFvAE6h35kiKRHSKkUySio4q2hNnKfYuv4vP4zMCCEVabWuggua3YHFoGKmja6NHebveqOXNVxDlq3NRp7nboiUOi5S0KUXZI+cTgQY8G0FzZ1Ye0G6dyhm98RHWwF3Xoz/79QGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38127c62-2dad-7072-706f-8e58b89bde0a@suse.com>
Date: Wed, 19 Apr 2023 08:02:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 0/2] deal with GOT stuff for RISC-V
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
 <b343d8c3-b23b-c67b-76f6-c25d5892328b@suse.com>
 <48a1fd97d34a37a2cdbdadf35811d31523b61a4e.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <48a1fd97d34a37a2cdbdadf35811d31523b61a4e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: f7820bec-ec14-4cc6-5e9e-08db409bb599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4c2+Jlt4/xoBl2DSVPXt4IOWPkmoBy6sQfQi44TMy4hMulwfEYQJmH5ydhYb7+QfTivqeGykl+qU2OAoJnqMqhksbqf7H39EWzlSRzqehaPHK5HAHUP5d8N6ulVwT1hcaR1N+vqoTZNP0ypZs9BNf6zOhSIsh/bCMox8W4n01/HHsJmhKwWKRd8SuUJb60g5l5Btj2vShFtWi6NHGvQzA62XkFknfRnf+yAeZ9OswoobNBC2hX1Ubgwl/5IOTcDf6L9mwQXeWHyvV6g0wde/1Xu3XnyLJ38fQ3nU3+k31/1Lt5TKeP1dImlb1Y/7WrDzpozdfOD9Me7qozd5yLwvSlw6+AhsPHXnQM/CXWKGYt+uU9Le45SHiwsc0NJIznJR/EwvXjEfhqPgLE/g4NQHN5tWCoL0GyZuqgd+tn2fXPKOwsNUwAe/dMvcSZIrOkktpkJ+qNM9QA4Kb1leIwoK4P8WMjrWIjRuD7UCvgFmMnhvNz/AQeOVb6A0KYbiyk+Zh9Ls0xm/YOCAGQGmOC0PaVHVsQfAmzqw8R7196zsoKlbSsQyjQUoc+jjyzBFYKKEszJDI4a+utVXTH84ifeMJzObTL4uMdy28834wu7giB389YGayb+L12yENhNtvV1YaH68G5JSQs/jxwK5zVwZdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(396003)(346002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(53546011)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFo1bHV1bkNsVndaUVBTTFRxV2N0bjFJeDVFcUdzL1FKaW5GaHBhRXdnWGNY?=
 =?utf-8?B?QWQ5L3UzcHViMjRxTFJhWnJDZjlTT0xodHRkT0pheExBeWlBb2ZmWjlrV285?=
 =?utf-8?B?YkdFbFI0YzV3MUNhSERhdWg4TG02OFFEOFlnVnZSbXRES1RxUFVqelV1dVVn?=
 =?utf-8?B?V2xkVWx6SkNyU0lEa1o5UWNUOTFjeEJjRmVUUStiSHIwNGZmNzFxS1I3TXlG?=
 =?utf-8?B?TVpJZWs4U0Y0TVdQaWZtMlFLZU5FZnBEd2FvSDN0Y1dybzRVL3pCUVQvNTBO?=
 =?utf-8?B?NWsxay9BcjV6MVZlOWR4cU5sblhEZ1V6OVE0SUg5S1orZkZwb0lSY1ZXNWRW?=
 =?utf-8?B?T3lvN1crdkwzOGVmZyswMGxWbmxOeWs3S3hJWVNCd2ZOa0xpNy91QkU5RTlv?=
 =?utf-8?B?V21OS1NDZXFEbFROd0YxclVmcjVEdGhoZFpEcjQwUXhGZ0Y5YjV2U2NKL05F?=
 =?utf-8?B?Z3FYZk5yM3FIMVlOQUdRSUlFQlNCWHVZNHdLZWZEU2FnNi9CaG9KUE96NXJV?=
 =?utf-8?B?dUF6bGZ3NVFrcTJEZmRsMzdEK1J4KzFPKzBBTjJoaEZveUFhRGtmTlhhUENn?=
 =?utf-8?B?MzZyM1Zpc0wrcFVIUmk2WmNUWVNCYXEvZkpRb3NlYmhYT2prdHZtNDQyVXE4?=
 =?utf-8?B?akduNlJGRG16djJwNXlFNFgwVkl6VnVXNWxiM1JjYyswYTh0RUZwd25pYzBx?=
 =?utf-8?B?SWFqbWlxOGZscWtoZGt0MkZjM2ZVQVhYdzh3OUR4WDhCUXQ3SDFRazYwVmlu?=
 =?utf-8?B?SmVoSGtjVlpIL0dzdkcrQ3JZb3JoNXAvWUJnZ2lSYU9zdHlqSG8wVE01S0hN?=
 =?utf-8?B?NDJDY3pwWjRTUEo5VmJPQXdaTWo3Um9EQXN1bHN0cUErWkpNZzRRVzBKOFpB?=
 =?utf-8?B?c3praE1pY2cyYTFpc1Z4VU94ZHRHNmt3enJXWThUMEFPVzhBVlNLUUFTUlpX?=
 =?utf-8?B?UkIzeVZTVTRqRUY0VTQybVNNTnoxVUg5WkdFTHBLV1lNRXIrQVU5bExNNFhk?=
 =?utf-8?B?NllGMGt5VmM0UmFud2p1OHhNd0ZhYnpaTmk1aWNFLytJTkJNbHJxSEtzK2tQ?=
 =?utf-8?B?UkduUjdjaGVpVmNhU25uVjEweFNUNzkvWlJkU2g3Q2RjVG1MU2E3VU9RdkFD?=
 =?utf-8?B?ZldMZzNMWDY3a1Qwaks3TnZxRlZWcGFaeWNuaFA4azVQbzkvS1FxcDZ6L3Iw?=
 =?utf-8?B?cUpTby9SMDV1VFI5Y3puNzhYNVBGWVhLaHQxSFhDNlJhU0dqa2lzbTNEYmZB?=
 =?utf-8?B?czNRdEVkbVV0L2t5ZnA1QThPdkVrcUhHbFhIZisyUlZEMVJyTG5UcThKOWVQ?=
 =?utf-8?B?ZW1DNmM2VmRnWmpEcHQwVzRTWk1EOC9TYjBtMmRRWm5adjQ4MTdLVWh0TUJs?=
 =?utf-8?B?V2k2Z3JXL295ZnZQVlFMQzFEQWVzSUNvSzJ1eVdhaDFhcEIrY2kxWWZzc0k4?=
 =?utf-8?B?RlJRNVU5R3BTUEdmT0E3R1N0UDRqalFsbHFza0pqT1FKaHVRT3puNVhCaXNB?=
 =?utf-8?B?TVZhN2IyeWpHQVJzR3NhSWRTTHdVd2N6b2RQenZRRElRditqL1FYbGh6OTAx?=
 =?utf-8?B?cmRDZ0ZFMHEwankvLzZxTnFVclJDd3gycHJRRVQrMkUvaWVTL0RWUFdIN1g4?=
 =?utf-8?B?bFpJRmJHc05LeVhRbXBhSnBkZzllU05aQk03V2RjUjN6UytxSytnZi95eitw?=
 =?utf-8?B?Rkp2RHdTUXZMN2JFM1RTK2Q0R3pXOHJkSjFOQ29lZDNiT0ZVV29oNjhENHBN?=
 =?utf-8?B?ZVR0Z3QrTk1obTA3VC9SVnVpeHlrckMrWUxNSEFwMXQ0VTBaSnpWdGI2Q2pa?=
 =?utf-8?B?cGxtNzBUa1BGTURuS29ZUXBXMUFTbjBXdXBpWEJTSjlCL21NT3ZXa2ZNbDFU?=
 =?utf-8?B?WDlQMnVNZlhxaHVBakhyMTBPODB1SFlsL0lUN2FUdmlnR2JHV1l6bUh6NjhT?=
 =?utf-8?B?VVNMaUxWR200d0lEYTd1RW45TmZGZGZUdHJQSHhoajRvNDFkUHpZUjlRY25K?=
 =?utf-8?B?MVVrS1c3QktZemtIZE1uUnhwaitRYXRkSUJkSDdwYVlNYjB4aHpiT1F4cE1V?=
 =?utf-8?B?cEpWanlGV3dWOG1UdVczOUwxK1pyd0dncWtWUE51ckIvQnpJbERLcURSVHEw?=
 =?utf-8?Q?bBMQA0OhSHh+NAsLtyk63sdMS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7820bec-ec14-4cc6-5e9e-08db409bb599
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:02:51.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxGvbdE/7lP5CuDWkvXN/mVge/fphwE0kwt0lOkR8D/J4IJhVITE9c/3Ld53YOf6q7B9jITA5izTb3Gz8DhzrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6926

On 18.04.2023 14:03, Oleksii wrote:
> On Mon, 2023-04-17 at 16:12 +0200, Jan Beulich wrote:
>> On 16.03.2023 14:22, Oleksii Kurochko wrote:
>>> Oleksii Kurochko (2):
>>>   xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
>>>   xen/riscv: add explicit check that .got{.plt} is empty
>>>
>>>  xen/arch/riscv/arch.mk   |  2 ++
>>>  xen/arch/riscv/xen.lds.S | 13 +++++++++++++
>>>  2 files changed, 15 insertions(+)
>>
>> Just to mention it in case you aren't aware: Hunting down the
>> necessary acks
>> is your responsibility, not one of the committers. You may want to
>> ping Bob
>> and Alistair (unless this response of mine is already enough of a
>> ping).
>> Provided of course the patches still apply as-is ...
>>
> Thanks. I'll take that into account.
> 
> I thought the only option I have wait for a response from a maintainer.

Well, in principle yes. But pinging is appropriate after a reasonable
amount of time (rule of thumb: a week, maybe two, depending on e.g.
complexity).

Jan

