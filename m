Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89883C71EB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155397.286858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JB5-0000v0-7M; Tue, 13 Jul 2021 14:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155397.286858; Tue, 13 Jul 2021 14:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JB5-0000sx-4B; Tue, 13 Jul 2021 14:14:27 +0000
Received: by outflank-mailman (input) for mailman id 155397;
 Tue, 13 Jul 2021 14:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3JB3-0000sr-Td
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:14:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12dd8191-7856-4bd8-8db4-8b758b3bb4ca;
 Tue, 13 Jul 2021 14:14:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-YIh8kkozOMOAnGx5D7VL-A-1;
 Tue, 13 Jul 2021 16:14:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 14:14:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 14:14:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23 via Frontend Transport; Tue, 13 Jul 2021 14:14:19 +0000
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
X-Inumbo-ID: 12dd8191-7856-4bd8-8db4-8b758b3bb4ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626185663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nX7GxssaRMK8RA6AYai5CpKD2yKt5kGdgqrHlx1ZQgw=;
	b=kZiydDO1vP6peXQ7cI3UYhalrZ04kON1Eq49rjxm5OUAQ3gWQnEs5FiQn2gggspkiHzghZ
	RRtvafkXn7+RNuKkYxqQtiZ/7P/x91gh0XGyp/IF/mYN/GtUjvu0IgMHeTSnQQs5uZwgRm
	v0cZElAOwmeeK8CUhCGMUk1OBlioLnY=
X-MC-Unique: YIh8kkozOMOAnGx5D7VL-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZatsdZ1ltjf2JJdc/nZMOr/LLwi1ueW71QJF60tjWks8/1ecnKO698R3FP6O47XRPmhB5Qu133dBuQxdeiLsyLjHb8A0KGeOlRucMxj16Zaeh+DV+vrKrMpZLUUdyjOGSSWpDFQVXXPOT64vZ2UbQldvfh9f4tEdNR0wazO3P3iCkkwNXAOndc5s1WqtylzfXijtRrbwOaYjtEP2/UwhgFac/hp4+0vT+jzcLNzprkAXZ/w47w+6P4yqpZKk9ZIYxL+wtYD6zrTFPxO5OHFEphFWAzIbBLJ9RBIMmkvgjFlvhk4wPNHc9tlUy0De9+EKNvTuH3Lm4c1PS4yYI9bO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fny9C6Ied+8Sr90b5zajdsmH/hQyiGydJvaeJVjhdBk=;
 b=Gy8058mciUwqSUnx5CQ9IAezJFs4ku1mSDkNmsGQvVKqV15lZl1VyRBKe79TWSPwVZWUoh87f7yQaON6IIyS7kKnmoIVSG8eHMTuUu3aQbRRyuEc3SmOapW61H2wd/qNqv2M+eW3PhYM/BG67TP+OZV7pmiGRx/+byHaF66Z7VeY5gk8q2dURSZUBHCtPQedvFR+0Rmay0N0/dObpskmApoXKSbeduYW3wsnRZD9DcLkeUEcW7R69gS51cwtBqMg5wu9lxlfudoINfxqJd981sGMabPT2+JUJzj96p/BZ6IrPj34R+0iGn1Oy0hmwmA2aq2wvaPRc9gt3/2yKzp0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Juergen Gross <jgross@suse.com>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Julien Grall <julien@xen.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
