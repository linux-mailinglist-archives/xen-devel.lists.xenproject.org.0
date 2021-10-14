Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A0742D57A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209106.365454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawUQ-0002fy-VC; Thu, 14 Oct 2021 08:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209106.365454; Thu, 14 Oct 2021 08:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawUQ-0002eD-S5; Thu, 14 Oct 2021 08:53:26 +0000
Received: by outflank-mailman (input) for mailman id 209106;
 Thu, 14 Oct 2021 08:53:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mawUP-0002e5-9t
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:53:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f363c36c-a6cc-43f6-8131-9443b2642550;
 Thu, 14 Oct 2021 08:53:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-1tyXVwfBOciNOZwktg7hFg-1; Thu, 14 Oct 2021 10:53:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 08:53:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:53:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0116.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 08:53:19 +0000
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
X-Inumbo-ID: f363c36c-a6cc-43f6-8131-9443b2642550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634201603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lDL5J4suLmGGcmf7KGrdWh7Ht3QbfuMeeRREq/BDAA=;
	b=BW+Rz69x6Gu/pM8l0Re63YD+HKNRLtrQdp9IRoR6AQdvO1PNPogFOb+fI+bBZ4sHHTIWCg
	cDUxIH4Fq+dc9sOwVeWjFjeHbnYYqEopRLyOv6HJEUGX6oqxlYNZ2SnWj9igpu9JV1e0VP
	aF6t//bfSjC+9SWCYQfCJiiW/C74A0c=
X-MC-Unique: 1tyXVwfBOciNOZwktg7hFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuAeh15X7nHiLqHk3TSmIDPc/v0PlFFZ/LkZlARHmeXoofX/6lgq14cHWgM0KvbBtIATaPoPQoZGDo4A18rphC8VuZI3T7DRG/1XR8zIzM+3PQNYwzSC+DMbdYc1JP1mfSuqrcKI49fidR2HaM0SPlzEcgC6KbM+3n2ojcLgbwkozqgA8CueQaXNvfiCZJXCCvVsWdqG9S7jTm0/L0sYf5x+Fs1aR288/705Z3vG0GcsQUY7UXa+8YyMk2WMIb0p06I1qRxbfCnwT63w0UeWH7CKxOMSkoyqMRC3HwdN8XVdjn7MYM2QoJ/vvs6FbFUSRt/GAt6D4XmsME44BNDLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lDL5J4suLmGGcmf7KGrdWh7Ht3QbfuMeeRREq/BDAA=;
 b=M38FxTKjc5RbzZJke4H5Zg4ojwjYbrplksaH9OtTdCFeePqrgJvFV4FVkvY7pnuWLmhoIZjHet0AGOmPrboqZobe5OekDrNQZZcGErhoG7xBYPtm0r10qCcia9/LT/7EGgBB93I+1WNKagdQg0ZUfnB2ry8oOR4jJXFqEXLEzSTGMg6ZDmELiKXO7xbN9MQB89aSCGxXX5TJEP8CQ1D2GNwSWpMNxcNcZ9h4nR0oFve3Y4JkgofkhGDbDoPdITLcyljU9THCdzsRJx2Ta9ZnmZzYWCGgMxZtVJfmSgYBELzA87PLPAtFgctesVd44SCPaPsoOAXhNJ1YGvCaB5E7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
