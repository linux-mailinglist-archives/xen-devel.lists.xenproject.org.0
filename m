Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501F492107
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258390.444897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jf4-0003Ln-Ns; Tue, 18 Jan 2022 08:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258390.444897; Tue, 18 Jan 2022 08:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jf4-0003JG-K8; Tue, 18 Jan 2022 08:16:14 +0000
Received: by outflank-mailman (input) for mailman id 258390;
 Tue, 18 Jan 2022 08:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9jf3-0003JA-Jr
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:16:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d9fc87-7836-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 09:16:12 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-v7JG6QZrO1-3MjvLkXTbVg-1; Tue, 18 Jan 2022 09:16:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4742.eurprd04.prod.outlook.com (2603:10a6:20b:4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Tue, 18 Jan
 2022 08:16:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 08:16:09 +0000
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
X-Inumbo-ID: e5d9fc87-7836-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642493772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OiYb9wV1ry7Z284wPCB52iavL8ljanLW1tBfyVkkB4=;
	b=NV/R7or0RjXyyoC2Tc3W+uVBVIJ7Q3spS5VGyS4geuZcm2kBFL2Go9aYIHJ3xksxUZIYXO
	qIBLEBsrvsYxeYwbN02fRPxYV/DDdpOib9S2+T1Xt9Q6GK/hDi8f1yEFcaHXSJF8nWmi21
	7zxMr8+GQ+0Nro3cjHhhSruA0drfTfY=
X-MC-Unique: v7JG6QZrO1-3MjvLkXTbVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiJVgXSP37GpEX7c994rpnTZqtrBn3it8g/1zTRSMFEY0a0sW1H09FyHfozmzwshoMOAAsi8PJNpEGsHt2K04EG+uFDgzMi6x1uGVm9oTfjZ/D6E8eWMd06G9aSybxsEM0YyXGP9Bod3s0MMbfVimO9ji2twIFairbWB0WcK4UxTaOkH/7vJiJ3HePTVaBDzSyokYI3f7jGPnGX/2MPrV7YVcn1CK7YMiR9qoXviaP1TRjbVEIQqlnxCrPJNYfl0MoBsSTCwg7DiBbBfx2xpHrpKV/NzF8OyMMz5Ipf2AdXPUwGviwS0QbBVeviNOKlUo09RkOFXq+XJH2c5o55eXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gS5BkIRrIqGVc2dfwZpVVXgS/zG8ipuBjlUp7oRQ+DM=;
 b=EHGIbQ8cXovshGGU/zoKyitcwpJfmYwYTNPrllvnGiVUtfd5YNuDlQ2ls+KEdZnwfXS+4Z6q1uM7cTtu3YmFEq5c3GihcatLw3zsb2Ix4/TPxLwXaCNoZKCixGfDYHBoT+lQ39YFZMKfRkKdp5P2jpzqg/DtJIMlgHyWkHdJYbhdrcqK64LAC8OF8Eu7NBmluI66HrM2bdgk6Pw6zbDJSzL6SuHe0eU7sA2NZOPJqaIHGB00+A09BprNnl2W4EgqdhXjuccIfJfwpdxztlSdyHBnt0jXrJCuxGhBN6AKSdt2PerDL583p1suOm25BG8J9TP3jmMqcQpkJ3z+XutJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
Date: Tue, 18 Jan 2022 09:16:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
 <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2772c62-1a1d-4930-301e-08d9da5ac871
X-MS-TrafficTypeDiagnostic: AM6PR04MB4742:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4742DF22E1994FA99F3DBCD4B3589@AM6PR04MB4742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rQPeN6QY5t3ZJV8Xs6FTY/WlMufPTQaoKivGjXqImU09XTBJJCU7xeFsCosU3h6T1FFoZINeFLuP+OzFbW1xpGx6qoMR9lxNHfUtDS0Nn3Tnw3emdZX4fvaH3pGwVMLpjcU+p+g0S9bbPlqrOF2AUpHLQXpSKahVEqWLPex63+XV+7wEPto3W9rwD3z6iHUGgdu/lNRt9D2xOlpBxVeqXeTpxCueqN30kTGCiAM1yJAOdjlRejbUDNqQh1L+AairZ2E0uHJxaAhTENVEpStBsWCuhtStZ6muNE9kVrcUKi+tdGxr2bonkMPWrbUvDCNPXenmvXDIIZft26XphxkzrPHPeOgKoQkbG7yL1NlCw0B9kVa8qu6IEoU26XmYDkfaSnW46Vj4b0/RFffweZT4PNF9BWtkADJylJFmf1/PybiLCSW/ryHTa66OkCeEHOK0G5IziXNmMSjQdW5b7cgRRz/kvvT5MZJSfoVIBq90w905TVb+w7dZzbTJD4LQ43ZpVNp14i1O23pm0Hvz3kTTekDrkRGRHJO5P8wjq+FLTmJRDHn/C2pOUPILr7ew1/agUzMp6lmGvSwD8p80wmh09X99g4HDjRM/1+hvQVd6HY8oXEIR3su+JvkaTC6EfWsQXEl2FCNE3/nQcH658xiqolQcUyVCk8xJPwenWA5xTx5Dmr9G/BYt27GWbjjhF6ykyLiVaNQE8cIyGkDqT/OBK5obbN2KPw0brGfiZGwlpLpM2FOsQCfXLEuXjIARVwTRghmQwpHGkjTY1WVPTn/0tp7zPPSXruSR2HN+2ziJIXdL3inArSdu3/AS/Zx/UQcSOQwwuQmZ/dF23T8zPQ3j/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(53546011)(54906003)(316002)(31686004)(36756003)(966005)(26005)(4326008)(2616005)(86362001)(83380400001)(5660300002)(66946007)(6512007)(38100700002)(8676002)(6486002)(2906002)(186003)(31696002)(6916009)(508600001)(8936002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DDsY/pF4nU4UBqOUQ2beUBHU69SYLI4BoVGkwVbvFQwrI5gaS3mUHDEBznWt?=
 =?us-ascii?Q?gbpFLlhPUrO2B2pi/9pTrX+L+tb1/W09Hra01ODxbivCmyzTnJwkyym442k/?=
 =?us-ascii?Q?z8iq+rEk3sVojE1OM7bRiqGDiQRw1O4jOF1hNDpq/eKCcc3bukXpWAEX4Z6h?=
 =?us-ascii?Q?0gCUEfbbUwOeai+Y+iNMrYnxxz2LJ1tNalD7FrqVir6FhnYlow2RUiNUkj4R?=
 =?us-ascii?Q?w8+VI3pkZDk0Wz36oOqj95X9g+Qpt8HK1BH5iGmSsV2W55BtqjPZYzkLJwht?=
 =?us-ascii?Q?wqMLmdtp5hFSTg78dyMTpkDI5HIIu/2IZWTzbYSIKFB7mJERXCJStUGOOSD3?=
 =?us-ascii?Q?BN+7RyQahx516eg/K2PFiVR98LgUJnffRTQibLbqqye/f7t2BF4r9Z04dWgY?=
 =?us-ascii?Q?gj4i8/IMA8aWh1Xjt8k7eDgqLLcvFTi/t8uB7O6ySniU+QfnVb/GqIR3xNJD?=
 =?us-ascii?Q?U2XXNsDTF/n2dUQjhr+tLWE4QrcNWNc4+jWYPA7ZR5FpZO8NNy2WXQkG99BN?=
 =?us-ascii?Q?ETluMW+F6UIxbcas7+2ra7j7RdRWIFPkZf2Mnt2H2yzocdvo0i3fNTYF3RoE?=
 =?us-ascii?Q?LUTUbcqn4T9S0V3GQXSurXuMMYag6QOtUpc/c8P2fnuaJHStZZAdUCY2yb0M?=
 =?us-ascii?Q?QrmVkgnLPSNNTAH34Bb5vvFmlvORehLofrDRKuZjW80WdR09dB5T6DrkCTtI?=
 =?us-ascii?Q?REq95pOQ9CH1l9Hgct9wa4CekDiYxI7X7+anKYg1Nov1Wc5YS58U8Wc8NRbU?=
 =?us-ascii?Q?WkvkGYisvRl1cm4rkoxyxh6n1rPhpRcLO7qwRNSYL/F7zKbb9AvAB380NGSs?=
 =?us-ascii?Q?bbbXM/WXgONxP7g5sT+P1wv0HCztpDz44k7I+3N/oSYEEWxTpTXVSbXCFkl9?=
 =?us-ascii?Q?D99wo9CZQniKuydeJLHiW/014YzqFI9y9LFAThwF0fElbBKZ8DRDECu6UAGx?=
 =?us-ascii?Q?aAhAnSjYnOaSHjDeLzLiUZuLwBx//UwpTjoTbQ9fa23lsrlA2aXPq223RF7V?=
 =?us-ascii?Q?Ib8/h8mfIb8RBopyBau0F7iFu69UoMf6RUd3NoEFCuWtfKuHoAkDTi5mUKVB?=
 =?us-ascii?Q?kKrqmrVTggIhvywmfaJmRyaqKkg/MxrklVPqvOiWdBKsBiVLlPpyjQiA+4tf?=
 =?us-ascii?Q?0RlfGmqmBKx/6tVuWluo8w95xCsuxNIagYoaPK6zhkiD1XwvRpI2CzVrLVE+?=
 =?us-ascii?Q?Qk8xEewLoQ6W6p7YPqqKEP6pWOKLQ+ZLcOJxvoAFjXe1GnX9kXHqqhOA9acK?=
 =?us-ascii?Q?Msjxf3x+LAsg+/++NlICegSdWfpqNT8SsvnPUhAvKV6X3lcZb7PxL92HFtWV?=
 =?us-ascii?Q?vNrleHdCHUSCa8NR5xrKwQyzp3ndf5qMeBKAV56ft2HxScJjdc1FMbrXbyC6?=
 =?us-ascii?Q?xiLCFBQqHzCVpp7P7njJhsp+iJieiB8Lv3o9OzrZmH3iXMKIYdipOyCh0QmC?=
 =?us-ascii?Q?KcuJoPDkgLOEfZPueC9nqPK30Vhopdeq//xZch0Oy67Fryji+1/uk/9Fe196?=
 =?us-ascii?Q?xrM38/ymphL7QBJO6vp5QTiZGi1R0PAhBUqNnQ0Qzc5VIHzdINqnpsHn8hHr?=
 =?us-ascii?Q?/hHH1momzZNy1VrS+zWUeyWvNz5aJ089oCYb0NyZ0/2DtcwxpGIvw52XJP3t?=
 =?us-ascii?Q?Xs4sKGVDUDSsqLZ/0rO4y18=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2772c62-1a1d-4930-301e-08d9da5ac871
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 08:16:09.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfE0IOogsT1VcQ+wGoQ7Zj0SeW7OrlDFeOpTMrWbjPrPl2bZJMgbaLoS/ihN4v73T0BKYkzm9tSqJZjrxGcaFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4742

On 18.01.2022 08:51, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 0:11
>> On 23.09.2021 14:02, Wei Chen wrote:
>>> In current code, when Xen is running in a multiple nodes NUMA
>>> system, it will set dma_bitsize in end_boot_allocator to reserve
>>> some low address memory for DMA.
>>>
>>> There are some x86 implications in current implementation. Becuase
>>> on x86, memory starts from 0. On a multiple nodes NUMA system, if
>>> a single node contains the majority or all of the DMA memory. x86
>>> prefer to give out memory from non-local allocations rather than
>>> exhausting the DMA memory ranges. Hence x86 use dma_bitsize to set
>>> aside some largely arbitrary amount memory for DMA memory ranges.
>>> The allocations from these memory ranges would happen only after
>>> exhausting all other nodes' memory.
>>>
>>> But the implications are not shared across all architectures. For
>>> example, Arm doesn't have these implications. So in this patch, we
>>> introduce an arch_have_default_dmazone helper for arch to determine
>>> that it need to set dma_bitsize for reserve DMA allocations or not.
>>
>> How would Arm guarantee availability of memory below a certain
>> boundary for limited-capability devices? Or is there no need
>> because there's an assumption that I/O for such devices would
>> always pass through an IOMMU, lifting address size restrictions?
>> (I guess in a !PV build on x86 we could also get rid of such a
>> reservation.)
>=20
> On Arm, we still can have some devices with limited DMA capability.
> And we also don't force all such devices to use IOMMU. This devices
> will affect the dma_bitsize. Like RPi platform, it sets its dma_bitsize
> to 30. But in multiple NUMA nodes system, Arm doesn't have a default
> DMA zone. Multiple nodes is not a constraint on dma_bitsize. And some
> previous discussions are placed here [1].

I'm afraid that doesn't give me more clues. For example, in the mail
being replied to there I find "That means, only first 4GB memory can
be used for DMA." Yet that's not an implication from setting
dma_bitsize. DMA is fine to occur to any address. The special address
range is being held back in case in particular Dom0 is in need of such
a range to perform I/O to _some_ devices.

>>> --- a/xen/arch/x86/numa.c
>>> +++ b/xen/arch/x86/numa.c
>>> @@ -371,6 +371,11 @@ unsigned int __init arch_get_dma_bitsize(void)
>>>                   + PAGE_SHIFT, 32);
>>>  }
>>>
>>> +unsigned int arch_have_default_dmazone(void)
>>> +{
>>> +    return ( num_online_nodes() > 1 ) ? 1 : 0;
>>> +}
>>
>> According to the expression and ...
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
>>>      }
>>>      nr_bootmem_regions =3D 0;
>>>
>>> -    if ( !dma_bitsize && (num_online_nodes() > 1) )
>>> +    if ( !dma_bitsize && arch_have_default_dmazone() )
>>>          dma_bitsize =3D arch_get_dma_bitsize();
>>
>> ... the use site, you mean the function to return boolean. Please
>> indicate so by making it have a return type of "bool". Independent
>> of that you don't need a conditional expression above, nor
>> (malformed) use of parentheses. I further wonder whether ...
>>
>=20
> I will fix them in next version. But I am not very clear about
> this comment "of that you don't need a conditional expression above",
> The "above" indicates this line:
> "return ( num_online_nodes() > 1 ) ? 1 : 0;"?

Yes. Even without the use of bool such an expression is a more
complicated form of

    return num_online_nodes() > 1;

where we'd prefer to use the simpler variant for being easier to
read / follow.

Jan

> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00772=
.html
>=20
>=20


