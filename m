Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD141C0A9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198838.352540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUzj-0003OO-7t; Wed, 29 Sep 2021 08:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198838.352540; Wed, 29 Sep 2021 08:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUzj-0003LY-4S; Wed, 29 Sep 2021 08:31:15 +0000
Received: by outflank-mailman (input) for mailman id 198838;
 Wed, 29 Sep 2021 08:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUzh-0003LO-U0
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:31:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89fb1a1f-eff7-41f9-b762-58ee5cf3fb27;
 Wed, 29 Sep 2021 08:31:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-LMAMmD3eOhinRMmJGKqoLw-1;
 Wed, 29 Sep 2021 10:31:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 08:31:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:31:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0043.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 08:31:07 +0000
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
X-Inumbo-ID: 89fb1a1f-eff7-41f9-b762-58ee5cf3fb27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632904271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xe0x5OaQDL0HmkLEDdt0SbYhwmDomn5FddKPmy1Fq4Q=;
	b=gro6E/yekiY9OVp2KsjMTFLquSsKLQpD+abuz0A/7OD7r98F2n1SV0wGlprWhQtnRVpjJV
	Qb/hvA7raghsFrpGT1s8vNc10Pjjb93ZKXjH7ve50LVff5A6ff+AAyuje0fbKQeRY+zlhb
	VzvWHX1O+llm3+OeZJLMNaFEvkmaIho=
X-MC-Unique: LMAMmD3eOhinRMmJGKqoLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqFkNVzTUAkHUdUn+O8GIo8iSE3HCwJ5rHXnIq05SsJZwoSx8LXb7IOXXgtKaEfTsEIzGsFCZAAQfcekcG5zl7TMmScmOg2hHr7bRbulQwg7JQk5W3NPSo48QKOnafxg1YFxbkTOZcaBHVlUdBkwgHyx+W+hzTvRcqenC75reCa6ZCEz8wN7FK36fymfKDsFxv4QCb1WixoNMTJQYKTk0lJ/PEMe6n/bEbtCNhaX1VBI4GNf9YmImY0fmvX1qr0jreKJyHDDydGdqsLr0a+DAdG+WW/smstzYp37q6DGjCY5Xz+Blfb0t0tTk4UxYU0zcx2r4gvH1XCsDu4KehCVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=V7EBOjmP8zODTq02nDA9aoNua2xdPpk/NgTvxxufaQ4=;
 b=kjGSg3NvCdpZypGOy9X0umTdOJ944kBcXUxOlLlJYP3JDXLRxHRUs1xU18Mh9otXtK68wkh7wXVnKSkhXkR6OKZ53xlcECQni4rl/oUjC2mzljpN6lGbGARACS8v31MxSOyHUUFL+nrQtl+u8sXaE4dgAE+sd1kyqscgKQuWWzi7KxFe+KiQExrr8eQRh8wyE65DsVyFcMz1oc1G/+lB2r/mPO5zDhiKLsAowQM+FgfkEC0vfJ/iPfxTEXRk6+iA7Cllt3R2JZvZaOxHWV8H2Ead9fti+7c7CuWvwrbO+bwuP+z0oGiIujKQ0Y+2ldUXeueQfPuYqNsMO0pGoTjtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 11/17] xen/arm: PCI host bridge discovery within XEN on
 ARM
To: Rahul Singh <rahul.singh@arm.com>
CC: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1632847120.git.rahul.singh@arm.com>
 <a16e90a04ecb722e0f6c5fb8f9a9b0129b4fe96c.1632847120.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27b97adb-c7f2-949e-140b-bbdb8f01457e@suse.com>
