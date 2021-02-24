Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA3323BC9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 13:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89316.168117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEt1L-0002wv-Dp; Wed, 24 Feb 2021 12:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89316.168117; Wed, 24 Feb 2021 12:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEt1L-0002wT-98; Wed, 24 Feb 2021 12:11:59 +0000
Received: by outflank-mailman (input) for mailman id 89316;
 Wed, 24 Feb 2021 12:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEt1J-0002wO-59
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 12:11:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6807ac2-6448-48de-8180-80bff69dbdb9;
 Wed, 24 Feb 2021 12:11:56 +0000 (UTC)
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
X-Inumbo-ID: e6807ac2-6448-48de-8180-80bff69dbdb9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614168716;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OS4744UASJ5jLuzW+p6RrPHDc6LxB2P5eZQPbwgk9CA=;
  b=LDm/tDUwuw+BlVFDic6/2IlYHqcrsB5xvQOaM0FeSiMCQYHZApJprxEu
   ptNMMvFlHgGdQUa5ya+v4yjRQanNkaE5TctDe5A+RAxr87x4Z8OY6cTZp
   yDjamq9p8jreA5lyNvUKw2oL0SjcKofoVwUbt3iOgP2IxDhx3MyvHDuXM
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wjH4aYhOaD0d+D9uPbYohWBCjdO1J14CjCTQ65V8xlpevPi/LO5wSI79L6DpR/s1llPSKijQS2
 glDDjOW38jwtQ9Ns65GuMuFEKoqArOGqW8xr0qRpMcMQmfnid47tbP2Xs7Fbfbs1Ap8eCZ7vSw
 T+djf96jxvx9purS2iiXXIeuH35FY5umCR0Hhz/qj3ZS6KzkKLebgGxB+BibIq6zt42cuvpFWz
 H1XkzKfsxcuh0tYlTPL4JZuktUGC3tD3el1z/shnTkzBy72tzZfRRXjB+FtC/qSUycjW1a361M
 wY0=
