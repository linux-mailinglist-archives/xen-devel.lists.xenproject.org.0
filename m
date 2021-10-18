Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4DB4316DE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212057.369797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQUb-0001Vs-Dv; Mon, 18 Oct 2021 11:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212057.369797; Mon, 18 Oct 2021 11:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQUb-0001U1-AI; Mon, 18 Oct 2021 11:07:45 +0000
Received: by outflank-mailman (input) for mailman id 212057;
 Mon, 18 Oct 2021 11:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcQUZ-0001Tv-OA
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:07:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d0b06a8-3003-11ec-82d2-12813bfff9fa;
 Mon, 18 Oct 2021 11:07:42 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-FXxs345tOsmPECR3zuGo4Q-2; Mon, 18 Oct 2021 13:07:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 11:07:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:07:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Mon, 18 Oct 2021 11:07:35 +0000
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
X-Inumbo-ID: 9d0b06a8-3003-11ec-82d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634555261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpcXY7D0Qn9/lHPEEz/SfuMrsgtPEGlefunqWPTLDvY=;
	b=dOtNwnBk0mha6R87TVCxjo0iiH1eguXQC43CwwWnl+yrkCpgTJ7eFb0JpxEjgQgZG6PgV4
	Pdjv9BNGUwydrTeJdfOw2QZB97p7EyCzQfAVCsuaq4WXT1tyoTp4GaERE/y2ZoO5IS48/a
	+KWmtFp1ngqEoyJIHxtOC3+0QundwQM=
X-MC-Unique: FXxs345tOsmPECR3zuGo4Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB7k6CdEfNZBPDsPGXY85pqS90Y9iTxaCptC1a9c8KBP6yaL2sJDBo2qwu1ThEncNVM4gcbTV/YIsCZruAeOuAgXLJ2a2G8pq6YwjeSiCwnyaFIdr2o7uGqhz52zw60e2gJgIvvV2l2VBTLZrUqmoXBZmbwSry9LhhDM60emsN5//+5NDM58szsWQEvAE5Bc19lrYCAH1dB5eIFSoXvIdd8ufI64l/la2hAE41XA43Kt6Bi2UZfy3MCKby20O0yDSHENkM/P9iBqAUL1wRgNQFan4qeYZEiCMFzs5GcxJIyX5LULSWHQt9Z8utrZPdtTfAGkSMBx8S1nD5zD2t/nlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpcXY7D0Qn9/lHPEEz/SfuMrsgtPEGlefunqWPTLDvY=;
 b=JSMPXHjYjoEyQOCBGbeuSQ36IljApMPYjB7NRPImFdyJoclhOLQTHZfj/WdDieAlWir5RDCvwnU/cOccEuYkQbo4Zl54LYZ/z72BuubioFqDZEvNKC0JQD6rtBPNpd+fT0haNoLzs9RqRW+VjBEBViqJQ2sRIoQVj0OIwPtd7T8F3MgKz/nIvLEg3ntNVEp2LzQdv4gc3Jd4Vy/Fn2Iw2tJAxRinvw3XoAdWtW4KQpnFcMT0xB70e1FQvLlZ3Ky/Am6r9ut/wtm3zuuQAKXaqTZveYYFjuem6xpsymlEWWkqqQMwbGFcCqHf09KkOCYQTE4w7n7cYgnq7ytwHA3jZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
 <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
 <9f3f6d5b-b920-911f-fea9-66fb36a09e5b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0b2ca25-5700-e915-471b-3816d12efbd6@suse.com>
