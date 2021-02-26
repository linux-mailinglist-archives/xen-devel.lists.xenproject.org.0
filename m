Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF4326886
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 21:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90581.171508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFjmR-0001ic-LT; Fri, 26 Feb 2021 20:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90581.171508; Fri, 26 Feb 2021 20:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFjmR-0001iD-Hj; Fri, 26 Feb 2021 20:32:07 +0000
Received: by outflank-mailman (input) for mailman id 90581;
 Fri, 26 Feb 2021 20:32:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFjmQ-0001i8-5H
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 20:32:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d69564aa-1a9c-4633-ac61-06976fd09582;
 Fri, 26 Feb 2021 20:32:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE296601FB;
 Fri, 26 Feb 2021 20:32:03 +0000 (UTC)
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
X-Inumbo-ID: d69564aa-1a9c-4633-ac61-06976fd09582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614371524;
	bh=ZfhIgVSHPUaPB/O+CPuZ87bwXno9lSjUW14o5/FcNvI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XukvFgxv+/Cwm4wTKnUdIVAbzIeI08Mk98Q1Xk/GARO7ktOtqPl5pJEdZmqTmcNxl
	 4g3iDNnrJEa0GQ02XWfwK7+bAFILLFWbRy5WXAggqUj7RX9CMri0ZRrbXHPufCRHNt
	 C2xDstXLj8oMgmvqP29Y00k8x4HsI6d+lEheC/Q38GkWz83nhahkL9Q0FG0PzenxWt
	 4rR6LfBj3l+dC8no9/Xbtw+h1HhBEy5csPUUoOidu5A/xqUJVxz08fV3t5jPyGG8ec
	 UCNKVSj0zai1WVNfnIOjvCL82PEla8luhGajqVZAAapinowMUaa2y6zzOe+bHm10cP
	 9HdTm/ZmnfGqQ==
Date: Fri, 26 Feb 2021 12:32:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-4.15 0/3] firmware: fix build on Alpine
In-Reply-To: <20210226085908.21254-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.21.2102261230270.3234@sstabellini-ThinkPad-T480s>
References: <20210226085908.21254-1-roger.pau@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Feb 2021, Roger Pau Monne wrote:
> Hello,
> 
> While the series started as a build fix for Alpine I think they are
> interesting on their own for other OSes/distros, since it allows to
> remove the i386 libc as a build dependency.
> 
> THis is done by proving a suitable set of standalone headers that are
> suitable for the needs of the firmware build. Patch 2 contains the full
> description on why it's done this way.
> 
> The main risk for patches 1 and 2 is breaking the build in some obscure
> distro/OS and toolchain combination. We aim to have this mostly covered
> by gitlab CI. Patch 3 main risk is breaking the Alpine containers in
> gitlab CI, but they are already failing.
> 
> Wanted to send this yesterday but was waiting on gitlab CI output, it's now
> all green:
> 
> https://gitlab.com/xen-project/people/royger/xen/-/pipelines/261928726

That's fantastic! Spreaking with Andrew I thought the Alpine Linux
hvmloader build issue was still unresolved, but obviously you found a
way to fix it. Great!



> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   hvmloader: do not include inttypes.h
>   firmware: provide a stand alone set of headers
>   automation: enable rombios build on Alpine
> 
>  README                                        |  3 --
>  automation/scripts/build                      |  5 +--
>  tools/firmware/Rules.mk                       | 11 ++++++
>  tools/firmware/hvmloader/32bitbios_support.c  |  2 +-
>  tools/firmware/include/stdarg.h               | 10 +++++
>  tools/firmware/include/stdbool.h              |  9 +++++
>  tools/firmware/include/stddef.h               | 10 +++++
>  tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
>  tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
>  tools/firmware/rombios/rombios.c              |  5 +--
>  10 files changed, 85 insertions(+), 13 deletions(-)
>  create mode 100644 tools/firmware/include/stdarg.h
>  create mode 100644 tools/firmware/include/stdbool.h
>  create mode 100644 tools/firmware/include/stddef.h
>  create mode 100644 tools/firmware/include/stdint.h
> 
> -- 
> 2.30.1
> 

