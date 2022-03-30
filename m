Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212514EBEDE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296229.504196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVfy-0005ZW-8u; Wed, 30 Mar 2022 10:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296229.504196; Wed, 30 Mar 2022 10:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVfy-0005Wu-5u; Wed, 30 Mar 2022 10:35:42 +0000
Received: by outflank-mailman (input) for mailman id 296229;
 Wed, 30 Mar 2022 10:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZVfw-0005W2-MF
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:35:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2438c584-b015-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 12:35:39 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-k-Raq1s7PDaqJDTs6qtzLQ-1; Wed, 30 Mar 2022 12:35:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4271.eurprd04.prod.outlook.com (2603:10a6:803:3f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 10:35:34 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 10:35:34 +0000
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
X-Inumbo-ID: 2438c584-b015-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648636539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6u/x2PZq38fxOQOJmWVoRvdDUk0rJR8ePmHVSEk0KoU=;
	b=SU8KmLOwMgDWpAXjrTsu7/uvnyoNoWuI4i3biY6x9xwWQsvoaxgNTvnVARfj54gF/bLSO0
	U2z3KBVZtDwDR56hEHwTw6nHNmtFt5/Hs4snIuEbNvOHQZv+gMM4rzZr20CGUlxrx++Z8K
	VexWR205DrEltzWnKiXibxAXCeVhyVs=
X-MC-Unique: k-Raq1s7PDaqJDTs6qtzLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+HRIyjswIchgtPZFsXZehXryyDJ4YDHmlXqCSA/i6/YRPrJSIMwkgwSmTLixNepJV8B66X1znTgbmLydqVlPg76GKnaSpbGlBpEWrdRGv9fSL6+MkFgd674cs2UXT3nxLJP+T6nAwcup9lJOB0RCtPbRI3Ry5aDKf/xuNLjEdQS8JaR7urAwo8j7w+he7t3vaa3gf03CkOGiKvJxck5XdHNp6Rml7lP+RCYGGEFO5pIQJs73GQLH2Fk5X8Kcz/c/jVENW8J7j2hfP8cO4qjmZL9ofQdEV5FJhYpmi3nsorsk6xAo9EzlsGGH6mAr9GAzvU8kmvSR9lCoc3xu/NP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itRVDMm65ODpsIpnEIn3YUUtIrx0s+IAC6E73fyZbNo=;
 b=FsY0OvRVzwAlPh94kwjygHS3HvRqNuFDrTyIS3sblrpokxk9m4aYY9WpPkv6B0UyF3xG/iUJd15xnPL9meCNft+2EY0Yqmvxut5AaAyxuj6jUJIi0K8YvXJtX4xLoQuu5PZh6rtR6nG/E9vVdbP8G1XhGLSON5lYvIAKQOdgrzGZyctYdTLHFbu2ZtxNlfUANUg7yYHT5nqaUAK2x7a9RcQ2Y0eq3bV1uAIE8Gx8TaEIlwtQRGo0jgF0HUO2YrW3CtasM23iryhpyca4p4axDCCR8ym8A0/4Lq2RRe1z0KnTSAWMxshG9xzQYizw3FqVLJIa/7aZu+zBxG1OsIUv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fb5b45d-636b-dc30-2cbf-5e811dd2c319@suse.com>
Date: Wed, 30 Mar 2022 12:35:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/3] retpoline: add clang support + Kconfig selectable
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220218143416.34475-1-roger.pau@citrix.com>
 <9500afea-3ca0-deb9-9d48-4983454b1c4f@citrix.com>
 <YkQvNR8uVQT4jiqP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkQvNR8uVQT4jiqP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0754.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 983a2706-98d9-4d35-6340-08da123905ce
