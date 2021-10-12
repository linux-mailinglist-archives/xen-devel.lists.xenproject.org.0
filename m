Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8A42A1A5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 12:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207045.362783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEdb-00064v-KU; Tue, 12 Oct 2021 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207045.362783; Tue, 12 Oct 2021 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEdb-000625-HQ; Tue, 12 Oct 2021 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 207045;
 Tue, 12 Oct 2021 10:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maEda-00061z-J2
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 10:03:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b67bc010-2b43-11ec-811d-12813bfff9fa;
 Tue, 12 Oct 2021 10:03:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-B8rmc6vWP1mniMFo1xJqKQ-1; Tue, 12 Oct 2021 12:03:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:03:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:03:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0200.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 10:03:53 +0000
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
X-Inumbo-ID: b67bc010-2b43-11ec-811d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634033036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhL93p3rUL8EJlYUEMvVE2iZPRkSnVb0SCpcwgvrHro=;
	b=DTuwd0DsgsF+aEPuAcmSZOMoFrT52jwglrEBYKWk4UYDXyUY5dYa+s3LRJmsZW3DAgPSCm
	nXoBJ7AWaUqcTIuPL30mVhl4ur9fL7+AStFU0b2z2JrOcleirbI66q7RkM98gY5qNKWrPL
	EiFwoqf5QHMrLclq3Ot8xwPniQRj1JE=
X-MC-Unique: B8rmc6vWP1mniMFo1xJqKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcEGuqcP/FDhQQSXN5oP4oxToSkVLgAj5o71aGr3tZCfChWsOAhH3DNqQ6R1WgQ95O1NEndqBYpReH1AOABmCRwEKt1ViQKzfPCNHcsrT6a4ou/FLTdAwr936ZHnxSDUfssfdZ2rj+sdtWPtJESyZ9SALgN2KdpnKJrqchlgy2Cv3RocQBaqdSkcytdwo3dCI+IlIdTvXX6xJZZVnnH+/a2caBy1pPgxGT8gyLqP8Rvj0jRAIJgWTMww8YM4iaSWskuJbkyXkbnEcMvA17UrWaDzspyhBOQemhtEBe5WAyG5fMhZNR1bF4PwAbhdWN+6g6R/rJZ7UqPy8KR5jPbtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSelyn2GNiLeHHZsI2XBP/pqcmLhnNtXThtS2+gh2JM=;
 b=ZzHjMsUbjIxAaJliwMOXCiHmw9QISAKhPtue3augAvgjX35e6XEZCPXT9RwRJLoce3uY4hYiT86xlrrSD0yY7TZhdtBdjpBi4dpqq/9MS9E7tKnvSljqt0ZsLmBq6f+uqVNDTK2wKY9ESgBp8AiO6VsHDL5W1n8EW7RilpGrGg4GqOb2Gj5Y5gdu+l/dcLrOr8T8AvR+zKVhoTCUSRh/2i1WsdUARBLEhjPhm44YyE2o5xS4ceACiRaolyTD8VAlv92/Sd35kBlVEdrgWbcXewotcwtBsjdya42rj3qozSfZj1z1Xp12RwLwjJs3BmB509JxKcMri88zM7UExReJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
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
 <76E73DCA-1AF0-4B64-9305-6C349280A911@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <808c058a-ac40-add5-cab0-dcb9ce7e70cb@suse.com>
