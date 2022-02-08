Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1302A4AD561
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267978.461745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNXa-0000nB-LP; Tue, 08 Feb 2022 10:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267978.461745; Tue, 08 Feb 2022 10:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNXa-0000kS-Hu; Tue, 08 Feb 2022 10:16:06 +0000
Received: by outflank-mailman (input) for mailman id 267978;
 Tue, 08 Feb 2022 10:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHNXZ-0000kM-JV
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:16:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2a2f23-88c8-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:16:00 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-p8IK3daYM3qOWTIqeXyWVA-1; Tue, 08 Feb 2022 11:15:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2746.eurprd04.prod.outlook.com (2603:10a6:3:e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 10:15:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:15:57 +0000
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
X-Inumbo-ID: 1d2a2f23-88c8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644315360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtMMP43uEt9rDbzITVASwgIYRvD2R2zLaamXVRrNQ6g=;
	b=QcXVlvov9dEMm84gWBLIjQiYUDHE+FTolONiaQQxqDCaFqr2kosj50iJt31++DB3X5NH/e
	1RWNutKWqg+zjJr/0xleRNba0jmfrNwMmGIxqrNig7PbdmjcgBAggTIYpossduGsFF1C8C
	O6fsfjI9SVJ8rGzHUNho/+zxLaJDjAg=
X-MC-Unique: p8IK3daYM3qOWTIqeXyWVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZE6zwPECNvKRali87PrKL9/ByUjaECuSwLylBMxp3jZK/zeKQkOAYzgD4I7aTvo5KseT1Ppr6ByvoKuWsQr02KdTaO6uG5fMuJPn72zoI/ez4gS9NXEBCAhfq4WZ1XWIwBnWMSWxQNB18qxeyVXCjdaVh0xmFEw8BaE9E85/SSrWuSUy7oxGv7i05I896oLynC9hnGGy26aymJzpqoPcoUAONXhojWM7Gry2RMeCpCFsWkIvNqhHaemWO1P+RFgm4VMkdrHMUQG3JGHndlR8x4QwSFu9lAYC1z99OBq8aRZoaxMjvrnkZPt90WwkziE3L+NK3zgMDQHcE0Gr51A+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG8lBv/XlcZXRu5HQV2VwszfXg+gO50d+nShyxlFAVA=;
 b=gFKAArd8DvB9/A32shsEt1VeX4aDOu4YJkCoKjTjL/dTMhneNX5G1zveQxdT8aUPpWcfA696fh3PNSzP7qW6C4+oB00kitaDFGqftGgD/bkaUtJUkNDVJoMrEX/TTLLK4FofhmLukfX2xmnI/ylbnLWaw1BxnBbK1QrszQKsm898Lsc+75SSgS7Ug/e6tv56MY6HsBL9NspqyNytlm6ysLKb1FmmItaXjM49sgNcjGoV66gBCuz+34XJcpyKLNCDzPDdc4PvAgSCtWfmWj+gwnDOhzIbL2PZezpVB+r1ZbjEpuBW4BORWCEw11+OZHk+hAuW94FcmYl37l91OTZ2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41552c52-5e2e-5108-ab37-d1fb5d9b5edb@suse.com>
Date: Tue, 8 Feb 2022 11:15:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com> <YgI3HpFffudiEmNN@Air-de-Roger>
 <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
 <5bc96dba-e9b8-de2e-f6aa-ae6c604897e8@suse.com>
 <6ac5d7ce-96dd-66e1-c8d1-eff7b0a1349e@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ac5d7ce-96dd-66e1-c8d1-eff7b0a1349e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0010.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dac9786-8191-4829-caf9-08d9eaebff99
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2746:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2746F80FEB26450B02DC8A7FB32D9@HE1PR0402MB2746.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VuhZBOhQj1ioqsOLm8R2ctTUfkGkWNwVwuL0CdTVepwdgEUoezWtGxm3QgDZPaodzipsluzvgPSyE6Llu0NAvaJT4l1WM4ao68O1aklG2mW92TnZ+zkHjuGMVdaC7wn/i6QiyophiLxiBr3R52dSTuzWpMZeEwHW2dKVJ0EZfmsDsPdBLUfD+MDLtUIk6CVFV533A6YClBvfD1hMa3pHcWKk6I3/4Gsx06WbIKWH+phAKYCVozXgXMQ84EhIrbBirTZ7f/Wt78UIfeK3ntg9Ly2KgKPkRNzbYThVC7TRsonYjB4rdW3z/MiNkLuAhDtVtapE7xtRfdGmmsrIKIcCxN4Ut0pTi8ipoJYQT54czMK1LNEro6ULY88/vI4AyAYpq01yXfEM514pGG/pZq5uv5lkaVbLKSAUE7FbIAcpUNkzUUBxIH76NdHFdulW42Gko3NJM1t+t3jtuUAG9ytJFBuWBabGmA4+eoqJ2trAWM6np6CeNNPHP5V7K86HeWucjfQa8eHDMAz/j6y5bqjJfJgeqruYIUw+VuAtjWqxwcx8VPJEcxR3cw8ZfqEA9hmablxHZI2dzbvnR+4AbgXIpBg8ISkcV1ZltpY/DTvHjweesLj+ICuhBnIRda6hnP/lPq8YGVyPLd+V7bkRe357xpyGHLQ8A/UEu+VxQraDzXsMsw24PMQ6sliI2U6UoGdfQxS2tg4oSybdFmABIsrDe3DtFe6aVMMHphW2rn9gngo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(53546011)(54906003)(6916009)(316002)(508600001)(6506007)(36756003)(83380400001)(31686004)(8676002)(8936002)(186003)(26005)(2616005)(5660300002)(86362001)(2906002)(31696002)(6486002)(6512007)(7416002)(38100700002)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RpFYzSzz30fVvLo5+BPt0Bjtr8dvEXZSW5FHNKlB2vdcm9pYEhmUSm/U6PgY?=
 =?us-ascii?Q?dQQjvrsal2PEr8zUXmkpeJoHykpX0pa+66D8/gsyhO06oLwntkWTkxYuixrY?=
 =?us-ascii?Q?9SMFLkve6rqdx+BOT5v4QrxIyF+SYK00UXtO8pdeJqjMOqCQWWsbZZDMvvqU?=
 =?us-ascii?Q?cx8VLhk/dhuS4ZKzpUrIhifVdZyNRbVb2nqrEDmR7ZWdosavg7GGxlPX4eo8?=
 =?us-ascii?Q?pldD3pnuu0ra8hQ/bv/2n5UbKe9e2ifc1CrQVp+3iHw5A8X0khyoi/NTK7fl?=
 =?us-ascii?Q?vz8vf3A93VABSzeZabPXHZhw73e145ifPnrLX7bc7ZAm7XFszTPbI+gaSTDa?=
 =?us-ascii?Q?dJm87HgKGIgu9Rux3jbTqIfOyxtD68qafavs6+MmPbt8C+mb6pYZ7r5qU8fe?=
 =?us-ascii?Q?N9sjohuCEj79MzQgtKSXRPDFHpOjWfBW6cmcQnm1L0puobSC9a2jdYrM5kDs?=
 =?us-ascii?Q?ykqLSfZ53JhX9yKD+IqfjpbD6HSOp2bwRvva3szU1XjNEHBGfasvH+MpNRiN?=
 =?us-ascii?Q?JB3X3SJtZdP679/72EF1vzd13tpr7j2tu78Wt1KJjXbWJv5RQfT0uwvU/n7x?=
 =?us-ascii?Q?7fRqu+vV43b4iYfg7qj+OQ5/qY0YrhzEIBgin5TDzFvqqJ6YdUVJK44Ogprm?=
 =?us-ascii?Q?WNPGcvfyidPJmaJuX8xZx4E/7CMM7DsW3YDfbPIbhtlwebt/zQ+s6gnHSvyq?=
 =?us-ascii?Q?9GoAKOGbNUtqL/DgUbtY4KzyVAQMEM7JOu++6bjDzSc+JNiyngYvaR+9JSAx?=
 =?us-ascii?Q?gjRxsMZOMzWS5IoHEN3BCDxZ6jy/hdD5QtmnUJYCpILC4daIb+vJTsd+3G0N?=
 =?us-ascii?Q?gUq1WY7aqeVtTw5lCmwrDbLZeO2M7P9cQP6JvBql+nEtXhD2xZYm3o7Plgpq?=
 =?us-ascii?Q?REtRXMej4xmNXpgG1g8Ra10yIESwQu++aCDEJUXK7QDIKzCApGymNDKYrj++?=
 =?us-ascii?Q?Sp3wZTCcEoKQbKlyYZpiJtxpT7KYLALw3C03U/jrHqfAeTX/WxGu+F7Spk7G?=
 =?us-ascii?Q?yp5p7WpXElBFZQqSHPhhBMKPrIO5Ck5ciH9QQubaRFNAS5YqvZsm1dqaPzlj?=
 =?us-ascii?Q?ATUFGhvC5Ia7ioIgsdVoXw1eXMewBoI58eEQUdbXh63V0R8BIoQKnok1HkQe?=
 =?us-ascii?Q?SqxTPN+ITChS2Et0VxaCA0qERpCKSKYwmvzI9ENz3oYEFhPtg6Tue+2rIsBa?=
 =?us-ascii?Q?TbZBVP1Thlaur1P5NGH5UZZpij4z5ZFdQn1MRF/g4VcQWProRWqPs7duPZ/n?=
 =?us-ascii?Q?2N+EWoMCZU1VdZGV0toN3XQXid4aEqbGE6fQkfzb6FQCJCuWft3vvYhXsiXM?=
 =?us-ascii?Q?rMfDT33UbYxk9tuXaNnlZbMSr1hcLHqW9Oy9eDN8otwCkSDYtMkWSa91vPun?=
 =?us-ascii?Q?b0ZI/bsvSOLA20qXpHAPxrw5GigtCT+82qJ2Z4VtCilh4TLzhMIjzkU4xqWj?=
 =?us-ascii?Q?/UP1e/81JkFGEYtzC6s3+3i2/xb1T2tORy3AckZPsR3SplQwFu9XyaUpsQUg?=
 =?us-ascii?Q?TLR3WW3z+F1ry55qFv6Vcdc+HScNN0zVTowqZXpUrwyBYlfBjJjSLgMojA99?=
 =?us-ascii?Q?t5vweDnp6Dd29DUsseboU1yXIATESkuqU1svwgsrip2JmPTFegHMwHOIkoFw?=
 =?us-ascii?Q?SxmGVuvBLRYONHIVoq2NdAw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dac9786-8191-4829-caf9-08d9eaebff99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:15:57.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ays9u5rVHNKPS5VQIh4x1HsOrl8XqJM5dRo0Osc/8q3/bqKuAhFBEsp+zw/cmYb8Q8njxCMoA/crcPf30vdsrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2746

On 08.02.2022 10:57, Oleksandr Andrushchenko wrote:
> On 08.02.22 11:48, Jan Beulich wrote:
>> On 08.02.2022 10:31, Oleksandr Andrushchenko wrote:
>>> On 08.02.22 11:25, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, Feb 04, 2022 at 08:34:52AM +0200, Oleksandr Andrushchenko wrot=
e:
>>>>> @@ -516,6 +594,11 @@ static int init_bars(struct pci_dev *pdev)
>>>>>            if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRES=
S_SPACE_IO )
>>>>>            {
>>>>>                bars[i].type =3D VPCI_BAR_IO;
>>>>> +
>>>>> +            rc =3D bar_ignore_access(pdev, reg, &bars[i]);
>>>> This is wrong: you only want to ignore access to IO BARs for Arm, for
>>>> x86 we should keep the previous behavior. Even more if you go with
>>>> Jan's suggestions to make bar_ignore_access also applicable to dom0.
>>> How do we want this?
>>> #ifdef CONFIG_ARM?
>> Afaic better via a new, dedicated CONFIG_HAVE_* setting, which x86 selec=
ts
>> but Arm doesn't. Unless we have one already, of course ...
> Could you please be more specific on the name you see appropriate?

I'm pretty sure Linux has something similar, so I'd like to ask that
you go look there. I'm sorry to say this a little bluntly, but I'm
really in need of doing something beyond answering your mails (and
in part re-stating the same thing again and again).

> And do you realize that this is going to be a single user of such a
> setting?

Yes, but I'm not sure this is going to remain just a single use.
Furthermore every CONFIG_<arch> is problematic as soon as a new port
is being worked on. If we wanted to go with a CONFIG_<arch> here, imo
it ought to be CONFIG_X86, not CONFIG_ARM, as I/O ports are really an
x86-specific thing (which has propagated into other architectures in
more or less strange ways, but never as truly I/O ports).

Jan


