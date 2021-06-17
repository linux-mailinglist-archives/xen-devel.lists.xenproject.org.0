Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712323AB7AA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144079.265268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltu5e-0002I6-BP; Thu, 17 Jun 2021 15:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144079.265268; Thu, 17 Jun 2021 15:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltu5e-0002Fp-7C; Thu, 17 Jun 2021 15:37:58 +0000
Received: by outflank-mailman (input) for mailman id 144079;
 Thu, 17 Jun 2021 15:37:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cW0Z=LL=rasmusvillemoes.dk=linux@srs-us1.protection.inumbo.net>)
 id 1ltu5b-0002De-GL
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:37:55 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c6ee03-95f7-40e7-ac9b-0c358e427250;
 Thu, 17 Jun 2021 15:37:53 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s15so4592467edt.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jun 2021 08:37:53 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id j24sm4538603edv.48.2021.06.17.08.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 08:37:52 -0700 (PDT)
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
X-Inumbo-ID: 06c6ee03-95f7-40e7-ac9b-0c358e427250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YT85gP+YFDJ5ychGyvNL82kun+NGGvSQi4A8qTsyAT8=;
        b=d2GK9t3nL2nAfTcf7lqXjd31fD7Hz5xzxIAJtdTuGMg15qEOCzDgflXnVUQN8grvuM
         EeDaBMTzUJ5xRvELBxH/CNS4pCSwowu44jiHt3qIjmlgS1IMEZ8ZQIhPGE+4zoWIiZC3
         gnXozEqWX4Im4+7CVdSM9IFtkfATJIFunDZyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YT85gP+YFDJ5ychGyvNL82kun+NGGvSQi4A8qTsyAT8=;
        b=L5YBYR9Xnt3SECEZ2HAGHtg/fDfDo6HfB6rdlX1k+hDdZuLuUOiDiUGo03ICabNsm0
         p1OhBHaQyEcR6lfG/V/uTlTiLNK/vZvaA36kz3QjABhyFlQwM8LiG/G8rWGP8rYwItLK
         AlfyrBVRhllLCysc26pgjk7IDMy9BmV7A0N474k6R7PXMd1ePBqll+EK8nkzA6zpjBuG
         e9RLIqAgdgcrIalrRBtDKtp1NPBwMIajDiPGnNpBvljjyThWN50clFt2odndFMW2qIMG
         8n6bEOvp5AGKFD5vJtfbCdASIAk4XIJn70qABGkoe89NnBXKSWhYBAemrijg+ut0XG/z
         rflg==
X-Gm-Message-State: AOAM533ICyixrf01q8hUQKD1Tt6h0ruMMI8Wz4OJYRyjqhLGPIBpgFHw
	dMtkyiNZVO28SGSa3AU9RxJUnJ2sKBzCrg==
X-Google-Smtp-Source: ABdhPJx5RzRT+L7RIRvsl9usmDDDf/qtiyT+vCzmybNW0ErUVakZubdtURjpJlM3bBjtB8KFQFyMAA==
X-Received: by 2002:aa7:c705:: with SMTP id i5mr7526454edq.222.1623944272883;
        Thu, 17 Jun 2021 08:37:52 -0700 (PDT)
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
 <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9108c22e-3521-9e24-6124-7776d947b788@rasmusvillemoes.dk>
Date: Thu, 17 Jun 2021 17:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17/06/2021 17.01, Linus Torvalds wrote:
> On Thu, Jun 17, 2021 at 2:26 AM Sander Eikelenboom <linux@eikelenboom.it> wrote:
>>
>> I just tried to upgrade and test the linux kernel going from the 5.12 kernel series to 5.13-rc6 on my homeserver with Xen, but ran in some trouble.
>>
>> Some VM's boot fine (with more than 256MB memory assigned), but the smaller (memory wise) PVH ones crash during kernel boot due to OOM.
>> Booting VM's with 5.12(.9) kernel still works fine, also when dom0 is running 5.13-rc6 (but it has more memory assigned, so that is not unexpected).
> 
> Adding Rasmus to the cc, because this looks kind of like the async
> roofs population thing that caused some other oom issues too.

Yes, that looks like the same issue.

> Rasmus? Original report here:
> 
>    https://lore.kernel.org/lkml/ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it/
> 
> I do find it odd that we'd be running out of memory so early..

Indeed. It would be nice to know if these also reproduce with
initramfs_async=0 on the command line.

But what is even more curious is that in the other report
(https://lore.kernel.org/lkml/20210607144419.GA23706@xsang-OptiPlex-9020/),
it seemed to trigger with _more_ memory - though I may be misreading
what Oliver was telling me:

> please be noted that we use 'vmalloc=512M' for both parent and this
commit.
> since it's ok on parent but oom on this commit, we want to send this
report
> to show the potential problem of the commit on some cases.
>
> we also tested by changing to use 'vmalloc=128M', it will succeed.

Those tests were done in a VM with 16G memory, and then he also wrote

> we also tried to follow exactly above steps to test on
> some local machine (8G memory), but cannot reproduce.

Are there some special rules for what memory pools PID1 versus the
kworker threads can dip into?


Side note: I also had a ppc64 report with different symptoms (the
initramfs was corrupted), but that turned out to also reproduce with
e7cb072eb98 reverted, so that is likely unrelated. But just FTR that
thread is here:
https://lore.kernel.org/lkml/CA+QYu4qxf2CYe2gC6EYnOHXPKS-+cEXL=MnUvqRFaN7W1i6ahQ@mail.gmail.com/

Rasmus

