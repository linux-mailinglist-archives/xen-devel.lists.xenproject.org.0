Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4C458AA7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228653.395715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4wi-0001zQ-BE; Mon, 22 Nov 2021 08:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228653.395715; Mon, 22 Nov 2021 08:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4wi-0001xA-7z; Mon, 22 Nov 2021 08:45:04 +0000
Received: by outflank-mailman (input) for mailman id 228653;
 Mon, 22 Nov 2021 08:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4wg-0001x4-PY
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:45:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aca8edf-4b70-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:45:01 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-jZG-9usuMU-VfxBYL5g43w-1; Mon, 22 Nov 2021 09:44:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 08:44:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:44:57 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM6PR10CA0088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Mon, 22 Nov 2021 08:44:56 +0000
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
X-Inumbo-ID: 7aca8edf-4b70-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637570700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Axjzp1r9UhHaSKLNOwgPmzihdnqdQI2RRtfCX9eZHso=;
	b=W8sbMsFhSRG6SdXBgs+Lvi3mr84cRv5ZI5/DsJ3eE3VxHkFsEhxLfs9ClnAQ+5II/hmBBD
	RjFtjEP/mngDBpVTVjv0bVlTgQp4HjqIn8VIQkmimPsb9mKe+RtvnMhg6MGbmYVbzQjZH0
	QsO3Sy9q5EdBEtJBSaPSiM6k7ia/d28=
X-MC-Unique: jZG-9usuMU-VfxBYL5g43w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2B6faS9LYiL0EpCutwJmW02owM58QTZLZzpyaWi8SUap+T9MPz2BsiGsk5W6y7T51srrWhdoukOpZ/qbMxxFZ1uu4v0J/R+aZo4ar6ZUmR9Yv5BOkPsDc4u3tZRVEhpLDZiCWdnR1aIzjO0+Nmy1YSVs0IF2UUYUMExQf2jgRJfTW/xolkhaE1kkbCAMI3r+35ZTi8EvlsuNh4t2KBsywh+Z8/vPTGDAd7g7u/lEaW527HEew4HrFFCGpyrb63rpkZFagn69glKJE89AaxlvnHWHjvJm5cLpbhmyVDFskpU0KZSbrcFWUu94g8GmBAvyyeZswcc7BkH9RtCUZ1p1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWFH8u61ffaRjq24Whz6QdJ+P+jWD6oSHVLJQlBp3Q0=;
 b=Ma1Wa0eFahMVk6oi/7/JGNZ2vYklUQDJ2HBvZCg8z9wYaAVuWAFPsNywrH4AyXSkLM7OjDbEaYB1l0rhoHpSRNwH9e3gZtGkm62a//o18cQn+GRePJoSVONAM5iksYDhkusgM1t1QG84LBToI/mb7fZR2DlIUoTDcDZZ6vjNAGuG+HJJMh0ULbkwq8QsXQREVGs5ZX2m5LCAXkTfJnMWfvEQaZZzUIEUAcma4xr2/GYu+OjVtM22D6vy4yof7rYTT03oMvs6hCIGeFHPVDVWtlf4TSWS7rBNubNIyFnhzUJnqUPPwk/pYGAQCOAFwFKXzyM42TUZ4YNPuezNZmAfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d723de4-46fe-c62f-fcc9-ac1cc1d7de8b@suse.com>
