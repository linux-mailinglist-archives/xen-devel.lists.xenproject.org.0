Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BC498596
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 18:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259936.448754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2ga-0007zs-TX; Mon, 24 Jan 2022 16:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259936.448754; Mon, 24 Jan 2022 16:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2ga-0007xQ-QB; Mon, 24 Jan 2022 16:59:20 +0000
Received: by outflank-mailman (input) for mailman id 259936;
 Mon, 24 Jan 2022 16:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC2gZ-0007xK-8F
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:59:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f70a09d9-7d36-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 17:59:17 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-45wiu5PmMYKJ8PLgxDdMdg-1; Mon, 24 Jan 2022 17:59:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3294.eurprd04.prod.outlook.com (2603:10a6:802:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 16:59:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 16:59:13 +0000
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
X-Inumbo-ID: f70a09d9-7d36-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643043556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzZ8mjlOIwf2cNrcjrv/9Do3m54VXE2nx+kyuWI2BiU=;
	b=j6HKwyF86hWvvxjZ+76Q7fAdo344uAiDKTRqhYjoIYnqnSSO2CnmN0ei2cro3N+hGPkHVJ
	XajNCgQxQVJK4I6Lf2uDDx+Tapr9chZV/OGkTenBQmFGp+KLQBWwUvoC6VEf3jidHyA68P
	BPBJLTJtoOV/5EqEG3fyIeKwc7EBbtI=
X-MC-Unique: 45wiu5PmMYKJ8PLgxDdMdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5AWRwAb5SuSxtzTGMPPhqtVsibAx2UXRhuEda1e3OA/Vvb7EU93336SArrbLlAm0iDZA87hR36wu2dBHC/t56XOuOnBU8Smj7ZIkeuxniuSl2+JVFdi/RD4b1n+FNfO6g02mbdvCvPlNl3NUjxCsP5zbwJIwAFz/RAtilbALnmwDdtFp0R1w0e3jtJLXIt6QgPznV4JxhRGesMgNKQ6VWOvBrHF1qjOWcyBxjZ0Gf7h5Yns/rwjswB8EmxlkoQOuZCP+ibAW8DX+rw+2bs8bxPESnQLT8lorzTcSqI8bpb/ifPKZ86riQTrR/5GRUzEsE5YCHCS5P/WqFuCbGZ8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzZ8mjlOIwf2cNrcjrv/9Do3m54VXE2nx+kyuWI2BiU=;
 b=NrLhE4fonTYjjNLmGHYc5iATIsOGxsV/5rxd20JqfcE0/hIU7Sy8hHk6XTCf9qGbRNUqk3Ebdt5O6zGNdH/9BuXKk/uIDyv3f5qzzImwZadxQRalk1m6h0bvrKykUXUCX8psVQPUNeaXF2c2zhkVX1UYCVR4R44uf/5Ent8nlheGOz3+2ry9OCk/4iQSH4Xn9mH++eRltwl8gNaMv9vJrhvhvjXMpl/U/ohANW9EgA0DsERY6gU+BRGygBqZcOGuidwq9nV0xnAF5L0JU/bBro8Apb5ymRKPTAKuu9jya/6p5rERFs6DE7T31ylNzLP7vbBvG98Ak+brxTdpkO1gIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
Date: Mon, 24 Jan 2022 17:59:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-13-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-13-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0395.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbd1ecfc-4b9e-494f-769b-08d9df5ad928
X-MS-TrafficTypeDiagnostic: VI1PR04MB3294:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329472944EFA5492A08B274AB35E9@VI1PR04MB3294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	skzM0eEtA0ddMh71f0939OgvZ/HSdBiBszAJ/h6Hw14g9AnEWYHoH0++EbZX471w+0zQY0NGsAlH3uIJ1OZZPQV9lx9zYAQDVXOcG1f4bsqRdf5EpXdGTTDt/G4P4qr6QVe3CA7udXXJm046t7jPPjejWIpUBNJEd89FT5Cvfp5FFtX5p6HJV4vq1LlW4xmYzGe5FxZzIQynA+oHQiQjQD/QYWtvQEbTFOxT+tFszP2o78BeQa/Z13GXFVETGFiLTFXv4mkdTssQ8CfbHmkwDKyPKB+85cjMkK0h9YEbB/VuO1KhmgRMhkaZ+kAEIe5ijtvndFXXuY8YERn8LqFwnbPhIVzTRzlPv56ce/aCgPDnr560e7uDx7+avd4gOWXXkzOnfUKOYKscZ2nq2K1iBbeG6HcdWLsDDfhJgKYM07PoqLfJSvnTa+OPS9O7YUw5cvtk2qubiG/SwITaI712dgU1hB6CKKv/b/zZtHsFEAvJmyPT1F/WgBN2j0GS2enkkSF2iOxNNrMLesfNwcRFFI6XKQLxVI+25diK4W5BHXOJskr+RXrz3Zd/BNB5IV+RplRqNNli6MCQ7xh1at9HrpuBVbVAbzZONm+9cuhGNc0VlNFTZNSOueJNITqselihODOilI50rb95BNrRqpcOene22sjgNyVslaFjOvlFoOtw4mCpesi4boWlXt3eFXm8G3C1AKwcQzrSL0ajMDXM0P+/Ou5tVFtMKFyxFHWCG50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(36756003)(6506007)(66946007)(31686004)(6916009)(6486002)(31696002)(66556008)(53546011)(508600001)(66476007)(6512007)(316002)(2906002)(8936002)(86362001)(4326008)(186003)(26005)(2616005)(5660300002)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG00N3pMRkIzclJaVWduV3MxaUJGUDdPcXNpNW0vNEZaRTF1Z0tNcVl4ZE1Q?=
 =?utf-8?B?STlaNFlzNVVJSDVXN2pQR3pOUVA5Umg3SHlLY1JwR2NUZXRBaThNaEdwZ3Fx?=
 =?utf-8?B?V3VZNnBabnR5RDlETUlQVElXU0t6Y01GeGhWRWE3Zlg2aEIzOFFhU3pBbnVZ?=
 =?utf-8?B?QXFHMStUZUZVUXVuTzRxREhLT3BxNXgrT00rM3U3QzBTM0JLVUlOMG5QN0tQ?=
 =?utf-8?B?TUVoSHJ1Zkk2L1RyNWZmdktqUHFPKys5MzFqQkdDZFMrL3l5ZUF2bnUzd20z?=
 =?utf-8?B?R25LYjZEVXhiV0N3VlpiZVFNL3BySWc1YjdZdnBmK1poM3h1Ylc2YnlMTFZT?=
 =?utf-8?B?VUI1WVdpcmRUT3lZSld5VXQ3aUs4NDJqMDJyY0l4RFpTc2poVDZZWUV4bjZu?=
 =?utf-8?B?aTNPRVVMWjYvaXVBenUxSzk5L2tjck1pN1VORkt0MDF3MnFVeFJaNWxRa0tk?=
 =?utf-8?B?alcrbjhPUUU0ZUpZcTZ5dkpuRk1JdW1qTFdDMzVONnE4WDdWTnJjdkVHblhV?=
 =?utf-8?B?K1VWQUY1Y2gvbG5mVVlXQnY3WVdtMitZOCtJVzZpTjRZVGV1aDFneSs2bm9M?=
 =?utf-8?B?TWp4R0xBaFhHcnBKZGdaZnM2aGFydDRnWU9LOUZncEFxZzR1WjdTREl3Z0hI?=
 =?utf-8?B?RC95VU5wLzF0YlRrS09rNWw4aHFHZ2FBUDhlMWFaU2p4K2xGdjZyMlFOYUlV?=
 =?utf-8?B?ZUJPc1duYkN4V2NncmFHcTJRdTcwMnFDME9GK1NsRmlPMXYvR3RxcTl1d0Zw?=
 =?utf-8?B?TndoVnhoK1hQWXhEOU9ybE81bUlQalN2WS9wMVgzQVllV3FIWkRsRGhXRTVI?=
 =?utf-8?B?VFgrYzJrd2o5RVZxMUtDeUlmb1ZMQ3F4bVAwTlZSSlgvWWlteHJyVXFkK1E4?=
 =?utf-8?B?bVVWQnhCWUVSTW9UYmZxY0xXQ0VubHZyKzA4UjM3dWFiVE9oYWNJRmt6S0xE?=
 =?utf-8?B?REY4djAxcjNaV3d6bjRUYkh5NmZDRFNsSkEzMHoxZk9zczg1aXJLQ3RZODVh?=
 =?utf-8?B?L2tDYUJJYlYrMkkwNWd0ekEzOW1PWEdzVlFTSlF1bDBDcHBMdU1kZG1mL0Vp?=
 =?utf-8?B?MC9wU1l3YnEyTzdlOGo4REtLaHFxOGhiVHN3Uk5ndkY4eFltOW9GK2NMWHRF?=
 =?utf-8?B?RVY0bjRncG9aN2tORDd1UTNSTXI5L1YwaXVWdjFyM0xUbXdyZ2xYNTh4cmFP?=
 =?utf-8?B?Qm9PVk5WN1RzdnY2Z3RsSGJvTDluazM2N0V2bUxRZzl3eGNDSkY3SDZDd0pL?=
 =?utf-8?B?am5KMlljSmVRNmpHRFkwVWFRRHVRZ01ZaUs0R01nZk91bVRBSnFWNk9KVE9Q?=
 =?utf-8?B?aVhvY09QbFZDemJtNkpYQVhaV3NtU0pNVkk2VG9hK2ZsVzFqdGRDRHFtVWtv?=
 =?utf-8?B?RnAyd1VxanJIRC9JS2dzb2xIVUtFK1YzWitUb0NkVW1zN0FwL0U3aFZnckp3?=
 =?utf-8?B?dkxzcHEzbW5PTWRUSHlmN01NRTMyeVJwUXFFaU4yQUtGbkIyRDloOHAyUkNM?=
 =?utf-8?B?bjVBRFlBRXpuV2V6TjlvdWlnckpwNXBjNDE3bjVMejFSU25yQlRwbWxVc3oy?=
 =?utf-8?B?Z1hNT3ZHQkFwekNuK0RnaVpRd2kvVVZUNXN5RENWVmZiRURGQTVhWU1xenN1?=
 =?utf-8?B?c0praEkyOG5jVXhkNS9iOVZDdnJUS3Y4czRFcmJBQWwrUDF3clJuUXJ3M2dK?=
 =?utf-8?B?WmtzZlVXNlNNUGVuVU9GK2VrT0psblpjMC9mM2xyVmpCOGEySmh2QUFNNTZq?=
 =?utf-8?B?Yms5YjhTTWJuVXhwblp0aytxSzVIRWFFQUV1ejRqMTc2SnRsUkdBblMrRGx6?=
 =?utf-8?B?bmVLTS9WQWxXN28zckQzUTZOSHdXdkxGRkZxOGtZMHNIeWhVeGpjb1VmbmtX?=
 =?utf-8?B?c0R3RFRueXVUUmpBbkRmaC84bEFiVSs0TG1KWXV0TTlLQXUvQ2tqQk00aE41?=
 =?utf-8?B?RjR4U0psb21uV0tPSlc1QWhxWGluSVc1UGZ4alUrUUc5YWVpVTVnbXU4UU8w?=
 =?utf-8?B?ZnVSQ2Z5QWVYU0JxWDF3MW5RTFpnREVGL0JROTRYSDhiSHJ5VVpOZHdVdUI0?=
 =?utf-8?B?Yk84WVdaUnhEUC94bm4zNGFNYjBwVlg2VS9QVE44eFhZWms1VmMyZVpvSmpJ?=
 =?utf-8?B?WXA0Z3dIL0pRajV6L2NZd2ZHbC9hc2ora1RIM0YxbXN5T0JSb2t3c0xwV25S?=
 =?utf-8?Q?FWMxt1Jk7dmXAcsssfFxFM0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd1ecfc-4b9e-494f-769b-08d9df5ad928
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:59:13.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqiTx7Q6P0nG7Y5BOHj5rqbSTdNKsOgeU+VVNqcNQKnmK2nUrlMe7IGZAVRvjCrCReoxwJRFe58nyLZGJoTyPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3294

On 23.09.2021 14:02, Wei Chen wrote:
> We will reuse nodes_cover_memory for Arm to check its bootmem
> info. So we introduce two arch helpers to get memory map's
> entry number and specified entry's range:
>     arch_get_memory_bank_number
>     arch_get_memory_bank_range

I'm sorry, but personally I see no way for you to introduce the term
"memory bank" into x86 code.

> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -378,6 +378,24 @@ unsigned int arch_have_default_dmazone(void)
>      return ( num_online_nodes() > 1 ) ? 1 : 0;
>  }
>  
> +uint32_t __init arch_meminfo_get_nr_bank(void)

unsigned int (also elsewhere)

> +{
> +	return e820.nr_map;
> +}
> +
> +int __init arch_meminfo_get_ram_bank_range(uint32_t bank,
> +	paddr_t *start, paddr_t *end)
> +{
> +	if (e820.map[bank].type != E820_RAM || !start || !end) {

I see no reason for the checking of start and end.

> +		return -1;
> +	}

No need for braces here.

> +	*start = e820.map[bank].addr;
> +	*end = e820.map[bank].addr + e820.map[bank].size;
> +
> +	return 0;
> +}
> +
>  static void dump_numa(unsigned char key)
>  {
>      s_time_t now = NOW();

Judging by just the two pieces of patch context you're inserting
a Linux-style code fragment in the middle of two Xen-style ones.

Various other comments given for earlier patches apply here as well.

Jan


