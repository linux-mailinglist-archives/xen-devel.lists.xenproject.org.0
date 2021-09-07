Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A784024D8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180552.327261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNW5H-000848-39; Tue, 07 Sep 2021 08:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180552.327261; Tue, 07 Sep 2021 08:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNW5G-000817-W2; Tue, 07 Sep 2021 08:03:58 +0000
Received: by outflank-mailman (input) for mailman id 180552;
 Tue, 07 Sep 2021 08:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNW5G-000811-4P
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:03:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecd9df2c-25d5-407c-a70e-980aed8a372c;
 Tue, 07 Sep 2021 08:03:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-s4LotqQnP-2KPd2_f5FqLQ-1; Tue, 07 Sep 2021 10:03:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 08:03:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 08:03:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Tue, 7 Sep 2021 08:03:52 +0000
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
X-Inumbo-ID: ecd9df2c-25d5-407c-a70e-980aed8a372c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631001836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5EGaKlsiNTjnRo/nw/nllmUB/AG6tuR/OJmZarPtZ8=;
	b=Ut+xOJaWeQ6Gy92qgJ/Agv2UB4D4XHi7I7fPmac4sdf/j15duaVnNDC0qnMYIfHpdLEN5J
	ViuLCTUJiiCKceyJKVA5isSr3wWWgxsUEXbYSmIzPHYrejvVDg4PSD3wGMfpqNWNzXwJpU
	Rzz9LKbVJZECgHltKo6ExgiubVn+Hkk=
X-MC-Unique: s4LotqQnP-2KPd2_f5FqLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3AmYJCtUZXOyyhLbTMQcllVPOL+RGMhLZqx8fi+HiIbQ7hszKWMV822/82ivYBTynjVI24R7QhNt3cJy/4dnxkapIEPRyzyQgUxpuVJLbcepjBynz3nGbLV8LaYw8XMnRvE7dVkxQ1ymZZ/j10UMQDa3HM6nvVzrawuxhhVcCABZ6Gb6/2VcCIwvM7WQZqGz5WQ6CfXPOc9izHIJ8M1N1oDI0cB1PZZ9k3hECDKP9ibOglpE/m/fxm9vvFdtiCB+EDF5pmjSxzYOXPPR5O32PKJg8AKN1vQ/HmVK0zmwpRDDcNkbOxWkwK4gqkAgjSS5PjKAUsFH3ijAHqrF6O2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=A5EGaKlsiNTjnRo/nw/nllmUB/AG6tuR/OJmZarPtZ8=;
 b=djq5Vmyc4BHPYuA68x5tizrkd6sAmZL1lZURsRrI7kXeP30BnpU0q6wDLkv47dxMYrVhD10sf4i/UKj7nP52RSnFED+ZiDbyoiYg/wSdkb4yb5hykgVpeZqwzkEdU6wiDu6aqlxarvw1M6Be0kB/0/bVSM3PkO2RFqoETED/O9B82yIHwjgns7WS3PehcIqURdIRo2vrcoUCc0k/+RpVWT4AYVel/TJ5EM0Mugl8Ua3Pg09zYgmFU9WkzlEZuiaB3RsAI60eF36Q1DXfGLju3BvrXLoiUwYdOOiiQuvAZR16jPRxcSaEd42wvndtru/2qYtS6REkfwxdtA8+N3S9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
