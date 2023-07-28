Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C247669F2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 12:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571414.895189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKSe-0007jJ-8G; Fri, 28 Jul 2023 10:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571414.895189; Fri, 28 Jul 2023 10:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKSe-0007fy-5J; Fri, 28 Jul 2023 10:12:40 +0000
Received: by outflank-mailman (input) for mailman id 571414;
 Fri, 28 Jul 2023 10:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wghk=DO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qPKSc-0007fs-8u
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 10:12:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4508dd21-2d2f-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 12:12:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 10:12:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 10:12:32 +0000
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
X-Inumbo-ID: 4508dd21-2d2f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDL3dS/rQzLqaWpc78qrN0mwQJWH+22JAna42yn/sCoc+4T6cjDyL5BMwiwxsCESh8AiJp0TQGTZFexy3xzVYPmQk1CLpRwoZA18D+yxIuUO9LpumANz9Z6eW0e6Hal2MmARx7DpmpcN2c4rMMCtNMgXUWDRbrErgL9hTtFedSqoiLSBA6D7+nGhwJVP4JhUH/vdLGXlOsqzM5+tz592th32bJraqMoIRw10IjTvRxFLOBnDET341bu40k9Zf3qbFsEYTz/9bdSeeYc7PdSuLtMDxNr2TyvkrxYBtBwuQL9qo0aUpTY2X8EY8qI8GZvZXj8j/3YyqnPnLZIUUHbcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjCOdF4UuGGVHSnxKV3WNPd+/ZOTM0K5Y8johWDgWYk=;
 b=d/70oCsC6qoeFRzeoneCHsNRI81l+WHyUg+umwAAQ+4fks2Hl4TabovgWDRXUWYYZjGcCMXYwi4Xd77wbNYhzgPjBAnywt2CFLQqvZ734wjWDOmmB5SHCT/QC/39i3pv2jfI+LoJagVo4zJJ35WR/naCC3tUDjj+D9DfK5kmzZ/GluYfSa1wURSYyfr2DS1dtQC/QAz3D7LjKulIHs8NjxCHgaVVjIqSKPx27+/s5ciOpt2HCytqIAygE3phOXEnjoMbUoMShC17rfBqpt6gWz3wFrRj1so+NQad12fQI1rnswC6iFIUFMNWqoQsw2EGtcJ1Eh3KJeivnm7ItUDaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjCOdF4UuGGVHSnxKV3WNPd+/ZOTM0K5Y8johWDgWYk=;
 b=4BCYwzB31IOsSI/2pT+z3H6hgJKcKL0fJ11ACLjZjf0mILze23fOtjNIF55gIPntXWj4vx8IpLxAUxUmV3VSllWjzSdPLLykvZb5BbBnDaZ6NHKFv908wbO97XCpqKnYFahFiIO+Zhw8Me5gB637BUydrLsu/9KVPcEXTwNvLxA5WB/hHStlSMy9WxnXMw8td8fpZojjom//l0ZwetXYxZRZIW2MLmhoe2F6/BEkVASkI3EEjlvlckHK2kDYzgoA586rb/ZQCx5SvjB+dWpkku32fmnF/P6cFHhFvyWxcnY8e7l1JH/BnJobNESUxK4qLMcTq4YMpO158oZZF+Wz/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27a9861c-7901-d9f4-37c8-f6895aac64de@suse.com>
