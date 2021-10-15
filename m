Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0442EF22
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210282.367070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKoH-0002TN-Cv; Fri, 15 Oct 2021 10:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210282.367070; Fri, 15 Oct 2021 10:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKoH-0002Qc-8y; Fri, 15 Oct 2021 10:51:33 +0000
Received: by outflank-mailman (input) for mailman id 210282;
 Fri, 15 Oct 2021 10:51:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbKoF-0002QV-Jm
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:51:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da5e81d4-2da5-11ec-822d-12813bfff9fa;
 Fri, 15 Oct 2021 10:51:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-0_RihBxkPia3n_SNu-fpJg-1; Fri, 15 Oct 2021 12:51:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:51:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:51:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:100::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 10:51:26 +0000
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
X-Inumbo-ID: da5e81d4-2da5-11ec-822d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634295089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnPy3dVPOs7dEJwR7bfGZBUDz4Gle0WFyFn9nfHv3ck=;
	b=hr4SM9+hvMDwVcHqU2tiyf4DwO4rI7rIYR8gc97FqVaG0mGWMT5c8ZbqNCvawvpOzXip2g
	KgL8AHLF42FffznbwT3DsO0RFFW11Sul/hGuLhos6EIaOJFFD1dJKqU7LEojkFon39V+aM
	/g0ieXVNrL+mjzLEatwJTuSzICAGSdQ=
X-MC-Unique: 0_RihBxkPia3n_SNu-fpJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3U+Sug8qlLC7esk78RjV9VGzYWf6bqeDCJdLC3iJnD3O30SqB4qxMS6zAfdzDhrv07j/MjuK7JCsUhIKRcCdyWoKbwWsiyRuPE19D7gqEiPM7Ux12OEO63q9jqSg+dQRUyfiWZdADszLWiVCFHUPg6ksUN6IBHUsQbxQ6n+kwCE2VI6uIVKTTSiRlBhAy2buEJiK2553KEHyQUDFNQXqcSFPhwJN5hWw/TvpIdcvwOQdgnm0gxw0/fWE/S52zZS0LsJUnM5z/WZSkGiqW6a6TO69LVeDVUDj0fgukDHrlpg+2R9x4YbmdgcTHpcpIyo2Q4anXowhFgSpqn5xGLvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh+KyPYYRPVpcSZmdGW4byPD700xATPD6CtE1r4R30w=;
 b=cqVGFxTPbtd8cwVX/voqzmW8FyblBV4hx191zbGw54miYvdh9pJbKEkKaiAyhV7ohjUkYbBeey8sWZxVGOQ9Ot+/eMBK25eQ10myLx6do9+yRuXOnF9IMKkE9WE2ltzP+vwsL8+FuiLIELGSpH9ZstSc9PY7/ETjoYEj3dz7Q+EzSMYGoPEo3+bCblXj2xPX40FDP/3CguYWby036y289UE16f9AopGkfDIMIubPhkD8j/rINZ0yRm3LixTp1YVWRzvDMUwtf3Ixjrn5U8GAbdBV4gL3KxFDen4FG45P6/09U36CuoOiTlLr+7jFlAFhcnVHBfVa4uRZDRbqryu1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
 <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
 <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6c2efde-d22a-4d57-63c3-5522f9485188@suse.com>
