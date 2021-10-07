Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A44254BB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 15:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203605.358750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTnN-0000n8-F8; Thu, 07 Oct 2021 13:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203605.358750; Thu, 07 Oct 2021 13:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTnN-0000l9-Bo; Thu, 07 Oct 2021 13:50:49 +0000
Received: by outflank-mailman (input) for mailman id 203605;
 Thu, 07 Oct 2021 13:50:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYTnM-0000l3-9t
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 13:50:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98bfccc9-e505-40a4-a5d5-29cb1b68f799;
 Thu, 07 Oct 2021 13:50:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-Jsb7GDOkP0eZ6HgK53IF4w-2; Thu, 07 Oct 2021 15:50:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 13:50:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 13:50:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0116.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 7 Oct 2021 13:50:39 +0000
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
X-Inumbo-ID: 98bfccc9-e505-40a4-a5d5-29cb1b68f799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633614646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bAj9h/7jwI6hBIU7y69gxIxdvhNRgd5qK3UkOxnrjQo=;
	b=S+UL6RAEkvmmiJ8p/mg2KG+dFIcbjPfn/qim6k/mQTk1DlqNgONnO+ZMhssWaPZmwLZZlz
	61YhBUj7T1XvLP78qTtmBNjRVK3kHOPRclUAIhyBm7L7gUoTHLmTFEyfn7fFonWG7xTOuS
	TKY+7adWU0QZf1keEwc+IjKS4dlThwk=
X-MC-Unique: Jsb7GDOkP0eZ6HgK53IF4w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipczeTryj0bexzB5rlXrOEHb2MvjxhEuGiPleSnFi24JnTUFT9nlpQ8x/MbXmBFxSq1XHtXL5/w5rppozHeo5ANVMutNbwP9jCNHkqNFxLBejV9ivOHc5qU4AInqbrajaLaflW0aF3INeJD32UyBHoIRdUcP303dMyukxTjF3L0IOXMrSCZzmkLYHFr0RKcZ8XSkAoHtbBgeSlHExneABAIpk5HiTj5SMVBLuKAzNUHjl4kXULFGYhWiim+C18kXQ8NH/wzbuheoKdN83/wzxmSaqJS9E1lix9TPBTvp5oySQ5o2r3t4YVEHtoIlZgi4X2BnaeaXjAeJy5BwT2myjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAj9h/7jwI6hBIU7y69gxIxdvhNRgd5qK3UkOxnrjQo=;
 b=kCbfWhu6901OHbXSjyPJm4PBctC9JJ+tGoOoJBULWy3hXILNxo8dtRs0h12kite1W5siH2Sog1ss4Rxl732iZ5IG7yNYKxCHlDJtMcyl3YKpF/3TJHy39y7tC2WyomIa5Yz0c4y3pjf+n6K66tsCbQfGW4KIuhL62dty6LKQVwgoH/j+3ox0J5c3kg/AUGlVnwvhU2BlF+YxwdUQCSu/aAG+7vwisedW7oQIhgW2Bg+gtVVQuJPTSMBtFhz2dFaaR3NZxdIVrBWTs8/wgYhoX6kUwlGTN/+qIaPHg61BAOQUrsJktPpwykkfRl0K+EYVmZ4OdX6QxRKOmyK7xp7tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
 <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
