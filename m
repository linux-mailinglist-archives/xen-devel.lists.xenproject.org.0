Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64842A19C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 12:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207038.362773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEbR-0005T5-6w; Tue, 12 Oct 2021 10:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207038.362773; Tue, 12 Oct 2021 10:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEbR-0005Qi-3I; Tue, 12 Oct 2021 10:01:45 +0000
Received: by outflank-mailman (input) for mailman id 207038;
 Tue, 12 Oct 2021 10:01:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maEbP-0005Qc-3u
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 10:01:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3a3496e-d33a-49c1-9904-a47dd2b50769;
 Tue, 12 Oct 2021 10:01:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-e6HSZbttMXKoq5QMr_a8hg-1; Tue, 12 Oct 2021 12:01:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:01:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:01:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Tue, 12 Oct 2021 10:01:35 +0000
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
X-Inumbo-ID: c3a3496e-d33a-49c1-9904-a47dd2b50769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634032901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJjhX86f3EAGln+TbUHg2oryS2vcZ3ceHW2kRO4z6k8=;
	b=abkHDC24TvPyXUI0LuVjBs+oGcVb4Ndf+obGfkduqU+FA0ac8P9bjE2h+OLpQHFQ9Qi0Zk
	khbw8STRBvBBK/jUydedMzKgmGtHsEKLXLd15pVQ+Qy083v6KicPT1F2Ix8f65iKlfpVKQ
	PZ9yJBNNiXc+G2w6MJ8mD8+xYCG8t7s=
X-MC-Unique: e6HSZbttMXKoq5QMr_a8hg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joTBokRUKRaw/jfIivDfKvIzsojVBvDtdsN/prdYZHzrjO9bBKftGIYRck7byOVK+LMe++pA5U6Epp5Zbwki27reCFqb3pPapWwlokoK1XrIdOGGIk6PSCOhl07bnqBPur9Onrj3OpJlORBqdNUPPeDSTuTlwBG21aM5yNOUZGYGVGFn6+sRHySsNQ5w0vCzVJ+3zbkxxJKHN80BoYLx1JOyFxMEaXvWbsgm5gUv+OUWXcAAGRxij++Kzd8acIc1Pw5j8Xt6dEmbaR0Da26RY8OqkXZbKHkH384Re0IoRPdLGUumDADJ3kAiM+fcXirZEHaQXZEDgDxLtLrYtl9vzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZBGOB0yTTyttKdwtPTE+h6ujJQ2LdOuE0OtYnrKmg0=;
 b=hpVc2oKWaHIt896mHFHclYGgI+Sf1RdBQPYzsub6ENd1H0mcXBeoW0dTa5wwr908wCHgn+B/Jld8ZEq81PekFk+kc9BYa/6AsdLdNKcK5h3kkt93DnfrWoOgpCSg+oWb361la7SNnsOdJYcs+0nSSu4JDnITsgQpEVL8t6ySxjYs1AkJ81MKPA1yO3J3jGXn8dSyS9cMhm4WYtk551b8n/r0OkmpaozBw6bVIy5P5Yp2zG8Be0MvzPb0TZ4avtWsxjURKAYLiHudOkd7P1jlueDmNnn9IBgRoV/KS+JrOGrLjDjV8nTK0qn6lMU8RUAsXp+DNQG9bxPkttsSvhhJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
