Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6A432269
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 17:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212424.370285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUMM-000086-A2; Mon, 18 Oct 2021 15:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212424.370285; Mon, 18 Oct 2021 15:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUMM-00005p-6e; Mon, 18 Oct 2021 15:15:30 +0000
Received: by outflank-mailman (input) for mailman id 212424;
 Mon, 18 Oct 2021 15:15:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcUMK-00005i-RF
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 15:15:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21551273-fd40-44cf-8f5c-ed8575759c27;
 Mon, 18 Oct 2021 15:15:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-tRkOmCJdPM-Rr6C8PIYhIg-1; Mon, 18 Oct 2021 17:15:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 15:15:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 15:15:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 15:15:22 +0000
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
X-Inumbo-ID: 21551273-fd40-44cf-8f5c-ed8575759c27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634570126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bc1Y8xRFPrl01Nh1N08KFdcf0BIfYNpEy4FuDgekvYY=;
	b=IkrAvJ6Iny/e7kx5RbUxObWybgwBlQvlIiPZVJsBmNWzlvuV5YjMnmvAWqYLoL8ymsUoj9
	EK64dcVMYVwGcWVq/V+QfrR/MQPDo3UTlWpT+xvIzV7BWmEgEnmkizw5jNgY8vxHn931Do
	SOqhPmwcddEZYi4tFc99EWpQNdNuOd8=
X-MC-Unique: tRkOmCJdPM-Rr6C8PIYhIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwoXGUZFlvCYZnU0wiqMZOwxe9qUW9Mn4MJvA6+OQxjfTAjgB9av8g69fsNlOzsGOdmUQfZHltOPY122ydBXvwHMIGcW306VFRtua2Mb6w+FsixtFG40TnxBIIAiJUjM803HsU+pLvYGxWnEYjdHlfrv2/XXVlVenFp292B3AVyTYUXmzM5P0GhbX0VwzVic7qgrf4SAInLAPAG/xw/ODLCpwvRTHf1CJMLQ7d1vCE6xXZPzGPNQCFfB/kzsFNTBOG40EehnEcb8V+q7R0H/hqrIvdtFq/yPKuuf3ESXAZJz+wqQ8DAmreuN1JqBhnJRDsfJ/G3Tc7xmxDKcyLM8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMHdINXXzEUpuV/YRJnZqZvhB8Q2ASoh2uC3j6C8zG4=;
 b=BhC5fme3vucrzLGMJERprplpQO2V95FYXMh+bXwVDNP+KK2p/EG6hSuh8eOJB4//FLx3hI7T7EhmUni6v5p7b8ew0Qg+d2q5p63qgIY3Xk6eTQOUtU+gR52THP68V/98iTb9Gr8T1qOmkmVGbobfx0cfssfAOA06mMrSgYf/m1omk6KQC8AmtzSpXtPXfRmA4NwsiRZjgqXGpbvnWOJw7D8dPgcmq4oJ4lEZJHhKKY8wymVV23WmzkaybF4F9XtxrHX2UBtDFuyIKidUkt5ZPPLGvOx2WNlA7jrYJiGbL4diBZgbl4c22+imJFULZL64ZNyusL6TvwhukNYc7sQcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
 <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
 <8c99e635-9509-b078-2285-48fb6fb91507@suse.com>
 <46bcd42f-df4f-922a-cc21-a05821481754@epam.com>
 <17fd4f89-9afa-f65c-c66d-1364d7474969@suse.com>
 <2a47d0d9-a821-bd2d-62ee-173ccf5374e8@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99f3194d-07d3-21bd-f75c-53cdc6b40491@suse.com>
