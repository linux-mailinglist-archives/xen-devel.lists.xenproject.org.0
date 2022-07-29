Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3A584ECC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 12:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377463.610681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHNEz-0007wi-07; Fri, 29 Jul 2022 10:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377463.610681; Fri, 29 Jul 2022 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHNEy-0007tu-TB; Fri, 29 Jul 2022 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 377463;
 Fri, 29 Jul 2022 10:29:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHNEy-0007to-44
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 10:29:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHNEv-0008MY-M7; Fri, 29 Jul 2022 10:29:05 +0000
Received: from [54.239.6.186] (helo=[192.168.0.45])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHNEv-0007PF-GC; Fri, 29 Jul 2022 10:29:05 +0000
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
	bh=mrIF4+c4gg6d6S42D/KMAa4cg223BgXiTpyycRt+Ghg=; b=oZp1aGiXtsWJP6GcY6N+7US9I1
	tlECyLZaFC5qijry1xQxY5nzK5y4lxAPsYdZQrcQtKJwGOk04oC7lSKVUFF6+NkNg3v3OEiGeZYVd
	hNDgzQor7pSrHCsQjNOClaKtPbix0fQ9t2+wDtYK78Bi5GpO1debJJbCAxncd8e7k9x4=;
Message-ID: <0adaeec4-d810-f235-b3a0-951610db216a@xen.org>
Date: Fri, 29 Jul 2022 11:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <57da62dc-81c2-5018-dfc7-5eb784ea53d1@epam.com>
 <ac219f32-641d-bbcb-2ae0-9410404458de@xen.org>
 <0fa56cfe-85dc-5fd2-6405-e18115420306@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0fa56cfe-85dc-5fd2-6405-e18115420306@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 29/07/2022 11:25, Oleksandr Tyshchenko wrote:
> 
> On 29.07.22 12:08, Julien Grall wrote:
> 
> 
> Hello Julien
> 
>> (+ Anthony)
>>
>> Hi,
>>
>> On 29/07/2022 07:48, Oleksandr Tyshchenko wrote:
>>>
>>> On 29.07.22 09:22, Jan Beulich wrote:
>>>
>>> Hello Jan
>>>
>>>> On 29.07.2022 03:04, osstest service owner wrote:
>>>>> branch xen-unstable-smoke
>>>>> xenbranch xen-unstable-smoke
>>>>> job build-amd64-libvirt
>>>>> testid libvirt-build
>>>>>
>>>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>>>> Tree: libvirt_keycodemapdb
>>>>> https://urldefense.com/v3/__https://gitlab.com/keycodemap/keycodemapdb.git__;!!GF_29dbcQIUBPA!0s_nyAgds977dw0dGPgFJGkIaBiKiXH3nR11Ni6gGjN5gQmB0DEhKrm5SUX4R0WhK8YkQemR6RVhiojpzij9yLM$
>>>>> [gitlab[.]com]
>>>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>>>> Tree: xen git://xenbits.xen.org/xen.git
>>>>>
>>>>> *** Found and reproduced problem changeset ***
>>>>>
>>>>>      Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>>>      Bug introduced: 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>      Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>>>      Last fail repro:
>>>>> https://urldefense.com/v3/__http://logs.test-lab.xenproject.org/osstest/logs/171909/__;!!GF_29dbcQIUBPA!0s_nyAgds977dw0dGPgFJGkIaBiKiXH3nR11Ni6gGjN5gQmB0DEhKrm5SUX4R0WhK8YkQemR6RVhiojpmYABJkc$
>>>>> [logs[.]test-lab[.]xenproject[.]org]
>>>>>
>>>>>
>>>>>      commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>      Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>      Date:   Fri Jul 15 22:20:24 2022 +0300
>>>>>              libxl: Add support for Virtio disk configuration
>>>> Just in case you didn't notice it: Something's wrong here. I didn't
>>>> look
>>>> at the details at all. Please advise whether a fix will soon arrive or
>>>> whether we should revert for the time being.
>>>
>>> Sorry for the breakage. At the moment I have no idea what is wrong here,
>>
>>  From the build log:
>>
>> ../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
>> ../../src/libxl/xen_xl.c:779:17: error: enumeration value
>> 'LIBXL_DISK_BACKEND_STANDALONE' not handled in switch
>> [-Werror=switch-enum]
>>                   switch (libxldisk->backend) {
>>                   ^~~~~~
>>
>> The switch contains a default branch [1], so I am a bit puzzled why
>> GCC is not happy here.
> 
> Libvirt seems to compiled with -Wswitch-enum
> 
> And https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html says the
> following:
> 
> "-Wswitch-enum
> 
> Warn whenever a switch statement has an index of enumerated type and
> lacks a case for one or more of the named codes of that enumeration.
> case labels outside the enumeration range also provoke warnings when
> this option is used. The only difference between -Wswitch and this
> option is that this option gives a warning about an omitted enumeration
> code even if there is a default label."

Thanks for digging! That's explained the error. I still don't think we 
can solve the error in libxl.

So I would suggest to involve the libvirt folks to know how they want to 
solve the issue.

Cheers,

-- 
Julien Grall