Date: Thu, 7 Oct 2021 15:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0116.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a7d8e3-3c44-4c5d-92a0-08d989997322
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173D56B035153177FC1B7ABB3B19@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IZST2X2hOu3f8iRGkGVzLfK+NZkExjhOiaa5u7CnMcaDx5MirXLbomXFKm68AHLFTdxAHOdxtdf4F5irE51w8WKxNFIZ95bTznbqk6PLGm5zVPfapPiAiicGBz5QyafPH3hF5rXHReV1IoI/p2bjuDxDSOHUNNjt15BQ2/Rihhm3upRLJ6uJ5x2Tc/vrwscZqvQTV9bx2pta0bA5rt/5I9KUdjTlqI6xz+Vn8nmI/gVcDzlnGhN2DFTOxjq8avPsYkkqGK6Srhzp4tvKL9zaui0F5C5ByO32Blk+PLyrk+pH+PuIEm/ysyI5RD3fcm7SMd+afRloAC5/UK4iBk+pvcthIszrfOIz1RHkIJEP55jsg+OLUUBDoV2CZBI79uBml070+WTt0z6n7Tb6a34FCPPYhj2TbwuH98Kv8zdifvOV4q7/zSfnrQj8aETIc6svt5lFVWIxLdR8IrSEvuv/4/VE+lBQaHQT4GM4qxWIE8/kmwyigBSiC5+WB8AEmPXnlmVPTTkLeaqUzFIdIsb50ywky7ItGbDfUeiebVgA7f/MW54IHtb4h/9wfKN7u4fz1rNCb3M3HoN9nlnVpBw+ecNG0XdivgnAjVz1Ze1w2zMCZy+xkyVrwu3tN2sF6QKXg6rOAggg50AmeM0fHaY1oBBTrgLQ6s63LbTvq4JYY/iPzvKdtV+sXBWiksvpNqVDFz3qYk/AvvCCVcfI4aqhc3rwJek8FFMGkErjHl+HzUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31686004)(6486002)(8936002)(4326008)(2906002)(186003)(31696002)(8676002)(86362001)(316002)(16576012)(54906003)(508600001)(2616005)(7416002)(53546011)(956004)(38100700002)(36756003)(26005)(66946007)(66476007)(66556008)(83380400001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZFOFJTNWc2NjVTTFNBMGVqZjdMaGQzQk1uMXFVa0JFVW0welY0eUE3L0hw?=
 =?utf-8?B?ZXI0NlF5QU1oVGdwSW4wUFl0MTZma2Z0NE5mSWdHZFRvZmdnMTVSS1RZRy80?=
 =?utf-8?B?aHd2dVlnd3UxZHBCYjRBN0lWOVBaUlVIVjJ2ZUFuZDlXQnl5blRCSExUVC9F?=
 =?utf-8?B?NzNmUmxIM3dUQXBpdU1teDhMTFlFZEhhQjRCTFB0Sng3R0pCV2RaNm5uNy9N?=
 =?utf-8?B?bFplM3RaWVNjZUZ6Z1BNTzFmZXRCakN3OHNINWVEY2YrYnRJWHVDT2FpbVMw?=
 =?utf-8?B?dXFTY2Jhdk9mRGtIdkFDb3hUU2MzKy9WalQ2RmZGdTBac2FGM0FMRzRvdmpx?=
 =?utf-8?B?WkFwNHRzZW04YkxocnNDaTllWG9DTjFIU0M3OWhPQ1lqQVVMS2xlVmFZZThV?=
 =?utf-8?B?dVhNNmdtaXBVR3JkQ2tBM3d4eWhCZmhFSWxDRWZobHl2YzRyRjZIUGVDbkpQ?=
 =?utf-8?B?MmU5T25UaGlDSTFmSWVlcFdNSkdUNUluc1lZaVBmT01iYnY5cXlFbXFQWHdt?=
 =?utf-8?B?Vm5xdExVaU4rNENjZnlsR0YwU3czNXQ2RThTSGdVa2w3dnIveitzRkRVTGVn?=
 =?utf-8?B?VmtjL1NEK1lmRDFIQnd0Nzd3RWRpbDJDRjZMRWNnUDFJSndTaCtHdnY1NHNp?=
 =?utf-8?B?U2ptWlFQSWZQVFE3SFFBNFNtSXg3ZldjanRncUJpeEFIY0Mrckh4QXpRK0w1?=
 =?utf-8?B?ck41WWRYRmgyWG5ONVp5OEVaelBNcUtlajZOZUxnL3J0d1llVFhDYW1SY2dk?=
 =?utf-8?B?eXBOSGtQZnZxd1JXTE5CS3J6anBEWm1jRG92ZFpDckVmM2NUS29XdjlnZWs3?=
 =?utf-8?B?VGZic0V4L0lGMkJxOVZ1SVJFekJsLzkvOVVRWE5NWE1OZ3JGd291VFJhTUJR?=
 =?utf-8?B?eUZoMFNtd0FmdUgwYlpTRGo0d0JzeVc3K0xuYmtOdkx3NFY0cFNOcGNxWTVG?=
 =?utf-8?B?VEJGNVR0R1FaV0dTbWlyTXI3OVR6VlgrZHdrRHJnMTh1dVBnemJpaWxsTmZy?=
 =?utf-8?B?Ny8zWVpuQ2N5VE41aWo0b0s0YlhKTEU4SW5FenM5dzQ0b2w5bEJjckJaWjFm?=
 =?utf-8?B?L3UyTURBSlhlaHBaSUhGc1Vic0VMUGh2TDUrRE5lR05yV1VYWUw2UktJYVQy?=
 =?utf-8?B?dlV6NWoyQlF6VVhaNUFsbTUzT0tiU2p5bnRIRVNVZnlWVExEYnZxajRmVHFH?=
 =?utf-8?B?R2xRbTdmdTFaay92UHdxandYVGtEUUdrd0ZIOExDekJONzB2UFR0dEkyWE1j?=
 =?utf-8?B?VDI3czdNNHluRkR6NXZzWnRpc0VZM3Z6b0tJTEpOeERtQUxPL2tKaGpObGhP?=
 =?utf-8?B?YWhRWXJrc0RtcTYxTzFzUkFzSCtnSlRDeEg3Rk1kUUlsV01OTkFhVE1aUU9J?=
 =?utf-8?B?aXRibWhaRUkzcTgxcEZyTWFsSEw1NXJPWXUrYlFNeHRqakZUcmgrSG83V3U0?=
 =?utf-8?B?a3c5ZFpyV1hXOW5BWkExaHcwS3FqOW9nYzhTWWNHdlFnQXFlRzM1TDJXSFlH?=
 =?utf-8?B?TG1oS0RHZTJLd08vNjgwUkJJdU9qQ3BoeWZ4cU9qM1BJT0IvenA5aHdzcDU1?=
 =?utf-8?B?VmFyWDBPbDhhMjhKaFZFTVl0NEo4dVJtM2xmdlFPYUNlT1cwSHliNndQV3NP?=
 =?utf-8?B?bWlaNDhwTEN0aENMcFNHQml0SVRsR21ubGF0RG41MzBoMTJLU1oxNk53eGhh?=
 =?utf-8?B?WmtkY1pvd0paUGFuRk50MkNJVjlzMWZEOWtlTUpNTHBnZnRaR1ZtZW80d0dS?=
 =?utf-8?Q?dJw2eCUESRKk8AJLLcdu/Mm2J1ulfZYzS9ZuoWI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a7d8e3-3c44-4c5d-92a0-08d989997322
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 13:50:40.5512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WnQ8nvT9CZ8teOYncyxevvBZsNJ8xduw458DdJtewCf3XDjT0efun0L8UfbtAnlZvc+je2j2ZZl1dC5/kBN4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 07.10.2021 15:12, Oleksandr wrote:
> 
> On 07.10.21 15:43, Jan Beulich wrote:
> 
> Hi Jan.
> 
>> On 07.10.2021 14:30, Oleksandr wrote:
>>> On 07.10.21 10:42, Jan Beulich wrote:
>>>> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
>>>>> Changes V4 -> V5:
>>>>>      - update patch subject and description
>>>>>      - drop Michal's R-b
>>>>>      - pass gpaddr_bits via createdomain domctl
>>>>>        (struct xen_arch_domainconfig)
>>>> I'm afraid I can't bring this in line with ...
>>>>
>>>>> --- a/xen/include/public/arch-arm.h
>>>>> +++ b/xen/include/public/arch-arm.h
>>>>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>>>>>         *
>>>>>         */
>>>>>        uint32_t clock_frequency;
>>>>> +    /*
>>>>> +     * OUT
>>>>> +     * Guest physical address space size
>>>>> +     */
>>>>> +    uint8_t gpaddr_bits;
>>>> ... this being an OUT field. Is this really what Andrew had asked for?
>>>> I would have expected the entire struct to be IN (and the comment at
>>>> the top of the containing struct in public/domctl.h also suggests so,
>>>> i.e. your new field renders that comment stale). gic_version being
>>>> IN/OUT is already somewhat in conflict ...
>>> I am sorry but I'm totally confused now, we want the Xen to provide
>>> gpaddr_bits to the toolstack, but not the other way around.
>>> As I understand the main ask was to switch to domctl for which I wanted
>>> to get some clarification on how it would look like... Well, this patch
>>> switches to use
>>> domctl, and I think exactly as it was suggested at [1] in case if a
>>> common one is a difficult to achieve. I have to admit, I felt it was
>>> indeed difficult to achieve.
>> Sadly the mail you reference isn't the one I was referring to. It's not
>> even from Andrew. Unfortunately I also can't seem to be able to locate
>> this, i.e. I'm now wondering whether this was under a different subject.
>> Julien, in any event, confirmed in a recent reply on this thread that
>> there was such a mail (otherwise I would have started wondering whether
>> the request was made on irc). In any case it is _that_ mail that would
>> need going through again.
> 
> I think, this is the email [1] you are referring to.

Well, that's still a mail you sent, not Andrew's. And while I have yours
in my mailbox, I don't have Andrew's for whatever reason.

Nevertheless there's enough context to be halfway certain that this
wasn't meant as an extension to the create domctl, but rather a separate
new one (merely replacing what you had originally as a sysctl to become
per-domain, to allow returning varying [between domains] values down the
road). I continue to think that if such a field was added to "create",
it would be an input (only).

Jan


