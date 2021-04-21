Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469E366F0D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114836.218936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEhA-0003QO-1N; Wed, 21 Apr 2021 15:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114836.218936; Wed, 21 Apr 2021 15:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEh9-0003Py-Tz; Wed, 21 Apr 2021 15:23:15 +0000
Received: by outflank-mailman (input) for mailman id 114836;
 Wed, 21 Apr 2021 15:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48UE=JS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZEh8-0003Pt-Gb
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:23:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 411ad47e-1b28-4171-b3c6-771be957fa7f;
 Wed, 21 Apr 2021 15:23:13 +0000 (UTC)
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
X-Inumbo-ID: 411ad47e-1b28-4171-b3c6-771be957fa7f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619018593;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C0Z+6q665DSM7p7B7c7DBYWlWBKriWgml0xUqZcLMkM=;
  b=LiM2JBda6wgA+Zc2v8Zogl+wGCykWFgSmFpSX9ClSQ7uwLuo/2fAwY/M
   VXAjsHoYaZPugd3g0r96iWTv8EWj7pyvS1dEME9T5HuDRRYiWxSkTJh8y
   /F6PGVSHgg+NvFOpAIN01C6hKTS/TLChrkXyyMhzcWIImliOEbphlN/S3
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qFjFUPecEcMj/jmEThx17ss4P6SN8YocqHiq6JNEMZnc0FTpGgpT1CE8A73WOP5dqYDO7qjbEh
 wJ5FTAWUdAG26DUuZ0CdbUs+fto2fU4zX9zwbdetUfjKxKygriZPC+VJOKxXoDRY7gL/5vDsGr
 U8YnQDFOxca/D3CXLayM891iMz3v5vQFGGmdcBBOvut2pMvrMBaE13VJupcGISbOUJvYq2Md2b
 HOVfudCa7Yco1SUmTSTwGyV4nzTg6aHwfFmJwMexRK+jUMfzxNN18wHleB2Kcsun/pAIZB5OOH
 T/0=
X-SBRS: 5.2
X-MesageID: 42219466
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0H2OSK/HtzGyp941vK5uk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,240,1613451600"; 
   d="scan'208";a="42219466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOvI5ztNmGyhaDy8Xaf58IIg1WVIilh9TJcS+OHWuLnrZP3qVehI1QngDl4gVc6jWcUPOFyuT/Rm8IzCTz9Mx9ep8ViwyJOSKW/zg2PJkWrKNd/IvUEYawgWqVt6ju+atiGAdBTWW/SzKqaW8cjdQpYO88+vYRstf/XdmYLqQ1+5TRVPRPiGMkxUoyzp4yGUPWxYLbSuk1QK45CUaWa4ED8EqNqihl9YxGJFrXGSeXXSErA7+hY/8CFaw6bmtaJ5uTFIKs69Tt6JHSD/f/8ULxM0YmuJpd8/rStlCkYlI8j2CHO6NW7utHcaQs/nSZ/7cl3Qhv7MOKyTZ0gOKlDCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0Z+6q665DSM7p7B7c7DBYWlWBKriWgml0xUqZcLMkM=;
 b=KBNmHYw8tYspGRczNDqJp2oHHSFKhfqgw5rb7+njeoSwnQT8sn1x7VTOrJG78Eeml5QlvQ35Ii7WbZXvJGr2ovn+eGZm4YYnNjl6zgPSyGtl73dcoZrRl60Uyt20fRuB/kr8MDH/EJR/zPTSB3XGvJwyJFWmFFPLs6s2AkG4TKeGMAVWW553jH89qZVGhXAQ8Q4lr9qGkbfdiHaAckRf3/NI5YucuHZ97P5UfE1loimoKenC8Un7PquFFETzgoUvAi/oeKjVB6qx9V8Fs6u8lUioDk69Zpx4uJqUn7ejgwCTSMcu8eC3evVhjFKK2omOX7Gehbteuj8b6KZB5LsXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0Z+6q665DSM7p7B7c7DBYWlWBKriWgml0xUqZcLMkM=;
 b=USKld+dohkD+gqZKlBhf6Bq1cm3jAXZLfZD0kkS0Ma28nH+i5QhEdN1xcWTrkLEdXPX3Doeb9qhi2ZNdm+PhFI3+B/We3qsI0FlvLIG7VrzqmiuCeP4LxTI07Slr1x/XLVA6gDKWiqAs5Oa51RaOC+h+/0R5/De3PeU2ZKqYLms=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/8] assorted replacement of x[mz]alloc_bytes()
