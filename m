Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97D7DBD93
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625274.974413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUvU-0005HD-60; Mon, 30 Oct 2023 16:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625274.974413; Mon, 30 Oct 2023 16:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUvU-0005Ee-2X; Mon, 30 Oct 2023 16:15:40 +0000
Received: by outflank-mailman (input) for mailman id 625274;
 Mon, 30 Oct 2023 16:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUvS-0005EY-PS
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:15:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fd5651b-773f-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 17:15:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 16:15:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:15:35 +0000
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
X-Inumbo-ID: 8fd5651b-773f-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYlgKipF9vrfqf+dPhyIOIDD6DqIJP5PtApLvRdqkm0zIQx2ea8ZO6PpD2NsKnr7ilwS0npMCLgzgkfrgS/KtcIFNFl3/yuI1PBepTbs9EYwSuaR0Dvz/seUMG54RbUCMVk/XZOJRdnDXunnvm7OKBMblINv3Ngz5ttPTnQos8gIPig1S0JjbVDaytULidVbEfDQQ/CC0jCuCpyR6aoVZxr/H94elOu+vRGUmPmrH1t06HX1OE8bWb90IIYXvP5h3d5mMunRkqGbPkXExLNuDAhzWKKrGO+B3/KPhwPVXpALWbb0GvFSSXYKPpqCq7msJfeMuhqQ/loipHpGIUSoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiiBrW5vEf0m1/y2G0GNTDRRH2fhWo4h1V/uCWDYIc0=;
 b=iB7xDECzuju1UFk5EUBgah/fEhwffFyk2Q8Ng8lnBcG6cNtm6jXW0bNqv6dy4XBgaXBCSgQ4HmD/qregBUr3EAfy1hLGi4PhYLvWB3Jr+KZS9gWf3J5xYnsrP9SZc02CV512Pk5eojREaGFvMjkn9L39kIk19ounPzydHRE7aORBKhIYlOyzOcKxo/KOONd3WLPf6h+LjF2aTROcU2QUTH6AwBQv7bQPlVAq+PODDjjXWh4W4lCGr/J6MEChUXvMRzo8soyH1hXV2rzY0kx6j+hPXLTmMi2zGvdWE+1ysZgsjTwebBpfK9vOhuX8gMxbs3O99MqkJRFnfSo1eFl32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiiBrW5vEf0m1/y2G0GNTDRRH2fhWo4h1V/uCWDYIc0=;
 b=WCGu0qvoG59c007mzaCPp2w0Ef8CdbbmzqwWaw7qpjPkCocmGLre4AepN3ffLdqiP0RRNXzSC9YkxS3zE1rPpU5ZXuN/rsFT1j00L18hPEqcn/DSn3AA5zbLL16Egofcs8Zb5kS+3TRmBob6UwwjNy4oGcOOVRQYeC2nlN9g0RypbEMK8LvE1kpJaDi1uqqpKf6M4vdIkHwN5609GnhKY1bKvS0OXSdfUm8OjMSmmCo3czbQ5udM5KSSX0bBqfiY/HiBjm3S9fvPDLlVtOwmvGlchB1gaKqujrUcJfkIGeim5oklDVuLBfRmHeH7LCW3PB8n30DXN7LJzzwDi6bhYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <356aa412-453f-f6d7-d61b-5946ba8832e2@suse.com>
