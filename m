Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F64455E42
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 15:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227453.393388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mniVX-00042Z-JV; Thu, 18 Nov 2021 14:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227453.393388; Thu, 18 Nov 2021 14:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mniVX-0003zd-Fc; Thu, 18 Nov 2021 14:35:23 +0000
Received: by outflank-mailman (input) for mailman id 227453;
 Thu, 18 Nov 2021 14:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mniVW-0003zX-5f
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 14:35:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c190f947-487c-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 15:35:20 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-GMpUn_yZNv6aGfaz7kbjcA-1; Thu, 18 Nov 2021 15:35:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 14:35:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 14:35:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.17 via Frontend Transport; Thu, 18 Nov 2021 14:35:15 +0000
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
X-Inumbo-ID: c190f947-487c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637246120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0pIrFpklBOSD6hAv0+HQDYDrR5HqC2fhf8WYNDb3PM=;
	b=l43iAnnIX0bTo4avk/N+ptG6AnEWG63dA3kdxzC5GuRe8Abs25/F//xyOMJNGA1v//zxc7
	nCi1ds/creVu2Rg40sXLevMlGNkX+/C+YAqVFr/W/KxevaZHStTtpHCwb7sX4R6wtdSAJD
	yPUW/NmWJiWoAkcmVdsnJDr58wr3ltI=
X-MC-Unique: GMpUn_yZNv6aGfaz7kbjcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYAN4BNDvhssVbv7eA4MnWf8TocRU16PmK5xrt8MisPOBvqjAQuGoVJsImxKk6XycwByj78AFh0u/1W5I3XzHWWk8dsF1Q8Xghm+gFVtjdzPlapeS+WIz+2Y+awzs6ChlQS9+O2inbnMBZAoQNPvYviu0sYY8kKlcZ0DCmjPyo9+o30C8qrDN1ANtzgy849V9PMxpQvad0T9QuacCGUod+67wqatFvIx9VVcS9jbHpr/ppoUWg9oiXk1udhOjq55jjzv/SquBYxvT6l8hjkdB7HMvoJs2LbYi9scdavWWmcF8vtGStKV1gfOvyT7TXB5OTebgPr+adCER5LSt8g4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eXD7lSyYy++f0AHj3IOb5Lk5OJwElGRy3HgMpkNY1E=;
 b=WbErgp4uEqyWD5iD3/gYm2fr2Az4Sx5AgMYdmTJfR9vLVTkGa0KBqda1olRUSPRELlx3AsK16aRqlK86MUlsSDVLMbdqkLB554y5JztfHgdv9vOs0rd3VYtzThYnqNuLCdWdVECSyVttXNxoHDL4TnkML08BFmQBTmw+91ZVvEyS/x/1yrY5BetXLktQd/gOsmHEtnbIBFKOSxtpCHvfi44bM+cM2ydHj1sFAn6EHYW7nL3J8RAj6O8N4L9BH/XuS0Zw0O1g4Tl3eciX7WrmD+GIkEdvfofHGFrdo3IMQH5ENDmSBtIz2m7VAQwwbh5I+Oa5bnlO98XntHVquN8dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
