Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A091DB8AA
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 17:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbQxh-0007Kq-40; Wed, 20 May 2020 15:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbQxf-0007Kl-Al
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 15:48:51 +0000
X-Inumbo-ID: 65c509e0-9ab1-11ea-aa41-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65c509e0-9ab1-11ea-aa41-12813bfff9fa;
 Wed, 20 May 2020 15:48:50 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kFHHhQQZkZ/WRdHAoJXow45TVVp3YTvzq7jcBvb/6nLmL25Ef1TF4Om6GeXaBj1qJC+BsaDJHW
 Kz6fhN2kv+1TUEv2HMTeATeWexUVveTeRURJ50RlbjhE390YwLrXcfz8YouDvrzI7cg9ShBYPS
 dxhzqEzhzufNFWFvLOwVdZBmEk5uHfa3T8c28/wWDEHun29/wefreFOS6/KuFlJmjdQkh6xRex
 SCqYZ9eBW5umhyv7kP5y0VdhOUvWtl/0nJGlf5xhYmmBOc0qM0lL4Qr0qLcCaIlmkmPOoG6u7n
 pbw=
X-SBRS: 2.7
X-MesageID: 18367733
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18367733"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Jan Beulich <jbeulich@suse.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
 <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
 <3088e420-a72a-1b2d-144f-115610488418@suse.com>
 <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
 <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
 <1808df24-ecde-97c6-c296-ecf385260395@citrix.com>
 <90bf918e-3b87-b1be-344f-80a1bd6803a8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <43539b81-7824-9c29-acbe-a1edaf562523@citrix.com>
Date: Wed, 20 May 2020 16:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <90bf918e-3b87-b1be-344f-80a1bd6803a8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>, Wei
 Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 08:48, Jan Beulich wrote:
> On 19.05.2020 20:00, Andrew Cooper wrote:
>> On 19/05/2020 17:09, Jan Beulich wrote:
>>> In any event there would be 12 bits to reclaim from the up
>>> pointer - it being a physical address, there'll not be more
>>> than 52 significant bits.
>> Right, but for L1TF safety, the address bits in the PTE must not be
>> cacheable.
> So if I understand this right, your response was only indirectly
> related to what I said: You mean that no matter whether we find
> a way to store full-width GFNs, SH_L1E_MMIO_MAGIC can't have
> arbitrarily many set bits dropped.

Yes

> On L1TF vulnerable hardware,
> that is (i.e. in principle the constant could become a variable
> to be determined at boot).

The only thing which can usefully be done at runtime disable the fastpath.

If cacheable memory overlaps with the used address bits, there are no
safe values to use.

>
>> Currently, on fully populated multi-socket servers, the MMIO fastpath
>> relies on the top 4G of address space not being cacheable, which is the
>> safest we can reasonably manage.  Extending this by a nibble takes us to
>> 16G which is not meaningfully less safe.
> That's 64G (36 address bits), isn't it?

Yes it is.  I can't count.

> Looking at
> l1tf_calculations(), I'd be worried in particular Penryn /
> Dunnington might not support more than 36 address bits (I don't
> think I have anywhere to check). Even if it was 38, 39, or 40
> bits, 64G becomes a not insignificant part of the overall 256G /
> 512G / 1T address space. Then again the top quarter assumption
> in l1tf_calculations() would still be met in this latter case.

I'm honestly not too worried.  Intel has ceased supporting anything
older than SandyBridge, and there are other unfixed speculative security
issues.

Anyone using these processors has bigger problems.

~Andrew

