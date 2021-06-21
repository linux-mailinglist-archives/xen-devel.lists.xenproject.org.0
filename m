Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854A3AF787
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 23:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145695.267935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvRbE-0004jo-7s; Mon, 21 Jun 2021 21:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145695.267935; Mon, 21 Jun 2021 21:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvRbE-0004hz-4i; Mon, 21 Jun 2021 21:36:56 +0000
Received: by outflank-mailman (input) for mailman id 145695;
 Mon, 21 Jun 2021 21:36:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZyg=LP=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1lvRbC-0004ht-Cd
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 21:36:54 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14300c5c-d142-4fe4-a306-176859f5f7b0;
 Mon, 21 Jun 2021 21:36:52 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:35594
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1lvRfm-0002an-Va; Mon, 21 Jun 2021 23:41:39 +0200
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
X-Inumbo-ID: 14300c5c-d142-4fe4-a306-176859f5f7b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=echRYO9/03A/RWXXeBXOytrx6HhFq/gOusrcAB2T0SM=; b=QMPoXeGzyDQrsOIfNIieSIfeAg
	n/wxyrVCxb+cCG47obHfKhLENJth+oPCFd5VIHGVTll5N/G/9yNjsJi7Yx8F/K89OG2RDP6V+TUjY
	KzzBpOpGalQ7ffutRpu+8cDkyXvDBMQ3R6mVGBMc3rVAslKKuTWUD3tz8UJS5E17hAto=;
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 kernel test robot <oliver.sang@intel.com>
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
 <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
 <9108c22e-3521-9e24-6124-7776d947b788@rasmusvillemoes.dk>
 <0b12f27b-1109-b621-c969-10814b2c1c2f@eikelenboom.it>
 <7338064f-10b6-545d-bc6c-843d04aafe28@eikelenboom.it>
 <e7f9c4f8-1669-75ce-b052-1030350a159e@eikelenboom.it>
 <bfdd1d6b-77a3-450b-71f4-63e9cc314ace@rasmusvillemoes.dk>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <c4a0bc1e-9b20-47d9-7299-71bac5c43596@eikelenboom.it>
Date: Mon, 21 Jun 2021 23:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bfdd1d6b-77a3-450b-71f4-63e9cc314ace@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 7bit

On 21/06/2021 18:54, Rasmus Villemoes wrote:
> On 18/06/2021 03.06, Sander Eikelenboom wrote:
>> On 17/06/2021 21:39, Sander Eikelenboom wrote:
> 
>>
>> OK, done some experimentation and it seems with 256M assigned to the VM
>> it was almost at the edge of OOM with the 5.12 kernel as well in the
>> config I am using it.
>> With v5.12 when I assign 240M it boots, with 230M it doesn't. With 5.13
>> the tipping point seems to be around 265M and 270M, so my config was
>> already quite close to the edge.
>>
>> The "direct kernel boot" feature I'm using just seems somewhat memory
>> hungry, but using another compression algorithm for the kernel and
>> initramfs already helped in my case.
>>
>> So sorry for the noise, clearly user-error.
> 
> Hm, perhaps, but I'm still a bit nervous about that report from Oliver
> Sang/kernel test robot, which was for a VM equipped with 16G of memory.
> But despite quite a few attempts, I haven't been able to reproduce that
> locally, so unfortunately I have no idea what's going on.
> 
> Rasmus
> 

Hmm I just tried to switch all VM's to a 5.13-rc7 kernel.
Some worked since i reduced the size, but some still fail.

The difference seems the be the number of vcpu's I assign to the VM's

The ones with 1 vcpu now boot with 256MB assigned (that was what I tested before),
but the ones with 2 vcpu's assigned don't and still OOM
on the same kernel and initramfs that I pass in from the host.

Could that box from the test-robot have a massive amount of cpu-cores
and that it is some how related to that ?

--
Sander