Date: Fri, 28 Jul 2023 12:12:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 0/5] clang-format for Xen
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728081144.4124309-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 968e973a-b659-496d-2ad9-08db8f532811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bbH2jiHUmS87zpp2pd5wadRJCCkwGQgKY3W0KEs/ODuGaw9J6IaN6I4aEvCCt48oYcdI/fSc1e1pQc8BwIO0BinyrqTNqjO5SoDTUz8vkbufDTuZtdROrmDCbkF1rhHTd6G5J9Zq7S7r2ws8uEBsPuKaiy2uGJA63c/45Uknb9vYLMaRgvcfz0lHNFnghMP8Eee3qzyCn6AnI1gzn0x0gSnw9UheMnT0ASJJt4TJVuCTGKaDKnAPra9UPUEYcUOiTpxUBCKyF2YYgC8buAdb5f3Umdhxl1rKbHYpFUjBjOTlrupZspKJO2QtTvqHNhrqmUSTpA8R6mCMKkB8evJv7retSdB78M3ByxUqZTSvf2Bj8q1Y0nt+sGHURUx6YCiCt+puc/sPoIfEmsjTYeDLsEhH40MEJRkMpxcCYAf4xinOdMzfliXQjHXVZv5biVVXF9HI2tWdIZse+nA6/nvQdgYtlaA4d72KsfpoCUP7AW5LClwJM+FHFNAJcnbG/B0yLZBBjwhXwx785qaCIMJFuiCRAINkRBxX6mHEd1CGWiq3Fbwbdy4YFEoVqBk8S2Dw+dHSWxqDcDtoTO4nKMyZH+yOWvoA4DSnyoWwckApSLWiWwzjfYPz06Rjs+SFVMo1j+6ttoi8oxqfKRvWmSzJpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(86362001)(41300700001)(2906002)(316002)(7416002)(5660300002)(8936002)(8676002)(36756003)(31696002)(6512007)(6506007)(53546011)(26005)(6486002)(478600001)(6666004)(83380400001)(38100700002)(186003)(31686004)(2616005)(4326008)(6916009)(66476007)(66946007)(54906003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFdVdUtOeHVwbEVzaUdwdFJvWjU3aEFkZms4YW53VjAyYS9xdXdkUUJZZ2Q0?=
 =?utf-8?B?ZmkvVE5OQkFFQTNWSE9Ba3JUR2tmM3RTRjhlL3VvR09lS1hJRG9RbWtnRTRp?=
 =?utf-8?B?WkpGTVlwSi81eURaeFNjYTdZNUdEMjdTejVsbWl2WkJkd1Jza0lNeDR3Njdx?=
 =?utf-8?B?bklOamU3YU5Va0p3bGR0RUNNa0RCUGYxNUtxVlJUYnhzdXE1RHFrbll5VnMr?=
 =?utf-8?B?dGlXM1owZzZyM1ZsdmtOYlJUakpwK0FCL2Fkb3BlczRXM3k1WTQzY0ZtUW8z?=
 =?utf-8?B?NWZKUXJ6MW1UZHgwY2w0NkZqa3EraTAyRWVGdWhkUXZOWjVUeTJNSkcxU2hi?=
 =?utf-8?B?RGhvSW1ZOFlpZFhMUkV1NlZpMVd5dVdGZ0w3VDdDb1l1UmthTnFyUDdHNTNu?=
 =?utf-8?B?MUhLVU11UGcvWWJ5bTVrbEhoK1UwT0FrM1l3dmFicWI0Y0xheU5KOFMzdzdJ?=
 =?utf-8?B?U00ycVJlT2ZVcllJa3FvVzlDMWNBOFZlak9wZ1F5QWdEUFRndkJ4bEtydjhl?=
 =?utf-8?B?ajR4cFJmSDBFb29URWpnRUR0Z211TWF2N1Q2bkZJNEhOT2dtOWVZblp3WHlZ?=
 =?utf-8?B?NDFLem1YcU9Hc2VWQmpmNlRBVW93bEN2cVNMNVZRSWdQa1NaRExMK3FCdGxO?=
 =?utf-8?B?N1NNWVAySzNnRGYxdk44YWtMRUpyczlVSkxwb0x0Z1VoYk10anpUc2NMdlFs?=
 =?utf-8?B?aDlhdlAvdlJuYnNPKzQ0bXh0dWtETFJpbGRGVW9TKy90VUxSN1VkaHZkTDBK?=
 =?utf-8?B?MzZaVUprbnlXZ2JUTXZQUWxZQzdxVzVMMFQ4Q0YrWnMybTUyNXp2UXF4U1R4?=
 =?utf-8?B?UHc3QkdCeVJyNmFPcjk0L1hkVTJhbk5YL0Zwa25uQStrTTJwSm8zS0tLTjlj?=
 =?utf-8?B?QmlLbjB4QUNBVmNpVytOaG1pQ2NYSE03R0FNOFJ6Yk4vRUtpVHZMeGJIQWJZ?=
 =?utf-8?B?YUhUMjM2QklwQVJuam95UXZ0S0tySldFUE4xbGtyTnpsVXIzMUNXRHhjOEVR?=
 =?utf-8?B?Y3I2OXpwYm00WGRDbXA3Sm0rMU9CRHQrTEtmeTFDbUlhaC9FWDhMcDFmOEsz?=
 =?utf-8?B?cFZnaHVkaEtNbHFqMXZGdzVWWEhqS1RRRVl5M3l0Q3ZuSWJ1YkphQm5UOHdI?=
 =?utf-8?B?QlZ6RExzWDI3UHZpVDFKa0dCTjV3VWN3Zjd3TUdQUTQyT3FBUFBNZkk1MFRk?=
 =?utf-8?B?OGxQVEJPa2RNQ2ppODY5VFAxa09HZkRhMHNIeENHOFE3dWZIV0hmdWwrTi9X?=
 =?utf-8?B?cFh5MkU3ZHY1Nm9HVlczVlovVGxzSnNzVjRnYk84VlZ4T1ZRQ0hsWHFRcGVH?=
 =?utf-8?B?VFB3WEZjY3BncjVQL1laamltaDRybEJzTE5lZzRGSkpyS3hFUEUxWFJOZ1lE?=
 =?utf-8?B?eG81VkwrQ2QrcTNHNXBMUndNK0pyNEUxLzJVRFlXTE0rdGIvczhVczNhSkN2?=
 =?utf-8?B?ZVljRVp4akp6ekdTM3E4R3B3M0FWVmxHM2VCVVdaQmtHb0JvczZManVLMXlO?=
 =?utf-8?B?OGhmNGkraXZwUkdGSHJjeDJyUXBiaFZ3OXZRN1Z4ck1uRlBIcXpGZFFtZDZO?=
 =?utf-8?B?N1BWbkNLSGZCdUdZL1ppMWE2dDZ6SXVxd013SlQ2RnBZOUVWVVdsa0dZc2tR?=
 =?utf-8?B?MkxQUlcyNHQwdVZsTHI5aWgybldaQWFxNDU3cStFYkMvVG44b3I1VUJVUm1F?=
 =?utf-8?B?QjVtNEhQaTE4YkZxdzJiZzVRWHM1TVJaeHZBbnErVFRHanpZcjhhalFxNmxm?=
 =?utf-8?B?WGlPM1dYRy9NWXlpQVU3UXd3cGxjOGVmYm5WVzdxb3B3Q0YzY29EaEJETnpi?=
 =?utf-8?B?eHQxeFEyWUQrazlHWjY5SnFZU3ZuVDdYbVUyMmk3R0RCU2dKSUY4MGNLWXp5?=
 =?utf-8?B?K3YvR005U1lhQkpVNjR3amZ1MWUxd1p5SVIxRzI5eWtGaGw4QjV6L3hudUFl?=
 =?utf-8?B?bTVVWUNKQ290T1dCVmNGUWIybHBFUWJQY3hRVW81dnNBc2NUeDhYS3hCTE00?=
 =?utf-8?B?MEh2VGQ4Q1p1SEtSNW0ydm90WGVEL1FYRnh6MmhZcVFhNHk3RnlCVGdPaUM3?=
 =?utf-8?B?UFdDWTZ0U3JmaW1JYWFnTmd1RW9jNkhiRFdOU1dYcSsxK0d1NjF6U2VhUlB4?=
 =?utf-8?Q?Avmv0CoXqzIi3qhWJrCf2bocu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968e973a-b659-496d-2ad9-08db8f532811
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 10:12:32.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77bVg1a2U6dmdKToFA5j1c81HYs8CB3WmVXJWalqyDzRjdT2zK+/AQIjA1J5Kqw6qTkG6OiJxx0LbLOQSBP/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989

On 28.07.2023 10:11, Luca Fancellu wrote:
> I've read the past threads about the brave people who dared to try to introduce
> clang-format for the xen codebase, some of them from 5 years ago, two points
> were clear: 1) goto label needs to be indented and 2) do-while loops have the
> braket in the same line.
> While point 1) was quite a blocker, it seemd to me that point 2) was less
> controversial to be changed in the Xen codestyle, so the current wrapper script
> handles only the point 1 (which is easy), the point 2 can be more tricky to
> handle.

I'm afraid I view the do/while part pretty much as a blocker as well.
While placing the opening brace according to our style elsewhere would
be okay-ish (just a little wasteful to have two almost empty lines),
having the closing brace on a separate line is problematic: At least I
consider a block / scope to end at the line where the closing brace is.
So the farther do and while are apart, the more

    do
    {
        ...;
    }
    while ( cond );
    ...;

is going to be misleading. While normally we would write potentially
conflicting constructs this way

    while ( cond )
        ;

the alternative spelling still isn't outright wrong in our style (I
believe):

    while ( cond );

Jan

