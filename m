Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FCD443F9C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220689.382051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCuE-0004oi-7Y; Wed, 03 Nov 2021 09:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220689.382051; Wed, 03 Nov 2021 09:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCuE-0004mi-4T; Wed, 03 Nov 2021 09:50:06 +0000
Received: by outflank-mailman (input) for mailman id 220689;
 Wed, 03 Nov 2021 09:50:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miCuC-0004dV-IC
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:50:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10e81fe9-e6a1-4503-9b0c-f4830c735c75;
 Wed, 03 Nov 2021 09:50:03 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-ghBE2SE0Pv2KI3VNIRpp0g-1; Wed, 03 Nov 2021 10:50:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 09:50:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 09:50:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:20b:130::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 09:49:59 +0000
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
X-Inumbo-ID: 10e81fe9-e6a1-4503-9b0c-f4830c735c75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635933002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5FNBFSQ/l0l+OX4lcD7yN00XtIzOyQcfaaR9cT4zvk=;
	b=fkn09UsyKPHo0+v8VBDnO5w6eUeyYmk4WPAQwbF1uKQ3htLgO8KMtkpefF8gt2+bQAMEwf
	1NvkLxR3UUnaW+vTF9ScpwQ4OX3yFHLmXevE1ZGUlRa7DchJGlL0c02g32wD6H5Xvq1VGr
	OTz1cfQsTtcRBCPQYF11G04MFra1LKA=
X-MC-Unique: ghBE2SE0Pv2KI3VNIRpp0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKlbRYZx7s3YyQNlPYJg9Ccaw+MvklR58d4mFsxe4tnHbLqXz7vo+Y6o987vhAzjnOZ7it0h01vpRxcQ+pnL0dP7rY6Zn5fWAoaJstfEDKc+cHEbXvTiCDaDYiB2gGD9XmylRUe4Qq3z2H9ifKDqYeaOfVmbc5JHhVBGynTmz9R3AWCABjXaFAdtKG2Kfq7+bqJrX7WIfp1rZ8k5t4YAFrnUkrLgNM15xpTDhpJI96ZGKq0J31Y5LY/U1nM94yQ38qZWBwgtryjsu2YZZixztUI2NP+Ldic9hTjU/x5hS4pKxqJdBRy2UXOA5Ya0uGqCdKvVOaJ1SA3ybvSGMDy/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koTiqmxNZcCFG3WCk9BzubXYig8pVl15Z7zSFxr4+Qs=;
 b=S7WHAEE9jlO6djEpxjMfKnvvILECYkBNTGnJEhZaYzOIU4IQegZOQ1mah3NittDR2tjlSOplHEfvCkI+IP+iAnQQql1XwjE3lXh1LR+YwJMizxLrm/Dm7nMmiqaTB4Wz5cwUvqoJSELZnkjHaA+QlHuCN6hM4Ktrz4u/9DXUCLhHxPe5L7gNaYUSvkzuaMMDcKNmHKf3IKNtsAmp+hzuXo9pIaP9EP/76aQJfa0NaVTVuFhCJiwzD1NHrkMCPYpZN7wC6JyGbs5V+JqXLzYrtrVtLAb9pxOj05Sz4L8oheIDVU8CZ0WXvhWsadbpdisp/bXujtkdd/0LVLeME1PgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
