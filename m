Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315BCC657B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 08:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188563.1509700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVlii-0006p3-Qy; Wed, 17 Dec 2025 07:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188563.1509700; Wed, 17 Dec 2025 07:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVlii-0006nD-NQ; Wed, 17 Dec 2025 07:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1188563;
 Wed, 17 Dec 2025 07:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzDs=6X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vVlih-0006n6-8z
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 07:13:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6ad5263-db17-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 08:13:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 113824EE8115;
 Wed, 17 Dec 2025 08:13:07 +0100 (CET)
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
X-Inumbo-ID: d6ad5263-db17-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765955587;
	b=XztZ07DshC46hMxW2TRelkpnfjD51mjqZ5vuJfzAgJD0Wh8Kc3ajBCnyMDzkhEqOtJEe
	 WN+gZ7pXkyNdqrW5h8vo6iaVzFqk7vj3jEGWvq+FXpDISc8+Hk8/gQ6Px9Q3+MxTEC8GF
	 gJyz/r+7zCpWJga8U108KmLJMqwbYa6FIgEJW0dCSzKWwYnpwtjwDyYpWJfJ8gOoRkAoI
	 v0dtEAitNYfQ/3p1Sj8p2kpLsoXTZvLXaY3iz+szOJfpzUrW/R5eC8DXZM2pNCiAWwChL
	 PV5mOG4UJcfYHRWb4R+kvDbYFso2E0rIBwF97mubgOOyFBip8SoEwyH8CbPj/aR8WCHZ+
	 zzI2tx7GFQfi/3Y38YjT4KvY58dhQSNWmEXSiLtMoglz3BSw5VTf2TJ9ZdSOBDHSGqJfu
	 C6q+mAHXoelR0xbsGOTkP9JYdrXxYHOXj4r5RXtS85LKJ7XBXOBtSDSNQKMshspoQxBHO
	 aE5rJ6O0vy11CGuV2nMv1AwzoQ6fVwfgCqXwb1LqSZ5SPazP45yhYImpKgCGSxrW8oHLw
	 KVRmtRHb9l4wDMVAztlyLrOU1Tjj8c3FjM6UhS4nO5cFVvg+xu0+aVN72XUzwXyaF4yZU
	 v9xIuv/pPvJG3llIvFujlXeyzkfEJkhen6/m5Hd3P/seDzn46TvwI0U1ZXYYh1I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765955587;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=pw0b2YO3MQkDiuw98EIZPlj7kSMv6vIlDUKJwghSvqY=;
	b=r0IDoVAXc1U+q/iwkmOrD5EsXRGG6Lulqqf3JKPlA1EGbeo2Aw9aGpST7q4CgrPE7ap2
	 N32NyTuMfKjxeIQcyGr4MOf1JP0q4uuw3iw8DFroD2l4e6vg6oJwmggZsBpR9GzCXLtc8
	 juJhAeWg4GRJiCQXwKFzpCXmENlezyOBvudYf2QdFnwsG9P7Ef1lxk21phPebUqWCXj9f
	 1ud9q1WPo2muwyf/qLpomouYYvFf6RFLVf7Nkl2Bf6DzQikv8FlO8L1O6AxVBc7wjSnAD
	 4LIB9oWha4PWSDmFDSH55c97pSm1NKSd0LzUxyVaqpmt+5dZJLHXL2MF/SPN/uxPVeggf
	 7wib7IVxGAX9D8onxeAyE0EJ7cU2y+DnsIwHXm2zOaMt0Jg+t4qY8ElmNRs/cNmg9YdBy
	 qSDvvq3rUaptRF77a0HHc1xDO8uy7D03GP68VIIeVp7jsPr/Hm/HN1xmL8sBOCb69zKqs
	 JArQzAGP5vm2OpgNsGYgEHefc3Nfe2bHn5h9TwMqQdZ2RowooK+Mp1nBuJ1fuI/Q9OnnO
	 jRZXmzkdog4u1QFQOeRfGa+EvBodK3eEzuD5Mr8ySz8MlMKPVsL4btfrcQQaz7fN1ZNM9
	 usSU5p+IuPBtoO/x0dLrJV9M9IXw9XrabKO/4OH49SorKUPhRmX5un27Xha8kT0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765955587; bh=feF1XL/GkuRiJMs7+2Kpyxeh6JUzcUkNCwD8kiOSbJY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CB1Cf3yQzjHnZgj6jhxmYyhDG9Ox3LUo/lbMM6JR7xsqcgTOSTlKFOxWZkLLc5Iia
	 j6rzHfBFyAzK7JET4r/skko6xzfaoDuCW1orqfUFkKLbMBp5TSL2qSzgSthZFA+h83
	 jr0U9FBFYCWYU3G9hAXE9ZeHH55kWh2oQ3vDq6HLPiP6xKQIAF9ZWljfmJtWeGptXN
	 mg3GHl1ecOpAoOgMEhpsmzKSIg3igEIlr51MzzzPEOb/WeijSRiQ7IbT4WAAqk2D2h
	 bkwVQTHVjgYg5qI8KjPuAZLyva6lKJQYjTSdxznO1XADdvl9pImiFk7V8UosZDb+QD
	 i8EWHl4/2aeDQ==
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 08:13:06 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: X86: build failure
In-Reply-To: <0066dae8-a05b-488e-8dfb-0685e1e9f700@epam.com>
References: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
 <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
 <0066dae8-a05b-488e-8dfb-0685e1e9f700@epam.com>
