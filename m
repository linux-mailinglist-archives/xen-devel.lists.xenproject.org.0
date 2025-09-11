Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E3B538D0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 18:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120540.1465432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjtQ-0006cP-3V; Thu, 11 Sep 2025 16:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120540.1465432; Thu, 11 Sep 2025 16:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjtQ-0006ah-0F; Thu, 11 Sep 2025 16:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1120540;
 Thu, 11 Sep 2025 16:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nGff=3W=kernel.org=will@srs-se1.protection.inumbo.net>)
 id 1uwjtN-0006ab-Mp
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 16:11:25 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6293a08-8f29-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 18:11:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AEC5601D7;
 Thu, 11 Sep 2025 16:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E70DC4CEF0;
 Thu, 11 Sep 2025 16:11:17 +0000 (UTC)
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
X-Inumbo-ID: f6293a08-8f29-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757607082;
	bh=5vEajUiE8vOl+c0s0dvzPQu+3RLAa5VvYGmH9nj+aKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YuBfToxkwuIfFk9nR7Y5ZKaZTpqeEbvLsL+qmycMw0U/DWbqdVZBI+xfRcTJIXSjv
	 +ideQ2F+dkvBGRcPw0TI7raAqdbPKd3p1xPevy0lLKkhe3cp/CDA5JYm3dlXveJgt5
	 c9HxB+j2wC/hdSdy+H2WS8xkBdq+0tfdl5VRfb2xPplBMrhcsWtsayftcmFSKBpAxv
	 3UcG5VZwZsZAC0o5XyqoBblq8tADG28vOkNDOCtXcSVNULNKRqppuJntr6AzgZZEa8
	 yBbpzDWD5bwn4ULjxesg/J8dOfFSpOyE2jdRpl3CnPuWPP1HdLCvrmMEnWke1BfDdP
	 hPOi2tnQfXZ7Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	oleg@redhat.com,
	sstabellini@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	mbenes@suse.cz,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	chenl311@chinatelecom.cn,
	liaochang1@huawei.com,
	kristina.martsenko@arm.com,
	leitao@debian.org,
	ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v8 0/8] arm64: entry: Convert to generic irq entry
Date: Thu, 11 Sep 2025 17:11:12 +0100
Message-Id: <175760255687.903003.14486495786906094929.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Aug 2025 11:06:25 +0800, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry which makes
> maintainers' work easier and codes more elegant. So also convert arm64
> to use the generic entry infrastructure from kernel/entry/* by
> switching it to generic IRQ entry first, which will make PREEMPT_DYNAMIC
> and PREEMPT_LAZY use the generic entry common code and remove a lot of
> duplicate code.
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/8] arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
      https://git.kernel.org/arm64/c/788b8f6af60b
[2/8] arm64: entry: Refactor the entry and exit for exceptions from EL1
      https://git.kernel.org/arm64/c/ee776d68ba47
[3/8] arm64: entry: Rework arm64_preempt_schedule_irq()
      https://git.kernel.org/arm64/c/77c195394639
[4/8] arm64: entry: Use preempt_count() and need_resched() helper
      https://git.kernel.org/arm64/c/c74c44c6ae20
[5/8] entry: Add arch_irqentry_exit_need_resched() for arm64
      https://git.kernel.org/arm64/c/3c973c51bfba
[6/8] arm64: entry: Refactor preempt_schedule_irq() check code
      https://git.kernel.org/arm64/c/64f4b8b15f1c
[7/8] arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
      https://git.kernel.org/arm64/c/99eb057ccd67
[8/8] arm64: entry: Switch to generic IRQ entry
      https://git.kernel.org/arm64/c/b3cf07851b6c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