Date: Wed, 3 Nov 2021 10:49:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92bc86a4-99b9-498b-9609-08d99eaf4d2c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64794AAE6F7D31233210664DB38C9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X6m7D4P4BS30Va9HhlTQhNYvSofGvyBobc1v2Fyzb3FZwpBaH+/Areq7aikgt0XcdB6/2vDLXwKv4DswW4bENPCFFdjdQZL7YvVh63CKrxfH5jirT3PMrETmR4PKxJ7AfwuwkxGpGCnxhYDk4GqCAFp8aIK1P5/Dna+UkMQuF/xmbStOUtV/LuqT5zGp/fROmUvjbBh8+jqvOsesCKWhdEPWXLU502TWtCxjel0geM6PoMx6wg3RkyY8PRIa4rcbCoDo9bhXiI4EnDYbL/LrSeMUC3OMIughq3ahTRU5N6QPmyt/fdaESnCoIpAJCadIoEinJ/iAxOAwU+SGoz4vB7oiQqHXJPey/n8B35T05Gm2Ecey/znY5Se+XaJQgfc3h++R3dYBAzox5Y87Ua3dcHbAnQiaus4PAKt+yfxHe5KB5zq0VRDNdAD59qAglD3D8/5XHEmLtdxuHefgyrBTWCoMStt+L//pSY10+Q6TS9ohPcEKjjpk12oW7UH9PctXKZCRwXpC2SbqB7bcGcR1bm8lQCiUvA8dmlglM3ecN8t9pAk2PBajcYURtINuf6l8F5j4K2cwhGbetTMTGGVCJp2KqnzyFYkqOzcPyE4CpbY6gq6xyI7q5rQEMYDeKW6GHdh78jC/1Hg8Y8XxowtiPKEg+wK71vUArxdSwNjjp/NbCWu5Es7n2vJ1EgZFhLqdq4A0B1j9CRh2zijku4rcITMnxZf9Hvl3e/caW0Fwt6X1cg+poj8oinlnGC8uQ9sJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(5660300002)(54906003)(6486002)(86362001)(316002)(83380400001)(508600001)(66556008)(66476007)(66946007)(7416002)(4326008)(6916009)(36756003)(31696002)(16576012)(956004)(2616005)(8676002)(38100700002)(26005)(8936002)(2906002)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nTZAIl0vlB+UgsbAplBVJh9AbUWjrzqOll2qp578Vbmn478H8DvbCFJFux3t?=
 =?us-ascii?Q?jSCfGDrmeEOdzdOyNOhFxqw3ssgtn7Ic7MghuWVk2/qcXZzgmvI5trbmf+Kq?=
 =?us-ascii?Q?M3EfR3TJjVx2J8RgBmAT7EbLlDj1kg43JmBuO9dYU7clpwIwDLELziZUzcXV?=
 =?us-ascii?Q?fqO1sjBNrUBhfSttNB7JLMmzrLPeVbsbImQXUQjOCQTzh+AFjPmu7CeDT/Gd?=
 =?us-ascii?Q?slA9d1J1QZNEjJZwjiPeNz7xF8opRVcgrxzKRSp5pKHf2mbfWhPz4akpwKpv?=
 =?us-ascii?Q?uC6I3jOE+shiTVqEvOPufgOKcTj3HX7SS2rAN4lmDBHFAjfxyFHtYPvSt1h+?=
 =?us-ascii?Q?cRI40eBg6eeSLskiHudb36FL2W9ZSVs5sKGiZzXAgqpOAEbj2BKU7P45bppx?=
 =?us-ascii?Q?uIlw/WpSlrkq5CfOSuvyo5BD2DK/y2+nwolJALkVk0Ae2vuLsCOo01Ol4zK/?=
 =?us-ascii?Q?+gXSNxXkbwobjFkSwFG2iQb6iRT+ymn72iOd1VN6OurJ5O7aliy//OWNnhlm?=
 =?us-ascii?Q?bduTQ6wrOT1evz6yeTilSAX/OEoDWJXa/A3tbnNcis4eKAAXb7BJjPiTe9B9?=
 =?us-ascii?Q?sWDqk3opw/DAAgPGaVGf/RJ9nkBEvFt0r6QskuSjopqY8oQiE2kk0YspozjX?=
 =?us-ascii?Q?IHDjauOXP5wyHmGZ8bMwYW91yo0PtIEyGW8iF1t6CpttyUhTQwHqBTjTuMdF?=
 =?us-ascii?Q?UYPhG7UH03fl7C+ndw7cXrUeEJv34j+ipknpPppHXRb/j2pMiP16f01V70/4?=
 =?us-ascii?Q?IMHEeIHo60KoRhWVgAvE5xsLcWMBTOXrgDRqbXAn1md9GfvuSSdtJDq9np22?=
 =?us-ascii?Q?dsfI6ILlAO6C00NjHyOjdgOJ+QnZszVjCKT2DIzJ6PUqyFR8FdIM5HKAVINx?=
 =?us-ascii?Q?3W/Asahsr7d/6tlNegS6SjnHp1HrjwNe+S+WWEZNfBtB6kPZoeDVOhS3evAH?=
 =?us-ascii?Q?NPacXjL6c7DKhMl0ntJrtfFyewKHgMHRKJiIyRuFGK7UYNKDZ43//ywr+8JL?=
 =?us-ascii?Q?tjKNE+7LUxxhhpCV6TZJ83KKd4J3SZAKv3hnoDOVUGLik9rXedgofYYglBI1?=
 =?us-ascii?Q?smWBgCzQ1g7Ldm0RmsgN71IdfBD7GaUlhYHuboJ1gGkyPSm/0n7NcRHbyuUL?=
 =?us-ascii?Q?WXqv8SEGQ1ykbeWEtzvFPGLqL0XvmbTeDlF5yaSqFqNK7XtbCNXcI+sqYoha?=
 =?us-ascii?Q?s4dWWgaMQl1vcL9YcSq9BqPf17PLTXrcjkux7lyUZleZIqn+9GgbLH5SV8MQ?=
 =?us-ascii?Q?jo0dLknOLBTCbvGQVmvPwx3cbDg/dMjAX1dnxdGoENlOZpwVPm0T3hkLNOxL?=
 =?us-ascii?Q?RWp2sIqRtNpUMpCAhtASt4g0+z0l0HBoI3Tq+y1KyGiQvqEwX4r80KFaBoDk?=
 =?us-ascii?Q?S3JGoa/LtFLnoYrkyq748Xu7zevW8PGdk69kXmtuEdHmq5JT46AzqFmoGlDd?=
 =?us-ascii?Q?oj1KFQi+vQrV/ABzlayTQlNHztU0XZNkzxwyxJGuqPxQ0SN+57X6BYT+B0/O?=
 =?us-ascii?Q?Z9XP8peUrJGqPZ+eeKYqXuAwe+UAkmxZLLoFBBLcNs1wmzv1SK6HRueGa/X6?=
 =?us-ascii?Q?sQhMKoFMEuZlVhTAHQqsCBi1UjocElaQXMZl0W8Ph8hD26L4HDVH40sgNTyj?=
 =?us-ascii?Q?EKcFBTgFppd6xI6hGghSoas=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bc86a4-99b9-498b-9609-08d99eaf4d2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 09:50:00.1928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u87AtUsTqXX/bSFzVKMDjc3yX8rVXtdQ8Z0dCbGnLfCARH+R2ShRg8emgKXt5WVvbPJxfPrP3VZMCiPcOFcJ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 03.11.2021 10:30, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 03.11.21 11:24, Jan Beulich wrote:
