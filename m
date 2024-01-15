Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9CC82DBD3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667450.1038713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOIH-0007NY-GQ; Mon, 15 Jan 2024 14:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667450.1038713; Mon, 15 Jan 2024 14:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOIH-0007LL-Di; Mon, 15 Jan 2024 14:50:29 +0000
Received: by outflank-mailman (input) for mailman id 667450;
 Mon, 15 Jan 2024 14:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3fTV=IZ=amazon.co.uk=prvs=737ebf78a=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPOIF-0007Jt-H2
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:50:27 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0bfcbe-b3b5-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 15:50:25 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-5eae960a.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 14:50:22 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2c-m6i4x-5eae960a.us-west-2.amazon.com (Postfix)
 with ESMTPS id 2A46340D66; Mon, 15 Jan 2024 14:50:21 +0000 (UTC)
Received: from EX19MTAEUA001.ant.amazon.com [10.0.10.100:30023]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.36.219:2525]
 with esmtp (Farcaster)
 id b3361114-5814-41eb-b6f6-0f03ac11b31e; Mon, 15 Jan 2024 14:50:20 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 15 Jan 2024 14:50:20 +0000
Received: from [192.168.9.238] (10.106.82.11) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 15 Jan
 2024 14:50:16 +0000
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
X-Inumbo-ID: 6a0bfcbe-b3b5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705330225; x=1736866225;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=meDL39+ncIXuHvEulZaOqvZaF2LlMEJqAeoyskQhtnQ=;
  b=NT+T6B8/RnDi8nxyhL7kUS6wwgurkhhJNlnAqA3EKpBabXv06YF/RyIH
   G8zb2wD5os5Y/dPhROv8oloxAvn8Mu2vdxLGaIUkhq2jZY+g9+s22tiEv
   vF/woIczcEHrKxogs9x4OtWw0Uau9VVNhaRyE/0ncOEbnl/6qTLpWC+DF
   Y=;
X-IronPort-AV: E=Sophos;i="6.04,196,1695686400"; 
   d="scan'208";a="178127180"
X-Farcaster-Flow-ID: b3361114-5814-41eb-b6f6-0f03ac11b31e
Message-ID: <fcfb79c5-0509-4ed3-be58-bd3d0935a21e@amazon.com>
Date: Mon, 15 Jan 2024 14:50:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
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
 <0dcc54dd-b729-4e20-95af-fa4907a550c6@amazon.com>
 <6926f363-3994-4059-b7e1-cb8e45367be8@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <6926f363-3994-4059-b7e1-cb8e45367be8@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.82.11]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk

Hi,

On 12/01/2024 07:47, Jan Beulich wrote:
> On 11.01.2024 19:25, Elias El Yandouzi wrote:
>> On 11/01/2024 14:09, Jan Beulich wrote:
>>
>> What about maddr_to_virt()? For instance, in the function
>> xen/arch/x86/dmi_scan.c:dmi_iterate(), we need to access a very low
>> machine address which isn't in the directmap range.
> 
> I'm afraid I don't follow: Very low addresses are always in the
> direct map range, which - on x86 - always starts at 0.
> 

I reckon it was poorly phrased. IIUC, we'd like to remove every use of 
*_to_virt() in the case the directmap option is disabled.
So I meant that in this situation, the helper arch_mfns_in_direct_map() 
would return false.

>> How would you proceed? Calling vmap() seems to be a bit overkill for
>> just a temporary mapping and I don't really want to rework this function
>> to use map_domain_page().
>>
>> In such case, how would you proceed? What do you suggest?
> 
> fixmap may be an option to consider, but I also don't see why you
> apparently think using vmap() would be a possibility while at the
> same time making use of map_domain_page() is too much effort.

I thought about using vmap() as it allows to map a contiguous region 
easily. It is also used in the follow-up patch 17/22, so I thought it 
could be viable.

I was reluctant to use map_domain_page() for two reasons. 1) it only 
allows to map one page at the time, so I'd need to rework more deeply 
the function dmi_iterate() 2) because the mapcache wouldn't be ready to 
use at that time, the mapping would end up in PMAP which is meant to map 
the page tables, nothing else.

-- 
Elias

