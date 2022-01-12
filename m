Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242F48C8E7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 17:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256766.440793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7gub-0001IK-3S; Wed, 12 Jan 2022 16:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256766.440793; Wed, 12 Jan 2022 16:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7gua-0001Ew-W3; Wed, 12 Jan 2022 16:55:48 +0000
Received: by outflank-mailman (input) for mailman id 256766;
 Wed, 12 Jan 2022 16:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7guY-0001Eq-Lb
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 16:55:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c070449-73c8-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 17:55:45 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-FS2qxvf4N6SfAhiG0-pbfQ-1; Wed, 12 Jan 2022 17:55:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 16:55:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 16:55:42 +0000
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
X-Inumbo-ID: 7c070449-73c8-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642006545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVIECFSoyBpoSerFgLoLt5D15ad1MicIB3WTwehRhzg=;
	b=kbUBjPumHpenr4AmJCFfwjZVfUo7cE2+YHnSaeHg77Wrku8mrLJ3lBK+EMlcl15gqoVXsB
	eUH87JO2DYz/WxTwn2uuHAR7swG02WJRMAAybVPIw9eDNr1kIpSOLp44+otudczHIMfdzl
	S/p/vg1oRMvmyR2RbPAMueSwnKEUPDM=
X-MC-Unique: FS2qxvf4N6SfAhiG0-pbfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UR2R7ZT5cVguHQ3CbFTC3kNXI+k3b9kooqfyWzZVie0BZk49hXc0cFIE00ofXq9qQeojfKY9SXIk/CYfEC8E2UsSBBcn3vgiMjQTuRIF0/BsV91NUs3Og7UF0NJqjVuOJSD0iusNj2+jb21j59rLd3Y0bhSsLMz+lTO0Bxlr/JePTkZEyWl5+3xvxUcRYz7OTthqJWG/LhleMxpqhtP1sXB3sdmgYthdUq7Y+MI8fJGpPRFIZ8NWsUQ/ef6NGeP9NaryMIdoyuPt3FrS0UESL4aftS2s38V3wk4AXSgRDlulmtRB5+wY179AWmOoe7dq66MnfUkkgn3ZtkPnOtVUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DYmNvI4f+mYibA77KNmzj3fgj0ASZ8x+uPhAeOnBio=;
 b=T7igKuxzuW4za4dhC7ZJDMDlBjkKVDD0NW0P48YTtdfFoqoMgUEOXXAxpcW9UDMM0KGV81eETdmpe77phLC4j4Zi+0VzXH0Z+uFFiuisLtkcgKDt1uJsQP+/I5kfZT2cyN7YpgnjJt/0iJ89tNfR1eLMsAX9QhpLmknv3Gwb3odQS0ImJVtBs36oeGOGHXFFB2BYzq+MLibX048i0MyCPteT01xdB9s6+Yg2YkOqo9rSzCXq/SkVYjICPJhi+ycPFYgybGZOQC7FVbIQJq2Nf6NK4VecYBETNm1R5ZgbtEVz2YsTXWLnDl+2XcA6irmt/L+qa5ttMU+F81YvapepEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a282ec4d-9ea3-7a0c-35d1-d08d6c056a22@suse.com>
