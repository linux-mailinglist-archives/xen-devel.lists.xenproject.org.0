Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830342ECB8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209948.366542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIra-0001Hq-FE; Fri, 15 Oct 2021 08:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209948.366542; Fri, 15 Oct 2021 08:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIra-0001G3-By; Fri, 15 Oct 2021 08:46:50 +0000
Received: by outflank-mailman (input) for mailman id 209948;
 Fri, 15 Oct 2021 08:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbIrY-0001Fx-CA
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:46:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b87425e8-3b8f-49b9-a4ef-268676f54f84;
 Fri, 15 Oct 2021 08:46:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-f7BWRgjHO9ax80xbqc-NbA-1; Fri, 15 Oct 2021 10:46:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 08:46:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 08:46:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0393.eurprd06.prod.outlook.com (2603:10a6:20b:461::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 08:46:42 +0000
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
X-Inumbo-ID: b87425e8-3b8f-49b9-a4ef-268676f54f84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634287606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9ZuMCTs+lIj/8Hj1q2CDClfVA0P5EBBRDSOqG+rdYA=;
	b=HRb1uE5lYdMnmSZp1LJOGEe0ZgxEunzTnQgl8BIFJnzqYdxMvAHGI9UhSsZ7zOklTMc6iw
	qq5hxgRXfHHiFqUKjiYkUQrcDkfZBoJgNxAH7fUJMwyxff+KFTpYm+5DO8jFiM8x2+Oblc
	tXxOhGwHq9B+h/afuMWBkm/JSwhKpJ0=
X-MC-Unique: f7BWRgjHO9ax80xbqc-NbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5uTaTsAYj4L6OZDJaYRRc2If4cZ9W5AxmUetRjku1Z9eRafREkm/fM1F/WMe34dLtPKhKzTpXdahT6qHasP2Y2ceySBXsapEZN6dV3FcggbPdRg9NPGc/S/zlBDvjCjZEdKdRyO2r2pG29IfiT02CItx1QYl7EYu6gT4cY7OaZVGmY/JuD26DEvVgqz3mwpVSvfpiYq3EYKnmIhBEHOsZCuXeq+DHI09EnseAbt9waMGHxQ0I9yHolCzYtxX0yxLos8GF0E0l25hTvi4SzSRJhi9WGPscrFwveFapXNipls3fjV2fjdBSJkEggsl8CA4UFTmfjS4pE+H+t5kZVeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyvRoloTOWjWUXSGIpwSFTfMd1GNqAm6Q6HANk4lEc4=;
 b=fcaoEPRwbLC8Z4tZoDjxb4th2blAjZY29xt49QR6HYH/o42g/n+FEDidvh+LrLhRjKSUbfl6umKALhxavCub7EN1yKx3DLjhjK9pJvzw/ftxe2fSYikMRXRx1076WQScRikdi+Uuz0M8rFieyZwFvrYaTXglDwyBBOZaD4pcEFcWNyxqKh0J0Oi7rFgNVZOeT1ymrrjaf2Ac8ih8j6Pyf3y1E8Nm9PD+tRDt5dQRr6n5naOc+dxJ9lATTD4DeZYzwTqrAeiScgN7GN2Rwq3pJ6TqF2hRLpe/G+89npJod9/2hPGtPC2tikj61OW2syDcBmJOQmXgxLg56BwEqIpc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
To: Penny Zheng <penny.zheng@arm.com>
CC: Wei.Chen@arm.com, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-2-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <073d4b36-cb2f-88b2-76d2-3438d4ef589a@suse.com>
Date: Fri, 15 Oct 2021 10:46:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015030945.2082898-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0393.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 122ac8a4-3cd9-4d81-99e2-08d98fb85064
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64786804085C9876BE1D1A4DB3B99@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NqA9BU8r1wNtoFuLBhyaXPwTgyk7ZPrwGr01hp+9uHqECEkvGHGo97T4TrI5ydM6SmNNeLPJ6quzPQpGp7OiLXTSFJtTsJEtHzAbiimHQSpEJ6KnGofWrTT4+U2birYQQTjBbxPQLv+3UQdLdzY8JuCfXEpzQYsEOzSpvfRGXUgk38bZTJ+IVPzqk/OuZrpoVN4yDNYx1MLuecS1qPPmwUYNvuFUKNKU3AsvbpGlGNHbhgsunSRj/LPOD6emWrfgCWvhA2xzrMD4JgmvVurm4xDK1fh/qWSaMT1n6fI7YB3uxBgdgo1qs5sNfHT5rzvXSZv54DUoH3H3nSbh8IbbqC/KV/SHM9fqxQTOM+W0nOAuukMj4jGVK2lWhVHPLLSEL6cwWes2VX9zzBcWrnXpUCFp2D+2EeuouOz1SN5E5HSgh89XUiIhAGlsDFJgIPdoZvUCbPs1hk4EhBgwCD+AwnisWxx1Abdls7HTplQ/87ounFb0eP662OVMGMY85RnSI/cEr39yli6jEPBnSVZvikJnP4CdIDMPckQr/RV2LfVwQFr8Fchitcx+b27wq27B/PKOtRtW7efhbcNnDDQS95AVEOeRa4Ta2U+CM64Bi3OeXwiDOmYYLRsYVQbt4zTend6K4sdkR4RtT3CaI5XH6kBvHMa7u7CX57rE6CrXwjefGBpP78AVq48zHZDKokl3RVpwmtDc8GLYQ1dAlF0k0NtTLHPKtwoXuETmabE08O+S02F7uCwLoW/BaumO0IiB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66946007)(4326008)(38100700002)(66556008)(53546011)(6916009)(8676002)(66476007)(2906002)(36756003)(8936002)(316002)(86362001)(16576012)(508600001)(5660300002)(83380400001)(31696002)(956004)(186003)(31686004)(6486002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UaLRT/2EUAsX21M9pRI79BYVEJ6i/5AvGUJB+E6ne7v7wRE/gmWsB+EvfBIl?=
 =?us-ascii?Q?aWR3hsygmwX4A+UbapEFMBHkspHTBQ6KhWXua3ko6e3mrh0NpaO419pQpnf1?=
 =?us-ascii?Q?AFRkJsUKG0MhjaBocAckfMQ1/vd3sB6ZLGxuoGXO3uaWGabA/Ucy7CUhc2Ww?=
 =?us-ascii?Q?bflUPGLs36NIA4MLJun5INeJC4rkk7hAnrzpqzyMhPMKVQ2re9TavX8pQg4z?=
 =?us-ascii?Q?t54I3h7v37tKV4zXxPjr98z+e6BiI36FDpY5lzmArxFtBj41kV1ZfOhD3XLu?=
 =?us-ascii?Q?8TRU/m7zdQ2/WPiQI0A9KKHhvIsXAV3PnKgVS/EouoLfyhtD3kcIRf0QSMnX?=
 =?us-ascii?Q?pC/+yYN6MP9f7iozfD/z7oTMQvFD5MQYOwCmfmzSevODCMTJ823Mrqkpruue?=
 =?us-ascii?Q?9XLa9dx5w+iJfNfayFcLALpRk41gw863m3LkqtHx+LjIK7PRX+6/Ij1rVY/I?=
 =?us-ascii?Q?OTrlLwoCcWv7ReJS8dwuB/groH/tI6nUqBb3WsxAPagQ7OKKb89+U9SV3oG9?=
 =?us-ascii?Q?wD3B5M+aROUMhXGG2m0bvAzr2byg4gNOH5v1Z70Y5avUIvEI3zXSfukhdueQ?=
 =?us-ascii?Q?gE00iMbSMqUmOTuQY+L12BSYD2ob0wUGCcKakDgVG//woUJhPc77ZpjBtlwz?=
 =?us-ascii?Q?IiGBLb7bJjBZocQBJz+UN1vTH+mw6n9PQ8RpatEj9KRx+dBBfR+7chvOo+M+?=
 =?us-ascii?Q?62YVx6EB+GrKf0Tns4q8zEm1iWto7Ci2cO/ZguQEIdcSuuqvy2brt5762hao?=
 =?us-ascii?Q?iTfRFHTM2gMFRP9CtJjqQNZLQapHNg2gQwZByVfuNCidvvraJK+uIEALLjP/?=
 =?us-ascii?Q?x37XQvGEwX/JeDtEpj+MMHEUpLWTL8Hh5fQn9EmlGtGMW2Jx3K/vNoOVAzIF?=
 =?us-ascii?Q?qfq0JNoFtEz8KooxUDa1/CtJjZdMkj/Sm67rMOc23HaKKFjn1zQWd4grGGmd?=
 =?us-ascii?Q?aC6LPrDd6P5eMagNmuuNXX2bgO2ZePgzUpCj3NGlHGvdg+qdfnnf/1DOq63w?=
 =?us-ascii?Q?uwNaI8YrxXCJjoi6LJk8FiftnMlS06M+VQT7zzPWgYGoOxaUYCFLx1HHpfKv?=
 =?us-ascii?Q?d9tShB78BkFd0tqzQuc4NNT7YxIoMUIRKgChEX3QOSMxQlaULGkKt48EIzCK?=
 =?us-ascii?Q?Atoxz1w6IRLhLnbfH9iri9bqgh+zqe7j2SI5O+//SU5B2TN3XooTvUFVebSk?=
 =?us-ascii?Q?shg6KoxK105HubacG44rUnmzthv8Fso5khNFXChMEqJzYoJvUMrbsh098J+h?=
 =?us-ascii?Q?1UG2ErpyZ/GGyz5FZLUSqTlZ93ei6K/eoFqv5VTn+FKAp0Dg64G65hzRu6/f?=
 =?us-ascii?Q?fmMwRApVjPKwgWhz4LyZn7oX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122ac8a4-3cd9-4d81-99e2-08d98fb85064
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:46:43.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQcorq6afrCIqg6/AJL+4XYy9QNS4PUwh7JzNe70b8h2pUfelMNPqqCUrqRdOBhVSjhFkabzu/Z+c6EryxL6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 15.10.2021 05:09, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> This commit introduces a new arm-specific flag XEN_DOMCTL_CDF_directmap t=
o
> specify that this domain should have its memory directly mapped
> (guest physical address =3D=3D physical address) at domain creation.
>=20
> Refine is_domain_direct_mapped to check whether the flag
> XEN_DOMCTL_CDF_directmap is set.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> CC: andrew.cooper3@citrix.com
> CC: jbeulich@suse.com
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> ---

Please have here a brief log of changes in the new version, to aid
reviewers.

>  xen/arch/arm/domain.c        | 3 ++-
>  xen/arch/arm/domain_build.c  | 4 +++-
>  xen/common/domain.c          | 3 ++-
>  xen/include/asm-arm/domain.h | 4 ++--
>  xen/include/public/domctl.h  | 4 +++-
>  5 files changed, 12 insertions(+), 6 deletions(-)

You clearly had to re-base over the XEN_DOMCTL_CDF_vpmu addition. I think
just like that change (which I'd expect you to have looked at while doing
the re-base) you also need to at least fiddle with OCaml's
domain_create_flag, to keep the ABI check there happy.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -72,9 +72,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt=
)
>  /* Should we expose the vPMU to the guest? */
>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> +/* If this domain has its memory directly mapped? (ARM only) */
> +#define XEN_DOMCTL_CDF_directmap      (1U << 8)

The comment doesn't read well; how about "Should domain memory be directly
mapped?" That's if a comment here is really needed in the first place. I
also don't think "Arm only" should be here - this may go stale. What I'm
missing in this regard is rejecting of the flag in x86'es
arch_sanitise_domain_config() (or by whichever other means).

Jan