To: Michal Orzel <michal.orzel@arm.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211014084718.21733-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd36ef73-c227-1ad1-b8bc-7004b98c5996@suse.com>
Date: Thu, 14 Oct 2021 10:53:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211014084718.21733-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0116.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b2d0471-ee5e-4013-f88d-08d98ef0128d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447D56310B62605B000A504B3B89@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hDeMuEb4SCtTKPp37wCUoSDnRl7Oa1X/f/T3y3FmfsMkTYAlNIC+PHyBve7pE0dYhghxXIA8NZ8iWmI9/r4z/9dCoK4MXLWDvRHXWycDdI0yQ9zOTKGR6jgef18oNbVhq8tFg4Y9f+MkpO0xPjr4dsAI1uLLRl01wvUQAXpOlaFJQQRY6VIlCb/DY4qVeuwiIxmz4vLE1eHsu5jXUWqKsZZmZEs8VjhEwcANlG2x9XIeubqYr+KCf71dhUJQWRCMPKmWYvYGjsg9MhHN4+mxrjJXoxZ4egFNdSXrahc6Yzmo9X5c3LwxEQIw+ZJhU4Eqy+URzdJShJV9xQYM0JCARjYejbBSgJAgfNQ6lU2Ma3UegUVcvg6pyXW0SjPb27P8b4JrHAKxjSdTKBsVTgcP8Zzr/0ozOWN9mBYgs4W/5mJdYyHqO2UB3IHTq3o/V2F2qVdYTZ49QEjef/M+f9kJdiJLSkgKZaHGTVDz3ze/pLFNHeS+KwhBBt9TYRAiqzGBVzNjps9D5R0djx4e7BRyuCfcn5jZjTTkeBFL8VBi2+lk82smDBNM2NrJU06LeIBkQFi+CTjlUcyG7hELYXnaCsnU/HEMWPmyt+SK0+fm35r0aCRgFIK9fcaumPC64cyxnBWXaioAqFYCZcNJWIEWmrprD69nL6WcKC6H13IRuhK1HiBSDa8uWC3JPa0a1l3QeHiVAG+pGVpiRdoNCEWgFnVEd5jZqHB/5FPNiY3qg+YNw/aZM6jCEU/9Cmkfmb7q7drZRBmkAWNlL9yWv0fnUL5M06DybdmsYFCJ67WQ9s6iPI6nl9YuOmdsblSnW75C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(83380400001)(36756003)(86362001)(5660300002)(956004)(31696002)(7416002)(186003)(53546011)(54906003)(6916009)(508600001)(2616005)(16576012)(66556008)(316002)(66476007)(66946007)(31686004)(966005)(4326008)(26005)(8676002)(8936002)(2906002)(38100700002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm0zYWJ2ZmRYblYyTm5nUVJ4L1I3TU9JZ3BPVmd4VFFGOEY2Y3g3L2lJd1RN?=
 =?utf-8?B?b2IvQmZGMjJhVWVmVlltYUkxUFRDaVhHNzNZRVY4OTZyZU5oaVVQMHhQSFQz?=
 =?utf-8?B?dUg1WkpNUWtkT3FRci9zQ096UTV5MnBEdVF4bHowaDVhVFBxRjh4b24xQkp0?=
 =?utf-8?B?dDBMeVk5QkR5bHFFT0hoL0tvekduaDFtZE1wYzlzZnBzdk9IU0UwbEE5MzBN?=
 =?utf-8?B?TmJzc1liMzJqdHFLMWllSC8rOUhkNXNzUmNaOHpXdjZnY1oxNmZ1c0V3Ymxa?=
 =?utf-8?B?cUs0QTZWRDFkc0IzZGNDTGI1d2pmL0xNT3BwOTB3MGpWSGtIL0YrTlNQdHhN?=
 =?utf-8?B?NnVJdnRHcHdSdndsVG11VFZjYW1RT1krZTVaZ0pISi85RUI2YUZ0LzRGNWVm?=
 =?utf-8?B?OEYxampROU5NUXJndExNc2kzdXE2Z1JSRjZaaDhObGkxT1RZdlF5dTUxQzJB?=
 =?utf-8?B?NHlkcUJRdklVM3FhbWptcGZ6ODEyRWpjRm1rdm44T0VZMTdnV3BLR3M5NmY5?=
 =?utf-8?B?RnQ4YmZIV3Q4ckxvQ0FsS1hBNUxIK1gxUDdVOVk4WEwvdTJ0NEFHQVFraFh4?=
 =?utf-8?B?eEdyZUMvSkpOZ1lobk1xQUxlTVV3MFoxbGIvazQxcGlobGU5cTVaTDl3N1dT?=
 =?utf-8?B?QkFkN3NtOXRVbjA2WjNBbEZOOUt3TzR2ajJpVTE2eDl3V1phKzNDS2ZkWCtm?=
 =?utf-8?B?Szl5L1B4ZVg5RXhVM2U3M2oyZlJ0UThVYWZyR0Y2VjJjRnAxSjBKbmUrZzFS?=
 =?utf-8?B?aFFYb2svSnBheHh6dXp4U0p5VzE2TzhCeEg2aEZhaUdyQ1o4c1RsaDNoL3p1?=
 =?utf-8?B?ZDlmbWxNSVFXQkgwa2hXaEFrazJ3b2JuSGpwYkxralExY21BOUFQQUcwSnls?=
 =?utf-8?B?SWIwRzRPaExZN0ZvdUw4NEEyRDZQcjZiYzBzZ0xmZTlaZWpLcnNFL3dnVjNQ?=
 =?utf-8?B?cVR2OTJ5ZE5WTVZ4Q1I2Z1Z3Yk9jVExScitPWVhnZ0QvOHhVK1d3a0pXellD?=
 =?utf-8?B?aXZhbWpqSDdQR0NFQUJmNVhPK1FodURCelVWMktTblcrdFpBaU5ZME9meWVS?=
 =?utf-8?B?ZnR3R3ZHYTUvTFdNMVdpYjU1MkV6bGtDaWN2bDFsRzQ1SHlWUWsxUXhNS2Zi?=
 =?utf-8?B?anFDMXFHdVVNb1NMRGFxYW9zKzVoSXFkME9odFBPTGFibUdtbnppVVhrWXhl?=
 =?utf-8?B?YzdOdlREcUJrNUM2Ull5ZFZ2QzI0YmVxYXprdUJGVjVVdHRGcUFVOVZaM0tD?=
 =?utf-8?B?SHV0SHF4a1I5akI3RXo4SnN0aVUxRkNGWFByVmh5RU1wM3VpK09aU296L2FU?=
 =?utf-8?B?UGk1Vmg0NU03Vit2VmFzSkRmbCtoWUZRUWFBR0NyejNSK1NCdVR4bGU1NjRT?=
 =?utf-8?B?K3RsZ0dyV2wranRPaUxPQTFnMWUxNWhPMzBKVHI0ZTBPNHA4Umh0ZzJZSGFl?=
 =?utf-8?B?WDU4Ui8rUnB3Z1cvRUFndGtEYituUEg4dmhYVjV0cnhCZVFHa3NxOHQveGZn?=
 =?utf-8?B?L2V3UVBQMDREV0ZxYjVZYjlXdmhYeWVCb0t4ZU54bVVCYjlmZGpzUlNyTVpF?=
 =?utf-8?B?RC9vSE1pN2plYUFjaWRmQ29CNDNhUFRmNUZoTlNZZ1BFbG5sU1d6NDFTMWlK?=
 =?utf-8?B?ZXNSditzRzFpY0JSTjd4a3JJVFdMRFVTNnVjeXc0VURvdzN3bHJDUzJ2cEpL?=
 =?utf-8?B?SWlUUXd5Uk9CckRKT0Y5N01uNFI3MFhGbHVpeHNBYnlYSlFXbW1CM0NqMlAz?=
 =?utf-8?Q?ooGPDFqXuN0cJkI/hVe7VXpmO8vQGd1sTTVCLOB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2d0471-ee5e-4013-f88d-08d98ef0128d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:53:20.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZhyBz0ieIv4xQsccGQmAxVsBZXc6joXSlM2LJx36LF6Fkiln2Q4H9yoC3GyYxIRXNfsODlDJ4S8JlrlZofcRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 14.10.2021 10:47, Michal Orzel wrote:
> This reverts commit 2075b410ee8087662c880213c3aca196fb7ade22.
> 
> During the discussion [1] that took place after
> the patch was merged it was agreed that it should
> be reverted to avoid introducing a bad interface.
> 
> Furthermore, the patch rejected usage of flag
> XEN_DOMCTL_CDF_vpci for x86 which is not true
> as it should be set for dom0 PVH.
> 
> Due to XEN_DOMCTL_CDF_vpmu being introduced after
> XEN_DOMCTL_CDF_vpci, modify its bit position
> from 8 to 7.
> 
> [1] https://marc.info/?t=163354215300039&r=1&w=2
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>  tools/ocaml/libs/xc/xenctrl.ml  | 1 -
>  tools/ocaml/libs/xc/xenctrl.mli | 1 -
>  xen/arch/arm/domain.c           | 3 +--
>  xen/arch/x86/domain.c           | 6 ------
>  xen/common/domain.c             | 3 +--
>  xen/include/public/domctl.h     | 3 +--
>  6 files changed, 3 insertions(+), 14 deletions(-)

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