Date: Wed, 12 Jan 2022 17:55:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YdwodzmyvNwGJaSM@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d488b340-aae6-42cf-15ed-08d9d5ec5e62
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943BD2CC790B80385BFFE9CB3529@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V+z97fiISkQUbJTDo1bKke19Lai7I+gh72/UurVGlU8IkyPzSneLjZjq/u/2GPYjwAaDhDYgbfUyX1IrNxIOcJXEzNq2xRJ+IeNLTbK0ErATNCAvy3W1PgKZI6DEJ51pMdBOQO5YhwWNrfHKYJqPtBGZTS+zdYqtyljH0wodEKp9hyk/sFaDSUNTJoD/A2BGq5Bg8aha5PiT5ekocq6SAJpzZKm/H4xnMrzWl9I+Mtq7uNDP0O40NOouqVhECxl+KYgYzXG/LdUE2kNX+7w/rOOucKX++AiYDio4wGv7VwKkIZ8EurylCTzXJHuRwYDmwcBrVLub/geu6QOi43kY8nClxtZJcbGIBYgWnMnqKdwXSQTjdyqxs1TIBubwXcSQUSVN7DbUxI2lkL6v5LD8mcYxW7WH9FfvVfa4kBDucv3WHRVKkT3j0x2Lri7joqYS2fpHUCTc3hos1prfVOZ1xHpUn6xSNUyJ8swI69C1XxAoI46Xtdtxo53ZydRJsKFXK6T/3G78+IOB+ub/zj8VzopdOujQ1MTCW2CQahNIr0gLNB2CDa1z2jE+G+npPZrZ6DJbWXY57TsIQdhWqK3dyyLUpXsZYdfZBp8aWqrI935FmW0tiERm/8kjfdVXKrM5SvV/qmAm/r3/tG5krks+LgACS1PWSV/asvoL5gopTtnEoCWtxf2KNAIeUFqxhHJD+XL7rEIvgwCv/oMvMHTgiU0JIOKmZQSxKNNdP5d5lW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(66946007)(6916009)(8936002)(6486002)(8676002)(5660300002)(6666004)(2906002)(2616005)(6506007)(6512007)(36756003)(31696002)(508600001)(38100700002)(31686004)(26005)(53546011)(186003)(316002)(86362001)(4326008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y8X+6/HgwL5dgEB5w+PjovZK7EiSSxqSe4yXH74M5696GSH0Rr+x8xfExO4E?=
 =?us-ascii?Q?b7GtlmuqM61RUW/OYaKFGb4ESoHeKsC+6AJKAm8aZ35HPp7JhBl6MNtAxUYj?=
 =?us-ascii?Q?Me3nbYWOW2adeKcZDgGLP6UrMggbXrkFLbMlQgJ30pZAL0a/mStoBgvf2qpR?=
 =?us-ascii?Q?gBeF+t+1WpUWkSDxjZM7ZtJRzm4Eq72675OAunl5D1lJFkD7GIi8Zu9mzGEE?=
 =?us-ascii?Q?/HUhR2IJ3nxpzexPKXcaSiixpDg3XiXw1p8cbAvsGRtplffyHvGXU/ZxSjHx?=
 =?us-ascii?Q?nL9qN9iFhsiCsbuCw0ZqTxnsGC1FFOGViBlJ8xTQt/wQd7qDOOF3M3FBLvML?=
 =?us-ascii?Q?ujTMXFUaed4u/4nIn65nwIxyYws4k+Si9/47vly6HWzVmIFl0m8peqwgIB8t?=
 =?us-ascii?Q?NVWd9bOFkz95E6ywqYzbQN1vbM3JyGMskJk8VOaFUbAp/aCq+K+dcTv4mFbe?=
 =?us-ascii?Q?rTNKivS5rgIuVhesYADKePgvCocMjcQOc2qm2BJ6po9HnENTeDnNkXhxcfsJ?=
 =?us-ascii?Q?GEWOcT2GLCgDASEXo55bM+DQQ3lcBWaGrnuJ59QtQc5sSnVfk/BxZkOqmHd7?=
 =?us-ascii?Q?n6YFXyoFjK4lnDBPAjDM9OfBHlQU8UIjApgYzkIO7hWO52m0J7+JJtkzlAu+?=
 =?us-ascii?Q?yF6bHGCOc+f4UsvxOk3uXkyPbb+GuFlKU4LS7CFMHuZ3Mxh7ffDEvm35pAe6?=
 =?us-ascii?Q?5DnEwge15PDu8WtQlLRvrUuTQRZfzN46oLv+disAsvzPjA6h0lIcQhLWCS3u?=
 =?us-ascii?Q?lmI1tNe+gmDA8lqOHgcyX6oIaA3y7TFTdeC0d/tI3jOJ8nEuJqqgMzJb+kKl?=
 =?us-ascii?Q?bS6gUnzBy7MFu3KerI7oulerMhsncjtO03GAZxAZFar9kfHsRlGNKi+PWylj?=
 =?us-ascii?Q?zFMnpU1tewMVIHhTiE4zcsI+fCtPAK4MYcTBPUDr0ij4W/K88e0F+GwbQYRD?=
 =?us-ascii?Q?GmkPraNhPoznsJKTkMM2Suyk9L5ht/41FUxoQPR0RWB8MAgY9R4Ug1zTAntb?=
 =?us-ascii?Q?2hE7rKAOpqFrhlYwDHVvExeliVnSgz88Qt/fu56fJiASSCSoZjg8SeGvshlC?=
 =?us-ascii?Q?111nnffjsP275YiFlBLoWUWPUn4WddXJ5+kFHPVX7N2p12Bb/BFjoTgJqcRY?=
 =?us-ascii?Q?H7pMk20wIY7yw9JJtmq94qi1HXLv0Tct33KCGsMuo5s8ZpO7pOd/Qh+uYa0b?=
 =?us-ascii?Q?16+8qht3HLZ93jyl8w0dt9Wlp7XWhglkLfajKgXkHGe9oIomOS5Vbh6vlgHp?=
 =?us-ascii?Q?NHafE0K3R22oWBAUwvqy2Mcl8YRPahj/k5ctB7MAB2Vmw+qbezuRhU9gChae?=
 =?us-ascii?Q?YckRUJ84LFav04KqEK3xyeW7DrHDXgBcawOoveRDUWmXHOUH8UOPB8t/mGsg?=
 =?us-ascii?Q?rKh+MBGVxN3YJFvsfeTebsCoISB4vXN6a6jM1U2HN4friD6NjyGn9kq8Kg81?=
 =?us-ascii?Q?ZKywFs1P8GUsG5jJGPzZo3c4IEivvXQPqBPF9hy7uce4nSdGMp40x2/0AfSE?=
 =?us-ascii?Q?zCV0xQ8hNd4+vXNK4KVkPb4K7VWGfvofnuI9Adv054h6e6SGA0/H1S2rgzXC?=
 =?us-ascii?Q?j9hq968BYwfyG5RK36Mij1w+nGe4JyoeiQ6RNL+toDCyOURisDmVNMVemvfK?=
 =?us-ascii?Q?fGpzrfxHac4GZj9iTcrdEcw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d488b340-aae6-42cf-15ed-08d9d5ec5e62
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 16:55:42.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dw1fsL2bW/oKvcXy1uLGNJXRWDgq+RJg1ViwH100zPf1G+wfzd9ZoTPqlhz89H2uoagF60y7fx8OxPBLrPCzAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 10.01.2022 13:37, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>> =20
>>      pts->frequency =3D hpet_rate;
>> =20
>> +for(i =3D 0; i < 16; ++i) {//temp
>>      count =3D hpet_read32(HPET_COUNTER);
>>      start =3D rdtsc_ordered();
>>      target =3D count + CALIBRATE_VALUE(hpet_rate);
>>      if ( target < count )
>>          while ( hpet_read32(HPET_COUNTER) >=3D count )
>>              continue;
>> -    while ( hpet_read32(HPET_COUNTER) < target )
>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>          continue;
>> =20
>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>> +    expired =3D rdtsc_ordered() - start;
>=20
> There's also a window between the HPET read and the TSC read where an
> SMI/NMI could cause a wrong frequency detection.

It occurred to me only while preparing a draft change that this is an
issue not only for the tail pair of reads, but also for the initial pair.
Hence I'm now actually making a helper function to be used in both
places. This slightly sub-optimal as it means that it's not as easy to
make use of the last HPET read in the loop above, but I guess we can
tolerate that one extra read in preference over more complicated logic.

Jan


