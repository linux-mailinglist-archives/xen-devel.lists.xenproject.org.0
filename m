Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292DC492823
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258544.445362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pHX-00020M-1P; Tue, 18 Jan 2022 14:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258544.445362; Tue, 18 Jan 2022 14:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pHW-0001xE-Tx; Tue, 18 Jan 2022 14:16:18 +0000
Received: by outflank-mailman (input) for mailman id 258544;
 Tue, 18 Jan 2022 14:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9pHV-0001x8-5O
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:16:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32a96cb9-7869-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 15:16:16 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29--l--WyWiN3-AD8BFedjpxA-1; Tue, 18 Jan 2022 15:16:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4020.eurprd04.prod.outlook.com (2603:10a6:208:56::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 14:16:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 14:16:12 +0000
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
X-Inumbo-ID: 32a96cb9-7869-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642515375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edV45wDljfcuoSROdpoGxbHpCv+TOxhJ1sQVVID205A=;
	b=LrVQwGBAcC9/gNg26u6lER0pNGfBMUgzfexEUys2fZL7/tRFTS/WkFe8O7QQvBQSDKhGRM
	2i8+BSY71/a9S7WO+0fJsblzkgtVkD99pmchgYIHkbMmV1TWag/G4FQmICOCPjMZbnUazM
	SUm8RyKc06SbP8cDSztAqu+96lePOrE=
X-MC-Unique: -l--WyWiN3-AD8BFedjpxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd6H6feR8OWuMxGPLAkMPWemuQlDB95Vy9JrcwyOSS+MCXNSpV05rCJg3DxPyueRzBFx2bZAsAqtit9fcNxBBzTwo5mKYtE7ANBQq4a/Q9AdMJDJT4O+ie+yChLLy+lKqf2/SBvPbJBK5nhVSKaQ3z4ZhQBKo7mNyHBhJbPkoXbT5erFAze749nSSGmJUPll7PivRjeHAIP7zPAa6Af8U2HQLeDjjNuOGBpCVc6+TEbzsnnfh0dO2F530jV8DkwBflX8W+tw65kO2wTyOaLVdaC87EGlUh642r7C4FtFziTW7RQR6SmmDvMxsUe6o5mN/vSiN/kn+/gKgSTr+uG+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEi+ZCD2UgLOFL2wrufm4kKuZwhdggncBRl3JRhZrU8=;
 b=gmy8RVQmKs+VtN/PQZ7Y2i2SdK+L960Vv1KLU7PUW9P+PD8jB/8+JEMt9k2oMtMOaJODXSnHApfBoYQ3p21wXJqHzmb72OEt9vsnd1t3/2PydCjyO+wC6QQATsLGoX5GbpsbwMieaoBpkp4R65r83ycK41Hc8Db10Zkf/zd66aXVyZf0ZwkGYaB1msfJDVCB6Wbamdgo6RCCPLOMhFEodK5apVd7UEdH+VWq6JCvfggvzch16cEjlwUDzo6V6KekygV+ukfh0jvirvRl6yyvC+0ybv7Gn1ILwUUaM7ZexM3FlthlOqK/AEMKtUUaItjlGnr8lAK+XCab7ygz122KAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd328410-caf0-274e-08b0-f775a6c9a08c@suse.com>
Date: Tue, 18 Jan 2022 15:16:11 +0100
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
 <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
 <PAXPR08MB7420FE209E822108AB1B41E19E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420FE209E822108AB1B41E19E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0043.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ef1c36-a33f-4a25-d9e7-08d9da8d14e0
X-MS-TrafficTypeDiagnostic: AM0PR04MB4020:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB402002C6DAFE5ACABBE45C3DB3589@AM0PR04MB4020.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IFOa9KALDIcwKKH85sPMWivb7DVlpEC9JQj1dagQ+Z95f5p93t97ozNHumZqowAqor5YIhUY+f00EEQh3IdK6Lo2IPu7OOyKWcLMLiFMUFqMu8zqWW2kIvKqC5rcUgHKcednaR6umRGbyn1y8ziWltt12ZF0IA8FbApQLZ4viyxXtPKRCrTNOdMjmk3TwADsBnDSEsUwSgkyFx5pE4e9EIA3pt8YDJ/OutefyO6Na3vykMFMR7JeUqnPWTW5lLnizTQaXAiH9ISVCdqtcOtuaf8e4Le0XlbPJTMV+h4M1959OLaR/K8QqsDQxY5E9Tils02lpEwbOr1EN8A+9fGHSoY92f/mivRf2ym7/j3TlwRTnJyaX/2SeQ4W/8vywrTIHIKYLuywGogKcuF4RJstXu7zpJP6FXCewju8fyOrDzQvMzRzoEOcxpxpFxbl3EXeU7KwTODFGtgIhGHerI6QBj4/B3R5T0lps2YU4kKGjOgc64PJVMU6nPEIpqHOTPykKbfZTQnqIpf9VNBeqlOxXovLddOqWgxjZ2dwnxOfMaLNWPh3i4cObQnBRkJu1BWpxy2MWZpOL/PFgWe+z+uysAlL8YjNlUKVaiXumIJLKdrlZSJ/MI23tNwtTN3+bMeO4Ge69J0e26448Jyki8ByAxefrmbgB5mCs2/brGlTBSyg337OGDGSfXORT0CLfbiMgbt6YUudJY/7OlpK/1ABaVcAR2y4Mr0NxeSVDwWxf64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(83380400001)(66946007)(36756003)(66556008)(86362001)(66476007)(31686004)(6916009)(53546011)(2616005)(8676002)(8936002)(5660300002)(38100700002)(6506007)(6512007)(6486002)(54906003)(316002)(26005)(31696002)(2906002)(508600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MwR0GSbDnUxK7mqLYsnmE1qHyoPzlIgPpUsJCXNuPUuHdGE/H3sjrrz/7eGg?=
 =?us-ascii?Q?Lk+np70Npx4EfzQ9QhjM00ABWxArXX4a2RA8w/s/+Ef7ifCdfyohNMkU/TPi?=
 =?us-ascii?Q?8gJwgs2XZnKeCwLCdqoPGDVTVkEl6NdooaJMtGm37HWzHOd6Tk/u9lV0Sbq9?=
 =?us-ascii?Q?xTOgDKrjSyhhmOt9Kh7jONpZLNH9kY3PU9UaQntEVvhjoBO9u/Wybwozuxti?=
 =?us-ascii?Q?aZZj9VG8gDzbLRVGKZ9YhApX1c06YO7rtFUV+nXQvgjRfVkKYDPaiS5LZr8P?=
 =?us-ascii?Q?qHLg7FJpqDX3ut2J7bzf37Il4RCbbvRya5i440La8yDe5FeHRHDgTjwHshY7?=
 =?us-ascii?Q?a7YNl8YiCEzOmXxUy4MO6mmn2wF7V+/GcyXySg8jzbDrqDRWyqW8FcIElw/e?=
 =?us-ascii?Q?Tu/n3w289xSSbwVM5QF4wdDDhHGHXT1K21Kyy5MfC8rT2a/b2TD3qCfvQgRP?=
 =?us-ascii?Q?I63DcXTL/X6k2MkVenx1fkZCFI0Hcr06XUMA5z3qzT3SEM4mX7+sPFK8EeYQ?=
 =?us-ascii?Q?nQ4jm12LdADEvczH7LXCG5W+A0KicLOsUmRRvcWruo2al+b3cg6lhFIxEzzw?=
 =?us-ascii?Q?8sHb8tloyVvVLFEmTXSQKmIUnwmexZFoe/7pSK8pQSy4FUuir6ZHWFK4g8VI?=
 =?us-ascii?Q?HFSqxGkzwm6Ya9QlBcpT17V5jSbbTV9tbwxZUVmk+IF28ThFpdth/rO9xf8k?=
 =?us-ascii?Q?WEBaeRK2yLMSE9NyiBznylt875WqRixSQgR5H8M7kwkkVhQUghA1BGE9LN9T?=
 =?us-ascii?Q?obAVnzM0vZNckrN/H31fgS4Qbrani5BR0CAQDVn+UQ8RZrsGpo5+aakC7n8Z?=
 =?us-ascii?Q?eHuj/ytYaYvFI76zxYIxcqcP1YSR8qj82ji/LmdbIqYYDtb4hBhQQYTSSyCA?=
 =?us-ascii?Q?K4Vunlwyu8gJgmm4d/DlfgqsmjfmHmtUN/7i9OHl7AGsoDWzy/ineEwMcylO?=
 =?us-ascii?Q?Q3MX4OvXwY8mHqma5rmLXghurQw5+RlVdIVxmb4DOYRnwJvOMoaP0v8qEAmI?=
 =?us-ascii?Q?CxFIX225/eDW3ahq/TyDCSrPDPGKODnMowSFcgu40W3NZ+WM1DAm1t7VnPo3?=
 =?us-ascii?Q?4y5o12LxG1tcORfj6GYP9Bn2SMTieKMMcCzpEogM1lniKuX632+A9vN52eAe?=
 =?us-ascii?Q?riWGYtitmWAg2p52Uf3UpEK7rLgA3b/xXukda9Elxwgxxe//PyJXwjx//ly/?=
 =?us-ascii?Q?Sjl2Q79UByEdu4qXwkKd1CpNOiUx1YfENsMR3sSPUTHIpLO9+Y8j6x3srSR2?=
 =?us-ascii?Q?jBUnFUhTOz26Ar6oVJj0RmmFmvXMUIqbHMn1IE+wlpi+/bcsNHmGlYs4rVHS?=
 =?us-ascii?Q?yGD/PrYEmmMxWgLZSmD0f4xihv4uzI/33x8yeIVGS3CVr+bF8iMHsZxmIU06?=
 =?us-ascii?Q?jjkNiS6E/hfJKYPsLgF+rKodarK6ad1away634Jh5wn55LKMnypnWXugld1K?=
 =?us-ascii?Q?GJImZyAmFf1Bf9ANPSNmL2kmCfQoGM0KJenVSHdzdfGQjwcyRgBugoqB6nVv?=
 =?us-ascii?Q?+MRhHtRnKxob8AcnJKKuHwNeT3jNQzNrEnI+FAi+uPnBrA3V/ecyxz0D7nii?=
 =?us-ascii?Q?BmHOaMdMAi7awzNAn5RErHmrkhkMsEh8oRsWAur4ij8c/XVJfsnC6y7d0Z9Q?=
 =?us-ascii?Q?tyrkXbdk1eTQBkrD9Rwmzx8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ef1c36-a33f-4a25-d9e7-08d9da8d14e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:16:12.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/9/Z/cvkcsPLA4J/KVXasD7PjfW6lqU3ufa3mooYSoa57/HcH39oJwmwvcyhrHzM2eSKxrJl3ScEPv8Px90Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4020

On 18.01.2022 10:20, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 16:16
>>
>> On 18.01.2022 08:51, Wei Chen wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 0:11
>>>> On 23.09.2021 14:02, Wei Chen wrote:
>>>>> In current code, when Xen is running in a multiple nodes NUMA
>>>>> system, it will set dma_bitsize in end_boot_allocator to reserve
>>>>> some low address memory for DMA.
>>>>>
>>>>> There are some x86 implications in current implementation. Becuase
>>>>> on x86, memory starts from 0. On a multiple nodes NUMA system, if
>>>>> a single node contains the majority or all of the DMA memory. x86
>>>>> prefer to give out memory from non-local allocations rather than
>>>>> exhausting the DMA memory ranges. Hence x86 use dma_bitsize to set
>>>>> aside some largely arbitrary amount memory for DMA memory ranges.
>>>>> The allocations from these memory ranges would happen only after
>>>>> exhausting all other nodes' memory.
>>>>>
>>>>> But the implications are not shared across all architectures. For
>>>>> example, Arm doesn't have these implications. So in this patch, we
>>>>> introduce an arch_have_default_dmazone helper for arch to determine
>>>>> that it need to set dma_bitsize for reserve DMA allocations or not.
>>>>
>>>> How would Arm guarantee availability of memory below a certain
>>>> boundary for limited-capability devices? Or is there no need
>>>> because there's an assumption that I/O for such devices would
>>>> always pass through an IOMMU, lifting address size restrictions?
>>>> (I guess in a !PV build on x86 we could also get rid of such a
>>>> reservation.)
>>>
>>> On Arm, we still can have some devices with limited DMA capability.
>>> And we also don't force all such devices to use IOMMU. This devices
>>> will affect the dma_bitsize. Like RPi platform, it sets its dma_bitsize
>>> to 30. But in multiple NUMA nodes system, Arm doesn't have a default
>>> DMA zone. Multiple nodes is not a constraint on dma_bitsize. And some
>>> previous discussions are placed here [1].
>>
>> I'm afraid that doesn't give me more clues. For example, in the mail
>> being replied to there I find "That means, only first 4GB memory can
>> be used for DMA." Yet that's not an implication from setting
>> dma_bitsize. DMA is fine to occur to any address. The special address
>> range is being held back in case in particular Dom0 is in need of such
>> a range to perform I/O to _some_ devices.
>=20
> I am sorry that my last reply hasn't given you more clues. On Arm, only
> Dom0 can have DMA without IOMMU. So when we allocate memory for Dom0,
> we're trying to allocate memory under 4GB or in the range of dma_bitsize
> indicated. I think these operations meet your above Dom0 special address
> range description. As we have already allocated memory for DMA, so I
> think we don't need a DMA zone in page allocation. I am not sure is that
> answers your earlier question?

I view all of this as flawed, or as a workaround at best. Xen shouldn't
make assumptions on what Dom0 may need. Instead Dom0 should make
arrangements such that it can do I/O to/from all devices of interest.
This may involve arranging for address restricted buffers. And for this
to be possible, Xen would need to have available some suitable memory.
I understand this is complicated by the fact that despite being HVM-like,
due to the lack of an IOMMU in front of certain devices address
restrictions on Dom0 address space alone (i.e. without any Xen
involvement) won't help ...

Jan