X-SBRS: 5.2
X-MesageID: 39303351
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="39303351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9mR7T4OavRkx9qi65hu8GjXxuYAKPcc1cB/aoB3b9QITIYdtwAb0q/fAjQXzaKCYZYCmqixDqMiAlpOKt8qQ5t7Jmilfk6cpjlAm9qn2vsH3MnhdYINYbuEmURCRbrzxwWQKwnmxbz9K9E6kJd7AVSSDYl0qpQS7psU6hmC+Qo1UohJe9FKfgeC5dU4i98FyOW2yJXV71ztDhOVsC3gfiTSWyZamQiTnaSOJPBEIn/+SAnZFXiB+yFlTT7rd3ebH72I3O0X68ZYHdXX/ZolyjxqxxjA0oyh/Slh/PhqjTmRu9ddxGANXaJ2SN0h6G3vtg9G5aEhHNu1T2zXEO0Yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OS4744UASJ5jLuzW+p6RrPHDc6LxB2P5eZQPbwgk9CA=;
 b=Jp2dTaWjzO7/dTzfHFGaZbnjg+4rB24FpQK+1wPsbKCv7oQQaDbPQkUp3u3rjxVAW5c79GWbeeCmmzqW5+Mk1ld8taf4HHNJrg9a4pMMKJwN+d08hzlTZ0UIoK54ieycGIKMWoetES7+J25y2p9eMZeuBOz0IzLlzxES9YqxrYwWaQ8JjZkZWn4rJakCWWmPb7dHfU8KzT3MKjh/716uPFXd9HNxgukJpA18KWIbwn1lFX9L/vBgYmtdtHZWhqaAjES6rVT2e7dGcI/vaPET4X2ucJIT3uGZJLroF3IIvEh/vw5CP4gV1h2WeQbgevmAX0hiflyZ79TdRcorX0opeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OS4744UASJ5jLuzW+p6RrPHDc6LxB2P5eZQPbwgk9CA=;
 b=qJtNTWnMOaw3eGcLRYEi5d6xVoDSWfcugmazNPg3jktbVcVduI4nAnrnL1Gms9hGd4YLaptWvQYi5mqNDgi1iL8eeQUvqn5EYh3Cv305XaTgEnmV/DY68lYC1B8UPOfBjdrv0c1R39odsYN2VLv0tLQMfmbE5rUtp5VJ13VgltQ=
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ad25d5b7-2f95-91f1-ad46-eb686cd4f397@citrix.com>
Date: Wed, 24 Feb 2021 12:11:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224102641.89455-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71947626-6ea4-4254-0862-08d8d8bd5e59
X-MS-TrafficTypeDiagnostic: BYAPR03MB4118:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB411826E77A0E58297D9E535FBA9F9@BYAPR03MB4118.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5funwVk7CgShPltMjUMe1rXviztygxGXZIxG8GV0NP2hp0DMR0JUw0mDhhH1416rWtjnkc6K6pJZZxlw4pMJ70C1uOWr2pi7wM8rqPL0FF0eFBzNMu3vpBqlkHaQ2buQLKeQ58o0B+NWCYPZ6N3ppRGvXPooQBWRr7/576NigcQnPs7MvdRQa1Rv8fNvIR/+xCRI/NtEPUAr/UxZLnwrGtzTEM0ICSzbcaBD2vlJNHojSvqMOWKKI9KFcDWYZQT8YNmKEmaoOftVZepUjZ+hxmZN66NdZf0c4Ky88yg+/vLOpuoOOC8j/b+U3CyBZUvY63pqtttxHdo+2Er/NcwOuS9pj09kiuDjqIcwmoS6ziLoVl0xRyvMoO2zlbKzFi9vMih23yx21jpRCq1L+7p0AS0NzcjVdcwM2vk/Su6rhAQVm9Fjr4fGUVoAfVni0m612USZdhSzD0g7AhDKpG6jyOq2ALXcONUScr8zRrJpBBCm8CiouLPu5KGzY1WYx0lGgZpId9JH546SjsAEsViyWAKGhU5sORLVR1rTd14dE8v/1ks9Ik4oLcLkukTUn6NuOijhyuLLFgs3UCrgh7xgEveAY56kUBUIeJnKZ3Rcg4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(346002)(366004)(396003)(4744005)(186003)(16526019)(2906002)(2616005)(36756003)(6666004)(4326008)(86362001)(26005)(316002)(8676002)(6486002)(53546011)(956004)(54906003)(8936002)(478600001)(31686004)(66946007)(66556008)(66476007)(16576012)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEtMOGYrTjhzMGZXVG55Qmc1encrTlZJeVJIaHVLQm5yNHNHc3B6bWY3bWFt?=
 =?utf-8?B?VWd2Rnhid1l0MEJ5Q3c5Umcyb3pUc0ltUlkxcFNUSUpGMjE1NDM2M295UzVM?=
 =?utf-8?B?RDlmamUxekY1QkhWdXFEbTRPMUxYTVlDbk10ZnA0dTNQVnNRTHJFOWR4QXd0?=
 =?utf-8?B?RStIdHlvTGNnUzJYWlo4dzI5bld2VmQ0VFZkZmlSTEZjeHZUcjhqOVhvWUdp?=
 =?utf-8?B?MnlBWUVic29uZ0FiZDZ1NmNJWFUrRlNCOFNUUmZ2ZmpJQVhkT2FkeHo5YTRQ?=
 =?utf-8?B?RHJsRy9BazU1NGZGOFBXQWxET3BuNjhvVi9qaFQzK3I1ek4wemV3aE1Id1lC?=
 =?utf-8?B?Z1pEejB3SWhkZEJ0aE5WSXVpTGRPZDBYdmlta011Vk96d2NlS1JMQlZLcHJI?=
 =?utf-8?B?ZEtjWklRK25ZaGhpcHZQYTdxa01YTXJZcUFhdWc3ZHJpNnJ0ZTFkN3k0eVp0?=
 =?utf-8?B?UHJZK2pWemhPUWNvWXBJcUlKcVF6dk1QY2FJSmxDcUUva1poUWl0T2VXek1i?=
 =?utf-8?B?c1hUQzRYUnZnMU1GaTIzbDRmUG4yK3RvVUpJR25QRyswOXZNcU4vNW5uS3N6?=
 =?utf-8?B?TXliL1AxQ3Zuck5yeE84Vzl3OFBEVHI2eHBMbVlSdzN2azhqZEVZRDB0SzVF?=
 =?utf-8?B?UkU5d1A1QUtBZ0lkVlpsOWhUM05FdVkvR1dTTjIrZDZWcWl5RXlLZDZZbHlm?=
 =?utf-8?B?VGduYnVrMFQ5eDhIQWlFQ04rVEpXMGpsWlBOTE1qVHFXRFZlZENZVE5YSTBl?=
 =?utf-8?B?NW9JTjNqWHhXaXl6R21JVXV2d0ZVMHNXVC9qRStibmlyNWExS1d4a2JrTmFF?=
 =?utf-8?B?V3FLUGF1RVFhc2gxd3NIbE0xaGN1encyczdSZDk2WlVTR2Npa2V6bnVFNUxS?=
 =?utf-8?B?Nll3SjdQYWEweDVmQVFObzNOclFYSUMwL1cyVFRTWS83Q25QT2YvaHdKWjEx?=
 =?utf-8?B?N0Z6dkU5UlVlV2tNRk5YM3BsWEg3ZUdhQUQ4N0REWGJRbkFrcTVqNWtTNWJN?=
 =?utf-8?B?aGExWWcwRlhJRDV2SjJ6OEJqalpQMFJFOHdpQVk5U3FkNjF3Q2h4REVXNDda?=
 =?utf-8?B?UnZxdlRCYjlxN1h1VGs4QzNHc2NqSXFkMndwWnB3L0d5MDUrZkR1d1NoYmhi?=
 =?utf-8?B?UWtiOUpKMTcrQkJjVFY5TWprcmJ6MGpOWUgwS3FDS0xSMWJ5dTBmYUpVUWpO?=
 =?utf-8?B?YktWNTJMSzhBdGFEQndBZmkvVXVJQUJxRjl1N3B0M3IyVERVdWZRcmZKY1pF?=
 =?utf-8?B?WXBZYTliNEpMZGgvNm4yY0FJMzhLSTBmVU1CYUZNSGU0NkcwNmpVeTRSQWpF?=
 =?utf-8?B?ZUtXbndWVUFoRUo2dGlZS0w1TlBnSEdLUzBhM0w1VnA2VTdCVUR0QjZGYytm?=
 =?utf-8?B?V3V5SVh0OUhOaWUrNE0rSjFmYjVHQUMyS2tDVmFGSG9FSGxVSTJXWjNWa1lB?=
 =?utf-8?B?SlhwLzdxMGtnVlBRMHROYTlDeXNGUjlBRVFRb2JVYXp6amZydDl4NUJQZHAy?=
 =?utf-8?B?SWs5ZDQzc0ZFWTluNFR5c0ZuRFdxZE1mUE9sZXJFVGNVZUl4M25qelNQOElp?=
 =?utf-8?B?cFRhd1U4dnZ2Q043ZjM1dUFtd3FlWjY5d1RFcitUQlh1bVQyWDhTRTdQQVYx?=
 =?utf-8?B?MlVTa0djVEk3MDdsc0Z3THdPdHpCTnZqU2RnZnQySkVxNGJPeFZLZko4bThE?=
 =?utf-8?B?M2ZnYkNWR3ZlOVgwQ0w4amtDL0NjZ1krQXNQNVg0UlVuSlpMcTRNckZROG9L?=
 =?utf-8?Q?LOvttnfdQdkF30PBckYdGxwm8q2KMwVnL3frqcM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71947626-6ea4-4254-0862-08d8d8bd5e59
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 12:11:51.9205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZswYrpIlGgzNZ2NejjqqitiLN0QtwZ9hEeKzwgIhE6AL9oC9FHPiOJeyLHDZvMCjTs2v7wJBiV1VBsYlS+6UfFE+fRZ3dtQsZAqT0kedyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4118
X-OriginatorOrg: citrix.com

On 24/02/2021 10:26, Roger Pau Monne wrote:
> Instead create a private types.h header that contains the set of types
> that are required by hvmloader. Replace include occurrences of std*
> headers with type.h. Note that including types.h directly is not
> required in util.c because it already includes util.h which in turn
> includes the newly created types.h.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

At what point do we just declare Alpine broken?  These are all
freestanding headers, an explicitly available for use, in the way we use
them.

There are substantial portability costs for making changes like this,
which takes us from standards compliant C to GCC-isms-only.

~Andrew

