Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B999467431
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237217.411402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt53G-0007NX-C5; Fri, 03 Dec 2021 09:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237217.411402; Fri, 03 Dec 2021 09:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt53G-0007Lg-77; Fri, 03 Dec 2021 09:40:22 +0000
Received: by outflank-mailman (input) for mailman id 237217;
 Fri, 03 Dec 2021 09:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt53E-0007LY-6a
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:40:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06cba19b-541d-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 10:40:19 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Vbj38aBXNQ65pkIZ9oRAzg-1; Fri, 03 Dec 2021 10:40:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 09:40:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 09:40:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:20b:b2::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 09:40:15 +0000
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
X-Inumbo-ID: 06cba19b-541d-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638524418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHYTgHg+7FRCQIwgYGV1e1aqFMZDIrWd/lDhD5N20uo=;
	b=m5kff9gjcreurLpfi2Mlfke8dSl1lE3a1OpjfJzA71rvDqA1M2LcX8I7txFTU6/OwyWgg2
	Z7zc1afUUPM/ayoNr8kUcznITMwCMhcd0Z7MuGsOHV7aSGX+wYh7h41UzSSbrisMsQ11fz
	q6u/vItn0lTtFDIKeiuKkGJ6OwBnhP4=
X-MC-Unique: Vbj38aBXNQ65pkIZ9oRAzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DABokXJOuvl825rr1k2H69stl5v/u76z3IPx+hqMAjVvaNYa6jRpXXu7LpIogQVh129v3f7EvL1L3hNevElqaoJssYFBq6vclhZqh2/jifg1B6pyw/hhDy2LsngCl3O/JWDQC78j9kAGA4oDhBbc3iNpj3gtnuYvsr97Vs0MlnpLDYlxFUp+yuY2Ub+h/Kf9bHDOvDJLCIPbN5qrtlzwK4EwCQZ6SIQKRDPF+aLjVzlsjEPT41ZsN+i8Ye8XHbePLDN0yp8BlPaLpFZRp600x4FWuW4wXj3uNcJTQ3cUgW9kupY+yL8k92o0AE9yKpJwjx50YuNXz07wp3PGuFPP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAPjWv0K3HkQmcfj9Fy2c3NWQar6a91TvCjAvL+3p5Q=;
 b=bPjp9U4DCHKCF8aL4Yc20S6haKIQfRg6w07louhZSTbXPFDN7LEKBzUjbqRiS9irZ97BvqVAVgsp+1J2hAAMIcgGbsJ1/dOciek9wPtdqnsQ2j28V40TEvlIdnSYDxnA0j6+bH7lqWMZ5QEUifh3TvitaDt1bvqOWPXcik4ICtUZ2yK63K8uSmak5wXqNnNZXaPCUj5lmk7Phl15qdlOWqFPYV5+rCLqWd1XsVCufAoKoq1jDl5vX51IU8aFEkfZULWzslNS3USJu3urWBWcOsOZo4hrt6nuna18aClEMpJlAFhF+ApDgOf9DKQ7zNdVxhbGSPs5P0qFWC+JetZwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7439f41d-bc61-fd88-6b07-a3e35c8720d7@suse.com>
