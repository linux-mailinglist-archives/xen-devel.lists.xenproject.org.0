Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513873314F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 14:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550147.859057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8fR-0004iy-Hz; Fri, 16 Jun 2023 12:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550147.859057; Fri, 16 Jun 2023 12:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8fR-0004hI-DB; Fri, 16 Jun 2023 12:35:05 +0000
Received: by outflank-mailman (input) for mailman id 550147;
 Fri, 16 Jun 2023 12:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA8fQ-0004h6-56
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 12:35:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 377bece0-0c42-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 14:35:03 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 12:35:02 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3%2]) with mapi id 15.20.6477.028; Fri, 16 Jun 2023
 12:35:01 +0000
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
X-Inumbo-ID: 377bece0-0c42-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWFNzt4C6uQZao+dVxgSLx2oIl/CaiuxkV4aSSlsGCzXaLJbAH2+5q8PEk5qL35orHdNkBQhLtJ02enMuax9STxvYUgnDzmq4Sk8hafAJHxMfHAf2DifBUyjm25AzYDk8fHNN8XfTdePmiOaEijjTi9EYhDY4kgP+fX1Kk1AiAdba5UB1IBgPHTPxxa17XA4IQXxEDnya1ftijGfcsUaY8d1Oo1lsfSxbytT75scc4AK1+fZjbOzDzlHVl2itRDBemQ7jCJAqvlYm/6kbe4HXJUjw31qXBPD286JxSclJX436nwIuboDRDQS01mX5ye5mAcoGSmbzNhiIUpO7b+Lsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfS3vE2T1VLNIhD8fOCheuPBqsBTMf8f0zk7Gx5Sr08=;
 b=FaBKM9bWP8k0GTLWgFFFM9T2NTl41kqp6voPY+BKQ2yAABRMgmu5B+O9raPYiuObueOxffeRq2DRKYVVv6sPOaP/PKs/KC48X+fY8R3PFapdXgFR1bpGjh/az/Cm+l7luFI7SCavi7+DYWH76k0SvI19qRholGelX28gTyJvWMFjqtltVvXp1vZ1zAIifoxc48NxwxzgmllnztZ2+3BXc6LDOh6dGbiU6t+s1k9DlRGf9LR/9EZHsnh5bGfg1A8Y71f5CPLpS4FvebkeRhXLsccqmi5sU3NaNlhuxkpsilJn5v9nIQl+VvRVV/6pQgP6MkJ396HJZ+EM6Fy1iggBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfS3vE2T1VLNIhD8fOCheuPBqsBTMf8f0zk7Gx5Sr08=;
 b=KRLTcCdV2Gra43ueyqqY8LdaGvcRmR81QbylViHfVgA/SRyPrGSKxMBNWmVOPa33q4jq2QcCiObTHwSbFM+OjNgWnnpyvUdcDHjtAZ07Wj+F9z4OnvwSNnMb1oyZCjknEH2kJJF+DzWv0Xhv/W9mWNPaBo2Lghy6cEVL1GKbp2VlLmVJk4presxAnCNriGjCghHrFpulw/RQwgUtyBjetDYLDQOPqLRWA9dtgcAAPBbtgZaPgkj2tO0jHRMZRKx0yIe3/c857o+Pf7IX3JkCw3z4+2jSeM9ubiliL6e3BkDb3AN7zsOjnFODThoQgu/K/SiW/QRB+Dm1r1eiHynRPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5b375bc-23ff-ba21-b893-bc9b6bb41b28@suse.com>
