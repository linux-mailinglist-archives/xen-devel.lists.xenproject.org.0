Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F143186C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212135.369896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRMM-00049d-5g; Mon, 18 Oct 2021 12:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212135.369896; Mon, 18 Oct 2021 12:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRMM-00046y-2O; Mon, 18 Oct 2021 12:03:18 +0000
Received: by outflank-mailman (input) for mailman id 212135;
 Mon, 18 Oct 2021 12:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRML-00046s-1B
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:03:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fc7ffc8-300b-11ec-82d4-12813bfff9fa;
 Mon, 18 Oct 2021 12:03:15 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-s5iKH-N4MrG5kwZW2097bA-1;
 Mon, 18 Oct 2021 14:03:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 12:03:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:03:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Mon, 18 Oct 2021 12:03:09 +0000
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
X-Inumbo-ID: 5fc7ffc8-300b-11ec-82d4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634558594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jGuSXYlFkJ7c3Ooq0r6g076LD/DKv1Q1sCgeAd3CfY=;
	b=enROS9nkfJNEWG6j4yuFGwIpd91M2p5NC2wc/OpN4NVi3l1QZjh4jXlovm6yXq8eHSASsB
	HCnkqHMmdOGYQqZCHJFw2GjWcxYV5Lw8GceHNqJ3MXwhYO5Bh5hrnoODjQliPIji1OS2dO
	17rVyYcECWm0JL4S3Gv1AHahsZ0BMQ4=
X-MC-Unique: s5iKH-N4MrG5kwZW2097bA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQs2ZThet4r2v3PZG1cQp0BOFny/Isl0vULdiTHTfnUyBdNluJ+DBGgwDl5oH/5NQmQ2uT0CGIoajTK0oVRtbnhKx+vVSKIlP1CFHEApVqQ9uHprZVAmmUok9l4mWAspHGsptjTpuJbspeBmPynld7+ywHM30y189l4wS7jFAtUBCTSmCGS4CPElvC2cj/p8SfSE360tEmf2jjzttOoaZFZbzm8myuVE+2IhBPJYpD0QAuW2mr5hnVntTXS9kWrQKUsLHEhherk6wHV8mFLOxf9nuD1bX+724T3qAMQIN5Rvmidi9ZUdQVFrMwFjNfcGrRgNjVy7w+GP74ydJhfmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jGuSXYlFkJ7c3Ooq0r6g076LD/DKv1Q1sCgeAd3CfY=;
 b=fQSHGq9guVeXz9qCCw0FAQk6rgwfDrLLaAgS/2GIug5ZsBjmLhbdCY+7ND3Xr4XqaAOEAzQka/ka2F/B4Gg4cwx5oDtLwqmoYtIXWqFAIaHul+6BuiTbBdy/SzdPc4xuQ8KwwSq22tElfaFnVwW3ObDo0EPl2E0EIZbZxrEh5x41H7g6APlls2ZoYFkDrdVaj4eL6PHBjiNyK51A/mYYT0F2RkoNyznk8qtkYYx6Do63DQEgStSBe98zAGOZiVF6UXTUmS57M9gM0eotREiSD6+dqg892PeijGmJi04QbjGwaGCcQFev3/kUq/yZ8VfGythc8GDmQzOwkv4HyAdW9Q==
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
 <c0b2ca25-5700-e915-471b-3816d12efbd6@suse.com>
 <129b1339-df89-44e2-2467-77b60e113882@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e7b9d35-ac50-c74e-dd29-050384094908@suse.com>