Date: Mon, 22 Nov 2021 09:44:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
 <YZezXShKi1ofH5Aq@Air-de-Roger>
 <11c3903b-ac7d-47fe-159c-a960fc9998d8@suse.com>
 <aa3b538b-86ea-020f-8069-8751fd581db2@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa3b538b-86ea-020f-8069-8751fd581db2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0088.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 011cf678-1d81-4f5e-e310-08d9ad945cef
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29600DEB1E92AB7321FA65AFB39F9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jQK+9WfFEmN7wvFjIAmcusxiQR/KByrzomEmYRnhH/x6zD6Q+YA7Gg9Iech51DbbYqUtB27v7LOWiy+P9GuILUsYPW+WFmSyJRwwHqASr30D/4Xv7vnSqpAS04aM5WYAXwIQUAkivHRMWKBQrwrrk+Lv2dhjIudNQAGpJdbjB8KMMJmwBmZtKV2/JzVqXBHyPwCM83Sj2/SPGu2nf/xlUAv1QVSpDEJtLxKD9vdadzYbZWekM6WHN+5Q8EXFJIbJu68Y1qMfY2a3+ve7M+NhuXYz7T487ioJJPmnagJX/Iq5whmj3j42oO4Ki/EnTl0W4DBva8QAxda7EiQDMwj7KtUWnO4Ih0Yh2ODoGKuaNGWibF74hjkYkoq8vWxHSnoAiGLRmHShuoc+oFwwtAPw++vCQD6VkIyGNITP4ScUazF0fh6fd9RB1YsrpbrLhmGorZUnwhsi2ihEQCUW2wbBb2Jcd7KXPCoyZTZar8QbWEwmzFUzu5twdlpwOaDtouOaWtv6/MLUmIE25bJ0guapcHoOkLm7CqXAK4UBhtaFkDr+ySQvT6/liDnVflTavvIO3LmAtSnPt8yeccKV7nNV6mTCgz0z1E6KNh0xIJyMoBW5y9iXYbkKwBjGqDe9D5ItQlq1LSVAClos6qC/Ro6oTRGrr+5znHGvnhfKoa86hYCYTBQJWPrMQy/P8EvWlgvd/tAQ1nvycBNi5xyIAzulvAxcGeYl8N2i6Ov15Vfe8KfeGto1oEARPNo2lSVw+KK79Jb9PY/ruY/F7qz2YKXRxsPhsFLeCmDpscQljBup3oW98qI/bVowsIMqZtGtHdEw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(31686004)(83380400001)(508600001)(6916009)(53546011)(36756003)(8676002)(38100700002)(7416002)(54906003)(8936002)(5660300002)(86362001)(31696002)(2906002)(66946007)(66476007)(66556008)(186003)(6486002)(2616005)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1x7dwnL1zRKK3hW+tVXFncj+8CSlZgd3DLEU8nAbNNuIby9EQEP+llATNuPO?=
 =?us-ascii?Q?BovFbYs+MwHoNvkwo7KfSqJfVUTs5R4i2/aZl06MaWhfQqbVTymiyzJLArHl?=
 =?us-ascii?Q?I+1yII1Vt/3rmOR/JHKdVQml/6BE3+os8ZmcvdNOx/hGFXfV6tUsYHEPztQo?=
 =?us-ascii?Q?BvVCmw1zJ6n7eGvf2ry899OrNvOb0QN0cRQwWpA2zFdOb37bwo2ctvIwuXI6?=
 =?us-ascii?Q?QQogl75BOd9GzZvd11oLq0VA0sRHeuEupTPV9F9yIZezW4Y2dCxFiOSgq3na?=
 =?us-ascii?Q?VTFUwuL9GTyS7h3Q5eC1u7J0CRRgoWBm+vhzfUU1rthMscwfDVpqm6nPgshf?=
 =?us-ascii?Q?gNuADqn3ucQRm7xk0EmBPEhllkSihqqQ+ttlZb+FHulrXi/PSxVjyFIrl7CS?=
 =?us-ascii?Q?W6EpR4rXyJsimyNt7EEKDV/o/MQPsvXmT0ZJvi896ZxN8FE8gZSQ1JFpw8fk?=
 =?us-ascii?Q?qKoXGOFg1fw6a9jqfKpaepbanNI9Q8egmR+ERCr8BJuKqjIDm2zn1RgN7ogW?=
 =?us-ascii?Q?pKUYBy3NKtTHmF3b8a86yWJglzpBeOLAMkyjGKEd7g8FSR/7ZlK4gHBuQzXZ?=
 =?us-ascii?Q?Q45IMIfu8aLgbQUwFSPPOmoVuEkd+rDNWygbZ96xCWuV9wiNY7m8l1dYNq/5?=
 =?us-ascii?Q?o4E4zCx0VK1U8cx9Xlmiyf1XHqMl+pMS4du5XBm6MYvZSRM4OUWY16JggniL?=
 =?us-ascii?Q?aZRs6+F8Gt6aGn1O4p5Fxd/XhwojV1GTcHXKMPmowCpN09kWMcBzLYVMqQb5?=
 =?us-ascii?Q?3dix4RsBJdPVeriejWrw2woSVt/BlJCDq5nmxMnFWlACEK+H4F2RhJFbFD2h?=
 =?us-ascii?Q?iO9J2qB5t/OxWUuOsvC57oMOUd/x0H783kfKeJ7lnHPW3J5zIM3Bje2xctOL?=
 =?us-ascii?Q?gnzkzQFoxRSxn/n3Q9YkEflMU5LyqwePPJIBvUZKLyvH2fG/9yElUwi2HzjD?=
 =?us-ascii?Q?Yn8OSz6hGZu75/UubpawMKd0yftGcThvxj3IN31uUXj7mDDhnaUvzn3p6R7A?=
 =?us-ascii?Q?DgH9iZZi81/HSQc1EZzyv1bAeC1v5TUHRvFU6+Rg8P5VS/xGLUzFxw4YM/Lv?=
 =?us-ascii?Q?scPPJyy2E6AH6kp153kR5ANdXQO1+faaMmFsji0cY1Dl9BISQiKrF62cbAsu?=
 =?us-ascii?Q?I7+SUkZwnP9zKZAPmLzzcziJ4HlD5S8g01Qb/rqXiY80fE+0k+64IxwDSPTj?=
 =?us-ascii?Q?dnAHFWW4cn+wcaiYstiUN1FJa3C+7TaLbbaol03eQx7NDNFq3282ArsIy9Fi?=
 =?us-ascii?Q?Xw8skTz0x/rh4BWVmqcGtXVseslMt7QeQ/QN6So/h3R2yrc3mTZ1JEuJjugk?=
 =?us-ascii?Q?Swmt3rr3q5UY0jJv9L3z2FccMydqw6j2h3zO039IgkGPqd1+cJhG+Fr5Bz0/?=
 =?us-ascii?Q?1kxSzIrWvfkfTZyNrGp99PsjCPA7Vm86KMDJpeWYyy3U+52HOeeiwSUlV72Q?=
 =?us-ascii?Q?NVjvWJ/1xid8QJ9iEkbHBYJPOQu5jS0jEGWfzAn60BUHH4uYfw55cdBS8aFZ?=
 =?us-ascii?Q?13WwP5R38+afR7yML4VN1XloZ7HZoXhZ8XIn6LZn/fD7lOgPSFM4I7QTz5qW?=
 =?us-ascii?Q?qdq3Tf5pKJSFTx3MMQH0z1W434PsvELHlLJwgg7yn477UsymRU7anmcDTO99?=
 =?us-ascii?Q?sRzSPyXULENvPoer+3nF10ILSAyzuG/HElOPVdqNXj5ORaMLYiN0f2UQH+tD?=
 =?us-ascii?Q?+4utsB4bK4lxT5RgbKPJZtotOFE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011cf678-1d81-4f5e-e310-08d9ad945cef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:44:57.6675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emfpI9NV5XhJiu4Uz3NwQr2ONIun5YbClV2qTwIJ2NmLnkwOBJsZHhm2b8yg8ewjoCWROgBLJNfsigwG87kfFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 22.11.2021 09:34, Oleksandr Andrushchenko wrote:
