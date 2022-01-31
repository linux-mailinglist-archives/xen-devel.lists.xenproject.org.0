Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7174A3FD8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262897.455345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETYL-0001hH-Pc; Mon, 31 Jan 2022 10:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262897.455345; Mon, 31 Jan 2022 10:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETYL-0001fE-LQ; Mon, 31 Jan 2022 10:04:53 +0000
Received: by outflank-mailman (input) for mailman id 262897;
 Mon, 31 Jan 2022 10:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nETYK-0001f8-0Q
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:04:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9bee0f-827d-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 11:04:51 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-UXUI84-WNIilPhF9Uu1izw-2; Mon, 31 Jan 2022 11:04:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2537.eurprd04.prod.outlook.com (2603:10a6:3:83::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:04:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:04:47 +0000
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
X-Inumbo-ID: 3a9bee0f-827d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643623490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5JlUXmcB7MPs+D0hZ8LhjxoVuh7H9eAtsRXrzfMMzI=;
	b=diA+4n0kAEioKAwNHr4QY5nPhUklcnQ1omn6WBbgb1wryhevA+aN2b/DiS3VVLl3HBFIJ2
	gLqQbsMf1+lmOavlAWAjXIxfwnfq/942hMkgMKzVbA5cOcS2YCSEyNW0nG1c9zrS3e/cx7
	cUSTIaNM9+u332ANcOHI7eZGhvqVUAA=
X-MC-Unique: UXUI84-WNIilPhF9Uu1izw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsT/UPaGOV2cU94fs/Znpb7ITsYn/Nf3DbhI1jkRQsA9CUAs7NeS0zCR6qsmNJvsK+ejILXYe4IKmLAZ2o00u9u58ZPcMcvtw/Zn575c8k65RvfSwwN6fdEIwP1qPJwjK5Rec0LYHk5yhxDAIplwwNPnuZVotiQxnRwR3gRwISr+SATJZhAIEA5C5I7abxzHoXaZPfko6VSgZvOggwsdHJrXKUp8W226Bbvmj7hSuV7p9NWYJajTc6TBU/q9yL8umItSaIN9VShPSGtOOoxzHvAJLRmsG5Y+tvJQZd4j8Tb/76ynPojakdphQ7Du088gRdU3Q0ykvReUFcOug1uW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5JlUXmcB7MPs+D0hZ8LhjxoVuh7H9eAtsRXrzfMMzI=;
 b=Le5E0bQ3nrFUZXl7XWRf//RqK+uPKAQp+dU5rJBHoy3yopjXs5NWDk5to59cxylwICFPtU2oWwjMfLTfk4ej+uOLpSObX5GydJcmvX8Kyx/0gGzRNewg+vrlhdwH6e/3D2W1hJmSof8EFLWXWCpZJrHSviWuMr8M5ifK92B3N9WTauwg1+9GNKrVFRDS2hhxfsAb2YUG5YlkzhBMwkCazuTKLSDQ2IeNB6L7d7TDG2kUNtwauHl1BG6c7qG9kldox1Y53tNbr2PsjlL1b0TAeAmXWmqbdJ+VZNpQTmZnpLtm9G9iJjOSNEt+uRAmqFzMAwRHO74mDWWbtXGDdsH7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3411bfd0-0e25-6e6d-9210-5f366e347702@suse.com>
Date: Mon, 31 Jan 2022 11:04:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 02/23] VT-d: have callers specify the target level for
 page table walks
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>, =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <5bfc3618-12ff-f673-e880-6ea13bcf8fa3@suse.com>
 <BN9PR11MB52768DA38F476850467574438C249@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB52768DA38F476850467574438C249@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91db5135-63d5-4591-ebfe-08d9e4a11cf2
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2537:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB25373E210A94039A471354F7B3259@HE1PR0401MB2537.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jIbt7zWNhooFHLx6/94F1DiVQsfinQschZRAU/kIufqUGMo7YnOPu010dhlS94kn03Bkh7Qr7zHUjtOBikF+WqDr6ZpuPD9p7y+2oZ077jbYKOJvbO2q74KttiWS94TzEMm7BU1/z1WCQrDEGmms0Aq7vdl7E+H3ifz9gER8an+pS+cBmxMlLutHJZ7LY8iF++ek/YnaeZNYrAgpbdAfxQuQQi90ajkVKCE8i4hahoL6yugmXlzOCZ9kZXjfllC2ZTHnTIXMxYNs2jctOZgiUOndoeZTmACL2Ou4EWJrOb35VB8Wb9stN+sMdPSCgVDff1llrdrNuOEHpO91Xtu9En8hhKTLzBX38T8+zvA2en8wXK2eNBlkOvuxoqECRwI2hljmQHmD4PrHiueTsoMbAUnQJYGYiSvGTQoRmgb1TSOQKTxCHSGR7OjqMWE2Z2m1aLzIH3/OxQI6umcvHpWiqAhM50g0V7QODlHlfQpyS2GkYo146iDfib54keuH9K7/ahFnb+UuyWt+TsoPf7nQruTUE8C0TXxVYDlU6NG9PSY6zqpriqUvqrtNxd3fIr+aQQFtYqVRdiSiQnW4z8z6br4a7vGcephtrietVTmZ1z16KURbU0PBwLIp5PD6h3j3lq87V2dxTrrR0mlLdOWziJiSjf4jz2dZJ/P64tiwcLCWXEyFlQIC++WA6ZhCNo3+hjCcp8iJpfUPAH6tI+QTetPher+on1vu4npjqaYafyL7Fm7iWou5T77ebmXums9G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(6486002)(31686004)(38100700002)(508600001)(6512007)(316002)(36756003)(86362001)(31696002)(4326008)(66556008)(66476007)(66946007)(5660300002)(186003)(83380400001)(8676002)(6506007)(53546011)(2616005)(2906002)(26005)(8936002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3NUMlRnZkNQM3ZpR1ZrUS84WU5RRjh5UEE5akJOank0RXEyaGtCSGtmekNn?=
 =?utf-8?B?MFp0UE1jNHNrVXVQQlJrL3R5cEdKdE1FMDFibm9wME1EbldNNDNMUENGbHlm?=
 =?utf-8?B?K0lCL2thK0RybGdvL0dKak1xZU00elIzMFE5ejBNQWt6cUpPUldPZm9JWVJW?=
 =?utf-8?B?NG5VcW92SzJsTUFCOU9MRHNvWXJaWnQ5WGFabW80RnZWZEl6TVJsZUdlZ3Nt?=
 =?utf-8?B?TWxwblhId3MrWmU5RmJOY2FBNDQxVGkyWFp5cE9ySGM2d0RFajlkZHJpaU93?=
 =?utf-8?B?VHN1ZzF3M0VldnJwb1QxZWZEYnpuaHJ0MVVVc2d3MmxnWTU0dDVoRmVMaVNJ?=
 =?utf-8?B?R1lSRVJVTnppK1N1RUl4TERaZE1Ta01PNml1aDcycWQvYjZGZ1NEaTdnc3JI?=
 =?utf-8?B?K3EydzhXTm82LzMxczBNQ055b1p6N1NyRUQ0MXc1ODhNM2xFdGFlWm5CTXpD?=
 =?utf-8?B?NHh5akRhUk8rdENkcGkwblFkNm1jcGE0d1h6MTY0cWhqZ1ppS05uVCtJelJq?=
 =?utf-8?B?ait1WVRLYU1VMmIxVi93S2tuZ09zbHN5WkkvNzhnc01YZXpGZWw4VlFBOEdB?=
 =?utf-8?B?VTRQNHV6SEdManVBdGhteThrTTA4L2lkUTBIU3ZCZk90aUhSUFc4YWtSeWI0?=
 =?utf-8?B?NlhMN1ZzUHhzWkF6VnFLeFZBYWZqQmpXem0xRDU4WEZWSHkxU2xRQ2hCdmJr?=
 =?utf-8?B?OS9CdjlPdmlJYlpUYXR4TXZvTHcrTHpWelVFNEhzVjE4a3BXSlhJMFZTWnJw?=
 =?utf-8?B?WTkvUXJTMmtsTTJNcEVFUEpSTFBYWUR3VDhnbHN2UVMwZGZjUGxBWUR4RWJE?=
 =?utf-8?B?VVNBUkZ1S25ONW83M3hMcE11RHNiZHhjblBnYjY2ZHpmYkFzb3pNL2NQZWkz?=
 =?utf-8?B?ck4vOWVEMU14bEVRWldqMU1mbDJ3bEdjdDgvd0Q1WWc5Z0JyZzlkZ2NGdTZJ?=
 =?utf-8?B?RHhrckhjMVJEMk5BZ0hNS0dtSjlkUllpL21sQjdWRVBCWHU5dGhRanJpNGRs?=
 =?utf-8?B?Z053eWh1KzFVNmJnbHk3dStHb21aSDQ0YzREcVgzQlI2cURpd2ZUR3JIVk1U?=
 =?utf-8?B?M1NPWWcxNWYrWXJtTW16aTFBUWFzNzRESXRxSEg0NW41NDZyZGF5Tmw0bThv?=
 =?utf-8?B?VWUxUnF3OEJjR3ZTYkozZHJqWHR6OVRuNXphd2s2SmNlV1NPQVQ2USt0UVZW?=
 =?utf-8?B?enlVVDkxM2IvWiswelNpVnpNZEFRamVqREMxZmxIZFhqemIyVk9pYk1CRkU1?=
 =?utf-8?B?WmNGcDYwL3F5VEtMaTZwT0J5akZLUXVWSE9OSVNqTG9qTzdTWHVMb0luVVMz?=
 =?utf-8?B?TVdBTUJoQlZuOFVncUNFZlFMeU1wc3NuK25OeDZ2bnhSdXluTUIxREpIb0Zv?=
 =?utf-8?B?MVh4dmxId2drWVgzZjlmaW16V3A3ZGpoaHcxOVpNd1VZMS96N1ZJK2d5blpJ?=
 =?utf-8?B?d3JVRWcvdEtmWWRuYjFGSmZabm1LMm04c3hDR0wxejR6VVMyeGZXZm1rR0NF?=
 =?utf-8?B?VlBJOXloL1lGRnlvbGd3dXA5RVZaUldyd1g2QkVvZVRBbnd2emg0OHgwendW?=
 =?utf-8?B?QlVWWE90dExXQk5TbE9ERVJIWTE1bG1IT3gxeEo3SjhlY0xKd1FLbVU2eHpK?=
 =?utf-8?B?MTBMangrYnB1QjhsMFFjTG5GRW4xaGZlYU9kTHB2NHhBU1NocVlkK3ZPN1Vv?=
 =?utf-8?B?cHVCdkFlRWx1NW44RVpzSkE2U0l6MlRYOSs0akw1NTlNUU1oc1UzWnRnTjdN?=
 =?utf-8?B?N2NnVHJZSDRJWTRPOUI0NVRLRmMrMTRWU2JnWnp3RWhYVWZ5TldDdUxGZ0NB?=
 =?utf-8?B?RFY3ZWFVdGtiaXZVbCt4ZytnR3VUeVZrWU55S2t1YzU3andRZ1dnWVRlM00r?=
 =?utf-8?B?QmZBQXBFaUtaTERDSFRGN0phMFhaaUhpNU5ObWJNenlwdjZZcWU2bUY0dkVZ?=
 =?utf-8?B?V210WGJWYkhCTCtyeU42MVA5VWEzTXgzQWlMcHN3VCt2Z0xiSEFFYWZ1L3lj?=
 =?utf-8?B?enlTZjJlYlZ5OEZseW9YcXUwZlBuUUVzR0xQQlVtOFBFeE8zdHA2bXZJVm9E?=
 =?utf-8?B?N3BHN1lWaVJ5T1paUVMwZ1ovREdydjEyZ095SXc3dDdTdnpma1pTb3F2UVh3?=
 =?utf-8?B?aDY4WEViZmZkeFZ1S0lkRzduUk52bEJLbitXazhZdmk3My81R3hwZmxQeVAv?=
 =?utf-8?Q?MGe2q1xX00OB7l94Q90r69o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91db5135-63d5-4591-ebfe-08d9e4a11cf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:04:47.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkZjF/mHOACL0UrVHuqEZwJtcHzOPrtZ1KM2m1VYxpsKoVGvSaYk0OtgT8ATFxF1Un1OAtb3qFLuaYPsCuCZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2537

On 30.01.2022 04:17, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, January 11, 2022 12:23 AM
>>
>> In order to be able to insert/remove super-pages we need to allow
>> callers of the walking function to specify at which point to stop the
>> walk.
>>
>> For intel_iommu_lookup_page() integrate the last level access into
>> the main walking function.
>>
>> dma_pte_clear_one() gets only partly adjusted for now: Error handling
>> and order parameter get put in place, but the order parameter remains
>> ignored (just like intel_iommu_map_page()'s order part of the flags).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was actually wondering whether it wouldn't make sense to integrate
>> dma_pte_clear_one() into its only caller intel_iommu_unmap_page(), for
>> better symmetry with intel_iommu_map_page().
> 
> I think it's the right thing to do. It was there due to multiple callers
> when firstly introduced. But now given only one caller mering it
> with the caller to be symmetry makes sense.

I guess I'll make this a separate change towards the end of this series
now, to save me from some rebasing of other patches.

> with or without that change (given it's simple):
> 
> 	Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks.

Jan


