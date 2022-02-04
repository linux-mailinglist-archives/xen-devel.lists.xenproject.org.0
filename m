Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4864A9880
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 12:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265418.458789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwtu-0005VT-OL; Fri, 04 Feb 2022 11:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265418.458789; Fri, 04 Feb 2022 11:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwtu-0005T3-K1; Fri, 04 Feb 2022 11:37:14 +0000
Received: by outflank-mailman (input) for mailman id 265418;
 Fri, 04 Feb 2022 11:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFwts-0005Sx-Rq
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 11:37:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca5e1d0d-85ae-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 12:37:11 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-YSoHxWp9P7KZC_fa278jDQ-1; Fri, 04 Feb 2022 12:37:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4515.eurprd04.prod.outlook.com (2603:10a6:208:73::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 11:37:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 11:37:07 +0000
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
X-Inumbo-ID: ca5e1d0d-85ae-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643974631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQwlyvf6XjFD3j6fojG1vICJyJSoRJD+Dfh7xgy54P4=;
	b=SoGeibtWj37i1K8nlGXgzdt9PJUuYzgyFdCaeTBwRopenuSQysGHbvz9taoNBxVZGDAoEc
	PTdV2y3t9GSvAR8g7lYPOGcnJlOQHD8VRz64YMesHrosN2n2/tlWYGyq58JRqnx3xZqGnj
	8Zn0xloff90e7OcFJExmqsFAvNvDPv4=
X-MC-Unique: YSoHxWp9P7KZC_fa278jDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeXNQRFEy9lvWr46W/o7DVGwc8NisRpw666PyvfK+W+M5YYwCSUAVWYA0d6mTOtLkpK6BBYLy9nSBDVso0vKZM/2+HkVbObfPvprZm540Xkv7bHxr030P3uzaW6SStzZ2ky9z1RuK2IVX6bGNNQfCm55E1L0lhOapkjLo0LpnSGOk4RazXZDXeMwrOLJeqhrg7Rc0Q1Rj/jaN1pDqQl/y9+CGZ51BnVdU1/hMdFG4+n71FLCYWYORO838iNpIb+UmFTVNDGh43hsbmYlToMTrBf0FMj+L33fYx8vmXCKWnOlDDC2qdaebpbkqJ8SNvsuCvQv+CdxeBSljTk5Bk0MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF+ThDdIkkupSWOHcKjIDlSVm45Gaif1tf+fVYM+suU=;
 b=MVa6Cp7WB3vpBruLfPXHKQ5uIVgMXsP+TL2NyCAzAc3uVulrDMolPlcl/etr2yIKeKlBFiEux1TEJJMxbKpGLpDdFhHCiLl88rdDSdU/f7BVOc2N9LMH1vUSw6ibqfoJV/eL0XqXkX5PEYvB6vvjgiP8+20EHhHf4OizXOmpNxjWSjKWrnQl2lZQ2LQ1zrorfIfHoxVnnVYPNOstyLH71oC2LIPBDj7EPdbhfpBIovyuALQY2qux1HOhNj5W/o5XisM3ezCJySVOfkfV1VVq5VTaIw0ZHl0uBSXnK+oFj0rzLfWaR10oqnCXqCSLHlV0cNdadkN3QBcWPT1AZB4x0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
Date: Fri, 4 Feb 2022 12:37:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yf0KcVD8W05A4fbB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0040.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99547a1d-9f66-453b-97c8-08d9e7d2aca4
X-MS-TrafficTypeDiagnostic: AM0PR04MB4515:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4515911191A1CB3D2C2C78B7B3299@AM0PR04MB4515.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+hEOK6wpe4cv7IxoDTB2C314xTpbgAToNEJJRpGE0GQEKxRX3wcmRdZMICHhLiq0/5U/hEvBNVEz73UcheV2GaFLS/GIx9KGZciy2CmA1DRI7Fo8M7kPwuPeO8pQ6mDEH9ungYu6WGGNYaZQxTrIkln+BWXqdxxc4wGwoG4M6cjH6E4SnYczou/WChB9faHgqu8/FE78pTZKMNK/Hq9zvhUHuWtn2efqQ/05e5MAUNr/RrIrEyZAW00G5RkxamFjrb+xCdtpr5da9gEZRP0bAkTtDKP+pUFVRQ+JDn0gYvWDuHa3AmLyyzjkdz6k7PNnwrw3/ILYpRzJrcUF5uDMdc4GzIPm3O68w9jKrUffeyCZ/y2Z7if3pgBA68WEa9TwORsCfOmQGPa9SK4Ip6p0FSe0PgPNY8HAG8QIw4Gp7A0y2PgNA953xcBeejoVYY6E5M+ZFQeClosoa7s7hWIjdNkrnHpTlM0I++Hc3k/2LUqNQ3xxp9QsaAMY2Ixuv65ZoNUeyCYtHk85aUsQPU3Fwv+iANMBFNQO/9Pz5n3r4HvFctKC7ewA5Hzs4jkXC8eGrUnSbunQwkkf+sHXyUJsdWtQ0G8+BbZGSRzmeNA5b56MtsXMPqVztHxLmkMDpjJQBrqdNeRjCrcQMpZRwL6u89AE2LVWSli4NdbFTPG6PjjSFzEB3obOWxRlbw5H7ak6eNPghnZP8erwP9Ab5QCEeU9dM8X1A3jGkyee43FO0T0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31686004)(31696002)(38100700002)(54906003)(6916009)(508600001)(316002)(6486002)(6512007)(8676002)(5660300002)(7416002)(66946007)(4326008)(66556008)(2906002)(83380400001)(8936002)(66476007)(53546011)(6506007)(2616005)(186003)(36756003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SqarcV65cGFUeNUqbwmwuXGxwZU8Cj6xxLd051zsE47ZMsUD34IWb3qHgjBn?=
 =?us-ascii?Q?cq/9AeogOHN2OnrYEECrT5CYKyJKDHts6a9l3ZEbB7O0/JKovN7vNSCrOSby?=
 =?us-ascii?Q?OFJmR/FdZId7vzGFoJJplToO9PFGS5xTUEFmDqBux52ILtMWwe1mjkYvd3sP?=
 =?us-ascii?Q?HQEmIEXM9A2ydPt5LJmn1kwsmoabEE3n5VZzPU5D1vkxk8cdyQsRlnRa9ZbT?=
 =?us-ascii?Q?Ilj7ZFk/4yiwhRROt7rKxap3Z9EaV1qMXjbwqiv9DXOPq07uHaPzHZdKlTj2?=
 =?us-ascii?Q?AO1/wR4aeEQNbc9DU+zhtuCZR8hhVeW6Gh+eq6EEebUGuT0mv1d+1OOgOODM?=
 =?us-ascii?Q?DCgqSN0DnJtWX5wnGVn3tqkfTOWz6RmvqJrZAjDfChX4Booiuv6aUPg7JLbm?=
 =?us-ascii?Q?XiW6S8u27OaoBlsMxhgoLYT7+oQZAVy+Vcb4vy0V7zvyST6a1WZWqRDFCsJq?=
 =?us-ascii?Q?NXajVHyhcT9OTolxPEisyB3ca70+85riOodgpsOGPmWTQY4/CR8/dqG/0Ubi?=
 =?us-ascii?Q?+gDcYhP/pWACKfEohghlwFv/XfeXg01GWcxtnXIb0582e+SlNGvFtDhZ28rQ?=
 =?us-ascii?Q?XVlAvB2QZ8ucbiXXp1PS0CXEkDwDefwewLPjHAtIUgtdFdFxnlXKdVTbuiFF?=
 =?us-ascii?Q?QCH/3VA9UEAl4Kjwb46+5c2puLFMDBAasS5VBAq4zYSMx0JUj/ajENyi3oNq?=
 =?us-ascii?Q?YmjMVs3cBN8D2QxB3jGiBGgymOQwsL2DUR9Y7h9ARZH4qgb8JTUxRCYuvA2b?=
 =?us-ascii?Q?aiPLq7t9h4b565k0z+5OsMV2PUrpz3dNK6bGBXOBYq5cmfuRP0teAPZgGtIS?=
 =?us-ascii?Q?ZEg1qJ8cXK8+kzVpWPo9wD0F4JzvS6M7H/XwhZbd3oB8W/N/MFQNgELf97Tl?=
 =?us-ascii?Q?3vPyHUtoRCyg3HQu7MNVECAnO735hjDRv8MtlZxWJEg+Nb+iKD1v6WAaktD4?=
 =?us-ascii?Q?kzFFEzhrJacVSPxr/9eW7Yxf3IoN0Sg1rTIVX2SFvIkl021JolRUHSAsGGuG?=
 =?us-ascii?Q?Vm2NTT0MxrP3bEErcstEcAeHlbpy7+nPWx7zk6XQcbdq9FEYde0QcnwjBF7s?=
 =?us-ascii?Q?LxOh7wajUfbJL33ErXMjovpXBQU4qyQ5uZXKLWxiH9b/mY/xyW5n6aQVpWPI?=
 =?us-ascii?Q?eT+ayLP3zIfvQrz9jVaZTt2e6EN/wxCta46qugY/9z7UjL0C7KoaNaaFmYUl?=
 =?us-ascii?Q?cILz+O2RK2BNDe35+k2J8yYcq7qKs2gih0VuWzs+s/DDpQxH1DmnroocNds0?=
 =?us-ascii?Q?gHYtiQCgj2Ad/lMDGwLWbKE7HMiWNLi5ncmoy3fBjDO8Apadpo0uE7zmmZII?=
 =?us-ascii?Q?+LNjAV5yWTQUDEuOyd+1wK3y0kjN7jGjioo/zqcZwhoTjgmxwm6GeEHShRcb?=
 =?us-ascii?Q?FJAFnFBML4pyTfTpuXSPEIKlt6DAFHiCEPY2L74ftjcPIXPlhgLgquXYaXp1?=
 =?us-ascii?Q?BnuwcChmmfnVD7vCqjed82PRikLaj4LeKQANe7LMCtiMBEDAfVUWBrAXu1zp?=
 =?us-ascii?Q?dh1gFG8cJ5FFq+P0inMdCvCO66ebaH296wxZEnAzgx85Mu54n6G5RU1HDKD7?=
 =?us-ascii?Q?yQY9RaUgNhRixF/LjG1u2xPD73SZn7nwgSgV2HH77ISYu9ge5zQkbJ3GwReC?=
 =?us-ascii?Q?bVSgAWaksj3cbv8XQl1pkQ0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99547a1d-9f66-453b-97c8-08d9e7d2aca4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 11:37:07.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4RWAXorDN2IHb00Kce+udeClTFBTU1lgT3E9sSqIwfd9NKE02UwZwv4LqF/bQ3OGt22JJqUyRMynMTni//xgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4515

On 04.02.2022 12:13, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
>> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
>>> On 04.02.22 11:15, Jan Beulich wrote:
>>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
>>>>> On 04.02.22 09:52, Jan Beulich wrote:
>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *p=
dev, uint16_t cmd, bool rom_only)
>>>>>>>                    continue;
>>>>>>>            }
>>>>>>>   =20
>>>>>>> +        spin_lock(&tmp->vpci_lock);
>>>>>>> +        if ( !tmp->vpci )
>>>>>>> +        {
>>>>>>> +            spin_unlock(&tmp->vpci_lock);
>>>>>>> +            continue;
>>>>>>> +        }
>>>>>>>            for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i=
++ )
>>>>>>>            {
>>>>>>>                const struct vpci_bar *bar =3D &tmp->vpci->header.ba=
rs[i];
>>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *=
pdev, uint16_t cmd, bool rom_only)
>>>>>>>                rc =3D rangeset_remove_range(mem, start, end);
>>>>>>>                if ( rc )
>>>>>>>                {
>>>>>>> +                spin_unlock(&tmp->vpci_lock);
>>>>>>>                    printk(XENLOG_G_WARNING "Failed to remove [%lx, =
%lx]: %d\n",
>>>>>>>                           start, end, rc);
>>>>>>>                    rangeset_destroy(mem);
>>>>>>>                    return rc;
>>>>>>>                }
>>>>>>>            }
>>>>>>> +        spin_unlock(&tmp->vpci_lock);
>>>>>>>        }
>>>>>> At the first glance this simply looks like another unjustified (in t=
he
>>>>>> description) change, as you're not converting anything here but you
>>>>>> actually add locking (and I realize this was there before, so I'm so=
rry
>>>>>> for not pointing this out earlier).
>>>>> Well, I thought that the description already has "...the lock can be
>>>>> used (and in a few cases is used right away) to check whether vpci
>>>>> is present" and this is enough for such uses as here.
>>>>>>    But then I wonder whether you
>>>>>> actually tested this, since I can't help getting the impression that
>>>>>> you're introducing a live-lock: The function is called from cmd_writ=
e()
>>>>>> and rom_write(), which in turn are called out of vpci_write(). Yet t=
hat
>>>>>> function already holds the lock, and the lock is not (currently)
>>>>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
>>>>>> the locking looks to be entirely unnecessary.)
>>>>> Well, you are correct: if tmp !=3D pdev then it is correct to acquire
>>>>> the lock. But if tmp =3D=3D pdev and rom_only =3D=3D true
>>>>> then we'll deadlock.
>>>>>
>>>>> It seems we need to have the locking conditional, e.g. only lock
>>>>> if tmp !=3D pdev
>>>> Which will address the live-lock, but introduce ABBA deadlock potentia=
l
>>>> between the two locks.
>>> I am not sure I can suggest a better solution here
>>> @Roger, @Jan, could you please help here?
>>
>> Well, first of all I'd like to mention that while it may have been okay =
to
>> not hold pcidevs_lock here for Dom0, it surely needs acquiring when deal=
ing
>> with DomU-s' lists of PCI devices. The requirement really applies to the
>> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
>> there it probably wants to be a try-lock.
>>
>> Next I'd like to point out that here we have the still pending issue of
>> how to deal with hidden devices, which Dom0 can access. See my RFC patch
>> "vPCI: account for hidden devices in modify_bars()". Whatever the soluti=
on
>> here, I think it wants to at least account for the extra need there.
>=20
> Yes, sorry, I should take care of that.
>=20
>> Now it is quite clear that pcidevs_lock isn't going to help with avoidin=
g
>> the deadlock, as it's imo not an option at all to acquire that lock
>> everywhere else you access ->vpci (or else the vpci lock itself would be
>> pointless). But a per-domain auxiliary r/w lock may help: Other paths
>> would acquire it in read mode, and here you'd acquire it in write mode (=
in
>> the former case around the vpci lock, while in the latter case there may
>> then not be any need to acquire the individual vpci locks at all). FTAOD=
:
>> I haven't fully thought through all implications (and hence whether this=
 is
>> viable in the first place); I expect you will, documenting what you've
>> found in the resulting patch description. Of course the double lock
>> acquire/release would then likely want hiding in helper functions.
>=20
> I've been also thinking about this, and whether it's really worth to
> have a per-device lock rather than a per-domain one that protects all
> vpci regions of the devices assigned to the domain.
>=20
> The OS is likely to serialize accesses to the PCI config space anyway,
> and the only place I could see a benefit of having per-device locks is
> in the handling of MSI-X tables, as the handling of the mask bit is
> likely very performance sensitive, so adding a per-domain lock there
> could be a bottleneck.

Hmm, with method 1 accesses serializing globally is basically
unavoidable, but with MMCFG I see no reason why OSes may not (move
to) permit(ting) parallel accesses, with serialization perhaps done
only at device level. See our own pci_config_lock, which applies to
only method 1 accesses; we don't look to be serializing MMCFG
accesses at all.

> We could alternatively do a per-domain rwlock for vpci and special case
> the MSI-X area to also have a per-device specific lock. At which point
> it becomes fairly similar to what you propose.

Indeed.

Jan


