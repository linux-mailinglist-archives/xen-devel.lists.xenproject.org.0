Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035681F775F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhzo-0008Po-VO; Fri, 12 Jun 2020 11:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjhzn-0008Pg-R2
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:37:15 +0000
X-Inumbo-ID: 10636d08-aca1-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10636d08-aca1-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MLb24URko1JnPiR3wZfJipAfelkD9ExiUL5o+KFNzUg=; b=aXwFpbFnGIKHecrJKzzEdyZPv/
 sCuXuqLK3W4jUzafQ/xi3O1Y54aZ41cEY87kzpOu9mNIHnHmuATVq59dhL2P105azbJcPkcOBlN/z
 9+g5yFUMKxEU/VBhi22YMcVU0f8Lb8aWd09hEJkaEYtZzlMryV3+MGGm3NAAH7kTJkHg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjhzm-0008CM-Ua; Fri, 12 Jun 2020 11:37:14 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjhzm-0002tq-O5; Fri, 12 Jun 2020 11:37:14 +0000
Subject: Re: [PATCH 2/2] xen/arm: Support runstate crossing pages
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111117310.2815@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9379a633-e63a-bf7a-6e2a-67a338737a81@xen.org>
Date: Fri, 12 Jun 2020 12:37:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006111117310.2815@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 12/06/2020 02:10, Stefano Stabellini wrote:
> On Thu, 11 Jun 2020, Bertrand Marquis wrote:
>> Add support for runstate area register with the structure crossing pages
>> The code is storing up to 2 pages reference during the hypercall.
>> During a context switch, the code is computing where the
>> state_entry_time is and is breaking the memcpy in 2 parts when it is
>> required.
>>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Clearly a lot of efforts went into this patch, thanks you Bertrand.
> 
> The change is complex for the feature it adds. I wonder if we could use
> ioremap (or maybe something similar but using a different virtual space)
> to simplify it. Julien, do you have good ideas?

ioremap() is for MMIO region, so you would want to use vmap(). Note that 
former is just a wrapper of the latter.

vmap() is probably a good start for now, but not ideal for long term 
because the vmap() area is fairly small (768MB) and if we want to go 
towards a secret-free hypervisor on Arm, we would want to restrict the 
visibility of the mapping to the other CPUs.

I think it would be good to have some per-CPU/per-domain mapping to 
limit the waste of the address space. But this will require to 
deduplicate page-tables for arm64 (I was actually looking at it over the 
past few week-ends).

For the time-being, I would suggest to use vmap(). The memory is always 
direct mapped on arm64, so it should make no different for security concern.

Cheers,

-- 
Julien Grall