Date: Tue, 7 Sep 2021 10:03:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8977a94f-4175-4f22-c12c-08d971d60880
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301DBA0CF18E6FACC64FAB7B3D39@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	POxqRJaYlTUXSV0JGrUwU3LlydJJ+rNpo5ScsLwUJpqfacPlUPYMapOLkNZXpwlcwnVZNTxMtJhse69k38FGoZsS/5ZFHW+xm3CIldKz0m+tlXIRvMT8ParDN5WVoox5NC8KBa3G7qnnN+iyl2PypzCsBYkI2snlmBsnlOW7d57mbt4mimwGpwREY0cs0hxQsdbGhXO5CRifmpFCvm+Eo+AdYuTdwInDfA+JfJlUUEHaEZ0BMUbWaS/kbDHc1GnX9bGxth3y+GjeyoVN/afmQsYmn20J+JENsTmws+JUMSHzLPMzyGG1RHZwn81JdCvGpzbxfY06gD4KnSVWHtD8YgD2D4dmZaY61AHlTl9+n5dBV5xcwNcH1mGlp8Wx7+qh8CEvcBrpWmOfKmU2fTtIvaeeYTLXGdayxNDkT0ztLxoTjvDla+yh/TE1SW8QuguIKDL3T7XYxs5ztuxBI8LPCnsEFBIEHT9ZT06VpvIUH1aHKctSOQUZGVpcX3EjNHyy/iUX3xOeLHGEpZKQh7FcdfU+qtSNpAS8crdHHWX3H6yhJXm8alNoHh5oDcCw29PGogztS+hZpX7boDGHcBXg0nXJt2FWF6W5u6cO6+4N6W/D1L8fmurbyQHVS7A0YSvhd35iDalq+gBbK/auOJsarKcFpWvZ+vF4FpuXgjO8/+WeDS2zqLeKHGC+ydE4iUR0Y8/MRVEfkZ/ZrMirqWzsh8eXQqA/ZAmV52xu3t1bxCZTa/hFebPU9NCzLFl2yXJ3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(346002)(396003)(39860400002)(31696002)(86362001)(186003)(2906002)(26005)(8936002)(8676002)(4326008)(53546011)(316002)(956004)(38100700002)(2616005)(16576012)(3480700007)(83380400001)(6486002)(66946007)(66476007)(66556008)(36756003)(5660300002)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enREKzFIK3BFKzl3ckluRXM5T2hVNnhpaG1nSGxwZFlQUkh1Z0JMZXA1K3BJ?=
 =?utf-8?B?eTZXemw3NGxsSUd2MlpOdDEreDBtTGRoOFk3eG9qaGR6Vy9EbkxqWVYzaFkx?=
 =?utf-8?B?UE40bHNUQTJqNStGUkliZERVNm9tT01oY01kakZxYThEYUJVclk4WmJVekU1?=
 =?utf-8?B?TmdCL1VlMmJrZG9CY1hUS2drRnhFNzBaNzBkTjd0SVJyK25PenVWV1U0ZnIv?=
 =?utf-8?B?cHNCckJldklrUXFYemVNNTBhMUtwaWxvZWxZREtXUkU2ZHMwNVdrWG1ac25j?=
 =?utf-8?B?LzNYR3EzRHhKL1BQSS9JK2NRRjZHTkxseTNZQzBRSWcxL2xUdGljTXM3NnA0?=
 =?utf-8?B?WWlPaDJyM3lPT1luUjBnRk02MmxmVWhBNSt2cDVMUE9PeExQTVhPWVEyKzQ5?=
 =?utf-8?B?REFGL1FNeWVEMnJiMTFWVTNxWExtRXhKVzVZV3RCTklvRGVxMVVDNGFaTzc5?=
 =?utf-8?B?Zlk5Umk1YjF3OVhaK0dvSHYyL2taVFVQRUhYWDhIVHdmVFlQbmtrTEpqWXNt?=
 =?utf-8?B?L05ET1lzSkxyQ1RTOHo0U0IrcjNQbm5uWDNOTzRnWklqd0dKWHhrRjBQY2FS?=
 =?utf-8?B?czN1WkRiWm1hWXdBSzY2ekZHQkplU0hMczV3RHpKUkQ1Z2R1Z0RSOE9Dekd6?=
 =?utf-8?B?UFZEN2pKMjBQazVDTmtmandtTUhZejNFZTE4aUhMZzlNS3QwMElvY0RjTjBQ?=
 =?utf-8?B?M2JnRU91TXBHSktTS2NhcTd1RFFzR01BSEd5UWdCY3Y4WjdUOHl0dFB4bThS?=
 =?utf-8?B?bmNtUjN2TmpKSHRVN1NwR1JZODhhSzFlSmNGYno1aEk3Vitid1Rla25LbjQ0?=
 =?utf-8?B?SjV2N2xKS0xPTXR1YStReW1XKzYxR0ptZHU5cXFJUzRWcHYva2t2dTNWa1F1?=
 =?utf-8?B?RjZwYkxmNmlFb1pHeWFCTlZCZzdsSElJOTBxV0VnWVVSM3JvQytTMmpydDVE?=
 =?utf-8?B?WmNIdjI3bmtxWW5xOXljK3p6VG9zTEF2ajNrdExFenpIQWNDZStHT1NIWjFz?=
 =?utf-8?B?RDFCb3NjSHBURjdJNk5HbzR6VmxOMElKd3F4QjVVS2s4YjNnTGVFSERrRGFQ?=
 =?utf-8?B?R3VWUDNEbnc1RVBQZ2xaVE9vYjk4OEtNNGdaSzZWb3lWRm9qeFBHeCtKQkFv?=
 =?utf-8?B?MnhpZkdoQ0ZIQ0xSdU0rNEhlUEROdEpLRHVvU3hHVFVqTGZ6T1VpeHk1OXRk?=
 =?utf-8?B?MHhUVkxLOHRobnUwcWdwUlpaOUhOUHFsN0dwS1pyWnpqZDNHMnpBUGd2MkZy?=
 =?utf-8?B?STRCWmJyR25CZ0lmMTlZWGhnQmcxR2YycFM5VGNvWFFhVGc4Q2w1UWZ6OVhu?=
 =?utf-8?B?WCtTVW51YWd5REdWblNFUTA0RDdrT3pTVmRxUzdiYlg3WkJOTjhpeFpKc3hW?=
 =?utf-8?B?dUNrV0ZJZHoweWxyZk4zSEEzcnlyTGV2R3hRdm5ib0FxdC9wUGxNbHhRYzFj?=
 =?utf-8?B?WjZWUmdYRXRDVlJKcGtoUS92c0JScFhFVUpyK2lVVDZ5OHZOQ1JpL1laY0xP?=
 =?utf-8?B?aS93SVJydldwRHQwN1ZveisvcDBKL1dlTWJua1NtWVEzNTVlbHFidmlLZ09X?=
 =?utf-8?B?dTBkVk5oeWV2bENPV253WTBFNDJLN3hEUlRDY1pwODdjOEVUeVhEUGRYSUVv?=
 =?utf-8?B?UG1xUzlsVlNhQUxiT0xpemlxR0RjaE1wSzNNUVQ4YU1VY0ZNd0U3OGVpNkNW?=
 =?utf-8?B?MTVFSkM4MHFRRnduTHJkUDBJV1AyUE1LQjJqdUhlRXY5YWppU1RGOERBdW1p?=
 =?utf-8?Q?mhFC+fbTYs4nEm/YvK1xiuMntWC7eVoAt80CWua?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8977a94f-4175-4f22-c12c-08d971d60880
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:03:53.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hu1TXXxQgUX4yQAGIMWGiU4KgfBJPrRgpDHHA/N4HonWQ+5VX3Qc76VmIPJM98sFlCaOG+piGbGNKzSKuFvDOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 06.09.2021 22:47, Elliott Mitchell wrote:
> On Mon, Sep 06, 2021 at 09:52:17AM +0200, Jan Beulich wrote:
>> On 06.09.2021 00:10, Elliott Mitchell wrote:
>>> I brought this up a while back, but it still appears to be present and
>>> the latest observations appear rather serious.
>>>
>>> I'm unsure of the entire set of conditions for reproduction.
>>>
>>> Domain 0 on this machine is PV (I think the BIOS enables the IOMMU, but
>>> this is an older AMD IOMMU).
>>>
>>> This has been confirmed with Xen 4.11 and Xen 4.14.  This includes
>>> Debian's patches, but those are mostly backports or environment
>>> adjustments.
>>>
>>> Domain 0 is presently using a 4.19 kernel.
>>>
>>> The trigger is creating a HVM or PVH domain where memory does not equal
>>> maxmem.
>>
>> I take it you refer to "[PATCH] x86/pod: Do not fragment PoD memory
>> allocations" submitted very early this year? There you said the issue
>> was with a guest's maxmem exceeding host memory size. Here you seem to
>> be talking of PoD in its normal form of use. Personally I uses this
>> all the time (unless enabling PCI pass-through for a guest, for being
>> incompatible). I've not observed any badness as severe as you've
>> described.
> 
> I've got very little idea what is occurring as I'm expecting to be doing
> ARM debugging, not x86 debugging.
> 
> I was starting to wonder whether this was widespread or not.  As such I
> was reporting the factors which might be different in my environment.
> 
> The one which sticks out is the computer has an older AMD processor (you
> a 100% Intel shop?).

No, AMD is as relevant to us as is Intel.

>  The processor has the AMD NPT feature, but a very
> early/limited IOMMU (according to Linux "AMD IOMMUv2 functionality not
> available").
> 
> Xen 4.14 refused to load the Domain 0 kernel as PVH (not enough of an
> IOMMU).

That sounds odd at the first glance - PVH simply requires that there be
an (enabled) IOMMU. Hence the only thing I could imagine is that Xen
doesn't enable the IOMMU in the first place for some reason.

Jan