Date: Mon, 18 Oct 2021 14:03:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <129b1339-df89-44e2-2467-77b60e113882@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf56244-2851-4ae2-f27e-08d9922f40e3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742F23CCE12639282BDBC55B3BC9@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ebqSe9BouniJiVl4wSJ16ZgCoEHBhHxVSiZY1F78W9MO+L7MkS4K84mLM+o/eNhsHiVt+BZBziectugEq+lXqlJQpFBOTt3IrvoS3zJJpWBzPZRaoBtO8MoGDd1DCfYoX+szYxoXlEHHr08ZQKkXWw9gXTOXO/98T7Xigeb3ZHdG6hU4cIeHc/1S7ib2J8ER2kU66XHdjwrnEJB2SqLPIyoKFBS5E7z+vFU5iEfE2m/cGA590I4ok3XJvq3B/R4tJ89ec5csUCEmCAAmQWvk7xsoa8D/XK6YalaHajmS3E4pphFH8OillN6Fmxn3yegG9CgtAS37utJ7A13D38TFDlGS0Up9MaI8zffxTlolbb3jED74Yi0AXVGK4Az7UAKSgAiKBAX200pCW5QOjYaRY8YrCMZ8EmI8Bjv8G0+T5sCv1K96VCRj2ECMXLT5woFV4kb9rRx7Vq3rJVIFK19SPyK7wasxrqC4tLX9kODSoZXkvzo5JyJhxH8K7WVTvICXPCF+82YqEmvpAo2I+NyxVWVxXL35nRiP8fQRjaPLL2ibOHtW5wXIFBCEC829GQHhf+DXDkeyXfTCIew6UlF5Uji1PSxM69Wfex1ws/LZT4MiBdBm7aGA/sLSBnK6cNHDcB3zXLCoPD2uQWI/FoAUSLi0gKHt8vbL/vIUMtw7R9R2JNUG2ExObTOfwIsC7WpYejIQZoL7fcAnGQJUzeIRC6kSlEgypuhsOSw1CELWW2FHeC/yAFjMBmUuq8loKsTg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(4326008)(31686004)(316002)(16576012)(66556008)(6862004)(83380400001)(956004)(66476007)(8676002)(86362001)(36756003)(6636002)(186003)(6486002)(37006003)(2616005)(508600001)(8936002)(5660300002)(38100700002)(2906002)(53546011)(26005)(66946007)(54906003)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFB4V241SmwwTUhDeGNxRytqNzc0bVRLNjJaOXBNaDJJNDdjcmVka1MvOWhu?=
 =?utf-8?B?OUdKNlBkcWtxZHFmRzk1SDlNb0NvOFdqY0pUT0I5bU9EMDV5Tzc4bDdJbmN2?=
 =?utf-8?B?eWFyVElSQythbDBwY1YyVkR6eXQwYktPaENDaHYrd2dYUlJVMnhONWF0VFpp?=
 =?utf-8?B?eUZuMnpqTjhvc2Z2aER1WU1FaVhsZWw5WGpoYWV3cy8vYTZiL3NCS2xNMXBI?=
 =?utf-8?B?VC9ZaFI3dUlVVUdkaFZKRjkrRlFNeDlLTGNIcW8raVVQOFQ4VnZNUDluaVBC?=
 =?utf-8?B?OFZqTHN1cVQ2VzZYY3RDakpXVjRBdXZORDB5T3hPcU8vV3ZoNUlNUmxCcERO?=
 =?utf-8?B?TkRtYVU3Y2JiZ2ZISUdiazhaUFZSbEVDcTFwWnErS01NK3UyR2NQYkt5YkJC?=
 =?utf-8?B?NGdWVVZPeUJJSHd2a3YyT21hUkpxVUtNZElVSzVCNlZRbXBWMVhBT2JCRmMr?=
 =?utf-8?B?VGJMZ0dpM2JlWmpDSC90QUl0Tzh5RjBJbElrekhYUGxHSlV5MEJ1RmIwWVU1?=
 =?utf-8?B?bUZmYVdGR3BNL1RDZE1LcFdGVVMxMDhOYitkUHAxd1dCWUpFVENSdGJqQkRm?=
 =?utf-8?B?Um1WU2dlVFRyS0RFL1I1Qk5GSG9Qa1VLOXZvdUxOaXNQNHJBeEl0OFo0ZWMw?=
 =?utf-8?B?eEt2Y3JXM0pzSGVIRlpHN2VOVi83dncyeXA4bDMrb2dacGF6L2x2QzgwR0Rt?=
 =?utf-8?B?THA5Sm53Q3kvNnMwRWlwYm5wS2tHMHF4MzJDUm9WOVVweW1CV0VES0ZxVVdG?=
 =?utf-8?B?dEQ5WXpWSlNUS3JlTnVLbThkbVJGWlIrMDFuenRwelpZUHg3OXpjZUZpclps?=
 =?utf-8?B?VjZpdVpNNi90RVdIOTAwSi9FRDl5OVRLZGVtVU5wbFVvYXRTRWVMZEd4UXhN?=
 =?utf-8?B?eHZhY1JEeWY4Z3NkUGY0eU1xVis4WFB6SUkycnhtRk82RUk4T0JrYnJVRDIz?=
 =?utf-8?B?RFU3NUtaWDE1K0N3NnFpL0YwcnV6ZzY4cEdBM3FLR0kvRGswV3c1YXZQLzB2?=
 =?utf-8?B?UUU0Ly80SVhobGl0cVY2UENaN0o1WHZJQ0E4WUhLc2pnN3RXbGU3b0Z2Vk5U?=
 =?utf-8?B?emJsQ2JybXgyOEZoMDY2NjBDclRGWVVSTHg0MGtlcXVRQnJJYmJxeUNHVnlr?=
 =?utf-8?B?a0NYNXZmRVFTOHliTlJCYzlRQkxOaTA3ay9tRHFtWVJ4VlhCVHZ6K1BKbEI3?=
 =?utf-8?B?czRpUG43SXBKcnRaclRZMUJ2Z0FMQk5HZW9tU3p1RWVTSmZnRFFMQnZSMnVY?=
 =?utf-8?B?T3VVU0xUUHd5NUhHY3c0bUlPUitxdmNGU3ZxL2VrUU1rZkZOMk5pMk80RmtB?=
 =?utf-8?B?ejV6ODBOU21UL3QxSE5JUm1Ga0JvMDRoMGpiYzk5YnJzbWJScGF4aTJwN1dX?=
 =?utf-8?B?OEFYcjN3NGtESnVGZVJtVitTV1kwQmU1aG1pSmR2SzlmRWxZdmxDekxjQWFi?=
 =?utf-8?B?WWc0Wm5FaWVvbkpWUnovQVRPeVZNVTBJU2Y3Y3pqRmE0enI5ZEd6ZGQvWEg2?=
 =?utf-8?B?Tm5qRU9kRzZtSkFUcnhRQk5ielVuY0xhNm9CbENyVXNkUVhhRDFUUHAyeWRN?=
 =?utf-8?B?NjVQdklWekJydWhtN2VMYU9zRXVldzNOclZGRWkyd0FjeisxL2I5QTZRdTBI?=
 =?utf-8?B?OFFOOEp0RXlXRGlxTWlVNGR2c0hOQTRzTG93cDFVSVlaS01xTnl3Mlkvczlw?=
 =?utf-8?B?TVlqa1JOVGhSTFdsOHJ3ei9HNTQvTTBJQ0RVTTFGci9mUm1JbXp0Z1hreXRn?=
 =?utf-8?Q?oPFtchLoKyqZFtCyZw/QMuRapztxVm+7MJra+yk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf56244-2851-4ae2-f27e-08d9922f40e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:03:10.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSwuNmk6/3lVahd8bN3Dlqck2aQzrC7h4Ic0UwEogSc7MgkLDQEbyiRcmqdVy9kgtg+n/VP2Xe/pbrApFuLzyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 18.10.2021 13:20, Juergen Gross wrote:
