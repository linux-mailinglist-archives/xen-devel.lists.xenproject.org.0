Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22355325A5
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 10:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336442.560760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntQHl-00082K-BM; Tue, 24 May 2022 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336442.560760; Tue, 24 May 2022 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntQHl-0007zJ-6b; Tue, 24 May 2022 08:53:01 +0000
Received: by outflank-mailman (input) for mailman id 336442;
 Tue, 24 May 2022 08:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntQHj-0007zD-An
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 08:52:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e896e02f-db3e-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 10:52:58 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-1SOHDyLwM6qYI0eJLKda6Q-1; Tue, 24 May 2022 10:52:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB9001.eurprd04.prod.outlook.com (2603:10a6:20b:408::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 08:52:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 08:52:54 +0000
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
X-Inumbo-ID: e896e02f-db3e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653382377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62UMJp0c4qml2nb0e3hC8MJQlTFQY/FkHKTAo1fpFPk=;
	b=LDEY+KrBzGNCtbBKivIq16duP0c6J/miOeUjXwSsEgY1WxySP7T0IiPQ4vol3+8VRH43CD
	DRRK/+Ebych1iPRz7FuKqC3fuOu62+5Oe7uoPUmYa819JPmhoL2QTcTITrEWp/Kgw75dl5
	BvXf9g1VKUWVovrZd9LR3OeuJ8KPYPM=
X-MC-Unique: 1SOHDyLwM6qYI0eJLKda6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKpWvYrXjUCCWfAxi2zz7kcLj7xJqNuaLB7aKxd4D36rbcVYEHtwIbwVyFKUVvPGNowR84VzlrvTH1u9z1VoH67RfckewYO0eni72J6yem8brTkVOJ9jgQVonw2BPVX4oe9Od5CNb+luYhL3JJpnx9b8Wy9GN67y0Sc9oOuKrGB90Q0zg+ED+kSfC0kCI2pEYcRTrdMD/+DLlVq4VG0oIUnGc0i8mONuZLnLz2t2aHK7A8J9wjyAIrHunnqPijxECsWHtC563/qzju/jP7OAVsVeAttf3foM7PGBzjZ0TuPqeDi8iT7SneBXXU1I+dLbA1CuYKhjkotBqBmp7NK/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYhlPfxJU8JWZKcAUbgUoEi7RGSaKhIV1YsDbm84Vpc=;
 b=ZCwJrr2ML3KVZfoByFJGNcNoNLgqaZwmsnwRT9a1TVqL82zhHz7CgFs9SB7ueS/RZSkncfifLMRJeR0GLDWYxsfKjDjZw6n0dxQZy/JO5rV/e5GL7tzbs9kGJUvxR1hZLpztCjIxUcvD2hrg2PmpdUXEoUZF1LbaQHOIITrfq5XsxYZamGWpS2gosW2mGoLF701DwKYZM7+lwzzwDpfNNeXDgBRrb1zi+fnQoNacue1lrwpUpHwF16J4jFoobIryYbtOkmabMZJy/eVw1vpfFaJ2JGd6uE224Wi4Uz3er4XmXmv5j11Vca6OLEGl3YlHdB2qvwSHLkjT5X3Eh7fzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c502e5f-9458-0194-0254-47ce39142df7@suse.com>
Date: Tue, 24 May 2022 10:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Content-Language: en-US
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
 <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
 <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <7312f3ee-bd0e-9183-922d-c9c82cd003db@suse.com>
 <SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <75055009-5053-0d4f-9174-3dd69add7c8a@suse.com>
 <SJ0PR03MB540542A4BCB2496BD1F49A769DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <SJ0PR03MB540542A4BCB2496BD1F49A769DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f00e96b3-30cc-4b3e-755e-08da3d62ca72
X-MS-TrafficTypeDiagnostic: AM9PR04MB9001:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB9001E1A1DFDC6ED0E2D8C035B3D79@AM9PR04MB9001.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWIS38VucSOiWq70W0D+e3S9m4g7Z9c3TvpUmvFLnTmItQH8IiziH5Tbw7rZblrowl6LhHDh6MmK7vBRU0f2/+WW2KcY1xpkVKV11QeZMcTl+uITnw54dnHsUxYyHJhEmwyyRuRYyibSNfoiwX5rVBm7C6FK6M1nkNLMVzd3znzucagaMRKdUPp+Sr8gpeyVjcjdYu/GgJ2yt5ZhK5rW3wmCiKkqZ0GiiW7x8WTQDiYW7PrYl9HX1i1EBxYkCQgUFx1Ikv3lvuSGZDs8o9TvRzH3rnzQrqdj+nrau6ImelnZUlaoVCzo6RPXA2UQ4+lzb3PIgwFMpShNEg5E/k3D6QpEPGkbgxEtPRQeZ6cIGLxu6m8NryFeyE9h7/dU5Tr6Z9IwhBHU1u2jNVFEgy6uglVZwzJc7xPHK56XcfG55OH46fv6P6nJCbmBRV7tniW+xxq1HE4tLW9vy2MZ4rl48IggqbsJ6h2hDNCQ1rYXFhWFXn1QZfH4IhkZH9n4JkvWpxej+R1/j3sDHnooXqeRDfjJqDcPKzrgwPMXpJYAVveW8x8EquSu9dgPk7fFz0xpIYYCy42y23UW3TtsPMkVB9U7Xg+UfG4CpIrB6QxULemeh+QIyATR5rolFY1aQsb1OA6CtlnN8/rGs4XhPeLWquK9myKeLAUKTC3ul+jrE+tbx8envx6dClBP0VDQHEYn2aGjpDjhg2Fm60dSmHeo7zHvJZDTVMjIdlVyU553OZjl92y3W8xy1BUk/yigC2+D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8676002)(4326008)(31686004)(186003)(83380400001)(86362001)(8936002)(36756003)(2906002)(5660300002)(66946007)(316002)(66556008)(66476007)(6486002)(6512007)(2616005)(54906003)(6506007)(53546011)(26005)(508600001)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g1qyxV48VjMwaIcCirDTkkYdAH0yPvTtTBGkLxmw7McfEXKIYox8nEEhvZ8f?=
 =?us-ascii?Q?q6DlGWS8RTqfR2y6O/xVwf5tCyVvHGrDiihskUVgwVNRTdTSjNIOBLEYYD27?=
 =?us-ascii?Q?0I+EPuzyKrNooTZafqfVbWtcsCQGcY95E5kMgjAkIY2iTIgbRd3ClEvpaw9L?=
 =?us-ascii?Q?v8xmTpz4kXd/HTAYI4uvJwRmuOYyjMXeEQ0iu8uZfHCO/uMYy2jC0mftIRBC?=
 =?us-ascii?Q?ZWl6fbL2eXQw1DrS+ks9250qNAYNduNJh/mZLZ8+dU/TTrorpmabZDQQkLUE?=
 =?us-ascii?Q?ZBh1oI3qvl1DHyZaGXGsao5E9HXle5pTKw2hiYI6CBsT6Kh/py4mFfBw/XMv?=
 =?us-ascii?Q?Ygf2ie5TDLoUYkTh46xj/Pl56XB3FVmpbDPPLqSLxuJVItCSik8IPH/ABIfI?=
 =?us-ascii?Q?SnMXvIegAG1dR5BUL/k4fq6phu80KiVmJye/Ox2PIZmkoWeYiq1a5Z533e6E?=
 =?us-ascii?Q?/fxxk9wCzuwcsn+ch3flss+t847NLBvEDZrn3xEHwwllD0klLfHbYB4crDQF?=
 =?us-ascii?Q?p/jDHrbx6gPylQ+NnK8aucuAL4LxamRJc1j+vHE7Dqi3QLEcUjUfb6wxApJO?=
 =?us-ascii?Q?EwPT9xIJ/f4GJRqFiWakHx0UC/HynDZcyQCwbd5CAN+Z/JlBnNC6XiDi8rRx?=
 =?us-ascii?Q?46EL+zrNq2GjEoBOsbWG55QuqJop+AndR8cPhG7AhgvfWf9kTS0FmNJjGs3G?=
 =?us-ascii?Q?h4pXCq2EMHkqhTU52wSjfZ5Chc5afmKR5y1KfVyQcWpQSEI3Ly34ZMPaR83S?=
 =?us-ascii?Q?PiuzXMsfP0/Hqa4fFQ+2baFbEnP/TZMIci6Zci9YYNAPpFbZefN6eYujPpdJ?=
 =?us-ascii?Q?mWY35l3rryVVjKdkEjzxDaHVphuEw9aMIk73E0xb04h2qFZgaSkujt5amulG?=
 =?us-ascii?Q?NvqsoskLszrvCt3SIHCGYF12gU2r6XpM9Ab25UeX4sEATqDm/IWG1wY1/0rl?=
 =?us-ascii?Q?RXAPkMSZZlbq8Ifyw1I0wAoIWcMSgRi2VEV+p2+KaIxteN9Y1hNc8LttuLbk?=
 =?us-ascii?Q?hL7mD8g7kHqHQfJUkfNQvQsk6tfUPKHhyCS44/RQCVij/wkqDn/C5u5HRw9N?=
 =?us-ascii?Q?iBJ/vp0P6cigNMJe1RhntsTuRDzXf0YdkhEE5rDxCqGyEc3GnOla3OXLM+AZ?=
 =?us-ascii?Q?q8f8hGE0Yur+7ZwTzDPgU4AAkXmE9qrXoBlq7CJJcuxJZfDXvj6s48Dvzhcd?=
 =?us-ascii?Q?uvxmgr1LnUZutvgyp7GIjBqd5Ga1NxcKcZREYKyY5gMMLOwaIqYB3KbrtmDb?=
 =?us-ascii?Q?kR7ymaijpyDhztJI0z+xPWuw/H8it6KFJw70sWjvq6TR+pHGJZDMVhXiuztd?=
 =?us-ascii?Q?zad4lEo8I/nBvSGOcVXxyCqwcitvIIBqSZlEK6T5AVeiNg+cSLW8ktK41VmB?=
 =?us-ascii?Q?s5Qip6tGQngYqO08xfmT7/3fc7vGFW5H5RIoUp45jTbpSqcss2aOGAfjAE8w?=
 =?us-ascii?Q?K3sRX4/umD7vHuwBV+OPDo9bJ31aCzWT2yDQD2sQUlae56iyxP++AS/LxnTh?=
 =?us-ascii?Q?Ret91rROidkO+RI1qj1xL8w0DyJ31o44dva/BuZL3uM4G0aCnGDqWWZH8XTP?=
 =?us-ascii?Q?hl3carhB2Llnq6dMlHsmUnabcfPjvVpsTLWMDIn16zqvW9fK5viHurpZl1YM?=
 =?us-ascii?Q?FllQ+1S77omNBD1p4hkTgk29J6GPCqhTorfo3hFZFm9WuUWvbAj7vro/geFU?=
 =?us-ascii?Q?rQe9uV9uLLA0ss4VyNBuiEhk5yxg3b1YibpT/t3ijsZr/vAaoasrJLg7KAbV?=
 =?us-ascii?Q?zuk8p8H5qw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00e96b3-30cc-4b3e-755e-08da3d62ca72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 08:52:54.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAXlFUDlITcZZLt8RE20SUadYvrLIrZPykj7Wblb/nSprP9DYTrzLexv/bYAiZncxjY1c7laPHri0WbLyWrq8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9001

