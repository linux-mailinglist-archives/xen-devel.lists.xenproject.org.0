Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C5863CF9D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 08:14:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449734.706651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0HI6-0005Kr-TF; Wed, 30 Nov 2022 07:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449734.706651; Wed, 30 Nov 2022 07:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0HI6-0005I2-QH; Wed, 30 Nov 2022 07:13:58 +0000
Received: by outflank-mailman (input) for mailman id 449734;
 Wed, 30 Nov 2022 07:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0HI5-0005Hu-FP
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 07:13:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d81553e-707e-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 08:13:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8765.eurprd04.prod.outlook.com (2603:10a6:102:20c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Wed, 30 Nov
 2022 07:13:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:13:54 +0000
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
X-Inumbo-ID: 8d81553e-707e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZpGl8cZDdLaSXCOH1zD6N/7kXH3tAn4YdkwVcbrjSII07L8/xcw5Jg+t7d4vhe2jBeX+ThBRIiRGYs+iuH3NVOCGFmTOgizxVBuLhsB+Lh0vX4LKc8spu9orQsH+uUhZ0JWzMw6eVc7MZZ30qlaTLaJzYSVPYgPkupv8YNNFvcLKh/ewNuqemfsV2nVZli7jW39WHp0co8zuH6WvkYzE530H3MOab6mt91LG7MRugbj5qJglGt0NEtQUOIpr0zCgWaipRfqySfbLLJiJckhCa/0MaKVS8mH4J+LdSNzKk+uscXVS5JXly0q+IPefyp3e7FtSttCHQFlNGTSDbu//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC8kG7822CvfUwgpiXQ97BriLBn2mJ5fFfA/1em2LJM=;
 b=n3H2FtVMtTIHNz4on9XzQ+kb1il5K89qBzl6JkCB+KAVEICsTUo/AX3yzQ5MXg4DzPmgc2+ibCX/bBDt1/kBshLngnKbDuCDPlYZXC5kOGdv03PjhFTcvwfjNwdOHgeVjJXj5OmOTK9QCHAaZG7ynOFRqWV0FQhchxlhhJIoijtYgrb7PFygWGDeXoOOpD2x/HPm7iZyfFUyvGDnzEtWQwSnERUOskEUStRuFgV6c8Di6X88FOCb3qVNmXUlCNGxbYNUTnJQ15UuI6QRlZf3Y/PVips0GS+faOXDhb3nIrA6Wwxbbuc3Vm73j+g6EhKFMq0lQt5eHhva6lb8Zi3SAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nC8kG7822CvfUwgpiXQ97BriLBn2mJ5fFfA/1em2LJM=;
 b=GZ/tZdAEWVUZLY2j5iFNupQyuvJpRo2YhxEO6ao66deTVIMS5ayGEtJj6YQuA1XZXTMiauJCwuOFDt+JvMyPMwSr9ETP0tbUNYp6z1+74THigi2sb6PnMf3ixnGHAqvErkMMkhCDS9OF2AvPCJX0uA/r0W7YweSFzu/+E+1+wn/6QTN6XemuJL654LWoaZYDx8tPpaM5N8fmOpXNcGLGbSylGI8CpapbhwMEjPRYkL8I5dCZpDcXkyKrzeoocfXH1roQPZuzhDATmzby6N9q7m8hceVX/JYuR2t+mIMbAw338YDNlFWUuLhL7/Xyuj4fUtFrFgS9BJwF36iL7FxJ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1d2e0c3-5e16-c808-35bc-b28f1712e510@suse.com>
Date: Wed, 30 Nov 2022 08:13:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] Arm64: make setup_virt_paging()'s pa_range_info[] static
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a249b00-5467-1733-cab0-fd6d55765e20@suse.com>
 <4a93a89a-7d00-491d-766e-fd9a524d96c0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4a93a89a-7d00-491d-766e-fd9a524d96c0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e8830b-2df2-47e9-cb78-08dad2a270ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7UoqNrQIdXUavk7xLBJP4xVois12tpbNtAi/b9h/6dDUpTCx4XoDWNmLAkRcjFvBc3D/WYAlK4+PaSBIvyiZQgaFE9G+Oi0I80u/jBCsX+QTCBPTI5pTEC1wYV6667ivm4jOjfWrbvbi+ab6/dLi5HnyPvjMi9DsnqvVpSxvzKizZrF4OvYBA5Bj3MY1c2tjgQgLvDf2fBgGZJGy81HeaEM7otfawwD8ZjVcFL/p6HzdaVIjozGNY4++0pDEiJhtavtwPLQUCEnjUZgttWBvQGI1b/MCk0FXhaStQoeWVUEcOMspdWdZymIblq8W/t9W/tsFP2VcXVwpt4sm6010gxnge9hLMAzJRxTO0HSGRXkHQ04xPkDzTtzZ8TjPZ7/xIQAvFk8hWP++52MwE7PYNG0rOBizFQm2ZbEtJbYRnrNN/T7wo07RtJdDKTlaIfZs5Ru+HQ3r+Ka/icAN9U7XNcDGuinP6564OeHsfw2lIf2PvqQJRJaOKGBwEgTfoyvxT+vPHgS/D7aHl7hQy3umtKkRs81O4fwfhlmnYkmcMSqYRdnUj1V9lm1UWVFBN/lzoo0JCiwLHkemnrLg2y3aRLbvQoszdsryYHzlPeIAv6Twzuaibc7ITt6rAYbAA18QIgMP8diFy4i7sL6RQ/G380a/rzMHYgSt5QyVbM8WEvnvgC7v1gMJH8CGmRvZvPvZMz2CFJOHCrUMrI28+EOlzNBn9cqgGfbKwgQ08C1/ps0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(2616005)(31686004)(2906002)(6512007)(186003)(6506007)(38100700002)(8676002)(66946007)(478600001)(66476007)(41300700001)(6486002)(36756003)(53546011)(66556008)(26005)(8936002)(5660300002)(4326008)(86362001)(54906003)(6916009)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3BFakJWSmN1emhKbnlkMG14WjhaUFhacEVRRElqV2dVUWFYdnBhbm9jTHl5?=
 =?utf-8?B?bkQ3MTUwRzFJbVplMzR3TDlaNkNlWWpybHBzK3hQLzBvYW5BWHVTMXpzVllB?=
 =?utf-8?B?N003cFFRTndmblNmYUNLU2M5L3lkVDczTnloZnZONlUwYW9leDhrL2l5MUZh?=
 =?utf-8?B?ZkE4K0FVN2I0a251OTlITE8vVzdzU3cwQ1QyUjJDVWM2ZFlVeVNrQzdkOUpj?=
 =?utf-8?B?RnFsRUVRckxoSG56WXB2b0h6cWlQemZNM2I2QjRDNlloVFFoY05SOVdKdUxE?=
 =?utf-8?B?bUtqUlY0cjJTVXg2ZW5VMlVnUXhYMlExd21ld2l2eGJCNUtLczl4RVNOeUt4?=
 =?utf-8?B?MWxNOVVLNExZdUlsK3ZPMmhxL0Z6dlZLMmhsbDBVOE9YRXVMTlRYbDZBT01o?=
 =?utf-8?B?NzRtVzh2SUZRaXkxWHc4eEdRZElpM0psWnJGMjFJcjF4RUNLbFpCV2ZSVWZw?=
 =?utf-8?B?aG80QksyU0lYVmpMUHI2dmg4SHcyK2pjNWNSS1ZDRnpqOXZJYjExUjgycjJZ?=
 =?utf-8?B?eFM4dnc4ak96eW9ROGs5alN1TStPYmJLSU5JdjlQdTd6WUx2V000R1pJak53?=
 =?utf-8?B?Q0JkMDVMOUVGUGRucHo4Y0xadThPQU1qSkxQYitqTnlET0k2TVV4ZkQzc25i?=
 =?utf-8?B?Z1lXam02QlR4NmY5cWRGNDBMZWRqdkV4OW1WT3NiNi9jN3p1eU0rc3pKWGpP?=
 =?utf-8?B?M25xaE15am5rdXptYjZhSWZPdWRsOVBLVzlTMVJvbFp1MWxGV2thTG1HNHZw?=
 =?utf-8?B?U0hYa0hzTUptZE4zaFNqNU0ycWxDeVRqVDhVdlB4VytsRlhqSmYzVDNuSGZm?=
 =?utf-8?B?VnZoM1hJNWIyeitpMW9mbmRFeWFHOUpGTTFFZW51cU1iMGJGSGZyWi9mRk9z?=
 =?utf-8?B?anlOcStLMFFpYXd1QTZFVjRYVWJmL3BONUhDVFI4YmxkWVE2WmJuWlhIWEgw?=
 =?utf-8?B?dWZYT0xWWDVMbCswS3R0ck1LNkRNK3dydGkzMFBqVGhPank4bjBabEl1WE82?=
 =?utf-8?B?Qk8wMGRORjJmY2xkRUtuZ1BlSHlsQlpDc2YwWjBSSlE2L096OWJFWVVCZlY3?=
 =?utf-8?B?Tm5lOUl5Zk51VVk4VVBtL2hLaFlSSTRFQ3dxcW9QSjVsVDUyemxuSklFaTlJ?=
 =?utf-8?B?YmErVThIRTJiN254STBUTytGaW5tYndvVjJMeGVCMlpWNU0wNDJSUjdTdHRR?=
 =?utf-8?B?YVRCT2pKVlJORnEyL1h1Q0dDdnVYRWtFamtCOFd2WXovZkQ2THltVWw2ZVZj?=
 =?utf-8?B?QnN2WWUvQW5LQzRiZHVvUjRySDFUU3BLc1A3b3gyeE90QUh2dW9GL1BpVUp1?=
 =?utf-8?B?RkUwTXQ3UllvZE5rVDBVYTIrNUtIcEcwamJKYThtc3hsb2E3bmRHTjJEay9p?=
 =?utf-8?B?NFBCQWVMK3NUdkVENm5QWjFCdU9ycEREMWUzdk1tb3pCWXJQRXk5WjVmNENu?=
 =?utf-8?B?eThGY2t0bXRrWVJRU2p1MU1nOW9LNkd1SjFPcWtZTzhqSkpCekpnOU1kS0Rp?=
 =?utf-8?B?RW53MkExSlB0Sm9qL0lvcHZ1cmRFeFNPRDl0bzcwVk4xdDZ2UUtoZEJMSDh0?=
 =?utf-8?B?aUxMc0s2b1N0YVdxT2hta3RFVVhnN0N3d2NrOGJNbC9kZFBJeC9wck9NLytn?=
 =?utf-8?B?S25YLzliQ2lqekF2RFhWVlVSVzNHYnhNbC81aTNjLzBFV1V1UzdNYklmbFJT?=
 =?utf-8?B?ZTdFS2RPSkZic3J5MHN6a1VOa29TYzNhSWk4WVNjcFRoK0NNNmRLMXhGZGtw?=
 =?utf-8?B?RGRSYXZtWjdtb0htNEUwWVVwWHJjM2VNSlZEYmpveE9vMmNoa2c2NkZlNUlQ?=
 =?utf-8?B?Ni91VVBGcFpTZ3BhSCtsK1A3Vjk2bWlTMHI5alhlRFp1QlRuNTBrajlaZTBH?=
 =?utf-8?B?UmMwV3FvZXJ0cVJucEYzbWhCT05mMkd2cHRlaEljL2c3T0h0TnVBdlBVaGRi?=
 =?utf-8?B?Q2hkUkNadStWM2JQSXI4NGZsUFZUNXlPL090a0ExcytzcW0vYy9yUnVibmx6?=
 =?utf-8?B?bDFTT2gzSGdTRmNGV29Yc2k2akhaeE9iYlJrWjNnckZRdUdJYmUreGxnR0JD?=
 =?utf-8?B?T3pJMXRhcXdUOWdaTGFlTGNWdTk1dU9RdzFQdzY4NUx6b2hLcmZUWko2bElp?=
 =?utf-8?Q?QgQNRMDYV6f7wQlZ17vhL89h2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e8830b-2df2-47e9-cb78-08dad2a270ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:13:54.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/xM1wZj1/nqPOYYO+q5U6RxFocMw378TBsMDBQPyATENTEXwf7fUIy+rNoO/gkFgD4wg5PYbM2dqu0JAiZKmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8765

On 29.11.2022 17:01, Julien Grall wrote:
> On 29/11/2022 15:39, Jan Beulich wrote:
>> While not as inefficient as it would be on x86 (due to suitable constant
>> loading and register pair storing instructions being available to fill
>> some of the fields), having the compiler construct an array of constants
>> on the stack still looks odd to me.
> 
> The function is only called once at boot. So this seems more a 
> micro-optimization than anything else.

Well, yes - hence the "looks odd" as a justification, not performance or
anything.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> ---
>> Actual space savings could be had if further converting the field types
>> to e.g. unsigned char (all of the values fit in that type).
> 
> This is a micro-optimization. If you want to send it then I will review it.

I probably won't bother; I've pointed this out largely in case actual
space savings would be made a requirement to accept this change.

Jan