>> On 03.11.2021 10:18, Oleksandr Andrushchenko wrote:
>>>
>>> On 03.11.21 11:11, Jan Beulich wrote:
>>>> On 03.11.2021 09:53, Oleksandr Andrushchenko wrote:
>>>>> On 02.11.21 16:10, Oleksandr Andrushchenko wrote:
>>>>>> On 02.11.21 15:54, Jan Beulich wrote:
>>>>>>> On 02.11.2021 12:50, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
>>>>>>>>> On 26.10.2021 12:52, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>>> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenk=
o wrote:
>>>>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>>>>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev=
 *pdev, unsigned int reg,
>>>>>>>>>>>              pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>>>>>>>      }
>>>>>>>>>>>     =20
>>>>>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsign=
ed int reg,
>>>>>>>>>>> +                            uint32_t cmd, void *data)
>>>>>>>>>>> +{
>>>>>>>>>>> +    /* TODO: Add proper emulation for all bits of the command =
register. */
>>>>>>>>>>> +
>>>>>>>>>>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) =3D=3D 0 )
>>>>>>>>>>> +    {
>>>>>>>>>>> +        /*
>>>>>>>>>>> +         * Guest wants to enable INTx. It can't be enabled if:
>>>>>>>>>>> +         *  - host has INTx disabled
>>>>>>>>>>> +         *  - MSI/MSI-X enabled
>>>>>>>>>>> +         */
>>>>>>>>>>> +        if ( pdev->vpci->msi->enabled )
>>>>>>>>>>> +            cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>>>>>> +        else
>>>>>>>>>>> +        {
>>>>>>>>>>> +            uint16_t current_cmd =3D pci_conf_read16(pdev->sbd=
f, reg);
>>>>>>>>>>> +
>>>>>>>>>>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>>>>>>>>>>> +                cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>>>>>> +        }
>>>>>>>>>> This last part should be Arm specific. On other architectures we
>>>>>>>>>> likely want the guest to modify INTx disable in order to select =
the
>>>>>>>>>> interrupt delivery mode for the device.
>>>>>>>>> We cannot allow a guest to clear the bit when it has MSI / MSI-X
>>>>>>>>> enabled - only one of the three is supposed to be active at a tim=
e.
>>>>>>>>> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
>>>>>>>>> the bit is clear.)
>>>>>>>> Sure, but this code is making the bit sticky, by not allowing
>>>>>>>> INTX_DISABLE to be cleared once set. We do not want that behavior =
on
>>>>>>>> x86, as a guest can decide to use MSI or INTx. The else branch nee=
ds
>>>>>>>> to be Arm only.
>>>>>>> Isn't the "else" part questionable even on Arm?
>>>>>> It is. Once fixed I can't see anything Arm specific here
>>>>> Well, I have looked at the code one more time and everything seems to
>>>>> be ok wrt that sticky bit: we have 2 handlers which are cmd_write and
>>>>> guest_cmd_write. The former is used for the hardware domain and has
>>>>> *no restrictions* on writing PCI_COMMAND register contents and the la=
ter
>>>>> is only used for guests and which does have restrictions applied in
>>>>> emulate_cmd_reg function.
>>>>>
>>>>> So, for the hardware domain, there is no "sticky" bit possible and fo=
r the
>>>>> guest domains if the physical contents of the PCI_COMMAND register
>>>>> has PCI_COMMAND_INTX_DISABLE bit set then the guest is enforced to
>>>>> use PCI_COMMAND_INTX_DISABLE bit set.
>>>>>
>>>>> So, from hardware domain POV, this should not be a problem, but from
>>>>> guests view it can. Let's imagine that the hardware domain can handle
>>>>> all types of interrupts, e.g. INTx, MSI, MSI-X. In this case the hard=
ware
>>>>> domain can decide what can be used for the interrupt source (again, n=
o
>>>>> restriction here) and program PCI_COMMAND accordingly.
>>>>> Guest domains need to align with this configuration, e.g. if INTx was=
 disabled
