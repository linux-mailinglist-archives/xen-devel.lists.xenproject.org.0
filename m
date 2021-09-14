Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A140AA2D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 11:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186322.335045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ4Lm-0007Tm-Ug; Tue, 14 Sep 2021 09:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186322.335045; Tue, 14 Sep 2021 09:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ4Lm-0007R6-QI; Tue, 14 Sep 2021 09:03:34 +0000
Received: by outflank-mailman (input) for mailman id 186322;
 Tue, 14 Sep 2021 09:03:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ4Ll-0007R0-J1
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 09:03:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a25830b0-153a-11ec-b405-12813bfff9fa;
 Tue, 14 Sep 2021 09:03:32 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-mi1iXnl2PI-17Kl0tCCJxA-2;
 Tue, 14 Sep 2021 11:03:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 09:03:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 09:03:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Tue, 14 Sep 2021 09:03:24 +0000
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
X-Inumbo-ID: a25830b0-153a-11ec-b405-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631610211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H9qvZHgpP4wC+33f5cI/t8e1yMNPzcANf4auAbyuyDY=;
	b=MKHEdoP9wxRVnw2jShttH3LVWLe2Gt1Zkh9X4BHcCBBj86VMB73axUW2/MjIiqb1ggJwyV
	K5hBnselFJyz62CKOzYUpQTHHPupdOEZIAkJbOkKA6qqYZBSbyZ6BNovQs+LGIN1zKubLp
	02WILRnuKOnLWmnhu1bEGCzFV1agx3U=
X-MC-Unique: mi1iXnl2PI-17Kl0tCCJxA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGIbY7rmsEl3VFNdXBGzDzjBjHPciqJmGMCPqMzI3ihkiV3r0gp1dkWydrczcU2hykMnVXiNYgqjc49cctf+pC1ijgC7PF3gV0tDSARuOHhFJY43+qQsU/um03l0UEgyUROEVW36kYonkT9JuE8QufyigqsKpzt/ndPU6LQ86lPcfnbkW5N0jpGj/sj61rvey9ophhvsXXY2izVNWrvHXpmaJFPk5wjnbJecKbbUBY6CvpUA8nGRYqsR1PQBxXadFjLLmbELixZGgfCiA1ktU84PuJDiVdmUTqHZBPr+dzhiwJKLZhoxQwTgMARpiXH7RS7ipnlARlS7utFmbWJd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4Wkq6JSIVgMF8sknRxAM07SqcyyinocsLxyGuOdW5Zg=;
 b=LsyGglzlAPAhJl9G+HQGC4gTyOFBPpSWB33iZVQ+m17+RBpF2E0puK/RyWpLb/ID+zl/15BIt5w+8EPdCiiQqvHmZNFkm2INpScXBWNRv+vJSDQnEdA9ty2sHCZt1aEQHhwhi3GsnXS2MqAOCzK9BUr5+RQ6S8L2y54Pjp2X9qpnhl7S/PqSVIMLa/J1mdcWB/YZJ8n7GndrPZxxQSps4ak7nHUqn+yjuFDnIxyFbPSQ0mPZRddXao5mxGyv4tR6foxfzzbTXVLET5RnIaXPzj4L7BhmXF39i35lQKIdlFEoL0NGUlW0/Hi6pw3LGVeI9FNy3pHWOEPPUd8D9Da5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
