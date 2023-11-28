Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B77FB462
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 09:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642788.1002495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7taZ-0001t5-MY; Tue, 28 Nov 2023 08:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642788.1002495; Tue, 28 Nov 2023 08:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7taZ-0001r3-Jo; Tue, 28 Nov 2023 08:37:03 +0000
Received: by outflank-mailman (input) for mailman id 642788;
 Tue, 28 Nov 2023 08:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oxj7=HJ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r7taX-0001qx-Mb
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 08:37:02 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1a935c-8dc9-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 09:37:00 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D84A840E01A5; 
 Tue, 28 Nov 2023 08:36:58 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1vHsmSMNDYS3; Tue, 28 Nov 2023 08:36:57 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C01D840E0031;
 Tue, 28 Nov 2023 08:36:34 +0000 (UTC)
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
X-Inumbo-ID: 4c1a935c-8dc9-11ee-98e3-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701160617; bh=DS2d99Cf/Tm1b0CoskKzTkSL4zfPSaK6CYmxmDpIDno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8Kl7pOfZkDJ1aauL4p8L+PlN65c8sIR0dkdP1NbqWcLcQY6vEQjYeM/r0US8S9kF
	 RYKot1G8DTIU2i/vJbZ1dY8cBcGfRTw5eFgwVvUfS9BBoA90TBlEUp24OXrYB919e/
	 Oy9SPBMTF8mwOQGo4ENPJBFKDroY/sp19zB/SlzHi4KLsJ7dwdNlb1E3uwAjDanJoQ
	 vo2I6xeoAedHIyLyWVbyRwoypXxt0W/z9QtACLsVB9EJOZcuTpIzfRI0WQVy6PL0gs
	 lmvT8HdZT00moCakbNxG+hW2JFqsKP3UGOqM6ogwuTCRPnTt7vEHovr6BESHhP7Ghd
	 PrmO7bjwnAbf9slrMSVBPDynMcWeQLLh9sCucQNJyRSFHTD1ls5zbvnTNuutqKbcVd
	 2/D/sbPwNva3NafVp2mXa6fzDye7Dr0YJO74ghd0IpJ4svVag2MEsEKbllMGPOFaXB
	 yZKZTGXbFd5A0XC5WOguBvIJ+ogDfpVmSLzBtQ8aaFnZiDT5roz378AGxU0Cs0Jl7g
	 cOR129yb77LRWYUT6q9WwvjgaMIebKAbVM5H2TWl293NIL68arozCJwBKM7mI5u88B
	 1N9KRnvXlfSALDR32hWnUk2p/Kit1WXMb19R1Wxy4zqEb1j33zwAYoVT0pWIswldS1
	 cDLymiOsuFxx+9JUg1fX4yC8=
Date: Tue, 28 Nov 2023 09:36:29 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
	seanjc@google.com, peterz@infradead.org, jgross@suse.com,
	ravi.v.shankar@intel.com, mhiramat@kernel.org,
	andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: Re: [PATCH v12 15/37] x86/ptrace: Cleanup the definition of the
 pt_regs structure
Message-ID: <20231128083629.GOZWWmjTe8l+IwXG5j@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-16-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003062458.23552-16-xin3.li@intel.com>

On Mon, Oct 02, 2023 at 11:24:36PM -0700, Xin Li wrote:
> -/* Return frame for iretq */
> +
> +	/* The IRETQ return frame starts here */
>  	unsigned long ip;
> -	unsigned long cs;
> +
> +	union {
> +		u64	csx;	// The full 64-bit data slot containing CS
> +		u16	cs;	// CS selector

I know people want to start using those // one-line comments now but
this struct already uses the /* multiline ones. Can we stick to one type
pls, otherwise it'll turn into a mess.

And pls put those comments ontop, not on the side.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

