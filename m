Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2042EEB9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210231.367004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKOK-0004eA-OZ; Fri, 15 Oct 2021 10:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210231.367004; Fri, 15 Oct 2021 10:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKOK-0004be-Kk; Fri, 15 Oct 2021 10:24:44 +0000
Received: by outflank-mailman (input) for mailman id 210231;
 Fri, 15 Oct 2021 10:24:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbKOJ-0004bY-K8
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:24:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd2c9cbf-2ab2-416a-9da9-df8a4a09945e;
 Fri, 15 Oct 2021 10:24:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-2t0HzOcVN3uj0z4zGjg1YA-1; Fri, 15 Oct 2021 12:24:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:24:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:24:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:20b:100::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Fri, 15 Oct 2021 10:24:38 +0000
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
X-Inumbo-ID: fd2c9cbf-2ab2-416a-9da9-df8a4a09945e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634293481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uakifc3B+A4nUiv6FULm9YM+JIQkKazVNPdzUhN8Vbs=;
	b=nustPMwWXWffTXVNY4ElJez9Fwy1bDNbhApjGIu+Ml3VXjZrTiKcOz1NmnrAti69vaH1am
	hmGZu3lMrjfJR54Blo0BB4Y2W0/elXRym1BNgKlqE0jyRjS/fFAPScN/Fd9Z0q2yauQNai
	zn7I5gCrtN9b/6O7y03udyxIvXHkg1c=
X-MC-Unique: 2t0HzOcVN3uj0z4zGjg1YA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKPGNzxjSK4M6HABDlL9g8F7KxM7Cpul4JmoQf2/5uVUPiq0c5+Vhv0h0X+J2I+Hk65HTcbjS1cqM7VedFOu6zNGnHrvb/tGfV14IjMoqWQYPJ1fD8YQV8uKuDIif3w7CZMRP560hvmjnCDSTZhY8p90Ah22A2Z4WrJQaG54OlBb9F+pgEc4+9uAC7nazzsF/ROXYhpiSbuWZ+aHUY0IJ4n4aEw47N37WXJUxhRcAZJbDorfi72crR/lXz/clnmH0u5WVqlVzYuRRStM/kPrkRh0X8LNFhtFQm/QesT+XDR3c4u9aZPQFE5zCRphaTBVTpuLDayRuaCfqnHPg3XnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VarEX2s5xZSbwsgpL/6lT5onBvZTkTqxCqU4i8R1Js=;
 b=Rt9Hy2T8DrkCvUf3FFzFiaL0MaE8CvRlaN8kRqaozSvX0BF0lX+39sJUiP87NgZogFJg/G+Am1Neb37fGrrU8xpNtms0T4DkM56J+FQnNOMo3zE4fjOGODPdbOnDfZx+qy1b9rsH+z9BlPnVytgTxMzDyjEHBkIuVL1oBKsknq2ciilyRu5UA8gmKGHIloWS741j6Rgurp8W0LI9gX/2D4ZJFXR0e9RDDTrqzhwkdYdPU+EDmwLSutXZQL7sU5+JpVXb724Ckywc3nhSEtx7ysyrwPoEjQY0JQ+24O3jXLjUX9d4kXMavlILZHjNuA8Njzc380PZ0jaD1ebbocIu4A==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c298c02-5791-8935-f996-516da2409f24@suse.com>
