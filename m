Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D756E51BA29
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321702.542926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWj7-00060c-PO; Thu, 05 May 2022 08:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321702.542926; Thu, 05 May 2022 08:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWj7-0005xd-Lv; Thu, 05 May 2022 08:20:45 +0000
Received: by outflank-mailman (input) for mailman id 321702;
 Thu, 05 May 2022 08:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmWj6-0005xX-95
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:20:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41398c86-cc4c-11ec-a406-831a346695d4;
 Thu, 05 May 2022 10:20:42 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-irsWogXIO9GjP0R69fL8Jg-1; Thu, 05 May 2022 10:20:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB8009.eurprd04.prod.outlook.com (2603:10a6:10:1ef::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 08:20:38 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 08:20:38 +0000
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
X-Inumbo-ID: 41398c86-cc4c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651738842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJlGUUR5XXcOw3k3TFk3aRA0msNeqezU97iFj288mwg=;
	b=QI872EWeGozXh03I6FcL7ELyrL4VxlGxj66RZhwmGLR7vL6n/6u1fpKLC9+Nzt3T2WFxid
	PdqDxITHG+PhHCPutFwUUZsgNM6RmKl3tG/tt+SJQIqGCn2b3KeL8rGoDUA1MGoyakTbwG
	Vklr3TatVppw8WVnTVxA5XdqryjQtK8=
X-MC-Unique: irsWogXIO9GjP0R69fL8Jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is9v+9Lttr0ytepKcGTG4ff6gXPBOp1o+v2Abb0vloFSkL1ZJ2yIsW604WBsPohIxuUulbrfeFxIdZ/zcl/BgJNZnA/q5xdpffa/V/QmF6mevf+uytq1aVlHC3Kk4xXU9RjvqdEejP/tfHmhMb/TYdjiY96HKROHVM0vTKDNDTMqrzhFh0qOSgH/GSvHhER7hfwQFu1vntKkjSeN+/JtwjMnGZCI7i8earM3/UiV2Ts9ExIcctxVwAxc25LZN7kaeivj+itFsIsLre5iT6dagzv9MQW8GzXDlDxRDD0uTjPN4D6V+0wCQmUqlQSfxtnUm+Nau+/aPdapqVCaw1o7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmQR8VnoKT3D6hkXdukz2HjDDlH33eCm35AERLERfE8=;
 b=dAfHNz8xLkuQi0CEwpK4GGmWrFoIZxPAposGbADp5ROr2OxqOnJAnsaBtbank084A6q1EIHf0JkI/FlTFGMtlqgJAcVIo22RomH9Q2TDS3VPCvBDC6YaBgroMMGTW2q4yvVvUTezXdYWwZvuuDTWzrgt9nLrsPs50I4atT9WNCUAArBRqRCKndOyxg72AE/2Zhafvdj+hEW3fPMIOLUuVHVKLjCUJt3QFS4xUl2a92I1BQ/7uJPvTMqBEJD2yRUmg2e1XkmWoG7oBG+zAgYvo6BDwzU5T+6MuMAVgAJz2883Bbe6W8ClE2GII0oR9YtSPPSvEdXqLV3uBxj9oC6jjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4bca3f52-436a-1285-9c36-9206dc5d50c9@suse.com>
Date: Thu, 5 May 2022 10:20:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 07/21] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
 <YnFWW4zenNq/SAt4@Air-de-Roger>
 <2d0d8aa9-1ab8-a505-e2df-c9b6446062cf@suse.com>
 <YnKWfTk2VjiXL67z@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnKWfTk2VjiXL67z@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0029.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa6619d-9e49-4308-3079-08da2e70229d
