Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C509124583E
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 16:56:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7K3Z-0001va-On; Sun, 16 Aug 2020 14:54:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0HP3=B2=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7K3Y-0001vV-0f
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 14:54:44 +0000
X-Inumbo-ID: e0a77e73-d05d-4be2-8254-f03b2266a778
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0a77e73-d05d-4be2-8254-f03b2266a778;
 Sun, 16 Aug 2020 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=vFDgtrkSMvXEwh7NUU2p4398/GwSYKSSJMdWtlzGazI=; b=r7/VvWAM6fbXB3CZ6fImmTCe1H
 dOUpr10368GhcSNX/X9GB9bwgIjWJNfV1YGLMQ2UbYMv/s5ZvtJSBJV8RhbRJQEBJbjFzk9ab15bh
 n95c1Fe39lCLv6tyrcNnczvQJTEE16pqnNQxgqKRHniMYKcBquCi2yZXfO+casZLY1kU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7K3W-0006ep-2f; Sun, 16 Aug 2020 14:54:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7K3V-0006KQ-R8; Sun, 16 Aug 2020 14:54:41 +0000
Subject: Re: u-boot vs. uefi as boot loaders on ARM
To: Roman Shaposhnik <roman@zededa.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: vicooodin@gmail.com, Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8a01a6e3-a786-2d68-5640-343bcc084b45@xen.org>
Date: Sun, 16 Aug 2020 15:54:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
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



On 15/08/2020 21:43, Roman Shaposhnik wrote:
> Hi!

Hi,

> with the recent excellent work by Anastasiia committed to the u-boot's
> main line, we now have two different ways of bringing ARM DomUs.
> 
> Is there any chance someone can educate the general public on pros
> and cons of both approaches?
> 
> In Project EVE we're still using uefi on ARM (to stay closer to the more
> "ARM in the cloud" use case) but perhaps the situation now is more
> nuanced?

UEFI is just standard, so I am guessing you are referring to 
Tianocore/EDK2. am I correct?

Recent version of U-boot are also able to partially UEFI. This means you 
could easily use GRUB with U-boot.

 From my understanding, U-boot is just a bootloader. Therefore it will 
not provide runtime services (such as date & time). Furthermore, the 
interface is less user friendly, you will have to know the memory layout 
in order to load binaries.

On the other hand, Tianocore/EDK2 is very similar to what non-embedded 
may be used to. It will not require you to know your memory layout. But 
this comes at the cost of a more complex bootloader to debug.

Cheers,

-- 
Julien Grall

