Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BB42E8AC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 08:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209763.366308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGPD-0007it-Ad; Fri, 15 Oct 2021 06:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209763.366308; Fri, 15 Oct 2021 06:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGPD-0007g0-7U; Fri, 15 Oct 2021 06:09:23 +0000
Received: by outflank-mailman (input) for mailman id 209763;
 Fri, 15 Oct 2021 06:09:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbGPC-0007fu-7d
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 06:09:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fc463ce-2d7e-11ec-8226-12813bfff9fa;
 Fri, 15 Oct 2021 06:09:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-Dzg7oErtPMWryuWbAPwlAA-1; Fri, 15 Oct 2021 08:09:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 06:09:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:09:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0031.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 06:09:16 +0000
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
X-Inumbo-ID: 6fc463ce-2d7e-11ec-8226-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634278160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPUb9jvRPqyK0S5YoaKCobbSkiq3DPaI+B+6lX+vndY=;
	b=MSGm2xokQtus+Ra2s5siOOsKtw+qSwyiTh+iiM39InguI8HQsLbUwb1/HyLIgI4goii84s
	vpX9LTYXKrsgWpModNLxam5z7Z5vxr4/HLdXs+Z6cBQ0jkNlB4+LF6q3PA/fe2K/5T96lP
	R2Sk0CgBdQyZa8XyFzggVIuaetLyhvU=
X-MC-Unique: Dzg7oErtPMWryuWbAPwlAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZSOaAIhthL/isJkV3fiZbK8AAbxdXwkiZKJsu2ZxbVn2Znj/BzTwP3hA+PV/WEeCcBZn5jQTAUqRWi5lLRshBzFw0+otsXG85OopJeruXNn3/z+s/8PCuloQv9vnb1hE3FOa9g0Glnrdri4TjNiO63QHCeAC1DTJ0k5FrRPAbr7I5Xq5ZU4Spbd2ZzJ4nj6TcS4BSl3PSgVXxp3CnIBSIaLAa7e+DxWL0LHABZWV26XYU2yf9uat8Q9nGD2zJKI+2tdhJSdtBa6aRgM1WNFAhLEM0DyvuMNX6OeDt+o+xQ53lhULR3kIeC38K2ALWJEaq5VpWpvRQN4HRhl0uVVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P81iuYHAEvwo4SeNKa2gGDWhOgyHbGZ7OWd73gL/9yE=;
 b=Fxa9QeOnfIW/Q3Ze1+Xah9jhH1LuBbeFz3e5QHDebT8FIqNRDVkgDJ4aVD13mMOkTtziDEk7SPVu0T3T8JF0UInbPDqXx8JvE9YOcOhI+h6eP4Nu4qJ1LHgb15nu1yAPg2D9ffYDsMjVJqCV7iFopObq9YktT9NspjANgvo1rxa/48aZ7mngOlIeLvFwZgU/MI6zdhmp6HaICrnPNK3dtzP5Z/fKc8b3SrFnjMtETeE1mXaRcbh7ACQq8NyPCQXM1lYr10S3xFYNsb10eQNgbui3nJAajVENNSJhk18aSvj0TRpUpkfcDdDkchJhDTw1Jvhja8McznYDX8dMaElE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <2b575750-83a5-588e-fd6b-dd9cdb9500dd@suse.com>
 <e3730616-c51f-c453-3f74-584473313e54@epam.com>
 <672f00b2-3065-34f1-3dda-430edd8eb463@suse.com>
 <YWb9kgON0krr5lp9@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1cd62ed-2cf1-5a66-e0cf-af30326e3730@suse.com>
