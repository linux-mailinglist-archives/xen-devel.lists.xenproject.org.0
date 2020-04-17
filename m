Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2A1AE27B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 18:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPU9p-0004Iz-Cf; Fri, 17 Apr 2020 16:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygtx=6B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPU9n-0004Iu-Q0
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 16:47:59 +0000
X-Inumbo-ID: 31d05412-80cb-11ea-8d4f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31d05412-80cb-11ea-8d4f-12813bfff9fa;
 Fri, 17 Apr 2020 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d7+plLdv5A+PdXs7CYiNYco9gxcmJgef7cePUxupGFI=; b=hGN4iR+RLRZOKn8b9eP5An5TAV
 iTU50MGkqdOiuwbXrzgRJorBGW/SjvcUmKbbxQJxXybc6jK2UMyoXr1IaaBeNKqCdnMfF6mRR5Zuo
 tsv6u7+L3yveY974EHOdHM7OP0qWAk0gWFqKD33pfHb8N1b/6StsSuCToCCvqshzQreo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPU9i-0002zL-Vf; Fri, 17 Apr 2020 16:47:54 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPU9i-0005R4-Ny; Fri, 17 Apr 2020 16:47:54 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
 <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
 <057f48b7-84be-0bc5-773d-d01a79181b20@xen.org>
 <alpine.DEB.2.21.2004081642070.28673@sstabellini-ThinkPad-T480s>
 <914c421a-02cf-375b-a3fa-1c5e934cdeb3@xen.org>
 <3b002deb-5a80-3dc4-9462-649135cfbd29@xen.org>
 <C39B873E-F40C-4549-9D5E-953E88F94E43@arm.com>
 <1b91aeb3-589b-ac68-8f92-a1e06fa9640d@xen.org>
 <alpine.DEB.2.21.2004170930420.13631@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <651d7cd7-6a42-8898-72db-263bf6f7ea98@xen.org>
Date: Fri, 17 Apr 2020 17:47:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004170930420.13631@sstabellini-ThinkPad-T480s>
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
 "maz@kernel.org" <maz@kernel.org>, George Dunlap <George.Dunlap@citrix.com>,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/04/2020 17:31, Stefano Stabellini wrote:
> On Fri, 17 Apr 2020, Julien Grall wrote:
>> Hi Bertrand,
>>
>> On 17/04/2020 16:16, Bertrand Marquis wrote:
>>> It seems that the problem is a bit bigger then expected and will need more
>>> discussion and thinking.
>>> I did some research on my side and there are several design possible
>>> depending on what should be the goal performance or real-time behaviour
>>> (going from just give the status we have to fire a service interrupts when
>>> any interrupts is acked by a guest to refresh our internal status).
>>>
>>> In the short term, could we not agree to fix the typo by returning always 0
>>> and start a discussion on the vgic implementation ?
>>
>> I have already pointed out multiple time now ([1], [2]) that I would not
>> oppose the temporary solution. I think this is a matter of someone (Stefano?)
>> to submit it :).
>>
>> Cheers,
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2019-11/msg01642.html
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00459.html
> 
> I can submit it. Julien, would you prefer the plain always return 0
> patch, or would you prefer if I tried to get the latest ISACTIVER
> information (like this patch does) but only for the local processor?

Always returning 0.

Cheers,

-- 
Julien Grall

