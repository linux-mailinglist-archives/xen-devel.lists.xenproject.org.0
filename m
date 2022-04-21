Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15911509AB5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 10:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309912.526424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhSFI-0001P2-C0; Thu, 21 Apr 2022 08:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309912.526424; Thu, 21 Apr 2022 08:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhSFI-0001Mj-8c; Thu, 21 Apr 2022 08:33:00 +0000
Received: by outflank-mailman (input) for mailman id 309912;
 Thu, 21 Apr 2022 08:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhSFG-0001Mb-2w
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 08:32:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c3bd10-c14d-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 10:32:07 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-_yLNHB5PM7C01kRg5gd3qw-1; Thu, 21 Apr 2022 10:32:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR04MB3275.eurprd04.prod.outlook.com (2603:10a6:7:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 08:32:51 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 08:32:51 +0000
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
X-Inumbo-ID: 87c3bd10-c14d-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650529976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qh8JA2ktFZmnt2DgV9E2856/BRxduDPAtM4hPu9teN8=;
	b=hgjkgRVhopyDzpy2S0ii1zNzanniXrg1Eo4nqlqiXuLsWLpNp9JHc79/gBiOXT6xdfxMwb
	It0IM6SZKAXpGoTYHeGnWbxKzEf0jYFQbNZ1dtwTDA0paYJjqUzSpAGfaA64iAKcuWr1+f
	/b2pGuc8V2197si9EMJpcaEtMstVHQ0=
X-MC-Unique: _yLNHB5PM7C01kRg5gd3qw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6Yz4Ahj/xULAU3xYkvR5LjlrwHIsP6pbcdQZsShsGF8R5y9JtfJbFbdB48T80HdtD1MGl6BNflcSbEZBZxc03bOxzTdOtIttw4U52vcRNdOGKbW4ra88/nQvwYEqt5AGZLGSSQ5HQrynW3VJ73IRPyDnMi91Pkeiz0McSa1A9lJbBO5syI49r3oZZOg/TzVafG0WGdJ5k19ZQWZOmmenyFkmBf0bCahBwBcaG8vq0TGQl329KAoRniFub1Pi+TmedaBtAABNcHEoRHUW7zUxqjyEexdeTQ4QJAV/LQL0YBGCOu5IEu09t262/DFKstuPnlmoITs+bKuSJnoVKCybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJPNkTbujZUJw7XP1mTklYVLa7q+376OQFRedGA2RnM=;
 b=aKZH21+Q1Tx46g19++qJtc3YXOUWF6DIBexWMiA6dca23dijyXDdjVDQt3W6SusheNdu5gWDHI6ski3U9Sjd+38T2LkE3LBhWA10XYnb3KJKeWQteG9ubw6Zav0wU8FA+JgXlGcRwLx865dr/62I2XmnvMskVrXcZtmhVBw3+TPrxwZstQbH13j6XK9T182mj5G0RaTTbqbV+j04KLKBIktlGwyBP8D8r0ZR101XFr1E6ASgqtD64/Vq5f0eAFg1HosnFeTaAUotSEd0BFRTtPSJrUizcu+sfaq46/gEZHQ9FypcbzsRyw4i1y5F+4aU1zcSXT0oIblLkVCFv3DUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a3dcddf-9632-8d4a-7d1a-6cc6e5fe8844@suse.com>
Date: Thu, 21 Apr 2022 10:32:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Ranconfig failure between VT-d and HVM
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <9537f2bf-981c-d4ac-d41d-ab59f7d7ab2c@citrix.com>
 <4095a567-86aa-8311-ed92-730348ab43d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4095a567-86aa-8311-ed92-730348ab43d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a31d5dcb-d3ca-4a35-bd05-08da237185f3
X-MS-TrafficTypeDiagnostic: HE1PR04MB3275:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB32756F36B8528E199F7E8581B3F49@HE1PR04MB3275.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4vdr8ZJnHyA29/oKsA6zQXUb+RRSSI+Z8mcJMYka01phGNZwPw1AkFurR7k2kcy8lr5zQmY2mbOKEL2fGU8081mQ9M2R27PoOGQQeeF/nUHeX3RTs3JEYYUlGc8GwQVc3VLFp/lwuKzP/GUOcR7op6TPyNs2STqcU8Qi6FQx0OvdF/N4r7/4liD3PB+Fek1au/oHXQ/w+jJSKAMo/swzDJsxcaevyQZbvDf1hQlUZ+yGC/gDKZlbSqsNYONpD1oVmRnvybd+aEKVE29Kcl5L6kdwg3KCY/szsfE+IMxFqTOFG41VQhRYIL5Uc0aQwCZPvK6VIb/iVouQO3fKa255agE5ocRHhCRV3hNf+RaqreHdqLFhFwWEVyWTWHw85r9jhvNrxHX1PT88EvivhUK+MbR2h/a/Fmuu4h4QFTdizo+xQDcj6WMQh284qIsWJnPMhGUtvOU023JMw9IDdiUVimSJfbEDFjtSjZ/VLS7uRpYapguhofLezVxJRNETHa9aLCsy0Zh30I1MyoP97ajW0oRMT3zD48GTgCyUPSCegOGr0Z7g7kIJ1l4FBhnF/KH/oEq8pZ6VUMhG7GIwUlmjIzE60xbzfUF2gz2tNVTHeFihXUZ9b6S7+2hK982+7zHNL4fERpoetQyZ8TgOukhClICxYoUsWtdlejdt7bIEoLakzYB9Vg1DWSCbC0Ojsx6sOYBoixoigt48wQ0ygZF58z8IPDGB/cpSacvJ0fK2snJVdI4kuV3+bfr9x6HXzoFw11uhXu14tHOAKOjGP1yepLAq3bKzX6UIN3cFIsFl8L+neeEFDVRkc3CrKX6e6kw4AqeyMpyJZZWu4YX0ay4FUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66946007)(26005)(6512007)(66476007)(6506007)(86362001)(508600001)(38100700002)(186003)(2616005)(4326008)(8676002)(5660300002)(966005)(53546011)(31696002)(6916009)(8936002)(2906002)(31686004)(66556008)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JhmY+AS4zwKKRHrttQflH40CBfhB6hldFiDU7OJeQumvE82l2pqBCE/9bD9W?=
 =?us-ascii?Q?4fiV0kLAebu8ngdCXsG22s7eF0wu3qsXKGRV5mNlP2z4TBRkoOQUpt1Bhte/?=
 =?us-ascii?Q?VPjFmlH8//Mz/sFPq+K7G9L0nmD+2bMwQ26M411QbACvmcMiMP3x+h7lmR5a?=
 =?us-ascii?Q?Bb2aoyFJWorBpxV9LekxvVIi0btbmekFJj1ABT0qrgipc1ZX//PMfIoYnGTh?=
 =?us-ascii?Q?7gwAYnN9ayZ8JjY/T1caRcjD8I8dgCZr46VG1i58m2hQI7tRgJfg7JfnzkVH?=
 =?us-ascii?Q?/+ChjlMJVwQKGpoUM5FchZAo4MWqGAGVyoSOA8trlQqN2OjxRbDaiOdQhOXx?=
 =?us-ascii?Q?4noQEUW2KUJ43nmddzALU+uBrvUXrrf7wKNMn7GOkmU/GVJSzNQuJl/dCuGc?=
 =?us-ascii?Q?7TGivcGPMBmJ2yqS3+vk264OUO161wo2fuF+ELxCo1rM7sKKGzQO4biKUoqy?=
 =?us-ascii?Q?oPXJZ3IVtxkNzcKYNttfHb/+djF6vWVVhSEAJNTllJUoK+rMmpsbFSIoCfsN?=
 =?us-ascii?Q?4c6P1brTZpd/lqunxWxS99j2QwMwU0a2uilR98SC8CcUS9RrielONqljcl7K?=
 =?us-ascii?Q?G4qGYJ4ThOQfSl/jorTDT+RfKpWftJXG+RV2wdxw54AE6ZMKmvmtd97/FVzZ?=
 =?us-ascii?Q?rtL8UOrQt83OpOq5/+ovRRdK4g+wGNQSwcbXRZNkYq3wFDQ00N8GVooaq3BM?=
 =?us-ascii?Q?N9aG8+u5FmcIjKT1dulmsHfhZ8KuW5jgXvPixDIhe5lwGddjx72XXDknJJd/?=
 =?us-ascii?Q?In8hwMEhCJ9H/IIjKsjPfqmFHXHxXXApkubVqZ4EjNVlkGP7JhFN0fuvjVqL?=
 =?us-ascii?Q?uzNh0layxfnYmJBhPtQDYLVesTlyLOwI7hsbvQpIW1FE4Q6bUPh0xCkBCoRr?=
 =?us-ascii?Q?8UoyAOD9SzajHNff4R+cygXsVnYrg2tW02hoKMtlRdjgUDRrQ7qolfhKOV+t?=
 =?us-ascii?Q?nqSqDC+QJAMZcBnUEkgWTms2TTCgBF3VJ+TqMRGzznm0bzxNSdjyw0Pw1Agc?=
 =?us-ascii?Q?ltWrJd+HDwLHu41Wtp8qbwjeKfGGSFcl8CRTo8q0DTY0iOiAbrTVhrHe1Jw/?=
 =?us-ascii?Q?sJVZ1SwhxHm8TaQF7V1k1UpQuUFKK5GoIBT6CcP1iXGgVNTM+i6l7xTogR7B?=
 =?us-ascii?Q?XvnFD968x2Nf8AHnOBy4V3pO9tTlthe+MrGKihHJW24OdcdfrTs0S8LinrCN?=
 =?us-ascii?Q?RND4mUoyEgnoNYvZVTwM87dioWRaD4k5FuEjDeEdlG3nBT+xlQYbSNWe75xx?=
 =?us-ascii?Q?p7l81QPERdfcTPPYntJBmnj2bccnGKKWrnVF2BWLaqiaYuGOVzWxfibr85NB?=
 =?us-ascii?Q?Bi/7R7c9ip9LBCBVRycI4xEKxY+LZXT7DyFIScR2W2yR8OTJyEPNDV7YE68G?=
 =?us-ascii?Q?+UveRteUe+QwbqzFx+8bR4xhjdhYRMF7Bc9BRh6PXh7EE6wJfAyFtaDgYiM8?=
 =?us-ascii?Q?1EYdVqPkzIVvHBZZAOavxDrvbxIWBRzxhxOAV3UfiGk5EV/MD0qmVsCp7PaE?=
 =?us-ascii?Q?kt5XAYuvLKmthshoOotQP5DuigfOTjL8hBy9lHYMUlutCcnUic+rtIohoV/d?=
 =?us-ascii?Q?DpCd9qzvorctFZDVgIUryUHUL1awiEcR9Deo+RE5I+fxqfGuHbJX17Bzssh/?=
 =?us-ascii?Q?IaOTngAVz37hkcXbJ902iHss6PMSECqkobysFY/FXdXhWxiWhueX2PNALb/j?=
 =?us-ascii?Q?6zQzUw69e1JA8YQQLCXwD+qM8nox5GJ251cWYSO0454o7y0mkoC0HHUZ9eng?=
 =?us-ascii?Q?fGlURtiKpA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31d5dcb-d3ca-4a35-bd05-08da237185f3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 08:32:51.3371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSaUDOo+4tze/47pBkqtrdzZoq1qKUeuJ8UyJB/Tql4HUxb6qjqTU5VBOTanv1LjNPN/nZm+57zDQyl11F8y5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3275