Message-ID: <709d7c2552828a68d40b93ba4211ae81@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-17 01:12, Grygorii Strashko wrote:
> Hi Andrew,
> 
> On 17.12.25 01:54, Andrew Cooper wrote:
>> On 16/12/2025 11:35 pm, Grygorii Strashko wrote:
>>> Hi All,
>>> 
>>> I experience build failure with following Kconfig combination:
>>>   CONFIG_DEBUG=n and CONFIG_XEN_IBT=n
>>> 
>>> with gcc:
>>>   gcc --version
>>>   gcc (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0
>>>   Copyright (C) 2021 Free Software Foundation, Inc.
>>>   This is free software; see the source for copying conditions.  
>>> There
>>> is NO
>>>   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>>> PURPOSE.
>>> 
>>> Is this known issue?
>>> 
>>> ====== log ===============
>>>    CC      arch/x86/x86_emulate.o
>>> In file included from arch/x86/x86_emulate.c:27:
>>> arch/x86/x86_emulate/x86_emulate.c: In function ‘x86_emulate’:
>>> arch/x86/x86_emulate/x86_emulate.c:70:36: error: writing 1 byte into 
>>> a
>>> region of size 0 [-Werror=stringop-overflow=]
>>>     70 |     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 :
>>> 0x8f; \
>>> arch/x86/x86_emulate/x86_emulate.c:78:9: note: in expansion of macro
>>> ‘copy_VEX’
>>>     78 |         copy_VEX(ptr, vex); \
>>>        |         ^~~~~~~~
>>> arch/x86/x86_emulate/x86_emulate.c:8140:13: note: in expansion of
>>> macro ‘copy_REX_VEX’
>>>   8140 |             copy_REX_VEX(opc, rex_prefix, vex);
>>>        |             ^~~~~~~~~~~~
>>> In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>>>                   from arch/x86/x86_emulate.c:27:
>>> arch/x86/x86_emulate/private.h:691:17: note: at offset [0, 4095] into
>>> destination object of size [0, 9223372036854775807] allocated by
>>> ‘map_domain_page’
>>>    691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + 
>>> \
>>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/x86/x86_emulate/x86_emulate.c:60:21: note: in expansion of macro
>>> ‘get_stub’
>>>     60 |     uint8_t *buf_ = get_stub(stub); \
>>>        |                     ^~~~~~~~
>>> arch/x86/x86_emulate/x86_emulate.c:3354:15: note: in expansion of
>>> macro ‘init_prefixes’
>>>   3354 |         opc = init_prefixes(stub);
>>>        |               ^~~~~~~~~~~~~
>>> arch/x86/x86_emulate/private.h:691:17: note: at offset [1, 4096] into
>>> destination object of size [0, 9223372036854775807] allocated by
>>> ‘map_domain_page’
>>>    691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + 
>>> \
>>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/x86/x86_emulate/x86_emulate.c:94:21: note: in expansion of macro
>>> ‘get_stub’
>>>     94 |     uint8_t *buf_ = get_stub(stub); \
>>>        |                     ^~~~~~~~
>>> arch/x86/x86_emulate/x86_emulate.c:3402:15: note: in expansion of
>>> macro ‘init_evex’
>>>   3402 |         opc = init_evex(stub);
>>> [...]
>>> 
>> 
>> Hmm - that looks like more of the GCC 11 bounds bugs, but that's what
>> the gcc11_wrap() visible at the top is supposed to be fixing.
>> 
>> Neither of those CONFIG options ought to be relevant.
>> 
>> Which Ubuntu is this?  Is it something local, or from one of our CI
>> containers?  Is this on staging, or local?
> 
> Local. Nothing special - "Ubuntu 22.04.5 LTS"
> 
> ======== apt show gcc
> Package: gcc
> Version: 4:11.2.0-1ubuntu1

The minimum gcc version is 5.1 on staging, perhaps this is due to that

> Priority: optional
> Build-Essential: yes
> Section: devel
> Source: gcc-defaults (1.193ubuntu1)
> Origin: Ubuntu
> Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
> Original-Maintainer: Debian GCC Maintainers 
> <debian-gcc@lists.debian.org>
> Bugs: https://bugs.launchpad.net/ubuntu/+filebug
> Installed-Size: 51,2 kB
> Provides: c-compiler, gcc-x86-64-linux-gnu (= 4:11.2.0-1ubuntu1)
> Depends: cpp (= 4:11.2.0-1ubuntu1), gcc-11 (>= 11.2.0-1~)
> Recommends: libc6-dev | libc-dev
> Suggests: gcc-multilib, make, manpages-dev, autoconf, automake, 
> libtool, flex, bison, gdb, gcc-doc
> Conflicts: gcc-doc (<< 1:2.95.3)
> Task: ubuntustudio-video, ubuntustudio-publishing, ubuntu-mate-core, 
> ubuntu-mate-desktop
> Download-Size: 5 112 B
> APT-Manual-Installed: yes
> APT-Sources: http://ua.archive.ubuntu.com/ubuntu jammy/main amd64 
> Packages
> Description: GNU C compiler
>  This is the GNU C compiler, a fairly portable optimizing compiler for 
> C.
>  .
>  This is a dependency package providing the default GNU C compiler.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

