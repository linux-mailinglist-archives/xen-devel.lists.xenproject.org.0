Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315FACC6588
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 08:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188571.1509710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVljs-0007Hl-3T; Wed, 17 Dec 2025 07:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188571.1509710; Wed, 17 Dec 2025 07:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVljs-0007GH-0r; Wed, 17 Dec 2025 07:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1188571;
 Wed, 17 Dec 2025 07:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzDs=6X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vVljr-0006n6-1B
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 07:14:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 022ed189-db18-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 08:14:21 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id EA47B4EE8115;
 Wed, 17 Dec 2025 08:14:20 +0100 (CET)
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
X-Inumbo-ID: 022ed189-db18-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765955661;
	b=EfZWB/KLw0njy44BUn66HNoHGfJ9n8OCGe0L7R0RmzKRlC5tStlmS+nPfWnIWQLUZSKB
	 qlgpp6fKCynyuRcJ54GF9OH7n2r7dlMaf3JMgpxytRdTD6lDMPhy0LS4BAdg8AmimfLRj
	 WcMrQYu6Fwt2lNufx/xX9oKyYMUbcBGwNYQExHeZL4bt/kkZNCVSJtayQ0WSO4DHIz4O5
	 8tq9ZuHfXyPlyQJF2Eq/1HeFIR9aUO8stKBgYjq0XgJfJQE+4c8v9ry4LZBx4JhY5zUhf
	 WcyS8lpVvaXVB3ZA3gMlOShzgVdjPFn3B/8s0jfKtprUk7KBFjq3po9w8JUyadhhqPoWD
	 wM+p6dh1v2eGx2tY9Wthkn637fUc0RNhf4ZAcc+6+dbOdVJyhtOOgltCvwhF3RMPasX+W
	 c+5nnMygEQYMC7ljtfJMB0B1B6k7Cb3k0eaNIRYxOMKxxStYz3HUNfbsIDdXY8QE3SAZQ
	 N0HPb51RnAksgG5bNZ6GJveJKfAukM/NGiiZTRtyW//wyWbkqUhJJc9HFLbzUeQRUDMap
	 YsYrAsXSlYpFItX4nOrapK8/pZ8S/uwb3vg6On9YikvF4c9P6LmqlEdLAMo9FA/mBF5yJ
	 DcpDvH+QVLcezuFt6e4TgxRsCLcZbm8DAJYX9/agbvQdcXnhdUijHIlF30WkLgc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765955661;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=9G13xjQLt7TZaWg/j6FsmkYWUAm6WOPwYtU312gTkCM=;
	b=Qc8V9jj8S4WyiY3BSKvIlEa7g/EvmcYJ7BeELCSZ5vSJFQzz7qXz4VlpuwJquPTnyGKs
	 XLrPOtuAor/Vlr00HH7HO/OzXTyBl+sy4OVhbN6lrTgAvqD5TcQhNdbUkQfZzlGAzJmHp
	 gGSDdYGLUkyTNgSqPQk96uJzIHkwMoROWuDp5cJF/kXtAh22STSJeiyyAXY7VFvguVZvx
	 J37i+z6ABtKGXUug+RGWBmB1lvnmL8OvRc/egEu2zPi2ffTAkUFXsFozx3IpAtM2UDR4U
	 oTY40V6OaND3OBfXOxG5NkyPVCtXA2l4cGhk40/WCvMZWDCXy/t012X5JTjMl1gpOgCHb
	 125WVgk827Jo9lt8ZbhR0PoV3ToHzRPCPFcAaMUzZdHLozLD7yBVcfZpoz0z0i41sG0zA
	 8bMjUNAvz2ODnGYJ4KLBTla7kJdM3CIcC7ADHhxF+KQYKEhv1PvCpsID8dfYelHFWUrfo
	 HNRBM008CWFHIerqrfnkILJbizN0Y0SfxzDCeSfnEgGasrjzz/NQUeZeE/wPQ0UnU+g5p
	 kLtGh2Tca7YjEYIbjOUty+Tp2D3TtjnqA4AflKM1qIRy7h9WJf5mQFbJsnsZCkkzbF0so
	 3+b3/fs4Ul34PSh9ms9vrJQQ2kJLQUHF4UE0nrUUiw4WqnTk8WE1dv7RDGY/+wU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765955660; bh=rsMbVP4iK8qrQsXEDQI10Mh//VZIRZDVp5BOCg6z4dM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BCk/wRaXVLjyHYkwo3IPDeLUsxJzkkKphE8M8eKTDSioCSxinxD3rZIdKCG2GsTGf
	 EaMypMH6sLMEBMnxC0dSVOOwlC6p8rkIHRUNEoeQLyIGn2KnTMhOgAy9xW8BICzk1v
	 ucbPejZQO9qVArDZs+j4s1EJjkNW+RX16o99S6EmsLUbTT/lHRnvp8mQ+sCZ/yM5Xt
	 ceZl67RL5OwJpfY8GPUnzJ51iFF+CeOD8eiMeuEvxb9M3pAo7J9iCREvTya5G7M6v2
	 koJo14uL2yHKy4MpKaXMnXeMUlYnn8Gi7yuujP3Qztst4Qzhb2+2HfCI/zupjehYyZ
	 f7NC+c8ZAj7ig==
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 08:14:20 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: X86: build failure
In-Reply-To: <709d7c2552828a68d40b93ba4211ae81@bugseng.com>
References: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
 <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
 <0066dae8-a05b-488e-8dfb-0685e1e9f700@epam.com>
 <709d7c2552828a68d40b93ba4211ae81@bugseng.com>
