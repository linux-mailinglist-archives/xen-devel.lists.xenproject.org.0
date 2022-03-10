Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0804D4654
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 12:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288307.488946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSHNf-00072j-5T; Thu, 10 Mar 2022 11:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288307.488946; Thu, 10 Mar 2022 11:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSHNf-00070Q-14; Thu, 10 Mar 2022 11:54:55 +0000
Received: by outflank-mailman (input) for mailman id 288307;
 Thu, 10 Mar 2022 11:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSHNd-00070K-73
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 11:54:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49acd33-a068-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 12:54:51 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-zxtkYNKmNhy-HZzjXMOKOQ-1; Thu, 10 Mar 2022 12:54:50 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 11:54:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 11:54:46 +0000
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
X-Inumbo-ID: e49acd33-a068-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646913291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyCxc4CAs80k63TxBi1H2qzryCfLRo/ZELvc0mMJwO4=;
	b=Bras+4fwegZKWg7Jl9HAQUmxG1sxTbuBxETZiwUamY1m5YXAgWc04IWywwJ74esVd931lH
	H1FfGG6DKQduclsIcWOnEO8JDm1xUK4i5xgo1E5h45MUCw61sfatvBb1VhLIJoXUQc0GKY
	y/rx4nL/yXsEsLhFcFgDT3IT75L5daw=
X-MC-Unique: zxtkYNKmNhy-HZzjXMOKOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET/Y/0Af2A0GzR+xIPPt74/JF+HHCfIzwNwKZCXs1W5bRCIDQbCTphbiAQxq1IjsoIcN+U2xQeZIOx8vO5JgpzJ18yJZCQOLKILYtgL20eKD2rO+OgIzDpFfFruN9FYNuL8fSDIitNwb/pr8KAqHsgTUdHK0JvZ+Tyl0G0al+Jpi8BmK+BOnoL0EdblJB/9X67JR7dpI6SdH5ybH8bLJAkilDWtW7u+Zc8JyRHYPu3CVN/+03yGc81Q3+d0LbxxzeuNw+1HfOGaNVQ3fQpNpfOO4NXPwhM8Bzes+mFqxvceD7jcUDRjeQo20IgPBgyq1i6mXhA7BJARcBZCSCAhVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tnwgely8PHXcnjQJ9XjDvuMBhYhZ//An4UOlVe0pGYs=;
 b=NS5LyZHxDvUbVjI9BEwOCDR5scOm57NGncdJ9DUcJyxIu3ToLaqPXIyl40q4NDlzJ54jPIDkgo2JVcPt96TJoVLjpCWTxyCg748KdnppJ/W2P5JfHX7ExJ4+RujS+lK0MuSyo2j3tFJr+e68ipiykmrAKBsMmmMB/bk6YB95fHorF/c2R/hxJp6bXxxEW14IgpGqG39xTXYeoDhjN1+/P/L3fk5IIoMpm+VCz8FbY1IV5hPJLY1hr2KCMTSEJydc1+uQaEo2Y3QbfT/nBvmoii61O54rv7A2fhsaQN8exzvw3QJ5KUNfT06peNLMY17psPpfYpCN3yOapb4SFdKnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3fcc8f6f-c454-28a9-ccee-bbe36ad295cf@suse.com>
Date: Thu, 10 Mar 2022 12:54:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: preparations for 4.16.1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <6f8ccbb3-d384-bedd-8fb2-18aab570b588@suse.com>
 <41020867-eaa4-839c-3380-00bd91c5299b@citrix.com>
 <cab2a003-5112-42d0-3d2c-3758c895e52a@suse.com>
 <08075ddf-fa90-dfaa-07df-0e256fee2c41@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <08075ddf-fa90-dfaa-07df-0e256fee2c41@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::28) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d81fc37c-4682-41a2-01e7-08da028cc589
