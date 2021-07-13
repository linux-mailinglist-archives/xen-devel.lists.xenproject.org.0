Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED713C6B98
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155067.286393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3D3M-00019j-Vz; Tue, 13 Jul 2021 07:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155067.286393; Tue, 13 Jul 2021 07:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3D3M-00017K-Sf; Tue, 13 Jul 2021 07:42:04 +0000
Received: by outflank-mailman (input) for mailman id 155067;
 Tue, 13 Jul 2021 07:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3D3M-000177-BF
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:42:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cb7118b-a80c-482c-ab4c-ccaea91ef647;
 Tue, 13 Jul 2021 07:42:03 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-yqTWvNOcNuusVhVqttGRyQ-1; Tue, 13 Jul 2021 09:42:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 07:42:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:42:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 13 Jul 2021 07:41:59 +0000
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
X-Inumbo-ID: 3cb7118b-a80c-482c-ab4c-ccaea91ef647
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626162122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AI5fMCkaJ0OCgAepZ4TEXcCAhau8XZFddLb8uRA2ASI=;
	b=hXGkENkdhMbWtO6FIMfzbWatbk3RYeaY6V5aeyiRY3/hl6X5N59zna82wviHrfzqN9V2N5
	ZO7NRLowSKRVFzWdT5K5yo+kYSy2GO3oOjY+oszzZ1L5FR2oLujQfVKhPXnFlzyZrWALAz
	uAm140STo5tASte1836Su6swN3BE/IU=
X-MC-Unique: yqTWvNOcNuusVhVqttGRyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/L2zhSZMia+wfBPD3PrBbgw2VafJNoHWAhOM6XR4XPdKUsZZlmLYGJKSKwPLtO9dTTd6sQbGxkSLYcDy2w/JqnKZDiJvn2AArjl1mQxIy4cKqP2jL9igCZkTiXruDnzZcGVa4HTKydubUneFLx16MQp9sBpxTS7HtiiYONNQUOLiTh3BqOexaJeSlmiEH4eJQyVk+uHbIqfc/aRPv3R0F2/sVncMy4S6hor9qooc4/YyTncaIFW23fgGluP4n0l/39wgzLWZyvIPE/iDEaQBjZQ1+x/2YzazFFMqZNsndjEfwyUmgAVAgp2warL2NDY+rM9VtT7mHRsuaoAUKQIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI5fMCkaJ0OCgAepZ4TEXcCAhau8XZFddLb8uRA2ASI=;
 b=i2M/f6b1tGjNxvJ2dijfRzzZwEIK4oKnVi5l13oIwnxlayHw1PWfEsL4b6tKjCpksBEXPkjMbTcpyWnPmlF61jZjV/SOdaez+3X7xei1uulIRog/ptvDkOwfZTvcZ15/s2gHI02jbJLrMbuLRebnb6mZA1zFYe888GGK290m2o3Zli/hzkSjJ9zk6XeY+we9I+fwLrru0MbJrC3sczVCfOQPHvesHRtPYmP85b6JRk88XvO2/R2qgn59z1zENTxZWvNmVeBsA2TKD/pYJGe2YDMH5Fgo+4t4+uLuCDMEbIPPwqjRt8zRfJZeJy3ac+HN3mFU498l1vx4Jf1e9zC8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 15/31] build: move make option changes check
 earlier
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-16-anthony.perard@citrix.com>
 <cb5a783f-36d2-fc73-f71c-4a12e5cf6515@suse.com> <YOxsAjsZd1lbkVN4@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16f1240e-32aa-f902-4527-fb97b6888831@suse.com>
