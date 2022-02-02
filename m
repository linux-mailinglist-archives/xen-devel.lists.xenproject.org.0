Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF224A6E08
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263924.456811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCCv-0005oj-Jh; Wed, 02 Feb 2022 09:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263924.456811; Wed, 02 Feb 2022 09:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCCv-0005mg-GU; Wed, 02 Feb 2022 09:45:45 +0000
Received: by outflank-mailman (input) for mailman id 263924;
 Wed, 02 Feb 2022 09:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFCCt-0005Fs-FV
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:45:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e30fe425-840c-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 10:45:42 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-DrNSgyfJMGGvBPgYwvXOMQ-1; Wed, 02 Feb 2022 10:45:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5434.eurprd04.prod.outlook.com (2603:10a6:10:82::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 09:45:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:45:39 +0000
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
X-Inumbo-ID: e30fe425-840c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643795142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xf/y63tjY8CmS0eXssPU4mrQyX/p6vWs8DnJwQvzOY=;
	b=XsBu0iqWD7v+V5O2OCZW4XMccMN9gRW0WZOni0ea6CQ4F9oGSikQJIDLZX7Q7WTEjR5VcP
	cfU/Lm9Aa5ecHX60lkhjFdnp4vPlxb+e1sQci/IxJ4H7obPJCi/IlFHfze6AzK4zSq2cgL
	WEbjIlfvMA4p30A9xrHgDVLBBvEpmMk=
X-MC-Unique: DrNSgyfJMGGvBPgYwvXOMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxgIiNl7+BI5SNndMyX5JFXt6+oGrUA7eAjeLdOmxEFZa+YTr5ZLu5ZzsLmAox5kHfvZcEOzU5beMF+OTodKagCzaX+yZVPJMKLq/ux1bQFArMRM75wUoPMT+BjBtY4ZkFgPLxKcgnUBsGGJuBNS+8HqNgkKgY3A3gbjIrAQ2ovwHXIX1AI7n0+0jC2y4Sxcl9imy+pcqh+UoLXkZlCjzX35aT7mt/I5bVBbHhhY0TBRkJpp1TyTx0A6a98DoOEBYZtILbegXv/ApHwxIULDThnpHwM0W7wryAYipM4YbWSi1QwYYNyERFheghPUJh6LF0R45GwoKnXKq9ivA5ssMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38KqB/pz7E1R24DzSWB/rtLbom9TUxNVmGGRWGYAytw=;
 b=FP1zQkqlDtz3AsDjxI8z6Nuu6+DAdZWn01iyglK0ELXdpJFF745edv7iYh1k+fUEYRDWcIgTdbLNlxHY/qPlyANq3uO63dHK0K4sEU9KmmpkwbvKbo8MxqNr7QABgF4v03i7sQpsYLk/wbI/sCxRiV6pFYTNYXQqhjjoMcgo7RdC2c8oBteFiODo8lFRSkbHniyyiK4GZuzzvnnJAbeQtMhkgUG3ZfJlQvwbA/s3ACL2A8vgNTBdL/NoeHlmXpywVD0U6IepFN6q2Y6q9NKPy2TpiK8bFgUXzC19M4DlIi4vP0EXuiuQSeJlFqHM4IpyVYzr3A1BmFl+xYoO1l5ZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4a78b7f-126a-3c18-6f93-2d0bd768f74a@suse.com>
Date: Wed, 2 Feb 2022 10:45:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-4-andr2000@gmail.com> <YfpEiWT0NpYNSAks@Air-de-Roger>
 <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
 <5ec87648-2783-d21a-ca7d-dc59180543d9@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5ec87648-2783-d21a-ca7d-dc59180543d9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0245.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea827a2-8d58-46f7-c059-08d9e630c539
X-MS-TrafficTypeDiagnostic: DB7PR04MB5434:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB54345FA5D5E6B8B60D2E3EE6B3279@DB7PR04MB5434.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6pWqBt134avTBpk79StwhoDWVnmpaLsOlW5sGlyR7ZbrkxN3Pl1fw0AZX915bY2hSh08iu5AEBDTPHho0TWuOMw3lCPVgBeYLY0D0mMfwSXN5J/xe9mkaJJQ8ql+EJzjciLfGp2uqH8aXToCXLxkSLI4aL34dl4/soZor5AP91AHxqAEwjvX76ATwEup+33U/XPQAuHE/fA0QHUnXUOgCtoVqqwYILJREK+KEiGcXlSzz1JTDOyUDyy25eVGvHvKwuxHzugT8I1uHEA+rm6mbX5kqh+3GiOKeCt2T+f4Ne79mzJ/jIou8mUfnjnWak1V5VvJ5JoI39tfKTNPoTyoKFst97Oou7JTwlnmEPStBxdB2OFdi4tQn5dFjwKfRBhART6KP5eVoWnl9l3U70SsPUn98OiPDNTS6zoT6Z5TUCleNLjnOzGOcwJYuOjqHXsNHJNW4vaosvdO/Ve+6Ey+n/nZCRngWJDnpNazkHhd1HAEmKl6VFkPPnhzfDsLQw72C5ohJ5zbyT4XiwgdN/rLrfA+gSKtY2/7M7yk4IrTblayB6s8RYq5GxYx7TcBpPPTnKjxmVRpPpbRR0CbYn6q4vrzM2hi2u0d4zHaTZpABW2qfDN4VCKaS18l9Kxbo+wkjHRFQkSoueucDicuAVFcODv/L8D3UGuK/2M/g3ouVGu4End0ruCmKcItlti7pArKjBGKt9MvRD3SzkFcwxugzXB2IAAJY3BxQmmKc6L9z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(186003)(26005)(5660300002)(2616005)(6486002)(316002)(6666004)(53546011)(31686004)(6506007)(6512007)(66946007)(54906003)(36756003)(6916009)(83380400001)(2906002)(8936002)(8676002)(508600001)(66556008)(4326008)(31696002)(38100700002)(66476007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MUWovWxHqPVyMrr+mO/yz3fYNh1efSIquloiX3YdHtHRrKP9Q6d94PLMlXIW?=
 =?us-ascii?Q?5Gm2xo0fPyWqy7DDc15BVlJLx+B4hd+L4DSCLG3C9lFhMSrdA0k3VUqDgQpQ?=
 =?us-ascii?Q?P2cA/JdEmSf0Au7j/YfXEtOBgDwqlnEaHaoDpG+7wu0fVDJ69XUyxHbWPH/u?=
 =?us-ascii?Q?Ym3Sm7lOf1aPeYC5LKQS3wKCXZApa42Z81O2N5qXHUd/f7QI9IYcx85l95Hr?=
 =?us-ascii?Q?rPAliUoJFL6bxpD0rStoJRtcjDuvJJ753tY4PmnqO1DMerqZkjobW4Kiw3WB?=
 =?us-ascii?Q?cNIWXJgovCocOR6W8rkVu+/nFzyL6gIdJaxu+Fo23WntYBttR3VYImsrFqMi?=
 =?us-ascii?Q?BGI7sGRtMHqiRz4wD1mdfRI5x61H/qW95vUIHtRmb4ITdKb20YQihGIfEyQi?=
 =?us-ascii?Q?Ljv1pCEEwsQ540cyebobuncUDKtRXEc0oCdzyk4ly2ApZ7vJPK6zVuDIJELC?=
 =?us-ascii?Q?sKQTW28MW3Zt05yLUJJZY/AQAsXXcRfrtjEJXTqMZjgQHSeGwJH624GwpzP2?=
 =?us-ascii?Q?QOIp9wpJ+oKAzj0+w0SiBgI4UrXH9rLDTBFcs8fm/pd2zcDCkd66dztIfx/C?=
 =?us-ascii?Q?TbQOnqCkdJ1NudpMzXm3L0FvM599BrF7tY6xT5CDsAB74R945WZ7J7/3TTY3?=
 =?us-ascii?Q?Q+vnPwy+yv5T+95mNrjJuWBENfh/n0ZFaA7BadKxuX/ok4XQgfkgVll74glV?=
 =?us-ascii?Q?f9FQ/xUMlH6P4iAUV3uqwA82GGGKu4tr3YXhsZJZ1xlaT9G698hGAhWhDiGq?=
 =?us-ascii?Q?hvE+KMfhXI58gEV/eLqJFRCbmOJ1KjSn18+viV09VenjHZCWUgZmJA9C/zX1?=
 =?us-ascii?Q?gzg9eneDdJblOm7MBECr3v1EqGbWi+CiGu/ofhlGJEhEPAied857zX+94rNp?=
 =?us-ascii?Q?JGy2gDGSwSPNH9Gp9IiYPnKinkJUbiSMBBCA3IxFNMVzNOH9jPCO4u4gr8Sk?=
 =?us-ascii?Q?1LoPi8tKp6AJwaH96YFRv1QxomlBcPQJsaT+9x9j/rahzbYb5/7Q1rjapan3?=
 =?us-ascii?Q?2tc7PVywVhkyAVC1OiZuiCMqpX8BDpciSlKrZVbG0TX5/T0yS4/R/GwvTR3e?=
 =?us-ascii?Q?Dqt7YM1IqLKX/BBiCgbBf51QHmEeLAQDFXBfiYw2ugWbCm2PUBZlHdH4C0+c?=
 =?us-ascii?Q?K4GUkChwYkaMhY5KDlbj5xn7DaNyq3j2/8BXXfhmhl5pWlwag9oIQLEp3Htm?=
 =?us-ascii?Q?Ij0kRauuYPYEMilJ8lfMg9EZYOLZd6w+DIRpAwecTo+3x2VOnvePX6igcSbN?=
 =?us-ascii?Q?7n0GGxc1hPGENO2vlQ519mEfWfbG/5Ta69M6KYVZ9cxRJi5HtV0QRiqykBRR?=
 =?us-ascii?Q?or+SdfmDyu0IoewugXzxrNZRn3cXz4jaFAoaTRB5rLjnyjWZmYqvinhMSu0t?=
 =?us-ascii?Q?JVhUQxgjrRPphQ0JPGS6DO0dTD3ZZzi0LFisKKERRj8MCcVwA8ii3E+zh4Ne?=
 =?us-ascii?Q?FOSIi4Ry0jXlAd+w0ZaHf0+wlSzKmGSS/yx3cY7hDroxwQksnLxv9bGtfZao?=
 =?us-ascii?Q?lJXRq4o7qUQax5/CgDjlBLXg7/BNmkPg/cY/x3w4lhKJa1A1KCexm4ZKfCsD?=
 =?us-ascii?Q?oVPqB1zVKqrdQGljkDyYsUw33x3ZFpBeKDLrtfh3l8sS1w8vWwmPWDtj0FBy?=
 =?us-ascii?Q?eGZ7pM6xkV9wsZPk43h+/zE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea827a2-8d58-46f7-c059-08d9e630c539
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:45:39.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbQ/ZKZhOlzm/cVe9NJhc+cfLBnOD+rGQH6MowYQM3UTdWcsy5UkRI4fTcvByfS1gAL+90ISYEevbL6iMx3HEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5434

On 02.02.2022 10:38, Oleksandr Andrushchenko wrote:
> On 02.02.22 11:05, Jan Beulich wrote:
>> On 02.02.2022 09:44, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Feb 01, 2022 at 06:25:07PM +0200, Oleksandr Andrushchenko wrote=
:
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Oleksandr, can you please clarify authorship here? The rule of thumb is
>> that From: matches ...
>>
>>>> Shrink critical section in vpci_{read/write} as racing calls to
>>>> vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
>>>> around pci_conf_{read,write} functions, and the required locking (in
>>>> case of using the IO ports) is already taken care in pci_conf_{read,wr=
ite}.
>>>>
>>>> Please note, that we anyways split 64bit writes into two 32bit ones
>>>> without taking the lock for the whole duration of the access, so it is
>>>> possible to see a partially updated state as a result of a 64bit write=
:
>>>> the PCI(e) specification don't seem to specify whether the ECAM is all=
owed
>>>> to split memory transactions into multiple Configuration Requests and
>>>> whether those could then interleave with requests from a different CPU=
.
>>>>
>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.c=
om>
>> ... the first S-o-b, as these are expected to be in chronological
>> order.
> Well, I was not sure here: the idea and the original code belongs
> to Roger and it was a part of a dedicated other patch. So, technically,
> this patch didn't exist before and Roger hasn't created it (the patch).
> So, this is why I'm in doubt here: should I change the authorship
> to Roger's? I had no means to offend anyone here nor I pretend
> for the authorship in any form.

My personal view on it is that if you've broken this out of a larger
patch coming from Roger, then he should be named as the author.

Jan


