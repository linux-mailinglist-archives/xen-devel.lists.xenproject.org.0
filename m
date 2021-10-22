Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29166437532
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 11:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214916.373764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrKF-0008GU-SR; Fri, 22 Oct 2021 09:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214916.373764; Fri, 22 Oct 2021 09:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrKF-0008E4-PR; Fri, 22 Oct 2021 09:58:59 +0000
Received: by outflank-mailman (input) for mailman id 214916;
 Fri, 22 Oct 2021 09:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgL4=PK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdrKE-0008Dy-Uv
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:58:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6802971-196f-4baa-9d1b-072387ccf976;
 Fri, 22 Oct 2021 09:58:57 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-dvhSc-osOASuwXTUUe7U4g-1;
 Fri, 22 Oct 2021 11:58:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 09:58:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 09:58:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.10 via Frontend Transport; Fri, 22 Oct 2021 09:58:54 +0000
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
X-Inumbo-ID: d6802971-196f-4baa-9d1b-072387ccf976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634896736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibfLXA2zjs5qaY/Ui2As+zAh1pplesWpfV1lAoi47OU=;
	b=YEgFx0Glkoq4IGSHg3prJOgmA2jSxrgN4Woo7PFGhQfbiVBq/0lRR0JHaRk68guA2ARF9W
	oFzcwfZvKc+dNgGckYhdMBewp+eIKDQIRwxdhNBkOTvYcTw+yv+n/bVa09Z1tdt4UPtA8X
	wzuGIUqG4tdEsFXXZCA0edXNKuZMtqs=
X-MC-Unique: dvhSc-osOASuwXTUUe7U4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wny2NuhX6Kd1BQXkCcHmmpYeKZb0HPenzwlvs9Pn7hmSSeie2nhyCnjjrrgaQVGvOwgbKrPdpBYLhcw3BEJed0mqktt9XrMrYuiySwxCqRD8FrpEdjEpTHC3PxpVRsjCA1zgQ0N948a0lyQGlucXuvDTfQx9fLxxu2tais1iNw/4ndmkDx8fMYBTKOP0Sc8ErWcqsB1qK/oQKVNCVFvnE+chUN4aTIKgrvis7j1/drLzVlbEedt9EFoaH1CWTcp/B5IzdK5AHSwIJzsE6ht/HiQjkM4y6kTxOyc6eg3U6vaiUVBoYocMSuovNGbtD6Uy7ddc2Vo1BkHwoxJGkd2jZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FenLaUIXSE7u3OniYmEEaoPqXXNQJjXPZQlKQi+YVY4=;
 b=Wz3w/zPgPVod/MkJYVEw4ENS5n35jEj6br1V5uEdELiICHLhyHH0JY0AzWGCjCElmUnRpcW/67vSP7gDnikpcBit1XlAYV1LWBmZTHu5hS1HOKGThzsezUBybBhWS4t9WOSgTyvQ5OTsvWJTnuYnHqRb8sCEstBY5wu9f1IFryswiC85zYN1Hy/TJ/sRPQ9K/eldOwNQ0w2UUgXYG+Vj1Xmy1BpMLxWjc21+VjLq7S4R6vAY5WRWcK7SjvVveH5K2eZMuNoHhvTG/ztHdE9UgBJRibnk17N+0uL71wNv3Oab/TX1rwnxgm9wo58kbAfym6mX4iyBfZXyN4NJCIu9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v4 1/6] x86/PVH: improve Dom0 memory size calculation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <4684f314-2c4e-f662-bd4e-132be001da9e@suse.com>
 <YXKKpgSCiIXf/4R9@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d27114fa-ea85-b6ed-0ae1-c1598c708a72@suse.com>
