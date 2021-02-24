Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707AC323B04
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 12:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89267.168028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEs1S-00042S-9i; Wed, 24 Feb 2021 11:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89267.168028; Wed, 24 Feb 2021 11:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEs1S-000423-6U; Wed, 24 Feb 2021 11:08:02 +0000
Received: by outflank-mailman (input) for mailman id 89267;
 Wed, 24 Feb 2021 11:08:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEs1R-00041y-2g
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:08:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEs1Q-0003sp-Ua
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:08:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEs1Q-0007Ot-TZ
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:08:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEs1J-0006eV-6V; Wed, 24 Feb 2021 11:07:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=uCGM9csyWng0qVf0sasPUOoV8YU3y+OZGgPoJq1JhTg=; b=qGOFdoffgzRCBS7XGFYmGhf+od
	KHd+EU/HTG0Vu8J/SOe/law93lWvw/piXhgA6eN0Lou/JoYCQ4t7XYzAEnatflNArTL3PdRvdPtt1
	Z8V7Wa74RXR9g4S+WzYUaJm/SlwbPKOXEUvvdqdn8upOg1ahTJ9ujXKJI3ZhR2gnhb0k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24630.13192.874503.894268@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 11:07:52 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
In-Reply-To: <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
	<20210224102641.89455-3-roger.pau@citrix.com>
	<fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
> On 24.02.2021 11:26, Roger Pau Monne wrote:
> > --- /dev/null
> > +++ b/tools/firmware/hvmloader/types.h
> > @@ -0,0 +1,47 @@
> > +#ifndef _HVMLOADER_TYPES_H_
> > +#define _HVMLOADER_TYPES_H_
> > +
> > +typedef unsigned char uint8_t;
> > +typedef signed char int8_t;
> > +
> > +typedef unsigned short uint16_t;
> > +typedef signed short int16_t;
> > +
> > +typedef unsigned int uint32_t;
> > +typedef signed int int32_t;
> > +
> > +typedef unsigned long long uint64_t;
> > +typedef signed long long int64_t;
> 
> I wonder if we weren't better of not making assumptions on
> short / int / long long, and instead use
> __attribute__((__mode__(...))) or, if available, the compiler
> provided __{,U}INT*_TYPE__.

This code is only ever going to be for 32-bit x86, so I think the way
Roger did it is fine.

Doing it the other way, to cope with this file being used with
compiler settings where the above set of types is wrong, would also
imply more complex definitions of INT32_MIN et al.

> > +#define INT8_MIN        (-0x7f-1)
> > +#define INT16_MIN       (-0x7fff-1)
> > +#define INT32_MIN       (-0x7fffffff-1)
> > +#define INT64_MIN       (-0x7fffffffffffffffll-1)
> > +
> > +#define INT8_MAX        0x7f
> > +#define INT16_MAX       0x7fff
> > +#define INT32_MAX       0x7fffffff
> > +#define INT64_MAX       0x7fffffffffffffffll
> > +
> > +#define UINT8_MAX       0xff
> > +#define UINT16_MAX      0xffff
> > +#define UINT32_MAX      0xffffffffu
> > +#define UINT64_MAX      0xffffffffffffffffull
> 
> At least if going the above outlined route, I think we'd then
> also be better off not #define-ing any of these which we don't
> really use. Afaics it's really only UINTPTR_MAX which needs
> providing.

I disagree.  Providing the full set now gets them all properly
reviewe and reduces the burden on future work.

> > +typedef uint32_t size_t;

I would be inclined to provide ssize_t too but maybe hvmloader will
never need it.

> Like the hypervisor, we should prefer using __SIZE_TYPE__
> when available.

I disagree.

> > +typedef uint32_t uintptr_t;
> 
> Again - use __UINTPTR_TYPE__ or, like Xen,
> __attribute__((__mode__(__pointer__))).

I disagree.

> > +#define bool _Bool
> > +#define true 1
> > +#define false 0
> > +#define __bool_true_false_are_defined   1
> > +
> > +typedef __builtin_va_list va_list;
> > +#define va_copy(dest, src)    __builtin_va_copy((dest), (src))
> > +#define va_start(ap, last)    __builtin_va_start((ap), (last))
> 
> Nit: Perhaps better omit the unnecessary inner parentheses?

We should definitely keep the inner parentheses.  I don't want to
start carefully reasoning about precisely which inner parentheses are
necesary for macro argument parsing correctness.

Ian.