Date: Wed, 29 Sep 2021 10:31:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a16e90a04ecb722e0f6c5fb8f9a9b0129b4fe96c.1632847120.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0043.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d48ee57-0fd1-4491-a10d-08d983237c2b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43843B296F10E24841539785B3A99@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mGhWO6fXldbtTYvF/ltw85jiqnvGUpR1tyi6LUcbTZHeo7G2aoAuDldFrffyI+6LUPM1M1RIHxCgllG18OY03lhZf4VIS9Xuu8DDwRa1iaJgQUk1lIjbRQlSVAMODQJiaD1+EpvQxhpGrSRMv06OXFFT0tv866rZhdbdp1VTJEMEL0kVe+VdGD8sG1uIJyvV0qeWGd0S+xmVOqvEfDkexzp+Rt7WoF+1D/EZ4yT32E7yc8eJPF6x7nOwAeGjxYvyCTogVdN9ayIgHBwQqdsFIhaLmD87nzsQp+Hwim9tSp9fqtGdfp6nkQCQoRrMi8ikKknIWkt8ZzBWH1eLRwDdOt0DLi764DSwmrFeNdKBJvqNbv2D2LSnW54kw96Q6MdJRo3UcHZXXhW4RKA10l3Wl0YbeTu2K4gJwsB55LdLTgZgHxnxV0T7jeuU8Ifp5B7qDim2hilTSbQJ8WWAg+MeZaNoSu5EcvPIfmdHypej3imzbv+Om3rgFbiLmfgBk9kzi7xC4Z/vPuQBO/PyN8TAHHFvTbCB14OYp6Zw29MEBNOYXsbPUhKblYRp2AINQFmMXD8pI7nuIgQ2wJRkBcwbhCwaR0bvTJdG+7MXCO/imYPKHvwxfbeVuDbVEUl3uXNNZnsWGpHaYGKnWBguR180LSWK54MqNQdVgs/0RT5spTC7Dl94yeAKnfTO3mdfYUXIIGLiVoCthnBxVLwJDyAO7q7t+BKy/SMYcN00UxgIUco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(186003)(66946007)(26005)(66556008)(4326008)(66476007)(54906003)(316002)(16576012)(7416002)(8936002)(2906002)(38100700002)(53546011)(8676002)(86362001)(6916009)(83380400001)(31696002)(31686004)(36756003)(956004)(508600001)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3BCDceAFdVHpGtbjcEhErWjX9IDZaRbNrnBovblOg1gXAAV6t7zBB8njuhE?=
 =?us-ascii?Q?Z1thqZneEgK8XN4pMaNHd/aT0tuDJQo60OxSYr/j1SbwQ/k190kntFbGD2Ry?=
 =?us-ascii?Q?7A1hOZAxMhsfnU198qlKg935rRTlNytvIklUaa1Q/9y+Ma6OmmhLkz/GcScT?=
 =?us-ascii?Q?1hS/oLnxcnZ1wE/kWMa9Sg/3nAwmy7ObotB3BtXrMNXnFiS9wQp0QYa0x9j9?=
 =?us-ascii?Q?xGXp/lRfTpOgGKGloycCRNbphee18DffOwFGnq3nIGdZ/6X5yAy8drQy40EG?=
 =?us-ascii?Q?UwEshSRY0nDDeNn57ejtGj4pTlPrqswJkJ3segugxJnsE+/2raEb6kI2UJuJ?=
 =?us-ascii?Q?wxEscDPT5OhiMYk1ZuBW7RBIp2u+J8r7sSc1GfJVcys4DWDL57eyj2JpGSOq?=
 =?us-ascii?Q?NEjIWMFBaaJf0DYWQ+mb2IfJVnMB//hxohdxvlhvf4Jfs01+sAyplxARyrUn?=
 =?us-ascii?Q?g1VLKH2yYlM/zbbtIDgzwRRTfLv4iGVply9rWX2/cQrXLtsQHBEqmdG3JlbC?=
 =?us-ascii?Q?56fwsXoGSm+eNpiPM9GNH+LzRQctQvJJwXEBtD5H53JsOZm7TvTs9o+w1SfA?=
 =?us-ascii?Q?yKUeiuQOeJQYEsBuI5agsb0x2ubieNcvNUZ8Ryt3VMMUq19LerO+rJTfM+SB?=
 =?us-ascii?Q?+g/fH3NyJK+SJ8g3jVO5aXcZelNBcJuT+S0nPbE0+E7DaoaqXX0ihfYbXBm3?=
 =?us-ascii?Q?AOHPJLO4OyNmGxQJ02nSRKVa6vDA5IPX//r23+OjiaBVpqnu9jTCHbzJm25v?=
 =?us-ascii?Q?bqJ7khjpUTIJngDoHGxhZrVCmXxzqiOEYzAck/EfIs4eHuI4+QBG4qH1Z+Sy?=
 =?us-ascii?Q?uKrldpNDoZ298f7lrKYJz7zLNd+s9JyeNsI5txh3BbJbw30cMaxPkSqrDkHe?=
 =?us-ascii?Q?fjxO8Xdcnk+Sws2WxJxAEPjUh4fKbsXm0bjLkatUJ112NviChJpHM7JI56YK?=
 =?us-ascii?Q?3axZKRM7Kd+/QjuPkosJXMNZ59s5zSmgHKHismAxGYyvKzRepzYK1Wn0H/aP?=
 =?us-ascii?Q?UFkLF3ZxfSREEx4+Llwoik3ziPTY7yx7vA05WrLKRCF2GCC4dicfPqCEy7J4?=
 =?us-ascii?Q?kUK30fhR3He0YIUQIoxaHhOqctA0HzAVsuAZm2TvvFhP5+1EqPx7vq1S7vl8?=
 =?us-ascii?Q?nBebIewsYQRmZKmOPxv0Iv2udTjQb9Dx7UQ9Htb4eLQqaOn8Ta3HW8NP1hLj?=
 =?us-ascii?Q?yEn3Z8vqswXyuCx/SzgCAU0+Ols1jo7xg8bfMX7nfikYgtTEDy/oAV+HcKYg?=
 =?us-ascii?Q?Uswcps9i+HTi799pAmIUw3wMI5ej44p52A8xgi1rhfbyl7D6crOky4YDwrGi?=
 =?us-ascii?Q?1vYlzL5g/WOHXpHdhUlV83gI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d48ee57-0fd1-4491-a10d-08d983237c2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:31:08.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KepSlAbGRRKan5LmZd1BQJzlRlRRDK7NGAgMrgxwvLBkeo7e8VzRajaYMLaUGD4jFkCxhn2GJ1QaRxYTpZ15UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 28.09.2021 20:18, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node =E2=80=9Creg=E2=80=9D =