> On 22.11.21 10:22, Jan Beulich wrote:
>> On 19.11.2021 15:23, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Nov 19, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> Hi, all!
>>>>>
>>>>> This patch series is focusing on vPCI and adds support for non-identi=
ty
>>>>> PCI BAR mappings which is required while passing through a PCI device=
 to
>>>>> a guest. The highlights are:
>>>>>
>>>>> - Add relevant vpci register handlers when assigning PCI device to a =
domain
>>>>>    and remove those when de-assigning. This allows having different
>>>>>    handlers for different domains, e.g. hwdom and other guests.
>>>>>
>>>>> - Emulate guest BAR register values based on physical BAR values.
>>>>>    This allows creating a guest view of the registers and emulates
>>>>>    size and properties probe as it is done during PCI device enumerat=
ion by
>>>>>    the guest.
>>>>>
>>>>> - Instead of handling a single range set, that contains all the memor=
y
>>>>>    regions of all the BARs and ROM, have them per BAR.
>>>>>
>>>>> - Take into account guest's BAR view and program its p2m accordingly:
>>>>>    gfn is guest's view of the BAR and mfn is the physical BAR value a=
s set
>>>>>    up by the host bridge in the hardware domain.
>>>>>    This way hardware doamin sees physical BAR values and guest sees
>>>>>    emulated ones.
>>>>>
>>>>> The series also adds support for virtual PCI bus topology for guests:
>>>>>   - We emulate a single host bridge for the guest, so segment is alwa=
ys 0.
>>>>>   - The implementation is limited to 32 devices which are allowed on
>>>>>     a single PCI bus.
>>>>>   - The virtual bus number is set to 0, so virtual devices are seen
>>>>>     as embedded endpoints behind the root complex.
>>>>>
>>>>> The series was also tested on:
>>>>>   - x86 PVH Dom0 and doesn't break it.
>>>>>   - x86 HVM with PCI passthrough to DomU and doesn't break it.
>>>>>
>>>>> Thank you,
>>>>> Oleksandr
>>>>>
>>>>> Oleksandr Andrushchenko (11):
>>>>>    vpci: fix function attributes for vpci_process_pending
>>>>>    vpci: cancel pending map/unmap on vpci removal
>>>>>    vpci: make vpci registers removal a dedicated function
>>>>>    vpci: add hooks for PCI device assign/de-assign
>>>>>    vpci/header: implement guest BAR register handlers
>>>>>    vpci/header: handle p2m range sets per BAR
>>>>>    vpci/header: program p2m with guest BAR view
>>>>>    vpci/header: emulate PCI_COMMAND register for guests
>>>>>    vpci/header: reset the command register when adding devices
>>>>>    vpci: add initial support for virtual PCI bus topology
>>>>>    xen/arm: translate virtual PCI bus topology for guests
>>>> If I'm not mistaken by the end of this series a guest can access a
>>>> device handed to it. I couldn't find anything dealing with the
>>>> uses of vpci_{read,write}_hw() and vpci_hw_{read,write}*() to cover
>>>> config registers not covered by registered handlers. IMO this should
>>>> happen before patch 5: Before any handlers get registered the view a
>>>> guest would have would be all ones no matter which register it
>>>> accesses. Handler registration would then "punch holes" into this
>>>> "curtain", as opposed to Dom0, where handler registration hides
>>>> previously visible raw hardware registers.
>>> FWIW, I've also raised the same concern in a different thread:
>>>
>>> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/YYD7VmDGK=
JRkid4a@Air-de-Roger/__;!!GF_29dbcQIUBPA!n37Yig9pAAyho7fB9kC-q0T-gjC_utpzjt=
QxNv8udMX0dXK54PWcHwBqtmzHXSc5lTkzKu4XfQ$ [lore[.]kernel[.]org]
>>>
>>> It seems like this is future work, but unless such a model is
>>> implemented vPCI cannot be used for guest passthrough.
>>>
>>> I'm fine with doing it in a separate series, but needs to be kept in
>>> mind.
>> Not just this - it also needs to be recorded in this cover letter and
>> imo also in a comment in the sources somewhere. Or else the question
>> will (validly) be raised again and again.
> I am fine adding such a comment, but am not sure where to put it.
> What would be your best bet if you were to look for this information?
> I think we can put that in xen/drivers/vpci/vpci.c at the top, right
> after the license in the same comment block.

I would put this e.g. next to the first call to vpci_read_hw() from
vpci_read(), making the wording general enough to express that this
applies to all such calls, including the write counterpart ones.

Jan