Date: Thu, 18 Nov 2021 15:35:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
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
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06305b0-5e17-4962-456d-08d9aaa0a3b9
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671872A037AF1F991139F91B39B9@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qyrHlrYU1q9PhcJc+6QrElBNNiWrXHT4tYH1cTS/CgubVqG68hiKXfPdGrqyf1hf1dFaGfaK5LN0YJzsKjdYjdm5NktqB4XY7/dG8hGP1TWfqmUInv1Hvl+65ojJY5/z+22NnPk+s48OhryZfDrUGnwBSPWO+fOtL/2GJ5GII+mFPBUE535DVXPw52EdAIR8rrGP331aD242NsUMilr6D9vAtEOJPB2RQDDiBI2taxcXsBNAOyVKYGavfIL+2RqdMpBNxUty+8EHZVuNsXsQ+u4fy2Bx0tZVhf11LWzsEsYFX9bWvj1gLz07RTYplk6uqYK1ecYK3gFTm1BGSrFxeB3ybxs+zN5VLgaLboKLReDY0E7469aGbo+nd6ZMQBqshjMIPxuidIBCRYc77BFtTuz5d3RKgfIdYStTLDythtkk8qfwsjesaPqMS2peloBjz3sJ3KkTF981XGFrVwqWPkK2YtN56T7a4h0BA4s9WjdBzbAeSJOeAbUjbyupnEbaalLirXKzzur4AJEfKN4eAPQfowDxUtrd7qfEkNzUgH9rHyRFpkqTQbZwPqkNDTTA/IjzDUbO+418gvFs+jgra/I0kusdxcFnKL0nCFP+90ICrMU3NkhVYGyaOuRKQ16iR/9UsIVqXN3pVrPGiv3z8bnSZYxwJXOwjydbItgNWIR3JV6qtSV1Hq8KL8//593rR1A5IeW9ZJeKbEnIJwN4+8AKYJOlbp5upIa4EolyaNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(5660300002)(66476007)(66946007)(2616005)(956004)(83380400001)(6486002)(186003)(31696002)(26005)(6916009)(53546011)(4326008)(8676002)(54906003)(2906002)(16576012)(36756003)(316002)(31686004)(508600001)(86362001)(8936002)(38100700002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hK2TH+jwr9YkC/6oIEa6SVT1ovHS5yDFXmFPHyXO2T5dtWuT5zcw3FZOTE2/?=
 =?us-ascii?Q?zzoxNrkbGhmI6VLYReD4dH7JhSyBP4O8ScVzP2LbcUHnbA3vgn4Uh7CZ5cEp?=
 =?us-ascii?Q?zZG2iwsTV1fjA290kMCKENJ64bGw1eAIvkEOgMCj2sjyc6ToeKuJPJ33zamj?=
 =?us-ascii?Q?2iYCkElzsj4Osf0g7w6eKz34qzaS0l4Zeclo/rhV2j9e4UkivqFy7JO/bR7K?=
 =?us-ascii?Q?Kdy4P2TRCwJ6EfWY+gKB1gZHImAbKklI6chb1ETW56K6pXPq0nmShydoqSU5?=
 =?us-ascii?Q?oqe+R/NYUpMiGYVZ9ViZvtSC3mF2mVU2hxfjWGmjF1YnEkDJzZ48tUhhiBC4?=
 =?us-ascii?Q?oammFUmwLkCx2BqNowsQ/hSm738v5i+hMCsN1C2dRpQichMqvHcgRJAYyWsd?=
 =?us-ascii?Q?uXa4hhNJbC9J8IBlvRT01Y4g9zirvdA1G2sf5Uo/425ZgnJG90J9Pc5ZGZ8W?=
 =?us-ascii?Q?UU7B7AYBn9EmDExoM9UWz9EcFrY8nmZ2MUYHgQqW7cenMm1MPMZ8bkp1pfwr?=
 =?us-ascii?Q?rlmOi50mjXm5adwOmfxUG0PL0Mh4mZybFzqehZwhII8wRxadO5VxH0Y6o+yE?=
 =?us-ascii?Q?XDrGDFAbgLvQcUhqLJT6vSaj/FRMgJ6Yh7Dyu6ssx22z2fFVbbsW+gn5rnho?=
 =?us-ascii?Q?BtkINJFTekqwiu4p/gwXeVZVvsXW5kApkr8zuJuslfoDCFWzsxblHm2zn+5Z?=
 =?us-ascii?Q?rDkhKWcTKBbK3lBLczcX6MRE2IzQ4YQEr8HhfmL5b81j/AnnEqsRxhdfBEEN?=
 =?us-ascii?Q?mThzio6TmM9gW6No0chEDDjvrCVhEK73Ho3w9uK+n0KAiFHdRWbWXZm8OwU1?=
 =?us-ascii?Q?8Z6qKLkJQW8vqZ7Y35TH+7JwEqjvgPH8WedP/AcZXI//IAu1aLUl8ez7DLbo?=
 =?us-ascii?Q?h67VCuV46cF7Osid3MROKorFOvkFjmEHtiQaBW21/EYYNGy4DMZFp12QOMLS?=
 =?us-ascii?Q?XUXUeDHm3RnR6PzAPpdK3N7VTQtiUJzEXiOdYmBuPDK5k2HgAVbYjf9EbNs7?=
 =?us-ascii?Q?45QvZ3kZItPrpK/nc5BRcEAPIDE9TsdZNV4jojT8Fmt4KoK+XwPcdh20aQrB?=
 =?us-ascii?Q?p3XzlxkW3Pr2pRl/K2h3q4GW2EdzQuGPe4p1DhfwckrSLeyCimKZvzgr2R2K?=
 =?us-ascii?Q?vvmHXTcSnR1f/l8ZJcldJQb+811NvXg0FTr+6qnMntRneJP1Yt2g197JlvQg?=
 =?us-ascii?Q?U7Cpuh1T9F7Zi6J18REfUPfZqyMvCIXme06mQNoyLgY7KGZQ2knxD+7Ac8NF?=
 =?us-ascii?Q?UD7jfwIxu+wa/LHdmjw9i3E/rSJHPNUuAKz7uoVDb1s2GOfJFeFgQ3Um+nSq?=
 =?us-ascii?Q?DmpxGhzUa7s5114KI2HzT0oGGJ75vklC6IxQStdyOZaLGjpVygjV2OQ3HLTp?=
 =?us-ascii?Q?uLVPrgrBVfV289Hg8U0ynsJtb0kfrGcjpa8IpLOImgtsCX/zblfOpYZrfdVK?=
 =?us-ascii?Q?tN9gWOAGdtkMqAsEg/jjdEY4A2xVQ7YAyFd4NFQ4ma8+WwiNnFJBno7R7qel?=
 =?us-ascii?Q?4WwZZ4X0kmX2Aakll/s/97xp6EIbi9taEGNUrEN+TyQtq56EbARcjSFGbWFG?=
 =?us-ascii?Q?ss9jrqjZ677lUSIdPLwYxTE0H5EYfm7x5wNI8n+bTfBDwRUdCBezzvIJR2fv?=
 =?us-ascii?Q?K+1D+8TLXcGXzuTMK3KVhu4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06305b0-5e17-4962-456d-08d9aaa0a3b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 14:35:16.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Qc/7/sCee/xDIaivjHDaBQS9O34eHH9GGx7ENw7wepXWgxH0UUgtzs0ixu0+FFarQYlpEuOI0KCOj96Qg7KpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 18.11.2021 15:14, Oleksandr Andrushchenko wrote:
> On 18.11.21 16:04, Roger Pau Monn=C3=A9 wrote:
>> Indeed. In the physdevop failure case this comes from an hypercall
>> context, so maybe you could do the mapping in place using hypercall
>> continuations if required. Not sure how complex that would be,
>> compared to just deferring to guest entry point and then dealing with
>> the possible cleanup on failure.
> This will solve one part of the equation:
>=20
> pci_physdev_op
>         pci_add_device
>             init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDU=
LE_SOFTIRQ)
>         iommu_add_device <- FAILS
>         vpci_remove_device -> xfree(pdev->vpci)
>=20
> But what about the other one, e.g. vpci_process_pending is triggered in
> parallel with PCI device de-assign for example?

Well, that's again in hypercall context, so using hypercall continuations
may again be an option. Of course at the point a de-assign is initiated,
you "only" need to drain requests (for that device, but that's unlikely
to be worthwhile optimizing for), while ensuring no new requests can be
issued. Again, for the device in question, but here this is relevant -
a flag may want setting to refuse all further requests. Or maybe the
register handling hooks may want tearing down before draining pending
BAR mapping requests; without the hooks in place no new such requests
can possibly appear.

Jan


