Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F258549F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377678.610967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHTvA-0003xq-M0; Fri, 29 Jul 2022 17:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377678.610967; Fri, 29 Jul 2022 17:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHTvA-0003vC-Hw; Fri, 29 Jul 2022 17:37:08 +0000
Received: by outflank-mailman (input) for mailman id 377678;
 Fri, 29 Jul 2022 17:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHTv9-0003v1-5N
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:37:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHTv1-0007wa-Jv; Fri, 29 Jul 2022 17:36:59 +0000
Received: from [54.239.6.186] (helo=[192.168.0.45])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHTv1-0008GC-Bu; Fri, 29 Jul 2022 17:36:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=FXAMCUaMzKXp+xgrh2RexegPfNoHS1Rk6RUnZH85ZIs=; b=TPhtVOkMUAJVV7u1KZUd4jqzGa
	c+Ec72B8UQGkxBviBbsMTIcfFRA3bL6x7ETA2kTqM4+gin7c7ucD1vceb6CmhYrOTE8y8ZuYKceyK
	eo7pzApR3MA0nY2SThKVEBaCFRilWELQHDB3MH/vqUj6rZKRTtxscKNQy+k+wNQjOwWE=;
Message-ID: <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
Date: Fri, 29 Jul 2022 18:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/07/2022 07:22, Jan Beulich wrote:
> On 29.07.2022 03:04, osstest service owner wrote:
>> branch xen-unstable-smoke
>> xenbranch xen-unstable-smoke
>> job build-amd64-libvirt
>> testid libvirt-build
>>
>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>> Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>> Tree: xen git://xenbits.xen.org/xen.git
>>
>> *** Found and reproduced problem changeset ***
>>
>>    Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>    Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>    Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>    Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/
>>
>>
>>    commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>    Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>    Date:   Fri Jul 15 22:20:24 2022 +0300
>>    
>>        libxl: Add support for Virtio disk configuration
> 
> Just in case you didn't notice it: Something's wrong here. I didn't look
> at the details at all. Please advise whether a fix will soon arrive or
> whether we should revert for the time being.

We had discussion on IRC about this today. This is an issue in libvirt 
rather than Xen. So I think a revert is not warrant here.

Instead, it was suggested to force push because it is going to take some 
times to fix libvirt (see more below).

Oleksandr already sent a patch to fix libvirt [1]. The problem is even 
if this is accepted, our testing branch for libvirt is 2 years behind 
because they switched to Meson and Osstest has not been adapted to the 
new build system.

Anthony kindly offered to update Osstest.

Regarding force pushing, I am waiting for the Osstest result to confirm 
that only the libvirt tests are failing in staging (we already have the 
results for smoke). So my plan is to force push on Monday.

Please let me know on Monday morning if you have some concerns with this 
approach.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20220729155024.3327364-1-olekstysh@gmail.com/
-- 
Julien Grall

