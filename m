Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C69B44767
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110912.1459905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGgg-0001gf-JL; Thu, 04 Sep 2025 20:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110912.1459905; Thu, 04 Sep 2025 20:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGgg-0001ey-Fn; Thu, 04 Sep 2025 20:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1110912;
 Thu, 04 Sep 2025 20:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0sEr=3P=kernel.org=cmarinas@srs-se1.protection.inumbo.net>)
 id 1uuGge-0001es-Ju
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:36:04 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5caf916-89ce-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:36:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A11E160292;
 Thu,  4 Sep 2025 20:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B781C4CEF4;
 Thu,  4 Sep 2025 20:35:58 +0000 (UTC)
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
X-Inumbo-ID: c5caf916-89ce-11f0-9d12-b5c5bf9af7f9
Date: Thu, 4 Sep 2025 21:35:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
	mark.rutland@arm.com, ada.coupriediaz@arm.com, mbenes@suse.cz,
	broonie@kernel.org, anshuman.khandual@arm.com, ryan.roberts@arm.com,
	chenl311@chinatelecom.cn, liaochang1@huawei.com,
	kristina.martsenko@arm.com, leitao@debian.org, ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 0/8] arm64: entry: Convert to generic irq entry
Message-ID: <aLn4LP7olb89TdbN@arm.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>

On Fri, Aug 15, 2025 at 11:06:25AM +0800, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry which makes
> maintainers' work easier and codes more elegant. So also convert arm64
> to use the generic entry infrastructure from kernel/entry/* by
> switching it to generic IRQ entry first, which will make PREEMPT_DYNAMIC
> and PREEMPT_LAZY use the generic entry common code and remove a lot of
> duplicate code.
> 
> Since commit a70e9f647f50 ("entry: Split generic entry into generic
> exception and syscall entry") split the generic entry into generic irq
> entry and generic syscall entry, it is time to convert arm64 to use
> the generic irq entry. And ARM64 will be completely converted to generic
> entry in the upcoming patch series.
> 
> The main convert steps are as follows:
> - Split generic entry into generic irq entry and generic syscall to
>   make the single patch more concentrated in switching to one thing.
> - Make arm64 easier to use irqentry_enter/exit().
> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> - Switch to generic irq entry.

I had a read through the patches and this first step looks fine to me.
If Ada or Mark don't spot any problems, I think the series is a
candidate for 6.18.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

