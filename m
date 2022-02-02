Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4B4A743C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264302.457354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHFI-0003qH-5D; Wed, 02 Feb 2022 15:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264302.457354; Wed, 02 Feb 2022 15:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHFI-0003nW-1x; Wed, 02 Feb 2022 15:08:32 +0000
Received: by outflank-mailman (input) for mailman id 264302;
 Wed, 02 Feb 2022 15:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFHFG-0003nN-87
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:08:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa41519b-8439-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 16:08:29 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-aPEP3yAlNtKkTk7dwbn47A-1; Wed, 02 Feb 2022 16:08:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6209.eurprd04.prod.outlook.com (2603:10a6:208:13a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 15:08:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:08:24 +0000
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
X-Inumbo-ID: fa41519b-8439-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643814508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThYbJT0IgisMLHZ/euYfCsDOZ0Y0F3i6dvBsHAQaIV4=;
	b=UVFei1x7oKXRCOfDuvXVmdbcEdeFwU/3R/I3c4jpX9K04Skyz0cA4XVLwEjYhDqBTbVimB
	WW8HLgv8CaimcdceaILrKd3D0fNYAbeYoRvSKEt8HIJEkgcE8SaJd2xbm9rg6iGLkgLVZX
	uWZaexMon332rMGonQ6QLeSOtRcqhPI=
X-MC-Unique: aPEP3yAlNtKkTk7dwbn47A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7hTUaPS16wkbiOoKK39GXFocFDiBxANUhQQs7jgKeOk9tkubPbn8/u+2uq2Yjyu3T3Ac/uEIlLsMqrN3CtIz6hDtiKnlRctKetmZYJrGsC43SOv/HnUG9WF5m4iPC212FhB0bR1LtfT4UJ/qc3qcXmPGo3ZZvhDtSVpyJ86a0BtXdHfDl9EaABa0YdV2Cw1GQH/ZRZLIPHGO1097KxmSYm5FH4/EgJa5Z5mj/uro6IMy0rszv3aPzT0+2eNa7HLE7XenNR9vpImbauvwu2mrFmHYRxHJZfEVkI3/N1r39e7/31Us/On+NBzEUUw5aidNkcGvrfWGQ/hXWzystIHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QbiUjGSTTJqOTiUgoBgq3ceIp0qh/vJbe085BXrORo=;
 b=IIdfCiLM/p7FCR9M599vBsJeCruU7pIP67sAbLsfG+p8XkV6WleFHw7bHN4fDUHGmrsjRDL0K7ErJvB78IYJA8aSl76nE0RB9On1iJLJxpk5c2DgZoIdDY/w3z8WrPrvuKpBiH8l83/LJINwElDArnPFKvfhd6jLtDDKFnpQ24AV8boV7Gcp/rKRtqFXQQw+u/PO9cYd6X7s0rOWKggwuNS9s51mc4dlER/tcmysyvb8Mt7VmEceWfupoEQ/HnpmdOTQWpeOBvUTiDhHdp+lm6HjIl/acHY8D8DbZ13KZMad/X/NU01jIiMa6WjBncsmnxanIqVDuBn4nmvGWhHZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f75acfe-bb88-5982-5f8e-04e0d1755c1a@suse.com>
Date: Wed, 2 Feb 2022 16:08:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
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
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
 <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
 <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
 <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
 <f93d4d54-a2ac-67c0-8a04-d8321b0828e5@suse.com>
 <4fb06bb7-442f-e041-ef95-daec81e1d3a0@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4fb06bb7-442f-e041-ef95-daec81e1d3a0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0088.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a20dec7-aaaf-4ef5-8388-08d9e65ddc09
X-MS-TrafficTypeDiagnostic: AM0PR04MB6209:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6209F3D3DB2FC32454DD1845B3279@AM0PR04MB6209.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DRm1KA4imnDF7At5+Yoqfv27KW5H4tZOniAKgRnnob903WhCCZrsSeSvzNKhVU6uHmXPrXCXcGhNjG0xOF+PHMvmAFlTUsJEEu1DjI9gBfmkghTE8bR4WLU1yXNGv26ETUCfgAVZvdU2evZmDL4o//CiH5nwoTLZyz5nETrmSt3u3Ki6UKfXSsaSVVHyUdbr6VzcXxmf+ZD3f+LY2ZUUDvx37O6ZkngKzy20PX70z9qlAQ7mY00M4gimvTqr8Fit8OQAGUe7XHMIFGHJKsK4RA6Kv+y5i86yIHbwJtL5HR7SFRcKQyRG0uHXvT7f3CFG8ydjz6Zphbez1a13d5MRpEBbqey5rDka3++c+roF2LC2ke9ONhciMRKYArpaWdeGLDJD+GZxPcvKUj3qQpwBj9zE67B2FzEwWfQtkFNVeHb/ONjm1uoW+zefA1v+ODl65vdLkr5DLsX8YpCnkT1tgHE2H8kVmRVZMRY7d6bW3LcBbMzNB92vXGJdbGg3Nf7PnVuptE2Vk9wBgKEpZiGACKXzux3YIMBvXCjiAiI4k/vXoyrYKsS//LEsn8OYTqwVBR7EluqyNjsY+WAOeW44yTTNQxOREGS+ar5wPuy14wS/7Gmi4oHSi5hLEnxKgsV3HzKei6V+eSBOlLVlyhh4GS1eJ+ov8q06xmnZU8gPM9NniFQgOrhZTp4v9c8iNmazGP0UcyhFJo0xicWlDQqRM1/2Tp05LJKOO6/0BemPfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(36756003)(54906003)(6916009)(2906002)(8936002)(6512007)(66476007)(66946007)(86362001)(66556008)(4326008)(38100700002)(31696002)(8676002)(508600001)(31686004)(316002)(7416002)(2616005)(5660300002)(186003)(26005)(6486002)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2C72zXBW/UK3dBBubSEs4Q8rtca9nK7WpkEVIvbFNERZ9YpxDXIKcuvXOGYX?=
 =?us-ascii?Q?DtWPwi5WNO5dNarg3wxtsq/gBd58P66DgdvVDOLyUSM3Mhd5IzVsxix1Blsg?=
 =?us-ascii?Q?KXg/dFQEkPjU5BjAX8RCuTIB2pcmQ9rLFf+iG3XksVPHkrfPf1dbVDQcAzDx?=
 =?us-ascii?Q?bOEvJflBotMJaBKbm7h4ah34kfD7mxa0tSbtXSWkDJUJ3lFb+pMtPQpqSKAc?=
 =?us-ascii?Q?jARaWLJsb0OGMiBERbiwqAXOtVxkJT4O+3n6IlE9ppntRcxqzFPC+h9jze/s?=
 =?us-ascii?Q?/GWhlN7oLITjBN4BGuHmmtmJTZa1HhgbjK/0EpRW1miwo9ckxzXuTGuKpa/G?=
 =?us-ascii?Q?afNYp29+BKnbMWrTVc6TjdVNvjeBdH7t/4BBh52OlOOcfLHwQu/LNNftn4Jb?=
 =?us-ascii?Q?szGOtlP5RynfqhSxDob87OWGZfk3wOHGg2x8iy3nglSLP6E8kTJUAe0z61P9?=
 =?us-ascii?Q?/USc5H2bn9mYVACp2vQWDSO496dlZ5cYHC3NgvtwkhsYXH6fOJ6/5wyNFNsf?=
 =?us-ascii?Q?fFv+KLvjcPW3WVtlMfV5vDTXhDuVZRR26jHsyTYAE6kCApT/+5dc056zajuf?=
 =?us-ascii?Q?gzWDKBoyVY/WvY/l+4xttIqLxheXDpwFadH6Y0/icrigiUiQzcVCt3tlTij4?=
 =?us-ascii?Q?UrRjGYhduT6EtA+jd5e319DooH5rHu6WDZZvJqb6a82JxJJcvw0yyREO67h2?=
 =?us-ascii?Q?mDK8DnEWTgleCx4wCZqknAZaIDMhSOfKSlBGKUPmMjXDqrdC6Bf74Sy7oBKS?=
 =?us-ascii?Q?pP98ChdwU4VCx8w1H3FKalAIUiHnZyaLokxTBCwbJQEWdzDfhciYcxAWtAxe?=
 =?us-ascii?Q?8E9YsZL1M/sJfw186jtSeJOCyRZjtAOasp80o1gE5yQuvHnzdNkukk6s97+c?=
 =?us-ascii?Q?5rtXq1sKQsJbDChdyxXzuLyZNREJBMq0+u/Q0MKw+ZyRPfFm6NNzQ8pW5ah5?=
 =?us-ascii?Q?vWK1s9IrSVsa6Or1ZfFTWwnIB1K24yNC0JQiW/zrciet4OosswL0a9yk9a4Q?=
 =?us-ascii?Q?jd/6+RUOoYa5/Gc/MUuA60rluXmwLu6eazo1hy4FtrwMD1q6VsJpJ/hrc0BX?=
 =?us-ascii?Q?UZC73jafcGQD3QRgwN6cF8Jj77NgMogc4/LyeXg8xSKSjYCB9l75QGr+Nwga?=
 =?us-ascii?Q?q7G5xjK3Tg5GFkkRvv6ZjnXM0ChWeaCQ6MRefUPIruATAvfbFYm8PFF6ReXL?=
 =?us-ascii?Q?/+3LRLQM2oiW1hXLbTd+JStyPkT4kWkTpMD4zGAhKDZS2u8gaQjbl/y9yKI0?=
 =?us-ascii?Q?fbZmMscmkpQ0z5UZyt0rTWRbpvVgA24SmeNFFEVHA3G1LNwV8GUTzdDj/OrI?=
 =?us-ascii?Q?7yE0yos14tBA/n5Ak7BeMvpkWwrKiVqTnRayBt3FN9mhOfdiB0sd1gga5SjE?=
 =?us-ascii?Q?Vx5EeEKRkAqccaw2Q1lTfBfR3qyY03+WaRYk7PW52vE7upFQFLGvzr+IwLG9?=
 =?us-ascii?Q?iV4ZAecijQqSMOxzu07nD1UmB6w1Ge1CCelLg/XiBt9Dv/KEkXSQO8ca9YQ2?=
 =?us-ascii?Q?D0oJZLte2ItqvTFOTclCtJ8LTAcQulQLPcyOR6d0oxQh3vbAU/XRaC4KJC4a?=
 =?us-ascii?Q?nKkzWxhztC4YSHLZLLNj95RNi3Ul1mmWkYjeSUEcsft4UY2uD6WOFW5ytjgl?=
 =?us-ascii?Q?NbuMfmORtb2gqNXH+tW5X48=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a20dec7-aaaf-4ef5-8388-08d9e65ddc09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:08:24.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4Ki6bXQok0hEVbYXo5z1Rd0/on0IFDj4UJDHo5J+YDpKoa18GOSt9ZcPPDuGxrpWh1gNBRZ4swt0kwotibFmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6209

On 02.02.2022 16:04, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 02.02.22 16:31, Jan Beulich wrote:
>> On 02.02.2022 15:26, Oleksandr Andrushchenko wrote:
>>>
>>> On 02.02.22 16:18, Jan Beulich wrote:
>>>> On 02.02.2022 14:47, Oleksandr Andrushchenko wrote:
>>>>>> On 02.02.2022 13:49, Oleksandr Andrushchenko wrote:
>>>>>>> On 13.01.22 12:50, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Thu, Nov 25, 2021 at 01:02:46PM +0200, Oleksandr Andrushchenko =
wrote:
>>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>>> @@ -491,6 +491,22 @@ static void cmd_write(const struct pci_dev *=
pdev, unsigned int reg,
>>>>>>>>>              pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>>>>>      }
>>>>>>>>>     =20
>>>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned=
 int reg,
>>>>>>>>> +                            uint32_t cmd, void *data)
>>>>>>>>> +{
>>>>>>>>> +    /* TODO: Add proper emulation for all bits of the command re=
gister. */
>>>>>>>>> +
>>>>>>>>> +#ifdef CONFIG_HAS_PCI_MSI
>>>>>>>>> +    if ( pdev->vpci->msi->enabled )
>>>>>>>> You need to check for MSI-X also, pdev->vpci->msix->enabled.
>>>>>>> Indeed, thank you
>>>>>>>>> +    {
>>>>>>>>> +        /* Guest wants to enable INTx. It can't be enabled if MS=
I/MSI-X enabled. */
>>>>>>>>> +        cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>>> You will also need to make sure PCI_COMMAND_INTX_DISABLE is set in=
 the
>>>>>>>> command register when attempting to enable MSI or MSIX capabilitie=
s.
>>>>>>> Isn't it enough that we just check above if MSI/MSI-X enabled then =
make
>>>>>>> sure INTX disabled? I am not following you here on what else needs =
to
>>>>>>> be done.
>>>>>> No, you need to deal with the potentially bad combination on both
>>>>>> paths - command register writes (here) and MSI/MSI-X control registe=
r
>>>>>> writes (which is what Roger points you at). I would like to suggest
>>>>>> to consider simply forcing INTX_DISABLE on behind the guest's back
>>>>>> for those other two paths.
>>>>> Do you suggest that we need to have some code which will
>>>>> write PCI_COMMAND while we write MSI/MSI-X control register
>>>>> for that kind of consistency? E.g. control register handler will
>>>>> need to write to PCI_COMMAND and go through emulation for
>>>>> guests?
>>>> Either check or write, yes. Since you're setting the bit here behind
>>>> the guest's back, setting it on the other paths as well would only
>>>> look consistent to me.
>>> I can't find any access to PCI_COMMAND register from vMSI/vMSI-X
>>> code, so what's the concern?
>> Again: Only one of INTX, MSI, or MSI-X may be enabled at a time.
> This is clear and I don't question that
>> This needs to be checked whenever any one of the three is about
>> to change state. Since failing config space writes isn't really
>> an option (there's no error code to hand back and raising an
>> exception is nothing real hardware would do), adjusting state to
>> be sane behind the back of the guest looks to be the least bad
>> option.
> Would it be enough if I read PCI_MSIX_FLAGS_ENABLE and
> PCI_MSI_FLAGS_ENABLE in guest_cmd_write to make a
> decision on INTX?
>=20
> On the other hand msi->enabled and msix->enabled
> already have this information if I understand the
> MSI/MSI-X code correctly.
>=20
> Or do we want some additional code in MSI/MSI-X's control_write
> functions to set INTX bit there as well?

Well, yes, this is what Roger and I have been asking you to add.

> I mean that in this guest_cmd_write handler we can only see
> if we write a consistent wrt MSI/MSI-X PCI_COMMAND value
>=20
> If we want some more checks when we alter PCI_MSIX_FLAGS_ENABLE
> and/or PCI_MSI_FLAGS_ENABLE bits, this means we need a relevant
> PCI_COMMAND write there to be added (which doesn't exist now)
> to make sure INTX bit is set.

Exactly.

Jan