Date: Fri, 15 Oct 2021 08:09:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWb9kgON0krr5lp9@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a2ad87-e2ec-4cfd-b874-08d98fa251d3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33906DB19482A50210F9D393B3B99@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9gKkwqSxoj0o1fryZkIBrUV8+wGNtEp8EeKqKJAI+C7hnMtukI9FrT+au1UG84420xRnBLKPQfZm0MHW5A3cN56CF5pKHkXm9DOI0t84yleJkn8DqthvX8fgv3whUExyAyqceCr5khI22YuQrNikw5efv6v9zM63SDfz+3QobBypi9l7gppdBGHrxIx7FgZ/4gcmgbsHQKcVuj/dmvWzAWp2v1oDyKTRea7u5QZHlJNyyuPYLFqxMwgjhwW9jB9eaJ/Heurgfbp8rzewWoVr/WwyIS/wuHA8EpsCNmeRMD3G/wbXIiJKni/DZf7vtNjKUxFRadjC/nKwDcwzqebcPR98L0XVtDOd4Lv/1VgnsftHwKBK/B/UlqLBjg1I+1In7W3WyjzwkPvv9rB6eSd5Dd+Ye3fP/+iRnqu8Gl0ylZHjY5xCeZJ3uIdo3LkGNNt51H5Vs4jNWNOG13fw+7YIP6Bl54S+xB3XKGB9rCsjR9W5FZJimGcZaPsmTZebJcrUGxxuhdpWzoCjfYLPP+b5eoSvJeV1bjx8cPnKLYiH5g1iIgXpMX2TyxiVK3uFGqmd/cYhH/atEG3YzMZD6R4hOcFTrA2MrvaZYI6gJZIlf/AFsg3yJh5j+JaQ+LnUsXBb67F4kOKt0PX89bNeqMd7YTvYh1CoaBeQilnUO4/3a6wFmm8lbXZ8yz0a7aOZuUuEMLRF3iIq4P52EMOcrsQDHHJ8tzwKMXbwtEDfq8TkcDP2+LsuqM5AQSI5u/OGaYoE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(66556008)(66476007)(956004)(2616005)(66946007)(38100700002)(31686004)(5660300002)(7416002)(31696002)(6486002)(53546011)(54906003)(8936002)(86362001)(16576012)(36756003)(6916009)(508600001)(316002)(83380400001)(186003)(8676002)(4326008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMn9aJhzfKct3DIe+n5m7vug+0O/2wAC+fbsaiAS3pARe0QSGvo/dxbbheWF?=
 =?us-ascii?Q?j4Lmm79TlZm5WH9asSbXYKQRJmb9Xe4s/TR0lbM9TZrjIDBWImgRYYxCv8uQ?=
 =?us-ascii?Q?1C3evCWxkcSYpE43z0tGBrlsk797T6Litrbo3gWD7s3Nq74geqABhMKkizp1?=
 =?us-ascii?Q?vvnTKNr5QygECWsYpuTd2jjsPyWaevDwj85cIQcgDGaNgIBo7Nh/0cgv0rTv?=
 =?us-ascii?Q?qSwWmzvscWrCrr1RPiPaErAQqqWcgCYl/thgh+gwVPGRJUBgkoE0TFMA+fSn?=
 =?us-ascii?Q?1GGttPXSq+F5KOgu8TdpdH1+Jj3mmvgZNeQYZyCuKNLLWrNmCgXDPbT8vQGy?=
 =?us-ascii?Q?GuOydfgXuUzT3ONLZspF5C83vRKbN5GOEmDMr49c1kFLVcMZHDWVYwCmauKS?=
 =?us-ascii?Q?FY++ZXz/BVxDzsxcz2Dicv3NO0EBTvuW7v2tDbEngsn4sKLaSwN4y1N+2k8K?=
 =?us-ascii?Q?j98Av2sTVzyOaeriNtJSzc0CRcJ7gml9LJrmjI4v6Tgm/g1mi6+hKjS2XUcT?=
 =?us-ascii?Q?I7y9d8ZvQKJFgIhYyrSxgCPCR17hc9sQccZBgrg8MJNPlvBpWwnUifpkbn3I?=
 =?us-ascii?Q?96YA7XbnhhIKiFrSCvHTjn0k4jbCD8g0b17kvD9Av5WhTVKgHXf0OBhYqSA7?=
 =?us-ascii?Q?KP2SZ60G5H3WSjYVDSy/tEJR3wDmkstNfe2q2esPiZPQXER7gU+QYr9qIB08?=
 =?us-ascii?Q?entyYUW0rmX5ifMw6u7ZJ/t04qKhKfk47r9Y6H1Zq6sRlwINgXPZFiBJq0y7?=
 =?us-ascii?Q?rvdtv7aAeyIwPn7yV/vx0TVitIosmopDEhBUgGB+qXLDwGQYb1U5jQEV4Ppt?=
 =?us-ascii?Q?d5QnuRzriNZM6VXN6GgbDSuvXNOqy44XbL9hq64PGhstE1SAAzT1/llYwxsl?=
 =?us-ascii?Q?drYRD4lfKf5v1sQ8bRbl+hI7PRpEDLov3E/3FPgWzCiLcegGEagnRrlG2qBv?=
 =?us-ascii?Q?IQldG1uWABuSZWDlVdDgu/Z74KK38GHMypOhHllBKSAD94bkQdjvsCjlxks8?=
 =?us-ascii?Q?PYvMLzoysV/ySHzi4jCO3N22IKlOdzWm9wCaAoTLMjKLjRtLvgNYfLsILrqO?=
 =?us-ascii?Q?0JaUSm11BRGM6jXQ83XOsspiJEgmzF5iqgu1Urrka3HPUB8yPXAF6aYgQ8Rb?=
 =?us-ascii?Q?nz3tvULpNPsLLrLFW+DA5T5OP74VDiwlTkjzzXV3uelj1cAOT8RE43dN5VWG?=
 =?us-ascii?Q?a91vjLteYmXxYJeIETfTpKIpSZT0b4yWTW2w6WrRbqulTX7lr1wC/oym92pY?=
 =?us-ascii?Q?dCFae24dnBAaEhCv3kmhz3aaopaYuiwvGtUZpeJVFXwDMmM5TufwlXca7Bpw?=
 =?us-ascii?Q?91ETgIrkP3JDZfsiEfqX1uba?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a2ad87-e2ec-4cfd-b874-08d98fa251d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:09:17.1278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahrWBidMjn0TcYp3wHUqqdoWfBTcsA6Tv+PZHOxcphX6feNyMpC4Kk/tBlzcgNRCosGCOKBT2dB1/5IrcilIzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 13.10.2021 17:38, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 07, 2021 at 09:22:36AM +0200, Jan Beulich wrote:
>> On 04.10.2021 07:58, Oleksandr Andrushchenko wrote:
>>>
>>>
>>> On 01.10.21 16:26, Jan Beulich wrote:
>>>> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
>>>>> @@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pde=
v, unsigned int reg,
>>>>>           rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
>>>>>   }
>>>>>  =20
>>>>> -static int add_bar_handlers(const struct pci_dev *pdev)
>>>>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int=
 reg,
