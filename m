Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3517FB4DE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 09:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642809.1002516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7toz-0005ei-6S; Tue, 28 Nov 2023 08:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642809.1002516; Tue, 28 Nov 2023 08:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7toz-0005ca-33; Tue, 28 Nov 2023 08:51:57 +0000
Received: by outflank-mailman (input) for mailman id 642809;
 Tue, 28 Nov 2023 08:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oxj7=HJ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r7tox-0005cU-F9
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 08:51:55 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 612cfbe6-8dcb-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 09:51:54 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1AEFA40E0195; 
 Tue, 28 Nov 2023 08:51:53 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ChluQ_0bI5c3; Tue, 28 Nov 2023 08:51:51 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2C26740E0031;
 Tue, 28 Nov 2023 08:51:28 +0000 (UTC)
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
X-Inumbo-ID: 612cfbe6-8dcb-11ee-98e3-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701161510; bh=b8kwNDDb/tymHpQVlkI8A91DHBnyujPGQHRX1wsU7tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q08NRJnAt21ZSfXI9PipunbDM7nORGQfk8q2MESUfrbhwdKcDNj/lvfrYaXQO6WrR
	 Uu/ou1jioWe9ismICRfRUVg3d+FQm/wPx6FZWqYIkuOj00lA7FTXRPgomSFC12JB9p
	 jx/Z+egKyrd9s+V6EUpP+PM29kiHtGxAEP6D+mj4x/WjUbMc5t6epBadUQmbQ6T59d
	 OHk9CXHFlXeMht5fKmdxwhaqaJsJcYjQcCwAG14XuoCwOAs3qO/8qwx/JlqJ47/JYv
	 +APDpeBEVPM7yMnVxkTaHX1cKKlYOzNJVz9G0G08aIT//tOtvT3TSq6/suZGzKM0iW
	 3xkbwEKeMxRkIQ1+WXUKcxmhbpGn8ST23QukmzUcDnTznWywJX4RBZBJ8xABUD/x/q
	 LpqrCLx8GqTQcvX46p79XCA7vm/VHTiyKe0iNeXxQqdC6Df8FkqJr0G6fi36OCuyGb
	 m5Jnl1QGqjQufT6g7fBC7LdpVg2DsriyG5b8QRGrNW+ZxiZWZHnDQ/wPnEwrzPEhcD
	 M/86WHzJqxUVJPuatkx67BNxXkgs8VEkb78/GQIFTZBVSPRw+rz5eNeMgEWAoMpQX2
	 q2gDBvCHdO54qtQ99xUVX3BvzTocJHZahfSUqyeY3gOuejIEZg/bj1NCSFqFY7mArL
	 sGFHikREKV+Z0TDiEnXHYFYs=
Date: Tue, 28 Nov 2023 09:51:22 +0100
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
Subject: Re: [PATCH v12 16/37] x86/ptrace: Add FRED additional information to
 the pt_regs structure
Message-ID: <20231128085122.GPZWWqCrPYnzB8BqFB@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-17-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003062458.23552-17-xin3.li@intel.com>

On Mon, Oct 02, 2023 at 11:24:37PM -0700, Xin Li wrote:
> FRED defines additional information in the upper 48 bits of cs/ss
> fields. Therefore add the information definitions into the pt_regs
> structure.
> 
> Specially introduce a new structure fred_ss to denote the FRED flags
> above SS selector, which avoids FRED_SSX_ macros and makes the code
> simpler and easier to read.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

You and hpa need to go through all the patches and figure out who's the
author that's going to land in git.

Because this and others have hpa's SOB first, suggesting he's the
author. However, the mail doesn't start with

From: H. Peter Anvin (Intel) <hpa@zytor.com>

and then git will make *you* the author.

> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Xin Li <xin3.li@intel.com>

...

>  	union {
> -		u64	ssx;	// The full 64-bit data slot containing SS
> -		u16	ss;	// SS selector
> +		/* SS selector */
> +		u16		ss;
> +		/* The extended 64-bit data slot containing SS */
> +		u64		ssx;
> +		/* The FRED SS extension */
> +		struct fred_ss	fred_ss;

Aha, sanity about the right comments has come to your mind in this next
patch. :-P

Just do them right in the previous one.

>  	/*
> -	 * Top of stack on IDT systems.
> +	 * Top of stack on IDT systems, while FRED systems have extra fields
> +	 * defined above for storing exception related information, e.g. CR2 or
> +	 * DR6.

Btw, I really appreciate the good commenting - thanks for that!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

