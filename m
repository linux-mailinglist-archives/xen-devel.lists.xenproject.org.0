Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3C32430F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 18:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89454.168505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExnI-0001DP-IH; Wed, 24 Feb 2021 17:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89454.168505; Wed, 24 Feb 2021 17:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExnI-0001D2-Ew; Wed, 24 Feb 2021 17:17:48 +0000
Received: by outflank-mailman (input) for mailman id 89454;
 Wed, 24 Feb 2021 17:17:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lExnH-0001Cx-08
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 17:17:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50c91e98-ec7d-4daa-9627-2bac5b37c343;
 Wed, 24 Feb 2021 17:17:45 +0000 (UTC)
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
X-Inumbo-ID: 50c91e98-ec7d-4daa-9627-2bac5b37c343
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614187065;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bi6/WIwFlM2dqentlGOGq4wIu4dVsJLaiWfe7NRehqY=;
  b=FmNmNOpwV0M52g7y7OksvET6RFwO+7jqQD95ZIH7SnbJZgNSX3e+8SJA
   wHNL0TlYwnecIhxK1RNxUE4x0nH34s9uHSEHN4+vP9Jj2RgjErLY2fnag
   4Wb1xgStRd0Pfxjep/627BxxaZ5DGBule/mQ8IHY9V2gv04bz+R5U6n0R
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3DrsMFT3EncQfCKnrP4NXFbiKnzgfoJNu3K4zqLl5DB4KIEwgULSG6VKW6QDpTVwne/yuJvvDS
 P/3+QAo9iQcnfpycNnM3RPWiASxeWZqHNsi7XAYzOGzoqZ4+JgyDKj6xbstt0CsTdeh9IgaX03
 xb+gTW7FZCi3+goeNS/9pz2X6okn/6EILB1SrK9Jr74BufzOPIDOqqRyy0CpQQr6qyVDe/ZGqj
 nTENxzWu4Eex8T9XF63DAJnUqlWdD9prlCKAD5rlzzgMSg5vzGrmJpmk+HWP3xLBudQOUEiVPl
 W1g=
X-SBRS: 5.2
X-MesageID: 38312626
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="38312626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+/m3fhtZwah0ewvkzgDRzNcOeo8R/pa0CFwReu6fCBoYv/Vo7qLC9EqoiuLMq2PDdtKSEGRfgWnTYEKDfi7+cg0dk4eoeveE1OFqZBpnIFuuEdeCgXbnbfOzW0mYTtKHwlIptdJQUpOlUBMqVx/73QHNsN+nf56tFkSoBdl1MOyVypv20ePIZ2ccofvdfa3b+uhJ1eYVwdpRDvxcZBSKvCDnK8TisqKwitNnDsFb+gtMRdGrCYNYAsLKhfR+TPhbdcNpXAkkZdBxOXZvrrv76wq5METg3yiPQ6HtStxMh3TDYujOb2xBTRi0P6UHRB759DwkXRGYbubUPqQlhUvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACRe1/lP/czR45NXkhQIJMh21DLYFMN5IrpyGguX+ck=;
 b=N2EsGR1ivCwFjr0bVh26dLy33LdefT5rhjKH3vQfcepyU/CBYus047gFTgGt0uDDFWrx6UVpmutexln8c1yWixN4iW7IzrLVH7QPg9yABlZpfWBCrPOB5ZZ1r4fi8L4NUDXPw8Qn4o1Y9UaxmmD89geI237tD1Ysak6f1wDHXBBJEQuNzzzzFl8DcgvdC/cTJZIIEsKjF4LBTM6BTidCfpLKMzRnp8m9qxfs4Op33fYMjoCwJ+4NzLqfpYouHTDT7MK1EqkrvSA4gSoOsx44SRMvMffto4ip/bCHxiKKlKF0U3OzDnvF9XuZrUI53pblumpQfaClgx7G0uFKOzlK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACRe1/lP/czR45NXkhQIJMh21DLYFMN5IrpyGguX+ck=;
 b=Is8x3gOWvC+aR3BBLQMOKhAQMcKs7LmM2bT6y+RIwDmRt6Tf58Y/EDZabMoIQla0UmXXNo3BMnIcm7M53FOgpYg6IpuDrEFouCusB9TFn1gaEqhR3zVEAkGOHUHa0FvuCfDUzcK0IzkgLhU0FhnycZ2D+vtQQt4bwWmf6vVQtZk=
Subject: Re: [PATCH] x86/EFI: suppress GNU ld 2.36'es creation of base relocs
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <6ce5b1a7-d7c2-c30c-ad78-233379ea130b@suse.com>
 <53c7a708-1664-0186-1fd6-1056f8e7839c@citrix.com>
 <f8e56c90-f51c-01f7-0987-4c0697a17bb0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a35dd0b7-b804-9c75-b93c-e764345df46b@citrix.com>