Message-ID: <1e1cbace9863918afd58319cb2c26f7e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-17 08:13, Nicola Vetrini wrote:
> On 2025-12-17 01:12, Grygorii Strashko wrote:
>> Hi Andrew,
>> 
>> On 17.12.25 01:54, Andrew Cooper wrote:
>>> On 16/12/2025 11:35 pm, Grygorii Strashko wrote:
>>>> Hi All,
>>>> 
>>>> I experience build failure with following Kconfig combination:
>>>>   CONFIG_DEBUG=n and CONFIG_XEN_IBT=n
>>>> 
>>>> with gcc:
>>>>   gcc --version
>>>>   gcc (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0
>>>>   Copyright (C) 2021 Free Software Foundation, Inc.
>>>>   This is free software; see the source for copying conditions.  
>>>> There
>>>> is NO
>>>>   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>>>> PURPOSE.
>>>> 
>>>> Is this known issue?
>>>> 
>>>> ====== log ===============
>>>>    CC      arch/x86/x86_emulate.o
>>>> In file included from arch/x86/x86_emulate.c:27:
>>>> arch/x86/x86_emulate/x86_emulate.c: In function ‘x86_emulate’:
>>>> arch/x86/x86_emulate/x86_emulate.c:70:36: error: writing 1 byte into 
>>>> a
>>>> region of size 0 [-Werror=stringop-overflow=]
>>>>     70 |     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 
>>>> :
>>>> 0x8f; \
>>>> arch/x86/x86_emulate/x86_emulate.c:78:9: note: in expansion of macro
>>>> ‘copy_VEX’
>>>>     78 |         copy_VEX(ptr, vex); \
>>>>        |         ^~~~~~~~
>>>> arch/x86/x86_emulate/x86_emulate.c:8140:13: note: in expansion of
>>>> macro ‘copy_REX_VEX’
>>>>   8140 |             copy_REX_VEX(opc, rex_prefix, vex);
>>>>        |             ^~~~~~~~~~~~
>>>> In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>>>>                   from arch/x86/x86_emulate.c:27:
>>>> arch/x86/x86_emulate/private.h:691:17: note: at offset [0, 4095] 
>>>> into
>>>> destination object of size [0, 9223372036854775807] allocated by
>>>> ‘map_domain_page’
>>>>    691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) 
>>>> + \
>>>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> arch/x86/x86_emulate/x86_emulate.c:60:21: note: in expansion of 
>>>> macro
>>>> ‘get_stub’
>>>>     60 |     uint8_t *buf_ = get_stub(stub); \
>>>>        |                     ^~~~~~~~
>>>> arch/x86/x86_emulate/x86_emulate.c:3354:15: note: in expansion of
>>>> macro ‘init_prefixes’
>>>>   3354 |         opc = init_prefixes(stub);
>>>>        |               ^~~~~~~~~~~~~
>>>> arch/x86/x86_emulate/private.h:691:17: note: at offset [1, 4096] 
>>>> into
>>>> destination object of size [0, 9223372036854775807] allocated by
>>>> ‘map_domain_page’
>>>>    691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) 
>>>> + \
>>>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> arch/x86/x86_emulate/x86_emulate.c:94:21: note: in expansion of 
>>>> macro
>>>> ‘get_stub’
>>>>     94 |     uint8_t *buf_ = get_stub(stub); \
>>>>        |                     ^~~~~~~~
>>>> arch/x86/x86_emulate/x86_emulate.c:3402:15: note: in expansion of
>>>> macro ‘init_evex’
>>>>   3402 |         opc = init_evex(stub);
>>>> [...]
>>>> 
>>> 
>>> Hmm - that looks like more of the GCC 11 bounds bugs, but that's what
>>> the gcc11_wrap() visible at the top is supposed to be fixing.
>>> 
>>> Neither of those CONFIG options ought to be relevant.
>>> 
>>> Which Ubuntu is this?  Is it something local, or from one of our CI
>>> containers?  Is this on staging, or local?
>> 
>> Local. Nothing special - "Ubuntu 22.04.5 LTS"
>> 
>> ======== apt show gcc
>> Package: gcc
>> Version: 4:11.2.0-1ubuntu1
> 
> The minimum gcc version is 5.1 on staging, perhaps this is due to that

Ah, nevermind, too early in the morning :)

> 
>> Priority: optional
>> Build-Essential: yes
>> Section: devel
>> Source: gcc-defaults (1.193ubuntu1)
>> Origin: Ubuntu
>> Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
>> Original-Maintainer: Debian GCC Maintainers 
>> <debian-gcc@lists.debian.org>
>> Bugs: https://bugs.launchpad.net/ubuntu/+filebug
>> Installed-Size: 51,2 kB
>> Provides: c-compiler, gcc-x86-64-linux-gnu (= 4:11.2.0-1ubuntu1)
>> Depends: cpp (= 4:11.2.0-1ubuntu1), gcc-11 (>= 11.2.0-1~)
>> Recommends: libc6-dev | libc-dev
>> Suggests: gcc-multilib, make, manpages-dev, autoconf, automake, 
>> libtool, flex, bison, gdb, gcc-doc
>> Conflicts: gcc-doc (<< 1:2.95.3)
>> Task: ubuntustudio-video, ubuntustudio-publishing, ubuntu-mate-core, 
>> ubuntu-mate-desktop
>> Download-Size: 5 112 B
>> APT-Manual-Installed: yes
>> APT-Sources: http://ua.archive.ubuntu.com/ubuntu jammy/main amd64 
>> Packages
>> Description: GNU C compiler
>>  This is the GNU C compiler, a fairly portable optimizing compiler for 
>> C.
>>  .
>>  This is a dependency package providing the default GNU C compiler.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

