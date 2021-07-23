Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA73D3AD4
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 15:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160101.294391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6upP-0006H0-Sh; Fri, 23 Jul 2021 13:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160101.294391; Fri, 23 Jul 2021 13:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6upP-0006FA-OW; Fri, 23 Jul 2021 13:02:59 +0000
Received: by outflank-mailman (input) for mailman id 160101;
 Fri, 23 Jul 2021 13:02:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WrFY=MP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m6upO-0006F4-Hf
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 13:02:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c3159e4-ebb6-11eb-938d-12813bfff9fa;
 Fri, 23 Jul 2021 13:02:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-pK-NueA5MuqA5fMRG7UQDQ-1; Fri, 23 Jul 2021 15:02:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 13:02:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 13:02:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0124.eurprd05.prod.outlook.com (2603:10a6:207:2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Fri, 23 Jul 2021 13:02:52 +0000
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
X-Inumbo-ID: 4c3159e4-ebb6-11eb-938d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627045375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLDeg85buIAlpXcnKlA0k0lH5eIqObzBLDKPFK6dyYE=;
	b=ag0RRPqmN5m79qxgnlOzDQ+kq8tx29EnNC8+CJ2st4sPbiUv/ZkbJe/3zLZw+wZOvlMoy+
	jl/LqW/1nk2D2bCRgNpPELZqKD/wAxDaDgFjG3d0h7MqnXOk6Yc0SZ7OuuMDwMmeouGSOz
	ZXZV3cR4bqyc3EGtLwm+e8M9zxbODrw=
X-MC-Unique: pK-NueA5MuqA5fMRG7UQDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ0NmJPPc/6QC861I78WvTH/cW716XWAOb8XWLGOXLHc4XLUetZ+QvAn5jnEa64ZhsKe7tqgwqXu2F42Oavfy5mvZiCU9uUvcH7Q4z7NE+jH+IchfYzMjk53Kk5HgcdyAw+3A65agSKkCdUgmtmWIx22/po6OzTpAY/qlIb1+6+u7smHs2X6jV06eCSXGkVJONQ2PljavNdp7t2zjHOGIWITsJdhv8OXxLWkN4m5hBOsqusQcLh4EZDf0EV0SbjLoAOwCO1jR7nj9U/DvXwdd4bR7f4zDZ3ZJ4U82wLXayZWnEdDtFFfp3YOxLaQk1H1WNscjFt6/CQfFd28mOr19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLDeg85buIAlpXcnKlA0k0lH5eIqObzBLDKPFK6dyYE=;
 b=KsxWAJS5fNjAdjDFnOGw+d1O+ai79FOdcxjiAHRO8maZLnk5BIdvKwNRj5Fd7+GSx1ehxZPOkJwtXTh0TaUk4vcd77jF6sc1ZdCKUtYU65lWJtgqmcEnMnvYaPiM1f2ZsFdll9TqCrqHZ7HtP7rc9HP5eH5HAYLDYvcOcPWS1hSVn+Qb/JLvCsIEzo2EoJ1fSha0UamoTKkPojbTAeH6tlAOY6DbpPl8VTv3dPjjzvjjx6GIlUNY/ekj2psQaEpelrqtE3hnCQ/TiKk4nxX4dpWguwFUDPn+Xnfz98goqg6ljk+YoVo1qJs4+po1WWRAYDIDhAqxl3AS5dzZaainAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Julien Grall <julien@xen.org>
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
 <97f0713b-f6bb-72cd-f364-f0d42c868171@suse.com>
 <1df74545-d2fa-2d80-5246-a0b0158550b4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e262a28a-ced3-3097-4748-fe2b9efe08f5@suse.com>
Date: Fri, 23 Jul 2021 15:02:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <1df74545-d2fa-2d80-5246-a0b0158550b4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0124.eurprd05.prod.outlook.com
 (2603:10a6:207:2::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc4d375b-b052-4fd7-2b8b-08d94dda2e83
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31206EBE22CB183972385B69B3E59@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tj7HNv0aFtj7p4+p1wbultsQyqKWxIen9FSyTkKlVWc4XYRNfm6XSXkO73ZhssleKqtoAIa4ePB1DoKA9yIQL2mTCbYn+o4hrNpHtIkQrL000P7lZPk7sM07rCCDhAnKVs+v81xjFutVvsltxuXtIO7Hc8w6Hnq2hM5UnoYDEgMTBfjGjb1Ar/0hFJ9+UgAvA5U5HUOdEtwd6x4DALMm7BHOw+oX8WOmb7/x/X5C4+KLDUgE/tw9s+v0IyIvbkxzk/5+azFkYiwIHhfJzkQRedbnV9o53ejf51CoM22j4C75H3KRUX8U3vK5lSsbDpc+Lv9uQ9nx8sKVAB+38IqpAPE+kUE+FuOAlJymodeMj/J1V6bBbH2IZhOwxzaeFUim1mrez6y+kbKErrkwyLuDnIqQk64Oe9PhBXrZbsOgpZHLJb6TgN7OZcjSAkaxOhriw6i+qpx/1gOwPiWLBLR4C3rjSkJ6w2hi4dZxDX4ZPLLR+1JRmEl9X1SpbukQ4OcrwwBBRFVoY3Au5DKPJIwNjNptxxW4r4POUWAB296IXE5g9xXqysqz0/+oGqpG7yhrWeSqV5r1WhGf3iWJRYkQnvejWMerT86JGqEg/mddRrT0lDTRsZoHVzjAlQiKhwHuQyNyieur6qFcDUGTS9H8d72ju+5OUjj1MorSg8IlodYyiPQRmVgcZs8TGoDOE0KiQgjG4SGv6RFAZ46/FjmLBpn6mogz9qJzCiUaJ9eN7a/sIjjq3iAF41I4bDasxaD6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(366004)(136003)(346002)(376002)(8676002)(956004)(86362001)(478600001)(66476007)(31696002)(2616005)(6666004)(5660300002)(8936002)(38100700002)(2906002)(316002)(16576012)(54906003)(4326008)(31686004)(26005)(36756003)(6486002)(186003)(66556008)(66946007)(6916009)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djhyNGRHRUZ3OWRQZFVxdS9RMzVINC9UY2pyMW51WnBhNzFPOFhjK0J1dzln?=
 =?utf-8?B?M2FxMnNvTyswYlVZbTI5bnFxYTJ2Q2tHSnc0TkxmazdmQmpGMlp0YUZFL3NU?=
 =?utf-8?B?dzdpQWRsemczNFErV1BNNTR4c0lDcUtzV2VWY3RoeGpHYUNXQ20rZjhQQU13?=
 =?utf-8?B?NTRzTFhZSUM1Qjc1R1FRd2dIVGt2UGxYTmZmWmdkOTZpK2ZhZWVxbmhEcE1W?=
 =?utf-8?B?R1dlcDhheGRhNTNRZWZuZWN3d0V2VDBQSyt2dnhDazgrYmIyWGx5WllFU29x?=
 =?utf-8?B?OWxPYWlWS3RkREpwaXR1K2ErMEtoVkE0WFlBUEdLTmptWTNUSlpXb0xXbEZq?=
 =?utf-8?B?eExMVjJZSWxhV0k2N2RZUjk0WHovSndDMHYyRFJJbnQwMWZNSnQweGpsNnJP?=
 =?utf-8?B?alg2ampxVEVPWWtmR29FbU9mZXVpSGhMTi9YU2Rnc3JLMmdqL0Z1cWRtdkJB?=
 =?utf-8?B?Vm1DTngxc2hmV1lPcWkvSUsvU1ZQSjc3NkxHVkU3eE9RL1BObnV0NHp3U2dQ?=
 =?utf-8?B?OW5ralRjaXI5dTlMaEp2K1NCbzFPbExPc01obzBRU0N3cWVZZWZ3SjlaY1JQ?=
 =?utf-8?B?KzZsaEE3cndpZnJBNkdTMDRGSlYzbVZqVHZuWWxaamNqZ3Y1V1pWR3IvUTg0?=
 =?utf-8?B?cmlSMFE1cFl0L0M3WFdCeEsra2w1RGtMNmtrU3BETllPQWRGUFdBK3Ira0V4?=
 =?utf-8?B?V09SaHpOWGpmcU1QckNGNDZYcitQb2R2bVJNcG8zYTN6VHViSXNCSnYyQ0t0?=
 =?utf-8?B?WHU3SFhGMVRkYWxRc3FpRXRRTE5RMWZ4ZjRXMkhpcTlMT0Y1WEVNL1FON3hH?=
 =?utf-8?B?WFd3Q0FUNWRVQk5FZThNTW9FRDhTa0lnelIwNzhWWDJOeG5MaGtlZUJMVXRM?=
 =?utf-8?B?U2c5dEE2QklkMHZwbGF0NExFRDEyVm53UDZpR25CcmdNaVhYQTBDRVl2Tytn?=
 =?utf-8?B?QUNiR0VlQzJueHE0WWZlM2NDdGZFUHlFTDN0Wm9JTjdibS9GcUR5UTlCamIw?=
 =?utf-8?B?R0c5TTN6eXQvOWpZb2NHbzBBajJFU000K2tKNHJSUUJzazhPTTRWVHc5dDJQ?=
 =?utf-8?B?aTlzbkZOeGhzVmNHQjUvZjRxbEdadkVBc3ZNcTBBaWlWOVZXQTQxQ3IxTnhB?=
 =?utf-8?B?OWhZYVJiT1RWcTk1R3krRldhdTd5NHd4UEF0eXpGdTNjTDRKL25SOTc0dXFq?=
 =?utf-8?B?aENDZVNXZ2FVcythNllQWjVBcTV1aE90Z3duU3lWQlNYWEdmc3lrdUg1WWpV?=
 =?utf-8?B?Q25xLzAvWFhVR3dSaGpIdE4zRzdOL2hJZHpOak9XTkZYYlBDOXRkSGoxVkJq?=
 =?utf-8?B?NDNTdzQ5cDVNSnd5L1VZZDFBREl2Y0ZqOTV1TmhNMlp0MUE2WTVvZU44M1I4?=
 =?utf-8?B?K1p3bm0wa3p5L0NDVFk4RTJjRkpOVzdtdTYrbzUreXBOQURsSHJSdURiOFQ2?=
 =?utf-8?B?RXBzOVdVdVljdDNmYmhicGVYR2g2a3lqZitRS2xXUHBBRnlZZnhqZTM3Vk5z?=
 =?utf-8?B?WXhxZllxNFdoK1ZGOW5qM3VYVVYvWm5HaTBvTFg3eFV3WXBtcjFtMmVxZm54?=
 =?utf-8?B?SUt3R3NUYnBxZmNqaTZqWU5NQXFGUlFCQVlDUlBqL0VaWk9KSzlkTGpFa2RY?=
 =?utf-8?B?WGk4b3YwTjBuOTkwem0yQUJoM0RMNGlpZHp2VDZUR0MyVUVVSm9KbzBlT0tn?=
 =?utf-8?B?RHlKNTV1TGg5VE1ZYnJKSU9icTcvTHdrUnlIZUVaeTF6VkpPQ3pIdkc2ZTFh?=
 =?utf-8?Q?45gJkJBZ+7aZfAGzce1ljdu2hnOc6FUtrodjc7C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4d375b-b052-4fd7-2b8b-08d94dda2e83
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 13:02:52.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOjLFPfvlpEta53Atl10RqI3RRYOC/VitOB8hwuXnQPq5ZCRe6FvLfOPiKBoLiPJBLBIVxUq+7xuJQ+8iGb1/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 23.07.2021 11:28, Julien Grall wrote:
> Hi Jan,
> 
> On 23/07/2021 07:31, Jan Beulich wrote:
>> On 23.07.2021 01:36, Stefano Stabellini wrote:
>>> --- a/xen/drivers/passthrough/device_tree.c
>>> +++ b/xen/drivers/passthrough/device_tree.c
>>> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>>       if ( !ops )
>>>           return -EINVAL;
>>>   
>>> +    /*
>>> +     * Some Device Trees may expose both legacy SMMU and generic
>>> +     * IOMMU bindings together. If both are present, the device
>>> +     * can be already added.
>>> +     */
>>>       if ( dev_iommu_fwspec_get(dev) )
>>> -        return -EEXIST;
>>> +        return 0;
>>
>> Since the xen: prefix in the subject made me go look (I wouldn't have
>> if it had been e.g. dt: ), I may as well ask: Since previously there
>> was concern about bogus duplicate entries, does this concern go away
>> no altogether?
> 
> The check wasn't originally added because of legacy vs generic binding.
> 
> It was added because in some circumstances iommu_add_dt_device() could 
> genuinely be called twice (for instance if the device is re-assigned). 
> This was returning -EEXIST rather than 0 so the caller can decide 
> whether it is normal that the device is already added.

Okay. If that distinction is of no interest anymore, then I can see
this wanting dropping.

> Calling iommu_add_dt_device() twice doesn't hurt but after patch #1 
> (this patch should really be first), dev_iommu_fwspec_get() will return 
> a non-NULL pointer as the legacy devices are added when the IOMMU is probed.
> 
>> It's one thing for there to be a legacy and a generic
>> binding, but another if you found two legacy or two generic ones, I
>> would think.
> 
> I am not quite too sure what you mean by "two legacy" and "two generic". 
> Can you clarify it?

Well, I'm having trouble describing it in different terms. I mean
two entries of the same kind (both legacy or both generic) referring
to the same device, thus leading to the function recognizing the 2nd
time round that the device is already there.

Jan