CC: Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
Date: Tue, 12 Oct 2021 12:01:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69a2fa04-e34a-4fda-6634-08d98d6746fd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335894AF50ABEAD75C51DC0B3B69@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P680sfhmDyr5HR7w8Y5Z+LH3NFTtALNSMGMiUF5kJgBGsckkYoPN+6kLFwEQ7Mb+C8YQLNOEOjLJ2eQ9ltVOHoGXx2VzLw0Uhb29dOPO1XEy9ex+XVErsv5kXdDXWiDrBkWsIIsrxNFV1czpGHE8AsUOxXLeZUoRux7uaJKWa1fhdiev6lwrSU70ch24h3mhAnW1680QxwNflZJd0UkKElegd5qVQehDkg+zRaFQMqsadzoTAWovMBzZf+2RD0Qtq1L2Esw6uIBWofBfBr7I1PLZIYh1Qh5Nzvz+qqAlE74vvfJ/lb/KSPrW+ha+qSmQBhPVYk5nT5OQYeF5X4AHVDk7rGbCzBwaQIRw/gv63PEQAiCf+ce3VvbXibO5onfsFmml/TFUYAgEuVqVG7sAhKMips09mOk4u07ycB1zrc3oPZvlpftzBz6AUwuJtzfR2Utd9egMrGa8QJClbhMj/UkU3rkeCJJY/YfqqfnktdZRNdnXzsw1PJYlNeVseyKRnVpJ0kd5kRIict0zWEXM0ur3Pv1GlBGN3v+X5GI5VYm9yipLfnvHAXS7KRB/Zjt7t9q8BAmFaTXX3bJGdSDdNZpfWzps9oYR+xmSeJ67G8NpeyXLrJALjijhH+iPt1hOTu1pxAcQjiT+1F1a98eHLbLNvQ9iN65UGcg2lLoGBxb+moUNZ4IN1AuphpgQpBQAaIy1Trn4gTHcJdj1PVETx4pSobrC98wkVvT7B17sSsHDkqqh49H9Y5rHeFW9nA5S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(53546011)(4326008)(5660300002)(956004)(83380400001)(2616005)(316002)(110136005)(6486002)(86362001)(38100700002)(8676002)(8936002)(508600001)(66476007)(36756003)(66556008)(66946007)(26005)(31686004)(2906002)(186003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+9LD88kRp+vkCb3VoJAQaVEJNBAoTDl/G5Sb2tQx06P4c6MYakF57Go0BOOG?=
 =?us-ascii?Q?3PMtzBlIEuyVyxbVQGJWAC3946tVHwne5idgnPfR9yNAL4t7syJXICq64hGd?=
 =?us-ascii?Q?RdK+6xMq8kux/Ab9hQAMMKVgHkomOna43FXC12+ONryydtbzAdsWK2sFLORN?=
 =?us-ascii?Q?0QQ+HyZAQ2j+eMCcpKztVPd0G67Z29u5JT+BTfYc8DBO/QhT5i0kQ2A2Ioa/?=
 =?us-ascii?Q?yyaoKcZOz202aimdpc+OAtosdI1+6TUfZDzm49q8oba4PpSdYaWvCOm+a78G?=
 =?us-ascii?Q?UEP9JYYfNeImX88UHcv/fUliSS9IgZqDjHqJrZHXGOVYkJzf7SqWy2NjaRMT?=
 =?us-ascii?Q?5lCJJtWnEoBIq5iUZa4vcJakcyZ5AU8lcvzQnMLcKbrgZg2luovsXgzUzlVd?=
 =?us-ascii?Q?WuHiWY7vnJp6rffQopV/9fxswjRllGoUdESORSxTd0OPxJbJwaDiQ54uLwRD?=
 =?us-ascii?Q?rBkZ+ohgi3QCTBo66C2TBLwj9mskjkStmWXHoSG0XO+jX+LnNtCyJAe4ifGD?=
 =?us-ascii?Q?kh1k0hcDkUTqmCQmS2GZw8EYrtWTMCSfDER2ENN1TNKTOxN8+u0AdsezksnU?=
 =?us-ascii?Q?T8ArohTIfP6gtE7mVGCoMtsaEfmnIEFoQy1P9L8rPYCq/iBTYuOGkiHCFTEq?=
 =?us-ascii?Q?KV3v5dQEAGknYPIkbaEMLk4JpqI4+sAEKMhbvZ3mhezXicMiWGOjadmJfIob?=
 =?us-ascii?Q?1AcsTAmWk+VT3Fl3TA7LDcaRSDzcOObQ02f2oYJicKdU8MmmPvHTL9IUeySV?=
 =?us-ascii?Q?DyVN8NXhpfh07imW+DvEu0g/Nvoct/AhbVlGSyDH+EiAhgs3B/IQJv1A6Tf0?=
 =?us-ascii?Q?X2H7ZJ6/WqqBvVBzJ3YQDMJqrqdJ/kykgr0DO5FH4I3mW7o+BFJeXKudgR86?=
 =?us-ascii?Q?6Ajfz7Fv5fsN23h+IVknmChDJS3fpju1J/IQYPca7BMEzC7cQsn6KnTRlTkV?=
 =?us-ascii?Q?+6fmtcGCI9dAh1a0gPyrqn6V9mOsTcO6rgBYGScHuQ7P0jdFgitHdsAnzR/B?=
 =?us-ascii?Q?3oCYacCV9CjF7A0mzi9JPqp2Xri4GrZNPgPqRK/asL/C12o+YpBIgTlgdNTN?=
 =?us-ascii?Q?W2a4fgtNVJebsLrgP1mOPcO+79eD0sW+T4k6QZFujmpwzdIG2MlQpl4wcUxk?=
 =?us-ascii?Q?4efbveeDRa6VGblN72NLnvJKlpuoJFbkq585bRe+UPiDaWDD8izpnWqhO9Hp?=
 =?us-ascii?Q?Gt9SqSnCRLK+yev8HVyNWCEU0SCGY5Z9silc0c/oiXNZuVT/rpk4oyjim20o?=
 =?us-ascii?Q?0QJUL5dfjA1/rQs2kV0fmsr5PbuTcHCNsGh7YGvH66qHxOk8LRrlz9X6rBIh?=
 =?us-ascii?Q?Vw1ceU5QBXvYA2afr41RI2Kg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a2fa04-e34a-4fda-6634-08d98d6746fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:01:36.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCHSwiBVMrNmiO1WUK0B59nMiGtoGnPWvSj6GlwBHRYjSR/rxtXXkCAIWfBU+01RCTLBLtRBjgd9vIMssbCqUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 12.10.2021 11:38, Oleksandr Andrushchenko wrote:
> On 12.10.21 12:32, Jan Beulich wrote:
>> On 12.10.2021 10:41, Bertrand Marquis wrote:
>>>> On 12 Oct 2021, at 09:29, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 11.10.2021 19:11, Bertrand Marquis wrote:
>>>>>> On 11 Oct 2021, at 17:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>>>>>> On Mon, Oct 11, 2021 at 02:16:19PM +0000, Bertrand Marquis wrote:
>>>>>>>> On 11 Oct 2021, at 14:57, Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
>>>>>>>> I think the commit message needs to at least be expanded in order =
to
>>>>>>>> contain the information provided here. It might also be helpful to
>>>>>>>> figure out whether we would have to handle IO port accesses in the
>>>>>>>> future on Arm, or if it's fine to just ignore them.
>>>>>>> All our investigations and tests have been done without supporting =
it
>>>>>>> without any issues so this is not a critical feature (most devices =
can
>>>>>>> be operated without using the I/O ports).
>>>>>> IMO we should let the users know they attempted to use a device with
>>>>>> BARs in the IO space, and that those BARs won't be accessible which
>>>>>> could make the device not function as expected.
>>>>>>
>>>>>> Do you think it would be reasonable to attempt the hypercall on Arm
>>>>>> also, and in case of error (on Arm) just print a warning message and
>>>>>> continue operations as normal?
>>>>> I think this would lead to a warning printed on lots of devices where=
 in
>>>>> fact there would be no issues.
>>>>>
>>>>> If this is an issue for a device driver because it cannot operate wit=
hout
>>>>> I/O ports, this will be raised by the driver inside the guest.
>>>> On what basis would the driver complain? The kernel might know of
>>>> the MMIO equivalent for ports, and hence might allow the driver
>>>> to properly obtain whatever is needed to later access the ports.
>>>> Just that the port accesses then wouldn't work (possibly crashing
>>>> the guest, or making it otherwise misbehave).
>>> As ECAM and Arm does not support I/O ports, a driver requesting access
>>> to them would get an error back.
>>> So in practice it is not possible to try to access the ioports as there=
 is no
>>> way on arm to use them (no instructions).
>>>
>>> A driver could misbehave by ignoring the fact that ioports are not ther=
e but
>>> I am not quite sure how we could solve that as it would be a bug in the=
 driver.
>> The minimal thing I'd suggest (or maybe you're doing this already)
>> would be to expose such BARs to the guest as r/o zero, rather than
>> letting their port nature "shine through".
> If we have the same, but baremetal then which entity disallows
> those BARs to shine?

I'm sorry, but I don't understand what you're trying to say.

> I mean that if guest wants to crash... why
> should we stop it and try emulating something special for it?

This isn't about a guest "wanting to crash", but a driver potentially
getting mislead into thinking that it can driver a device a certain
way.

Jan