On 20.04.2022 20:01, Andrew Cooper wrote:
> On 20/04/2022 18:49, Andrew Cooper wrote:
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/2355562119
>>
>> ld: prelink.o: in function `vtd_setup':
>> drivers/passthrough/vtd/iommu.c:(.init.text+0x219f6): undefined
>> reference to `opt_hap_2mb'
>> drivers/passthrough/vtd/iommu.c:(.init.text+0x219f6): relocation
>> truncated to fit: R_X86_64_PC32 against undefined symbol `opt_hap_2mb'
>> ld: drivers/passthrough/vtd/iommu.c:(.init.text+0x21a23): undefined
>> reference to `opt_hap_1gb'
>> drivers/passthrough/vtd/iommu.c:(.init.text+0x21a23): relocation
>> truncated to fit: R_X86_64_PC32 against undefined symbol `opt_hap_1gb'
>> ld: ./.xen-syms.0: hidden symbol `opt_hap_2mb' isn't defined
>> ld: final link failed: bad value
>> make[3]: *** [arch/x86/Makefile:137: xen-syms] Error 1
>>
>> It's really not clear why this has first show up now.=C2=A0 There has be=
en a
>> huge quantity of noise in Gitlab CI for the past 3 weeks with ARM being
>> offline, but I can't see anything relevant in the large number of IOMMU
>> changes in that period.
>>
>> Anyway, the issue is simple.=C2=A0 It's vtd_ept_page_compatible() in a
>> !CONFIG_HVM build.
>=20
> And just after sending, I realised it's not an IOMMU change.
>=20
> commit c479415610f0448bb07d39185e72ef36e08ebec0
> Author: Jan Beulich <jbeulich@suse.com>
> Date:=C2=A0=C2=A0 Fri Apr 8 13:50:29 2022
>=20
> =C2=A0=C2=A0=C2=A0 x86/P2M: p2m.c is HVM-only
>=20
>=20
> CI disputes the claim.

I'm afraid it can't be this simple, as I've been routinely doing !HVM
build for quite some time. There must be some further interaction,
albeit potentially with not-yet-committed further changes of mine. I'll
investigate.

Jan


