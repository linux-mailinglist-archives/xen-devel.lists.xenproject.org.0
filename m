Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6643442D1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 13:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100186.190729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOJwn-0005AY-I9; Mon, 22 Mar 2021 12:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100186.190729; Mon, 22 Mar 2021 12:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOJwn-0005A9-Eg; Mon, 22 Mar 2021 12:46:17 +0000
Received: by outflank-mailman (input) for mailman id 100186;
 Mon, 22 Mar 2021 12:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lOJwl-0005A4-OO
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 12:46:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad929400-7d24-4d09-8626-0901d97b63b4;
 Mon, 22 Mar 2021 12:46:14 +0000 (UTC)
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
X-Inumbo-ID: ad929400-7d24-4d09-8626-0901d97b63b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616417174;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+4/XYcFCnN5QqOjwreFnJCDJLz2vFwD5GScCbDeSmdo=;
  b=HtXpdoAwG/wtWkNqEXsdHPU1g1beKNNYmxMtyLMQ2O2OxNtdPVJfo2yT
   n1Q+dHL6w8Q0s+TV7KQM9AVJGjDAFnEXr2B+ag4e628qB6P3cCA5KFkYO
   akzwvGm3Cxsy7QlTFg7TVX/BfLJhmolAmUi4226Rhwi3ADEtliYIa/hda
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k+zyy8smYtM1C4ydKbMA4lkCI7t6a54bcHSDt+2gWG5iwwJWj4GZ+C0CSH75vPtAyR4iRtQnXs
 7JhSz+DkyDCnAfofEVt1t9TER+gv+BJ6ihqkzi8wAAQc25OUjNrB6ddz/9rgJHNAF2nOPX+u6a
 fWDAg+MDA1wXhZ+9uiYMCfpJqWKGJnwvO3qv1MMDR+QNT9MPO3gAD34HnXdma9H1544ZN+ifbA
 sr7Cc9c6KYNcEpIcwZCCAPDtil6XHC1IDlClQEeWchM3zymbUK3ih7abY3J0wMqOp2FvCQ9sUp
 tNE=
X-SBRS: 5.2
X-MesageID: 40179052
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xtC59qrZyOajfLmnessxWwQaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,268,1610427600"; 
   d="scan'208";a="40179052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1SD6Q65ioodaMk6EQVkQxX3T9c17yz5a888mDePSwiC9I06G+bYO/W07g58m1r/vFpZ8RDVNIoDi6A7wJH/fYSVp5R7OCbfxZJspLM1IJVfnBfufSk8V6sGkF+YA5FcJu4y3G4nDzyXi4LSWpYanaRAZupIHzFKyZyH2lWVEWpt0KPu5zKTrTLIRFiNm3FD3gyvSKq9TpUseGKXm9PVxGlVrJDUGbtrFe18AamwaCnUcdtAder9mPdiEX4dvls+xGVhDNd5avkWIFt0cCSJrhMOkAlq3uofmqc+1Uo5+UtlTca0byoZ6BGhSnBq3Ak35CZ0eMvtCTCCDcelQhMTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJDNkkH/vzI+iZBh+0yrj1IXH9B10obPpkIrSyfHwhQ=;
 b=DxN6x/JPY5sIQWedQzkW+BxpNc+UO2HjkAxcoWBKLgtZLkHjEA2H2DNyWFHGfzGeCixnPBEBrrV+K/nSNU8pSUIAlEHjO/PdPUGY3Bt5F8gKxMKYAF6kNQQhC+oXZTbGbRCWotM4APVlIUIz6q+cDCgwaJNoe/aQ3Up6bdLv7johV2/R5/T96L/1gRwpUhRFYUrH5F9CZqhUfJ+xLMJbMLuUBhkvgKfuISTrR51RU1evNnpdBI5VzpVjPYaDrrR/zAVplXXMMCdaS/wTRDB2x5ohtUtAb8CNfyOxhzyrW5SxphPHdBttFN2LokNTsD3yW8lpIUf6eC+0Pr3HS/kLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJDNkkH/vzI+iZBh+0yrj1IXH9B10obPpkIrSyfHwhQ=;
 b=ZtrbhZD/GR70poJLR135abqMMjoWHQXV4vKF6gKU3vaMLr0L6hOv8XW1V+w7bbyA6fpm4n4lgcwqMQ2zgerm8Cujv0a2+uhd3512X3UGwFxkiSO1fD83AXfcT1YiuO3ZkHjvs77/2YCrIUcxA/95t4J7YBoAd2HoFfYaCAtwwwM=