X-MS-TrafficTypeDiagnostic: DB9PR04MB8139:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8139DB580BF4C56C107D26F2B30B9@DB9PR04MB8139.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R8DEwcIP7J5jnp7U84Sap5mIIhY7FklANw+oyYPV76QB5oJHEVVdl7onHpmJu8NSSTvBhamEhFK0lzuKqOP4KuPZqboLbUjSLUqEtgh4TMk5TsWoTXykZ4ctTGbwYPjBjOK7lAVkoLMZiYl5J5NXwtPGpV07KTej6sEZfozjaHpokER22qn8q99jKdoKh6XXdoj8B8AEAAYTWT4IDtShsHog/QtykFnvoR9ZIt5GbhopXwgXs5doTf3ggDvscSUwlCFrJm0V2yNBiul5XQqrP+dFn1grvzhUUkQTB1SkThtlTgd95vawsXYAQaeHuwzHXdMAa1WlB/qKG9RL/KYtJPDsdjF1dfDWNvxoZ85um3EFsOj8P4rpvTL4QlICkhaI1tmv4BdElyiZdUMffn5YbHajgay/jHaFiAI9dkcz/Dj/kyBMsVpccJuy3wtuItZoihojDBYltRSjXGWQgrWSSzQuOHhweXrWUf4elTR9pnpJy6gXlGnHQcEDABNyHM6AbqWgCsYJCKFZxoP6s1FFt1wLeReijaylkPO/XR4GsWNPIW9BTg3HIBoWQXfGc+dpR3XhfyxKPAON0y6MtZKnWv+VR9tsYoCy9x7x6e1wk3UP7Jj8y1bW1DrzfzjK6RF0X9udXr3ky5aHiq0SLAioQ+3qfDG65Bjz55KCRC2/31+8XmeIjQcr1nMZvYQhVqm5ToeWl5/EvV47cx8oYVW9O23Ny1WjrDDbjUGAOKatYQP3VUTTpQU6xie+vzOV4ymB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6666004)(8676002)(316002)(66476007)(66556008)(4326008)(7116003)(6506007)(86362001)(53546011)(5660300002)(2906002)(2616005)(31696002)(26005)(186003)(6512007)(66946007)(38100700002)(31686004)(508600001)(36756003)(6486002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4mi7Iw/+Ao8mnVvrj4Sltsm0TKSv/nit9LHsvL/pPJjxG52q8Qew+FGEOFiw?=
 =?us-ascii?Q?iP/EvKO4/t4In24/yUYcubAQqfjW8Qygr/+/W/bU1j7LA2xIS+J6V+MWt5P3?=
 =?us-ascii?Q?Q2Tmx0qzVsKHx6EH8zVRB1xOhsU4s62NbCbnLg8+Lrtz6RkZg/7+IeewvlDR?=
 =?us-ascii?Q?/8bcJjy0ninA0xb1qQzHMkl/DzlpL1hlNwvmWiIKmCdsFSOiNif1q01tgzg9?=
 =?us-ascii?Q?yMnwySCeTbWVTv4omTJlwNXz1D8l+ng+KmvBIpOnYRlIXJVsm0zVD04vAAI/?=
 =?us-ascii?Q?vgnHH/PZLEuBAscUOxpzA7cYZ/Bkyzkl5qotSa0EMT61e5+PomJRHY191tGR?=
 =?us-ascii?Q?So+BJUygW4WxtTWsAKB8EQtbFfA7/hDFFbMuYzAH6BxOlCBdVOz06Z6Cpuic?=
 =?us-ascii?Q?tKiDyquYyCgcsTjYgbAEVy479PdMK6n4xW29t08JUj6AL3m7hZs/vThzaXOV?=
 =?us-ascii?Q?ekVUiNToGhOmLIExJnYDgMiP5FPfhp4/ydfj7k/cOJXPF6BPZmVZjRv004sa?=
 =?us-ascii?Q?w4ePGi2NbOvdKPl5iZI4kOKKnVFNdpL9g40LzK2+H6X1yeV7KCt96CAbLXah?=
 =?us-ascii?Q?DV3azC1sNIT5GXueuQxmR7qo0wnll17sm6qflDXgTXbEmLU+dDG8OjYxcoOL?=
 =?us-ascii?Q?3ot9FaCCLuB6ovQRr9dd57bW4y8ce3anW9lrjE/gQ+oPZDGB/YQyFHGQVk5u?=
 =?us-ascii?Q?mHMNW/t5ETSuU0bgdDmRlkgIP+j2ABhOgjyJFfEF1YzJDfi6miK3wWuP/N7k?=
 =?us-ascii?Q?rGJwalPgJv8b94hLHghXWXttpFur2130UJX2nAYV7P+YjZUPB4ea9hV3CJfa?=
 =?us-ascii?Q?ioPRCh+uGiZPwNleNSob7APUKmxTh1WH8oS6BF+StS71B0O4jo4AA44ZEPYx?=
 =?us-ascii?Q?97XErnuP+IV9LEqGRfuPSpeK0aTNym0o90Npr8s+48tEtt9Ym76zy73Rj6ty?=
 =?us-ascii?Q?WJ2umbsCej2h4HfBIdtbmYProH/wa/HkwQ1OoCL+F5gULwYhBCA6/rMk7tRF?=
 =?us-ascii?Q?pv/9TilRED6RLNHAZCy2IoW3bERPdRGmQ/4tM/dM3xCTJayR1673td9vUy4j?=
 =?us-ascii?Q?oNkGAvmNdV0Retj0jJ/ZppPlHIcFj54X3hQ1ssqIW195ByRcoPp+E6NFsMpA?=
 =?us-ascii?Q?vlkuuS+xoKp2p8l/W8BMZ7kEmo2BYe4Waf+g3lIgsFGPVCbEUgarvJP1AcJC?=
 =?us-ascii?Q?f8IN0D3sI/nespekuis8xy9azJ7NtSaBmXzA86j4Ob6nQ6AJ7HEkAnjH30+w?=
 =?us-ascii?Q?F01c41tpbv7C5uLF8HIbq0AFIV29UXapU//OisRucZOGA3LVgxwnurTM9Zdq?=
 =?us-ascii?Q?xuKW/clkpRSA5ZUmpLpCEIGgkzySXvwVeZihtVogR/Yx0oXGiVnohoY/HK1f?=
 =?us-ascii?Q?SZ8FDW5MRmZ9zyANZyzEExCRlO0lof5qbX90qp+Q55HuFzU8MqI8V5cQ8B64?=
 =?us-ascii?Q?lybtWsrFstRs/8fm8ZKFBLKT5UIg+UmunSeNwqOnhRci419dHSwgVKwaOhME?=
 =?us-ascii?Q?KBuuuHFLZ6hjTO8wlBrjYNBgPEv9y6Fy80zRGAr60fk45fUgDQjOLsY0ipYJ?=
 =?us-ascii?Q?/we7pHGcUUFwvMb0H0XYuPYZhhUAmJBdsxbQoJO6td1rh4xsrltftrmzumga?=
 =?us-ascii?Q?P2N1oJMAS4W1Cc4UE4FM+Yw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81fc37c-4682-41a2-01e7-08da028cc589
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:54:46.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzZ7uDvblKtCbENfh5Rkod4VgiuQcuP4hjZDkXkMEMCDAyH9lFh6QJ+f9zCh7bHXSRJKndyVRuYmYYflnf6GGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139

On 10.03.2022 12:14, Andrew Cooper wrote:
> On 10/03/2022 10:35, Jan Beulich wrote:
>> On 10.03.2022 11:20, Andrew Cooper wrote:
>>> On 10/03/2022 09:01, Jan Beulich wrote:
>>>> On 10.03.2022 09:57, Jan Beulich wrote:
>>>>> Please point out backports you find missing from the respective stagi=
ng
>>>>> branch, but which you consider relevant. One I have queued already, b=
ut
>>>>> which I'd like to put in only once the pending fix to it ("x86: avoid
>>>>> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, i=
s
>>>>>
>>>>> 4b7fd8153ddf x86: fold sections in final binaries
>>>> Actually the other one I'm aware of is
>>>>
>>>> 7d9589239ec0 x86/CET: Fix S3 resume with shadow stacks active
>>>>
>>>> which Andrew promised to provide a suitable backport for.
>>> So now XSA-398 is public, I can say what that slightly cryptically mean=
t.
>>>
>>> The CET S3 fix depends on one of the code rearrangements introduced in
>>> the CET-IBT work.=C2=A0 We were intending to have CET-IBT backported fo=
r the
>>> tuesday embargo (didn't go to plan), after which the S3 fix would be a
>>> trivial backport to 4.14 and later.
>> I was indeed wondering. Even if this didn't work out in time, aiui the
>> plan still is to have that backported (without going the manual annotati=
on
>> route). Do you expect this to be feasible in time (and not at the last
>> minute) for 4.16.1?
>=20
> The answer is largely dependent on how long it takes to resolve the
> remaining issues on staging (although most are done now.=C2=A0 I'm siftin=
g
> through things for a commit sweep).
>=20
> Early next week, assuming no additional fun is found?

Early next week would certainly be faster than what I was hoping for ...

Jan