Date: Tue, 13 Jul 2021 16:14:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0059.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c433621-8332-4bde-6fb0-08d9460881b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087BFD3C4B5DD1126450AC9B3149@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	56gRqyT4j4bHnpf94GPTZG1dTeYVdkzczL4iQzXEqATHTLyXLn7nTYQ9Rj8+uOJbbl3B2BsDuLmH76dhicliR7Vy7bsfBkOkNzdJautAcMD3YnDwa54+1qjCEo2RU0dMPQ4ggBC6PITizjZ7eU+t7ROjBtMQ0cI6HB31z4PouIA02syFSEa4rXdpvC6dHdWXpHvPr5Ap49dBV1XCBl35kd6CRPj4nTKyHkuXoagAbBrv2qVkEOl424trR39NXizE0gugZ1gQx7UNAsQnd4bFFEm8yqF7XOvoVXLBXtTC01VxR1r1sw+D73s1hUXWtSHTFDxPIA5W/nlHHf9HPeK1khZX3HTLMYnUjYJ/ZnNOw2gYetGbmYuPJZAL5yK/Rp/ZAdrl25pTdp/SFMBljeubj9bKcnkj+kRYqplCvkawiER1H3QRH6oCHD2iiOs0/T5UfkKh0A+Byg8fI35339gXbW07EleO/0O7BKl+p9fYUAOZVJAOB0o4Zh1dClivEv1SivYKmJqb1cUf9ivPxWmQBCE97QTssbcVdEZxCKjv21fvs/isqWJWDQEJi+I6mm0j1OhWqGlX++9e0KOvNpikuEJ/0ltNirWoP2gyWfLqGPbOeFlhT4qrAyjwIPWXuXrDVfg2971mXFCUKSUE8oHH3HJi7h9FpxIz7qCixKkGv6gA0y4z8GNb5CIQvrTQz2AghDpK8GFcre8jQgqAMTT7HDY0/+jBtuDSrjZgN0jPZiB6rw1Nn6+VfyFOFpiNDkgx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(376002)(136003)(396003)(54906003)(83380400001)(6862004)(5660300002)(8936002)(31686004)(53546011)(186003)(478600001)(31696002)(2906002)(4326008)(8676002)(36756003)(86362001)(66946007)(956004)(26005)(38100700002)(6486002)(66556008)(37006003)(66476007)(6636002)(316002)(2616005)(16576012)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w9m/NEqZ4lIINyDsb2yBZsDinDIccNMfasgi46fW87pj7RVC/vQLD5krI8BG?=
 =?us-ascii?Q?95NVKZ0VTGH60Bxa4371qLDiNbPPJZlcnbA8p1zfiJFDQ1BBWVa2rTIkBD16?=
 =?us-ascii?Q?+uIuRN+eu+v1F3jyC8KlP4ne8iF5lLEu5D+KMw8LgWm1jE4wOoolRIxCuK08?=
 =?us-ascii?Q?eXfujKkqc9mUbsO2nCh2pP0vlWrV4V5aMUhkjebpbXVsY0yzEYClvDqy38xK?=
 =?us-ascii?Q?QEZk7hKZJk1BRLVb2829LHIrg4NFG5nXxNWhpYfkBospU8xE/Py+Z7+V83ls?=
 =?us-ascii?Q?86qWoM3+C5zN8Yy+sHqVo8qTAbFNKCj21Az5P0z3un5PBcTVh0B2QbzSHtud?=
 =?us-ascii?Q?ZguIee/UwaYWkhvo2tlp3jCpx1jwSUIH/KsWHtSdcbYSwAPGtHsmER4lH64C?=
 =?us-ascii?Q?08tsl54UyFPqaN+abXeizZ6PO5Fd4qfUnSB3QtoQOvtCz0PeLgFwnJKnMRWa?=
 =?us-ascii?Q?ATyHwlhWnQ1mjDu85wWRUXfDq/7K5W0/xX81DAi962cGqVmVdUkFYyhOnlDw?=
 =?us-ascii?Q?664Sa/Yd36b/F1w40UtTUovvm7ks6ljhPxO/JduigfSQSaF0TXg7pYt3tJI4?=
 =?us-ascii?Q?Ws38xBEP+Qscjkw2n5OPuqMh5Q/3+uZ1OORCOEEJfEKGcdTDJJQsspIBrYOq?=
 =?us-ascii?Q?UydzO+3z43ioESUVL2vn6gYYqxGUgxm1GWiXvdTIYxGMqcJldympUIvT37/6?=
 =?us-ascii?Q?SEpBytY5h6ljtWXJDbipcOSEmt3b43UILkudBguSM5dxOvxeNXkKPMTdA8WN?=
 =?us-ascii?Q?K0r2UoHAJY3Lcv/wDEbbzw2ygfkz49r/bCsyhK1h0WPDPkUuHl+oIYMg03dm?=
 =?us-ascii?Q?xUzAT7Ggs2MpMDRjVsYOlPQb+Wz9cehlybFaxKV4WzJKbLP0jJMfNc9wIr3C?=
 =?us-ascii?Q?J5bOUUxHuapiV/+RCY+Pyj9ha9eJOCaWY44wsdZZwqr4YsdiQrhgEIaAHakG?=
 =?us-ascii?Q?kSU0vtZPobHHPxjCrOQgq62CTIyEE3vnuBHlJEFnDhYQUdy80xNHOSLpabZQ?=
 =?us-ascii?Q?JjKg5W4hLJXhD/YbrsihnadLF7PYzuVGqbpgaqxXZDutCsPiNwtiEyxYTBO0?=
 =?us-ascii?Q?unfmm+TE2jiOnAEMoG/BlteQiJ6oZfhmOtYRHWj/1WjovLnb4+9sz/j4hXfZ?=
 =?us-ascii?Q?1jnqpbcU+TS1dqNVRu8mCEBz89rMyVdrSH0CmSuN+zECuuQt9e7veLwYfu1F?=
 =?us-ascii?Q?Mbh64fBNBeFfH3V4qdhWCrjCUns1w+rU2yZh3JL5JgeBSe2X+iXwWPeKxlJ6?=
 =?us-ascii?Q?sEqJsTA0EkEPXFRaBo3hkWWKt2btYON3ftKFLbOa2joW8SFAfMUfTNPDM+vI?=
 =?us-ascii?Q?/bEIs0zwPAJh5CI2a2BBtZN6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c433621-8332-4bde-6fb0-08d9460881b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:14:20.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXwAks8TrWnyiZ0iSko4MiKoqdqZ+6QCQ7gCN59NxMx1hGhYgMCEzuRmUWg4a6dCiHMumZBLmstg9SOQ68o8Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 13.07.2021 16:00, Juergen Gross wrote:
