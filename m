Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657EB24B736
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 12:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8i9Q-0006Dh-IP; Thu, 20 Aug 2020 10:50:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8i9O-0006Da-Q3
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 10:50:30 +0000
X-Inumbo-ID: 5a073c4b-0a38-4419-97c2-2f18f614df36
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a073c4b-0a38-4419-97c2-2f18f614df36;
 Thu, 20 Aug 2020 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=VMv1F7aT4ZvyhS/9/1pa/u4zOzwKhk+TSi9eMZ4HMss=; b=31j6u0osp0eyF8c7GGEYXZfRoc
 wFIkCZVSNrl9bmoywzsf5XSqbZ3w8a2bi+A+7QEEtKg4V9ipBGvp8zUCCQw7VHnSPogN9RJDCNJkl
 q2QZ1soHB/a3ACaRCJXpzs+P9b1XYBYg3uXWmnZPZbgcPtpay6ETwvE/ijvG/Z9eQX4M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8i9N-0000hm-EO; Thu, 20 Aug 2020 10:50:29 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8i9M-00007u-WF; Thu, 20 Aug 2020 10:50:29 +0000
Subject: Re: u-boot vs. uefi as boot loaders on ARM
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, vicooodin@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
 <8a01a6e3-a786-2d68-5640-343bcc084b45@xen.org>
 <CAMmSBy92Aiz8btqkEbU9oVJifJ3ft0htPpjObGz-wYVjXuwvoQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <af097943-89fe-76db-54f4-89a3e534d586@xen.org>
Date: Thu, 20 Aug 2020 11:50:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy92Aiz8btqkEbU9oVJifJ3ft0htPpjObGz-wYVjXuwvoQ@mail.gmail.com>
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

Hi Roman,

On 16/08/2020 21:45, Roman Shaposhnik wrote:
> On Sun, Aug 16, 2020 at 7:54 AM Julien Grall <julien@xen.org> wrote:
>> On 15/08/2020 21:43, Roman Shaposhnik wrote:
>>> Hi!
>>
>> Hi,
>>
>>> with the recent excellent work by Anastasiia committed to the u-boot's
>>> main line, we now have two different ways of bringing ARM DomUs.
>>>
>>> Is there any chance someone can educate the general public on pros
>>> and cons of both approaches?
>>>
>>> In Project EVE we're still using uefi on ARM (to stay closer to the more
>>> "ARM in the cloud" use case) but perhaps the situation now is more
>>> nuanced?
>>
>> UEFI is just standard, so I am guessing you are referring to
>> Tianocore/EDK2. am I correct?
> 
> Yes, but I was actually referring to both in a way (I should've been
> clearer tho).
> To be more explicit my question was around trying to compare a "standardized"
> way of botting a generic DomU on ARM (and that standard is UEFI with one
> particular implementation that works out of the box with Xen being TC/EDK2) with
> a more ad-hoc u-boot style of booting.
> 
>> Recent version of U-boot are also able to partially UEFI. This means you
>> could easily use GRUB with U-boot.
> 
> Yup -- which complicated things even more. And it is funny you should mention
> it, since we actually started with TC/EDK2 for RaspberryPi4 as a board
> bootloader,
> but quickly switched to u-boot with UEFI shim layer, since it was much smaller,
> better supported (still?) and gave us all we needed to boot Xen on RPi4 as a
> UEFI payload.
> 
>>  From my understanding, U-boot is just a bootloader. Therefore it will
>> not provide runtime services (such as date & time).
> 
> It actually does provide some of that (see below)

Cool! Although, it looks mostly related to the environment variable though.

> 
>> Furthermore, the
>> interface is less user friendly, you will have to know the memory layout
>> in order to load binaries.
>>
>> On the other hand, Tianocore/EDK2 is very similar to what non-embedded
>> may be used to. It will not require you to know your memory layout. But
>> this comes at the cost of a more complex bootloader to debug.
> 
> That's literally the crux of my question -- trying to understand what use cases
> either one of them is meant for. Especially given that this shim layer is now
> quite capable:
>      https://github.com/ARM-software/u-boot/blob/master/doc/README.uefi#L127

While I can see major differences when using either on baremetal (you 
have better control on the Device-Tree with U-boot), it is much less 
clear in a guest. Maybe Anastasiia can explain why they decided to add 
support in U-boot? :).

Cheers,

-- 
Julien Grall