Date: Tue, 13 Jul 2021 09:42:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOxsAjsZd1lbkVN4@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3210835-2e86-48d9-e1bb-08d945d1b2ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087DEA258DE8D3F3B1E721EB3149@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	akOHScV8J43TwTaUisi+YyTrIncMvCOKsSJSzr0ThChFpb5lGnt5+hDVMgRCxuL2UUqaJ8JcK02QZL4yAaSKhfiB9ltaGcM2fxlrGEXb6XGB9AJwyTXpnHa+PyPU8a1AIXMtC2TtrN2rn5cT/5wUSR2Ai2nfZf4tNX9jDjhNxsnwLtCc6oafwwC3G7hG+6xP/pe15pIx7uMy8geltJ6oEWg3AMFlKc4a0p070Dxed7cNgANAMhP+93PL5LhPcZdpSEiLi06pNLJxB3cTl2lrEChEQJLbgumlG1EDbWMO10HTaNhLZRB0Nir2iGAcIESRRv4VVeB4B9Xp3De3j0NH3d8ZU9nIRAeLjVPIK9fuHmCPvzZN6AqnZMMUZ51RCjbVfe+GHyo8/2HeYILA4yBW+BtmVXij80ptAsxjpfOsKggTx8YCjdpoGkL9mjZlRKGhYzHd9hjOSecIXavuhy8xwLg4SMBAd6r/aKSvbVvhm/5dQXgv8iqImhoK2zyj3DsFcGC8YYMVhp+7RmrZ0iXVIufNEA0nM/gUQ7Kpx2K+xxhFrP7IVKS0NNfgojMcuicVxC5sI/8Yv1+AOiP6JBxfkotpegi6GPJLYNo2srfzfpDLEESts/WJUC/YCl4+T+g78C6Xak4BiYF0IDDoHXtcK4FsMACpFlA2WPoriBWrcp0pxvrF6PJjSPhUD1hIMyDr8wz5gtOBxCc1FBxemK3qKaAEaMjc3yGiyLr5e9EEKJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(39840400004)(396003)(376002)(54906003)(6666004)(5660300002)(6916009)(31686004)(186003)(53546011)(4326008)(478600001)(31696002)(2906002)(8676002)(36756003)(86362001)(956004)(26005)(66476007)(38100700002)(66946007)(2616005)(316002)(66556008)(8936002)(6486002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVMVVJRejFaVDVweUpjcUQvNEFVZEZjbnVCVlU2T3Q3QzFtUmJ2YXNXbWtK?=
 =?utf-8?B?VXBHQ3VIZFd0ZFl1cGVZN0FUc3dlcmtCMU1uTTFmUVB1dHlTbWo1bjR4RGdQ?=
 =?utf-8?B?c2VLZDhOQmNqWjkrdVBKSnBlM1V2TUdwMzI3cVVaVVViUVh3VFU2SzNLR29R?=
 =?utf-8?B?Lzl1anh0eEdFTTVQSHY5US94enFWRmQ5Rk5iNVRKUWY1a21WeVRTZlJQQUIv?=
 =?utf-8?B?dkc1TVNIZDBFb0ZhazlVTFRCQ0xXYTBVQ1NwVjdiTGVCbTVrTndpOHZKYmFS?=
 =?utf-8?B?NFM2NDlvVVlTbzd2UTlBbGRGdlErcjNaOFhMemVSTWtWNjlIamlySzJSc09E?=
 =?utf-8?B?ZHA5OWdoU3NVOGZ1SC9UZFF2NGNqT0lIc2hQS3VuTnRIdjcvR0diRGFtSUpr?=
 =?utf-8?B?UFdFV1RKejJRWDQzT0EwQ0hxdHhxc2NOU3Y3bFFDeWVadEhDNDNuUTRURktP?=
 =?utf-8?B?R2hQOFZlVXpsZjY5dWpMbFBzWUE5ZkhkcktWMlJpVVFRT1hPVWlaTDZqVSt5?=
 =?utf-8?B?WXFQeWtCeFVtWWlMeFpsNGZzSnkySzl4MGFrb3JDNmg4VFR1UGNiOFYxWEVU?=
 =?utf-8?B?MlFsdmtsRXdCeXovZ2VnQlNhUHJSTE12Nk1VV2psbUExb1NHREEyc0cwZ3hB?=
 =?utf-8?B?bmVndWhHQmJyZzBVLytsazVNOXpqMVE3RnFpMzRFaFZKQ3VNMHptQlQ3NnVU?=
 =?utf-8?B?Q243aTFuUHVWWDEraFB0N1JYYmJ4OC9vdXM2elFEcUJFeVp6QnBTTXBNY291?=
 =?utf-8?B?TVgxY2Q2cTh3dC9waXlDaThVVVVNa2JOVGhvamFuWlVWdDNoUmYzdCs2VVY1?=
 =?utf-8?B?Z3R0Nmoxd01ZT1I0SW5PQS9PRlA2dHJoeTNvUWl3SXUvMUJlcDNTR2hoWk9t?=
 =?utf-8?B?UlkweWlOb0Rlc3d6Qnk5ck1DckdWMDFrekJPU3Erbks5NDVpREorbklwckh1?=
 =?utf-8?B?MDltTkxiZ1Q2VU5zb1ZTYmI4ZHY5allCT0lBTjQrd0JyQ3RpS3lNT3FiVG5X?=
 =?utf-8?B?NWpoZGhUTGhIUmp2NURITmVPUExtaWVPSGt1UE55UjZGUWZ1TDBsYTRHdmts?=
 =?utf-8?B?RmtmSDhoRTBQWERWK2U2aGVOVmhhNnQ2ZkJRV1E2MHRSd0YxaFZaNTJkZUZY?=
 =?utf-8?B?TTFKUXluNkxkREpJL2RLNEFwNHM3bDRaMjcxU2hnTzArUHVjOTBQdnFNVzEw?=
 =?utf-8?B?U3R2c0ZzK1QyR2k4TGxXY1ZYeTRXUVBWR3l5a0cxRGZkNDlhU3U4dm43N3V5?=
 =?utf-8?B?c3dEUVh6ZnMyOS9PK2NuVU9oU2hMYnNsSmYxRVp2RHFkU1dYWS9KSG11ZDlY?=
 =?utf-8?B?bVpKUllQR1Z1UHRZNDJCWnVlOGE4dU9UbkJ6VGpwb2NEcFZETEJmSWx4bTUz?=
 =?utf-8?B?dktJSERuc2tjS1ZkSzBmV2VQUisxQ1dKcjlHc29qRFUzNWo5OStrYzFML09G?=
 =?utf-8?B?SGpPb01rQUlZbUZXeVAxUGtLalZBaktyV1Q1N1BXOVozQjUxVnl6NUNZbWFa?=
 =?utf-8?B?alN2eWg0d2VFQmJXMTd1dEd2QlJ5QXBOZC8rUktVek5EblovZERRckRHY0ps?=
 =?utf-8?B?SGtwaW5DTWpVZkVreldmVjZEb3ZYOXpzSEYwSy9Zd2RNWFozQ1FxSDNxTEFF?=
 =?utf-8?B?cmlRYVdRZlk4dHFCanpVVUhUVy9yUGNuaEI0MlpVVEEyUDdBTWRLbFdjREc3?=
 =?utf-8?B?elRpRHYrclBiazN4THJsZnkya1RKQkZSZmNra005VG9ydm92THdDTmREWXl2?=
 =?utf-8?Q?wS4e9RhjCTp8Wiwj8H2jc7anftBXrSW2cHXcwsv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3210835-2e86-48d9-e1bb-08d945d1b2ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:41:59.8595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqFRMH3SU0DE6Xmue+ONP0IGIK/Hk83bvpo5Z4gJUESEUmSN3bfTySAavJEge/2/XTCIgIPdwnmb487IaTdLEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 12.07.2021 18:21, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 05:40:02PM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>> And thus avoiding checking for those variable over and over again.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> in its present shape since all you do is move existing logic. But I
>> wonder if I could talk you into ...
>>
>>> +ifneq ($(origin verbose),undefined)
>>> +$(error "You must use 'make menuconfig' to enable/disable verbose now.")
>>> +endif
>>
>> ... doing away with the misleading mentioning of just "menuconfig" here.
>> There are various other *config targets, many of which are also suitable
>> for the purpose. Personally I've used menuconfig (in Linux) the last
>> time perhaps 15 years ago, and hence I have almost forgotten about its
>> existence. IOW at the very least I'd see us insert "e.g." everywhere.
> 
> Hopefully, no one ever hits those error anymore, it's been 5 years it
> seems since the changes has been made.
> 
> But I can write instead:
>     "You must use e.g. 'make menuconfig' to enable/disable verbose now."
> or maybe:
>     "You must use Kconfig with e.g. 'make menuconfig' to enable/disable verbose now."
>     ?

Either would be fine with me, with a slight preference to the shorter
form.

Jan