> On 13.07.21 15:46, Costin Lupu wrote:
>> Hi guys,
>>
>> On 7/13/21 4:00 PM, Julien Grall wrote:
>>>
>>>
>>> On 13/07/2021 13:39, Andrew Cooper wrote:
>>>> On 13/07/2021 12:53, Julien Grall wrote:
>>>>> Hi Andrew,
>>>>>
>>>>> On 13/07/2021 12:23, Andrew Cooper wrote:
>>>>>> On 13/07/2021 12:21, Julien Grall wrote:
>>>>>>> Hi Andrew,
>>>>>>>
>>>>>>> On 13/07/2021 10:35, Andrew Cooper wrote:
>>>>>>>> On 13/07/2021 10:27, Juergen Gross wrote:
>>>>>>>>> On 13.07.21 11:20, Julien Grall wrote:
>>>>>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>>>>>
>>>>>>>>>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.=
h
>>>>>>>>>> and
>>>>>>>>>> wreck the build in an interesting way:
>>>>>>>>>>
>>>>>>>>>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from xen/tools/in=
clude/xenctrl.h:36,
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from private.h:4,
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from minios.c:29:
>>>>>>>>>> xen/include/public/memory.h:407:5: error: expected
>>>>>>>>>> specifier-qualifier-list before =E2=80=98XEN_GUEST_HANDLE_64=E2=
=80=99
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HAND=
LE_64(const_uint8) buffer;
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~=
~~~~~
>>>>>>>>>>
>>>>>>>>>> This is happening because xenctrl.h defines __XEN_TOOLS__ and
>>>>>>>>>> therefore
>>>>>>>>>> the public headers will start to expose the non-stable ABI.
>>>>>>>>>> However,
>>>>>>>>>> xen.h has already been included by a mini-OS header before hand.=
 So