Date: Fri, 15 Oct 2021 12:51:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972bfa6b-eec4-4b82-ce11-08d98fc9bcf3
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB296024C911C3E31728EE57C7B3B99@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5qwa27TBDjMg+Sj+qgeFGZr2KdXTRZuIQWWPwgY7W/ogalY8DVul6e5m7GxNPkLd523/z9fAe5v42KlT0MfTra6ZM55sBHBpPcjv6tCvroS3q8kKw5vF/DRbYmkwfbYd+dXLn7Kr9SgdGyNwA14Esuz1gaETdhI7NEZF8ShyZW/dcvslMXYF71nJxWxm7wUDGzN9bEmAuN7pspT2Fn0jBgoTLlBhdfno3Md8GsRX1xjcOg7+rPJTrgH5BP7mC2XlMajZYt4Tm/mBAlHDXsU6G2I/LgE8wtrEDMsIOVwOYoxg3ok2xASwQgfZJm+nWGtzbHS6hDXwHrTSYLnoL12dne+WCOQxCsSgtKgyRGO301gqRaEQKck3SCoYFye2Bgm+FBJjY2iPjZQ9GCb0Zv313OfS9anBZXjM7VJ2aSqJM8+Kgj+5KOBFH90of5ihDAWBI3iCkJ2dzgVGNkN/Ea5jgppcDDyU2CFTf08I0YwfUdmiaVBrC7RFylmCyIX9ZKTW0NUi1aPNJso6fxyqM3Pj117XDsfhRKus3JvZ3DI6Lkg0Zk1GSwZ49OpF2shSmV3ZnFJG7UroaxPbCRkF3ZGzO3mxz7Twz4fa6dY5DlcJBQ/iKymBvuJQd31hXi6yjXKxTOhOCgxSMvTWlnix5wmlC9EP7YOJQC5y04GBTFryLvd6mopJ5zQ+YiYbICdobTs46V9RW+pGGBDjs2G/dxrLQdqNtf5HKKy3q7+3GtHs+jY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(38100700002)(8936002)(508600001)(6486002)(66476007)(4326008)(83380400001)(6916009)(2906002)(66946007)(36756003)(66556008)(2616005)(186003)(5660300002)(53546011)(316002)(16576012)(54906003)(8676002)(31696002)(31686004)(26005)(956004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4OqvSPQF2U3+BNXLOk4FBxJ4yEH/ZsGzI9X0dYEKTU9ceYMhSvimkfbk2g+Q?=
 =?us-ascii?Q?sIqLtKSOX1PhzL7T8YmtBHSJug5hnhtumvy89remduCNJHPzKJKVKcXSzU0z?=
 =?us-ascii?Q?tzeko/cPF6+0qOsIXNtdemalP6vgbkPEpCTX3AiBNTIIfgQkdJkDhwNEuGOD?=
 =?us-ascii?Q?mf8VulPzJZRzRQhgX0r9MTqtlSnVQLbkWZqtLKbAv2UK8pb08Jz9Zc5in/di?=
 =?us-ascii?Q?N/o7wma+OalF+zko5R9lVtAhffALwuI8KrZcSNBLSGRwy8egzCpbiNFwTrzV?=
 =?us-ascii?Q?BBZpLasrOTRocfo9vAI2nSlS4MOwroaRCx0iAHSagzeqaR+cEndmnUI98Bxz?=
 =?us-ascii?Q?diO9bE1oaaRHJIbUVp9fbZprLBORLHaF0PpRcc4+cH9TNtTh7fX3r8IQFrcx?=
 =?us-ascii?Q?DtroTgMrS6LK/DfOXVgFGJXzwX6kfecARSw3bAJ7KYVhktD4Dw2FnQtgxXP5?=
 =?us-ascii?Q?Iv0BG94h6ChRL/eK7ogNjsAI5c/wk4SfUzODLQ9ZrMPm8Of6Efsujj7lqoU9?=
 =?us-ascii?Q?TIiQS4CJkTckfoC+z2EefwBwFfz5hsQKlHonWieO2xJth/YYn6A+YWDNQFZz?=
 =?us-ascii?Q?WbBSj6pkoIPPumC4stJmv2Rao/t1ka6TFgZCBpUT6WVV99MaUC+Ia3zuqiSA?=
 =?us-ascii?Q?KXXbMza38OCU64P3w+Gpw/cNmPancnzzmTMttoX8V8lP8iqeP718gsOMwV6M?=
 =?us-ascii?Q?BH7IpViMn4eweNpAhHOPJ2iJXx4Iead9Yqmt5K2B/M37b2ZOKudIPckvt42J?=
 =?us-ascii?Q?MfBY5oxu8CQ1xdZwior/9O99PbAe8KJY1SfDuqcCPZr9VOti8L8/6V3R4F+H?=
 =?us-ascii?Q?eGsf5oDfcLyGhvHWGvru1Q5ZMitobTrpxtw5CP5jJ5H1uIu9GTaHbiqj0acx?=
 =?us-ascii?Q?liYq+lSw1JEUC0DQSjNrx5mCPUrFeuOFTIa4HSpOyFymgezSO++tdpT7ZS32?=
 =?us-ascii?Q?hpNjal18A+YVnkukqqfgjENGx8/K7uPa2q20+4Cfr0tvZoiEg5XNDdb9SXLd?=
 =?us-ascii?Q?7BPA6XDSZueMwnsShGQYv1S8ps97L+8SnRI/gH/yU56Vgr4x+I+BNIMebwtm?=
 =?us-ascii?Q?6pEBVms8p3UfvSiGY4gOQ0HdQ7TM0k7fZQfp3kqwxDqAfxezBITXnpvTMqpw?=
 =?us-ascii?Q?x/9DR2SoHHjqVsPwzb3pUJjhZrMw9QHGcQirIbyeBfoV/LOv76OuvXSVUAqh?=
 =?us-ascii?Q?q/SjB7l7h514LmeHqrA9LXa5DV0u9GhTSwNFvd1jkcRW0hhMl+pNTZvjXFyO?=
 =?us-ascii?Q?wW/GxWpIurVR//GuOLFIUtEjXS69sNr6/VhuFQElUu+Q1JKs80ud8fd2QHNx?=
 =?us-ascii?Q?H3/nEIe3fr+PScMsd96iWkoE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972bfa6b-eec4-4b82-ce11-08d98fc9bcf3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:51:27.1928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbTGpmcGuPNi96Yo2AicOk4XaV9EpZ1ks6Cl4r1CoMQZW8wCgmZYFMKmdvw4r+NszD6dNBJhQ3vWp5cX2MWENQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 15.10.2021 12:48, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 15 Oct 2021, at 11:41, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.10.2021 12:33, Bertrand Marquis wrote:
>>>> On 15 Oct 2021, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.10.2021 11:52, Bertrand Marquis wrote:
>>>>>> On 15 Oct 2021, at 09:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>>>>>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
>>>>>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>>>
>>>>>>>   check_pdev(pdev);
>>>>>>>
>>>>>>> +#ifdef CONFIG_ARM
>>>>>>> +    /*
>>>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci=
 handler when
>>>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>>>>>> +     */
>>>>>>> +    ret =3D vpci_add_handlers(pdev);
>>>>>>> +    if ( ret )
>>>>>>> +    {
>>>>>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>>>>>> +        goto out;
>>>>>>> +    }
>>>>>>> +#endif
>>>>>>
>>>>>> I think vpci_add_handlers should be called after checking that
>>>>>> pdev->domain is !=3D NULL, so I would move this chunk a bit below.
>>>>>
>>>>> On arm this would prevent the dom0less use case or to have the PCI
>>>>> bus enumerated from an other domain.
>>>>> @oleksandr: can you comment on this one, you might have a better
>>>>> answer than me on this ?
>>>>
>>>> Well, without Xen doing the enumeration, some other entity would need
>>>> to do so, including the reporting to Xen. Obviously without a Dom0 it
>>>> would be ambiguous which domain to assign the device to; perhaps it
>>>> should be the caller in this case? That would make that caller domain
>>>> a pseudo-hwdom though, as far as PCI is concerned, which may not be
>>>> desirable according to my (limited) understanding of dom0less.
>>>
>>> This is not really related to this patch but the plan is the following:
>>> - enumeration would have to be done by the firmware or boot loader befo=
re
>>> - xen will have some code to detect PCI devices
>>> - dom0less can be used to assign PCI devices to guest
>>>
>>> Anyway does not change the fact that this must be called when domain is
>>> not NULL and I will fix that.
>>
>> Since we now all seem to agree that the NULL would have been a problem,
>> may I ask in how far any of this has actually been tested?
>=20
> With the whole serie currently on gitlab we have extensively tested passi=
ng
> through PCI devices on Arm in several configuration (number of device, MS=
I,
> MSI-X) and check that PCI was still functional on x86.
>=20
> With the patches pushed to Xen right now it was checked that:
> - xen compiles properly on arm32, arm64 and x86
> - xen compiles properly with VPCI activated (using a patch) on arm32 and =
arm64
> - xen on x86 is functionnal (using basic test on QEMU)
> - xen on arm64 is functionnal (with some extensive tests on different tar=
gets)

But somehow in the testing done you must have avoided the code path
in question, or else you would have observed a crash.

Jan