X-MS-TrafficTypeDiagnostic: DBBPR04MB8009:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB8009725E322DE0C1FFB8E235B3C29@DBBPR04MB8009.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EOs2/4YTO5tfUnMXNyur8KkO7U/qeDGwwEshSL1yApTRkUg5mESjlzbRmwb12HL5mIjjLKkIQoN7O/Q+LvczDrxbQst9zBb5sPojGZUpChqR/2i1OvydcqktiuI+VXlDQhOvtv+u90WMUFhpGo2C0DKufbjjzIHC5R+gbXYhB3cBc+ikajO7RV4B6mQKIb58gPrr8S1Hlqh25tK4OKMu8l4TxTCdfIm0VHrxYQOMn9hXvhZ40xtgX+qH/WaaxgptGAU/J12woLryiGIgHcQo7VXeEVobEOcnSmFx1MQAFtzsPafjkWORCOra2eyhl0oc1pfUUxsjx1HQMH3iJTIax/xG1cIKJeoiBYNy6S+/Nh6kWTplqQjaGPvSb8dMuuWX3oL4HaN39MlSqT9yOxh1G/ZBTFXvebk1cToWk1frJWmnuMK0/w4GQUs1e/K+hk2Z+V5J4+aMPs7xNjQJ6ga3Iuq94C/SNV+sXzcTLV7IVO+HJMAQ4RBk6zxDwyYJotlQccV/kRkIRJ5mzZzF7uU4yH76MnIdwoO9NqNz9ipBz4DFFmZKd5k+8KmHHxyaWGVBKvBjwZNpsOWELbpbhdpTE+uEKXVdGV3l5zLrbhNiUzUO6Yj0C2tR8EQ4i+mg8XKxPtVeB6/SPPiRT8PpnzVL5UT6xe5oNrq4LTCZH6c1da+5siuul9tE5MPXNl0RCTAUE6S7kPamHsYZS3Yfg8/eFeK6zD+6ifvNneJzt2v794w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31696002)(508600001)(83380400001)(53546011)(8936002)(66946007)(316002)(2616005)(54906003)(31686004)(5660300002)(186003)(86362001)(2906002)(6486002)(8676002)(4326008)(66556008)(66476007)(6512007)(26005)(6506007)(38100700002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M6whz8ut6Rx56Dc3C/qdynpuPUSmc6XDn8Aj+Fwllmh48LiBX0CadptbjZJr?=
 =?us-ascii?Q?l49bwIGyhXn0zYgmoKXfI7/yt9auK2ApD9vuVyJD/2bWMd49ikbxHRHOHiCf?=
 =?us-ascii?Q?C8KwSjnSBzR2sdrMUCg3Pk6Oe9w49h9s/qhZQwHZD3WRbU2/bNcttillHowv?=
 =?us-ascii?Q?fW5LQOkHp/BuldSFvGQ/yZaqvwzmiZPJAMLHTLYGjPK20YGn+/UIXh9ETWFJ?=
 =?us-ascii?Q?6ZiBQG92fzRfWp3+ik291upoXxAXGpUtJgT3XB6usWu2YB+yK/BtwDLzDinZ?=
 =?us-ascii?Q?zNvLlLswmoT180XfJATxHhFWHmucxO/FyLgWX30j8zaHdRODudu8ow8TiPcG?=
 =?us-ascii?Q?hecYVogIDiQTjon3nN1rjJHInfatsGamyl4s6TU/hlqyFVG09YBYGcNpkYRV?=
 =?us-ascii?Q?yNOnMHjPZQ8UjrexRUY7PKqjzP42VSyEYid/OCSaXJEdB4Q32Eh9eDbKSxS6?=
 =?us-ascii?Q?cPpX0ym6Vjyj0c+AgZvl5FoO3buCc4dg0eE1joLesTa1VyljetoMcnT3TU7p?=
 =?us-ascii?Q?g3Gdw6AxAIWzi4a/6qVxLuJBfVHcOSpjNqHWURepH9ee6NsovK1eaoXGoMmf?=
 =?us-ascii?Q?sIS5q3V/iuV6XEXR+maITk2AbnFrhtlyJznhGwsXezvnZXajsbAVWULEshb1?=
 =?us-ascii?Q?UaDsQL9VoV7672yTI/GHBakVVD8pxnD1RgBf5Uk3mofoOVvrYng0fbr8M77t?=
 =?us-ascii?Q?9sUQfoauWXiDI3ztVY+kbZrL51vOkaoKxdnTRvHj+s42UAO3NZaw+vvchw8E?=
 =?us-ascii?Q?XuZc6kjzWqfsDj7RgQy0TWReJWs9FFJpAtoAtcCO0HBzY3ldmV8Yc66PTU/8?=
 =?us-ascii?Q?cVDAtWZz31w7HZpfZJIjjU9Ah5MfCGe0qsxixP/W5EnRf99rc1et8TPWou6y?=
 =?us-ascii?Q?FnnRcVxqIFatyBCXU3662WHXShht65oTs98iVFSP1bEBoG6bBNxQwi/YBWeH?=
 =?us-ascii?Q?iFmIqoGB7HofEAUNjjlEAW1k2Fkl8tc4ImQjmASlVQapK1Pv/rO6d42SYDeA?=
 =?us-ascii?Q?CBb5AXN+R1fqf2fKQvwoSf5Io+nvZPr9SRxGe36aN2pzx5sEbIwcdDenfutr?=
 =?us-ascii?Q?mEx3n5q1uLw+gYReu9GrVBDZbJewVCCJkODOXc3XIOzXAvvGlPkruE7Lgv6p?=
 =?us-ascii?Q?6qe44iIifGUP68I6BTW9oOaJkF3pJC1DvK/9zQrvF0AtcOh/oZp1LCH48ZSH?=
 =?us-ascii?Q?SgS8Xo/Ca8jvzo3CwjVPnzR2l0J1l0p5Jl7uh5j396fufKWdi1DzCQDJN1Dw?=
 =?us-ascii?Q?+dpxdfjuo9C+1IrMtCo1pKVY3MqkUOthNDXbkQNZ+I7i2Fk4HAnKEdbEr5dQ?=
 =?us-ascii?Q?Y30T/EMkMt3mj2wPC7K8j5KcG8PVfUo5hzn0AI29itRNji0zLnG41xTxmGl3?=
 =?us-ascii?Q?DTOJfTdvjEmJWAJ0KroeXPVAwJZcHfoJH70gAHrlMBhEd4PxGBUIAdNJjsiq?=
 =?us-ascii?Q?vf4Vsj94nyJUQVie/BVfY2iZpfWJ7dRqGdCLkZ5xMFUXycvSQuEutHS853dL?=
 =?us-ascii?Q?kEDTznlAqRav/2huYYSenXzNq280KPdCWcFpKujMU7f7BzAvux6xvAPfbQWp?=
 =?us-ascii?Q?cadzF9AreRqEP/gH0sbkWnhCVEC23ph49dVRdQE1MQ96QYCI8yWlRa2PV6Fm?=
 =?us-ascii?Q?Pbk7CFOFgo6w20yK8TFKLu/9QDzvX2UrTuAYGb2syAm9m3Dp8zvJI2Jtlgia?=
 =?us-ascii?Q?oAQZZhhSHgTlJALlhKB35TZn6gJ8S8sa1/dra5e6hxrZNZ82+d9vK5lk7k7q?=
 =?us-ascii?Q?TKYBvRUdkw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa6619d-9e49-4308-3079-08da2e70229d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:20:37.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0W9IJdOeogC/AeLuSc9iMZ9dYlqz8jBWFSISIe4LdGKsp1dAFqHUSvclLJK8+JcE2lqNOvN7L7eKZ+vMqWrNzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

On 04.05.2022 17:06, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 03:07:24PM +0200, Jan Beulich wrote:
>> On 03.05.2022 18:20, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Apr 25, 2022 at 10:35:45AM +0200, Jan Beulich wrote:
>>>> For vendor specific code to support superpages we need to be able to
>>>> deal with a superpage mapping replacing an intermediate page table (or
>>>> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart =
is
>>>> needed to free individual page tables while a domain is still alive.
>>>> Since the freeing needs to be deferred until after a suitable IOTLB
>>>> flush was performed, released page tables get queued for processing by=
 a
>>>> tasklet.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I was considering whether to use a softirq-tasklet instead. This would
>>>> have the benefit of avoiding extra scheduling operations, but come wit=
h
>>>> the risk of the freeing happening prematurely because of a
>>>> process_pending_softirqs() somewhere.
>>>
>>> I'm sorry again if I already raised this, I don't seem to find a
>>> reference.
>>
>> Earlier on you only suggested "to perform the freeing after the flush".
>>
>>> What about doing the freeing before resuming the guest execution in
>>> guest vCPU context?
>>>
>>> We already have a hook like this on HVM in hvm_do_resume() calling
>>> vpci_process_pending().  I wonder whether we could have a similar hook
>>> for PV and keep the pages to be freed in the vCPU instead of the pCPU.
>>> This would have the benefit of being able to context switch the vCPU
>>> in case the operation takes too long.
>>
>> I think this might work in general, but would be troublesome when
>> preparing Dom0 (where we don't run on any of Dom0's vCPU-s, and we
>> won't ever "exit to guest context" on an idle vCPU). I'm also not
>> really fancying to use something like
>>
>>     v =3D current->domain =3D=3D d ? current : d->vcpu[0];
>=20
> I guess a problematic case would also be hypercalls executed in a
> domain context triggering the freeing of a different domain iommu page
> table pages.  As then the freeing would be accounted to the current
> domain instead of the owner of the pages.

Aiui such can happen only during domain construction. Any such
operation behind the back of a running guest is imo problematic.

> dom0 doesn't seem that problematic, any freeing triggered on a system
> domain context could be performed in place (with
> process_pending_softirqs() calls to ensure no watchdog triggering).
>=20
>> (leaving aside that we don't really have d available in
>> iommu_queue_free_pgtable() and I'd be hesitant to convert it back).
>> Otoh it might be okay to free page tables right away for domains
>> which haven't run at all so far.
>=20
> Could be, but then we would have to make hypercalls that can trigger
> those paths preemptible I would think.

Yes, if they aren't already and if they allow for freeing of
sufficiently large numbers of pages. That's kind of another argument
against doing so right here, isn't it?

>> But this would again require
>> passing struct domain * to iommu_queue_free_pgtable().
>=20
> Hm, I guess we could use container_of with the domain_iommu parameter
> to obtain a pointer to the domain struct.

I was fearing you might suggest this. It would be sort of okay since
the reference to struct domain isn't really altering that struct,
but the goal of limiting what is passed to the function was to
prove that the full struct domain isn't required there. Also doing
so would tie us to the iommu piece actually being a sub-structure of
struct domain, whereas I expect it to become a pointer to a separate
structure sooner or later.

>>>> @@ -550,6 +551,91 @@ struct page_info *iommu_alloc_pgtable(st
>>>>      return pg;
>>>>  }
>>>> =20
>>>> +/*
>>>> + * Intermediate page tables which get replaced by large pages may onl=
y be
>>>> + * freed after a suitable IOTLB flush. Hence such pages get queued on=
 a
>>>> + * per-CPU list, with a per-CPU tasklet processing the list on the as=
sumption
>>>> + * that the necessary IOTLB flush will have occurred by the time task=
lets get
>>>> + * to run. (List and tasklet being per-CPU has the benefit of accesse=
s not
>>>> + * requiring any locking.)
>>>> + */
>>>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
>>>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
>>>> +
>>>> +static void free_queued_pgtables(void *arg)
>>>> +{
>>>> +    struct page_list_head *list =3D arg;
>>>> +    struct page_info *pg;
>>>> +    unsigned int done =3D 0;
>>>> +
>>>
>>> With the current logic I think it might be helpful to assert that the
>>> list is not empty when we get here?
>>>
>>> Given the operation requires a context switch we would like to avoid
>>> such unless there's indeed pending work to do.
>>
>> But is that worth adding an assertion and risking to kill a system just
>> because there's a race somewhere by which we might get here without any
>> work to do? If you strongly think we want to know about such instances,
>> how about a WARN_ON_ONCE() (except that we still don't have that
>> specific construct, it would need to be open-coded for the time being)?
>=20
> Well, I was recommending an assert because I think it's fine to kill a
> debug system in order to catch those outliers. On production builds we
> should obviously not crash.

I disagree - such a crash may be rather disturbing to someone doing work
on Xen without being familiar with the IOMMU details.

>>>> +static int cf_check cpu_callback(
>>>> +    struct notifier_block *nfb, unsigned long action, void *hcpu)
>>>> +{
>>>> +    unsigned int cpu =3D (unsigned long)hcpu;
>>>> +    struct page_list_head *list =3D &per_cpu(free_pgt_list, cpu);
>>>> +    struct tasklet *tasklet =3D &per_cpu(free_pgt_tasklet, cpu);
>>>> +
>>>> +    switch ( action )
>>>> +    {
>>>> +    case CPU_DOWN_PREPARE:
>>>> +        tasklet_kill(tasklet);
>>>> +        break;
>>>> +
>>>> +    case CPU_DEAD:
>>>> +        page_list_splice(list, &this_cpu(free_pgt_list));
>>>
>>> I think you could check whether list is empty before queuing it?
>>
>> I could, but this would make the code (slightly) more complicated
>> for improving something which doesn't occur frequently.
>=20
> It's just a:
>=20
> if ( list_empty(list) )
>     break;
>=20
> at the start of the CPU_DEAD case AFAICT.  As you say this notifier is
> not to be called frequently, so not a big deal (also I don't think the
> addition makes the code more complicated).

Okay, I've made that conditional, not the least because I think ...

> Now that I look at the code again, I think there's a
> tasklet_schedule() missing in the CPU_DOWN_FAILED case if there are
> entries pending on the list list?

... this, which indeed was missing, wants to be conditional. While
adding this I did notice that INIT_PAGE_LIST_HEAD() was also missing
for CPU_UP_PREPARE - that's benign for most configs, but necessary
in BIGMEM ones.

Jan


