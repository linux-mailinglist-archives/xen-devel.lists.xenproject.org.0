Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F183BE8BB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152254.281295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Z1-0001rf-1H; Wed, 07 Jul 2021 13:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152254.281295; Wed, 07 Jul 2021 13:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Z0-0001p3-U3; Wed, 07 Jul 2021 13:26:06 +0000
Received: by outflank-mailman (input) for mailman id 152254;
 Wed, 07 Jul 2021 13:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m17Yy-0001ox-Kj
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:26:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0f71c90-e46b-4090-bb5f-07e176f52eb5;
 Wed, 07 Jul 2021 13:26:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-MpuVOfrQM9-6QztmboerjQ-2; Wed, 07 Jul 2021 15:26:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 13:25:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 13:25:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 13:25:56 +0000
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
X-Inumbo-ID: a0f71c90-e46b-4090-bb5f-07e176f52eb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625664362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAFFDxJ3LX2tGCe1hgD1zbWpu5jizhMYV8tALOBvuyY=;
	b=N8W3DKWIxvV8+WFB7qQXcB/9jx0OKxXqwdARk2bNPH1C7UKKueWWmx05i38f4hVDxHeY1V
	Yhv26eC9J4m0Y8cD7bq9OtYiwq8ogwoId/Vi8CSJn74eV3XpbXbS9fLGWd8JxCYsz355hc
	WdEW7oMlomQwpfOmKiLFz/4voIeub2w=
X-MC-Unique: MpuVOfrQM9-6QztmboerjQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/6B57mHukHM47llD2razUf+zD8nQfF+spaehtudMuEit6eTM6vD/KrMacT9fhQpbV9CS4frs+iNlgWj/kWxzCHzIyzBkQbueQAsbJL5arQ1bl2QXcQLAi0lpxn3oXu/Xd9ZNYjYzfVw9j5Fwu636Mc8vrHfZQaZz18avxHao3KVINYrFQUFbIRV/J3iGq0wvKX2jcUTTX+lCdWN71qgOI1dwbb4qqCa91ylepRU4NAYkjqQqPXsf1DBOMKm8nAa49J6eyIA+QABocaJevjP+xkhYQ7CjbJlefg3f1MNyENBxg5nO3bPSu9e50/gZ2dKJiT3Sx1YPeP57wV3G9NT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAFFDxJ3LX2tGCe1hgD1zbWpu5jizhMYV8tALOBvuyY=;
 b=SxaCqcqfLYINgftwLKr/mDIo2uBFtQYTiqM/4N+6pg6WzRuBuJBLdfKa3P49jPWC+1JgK5HtsgVZ4ZFJC/DsDXWKj35fD5mkJdzb5PW1i0h8lmeXZQe/l2kg98toqquUPqzJn8fv73W3t9pGvpARNTFKAAj9Mq0x6Bw2eYVq0tgCOyuDb1iE4HK9yEUCze8ewvQ1QAkfax+ePfz663wnGAllAoqbKvLqZMFawn5KU456W5NXGZ1NoXQTnUAXkljZe2Wya/kd3S4OzkjboR1t/Mv+gue5Vh+66EFObhbC5W5izo0+7kAZtZVAm/3li1k/TnVUIIm0nMLC1N8U5Z/dWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Julien Grall <julien@xen.org>
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, sstabellini@kernel.org, jgross@suse.com,
 christian.lindig@citrix.com, dave@recoil.org,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
 <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
 <927c1c59-734a-4013-9286-137fd7026c26@xen.org>
 <e2def3e5-8e00-8b52-2d0f-5231963607ee@suse.com>
 <54b5ff4b-09ae-429b-4468-c1b4691079ed@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <15e22f1d-33b8-84a0-5074-4f3aa62ef548@suse.com>
