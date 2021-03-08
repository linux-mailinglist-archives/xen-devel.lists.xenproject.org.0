Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11B1330ABB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94758.178417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCfV-00062d-PC; Mon, 08 Mar 2021 09:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94758.178417; Mon, 08 Mar 2021 09:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCfV-00062E-LZ; Mon, 08 Mar 2021 09:59:17 +0000
Received: by outflank-mailman (input) for mailman id 94758;
 Mon, 08 Mar 2021 09:59:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCfU-000626-9a
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:59:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCfU-0001CA-6c
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:59:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCfU-0003Jy-5X
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:59:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJCfQ-000840-Vp; Mon, 08 Mar 2021 09:59:13 +0000
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
	bh=hS7WocNRtbY6n5glaLixGXL1k1ubYQpB+jjlIlTtTXo=; b=GAw63nMZxezOPnNe6WOMGkLdXV
	kgw8/sKSC8WukTftUxMzfAGBJ8BtLG0YC2U2qWIVYoird37TveWkQ46IR8Niw0nxZZPWli0eHLmVN
	QMHe7aM+N60ItFesyrYAIC30Z/OoYfoSQlGrFhtkWd9mA7JGXc8bTDAaY+YViAD1Lo34=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24645.62832.737310.550811@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 09:59:12 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every
 time
In-Reply-To: <336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
	<336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every time"):
> The first thing the "xen-dir" rule does is delete the entire xen/
> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
> result there's no original version for $(move-if-changed ...) to compare
> against, and hence the file and all its consumers would get rebuilt
> every time. Introduce a "prep-y" rule to move xen/lib/x86/ on the side,
> to then recover any *autogen.h from there prior to invoking the
> respective recursive $(MAKE) invocation.

Urgh.  Thanks for working on this swamp.

However,

> +# Arrange for preserving of auto-generated headers (to avoid them getting
> +# rebuilt every time): Move the entire xen/lib/x86/ to a temporary place.
> +prep-$(CONFIG_X86):
> +	rm -rf .xen-lib-x86
> +	test ! -d xen/lib/x86 || mv xen/lib/x86 .xen-lib-x86
> +
>  all-$(CONFIG_X86): xen-dir
> +	$(if $(wildcard .xen-lib-x86/*autogen.h),mv .xen-lib-x86/*autogen.h xen/lib/x86/)
> +	rm -rf .xen-lib-x86
>  	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)

Isn't there some better way of doing this ?  I am very wary of adding
additional on-disk Makefile-managed state to a Makefile which is
already going wrong.  I haven't thought about this in enough detail to
identify a specific bug but I think convincing myself that it is
definitely correct is nontrivial.

Perhaps we could do the removal with a find rune instead, so we can
just skip the files we wanted to keep ?

Ian.