>>>>>>>>>> there is a mismatch in the way the headers are included.
>>>>>>>>>>
>>>>>>>>>> For now solve it in a very simple (and gross) way by including
>>>>>>>>>> xenctrl.h before the mini-os headers.
>>>>>>>>>>
>>>>>>>>>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>>>>>>>>>> redefinition error")
>>>>>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>>
>>>>>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>>>
>>>>>>>>>> I couldn't find a better way with would not result to revert the
>>>>>>>>>> patch
>>>>>>>>>> (and break build on some system) or involve a longer rework of t=
he
>>>>>>>>>> headers.
>>>>>>>>>
>>>>>>>>> Just adding a "#define __XEN_TOOLS__" before the #include stateme=
nts
>>>>>>>>> doesn't work?
>>>>>>>>
>>>>>>>> Not really, no.
>>>>>>>>
>>>>>>>> libxenforeignmem has nothing at all to do with any Xen unstable
>>>>>>>> interfaces.=C2=A0 Including xenctrl.h in the first place was wrong=
,
>>>>>>>> because
>>>>>>>> it is an unstable library.=C2=A0 By extension, the use of XC_PAGE_=
SIZE is
>>>>>>>> also wrong.
>>>>>>>
>>>>>>> Well... Previously we were using PAGE_SIZE which is just plain wron=
g
>>>>>>> on Arm.
>>>>>>>
>>>>>>> At the moment, we don't have a way to query the page granularity of
>>>>>>> the hypervisor. But we know it can't change because of the way the
>>>>>>> current ABI was designed. Hence why using XC_PAGE_SIZE is the best =
of
>>>>>>> option we had until we go to ABIv2.
>>>>>>
>>>>>> Still doesn't mean that XC_PAGE_SIZE was ok to use.
>>>>>
>>>>> Note that I wrote "best of the option". The series has been sitting
>>>>> for ages with no-one answering... You could have provided your option
>>>>> back then if you thought it wasn't a good use...
>>>>
>>>> On a series I wasn't even CC'd on?
>>>
>>> You had the link on IRC because we discussed it.
>>>
>>>>
>>>> And noone had even bothered to compile test?
>>>
>>> Well, that was a mistake. At the same time, if it compiled the "issue"
>>> you describe would have gone unnoticed. ;)
>>>
>>>>>
>>>>>>
>>>>>> Sounds like the constant needs moving into the Xen public headers, a=
nd
>>>>>> the inclusions of xenctrl.h into stable libraries needs reverting.
>>>>>
>>>>> This could work. Are you planning to work on it?
>>>>
>>>> No.=C2=A0 I don't have enough time to do my own work thanks to all the=
 CI
>>>> breakage and regressions being committed.
>>>> This needs fixing, or the original series reverting for 4.16 because t=
he
>>>> current form (with or without this emergency build fix) isn't acceptab=
le
>>>> to release with.
>>> I disagree with this caracterization. Yes, this is including a
>>> non-stable header but it doesn't link with non-stable library.
>>>
>>> In fact, reverting the series will bring back two issues:
>>>  =C2=A0 1) Xen tools will not build on all the distros
>>>  =C2=A0 2) Using PAGE_{SIZE, SHIFT} break arm tools because the userspa=
ce is
>>> not meant to rely on a given kernel page granularity.
>>>
>>> So this doesn't look like a priority for 4.16. Although, it would be a
>>> nice clean-up to have so the libraries are more compliant.
>>
>> First of all, sorry for breaking the build.
>>
>> As Jan already suggested on a different thread, we can fix this by
>> isolating the XC_PAGE_* definitions of the toolstack in a header of
>> their own. I'm open to suggestions regarding the name of the header (my
>> suggestion would be xenctrl_page.h) and path (I guess it should be in
>> tools/include, right?). Also, should we change the names of the macros
>> from XC_PAGE_* to something else in order to reflect that they are
>> toolstack related instead of xenctrl specific?
>=20
> I would rather have that definition in xen/include/public/arch-*.h as
> this is a hypervisor attribute.
>=20
> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.

Even that doesn't seem right to me, at least in principle. There shouldn't
be a build time setting when it may vary at runtime. IOW on Arm I think a
runtime query to the hypervisor would be needed instead. And thinking
even more generally, perhaps there could also be mixed (base) page sizes
in use at run time, so it may need to be a bit mask which gets returned.

Jan


