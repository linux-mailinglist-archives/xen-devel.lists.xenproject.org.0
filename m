Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01128519F0D
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 14:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320658.541494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDsR-00089v-8P; Wed, 04 May 2022 12:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320658.541494; Wed, 04 May 2022 12:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDsR-00087D-4t; Wed, 04 May 2022 12:13:07 +0000
Received: by outflank-mailman (input) for mailman id 320658;
 Wed, 04 May 2022 12:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmDsP-000875-Gc
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 12:13:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c1f35f3-cba3-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 14:13:03 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-eB8yswbXMuiZMSz5bl9Z7w-1; Wed, 04 May 2022 14:13:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6630.eurprd04.prod.outlook.com (2603:10a6:20b:f4::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 12:12:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 12:12:59 +0000
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
X-Inumbo-ID: 8c1f35f3-cba3-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651666383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oITOIIhNj0LUWTBHTS7HPOmnJantOOqXINRwg1eRSs=;
	b=XcS8b2CG1tRmnQVOT+EnPyLf8ZSe7tfc46/nXPBHHqbWfQnEjvSYJTrDNPP9z1jaLRy9Q5
	8kITnNazRNRgkr+Un1RtCHi7MWULGZruFUJ726KX/6+cxg57kQrgzriuJ+KAJPFrqlIN/L
	F6dJVDS++ecwhBWcwA3gqdkAvsNjtoI=
X-MC-Unique: eB8yswbXMuiZMSz5bl9Z7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrDcdguwB1tFuk1fYTsmlhU3RGvhs+WHzDfKwqyFoM/+oRB596JoUJZLJtom5fN2xo/MsSoUv/5cKYP1Qqp00qLdwaZSOwJFHb3cHwKN0YyftdaGRKPjq4XY4FjDjaEOjWxGJCyEtk3ylJFjROV1br6RpKU94N6w+wtMMFDHgXfDFVHyt3Uzf71QHHdOvmYLxmSaHAgD+9JzKJM0WQbKjCTOihcky2SpklSm4XjXSMfsC9vuZ/E+lAnBDVh1OjGSM1fEoG4P3cPqlVB3ZpJZnoMmPFFIIMJT6sZDT2yshb/lpeTSQr8bRhcRDDw4pqFdLifylmJp3492dxqaEtKs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA5UUpOtBj8BJ1Me5KMvvF/KdLRLs9SOHPLbpRHMCwY=;
 b=kFdHFOfYuAIBcb8fEJgPwWtzUY0EPEBZjDlFPkiG9f9MtT+fj86w3D6/DISgXRiVdCl+bnDLxlmnyafoZla5PntzY/5OZ6a1XMTCc5N4BQEkDsNVcwHVfi27Mi1bk/xKcNFFLVkaAa/0J+/nahgWfdhVL5mUDFw3ANxQZFP7TVvI1zHDJsB0o+MPkx7zHWnuHKZwVvZjRKSZLT1sKGMAPU9NGckDv8iPcYM1nwJ0POTnxrzEDpJT8OdP8h8vcAQNmRV2xrxa9ksavBFAmYs2K6sn3EpeLJJC/rKYEL7Ti8FMvcAcivk4u6DdgN/D4/fLSB7Z7KgXlDZZMCB0ACQVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
Date: Wed, 4 May 2022 14:12:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
 <YnJrBNkGl8Em0gTN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnJrBNkGl8Em0gTN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0153.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5792ceb3-e8f9-4b33-9598-08da2dc76df2
X-MS-TrafficTypeDiagnostic: AM6PR04MB6630:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6630D111726DB2C5DDC6BE28B3C39@AM6PR04MB6630.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c76HXU57sDupC/K4Aa8rBqlxhn7WM3UhX+UgowKtuA3Bej1q6iLT3KwdDbOGflDN3VfaegVW83DvRd++o86D/frV0QyvHz43DWxIHwbZ2WTI7Xh0wJieUvaDHSyZGqKMU2OxQrEX+f1a/Dgrp3aNs+152ETr//t+cVl/NFxiLms9LhaRM2lrbgkS9Ujag8NxvDV/MjB+JUF69cCpCdlE5qGG0HA3WCTjeBJjGxIuRLvdO4qZAyk7sAHaQcNiJZXa/VDhcwsfdSDZzYbIKR4RrUheAgmuUdy2Vp2Hjfpg5p5/uz1NDnNrGeLshJa7qv8nUQTqXnco2wsaN2f9BJfrTINeRJCZh8BTgJgw54Hx965vaBmWuKn2G6x3ny4LticivEkYHmQLquU2xQNlUqSYLFTyQ81Fx84VMqkdHqrwUeQAHFIs8VdCK2SqBqEMjTDsD+QnmyIzlwKc2IOoaq/KplOVbVR4twQiszVw5IzO7HGudWRnCO71PpsaqE0F0qXUJcKRMsHNTp+75p+M8sduweGlcbVEI+Fwb4P51Twsh/tnj7YjZZRpcND7ajm7hYXHanOA8js5mZ5+9tctRD2Sgao4uLPYip8dNFFM2Rv49CaVbmSTrYCWiOQkiptVUGcyZus9unTcGMRi6/uEcKOAl+Jv/4wUih76vZLL+cK9ABSGEY9GUWwiv7iNNRFm/UZxYCOVkx/PfZMEnGE2z6UiFpqfAMEILppYaViIjVaFeCdLOdMyYQDkIfAZkeHJZl86
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(4326008)(8676002)(66476007)(66946007)(83380400001)(186003)(6506007)(2616005)(53546011)(2906002)(26005)(6512007)(8936002)(38100700002)(508600001)(5660300002)(31696002)(86362001)(36756003)(6916009)(54906003)(6486002)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?brtpOyOyR7p4ZHp5vfAVMRYa44zux1NXnULlyaTxYSLej5UaCmEb0HAb9fRs?=
 =?us-ascii?Q?V7vo+AvSq5xuiLPDTLxpoQNsiWCPIDqL6Q73adDOGcANtKK//r0Iq8udbd96?=
 =?us-ascii?Q?E1Smv2ajqUOefivw14MGG+nx8EKxdzjSKta8XljmUCADkF14KP3PjZf//I8G?=
 =?us-ascii?Q?tyb2Bq/PZXa0tjBu+0tVbIitErnMKnbJqZx/r9nMVqkAzXA/h9ah2+Cuvg6n?=
 =?us-ascii?Q?wTDrH00Z1m0cPF6uIKPJ1yTFWlFa4qw1b2M6ahoRDu3KtyvJMlYYH+HdV4H+?=
 =?us-ascii?Q?Ta5bZ9KTlPpNF9m8KbHauHdpnsSvmRDERL2lRBGgebb/yZqqmt/0qP/AcyWf?=
 =?us-ascii?Q?N43BRfUrEzj065h/T30jB4ELE8FGbvRADZO/tF0Yi4Z2jPLnUTiW7HH+CbX5?=
 =?us-ascii?Q?SyQHXfDMKO0/PfTvX1rrqy1EPHo5SrxtqN6RJe4m7XiHptTQxXaT2BA3QCxQ?=
 =?us-ascii?Q?aSBfx97n4AielNma0rgkfV0CV7LJMY5j33sKMeq350j49Ub368O2OzZJkdAA?=
 =?us-ascii?Q?tmtHg6aQCc0aczgtsUJYMqeKkTnED7aS28pqqCXkuVp0NvYqhURti8PtPhBo?=
 =?us-ascii?Q?1xmtroFJZTsVAJjPzVM6kIDy94WwCqy/FTGBDAAEyl7WwfUOUySqg+SZHBkc?=
 =?us-ascii?Q?QGfykhyoujhFg4m0AAYlIimHc7MnDSD0LCwbC/pqWHZsUf3Ma5pzOAi2Sbfe?=
 =?us-ascii?Q?X+JwMhANmVoLprlXmiAco8g1k93lN4lzf6QWf/4fdZ8kXmtb8p1exd8ylJBL?=
 =?us-ascii?Q?/kAdz/c7RpHBg4OjeNtByE3D7WP50jxbzs7/pybR9XYnvLm5ePf6Qj4Prvps?=
 =?us-ascii?Q?YHzzUo8EUpcYhKgSjX7xOrMfQGiXxXeUoyl3WpJBiQfZOJVWadsqgHM7okMt?=
 =?us-ascii?Q?JKLm4Jn8OoJHX1LzIwHUDUo38xf0fU2Wq3I1CWuf0PWs/Jrij6MYjBBeDw1p?=
 =?us-ascii?Q?jLXwz/yqc5vRFHVXBY3OyB7AiF8XzTYwcCcGSQsG3SOBXq8buCTio4+gq8Bd?=
 =?us-ascii?Q?2oTRsmp36+Hw9J9Bw9xmUnitWbFN38U1g8pWl9Qx9YkPyTOEe2P5ETjsKGeW?=
 =?us-ascii?Q?OIutZ8u728G7ukqwVsL3+Vh4hP0LejCu9M86qq0mHfrjuotufXMF7EhGk2xH?=
 =?us-ascii?Q?6zXmoUwNZb+wUiexcHgi2jhVn6fkw+ZX8S/WR0MJWHPgEMC3LjDBq/4zj0gu?=
 =?us-ascii?Q?MbzKxy+s4IVwFDN+mNALmOCYVFehpt3c60lmf7DmV4t+PZAJW3byFQuGlkkq?=
 =?us-ascii?Q?Mv1ox/AU3uBw7S48O7iRYHcJl24RlMWLd8QczsZHNMeI4seKzwqrnnzd/wDd?=
 =?us-ascii?Q?MhDWAvPpirvgbtDYxDgTQSJufNKf2az2x/sleidAmYTluWZU/fIitVVdfhVY?=
 =?us-ascii?Q?vhROf5ALEFQTLRE9zykElk+qQ+UzygyrM/UfFP/3AiPIPhD/IJE43zO3+jS+?=
 =?us-ascii?Q?EglHkYX+RcKNBDDOpVoNKLKp2o1Gb54VXwpOixd0ufsW3SCs3wApe1KUPJqL?=
 =?us-ascii?Q?A8yOv6Uh6zY3Y2Kupg5FPFNTXY9LS8GzFQuWJnjBo0Ger2NOIi1mYUkWLBeE?=
 =?us-ascii?Q?l6dwoXv+ubfJmYbRMFfI19tRNmluoCq3OYDtX7UdZE+axQo9TbRxN3tYk5Gw?=
 =?us-ascii?Q?I0ZxhPQ9Rlo86XVqOEC7Ek1r08vY/zQlwJCZ0sGds88gvb/YbdXiHqtrGXqa?=
 =?us-ascii?Q?4KGeWqOy/cAVoPu7iW1N6eoCgVtdcLLeJE7DJFj6r236CWumir82m+cW97Qn?=
 =?us-ascii?Q?f8vrEBnGVg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5792ceb3-e8f9-4b33-9598-08da2dc76df2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 12:12:59.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAwCmzxRX2fsAqrnENsZvrNSvvwq6SP3xarzTW9hxQGkGjywj/expWUvia3uMsOwuTdiycuFve4z6LORZpHDtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6630

On 04.05.2022 14:01, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
>> On 04.05.2022 12:30, Roger Pau Monn=C3=A9 wrote:
>>> Right, ->iomem_caps is indeed too wide for our purpose.  What
>>> about using something like:
>>>
>>> else if ( is_pv_domain(d) )
>>> {
>>>     if ( !iomem_access_permitted(d, pfn, pfn) )
>>>         return 0;
>>
>> We can't return 0 here (as RAM pages also make it here when
>> !iommu_hwdom_strict), so I can at best take this as a vague outline
>> of what you really mean. And I don't want to rely on RAM pages being
>> (imo wrongly) represented by set bits in Dom0's iomem_caps.
>=20
> Well, yes, my suggestion was taking into account that ->iomem_caps for
> dom0 has mostly holes for things that shouldn't be mapped, but
> otherwise contains everything else as allowed (including RAM).
>=20
> We could instead do:
>=20
> else if ( is_pv_domain(d) && type !=3D RAM_TYPE_CONVENTIONAL )
> {
>     ...
>=20
> So that we don't rely on RAM being 'allowed' in ->iomem_caps?

This would feel to me like excess special casing.

>>>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>         return IOMMUF_readable;
>>> }
>>>
>>> That would get us a bit closer to allowed CPU side mappings, and we
>>> don't need to special case IO-APIC or HPET addresses as those are
>>> already added to ->iomem_caps or mmio_ro_ranges respectively by
>>> dom0_setup_permissions().
>>
>> This won't fit in a region of code framed by a (split) comment
>> saying "Check that it doesn't overlap with ...". Hence if anything
>> I could put something like this further down. Yet even then the
>> question remains what to do with ranges which pass
>> iomem_access_permitted() but
>> - aren't really MMIO,
>> - are inside MMCFG,
>> - are otherwise special.
>>
>> Or did you perhaps mean to suggest something like
>>
>> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
>>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>     return IOMMUF_readable;
>=20
> I don't think this would be fully correct, as we would still allow
> mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
> handling those?

CPU side mappings don't deal with the IO-APICs specifically. They only
care about iomem_caps and mmio_ro_ranges. Hence explicitly banned
IO-APIC pages cannot be mapped there either. (Of course we only do
such banning if IO-APIC pages weren't possible to represent in
mmio_ro_ranges, which should effectively be never.)

>> ? Then there would only remain the question of whether mapping r/o
>> MMCFG pages is okay (I don't think it is), but that could then be
>> special-cased similar to what's done further down for vPCI (by not
>> returning in the "else if", but merely updating "perms").
>=20
> Well part of the point of this is to make CPU and Device mappings
> more similar.  I don't think devices have any business in poking at
> the MMCFG range, so it's fine to explicitly ban that range.  But I
> would have also said the same for IO-APIC pages, so I'm unsure why are
> IO-APIC pages fine to be mapped RO, but not the MMCFG range.

I wouldn't have wanted to allow r/o mappings of the IO-APICs, but
Linux plus the ACPI tables of certain vendors require us to permit
this. If we didn't, Dom0 would crash there during boot.

Jan


