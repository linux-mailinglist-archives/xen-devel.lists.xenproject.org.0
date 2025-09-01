Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF8B3F102
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105597.1456482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCze-00076N-Hk; Mon, 01 Sep 2025 22:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105597.1456482; Mon, 01 Sep 2025 22:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCze-00073b-Ev; Mon, 01 Sep 2025 22:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1105597;
 Mon, 01 Sep 2025 22:27:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1utCzd-00073V-Og
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:27:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1utCzc-001MrD-03;
 Mon, 01 Sep 2025 22:27:16 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1utCzb-00CPkp-36;
 Mon, 01 Sep 2025 22:27:16 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=AmGRIEQWN2t3+uQnit31rIzuuiXDc8uOzL0/4xtUwQU=; b=
	mfho3S7JVhUpE/qLmTk5tRbxoUPJuvBEQ0kCGGf0pPw9tclvA84BPPPIGNCpEEUtDqJXzk5JrJPM3
	U3caTXJ0KI6ElVRm6fCdjv58VkSpNHqM04F+MMjci/6DENMEILt1PJZRqi2I8YLeOWFnKHEkyrtx3
	P0yslCA1LunVtWurA=;
From: dmukhin@xen.org
Date: Mon, 1 Sep 2025 15:27:14 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v5 01/15] emul/vuart: introduce framework for UART
 emulators
Message-ID: <aLYdwtB+DqV4gXle@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291217110.341243@ubuntu-linux-20-04-desktop>
 <37f4c1af-29e3-44eb-a238-a3e2e4641f10@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f4c1af-29e3-44eb-a238-a3e2e4641f10@suse.com>

On Mon, Sep 01, 2025 at 10:14:04AM +0200, Jan Beulich wrote:
> On 29.08.2025 21:27, Stefano Stabellini wrote:
> > On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> >> --- /dev/null
> >> +++ b/xen/common/emul/vuart/vuart.c
> >> @@ -0,0 +1,156 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * UART emulator framework.
> >> + *
> >> + * Copyright 2025 Ford Motor Company
> >> + */
> >> +
> >> +#include <xen/err.h>
> >> +#include <xen/sched.h>
> >> +#include <xen/vuart.h>
> >> +#include <xen/xvmalloc.h>
> >> +
> >> +#define for_each_emulator(e) \
> >> +    for ( e = vuart_array_start; e < vuart_array_end; e++ )
> >> +
> >> +extern const struct vuart_emulator vuart_array_start[];
> >> +extern const struct vuart_emulator vuart_array_end[];
> >> +
> >> +static const struct vuart_emulator *
> >> +vuart_match_by_compatible(struct domain *d, const char *compat)
> >> +{
> >> +    const struct vuart_emulator *emulator;
> >> +
> >> +    if ( d->console.vuart )
> >> +        return NULL;
> >> +
> >> +    for_each_emulator(emulator)
> >> +        if ( emulator->compatible &&
> >> +             !strncmp(emulator->compatible, compat,
> >> +                      strlen(emulator->compatible)) )
> > 
> > strncmp will continue until the given count even if compat is shorter
> 
> Not really, one string having a nul char and the other not having one is a
> difference, at which point comparison will stop. There would be a problem
> if "compat" didn't point to a nul-terminated string, though (and I didn't
> check that aspect, not the least because then "shorter" doesn't really
> make much sense without a length passed in).

re: NUL-termination: current assumption is that both compat and
emulator->compatible are NUL-terminated.

Current `compat` comes from the hardcoded NUL-terminated string (vuart_info).

In case of `compat` is not NUL-terminated (I plan to populate the field from
xl in the future), strncmp() will stop after strlen(emulator->compatible)
bytes.