X-MS-TrafficTypeDiagnostic: VI1PR04MB4271:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB42717B0B80F72862A892BB7DB31F9@VI1PR04MB4271.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6G9a+oGP3ESrigpVOpZ4jAydDaDHz7JT65/VaL+bK1J3v7s2bBzil1RwhEhBgrCBcDmQ+Jt1vlDa7ldgBCFUNv+bS17/ks0Qr/aKhCiow2zLdgnIVuf3BhR8uwYngooKrLL64yT56uJ8d+F3I/KwF+dz9DQBGgiyCAkDYuD0TQDGgIRhuzUINkE+eFacZ8sKBAufiWil8freZTjUKVZUAm/aQ55bP38XfTENt5I3DYiBmnIfntOBiQrAezPy7jpqRBwu4UGjTooeQfT9p493H0hYNDFqp3TgIG7Cyf+orAYhhcxTdYcEzE6jihLEhFWpPmABWcNTfMtZGVFz05FqzR1JTRggWocM3VjBUFD+koP9GeS0AzlW3UQUB62K7VdESO1xABGgczUg50giV9qTzWz9qWavi5X3Uem3cBJWbHSHTUz4hmasEjbuepKA+sHcnd/VX5rx3M2sOWlxIwa4hhCtjOOC7vBZVZNgCDPr4lmNH3UbBzEvpSIQi8Ip3TkfhZVMHoW0WqcMN6fTUMnGdZHz/3G7klxc1VeTSkMnmYFQCv1Gxpsktkky8BO06rFkusyioRnXQOyfDX0oe8ty0xEnT4de+OEG1COh4DHnzUKLWb1nfIxG45ghxx+NjccV0TueHV8OXzniTklw2xtl7708LKxvXUo82ghDV+FIW3fG5w7BdOhMYR0nahjNuEDNQeSS0zXuxq3KjSDv3lcQFGXaRX9TusB06/iBCe2wobpmjPjplQgOQlG1jAdQlceRfdCcAgmJA9iIrQg7uUSfuV4minuMiB45TDuk9Wf4XK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(2616005)(6506007)(5660300002)(53546011)(38100700002)(6512007)(26005)(2906002)(8936002)(36756003)(83380400001)(6916009)(186003)(66476007)(54906003)(66946007)(316002)(508600001)(6486002)(66556008)(8676002)(31686004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a340Z9qa19pJQ5zVKCJWUCwlj036tBIg0EoRrxo+USydNvGKBDAaNs48+bAR?=
 =?us-ascii?Q?xcDAp6Dy+Ggup5EeqM9f6MdkFkKEziFrvGsD6O3rakH310erEvftI814s0si?=
 =?us-ascii?Q?uGo+8zg943joeDbjgjwjf0bR+s9hoRhvLVU2mMlc7Wnt/bpyERN/SVOHGUhF?=
 =?us-ascii?Q?ydRAs4s9Dry45LR0CJFzPgWLm/Z1C23rSh2+SJ5EiR/3hPsN8au3aJgYzNAZ?=
 =?us-ascii?Q?tWJSmUTJVS6C+C0Cdaihr5+7LgFhzyfNeypEob5sXzcL9o6PH9rWZOwnBSQ2?=
 =?us-ascii?Q?zkLhalZ2KWlC5wQpnSEzLyd9pFH0K45BZyq26m8UZe9rSHTIUZsXGKlDXdW5?=
 =?us-ascii?Q?DtashCmo7zanPSp2R44eeJS6/j16AGpx6AeuTBsppAlffZOgZjOmnHk2LSNk?=
 =?us-ascii?Q?AXbJPeSRANvuZJr2vPRciksawQJs9SkfFL/TQexq4HglugN9S4yQMai348R2?=
 =?us-ascii?Q?GtY5u1jEj+IOuyRtz9a/gOFaZLZGg9900tlrKEvbMy/hugnv9wwVBGD34Cbr?=
 =?us-ascii?Q?oCcNxQjG1nFZG9jgJFL/gOGamO3CaEcZa6PfyqCZi31rPkYxPdAJdXz3EPKN?=
 =?us-ascii?Q?8wn7Od4152hwfoXd/lxVAvNYFRFKNof1+JyEM4oB9xStm0gsPPAmCQfTUsXG?=
 =?us-ascii?Q?C71OkEXq65hMDikYWHi0HD1yAt1+UMwmQ0km0uZDDrjdTqry6jy2E1hNVgqE?=
 =?us-ascii?Q?YEeRHPsckeEcYXA8YV/KzKrvYO+6t+rYXu0jVPT4NvGhNl6kAREoHObBINVc?=
 =?us-ascii?Q?G93i8w1+X1YHWkIC4MKiq4z6wLJpshLEpYqoPcZIYmVVCTfACCjs8hSiNduJ?=
 =?us-ascii?Q?R7sv/ZPHs45dRBUdQrzBd4Zo1tu/0+ZvnBNL1y/GTRql4gp9v1lGjd5rRgFe?=
 =?us-ascii?Q?j/Y6vT3zuD4De0CK3FTLMmk3ghEgpgIVUk7mQ/HlyKiq6FDdUDocdHhjkEGW?=
 =?us-ascii?Q?5CkGuLpKBSe0YEur+UkT+aL1RzyEIYnfO1lFpcQw7ziH/jS2kS+fAJNoFW8+?=
 =?us-ascii?Q?1t/wjjjwvIvCwHYPuhshiK3+KPNNVVKKxvVw8qq9OdPTVfCZWPzHGTtU5qMo?=
 =?us-ascii?Q?8r2yuvIoaR3pUBsQFSbJlnmwgCQ/M/KAjTu/jSiyeHfE/lW6ewcWjCMJ5ea1?=
 =?us-ascii?Q?Os2y4a0OzYaVdNbAzef3DekJjOrpPMFSkbKY1484HULdP7xL8rKA6OZg9sOc?=
 =?us-ascii?Q?xE9X2zY4ZX0bTB6o6RmQWrNzTJnmXbR/hdHiH3ZLTCTq0+E+9qFcd53kHVp6?=
 =?us-ascii?Q?m7cnsr5UTH//GqT8EINasvSYY2mbvddgEpNJnp5mxrMYZ+eOwi2XV3clJRPj?=
 =?us-ascii?Q?Z9mKMXJiylJjmECMjd55YnxGxEFiZePs1gA7S9SZI5yfB6y2+mJKXWah5IB4?=
 =?us-ascii?Q?P0Wpx8R5LFddz9jeYrQ3VbqnBwADrHWFTu8YOY+if4+vd/2nXogNC+LsIM5f?=
 =?us-ascii?Q?FLzcbnew+Omdm6XaFKcz+LewhUZWAzvULtlz/xYAVTz7Y4M8l1loROy4hOYe?=
 =?us-ascii?Q?csyUmAZAvkIuozAmjsLRgTl2ZwMKLIXuBWoneK2LvJBiNyirN5bBRIcPdMNu?=
 =?us-ascii?Q?Mog3wFioBZxMe1ypjQ9eNc2BYax99iqhw8sB8TOZgeR0dDe3elEeQy8MZmZx?=
 =?us-ascii?Q?ue9/5ZhH/C6Q3fPmsqa5Nx3Q8DK5nk5neN/Y2a+qEP7vlZSynBQTjqKPiqq9?=
 =?us-ascii?Q?XXMMloh6Ss97TVXaTA+L7FFcPDW6Z3PUceC52Xm8NjR2NkmlzG5/UOJfE+dY?=
 =?us-ascii?Q?bUL2miT8hw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983a2706-98d9-4d35-6340-08da123905ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:35:34.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RwfwEVns1kuCqD4UNC4b0lhhYcwo1i4CLbQC1pc0YIOZ85fEj9LHwz6ZekEcGlErYqv+tK8EqAKLv96wJ3smA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4271

On 30.03.2022 12:21, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 18, 2022 at 03:45:12PM +0000, Andrew Cooper wrote:
>> On 18/02/2022 14:34, Roger Pau Monne wrote:
>>> Hello,
>>>
>>> The following series adds retpoline support for clang builds, and also
>>> allows the user to select whether to enable retpoline support at build
>>> time via a new Kconfig option.
>>>
>>> I've tried adding a suitable description to the Kconfig option, but I'm
>>> sure there's room for improvement.
>>>
>>> Thanks, Roger.
>>>
>>> Roger Pau Monne (3):
>>>   x86/retpoline: split retpoline compiler support into separate option
>>>   x86/clang: add retpoline support
>>>   x86/Kconfig: introduce option to select retpoline usage
>>
>> Thanks.=C2=A0 I think that's looking much better IMO.
>>
>> One thing, we want CC_HAS_* for consistency.=C2=A0 I can fix this on com=
mit.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Could the patches be backported to stable-4.16?

Hmm, generally I'd view them as a feature rather than a bug fix, but
since you're explicitly requesting their backporting I guess I should
rather look at them from an improved-security angle.

Jan


