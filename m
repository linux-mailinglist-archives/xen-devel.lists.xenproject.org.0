Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A2560735
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 19:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357992.586923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bKn-0004vt-LZ; Wed, 29 Jun 2022 17:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357992.586923; Wed, 29 Jun 2022 17:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bKn-0004u6-Io; Wed, 29 Jun 2022 17:18:37 +0000
Received: by outflank-mailman (input) for mailman id 357992;
 Wed, 29 Jun 2022 17:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fe+6=XE=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1o6bKl-0004u0-KU
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 17:18:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80765d17-f7cf-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 19:18:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF21A61E4F;
 Wed, 29 Jun 2022 17:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C95C34114;
 Wed, 29 Jun 2022 17:18:30 +0000 (UTC)
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
X-Inumbo-ID: 80765d17-f7cf-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656523111;
	bh=cElJT+fqYXMLdJ0O9skHbTQ8acmcYY3npP0Idut/ntE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ti985LV+4onMHrTrVh1q2DMliiCN0ww7NfP/MJct+nuqmClkkjSIm86ULTpKL6g59
	 j52/wek/dOmKMWSktBjEyg1c3kKfFSnPTazCVlvOWhTqyvfGgp3YWMqiwQVEherWIx
	 3rqDa3Vl8HJobmeSU2QbQa1aLy6JIFBt1L9QOc+Hg4uEotfZ7mm8fA+CgaOVzQtRju
	 ltcPDaOpAuvwEcnqabUllBaMIDjNmYW9vzyVao4gVbX8MBdN0LZKtvwywxC/uRQ7af
	 pWZwK075jfREZIJpdmS6LNLO0ojr7i5JUu0L0Ncws5c/OqsGKW84vkr92vx8zhwQOE
	 vyBGKuZ/nMtIw==
Date: Wed, 29 Jun 2022 10:18:29 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/3] x86: fix .brk attribute in linker script
Message-ID: <20220629171829.shotpln44nzgo2eu@treble>
References: <20220623094608.7294-1-jgross@suse.com>
 <20220623094608.7294-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220623094608.7294-4-jgross@suse.com>

On Thu, Jun 23, 2022 at 11:46:08AM +0200, Juergen Gross wrote:
> Commit e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
> added the "NOLOAD" attribute to the .brk section as a "failsafe"
> measure.
> 
> Unfortunately this leads to the linker no longer covering the .brk
> section in a program header, resulting in the kernel loader not knowing
> that the memory for the .brk section must be reserved.
> 
> This has led to crashes when loading the kernel as PV dom0 under Xen,
> but other scenarios could be hit by the same problem (e.g. in case an
> uncompressed kernel is used and the initrd is placed directly behind
> it).
> 
> So drop the "NOLOAD" attribute. This has been verified to correctly
> cover the .brk section by a program header of the resulting ELF file.
> 
> Fixes: e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh

