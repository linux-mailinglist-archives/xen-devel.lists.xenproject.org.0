Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B222660A3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:51:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjSN-0006GX-Lg; Fri, 11 Sep 2020 13:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGjSM-0006GS-Lb
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:51:14 +0000
X-Inumbo-ID: deb4e889-c735-46c2-94d1-392775a3aec2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deb4e889-c735-46c2-94d1-392775a3aec2;
 Fri, 11 Sep 2020 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=yylPWs7P8WXhh/NS9gGGJPw7Doio1ls6Q0baes1lyyE=; b=CnWbfQa8f4I67d360+NXUhNad3
 maxK3/rtcAzxmx/Ctq3aTnkqYW/tpKwQToaMjpl2MKmqZ4dY7rb3l2yl143JvIvid21idkkNlmGS8
 r5F+az6Z4bns+VZIsNgcU6WQfO5c6nA37O8ozLKfdQJvKfaH6+AC/GeoxKvYUZOS9oXA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGjSK-0001W6-4x; Fri, 11 Sep 2020 13:51:12 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGjSJ-0000Mn-RV; Fri, 11 Sep 2020 13:51:11 +0000
Subject: Re: preparations for 4.13.2 and 4.12.4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <78572a41-a84b-0c1a-0f17-4e4b484fc6cd@xen.org>
Date: Fri, 11 Sep 2020 14:51:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
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

Hi Bertrand,

On 11/09/2020 14:32, Bertrand Marquis wrote:
>> On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> All,
>>
>> the releases are about due, but will of course want to wait for the
>> XSA fixes going public on the 22nd. Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant. (Ian, Julien, Stefano: I notice there once
>> again haven't been any tools or Arm side backports at all so far
>> since the most recent stable releases from these branches. But
>> maybe there simply aren't any.)
>>
>> One that I have queued already, but which first need to at least
>> pass the push gate to master, are
>>
>> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e820
>> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
>> b4e41b1750d5 b4e41b1750d5 [4.14 only]
>>
>> On the Arm side I'd also like to ask for
>>
>> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
> +1
> 
> Could those fixes also be considered:
> 3b418b3326 arm: Add Neoverse N1 processor identification
> 858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
> 1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT erratum
The processor is quite new so may I ask why we would want to backport on 
older Xen?

> 968bb86d04 xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch

I would consider this one because 4.12 as already errata for A76, so it 
is meant to work with it.

> f4c1a541fa xen/arm: Throw messages for unknown FP/SIMD implement ID

This is technically not a bug fix and there are many ways for older Xen 
to not work on newer/recent processors. So I wouldn't consider this as a 
backport.

Cheers,

-- 
Julien Grall

