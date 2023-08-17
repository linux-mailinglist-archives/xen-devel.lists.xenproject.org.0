Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012777F09A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 08:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585142.916162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWg8-0005tk-8j; Thu, 17 Aug 2023 06:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585142.916162; Thu, 17 Aug 2023 06:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWg8-0005r7-49; Thu, 17 Aug 2023 06:40:20 +0000
Received: by outflank-mailman (input) for mailman id 585142;
 Thu, 17 Aug 2023 06:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWWg6-0005qz-VM
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 06:40:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edef7f5b-3cc8-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 08:40:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8795.eurprd04.prod.outlook.com (2603:10a6:20b:40a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 06:39:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 06:39:49 +0000
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
X-Inumbo-ID: edef7f5b-3cc8-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoIEwH77JTGx53xpQlok7MryCf8ERQDDzQwseg6UvoMibAw5jH2VV6NuRqpuuZE7GVoUDUeo0lFJXJU0XxOosKscdI+xWEfEPVXK1H8y48laxPpAS2HcpVwJ2W+Hv3IsvdZP9vTPFnXtU6Yv9jhWxhpjBU5S5CHWvRIFUmpPdZG0hJM35a7sarhRKINung4GrquLb7Nv1N1AFSHDwSx/WT+TlcGee2mNz5d+5TlqkJv1v3ececgUIl5wlv9bfocfNgE6i4EVb1acmTJBIvBGq68ZgNktA3ptER5IFfvcTNaxny8C3NoWwnl0ue+WKZ6a1t8+laAErJSCxGm2WTm2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+NttUkSjr7Z0htLFR9WU+TtrkKHE2S2MTNtxGhgDwo=;
 b=aPKn3LfjSeepqru4fh2ARQ49XGuAVRe5hrJEsha0E3unWIsW3MMfE7RF98tglZQgZFwq2pmkeusnYkZ63IgU4+qUZ0ec9aexpGW8k0HdC8AW9UGSO2NHfU1fKMLiFqad+3cNkKLHyVV5DnQEn71kpnBgBF7PFvivuXBkE3XbhC0lAxHKT5Jbys4VHWMv7UzRLRZx7s+QCLu77e6nmK42BQLbtQF9NCW7EgHOf2ckTXyqARgaMEWbStejIB34+/W929C5iFbhYxtcnb4wv9QIofVyiudG6OEn8T8U3TUoyMQxceVjWIo84X8z55LHrgAmrjWiN2PrF5iwoPV5/LIsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+NttUkSjr7Z0htLFR9WU+TtrkKHE2S2MTNtxGhgDwo=;
 b=fE4I1mDP+Q2SxBVwqNsPkWT/ilcN1x+sYsApgDW+1+m2I6wuZXZCngYn0N/K0jRXFTACC7N+lOB5KwnDcKqI600gJEpgvOgZF5qFHzvwkZnLwJpNWqFglOWphh9P+1cJ9UXT6T+G4KAYVD3HKme+NCqchAU9+EdX+wGcqPksO1+ZEVNAwE06n2agx4sthOjPDbcf2gxPMiXPgV859wR4mymo8l5oZQgw9I9d3PP+wc2Mzt27fOvEw877Ye2XQ0MrBx2ZawZbUeJxMD14RCtjL/JasN8x1BdU+AKeM77EFpnnMETsgsS0463BSVruPKQgEFOuIABCu8yJuGqt+AGCTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ad06a1c-2337-fd66-cf2f-9151544dc8db@suse.com>
Date: Thu, 17 Aug 2023 08:39:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
 <cc82ac63-a019-4243-aa2b-2a4a3a07857c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc82ac63-a019-4243-aa2b-2a4a3a07857c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1e9f52-d48a-4b41-0af8-08db9eecc126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WQjxL65e23/CIwtrNHMWZxOIOh2lvl5ucZ3vunEOCtrjI4XZ/wQ2xp4XsqATwMRWtHWS75mSekoz4+rcs5Md72em3i6AH3dF9tyhYIIGiZJ8jr6tpFscMhGCm544FrAN2gbfyeEs9gjIILx/9Y+H07trn1uGt0gblwjSt39sdgfn9DDdIz2unuKT+MnulmMyQxzBgHvWPml2ZUVuQc6kFPaHa1c9443TRPQkthyJoyqx2A1Xo2xrRYCBIjF4U4DHLH+C6kUgeDA7DeVcnq0/ldEc6pvY4756hV2YNNkH9OEFqQJJrCCf8Li/R3i7nkQpzxpCetQY96txZN6My0LDfGlb+ro+8gYcAC+NCj28CnAcQa6xTTe39i2xT8HghZwdhgsGy8PLaYl8JJ43X+9itOe9FrxGUl7RpJyAfTksRVNrNeYpDPaK0EZHIOJk3XjtxTmwhVozWUESgAn9wdlBZRG/fC/qwbE98bwQTfMC7DvnaaULFBr1c7PAbBHLsTlxTeTi0/fW4/QzJemZf97ArpIo4417gect+lCLFZ7WkC/gCIQP/L3JRp+wG2XOddoFz13vJ53nZ5mkpFvjctfpD8IcYh8Pe6/zlWk+MMnRXSOtbDelaDqCcuVwZHgX6bMz4orf0+v4TZF3KqOUQ/55hQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(4744005)(2906002)(478600001)(66946007)(66556008)(66476007)(6506007)(54906003)(6486002)(6916009)(316002)(53546011)(2616005)(5660300002)(26005)(6512007)(4326008)(8936002)(8676002)(41300700001)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0ZHSi9oSHNieit5eFJTUDU3dWM0MENEMllOeTg5ZkJLeUFVVXFoNHdZOWN1?=
 =?utf-8?B?Nm1NcExmUlNQcFlUUUx2emdFNW8vcnlpbktEYmRzcGJ3TlZ3S0JiQXBkSGpY?=
 =?utf-8?B?VHdSZTBLVTBRQnhyMEM3RC8xTTdwSTRRMlQzMnpHUzZlSnVBSm1aNkhqWHpG?=
 =?utf-8?B?dm52eXZIMTVaS0F0b3BmeW1IeHljcGNyYzJwZExOM3dtSEx0bXA0dXdsNk5J?=
 =?utf-8?B?YWFQZ3lvVWJEU0VXM3laTmhkS0F2SGZRaER3V2c5aFVvdlUxZU00VEM4YjVi?=
 =?utf-8?B?NEJjOU9CU0NpamhCWjIyd3J3UVMydlFVQk9NMHcrUHZwNnZNT0FKUXNhYmtG?=
 =?utf-8?B?TWQ4d2VONVJVMlNXeFRhaWFTbGt6b1p5c3lNcTM0eERFNGRSVWl3VTk0ZEpW?=
 =?utf-8?B?YVpNc3d1d3h4OEo4RTVxdUlJY3A0TUdVWDMxdTBDMHpvY016dlJKVlQvM0lO?=
 =?utf-8?B?dFpMakM0RkhXNmprU3dRdCtLc2d6eHc0dEl3QlNhbWpQcEJESUhwaCsxZkds?=
 =?utf-8?B?UStwam9welhQOXBJcUJRYVR3TmlaZmUyNndRaU5DT3MzVXJIUXFiVVVKYUR0?=
 =?utf-8?B?V3JiWXVrakZYQzUwVUwyOXFQQ1JINEVwb3BsN0hDZTA1VjNzZVFjNTBVaTNF?=
 =?utf-8?B?UjJ6N2Q3WFFTUnNHcEdZa001Y281bWppVXpBTzNPaHQ5SWZJeFV1K3Y0cVFP?=
 =?utf-8?B?dVFGVTVxUjVwZGVNYTdFQWlYRzR0aUljSzM5YytCL00rdFZwalVaUnRTNWFy?=
 =?utf-8?B?cTVNdjdvSy8xbEwvNGI3ZmlURkhHVDRKczExdVpzbEZVSCtMNUJMKzI3eTh1?=
 =?utf-8?B?cGV0bjJzKzdHd3JzWHV3NWRGNGl0alg4SmRJNFlHbDhwZXNBTlFuVWpJQTVR?=
 =?utf-8?B?MmFxYzlpcmg0cHBKZjQray94bmR5R3FhYmNuVWVxYk5mQkhVQlduQjNjTHRX?=
 =?utf-8?B?RzlrSG1mWlVyR3hPb1NWS2hwWWVqa1pxRUZYQ2hRMWg4dzQrdVV0S0srVnN2?=
 =?utf-8?B?Sm1BeDdtQ0k2Z1dSR0duVjhGRkNBZ1FiUmgvUENnai8wbjBsM2pBRUI4MFpz?=
 =?utf-8?B?cENwZTNCdFhrZ2RyNDZ0Mk5rSy9CcWxDMFA0VVB5bnlVaG5KVFVwY3EzK0VL?=
 =?utf-8?B?REJmRzJLNFJaQ09kaXVLZTNkT1U3ZFBkd2E3eEpxOHVWd3kvYUpJaUVqT0k1?=
 =?utf-8?B?NnVDcTQrd2tZd0xhTEIrTWdmYlF6RUFjeTN3YXA3c3M4MktmSlpId0Y5VmJK?=
 =?utf-8?B?bHlNWWYwZFpIMUtMS1lOTDE5T0dDNkJBTFpTVS9tV0VHMUFuaWJGL3VJdHNu?=
 =?utf-8?B?aVh4RUhLdWdyd0hhblpQVUMrOC9tQlBsazJ3RXpYQmdFVUVGTW80dGllYW9y?=
 =?utf-8?B?dGRwU1Q1dWZNd20vck1CendMZDZMeW9aL2JTSWNOTjcwQU14K01QUEhMMk1P?=
 =?utf-8?B?UEp2TG9XQmx1L09ZemFCZWQxYmJ3V2phMVorblEzNmdFajBxZ1FFYlZHbG15?=
 =?utf-8?B?NUxsMDNKMURxMk9CK2MvMFpHS2xjM0o3YUFYd2hlRGRVZndwTmVhWjJCbTJx?=
 =?utf-8?B?R3pjMzdYTjI1WVZUUWVPbG40RlZGS0JjdmdDc3psRnQwZkV2eHBmeC91amF5?=
 =?utf-8?B?R3lBRkNwUWhZK0MvellhSEVTNUJmaUZUTHdYK1F6ck1lOTZaQkJuUGtsQVdP?=
 =?utf-8?B?Z2JadEswNW9Nb1V3SWIyTFdGZGFCSi9nYnZkVi9SZHptMmVZMEZKdldSN1Nk?=
 =?utf-8?B?S1JTbTFVckJzVXhpbjB4ZzByck9LQXRheXRsU2Z1SXVtcjQxUGVmaWZka0dp?=
 =?utf-8?B?OXFmL3dTSkk3ZjBEYStTZkxsM2VHS25rOWl3enNJZ0puN3dxaWZPTCtJejIz?=
 =?utf-8?B?eEpKOUFrWnE2eCs3YzRQeVFYWk1yNXUwTUZoVDJJcThmRDRrTXE4UHZualc2?=
 =?utf-8?B?NnRGYjdLTG9aeTVrR1V1b3ZZUExiNG9tQmxmSzI5WlBXalh6elE3TTNFYUxB?=
 =?utf-8?B?cWozdDNCSW91aDdodXlPWDJlZEJ1QmE5T3dXUmZ0NTY4NmFLSHIwenduNStr?=
 =?utf-8?B?OHRrSEcrOVZYOEdZUmJuSnA2dlZQdExqQ29IOWIyclBhb1F1aTY2M2p0dC9R?=
 =?utf-8?Q?5DBfz88to7sJEC8Ht/hMPudrz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1e9f52-d48a-4b41-0af8-08db9eecc126
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 06:39:49.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0azSLOW3nsCs1KXEXFmepTfBaL8HsUT+GIw9cVm2TLWxx0yso8Nqamgx1ajhtShH6+ActB6P5bhB8G0iy4/Jxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8795

On 16.08.2023 18:57, Julien Grall wrote:
> On 16/08/2023 10:51, Jan Beulich wrote:
>> Old gcc won't cope with initializers involving unnamed struct/union
> 
> Can you specify the newest version of GCC that breaks? This would help 
> to reproduce your problem in case someone complain about this change.

I can't, without actually putting in effort to find out. I'm observing
these problems with 4.3.x iirc. And of course this isn't the first such
change, and I don't think we ever bothered writing down precise version
boundaries in any of the commits.

Sorry, Jan