>>>>> +                            uint32_t val, void *data)
>>>>> +{
>>>>> +}
>>>>> +
>>>>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned =
int reg,
>>>>> +                               void *data)
>>>>> +{
>>>>> +    return 0xffffffff;
>>>>> +}
>>>>> +
>>>>> +static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdo=
m)
>>>> I remain unconvinced that this boolean is the best way to go here,
>>> I can remove "bool is_hwdom" and have the checks like:
>>>
>>> static int add_bar_handlers(const struct pci_dev *pdev)
>>> {
>>> ...
>>>  =C2=A0=C2=A0=C2=A0 if ( is_hardware_domain(pdev->domain) )
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D vpci_add_register(pd=
ev->vpci, vpci_hw_read16, cmd_write,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_COMMAND, 2, header);
>>>  =C2=A0=C2=A0=C2=A0 else
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D vpci_add_register(pd=
ev->vpci, vpci_hw_read16, guest_cmd_write,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_COMMAND, 2, header);
>>> Is this going to be better?
>>
>> Marginally (plus you'd need to prove that pdev->domain can never be NULL
>> when making it here).
>=20
> I think it would an anomaly to try to setup vPCI handlers for a device
> without pdev->domain being set. I'm quite sure other vPCI code already
> relies on pdev->domain being set.

Quite likely, and my point wasn't to request dealing with the NULL case
by adding a check here. I really meant "prove", mainly recalling that
another patch (in another related series?) altered code around the
setting of pdev->domain in pci_add_device(). It would need to be assured
that whatever goes on there guarantees pdev->domain to have got set.

Jan