Date: Fri, 15 Oct 2021 12:24:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 076b5dbe-0b06-4566-590b-08d98fc5fe5f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484869F7B5ACAFC41DB05069B3B99@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YXK6adMDjutzQLvzpj8jJzQ2U6X/QGBcgT5Uf2ZUkd1Xw6RLu9upCBLrH5HSGhqv+Dubg5M/QcQgjJoxjousASmwSrUuhKpw8VghG/eDFGWIbRK9ADsnRpRe/kbC8cQtHP0A9/ceqesOCUx46+hKLvdwDOyAZG/iaXztaAMvHMxZvmXC/2aPG7PwV//C95tap55MfhxzxC6oJX/7nM/+7l377p6LL7SvyJy6+MDrnXw1eOgSFoKM6lG1KV8GXQw6bc4CkiXadmr1d3L+AzJFInpoTdAfFst26R0ZOmC9A1ZciKWMqoHGLfLXY+eIwSCZEAQ7QwkTac0TH8EXvRdlshH0rk8hqalP5gel4vQON4MhbrmLyq01T7RIRk2kEj69eR1C76ZZ6mRlq/53h2wtUP+d9Oi8AmU5YcYr0Db6RSu9VzSNzpvs4LeWsoVsT8QSlutvfwaUcSDTQ7Bys3b7Ol5lBJ1MYimQHcio9C1t2UYdOKxhhG+uHXuKeoxS7Nb13dffMdxbpwmwFDGJEyOWSny4COvTW2nqw7bne24CA53miZsBGdGcQSIEkYJWYoD+0FTebHc0rty7+F7pzUH0d8JJx/HykvfNo8wiGBwhCxNyt+YhdaA6jI9Ixj65KjDSgOzuos7NCUpPABoO5BzqYdAGq8URRkcYDMkNdx199BHcMUQzypRvBfaIk2jaVJM1dTDnympsZaJeTzuf4qozDb3qufhnBpH/APR2Ql+WSFis9Zr4wWNF4DwTVuzekzvmNTbg/sG4FNCR707Wo8CGJ8QPXOnvhnI9owpLJ8tGbSWIwVA+LD6w8IXHGa/kb1M7mmwcORWwCivF7CZ44hC+OdK8Gb3tMOLhItE9V1B6ZZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(53546011)(316002)(966005)(956004)(86362001)(31696002)(8676002)(26005)(31686004)(508600001)(6486002)(7416002)(8936002)(6666004)(38100700002)(36756003)(66556008)(66946007)(2616005)(186003)(5660300002)(4326008)(66476007)(2906002)(83380400001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v2M67bcSkC2vJPsZFyv83DZqaR4YFIf6bxntrX9UpZ8nQkM2sFAh8QSHdIoS?=
 =?us-ascii?Q?XKmgQN+KJ1wwhO7+opE6PU6IvT7UCLFxF8nVkEKkAWi7pZ3RJU1We/yzY1Hw?=
 =?us-ascii?Q?TUeh8kcr542jo5mH2Sj5GNmjArFyy0FAEHAPg2oBP46cQa+2CwlqoTkU51sM?=
 =?us-ascii?Q?yQpP0u9ryXZip0HF+3tDQjRlg1aJu3afw9ERMYU6KSgi0lsMsiQhs8WSTrWw?=
 =?us-ascii?Q?PjpKZzPRVhWvlLZRzkxETHTOBy6+XORzDghukSqAI8pEavgqhTQ7NRlR8WuI?=
 =?us-ascii?Q?3g+3Xvvf7xpFr16hyftXcwhv8I7EjB4j9uhf4OAPtDfGgbapUBgMLDyw526l?=
 =?us-ascii?Q?QTLMvxjCZ3sbjnYhkR4QYwMpmr9SnrU6qAFDCwzvFP9fMisXj+CYyIBZI2i8?=
 =?us-ascii?Q?bEzjhwM9aU6DTqHlDjegeYwkn7kcRlF9aduyrcyZe1kWGtfxiMjKZj2m4gde?=
 =?us-ascii?Q?GgnMOh6+sWiGgY+hy88FbXDsCqKUWrqL8LmEEQ3SYF4EaiX6TKNq6WeVWL/w?=
 =?us-ascii?Q?RwLs7ySjshWQsxiCpS5iAoWJRMVg/X2DuiLS6khsV/RrzBUdseecnmM8B7KD?=
 =?us-ascii?Q?c9U5V3ErR5sKtdvv8lYuQXEWRSUiPmhCBatMJ6hWghg78/tzuZun3AuhYBD4?=
 =?us-ascii?Q?jJSVQrrRMqm4cDk3i5i9M90blMI40xEnpvQGR/17X3KHPYvANMulKGvUmgdL?=
 =?us-ascii?Q?CbV3MB87g38dF5rCkbK/2TFKAHIE8XUwR0+/o5+I6Ao5sVRYffYVJkqmw0ZR?=
 =?us-ascii?Q?lGwpLcCXO0kgCyPt6i7zERZ56wAQxpkAQL/R0koJHIn/uHt03J+CwXYZVe3A?=
 =?us-ascii?Q?0HstH+/0T9xCr7rLR6kvb+N3EjCDWoSKpOFg1ae7MS7t01EyVjMTFPONr907?=
 =?us-ascii?Q?PvkDBjBygiGjlg5aFrLK/9E+lzXK//bg+O1tnFUptlcwcg1TIYTP9Bc/D3Lz?=
 =?us-ascii?Q?fzaHKh9+24Q52ynhilcH4fB0dXEkWIUGFvPdW/fSYZidXNVexSD4gGfoRA2n?=
 =?us-ascii?Q?c2HBhFWATvpC+ky9d1iVw+r6thDwhLEofp5U9bn8yCDi8tcBHvqaCo2l3fvq?=
 =?us-ascii?Q?UUnaypVyiXeFw6EC1Zm6iUssMXFTmJxn3vdTZNK30YYi3O+IDK3gplsDTn/U?=
 =?us-ascii?Q?q0+UgerteV26/+NrMfdSjip/e06Aupd97rXNzKbM6M8MUbD0ca3z2ronLL6N?=
 =?us-ascii?Q?AhvEwFvYyZncw7tA96aVi5cdTHlfcR+nQ8Z1alZYFm5PuUd/sxtuBP18iH6j?=
 =?us-ascii?Q?0l/BgGrpN1KX8ymPjC3y/D4RB8Onb5tzh1n3V3jh0ke29TBODSA0a/ckI0ov?=
 =?us-ascii?Q?/X02znoDcjFASzGJ0p5vKKpn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076b5dbe-0b06-4566-590b-08d98fc5fe5f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:24:38.9636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQNsGhMnJEYSdVQ8vm33VAxBa40MkuQlJtbJdBvgFYEQXeyoIg0Uy31oeStBhDDQ82FVRDn8yU0sJG5sbWr0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 15.10.2021 11:52, Bertrand Marquis wrote:
