Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B3B615CEE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 08:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435548.689021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq89g-0005Q3-Oq; Wed, 02 Nov 2022 07:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435548.689021; Wed, 02 Nov 2022 07:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq89g-0005OH-Lq; Wed, 02 Nov 2022 07:27:20 +0000
Received: by outflank-mailman (input) for mailman id 435548;
 Wed, 02 Nov 2022 07:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oq89f-0005OB-2x
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 07:27:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c76687cf-5a7f-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 08:27:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7652.eurprd04.prod.outlook.com (2603:10a6:20b:285::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 07:27:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 07:27:14 +0000
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
X-Inumbo-ID: c76687cf-5a7f-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThQwZ5lkpPBwFgZ7mJN9EQMCu8CmWMv4f3SqWDOGo3j3xsfi6mqWZsORpW9Xy+tG+KTkSxVwTvvhAg5IGgm7uHnESloNGvxFwTVoDOPxdghoCYtK69iHM/LRkzg8rBI/hyhzKKwjwsTrpWkw7FlITiG04mAgzCmP0DeuybRunj5P2TVowggRizR9Fhxk4dBKcp1MRiH87Z0gcs61bcsw//GMvFc+adurta6Uy9a5F9T1ZwrHPq5RRjhK4RvFZ1j7g0NZE2CkILHDQEolaXlj7W8zscqTaceh2iQK6EpjxB+2nWauELRjIb9P5omq/kPaVx7lknH8+ufhJ268aYtBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA7w3Q/Ft1Hm0JdhOtciqeJDaqXY6ivjvOLkDpiaTMo=;
 b=aDy8vo/BOnBMr8O/hF0J9/uFvbkEsDML+tCfZdpWueIkQuZ/6+RzX0eLCITTL0iv59Ytjm8UaBw/CAxGZlLnnSRtNeDn2EdbN5s+L4NpwEgcCg11JehIcVOwGj4mwSDvLFZhUBOSEbSBEdS7C6LDcGPL95neQ999lYEvYHVyiFc81+JIk2eB1Lv3qLUdt8qzJ8CODnq+LkvuxWHQ3EIwBzxptNATF4RsfVSEOMRUricPJDOJRKggeD14wwakiVL44LvYXMB72KoDiAaPLcSWKEKWuGT1Ux+emPz3+Q3aww4JaEMHkbuwzH4RANYGa8yZbHVvyO1aZcgO2bqXImn86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA7w3Q/Ft1Hm0JdhOtciqeJDaqXY6ivjvOLkDpiaTMo=;
 b=f3NcLVBr0mZ4HTKiw5wBDA50Q8xYo3aawgkAFsBTePYTn5CejN3mYBzzQNR9cqAZB2xyTIpUtbILDRJOhiE/HXls2Ld2Azq7nk4B9ufrmm7iUHUUpsyuiqNQg8CV3k9R5zofDvTcBMkNHZa7WJOv5plBIoy4bzX38qJNalFtKpwcDJztMMi+9iAgzdBzIqvAIVIYQKFppIs8ORS4+3olXaYsL9eonF3dActeFS8fdK4zrotbns+3mtfbav6+WW40t2z4+0KhxXbiS2meoIoPwE/tF5DJeeyjINvRaOD1ojYKsHylPaOGcJCbx+GIpwrKTD52AA0IjTHAWwfcMBqxMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2a40ec3-1891-90ef-421c-97febd221127@suse.com>
Date: Wed, 2 Nov 2022 08:27:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Feedback for postponing the 4.17 release to a week later
To: Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
 <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
 <AS8PR08MB7991F1F7CCC8AC6A56F9F0E492329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991C642E1CDFA9B2B97E10392399@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991C642E1CDFA9B2B97E10392399@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: afae173d-1d82-4f3e-06b5-08dabca3a99e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B5H6ZM921EW2VkAEoxVLPAU0ywjHdEAIZbRZfPo9s8pWHwn18PBchdvxorfe+WUgEVN6WWujf95PLsN5niRogee40u4WVFxXYnfjL9821y2FUvz3GMY4R3eOwQPedBvdwMl4EPjgBFbMHSB9wEqyop1dKHbLyRuaidu02A9bWBQAbJAlreJDwwsygOjODwoffJnm9K51NCCxxto/MgEWaMXOjFe63Ug1XolB87gVaIZZyHZGxqIUrpN41bfF17pz/h6vgoZ0G4wYKNnt6IuwRGM6ah6SS5x8lqpmvmQboeXk//AtiIp6lytgqZlCZpTUVEgYii8XcvyuX/o1OMbuod2ZH9pgC07yLjEmQRnzHnANvADcGHPtM7LakpZsk6CSTt5D8hzWIR0hrkVoPlnSGZ58hiuVu9zRCXYSoCMk8oWkmvL+HUiRii0YLYPACYCZKt8DBwL5tBZVPvubqRgLNyu2vD3TQuzcc5Hw+89XQD9CLMumk+m/aUzCjU9r8kHfJ+4sT9wuolPX4Fey+qO2DWqKgN+2Q1XElrGNsyB/ubQgTPTFXXu/L/PP+Nppp/tLCSBuKq08zH+jY0Ewz4O1DB+JTyLbtfHELNNIykhMsZBQUvTZuttSZlN9bEGkEjRht6x9Y6oMKVvOT9udnH0h0zI6EtSQFUReDLwwYyukWAetcYEs8g6312xhPPzZhy14umiNdjChKAqsaZYfRaUN1H1pYZnInvpcIRMWsAdFKUfQD2dpfpzNXBWZlq4nHaO/NWmntR48IwobmEvpiZoVTUbEc+Wd2Tak03tAZ2BAvIs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(31686004)(36756003)(66899015)(7416002)(2906002)(86362001)(31696002)(83380400001)(6486002)(41300700001)(5660300002)(4326008)(186003)(8936002)(54906003)(8676002)(66476007)(66946007)(6916009)(66556008)(316002)(53546011)(26005)(2616005)(6512007)(478600001)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlaZk1JM2ViZVBmSmNod2lobld1QUJZRnBMTUoxTkVHQytMUGFjcXRLcHpZ?=
 =?utf-8?B?S2FadDdUY0haQWQxakVnRUUvbTEyUk04ZDhoTm16eEY1NFlIOWgyZXRsaE9k?=
 =?utf-8?B?azZqV09sWGUxSHhvaUxEVlZGbktaQ00xaGdpUThSK3NtdmlLaENWQ3F5Nndp?=
 =?utf-8?B?ckRHRjZUNnJwRmxkcXF1K0pxR3N4U09RMm96Vld4U2ViSkt3NC9FWUxESjVK?=
 =?utf-8?B?dW80WGRzZVZGUGdnOFY0RUFKb2c4cnQrMjVBUjZQU3RmU3plbHhDdC9sVTBk?=
 =?utf-8?B?KzFEUm1BZElwMWFacjdPS1EvZjYzQnRGaHUzWHRGRCs4K2xtNlEzeDJld1JE?=
 =?utf-8?B?NXRuSk1ScnQrZnF4aVVjR3ErY3o3cjZDZTF3VzRFamZiVGx6QzNQMmJPUnF5?=
 =?utf-8?B?d2FXUk1WVkVlVmNIaGNUU0JhOFpIZWRkS1dwRU5ZNDlqYTlzaVFVZlM2bnA0?=
 =?utf-8?B?R09KTHhNMVlyNW5Rbkl5Mm9wd1c5VzVla2lqVU5YVnd5S2EvOWhrelIrVmQr?=
 =?utf-8?B?ajE5V1ZSUEZxQXF2NzFHdTBrOWR4OTVjT0NXMTVIR2RLWWw0ZUNSRVJ0djV5?=
 =?utf-8?B?bk1rK3JRM0N0NWhWajNiOVJsSFdhdWtGTWtWLy9ZR0orRGJJV1V5VHFBY1RM?=
 =?utf-8?B?aThFSzk5bGFra2F1Wi8zZThocnBZVWdDZUFkRGFSNnc0T1REU1VxSGpkZXQ2?=
 =?utf-8?B?L0x1MGFnQ0RwK21ncHovaG5NV2dTVGtlME9UUHdBWFhNSDdxVWdxamQzOHJC?=
 =?utf-8?B?ZW1xNm5sdU5VSDhLaEpJRXV1Z2FlTlVJZ0JmY0tlQlZOSnNZYWlDTFI0U1du?=
 =?utf-8?B?M0tEbzdjR3pkR1EySmpsUlJCZjRsYk1PWWFjbkd0bUVaL3FVTXRlRFVLR2x0?=
 =?utf-8?B?dng1ejIwaE1hanFrZVltTFlwM3RKVFZ3SzhmakFNQ2hDbDRKaUZaZkN1dEww?=
 =?utf-8?B?L2MxWWxtZ1pXWjlEWEdxWFNIWUpRcmhGTHlKRE1iemh1NkExMDR5M3doU2Jp?=
 =?utf-8?B?Uk1VRzluSXhlRzlyZGJ3djM5QmltM0JTc3RIUVdsSWdrV2t1STJtUjh1OGt0?=
 =?utf-8?B?V2JGS0E2NWZtWjRta2Fxam15NlJTRXJ1RGpsR1NnVVpuM00zZEkrQ2huOGZO?=
 =?utf-8?B?Z2diS2hUaG1BcjUzVlN0WkVFYkdFMHhRVUNIYU05OEQrZXhRV05iK0hWd1Bx?=
 =?utf-8?B?QjhialllbG9sVURBRjdoMjZmZ0J2UEpoT1FYOUd4ZlNzNS9CNGJUMU5rQUt1?=
 =?utf-8?B?RDBwT2s4NEJ6MWd3Z1NOZU55MGZ4L1hvWTZPeHE3TDBNYU0xWm4xQXROQnVE?=
 =?utf-8?B?WmFvQzdKMU1PY1ZVSElSZEVMVEpJdCtldHRBM05CZVV3VzU3amV3Q2h2SG80?=
 =?utf-8?B?aG43ZEZPS1k0ajVrUStFSW1JeE1vemJGcHUvN3pkU0psWjhrOWJ1THgvT25o?=
 =?utf-8?B?dDJCZ2kzQ2dDSUg5ZkpNM2plQ09qZjNZaXBiZXJaaS8reDJSYXdmL2RFa3h5?=
 =?utf-8?B?Qk5hNFU0UFVsQStESDRGYnF6VG9jRUhrSHNKWUgyWExqRFVSdGRCTjhXemVI?=
 =?utf-8?B?NVVzZUtKMlpJNzZNRE5JWGNhZldaNVorUURtQ0RKeVhucTJxM0s2dVp1cklD?=
 =?utf-8?B?TEVvS0IvMDR2MHA4RHNhK3pmaG41ZlVBZjgvcHNKYkFxSnZWeXlCVTg4S2ZN?=
 =?utf-8?B?cHVRUmNoS3dUcVRNdHJ0V3gyWktIcUlVNHRBbGhJNDVnRnVFZ3lUMVNCQmI4?=
 =?utf-8?B?NUt4STV3SHVRbGFuQ2QvMDVsUk5UY2h5SFN0RkNrTC9NOW9lTDRidHZrN1lQ?=
 =?utf-8?B?SFFCZU5jSXpxSHBTZyt5OFQ2NzFxWDJCRGwrN2UwSlpRUGJMdkhjbkxISkJF?=
 =?utf-8?B?UWhOcHVxTUFibUx4cnZDSlY1S0JQY3BPM3FEN0FFOWFWTWZRYlQySTZIOEJG?=
 =?utf-8?B?Ti8zYkZoYmdzS0tHbytJbWZUVUFwc25jQm1kRUtoRXRsZjhlbDBjZWZxeG9E?=
 =?utf-8?B?OFVCZTNhb2lpWFNQa1hCWlJDZkJNb1ZSc3RiRmhWeGNwY2lQbDhaSFVhUXpE?=
 =?utf-8?B?aTZhYjVGTjBNVUlsN1RSV2tyMjhIWkxOZ0haVGZ6MkQ2UWo2Y0xReWlPemZ6?=
 =?utf-8?Q?L38k1lgEVYadv0dKo5VjQy5Yy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afae173d-1d82-4f3e-06b5-08dabca3a99e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 07:27:14.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qreoW3+WtNUoTjbOhVrLC7/fkiPnif020EfQ+0YRw164tohvPyZFJvA4mYqt36ct3UyYtgI15IDLyzDSwVE6Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7652

On 02.11.2022 04:00, Henry Wang wrote:
> Hi Julien and Jan,
> 
>> -----Original Message-----
>>>> Somewhat related. When should we branch for the release and set
>>>> CONFIG_DEBUG=n?
>>>>
>>>> I think we would at least need a RC with CONFIG_DEBUG=n but IIUC we
>>>> usually do it at a point where the tree is nearly frozen.
>>>>
>>>> AFAICT, there are still a few things in flight (including fix for
>>>> XSA-409). So I am not sure we are in position yet to branch. Any opinions?
>>>
>>> +1 to it being too early to branch. I would suggest that the XSA batch
>>> should have gone in first and release blockers should have been dealt
>>> with (unless for some it is clear that they're going to be unintrusive),
>>> to limit what needs applying to staging and the new branch.
>>
>> I agree, therefore I think we can switch to CONFIG_DEBUG=n in the RC
>> next week after the Nov. 1 XSAs. So we have at least a week after the RC3.
>>
>> Does this sound ok?
> 
> Thank you both for the suggestions!
> 
> Just in case I forget this...I saw the xenstore XSAs been merged yesterday,
> and hence may I please ask for a clarification if you are ok with the above
> plan so we can tag RC3 this week later after master branch is synced with
> smoke/staging?
> 
> Also I think we need to submit a patch to make the default CONFIG_DEBUG
> to n in Kconfig? Thanks!

Iirc what was done in 4.16 was to switch to non-debug immediately after
branching, on the new branch only. That was specifically to keep debug
enabled at all times (and no undue code churn) in staging. Debug
intermediately off was (earlier on) observed to result in huge Coverity
reports, because of the perceived differences in the pre-processed /
produced code.

Jan

