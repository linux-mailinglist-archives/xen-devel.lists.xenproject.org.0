Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88340243E3C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 19:23:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Gvz-0005Gn-Nl; Thu, 13 Aug 2020 17:22:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jG6=BX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6Gvx-0005Gi-L2
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 17:22:33 +0000
X-Inumbo-ID: 6efce8bd-e38e-4fc5-b4e7-fcdb8ddd49c9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6efce8bd-e38e-4fc5-b4e7-fcdb8ddd49c9;
 Thu, 13 Aug 2020 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Vfp4QRiY+dAd1qDfvNrJ08P7K8vScW5KnQXRmA8SNJY=; b=SIqvcOn7ePbPk/H95er2zB1ulN
 I1BMpBM2cJg9j2frEdkCOhCT1ykjvGywgluAhE3ypitNUVe/BSriHdF6Kr6feebjdxDwgTPtX4sUx
 QSmK2onOUTBs7XoTxQQS3BmvmY2h3aJqTtjJq2Lzp3qusu2Exju60GCtTySAnlVNuZqo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6Gvs-00077c-Et; Thu, 13 Aug 2020 17:22:28 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6Gvs-0002Rb-48; Thu, 13 Aug 2020 17:22:28 +0000
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <f25e278f-2d63-d806-4650-983df490556f@xen.org>
Date: Thu, 13 Aug 2020 18:22:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 13/08/2020 17:08, Hongyan Xia wrote:
> On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
>> On 27.07.2020 16:21, Hongyan Xia wrote:
>>> From: Wei Liu <wei.liu2@citrix.com>
>>>
>>> Rewrite those functions to use the new APIs. Modify its callers to
>>> unmap
>>> the pointer returned. Since alloc_xen_pagetable_new() is almost
>>> never
>>> useful unless accompanied by page clearing and a mapping, introduce
>>> a
>>> helper alloc_map_clear_xen_pt() for this sequence.
>>>
>>> Note that the change of virt_to_xen_l1e() also requires
>>> vmap_to_mfn() to
>>> unmap the page, which requires domain_page.h header in vmap.
>>>
>>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> ---
>>> Changed in v8:
>>> - s/virtual address/linear address/.
>>> - BUG_ON() on NULL return in vmap_to_mfn().
>>
>> The justification for this should be recorded in the description. In
> 
> Will do.
> 
>> reply to v7 I did even suggest how to easily address the issue you
>> did notice with large pages, as well as alternative behavior for
>> vmap_to_mfn().
> 
> One thing about adding SMALL_PAGES is that vmap is common code and I am
> not sure if the Arm side is happy with it.

At the moment, Arm is only using small mapping but I plan to change that 
soon because we have regions that can be fairly big.

Regardless that, the issue with vmap_to_mfn() is rather x86 specific. So 
I don't particularly like the idea to expose such trick in common code.

Even on x86, I think this is not the right approach. Such band-aid will 
impact the performance as, assuming superpages are used, it will take 
longer to map and add pressure on the TLBs.

I am aware that superpages will be useful for LiveUpdate, but is there 
any use cases in upstream? If not, could we just use the BUG_ON() and 
implement correctly vmap_to_mfn() in a follow-up?

Cheers,

-- 
Julien Grall

