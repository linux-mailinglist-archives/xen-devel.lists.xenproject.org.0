Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5E51C3A7
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322223.543467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdCY-0004k6-HU; Thu, 05 May 2022 15:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322223.543467; Thu, 05 May 2022 15:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdCY-0004hc-ER; Thu, 05 May 2022 15:15:34 +0000
Received: by outflank-mailman (input) for mailman id 322223;
 Thu, 05 May 2022 15:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmdCW-0004hM-Eb
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:15:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3414e157-cc86-11ec-a406-831a346695d4;
 Thu, 05 May 2022 17:15:31 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-7Oef4D1ANEud5w_wnkrvHQ-1; Thu, 05 May 2022 17:15:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6238.eurprd04.prod.outlook.com (2603:10a6:803:f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 15:15:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 15:15:26 +0000
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
X-Inumbo-ID: 3414e157-cc86-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651763731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yihSiwarPDnvfk7o4C8HnKUgN8VoVMYPR861ym2dfbM=;
	b=c6PBoYB9eDHWcmFT5PcTWRxnvwyP1DXzJQSz21CPoRR6zqAghFa5BoZeR9sC3vr8ciJrEA
	dvwX6TLSzaTvORf2pfYOj5wJ/4Mn3565s8d6k9A1dIauVr5BZRRXxjvGKKmznbnmyUk0w9
	vsb6brJ7kzONdSfwZJnCeN62H2uLuwY=
X-MC-Unique: 7Oef4D1ANEud5w_wnkrvHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu7E+tvUwVYjY1RaKH1W3fY4tzuqq52BKAMsM1X6OXJOys/tnyJg4dIe/dhta8m8l9mTonH87yxJAt6D2EFMwjgprSBLDU3A64xsbKDOGM0dyJuX+6OkA5dnZKO43aUzRd9ZEf1uBEodioMUiDKB1U/Wj7RKt3fcjwjrWVcJhwAM66crWdCY3up+UP0nTmPjwQNPLxmMIrMOkfAxuvsd3yEBVWJz5LGdUVildt1erjFvxVumkgssp/LwDdhDHBgfB2QtuHTOXrpjkRjuGZ/hxTwhxQtPlqbaq24pwKNtVcB0QPBvQmE8886uQ/rAYdEO0bEauAPTKp2PshnTsQET0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGPbe7n+ppCH/NFgEAesNGBq2Qrdlji7V/V2gbxDBpM=;
 b=aAPNbJTp+PTDZ3onTLwhk/7eSG8afWqnrTXyGuuEyOT4rIJ4bdnyZJhiQNRw0FKloJ2Q6lEV8TB3qnxz5AfMtW0ArDCt7piSwPJLLP1JOXcrt0+USPM2+CmOXUS8Ct0OnJys8o2MK9plNU6VM6BZjw78nFMF7HPRYZMf+TKkLwLcjhLkuZbgdQzHThi4hbLfXCwugHZatkyogM407JuHfuuA8DC1dd8a11MYq2dhDt+mk1zjX0QtkV8ascRlCjuhlgjJRV1avHz2EvosSpw6DSNDABsylZIXTyCmiT/S/gtShXh44faoBP1ifSRD2sqjcb4ho41UIlCF3i5dXJZafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20537ada-d3f5-56a9-8cb5-f274209c36e2@suse.com>
Date: Thu, 5 May 2022 17:15:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] MAINTAINERS: add myself as reviewer for IOMMU vendor
 independent code
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220505150454.51710-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505150454.51710-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8a0d753-9eaf-47ec-ba78-08da2eaa1564
X-MS-TrafficTypeDiagnostic: VI1PR04MB6238:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB623847659CF33D8DF54F8042B3C29@VI1PR04MB6238.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MtLryPuHxV4q9+1ig956D0dj5o9qerEU8DWlujffhLsB62bmobm7c89zwBNvvoPgnpne25w8A/+EID5axJPE9MVoxBSJnig5MeKmgsRzwQoGpWNRb0hfqWATANkL2u44OtAt+OOgO4iYie5jWF1QcQB7yYhVblMF9O3domyUy9382pmIYeeVY0CmljVFMbARwGvATFTSjFb7I+BakeGTE8Zl+hVOxXpwiEFJ5dvTlpSdxSdcIYJIb1lWd4wkLLV6g1WQAXeMk+wMb3T1RbQC0jYsoDEJS5K9vlGiXie+O3IKOdPKjhKhE2PltdZS4CCG5xmhrEhxAf84KGFdvxcDk+/QS476zH0QqJtGufkyytNe69ky/rWEntBNYSRjNNT9IwDUfGDaLLjpx7/VVlm13k0fDDJGGE3CuygvfJ20Aa4ALbkyB8Ti5Awst3/td3JuX6NMUmG+RIMBK8cGBAEr0mHd2SQP6xrOBuLLmmxs7Y6+TmTZj6Q0681PDlNdwkg6qUNe08w1QBAiok0XUZWoMjO+ZCDVMlX4cqivlgAYl/rxyhdT6DOZ6ndb6fhorNAz1jGKsFdDXQw5On2bjotIvRdGWP/j7TBtNWY1QyvPZEk2OOieD06/dcwXpg77OF/7Jej82A3TYVyv4GSXHVt5uTbMRTWPn7sQBYuOLqcPcMPtVLZg603d5jkkpxibvG1tnQYL/TM0nSyZxTNiih8BvUxT+wVUBY2yIQ8ltKb0vzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(86362001)(186003)(38100700002)(31696002)(316002)(6916009)(5660300002)(54906003)(36756003)(4326008)(8936002)(8676002)(4744005)(66946007)(2906002)(66556008)(66476007)(53546011)(26005)(6486002)(6512007)(6506007)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yQxkuNJk0P/JQ1vZpmvJk5nL+DPBmhECXtEN5khHWVUNpEnLIjyTcW2jg3/1?=
 =?us-ascii?Q?znBp2GBqKWPYcOzc+5FF/LbZpDnET3ABNKEBZeMozPRBCB05j0fmq+28njnh?=
 =?us-ascii?Q?KSHElPBF3h6ZtR1Ge/EetTSvuXH80/6SDnrOhG/xeIzvM4rjJT+pYo00mhu1?=
 =?us-ascii?Q?8WPS32FcCsu8fPOO6RNRQ43/ih09QZUvHjIuo4ENw2qBtz4jl199gffM/4UA?=
 =?us-ascii?Q?NvSfW7Op+WrC4iJhjsEbBGmeJYG6udGPIxZw3uYEiCis/3vv4Ycz/6YM548K?=
 =?us-ascii?Q?P/kn3oIkyc5F+1gKeZgWC0zbzWXecO3RMYO6wkyVh0oMcEz90y774aB/+MRX?=
 =?us-ascii?Q?F6bocC2Cp4olh0MDZfgjsjfVdDHnPwe+s3UgUARe0tVdFmoLSruIL16G2F+t?=
 =?us-ascii?Q?4cAEkckXVbnc/74eTN/TFD+Mb/eXfUgwywUnHIt7OFFXp3DGw96IRt4DkvWB?=
 =?us-ascii?Q?rE3b2vqgtHAnu00YPJLQhap5E0w2ZhQG2vLMr9wW4j97RW0vVUaaukAS74Vs?=
 =?us-ascii?Q?i4MGalDvBDqAGmF4PVxNJnq1ZE8tylyFLNnCv4PPHEVQD4AHidXbl1hl8OPY?=
 =?us-ascii?Q?TMNu230xEsXfPFqNrUTNtfswxklma9NJ3AQEtBHOZNmmSzA3KP1/L5PePLg3?=
 =?us-ascii?Q?X1MOmldBExTXvLo8ELa3CPc1Uiit9AiEapAJac8twG32pH+45irc33G7qil4?=
 =?us-ascii?Q?nxqBmo3P6E9GbWDBjxvtYlT+RV0aJu2qzuXZrhWYIKXy4m7F/Eu6kauIy/vW?=
 =?us-ascii?Q?yJa2t3CG4ahoaUs8qi114Dx9Ct4gXcq8/eMLqvTbKLPr/QF3a7svxRByOkXB?=
 =?us-ascii?Q?hVK7Ds6FADVATNpd17wBjLubcgexj6hns/pHeq1OBvh/iWsnnEk3se1gC+XZ?=
 =?us-ascii?Q?XQTgPwjnXS7vTsZB065Nb+R4FOlaso5xp9IdXBsQW1xiX8u+/hlv2HFqpRRc?=
 =?us-ascii?Q?RQ3o+3F8zx32UfSzvorlKZc0hYdj/D294ms5KI/as7jxUb6WjokQAfniN2Xp?=
 =?us-ascii?Q?QTgF70HlvL3PWy2NCkVfCcyWXv4jCzoO1VP+g7M75dY8crJKwBGJQjMGUp0a?=
 =?us-ascii?Q?gZ+73bwOZD5xcDqLBqmvRbVlrpgHZyiiCV9VzfxpHXxjM+rfkZtzf/4TRYAp?=
 =?us-ascii?Q?YwJ720uoxuwthrnxwlsxNEGUHyY+UKbCkk9ZbDPDBc8pMWJ6x+nhPXMFicar?=
 =?us-ascii?Q?oURnvUtpeNmv7hrIPr1ZPmHpd8COkn6Uff1Bv2fDoO0hBEZvl6ieGP8GxjFf?=
 =?us-ascii?Q?UZTbPjkvHW39FQ9Nyg8CGFY/fPx9Eu14SSyU+KvglH4POemv87yfJTRNsnA5?=
 =?us-ascii?Q?EcqHJN2DG1r/LL4WR7+/t0H2ie+2Llb32lvTmxyT1KxjV844bQEGEDZnhSMb?=
 =?us-ascii?Q?B8aEBxcpv1doOLbgCVCb2kJZwsMtbF/0AutUU3okkKzOge38KSwIuQa5BRvJ?=
 =?us-ascii?Q?iEyPYDytLICEDrCAWrcnKdYKft0G0Kgr2HGR7fwHV+DZbgdyDkPVrUj3FTYt?=
 =?us-ascii?Q?yLd7xq+wQJofYuc9Vs7zustzd5EOo3MmwlIPvkhwnyZiBSwnFW/+7ffnr77j?=
 =?us-ascii?Q?42Zrdp4b4Y7um35trZl2R87+RwAFihmEEOPLxoH8FFNLHkxF8PZycJBWf2IM?=
 =?us-ascii?Q?8gWsMJ2JOPW5GD2LjD3FE/38KjgdYT6Cd5DlzodQJY/HannuhMxej8+SOdyV?=
 =?us-ascii?Q?B6T39USCJZp5FM4rCcjusimZBpGOlbX6mKRiHYhlrdfOujwQUroSdQRSrbVm?=
 =?us-ascii?Q?UaGyAkQ6/A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a0d753-9eaf-47ec-ba78-08da2eaa1564
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:15:26.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqs8i6owWPrtBZ1LlHiRGix18tbseUWRDUygjp5QUMYSbrB3OBxb7yvCM05Qb65PiEbScv6/oSWuEU4Sjx/RUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6238

On 05.05.2022 17:04, Roger Pau Monne wrote:
> That also covers the PCI bits which I'm interested on.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

And thanks for volunteering.

Jan

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -346,6 +346,7 @@ F:	xen/arch/x86/mm/p2m-ept.c
>  IOMMU VENDOR INDEPENDENT CODE
>  M:	Jan Beulich <jbeulich@suse.com>
>  M:	Paul Durrant <paul@xen.org>
> +R:	Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>  S:	Supported
>  F:	xen/drivers/passthrough/
>  X:	xen/drivers/passthrough/amd/