Subject: Re: [PATCH 0/6] tools/libs: add missing support of linear p2m_list,
 cleanup
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210322105840.11224-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <48642c84-9f19-d029-6823-814e389086d8@citrix.com>
Date: Mon, 22 Mar 2021 12:46:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210322105840.11224-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d2fe96-036b-42f7-5b1f-08d8ed307787
X-MS-TrafficTypeDiagnostic: BN7PR03MB3874:
X-Microsoft-Antispam-PRVS: <BN7PR03MB3874672ADE34C6F84FD217E0BA659@BN7PR03MB3874.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRNVJyTugEtM0XLash0HiRzXnEBlM3JKxq2VBkN59ErLopMm0k+4f3JBf/Bufq8ZrriNj64TCxfcRmU7EpX6hi4/Sl9Tq2WCgd/Mop6LUVH9npj4XAFhsgI/Ce1J7xNL5RqI2vVI044E5PDNT6zfynU9azatMV1qeYjMv3kHlpkf4DeCWbaaHWRMY3csjWwp3ibyfte0bXYydjFK2gyTePB07b2kiVwgMyCHqbJAyMhyrLNNYRfgHkef/1jMST2FhyWatyL5GL6rbD9/818/ey2ANl2LAdwJo6upBrD+5XTguRxC0p1LvAJ7METLJA2Wvzn+UfYJWGrjGbOY8hOXKFJFRT3QiDBFkeTPGLVYYQUz7A4x//EzszsSjMIVm+JgIfjbP8K1JO60BnJlG7/CkopNhfGvc5qjeBuZFLmAwGnDGYapQ73Znol2RvgAg4s+GbPOKcLw2u638Z1zcs37ZQv9W153keyWBFG/cstEU9zT+m77PadVUcvGftu+B9fKrmE/xO+NiyOxF5WojK+z1udPIQSJhaXImDqHxf75kEKUz8ae0ZQveURzW1ahKnVT4QqihvdAxTnydGpRa9LV7eXDSZZECo14HUOEEEP2hhHi5uaz6siTjWwCfSFHLdvCAQdiw1ngls1GZbeT3y25ZCLUNdLsRqxBbEWa8qmUziyriSi6o+d0yvrOH4RU6qg+7qy1bahD/dwLdLvyDSO2RX0gWeYCjIcI3mROFmzl17QEtGTkDKHXwif9iCdtLHnS3FMDu0h2durWtDQ16s4I1n6k3N/Iq198DvcMUC+zNZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(956004)(86362001)(66476007)(31686004)(8676002)(316002)(83380400001)(54906003)(8936002)(66946007)(66556008)(2616005)(16576012)(2906002)(31696002)(6666004)(4326008)(6486002)(53546011)(16526019)(36756003)(478600001)(5660300002)(966005)(186003)(26005)(38100700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEJsbmpOZTU3S2M3YmJXK3J2eFF6VGZ6Uk1zaG90bHhNZWh1MkkyNEVwY3lK?=
 =?utf-8?B?Q3dMQ1JGNmNkQUpIVVNabmtGcHFrdVFnY1V0VnBGM3k3VDVwVFEzaFZhWDVB?=
 =?utf-8?B?aC91eHRuWGN6cGl5ZnRXdXJYZ0piWXVoVXM4aDgwMDBRcndGVXc1UndIajc2?=
 =?utf-8?B?K2V6Y0xBbUtXVC9FdHJMOUFKdDVzcTcwd0tENnM0QitwdTJxMklwd2ZGR3Jl?=
 =?utf-8?B?TW5abWdpeWx4NmswY0JIME5LeW5UdjVaeURNSU1CejhnQnc4aDBiRFU4RGs0?=
 =?utf-8?B?NmQraTMrdUJRbW1zNS90Y1R6NUdZVlByOW5VaTZXSUxLYTlhMVlnZ05CUFRt?=
 =?utf-8?B?eWhiYVVZYkFjb1gyU0ZKRlc0UUxKMTlwcnIrYS9CanFsdmZ5bkRlREZsc1FP?=
 =?utf-8?B?dEpRbXBEbFByelFHS2orLzlNckdRWGJLeHpoZjNndEtpb2hEa1puK2QxdmlK?=
 =?utf-8?B?LzlCWnlZNXlXSEhaWTlwc0UyVVZZdWtOalpPb2FsWWhpd0w0SXVKNkxhekli?=
 =?utf-8?B?RVFCYkY5ZTBPUG9Zckh6enlCaTk2dTR3MDlTT0R2eGJYZzU4NzQyYmZhUlBk?=
 =?utf-8?B?VjA3Vnp1NGFGQ2RaSmNOTUxEdmVqWE9LZHM2SldtakdPWVplbDM0M1E2WmpN?=
 =?utf-8?B?RVB5bmZsdDJsNXFZaGtMeFhwTjlsN05ZUExvRDJxMjJVY3pxMjZuMDlJWTlV?=
 =?utf-8?B?aTNQZjdXalViYk9FQWZVTENrYUJWOVRBZHlURXRXNG9SenVIazNPNVJrVXdS?=
 =?utf-8?B?TE1zSVFQODB4VUUxU3lrZXg1UXU3Tjh2MEFzQy9yKzE4SXlaV1RFZ1p6YjRX?=
 =?utf-8?B?d0xLdHgrelZsdERlWVFoMTQ1bHh2S0srcmJRZ21xOWVLcmRHWnlWcWdmUWcw?=
 =?utf-8?B?QXJ2d1B4ZmowRUFDVFUrVlgxR214aUxXdDRCaWVjNzJDR2pFa3dTTjBvSXFj?=
 =?utf-8?B?OHFPc0ZSS1ZuUzhGQk5xclJuL0Y2RkdsRVpFbHlIMm5LclNJeXVWRmQrRTRV?=
 =?utf-8?B?dXFiY1RRRnJCelg4YXI4c2U4N1Q1Wmo4UUpmbmdvWmo5N29pajBYd3NjcGRP?=
 =?utf-8?B?eGZ1b3BQZVEycm5OTEhUU1N4bkYrQXBSODltSERacE1vQ3BZWEd5ZGo4T0t1?=
 =?utf-8?B?bkgrOHhrb0hKRDl1WG5TbjNMR3huUm5SWUEzUEthTGV2VitsRGtUb1Y4MHJ0?=
 =?utf-8?B?bmZEaEU1WTc3Y0ZLT0NnOEJwcHY3ZDExQ0JETjZXSW9mbXFiOFR2QTVNSG1w?=
 =?utf-8?B?YW81R3JBMkVKNG1QOXFKanJwRHA4aFpoODhqYUVzQVh4bEQ4QTBXTkpuUGUw?=
 =?utf-8?B?UnRYc1ZRcDA5RUVkRjBLWEQzb1htTjFjdkFZTW5NQnozTDhob3NuMHRlL2pT?=
 =?utf-8?B?VWVoMWxKaE80WXNXQm0wbEZWeEoxRTcyM3VOR1BoUjZHVUxLOXZjUjlvdkQw?=
 =?utf-8?B?dTJ3Yk1HVnMyRUgwYmFkQk8wVW9YUjN1RnZja0s1M0doLzN4TktJT29oanNk?=
 =?utf-8?B?UmZvc3lwREhwYnNxejVZVHJ6UlQ3c1B3aEluT3FEN0FaTlpySTBCbXJVSmpr?=
 =?utf-8?B?OVo4Szl6SEdFek03RTcyTjloNjQvWDNIZmdHNXhic0VLRml0UkdWM2NiWkQr?=
 =?utf-8?B?eG10UjAzcnkvOXBoN0hCVGNyWFpzYVEwOGtMY1BvOFRqZHRrb3NFTmJmaEoz?=
 =?utf-8?B?d1NYdWNRMFdOd2J0Nno2WkVoak10NDhvaWN2U2p1ak8zVjBSdlprY2U5a0ZQ?=
 =?utf-8?Q?I7hYrENmupzlJ+p3McfqPkDNGhLdiGkLG+C5Ojg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d2fe96-036b-42f7-5b1f-08d8ed307787
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:46:09.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbIlSyT8K9OfzCBBOq/f4AqPu73UNe1QLmia17ABGmk3SwrxkDggpIb02unfvg5W7CBmOEObY+zIHreNOl9u58TsO7uAWANxZe8IUno51+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3874
X-OriginatorOrg: citrix.com

