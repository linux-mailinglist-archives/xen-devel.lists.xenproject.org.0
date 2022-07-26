Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80E5816E4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375482.607893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMxZ-0001qa-2Q; Tue, 26 Jul 2022 15:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375482.607893; Tue, 26 Jul 2022 15:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMxY-0001ob-VL; Tue, 26 Jul 2022 15:59:00 +0000
Received: by outflank-mailman (input) for mailman id 375482;
 Tue, 26 Jul 2022 15:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGMxX-0001oV-UE
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:58:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbbe1c18-0cfb-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:58:58 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBAPR04MB7208.eurprd04.prod.outlook.com (2603:10a6:10:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:58:56 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 15:58:56 +0000
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
X-Inumbo-ID: dbbe1c18-0cfb-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEiDuMz00USppvBuL+2buMmzx5u2V7ohqMJ98LeyQ3G7TfEjeUncn6v6LtZX95ngbq7rMGKBbzXu6se9Ez5qf63Va5vRFK3S7qXvSGeeiYl2TqiVUrUVPCt4OLkYnEaaL4nPj4Ag0lp488uN8o1QS907Z5rWe3zVK4eqEm0sZK98TZMrmPIrQc3wq5n4CNeBY4L9hCBKfHx4JCf7Ihaxl0kJW+bPO+n5TsFqQj2Bx2v1F5PeU+SR3WSHIbhOOGTeH0IzvTAiJwR3luNet/pmz+40lUwLyp3rp6d6lG14NsAVPhysaRvcntD9mVApcpIagzgbmbSZ0jZo2HEpztzUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLOj6yoCnkqIWB4fGvFMXNthb57eDnQEkou6bf1+w1Q=;
 b=LlNUwyG/2F/Gi9pT7dUHvXSWCQTzB91Ak7YH2VO41wtBWgiLvOVsiamaKdH8jMi5JirxXlTkGkZGzYWeBAIgyOSOvcxSL+684jVIjMdRnYC9S25yePZLcmceNVQU+b+3nW0+Xr8GNgeUTv3Cj2evZQlOa/7uQwYkTK0JW3tUrSoN+ainvI/R3DML/iocO3r5aYSMGhbfBAjKoGGz/CfwhxEGqOnQEgRpb7+4jad65fUVinPrY/2TMq1ovXzNh1F8NZFNTSfnD3dP5V4+mRjr8XjP8X8IwOWfLLKyztqLL4W9OwNAkqSI4DDgEGMbKxhmtvGQ5AeakyTSBEjxoRMnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLOj6yoCnkqIWB4fGvFMXNthb57eDnQEkou6bf1+w1Q=;
 b=xVMMnHNDwJLecGXDLQzj2EYkQZVVkJxn5n22LR26hlQ8Pa4v87hGZYcA0jYwR/hpXC+TiVf6X/Cly0rfqKa/Mdsghr1pBDMEmQovDajWIVt4AUB3QLhiMFgmLCe7/2KsGum38IzYKnS0gTK+dwyxmWabTZmSO4XIOCnFLcpRmmVKTcg/WtpK6+ELFl/hERjyVR3ARdWw7bh2vzcBOqCoWKAS+s3KeUVXEI1tSE3yFSulHtlxQgIqrzSqf3Ha19hhiX7xGtt90YecM6iOV89jaFs8sf1mheoSecCKZ+Pr0M+NsvPw22Brd2bCDuj9ArlS0pGu3jmNZuXPtSnfGS/j2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Date: Tue, 26 Jul 2022 17:58:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] x86: XSA-40{1,2,8} follow-up
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c4e1688-a131-47f5-f44e-08da6f1fbdf5
X-MS-TrafficTypeDiagnostic: DBAPR04MB7208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YAZsHlmYYsT62VH2y1dRR6IcbM2seq1muvilhqB6wrpx+uayba3WbMxq1ebbqTcrw8g2xZs0KnEDaXNu6CHPvjmtX/3ZtafNzZHyyqQ5AuzDB+mI/4OC35ipo9LOv/ucFzZvMAXFWtRgdQ2J/jemnf8soY9c/+W+cRIckFLSMlR+Be7SLajl77lBNt7OxRZg2GDbK9PxfGlcpH4M4aenMXVZ44B0iIcEAUDi/FA6psN7ndrG6OzpyXPf7/TiVCvmaotiEvKHJ5eAiLIX1vrRFNcBPPr5rVblo43BrhsgMKXVeVGYuNw+Nf2PjhRU+u+uKmXZeMTycq4mRXUvFLOj+SD9QG/GK8OuGPbPQCtOgXCWshQbrVeDVLFCBF5+uqTb8FJ23sClep1MUDHvvYgAsXdMVUg1BkmJFmEGsQdIQYjchQZr07qRNJyjNu6S0RjTU9WoVkkYU16l5kBLrA3AxFQwGMSSx+aHltrY+2Z+NvFk+F/+scs06+bgB3pxZCQJStSL4AHIMWDFtSgayiSNuVPfDnVmza/1Ieg36FBSpYJv8sy7KzNRHIYfKKepB0icEwtjxnb6jF6EYOhs9vQVXX6RYcEGy+8XwteYyfx9kkbvpsZLJcBwrT0C0BtWsRd0mTqjnS4n4RM9tj1BGro04Uqf3tDgZoqnhH2IuyQp7UdXgcw78fQjaO6ztQaoOCBroasGtAdopHrnVDF4I66Vcuw/jHdlQgQURpl/jwagHS/m7Ei6pUB+bsA3oJUozBmaZACXShT2QP60MfGk9ZhLXeCkmL4f4xjUVByI0zBekzFUMn694MB/Yx9lYsxMEfNjx0TPje4wppy101gqQHp2hA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(396003)(136003)(366004)(316002)(54906003)(2616005)(6916009)(31696002)(186003)(36756003)(6486002)(38100700002)(4744005)(2906002)(5660300002)(8936002)(31686004)(8676002)(4326008)(66476007)(66946007)(66556008)(83380400001)(6512007)(41300700001)(478600001)(6666004)(86362001)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGpKWG1NdW1Sc2FOR2p5UU1PR2U5TDZjYWtlRVBENVg3OTkybzlFMFRiTWJu?=
 =?utf-8?B?YVU0UEh6eWNrOWJ2YzFpQUZYckhPaUVyRGxRblZsZ21HRGw5RjgwSng5Y2lr?=
 =?utf-8?B?UVVEbjFEZWNqZklFTmQ2YitlbCs3SzB1eExHSmNoTXlOV3Y0SVRtTHI2M3dn?=
 =?utf-8?B?Wmt4L1RYcEhlMVE0OWZZUCt6RnZmaWJMcW0weWFwVXNjdVRYK1g2WXVweVhZ?=
 =?utf-8?B?cFVSSWpOS2p2NERrVll6NE9jZmlQQTNjNmZ3TVpiYXN5TmdhRFB5Nk1UR3Mx?=
 =?utf-8?B?aUszOTd2YTV0VjlGK2xBTjc1VGQzaVYzSWpDNUZxbzltSWx1azFoaVNnTW1z?=
 =?utf-8?B?S0dvb3NEMFFzMkxzOVlna3dZMFdBZndTSi8yeThnWk1DZ3VrK2ZhSlY0R04r?=
 =?utf-8?B?RzdDZ21wb1F3NG9yNEpjTmh4WjMrNENSdWRTV3pUQTFlNDFBK2RLSnM5ektC?=
 =?utf-8?B?TVV5Nit2ZmtKSm1BR09kNmNVZk5wdEY0Ni8yRVNRYVhRTG11ZUhsZ1JRcFF4?=
 =?utf-8?B?QzdXL1pBTGJ4UERCVERXZlBVMTE0TVQ4SjgxNjY2K1hWMHBCS21kUUNEb3Fp?=
 =?utf-8?B?blI4dlJpOUdDdDcxU04wR3JMSUU1YzFlRWlGc1BRSGV2cTYyOXlLeVFYL3hk?=
 =?utf-8?B?OVUvZ3RKbTVHU1gzUEd2bk5aR2dQRkN5d2ZXdlEwdmRIN0RhTjVzNnZzY3Rp?=
 =?utf-8?B?RitmYUcwRTZpWW1pem5TREd4UGhqUG1heXhrMXhYRFo5cTFzb3NhMWVwZEs0?=
 =?utf-8?B?YnVXbnBHd0RXWFJINHhrcnhpQUdKU3hCZ2pqZUVJQXpLYnYvcnVRRGhYckhi?=
 =?utf-8?B?cUZPSyszUDFNeHppSFdoVEFCUktBYkpzY1k3eTZLM29rdWtqOXdZVCtvZ0py?=
 =?utf-8?B?VHV3R1Jic2dQZ3RzOVFpY2xWTVBMNTZRbkFWaCtVTUNNZHJWYk91YVArOEZQ?=
 =?utf-8?B?VnlmTjJvL2c2cDdlZXM1VnRsLzhDY3I1Y1dzWDVaaEpNUFhMUTFBZjZGVE1R?=
 =?utf-8?B?dkdSckJyWGx0TE9sQU4yRWNYSW1GNUIxQjB6SDlYNVEyclJUQTlWT01ZMFIz?=
 =?utf-8?B?QWZsRW1CcVNXVjdiVTdTRjZWT0dJVlgrYmlUSUQ4YmlaU0RiMEJtZnpWQTlQ?=
 =?utf-8?B?UGRsOUkwcnhmZnROcW1vNlh1TXd4Sy9FbDdrS1BUWC9zZjRyUVNZQVJxdHdv?=
 =?utf-8?B?RTV1U1Y5NGJMNE9YeUlraVJoUStYTVNjeEFVR2k5bzQ1eU9PazdMU1dFOHhM?=
 =?utf-8?B?SkpSRjNMQ0NYeVpGLy9iUjdPTjF6a1NTQzdyUFJqUjMzMkQrWTNMdnRGMUhW?=
 =?utf-8?B?bEdwWXl0RFlFbHdXNGgxTTZhM0Z5ZXlRV0hzRnE4eEZwb2JCc1MvQWh2L1JW?=
 =?utf-8?B?b3dFc09IV1pTWVhyVzdVMjNJdWJFcWMveHpyaFZjdFIyYmE0eXFKVzYrcVVq?=
 =?utf-8?B?b1c4QkpHaitJdUhSMS8zem90N2l3aXh4czNVUjJLbjlPWStGUDdudGpUTy9U?=
 =?utf-8?B?VkhPeFltNzA1czZSVm1vWXBmdnlmTGJBVlpSblBaR2RmdXl2a0IrbWJTMXJN?=
 =?utf-8?B?NUdtaWFBbndJakYzNHowMmwyMnA1cldOWmZpMk1nK0dyVzl0Qno4MW02a3Y1?=
 =?utf-8?B?UC90cTQ3bzJVZjlBL3kxZER4am41Mk11M3dqTHZ1aXovTkEzYXVNL053NHBn?=
 =?utf-8?B?M3hicTA0RWZJS3k5TGFMRlhZZTBxQURqM2d5UU5MNDJjSHdhT0g4bkFjc1Ur?=
 =?utf-8?B?TFhLMG9wdzI5T095Ylh6NXkvMGRrYVZHT0JyMDVSdmYrdTJ3QlUxTjNZVjJq?=
 =?utf-8?B?LzB4eGFTajNkRnZnL29KVjQraFRoSVU5OWVDWkFkd0d2TEVuOUQ3L3ArSGVs?=
 =?utf-8?B?aTVWakpCNHFOMDUxS3ppN081anJXY2szNzlVOEJQMFpzbXpkZk1uUnRKZi90?=
 =?utf-8?B?czJ1SEJCeTN3cTcxczdhditnVGlZSXdCYi9KUE5RWk8vRlEwWVZHTkltV092?=
 =?utf-8?B?TnNIZEhCZERLNXBkcDlmTXBPdng3Zm9Nbnczb1pEWkdoSUxYb1pOMkhlSDJq?=
 =?utf-8?B?dUNJd1N6NytKWjlsbUQvZTNrcXVrSW8rN2s4b0wrMkNNeWM4OUt4b2xEZkRu?=
 =?utf-8?Q?asHtQPVtg8UnQ/1vV9Vg/HeWV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4e1688-a131-47f5-f44e-08da6f1fbdf5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:58:55.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GInIJtu3m047rmd5/ZXNDrcpfGsOPxIh4qmNZ6wGNjrzkB+QBHFIQc1eTQ8Y+j2OGxdZty801mA5PNxuC/iJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7208

Perhaps not entirely unexpected the work there has turned up a few
further items which want dealing with. Most if not all of these
aren't interdependent, so could probably be looked at (and go in)
in (about) any order.

There's one more change I'd like to make, but I didn't get around
to making (trying to make) yet: PGC_page_table being a shadow-only
concept, it can apparently simply be 0 when !SHADOW_PAGING.

1: shadow: drop shadow_prepare_page_type_change()'s 3rd parameter
2: shadow: properly handle get_page() failing
3: mm: enforce return value checking on get_page()
4: shadow: exclude HVM-only code from sh_remove_shadows() when !HVM
5: shadow: don't open-code shadow_remove_all_shadows()
6: shadow: drop CONFIG_HVM conditionals from sh_update_cr3()
7: mm: adjust type check around _get_page_type()'s TLB flush
8: mm: re-arrange type check around _get_page_type()'s TLB flush

Jan

