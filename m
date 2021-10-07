Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74491424E0A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 09:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203323.358425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYNjj-0006jx-Hi; Thu, 07 Oct 2021 07:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203323.358425; Thu, 07 Oct 2021 07:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYNjj-0006i8-E4; Thu, 07 Oct 2021 07:22:39 +0000
Received: by outflank-mailman (input) for mailman id 203323;
 Thu, 07 Oct 2021 07:22:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYNjh-0006hy-BO
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 07:22:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5823abcb-273f-11ec-bfc1-12813bfff9fa;
 Thu, 07 Oct 2021 07:22:36 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-cgq-Jg3bNf6nOD49jXzG-Q-1; Thu, 07 Oct 2021 09:22:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 07:22:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 07:22:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0095.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 7 Oct 2021 07:22:33 +0000
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
X-Inumbo-ID: 5823abcb-273f-11ec-bfc1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633591355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cI7X4EsiLYSb7aU10ZGDQSWXtdjLW+2nC2kviaVSvFs=;
	b=R8q786eBVJjcLUUvBed+ygwiHU3CAlVljLwY7pRe33vbBBuLpbtsDv8jZPUYoMk5u+hfNN
	5ZBepcFKQvRIWWpXWBsup4IIPxxQNKl3/8OpLCd9WakC+RbF5M+Q2n0y2xWSV3qYtaF5xE
	F7/9c3Dgj4prV4c6vWeyuXA2HE46VEM=
X-MC-Unique: cgq-Jg3bNf6nOD49jXzG-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTvFIa/TX6Jm4va9oVehmEafsIMDO3vCHwKLFld82OmzRNy5Bb7P5GG6hwGOhi31mG74i0EZIOcmWsHC1/mmhU9fQPMxTQNB0oaubU+Ry4UxHP515GlV7p/gU1KiYbI4eTu43n1DOeBDWuA6XFetO2Q2APwQMaLORIob5rdsXUHpTw8jXCBd6w3zMRy/4xjMTM+K0nakuPVTqFmFialXUdxB1v9l3N6LthcgWPANezq9qxoZkZv+EcdviaffDaEg1Wb5m6i/B0wli8GjN5gZ6III9pE8ZZ1Ph/QTZZS6KNOqHQTU0I0n75qfmWME+nHiWxap5IUxJGEfAWZgSM5nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0lzn+ru2kljmp/kH5rZue5gIcI9Tn6Yh6XnzBWROIw=;
 b=VpAyVdA+LhyTxsL3NHtpIE0mvKQGSr7zZ/DydiiAOgOQt3Gto1bUDmGBV2GkbdFWPnjRhUji4tYJ6qHYoZaeZh5nNw6XNAwhbuRfH3Kcc4iY9uG7q778dnDQ9nYs2xVarJfcLEaveSYfVJYPVz30xHvvhKf3uH4PXY9LPKOtIb14Q2S1BQt4dSY63WlVOVnSHU1u3fJTX7yT3Chul+OE1bfZD2LRj9FVDDkNcb3CZ8zeLA49Sftfy2TrcX1kry+AXOaQhh2Xu2mI8GVElRTXhwxZlxGqCqpNvL+HLSuHKKLQAePmzh5knr69sfc+regfGhFFsxvBl/n3u0QsVTaKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <2b575750-83a5-588e-fd6b-dd9cdb9500dd@suse.com>
 <e3730616-c51f-c453-3f74-584473313e54@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <672f00b2-3065-34f1-3dda-430edd8eb463@suse.com>