property
> and will map the PCI config space to the XEN memory.
>=20
> As of now only "pci-host-ecam-generic" compatible board is supported.
>=20
> "linux,pci-domain" device tree property assigns a fixed PCI domain
> number to a host bridge, otherwise an unstable (across boots) unique
> number will be assigned by Linux. XEN access the PCI devices based on
> Segment:Bus:Device:Function. A Segment number in the XEN is same as a
> domain number in Linux. Segment number and domain number has to be in
> sync to access the correct PCI devices.
>=20
> XEN will read the =E2=80=9Clinux,pci-domain=E2=80=9D property from the de=
vice tree node
> and configure the host bridge segment number accordingly. If this
> property is not available XEN will allocate the unique segment number
> to the host bridge.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v3:
> - Modify commit msg based on received comments.
> - Remove added struct match_table{} struct in struct device{}
> - Replace uint32_t sbdf to pci_sbdf_t sbdf to avoid typecast
> - Remove bus_start,bus_end and void *sysdata from struct pci_host_bridge{=
}
> - Move "#include <asm/pci.h>" in "xen/pci.h" after pci_sbdf_t sbdf declar=
ation

This part, if not split into a separate patch in the first place, wants
mentioning in at least half a sentence of the description. Then ...

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -15,7 +15,6 @@
>  #include <xen/pfn.h>
>  #include <asm/device.h>
>  #include <asm/numa.h>
> -#include <asm/pci.h>
> =20
>  /*
>   * The PCI interface treats multi-function devices as independent
> @@ -62,6 +61,8 @@ typedef union {
>      };
>  } pci_sbdf_t;
> =20
> +#include <asm/pci.h>
> +
>  struct pci_dev_info {
>      /*
>       * VF's 'is_extfn' field is used to indicate whether its PF is an ex=
tended
>=20

.. this part
Acked-by: Jan Beulich <jbeulich@suse.com>
(also if you decide to move this to a separate patch)

Jan


