Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3A19D5A5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 13:16:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKKJE-0004n6-O3; Fri, 03 Apr 2020 11:16:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fKXS=5T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKKJC-0004mx-L4
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 11:16:22 +0000
X-Inumbo-ID: 8b718c65-759c-11ea-bcf5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b718c65-759c-11ea-bcf5-12813bfff9fa;
 Fri, 03 Apr 2020 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HYKVQQ39BlW/RAyO8aOWuc21eCjz4xTmkiMyoOVuvm4=; b=xN9rxr2/TWSKsjhypvyJTj8jTq
 4o9yPxr0B0dKZftKahuqcypo6w/btxbv+jax18++e1M3GLUU+fzEP+oQT1nppXTZlaiDoNYdiMD+k
 gYdWe11wDqyrVIx96tBW9fCT1BKK+fB191RINhMK3r2YMkP195U77JE/mQwLRYzumDZU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKKJ6-00052N-8n; Fri, 03 Apr 2020 11:16:16 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKKJ6-000874-1e; Fri, 03 Apr 2020 11:16:16 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: George Dunlap <George.Dunlap@citrix.com>, Marc Zyngier <maz@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
 <76A7BB45-6B4A-46F4-8AD7-9141B3BF9BC4@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fbdba8a3-ede2-7809-68e7-ec6ed41b4f84@xen.org>
Date: Fri, 3 Apr 2020 12:16:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <76A7BB45-6B4A-46F4-8AD7-9141B3BF9BC4@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Xu <xuwei5@hisilicon.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 03/04/2020 11:43, George Dunlap wrote:
> 
>> On Apr 3, 2020, at 9:47 AM, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2020-04-02 19:52, Julien Grall wrote:
>>> (+Marc)
>>
>> Thanks for looping me in. Definitely an interesting read, but also a very
>> puzzling one.
> 
> [snip]
> 
>> No. Low latency is a very desirable thing, but it doesn't matter at all when
>> you don't even have functional correctness. To use my favourite car analogy,
>> having a bigger engine doesn't help when you're about to hit the wall and
>> have no breaks... You just hit the wall faster.
> 
> [snip]
> 
>> s/imprecise/massively incorrect/
> 
> [snip]
> 
>> There is just no way I'll ever accept a change to the GIC interrupt state
>> machine for Linux. Feel free to try and convince other OS maintainers.
> 
> [snip]
> 
>> If I was someone developing a product using Xen/ARM, I'd be very worried
>> about what you have written above. Because it really reads "we don't care
>> about reliability as long as we can show amazing numbers". I really hope
>> it isn't what you mean.
> 
> What's puzzling to me, is that what everyone else in this thread is that what Stefano is trying to do is to get Xen to be have like KVM.

This reads to me as "bugs don't exist".

As I actually said in a previous e-mail, our vGIC is significantly 
different compare to KVM. It *might* be possible they are not affected 
because the may trap when a guest is deactivating an interrupt *or* by 
other means.

I didn't look in the details their implementation, but this suggests you 
or Stefano may have. Why do you think Stefano's implementation is 
following what KVM does? If the behavior is the same, was the problem 
reported to KVM ML? What was the answer from the maintainers?

I suspect this was never discussed on KVM ML. So that should really be 
the first step.

Cheers,

-- 
Julien Grall