Date: Tue, 12 Oct 2021 12:03:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <76E73DCA-1AF0-4B64-9305-6C349280A911@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0200.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aeedf21-7dda-4c0b-c3d0-08d98d67992b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335418A354F255CB2D1BDA5B3B69@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rKNDolRKJBeoeWRKDnHViEXGhZS4psLXOQ6tha4S0PZ3WZRvqus4RQxyHAuhcN47rWlJiOH595fj6hA+r99dfe81nqm+fK9PuXVIgtOTpRtYeMlJ1O7Q7R8yzeahXBOCPcIf42/XpzLvcXWyyLmKv9S3NMTOyLeQvgnIfizFGyFYFmH90gtzy7t2brGkgmQj2ZYAFdLMJQmpbulSqKMnvuE3Upn0Z8x7QWzkrdMC0OrzaTS5PKRyseo6slL7/13g5rJMF2M7xPgd/wvvi1vqfZrQhW1UQUPfApIFRnNoEIPofB3fSD+0lEitiJE8Yn3YBn8x/vHr/1Ta/IQnDNOKKDkwaDDMrsSOnedbBGPRqcc9tGUHhHW6x6NhoMK3U1doYgH99fK42oNwJRYDyGwRlYb/KFyvuVh3NhkdsSj+zvaJXadRmGAYAWfaWG/s2LXptiKa2AZhNB5rK49BTKY+wq/uVXsx4yrYjR++eWxnsoR0HbGkBNZU6VWfuVbg6wCs7uDllqxBd+bvALwHzMem767ofM15pF0XNGmYY1Avn6NcBofOeS73Ae4Ga6SfwSS/zW/IqMtDMIgmROWG5tofhraxvhvjqbqo4K7ESrQBR1Tb+AeW/umYrExgYwAZrOyiAq1KSu5w/6/Cv1DGnEM8+iEPNv5RqKdCJiF2BoeK5nQqcQqizGjtUMJHsAzY0qIlIVQEvPAuv/aZJFnNXMgmQm5KuRaT7wbU5FLgskNHS3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(53546011)(4326008)(5660300002)(956004)(83380400001)(2616005)(316002)(6486002)(86362001)(38100700002)(8676002)(6916009)(8936002)(508600001)(66476007)(36756003)(66556008)(66946007)(26005)(31686004)(2906002)(186003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VO5+QGaYDDbtv5nwmSJ1wM/gs7CAL9X9UWszPMVafcg6XuEvgoqizuXrCICK?=
 =?us-ascii?Q?dO/GaXrwRhI8MRPECjUwd8vYATa4Z8nEXlH0RSfAhwlF2I3FYebs/8bcFSDu?=
 =?us-ascii?Q?WoMZKoKqeRiAWR59AJ1g6cRgY1M8t9/w/ZzZRMKiODwkyoqNNqOwf+BiFsIL?=
 =?us-ascii?Q?MMugHzhQvwFtKMeyqS68RIOQcMNormK7IHJHK4+p0UYjppHQGmFekhMQmg7V?=
 =?us-ascii?Q?OMbZo7bBivssp+q3Tq8F+3G6isAPEfyyGUAZCFfIaW9a6qDktOCzGBf3cd7C?=
 =?us-ascii?Q?c90U3iEKmuKtNc/htCAL8W1F+An/ua/YI/+T7XISKcKKuO2uLDmifpQQR/wj?=
 =?us-ascii?Q?rZFTabYj7h33/Mj6s3yNJ/6H7eIkFa0aIwe+a3LUoIV4q9B3L7+k/WMGtZQR?=
 =?us-ascii?Q?ZrBQ5kyNevmI4paF1n5WVmuHGF3Tip4T5HH/wAkAnUI5nq2gd7xzIdvDZtVZ?=
 =?us-ascii?Q?nd4Vg8MpTT1aPMg0PrLE728T0KPrAotPKCPg3ba9mumpagDVvQOK75zYD0++?=
 =?us-ascii?Q?4A7meuquwwrx3yMxN0PmDvZCWnz2DA1ue9M99AMkeJrUL6USkGkBjoKI/RUP?=
 =?us-ascii?Q?H6uxHU9vppru76gbz+8DkdFPug8Q66nPxEjgC5OBGwYF0Y5vWUGFjn+0wCCh?=
 =?us-ascii?Q?DB1CTX03wOAPGMnIbeA/oNlZpyz6ePluiyf62GDzOwP0Tt2DB6tIO5Iz1vdy?=
 =?us-ascii?Q?SZOabOCaJW5mo2K7NDqcSKq+0P84e9qvCQPLnRpn8hAtBB4vAeDZu72qEt7Q?=
 =?us-ascii?Q?gOVlCzZ9icDhLst7zIuUtaLgFOKAAJCjh/inqse0IYuYFOPUcDfcV8RpFsJk?=
 =?us-ascii?Q?hHY32rbzVOzwOCPY06OoYEtHwlQAXVgWm3gPmz3yBer7ARNv1rPSNYw3/xqd?=
 =?us-ascii?Q?/1wILpwhkvXSi1as1GijnrAOmoGKzJTokmHfYXULM1Gn6Ugsl6J8ogeqzfoZ?=
 =?us-ascii?Q?UGDDAzM4ojsqVjjTx8pvnm7KlBx9RhYjm16IcTF13szESaTeyOjQxXZfdN5k?=
 =?us-ascii?Q?Q/KkzCnmYipLceuruz1cx9wnnf5KgePi/AWiS4I8XLdo/gR5jAKQ8TiuzV3O?=
 =?us-ascii?Q?b2XKH3HjsAJaQagoYG55wos8xDfO2eZC3L3uoA3jNwdkeIETv6Ftbe7CefYv?=
 =?us-ascii?Q?8XZWGK9RJ9R8cmr9GR5lZJ3a/y6B+CtFTA6gt2LFfXzcAF2z/trYocM47q3Z?=
 =?us-ascii?Q?830BksPu388e8pB88ZQsmtSdH0Qn4hU7J2Gj5n4zvpoVoamY7bcAcCgFtEUW?=
 =?us-ascii?Q?GB2aG1Aa5HKUBiy2iQASjXOV/COOdq1PHvgz/dBXh3pGlPXdXiXWZcMVOus7?=
 =?us-ascii?Q?uhO7gGDcgO1aGj4g5Cud3uTp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aeedf21-7dda-4c0b-c3d0-08d98d67992b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:03:54.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDYhrMdRA6qhrDTpaR0DqK5vP4ID58PFMzPpUl2GFbZqohCbfXsfPeyZqSnz9BLh+icRWaBRLm0ekBCEM5ALEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 12.10.2021 11:40, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 12 Oct 2021, at 10:32, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.10.2021 10:41, Bertrand Marquis wrote:
>>> Hi Jan,
>>>
>>>> On 12 Oct 2021, at 09:29, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
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
>>>>>>>
>>>>>>> All our investigations and tests have been done without supporting =
it
>>>>>>> without any issues so this is not a critical feature (most devices =
can
>>>>>>> be operated without using the I/O ports).
>>>>>>
>>>>>> IMO we should let the users know they attempted to use a device with
>>>>>> BARs in the IO space, and that those BARs won't be accessible which
>>>>>> could make the device not function as expected.
>>>>>>
>>>>>> Do you think it would be reasonable to attempt the hypercall on Arm
>>>>>> also, and in case of error (on Arm) just print a warning message and
>>>>>> continue operations as normal?
>>>>>
>>>>> I think this would lead to a warning printed on lots of devices where=
 in
>>>>> fact there would be no issues.
>>>>>
>>>>> If this is an issue for a device driver because it cannot operate wit=
hout
>>>>> I/O ports, this will be raised by the driver inside the guest.
>>>>
>>>> On what basis would the driver complain? The kernel might know of
>>>> the MMIO equivalent for ports, and hence might allow the driver
>>>> to properly obtain whatever is needed to later access the ports.
>>>> Just that the port accesses then wouldn't work (possibly crashing
>>>> the guest, or making it otherwise misbehave).
>>>
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
>>
>> The minimal thing I'd suggest (or maybe you're doing this already)
>> would be to expose such BARs to the guest as r/o zero, rather than
>> letting their port nature "shine through".
>=20
> We are emulating an ECAM PCI which does not support I/O ports so I do not
> think we are (and can) expose those to guests.

I'm afraid I don't follow: What do you mean by "expose to guests" in
relation to what I've said? I did specifically suggest to hide the real
nature of such BARs, and instead surface them such that the guest would
have to conclude the BAR is actually not in use at all.

Jan


