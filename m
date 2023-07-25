Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D88B7622F5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569925.891135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOHs-0001So-ED; Tue, 25 Jul 2023 20:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569925.891135; Tue, 25 Jul 2023 20:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOHs-0001QE-9I; Tue, 25 Jul 2023 20:05:40 +0000
Received: by outflank-mailman (input) for mailman id 569925;
 Tue, 25 Jul 2023 20:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qOOHr-0001Q3-EK
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:05:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e825415-2b26-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 22:05:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDE51618C9;
 Tue, 25 Jul 2023 20:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864CDC433C7;
 Tue, 25 Jul 2023 20:05:33 +0000 (UTC)
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
X-Inumbo-ID: 9e825415-2b26-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315535;
	bh=3ScwuRJk5g9SME3JJg8b/X5kSsRELo3qrdBKYbKb3XQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T32KfYrShD+ElY+dOmldViqCOX59pxdrCP3xT66yHTkpKpT7sS8AZHeEnCxfSjwEg
	 vSbPSu3caVVKpcZsuVUMPoGYO+/VcQGxdA8zin6zjjpswSLawXuuRYl/IOlZdiPZLh
	 r2e5h6AER3IWUm7exnchYxGONuY5qTk/dPiWCAvY1RmGzxo+UZ84FsaxLI1vDAL7An
	 TAP6pb2amaUCY1nV2NF0ikMIpgn82pDy5liG/gEtao2EdWklC/4rmExRgljuUR7D8V
	 hEsm1gdBUJ8WWJz+Nzq80xCZThu3+hCP28ca77g9QYY6Sw8BWCC2YOTP9Gclog0AMN
	 v/i7kYBjoJolw==
Date: Tue, 25 Jul 2023 13:05:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 0/4] fix some issues related to MISRA C:2012 Rule
 9.1
In-Reply-To: <cover.1689329728.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307251042130.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

For the record, as I mentioned during the call today, I asked to
postpone the 9.1 work for later, because it is going to take a lot of
work and discussions to figure out a good way forward for all these
cases. There are at least 3-5 different sub-classes for this issues. So
I think it would be better for the Xen community to make more progress
with other rules and violations fixes first.


On Fri, 14 Jul 2023, Nicola Vetrini wrote:
> This patch series is aimed at discussing different categories of
> patterns concerning local variables that are possibly not
> initialized in all code paths, which results in hard-to-prove
> correctness. The main categories are as follows:
> 
> 1. Variables initialized by passing a pointer to them to a function.
>    Many such functions are coupled with error handling which results
> 	 in the variable not being initialized.
> 
> 2. Some variables are used in switch statements and the control flow
>    ensures that all code paths do initialize them, but due to the
> 	 presence of goto statements, the flow is harder to follow.
> 
> I emphasize that, as far as I can tell, the code is already
> compliant with the rule, but there is room for improvement, especially
> on the side of allowing automatic checks to be more effective.
> 
> Nicola Vetrini (4):
>   xen/arm: justify or initialize conditionally uninitialized variables
>   xen/arm64: bitops: justify uninitialized variable inside a macro
>   xen/arm: initialize conditionally uninitialized local variables
>   xen/arm: initialize conditionally uninitialized local variables
> 
>  docs/misra/safe.json                        | 24 +++++++++++++++
>  xen/arch/arm/arm64/lib/bitops.c             |  3 ++
>  xen/arch/arm/arm64/lib/find_next_bit.c      |  1 +
>  xen/arch/arm/bootfdt.c                      |  6 ++++
>  xen/arch/arm/cpuerrata.c                    |  6 ++--
>  xen/arch/arm/decode.c                       |  2 ++
>  xen/arch/arm/dm.c                           |  2 +-
>  xen/arch/arm/domain_build.c                 | 29 ++++++++++++++----
>  xen/arch/arm/domctl.c                       |  8 ++---
>  xen/arch/arm/efi/efi-boot.h                 |  6 ++--
>  xen/arch/arm/gic-v3-its.c                   |  9 +++---
>  xen/arch/arm/gic-v3-lpi.c                   | 17 ++++++-----
>  xen/arch/arm/guest_walk.c                   | 12 ++++----
>  xen/arch/arm/include/asm/guest_atomics.h    |  3 ++
>  xen/arch/arm/include/asm/p2m.h              | 10 ++++---
>  xen/arch/arm/mm.c                           |  1 +
>  xen/arch/arm/p2m.c                          | 33 ++++++++++++---------
>  xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 10 ++-----
>  xen/arch/arm/psci.c                         | 10 +++----
>  xen/drivers/char/pl011.c                    |  2 +-
>  20 files changed, 129 insertions(+), 65 deletions(-)
> 
> --
> 2.34.1
> 

