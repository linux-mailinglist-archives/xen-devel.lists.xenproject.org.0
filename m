Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270158D50C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 09:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382801.617839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLK8r-0001qO-CI; Tue, 09 Aug 2022 07:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382801.617839; Tue, 09 Aug 2022 07:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLK8r-0001oR-7w; Tue, 09 Aug 2022 07:59:09 +0000
Received: by outflank-mailman (input) for mailman id 382801;
 Tue, 09 Aug 2022 07:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLK8p-0001oL-Ov
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 07:59:07 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23f5cc67-17b9-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 09:59:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8665.eurprd04.prod.outlook.com (2603:10a6:20b:43c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 07:59:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 07:59:03 +0000
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
X-Inumbo-ID: 23f5cc67-17b9-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXk8lSG5XJgDwYKkzOgVs+XNC8Qrw1SQ8RehveMZWAPQcjGSe13SJiklneA8hetbR5v1Yr4wZKoexmXGkHiebhW0hXLuWp7+xpNwdyfH2yhNPRRf+Q6el9fq+ChPnwd0Yd/Vv4BhwYYfUwzgED6oriUCaGh24tosJ2WyrVTCoIK/+1fXgJy4HrBvt4zurbANj44RWBlVwuYnclFJbBjOAhUzsXpOlMSxFwGSQzAIVrTD9WBGEK9MCDY2Pu8gd5NpGo4SK0WWmOQTKvIE0AE7N9UsNQiK3hqJTXjrYTqar80iypnlce8WrOzTrRsWmNyo+xb8SsHvVx175N6lgELvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7IiJ0bbjzrhdCSZ6D0gXF1meTgCbnqHa0H9BLQw6KU=;
 b=Qf2xYocpjtyzWmUhyn75AVr17Tjk7BkV31lYTVJD8GaFH8p5f3qVgwDKhvZj/8/MA9dkvZ/nMCKAhInLfM+iZI6wZJrGrwP+05sAvTkg5Jv4u9ZvqsIiCdFFepaeU0rt0lTyWC7cXm4YA48Q3926EGKyE4wTJhjkkl/cZRvYNMJ9e9mco6r+RTd3huvF85ncEbRTASblKF7P7ntrZL75kadVEsKUYyueO0+nfaw3k4JDIWeqzs+KkdAPEqWA99e76w7lFWPYEqVNI8twk5qDw2GQ2TMrJmN8Gtql9Udqzm6bxZp+eMQuspnqEpDy2XrbxpqITymIU8sWN4qLUXPB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7IiJ0bbjzrhdCSZ6D0gXF1meTgCbnqHa0H9BLQw6KU=;
 b=dNMUwkrRY0GX2uKoEGP/uPL+GTpnYhZVxQ9Q64YbaU20JiDWEcFVkrRcEB0X9SlA6NfK3W0gU6Qhm22EjqbhUT0RxO9BRp4YzeaEQ61+XF3BDH6Qe1T1QLvivyOLkJWd5h43HLhtrV7GLE3mt8Fua4FMYnkiGVdZZB5qzmj6NygDSjQIfod9o2B70QoNiIE+46ubxz8l3dEjQtw5+KkeXpnOsLjYgOYit0KwfHe9GCFmAZqBkbvO0rL2onv0FoITJWpPquBs6uwdalOVI99jlc2l65wn6yOLZaNu5hm+xlf2FiXCCGEmcx0asv+r0m6PTKZETaC+QC5FukbHe//VpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
Date: Tue, 9 Aug 2022 09:59:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1790ea-88f8-45bc-b2cd-08da79dd06f5
X-MS-TrafficTypeDiagnostic: AM9PR04MB8665:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4imHhQYmazpAxnxw1kQIpNCy6tINEEAkrWB+Bj72YRwbMaV4JzmRvWK7/Iuz8lsKKXSOJQb+as2VVyEHyXydc+/seHLOmWAyHRnjEkGLA20aAhcZ1PWdmQdB+0RamTX4L1gFstsk1JQKHzILeSy3XKk+MZCRZHJSva1gffp5EBN4zFgbaZRNuZW2rWLJUp4WweabM5h10u6zpc9Lte2uDGAeo1YncqTwJ1HOMC5+XGA37rsSSjxe9rIHKZ3x8guoWKR5Ew8+vLyVrNVB4TQ1C2/EsKXu6urEBD4RsrM66qKhpuwspjAujCvZXdruL+I+R1IvNociSzIG7m9UBob0k4gFhB/92zOheVP0AYh3tSmpOJ51F6unn7ZrnFIFrdz51YxxTerpls5TWEcdFPD/hjYWStqfv9cD+jWojSlrepsyEGMQ98cE1d5DoBxZHc1CaVUB3aFvFe7baReP3dJersAVLI7jLcW75y/NoMjMgQBQSTbtLaCgjl6V+fOE8PiGEF232/+38Loo+3fdzZcsl6v8XFZsltcVNHIEKn7f+F+CpcIHdl+LpTmAB6FFs0sm6XENaOZh9lva5TtvpAspL6ax+H6siO+ZdOASpGd4sV5vxy/r1niPQ6ndQuw5h8wV5L2gr1mIFVfq9CSV62tpxjQexdBl33hUxkEGGSvbmWuLGy/F7hNOrO0+6chT5oA+b4fnRUhrqo+Rpz0RRknCtICQ4T6eY93Gb4c8V2xMTS68d/d5jTaz57ykC+a3pt4qJF1RQhGkPaxV7JY/S+07Yl4axgrbNV0hvzwlh3uXwswV9vpbbExZxTQLqx/hb+vxNld3K27CXGFH6Du0jz9hZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(366004)(136003)(396003)(346002)(6486002)(86362001)(31696002)(478600001)(41300700001)(26005)(36756003)(53546011)(83380400001)(31686004)(2616005)(186003)(6512007)(6506007)(6862004)(54906003)(5660300002)(8676002)(4326008)(316002)(66556008)(66946007)(66476007)(38100700002)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dElYU05ISHdHRWd0T2VWaWhvZFlhV0JQSlZiaEc2NXBCRzZYRnBCcTdybzVy?=
 =?utf-8?B?c1hrRy9xZm5OUW1EOEhWZEZGQy9BUWpGYjAxckJ2U2dJYVpGeWZmYVQyWGl1?=
 =?utf-8?B?aEJCdmh3Skh2MWo2bHh2VGVTL1R3UHl1N2V5OXhERXc1aVl3bGkyMzE2MlFB?=
 =?utf-8?B?REtRYU9vMzl1OWRPNTRVaUtTVk9yczV0Y3JFa1p0WlBvZ1BJbjl5dm10RFUx?=
 =?utf-8?B?Y3BwWXJCaGdOdDY4ZzJneTM0SE1UUzVSZWVDVm5jYld4NHE4QmZQY0E4Wkpo?=
 =?utf-8?B?SVBpbkxtWVhEVGNPQmY1a21QWGRWK1RlREo4ODByQXlvUG9RUTVkZDFRNlNa?=
 =?utf-8?B?eFIzdFpud3ZheHloOHZsQmtBUWdubzlxSzV1eGx4M0krK01rbmFCOW1YcUg3?=
 =?utf-8?B?UFo2K3ZRTmtmeTIySTE5L3FmQmd4dllCSmw3U2pmeW1QaVZnczNocDF5VXV0?=
 =?utf-8?B?WFhnM2E5WER1dm5oaHJialFaVEFHOGJsMEpDL1ZLb0hwVHVnbTlIcU50dGh3?=
 =?utf-8?B?Uy9PelhJZkVBTnJRY0k1Q3ZINzltRWNzYS8xVE5jZE1oQUxsbW91ZnhqcEpU?=
 =?utf-8?B?MzBHSCtiWnc0ckV5bEQvcm53VHdhRDFqMkdjOG5VQUQ5N2Y3N1NZYTRRcDN6?=
 =?utf-8?B?R0t2RDdqaWQ2VU1IV1VIWFlPd05DNWxRdExGWVMyTVptQ0h5TkwvSlFqY0Vx?=
 =?utf-8?B?WXJGRUVLaVBtSzRLS2dtY2hqdGw2SG1wNE9wTCtFaUhqWGt2ZVQ1YnFLcTg3?=
 =?utf-8?B?MFBoQzdxQ2F4M2dHaWhqQ3dIbW9GRFZFbVhTaW5wbzBOR3hCRG03M3c5d0Zo?=
 =?utf-8?B?anp6NUladzdxYUpnc09GaEx1d21wVlpaa3BlZ09CTlVuZjRRemY3R3FZRDN4?=
 =?utf-8?B?VU9qWHEwQXM2b3hPZFRFbkRGcUdiaDNVTzlSM3pVMEVYTnVDZHdxSzdueTUy?=
 =?utf-8?B?RDhaaWNWaDZEeUNJays3ZjZYL2c1VE1IaU5JL0dac0NTMitmaWZhU3JRZWFy?=
 =?utf-8?B?dmlzc2kxU2l6dVBZSHRwN2NUODdjTC83THA5aEJhY3dTZTdsVWU2YmN3MFFh?=
 =?utf-8?B?MWVDdFdRWGRkYkVDYzNFeFcrbmJONzRUcGEvNnUydnMweEhKbWlDVmRlK3ZZ?=
 =?utf-8?B?OFhJQ2FXODZiL2JjYU9wQzdhTkdOWDl1T2lwNUQ1SzM5VHptM2kvQjQzTGxD?=
 =?utf-8?B?K0VMSzBZNXlINTRzZG5tQVhCK2YvbUJqYkJuOFVyRXZaeTRzV1lGK0xRS2Zy?=
 =?utf-8?B?ZXkzU3J1Y3JTbmtXZm9yaVcwNWR2b3RqVWpXMk4xcE9yajdzY1ZTeE1Wdm9G?=
 =?utf-8?B?UVVEME9XWXB1VWJvV0J3bzUyNE9NamVTZ0ZsanQ4RXljTFoyeEE5aWlxVmJi?=
 =?utf-8?B?YXpzWUV2dW1SMW4zZkF5bGNEUGlvc1RuRDl3MFdDMmRQUGpUUTVQem9ldC9U?=
 =?utf-8?B?UFRkS2pyTHFrVGczS3hicTJvSmxuNEdBY1NCSVFXQkRBN0VrRmxFZFhKWHF4?=
 =?utf-8?B?amZCQ095T0piWU1OTmI3MHRkclRLZlBtNWY3VlBUYTkzbGJ2RjFCUVE4cmwx?=
 =?utf-8?B?eUZjdC82WGJSbkhnR1NBQzhsSW5GdW5tUHB5WHRDMjRlUmdrWWM3ZGR1ck15?=
 =?utf-8?B?YlV2RDBTMG9VVVlkZ1J6enREV0p0dWo0bkczbDFHOERlUHBDOUJON0gvbURw?=
 =?utf-8?B?d2p0bWZCQ0Jyc3p1RVgxNGVPd1NTSmxxZHdXTkFpY0lCL1hIdHY5MlV6RVM4?=
 =?utf-8?B?b2IweFpMNnBucytOTDJPT24xbTZjQnlpTTl5WWFDQTVWaTJlRm9nTmJRbE1l?=
 =?utf-8?B?ZXRwSjBUTmlVSWZtMEV2Y2Rma1hLbnpQL0pqcUhLbGlCYmp2b3FVTjg5Uzg0?=
 =?utf-8?B?UkRHbnpXcCtHNktWSFlVeTdieDRWcjNXa1lMVmJENWtOek1yUitQOGZGTHBa?=
 =?utf-8?B?eEUraG9wbFovcGJkSTBsRFFlcmdzRkhCWi9kc1ZwMW9GdWtkM1Z6alRIL1dK?=
 =?utf-8?B?aE5XKzA0OU9pOVg4eGViOFF3Q1dFYUtkMUE0N2FtRzVyNUs3OWhCSTM3YlB1?=
 =?utf-8?B?Q0Q5OUtKeWhxbWNEQWIxcVVwMkhmTDJNTDU4OXgyMWtWcXROUmc2enZaN3h1?=
 =?utf-8?Q?VicnnnH/KogYF3AhNb6VTvsgn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1790ea-88f8-45bc-b2cd-08da79dd06f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 07:59:03.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gA0cG/r2+WKbDfcm+zkjC1pCS3ynJwHHXcLOdP7mcB49jTc40H9KqZaw2O6Evsl9eMtK3qVqg9Mi21/f1Fw0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8665

On 09.08.2022 09:53, Penny Zheng wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan
>> Beulich
>> Sent: Monday, July 25, 2022 11:44 PM
>>
>> On 20.07.2022 07:46, Penny Zheng wrote:
>>> When a static domain populates memory through populate_physmap at
>>> runtime, it shall retrieve reserved pages from resv_page_list to make
>>> sure that guest RAM is still restricted in statically configured memory
>> regions.
>>> This commit also introduces a new helper acquire_reserved_page to make
>> it work.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v9 changes:
>>> - Use ASSERT_ALLOC_CONTEXT() in acquire_reserved_page
>>> - Add free_staticmem_pages to undo prepare_staticmem_pages when
>>> assign_domstatic_pages fails
>>
>> May I suggest to re-consider naming of the various functions? Undoing what
>> "prepare" did by "free" is, well, counterintuitive.
>>
> 
> How about change the name "prepare_staticmem_pages" to "allocate_staticmem_pages"?

Perhaps - if what the function does really resembles allocation in some
way. So far I wasn't really certain in that regard, and hence I was
wondering whether "prepare" doesn't better describe what it does, but
then its inverse also doesn't really "free" anything.

Jan

