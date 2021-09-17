Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3255440F52C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 11:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189199.338744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRATQ-0000Tb-Hg; Fri, 17 Sep 2021 09:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189199.338744; Fri, 17 Sep 2021 09:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRATQ-0000Ro-EO; Fri, 17 Sep 2021 09:48:00 +0000
Received: by outflank-mailman (input) for mailman id 189199;
 Fri, 17 Sep 2021 09:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRATO-0000RP-I9
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 09:47:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5553fcff-179c-11ec-b67a-12813bfff9fa;
 Fri, 17 Sep 2021 09:47:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-3KGv8gYBMPqaujWFuMCgnQ-1; Fri, 17 Sep 2021 11:47:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Fri, 17 Sep
 2021 09:47:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 09:47:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 09:47:51 +0000
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
X-Inumbo-ID: 5553fcff-179c-11ec-b67a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631872075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idwOnHYM370iMoPA0YAP6F7uMR14s3cegSi1bn1KsHw=;
	b=PHTnJyI/QUATb0asPXcFm7QGiarvqJ6fMfO7fbChb4ol+XCimZPvYOyED369dwIKl9Zyjp
	BOHSyX96lP9eh4zwjXzmId/0rLYDVMGSAzAIfMqPe+yFmIy3wOx1rTbFyaqNHwOYZcX8pb
	Q6TTZZmZChOUNaZ0wfsWItzl9FtRlio=
X-MC-Unique: 3KGv8gYBMPqaujWFuMCgnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4ZgNOmH6jGjjN5cVTWNdfsGt3LoyAwYAQJXbCf5aKmDT6JnX6heOQA0v2uFGJ21mPFmnXSqczl76ZIFiKcpnQuVRGku+ZiQYsgqLiHdgViceFnpNschPiSzOdpWLFV3J496sbPjjVpECpl/jsbyHFOSocKAYukt7xNh2gj0YFdZfrOjkxBzSjvXoSEFn5gjECMRZ4KHtxsyrOh2rpZsvNFwCwxdQzc0f3Lwqinmeww53krM626/n+8jLe/ndH1d26+C3EVWwacAQBn/Gst360ci1enjaxYTQ+/4T9EHKc3K6swi2VGDLnkWYDk7bR6aZmaY8BO74LIVaZmMeVJOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ax/VI5edREgAIO4of/Cl/ZPvcu5LUESwbiEQY1Fd8fk=;
 b=VHuF1eGfZBJbah6NlYMCDbAqFNFhy7LQtH9uEPznNkwklEeutoneXSglQX0UaHvLrWCK8dwK2dg160/q1cQ8DC2grCSs0o6FvUdbc5t7NYO2VZ5yl54Fsz5SwDPbp78RbRlEMcwYuYZd/sAeER4eVG14pxWUxxqox7Qa7iTI7BPfz3qhiJMZj4AtA+AFMBAlU9BbQ6Xs/hOWovn8441hIVfi6loaEvqfLiodDo/xi6pXu4js4pvk2pmLIx92QdZAVNmtHeTCc13RXL6ZtuRMPn74bCt+xHUa/aX8C1XrcgEeT72Et2yhVDbeipYzOXqK+rA7RwU05giasB+MjEudlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Dmitry Isaikin <isaikin-dmitry@yandex.ru>, rjstone@amazon.co.uk,
 raphning@amazon.co.uk, Paul Durrant <paul@xen.org>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
 <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
 <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
 <0fa0d369-c67c-1cdd-0ff8-1542487ffb8a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c860901-0992-74df-4a53-d75a0971d1f3@suse.com>