Date: Wed, 24 Feb 2021 17:17:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <f8e56c90-f51c-01f7-0987-4c0697a17bb0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0123.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42bd2478-b8e7-4317-2b7c-08d8d8e817b6
X-MS-TrafficTypeDiagnostic: BYAPR03MB4549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB454944243182E99D4DA1E8ECBA9F9@BYAPR03MB4549.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +tljV57t7OJzBVUWSMYuOB/YiUGY8yGctoOKef25oAvducfwQTbXVql3lcf8gYMjEyguAXVmmraxcdJrfqprhGu+HJ45RuO3+tO3jQVPKWwwWqQ/u1coIXu1RMwKStys937I+eBFvElLZl/OO+O8eWZXtp0TpBI5xNcE7n4tQjcZvfzDG1st+xnB1bu33zR7o6GPvbg3LpzEBYMDfRafkJRhp/Tb2J2nt5lNZgMW/88/dXf5+KEEkcLHYevN6BQtB9rl6/lAkPT56MhUv2nFa5vf0QpZIitoXFwXi6ly7SR7wWD9zlykFJ03728mTHOdJq9N2VT/vz5wx1Ivd7kTlr6Mw7+GuKXuGiHKNUJogkey3MM/6k5jw1jHiD3TPU2IgMbLhg53AI9hsOWz9kfD1JnO/q/zxsfoEpZBjfSx0rs/PD3fhJu2owtvAVfVcSEtgj1DJCnkLI4ssustnlZ3Ud5+9fbBaU08b9Yu9lQ2oW/VsipYj8HDOpXf+jKfDDvNVmJIxjVMZEaEr21Orh5c8rFLn06KIhBO9WAzZP7/R5eBEbCfOFZq6xrJwtPWwHbaUKO8+y6ErgFjxDD5ah8VZCZE+8WGEavi3A4Vb4bdbAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(83380400001)(478600001)(54906003)(6916009)(5660300002)(31686004)(6666004)(956004)(2616005)(36756003)(2906002)(316002)(16576012)(31696002)(8676002)(186003)(26005)(66946007)(66476007)(86362001)(6486002)(66556008)(16526019)(53546011)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGdUYkVNUUlFV1FnTnE5Rk92amhqbk03QmJlZUZWMVhpdUVBUTZuelMxa2Ex?=
 =?utf-8?B?dnEwQnFIM1NuUlRaaTNab2c4VkdzR3dGTzBJYW9DbmQvZU9OTS9sTVJaRVVm?=
 =?utf-8?B?ejNCSk13WlBrdkd4UGY5WEdWOEwwQkZBd2dPOWsyeHBhN3FrU1ZSNWFEL3Y4?=
 =?utf-8?B?eE5aOEpJYnNWamxBSUVQWlkzdWI2Ymx1ajBKbDhjN2laa1BuMG1Ud1M2L1kx?=
 =?utf-8?B?Q2Z1YWc4NngxNGVremxsclk0R2d5YWdGdVY1ZkxvejZHZmVLaUdnTHdXUlc5?=
 =?utf-8?B?VG1YU1hXSDd4dmJwZTBhSi9PMDdOd2MyWGhaSll4VmJURS94Mmx2a1BzMlBx?=
 =?utf-8?B?UER4Yy9nRzFtTThPRUNWNE4rejBqaUFPTFJ2S2RVRHdJaGxIa0R1dzRnUkQ1?=
 =?utf-8?B?enV0MEwyTmQvZG9TTys0MEk3VDBpeDBucmo4QkNkdlNlUGt5NkFQUWdKbW5S?=
 =?utf-8?B?dzFmK0dSU0kyU21SR21EeWJQbzZaUTJBUGdSdkVMQVZDK2VOaUhFU1FoSWlS?=
 =?utf-8?B?ekpxM3pJNmRGcFA3MUd5K0E3bTV5VmNUSEZwMWVUSXlvNXRpUVBtVEt3NkJr?=
 =?utf-8?B?dWlxczJORG80WlBQaWZ4d1hVcTZLdmpEZHp2cXJOV0NJVkRhRnFTUkZ4UEJp?=
 =?utf-8?B?bkd1eGlrdVprUnpTOVlOaWVUNStpQktxTmVIMUpGTVE1Zm1oK292Ky85TUh4?=
 =?utf-8?B?RjNsMGxNb3BiaDdseFlpZi8rR0VqblhPQUhtVDVUODlJaTZhVjdGSkRmRWtX?=
 =?utf-8?B?TjJvd1BCOFdlRGdDTXJEbnpQSFR5SlJmOVNCdHVpOWpVRUloTVhrNS8zVmlj?=
 =?utf-8?B?dWNyUnRoNFd3eWdKZXN4MDZZQytTaVE3VjZzMkRWTDhBbWNQMUVlWmN6RDJl?=
 =?utf-8?B?M1EzZklJbjdoUS9SQkFjbS9EZnpLbGN4WlE2alhJSGZ6dFdmVVlGaFRRR3hn?=
 =?utf-8?B?dVdGT0IyR2NsWWFBY0NBMlhwSzBGNU8wVC9mQ1BMZUxDcG5vbTUwTmhFOGp0?=
 =?utf-8?B?NVozc3lkRHBvcFJLTUxWcmMveTgwWE9CNVc1TmdjeUoyN21uMURKcUVqSkNE?=
 =?utf-8?B?akxDQ1gybVBuN3FwNitIZWFGeUUzK2l4Y0NzTVZsbWZTTG4vSTk1VVVwQUxC?=
 =?utf-8?B?VDAvcThzUll5c3ZITUd1WGJNMHJobVVGQlVWek5WRjB1czlnTlNsU0E4bTB3?=
 =?utf-8?B?QW1UK0g5RHBEc0xSU3RhZ2lXVENBRmFGSXh0WHlEdFBBSkx4ejg1ZG1KM3BO?=
 =?utf-8?B?dmNWMy9FRytRMk1sUEZ1ekxIcmUrdktoL3k1Mi9PUjFvK2Q0c1gwdXBQSjBD?=
 =?utf-8?B?anVaYUVLdTVITGkxb0orOU5DZTczNWpKUExQakZ0R0dhVjIvbTYrdTVVQUl0?=
 =?utf-8?B?TkdYdHB5Z3pxa0Z4MGVMYzNnREVvSmErZ2svMXl0bDhDTzR2djgzcnFXeWx4?=
 =?utf-8?B?dGpyeUJFMzcwemNFNUE4NTZJL2Z4cWdiTFU0U3h1aGdOcnRlalJyZU9CZ01P?=
 =?utf-8?B?MjR0T2FMRCtUTzh0STJHblkzcU1WNHNqeXpFM05JaUVqNXRqQnYxWFlUQXE0?=
 =?utf-8?B?T1JPRkNOYUExZEl1NGlTOHphQUU2TVZDR2ZHS0ZiOFNWZncvRjhpQlc0TEdS?=
 =?utf-8?B?V0MrQ3diTFNINGsrZlZoQ3ZTSk5qV1p4bjBFSEFDUExyd1BrWjJIV2FkRzZj?=
 =?utf-8?B?WEhUazVtWVV4Y3dzR1VUR25Pb3NVWnZkNDNKMzlLMUlDWC9wL2FyZmhhWm42?=
 =?utf-8?Q?46K1bXYakmO1JvwhHUgETADLQouaPBtTQ7GfHIh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bd2478-b8e7-4317-2b7c-08d8d8e817b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 17:17:41.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjnAoKTyT8zmqz8mesCsNXK2EkAax4hcXUcgryAobQ6mzO1+HwPrMEmhWaAzqkgRU0oR3hGlMyHe3Q/wUEiIAF7y1iF8jx75CU5QTiSg/iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4549
