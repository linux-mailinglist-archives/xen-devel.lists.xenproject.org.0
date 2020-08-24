Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B052505E4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 19:23:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAGB3-0007Sk-Oe; Mon, 24 Aug 2020 17:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G0tX=CC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAGB2-0007Sf-AO
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 17:22:36 +0000
X-Inumbo-ID: d2c4c7e1-1788-47a1-9d12-79f1c29bb7a1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2c4c7e1-1788-47a1-9d12-79f1c29bb7a1;
 Mon, 24 Aug 2020 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=eEGAWiUqGp/AJ21jWkJ/NM210PAKeZpGxuyqCdw8/NU=; b=r4Wdz2EmktlTOz5jVGuZbYLaZR
 B3Z3Yn9o9u9yUNVhURFB5gn7rzDqSdubR1DkjXvVQfteG4B0BIdhWtIKljkmHfRBkNn6yu/WjO8LD
 KDkbNG7zIQ+k74ph8lhJiYYpbMgKtOSRSWXaE2YT9fPjJpDULSUNVf3XDj38YuVkztQw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAGB1-0008Gb-3f; Mon, 24 Aug 2020 17:22:35 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAGB0-0005EO-T7; Mon, 24 Aug 2020 17:22:35 +0000
Subject: Re: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, nd <nd@arm.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-3-wei.chen@arm.com>
 <9667769d-e938-0dbc-c2f5-84880435c932@xen.org>
 <4CEBEFBA-6AEB-4CFC-B569-79056AAE0E3D@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <76da7a94-d53c-804d-54c6-b7ca52ffe61e@xen.org>
Date: Mon, 24 Aug 2020 18:22:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4CEBEFBA-6AEB-4CFC-B569-79056AAE0E3D@arm.com>
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



On 24/08/2020 17:57, Bertrand Marquis wrote:
> Hi Julien,

Hi,

> 
>> On 24 Aug 2020, at 14:34, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Wei,
>>
>> On 24/08/2020 04:28, Wei Chen wrote:
>>> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
>>> FP/SIMD implementations. Currently, we exactly know the meaning of
>>> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
>>> features presented. If there is a value 0x2 bumped in the future,
>>> Xen behaviors for value <= 0x1 can also take effect. But what Xen
>>> done for value <= 0x1 may not always cover new value 0x2 required.
>>
>> Right, but this will also happen with all the other features. This may actually confuse the users as they may think the rest of the features are fully supported which is not correct. For instance, dom0 will crash if you boot Xen on a SVE-capable hardware.
> 
> I would see this as an improvement already.

TBH, I only view this patch as a band-aid. I am OK with them but they 
need to be useful.

When I read "unknown value...", I have no clue whether the message is 
good or bad. It would be better to extend the message with what could go 
wrong. E.g "Unknown value X, this may result to corruption on the platform".

I would also consider to taint Xen as it may become unstable with this 
option set.

> More could be done for SVE (and other bits) but this should be in another patch set.
> 
>>
>>> We throw these messages to break the silence when Xen detected
>>> unknown FP/SIMD IDs to notice user to check.
>>
>> It feels a bit odd to me to print unknown for the FP/SIMD feature but not for all the rest.
>>
>> IMHO, the right approach is to sanitize ID registers exposed to domains and only expose features we know are correctly handled.
> 
> I actually started to look into this last week because I came to an issue comparable to SVE with pointer authentication.
> Maybe we should discuss this subject separately as clearing TID3 bit in HCR and emulating all ID registers is possible
> but I want to check first if this could have big impacts on performances

I don't expect any performance drop. In Linux, they will cache all the 
values and use alternative to avoid runtime check.

I also don't expect any OS to use them at runtime in hotpath.

> and see discuss how to design this as there
> could be a huge amount of cases for example if we want to allow different parameters for different domains.

I would suggest to first consider a simple approach where we expose the 
same view of the ID registers to all the guests but it is sanitized.

We can then discuss whether we want to have a per-guest view of the ID 
registers and how to configure it.

Regarding the implementation, I personally quite like the Linux 
cpufeature framework. It is quite powerful and I believe would suit 
quite well Xen.

Cheers,

-- 
Julien Grall