Date: Mon, 18 Oct 2021 13:07:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9f3f6d5b-b920-911f-fea9-66fb36a09e5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15bfbc0-d298-4fc0-024f-08d992277dc2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472F46349686BD47B7A6C7CB3BC9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GesojIiWnTXeYVZAEllJZiEpPHA0WcxyXP854jouxp++atao0sAAmVfxA+mMarjNQTlCsaYu7AoULr/HlMcKlxzF0BQZ8GcBgTb9x/U6eRCBk15aYbMUgnKJwXUkKHptyiQRLxiRj2n8YcEEowiccm75PAu8ljQYJs5X3D/RzWoCkztmxTShtQC84+ZG8PtxpFga5kn3kOQvst5aV/W2l7qLPkoEN2jd11AcgflQzPLm61xdXfKbVjyh3mAvLEfh6i795J050EwtuupqyOKBhHkpy69O7Js8LflKb0LYVotPBgKwj4u64ONIMMOKG+eN5ERof/IOf+ZCI5twWjWLAFA1X8STkSvWUDgwtz4cLBEJWNPZjW0UMBSv8NjosvItHuwx+FZ3KaY46okco2tM9I1zlT7OFf3ksXfZZNpF9/AxLOTqV1mhOtgtHbyKD89+s3oFSIOyp1+QE3gce7oLuKLGdeaIfJ4fylkUJCnby1AuSjd+cdKxLc2VPqwtMG0Vhrln+wPL1PVj2zkKpqBNgT23cr6k/lB1qa4IPKcaXN6RpIDfaarhWgEobGIpRftSZVY/EQn5WC/qpQOfMCGIOqfJZgw/3a+OuNHmQmVkx4TXk8Bt8i12yx17UOlmR0YJRPqhB2wWjRfAE0+lJo1nvxuEUinG/WKSUloZP9U7t0mavQ3Vcz1081pbDasL8wfDPW5EcKH+7U7e2t9IHZXeSIHPuIctdwyxGnkLRr0ID1FjYeR5bPC4ixR5PXq34oxa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(4326008)(66556008)(36756003)(66476007)(2906002)(7416002)(6862004)(16576012)(316002)(508600001)(8676002)(54906003)(38100700002)(83380400001)(956004)(53546011)(2616005)(26005)(8936002)(31696002)(31686004)(37006003)(86362001)(5660300002)(6636002)(186003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2hHUEZOMGhNZ2tnaG81YUI1ZzEwMXd1dVU1djlnRXphKzJUZUEwRDRlZmc3?=
 =?utf-8?B?amZVNGhlRHlnUDZKVVlVckNaZ1JCYndud2RYWTFoSzd4dVBCWnhjQUluNVlq?=
 =?utf-8?B?eGRTM0hpaDcvWTNkWkduVktVYy9lY3hab2dTUlRTRkxoc0V0UFRLd2greUJ1?=
 =?utf-8?B?YjFKVGpjOEhaRWxxMEt6LzJ4YXV4SC9KOEZtcVN0Y3VBS08zL1lEYmxJQkFK?=
 =?utf-8?B?dng4cDExczI5ZEtkb2tJNitEak1ydWNLamVwMG1hMUpybVFBVWI4UkprSUFL?=
 =?utf-8?B?T3dKb1o4L2xDM0lSbXl4UzRXcmpRYWdQVm85Q243VEFFVXI5ZnZRQ2pxL1VQ?=
 =?utf-8?B?Y1hiNEVwUm42MnVHN0FvQXYyeGYyVnQ1WkJ4RmJsQm1GUVBuQTVYSUFnblZz?=
 =?utf-8?B?a3dualhNN011SzhBRlNYZnJwSm5SdVlCcWJpSVpNL091TTVwRkpUcGV1dWkr?=
 =?utf-8?B?S0U2RkdLZFcvWXgzU2FDQzdHRlZOaytyZVovVjhEQ09NMTVkNVlTbkNySTVC?=
 =?utf-8?B?cTc0UmdwVUZmTmMySThlN1dZaVRIYnFtQzdMdHk5cXZVdHZZNVg3U3htdnhU?=
 =?utf-8?B?STFPT0VMSWcrZDdUQUFEaGMwdkVST2tFdzk1UmtSWFlhTTJHWnpqelZGbUtB?=
 =?utf-8?B?ZjhJWlJFZEdrTGJoUStJNU1STkZGK1l0WnhJQVhFRVFhQlZnaEdmWFlmbHJa?=
 =?utf-8?B?OG5JYWVPQjMrQld3VTZHVHVoM0h4cHBxQmdSbHJ5TTFTZUFOeitZTnNPREw0?=
 =?utf-8?B?R2Q3MTRKcmVwaDRoZEN6MkVnZTNlZHpSSVV0WFFVbllLL0NDZ3llYmFGWlQ4?=
 =?utf-8?B?ZWZEOUxlekUyMXVOaWRlS3BDSXZwQ24wVzZ6cUNURkpLcGg3TWZrUkRaL25u?=
 =?utf-8?B?dmFOUFFISllMNnk4T1pQb24wNTdtdnFZamJjWk1sVHZHS1N1TTZkSWw4S0d2?=
 =?utf-8?B?aWNhdUJQZkw3OVRMeEdCT0NEODIvL3dHNU9oblZoZzFVdEV5dFpXcDc1enBv?=
 =?utf-8?B?WkFPUHd4T2JtMUJGdkJDRUcvUEovbDdXNjB0MkVqWkJTYndHUTJKY2p0dTI3?=
 =?utf-8?B?K3hZU0JlVTVnZVNaWHg1WGFJZC9mTTVJeThWV0lzYkEyWlBONVloekFwT0FC?=
 =?utf-8?B?ZFI3RncrbjZaUUgrQjRFVEM2dUI4MTRtbGVJZUcxd2ZuU0V4Tm1iRFZsaWJ2?=
 =?utf-8?B?UmMrcWlpaDgxbkxmd2l2QThMbmZ2VjFWZnFoamVWblg2LzN4TVU0NERXbzNi?=
 =?utf-8?B?dmtKM20vMHJuYmJvbUt2QU45dGs0OVFXbFd0RENhTVE4ZUpuN0tONENDRHBE?=
 =?utf-8?B?dnBvcjZYbEtyNXo1eS9DRElIK0NBR0U3SlpEU3R6UzVKVmpQZ204K2JtU0Rx?=
 =?utf-8?B?Y0hKbUgzVVBYTC84UmYyZDdpOEVKUDBsa0RXcHliRHFxUmxBWW15U1hic0ZW?=
 =?utf-8?B?QUczOTBHcTk1TEVhNFZrUEJ2K0ljcjdDTFVJam04OVhCalF5Q3FBRzdIZzVp?=
 =?utf-8?B?aWJHRmo1OVAwTDNVTG9ZWnBxc1ZDd242b21WN0ZpQTJ2VUowMUcxSmFiUU1H?=
 =?utf-8?B?TG5ubEJFaFg1ZkZpUFh6cFVYbHJlTFluNEg4R1h3ZXV3bjFFUUxxaXg2a2FL?=
 =?utf-8?B?V3VJZnAwZ05hcnJOL0Rab1pPMGJPYXloZy9jaHpiS0ZjU2d1M3FDbGVDRzdN?=
 =?utf-8?B?OTNrZmQ2dVlRclhMVi91TjdMUGxEaTFzMldmdTVvV2pndDYzQjRVMExVUFVR?=
 =?utf-8?Q?29o28YhFcli8zmpsIIG5bU7wNDoj+0fUmGwq7/Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15bfbc0-d298-4fc0-024f-08d992277dc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:07:36.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bp2eJY2KtNCgm6SzTQtwJbG8ZRobcvSmAO8/onSHGc/E7RcpTdSvpJXOM1mo2rh1iZwwCGdNyA6lU9Vp21eRrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 18.10.2021 12:40, Juergen Gross wrote:
> On 18.10.21 12:36, Jan Beulich wrote:
>> On 18.10.2021 12:28, Juergen Gross wrote:
>>> On 18.10.21 11:51, Anthony PERARD wrote:
>>>> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>>>>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>>>>> I have to think about that. I've made some further progress in order to
>>>>>> be able to build the Xen pvhshim without a link farm and notice that
>>>>>> nearly every source file needs to use "$(srctree)/$(src)"
>>>>>
>>>>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
>>>>> ought to be the exception.
>>>>
>>>> In Linux, the use of $(srctree) is indeed the exception. This is because
>>>> we have VPATH=$(srctree), so when `make` look for a prerequisite or a
>>>> target it will look first in the current directory and then in
>>>> $(srctree). That works fine as long as the source tree only have sources
>>>> and no built files.
>>>>
>>>> But if we want to be able to build the pv-shim without the linkfarm and
>>>> thus using out-of-tree build, we are going to need the ability to build
>>>> from a non-clean source tree. I don't think another way is possible.
>>>
>>> Is there any reason (apart from historical ones) to build the hypervisor
>>> in $(srctree)?
>>>
>>> I could see several advantages to build it in another directory as soon
>>> as the build system has this capability:
>>>
>>> - possibility to have a simple build target for building multiple archs
>>>     (assuming the cross-tools are available), leading to probably less
>>>     problems with breaking the build of "the other" architecture we are
>>>     normally not working with (and in future with e.g. Risc-V being added
>>>     this will be even more important)
>>>
>>> - possibility to have a debug and a non-debug build in parallel (in fact
>>>     at least at SUSE we are working around that by building those with an
>>>     intermediate "make clean" for being able to package both variants)
>>>
>>> - make clean for the hypervisor part would be just a "rm -r"
>>
>> I fully agree, yet ...
>>
>>> Yes, this would require us (the developers) to maybe change some habits,
>>> but I think this would be better than working around the issues by
>>> adding $(srctree) all over the build system.
>>
>> ... developers' habits would only be my second concern here (and if that
>> had been the only one, then I would not see this as a reason speaking
>> against the change, but as said I've never been building from the root,
>> and I've also been building sort of out-of-tree all the time). Yet while
>> writing this reply I came to realize that my primary concern was wrong:
>> People would not need to adjust their spec files (or alike), at least
>> not as long as they consume only files living under dist/.
>>
>> So, Anthony - thoughts about making the default in-tree Xen build
>> actually build into, say, build/xen/?
> 
> Or maybe even build-<arch>[-debug]/xen/?

I'd be okay with build-<arch>, but things would become questionable imo
when considering further elements recorded in .config: Where would you
draw the line?

Jan