Date: Tue, 14 Sep 2021 11:03:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b263a4c-9b5c-478b-0bdf-08d9775e8282
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233535318B326EE760374439B3DA9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xqjmwAmz8zxviBjQ+6XNu+yWpToqzEsGPsfKn6WuW0Qp+ltxsteJN3TRZ2KZToARDrrvw9vzHwCIZVXRMQiGKh9+CRDwDP+aULKpqLeq66U0ZqoyVGe2xo3XYtlQIt2y+Q5miUKBth1CzhvwSqY3NNmhnYDm4ezFXjFnj5Ic5q8uAf/MAdqachxtFklFu+zS25xzR3OIh1zb3H9rtLSNa1Bls0sHzozTsaHCHp0wJdQsYZ+Bg1yJav0BCVsSd/YTxp2c50GMcZnr9o0lqF6haJ8lnD01Fbu+OJhHRM/cOqKMp+5/DMAkiwosbv1Q8J0PGO++sGi1ZNvxYs/vpOEMkzuAvGDUUPS/3LHh+Xyi0N7j8Mpzhdde6cXyQbo+3RBmx0V4UFGV1iQmNsdFR6OFc3Zv5CqBefHbwkBv8MKkqF8lyN56Sxbqmg46OZr7CIkZb+bK7082sDy8VfnBRRP+pdRm8xJadIIBNOonb8iz3wntaWfyg4JdrTOOawjEGJt57nQaZXmFLmKOAXgmwKPSyM2mKZ4XN43fLoQcnQMXBtpIL3hXJ4dkKslpG+rv0ARGFL1bDoYA82ATHuMzhPm83XjJyAA3hdqHhHeUdQhAde1+VKrT7Nx58UX5P7PjcykJOwfcNpLpkUmQgnVgSSC0wlwPhZoQJcX314/u4DCUssDrLfjTHsTSYhkwusrFaRrc67MHW84jReXLEpRvBv1GIOs5avzyEcadJusVIiLC9CM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(346002)(39860400002)(396003)(31686004)(6916009)(31696002)(38100700002)(53546011)(478600001)(26005)(6486002)(36756003)(186003)(8936002)(8676002)(2906002)(4326008)(5660300002)(83380400001)(86362001)(66946007)(66476007)(66556008)(54906003)(2616005)(316002)(16576012)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FiLW94DEoSHlznonFQyTTdlUgDUGoucSBqdmXqOuXmhnr3IHzdBPval155kI?=
 =?us-ascii?Q?af9JZZfoZ5oA1bB8bNm5GWMJg2b6PaQB+TlMi8bC6ERqlumnBliPMIuMpWrl?=
 =?us-ascii?Q?SKKRftvSmM+9jaRWu7YyGyLb/9ZD47szaU5bF4002eQL/7wRH+dMN/iDIuCw?=
 =?us-ascii?Q?7srqW0zpC7iJxjR1LB/Oic1qda6lXpzRJv/eWjzE0aiTPYH/bXQ8H1OGejFT?=
 =?us-ascii?Q?0x3bYVjagkkx91YwDKgRlhqjhlfKNkew1cPMp0Fq11GWR19m/b63hQ/u6IJV?=
 =?us-ascii?Q?CDHjrVrnPpGbsTJOpcVZi9y1FBknuH9X5yUpbnp85k1/GFsX8cwegZhim16P?=
 =?us-ascii?Q?FJjQWPzRmUrKrMttBdyxPmxMbo7VIi2DBRNRLAFrzj1gTTIdfNCDcIKuwJGd?=
 =?us-ascii?Q?dqVShsIG0fwGU2qad1eQ5R3SgW+a54QBADDGrXDikizEoHNSUm8Zo2C2UZa2?=
 =?us-ascii?Q?hvxfTw/Ffi/08u5jIVZ/g6tv4bYLXkW9id/iA15EWgviXqY2G+hmaY04r0Lu?=
 =?us-ascii?Q?q73avxZrbQK8GaDzkH0Cgt67Z+PrTDMfuIexP93XWr0elexT4EoGGv31y04B?=
 =?us-ascii?Q?4atYsEzNQi35OcrXtFxA9jWnCjP4tWQe/Vrag4yoggIVEJrkfr+3LZwpDicz?=
 =?us-ascii?Q?h1OhiU3l2r94UFyX60iCpdVmDPPZTZLePRf9Jh4zzHd/PVbmQPZgabPB20K2?=
 =?us-ascii?Q?1m2phHlck6u8FDBgkIQwhhQtjbbZJBsFIUyZDd80WKORub8cNa1+4wvqDe9k?=
 =?us-ascii?Q?+RZLtka46T02F0+IeZ9XhQL4kUIDy1IXZd+1xndOXYXao6+u8z2/eFrOcxx9?=
 =?us-ascii?Q?kznee/CtHBs2Gb6nw1guaiR4FEHrZ+b2LmpIopPxz3FUFgl/k+ha97JsI/Yk?=
 =?us-ascii?Q?CEFWxI/Y5Xm/Z7DpLt94AZvLpGDpSU4uT30qy+tXFqxIkpQiHgYnXvz+mRqP?=
 =?us-ascii?Q?NJA1ql2pJ5owvr+ueajSmdyY8MolEGvqrpRZkf11bWt9fvzMUh5y6Ga04+0A?=
 =?us-ascii?Q?Fk+0PeNSvVq9OlCBvYosOqjJoGsKVLrsU+QGDSrOn2MgLbqhf1H3B7mAdjJb?=
 =?us-ascii?Q?pOyqQfc0Xhf+obpNtNdq3NQdHE5y43mTSyxhpQ3Jym6BLkTijp7n0cZSYLhq?=
 =?us-ascii?Q?hNSZyV3skNJJrCno7SDoYUSUwBCTR+p+3C0jN+NnfpMQlbf9ltytYtRlfoRv?=
 =?us-ascii?Q?wLE0qDtDfFzSxmb07nDhL7n9cznW9sdwBAg14ZIEMba3vfHbrQUt/0MeFOgw?=
 =?us-ascii?Q?FfNzdVcss1R4vYTZADAod9XlJo7s12XIf7A4aRROlRNB1+zDHG18Vcbladlh?=
 =?us-ascii?Q?gi35TDoOjFF3OZseBguhO3Kr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b263a4c-9b5c-478b-0bdf-08d9775e8282
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 09:03:25.1247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRx+2laN24xk1SqO72Ez6FFFP0qvuRgkFeYObezdwhQNN2Lh4NOm45tg8oZ2T9gJva3eLKae9KiqGOJo9k595g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 14.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
>> In order to try to debug hypervisor side breakage from XSA-378 I found
>> myself urged to finally give PVH Dom0 a try. Sadly things didn't work
>> quite as expected. In the course of investigating these issues I actuall=
y
>> spotted one piece of PV Dom0 breakage as well, a fix for which is also
>> included here.
>>
>> There are two immediate remaining issues (also mentioned in affected
>> patches):
>>
>> 1) It is not clear to me how PCI device reporting is to work. PV Dom0
>>    reports devices as they're discovered, including ones the hypervisor
>>    may not have been able to discover itself (ones on segments other
>>    than 0 or hotplugged ones). The respective hypercall, however, is
>>    inaccessible to PVH Dom0. Depending on the answer to this, either
>>    the hypervisor will need changing (to permit the call) or patch 2
>>    here will need further refinement.
>=20
> I would rather prefer if we could limit the hypercall usage to only
> report hotplugged segments to Xen. Then Xen would have to scan the
> segment when reported and add any devices found.
>=20
> Such hypercall must be used before dom0 tries to access any device, as
> otherwise the BARs won't be mapped in the second stage translation and
> the traps for the MCFG area won't be setup either.

