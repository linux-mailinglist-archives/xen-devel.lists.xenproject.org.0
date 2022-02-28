Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79E94C6FA9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280606.478604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhAA-00007v-KN; Mon, 28 Feb 2022 14:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280606.478604; Mon, 28 Feb 2022 14:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhAA-00005D-HC; Mon, 28 Feb 2022 14:38:10 +0000
Received: by outflank-mailman (input) for mailman id 280606;
 Mon, 28 Feb 2022 14:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOhA9-000053-7u
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:38:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a21dc4a-98a4-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:38:05 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-0ASX9lpgNSeEQVB0rH4C0Q-1; Mon, 28 Feb 2022 15:38:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3569.eurprd04.prod.outlook.com (2603:10a6:208:19::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 14:38:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 14:38:04 +0000
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
X-Inumbo-ID: 0a21dc4a-98a4-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646059087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXMtB/ECejQSvXc1GC/abYioSSjm0LoFOvfzTJEEUf0=;
	b=eL2t3oVPW01dbFs6grCP+TjKfNZi9n3GWSg00QLMbbYLVDXQKxq2hGEcdbnhbZF0rD9mAl
	pYbP0OIHkJOGLMO0/ANzKqvhi+Owwn1UHvzvfVxHOUdJOHZ9aABvm0fhWBf+sy1nlxUTA6
	Q1pw24Ur2Tiv3cTGG//dOGMDP+d3sUo=
X-MC-Unique: 0ASX9lpgNSeEQVB0rH4C0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZKWZBNgg2nIE8d4u3jdNUB6hKwFh0xb3xQZdOjMX83d5GyUfiI3213ZwtAbHMFkoVTivmsHqGbGdwHd8tGzcx3WakqD3b7DVvU6Ha/szCea7XZnTfBm7FynkF1SWUW6pQ7hsuz6gz2qq/VsPYlKmMhKm6thffdPjOBtjM7EY8AjkHHj9P7Uku2phBZs8PIeqWBV+uDgfecpo71itGE9/FN0XmMvYxUHt1d5N//rez8JSGe5niXSZFO1BYfNeLZtiZeQ5IZIFLeevJJsr4EeXvRcH/rGiaxaoYYX3OiEuH0ChCFe2+e8XzEO7DZsMPBsmV2TjAzZnBrbSyOb7NB1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuLsF1Lvk7Bho76Bk7zofN0M25wY90SZ5v8n1nERvZM=;
 b=AOSTCjKItAQsLMbDIHPau1Ud47/PizPntbvTlCyMSnDfG2yJNGprCud4XToDep9phqAZdAM4gU4Y4s41y1UPg9GFDC1k+3wUNZd54uAiWret3MWnZgO20ze4GNkAy1dxbil4tErGE7YKVETqAI7egXkGtj4iBgc3zwqHlhfjK4BEmC0JaC/2IS0oLilo9k7zggltRLzqKxJIcqtFDdq/hjABn4f3vRtPbqfqMOx1kkf9MMtYfTSOtBKt74J8OC7xJvCZ/nbKd3h44OpMSIkTsaoj2+3fz7X+K0YcC5d7+U6oerJYR6r35tx9LQm5NkV48kArLjqOMu0TAd8TEY2AtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c561767d-0945-7fd8-72f7-762480d98e9f@suse.com>
Date: Mon, 28 Feb 2022 15:38:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] docs: correct x86 MCE command line option info
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <329ac1cc-85d4-7ec0-a23d-a3f68c2864f4@suse.com>
 <81337ddc-afe4-ba82-9495-3f74c53e7041@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <81337ddc-afe4-ba82-9495-3f74c53e7041@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd28f77e-c8a7-45bf-88e2-08d9fac7ed93
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3569:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3569C7DC288E922DF74BB06FB3019@AM0PR0402MB3569.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZScGGQHaXvpc61wezYxfwhs803BL0/Ee6IqOBqFYr/brRLSJRfA60nzUV7k8wymokPB80sZBEEu50cQx5OFJDAlerfCa5784idbfFson+WNEJ63oMSI52VehKeGMAGToNahTuJj7jcst7hZTDbqJccrKiv+iZntnWuzVeNuVPWa7VeYkx1crK24UjQINmIxhrrzmB2ozkbe/sVGjc6SP5ckwAQmPsH9kBMDIeeLWK4zktfDLdtsnVbaVsIvhVPCGAOZXsKrMptL3WEz8kl4g1xp6Rwg9CVZlLSZeTg+7/e4Pc+GeCUI4NsvJipX0FXQynaBi0BRw5hQtfvaTsS97VjQID0RSTz2H7LI9Fl/0VM5pZzYIUmu6yD7Z2iSx9jl4uA7VRDgqxSzg+fQPsmrhHhYMdG1E/NQvkNabvV1D2k4SwCx08Gm/WiV7kLR40iyky3IfgXUicgWnXWXKA40w62nQ3n5RAM9ls5f7YG26yj173irRghA8gB36HgKmAtzWQPgH7BDqNuIvJGrL0o3SrVIbfN/o54YAZnCKW2j1Mz2cifN85XRjRCx76YfR2ICBjnVeliFLQA0Uc7gL7sWY6wNijzc1NOQMylNtCpCQC04LSzuwKSppro89Wtyl1cQP8JietWDrdoB2DIUsDCGlYGo9yAjGuw6jz9VGJTKnVvxUS4IwugfoymHd1VLROD+xwkzMwJegYx9otL/NYiCa+Ft6dLMsIQGQpKToVbAXXBMNwkNmGmwqcPKo+jrrGfUw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(38100700002)(86362001)(66946007)(6486002)(66556008)(66476007)(508600001)(36756003)(2906002)(54906003)(8676002)(31686004)(316002)(4326008)(6916009)(31696002)(6512007)(5660300002)(2616005)(53546011)(8936002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hGse24CUs6Hc8sBmOxmJAz4cIsSCxFm8PGu3ca2UyXrqBUJgfSYXmRf62XAJ?=
 =?us-ascii?Q?WWYFfGIFiNzWBOorVYmegknc6W7Iavl12XDfXRLshkkT5rd38LCtMecaJqHI?=
 =?us-ascii?Q?sUE9WbxVg+Y/f5hvTeQ3DcHGjp7e47M12F913ixqAz4uI9Ql2N9zHtmOY+kz?=
 =?us-ascii?Q?AFbE0mFb1ZcprE3nZMnKnS5J6qMxhYXehp4N1eO4+DT8+2ixhdUp1Ne/oYnF?=
 =?us-ascii?Q?uD5l8LOPsS3QowK0IsxKEQc4+CGyVUqrXn14dVTYwmryUymbD2/tXrbDVMBb?=
 =?us-ascii?Q?2T1ZKJzZo3PObSpJLwlSZsmw2Nuevp0LtAuW6WH5TeRfS0ivnk9ZPrRoItlP?=
 =?us-ascii?Q?cxKuuoPPEPWDpcWdMnMLaC+VjIbZ4EmHlKYQ1xCInsYmc3DRUFvNrMTt7clH?=
 =?us-ascii?Q?iHZ2a11W02Ofde3tF1uBRomQ29xZ632nZiLRrDKbKPYYfDj8tKeJ7cXwv8KW?=
 =?us-ascii?Q?ZqyMgu9KXuchWAdAi+fy9UzYXoa3xhgYHIXiLZ71roEuJmTSRC+ZabWzyIsf?=
 =?us-ascii?Q?C1CzC/z7dmqi/xpUwb4ZiKxPnO2XblKojjFe+HOLQJa85j79DX7SckkGtW3c?=
 =?us-ascii?Q?N7uGD5GWtOz1gZZrMtcav46TnHiMX7UT4MOUtWmAC1AkFRAhaRbwQvQKVBM+?=
 =?us-ascii?Q?cDCS9KwbPr5lw5B80hQezObp9zGskpkqrI3w1GfC6fSajzAc3NDrRNs9uwdg?=
 =?us-ascii?Q?zHWvwabhtDo1a6XMrx6PWjm6cbm3HVAYGlwZmNrNCvPboBqaeWCYH5C/1lvI?=
 =?us-ascii?Q?7N51/JPloq08xtWxlB8IfdttmH6vCmOvVXaAE0aBm+5PL6bOnuM6NbZker33?=
 =?us-ascii?Q?PUv6yGFeme6BoRPI9jlqwBImB3C1jCU4j4ssg3AYHTSowUHdvLwer3n0NeFY?=
 =?us-ascii?Q?E6KGFClw8AsCEzgkC47gQrqa12Knz8Vt6jakr9ZDca8bIcn2avSH/ezdKpnc?=
 =?us-ascii?Q?fCG+lNrBjV/jNcJxNegWV82K0lAIRM0m+AWL11IN440Po8lvwZFasNTh4s6F?=
 =?us-ascii?Q?QHweFa1hZn/O0CL00s+1sSiXw2ZDPHls5rGpDIpC/UK/jtIKRe3XAfbYV+uP?=
 =?us-ascii?Q?PMCP1pKOf0GsJEMV6bYFZ5EPXJPxRDyBOR0Li8JfIa8JPpVKGMm2JzrCRkZk?=
 =?us-ascii?Q?6M7zfEC+m+5eMqczZ4E3U47ShpJc6+Rub0/mBzYcJrI4rg+s8AAic22NSOim?=
 =?us-ascii?Q?YtNV9UvELSsxjRHbP0ZOfqBv0a82NdbK7j1VFSmGPpvY6Cf4QrUJLVb7XtIs?=
 =?us-ascii?Q?Uhdc/bwuKQShXGwIW4rT1g/ZMm/jXeyfOsbr0tCqwWGuKVTO6eL1MVigX9li?=
 =?us-ascii?Q?mEb50h0zNACxjM8S0Kg4AfQZ6uoaFPzQRqLNzYvVbe2VRpTMnrq26xqXvh5O?=
 =?us-ascii?Q?nwDl3w3bpqqHkUy32vDcxVbEPzd0g+FZGmcjJlP9VjdyfOipxOPy/3FmsME0?=
 =?us-ascii?Q?8LZkuJCbiv3phAH5aGuiD6gPsqGs3wgtHIblEb5l17qiT94L9d8QF5ua3Fu/?=
 =?us-ascii?Q?AQ3AryAxuIQleQnZszNwW/OC2BNvI0uFPILSXE3ugXaogMoc6pvjFTukshB8?=
 =?us-ascii?Q?nRYc4VBxF34tVAW1FQOJK1JGfdwEvSdPewrhhQgKa2YWWpwTzNsWHQbgUSwu?=
 =?us-ascii?Q?67xvZYGWFL//HSx2lnohyP0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd28f77e-c8a7-45bf-88e2-08d9fac7ed93
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 14:38:04.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0x50vhuoMYaECw1QGTPC1RFdAP5eLnup0zwp60H914DyMfYXhsjrClMnRDyyIaa46qRpRGC78bJxhlzPuMxqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3569

On 28.02.2022 14:19, Andrew Cooper wrote:
> On 28/02/2022 10:20, Jan Beulich wrote:
>> Not even the types were correct,
>=20
> Huh yes.=C2=A0 c/s 97638f08f4 was plain wrong.
>=20
>>  let alone defaults being spelled out or
>> the purpose of the options actually mentioned in any way.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1681,10 +1681,21 @@ one pending bit to be allocated.
>>  Defaults to 20 bits (to cover at most 1048576 interrupts).
>> =20
>>  ### mce (x86)
>> -> `=3D <integer>`
>> +> `=3D <boolean>`
>> +
>> +> Default: `true`
>> +
>> +Allows to disable the use of Machine Check Exceptions.  Note that this
>> +may result in silent shutdown of the system in case an event occurs
>> +which would have resulted in raising a Machine Check Exception.
>=20
> This description appears backwards.=C2=A0 Errors happen irrespective of M=
CE,
> and will by default cause a system shutdown.

Of course. Would s/this/doing so/ make things more clear? It was certainly
meant that way.

> MCE offers the OS/VMM some ability to deal with certain
> not-totally-fatal errors in a less impactful way than killing the whole
> system.=C2=A0 Also, it allows reporting of corrected errors which are
> indicative of failing components.
>=20
> Also, it's not silent - the MCE registers explicitly don't clear on
> reset so they can be recovered after warm reset.=C2=A0 Firmware collects
> these and is supposed to do something useful with them, although
> "useful" is a matter of opinion, and in some cases depends on how much
> extra you're willing to pay your OEM.

It's still silent as far as Xen disappearing goes. Whether firmware
properly collects and exposes the data isn't something we ought to be
concerned of. If some _simple_ adjustment is going to meet your
approval, I'll be happy to make such an adjustment. If you suggest I
explain machine check machinery here, then I'll simply withdraw the
patch.

Jan