Message-ID: <40d373eb-d7c2-27f9-df20-a7fecbe519a5@citrix.com>
Date: Wed, 21 Apr 2021 16:23:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17040b09-c2d9-4f2b-d920-08d904d95eb3
X-MS-TrafficTypeDiagnostic: BYAPR03MB4744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB474431B7CEBFA43A21CCFEB6BA479@BYAPR03MB4744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPqxN0SWRc96fFt631N17sSjFgy0mqNcPkEUh3RAi0vgEKXFI+ust4+sTXRNqRGDf6TLPRMoO5H3q0UNg3Eoboul9WKFSyctFXpfo130et+pxAnxynriGzEiaF+TjdDmeTpiL/sBsURhIXEvw9Q7DfeodI/CiR3DKeuvjiqGDJnIazDf+FCwRjsup1ubD5cvep+8J3r8iUb30wOR1JWA0A0jGd8hB/mIE4pWPP/ReKBhbFE14S3yVKYJfKtJoR0xLjKo3psvDbqbpQGmtFlHvNXx3tXi9c/zmWriEf1HqNQrEUxb4szY+qAQUXHtNf+yfRKJUKh+KFCm0eqoXyX1knUjNkIcfqcspfWpWdE4YKTHCL43uV76rrBvsrP54sLyo9d5lpc24MsAikAHGUOSK3GT9slNUDFnYtA8GXU7cLJsmBBlwi+cfnnxenRHVoDjrNg6xDBHBzF/Hb2ppgbY6UKlYpX2ZhrgnORopUgys3y14rkKVOl/4O5kBsOgwFLFDmmdGSX9EcGw4P8iAOm1WXiwjPKUKMgcGb/AHFkfSlnXRLsI3NFAIK6TfvQDWSk64TM8p5wrQi/jD5jRKCOCbJ8po1YwnVZNbr/sDqXcIH/OLfDaBjOo403BxV98wmS/wUAxSZucVg8VAwfFXUp632lYIW/hQMiTDjnboUuw9JmYy3UfwH6aj8PFawyXirxV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(110136005)(6486002)(31696002)(5660300002)(8936002)(38100700002)(83380400001)(316002)(86362001)(36756003)(2906002)(6666004)(16576012)(956004)(54906003)(2616005)(16526019)(66946007)(53546011)(8676002)(66556008)(26005)(31686004)(66476007)(478600001)(4326008)(107886003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEVFbGdrVWlMNXRXNUhkbmE5dFdLTG5NQVVPY2YzUW5iMXVDbnZSR2hnN29w?=
 =?utf-8?B?UVpUZFNhZzB0enA2SFU0cWdzVytiYSt6UGJNL3c5eXJhQ2JWNGVJem1Tc0xh?=
 =?utf-8?B?TXRZUEZuTC8yK1NTQ0Z5d1ZadVhBNW1XVFdsTlNsdk9OUTM4TlVuYVBlUUln?=
 =?utf-8?B?SXVuVW41ME8zcGV0ajhKVzZTdVpuUnNBRldra2k3NUt6b1BJakZlLytoSjln?=
 =?utf-8?B?ZldhZXZRaUNWeVNlc2NwckxXQk95QXdtZTFQcm81QWR1K3BjYVloRG56eW82?=
 =?utf-8?B?SDdnTDdOTHNWaGhmRm5jcXlvcEY5M1l6dXdZN09yOEM0UjFsU2dzV3ZRc0hz?=
 =?utf-8?B?akxES3JNVTZpcDhCa3hnQ1EyeEVOZEpTa2lvL0ZpWDJtdW5TYUZYd0hrazRG?=
 =?utf-8?B?TURKa0RuQ3ErTVoreDN0N2NUZ21NOEdUWDlWMEkxWGZHZWUvQ0NSZ1ZJL0ow?=
 =?utf-8?B?R2kxR0dyTngySTk4N1FaRzV2QTVENjErZDNUZVh3cGVpZmxOY2ZTcUsvRXht?=
 =?utf-8?B?dGVmSENWc1B5ZGZVWmkzRFRpOTRaTDJ2OEFEaHF3N25rZC9PaW50eU95bmln?=
 =?utf-8?B?aG8yeUQ2MlExWWFPSUVTTHlmK2NBd3FYZnM1VEJnU3RQQnVDeUlJOWVYU2Nn?=
 =?utf-8?B?SVlTNGNMOGRENmM3cTQzaEhSZEQxdVB1dGVwbHU1NngwcEsvY09ZekI5aDl6?=
 =?utf-8?B?aUJXQ0FRcG0rbEgvNnlDNVdJa0VDQ2F0UmZveFZvM09VandvUVpuckIwbHNo?=
 =?utf-8?B?TkxMeUhtcitZcUJLOEd5NFExdEhtT0xQTXk3cStGMEkrbjJVZ0lwamF6bTE4?=
 =?utf-8?B?ZE5CMlhsekRMN1FJdXVtMTAwekNsMzlYZmZraGNuWUlKc0tTWTU2MTdFa3Ra?=
 =?utf-8?B?WTVUdXF6N0N6VGlHelE1KzRtL1lCelVTUWJFM2V1N1Y1MXlsZzNuRW54dVd5?=
 =?utf-8?B?U1BoWlZhS1dEc2dRQzdCend6Z1JkV0pGUEQ5U3ptOVlSQnZhTERQWkE1aDAv?=
 =?utf-8?B?QUxEZXhDWkRTc0E4OVU2TEhFZkhHYysvdXg4SDh6OGJLNXoza2RLVVJWQzZO?=
 =?utf-8?B?bStJaUk0OXV4b1FmT1VhbGpBV29OMFdPeWprNFMyNXVpZ01ydUo0eDFaTmd1?=
 =?utf-8?B?QlYrMXdERjRjQUdhSDBvTVVBZzlZTlFPZWpPbTRDOWNPMTNKT2Mrb1EwYmdl?=
 =?utf-8?B?NlFHZjhoKzN5R1lkam90Q3ZrL251bzhqUW9MKzh6blZGbVJ6eXEvUnExSnA0?=
 =?utf-8?B?ZUJzaDUrMmZFR3Q2aGVpRXRFSlZSU3RXZm9ZRGM0ZlBOQVB3M05aVlpiL2Z4?=
 =?utf-8?B?SXVucklGdGw3LzA0MCtRU3Jrak9xWUl4YTU3VjBLRGRncTZaSE85MkpSTlov?=
 =?utf-8?B?TlUyV1MwNUhSNG5Pb1VHendZcU43RExEVDNHU2pEcTFCaVd6WlRmZDFVdlRw?=
 =?utf-8?B?aFF5bk5LQjFvRFhjWTllSkV3dU45L3JEWDFaNFhTaTc2SnFsTFcvRUZsRXhV?=
 =?utf-8?B?bjIrVjBncGlmODRhUUw2azdId0Y3eE9LbDNzczVaNk5IVUM2UU1aZlh2TmEw?=
 =?utf-8?B?eVJRV2xlNjFWcE9LcHNRcG53OWhQRTM2T0dPcitHOFNWRVJleEFRUTJrQ1ds?=
 =?utf-8?B?Ynp5aCswZ2dKYXFlaUlOUXpTTWtuMWw2UGx0M1l6d01ZV2lHakVCcjZWeE9m?=
 =?utf-8?B?S3puZTNCb1R1alhNNlBjOEdIb0c1T1pYdWQweUtqc2tneW5IU0pZRS9aMjFq?=
 =?utf-8?Q?9d1st49z3UU9k553fM/IY022qv3fhSKZcPAZDIh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17040b09-c2d9-4f2b-d920-08d904d95eb3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 15:23:09.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74Trqc3QG0H5ybhnleovLUQTg/0G1GDgmq65+PcDRjQaUByH9liI4CZvcGnB3lC2xQI84ddQtQ/8rIdFyBgK9IL0MYq7URvxiP0UacBpKw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4744
X-OriginatorOrg: citrix.com

On 21/04/2021 15:54, Jan Beulich wrote:
> In the long run I think we want to do away with these type-unsafe
> interfaces, the more that they also request (typically) excess
> alignment. This series of entirely independent patches is
> eliminating the instances where it's relatively clear that they're
> not just "blob" allocations.
>
> v2 only has commit messages extended.
>
> 1: x86/MCE: avoid effectively open-coding xmalloc_array()
> 2: x86/HVM: avoid effectively open-coding xmalloc_array()
> 3: x86/oprofile: avoid effectively open-coding xmalloc_array()
> 4: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
> 5: EFI/runtime: avoid effectively open-coding xmalloc_array()
> 6: kexec: avoid effectively open-coding xzalloc_flex_struct()
> 7: video/lfb: avoid effectively open-coding xzalloc_array()
> 8: Arm/optee: don't open-code xzalloc_flex_struct()

I'm tempted to nack this, but for now will go with a firm -2 to the
whole series.

It is unreasonable, at an API level, for *lloc_bytes(...) to not be
interchangeable *alloc_array(char, ...), and the former is the clearer
way of writing code.

The alignment details are internal properties, dubious at best, and
totally unreasonable for maintainer to know or care about as far as the
API is concerned.=C2=A0 There is also no type safety to be gained by making
the transformation.

If you want to improve the alignment, fix the allocator and the
behind-the-scenes semantics.=C2=A0 Don't make every callsite more complicat=
ed
to follow, and definitely don't introduce perf problems from cacheline
sharing in the name of typesafey.

~Andrew


