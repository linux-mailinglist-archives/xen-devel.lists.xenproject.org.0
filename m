Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03E458A76
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228628.395671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4bI-0006FM-I4; Mon, 22 Nov 2021 08:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228628.395671; Mon, 22 Nov 2021 08:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4bI-0006CV-EJ; Mon, 22 Nov 2021 08:22:56 +0000
Received: by outflank-mailman (input) for mailman id 228628;
 Mon, 22 Nov 2021 08:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4bG-0006CP-F1
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:22:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6343edcd-4b6d-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 09:22:53 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-WqWxDfYIO5aFcL0qvhAUbA-1; Mon, 22 Nov 2021 09:22:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 08:22:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:22:49 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 08:22:48 +0000
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
X-Inumbo-ID: 6343edcd-4b6d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637569373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INHgGKvZ7J9BqoOIY2LizWK5P3dRIRX3ASzUaxhZbh8=;
	b=nGJJUHZnHLBW5a1XjwWAAYn6HhOM1AVjyLzuk0+cyZ+wL935/u65fl27yqpmKZbghwxv1v
	Ii6k1Fv7bFPkXY+zWt2QkUec8ir0Sxnb58KM6rdQuvKNXMxO1sal1XOdMbzow+7Dd41lB7
	LdUT/AnQLbACjyx+1K+a3kT4/0r7loQ=
X-MC-Unique: WqWxDfYIO5aFcL0qvhAUbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEt62aeM9TeXKzjrQrin8VYFspvhideG5GhftSN8e9KM3Uin86peGsoLhADNE2CCxIFevgUk7Zc26j4gNG9LH5wadBFlxCy1ky17BwuCx+Vi9p1BZDumW3AudJMejeY1EMVxuWN5lUcYhifOPPiFgbqLGL1uKoRfx50DD9GW4hsTwiP2+X71rGeYr8GZzARR+93a1GMICBmJEKkoOcIDJMJ6PoTUfqtGvsab+k8G5yZTsiJUYO3fvuRWSHXGrkSb/rLMkN3K3UWVpJeX9BS63S5PrCkctt2FD34KIQD/xPZ47U6mRAalWihXXH0m1lzp3qjzDNJLnWKrnmjk95pDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkls5gk1OntpBnh9GGUvdUQ/dDwH8A2O4xU39BjMyjs=;
 b=VLEri8R0XwLPxPLSGlVim2fHrDutp+mY8aLLZOs4/WZlavVrmLJBy1PvWCV0BJRK8A6ceQMuNS+8EySF4V8u0wLjA4a8x1ga/9xfH76GWPXZVTwP1khjSFbnfqKIEfVmQLjP5rsNVo+Ma15SuWRMax32lEORbHyZYy1Ql95Uk7yTmqOJjORMyTXmY2FvKwuFue0AoTOGZHrI/TOiK8XA++Zbga3dACtQ3oyO2E5KAdUzEW78BpPoL6dAPjJojyd9x6r0VGcFm6QtsT8+VUhc/b4lc0k5R7mLQoFasQvXb10faeWULqiqjCJ0ODCnrwVaYm7Eeg1qr93NoAqMEHqerA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11c3903b-ac7d-47fe-159c-a960fc9998d8@suse.com>
