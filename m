Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098EA5AE0A8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399451.640625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSkr-0007PM-G0; Tue, 06 Sep 2022 07:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399451.640625; Tue, 06 Sep 2022 07:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSkr-0007Nl-D4; Tue, 06 Sep 2022 07:12:17 +0000
Received: by outflank-mailman (input) for mailman id 399451;
 Tue, 06 Sep 2022 07:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSkp-0007Nb-EF
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:12:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a741b8a-2db3-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:12:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0402MB2775.eurprd04.prod.outlook.com (2603:10a6:4:99::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 07:12:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 07:12:12 +0000
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
X-Inumbo-ID: 3a741b8a-2db3-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRomu4KIra23FRvt8ImYMMDtzoTUsT4O2cXbWR9BaKjIBzqnRcLLxSpSOy8+vGxoelFnuH+bKgr8VBUgLhMuYeZPp8ZhULqa51PmL12g5Q+JWk5sEeGH9BIkgs2sh9G2ysXc/k3A6WAJiugD98Gv+zDhyYUPZH1HAYqND78C+Wd6ulynlMliGEKQWEQP96qWsS+/P7M9p8K7npq1/WkCiFK20btud/HYJoSaXwY4otN3nfReIj1dL+6b4MK/ZeYrQNLASeLaKPHutLLscVZLSxq34cdCjM8obgweDvB/uwfW0B36Y90L6i0OhcuYHpFaR7b2fbihnT+pM0RDepeusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Qv1yRbwFt54gt5dYwQMtYOC2jFf4S9KVBq4/ZC3nuI=;
 b=QXHsq3myEofUV4I/2I+72yqCfE32c8Q4t6cSDHWWo88wFFScOubFs0KSwHBIq8DBINvMc9dZSWr7XN4Lu4Q+2n83/RywCJ/KwMKkPO74b0rJypmcipZGguF13jne1etqpfCLIQZl+QMYcp0ZuklLWBl+BcEFAJltQxfmseNLWmuDtow1U2MgJ9C5SE8+rKZ4sqRCWFzUZKsLHGdamHCbQ5h6pTzjPR3+3hVDCiJCoz74lu219PQwJcNRi+jTYoSM/ThBV3jLlrpj12zzyyo47Ctk9i2pw0Fq+VpyoHd0HZPmDkM8ABLXD2AHDvqaNWYMZTDZZu5yl7jNkZP9k53zog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qv1yRbwFt54gt5dYwQMtYOC2jFf4S9KVBq4/ZC3nuI=;
 b=zR/diPyuxh2hjGAkLI8x8j8hvd89rHbk2RWSHKN7X5C7iFasAhOnYrHlvCHvHamjW3wBxuNtCZ5lZKFcsSU56cccDOpoeJoF6TVMc72aN7nRimW087eZ7qzHV+gatjkvx0bwPGjc96VyLa2XoPGItLNdm6qClIfDLy7/OpudLCTi74K+/1RYlYbp2teL7ku+LnRoAMlcurWQBp/BmsGrjmZJ24bYr3q6cyyJxClM7EqSGMK3ErXp3Mr2mwul6KHZsqMffbf7bWH+YN23NqlCfLMFDKhkYMdBe7X2keP5rbW0IcAKFH/uqiMuOSdWZ8I57a78fSHq0yd0LCxLO8MtyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23cad912-f716-af99-3fea-e7e8bc364e8e@suse.com>
Date: Tue, 6 Sep 2022 09:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 6/6] xen: introduce a Kconfig option to configure NUMA
 nodes number
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-7-wei.chen@arm.com>
 <33d061fb-5bb9-f9a6-458e-23909d306580@suse.com>
 <PAXPR08MB742006DF3B08D2E74CCAE3AC9E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742006DF3B08D2E74CCAE3AC9E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b701be6-9b1d-4f53-16cb-08da8fd71eef
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2775:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kf1seglfY6yAd2Y98W7Ly6IDjqdaimiz+6/sKvcWy9pRDAoaZMYo9TV974pmefzQa0BX7rrpjBUpv4Mbh2mgXA/ThX6dwtIxAmnJbkbAkF92ZJl5qVOrDO5NMmwv5uEaCG3fbtvA4M+hVvIik88H2bYTCxKBwBQmNVWXNbluNvWGXXyf/a29MPBE7r1NtYd3+iEHZtjtwECbAkIjt8/+LeNcqMZ05PapZRY8udPqdRiMHDHTdQrgG5SuddePhSjDxYNxh1RUdhy2obll7Vff7vn+h4VmnVJr9368au5PPCDUGjJ/fICJ1ZRitNza8IBPEYq7Mvbfm7k8FjB3WVUXwJc0QXhpTrRjLiULUQFW1ByWPFDzvukdsuq1PdlxXjPqbCC+YmmVPJIvX27rxser5jda7xi6tlAJ6n4Gq42QxrlCATzmvBLhvbcvrE926Zaiuwdq2xl85ps+nJDcsek6Y52SpUHotoBxmAOxGU47HV2OQvl64qli4lT/0EogkenxNwLNvMkgKR+CE1JjhsFBu+xLlvGZoipzPOJ7aH/UWGUOfM1VMEzlUmZcd15+BBbWbLiUooqb9cQA4tx8lFSyY3DhzjqBFHpOiK+cEjBL3i2yAM0sS7jsifh2DK/oGnp1NcjUJqc8NgttdPtjFhksKFW0nUz4GlHB8QZYm3nuPNf6XuK/9LS7LAIO96ntS6cCu9VdwOPp192zr4Yek18ax0hRR8DqsvV9JgKO7h3UmVRKGzK44mvHWiKFTSRa9b8SHgXjMeyf3ytkX5/WwXRsQj+6g9BsYgA9YNm2BoK+SPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(136003)(376002)(346002)(2616005)(186003)(41300700001)(5660300002)(8936002)(6916009)(316002)(83380400001)(54906003)(26005)(478600001)(66946007)(53546011)(8676002)(6512007)(31686004)(66556008)(86362001)(2906002)(6506007)(6486002)(4744005)(38100700002)(66476007)(31696002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05VOUpYeW40UlRnTEt2YzVFZXp5QkNCU2N4Kzd4a1lSelRDeDhZblRRU3hz?=
 =?utf-8?B?VUpDR1YzbklLYmw5Q1RwTVNNZmhpeWk3ckdoOC9mcGtpODNvMHI5Um52Ui9K?=
 =?utf-8?B?NTFnNUl3aWRKTG9MU2drU0pOUTZhSy9yVTVtdlhFT1FNdGpHT0lVQVZTSy8r?=
 =?utf-8?B?ZkhKaDRoQXM0NERjcjdLbFpZVUc3MmdUZFo0TG82eTdOQVJCVkV3R3RaVzdh?=
 =?utf-8?B?aDNYN2FMWmcxRkUrZmcyb29iQ01yeFIvb1NqSlZsc3Z3dXIyMjFYWGxpSFBP?=
 =?utf-8?B?T0dNMytxSGd3a1N1aUNUK2VqcERkTDI1Nkk0QVhUVUZvL2g1SnQyQlBieE1M?=
 =?utf-8?B?aUt0VGhvcHRseU5FUXM2aEpBN2JWSGZ4N0xLNXRNektMRVI1c1N4WWU1cEI4?=
 =?utf-8?B?RjYxcU5BY0piMERGOUM0Z3NQNUhWNkpNcnRnbW1HelpvMmlKK09rQnlGZjJz?=
 =?utf-8?B?RFpEc05HZS92Q1JFUjVtV2hUbk9HM1grSkNoc3h0RmFCRytOeFM5OXR3cXJa?=
 =?utf-8?B?alVadEkyZnBZZlZtRUhmOXl1WWZ6WE5TZnlvT21ZK3ozSmJrK29zck5pMnA5?=
 =?utf-8?B?Z2tUeGNjVStraDdMdlczSll4NjhtWHY3cWN4RFY3QkM4MnMxWG51T2tCN0tV?=
 =?utf-8?B?cmhXKzRiWkNtdFhKN0tQbHl6RzNsT00wM3lxbHZ0SmVRYWdra0pOV0I4UXNZ?=
 =?utf-8?B?LzdmbzF6R3JJRGdIdDlCMkttNVFXUVUyTEt1QmlnSElTRWxxRHNXUXNkOHdn?=
 =?utf-8?B?Rmh4NUc2dE9WZVdDWmlJdHhvR2NONjBMa3IrWXhOTm9BSUZZTUZZRkpXcGhG?=
 =?utf-8?B?cjBzU0pqbjFsc3ZiVXFNeUJVRmcwdUpyS3V3MGZRYVpHQTlEYnFCSk42TmFN?=
 =?utf-8?B?cDJldWo3bmdIWE9TY1lvWnpoVWZxZE1uSmJqQWpma1o3L0UvRnRPNGJrb2N4?=
 =?utf-8?B?bVU0c2lMUVpYaXBpMG9hd21nMnRvM3FtcmM2UDRjUWZJL1VBQkJQQnIzam9H?=
 =?utf-8?B?VWFrR1NiZmVod2UvRGx1T0JWK1VhMDJ0bTE3YnQzTk9hV2hsWGc0dmtGbzBz?=
 =?utf-8?B?SU5XelF5dUh4UC94NzhObXJTZTNPQmhkOFRZc0d4WnZsaXVGUVBEZDhCNnIx?=
 =?utf-8?B?ZVRyOUdJRm02R1M2OThiOFE1eXpmbUU4Q1NaaUNJVGZ1ZkJvK2c5TnZ6UE1E?=
 =?utf-8?B?WHk4SzdySWpCL0lHeFV4TzYxUis4QjBYTmFTdUt0c2s4TXE1ZUhIayswSFBC?=
 =?utf-8?B?c3RaRUVHQ1o2Z2pNcUdPbFhjOHB5cFNqSWQxNXM3TVVnS3IxKzgzSURzME5M?=
 =?utf-8?B?a3NBMVU3RXJGODE3YTdhRjhOSm1jNFlqQ2xDV0lzdndvT0ozdU1hQjFRaGpp?=
 =?utf-8?B?elRIMFVwNHFtdFBCNFZhTHZwNm5HT05HMi9wNE5WVE4rcGNDcEwxNE4zb1FG?=
 =?utf-8?B?NVNkbngzek1jdnh5UzI3QWFwU1h1d2xLY1Jhc2NiYmRpcGZpcjhwNHlKQktR?=
 =?utf-8?B?ZUJveHlHWWlIWkF6VWNISlhKbEp3dmZ6cVp0WjZ2aWVQV0s1Z2U2SXFLbmt3?=
 =?utf-8?B?S2lSRzhDVjhuVWQ1ejJpOXpoeVI2S1ZEb04wNks4MDByeElCelVyaHlad2Ey?=
 =?utf-8?B?bU5XWFlCNzVQOUtIYzBNVko0TUF5a21qRmNNUW04aXFKUWV5SkJLcFQxTDl2?=
 =?utf-8?B?aUpWaXlhWno1ZVVWZVJtY2JXeXltUHBYanBYVGtFeDMxUWNoRDJheFRUU05y?=
 =?utf-8?B?THhaUVlCblF1RXZ3M2xNcWUzS1ZHNFpjeWc5bmUvVHg0bTdwem8xelVPZ3p2?=
 =?utf-8?B?Z2tsbkwrekFOanJ2NHcyY0Z6NUNleXRUZ2RTQzNES0tXdFhSUUN5YjZXVUdq?=
 =?utf-8?B?TVlYR0VxaUREUXN3UERrYlZMSmQ4LzhrZ01KTXIxd1F0UW55RFNVZlVwbTJE?=
 =?utf-8?B?NGF5Z3pIaUZqejRiU0xQdWFPTWRCUSs0YTJmcFp0N3JWSTVMOTM4V0UwVjVm?=
 =?utf-8?B?OTdNdHh1ZDhGL0gzT0ZvMDBjanFBdGs5VGxqTUE1Wm1lTDNyUGRSbC93UXZa?=
 =?utf-8?B?MDlvdGl2MFRybHNLU25PdWJhclozcjVDeW9FcHpGS2dpTjZ5K09xL1R6Rll0?=
 =?utf-8?Q?qeIZLxZkiACH75W8m0I+m+L+Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b701be6-9b1d-4f53-16cb-08da8fd71eef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:12:12.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd7YUGXSS7Dk1ujLKBQSZdnXmjW2O88nl4fUjWB0M4EQk5+uhqEZdf0U2gFO20VfMworXjnGKZ3yiKeYIULbiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2775

On 29.08.2022 13:00, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年8月25日 21:06
>>
>> Note that there's an alternative with less #ifdef-ary:
>>
>> config NR_NUMA_NODES
>> 	int "Maximum number of NUMA nodes supported" if NUMA
>> 	range 2 64 if NUMA
>> 	default "1" if !NUMA
>> 	default "64"
>>
>> But I can see reasons why one might deem it better for there to
>> not be any CONFIG_NR_NUMA_NODES in the resulting .config when
>> !NUMA.
>>
> 
> Is it because there are many places where alternative patches need to
> be added for #ifndef CONFIG_NR_NUMA_NODES?

Well, yes - that's why I said "with less #ifdef-ary". As you may have
noticed, excessive use of #ifdef easily makes code hard to read.

Jan