> On 18.10.21 13:07, Jan Beulich wrote:
>> On 18.10.2021 12:40, Juergen Gross wrote:
>>> On 18.10.21 12:36, Jan Beulich wrote:
>>>> On 18.10.2021 12:28, Juergen Gross wrote:
>>>>> On 18.10.21 11:51, Anthony PERARD wrote:
>>>>>> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>>>>>>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>>>>>>> I have to think about that. I've made some further progress in order to
>>>>>>>> be able to build the Xen pvhshim without a link farm and notice that
>>>>>>>> nearly every source file needs to use "$(srctree)/$(src)"
>>>>>>>
>>>>>>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
>>>>>>> ought to be the exception.
>>>>>>
>>>>>> In Linux, the use of $(srctree) is indeed the exception. This is because
>>>>>> we have VPATH=$(srctree), so when `make` look for a prerequisite or a
>>>>>> target it will look first in the current directory and then in
>>>>>> $(srctree). That works fine as long as the source tree only have sources
>>>>>> and no built files.
>>>>>>
>>>>>> But if we want to be able to build the pv-shim without the linkfarm and
>>>>>> thus using out-of-tree build, we are going to need the ability to build
>>>>>> from a non-clean source tree. I don't think another way is possible.
>>>>>
>>>>> Is there any reason (apart from historical ones) to build the hypervisor
>>>>> in $(srctree)?
>>>>>
>>>>> I could see several advantages to build it in another directory as soon
>>>>> as the build system has this capability:
>>>>>
>>>>> - possibility to have a simple build target for building multiple archs
>>>>>      (assuming the cross-tools are available), leading to probably less
>>>>>      problems with breaking the build of "the other" architecture we are
>>>>>      normally not working with (and in future with e.g. Risc-V being added
>>>>>      this will be even more important)
>>>>>
>>>>> - possibility to have a debug and a non-debug build in parallel (in fact
>>>>>      at least at SUSE we are working around that by building those with an
>>>>>      intermediate "make clean" for being able to package both variants)
>>>>>
>>>>> - make clean for the hypervisor part would be just a "rm -r"
>>>>
>>>> I fully agree, yet ...
>>>>
>>>>> Yes, this would require us (the developers) to maybe change some habits,
>>>>> but I think this would be better than working around the issues by
>>>>> adding $(srctree) all over the build system.
>>>>
>>>> ... developers' habits would only be my second concern here (and if that
>>>> had been the only one, then I would not see this as a reason speaking
>>>> against the change, but as said I've never been building from the root,
>>>> and I've also been building sort of out-of-tree all the time). Yet while
>>>> writing this reply I came to realize that my primary concern was wrong:
>>>> People would not need to adjust their spec files (or alike), at least
>>>> not as long as they consume only files living under dist/.
>>>>
>>>> So, Anthony - thoughts about making the default in-tree Xen build
>>>> actually build into, say, build/xen/?
>>>
>>> Or maybe even build-<arch>[-debug]/xen/?
>>
>> I'd be okay with build-<arch>, but things would become questionable imo
>> when considering further elements recorded in .config: Where would you
>> draw the line?
> 
> Okay, this is a valid question. What about an environment variable which
> can be used to determine the build directory (or a suffix of the build
> directory)?

That would be fine with me, but as said I'm not building from the root
dir anyway, so people affected by a possible change here may be more
qualified to give input. Otoh if people need to adjust their stuff
anyway, they can as well switch to an out-of-tree Xen build right away.
And anyone building in-tree won't expect to be able to build multiple
flavors in parallel.

Jan