Date: Mon, 22 Nov 2021 09:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, julien@xen.org,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
 <YZezXShKi1ofH5Aq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZezXShKi1ofH5Aq@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bf35c7e-2c4a-474e-7d57-08d9ad914568
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863C5C818CD7F505BFD46B7B39F9@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q80Zw5ikmas6FVBkazn9Gj0sEbKy19o9aOE+fWopalxr5sNZQNAOUn8gn0jjTs8dGhFjq7DHlKnKG5ujrfW04MLjB+jAZzbiRGHsyxBoc77w8bOyWFmkOL6rcgVNRVXvwJHE3UHyREQPAeYvaszXsm4K7TUzVVqv5Qu4XSD0eGzS1E2x9TBwCoHEkbNzntFDMjY/Dcj9EX8ChT6/SZDjq6DL7GP67sPH7p5Avi12JtwCl9ZxCDjvw8JL9DzJ+iev3tcJnsYciqXPOsBIhbeWMUM2eqx2qOyW6h0b2C1BU/rdHbHJc3RKt/5Cz6kdkHOha7mvRqMKPijSWetCUTI+ay1+TE1G9eectyeirIonPEgM38VekC+rjB3OiLNhp281pdJ0xVdqfAUoqucUCFRw49qdvkEBAb4C0VXi9UODU5XXBsNFZAZ+i0FYmDAMJlZ0Wygi9KiieTL7awAG5omhjKCXNYq2oxRQ90xlggQi1TJnjhe0XFVN1seiDgvuhgavmk/BtHHPUo3nBMVzq+XHsREYbd7UXOwmocj7fA+oURc38DBzFIKoBC0RPPyuNcozaEUWZBCDtHLLsA5HamDW6Hv5eSCP+y7t5vm6rwEmaDpu/8zMRXiNwsyoLB9L3DQCvwGQPgF0O8XCX1uXoLR44OiictJJ6K5DD97X+H9XDkZgAUKt4INCjTzqYJh6wwuFhQv5eSggFRMev5EcDyeRnEnZuNd0COGdaHnIrVb3La/1JDLqCDfAFxoknUfJep+66GkqNN8h7iimzxX27ozhTKUNBx7BV4Hdlzg6+b4YB3JatcbrmzxbcUDBVI7NWvQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(38100700002)(966005)(5660300002)(2906002)(36756003)(86362001)(31686004)(6486002)(31696002)(4326008)(2616005)(66476007)(66946007)(83380400001)(186003)(110136005)(7416002)(8676002)(8936002)(316002)(66556008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1h8KjYE/KyIgciDaCbYpXWvJ9G71fYUpgmA3y8cM9DygiLI5qqjjBZkGQqSG?=
 =?us-ascii?Q?DEeiz/+lbNvPeGhYTPMD7QhMb9/7ejYixl1Hro6KMLqZ3euKfGETPUgE2Wzw?=
 =?us-ascii?Q?rPntIOdcu1ibXb4JSrvafRlZi3b8eE/dUQIFE9BBT1aimKpFzmSawazi/WUn?=
 =?us-ascii?Q?EBIe0yFVsZxMLq4FEVC4dF+W+w6WQWH8VWpVwk+K6S0Xy/BNH6fBxuc6aAbS?=
 =?us-ascii?Q?BpLCiX5uthwJK6cMZT/la+a/NjGEKdZF40vOaU79J9ycHTlVxbegh4ZtweLn?=
 =?us-ascii?Q?IGth8446DiNjPsZ7uugweRtkm9Ip0Lj1nbn1EF2X0xejvp2mM4LU4Lc1CV2f?=
 =?us-ascii?Q?08hJ+F39TiTVwC4HA4evxwgw+80AiCbnJB2MzCm2KggYtNEnj/aL7NUwKOEC?=
 =?us-ascii?Q?m9y6OAkeBvhSAlcEPkbQqUJv8BmPHejD25tphyKEnFiBpUJdwQKTtM6IDgGe?=
 =?us-ascii?Q?PmCzAa3D0LM6z1KVzpeaejWg7y8aaE3Yhep9wJXsRmoq0e2AMM2FSOsk79pe?=
 =?us-ascii?Q?2JgJlT2gHQW3xB9f3d3E8gdozwCfQJ4mTNDX/CLHSsuWtvHLi66IVOWPiedc?=
 =?us-ascii?Q?7Dp9otKb8XtQh9xuXy2ICcArE3NwvybovrY9G5m7KYXRPn1kzz9ty85lI1nj?=
 =?us-ascii?Q?SCc2yJLNrphr+pvaUP+IPqt5KqBF6m+2YxzT0tvPsf0yMIqdUPLNd4LBrRVB?=
 =?us-ascii?Q?A5PTy0yX1Yw57RRl7q3oJ1zGqt70Fa3LfXKBzxfu9HD1nHxY54wTtttAE61f?=
 =?us-ascii?Q?Ba9HmCGzsvAjDofSZcoRPlRs0SzWg5nCNWN5sYOvFJaxTqoogE4+muKR8JuM?=
 =?us-ascii?Q?WmmD9agUCZ1Y+L6LzyFHs6p8ak1KrC378V4G3QDM1Wo7FLEC63JiJOk7CyCG?=
 =?us-ascii?Q?Xb/oW+LadgDgm1sHWKGKKJONPM2EmayC9lryar4IPb0aiuaHyDUY8jR1C4Ga?=
 =?us-ascii?Q?XREP2PjP4aFmHWg8i9rONe9RtYWuRd02oTcJe0AbCmP9ukNQ1lKRxvYRIYO/?=
 =?us-ascii?Q?lD6ayH84bArjlFJEmokMI953Tcd+YsH1R/Gv9kwb5HW2TsfrfV02bmH432Jq?=
 =?us-ascii?Q?2daBNwILYkfljsaYcHBMFhwWCk/Y0nA/2AEDPxOMvbvBUnl178uoNS5BgKaD?=
 =?us-ascii?Q?lTMEKLqpcX+EbaONAGAdQgvUn53HJ+UAlu3srMkEcQUucH7hWEK2J83KMxW7?=
 =?us-ascii?Q?SYtFmbGu/kuzhReC0eqkocGaMX7mHT+1my91GnP1WQzkZh7Z5HYBUiqqphOO?=
 =?us-ascii?Q?Q7TXpaW9KZmGJeO24lZfZo++z6qrbWxaQu5pbhqKHpK9gBI385biccA4/rUo?=
 =?us-ascii?Q?1KSF9gQyWzI7kGayI2n6DH7CiL93656HGGQnu8AAWYj7UznSpCWbstvPZbS9?=
 =?us-ascii?Q?JgS4nwcPux+dCUxaZcy5/fUAiTQPYmdCiTWX9qoH2wyx6djj3ChQirRv879o?=
 =?us-ascii?Q?hKgH3+CHjWv08J3hLWKia3xnmi46A8Jyqrm2xtohxXGnCK35NCsRzog971t9?=
 =?us-ascii?Q?qbVrcQi+5ebpubn+c1zbSEZRSFVLPbMkS8g7FsFQFMI911oKOHJcXC/c6x1h?=
 =?us-ascii?Q?KdAAlkQAA0+XqfvlDu4A9ZRyXL7XYmtIAdqWrbKGZ6QR36dtUBg3uhgdfm7T?=
 =?us-ascii?Q?X6+TZi963sKWV6G6T3V0E8tsw9SORHRKTsywssV7HRbDfHzCgcnQaOPUCNOx?=
 =?us-ascii?Q?wd1xfi8EODEg1JJp4WGA2LnVqbY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf35c7e-2c4a-474e-7d57-08d9ad914568
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:22:49.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+HpbsmV3AVdPQ85rL4zjDJGqMRwDCpN2T2mVad0ix9WcTVDlDtl+JLbARvGHF+4TuppCgViX27alIK2xRwvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 19.11.2021 15:23, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 19, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Hi, all!
>>>
>>> This patch series is focusing on vPCI and adds support for non-identity
>>> PCI BAR mappings which is required while passing through a PCI device t=
o
>>> a guest. The highlights are:
>>>
>>> - Add relevant vpci register handlers when assigning PCI device to a do=
main
>>>   and remove those when de-assigning. This allows having different
>>>   handlers for different domains, e.g. hwdom and other guests.
>>>
>>> - Emulate guest BAR register values based on physical BAR values.
>>>   This allows creating a guest view of the registers and emulates
>>>   size and properties probe as it is done during PCI device enumeration=
 by
>>>   the guest.
>>>
>>> - Instead of handling a single range set, that contains all the memory
>>>   regions of all the BARs and ROM, have them per BAR.
>>>
>>> - Take into account guest's BAR view and program its p2m accordingly:
>>>   gfn is guest's view of the BAR and mfn is the physical BAR value as s=
et
>>>   up by the host bridge in the hardware domain.
>>>   This way hardware doamin sees physical BAR values and guest sees
>>>   emulated ones.
>>>
>>> The series also adds support for virtual PCI bus topology for guests:
>>>  - We emulate a single host bridge for the guest, so segment is always =
0.
>>>  - The implementation is limited to 32 devices which are allowed on
>>>    a single PCI bus.
>>>  - The virtual bus number is set to 0, so virtual devices are seen
>>>    as embedded endpoints behind the root complex.
>>>
>>> The series was also tested on:
>>>  - x86 PVH Dom0 and doesn't break it.
>>>  - x86 HVM with PCI passthrough to DomU and doesn't break it.
>>>
>>> Thank you,
>>> Oleksandr
>>>
>>> Oleksandr Andrushchenko (11):
>>>   vpci: fix function attributes for vpci_process_pending
>>>   vpci: cancel pending map/unmap on vpci removal
>>>   vpci: make vpci registers removal a dedicated function
>>>   vpci: add hooks for PCI device assign/de-assign
>>>   vpci/header: implement guest BAR register handlers
>>>   vpci/header: handle p2m range sets per BAR
>>>   vpci/header: program p2m with guest BAR view
>>>   vpci/header: emulate PCI_COMMAND register for guests
>>>   vpci/header: reset the command register when adding devices
>>>   vpci: add initial support for virtual PCI bus topology
>>>   xen/arm: translate virtual PCI bus topology for guests
>>
>> If I'm not mistaken by the end of this series a guest can access a
>> device handed to it. I couldn't find anything dealing with the
>> uses of vpci_{read,write}_hw() and vpci_hw_{read,write}*() to cover
>> config registers not covered by registered handlers. IMO this should
>> happen before patch 5: Before any handlers get registered the view a
>> guest would have would be all ones no matter which register it
>> accesses. Handler registration would then "punch holes" into this
>> "curtain", as opposed to Dom0, where handler registration hides
>> previously visible raw hardware registers.
>=20
> FWIW, I've also raised the same concern in a different thread:
>=20
> https://lore.kernel.org/xen-devel/YYD7VmDGKJRkid4a@Air-de-Roger/
>=20
> It seems like this is future work, but unless such a model is
> implemented vPCI cannot be used for guest passthrough.
>=20
> I'm fine with doing it in a separate series, but needs to be kept in
> mind.

Not just this - it also needs to be recorded in this cover letter and
imo also in a comment in the sources somewhere. Or else the question
will (validly) be raised again and again.

Jan