X-OriginatorOrg: citrix.com

On 23/02/2021 07:53, Jan Beulich wrote:
> On 22.02.2021 17:36, Andrew Cooper wrote:
>> On 19/02/2021 08:09, Jan Beulich wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -123,8 +123,13 @@ ifneq ($(efi-y),)
>>>  # Check if the compiler supports the MS ABI.
>>>  export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>>>  # Check if the linker supports PE.
>>> -XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -S -o efi/check.efi efi/check.o 2>/dev/null && echo y))
>>> +EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
>>> +XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
>>>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>>> +# Check if the linker produces fixups in PE by default (we need to disable it doing so for now).
>>> +XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI), \
>>> +                         $(shell $(LD) $(EFI_LDFLAGS) --disable-reloc-section -o efi/check.efi efi/check.o 2>/dev/null && \
>>> +                                 echo --disable-reloc-section))
>> Why does --strip-debug move?
> -S and --strip-debug are the same. I'm simply accumulating in
> EFI_LDFLAGS all that's needed for the use in the probing construct.

Oh ok.

It occurs to me that EFI_LDFLAGS now only gets started in an ifneq
block, but appended to later on while unprotected.  That said, I'm
fairly sure it is only consumed inside a different ifeq section, so I
think there is a reasonable quantity of tidying which ought to be done here.

> Also I meanwhile have a patch to retain debug info, for which this
> movement turns out to be a prereq. (I've yet to test that the
> produced binary actually works, and what's more I first need to get
> a couple of changes accepted into binutils for the linker to actually
> cope.)
>
>> What's wrong with $(call ld-option ...) ?  Actually, lots of this block
>> of code looks to be opencoding of standard constructs.
> It looks like ld-option could indeed be used here (there are marginal
> differences which are likely acceptable), despite its brief comment
> talking of just "flag" (singular, plus not really covering e.g. input
> files).
>
> But:
> - It working differently than cc-option makes it inconsistent to
>   use (the setting of XEN_BUILD_EFI can't very well be switched to
>   use cc-option); because of this I'm not surprised that we have
>   only exactly one use right now in the tree.
> - While XEN_BUILD_PE wants to be set to "y", for XEN_NO_PE_FIXUPS
>   another transformation would then be necessary to translate "y"
>   into "--disable-reloc-section".
> - Do you really suggest to re-do this at this point in the release
>   cycle?

I'm looking to prevent this almost-incompressible mess from getting worse.

But I suppose you want this to backport, so I suppose it ought to be
minimally invasive.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This logic all actually needs moving into Kconfig so we can also go
about fixing the other bugs we have such as having Multiboot headers in
xen.efi pointing at unusable entrypoints.

~Andrew

