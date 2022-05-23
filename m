Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD7530E76
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335811.560009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5gD-0001To-QX; Mon, 23 May 2022 10:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335811.560009; Mon, 23 May 2022 10:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5gD-0001Qy-NN; Mon, 23 May 2022 10:52:53 +0000
Received: by outflank-mailman (input) for mailman id 335811;
 Mon, 23 May 2022 10:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt5gB-0001Qs-LR
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 10:52:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d02d01f-da86-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 12:52:50 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-tgE6k_ksP82er3EjCQEt1w-1; Mon, 23 May 2022 12:52:48 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6364.eurprd04.prod.outlook.com (2603:10a6:10:10c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 10:52:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 10:52:46 +0000
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
X-Inumbo-ID: 7d02d01f-da86-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653303169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwYsk84wKLhX0rmAw6x74J75fUUGmQwcf+s9UsX9G6U=;
	b=Qp60Pyfknqw7JdWzz1SHrrNHFvbmgrcX9HUo3ObIWEzoh6vkUvsR8m3Us6Qlr64BP6/RfS
	0daQxJ+p9++PgihHQRD+fMCZdFIpV5o4z174Po3+phIoMk6v8P11X3i1xVVh7GrhbBuU+q
	RoebmJUUhJYKo8VnprELTIAM3gY4eSo=
X-MC-Unique: tgE6k_ksP82er3EjCQEt1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR0GPt30ZqPtCyt9zUV2X+SVzdjiZ3Cu22NWw4XdSzaxmU5WlAYpcRasxL2j//1En1WGCI2rLZd4V3DKTeWinHRulaA379dLYdAgLJL43CujGFzOZL4/bK2JN1NjWCvDqZbrYcn3/3ktZ3WA6CjMSciKKvEEiEd5MffqY0d+5DhIEWN6/fsesgtX6c2NYcR0ymT/ji+uC0D7Oquiu6YvCuzGRPKYM6f/MmXgfvGR8u/Dd9gyTAHfDEOgiKj/6tW+Be1Y7NvBCdGO2ie2pZ+Zdq/3NogUWxtvPg6dm+gMZXrt//c0ctGK8URFA4mP53bccldXLGz9pEiYuo1apNhsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wh6fxHVlmT13wnaT7xH9pRzVVvHD5c7f3mMCVmBHvw=;
 b=Xeo/iWE4bYgi8fXv/Jl+p/YRgZTE6Xeja5f5hS/FLA2ECw3c5zCPevL5QZMsi2pXZhF7FrF4LBE9r1jJgYRbrBg4LuCg9tu2RnZdqKhQ5UbL7Jm6/mFgcSZfq6vYHcjm6jw7VHX6M3t8wT1Macqk27oQwE2/TJx3gsxkUnvOArY3UqqbxmgP4/35tWed808bDc16o50HKNuNOh90zeSvilxukKkXIV+MJpvjmpLFwbJuiwmsrfYIeUkn0Qd2rs6zWD4Ak7qtZ851hxiatYuUdMtfIM1TscyBUsKRSJYNvAJlKr+x2VNNQyICnO6nWMZKS9m3gKbXMIDIuE/djAgUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a90dc473-fb3d-ef16-da3f-fc9b385c8bf8@suse.com>
Date: Mon, 23 May 2022 12:52:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
 <YoeH+9eMU0ui68Mn@Air-de-Roger>
 <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
 <Yoelfhe5wLGy2cfd@Air-de-Roger> <Yoen/kI3WTIZaEQ6@Air-de-Roger>
 <fa7b050e-cd3e-6c1e-b0d4-1e3355b4664a@suse.com>
 <YotPfkl2mot7jigj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YotPfkl2mot7jigj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0028.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902dae93-91e5-4405-978f-08da3caa5eee
X-MS-TrafficTypeDiagnostic: DB8PR04MB6364:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB63641C56291746CE989F1819B3D49@DB8PR04MB6364.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wOmqMUqWGXpg3ULLoh/THJSs9SvxotZft/wEz9d6cj1EiJ07U80Ugye9xdJv9SS1soIMZxY6Id4iHQFrmktlVH+FNTwluSJOuydKPeVNSkxR0jVJJJZLbEZBQSHP8P5Vk5ZFsDCC5efs+OW10mqph3HB4OsnMNPmaL82eksHqz3Sl4KWOtVscbDhV99+9ll65VHtGngxMbWZrhY8MY4GCsGHqTjdCNU91RKJ9fJ6BwwHBem/sIGUf7u5y+W+D1mwBTN5p4pnWJwVPj+2Lp1wPnSXp9d8Ksv7N7T+5z25b4zdo+Mg3ltHMW/eCSrqYJqd2R39Imr6L4XBE4JGIlSHhsReLLIsj8JFArvUtM4DtEmNnOEZSO5xf/JruhXajYk0m4XONS5IMBDG9A9jl5xaHBZKRw72UL+JevaFi8phq5m712+TY6ix2McXvZieIpbfLP47h7XBhZLd4ZomiUj1AkZqgWPsvEj40QDYP/XvfpIal/oiA1UpH3Xg7zdWsXikw/B7qKeoYJ2SSe3E6hguUkT+KyltL8sjNoA41UZ8KRbdr7WS21oT/tIAs2Q0t7XpyZequsIa1DiSRXpxUGjoiIpdO+aPTSQ502mYgfms7mXQOxyVZWTWGZ5UvaVDB36uL2t3yIFEUgMKMSO6tj8VyK23WaanDUn+PcFUOSYnLih3EwZZpxrXJBtwe6ArBi+TYQ81pONGIeGxOwLTqe52g/6fq1So4o8iuc/gRAsfkx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(2906002)(5660300002)(31696002)(316002)(38100700002)(26005)(508600001)(86362001)(6506007)(6512007)(4326008)(8676002)(8936002)(53546011)(54906003)(6916009)(66556008)(66946007)(31686004)(36756003)(2616005)(66476007)(6486002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q7TYUbLYCoNbVkE+MZfTiuLeYngI2vkp80CWn0ZMMfDkC0vDWf6XjAfNprbm?=
 =?us-ascii?Q?257uUke720O18CZpJhawA1EscPkBbUbSVxRn5n5D7TcSF1wEvESpUippXhUH?=
 =?us-ascii?Q?o2ZPyNHtvz/b5GXAW9JT3ZTBhAdkwiNGMD+Whg4hVGDQJBshsgsGQQc3bRUt?=
 =?us-ascii?Q?BAGUPrUwZxvxEjHQh6yNJ/rW426esA3nOX15msWbA2DjE9lUAnpTvshdUZX1?=
 =?us-ascii?Q?tI3CpXfr80mc2oNuyy1Gb2HeEtVoVQRbE3AE+Cvgi2aguwI/4j3uaDlEaBlp?=
 =?us-ascii?Q?fS6JivAa1l03kv2YbG2l3px2jZmE1akU4kBQhKJv43UHcdhekfyJaYW/pOZb?=
 =?us-ascii?Q?TYVdcddrACyeGKHZcBexYultiT3+BKJq5nUc67HS3b15NvnpFo1QXjF9EAbW?=
 =?us-ascii?Q?/YJY960frYnDhRb2/8SgSe7kgaHzU7d7XddWT8JZDphZRad4/obfUwsdYjmv?=
 =?us-ascii?Q?Q2pywB5TzmbR3V4iGbtn0MjM3ML0SJWTbMI5uGaRP7EkTU5rkp8lfvhVskxv?=
 =?us-ascii?Q?rjZEJtFQsYWd80D0q6le2YBPjN1i7avpF0h55ymoCG3ocTdN+x7RJWwXoE1K?=
 =?us-ascii?Q?o1qLodGx0nm1LIE0qDeIikO4ES736tY4dqCbDlYj43/v1HwFVZKUoLiDfQjS?=
 =?us-ascii?Q?w9aeQUPp3uSJ14KPxhoYLD1QXg3I4ieexIctFp6zgQDV0k1xXto15ptjtups?=
 =?us-ascii?Q?gQbR2wyHos94KKDmKwzaKAAtYdL2jQlOipTtcjZ/1xXDth399hGrBN2iwLHL?=
 =?us-ascii?Q?UXbsTYsDns9WJYYWgs+g+nWjlXo+LmyZ9xsMxq37uni+AYHOIDBcpFDtgeOO?=
 =?us-ascii?Q?tCuD9mCvyj0yXdQ6zYznWJPkAsxliddsEegqmWA0Nej4IVC0CjbrMwVrd0Im?=
 =?us-ascii?Q?GV1ExPaCcpdgcd344BzymKmO0xxIDCEzHG+XgiFRKaku44no7IPW0Dfw6lkZ?=
 =?us-ascii?Q?+dEWUA1VKbnG/a1T35eeUADlsUzUenL57YRYh7yjh991NXJdxVr87F9fU3Ej?=
 =?us-ascii?Q?+RSv58iYNa/Y+XJscEYhj58tCF2Ct0RvNTuMqFdT5A+VduozXsg9qumBuu7Z?=
 =?us-ascii?Q?NzyIzoaEC4Oty0BNetXT2mQmgZnrydQBz9mRyXOWP8ld8ovR50EElbgdhL5H?=
 =?us-ascii?Q?Fp3xm6n/6m9kSyouRhtrSGybWYvRYNWy52pj80+MJ4tWkiO1ruUzQRQA7/OU?=
 =?us-ascii?Q?ctzCHRqKu9I1epxmEf1ki6M9x0saayOfbp7VvVZ07kHnlW8I0rypU3R5b5Go?=
 =?us-ascii?Q?vBr1n61fgsJdl0uIly5oFiSgIHMnsMwZM2/sHKMtuLZ0285mEY4MV1x10Mu8?=
 =?us-ascii?Q?B7Ac6SvohyMWzsPWWGP0z+En/DmpDdjoQzniOUDdachHF5k57nLK5DXFTKFA?=
 =?us-ascii?Q?j8Lquuk0Pco7hw1X2mei6GdCT0OoJoWiHHKgXDUCl4/GmvAs9P7qwfsBQkTt?=
 =?us-ascii?Q?z0VwLqAKapdzeEjsNirt8BnG/B5yLZd4cmDcy+3aUoEo+jx9JEb8GPi/28aO?=
 =?us-ascii?Q?+o0ZfDRUJB3qwA7lx1ZFtOQ9iVT4IzrKp2pmCB1ufJcozKugMigAv5Z93NLB?=
 =?us-ascii?Q?yygl7iMNY9Jp19pbLPiPrviEwdk1xraANoRTienQXFNBSNeVcaKtEc7lt9Rs?=
 =?us-ascii?Q?cqwwtAaIjPTWGry9wcUKMdr4g5RbFaSRZu/gwiDbtBYDBMgL4uPggXiHfSMu?=
 =?us-ascii?Q?gLxLPUvPYwEjWSjOqM4Twq6DHkeWbmkF1xCOgaADz0IXwr6qQPOVbi9FpmcT?=
 =?us-ascii?Q?i2ek5Zrz4A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902dae93-91e5-4405-978f-08da3caa5eee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 10:52:46.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXoFuTo2QagsxHmsWZ0nBvlHDfFxP5AM3iLDJx+trwDjLf/tlGGb+yPO0OZxXPbTX/l3peouMZQIMWAxyc2zvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6364

On 23.05.2022 11:10, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 23, 2022 at 08:49:27AM +0200, Jan Beulich wrote:
>> On 20.05.2022 16:38, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, May 20, 2022 at 04:28:14PM +0200, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, May 20, 2022 at 02:36:02PM +0200, Jan Beulich wrote:
>>>>> On 20.05.2022 14:22, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
>>>>>>> On 20.05.2022 13:11, Jan Beulich wrote:
>>>>>>>> On 20.05.2022 12:47, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
>>>>>>>>>> On 06.05.2022 13:16, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>>>>>>>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>>>>>>>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
>>>>>>>>>>>> =20
>>>>>>>>>>>>      while ( nr_ptes-- )
>>>>>>>>>>>>      {
>>>>>>>>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>>>>>>>>>>>> +        ASSERT(!pde->next_level);
>>>>>>>>>>>> +        ASSERT(!pde->u);
>>>>>>>>>>>> +
>>>>>>>>>>>> +        if ( pde > table )
>>>>>>>>>>>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - =
table));
>>>>>>>>>>>> +        else
>>>>>>>>>>>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>>>>>>>>>>>
>>>>>>>>>>> I think PAGETABLE_ORDER would be clearer here.
>>>>>>>>>>
>>>>>>>>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not use=
d anywhere
>>>>>>>>>> in IOMMU code afaics.
>>>>>>>>>
>>>>>>>>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm no=
t
>>>>>>>>> sure what's the rule for declaring that PAGE_SHIFT is fine to use=
 in
>>>>>>>>> IOMMU code  but not PAGETABLE_ORDER.
>>>>>>>>
>>>>>>>> Hmm, yes and no. But for consistency with other IOMMU code I may w=
ant
>>>>>>>> to switch to PAGE_SHIFT_4K.
>>>>>>>
>>>>>>> Except that, with the plan to re-use pt_update_contig_markers() for=
 CPU-
>>>>>>> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.
>>>>>>
>>>>>> Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?
>>>>>
>>>>> pt_update_contig_markers() isn't IOMMU code; since I've said I'd swit=
ch
>>>>> to PAGE_SHIFT_4K in IOMMU code I'm having a hard time seeing how I co=
uld
>>>>> at the same time start using PAGETABLE_ORDER there.
>>>>
>>>> I've got confused by the double reply and read it as if you where
>>>> going to stick to using PAGE_SHIFT everywhere as proposed originally.
>>>>
>>>>> What I maybe could do is use PTE_PER_TABLE_SHIFT in AMD code and
>>>>> LEVEL_STRIDE in VT-d one. Yet I'm not sure that would be fully correc=
t/
>>>>> consistent, ...
>>>>>
>>>>>> IMO it makes the code quite easier to understand.
>>>>>
>>>>> ... or in fact helping readability.
>>>>
>>>> Looking at pt_update_contig_markers() we hardcode CONTIG_LEVEL_SHIFT
>>>> to 9 there, which means all users must have a page table order of 9.
>>>>
>>>> It seems to me we are just making things more complicated than
>>>> necessary by trying to avoid dependencies between CPU and IOMMU
>>>> page-table sizes and definitions, when the underlying mechanism to set
>>>> ->ign0 has those assumptions baked in.
>>>>
>>>> Would it help if you introduced a PAGE_TABLE_ORDER in page-defs.h?
>>>
>>> Sorry, should be PAGE_TABLE_ORDER_4K.
>>
>> Oh, good that I looked here before replying to the earlier mail: I'm
>> afraid I view PAGE_TABLE_ORDER_4K as not very useful. From an
>> abstract POV, what is the base unit meant to be that the order is
>> is based upon? PAGE_SHIFT? Or PAGE_SHIFT_4K? I think such an
>> ambiguity is going to remain even if we very clearly spelled out what
>> we mean things to be, as one would always need to go back to that
>> comment to check which of the two possible ways it is.
>>
>> Furthermore I'm not convinced PAGETABLE_ORDER is really meant to be
>> associated with a particular page size anyway: PAGE_TABLE_ORDER_2M
>> imo makes no sense at all. And page-defs.h is not supposed to
>> express any platform properties anyway, it's merely an accumulation
>> of (believed) useful constants.
>>
>> Hence the only thing which I might see as a (remote) option is
>> IOMMU_PAGE_TABLE_ORDER (for platforms where all IOMMU variants have
>> all page table levels using identical sizes, which isn't a given, but
>> which would hold for x86 and hence for the purpose here).
>=20
> Since you already define a page table order in pt-contig-markers.h
> (CONTIG_NR) it might be possible to export and use that?  In fact the
> check done here would be even more accurate if it was done using the
> same constant that's used in pt_update_contig_markers(), because the
> purpose here is to check that the vendor specific code to init the
> page tables has used the correct value.

Hmm, yes, let me do that. It'll be a little odd in the header itself
(as I'll need to exclude the bulk of it when CONTIG_MASK is not
defined), but apart from that it should indeed end up being better.

Jan


