Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53C30E58E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 23:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81074.149129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7QG4-0004Yq-J2; Wed, 03 Feb 2021 22:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81074.149129; Wed, 03 Feb 2021 22:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7QG4-0004YT-G3; Wed, 03 Feb 2021 22:04:20 +0000
Received: by outflank-mailman (input) for mailman id 81074;
 Wed, 03 Feb 2021 22:04:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAwm=HF=linuxfoundation.org=skhan@srs-us1.protection.inumbo.net>)
 id 1l7QG2-0004YO-B2
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 22:04:18 +0000
Received: from mail-il1-x135.google.com (unknown [2607:f8b0:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cc6e749-c74e-43b5-b41c-1df236d64522;
 Wed, 03 Feb 2021 22:04:17 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id g7so743994iln.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 14:04:17 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id x1sm1530260ilj.61.2021.02.03.14.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 14:04:16 -0800 (PST)
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
X-Inumbo-ID: 6cc6e749-c74e-43b5-b41c-1df236d64522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TS3LrDoJycQjV29QvWKYiqYYnfjPrvlJnAgde44hakc=;
        b=JPfgN/cQckDAKBwY/QR67Thxr7yUmncDVdAEsxV3tW1GqAhZtNxf/7bZqZJVPEURM6
         gNf0epse2/nHHkPtKoQQWAnhZ3lTN5HVHAGrSumWmnDcgNuIZSHw05vo4N0d8nomOXBu
         KzI/w+18TtoWfFSVKCquRr94u7944j42U7Pv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TS3LrDoJycQjV29QvWKYiqYYnfjPrvlJnAgde44hakc=;
        b=kob4VGDzwGNzM+BJ7Wr26tTsDkMLf/m0w1j1t5ioOynY0IdQxt3KFpL6OHNNu/8mWN
         762udUzjEu4j17A5m3bBjgVQ2Z8S2M1CMdTv1ixZYmA+kf6oAZTNV2SCL8QE41JdF/DM
         4cFkQ1AgK8xUZJMboGId8MNhAEYF8CM2+uBXw3BXWrR3UKrZvSXYSyCFRpNBv/T5pmZv
         zAQIE1ntFZBH0cej0UbfFKhgmSidAr9G8bCpRmIpokW0wnfiJOGWX88AuDLjF9xlgIZo
         V+pbOjZ4YI3liPTsz4co2NtFlja2oq5Cmhd5DQkwYzA4PboRfuLESzbYjTj5PL53snZL
         0Y/A==
X-Gm-Message-State: AOAM5314Sf01Hi6dai99zPqquhSkQPmHgFh5WyOugosILWB1+47v7JBk
	VkHjvxZiahhuyUqgngb4zxIPng==
X-Google-Smtp-Source: ABdhPJyvZIEoiVKF4EWNvGXWyeEJte1usTtNJqqzhvl2jiJPmeCqXs4hHX0a7+80gvQ0IkJH1UvQjw==
X-Received: by 2002:a05:6e02:2189:: with SMTP id j9mr4197510ila.98.1612389856937;
        Wed, 03 Feb 2021 14:04:16 -0800 (PST)
Subject: Re: Linux 5.11-rc6 compile error
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Shuah Khan <skhan@linuxfoundation.org>
References: <8a358ee4-56bc-8e64-3176-88fd0d66176f@linuxfoundation.org>
 <CAHk-=wg983RfAiSSo4zLMADEfzLEuoBi+rye30Zrq7Bor8zg_Q@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7e05fe6d-9bf3-7d8d-5cda-8f4745bb144d@linuxfoundation.org>
Date: Wed, 3 Feb 2021 15:04:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg983RfAiSSo4zLMADEfzLEuoBi+rye30Zrq7Bor8zg_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/3/21 1:06 PM, Linus Torvalds wrote:
> On Wed, Feb 3, 2021 at 11:58 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> ld: arch/x86/built-in.a: member arch/x86/kernel/pci-swiotlb.o in archive
>> is not an object
>> make: *** [Makefile:1170: vmlinux] Error 1
> 
> That honestly sounds like something went wrong earlier - things like
> doing a system upgrade in the middle of the build, or perhaps running
> out of disk space or similar.
> 
> I've not seen any other reports of the same, and google doesn't find
> anything like that either.
> 
> Does it keep happening if you do a "git clean -dqfx" to make sure you
> have no old corrupt object files sound and re-do the whole build?
> 
>              Linus
> 

My bad. I was playing with two test systems this morning and totally
lost track. All is well after a "make clean" and make.

Sorry for the noise.

thanks,
-- Shuah

