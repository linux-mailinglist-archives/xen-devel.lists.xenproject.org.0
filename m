Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F03ABB26
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 20:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144116.265324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltwLe-0001Yo-3I; Thu, 17 Jun 2021 18:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144116.265324; Thu, 17 Jun 2021 18:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltwLd-0001WI-VV; Thu, 17 Jun 2021 18:02:37 +0000
Received: by outflank-mailman (input) for mailman id 144116;
 Thu, 17 Jun 2021 18:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iG+e=LL=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1ltwLc-0001WC-0y
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 18:02:36 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48daf945-e739-46c9-b34b-328a35bdbc7c;
 Thu, 17 Jun 2021 18:02:34 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:51064
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1ltwQB-0006fU-Be; Thu, 17 Jun 2021 20:07:19 +0200
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
X-Inumbo-ID: 48daf945-e739-46c9-b34b-328a35bdbc7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PiN3z2mKDdT5442Y+muKtJpynotCbE1hW/7caNM/RJk=; b=SFGTJae2VtNYejTAt/O1zGbbFs
	WqNBFGLdNgegQgVYtdoSjbl7L5z3kKUVETjdj8jFbq5hVa3nKtFGd0AZvB97rSgiBOzlYFHcPHVIL
	zua+3fLh2ng3XN3RDLyuLGzPskn7WR6QA31nbq3EZCvvyJkm1lihbSwwq4f6BxAa/Hyo=;
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
 <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
 <9108c22e-3521-9e24-6124-7776d947b788@rasmusvillemoes.dk>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <0b12f27b-1109-b621-c969-10814b2c1c2f@eikelenboom.it>
Date: Thu, 17 Jun 2021 20:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9108c22e-3521-9e24-6124-7776d947b788@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17/06/2021 17:37, Rasmus Villemoes wrote:
> On 17/06/2021 17.01, Linus Torvalds wrote:
>> On Thu, Jun 17, 2021 at 2:26 AM Sander Eikelenboom <linux@eikelenboom.it> wrote:
>>>
>>> I just tried to upgrade and test the linux kernel going from the 5.12 kernel series to 5.13-rc6 on my homeserver with Xen, but ran in some trouble.
>>>
>>> Some VM's boot fine (with more than 256MB memory assigned), but the smaller (memory wise) PVH ones crash during kernel boot due to OOM.
>>> Booting VM's with 5.12(.9) kernel still works fine, also when dom0 is running 5.13-rc6 (but it has more memory assigned, so that is not unexpected).
>>
>> Adding Rasmus to the cc, because this looks kind of like the async
>> roofs population thing that caused some other oom issues too.
> 
> Yes, that looks like the same issue.
> 
>> Rasmus? Original report here:
>>
>>     https://lore.kernel.org/lkml/ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it/
>>
>> I do find it odd that we'd be running out of memory so early..
> 
> Indeed. It would be nice to know if these also reproduce with
> initramfs_async=0 on the command line.
> 
> But what is even more curious is that in the other report
> (https://lore.kernel.org/lkml/20210607144419.GA23706@xsang-OptiPlex-9020/),
> it seemed to trigger with _more_ memory - though I may be misreading
> what Oliver was telling me:
> 
>> please be noted that we use 'vmalloc=512M' for both parent and this
> commit.
>> since it's ok on parent but oom on this commit, we want to send this
> report
>> to show the potential problem of the commit on some cases.
>>
>> we also tested by changing to use 'vmalloc=128M', it will succeed.
> 
> Those tests were done in a VM with 16G memory, and then he also wrote
> 
>> we also tried to follow exactly above steps to test on
>> some local machine (8G memory), but cannot reproduce.
> 
> Are there some special rules for what memory pools PID1 versus the
> kworker threads can dip into?
> 
> 
> Side note: I also had a ppc64 report with different symptoms (the
> initramfs was corrupted), but that turned out to also reproduce with
> e7cb072eb98 reverted, so that is likely unrelated. But just FTR that
> thread is here:
> https://lore.kernel.org/lkml/CA+QYu4qxf2CYe2gC6EYnOHXPKS-+cEXL=MnUvqRFaN7W1i6ahQ@mail.gmail.com/
> 
> Rasmus
> 

I choose to first finish the bisection attempt, not so suprising it ends up with:
e7cb072eb988e46295512617c39d004f9e1c26f8 is the first bad commit

So at least that link is confirmed.

I also checked out booting with "initramfs_async=0" and now the guest boots with the 5.13-rc6-ish kernel which fails without that.

--
Sander


