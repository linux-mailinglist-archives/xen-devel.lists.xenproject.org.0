Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611D4A8070
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 09:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264519.457626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFXWM-0005IY-2j; Thu, 03 Feb 2022 08:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264519.457626; Thu, 03 Feb 2022 08:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFXWL-0005GM-UV; Thu, 03 Feb 2022 08:31:13 +0000
Received: by outflank-mailman (input) for mailman id 264519;
 Thu, 03 Feb 2022 08:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFXWK-0005GG-GS
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 08:31:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3bba573-84cb-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 09:31:10 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28--7ZxQoXkNYeGBjpGMwFHQw-1; Thu, 03 Feb 2022 09:31:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6601.eurprd04.prod.outlook.com (2603:10a6:10:104::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 08:31:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 08:31:06 +0000
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
X-Inumbo-ID: a3bba573-84cb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643877070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmH6CmgN6balkt3iHXRNofwPwrLiRaQR1VbGFCd3aQk=;
	b=V37vsD4qPLqZAL8+WpC5TWYW/Gwjh+iGjeTnx8MyoWhswteqI6fCiw2nLCBFJkGtR1HYps
	3f9o+bLjTZvr48G/bYAHccOA/t92xrlpd9VHhSn3P7BhbkLAOeS7z2leq8eoAX11zil3wH
	I0em2Sg4wpnZ+K7T1Lnry2BUG8xkjno=
X-MC-Unique: -7ZxQoXkNYeGBjpGMwFHQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+PoU9vJvaQ2qsgxe1s8qWQzzdfYpqDMqoGFuLSDaayivr7sHepjtPcG/aDl+qebPAlTbiqSj+ZjgHTRKN+NaK8lQyVxC6wfA5J+PWmwO8a5XgnGgKjRUyWWe0b/cNgzc0W10lR55sQrDbUxzuCCN5aYA77HAdG/7pg5k0e2slAMi1/FrKldxba5QQ3SBPkCnVEdyV250HC+ZbyjCNQYnw1JFuSemVGFKFCc0nusufzqGHfEXABS1klTUXQBK66DJJHurNOV7ZuJBsB+pILM25773rJAiLHT/H5hR3LUmRHvAbSprwv01qBy1fHNbLl3jPuTfRIYvtxVlQqT/Afn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FiDubBCIc3LEE4HoLRKikwBjbKopWHpDaeCgVS5xNQ=;
 b=He7QmAtxy9bvldZEWO/SqxTKUMy1N3pwafLgaFonHEYF1xngxfuwH2Vq6Oi6+2LCwdgH7pmcsjehPoPVnnERNDJ5AbcDcuNkf3a7EOHsPv/gzsplMrUWLTxOl2qb0TWEDGmmd2+ffupOTcI7jMP/kdTSisMT66jXm2hEq8M9YpZdelJpIWH4eF1bWi1+TrhxwL+IA29t0aFyhNSop8OucI8gR7dw2lCL4qU3axDi04KzdeRYhY+slHwsE1gOIfIqCAfUeqa6rxTZFlAe5IDPBvxuFrbvUhRcX3ODhmggdiIFcNWghYT2f2dhX6jNt0QtBtENCzM4se1IzjCwNhD5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
Date: Thu, 3 Feb 2022 09:31:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
 <YfqtlZMAKd/HXsgf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfqtlZMAKd/HXsgf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0087.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac61d65f-04f1-4e4c-8048-08d9e6ef8576
X-MS-TrafficTypeDiagnostic: DB8PR04MB6601:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB66010A853734A4997D4F7321B3289@DB8PR04MB6601.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mEvvqEFrMAStvu8tqm4SurLGeBJguUqf18DZQ//0WLX0oGpiSe9BVgB0d/oPwEfHBR2GRxbl53h8IIQ68wH5m/lc3od04Em9wIGxColbF1wZBcY0CcFwuEGDFANpVgUy74OOPj9MPjxIE4SpoV0IFn7Fdd1cj9nxoDbW7JI2IhsExGmkZ2Yg0prHjwwh+saHTILVn1Q7nC8y3Ihg43CTfOS0a1O9N5PICMoxNCkafPGwwwheRS2n3kHTitsosXyW0rXL24qMHJpczYbz0OpSdB5WMLFAm8Nz5ARe+8vGJjArA/aBAd8zdoj+GJatfbYGlfcqalcTRIyNnHDRi3Nu7kIIiv1Nsb5N4NKb/1zYF34mpEzh5ve0XqVWxXlCBXvhCZgBP0Pkf1g/ZucZBtSxXC44DEjmo4Jkbqx4r04aBaZl3PutaafcCY6yC1NlvQ32bJLjRBLQXLlTZeEvl7Dm2epi7VBC3DLyHbzRBelSIOE3hUDyPFHdHgli0v8Nv9OhC95D5RBN9KgdnAEYF14NH0kxDQ9Keg1G+5NFuHa1+0XXNY2P8ifZWjHhFHQSe00Ee+SXDP3hxg2QyOeL0UXm1CTtA5jUH0PYp+wt21M6JU0oie266p9+IU3DCX+i4WcCKnQFrSBl6dOSUc1hRbcPlE+P58zaulKsGX7S9hAcFCP7uxgTs4CWkrLbuJqjCn56Aq5CnJAeci4S57iQb7ZgDFX8yveR1lBj7L9HHAaa8yg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(36756003)(5660300002)(66556008)(86362001)(66946007)(66476007)(8936002)(316002)(2616005)(8676002)(508600001)(31696002)(6512007)(4326008)(6916009)(54906003)(6486002)(6666004)(2906002)(83380400001)(26005)(6506007)(53546011)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VdviZpORSaq7XIu+qk9mtBozxSQlkRS2Dc56M1VvEmc47gcLDv4J4dDO5MKB?=
 =?us-ascii?Q?JNwkVZ0EIfwzSU/xJpSgAkg9toioRKv3X3SLDuJvBlS2o70xWQhZtYi5/CAw?=
 =?us-ascii?Q?ckIXGwM1m6dY+5TKQAeOBrEvZKgSE9WUNP2PHQzpv4y/3KnoqP3kIwvg90sW?=
 =?us-ascii?Q?D7b2J6WsuzSHelC+S7t0mihALORPei1+QehP/c1fKWb0XV1jNxrLBKV0Bwel?=
 =?us-ascii?Q?PSTsVWsiYJ8yot6KIDq+K81LSNhsvUvvnHwIqLAmiLowDMhzzwrniqUtyLBr?=
 =?us-ascii?Q?fRfeisfabx7vsNovEVTslMBFSzguPmH5FYm2iNMcXr2E5St7zJLKpIqGc43p?=
 =?us-ascii?Q?vq3CU2rsU8WzmE5bdLPs4zhfSknIm41WhMnQ84cFxrSZk11zHH+Bqj+2nFT3?=
 =?us-ascii?Q?nZOJCJL7W2mg7AU3HtKE0vSsNvkmSL8wyhUSZ7HFz80nist00w5HHS6A9Rud?=
 =?us-ascii?Q?P8Q9xDXdi+ojGC/5arsUbO+w3+vurFn1Lne04mWb1kKxeD+j8l5tDyUyvT89?=
 =?us-ascii?Q?nE2gtXeUsKzIa2MkaplIRnn6472vL9XVF3RPzrbaikJV6+8Cy0htjZTmHDXW?=
 =?us-ascii?Q?vFmkZCQQPSGnvCJSQxM/hTmi+3nqAyjjP61FnufEAovsc+v1CUHzxAggrw/m?=
 =?us-ascii?Q?OHrAbhYBzwIWPNdZUWw726extSGUySJ46OZeenijHxY/iAzpTp3dSGteDpdR?=
 =?us-ascii?Q?nhouCi9V9gk+RZLcqY9fXPFvCBNo+mVhKDUYPcUudJeW9c+xO1BsOwism2W1?=
 =?us-ascii?Q?+8mVePeMpLDHVRbvRZomFr3NSZja/4H/5a5MWyJ1AKngEeR2cp5IETJ7wrXe?=
 =?us-ascii?Q?TtTlXvbFL0kkDiV1qnWj+9sET5KlGkl4tDSefPZNTRV9+ygSlgPfVJf6ixia?=
 =?us-ascii?Q?QJt6UYsZQHA0EZrH6ZmJzVpScTm0BT73aWGDMB0uyKJXRcZvFI+pVBGJE0AP?=
 =?us-ascii?Q?gVfV9TzRQdx7xSaA8TT2MG1maM/sJdhYSTazPnW/vcjsowk27Br9ruzLhJgV?=
 =?us-ascii?Q?qWUZ0lGeCUxZR8pR7uM4lqzFnDn32M4Sxp/tm3n0emTAI9XM9cxJcJVuAQIV?=
 =?us-ascii?Q?QkGAo9ntcY9vTk8jhMaoIZUjhhLdqfGd/+/nLe/oZx1r1V4+HMwP9ICq6L9s?=
 =?us-ascii?Q?WYAkyNKdMxoLkeDSsERGe0k0lYjKfjyn1UqHV/Nqchp0yLx7sPkejbyyKsZF?=
 =?us-ascii?Q?BwVrSEPGL3zspN2kZhc4Na2iMmyw4WohA2BTh8SvfloRj3lOehUaruo9C4Z2?=
 =?us-ascii?Q?rPIWUbbxDfnrmVLlU6qz1B3NM80MhIDYZZFUMpR2XQahb/pGTfqGglB/btx/?=
 =?us-ascii?Q?qE5dHLhyjSnx6aiu1zl9dZE0wrY4shxHCUpd8xumNNmUycFlD0DINn3WwLkO?=
 =?us-ascii?Q?pBqtdYvAm5yp3v/r8zQsZuhJyNso2jWBVnB+yfeUA62y4n3Sh6VSe/17PO6L?=
 =?us-ascii?Q?S7FB3w/51I7RV93QxsCuTFJaDe6T0n9LiSwevo9s5gZYpvNFdNnLy5uXUPH7?=
 =?us-ascii?Q?WyCgUZ+igVHC78grcM0qt5FeWeDdLJt0cvIB+juRxqU8jLbkQNhmDZ+CWrVb?=
 =?us-ascii?Q?1UvmAv7AjAXUZm9d6HASfT9cQ3X5rg8S7CeP+omT0D+fquTWWvnQiSt5Q8rZ?=
 =?us-ascii?Q?od4DA2l85CuqPeJBywXlrb8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac61d65f-04f1-4e4c-8048-08d9e6ef8576
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 08:31:06.2531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXc7qvXiATLjza68NaRYZxW0ZKJiPQ6Ovot3xqkeoNkWZLfUa+wKUt29Lw/dkSOH6EXTE/Ik9+3vqjXOoqIe1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6601

On 02.02.2022 17:13, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
>> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
>> =20
>>      ASSERT( pod_target >=3D p2m->pod.count );
>> =20
>> -    ret =3D p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/)=
;
>> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
>=20
> Is it possible to have cache flush allowed without any PCI device
> assigned? AFAICT the iomem/ioport_caps would only get setup when there
> are device passed through?

