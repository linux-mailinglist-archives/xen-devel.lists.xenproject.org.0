Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E644B518E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272140.466943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbIx-0002GE-G3; Mon, 14 Feb 2022 13:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272140.466943; Mon, 14 Feb 2022 13:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbIx-0002Dp-C4; Mon, 14 Feb 2022 13:22:11 +0000
Received: by outflank-mailman (input) for mailman id 272140;
 Mon, 14 Feb 2022 13:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbIw-0002Dj-4p
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:22:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c0a1c0d-8d99-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:22:08 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-QytLdc1NO5uGgtNaVylN7w-1; Mon, 14 Feb 2022 14:22:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3316.eurprd04.prod.outlook.com (2603:10a6:208:19::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 13:22:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:22:04 +0000
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
X-Inumbo-ID: 1c0a1c0d-8d99-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644844928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWRtGHI/S8dHaJhukNZ17wBTsp+lv3e7661CMsZcL28=;
	b=lTCDBC1ra+UKTBnFBpPt08jTiae+XV1qZrrZvpFSYj1c+VT5LrwsV1hCflJ2/zop86aRdR
	iu3xwUFytOpxvMY2UT3xS4m78ZG4gIcOu3vvEpMhNiHDhluMQyDg5u0KLs3nwkoM+Wtv4N
	M7UFy3xs08Gr/oT5OdSNRFQBCRwPJ1M=
X-MC-Unique: QytLdc1NO5uGgtNaVylN7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6vuYvZw2IodrHbt09+4OS+lpEsRiw0FV2WgKuAuQuJuLbIv+Cj0fgl40A/XH+nyHYLC2R7DUOLI3Rng3XIwg1Dvdc3oAit7towg9wZxLMHhSSh9t4VFTxZUvFNFPqfBBvppGPcg1AH7pP02EHYR7mFlL0gDtWS0QBTPaZb4r1RUiGVtqfQ82XUGFaGm8esfDIgWFLLIrhedth7jWdRXxBZaMY62XHGkiYo4DoIGXDI/Iw4W1Z2UD2pUjxy+aYYrnlIA7hWslcBC56sy3eqOXgX279nYtQCJ3VhVEYmL0bPya75QuZyPoXo485xpZDgl6U5sfPRMLyNisq0pqc6ZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zydRb0P0vZ2SfBvuiDPx/mbmRGQUZ1KeivECWm8RR8=;
 b=WbTr6F/auIDgNdSFlgka/kkPN8uEnAnbpn6rsXNPXrCX8A0HMZ42XUIvfuYCZJppUY/8WomYdIsounjWIAqz9F+H3itDwh5QAjsSriKo7qxmzQvOgXUfkIiyMMojimYbduHyT/BPWIFGAvTbTX+OCflZ/t2mtSbFAb1NCuXyLSyT9C6RMo4UECgfnHdGivJTiHVWVacMkqK9c6h4cKTa8EwRFeExLXZqdVvwFofzeCmg/M38hDhsrQo9DB0z9apQtLh8fKnmvnX1XgPkfZ03m4EutXM98qUGFkIO4ysh0vK30KqImVIievdpn43MF2gYHCHCI6hVgMVUInqxAPwDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
Date: Mon, 14 Feb 2022 14:22:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8596c3-d05a-487f-2ea3-08d9efbcfdc7
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3316:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3316463793ECC9A5FD70D48AB3339@AM0PR0402MB3316.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wc1henjc/diOf5qMJhC4DzQiAEN5fuG864+bF5lnxMSsczJxp5CVdjAUX+56pWt4lLHcuc8Hmx3g83hDWK1bUGOp4cR2h/0y9wCSFB7TnhxDzaCXBbuZPMexLjmUaUkioYycxFkMJVoDXB1qzUWm7QWNZ7Lsmc6WrhUrmf1lGo4V4Ia6np0a8dAtcI5vzW/0cCGS9uRIXmM/+QhIWWKDEF08kbiELJU4yvMdRTqOKEXbQ3pb/Iw8R3Vhqb3x2mEOuQENuxaBR8QQYZLSWFArDxNk9Z3zv/qsRQ5JiJ3+1NC8eS+pUVEPUEZcaPpxRtpn2QOQJGd22X18Bc/tvdIquLAHzrvyVxpuQXIsEKefn8rf4lbLvLSXaVWeqMR0SZAishHJR+Z+3Qt/LZevUGKar1lwNYUDe7PseLOrG89slok93KeEbRoiASn/FbcoAALz3cFtl5erPQH6O3m3ocs2KUyZlcQxybNxupJ7Y82MOr33uxoLGwZi4QMc/kzYjbRfrKGMBVDilk5skW2RRI+6Qi4DuiKWFqEMcWHLSS1JNUskjZQ5jCkiQSJlzCjM7clI+8RIuNHHCOznZK3U8bCrRD+taSGHnpDvZ9rZCt/1F90wgHnWLtfv0PZa/lBVrNw/05jAbMw3n3Q2lNhwgsCRVSV5MER4UIZMZIwd4wK4c+xgbjQQqMpGidOQcatplxz2VMCtKyLbf2zWFXuhq/jqwhqeNIjC3yZRifzgw+/4KjI0HuZYpxBPdrHOyD32hqe3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(8936002)(2616005)(6486002)(6916009)(86362001)(36756003)(316002)(2906002)(54906003)(31686004)(66946007)(53546011)(66556008)(4326008)(66476007)(8676002)(83380400001)(6512007)(38100700002)(31696002)(5660300002)(6506007)(26005)(186003)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ZIORJDwmMDit5TAdGrZmdy/HpEkB7hwFQ3msKnMHLgq+F+6iqe811gEmKGA?=
 =?us-ascii?Q?eoPpcJv+4Q/4tagSIDAVGmVP4EVGmuShSITYdF5LjRYm82/q2qoAW+by0Z3m?=
 =?us-ascii?Q?Fzg63L65pzUtGptZP1nBlaGZnrwKdLbkFXPEvaXxalGkX19SV9PMLbo9hWn+?=
 =?us-ascii?Q?6zUhmnnkvhlrJWtNK8PuQOPMEcXXVj9Es15ph+vPdTFwR+nDp8w3oDWav1+h?=
 =?us-ascii?Q?YscLMdICo2JRljIG9+6Le5982XpmHOCj/fN/Kw0MrodykOnttjcUrOeQ5SG4?=
 =?us-ascii?Q?v/YpVgQn6C7m94Fwn4x8PmuFGmj5WYfjTl3kIl8k2yAwfnoPbEEcudONwWJh?=
 =?us-ascii?Q?yYpP5zwA6vniZxhVpe0pwoG9KWOxFgtQc91NOyyCwqtKCKuVJIBPrmFlM9W8?=
 =?us-ascii?Q?suT+KyG8PvpJ8TmUgWfKvVLCRIuBJXJ1vzUX6y0BfOcEEJf/xSFGOeEWsfmH?=
 =?us-ascii?Q?Id0n4p+RfVyhiwo2y3m8Xn8eYhjBdNQF+VXGrld4woZMB5fnB11Fg0aNnX0+?=
 =?us-ascii?Q?bQk4BxaX+876vS4X44VR5WWmozc46YWhe8i4NRZOZaGlDrNnkCVNr6IWE1Sx?=
 =?us-ascii?Q?UCk6xJ6/xom0EBMlUmbkLbbDkdGoiVogsbYwYEzAXXGTXgrEMmBIb9OYMmMp?=
 =?us-ascii?Q?jy19s6TZ5BIRfduTjBU2ouhcRIu3FGi/zPvgHI/iamR0Wh5eSeqKcQWeNwqw?=
 =?us-ascii?Q?M20aIEAHf64FrIEdeVqLp6CtyEJknSi5tcazMKPqyvEvN7j0HlTQfRnjcxvs?=
 =?us-ascii?Q?fNdbYB5ORrSCkzMNutJvpz5wDxZjQVIQYjc8iygqpN5FEDnofY++IL0zXFVT?=
 =?us-ascii?Q?+a0EAKSv1KVofrpLSMBDtjpdK2Vk5zz/uGQBVWkxdeXUuzg0ycG1+cXPqDBW?=
 =?us-ascii?Q?TsVSgtCBtHwZdUewFOmFUW66KvfqWRy8UPc6PKqpnKZPlw7DIS0NgRC/LS5E?=
 =?us-ascii?Q?3boFLAXvMvEWH6tw7rftnxnT/yZhOCPDq+jKHyxDsAsC3tTM8clMDz0h/p7w?=
 =?us-ascii?Q?Qysk8Cj5rdKOw201x6gGoOuPEJw8dddmXbvr2PzmKJhrDxQsTyEPgPvhiVm9?=
 =?us-ascii?Q?d524n63oEnuQSXvqAe5Z2UXKipre+YwssWo3knFIBoYCrj97YOHgq1GyBfvp?=
 =?us-ascii?Q?RyJCeZahFGU++rXjGWB21BVZSa3dfCIULRArUAqehveKSNT4/6gjQh0wh4it?=
 =?us-ascii?Q?A7XoP7ViY6AwYJGVO4Edzrfp0O8ZpClaxnWzmPNJw48K/JnCYg4EfIqQ41DJ?=
 =?us-ascii?Q?1qZ+UusZHtRYNPyA42olEhqIM+3Yrazvuq+7DqDPjOrIU/0GjFS2pb2mCbH5?=
 =?us-ascii?Q?L/RT3z3QB7Pook2yCPWrGOZmJtKB309428SPaz9TmEpwgXkDq4lofZ4tjjRE?=
 =?us-ascii?Q?etiY03KlZpHSQv0A69XBsOX7KVL3UeoU3Ssg+S596L6ysplYvsh7ALuD3ahH?=
 =?us-ascii?Q?pPs6+s1SQKcc0Pjxgc3AZ070azHjFU10CFw2ErZLA+Gnyvw1s+IzIvE+6/S+?=
 =?us-ascii?Q?OHe0X5Amg3xkNgjF2juymDxyF7X+laLxX3HNtfFKuV6wWB22+dJkETeeBEuG?=
 =?us-ascii?Q?VxRHrwT5ZV4UH/o+Y9RRMqu5nM1B6WOwdzFP1waqt01WJv3jlkOEjcjZ0zEp?=
 =?us-ascii?Q?WKBZdg4uMduySqfTgXooiYQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8596c3-d05a-487f-2ea3-08d9efbcfdc7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:22:04.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0YbR4W6a5EQbpNq3V5GPFgqBXai6K2146zObGBtrkWLQIFU2iLFi0XI6dVuCgiJDCBtf46x/jVo6QeDsmWFKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3316

On 14.02.2022 14:13, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 14.02.22 14:57, Jan Beulich wrote:
>> On 14.02.2022 12:37, Oleksandr Andrushchenko wrote:
>>>
>>> On 14.02.22 13:25, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Feb 14, 2022 at 11:15:27AM +0000, Oleksandr Andrushchenko wrot=
e:
>>>>> On 14.02.22 13:11, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Mon, Feb 14, 2022 at 10:53:43AM +0000, Oleksandr Andrushchenko wr=
ote:
>>>>>>> On 14.02.22 12:34, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Mon, Feb 14, 2022 at 09:36:39AM +0000, Oleksandr Andrushchenko =
wrote:
>>>>>>>>> On 11.02.22 13:40, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>>> +
>>>>>>>>>>>>>            for ( i =3D 0; i < msix->max_entries; i++ )
>>>>>>>>>>>>>            {
>>>>>>>>>>>>>                const struct vpci_msix_entry *entry =3D &msix-=
>entries[i];
>>>>>>>>>>>> Since this function is now called with the per-domain rwlock r=
ead
>>>>>>>>>>>> locked it's likely not appropriate to call process_pending_sof=
tirqs
>>>>>>>>>>>> while holding such lock (check below).
>>>>>>>>>>> You are right, as it is possible that:
>>>>>>>>>>>
>>>>>>>>>>> process_pending_softirqs -> vpci_process_pending -> read_lock
>>>>>>>>>>>
>>>>>>>>>>> Even more, vpci_process_pending may also
>>>>>>>>>>>
>>>>>>>>>>> read_unlock -> vpci_remove_device -> write_lock
>>>>>>>>>>>
>>>>>>>>>>> in its error path. So, any invocation of process_pending_softir=
qs
>>>>>>>>>>> must not hold d->vpci_rwlock at least.
>>>>>>>>>>>
>>>>>>>>>>> And also we need to check that pdev->vpci was not removed
>>>>>>>>>>> in between or *re-created*
>>>>>>>>>>>> We will likely need to re-iterate over the list of pdevs assig=
ned to
>>>>>>>>>>>> the domain and assert that the pdev is still assigned to the s=
ame
>>>>>>>>>>>> domain.
>>>>>>>>>>> So, do you mean a pattern like the below should be used at all
>>>>>>>>>>> places where we need to call process_pending_softirqs?
>>>>>>>>>>>
>>>>>>>>>>> read_unlock
>>>>>>>>>>> process_pending_softirqs
>>>>>>>>>>> read_lock
>>>>>>>>>>> pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.dev=
fn);
>>>>>>>>>>> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
>>>>>>>>>>> <continue processing>
>>>>>>>>>> Something along those lines. You likely need to continue iterate=
 using
>>>>>>>>>> for_each_pdev.
>>>>>>>>> How do we tell if pdev->vpci is the same? Jan has already brought
>>>>>>>>> this question before [1] and I was about to use some ID for that =
purpose:
>>>>>>>>> pdev->vpci->id =3D d->vpci_id++ and then we use pdev->vpci->id=C2=
=A0 for checks
>>>>>>>> Given this is a debug message I would be OK with just doing the
>>>>>>>> minimal checks to prevent Xen from crashing (ie: pdev->vpci exists=
)
>>>>>>>> and that the resume MSI entry is not past the current limit. Other=
wise
>>>>>>>> just print a message and move on to the next device.
>>>>>>> Agree, I see no big issue (probably) if we are not able to print
>>>>>>>
>>>>>>> How about this one:
>>>>>>>
>>>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>>>>> index 809a6b4773e1..50373f04da82 100644
>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>> @@ -171,10 +171,31 @@ static int __init apply_map(struct domain *d,=
 const struct pci_dev *pdev,
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rangeset *mem, uint16_t cmd)
>>>>>>>     =C2=A0{
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0 struct map_data data =3D { .d =3D d, .=
map =3D true };
>>>>>>> +=C2=A0=C2=A0=C2=A0 pci_sbdf_t sbdf =3D pdev->sbdf;
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>>>>>>>
>>>>>>> + ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
>>>>>>> +
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0 while ( (rc =3D rangeset_consume_range=
s(mem, map_range, &data)) =3D=3D -ERESTART )
>>>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * process_pending=
_softirqs may trigger vpci_process_pending which
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * may need to acq=
uire pdev->domain->vpci_rwlock in read mode.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->dom=
ain->vpci_rwlock);
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pendin=
g_softirqs();
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->domai=
n->vpci_rwlock);
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Check if pdev still =
exists and vPCI was not removed or re-created. */
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pci_get_pdev_by_dom=
ain(d, sbdf.seg, sbdf.bus, sbdf.devfn) !=3D pdev)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if ( vpci is NOT the same )
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D 0;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>> +
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0 rangeset_destroy(mem);
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0 if ( !rc )
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 modify_decodin=
g(pdev, cmd, false);
>>>>>>>
>>>>>>> This one also wants process_pending_softirqs to run so it *might*
>>>>>>> want pdev and vpci checks. But at the same time apply_map runs
>>>>>>> at ( system_state < SYS_STATE_active ), so defer_map won't be
>>>>>>> running yet, thus no vpci_process_pending is possible yet (in terms
>>>>>>> it has something to do yet). So, I think we just need:
>>>>>>>
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->=
domain->vpci_rwlock);
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_soft=
irqs();
>>>>>>>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->do=
main->vpci_rwlock);
>>>>>>>
>>>>>>> and this should be enough
>>>>>> Given the context apply_map is called from (dom0 specific init code)=
,
>>>>>> there's no need to check for the pdev to still exits, or whether vpc=
i
>>>>>> has been recreated, as it's not possible. Just add a comment to
>>>>>> explicitly note that the context of the function is special, and thu=
s
>>>>>> there's no possibility of either the device or vpci going away.
>>>>> Does it really need write_unlock/write_lock given the context?...
>>>> I think it's bad practice to call process_pending_softirqs while
>>>> holding any locks. This is a very specific context so it's likely fine
>>>> to not drop the lock, but would still seem incorrect to me.
>>> Ok
>>>>> I think it doesn't as there is no chance defer_map is called, thus
>>>>> process_pending_softirqs -> vpci_process_pending -> read_lock
>>>> Indeed, there's no chance of that because process_pending_softirqs
>>>> will never try to do a scheduling operation that would result in our
>>>> context being scheduled out.
>>>   =C2=A0=C2=A0=C2=A0 while ( (rc =3D rangeset_consume_ranges(mem, map_r=
ange, &data)) =3D=3D -ERESTART )
>>>   =C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * FIXME: Given the c=
ontext apply_map is called from (dom0 specific
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * init code at syste=
m_state < SYS_STATE_active) it is not strictly
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * required that pdev=
->domain->vpci_rwlock is unlocked before calling
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * process_pending_so=
ftirqs as there is no contention possible between
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * this code and vpci=
_process_pending trying to acquire the lock in
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * read mode. But run=
ning process_pending_softirqs with any lock held
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * doesn't seem to be=
 a good practice, so drop the lock and re-acquire
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it right again.
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->domain=
->vpci_rwlock);
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_softirqs()=
;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->domain->=
vpci_rwlock);
>>>   =C2=A0=C2=A0=C2=A0 }
>> I'm afraid that's misleading at best. apply_map() is merely a specific
>> example where you know the lock is going to be taken. But really any
>> softirq handler could be acquiring any lock, so requesting to process
>> softirqs cannot ever be done with any lock held.
>>
>> What you instead want to explain is why, after re-acquiring the lock,
>> no further checking is needed for potentially changed state.
> How about:
>=20
> /*
>  =C2=A0* FIXME: Given the context apply_map is called from (dom0 specific
>  =C2=A0* init code at system_state < SYS_STATE_active) there is no conten=
tion
>  =C2=A0* possible between this code and vpci_process_pending trying to ac=
quire
>  =C2=A0* the lock in read mode and destroy pdev->vpci in its error path.
>  =C2=A0* Neither pdev may be disposed yet, so it is not required to check=
 if the
>  =C2=A0* relevant pdev still exists after re-acquiring the lock.
>  =C2=A0*/

I'm not sure I follow the first sentence; I guess a comma or two may help,
and or using "as well as" in place of one of the two "and". I also don't
think you mean contention, but rather a race between the named entities?

Jan


