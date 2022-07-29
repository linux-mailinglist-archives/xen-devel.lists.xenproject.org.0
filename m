Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884C584DD6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 11:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377417.610614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHLyo-0003t2-KO; Fri, 29 Jul 2022 09:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377417.610614; Fri, 29 Jul 2022 09:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHLyo-0003qt-Ho; Fri, 29 Jul 2022 09:08:22 +0000
Received: by outflank-mailman (input) for mailman id 377417;
 Fri, 29 Jul 2022 09:08:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHLyn-0003qn-3E
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 09:08:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHLyk-0006v8-Qz; Fri, 29 Jul 2022 09:08:18 +0000
Received: from [54.239.6.186] (helo=[192.168.0.45])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHLyk-0003It-Kr; Fri, 29 Jul 2022 09:08:18 +0000
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
	bh=dMgovwG4UFXazPp/eY8b4sdDXQBHRGM/mjFKMT68Zbc=; b=s5v+agOkd+CBO38d/r+XurxWcx
	xlm8P+VOP1gKfRBSP//CAahZZK3faBdJgZ472A28SDmbs3bewG7Ohlh+E7pUG79AL8f8N5pJrXB/u
	JbiExFRwE73F1PYp83nVTqYZO0Kih0rF0UWmYoH1ErPJrhfBFkgHYa7TVY3EBd1eP+p4=;
Message-ID: <ac219f32-641d-bbcb-2ae0-9410404458de@xen.org>
Date: Fri, 29 Jul 2022 10:08:16 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <57da62dc-81c2-5018-dfc7-5eb784ea53d1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Anthony)

Hi,

On 29/07/2022 07:48, Oleksandr Tyshchenko wrote:
> 
> On 29.07.22 09:22, Jan Beulich wrote:
> 
> Hello Jan
> 
>> On 29.07.2022 03:04, osstest service owner wrote:
>>> branch xen-unstable-smoke
>>> xenbranch xen-unstable-smoke
>>> job build-amd64-libvirt
>>> testid libvirt-build
>>>
>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>> Tree: libvirt_keycodemapdb https://urldefense.com/v3/__https://gitlab.com/keycodemap/keycodemapdb.git__;!!GF_29dbcQIUBPA!0s_nyAgds977dw0dGPgFJGkIaBiKiXH3nR11Ni6gGjN5gQmB0DEhKrm5SUX4R0WhK8YkQemR6RVhiojpzij9yLM$ [gitlab[.]com]
>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>> Tree: xen git://xenbits.xen.org/xen.git
>>>
>>> *** Found and reproduced problem changeset ***
>>>
>>>     Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>     Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>     Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>     Last fail repro: https://urldefense.com/v3/__http://logs.test-lab.xenproject.org/osstest/logs/171909/__;!!GF_29dbcQIUBPA!0s_nyAgds977dw0dGPgFJGkIaBiKiXH3nR11Ni6gGjN5gQmB0DEhKrm5SUX4R0WhK8YkQemR6RVhiojpmYABJkc$ [logs[.]test-lab[.]xenproject[.]org]
>>>
>>>
>>>     commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>     Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>     Date:   Fri Jul 15 22:20:24 2022 +0300
>>>     
>>>         libxl: Add support for Virtio disk configuration
>> Just in case you didn't notice it: Something's wrong here. I didn't look
>> at the details at all. Please advise whether a fix will soon arrive or
>> whether we should revert for the time being.
> 
> Sorry for the breakage. At the moment I have no idea what is wrong here,

 From the build log:

../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
../../src/libxl/xen_xl.c:779:17: error: enumeration value 
'LIBXL_DISK_BACKEND_STANDALONE' not handled in switch [-Werror=switch-enum]
                  switch (libxldisk->backend) {
                  ^~~~~~

The switch contains a default branch [1], so I am a bit puzzled why GCC 
is not happy here.

> 
> I will try to investigate and provide a fix by the end of the day.

So the general expectation is libvirt should be able to compile without 
using the new features provided by libxl.

In this case, I am not sure there is anything we could do in libxl 
without large rework to conditionally define LIBXL_DISK_BACKEND_STANDALONE.

So if a fix is necessary, then it will probably need to be in libvirt.

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=libvirt.git;a=blob;f=src/libxl/xen_xl.c;h=f9dc18ab18b208d319282ce422f46c75135c0673;hb=refs/heads/xen-tested-master#l779

-- 
Julien Grall

