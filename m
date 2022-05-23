Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A6A5309A7
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335468.559639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1sl-0000BZ-Ak; Mon, 23 May 2022 06:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335468.559639; Mon, 23 May 2022 06:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1sl-00009E-6W; Mon, 23 May 2022 06:49:35 +0000
Received: by outflank-mailman (input) for mailman id 335468;
 Mon, 23 May 2022 06:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt1sj-000098-Ic
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:49:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fb82508-da64-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:49:31 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-oYaixDHVPCOZKz92bgrr8g-1; Mon, 23 May 2022 08:49:29 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7437.eurprd04.prod.outlook.com (2603:10a6:800:1b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 06:49:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 06:49:28 +0000
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
X-Inumbo-ID: 7fb82508-da64-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653288572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9tiIAFTvgFfwxlos58MasgrWlittgNXSxEu/+vRbSQ=;
	b=euEDj/RVvhOhqLn4A5m9HK9onQ2Idx14jUPefBpVXCPrjTezTqF1KvsrwV0s7LIJI0QXh0
	Ip4ESS2wiLVqA6ivU9Tr3eySPjEN3kf4BrT1bwFJM02x2qbW1hwyadvbpBAG88aXckSJDb
	CQiRi8M/+kSSqU0gtsX/cjfLnuPM7/Y=
X-MC-Unique: oYaixDHVPCOZKz92bgrr8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwo68RuqI+QdOg4OMIuxWfAaT8PbeczpX33r84Cpmn2VRrtMLgDIm2q21hbsq4blNG/VZPch9VhXP3K4XFhEhO+r98D6JonAu1h7SF/Ao0tztKXSqIiJs1tAImtxKkP7nnSZzvEg9WW2xHCaIH8A19w3MO+LwM7eEMgPEcJTUqUEZt/SHo/rsiZ7OqTGiOacMBNMSrdNpMDOm5LPyII3SeQL/sLL7MA2JmpZ1WYfEWlbcoo3fZuD1L2j3rXXIQK7Fl7aZnQiQfifP64fHX50QYcO3b1RUToio4T3LAp5ugEnUL9h5326xc3Xg1+0evtJVmxWUjEFXTc260ZWAhdzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9YqcDAGrCEL2/2iezwsvYWtnO/JBEtf1x37ZuwsURw=;
 b=bYyLBm61+SpKv56VGhZm1p6S94F2TeewLAYEmMZD1pQOlDPydYtZo5bw/iCsJT6MyYKdFuNny9FcX5HY35A1qQhzlgXaAnYphu2MPya3pEbrSX0rbu3yOCRkvAMvAyfFkehAyHr2XnI0UbToyrL8CHY6JLSUP+e2FRuGK2XrxZ8TFYQ+Ddjo3v2gt9+99euO7wPp4vEhPFvIyS1SoJp+NW3LyUsYKib8IqpULuel8VviTGc6SAA/JLaLis8jOikrz2iIVXuXy19l8OzLeiJcEgMKU1p8r6N/DuhfHKmQZ5qstRiLvWt+cHqYfCpgycsafZr+zmm7boh2ZgWN8oTLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa7b050e-cd3e-6c1e-b0d4-1e3355b4664a@suse.com>
Date: Mon, 23 May 2022 08:49:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
 <YoeH+9eMU0ui68Mn@Air-de-Roger>
 <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
 <Yoelfhe5wLGy2cfd@Air-de-Roger> <Yoen/kI3WTIZaEQ6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yoen/kI3WTIZaEQ6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba127e7d-377e-4816-77b1-08da3c886209
X-MS-TrafficTypeDiagnostic: VE1PR04MB7437:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7437E01A41A58DBB4BB1D650B3D49@VE1PR04MB7437.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	deZcuzQw2YnWY7Y8H7ptTY7LAXtEKDV/3LR5PW3euW3Q3iJZ010Lkjj1PheRvAVAXRE+Z6vtWvRWkg6iY1k/o72SIt9SJxN3H345v7SdoRlx5VB1VywY+Up6jDJA2146BvyqebA0wBCwlnpKZl/goAwTcDnoZBJCiYqzePFCs+KveDy7G590D4/7zv3ekPoQEcQpo2a4lUiCD6qQdv2rN0+VEAqrB9JB6vEv6HYWJrfv+3eKx6AFhaDfSK2QBFJIUKv4hdOkTauCrIeCWIsIh2bcnnH5RnGKkluDOiFf8uLK+L57kQ3WmGDx6nL8Ep7T2vpt4KCx/Q+XASi32EJVphhGeU9FTz1cttmHZ0kDDgTQcAwbDaDD1zRLaFR/PvlW1BYPNt/+02BdnY6atFMnViTlK2faMACaiXphQQ5cDVHw0ywCXzQcv8hOH6zLdQ6aAhzUe9mklFFaONyBbgnV/ClREJ4aJIZnCF0200lwkCW8C5bPTkNBdUbQD1Xvt5UtPAFcQmgba+qCloAKEwdv+EpGRt4Mr2SYvoOLLz3oFvs5PiCDjXl0ZVHke/K7A7J22fFsGZGc0l+M1eZqwRFZt/hOUz3O54ZWvhSKFqwApYvP6N1UKsvnst5ywl+ahJfMH2jLL6vTsV1ZRMRuz/TBpqEd7/cMR5IV3bpuNmls+3o3r+XDrZ9xtUXJXr3/88NQ9gI4Jlz4YfHanNcd2jL3xj/4IBA6jt/jQLy6bl5O6/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6506007)(54906003)(6916009)(508600001)(6486002)(2616005)(36756003)(31686004)(83380400001)(316002)(26005)(86362001)(31696002)(38100700002)(5660300002)(66556008)(8676002)(66946007)(66476007)(53546011)(6512007)(8936002)(4326008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6asYcP0lwaOiJNm13G1BHHUPsVXlNuzaLR1JTqlsmzStnBrJUeDkT8Yx2aHd?=
 =?us-ascii?Q?+m9A2y2LPJHWwtUMwhldr/zDs78rzPSJnGLnMogwy3BU/IlDW/60DPKrqre9?=
 =?us-ascii?Q?K+38HoKXzySkAD4Icd4HAcHlr8yuWFjhcDyoMnoMqHfjV9G5CG0gZ7TXrLjB?=
 =?us-ascii?Q?P/KrloXX1uLvtRWDnvEguKoiIZYN5oO0ZQS/SZOBs1kCsZjazD14vYTR1TWS?=
 =?us-ascii?Q?npgvXfFc4suxOgxLpdpgciobrXm/IYaewecOgkD7f2aiE1bV2NuGQMyES459?=
 =?us-ascii?Q?5P5I8PZprKho/HD95+CcHaR8ZcXuUNk1WElsJi93hFHVgei6bytirmTYQgaM?=
 =?us-ascii?Q?h51uM+B9BL1rbg/RnUkfvRiG5MIXJZzjsIgJGlhl8DRO1sCuRxgltGbq+7LM?=
 =?us-ascii?Q?e/LmclAiVuAGDX5FiGtkZdW2l9nBAIK5r7EZqRLBvaHp5X/P1z7prMIGWY7G?=
 =?us-ascii?Q?8qR6tcV9vmIEIci2QpdGYCSZH+4dyWyOPuZ+cTqMCX4cKGfAWSysdCZ8jPOF?=
 =?us-ascii?Q?0im3KKhNF0RyG2/nxJpp/yy08zJ5cr3NymNF6d6aG22yX3IkHMENInKo4lkM?=
 =?us-ascii?Q?IOBThuEfa+nTLRNiiV155Mm7YdGeySQ+vSUAYndQN703AFfc84YyyoiPGxQK?=
 =?us-ascii?Q?1y6bB1T/4yTrgMuUbT+ugPIVY3N7uRW8j7ZpAdEEMW19nj0Ie49Y+87SjM5C?=
 =?us-ascii?Q?oHZntqfIj49IsEPFCBaPRvgIovSRBo7g8CeEnd6FKeJwF/Ux1g4g++wmXdbN?=
 =?us-ascii?Q?Q5OkAb/YnnvZxu6AjdH4tNSrMVyIyH2jzgXnV19Zh6T5SGNUvumOqB4EO3X8?=
 =?us-ascii?Q?mRxNoyDllelUuuJczj1MngL5MdRiXT6Sf5ej5tMS17JWhMfSSRTym6wTl0PG?=
 =?us-ascii?Q?w2n9Y3M18ptMD0RlBTp3dGXcsyUwbWYcztVlbyNhN4BKFk+pYZ7oc4GGXAEz?=
 =?us-ascii?Q?g6L/IK4j/Wkt8Onb7p6tT+hwQu6WzpLlULHhzlwcCQCAL2PFwg4J3E790BhS?=
 =?us-ascii?Q?VyXXGaWGBYHrd9ArI697oLzs2FTfLvVhv5PkIe3mlDFjj9OcuE/uPGOQDOYk?=
 =?us-ascii?Q?G+3u4ODv2DJSKmP14Tn3XvdrPCUwRFJdGVnVWJzAXlTwmhPzSit8lGvJi96/?=
 =?us-ascii?Q?BEa7Vh50nVKwEYhjtAKL8MULWzxNx/vPiwtF/zOYq9VmqM/cyRcFcYx10b6T?=
 =?us-ascii?Q?G3FyNMkBcIXMDiIc5pijKzoF6ohoHYw+HTwQQTFyo4o2YVdK4ISPc+psz7dj?=
 =?us-ascii?Q?izbF9dr54Ze055Zf5qtbtjL0WHYRUojW+IJY8yrPNyJoHtFdUdZA0Xf621Fi?=
 =?us-ascii?Q?o24jkg2OfFJ24unzUyjlDFFMIXwCbEIQ9h+gGuyNIGz0HeFMejXP/Rdelc8d?=
 =?us-ascii?Q?WRT3FfPlJ1UzyWXFcyM6gLoExn1BAUpf389FUh0ji7BRxvtS8wm8IVLlULho?=
 =?us-ascii?Q?AoSefbGkbrX8YshhUL1mgXII/YxuCc5W9CYWhDUsfokmLcjrOW1xFf3mK718?=
 =?us-ascii?Q?zSep9go9oc1x02WXGCnWAcg+2z+YDOwwpjMt1NcGDeAGVz//418oy7EOxXqr?=
 =?us-ascii?Q?xWFX7E7rdkwgLgAju43q6D36PU04sFpCPZfHeNDejumiyf9GlaEha5p3FNbP?=
 =?us-ascii?Q?OXs8I1pqmpB2tSIakpWNCxky47SGEC4HdSGHZ0RAdCg1cZ7oqON18X6Gtm0Y?=
 =?us-ascii?Q?98IxvV0QP7R0tHikshMwATN6AivwNJkM32T6UgFcuk+uFxdKMr/6iGgwvbE1?=
 =?us-ascii?Q?krDzIuh/wQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba127e7d-377e-4816-77b1-08da3c886209
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:49:28.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCZ5rxpR3x4lAcaS70GNwXSa6tw7ztc9g3CBTy/hw3PMmcCarns7yhQjMSPRv5QxO8Aj8PS/D7Iz7Oc5GmWhpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7437

On 20.05.2022 16:38, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 20, 2022 at 04:28:14PM +0200, Roger Pau Monn=C3=A9 wrote:
>> On Fri, May 20, 2022 at 02:36:02PM +0200, Jan Beulich wrote:
>>> On 20.05.2022 14:22, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
>>>>> On 20.05.2022 13:11, Jan Beulich wrote:
>>>>>> On 20.05.2022 12:47, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
>>>>>>>> On 06.05.2022 13:16, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
>>>>>>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>>>>>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>>>>>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
>>>>>>>>>> =20
>>>>>>>>>>      while ( nr_ptes-- )
>>>>>>>>>>      {
>>>>>>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>>>>>>>>>> +        ASSERT(!pde->next_level);
>>>>>>>>>> +        ASSERT(!pde->u);
>>>>>>>>>> +
>>>>>>>>>> +        if ( pde > table )
>>>>>>>>>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - ta=
ble));
>>>>>>>>>> +        else
>>>>>>>>>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>>>>>>>>>
>>>>>>>>> I think PAGETABLE_ORDER would be clearer here.
>>>>>>>>
>>>>>>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used =
anywhere
>>>>>>>> in IOMMU code afaics.
>>>>>>>
>>>>>>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
>>>>>>> sure what's the rule for declaring that PAGE_SHIFT is fine to use i=
n
>>>>>>> IOMMU code  but not PAGETABLE_ORDER.
>>>>>>
>>>>>> Hmm, yes and no. But for consistency with other IOMMU code I may wan=
t
>>>>>> to switch to PAGE_SHIFT_4K.
>>>>>
>>>>> Except that, with the plan to re-use pt_update_contig_markers() for C=
PU-
>>>>> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.
>>>>
>>>> Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?
>>>
>>> pt_update_contig_markers() isn't IOMMU code; since I've said I'd switch
>>> to PAGE_SHIFT_4K in IOMMU code I'm having a hard time seeing how I coul=
d
>>> at the same time start using PAGETABLE_ORDER there.
>>
>> I've got confused by the double reply and read it as if you where
>> going to stick to using PAGE_SHIFT everywhere as proposed originally.
>>
>>> What I maybe could do is use PTE_PER_TABLE_SHIFT in AMD code and
>>> LEVEL_STRIDE in VT-d one. Yet I'm not sure that would be fully correct/
>>> consistent, ...
>>>
>>>> IMO it makes the code quite easier to understand.
>>>
>>> ... or in fact helping readability.
>>
>> Looking at pt_update_contig_markers() we hardcode CONTIG_LEVEL_SHIFT
>> to 9 there, which means all users must have a page table order of 9.
>>
>> It seems to me we are just making things more complicated than
>> necessary by trying to avoid dependencies between CPU and IOMMU
>> page-table sizes and definitions, when the underlying mechanism to set
>> ->ign0 has those assumptions baked in.
>>
>> Would it help if you introduced a PAGE_TABLE_ORDER in page-defs.h?
>=20
> Sorry, should be PAGE_TABLE_ORDER_4K.

Oh, good that I looked here before replying to the earlier mail: I'm
afraid I view PAGE_TABLE_ORDER_4K as not very useful. From an
abstract POV, what is the base unit meant to be that the order is
is based upon? PAGE_SHIFT? Or PAGE_SHIFT_4K? I think such an
ambiguity is going to remain even if we very clearly spelled out what
we mean things to be, as one would always need to go back to that
comment to check which of the two possible ways it is.

Furthermore I'm not convinced PAGETABLE_ORDER is really meant to be
associated with a particular page size anyway: PAGE_TABLE_ORDER_2M
imo makes no sense at all. And page-defs.h is not supposed to
express any platform properties anyway, it's merely an accumulation
of (believed) useful constants.

Hence the only thing which I might see as a (remote) option is
IOMMU_PAGE_TABLE_ORDER (for platforms where all IOMMU variants have
all page table levels using identical sizes, which isn't a given, but
which would hold for x86 and hence for the purpose here).

Jan


