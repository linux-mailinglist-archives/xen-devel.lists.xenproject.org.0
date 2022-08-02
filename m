Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD9587B24
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 12:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379252.612553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIpbz-0007vE-Cm; Tue, 02 Aug 2022 10:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379252.612553; Tue, 02 Aug 2022 10:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIpbz-0007s1-9j; Tue, 02 Aug 2022 10:58:55 +0000
Received: by outflank-mailman (input) for mailman id 379252;
 Tue, 02 Aug 2022 10:58:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oIpby-0007rv-Cb
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 10:58:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIpbn-0003qK-JA; Tue, 02 Aug 2022 10:58:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIpbn-00079I-9i; Tue, 02 Aug 2022 10:58:43 +0000
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
	bh=QCMypwmoPAgoGGbaiQDzYD63xFVgcnIIzR7RwM3DLbQ=; b=XLG6F1y0XRAjd0Of4E4h3NNOYs
	s9ClbNAx4zA3wS2VaJ1Fp1BwJYpcTVynnlzCmqDDCR51ULdCJPPjEU8O/2wWS3BltUn+iXsDx3QeQ
	dPyEKrVlK+kwRqzUOyCLewU07fKYq+O8xRNsoQQlMojU5Z7WwTFRfQw7heh/jA6E4n/Q=;
Message-ID: <c4ebd102-f5ed-0109-4eda-a98a59cad21c@xen.org>
Date: Tue, 2 Aug 2022 11:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
 <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
 <ff565bad-c2be-5128-aeae-28f614f0230c@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ff565bad-c2be-5128-aeae-28f614f0230c@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/08/2022 14:15, Andrew Cooper wrote:
> On 01/08/2022 09:43, Julien Grall wrote:
>> (+ Committers)
>>
>> Hi Jan,
>>
>> On 01/08/2022 09:36, Jan Beulich wrote:
>>> On 29.07.2022 19:36, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 29/07/2022 07:22, Jan Beulich wrote:
>>>>> On 29.07.2022 03:04, osstest service owner wrote:
>>>>>> branch xen-unstable-smoke
>>>>>> xenbranch xen-unstable-smoke
>>>>>> job build-amd64-libvirt
>>>>>> testid libvirt-build
>>>>>>
>>>>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>>>>> Tree: libvirt_keycodemapdb
>>>>>> https://gitlab.com/keycodemap/keycodemapdb.git
>>>>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>>>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>>>>> Tree: xen git://xenbits.xen.org/xen.git
>>>>>>
>>>>>> *** Found and reproduced problem changeset ***
>>>>>>
>>>>>>      Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>>>>      Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>>      Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>>>>      Last fail repro:
>>>>>> http://logs.test-lab.xenproject.org/osstest/logs/171909/
>>>>>>
>>>>>>
>>>>>>      commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>>      Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>      Date:   Fri Jul 15 22:20:24 2022 +0300
>>>>>>              libxl: Add support for Virtio disk configuration
>>>>>
>>>>> Just in case you didn't notice it: Something's wrong here. I didn't
>>>>> look
>>>>> at the details at all. Please advise whether a fix will soon arrive or
>>>>> whether we should revert for the time being.
>>>>
>>>> We had discussion on IRC about this today. This is an issue in libvirt
>>>> rather than Xen. So I think a revert is not warrant here.
>>>>
>>>> Instead, it was suggested to force push because it is going to take
>>>> some
>>>> times to fix libvirt (see more below).
>>>>
>>>> Oleksandr already sent a patch to fix libvirt [1]. The problem is even
>>>> if this is accepted, our testing branch for libvirt is 2 years behind
>>>> because they switched to Meson and Osstest has not been adapted to the
>>>> new build system.
>>>>
>>>> Anthony kindly offered to update Osstest.
>>>>
>>>> Regarding force pushing, I am waiting for the Osstest result to confirm
>>>> that only the libvirt tests are failing in staging (we already have the
>>>> results for smoke). So my plan is to force push on Monday.
>>>>
>>>> Please let me know on Monday morning if you have some concerns with
>>>> this
>>>> approach.
>>>
>>> Actually I do - if we force push, the libvirt failure will stick, and
>>> hence potential further regressions introduced there would not be
>>> noticed.
>>
>> Well... We haven't had any push in libvirt for the past 2 years. So to
>> me it shows that nobody really care about the testing done. Therefore,
>> I don't see the problem if we don't spot further regressions.
>>
>> If we don't force push, we have two solutions:
>>    1) Revert Oleksandr's series
>>    2) Leave it until we have Osstest fixed *and* Oleksandr's patch
>> reached libvirt.
>>
>> The former is not an option for me, because Oleksandr's series is not
>> at fault. So this leave us to 2).
>>
>> So what's your proposal?
> 
> This situation is unfortunate, but Oleksandr's series is not at fault,
> and I don't think it is reasonable for libxl changes to be held hostage
> like this.
> 
> The testing situation with libvirt is already bad.  I don't think a
> force push is going to make it meaningfully worse.

I have forced pushed to the branch smoke using the flight 171899. For 
staging, it looks like the latest flight was testing f732240f, so we 
don't have one with the libvirt patches.

I am hoping the push to the smoke branch will trigger a xen-unstable flight.

Cheers,

-- 
Julien Grall

