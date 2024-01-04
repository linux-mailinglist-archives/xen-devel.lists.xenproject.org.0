Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0BA823970
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 01:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661038.1030738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLBEe-0002op-CN; Thu, 04 Jan 2024 00:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661038.1030738; Thu, 04 Jan 2024 00:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLBEe-0002mN-8X; Thu, 04 Jan 2024 00:05:20 +0000
Received: by outflank-mailman (input) for mailman id 661038;
 Thu, 04 Jan 2024 00:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCom=IO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLBEc-0002mH-42
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 00:05:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f07e72d4-aa94-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 01:05:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CB6CDB81637;
 Thu,  4 Jan 2024 00:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90273C433C7;
 Thu,  4 Jan 2024 00:05:13 +0000 (UTC)
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
X-Inumbo-ID: f07e72d4-aa94-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704326715;
	bh=kbTRdsAZw32A7DCyHKTuFAkjOUAtpAcfuu3ugOo9xEc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fn5KZodnieewnCb3up8PsJHTUcrPi49EIqXfn8PqiWwrbS+sxZ8cOBJWCmpEqQFp5
	 JcmJRs1I3/CYFFTgToMeZvfYnqlVQl0eUqqVY6qmYeMFnR7L5B3rc4qWdlw7PwEa16
	 tNRWeG/7Knr317lxlbWz3yZPYd3gfjXAebgR74yafmIcU30jICTZ5kvoVpTuLgxk3u
	 2gz6vQRzS78uxCVo3+0XlUFCdULR5lN0nRrr8K4X6Evk6M2x27EbGWe714G+oWWprT
	 rF1L2M8LXQncF6KjqeiS/WXdzXxl4w8YTL+XR6qE2PiT/ObIhBqQ9xrKQ3EBvhiQEM
	 NjkLYQW7Od2Vw==
Date: Wed, 3 Jan 2024 16:05:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 00/13] Arm cache coloring
In-Reply-To: <6d652309-50e1-4850-ac52-d086a3a32726@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401031601180.1322202@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <6d652309-50e1-4850-ac52-d086a3a32726@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Jan 2024, Michal Orzel wrote:
> Hi,
> 
> On 02/01/2024 10:51, Carlo Nonato wrote:
> > 
> > 
> > Shared caches in multi-core CPU architectures represent a problem for
> > predictability of memory access latency. This jeopardizes applicability
> > of many Arm platform in real-time critical and mixed-criticality
> > scenarios. We introduce support for cache partitioning with page
> > coloring, a transparent software technique that enables isolation
> > between domains and Xen, and thus avoids cache interference.
> > 
> > When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> > the user to define assignments of cache partitions ids, called colors,
> > where assigning different colors guarantees no mutual eviction on cache
> > will ever happen. This instructs the Xen memory allocator to provide
> > the i-th color assignee only with pages that maps to color i, i.e. that
> > are indexed in the i-th cache partition.
> > 
> > The proposed implementation supports the dom0less feature.
> > The proposed implementation doesn't support the static-mem feature.
> > The solution has been tested in several scenarios, including Xilinx Zynq
> > MPSoCs.
> > 
> > In this patch series there are two major unacceptable workarounds for which
> > I want to ask you for comments:
> >  - #3: allocate_memory() has been moved in dom0less_build.c, so I just copied
> >  it back to make it compile.
> I would move it to domain_build.c and add a prototype in domain_build.h.
> You could guard it together with allocate_bank_memory() for DOM0LESS || LLC or just
> remove the guards (in former case, you would need to protect your call with #ifdef in construct_dom0()).
> 
> >  - #13: consider_modules() has been moved to arm32 only. Again I just copied it.
> I would move it to setup.c and add a prototype in setup.h.
> As for the guards, if we want them (personally I don't see the need), you would need LLC || (ARM_32 && MMU).
> 
> BTW. Patchew reports some build issues in your series:
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/1124313980
> 
> Make sure to build test your series on different arches. You can ask on IRC to become a member
> on gitlab so that you can trigger the pipeline by pushing the changes to your fork on people/<you>/xen.

Also I tried this patch series on the "staging" branch and Xen failed to
boot, no messages at all from Xen so it must be an early boot failure. I
am passing this command line options to Xen and running it on QEMU:

dom0_mem=1024M dom0_max_vcpus=1 xen-llc-colors=0 dom0-llc-colors=1-5 llc-way-size=65535 llc-coloring=true