Date: Mon, 30 Oct 2023 17:15:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 04/22] x86/msr-index: add references to vendor manuals
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <7e4418cfb1daa172e78fc47098a4018ae0493e23.1698261255.git.edwin.torok@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e4418cfb1daa172e78fc47098a4018ae0493e23.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0292.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ab4bf8-1ed7-4b99-2e35-08dbd9637299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MjuwSgCptbZPYZN8ZXlExKv91vvRTWqi4l9F1LuXTJ2Ak1n/SmKVueotQSpVyQuh3aw0dpDkpNwS+xIkFVmYEOiSIblJ5e8iWYB0JCNhIL5Aid7Z/cNu0v4ROjD7yGtusFGSLU4Hb7qPG9JY6yOGenm7fl315zPbFfwdoz0OenSWljKI/6ndIaRRBLOOhNHj9Yu/SEAA8o6956BBLIHM7ouaM4DWRuQsOA9bkvUGuY0pnfueSgdrK7x0jYrgD9tFdLCeM5aWcEb1JR1raVcv3odSluR1XAPovgP0gSWrk3iwYRSY9mmk7DUOYsT18QUMEO1i0dHhN/V298acfvyIe98kHwKV9EySwPcF35VF+PlC9WvZZQJwl9+UJhZ5+D2b3IjXT4YJIdb14ZG4KoXSlNCcpslVFK0qY2ilg1lzTh+6y28emY4RqOsmlU5d9pRj5y8/Swz1Z2GXOk+YsJxiub/bu/wsxBnd/wS1TDXUKthOlR95Bpn6cjppUI+p/3qQQg2cQbUrbB4pJCPd8xPrwUbtFnwz1rB18ioqsGij+NB3ReqiE0IfvIGdp+QVAD2Lh7DUvyoRVKG5RR8IPsILHLsMnclKr32NAlaP8OFFaTg6lFtErEscBjYuPLP5i2hQtD839ap5AF2MSQk4ibQ2QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(36756003)(31686004)(478600001)(53546011)(966005)(6486002)(6506007)(5660300002)(4326008)(8676002)(8936002)(6512007)(38100700002)(86362001)(2616005)(83380400001)(26005)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(31696002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWp3NnpIdUJ2cnBiYm42Wk94ZjNRYytSZHpRdTBWdE9nNWNrWG9pK3BjcllH?=
 =?utf-8?B?RDVmSUNIVEcxeWt2T3BZTjc3eDJmZnA4NGZPQ24wNHprVnBQdzJDelJyWTRq?=
 =?utf-8?B?bTd4MW84RkduNURUT21UNHgzU1NucTBidHRoMCtJYlhmUzdaby9BYWFBSm1Q?=
 =?utf-8?B?ZlhyNVRDUmJhQVVQbk5kajZObFk2RUdoTUxIdlduQS9rMXZ1cTA0MDJEN2hh?=
 =?utf-8?B?TEJlUmVIWVlEbzI1NS9Ebm5BQ1h1RVRUaG85UVFDVjJ2cm1kQi9OQk9HbzZC?=
 =?utf-8?B?bFNJUlhsTVBlaG5lSzMvSW4wZHF3WjhuNDhJTXE3dG1zUDkrRFRRZmM2bXJT?=
 =?utf-8?B?dlRNeDNmLytUY3d1Q3pJR1RaY2k5VzRQejYxZ2N1Wk1RT3hLMW85S2NrRjhy?=
 =?utf-8?B?d2FJaERHaWpBdmovMG4xS0htV0hDRXJ1U3VMblVsZ3lRaDRRNFZJU3prS2xT?=
 =?utf-8?B?czlEdThwY2hBekhUTXlyYUE3cWlGSTN1R2VFY3BjUitEZmt2d1FqSlhycjFE?=
 =?utf-8?B?clNzNVNUWExzUFRIYjIvaWdnSUppcEdqSG1wMEpiSXcvK1hpR1psUjlpQWNq?=
 =?utf-8?B?VnEzYnNzTzNLOXUwbUJIaHN2MWxhblUxU2lWaWxZK2FiaWljZUEzZm15M3da?=
 =?utf-8?B?b0NhWittTHM1MlNDZnpvRWk3akRDQkNBZlNtNk5ybnpaMmRVZWV1L0NscEsw?=
 =?utf-8?B?RjJWdk42b1o3NTdqMDFjOVFiMWxnbCtnK3JiaGxRclo5TllzSGFvQUN0VGRp?=
 =?utf-8?B?OVdjN0lpQXhLSDFKeXlqRlpycCtIM2pXU2FEZWsvVzA4c05VK1puclpySnNK?=
 =?utf-8?B?bjM3a3RieFptM3piZkRDMXBZZ3REMGM2UVQ1aTFlTlliSW5BQ3JxS3k5QWsr?=
 =?utf-8?B?M01HMVprM0ZmSnU5N2prTytQY2l4bzd2dnpCczZPdlhBQ1c2VnhDd0hzaGJr?=
 =?utf-8?B?cmNEVFRhZllJWGhTdVB2SGp0VUVSelFHejA0K2ZwV1NCZlhnbXJNeTVPQ0M2?=
 =?utf-8?B?aUFzMlMrejdGV3c4UmlDbWNxMUpxS3VkRU9INmVTRFAybjhiaXlPWGdZVC9I?=
 =?utf-8?B?T1NoMzI4TnVDakdCOWtzWElYT3QrSDlUMnkrZ0V2TVVBWlFPODR4bVUxck96?=
 =?utf-8?B?Uy9kTUl6VXFLbmtuL1Jtb1E3M1NhTFQvdjRvZ0IvR2JDekR1cGFqQTYwNEhG?=
 =?utf-8?B?bzdTU0E0NHdmbG1Ha0Y2M29lTmJtTTNPWU5VVXhDOFpVVDZmUVRJWjZlS3Ja?=
 =?utf-8?B?dWJpK0YvWGIralRlNlMrRTgwVXZkQTZOTy81Mi9TTnJRNnYrdGU2b2hyaGdM?=
 =?utf-8?B?NWxRNEJ1MFE3VVA5aTJIUDY4NCsweS95ayszMW1hbFBXb3VVS2FmaWFlcWRC?=
 =?utf-8?B?UWd1UkRFTHlndnZETXB6b2J5c09FdU5rVmF3Y3lvWCtuZkpZRGZrdzRHT2hL?=
 =?utf-8?B?c0xUV2NrMDR6VWs2TElPYmltcFQ1VlJabWtKYkxKajA5TklRcEloSFpDOFNR?=
 =?utf-8?B?MllRTDRqaldBb2g5KzhRckE2ZUc4RG5qclBacHBOSTF0L1o5TGV4aXMrWTNa?=
 =?utf-8?B?Um9MajRWT2t2MUxzUU1SakFmWm81cUNqNld4Mkw2d3hWR1lNRWM2VHhXSUhi?=
 =?utf-8?B?Z2hBa2xnWExZQ0ZVZ2VFWWlxaTk3OGJYYm43Y1N0VGlxQm0veDRiRG9SSFdH?=
 =?utf-8?B?THNrVkI3alNKcUdJNXZvM3ZJcnBlb2dITGVrbFp5bjdXL3VYamdsQ0xMZE9v?=
 =?utf-8?B?T2RORVZKeEovWWN5YSs4UUxHUGl2RHpHck9oVzZvYndUYkFGS2dqTGhpYVlY?=
 =?utf-8?B?UWJESENQY21WV0lWTHhTWlltd3JZdDlUQkdJNlNJT1pJTXBDTFVMaC9iUnVN?=
 =?utf-8?B?RVhyeERaZTQya0lKUC9wTnMyT0pudHNSK2dBOTliaHhQekdwc2ZYc3N5T2VQ?=
 =?utf-8?B?ZERQNWJ2UTdCNnNneXJVQ0IzaUZCWTN5SklkUHRkL2RRWmhrb2wzVGpiRDMv?=
 =?utf-8?B?MWhnNm5tUG9JejgybkppQTRkbnhYOWx5elRxd3kxb2g1clYrS0F5N2YzR2xr?=
 =?utf-8?B?VWVjbU43WlM1TGJ1OEgxZVVGR1ZQU21hNkNEQVFFMXcwZlErdDk5Z2NWcmdE?=
 =?utf-8?Q?sS8pmndRMLQPJ0DoQN9i7OBkA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ab4bf8-1ed7-4b99-2e35-08dbd9637299
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:15:35.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4EEYdCbB5/4Edql4cWP8ve3ryh8NrwQk6JktvfV4u67U5Ar1xVao7w4Apq73GqYwemdZWf54Pqu9HHZERiIyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

On 25.10.2023 21:29, Edwin Török wrote:
> To more easily lookup the semantics of these MSRs add references to
> vendor manuals.

As much as I appreciate the intention, ...

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -13,6 +13,16 @@
>   * Blocks of related constants should be sorted by MSR index.  The constant
>   * names should be as concise as possible, and the bit names may have an
>   * abbreviated name.  Exceptions will be considered on a case-by-case basis.
> + *
> + * References:
> + * - https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html
> + *    Intel(R) 64 and IA-32 architectures SDM volume 4: Model-specific registers
> + *    Chapter 2, "Model-Specific Registers (MSRs)"

... at least Intel's URL has changed several times over the years. Volume
and chapter numbers change even more frequently. Any such is liable to go
stale at some point.

Jan

> + * - https://developer.amd.com/resources/developer-guides-manuals/
> + *    AMD64 Architecture Programmer’s Manual Volume 2: System Programming
> + *    Appendix A "MSR Cross-Reference"
> + *
>   */
>  
>  #define MSR_P5_MC_ADDR                      0