Date: Wed, 7 Jul 2021 15:25:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <54b5ff4b-09ae-429b-4468-c1b4691079ed@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5997620a-031d-44f1-0c65-08d9414ac0dc
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446FBDA35FBD8CE5DD6DB02B31A9@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NX71J67nz8CnFn+Fw6E9kMPhOB240PGG4ofpF2wtof1K4SK5V2QEFSc9zwse6uup+u4SvbzcnZ1ypop5PPFGuWwinN5+6gkfuItnjxZR/4zw1AE47ZSKsEVOm7zmgyOEwBpJko/1qQPje1l4KX0XGu1UvnJflrIJGRumwTgq96zBquaHZjQWKSH70/AipSGtCbKuc+bMfrjgjALpYuLpluJaEn/S0z7q2F3RNU06yTTubxuU6JrfrFFWLRAmGYhPZ9raaumEdVQstoa52rlr0mM8Lgm/WRB6aFLOS96rzqE5c2An0G8+PKzAoJR6s8dPsew3Jj3Qkejcv/+BLrmsTW10RyTvYECK8EFFrOIno4+3vwG0MiSOOpTcQhW9lcci0ULVWRv6C0bJert4mV4IHGqvxCv99vvbLoDKUpFQagyZTFoOArrM1cWigoFxM4DzE9dOcLrShmlAhisTymbxxMjxCfMfcehifdE79jyLQebNQofk4fcCgagKY5xzgvNUetaAbLp3Tuhny1xn/oRvEli1rtoHrPOa+7hxTBGnInNFRaCww4bDW8dHFEYf1vQ9MYQyVun5G6SuPafAKU3JlG3aUrMRUA4yuPqLJtcPDboau5TUbg7ie5mCLmO1XmUWdc42SZIqoNzCov6te+M+ZQ+1S/2LrwobzsLd2/ib67E/HKPtWjAC8doW2S4Anf47UHcMsiDyGEWvNUw6Re6C3IpKUXgUDWz4/QONA1cTtM+4kcR4jYgWkCPb0xWn9DA1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(136003)(39860400002)(396003)(31686004)(53546011)(83380400001)(7416002)(4326008)(956004)(36756003)(2906002)(86362001)(8676002)(16576012)(38100700002)(66946007)(8936002)(66556008)(5660300002)(6916009)(66476007)(186003)(2616005)(31696002)(26005)(478600001)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1p3VW93Z0xBVnptZElBNTZzUnUzZHlQUlV2NW4yMmtFZEo1N05LZ2phMy9n?=
 =?utf-8?B?UHV3emY0LzBBR3l1K055TmliajIyVnNRM2grSk9nKy8xbnoyRHZhVVJ2eUdB?=
 =?utf-8?B?K2UvV2VLeU5WWlg5a0d5Q0ppNVFCUURRdjAxa1NMNk0yZ1BvOU45eUFCN0ZQ?=
 =?utf-8?B?MEljQjhDbDUzSWV3RnR3SURubEZTZWt0d3JTZ2d6dEgyZWp3aVhqQnd0dVgr?=
 =?utf-8?B?NWltYzNsS1ZsajBHSEIzZE5oMkVobXBObTA5RkxVemh4YzBBUU9JZVhaWXZ2?=
 =?utf-8?B?djQ1THhOelgyQXpZZjdISkpGUkw2ZUJDY2ZFNDI2ZFJUZXBSSkF1RG5YYjRt?=
 =?utf-8?B?OFJObS9uNDRPM0ZoMkJ3U0VDcFFUNXJOUWl2NWdYdnlTdkJ3N0ZZdTdXWjdm?=
 =?utf-8?B?YSsrS2oxanFabjh1OUFIRGRrdE5BVUdkR0dlSUt6NHlMV2xuTjUzVG1pd2tU?=
 =?utf-8?B?QW1vTjNPMGRWQ3pwdlVaTHRkU09Hb1dSajN6ak1BR1V0bENXelN4TmRyWVlF?=
 =?utf-8?B?M2hwT0owME5RN25iUU9tak5Kbm4rQ0hCNTJ6aVludWV2aHBwOHh3N09YN3pq?=
 =?utf-8?B?MW5qR3pqVnpqUTZLejVzYkRIa3VIZ1ZES3pKcXIydDJ6UEh3eGhoUG9YbFo1?=
 =?utf-8?B?bTFaWG9kek5zZDIwOWpEYXlQYjRONWRMcXRJUCtnTGJ5TFZldjJSZkw5S09j?=
 =?utf-8?B?VUI4cVZuSHNaWGxvbEFaQjFUMmRLZG0xekp2QjgxLzFBaVBiSlNlZTJOK3kr?=
 =?utf-8?B?TDJtZGhvQ1Z6RkoxT2hxZUIxN0Nsbmgva2daSXBpdXlmVFk2ZmpHRS9sZ28z?=
 =?utf-8?B?MjFDUU8xb2w4K0J3ZnRMalRzS0hzUVVUdUlBUjMzV2p0MGJpZDJaMEIxamZo?=
 =?utf-8?B?WmNZcXUxQUxZcCtaRXFFdG5kWTRnK2hSSmtFMVJ5WVY1NXF2a2dHRk10ZHF4?=
 =?utf-8?B?RVlNT3hZamNWRzhUZHZkbjhPSzFWMlh1MWV5bHZwUk0xRTBybmhMaDBwSENw?=
 =?utf-8?B?TFVzbVVEZ1QyS0NJZk5yS1IzbC9WUWM1OXlzVDZGMWRwcFdvUFpjdGdSOVNx?=
 =?utf-8?B?cVVWRzZiV2VEeUF1amFCUzNQSkpUbzF3SVBtZENDcHZSbnhlUzh3UTBoVit3?=
 =?utf-8?B?Rk11cDd5WXpsd2R4Tk9qWk45MVNzZmFybTNtM2FWTGljMVEzbHYvMnpIblRK?=
 =?utf-8?B?MmV0NnIxdlRiVHpwckFndlBqS1Q2Y21wVUpWR2VISFUyK09Rb2VuSTA2b3Nj?=
 =?utf-8?B?NnFVbElWR28vNGtqRUhqYkZ3SFdWZitKMUpxZGFrcmJJU29kRUpaZzNJR25n?=
 =?utf-8?B?SDk3WTF6Yyt2VFVZT0d4aEN5RnQrTStZSjdpU0tJNnhpZ3NmMFE5MDdqcXEr?=
 =?utf-8?B?OHY4c3BjS01XdFJjVnJlVTFDaFdsUTgySy9tTnlTQXk1T2c4REd2ZFEzbkhQ?=
 =?utf-8?B?MXB2TjVKcmVGdFZqaDZiVnB3NGZNUGt1c0piZisydXQraFZmZjI5dy96YXNJ?=
 =?utf-8?B?Q25JWEZCQTcxekI1SXl3WlpsNGFFZm9hUUpGckp3RjZ6MUVvNjdXdFQ4WERl?=
 =?utf-8?B?SFo4YmZITGZVcThkUTZqalYrUWFjaDdKUDdYZzUrSE5VVHFRV1VSVDRhWkpP?=
 =?utf-8?B?ZGs4Yy9PTzhuZXlhN2dKZTFVRmx6QlJmc21HV1ErWDVPUnJQZWNTd2JMcGxN?=
 =?utf-8?B?L3B3di9JekpnU3F5cEJ6dEFNbU04eFZlNWhTRnBrKzVPU0pDQVh3ZjdQb2xZ?=
 =?utf-8?Q?9OChAWu4Tkr7yZkWJOBqIWqYp78CgfD7cpTVjLC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5997620a-031d-44f1-0c65-08d9414ac0dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:25:56.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9KnpDfWL0jKRmTOg2DAF16QG7OtEXMErpTvmoLW/GNnWalupf+QVNu604v9JcaQRsmuMJOzNObGm4AbofiKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 07.07.2021 15:21, Julien Grall wrote:
> On 07/07/2021 14:14, Jan Beulich wrote:
>> On 07.07.2021 14:59, Julien Grall wrote:
>>> The alternative suggestion is to keep a unsigned type but check the bit
>>> 31 is not set.
>>
>> Why? Why not bit 30 or bit 27? There's nothing special about
>> bit 31 in an unsigned number.
> 
> Bit 31 is the signed bit for signed number. The check would make sure that:
>   1) The value will fit other hypercall (the PIRQ is described as int in 
> a few of the structure)
>   2) Catch potentially caller that would use the number that could 
> potentially be interpreted as negative by other part of the hypervisor.

And getting refused equally as out of range. Plain int uses will
want replacing imo, but perhaps we don't have room to do so in the
public interface (outside of the tools-only part of it at least).

> That said, I can live with the implicit signed -> unsigned convertion, 
> however the commit message should at least be clarified because it is 
> misleading.

You'll have to work this out with Igor. I can't see anything that's
misleading.

Jan