>>>>> by the hardware domain then INTx cannot be enabled for guests
>>>> Why? It's the DomU that's in control of the device, so it ought to
>>>> be able to pick any of the three. I don't think Dom0 is involved in
>>>> handling of interrupts from the device, and hence its own "dislike"
>>>> of INTx ought to only extend to the period of time where Dom0 is
>>>> controlling the device. This would be different if Xen's view was
>>>> different, but as we seem to agree Xen's role here is solely to
>>>> prevent invalid combinations getting established in hardware.
>>> On top of a PCI device there is a physical host bridge and
>>> physical bus topology which may impose restrictions from
>>> Dom0 POV on that particular device.
>> Well, such physical restrictions may mean INTx doesn't actually work,
>> but this won't mean the DomU isn't free in choosing the bit's setting.
>> The bit merely controls whether the device is allowed to assert its
>> interrupt pin. Hence ...
>>
>>> So, every PCI device
>>> being passed through to a DomU may have different INTx
>>> settings which do depend on Dom0 in our case.
>> ... I'm still unconvinced of this.
> Ok, so I can accept any suggestion how to solve this. It seems that
> we already have number of no go scenarios here, but still it is not
> clear to me what could be an acceptable approach here. Namely:
> what do we do with INTx bit for guests?
> 1. I can leave it as is in the patch
> 2. I can remove INTx emulation and let the guest decide and program INTx
> 3. What else can I do?

Aiui you want to prevent the guest from clearing the bit if either
MSI or MSI-X are in use. Symmetrically, when the guest enables MSI
or MSI-X, you will want to force the bit set (which may well be in
a separate, future patch).

Jan


