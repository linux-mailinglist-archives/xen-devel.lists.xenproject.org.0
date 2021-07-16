Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA43CB8C3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 16:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157223.290207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Ove-0005K5-41; Fri, 16 Jul 2021 14:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157223.290207; Fri, 16 Jul 2021 14:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Ove-0005HR-0F; Fri, 16 Jul 2021 14:35:02 +0000
Received: by outflank-mailman (input) for mailman id 157223;
 Fri, 16 Jul 2021 14:35:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4Ovd-0005HL-5M
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 14:35:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff3cca6a-e642-11eb-8985-12813bfff9fa;
 Fri, 16 Jul 2021 14:34:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-oEunXThkN5aRGZrkkSxz-Q-1; Fri, 16 Jul 2021 16:34:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Fri, 16 Jul
 2021 14:34:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 14:34:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:20b:100::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:34:54 +0000
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
X-Inumbo-ID: ff3cca6a-e642-11eb-8985-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626446098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSyp7+zkccGYIUgiCDyuWTsLqUdiNyJrgZz5E0Ekvb4=;
	b=hnZrv7JEcqseB6hwUt50lzY4I/obsERhiN176xvKcLAe8NFRxahvp5f9W5S5MGxwLYyvO0
	wi1+xpv94v9o7rG3HAnr3xm8pXySlZm6W3VV0ZjYavQ+5FyJ/XvtVQJibbvkcZH1y2BdZ7
	cijdQQzlFdkJh/UcYfbUnMJ0HPwgzzk=
X-MC-Unique: oEunXThkN5aRGZrkkSxz-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zao8d8x1kLfbZdc+vWHR0vXNX3exD7s8rdhz1r1w0/GUkianjeKpK+ME843uhi7MibY4xXrZ9AAFanZtGme90Bgp4k9i/OxDk3AZyLpZM7DNlYwc3NntDEgrxwNC2YtVyhZC1g/b3IU0crG7AnQ+NLHCeHdyw4AQEB5s8gM72sUoHU30hUVRtRxEvKsglyQeYOKHU7qPOiYat0nGfe47kn8nZLTvEeYOzxN4uPSLHJmLrELPKcbuYKIx148k3/JV9SgADD83IU3lCp80QtRKta+HO806c3umVjFkeFXoZ+6CW4Vh5zR6c08Cc2gnA9nG58ZLHtMkmkG7L7C85XafRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC4/g82qjNa6VHU70QgmGjWcjvrOrEWRA0MIlTH9s10=;
 b=PJcZVYNLDk5dBPQFTcsUcuapPkJPKBiEesCd5RANLM6CdFVR4JdNWa6Bu1KyPi30I70XPIZhgPnEes2X8s+hmLIO2joxxjfBdzyPAhFVRCRquOj1TDd+IenL3eIXNUGL/VQETU5tLL5y6AX4EA+aR2uWp7HRrekB/PBdLXZtzNgFfJp3Lwin17RPr4KweeMeSEMWRGHCeiAyqejpJk6Q/hMSpg/xPhzxHNbjw3676VZge3ydlrXBx74pRMWN/qw5bGW4vFvJMXBjnoWv+vzqAgLBUhEsSKS/F2hDztb8gqQre9MsWHTxyUxVsXCtcmmhobBNptFlfYpX6TksuyBZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>
 <17a250d3-1c1b-f079-c950-5590975e56ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e49c906-2598-7243-e786-be8b88ea50db@suse.com>