Date: Fri, 3 Dec 2021 10:40:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
 <YajubFeUclKtpqV2@Air-de-Roger>
 <03dbb062-002a-3770-61c4-4f93de73c0a0@suse.com>
 <YanViGSnE+uMwA9S@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YanViGSnE+uMwA9S@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0015.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a702e2f8-1d9d-4717-7e88-08d9b640e94a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41891202B2A95DA1217EAE5CB36A9@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TR68fPNDPshxLqGZ4XcgPihB9Xe7WcXr93bp9xZmJX0VE6v20Lu556U5jVzzhmuENPdtBaAPYL+BTsq9jZPModo+yQ4In241P7/Gt6T5h/Gh/+Vnxiofd6KS1Fu1lstpdf5mHaxOYS5HVVZVi8Ag23ZoGMmvv9QBlT71VJ2DCFyZe3LoO2RCmBwns3nZJqalq04JhbWbs1edhOkhkKupwc6D9P43JAlMx22kCwOcgXlblN7YK4otMyUaqM1SM88ctZzd0VHlEo1pCyj39QIkseiCIiFpbKdZRmq/QTrfxs5riGj+1UQw1ndhAz7ociBIAMfeK72w0ro/2nX3t+/R7IB06tE1WQsau1JZj+kz2jraf/OCxJHTDgu324WftKeicNgyqs9tx+5SU39+cJAKhLJc1mUhqq4inTx0SD7MYN9pIsNLEy4qZ4drHHzZNErV3cM3Vfmcdza85TNQ/OrXUsOVFU9dSrZGABaxc59RAUWy45w3s/mI2GcLWGX73xYHxhb4f+K9w2bvUPnqVorkdcyLgxIcscpv4TZLtDEiI1CjXfhwihsmUXOLeswUeon4AbQEHo5t88wWL2D/Xv+rKJjpKFon+Vs/1+R+7bG98+TszoSbm7XX4Y7dRwf+u03aNXm2YgnLNz1//buSa0ZINM6VFksc1Dn5nMt8IXPcxhsQwoNJuF0zKtW4iNg6mAmtBH0dLQk2UCz/kwnnr8w2pLIGvjOYITMhQd9M0V7HxnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(83380400001)(2616005)(508600001)(53546011)(956004)(26005)(186003)(66556008)(66476007)(2906002)(8936002)(38100700002)(31696002)(4326008)(31686004)(6916009)(8676002)(86362001)(16576012)(5660300002)(316002)(54906003)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0jp3JQpPFjkgA+OX+2TfdmiS5uFQZeAxaCevPsNlGTFefqRBhgPC79cDpkqe?=
 =?us-ascii?Q?NmF7u3pqY/VJSMr1CKwuilGpj5gQitnOPXhGMLs00t0uZW/2f5vrzkH8jLuT?=
 =?us-ascii?Q?ycGX7LRZPyFletnLRNYCT3RxLvKO95mPUwBs2PJyr8F3eUkyOqvHxY+Ntxmj?=
 =?us-ascii?Q?tMTlzhDngtzFSSvNXMGan5avbqASvPwbWJJh3qhIYeeZ9D4G5IDxp7hQ6J6P?=
 =?us-ascii?Q?u7PYyDSNa7KT24V0RTYIPPNjl+xkGotoCnrxdv7dwE0LDjhM93be5LbP3xxn?=
 =?us-ascii?Q?rABX+MIf1Myn0K4YmG3oRaPHXtW0LasYqXZ9geShMaRPYmplJquQ0wWd5GM4?=
 =?us-ascii?Q?IWg0SZT2T6M+8Gz6nVKXJEHEBt+0/SpM5Iuf93qjFzQ2S2S2hB5S4O3932TV?=
 =?us-ascii?Q?b2AXnIZHALLY2RhR6Gfaf2iih2OzN085x6s1M1Om9p/HCY4rOFG//Nska28A?=
 =?us-ascii?Q?Mz6U4zqLJ5OAkVP1Rp7sQtKcviFBV8RtzB1neJQIuidFtUQvV4LkDmGNb7A7?=
 =?us-ascii?Q?izWnIqHH0vU7leFV4/v4pm181IOMmygy+CYD5F7Czd7dhEL9uTp5evyd8GGe?=
 =?us-ascii?Q?VMyKWyb00/MTCLk74++22BmDwOVHh9zsstQWAovMkePWify5NnKqVmadFoY1?=
 =?us-ascii?Q?oTj1I0/SP03dSN5X39Nnccr8VNNi/rKdDDHPtpJNlbuLz4DzqwNisCee6BFN?=
 =?us-ascii?Q?oF2HJD4bEk1Oo3o2W5xyzNgCXwugHBqk7vqBoGBkzckraw//E7hM22d4d5kw?=
 =?us-ascii?Q?kqC8pXGEHA/RPedekEP8HKLNm96ym0LQuiFttR1ghAtA68bq45DlMKM0Os4r?=
 =?us-ascii?Q?gzmbYD26ejvgxcfRaSpy8rJXnd7Y/o46WaRaFeLMxSzrU2DgoDY3nb3ULNnk?=
 =?us-ascii?Q?w8IzEYs5k2KEoHmykvGVrN6QopnES094IoNDobSz9t8UgApGeLOantMvbTGg?=
 =?us-ascii?Q?78HC9UukXx6d4g/yIvBdPpHWdnChfGTu3MzP7Qucd8yu2WvznGhBzShx6cuF?=
 =?us-ascii?Q?f1iNtKwvtYl+NGXCiVIW8Wqw4vNcPymdBfQe9kKwi/HmFCocjwaraKuMc7BA?=
 =?us-ascii?Q?bH0wUkY4BnEgzsddMQPfdrevoF5awX4um/zy+DRjGvs92WQFw11dLyDQENVi?=
 =?us-ascii?Q?6lsCj9xAexUSNBxzoxQIw9z/J9mgvHxkIT8EpwRqhmxuGG2jmMgdadMDTyLe?=
 =?us-ascii?Q?QqN3DzSXlLZ8U3cVcWW3zCSEhzBzS+BYyfvDKXc18dPPhZtgr+hwuWBQvlpB?=
 =?us-ascii?Q?/eGWpr00yRjaqMtTSXiRGd4hpeadYl4VpjfH1Ggyhxr/RoIxTBiILdtGH8Vc?=
 =?us-ascii?Q?cnyfDaFXa0Jt+SdrpP5n8Af7pb8k+Y8UMutXLZNx6jpTfOkrFATmw3Jve9/k?=
 =?us-ascii?Q?5WpxSKU8nKosUibozg9WjqkMV7ZhhaUdvKzQOzxnsEU7sop0ArOKq7JYUKj0?=
 =?us-ascii?Q?+AvvFmSkaOVKGsNlPTfnTKPSBijfyPgnDPtjzXs+hEUch92qV7L31YdWAYDv?=
 =?us-ascii?Q?xthKvD+CLjB7iTEDuHUZpiF0DBQlclShaOUYM0tjJQq5ySumAid3+WbgKZ/t?=
 =?us-ascii?Q?3Lexn8HbgcqAMyp7bjLd5gUyGP4njNpfDzNr5vIlqktnreRsDPnOTH5MVaaf?=
 =?us-ascii?Q?XzMo+w0R3/IXqik84nosx78=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a702e2f8-1d9d-4717-7e88-08d9b640e94a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:40:15.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjYnzD4LIFoxBEJ5DD3SgZIIC25/8D6+4s0p1Qv17cn140FL8NNwosuZQcbENn9NB9g9C+T8dOKvw/hfxXZYMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 03.12.2021 09:30, Roger Pau Monn=C3=A9 wrote:
