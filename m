Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013FF1A09AF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 11:02:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLk72-00073Z-4J; Tue, 07 Apr 2020 09:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLk6z-00073U-VL
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 09:01:37 +0000
X-Inumbo-ID: 634c6866-78ae-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 634c6866-78ae-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z652YeEs/2kLzM0La3yrghnyvCLBH662Wd6GthnNSeI=; b=DZGBbvmffetRjur8md4SMKuFhU
 r0lvU9oTcdCWrooIEUSnbYVSW8VkKck2tt3wRhynO9eGxKAXqeXT5zglUAkwL7uyDsq3rM5A1+yY9
 eq7VdVcmMdoz1kz5mdjZYjAD5gI+SeEDQ84ZEN025HA4451JHvLWXxt43mLipzkRg24E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLk6v-0006Ve-KC; Tue, 07 Apr 2020 09:01:33 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLk6v-0007ZZ-D4; Tue, 07 Apr 2020 09:01:33 +0000
Subject: Re: [PATCH v2] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
To: Jan Beulich <jbeulich@suse.com>
References: <20200404130613.26428-1-julien@xen.org>
 <391ef401-b5d3-2f95-5fe3-c32f372dcc92@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c3e3db55-46bf-8df9-a934-64543a23c80a@xen.org>
Date: Tue, 7 Apr 2020 10:01:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <391ef401-b5d3-2f95-5fe3-c32f372dcc92@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 06/04/2020 12:01, Jan Beulich wrote:
> On 04.04.2020 15:06, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
>> data to guest handle marked const.
>>
>> Thankfully, no users of the helper will do that. Rather than hoping this
>> can be caught during review, harden copy_to_guest_offset() so the build
>> will fail if such users are introduced.
>>
>> There is no easy way to check whether a const is NULL in C99. The
>> approach used is to introduce an unused variable that is non-const and
>> assign the handle. If the handle were const, this would fail at build
>> because without an explicit cast, it is not possible to assign a const
>> variable to a non-const variable.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I'm not convinced it is a good idea to add (recurring) comments
> like you do - there are more aspects of these macros that would
> be worth commenting on, and commenting on some but not all may
> give the wrong impression of all subtleties being covered (also
> for others).

I thought you would say that, but I don't think I am the best person to 
describe all the other subtetly of the code. Yet I didn't want to not 
comment the oddity of using a maybe_unused variable.

> 
> In any event I'd like to ask that each header gain such a
> comment only once, with the other being a tiny reference to the
> one "complete" instance.

I am not entirely sure how this would look like. We would need to rely 
on _t having the same meaning across all the headers. This is quite easy 
to miss during review, so my preference still sticks to multiple comments.

Although I can reduce the size of the comment to one on top of the 
definition of _t. Something like: "Check if the handler is not const".

Cheers,

-- 
Julien Grall