Date: Mon, 18 Oct 2021 17:15:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2a47d0d9-a821-bd2d-62ee-173ccf5374e8@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b615b84e-ae63-4651-baba-08d9924a1b43
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038B17F528E80097EE03175B3BC9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MDSc/WIpWb4Dt0FNZOMGLU/kGDXSoqT902K8LLqwkiSQ5INNCXxO2wbHwkujU4jXr6bqiiBSWzhZNKGhbSy+nwgAcz4apz/SdMdyjV4QgmkxiLzvwMK5ZLTfEadDsl3KRUwPb5s1OFK3MqY8kxI9jFYG/Bjsm2WIm8yjB20ZT8BfaS8HmSuGMMw185cJxaJxDBnh/LhU40UeF+NwolnZxH1OW76OH17y1OBlk31K4reli4EjocuIxmYqKtcuFMZCYGkTvSFnebHyPTbupnDA/cdBWj0SbipscRSOukA/CvqwmYb53DNyf4lhUWegqxQEi0Px6vBMWDOYL/pEDWUHJusSfoPvWRLNrvoF+h69/BPVVj9I8BsnEhd/rnLn2tmtqnT1VoB0padiwdH/iEBmCkcmeiDtkwW/a6vtU+RwGlwArSSpQ81ddYh4AhQSG+mMzDClqEr33+MNgakgOo5XweRU0nWgRgqL+n6e2+UV9W4CO5Z4r8VaDFy+nxnBHvkV4heAyVTg78t/MZ5gqupOFvdhUD5WHfLHfamuTUDROeOzwhHsnEfZL8BUMTx8f5BfobL+BxxsM7j89XgPW5KjRI22WoO43Zc2wrr0ET3ib62MG5v9QJj3fcD/C33OwQiFF6/FBSK2DR5o1Ukz5MDBFe2xDCep7mUV4MGa1ySDzwhFeIF31fzckENPu3wVfLG8N/Za0+wVti+tvIZIKTUX7sv2RPRPPtXDB3h9bMbsy6IWoVPQc7OvxTU7tf9pOGg2483wvrCOV17A5e5cR9rc2IB+10jIOIpXysXs57Ll6DJajzyfqPNaLvy8smdOoqJsUU0dwk8Od2NRJUXw5lQOBn8P7r82hFYMD3/TyWV+2l4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(316002)(8676002)(186003)(86362001)(6486002)(5660300002)(38100700002)(66476007)(53546011)(36756003)(54906003)(956004)(83380400001)(966005)(2906002)(4326008)(508600001)(66556008)(31686004)(6916009)(16576012)(26005)(31696002)(66946007)(8936002)(7416002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWELz1RIeaiyc9neDUoMzSXQO+rmvZVGcxI3ku2eWSIDCTSG2KauiYiQSqh1?=
 =?us-ascii?Q?ZgQ/dEQ8vqEjnaGpRyRuNgXTWO4YnsPNaFeRIgGqgBtfq9oZ7ZcpsE8QfNc3?=
 =?us-ascii?Q?E1rxtdAuQ75al7Q7UWCjIFhA+g0kaFKMzPzLQQIEIUQsh6DrRVyqjBR10gB6?=
 =?us-ascii?Q?vng3ykYOG6+9go+ymtwXSb0PriONl3m3Ogvm+OBjJanC3CS26I5Lk6Vis15x?=
 =?us-ascii?Q?IqRu3pJK5GJCmqmDJqJM/z3YhtKC2h7BKmZEV4DtHHwBjHH+okyOtGXlkcbj?=
 =?us-ascii?Q?wlFdG+u+aCzrtyoybSiuM2+kCqanPpelyK99Zcxpo4Q8iE/Dt5q9j9WmbI+m?=
 =?us-ascii?Q?9bcYrglPRPa3Sw12WwyguzSWdj3ml0CRPKzltAnAqvOXRsYTbQpxPc5IzlrI?=
 =?us-ascii?Q?d67CNKaKjWtRCr+qrpRutEv8rjYiwasAlk9lZBSW+lymStoTC8VLyvVwNlt7?=
 =?us-ascii?Q?cqKoqI2R9LDmTLetiKQSJAkr0kdsh2LZc3E2+4FC3dWaySW5/mqM4k6PchyO?=
 =?us-ascii?Q?Lgp7e5DBK82sAOo1+/ogNLQ2wv83f3kSb4Vhrqe02uGtvafaz1TbxZi9srDc?=
 =?us-ascii?Q?EcTs8W5XQr4K2Ju30/PKuU36J6Vo6ObPRl2akoNjMfYc7OfV2Xiw07UVZOm+?=
 =?us-ascii?Q?EQ3JMVOKcFbX4pIzb/2BM5lxWu3bQZ0Z/D5KzoV+phwZs5/+8Mc1BTcLA6OJ?=
 =?us-ascii?Q?J6/tHqfOOqBu0abpJAWHO2LXWSdlUxwGWGa0Q7Uy9D28a9CaCjpxM3GgJSYp?=
 =?us-ascii?Q?eM7qxjVUcNQf3ttMV0spqa3kDIEigOrz13SreslOr4n3kCGHh+o4x0ieRTT1?=
 =?us-ascii?Q?bj2QhWWVRxfSPyRVQUpvmiwyq36qoQyedV2KKo3bEyfTfseTnukGLvmAuY37?=
 =?us-ascii?Q?BpMbPgWfEZc0eCOUIBhYEWPl4c/RgRORPMtRTn5rwjm2zejG8g1wotWg1W78?=
 =?us-ascii?Q?lN3t6/bZda31cXcwLyt7szypPOAXpDwQ4YalVkZolqu99l5bnzQl0oFpcf+b?=
 =?us-ascii?Q?z1bp0znEEE3stDO89yCMwdy7FF+s2nx/ijVgp9R/1DNqzMnRtJl//1d9qO55?=
 =?us-ascii?Q?N8t2rMzWPPTG4x6i3ia8V1RWZwYtB1zro2U8eQ16gpUXJfGUio408H/ES0Mk?=
 =?us-ascii?Q?27Vx0eTo/TwjmNa9kb8zb3A0k4fxa2hZepGHSsBcRxlA8KntIMY+ztlLXQVM?=
 =?us-ascii?Q?bl6AOqFCBHgDUOPYHQywxxead8A2aqN2160Y5+kxerKfAndX6K8AGjuuKj+u?=
 =?us-ascii?Q?dTiHV39ssHaAE6Cg2N0IJf8NsXj/cuIfltwJesl+x8ISuOUMKC/5ir+13UV/?=
 =?us-ascii?Q?4OhcBcc0t5MsKOXH851CuAuL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b615b84e-ae63-4651-baba-08d9924a1b43
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 15:15:23.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5R2eTgI2cimx5ilHh7+xOUIiF7PcZTq9PEGhfk9fbw3B2nJ1vlUdig6EOEiZkeNQMqyxTc7fesIQHahadOqPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 18.10.2021 16:37, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 18.10.21 17:19, Jan Beulich wrote:
>> On 18.10.2021 16:07, Oleksandr Andrushchenko wrote:
>>> On 18.10.21 13:29, Jan Beulich wrote:
>>>> On 18.10.2021 12:11, Bertrand Marquis wrote:
>>>>>> On 18 Oct 2021, at 08:47, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 15.10.2021 18:51, Bertrand Marquis wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/arch/arm/vpci.c
>>>>>>> @@ -0,0 +1,77 @@
>>>>>>> +/*
>>>>>>> + * xen/arch/arm/vpci.c
>>>>>>> + *
>>>>>>> + * This program is free software; you can redistribute it and/or m=
odify
>>>>>>> + * it under the terms of the GNU General Public License as publish=
ed by
>>>>>>> + * the Free Software Foundation; either version 2 of the License, =
or
>>>>>>> + * (at your option) any later version.
>>>>>>> + *
>>>>>>> + * This program is distributed in the hope that it will be useful,
>>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>>>> + * GNU General Public License for more details.
>>>>>>> + */
>>>>>>> +#include <xen/sched.h>
>>>>>>> +#include <xen/vpci.h>
>>>>>>> +
>>>>>>> +#include <asm/mmio.h>
>>>>>>> +
>>>>>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>>>> +                          register_t *r, void *p)
>>>>>>> +{
>>>>>>> +    pci_sbdf_t sbdf;
>>>>>>> +    /* data is needed to prevent a pointer cast on 32bit */
>>>>>>> +    unsigned long data;
>>>>>>> +
>>>>>>> +    /* We ignore segment part and always handle segment 0 */
>>>>>>> +    sbdf.sbdf =3D VPCI_ECAM_BDF(info->gpa);
>>>>>>> +
>>>>>>> +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>>>>>> +                        1U << info->dabt.size, &data) )
>>>>>>> +    {
>>>>>> Here it is quite clear that the SBDF you pass into vpci_ecam_read() =
is
>>>>>> the virtual one. The function then calls vpci_read(), which in turn
>>>>>> will call vpci_read_hw() in a number of situations (first and foremo=
st
>>>>>> whenever pci_get_pdev_by_domain() returns NULL). That function as we=
ll
>>>>>> as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
>>>>>> physical one; I'm unable to spot any translation. Yet I do recall
>>>>>> seeing assignment of a virtual device and function number somewhere
>>>>>> (perhaps another of the related series), so the model also doesn't
>>>>>> look to assume 1:1 mapping of SBDF.
>>>>> This question was answered by Oleksandr I think.
>>>> Yes; I continue to be sure though that I saw devfn allocation logic in
>>>> one of the many patches that are related here. And I'm relatively sure
>>>> that there no adjustment to logic here was made (but since it's hard
>>>> to pick the right patch out of the huge pile without knowing its title=
,
>>>> I can't reasonably go check).
>>> Offtop: I was somehow dropped from the Cc..
>>>
>>> Please see:
>>>
>>> [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus topology
>>> [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for guests
>>>
>>> [1] https://urldefense.com/v3/__https://patchwork.kernel.org/project/xe=
n-devel/list/?series=3D555481__;!!GF_29dbcQIUBPA!mM8A39p8nk4UMK3YeKMMW9ua9B=
Hj1UOWzaQcyx7G46YPdudxMpD3huqZfih0Uc8S-GyWXD_mPg$ [patchwork[.]kernel[.]org=
]
>> Ah yes, this way I can find them in my mailbox. And indeed - no translat=
ion
>> from virtual to physical SBDF on the config space read/write paths afaic=
s.
> There are translations for both read and write [2] such as:
>=20
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * For the passed through devices we need to map=
 their virtual SBDF
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to the physical PCI device being passed throu=
gh.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if ( priv->is_virt_ecam && !pci_translate_virtual_dev=
ice(v->domain, &sbdf) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n 1;
> +

Oh, that's before you even call vpci_read(). I would have expected this
to live in common vPCI code ...

Jan