On 24.05.2022 09:17, Lin Liu =EF=BC=88=E5=88=98=E6=9E=97=EF=BC=89 wrote:
>>>>> On 23.05.2022 11:52, Lin Liu wrote:
>>>>>>> --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>>>>>> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>>>>>> @@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)
>>>>>>>        return cpu_to_le32(*p);
>>>>>>>  }
>>>>>>>
>>>>>>> +static inline u32 le32_to_cpu(u32 val)
>>>>>>> +{
>>>>>>> +   return le32_to_cpup((const u32 *)&val);
>>>>>>> +}
>>>>>>
>>>>>> Why the cast? And why not uint32_t?
>>>>>>
>>>>>> Jan
>>>>>
>>>>> le32_to_cpup has following prototye and definition
>>>>>
>>>>> static inline u32 le32_to_cpup(const u32 *p)
>>>>> {
>>>>>         return cpu_to_le32(*p);
>>>>> }
>>>>>
>>>>> xg_dom_decompress_unsafe_xz.c redefine and use u32, use u32 to keep c=
onsistent
>>>>> typedef uint32_t u32;
>>>>
>>>> This answers neither part of my question. For u32 vs uint32_t, please
>>>> also see ./CODING_STYLE.
>>>
>>> Type cast is unnecessary, will be removed in next version of patch
>>> CODING_STYLE encourage uint32_t instead of u32,
>>> However, Current xg_dom_decompress_unsafe_xz.c already use u32 instead =
of unit32_t, so I
>>> use u32 to keep censistent, otherwise, the code look strange
>>
>> Strange or not, that's the only way to phase out certain things without
>> using gigantic patches / series touching the entire tree at one time.
>> New code should not use these deprecated (for our purposes) types
>> anymore. Note how the file you adjust here already has to introduce
>> these type aliases for things to build. These typedefs really want to
>> go away, and any new use of those types is another hindrance in doing
>=20
> well, you convinced me to use uint32_t instead of u32.
> However, This patch will not update other u32(s) to get focus.

Of course, that's fine.

> I can raise another patch to update parts if necessary.

FTAOD: This would certainly be appreciated, but is by no means a
requirement here.

Jan