>> On 15 Oct 2021, at 09:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>
>>>     check_pdev(pdev);
>>>
>>> +#ifdef CONFIG_ARM
>>> +    /*
>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci han=
dler when
>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>> +     */
>>> +    ret =3D vpci_add_handlers(pdev);
>>> +    if ( ret )
>>> +    {
>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>> +        goto out;
>>> +    }
>>> +#endif
>>
>> I think vpci_add_handlers should be called after checking that
>> pdev->domain is !=3D NULL, so I would move this chunk a bit below.
>=20
> On arm this would prevent the dom0less use case or to have the PCI
> bus enumerated from an other domain.
> @oleksandr: can you comment on this one, you might have a better
> answer than me on this ?

Well, without Xen doing the enumeration, some other entity would need
to do so, including the reporting to Xen. Obviously without a Dom0 it
would be ambiguous which domain to assign the device to; perhaps it
should be the caller in this case? That would make that caller domain
a pseudo-hwdom though, as far as PCI is concerned, which may not be
desirable according to my (limited) understanding of dom0less.

>>> @@ -784,6 +797,9 @@ out:
>>>                    &PCI_SBDF(seg, bus, slot, func));
>>>         }
>>>     }
>>> +    else if ( pdev )
>>> +        pci_cleanup_msi(pdev);
>>
>> I'm slightly lost at why you add this chunk, is this strictly related
>> to the patch?
>=20
> This was discussed a lot in previous version of the patch and
> requested by Stefano. The idea here is that as soon as handlers
> are added some bits might be modified in the PCI config space
> leading possibly to msi interrupts. So it is safer to cleanup on the
> error path. For references please see discussion on v4 and v5 where
> this was actually added (to much references as the discussion was
> long so here [1] and [2] are the patchwork thread).
>=20
> [1] https://patchwork.kernel.org/project/xen-devel/patch/9bdca2cda5d2e83f=
94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com/
> [2] https://patchwork.kernel.org/project/xen-devel/patch/f093de681c2560a7=
196895bcd666ef8840885c1d.1633340795.git.rahul.singh@arm.com/

The addition of this call has repeatedly raised questions. This is a
good indication that sufficient discussion thereof has been lacking
from the patch description.

Jan


