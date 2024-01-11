Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E582B4BC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 19:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666490.1037166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzkX-0000G9-It; Thu, 11 Jan 2024 18:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666490.1037166; Thu, 11 Jan 2024 18:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzkX-0000EY-Fw; Thu, 11 Jan 2024 18:25:53 +0000
Received: by outflank-mailman (input) for mailman id 666490;
 Thu, 11 Jan 2024 18:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Cn=IV=amazon.co.uk=prvs=73372ff43=eliasely@srs-se1.protection.inumbo.net>)
 id 1rNzkW-0000ES-5a
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 18:25:52 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7e3ea18-b0ae-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 19:25:50 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 18:25:46 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com (Postfix)
 with ESMTPS id AA94060BC8; Thu, 11 Jan 2024 18:25:45 +0000 (UTC)
Received: from EX19MTAEUA001.ant.amazon.com [10.0.43.254:36151]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.1.249:2525]
 with esmtp (Farcaster)
 id 6c268b41-c38a-4f00-846a-4f2358d60a99; Thu, 11 Jan 2024 18:25:44 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jan 2024 18:25:40 +0000
Received: from [10.95.99.82] (10.95.99.82) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 18:25:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d7e3ea18-b0ae-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704997550; x=1736533550;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vQmltPkN+rNAF/jizHqb0pq7BqTmbgPAPV2pSO6QOJ4=;
  b=a09USRODQ6PrdPinjEM9GlCxOP+XRdEitBwziB1Ht4SicKhZWuOwQ4g/
   tpuKbxKv1zxaRGS9XJ9Q0ePWoauyTs7zwfiqZ6egB1w5rD6/bHWLnOs1d
   Sd2+YMsiR8jvoVlXF+ixmzEszaLO13pK23TJ8PxwGa2jXHKrOH498BNzZ
   k=;
X-IronPort-AV: E=Sophos;i="6.04,187,1695686400"; 
   d="scan'208";a="57621535"
X-Farcaster-Flow-ID: 6c268b41-c38a-4f00-846a-4f2358d60a99
Message-ID: <0dcc54dd-b729-4e20-95af-fa4907a550c6@amazon.com>
Date: Thu, 11 Jan 2024 18:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
 <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
 <c736e4d9-5262-4adf-9e74-9b1be5ab13db@suse.com>
 <4ab710c3-c628-4bbe-9533-88af75a9b9ec@xen.org>
 <ba63d435-e26f-4c76-aedc-c027e8b03a6d@suse.com>
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <ba63d435-e26f-4c76-aedc-c027e8b03a6d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.95.99.82]
X-ClientProxiedBy: EX19D035UWB002.ant.amazon.com (10.13.138.97) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk



On 11/01/2024 14:09, Jan Beulich wrote:
> On 11.01.2024 13:25, Julien Grall wrote:
>> Hi Jan,
>>
>> On 11/01/2024 11:53, Jan Beulich wrote:
>>> On 11.01.2024 11:47, Elias El Yandouzi wrote:
>>>> On 22/12/2022 13:24, Jan Beulich wrote:
>>>>> That said, I think this change comes too early in the series, or there is
>>>>> something missing.
>>>>
>>>> At first, I had the same feeling but looking at the rest of the series,
>>>> I can see that the option is needed in follow-up patches.
>>>>
>>>>> As said in reply to patch 10, while there the mapcache
>>>>> is being initialized for the idle domain, I don't think it can be used
>>>>> just yet. Read through mapcache_current_vcpu() to understand why I think
>>>>> that way, paying particular attention to the ASSERT() near the end.
>>>>
>>>> Would be able to elaborate a bit more why you think that? I haven't been
>>>> able to get your point.
>>>
>>> Why exactly I referred to the ASSERT() there I can't reconstruct. The
>>> function as a whole looks problematic though when suddenly the idle
>>> domain also gains a mapcache. I'm sorry, too much context was lost
>>> from over a year ago; all of this will need looking at from scratch
>>> again whenever a new version was posted.
>>>
>>>>> In preparation of this patch here I think the mfn_to_virt() uses have to all
>>>>> disappear from map_domain_page(). Perhaps yet more strongly all
>>>>> ..._to_virt() (except fix_to_virt() and friends) and __va() have to
>>>>> disappear up front from x86 and any code path which can be taken on x86
>>>>> (which may simply mean purging all respective x86 #define-s, without
>>>>> breaking the build in any way).
>>>>
>>>> I agree with you on that one. I think it is what we're aiming for in the
>>>> long term. However, as mentioned by Julien in the cover letter, the
>>>> series's name is a misnomer and I am afraid we won't be able to remove
>>>> all of them with this series. These helpers would still be used for
>>>> xenheap pages or when the direct map is enabled.
>>>
>>> Leaving a hazard of certain uses not having been converted, or even
>>> overlooked in patches going in at around the same time as this series?
>>> I view this as pretty "adventurous".
>>
>> Until we get rid of the directmap completely (which is not the goal of
>> this series), we will need to keep mfn_to_virt().
>>
>> In fact the one you ask to remove in map_domain_page() will need to be
>> replaced with function doing the same thing. The same for the code that
>> will initially prepare the directmap. This to avoid impacting
>> performance when the user still wants to use the directmap.
>>
>> So are you just asking to remove most of the use and rename *_to_virt()
>> to something that is more directmap specific (e.g. mfn_to_directmap_virt())?
> 
> Well, in a way. If done this way, mfn_to_virt() (and __va()) should have no
> users by the end of the series, and it would be obvious that nothing was
> missed (and by then purging the old ones we could also ensure no new uses
> would appear).

What about maddr_to_virt()? For instance, in the function 
xen/arch/x86/dmi_scan.c:dmi_iterate(), we need to access a very low 
machine address which isn't in the directmap range.

How would you proceed? Calling vmap() seems to be a bit overkill for 
just a temporary mapping and I don't really want to rework this function 
to use map_domain_page().

In such case, how would you proceed? What do you suggest?

Cheers,

-- 
Elias

