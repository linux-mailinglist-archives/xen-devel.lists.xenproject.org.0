Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98271401A8C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179666.326075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCj1-0005pi-2T; Mon, 06 Sep 2021 11:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179666.326075; Mon, 06 Sep 2021 11:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCj0-0005ni-UX; Mon, 06 Sep 2021 11:23:42 +0000
Received: by outflank-mailman (input) for mailman id 179666;
 Mon, 06 Sep 2021 11:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNCiz-0005ms-Kl
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:23:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79dfadaa-d577-4815-9aab-3aadf84dc4c8;
 Mon, 06 Sep 2021 11:23:40 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-NqeZ9Tc4NUSIe3A-WzbJOQ-1; Mon, 06 Sep 2021 13:23:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 11:23:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 11:23:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0176.eurprd02.prod.outlook.com (2603:10a6:20b:28e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Mon, 6 Sep 2021 11:23:36 +0000
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
X-Inumbo-ID: 79dfadaa-d577-4815-9aab-3aadf84dc4c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630927419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx0HZQkV4tYv17/m2KPYg7jrcsCcKDrCsNTIkEptX9k=;
	b=WJCvI7C7nNkLsdRwpOT3a4MAI2JNZijyNRB0sH1Se81kGatKSnIrjnSJVFk/sdhcBqj/EU
	WgTXeLSeRHZXX5uLCc/KxMiXXngkHFUk9KThewrIZhYi95fXfYb3AZWgSK/suN5PwmrT5w
	n1SQ0S/Yz/hwDAExs3LFwHsWXbLfPTs=
X-MC-Unique: NqeZ9Tc4NUSIe3A-WzbJOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv4AqZAEXed4h/4/31nXsI8HDGBgLiqohdxyp7hkBikhUv74YGeNmwk618m+7Z81++uXeQvZSOTdcfQNqU4xqBQfJAaaE3Pk4nu9cvSQg04WG8F6eP3lNG//PxpVcoT3rAJa+2K00b8nz67uI2uS71M4gADgZ7eRE1Xaj4TvB5QVK60SXXvGf8Z/dh6sfHdWYTmVfdX8rQj+fZ1QIUznaUB4uiAkyJlozRHBRuuIvKXFofzhfS5gzokETtGclqLFbZ1TcNQpcyqvjODBnz3mjPpHGLp5qB1bu/1izvywnGE+4zRfon5cYCREjfFOZRecUz31mm6kf5NfhsvsW8DZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P10PInH1DfhGLms21QzcUomgnt98pv9+SUigsNNpRbw=;
 b=ctIUMbPmrAqRPB2SMPfaizx+Dr7nyPBafW3aTN47XsS9fOIzSeciOgSbO3X2/QugePwO0VAp+OVA3OygUEIznoYa8qjcdj6c2vylTo1bA91UHz68TrPpfhO5l+aO+JreUMa8KLhADmGBmvKBYsoUpiAXtBbg4i//t7lQu6j9cigffc7tn06rwD74ED8rKAe70/yh3nxxuUNNfQkhsd5h4EgaaQbJCMyJ8H7KupQhSNHsd/DYbpYDvXaM4sMpG+7rJdqTW0YXfvoZKoDKBKevkCrVwsLui8msaoU8lHbzyQDzdReZlee2PfI669jvkIrNFPbxcKK+7phl0RS5GRuRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen/sched: fix sched_move_domain() for domain without
 vcpus
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20210906110057.15384-1-jgross@suse.com>
 <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
 <2a42660c-e1ae-c791-784a-da39e64473f3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <598640b9-758a-5a0c-83cd-38b3e41d7b39@suse.com>
Date: Mon, 6 Sep 2021 13:23:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2a42660c-e1ae-c791-784a-da39e64473f3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0176.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52483e6e-a830-4d49-26f8-08d97128c51e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192F81526FA4C65E0B72084B3D29@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZSDvWTTR7eQMSLoBbChbX6usSKHGvRClQNok3u/gLQI9UbErC+ymyMkvews1ip1rRARbIKz2SavqwSyqCFbQgtcPOpQm028JNP2307VFw3roPWxjYWt/fyRJX/9HjE4y8SpkcRufemYbw//YWUy1wxb7QE0iZ89IBZRxQoHOIU4h+hCnUuqA//GLXrEl1AitcyERB92DC8fadvLkIFnRmtddTMWMn5wQT5leZvSvN9a86EKVrsqEH6L3UeGAgRQahX+zi2dcqbNaN313kSA3V88+2Sauwuqn4+m79Yta6qiPkSfXI7zkzmY8HPBtIkj7hkV/SAqBj4Wf67ckLW39cP2WhO3cBENoR+5QYqeTO92QZwa5EqysjvCFajV7/9eJvr/6eUt13FJu3T4tre9pZZb1Mp9Q+gv+baB2FFxJM7nybIIsw8rVL+kdXNvQ5kwF8vNjvLgjcNEXlhnqWHAWaPpOThT8BtZcDuOXlGT+v2JnmTrG1CFVC+m6VvW4RXOqDw3dC8jPzjLYtk73/swHi+yOVNJhaJ40Wa3w4zCJx70xbbYpT0tbpk9cB90N0x19Qt6tdNfsPqhGdgr2N46aNISb/Bnl+wMA1k4awJ8E58lGZDCNlujmIIZEaqiXLT/OKJJK6/NKuFF7YM3SwRL6o3m4tZeYcun6zVeRLF8et1RCjzRbssnIriJuHwKwg6RkeiXBsq83plAHx0fg0IcnzuakeYtmtkEb1jauPZcDhNU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(346002)(376002)(136003)(31696002)(2616005)(956004)(110136005)(4326008)(36756003)(2906002)(6486002)(31686004)(66946007)(5660300002)(8676002)(8936002)(478600001)(38100700002)(316002)(54906003)(16576012)(86362001)(6636002)(66556008)(53546011)(26005)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2NCDR6Fz4fI3v9SC516A+ZGD7IPHdRrqnoqV0C7KuIHG0sABTvhWmJJiaSr+?=
 =?us-ascii?Q?AEp6RGR9VqZtsQlbOhBZZ/BKqMMibEkrfrLj//98rmt64ZUnlip6XhRqiBJM?=
 =?us-ascii?Q?ltBR0qP18KSpMx6opOaXawGMMgxtkMaEhpbJ0+y6YZq82VOwSywlQ7w6vznE?=
 =?us-ascii?Q?WJr0Qnau+wuan3uRhj0C84czggxcRPz1GPxuuJ5hTk/gqrsbrCctYO2VOi2D?=
 =?us-ascii?Q?B+Ml/KYhu7pB6MOWsyCmrFFtG0GkN64W+7vhqOpVMcPD9md2DYOTU1RnkOQP?=
 =?us-ascii?Q?ARV3hWU6i2/NidB6Vgmeup9JoKB5l+LFzM1k7AG6j6FcQ9jVVSPQukL8MoqU?=
 =?us-ascii?Q?2kojc4dBLs13mWAJ2vN8Tft9qqJeZQz29tMdc5q6UQ491RJDH4S7rR6By36/?=
 =?us-ascii?Q?Pbs/n0h4JiNOn+yuJjVgNvXw+7OUav+fQyjTb2F4mWux8tiWVTodQHx+ZOs7?=
 =?us-ascii?Q?n6nECBsbIbTumj2yhSEDZ4MmmlUMq85qp06W8tCxiTPRsr7ttptlnhHfW+oe?=
 =?us-ascii?Q?sBsX9ks2eMKrK14X3DlhmuvSKngT1oZSJdk9D5IgA8muomsyIwKD2RZ5cmoI?=
 =?us-ascii?Q?0OCGgDTjl8oHicvqjB1ykywU0XfLfR/ztxr3YSOv2vzbd3OE6CkQAnVRj3lo?=
 =?us-ascii?Q?E67deN1VjgOoE6N1Keh6or1ArH7DPQOdLnHrlimusvzb9OTxEzAFk5SVrIx+?=
 =?us-ascii?Q?PcDwZpmWi0aCm3oc93AeQ6EmRlZox6duXP1ZeGp8MeUfU3+tirLZpxvUyf2i?=
 =?us-ascii?Q?5GRBIuVf52lWJIjuMAz+LOEEWVXcufHSPQP4h5bUZFJh0F66MzFS4PBHBNGl?=
 =?us-ascii?Q?iDCs/29195XQmoJ30cBibHebNFbGMFfmicJph3M+U8ZXrrFZJxjGndEVQCGI?=
 =?us-ascii?Q?I6b8PYkXDyZT/w1XJ4d0bhFAt7Y7XMqyYwZuwq8yyHjHi+7TlD/8asH0HSzu?=
 =?us-ascii?Q?PYdhn6Z6YYS+JU2HoUf5qLAKujl727nwa5Vb/np4Jre6YCX2LDdsD8HyG9v0?=
 =?us-ascii?Q?uFwnStE/2/jxxFMoBIY8AJAvBU5u4gNP2keMpqwJVItu2eDO2MsX501CHPCh?=
 =?us-ascii?Q?Jg2izlXzh4zsRfGn51ynOMJYUwSALn+glif84FOpdOGUS3cmLJbbhnNq56wO?=
 =?us-ascii?Q?0ugaVF1cPSAK1A50tnZiATkkW9KaPRi0nI/xEOD6pbQqxJLPuFPZB77sQWvi?=
 =?us-ascii?Q?7Qmk3xGZ3wvDUa95WESOK057MD9+Nje5TN8x9tii/j8/fbkFBSv+F43KLDuB?=
 =?us-ascii?Q?Cu8iNeIcHd9LfEFVxIdbZ9hrzTOfPZ6z0Z9TYDsweVqIOoCtOqNm9wMAUtVc?=
 =?us-ascii?Q?AbRQQygqrFLNNK2+9ADR2QNb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52483e6e-a830-4d49-26f8-08d97128c51e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 11:23:37.1023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq2+jMR1+ZTo0z/4NiHsmI0dSAg4WalspNEz8xgiQL4ZCOpyjNBrpLjJqcBf8ZscmfYmH9YRvl56TGCeOU++Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 06.09.2021 13:18, Andrew Cooper wrote:
> On 06/09/2021 12:14, Andrew Cooper wrote:
>> On 06/09/2021 12:00, Juergen Gross wrote:
>>> In case a domain is created with a cpupool other than Pool-0 specified
>>> it will be moved to that cpupool before any vcpus are allocated.
>>>
>>> This will lead to a NULL pointer dereference in sched_move_domain().
>>>
>>> Fix that by tolerating vcpus not being allocated yet.
>>>
>>> Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpu=
pools with different granularity")
>>> Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>  xen/common/sched/core.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index 8d178baf3d..79c9100680 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -671,6 +671,10 @@ int sched_move_domain(struct domain *d, struct cpu=
pool *c)
>>> =20
>>>      for ( unit_idx =3D 0; unit_idx < n_units; unit_idx++ )
>>>      {
>>> +        /* Special case for move at domain creation time. */
>>> +        if ( !d->vcpu[unit_idx * gran] )
>>> +            break;
>>> +
>>>          unit =3D sched_alloc_unit_mem();
>>>          if ( unit )
>>>          {
>> I think the logic would be clearer if you wrap the entire for loop in if
>> ( d->max_vcpus ).
>=20
> And of course, this is wrong.=C2=A0 Turns out the domain_has_vcpus()
> predicate still hasn't been committed, but d->vcpu[0] is the correct
> internal.

Which in turn might want to be done by setting n_units to zero when
d->vcpus[0] is NULL?

Jan


