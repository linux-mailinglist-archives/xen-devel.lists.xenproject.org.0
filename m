Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB455586684
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378583.611832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIR1q-00019K-1U; Mon, 01 Aug 2022 08:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378583.611832; Mon, 01 Aug 2022 08:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIR1p-00016Z-Ur; Mon, 01 Aug 2022 08:43:57 +0000
Received: by outflank-mailman (input) for mailman id 378583;
 Mon, 01 Aug 2022 08:43:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oIR1o-00016R-Rj
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:43:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIR1k-0006Cx-3P; Mon, 01 Aug 2022 08:43:52 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIR1j-0008Ll-Tx; Mon, 01 Aug 2022 08:43:52 +0000
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
	bh=ch40GrQJAwkoS42EnlHgxyq7LdfKjODV54nXhZyVpQs=; b=mFdVsnNYHsEVmqz+h4bjgzOk/U
	sYgW+fbsnojyVPu1x9I7rwpAnpYB4ux5Guq+TKgItMw/Yng7b6rV0wsffK1/wv4I8f2e6tgVaHsf0
	/pmb1QUfMAmyUt7+PlnhnYvlBZisOqIvWHUVqoWxxrBPudBheaN42IHH8RSSNAhu3jcc=;
Message-ID: <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
Date: Mon, 1 Aug 2022 09:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Committers)

Hi Jan,

On 01/08/2022 09:36, Jan Beulich wrote:
> On 29.07.2022 19:36, Julien Grall wrote:
>> Hi Jan,
>>
>> On 29/07/2022 07:22, Jan Beulich wrote:
>>> On 29.07.2022 03:04, osstest service owner wrote:
>>>> branch xen-unstable-smoke
>>>> xenbranch xen-unstable-smoke
>>>> job build-amd64-libvirt
>>>> testid libvirt-build
>>>>
>>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>>> Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
>>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>>> Tree: xen git://xenbits.xen.org/xen.git
>>>>
>>>> *** Found and reproduced problem changeset ***
>>>>
>>>>     Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>>     Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>     Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>>     Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/
>>>>
>>>>
>>>>     commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>     Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>     Date:   Fri Jul 15 22:20:24 2022 +0300
>>>>     
>>>>         libxl: Add support for Virtio disk configuration
>>>
>>> Just in case you didn't notice it: Something's wrong here. I didn't look
>>> at the details at all. Please advise whether a fix will soon arrive or
>>> whether we should revert for the time being.
>>
>> We had discussion on IRC about this today. This is an issue in libvirt
>> rather than Xen. So I think a revert is not warrant here.
>>
>> Instead, it was suggested to force push because it is going to take some
>> times to fix libvirt (see more below).
>>
>> Oleksandr already sent a patch to fix libvirt [1]. The problem is even
>> if this is accepted, our testing branch for libvirt is 2 years behind
>> because they switched to Meson and Osstest has not been adapted to the
>> new build system.
>>
>> Anthony kindly offered to update Osstest.
>>
>> Regarding force pushing, I am waiting for the Osstest result to confirm
>> that only the libvirt tests are failing in staging (we already have the
>> results for smoke). So my plan is to force push on Monday.
>>
>> Please let me know on Monday morning if you have some concerns with this
>> approach.
> 
> Actually I do - if we force push, the libvirt failure will stick, and
> hence potential further regressions introduced there would not be noticed.

Well... We haven't had any push in libvirt for the past 2 years. So to 
me it shows that nobody really care about the testing done. Therefore, I 
don't see the problem if we don't spot further regressions.

If we don't force push, we have two solutions:
   1) Revert Oleksandr's series
   2) Leave it until we have Osstest fixed *and* Oleksandr's patch 
reached libvirt.

The former is not an option for me, because Oleksandr's series is not at 
fault. So this leave us to 2).

So what's your proposal?

Cheers,

-- 
Julien Grall