Date: Fri, 17 Sep 2021 11:47:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0fa0d369-c67c-1cdd-0ff8-1542487ffb8a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb84c91-b3a1-4e6e-814d-08d979c037bb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46071331A5B1C448389B4AF0B3DD9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FPYBm9TIUkFebc4GmyqDrvshCCc38JmHsDBthA+i6Bpkr3tjp0a/q/5vICv5RaUWWBKlOX0r7W796xgfDIpguI4vysper9t2+3e+/nRgwSCZa0wqfoGFSFVeBbQxX68l6Dt21w5PDwVGBq7Iwvy4i9SvF4z3B8jsgr8SKHzJqfjeQFiLNQIY3BIzhZfCM3eghZLxtMKpOzG7skTahBziI4QEAKJRTZF0mOp59xYZ66t7/U3F6JqSwKSlrBHuxYXPQmjGlQ2JhSDdVwuVojn7s9Iyl+INXXTaw79F1UnaM7srsKBTgbSXVfK2nO9HSmVuLTB+NxkVYdiKdvJOfNB/NMiol8pfOiUBij3ToVDiIrxxUX/RxQoBSZTun9ehDOF3+HFs0TAX6KIqpse02yIAPI+g2Fa2j/VUhMJEX4y9ncp2ED5Ma6+coJIR/YxbPl7W8NvvGpJSD2G/hISBvBNA5Y2UcCBJWxlJQ8BpvLAlHcWLd3pDIKhIea+/nqTG2WtAwvx9B94wtfjcYkyGWrAnlJpI34eyV82/LwdvA1unsfndL84zs7ZkjFE48p1qNXVQAb7YDcKdKtW32ci8kJYiQGcdswiQ0EfoHjHdpsLALhjmX3uKv6t3wW6ZShRN4IQ7R68kSVk+rOVeJDvasT4ZkTTcHIRcDou/Ow9/q848PFccjMw6xbxn4tynvtXmOpt3fVwxDYhMd3HH+14WFZGSVl8xj3HnzYGZrrOmHkf7Xpnc39ym/H3F0FOWVAkHDunIJ+AM7+AR0EhLP+ddEfKrorA6OcR+QlH35Dx9k9dYF/LbBX9J3k9m8pzctJkBdCB9dqzOZFnPCpaJFTepNygEh/m1U8bPIB/IMNClyiyTJmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(346002)(376002)(366004)(53546011)(66946007)(4326008)(66476007)(66556008)(6486002)(54906003)(31696002)(5660300002)(16576012)(956004)(86362001)(186003)(2616005)(26005)(966005)(36756003)(110136005)(8936002)(478600001)(316002)(31686004)(45080400002)(8676002)(2906002)(38100700002)(83380400001)(7416002)(23180200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rHrrBXUCpDTVvwVROi2R9OgWoJCTEsKuprR4NZ2hZnJjYHt5EGDIcFmvnyO2?=
 =?us-ascii?Q?bpzNEryPO5mb8AlH1HPlipltOgaby7pN44rwW/dFGlVY35i7GIaKAdDAt2hD?=
 =?us-ascii?Q?Jy5tU+fvgKFjzHTtOy/YLGf6z9n8UBYucWF6nH8unXh+RS1rdaD1nvlGqkzn?=
 =?us-ascii?Q?p6wyZP6SgYpHLTkO3MBfSfUIWaYEJribP5aSogwlzsoiH3H4rrDHcSJtgkTs?=
 =?us-ascii?Q?ZNcw4Kx6bUzHD2Qu16AssCHT/U4Ssg1WPLg6Q3ZZkSIJIdc6OeYtUMsJVpSu?=
 =?us-ascii?Q?9k15IJh98/pnHMyKiwyCYZ01DoqXGPALA3dsDCGfiEjVMw+2xtjlBSMXgzHG?=
 =?us-ascii?Q?qQXof86YejFS+RbCOkxiUs1YWikhWhVdx50SwIpDPIDchSZNa8oYARBc3x3B?=
 =?us-ascii?Q?Av8ynOs1fKr7ORaMtUoxCm7Xi8HYsk/45QdOFxUtnu/DOWvqFX4vRBEdxaQf?=
 =?us-ascii?Q?C2tMJsFgEr5Ffh5unA+0TXtKhLbvlsX7ndBhQV42U68kTIL6JNA6W0CJj51D?=
 =?us-ascii?Q?mlpCCIqM9g9eP+aQyrl4cz1GB8hRUo8HNq7rkewtxJAXMlvDnJMc1/xney18?=
 =?us-ascii?Q?ITnE5UmlyTsWf8sUTX//Kx2dAx8pPArdg/vMOlnSyb11C87IQZmVYnhExA6M?=
 =?us-ascii?Q?kwYS9OoR4JathY78r5tAlATzWWuldzipCt4LoFRAFarixLkwyXANEzZYU8kt?=
 =?us-ascii?Q?F6JQUHRsVo4MHO4LI3d5AEE3v6fHkoABUoANYeMgGsVkTjwuoURYLZhmJpFM?=
 =?us-ascii?Q?oJ7L4py5aUlrwpXoxZGp6g7BQ3ugKQReZOweqcZkbTqvL0A4newQadoCKqE0?=
 =?us-ascii?Q?okBheaAyEJL8QSwMwKAMSX1fpnnb0VsCQSdGVUm6GXEdKzlkB37p3vN5jzDN?=
 =?us-ascii?Q?yNUfFZ8rP4AmH/I8KOUam7PJQ1H25fmvKbeFK8UpLQYRnGcNRj2Ua2wJGf5H?=
 =?us-ascii?Q?dkKNkGrbEizp2KgVP3ODQ3I8ham77Vf5jquG/EQ3TpqBlZAXu4I0HJFDk9ST?=
 =?us-ascii?Q?vJeRQ1qlDFEnbQ5v9xlbHGXsWWKwfsYJ++Ol/Gn52BMilmoHZEXUviaFGS3B?=
 =?us-ascii?Q?2l7HlOP979ytsKdLJVhqcCOJnGyFitEJ1e+X/POtrOgalUtmWJ1DaLZcriff?=
 =?us-ascii?Q?JIJ6BtvfC5lEuQW+Ykvxz0IUTyWVHBsKb9r1AWAABnAKRrhszWX1w5xzxanK?=
 =?us-ascii?Q?SOlVXReDxJK532PEotyPpV9KQhGyEWLakuLusZEPf5XNbniQU8I1AqQfmIFI?=
 =?us-ascii?Q?5Z1kE/4QTrv8ThmrhiCle10+gTx+zjUTsM+6u9y8a/aX6ToTMMM5b+aeR/Bg?=
 =?us-ascii?Q?gb3VdG21BoRCTDszMqKL6PWZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb84c91-b3a1-4e6e-814d-08d979c037bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:47:52.7001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQfFpTrH+nzFzCY4ca3jabMPBH9mnZ0TfOVde0XiIN3tWlyfRFQjbu6DKVRK+VCbrfpe9Ofo3iijS20mSneLIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 17.09.2021 11:41, Andrew Cooper wrote:
> On 17/09/2021 10:27, Julien Grall wrote:
>> Hi,
>>
>> (+ some AWS folks)
>>
>> On 17/09/2021 11:17, Jan Beulich wrote:
>>> On 16.09.2021 19:52, Andrew Cooper wrote:
>>>> On 16/09/2021 13:30, Jan Beulich wrote:
>>>>> On 16.09.2021 13:10, Dmitry Isaikin wrote:
>>>>>> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>>>>>>
>>>>>> This significantly speeds up concurrent destruction of multiple
>>>>>> domains on x86.
>>>>> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
>>>>> improve locking during domain destruction"). There it was found to
>>>>> actually improve things;
>>>>
>>>> Was it?=C2=A0 I recall that it was simply an expectation that performa=
nce
>>>> would be better...
>>>
>>> My recollection is that it was, for one of our customers.
>>>
>>>> Amazon previously identified 228ab9992ffb as a massive perf hit, too.
>>>
>>> Interesting. I don't recall any mail to that effect.
>>
>> Here we go:
>>
>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore=
.kernel.org%2Fxen-devel%2Fde46590ad566d9be55b26eaca0bc4dc7fbbada59.15850633=
11.git.hongyxia%40amazon.com%2F&amp;data=3D04%7C01%7CAndrew.Cooper3%40citri=
x.com%7C8cf65b3fb3324abe7cf108d979bd7171%7C335836de42ef43a2b145348c2ee9ca5b=
%7C0%7C0%7C637674676843910175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dsi7eYIxSqs=
JY77sWuwsad5MzJDMzGF%2F8L0JxGrWTmtI%3D&amp;reserved=3D0
>>
>>
>> We have been using the revert for quite a while in production and didn't
>> notice any regression.
>>
>>>
>>>> Clearly some of the reasoning behind 228ab9992ffb was flawed and/or
>>>> incomplete, and it appears as if it wasn't necessarily a wise move in
>>>> hindsight.
>>>
>>> Possible; I continue to think though that the present observation wants
>>> properly understanding instead of more or less blindly undoing that
>>> change.
>>
>> To be honest, I think this is the other way around. You wrote and merged
>> a patch with the following justification:
>>
>> "
>> =C2=A0=C2=A0=C2=A0 There is no need to hold the global domctl lock acros=
s domain_kill() -
>> =C2=A0=C2=A0=C2=A0 the domain lock is fully sufficient here, and paralle=
l cleanup after
>> =C2=A0=C2=A0=C2=A0 multiple domains performs quite a bit better this way=
.
>> "
>>
>> Clearly, the original commit message is lacking details on the exact
>> setups and numbers. But we now have two stakeholders with proof that
>> your patch is harmful to the setup you claim perform better with your
>> patch.
>>
>> To me this is enough justification to revert the original patch. Anyone
>> against the revert, should provide clear details of why the patch should
>> not be reverted.
>=20
> I second a revert.
>=20
> I was concerned at the time that the claim was unsubstantiated, and now
> there is plenty of evidence to counter the claim.

Well, I won't object to a proper revert. I still think we'd better get to
the bottom of this, not the least because I thought there was agreement
that mid to long term we should get rid of global locking wherever
possible. Or are both of you saying that using a global lock here is
obviously fine? And does either of you have at least a theory to explain
the observation? I can only say that I find it puzzling.

Jan