Date: Fri, 22 Oct 2021 11:58:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YXKKpgSCiIXf/4R9@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff30001-1d18-4102-2165-08d995428f06
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377472880FBCF5A6E7A8D5FEB3809@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B3vKCf4W7IKcWcPoTbjVolAyGTE7w3xy6Y2d5DOQpHixYzx1ZWMoO2ZnxoCnGzQSTHC/mvVZr5CjDHTI5xEVo4J5qlNC26NAgWvByawgeP8jQeFfRGa6Z+SqjSoTUJ4ocVdPdVA/uZDjSYzhiFaGjr6yKmWBrwy+YD2+EtgldYNtHq33qVRdk9qqx+ND/SGAfKYBWk2crZ9Ygmty2bycXVHqSNgYHSktIB1hMvyQcJYy4nMtZhrP9K7uwiHqPZ+z/sFw9NI1QOdLQdcWO6T29YZuhPCa82sw064flCkmMJQPXoArcGYYzeFlNmSZiM9I5gST9x0Td79KVVK8tABJ95OFSM2HYutKC94pJg/kUrqqsvO0aQaWszpUdzu6/V+DS0+gjQH63Z57NZfXCFEZv5xLYOXP1lW4zXMGrkXSKRsl5OROWTkK4fRBtDEaxmRCSgNBhHOEicFdcydltV8rEqCaVuDka2PFztgGPMHZBmgrwxBdjrRQu0FAYZ5ea8D+qrysjniqhT+kYwpCN43BTQY05aSH94uNWaorhMAolDLq9MRPW0uiVIm6l00ZWG6iFmygdhS8j8Vv6zSWAGklq29YErnuTzmwtZrW/+yu7ah+jDaf0ybQQ0MlRTwls/++xqUCphb1XXIszGSPva2N8ZlizedtjRZ7yiN4kSpmG7Lfpmc3aIsO4z+UNIR8muaNflD2rVulLmu8dxMfOVnBc7a90mZgQ6akxUsjrT9wYBHIbieCH1gqV7mD52t0DsPG9xIBCD8qyY2XSjfbTQmU/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(16576012)(2906002)(5660300002)(6916009)(31696002)(8936002)(8676002)(86362001)(83380400001)(31686004)(36756003)(26005)(66946007)(66476007)(53546011)(66556008)(956004)(4326008)(2616005)(186003)(508600001)(38100700002)(6486002)(54906003)(25903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ykiIlRITuVXoxiwyv7cCFA/9S4bglPlVjJlR5L8YNnjF7ze4gxozP7k/RteU?=
 =?us-ascii?Q?nFv07MR9xiHYRf8zFS7ZIkPiPRc5TvkNF3cnnQvzLvVD+lX8ddhH1xL1SHnQ?=
 =?us-ascii?Q?MUFdn/0m6WG0wpewcjvhHY15DLZAPtlgNiEUwdnLmohHFYjgyAmCR1EUrRLq?=
 =?us-ascii?Q?toxwSRMsaClIKLT2r6kV9IBVOUSQDsVXZMIZzRiMdapGzbsE+ojmBcCM7Ujg?=
 =?us-ascii?Q?lTod/+oa6AZdEwdj/cSjL3iK98v3cWZm9SFASOKoxqIjm7XCRBju4LS7FUrk?=
 =?us-ascii?Q?LvAH4Hd5xstiDKRUj0IfwEORLN6E5V6f7v7VurWWlBb+KUay8TwZJmSL+Rok?=
 =?us-ascii?Q?4duiYE4mG9RrYHfZqWd5Qmn89Ba/SwP8LoWPD+xg5y02lpeLq0S4Td3HEZn2?=
 =?us-ascii?Q?AdwZPXA9gTiiIMkHWMifXl8rKRBWX9IIxltDngtXgVQJgLEpvrMbb5Ti/+GZ?=
 =?us-ascii?Q?Y6IEjrNcJR98QVfQs3F7rV3FJQMNFukILJi8MaRdPcE45/h478uH+0hmK2r/?=
 =?us-ascii?Q?QxvXfJ7xlfEPNZ/rPPhMZ148JboE8EAj1SJAl2qGZrZzpaOVdx7VpAsT7rKS?=
 =?us-ascii?Q?BIuFwRoaYdCdZA6jjqFzo4LL00DI+G5J5vZseZ7QDibSp+tmVM6fE+PlfBlD?=
 =?us-ascii?Q?i84otj1zkSS52vSY1thI4q95q1/dzTxcTQttUsV2FsUQc7oSIFFOe03Ri5Zu?=
 =?us-ascii?Q?huEVWQt0q/Nco3jWthM1bK1PZNb3ARjmoq619AuK5OE3qLt1DVdMXEihulzG?=
 =?us-ascii?Q?7f6N/eqDUxBB9kXJsSSM7/aCcE9qC9EPo3146SFeXrl2Vi1dYa4voEomsk+c?=
 =?us-ascii?Q?KUIhJ1n/kR1I1v5NZ/wL974+qucXm/+GeAgs0ZEw61qAYXpYz3IUKbcS1W0a?=
 =?us-ascii?Q?PfvPRcNehU9OkVwYzDmdojQxr/q+68hEszlT0VSWMMdMk1dbpwC1RWD5eP1N?=
 =?us-ascii?Q?EH5vFaWd8f+dgMw5V0b9DCXn4+ztCJfbtyBVQtUAemDM2l5jgBBT3+mBSjOK?=
 =?us-ascii?Q?yPG+Mhq1QLplLsvsfTBGa6zO7WfyEXtJBIgl2eqKaqP4FhVCAVEV8O9Xq7FT?=
 =?us-ascii?Q?+FMEndenQfTzMeQiYXZqbJJ7ZCyhlEbU3z3qRlSCrGh7YbI4FZ5O5Q7cljZD?=
 =?us-ascii?Q?zL6UQkRuGhzo6Q0Pl1UhyvB/M5jK31p2QVMVpvGtMFTorpdMrVWSnIudeVR6?=
 =?us-ascii?Q?oZ2IiNLvTQrtDdyWshVqv+CKhgkJNh14EIh1VXkAegmBP4glV8f8G2ia0Pr9?=
 =?us-ascii?Q?zCtw2XVMF0oeWXf0pMkTpdcjWP85yXtP2GqoQiz/ctdtBmeKMT9sJKrraY9M?=
 =?us-ascii?Q?Pgm3900D6gZD3i+zOd0VlB7mNf0N9dE+3sJDH9FZBKmFpd7cM/sFsX8dgsUT?=
 =?us-ascii?Q?i6vu5MYgspMV/om4ufhjxoStJceZX3dEhZ2Z8Ab3klYwc2PV19YX4SAPIcW7?=
 =?us-ascii?Q?rkw3vBd8oj8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff30001-1d18-4102-2165-08d995428f06
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 09:58:55.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 22.10.2021 11:55, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 29, 2021 at 03:13:24PM +0200, Jan Beulich wrote:
>> Assuming that the accounting for IOMMU page tables will also take care
>> of the P2M needs was wrong: dom0_paging_pages() can determine a far
>> higher value, high enough for the system to run out of memory while
>> setting up Dom0. Hence in the case of shared page tables the larger of
>> the two values needs to be used (without shared page tables the sum of
>> both continues to be applicable).
>>
>> To not further complicate the logic, eliminate the up-to-2-iteration
>> loop in favor of doing a few calculations twice (before and after
>> calling dom0_paging_pages()). While this will lead to slightly too high
>> a value in "cpu_pages", it is deemed better to account a few too many
>> than a few too little.
>>
>> Also uniformly use paging_mode_enabled(), not is_hvm_domain().
>>
>> While there also account for two further aspects in the PV case: With
>> "iommu=3Ddom0-passthrough" no IOMMU page tables would get allocated, so
>> none need accounting for. And if shadow mode is to be enabled, setting
>> aside a suitable amount for the P2M pool to get populated is also
>> necessary (i.e. similar to the non-shared-page-tables case of PVH).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder whether this isn't enough to drop the "PVH dom0 without
>> dom0_mem" warning.
>>
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -318,8 +318,7 @@ unsigned long __init dom0_compute_nr_pag
>>      struct domain *d, struct elf_dom_parms *parms, unsigned long initrd=
_len)
>>  {
>>      nodeid_t node;
>> -    unsigned long avail =3D 0, nr_pages, min_pages, max_pages;
>> -    bool need_paging;
>> +    unsigned long avail =3D 0, nr_pages, min_pages, max_pages, iommu_pa=
ges =3D 0;
>> =20
>>      /* The ordering of operands is to work around a clang5 issue. */
>>      if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
>> @@ -337,53 +336,65 @@ unsigned long __init dom0_compute_nr_pag
>>          avail -=3D d->max_vcpus - 1;
>> =20
>>      /* Reserve memory for iommu_dom0_init() (rough estimate). */
>> -    if ( is_iommu_enabled(d) )
>> +    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
>>      {
>>          unsigned int s;
>> =20
>>          for ( s =3D 9; s < BITS_PER_LONG; s +=3D 9 )
>> -            avail -=3D max_pdx >> s;
>> +            iommu_pages +=3D max_pdx >> s;
>> +
>> +        avail -=3D iommu_pages;
>> +    }
>> +
>> +    nr_pages =3D get_memsize(&dom0_size, avail);
>> +
>> +    /*
>> +     * If allocation isn't specified, reserve 1/16th of available memor=
y for
>> +     * things like DMA buffers. This reservation is clamped to a maximu=
m of
>> +     * 128MB.
>> +     */
>> +    if ( !nr_pages )
>> +    {
>> +        nr_pages =3D avail - (pv_shim ? pv_shim_mem(avail)
>> +                            : min(avail / 16, 128UL << (20 - PAGE_SHIFT=
)));
>> +        if ( paging_mode_enabled(d) )
>> +            /*
>> +             * Temporary workaround message until internal (paging) mem=
ory
>> +             * accounting required to build a pvh dom0 is improved.
>> +             */
>> +            printk("WARNING: PVH dom0 without dom0_mem set is still uns=
table. "
>> +                   "If you get crashes during boot, try adding a dom0_m=
em parameter\n");
>>      }
>> =20
>> -    need_paging =3D is_hvm_domain(d) &&
>> -        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
>> -    for ( ; ; need_paging =3D false )
>> +    if ( paging_mode_enabled(d) || opt_dom0_shadow )
>=20
> Do we also need to account for opt_pv_l1tf_hwdom in case dom0 gets
> shadowing enabled during runtime?

Yes, we do, and I've added that to the check for v5 already.

> The rest LGTM, so:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but as said in a reply to this just yesterday, this is buggy,
and a v5 is going to be needed anyway.

> I'm also fine if you want to remove the warning message at this time.

Okay, will do.

Jan