> On Thu, Dec 02, 2021 at 05:10:38PM +0100, Jan Beulich wrote:
>> On 02.12.2021 17:03, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
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
>>>> I was considering whether to use a softirq-taklet instead. This would
>>>> have the benefit of avoiding extra scheduling operations, but come wit=
h
>>>> the risk of the freeing happening prematurely because of a
>>>> process_pending_softirqs() somewhere.
>>>
>>> Another approach that comes to mind (maybe you already thought of it
>>> and discarded) would be to perform the freeing after the flush in
>>> iommu_iotlb_flush{_all} while keeping the per pPCU lists.
>>
>> This was my initial plan, but I couldn't convince myself that the first
>> flush to happen would be _the_ one associated with the to-be-freed
>> page tables. ISTR (vaguely though) actually having found an example to
>> the contrary.
>=20
> I see. If we keep the list per pCPU I'm not sure we could have an
> IOMMU  flush not related to the to-be-freed pages, as we cannot have
> interleaved IOMMU operations on the same pCPU.

"interleaved" is perhaps the wrong word. But can you easily exclude e.g.
a put_page() in the middle of some other operation? That could in turn
invoke one of the legacy map/unmap functions (see cleanup_page_mappings()
for an example), where the flushing happens immediately after the
map/unmap.

> Also, if we strictly add the pages to the freeing list once unhooked
> from the IOMMU page tables it should be safe to flush and then free
> them, as they would be no references remaining anymore.

Only if the flush is a full-address-space one.

Jan