Date: Fri, 16 Jun 2023 14:35:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86: fix expansion of %XV
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <51f4fa1f-065b-2e3f-97cd-fb91737150e8@suse.com>
In-Reply-To: <51f4fa1f-065b-2e3f-97cd-fb91737150e8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 11303e2c-3e98-45ce-e9a6-08db6e661acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMLA/ZzvWIra6tGRWeKVu7Y1akSFvDdSKk5xK1Rfkyn6DKLQSZrNJ2STedh0XYI1s43DzV6W80UfOEzbz9WctN6O8PZrOboG5J92CxtvS2hc3dwdxuGgojG9ACRpZxlqkYY0yqaX80uoPO5oTnPa/1mW0zdZ9DD4pj8SCxZ2Nq3u2ps7QHdusDi1OC4nTwZnvWiHPdJUuCiDSoBxPPU0wa8LTvDMCPS2t/BLXJB5kgS/dpKGwQCYxmsiz1ojLniegQMSHlZnhExD/c3SvvuGIXZFrFmU/CtSDTsmgJcGrLv1I0epqw1FdZ2H80+4aTtF1JovEh9ldOuxDXPd2+gAhvd9Aq1osRMAZosYGvE0zju/ydSJgeiOfnwfJt6TEfWwu2hWB/+gXbM9rnGsYLsCDvCnavPjdmBdb9/GU9PQhgZ3bjRfKPnqwwv/xwJnVsET5oawhwRPzEFNEUWtxDB7EfVyPix31lNB4hsUWdixg3lvcLLxkHSOMMk3UYuSaZSboSLDHbWXc1MHvQmr2PKUo3y7QGRAHPoijQKGVVXRYQ7mC+P5tXSXJ4IgPlUU1DJTYglGz21IxfMs37TW/LUq2gPIjLIRSGU6tPPRZubBSHLYOSQm65ZJKfsXI+g4OXU4mSVCKf79geXb789lhDdm2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(31686004)(41300700001)(86362001)(31696002)(6916009)(66946007)(66556008)(66476007)(8676002)(6486002)(8936002)(558084003)(316002)(36756003)(53546011)(478600001)(6512007)(26005)(5660300002)(6506007)(2906002)(186003)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0hyL1BydFhtQnRtdkFoSWQxcWFQa2JUTC9CbXZna2FkQzNZOEtFVFJGVWhi?=
 =?utf-8?B?MVl2K25BYi90UWpQbDVnR01WSWpRS09PbldTUGQwbFJLamFFZUx1VkN0eXJE?=
 =?utf-8?B?YkVIY1dPYTdZOUZnRFk0UWE5dDY4SWNQMkEzNGZrM0VMeW1FV2ZWcTRqOWc0?=
 =?utf-8?B?NTlaaUx3UHVnTFA5TFdEL1VLZlRWZE91QjNWWThTNnBGOUxiS0QyNVBUMXE1?=
 =?utf-8?B?TnNjMmtyZ2xrbE00cmhPUWJFYzNjNlFzYUswS3k3RXJNYkxvZ21RQ01ycVNj?=
 =?utf-8?B?TE02QVFtYzc4RVV3ckhFa1N4UmtMNnA3d1RNUDJyS2I4ckdmR29tMDBJRDF2?=
 =?utf-8?B?RFBSYUhsMllrUGZJNzFyTjNmTEhRQkZ0TThERnQ3Ny9Wd2YwNWtld1pwdGFw?=
 =?utf-8?B?VjBNSDc4MFVtWnJLVC9NOWtMeVlFT0RTa0lnVE84eGRvM2ZPbTN1QmtWWkFh?=
 =?utf-8?B?Y2lrbUVPZG90V1N6b0RNdWVmR0NtbTVTOHo2dGR3bVRNbnF0cHY1dU1EaWdt?=
 =?utf-8?B?WUs2SGg5MWkzSllrZENPcmZsMUhJa1RlQlIzeEc2bXJTVVNsWUQ5TW1wNXdh?=
 =?utf-8?B?YWpUejUyK0JNdFk0S1VOR1VIRnhmTTVrZ0c5SnJFcjZ4VjRvM05LVHhoTDEr?=
 =?utf-8?B?LzlLYWh4NjJZSDFSWXlzakN4TElyN3BBckhTUDNZRFpPQjhQbG1XSkM0ZVJo?=
 =?utf-8?B?cVozZndsaGxCYXcwQ1RiODBNdUlrUkZEUGRMVmxuTnBEUURsbS94U3crVmR5?=
 =?utf-8?B?YkI1cUM5VFJOQU5jZVZ5cXI1SGtrY2UyQnA1M1VaMXk1YnN1WEZaMWlrV1Qz?=
 =?utf-8?B?cElBbmU5WkFxSGFvWDhmWUdzaEZOTmVNcVpwWDl2ZVNkWEM0VnNlRFdhc1lE?=
 =?utf-8?B?anByTkF5dHBlQ1JpeFR1QzNxSUh1OStSWjUzOEtnYzExTUt4UEs0YlI2OERT?=
 =?utf-8?B?STBjQ3Nsckp2M2pOOTNaUG4zUzVLV3huRVJ2blArQ2pHSkQ3VmZCMnhlY1kx?=
 =?utf-8?B?VUxKeWMyNEwxMGRQWjVMcDJkNzc4STBwZExlQlZraDJ0VDQzMnBoVXpUbDdD?=
 =?utf-8?B?cVV6cW5kYmx4V2EwZ1drcjMzWTFzU0pJT3kzL1pLZktCZjFXNHl6QllBZGta?=
 =?utf-8?B?dUpLQzFVbXc2cFF5VTFWTW9xdGpxNlFTeTBnK2FQN1VueEhOZDhBWXRwZDU2?=
 =?utf-8?B?UmV1N01wcHc2L1J6Y2hZMElwN1J0b2RKVDR6alZDWHBLQ2s4NjlhRG8wYjZ5?=
 =?utf-8?B?NXB0TUxUb1AvUUxiU2RUUSs0UitnRmZNSGROazdKZ0c1VnpiS1M5cGdqNFd3?=
 =?utf-8?B?NDdqUTZVTElBVEZKN3pyYzRTSDl5b1R6QkxOYldLSndZcko5VGltMG5TWVhQ?=
 =?utf-8?B?VUJBcW9OajZsckEyS0pxZ2NmZzBFeW50OHhwYjhZblpjTkg0ZnpMcGM3S3NF?=
 =?utf-8?B?TVNrbnR4VWM5clpSdjR3MGpaQW9UeVVkY0cwbHRFYU5IOHVadHB2L0s0SGtp?=
 =?utf-8?B?QUY4dER2UTZ0cWx1WXdGZElVSzgveGRWTTkyZjVhTTViQ0hFSlIrVVlNVE45?=
 =?utf-8?B?c0pmWHpNd3kxU1lWUXVpOW5iOE1WbEVRWmI5ZDJpK0Z5SUN1cU41Z1dudzZD?=
 =?utf-8?B?T0NkeDJiQnVxZGR0OHJBdDJDRXlmbnBGaHRkaE5rVno2U0EwL0ZEU25hUlkw?=
 =?utf-8?B?RXhORE1iZVliOWd2aHp5VUlYL291eFg1YkJDOUhIbkwzU1JUbDZqRmx6a2VW?=
 =?utf-8?B?d25JdXNsVlRreHg5dXJERTJhb1JTN3VUQ0RjMHZ3NmU5RG8yMC9ZYUIydGwz?=
 =?utf-8?B?cXltKzdnSjVhV1h1bkdBVGFpZzRoZnpNQ3hoMHE4aFI3ZU52cTB4a3U2a09K?=
 =?utf-8?B?b3o5U2RXNzI1TDRscUVTTWJtV2xISVM5clpoamswZDNoV1psMDhJYUl6TUx3?=
 =?utf-8?B?b0xocUJSV0VTb2pTRWJQb0krRnBDK2pNVFYzbzFBU2R0cVFWWGhuT2Q5Zkt5?=
 =?utf-8?B?Z28zQmhyR2Z0ZmZyL0l1c0Q5VFllVW5ZTVVNNEpGK09mVnNRL0loL3hqYzBw?=
 =?utf-8?B?bGcyUXZ1Tndmb29teGYvbG83OUhHam1BR2hILzFuSWVIeVlKZ1A0QjZwd1dh?=
 =?utf-8?Q?lQbDg0/YpcwD2UpbqHCwA7umw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11303e2c-3e98-45ce-e9a6-08db6e661acc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 12:35:01.9446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYMqENuIlrSzcaH/XqbVP/MXMoqDuI9IAEPb1DkyMblEcrLi/ZgmDPk7ciP104IpEglZ0wX2NPOcquHbTxr3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220

On 16.06.2023 14:33, Jan Beulich wrote:
> Only %LV should continue on to S handling; avoid emitting a stray 'l'
> (typically) in suffix-always mode.

Oops, I'm sorry, confusion of mailing lists.

Jan