One can assign MMIO or ports to a guest the raw way. That's not
secure, but functionally explicitly permitted.

> TBH I would be fine if we just say that PoD cannot be used in
> conjunction with an IOMMU, and just check for is_iommu_enable(d) here.
>=20
> I understand it's technically possible for PoD to be used together
> with a domain that will later get a device passed through once PoD is
> no longer in use, but I doubt there's much value in supporting that
> use case, and I fear we might be introducing corner cases that could
> create issues in the future. Overall I think it would be safer to just
> disable PoD in conjunction with an IOMMU.

I consider it wrong to put in place such a restriction, but I could
perhaps accept you and Andrew thinking this way if this was the only
aspect playing into here. However, this would then want an equivalent
tools side check, and while hunting down where to make the change as
done here, I wasn't able to figure out where that alternative
adjustment would need doing. Hence I would possibly(!) buy into this
only if someone else took care of doing so properly in the tool stack
(including the emission of a sensible error message).

Finally this still leaves out the "raw MMIO / ports" case mentioned
above.

>> --- a/xen/common/vm_event.c
>> +++ b/xen/common/vm_event.c
>> @@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
>> =20
>>              rc =3D -EXDEV;
>>              /* Disallow paging in a PoD guest */
>> -            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
>> +            if ( p2m_pod_active(d) )
>=20
> Isn't it fine to just check for entry_count like you suggest in the
> change to libxl?

I didn't think it would be, but I'm not entirely sure: If paging was
enabled before a guest actually starts, it wouldn't have any entries
but still be a PoD guest if it has a non-empty cache. The VM event
folks may be able to clarify this either way. But ...

> This is what p2m_pod_entry_count actually does (rather than entry_count |=
=C2=A0count).

... you really mean "did" here, as I'm removing p2m_pod_entry_count()
in this patch. Of course locking could be added to it instead (or
p2m_pod_get_mem_target() be used in its place), but I'd prefer if we
could go with just the check which precisely matches what the comment
says (IOW otherwise I'd need to additionally know what exactly the
comment is to say).

Jan