On 22/03/2021 10:58, Juergen Gross wrote:
> There are some corners left which don't support the not so very new
> linear p2m list of pv guests, which has been introduced in Linux kernel
> 3.19 and which is mandatory for non-legacy versions of Xen since kernel
> 4.14.
>
> This series adds support for the linear p2m list where it is missing
> (colo support and "xl dump-core").
>
> In theory it should be possible to merge the p2m list mapping code
> from migration handling and core dump handling, but this needs quite
> some cleanup before this is possible.
>
> The first three patches of this series are fixing real problems, so
> I've put them at the start of this series, especially in order to make
> backports easier.
>
> The other three patches are only the first steps of cleanup. The main
> work done here is to concentrate all p2m mapping in libxenguest instead
> of having one implementation in each of libxenguest and libxenctrl.
>
> Merging the two implementations should be rather easy, but this will
> require to touch many lines of code, as the migration handling variant
> seems to be more mature, but it is using the migration stream specific
> structures heavily. So I'd like to have some confirmation that my way
> to clean this up is the right one.
>
> My idea would be to add the data needed for p2m mapping to struct
> domain_info_context and replace the related fields in struct
> xc_sr_context with a struct domain_info_context. Modifying the
> interface of xc_core_arch_map_p2m() to take most current parameters
> via struct domain_info_context would then enable migration coding to
> use xc_core_arch_map_p2m() for mapping the p2m. xc_core_arch_map_p2m()
> should look basically like the current migration p2m mapping code
> afterwards.
>
> Any comments to that plan?
>
> Juergen Gross (6):
>   tools/libs/guest: fix max_pfn setting in map_p2m()
>   tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m
>     table
>   tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_any()
>   tools/libs: move xc_resume.c to libxenguest
>   tools/libs: move xc_core* from libxenctrl to libxenguest
>   tools/libs/guest: make some definitions private to libxenguest

https://gitlab.com/xen-project/patchew/xen/-/jobs/1116936958

xenctrl_stubs.c:342:11: error: implicit declaration of function
'xc_domain_resume' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
        result = xc_domain_resume(_H(xch), c_domid, 1);
                 ^
1 error generated.

I suspect you need to shuffle the headers in use for the Ocaml stubs too.

~Andrew

