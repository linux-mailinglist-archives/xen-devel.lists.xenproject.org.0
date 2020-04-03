Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B4C19D55C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 12:59:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKK2X-00038C-Uk; Fri, 03 Apr 2020 10:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DpjN=5T=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1jKK2W-000387-2b
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 10:59:08 +0000
X-Inumbo-ID: 23af32b8-759a-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23af32b8-759a-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 10:59:07 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B411420757;
 Fri,  3 Apr 2020 10:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585911546;
 bh=ahPBuX08756i1V0bRbqbI/eO6SWcFnhmlsp3vme9bnI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wup0wtnmJGpGo8VEii+1XnAUIjbFA2VZObgguHCL7eXn3Nzo/3Tb8bJIv5ssmkcr2
 IwjEgPHfkMOhwF9NAIWHbfB+4UlinlB4Fp9TJ2cNIdI7KD+CgRfcyOv5k2CURiuOGe
 ztwMKLDZ8/Ocqe5TXViWRZjygPtfeG1H2ddV5g88=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jKK2S-000Tji-Ro; Fri, 03 Apr 2020 11:59:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Apr 2020 11:59:04 +0100
From: Marc Zyngier <maz@kernel.org>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <76A7BB45-6B4A-46F4-8AD7-9141B3BF9BC4@citrix.com>
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
Message-ID: <017cfca3b079356abfcd829756af2fdb@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: George.Dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@xilinx.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, xuwei5@hisilicon.com, peng.fan@nxp.com,
 Bertrand.Marquis@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
 Julien Grall <julien@xen.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George,

On 2020-04-03 11:43, George Dunlap wrote:
>> On Apr 3, 2020, at 9:47 AM, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-04-02 19:52, Julien Grall wrote:
>>> (+Marc)
>> 
>> Thanks for looping me in. Definitely an interesting read, but also a 
>> very
>> puzzling one.
> 
> [snip]
> 
>> No. Low latency is a very desirable thing, but it doesn't matter at 
>> all when
>> you don't even have functional correctness. To use my favourite car 
>> analogy,
>> having a bigger engine doesn't help when you're about to hit the wall 
>> and
>> have no breaks... You just hit the wall faster.
> 
> [snip]
> 
>> s/imprecise/massively incorrect/
> 
> [snip]
> 
>> There is just no way I'll ever accept a change to the GIC interrupt 
>> state
>> machine for Linux. Feel free to try and convince other OS maintainers.
> 
> [snip]
> 
>> If I was someone developing a product using Xen/ARM, I'd be very 
>> worried
>> about what you have written above. Because it really reads "we don't 
>> care
>> about reliability as long as we can show amazing numbers". I really 
>> hope
>> it isn't what you mean.
> 
> What's puzzling to me, is that what everyone else in this thread is
> that what Stefano is trying to do is to get Xen to be have like KVM.

Sorry, I don't get what you mean here. KVM at least aims to be 
architecturally
compliant. Is it perfect? Most probably not, as we fix it all the time.

Dealing with the active registers is hard. But as far as I can see,
we do get them right. Do we sacrifice latency over correctness? Yes.

And if you have spotted a problem in the way we handle those, pray tell.

> Are they wrong?  If so, we can just do whatever Linux does.  If not,
> then you need to first turn all your imprecations about correctness,
> smashing into walls, concern for the sanity of maintainers and so on
> towards your own code first.

I'm really sorry, but you see to have the wrong end of the stick here.
I'm not trying to compare Xen to KVM at all. I'm concerned about only
implementing only a small part of the architecture, ignoring the rest,
and letting guests crash, which is what was suggested here.

         M.
-- 
Jazz is not dead. It just smells funny...

