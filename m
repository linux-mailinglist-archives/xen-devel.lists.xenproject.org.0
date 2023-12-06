Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B67807877
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 20:17:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649404.1013900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAxOM-0005iy-Rr; Wed, 06 Dec 2023 19:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649404.1013900; Wed, 06 Dec 2023 19:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAxOM-0005gL-Og; Wed, 06 Dec 2023 19:17:06 +0000
Received: by outflank-mailman (input) for mailman id 649404;
 Wed, 06 Dec 2023 19:17:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAxOL-0005es-DE
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 19:17:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAxO7-0008Cy-Bj; Wed, 06 Dec 2023 19:16:51 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.253]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAxO7-00061n-32; Wed, 06 Dec 2023 19:16:51 +0000
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
	bh=Si9qpS/ukHHUUZ+pdHczgjD5HU9rSF3Tjs44fcnyMU8=; b=Bcp9JwomvJOc4okiaEutg2ywxw
	32Hq6aVNRFXZ5onAAHLOhY3AmuFyXgo3aQ7M5WegqSK1dFDLhaj1BzKy1+uCwty5LNbWEwyyeNqPJ
	hn09mwXEF/K/BvgdCUtBUJ2VVeFljqO74/3V2tzwjOd4XTt9GGn/DRXDHcEIlRNzbiOU=;
Message-ID: <5b9d3f50-fa84-4960-b91f-d1418b8399fd@xen.org>
Date: Wed, 6 Dec 2023 19:16:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Only compile the hypervisor with
 -Wdeclaration-after-statement
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>,
 xen-devel@lists.xenproject.org
References: <20231205183226.26636-1-julien@xen.org>
 <c7d844ea-139e-416f-bb8e-51e63c0fe3ed@suse.com>
 <5f31e7d9-fedb-43d4-b8e6-9304c387f282@xen.org>
 <1f46fa0d-8208-49fc-bb38-451616d1e7a9@suse.com>
 <f75edcea-c846-4e31-866d-4df7a7e0cbff@xen.org>
 <0033f56a-cdb7-408b-b78e-823135a463af@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0033f56a-cdb7-408b-b78e-823135a463af@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/12/2023 11:08, Jan Beulich wrote:
> On 06.12.2023 12:07, Julien Grall wrote:
>> Hi Jan,
>>
>> On 06/12/2023 11:05, Jan Beulich wrote:
>>> On 06.12.2023 11:52, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 06/12/2023 08:52, Jan Beulich wrote:
>>>>> On 05.12.2023 19:32, Julien Grall wrote:
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> Right now, all tools and hypervisor will be complied with the option
>>>>>> -Wdeclaration-after-statement. While most of the code in the hypervisor
>>>>>> is controlled by us, for tools we may import external libraries.
>>>>>>
>>>>>> The build will fail if one of them are using the construct we are
>>>>>> trying to prevent. This is the case when building against Python 3.12
>>>>>> and Yocto:
>>>>>>
>>>>>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
>>>>>> |                  from xen/lowlevel/xc/xc.c:8:
>>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
>>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>>>>>> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
>>>>>> |       |     ^~~~~~~~~~~
>>>>>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
>>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
>>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>>>>>> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
>>>>>> |       |     ^~~~~~~~~~
>>>>>> | cc1: all warnings being treated as errors
>>>>>>
>>>>>> Looking at the tools directory, a fair few directory already add
>>>>>> -Wno-declaration-after-statement to inhibit the default behavior.
>>>>>>
>>>>>> We have always build the hypervisor with the flag, so for now remove
>>>>>> only the flag for anything but the hypervisor. We can decide at later
>>>>>> time whether we want to relax.
>>>>>>
>>>>>> Also remove the -Wno-declaration-after-statement in some subdirectory
>>>>>> as the flag is now unnecessary.
>>>>>
>>>>> With all these removals, don't you need to add the option centrally
>>>>> somewhere? Or else are you sure that no compiler version, including
>>>>> distro-customized ones, would ever come with the warning enabled by
>>>>> default?
>>>>
>>>> I can't really go through the dozens of different built compilers... But
>>>> I would find odd that a compiler will force this option. I view it as a
>>>> style enforcement option and that's not up to a distro to decide what
>>>> every projects do.
>>>>
>>>> Also, Allowing your thinking, we would need to add -Wno-switch-default &
>>>> co just in case a compiler decide to enable it. So where would we stop
>>>> adding -Wno-*?
>>>>
>>>> I don't think this is very scalable.
>>>
>>> I agree on this point, but: With the change you do there's a (slim) risk
>>> of introducing build breakage. With other -W* / -Wno-* options we haven't
>>> had reports of build issues.
>>
>> The chance is very unlikely here. So I am not in favor of doing this. I
>> would like the opinion from the others.
> 
> Well, it's Anthony anyway who has the final say. I'm not going to insist,
> I merely wanted to point out a possible issue.

Anthony approved it. So I have committed the patch.

Cheers,

-- 
Julien Grall