Date: Fri, 16 Jul 2021 16:34:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <17a250d3-1c1b-f079-c950-5590975e56ae@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7cd648b-e425-43bc-56d3-08d94866e133
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702B92510E9D500892329D0B3119@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KFtSWJm8dw/ChHYy1o7DEo7rBqzrTfG3ebTE3X4p4ork7yjj0pTOWxcBWsxT1Er1a8Uk6GaKberFcFfCepiIaThD3CWs8ULAwVNxOxSl/Zd6+0MjWVEdrzdzx6TvJ4sb929A0cRatzQf4JjSFi5rd7n43zb8nVl/j4gYhWfKeCFG5K9KmHAXQIzjeClKtAJTlB5/3XIJ5NbXmDG5f3BmUYfkZQ9Aa1llqnH7a/6i1Iuh8G94S4LXQvXPgedM4HdTOmaQBS0w0QSudhGet4kXSDKqZXHdGZJABnWVe81jWPoCcanQdS26IWwUbhWue7O4D5EnAmR1iCBr0dcdyrec3hY7WscgC2EKrnJEVBZwsNh6IyZxfADmindwKrVe1ZtEyoxioFPH4ohjOBefr2bhAhvLz8bNPRr2ji72ZuGTvfQ6fFfRsZr3aE0NdSpYDLfNjnjZl+H74/11Szw9WCwQuTapAvp80opgNXb1qxoK768DWK//161mqb5iWjqTVAZYNPNTMxZKLCsR3Yq6YbTsMzpPpsCDSmysesMz0dgX8YOTB1+kTKPLs9PtnmDgPK+rCPoUd//yFIQeLJ3b567MZf3b/m9cmv9xYfE3rbHjuy19SXCG/n6NYfwZOiiRf5MUrFJ5RbQjrMQofoY7BmXlqargtVxmhDhgf/IpZtw/X0O4kAaKgXTX5pjV+I8Vy2FiMvH5A/DTk9ymBteY1VAfSFDLEDkMJqChHzqQtWm0GNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(66574015)(66556008)(66476007)(53546011)(66946007)(86362001)(31686004)(6486002)(2906002)(31696002)(26005)(478600001)(54906003)(8676002)(36756003)(16576012)(4326008)(186003)(6916009)(316002)(8936002)(83380400001)(38100700002)(5660300002)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOgPdfwC4Yi+jkLGA7ycyxh13djulJUxCQsAsfayqnQgdFYcSt2P87sTr3Xj?=
 =?us-ascii?Q?hG0wfXPlbxbnyCC9QWPZCItw6nRhIPY/j//cF87xmkXebbNY8w0BQKgUJkKK?=
 =?us-ascii?Q?XMSjQNEGsuX78umSkI3RcDrG+VLCQR+juaxWvCwWflJcX28QHqZZs+RU/VA4?=
 =?us-ascii?Q?oeuo3X8wKWAx2bRlTFArfRRYbS3dOWyP15mTa6war1TRKGRqR6qC9fEsH5BQ?=
 =?us-ascii?Q?F16MzFlcX9Y77eWBowku8ACQlqhgvBCwkYRhDdRRKRgbl5xriaPsMWIRAwAh?=
 =?us-ascii?Q?hcZeiNclPMub75cz0xB79qTC/p5+rL4zol5KGRNNTwYH/pRX9+emSl8EvpYx?=
 =?us-ascii?Q?ry8zTIjoi9q2nIXKv38CdI3bn8MM8PP+S5TqmHWjyIsKZm7QHRIxAp45oy91?=
 =?us-ascii?Q?pGgZvn0DPIqYqLfRG/6FsYZPdVPvly2yO1+adkW6ixIl3q/tZW/3hmqmu7dS?=
 =?us-ascii?Q?Y3BfhcI50QoB54GOcdTFisQmOXusN2egIsJGtmfaV5wleizYXYGolldO4nfx?=
 =?us-ascii?Q?F8DRkfA4yCegjy07lGLjJy5IYV5xrP50BZ4M6BB8l9qQOxgAI8m/b/oIMZI6?=
 =?us-ascii?Q?JCttpfwHeSHbgxZBM88oBtQtHC/BVZO70HMz3kcIRO9RIRmaN/C9hTUNkoWn?=
 =?us-ascii?Q?LgdA3y5as9pdGP/utlnh+AzLkC+RKBkDmdNh7wIA+CwAtXQe/LG8LfNy26bq?=
 =?us-ascii?Q?86UESNZJyH6qSPtPAiVv+gIclslD9T19q+zXF4BjNt0S4uNaiNQ6WCLFH/J3?=
 =?us-ascii?Q?8uHBYORStdxRi1NTFCZclNW05uc5D7ZUBRYUh4YsfRjt3ZgMHnjforTeVRAP?=
 =?us-ascii?Q?FIgFANri+xG7hMLMyd46g7EBq+Z5qouRP+PKrXtTPBNGcZC98/TgMWijH4QH?=
 =?us-ascii?Q?h3zaRa5NLz+Vx0CawJ7q5QmAwsrpyzjuyeC98Wu1RO+zYFnCHoYIfgtK8ND2?=
 =?us-ascii?Q?OJJY3Ofl7u2nK2m02EO/ABSgNw7+0EFgosTQzIFEmGwhoL7OmeDOVKQRHFuK?=
 =?us-ascii?Q?hh+zwAY4gMkENAIZaaSNVFSICoZUyadIxQMgxJq915KViXnDoKxbkqm214iJ?=
 =?us-ascii?Q?mTotJUupxK6dVLvzPh8He/6sInva+YLSWbqTe9c3ZvrcQmni0hRTr+e4Zbjf?=
 =?us-ascii?Q?nljX2AH+m1ZFyvx/fYDgvAViiVebl5ItZxHckKePrbWARXjrwsYlBY+Jofx8?=
 =?us-ascii?Q?vf0bW8iMGRu3Iud7Io6stiRjJ7kYuDzeeMjZuMkbvCvCO7E6IUjfc4SuprTx?=
 =?us-ascii?Q?/Bv4OotVoIP/733mTsiGtywcjx/YcdsaTMyC9Zks3hlqFnpRdSUJQ4UfN4DO?=
 =?us-ascii?Q?WSYAs6YPajEYgwnljKykJstL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cd648b-e425-43bc-56d3-08d94866e133
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:34:55.2687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5az8Q+QEWmxbIJkHi55zCu07YOcMpj64MU4v6sTMhMhqZUJ+WjLWPQfWRaHUNaamZh6EOxgBUprC8PwNZh697g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 16.07.2021 15:15, Andrew Cooper wrote:
> On 15/07/2021 07:25, Jan Beulich wrote:
>> On 14.07.2021 18:17, Anthony PERARD wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -25,6 +25,9 @@ config GRANT_TABLE
>>>  config HAS_ALTERNATIVE
>>>  	bool
>>> =20
>>> +config HAS_CHECKPOLICY
>>> +	def_bool $(success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
>>> +
>> This is no different from other aspects of "Kconfig vs tool chain
>> capabilities" sent out last August to start a discussion about
>> whether we really want such. Besides J=C3=BCrgen no-one cared to reply
>> iirc, which to me means no-one really cares one way or the other.
>=20
> You know full well that upgrading Kconfig was specifically to be able to
> use this functionality, and you know full well that I firmly support
> using this mechanism, because we've had both of these arguments several
> times before.
>=20
> The absence of replies doesn't mean people agree with you, or even that
> they don't care.=C2=A0 It either means people didn't read the email, or
> didn't have time to reply, or didn't feel like wasting time rehashing
> the same arguments yet again with no hope for progress.
>=20
>=20
> If you really insist on refusing to features specifically intended for
> the improvement of our build processes, then call a vote so we can be
> done with the argument for once and for all.

I'm sorry Andrew, but this is not a way to discuss controversial items.
Back at the time you were pointing me at a discussion at a summit that
I didn't recall and hence presumably didn't attend for whatever reason.
Whatever may have been the result of such a discussion imo _has_ to be
under the precondition that no other contrary arguments arise. I do not
recall there having been spelled out up front this specific purpose of
upgrading kconfig, and even if it was spelled out, the ramifications
may not have become clear until the actual first uses were proposed.
It has to be possible to change views at such a point even for people
who did signal agreement earlier on. Not to speak of unaware ones.

Further iirc it was you who told me to start a mail thread about the
issue. Which I did. And now you say "... didn't feel like wasting time
rehashing the same arguments yet again with no hope for progress"? Can
you please point me to a place where those "same arguments" are put
down in writing, including reasons why they were either turned down or
considered of less relevance?

I can't help the feeling that when our opinions don't match you try to
silence me by whatever means you find suitable - ignoring my input,
claiming my earlier agreement, denying me any influence, etc. I'm
afraid I have to say that I don't think this is a way to run a
community project. The only two ways to get past my objections (or
really just reservations here) are to either convince me (which you
don't appear to be willing to) or to outvote me (which you haven't
tried at all so far if I'm not mistaken).

Jan