Date: Thu, 7 Oct 2021 09:22:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e3730616-c51f-c453-3f74-584473313e54@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0095.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78447563-414c-4dc6-570b-08d989633b1c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703985DC9E48568B81C6C7AFB3B19@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0cn4KKlADx4y11DDf/I2j6FOcXmzz9wwbCNcETyjc9wHu5CCBNRWXuC2jOtIRjsSYMKtard03orSYRQN6ReIrp+/xh0yEPbSUKMzNQhfvLP8rOaFhcg4GcLHayKF9zh0a8XJzSMooPQUoqr8cZKYwZGKoNdN3DoxNFUmVlDqDFAgdGTvYKgMbjYAGF4toV21L+Qz4ukecKxvwcnwAsoDqR90fuFTluhbmp8jsY9dZoOXRbYpV02/9F2ywq+mR8l91XOzWxYOtN7r70UG89jOIdsmpVu4e8WYgqYlUtLUSm4GdtKXdE8HtTX1AYmCvXJJ4edrnISyehBQA70D9xydlkCI6EYshW/TPatAxcshGzblBJSDZm/q2fI9RuuBkHARaIwZjrs7xuo9fatDqJIimyzKJlvrA3ZZk6PyTKgLT2ie8m/7EeAIsDwxU8JTBnyJdlDiLqTEmupsO3G99/MwK6daHIW4qoJfILPcWzJe/JMwe48BD1tq9LODI+64MHo+ni1nYDz7nF8UUSEDcLknej65OiSEUGrCTIfDco0idm7n4sdGkqix6c1/g3iAOUoPJD2vsww8zExzoxJCKLDmo1mq7i3ugIuLnVkFv8EDB7TDxxCfs29U4J/g9yK5Tyr2W3CS+pI4d1gkfnh3wPOwGakdOY01WIFOHuj18DGMpxNho+w4CQ7B4syRLBfYcVRjhedarhZI1MCKry1PHouChczk16ka6DwM1Ap8jVKE04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(8676002)(54906003)(31686004)(8936002)(6486002)(5660300002)(38100700002)(956004)(2616005)(6916009)(16576012)(66476007)(53546011)(316002)(36756003)(66556008)(31696002)(2906002)(7416002)(86362001)(186003)(508600001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Uay6jbopjJaZfQCE6rfMkd/MWPntjsU96anXC9EwVO8nVw9ZDDxeA9h7aZp?=
 =?us-ascii?Q?Rd1nVSnVPBC6u9uQHym2LDUPKN5lOzHzsYMHi84DS/zz6v84JNrMRb0GlNyf?=
 =?us-ascii?Q?g9zVpeiug8D0y55wqtyfDljc4C6Jdcnz0diw+ARlJq7GOMy2ZrX7HEHKe1IX?=
 =?us-ascii?Q?k+LLueGZwsIRv61zrjWuNQwS7t15luqTvDZLZj4Na92kY0ImtsC5xzxJ9bth?=
 =?us-ascii?Q?gHXv7BEe78eWRrwolYX7yF29W/2AXzZZZ3m4x15rXGOoIRo3cADnfM0n2V5p?=
 =?us-ascii?Q?Zq6R88uy3T97aABGcup6/le8bb/qAo5/bZVwPFcfDmbDFrVvMzvY2GOCbtL1?=
 =?us-ascii?Q?kYhaHOXjvW0+r/i/IiXwq0OxXZAAdZCsewiJp8xYY8O9jBnWMOjIYIH+XF8X?=
 =?us-ascii?Q?jsw4w8w22YtsEi7tZWr/k8fRET8++UiGlTlzO1QNsc0PP7IezfWbx6NUYdCP?=
 =?us-ascii?Q?iOXmCGHJL9EQud3EfvMaMcLm+mKixMxY3kdkpkiqUZa7EI39dLm4O+lWrKFW?=
 =?us-ascii?Q?n1U3VpscbUXuINGU2/Go1Ji7LF1+dBniQJGps4W7YRoEZnlkXIYT9NuNo73H?=
 =?us-ascii?Q?3dwqs2GXC2VWfV22y1HClFskbutiQLWzDt8NUJy2Acs+zCO6F+X+JTsnZlHp?=
 =?us-ascii?Q?7WO4TMGHqivkl22QH/UH+f06fOPprcasqEpar8LhXyM+dZ12dNttaUxsHK7B?=
 =?us-ascii?Q?tFWbdtmcMCHgue94dn4rnv6luiLC4/yrHhZqV6Cj2w6g/Bpy+8slHLLnrqWE?=
 =?us-ascii?Q?mbu/KdScSUuR2uz5FbO1/M1dSfpWIjikZ09ShufviQtjwHuG64fvlmnG92rJ?=
 =?us-ascii?Q?YlSnuqn8nGWNelCu6X/hEwGkJ9PlxZ5CHT/DQBdu8ICzbcJxAoOyuPamfkXO?=
 =?us-ascii?Q?V58NZm/eyzy3fkimar/Udb7HF++RQC14uhP2HwIfy/HPSmTNIQufI5L/ifLg?=
 =?us-ascii?Q?b1/tLxJcYCRdsp8gfG5uNwRZOVnC5myF/twAQPWanu0ZbHIl/QmRe+IOjiPs?=
 =?us-ascii?Q?ySYn1vGFzcHttZis+UTRoHsCwUEYA+qCVqBkaZ+PWbs1oeiuPYDbgBS0RQIt?=
 =?us-ascii?Q?cU+TLxejYGUJ2KAV/GinAXdOnOgWFZRmK2SdjU25jc34LK7t/jfzpsUKJPfC?=
 =?us-ascii?Q?1LJXdnZd0TtlmKOs9CZ0tg8N+7RLc+jprE/UYFaBQVAyN0lCGk7lT+6p+Rva?=
 =?us-ascii?Q?nDtm3atJUzmfepdcJLTS+X6jxEg3/a+F61i5z4hpkUjHEDmOiFj9g8PZ/V2z?=
 =?us-ascii?Q?PpEzwxoB1QV96uExpKAX5I+8Xc17QqepajEESpKy+xI5r+x9u2REDGqcA3YO?=
 =?us-ascii?Q?uiE6cVFaiZIBmF1Xm4FIQDCL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78447563-414c-4dc6-570b-08d989633b1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:22:33.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CfdNQOVhanvCeUvXearrWtjOERZUeYzTPVlnc8IWDM/Ow1a7efl2oAEtAq8n4HAjapizaqPhiLfn+IKvJKK6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 04.10.2021 07:58, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 01.10.21 16:26, Jan Beulich wrote:
>> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
>>> @@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pdev,=
 unsigned int reg,
>>>           rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
>>>   }
>>>  =20
>>> -static int add_bar_handlers(const struct pci_dev *pdev)
>>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int r=
eg,
>>> +                            uint32_t val, void *data)
>>> +{
>>> +}
>>> +
>>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned in=
t reg,
>>> +                               void *data)
>>> +{
>>> +    return 0xffffffff;
>>> +}
>>> +
>>> +static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)
>> I remain unconvinced that this boolean is the best way to go here,
> I can remove "bool is_hwdom" and have the checks like:
>=20
> static int add_bar_handlers(const struct pci_dev *pdev)
> {
> ...
>  =C2=A0=C2=A0=C2=A0 if ( is_hardware_domain(pdev->domain) )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D vpci_add_register(pdev=
->vpci, vpci_hw_read16, cmd_write,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_COMMAND, 2, header);
>  =C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D vpci_add_register(pdev=
->vpci, vpci_hw_read16, guest_cmd_write,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_COMMAND, 2, header);
> Is this going to be better?

Marginally (plus you'd need to prove that pdev->domain can never be NULL
when making it here). "I remain unconvinced" was rather referring to our
prior discussion.

Jan


