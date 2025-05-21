Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F2ABF7D5
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991934.1375719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkPH-00058P-PR; Wed, 21 May 2025 14:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991934.1375719; Wed, 21 May 2025 14:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkPH-00056y-MY; Wed, 21 May 2025 14:26:55 +0000
Received: by outflank-mailman (input) for mailman id 991934;
 Wed, 21 May 2025 14:26:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uHkPG-00056s-Ef
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:26:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uHkPF-00607V-24;
 Wed, 21 May 2025 14:26:53 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uHkPF-006Mwn-0J;
 Wed, 21 May 2025 14:26:53 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=V3oKYw1ew7RdkmQGNCAz8YhinDgoQIjOlcbY4Fetcc0=; b=TRDdmNrpjbJJh8h59mGFiECHRq
	tqFqhfx73nP3/QZlxQo8jJbMretN/dvpUF6/hASCGUE4QyY3YMcDE4prSfGzA3/hhqEWl1ByHAvZn
	Sz0Bm0l9IGwLxrQ3W9dPp+/WLCNqDeZDNW8atbpMFfYalUdDDbZdDnotPRW/LnV/5TJ0=;
Date: Wed, 21 May 2025 16:26:51 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Sookyung Ahn <sookyung.ahn@boeing.com>
Cc: xen-devel@lists.xenproject.org, matthew.l.weber3@boeing.com,
	joshua.c.whitehead@boeing.com, Anderson.Choi@boeing.com,
	brian.j.wood2@boeing.com, haesun.kim@boeing.com
Subject: Re: [RFC PATCH 0/2] Propose an minimal xen-tools
Message-ID: <aC3iq8YDNzAvr4zH@l14>
References: <cover.1747205627.git.sookyung.ahn@boeing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747205627.git.sookyung.ahn@boeing.com>

Hi,

Thanks for the proposal.

On Wed, May 14, 2025 at 07:12:48AM +0000, Sookyung Ahn wrote:
> I am writing to propose an enhancement to the `xen-tools` for users who require only a minimal subset of its functionality, particularly in safety-critical domains like aerospace.

FYI, there's a project call `xen-tools`, at
https://github.com/xen-tools/xen-tools/, and having it spell like
reminds me of that external project, and not the tools in this repo.

> I believe that the addition of a new build-time option, `ENABLE_MINIMAL_XEN_TOOLS`, will significantly benefit users by allowing them to build only the essential components needed for their specific applications. 
> This approach not only streamlines the toolset but also reduces the potential for unnecessary complexity in safety-critical environments.
> This proposal is based on `dom0less` environment.
> 
> The proposed implementation includes:
> - Introducing the `ENABLE_MINIMAL_XEN_TOOLS` configuration flag.
> - Modifying the build process to selectively include only the necessary components based on the configuration.
> 
> This implementation can be effectively applied to the following use cases. 
> - Minimal APIs for `dom0less` operation. This involves taking existing Xen functions and shrinking them to minimal needed parts. For example, we can use static device tree instead of XenStore. 
> - By retaining `libxencall` and minimum part of `libxencrtl`, the Hypercall interface can be utilized, enabling support for the Xen ARINC653 Multiple Module Schedules service. 
> - Addition of ARINC653 Part1&2 APIs and services (hosted on the domain OS.)
> 
> I would appreciate any feedback or suggestions you may have regarding this enhancement. 
> Additionally, I would like to emphasize the importance of community input in refining this proposal to ensure it meets the needs of all users.

I don't quite like this approach. What is "minimal"? Whatever
definition we can come up with isn't going to fit other's expectation
of a minimal set of tools. Also, the minimum set of tools needed might
be 0, if you only need the hypervisor.

Also, the implementation is quite invasive, with `CONFIG_MINIMAL_TOOLS`
spread through the build system. It also duplicates configurations, with
like "SUBDIRS-y += libs" been written twice in tools/Makefile.

I feel like a better approach would be to have something like:
    ./configure --no-default --enable-flask --enable-hotplug ...

As for the makefiles, instead of having to invent a config option for
every single `SUBDIRS-y` we could have a generic
SUBDIRS-$(subdir-default) where subdir_default is 'y' unless we want to
select a handful of subdirectory.

It might not be necessary to have a config option for everything, you
could deal with some of the stray binary with the tool use to make
package, like RPM where you select which files to packages (as already
suggested), and for other tool just `rm` the few files not needed.

Then, there's `libxenctrl`. For this one, it doesn't feel like a good
idea to make it selectively smaller. Maybe there's a way to extract the
functionality you need into a new lib? We kind of tried in the past to
extract piece of it into lib with a stable interface, like
libdevicemodel, libcall. So it might be a better approach to remove the
need of libxenctrl in your environment.

I hope that help.

Cheers,

-- 
Anthony PERARD