This might work if hotplugging would only ever be of segments, and not
of individual devices. Yet the latter is, I think, a common case (as
far as hotplugging itself is "common").

Also don't forget about SR-IOV VFs - they would typically not be there
when booting. They would materialize when the PF driver initializes
the device. This is, I think, something that can be dealt with by
intercepting writes to the SR-IOV capability. But I wonder whether
there might be other cases where devices become "visible" only while
the Dom0 kernel is already running.

>> 2) Dom0, unlike in the PV case, cannot access the screen (to use as a
>>    console) when in a non-default mode (i.e. not 80x25 text), as the
>>    necessary information (in particular about VESA-bases LFB modes) is
>>    not communicated. On the hypervisor side this looks like deliberate
>>    behavior, but it is unclear to me what the intentions were towards
>>    an alternative model. (X may be able to access the screen depending
>>    on whether it has a suitable driver besides the presently unusable
>>    /dev/fb<N> based one.)
>=20
> I had to admit most of my boxes are headless servers, albeit I have
> one NUC I can use to test gfx stuff, so I don't really use gfx output
> with Xen.
>=20
> As I understand such information is fetched from the BIOS and passed
> into Xen, which should then hand it over to the dom0 kernel?

That's how PV Dom0 learns of the information, yes. See
fill_console_start_info(). (I'm in the process of eliminating the
need for some of the "fetch from BIOS" in Xen right now, but that's
not going to get us as far as being able to delete that code, no
matter how much in particular Andrew would like that to happen.)

> I guess the only way for Linux dom0 kernel to fetch that information
> would be to emulate the BIOS or drop into realmode and issue the BIOS
> calls?

Native Linux gets this information passed from the boot loader, I think
(except in the EFI case, as per below).

> Is that an issue on UEFI also, or there dom0 can fetch the framebuffer
> info using the PV EFI interface?

There it's EFI boot services functions which can be invoked before
leaving boot services (in the native case). Aiui the PVH entry point
lives logically past any EFI boot services interaction, and hence
using them is not an option (if there was EFI firmware present in Dom0
in the first place, which I consider difficult all by itself - this
can't be the physical system's firmware, but I also don't see where
virtual firmware would be taken from).

There is no PV EFI interface to obtain video information. With the
needed information getting passed via start_info, PV has no need for
such, and I would be hesitant to add a fundamentally redundant
interface for PVH. The more that the information needed isn't EFI-
specific at all.

Jan


