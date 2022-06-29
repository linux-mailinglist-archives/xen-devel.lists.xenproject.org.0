Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4126356072A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 19:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357986.586911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bHM-0004BH-6j; Wed, 29 Jun 2022 17:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357986.586911; Wed, 29 Jun 2022 17:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bHM-00048O-3b; Wed, 29 Jun 2022 17:15:04 +0000
Received: by outflank-mailman (input) for mailman id 357986;
 Wed, 29 Jun 2022 17:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fe+6=XE=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1o6bHK-00048I-S5
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 17:15:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0286b230-f7cf-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 19:15:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5268B82424;
 Wed, 29 Jun 2022 17:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0932AC341CA;
 Wed, 29 Jun 2022 17:14:58 +0000 (UTC)
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
X-Inumbo-ID: 0286b230-f7cf-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656522899;
	bh=nRYAO0YhqCfW4n6wXNQYaEZksNx77Z2cvSAAwv2BTXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmoROso54H2ZVFwQUwvRDiFyIa1hsR2lG/3lAZaePvTzKruFHeRsiGi4UC7PkEO8l
	 qWc1TuTWvJNfGt8g2jUYIoiEpgw1IVFqpfuGxCEmq/KihSpGPzrNcam7ATayIKyxmW
	 f84Z6R9fLtvGpaBEBiC5vfSbFRpz2dLWFplsUScFoVQLHclhAH0r2DGjW5wk0y5V0C
	 9aUICt/P0uNFQcTVjcc5lpqsp1Ao41rJTVA8vpojbxmL/unJ8H/UQaDityIYrRDKh7
	 LPIOQxETfTJbjRenZ5zm+rwcV+1EmrEfYCPDrqPdM/NXyS98sXiPnIlRoc+1bN6puO
	 vZ9EP/kQpZRvQ==
Date: Wed, 29 Jun 2022 10:14:57 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 2/3] x86: fix setup of brk area
Message-ID: <20220629171457.amdsrgaxady55hds@treble>
References: <20220623094608.7294-1-jgross@suse.com>
 <20220623094608.7294-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220623094608.7294-3-jgross@suse.com>

Hi Juergen,

It helps to actually Cc the person who broke it ;-)

On Thu, Jun 23, 2022 at 11:46:07AM +0200, Juergen Gross wrote:
> Commit e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
> put the brk area into the .bss..brk section (placed directly behind
> .bss),

Hm? It didn't actually do that.

For individual translation units, it did rename the section from
".brk_reservation" to ".bss..brk".  But then during linking it's still
placed in .brk in vmlinux, just like before.

> causing it not to be cleared initially. As the brk area is used
> to allocate early page tables, these might contain garbage in not
> explicitly written entries.
> 
> This is especially a problem for Xen PV guests, as the hypervisor will
> validate page tables (check for writable page tables and hypervisor
> private bits) before accepting them to be used. There have been reports
> of early crashes of PV guests due to illegal page table contents.
> 
> Fix that by letting clear_bss() clear the brk area, too.

While it does make sense to clear the brk area, I don't understand how
my patch broke this.  How was it getting cleared before?

-- 
Josh

