Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1260CC5C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 14:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429848.681127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onJL1-0006AH-Eq; Tue, 25 Oct 2022 12:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429848.681127; Tue, 25 Oct 2022 12:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onJL1-00067s-B3; Tue, 25 Oct 2022 12:47:23 +0000
Received: by outflank-mailman (input) for mailman id 429848;
 Tue, 25 Oct 2022 12:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S2dr=22=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1onJKz-00067m-Lk
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 12:47:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28dc214c-5463-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 14:47:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 726D1618C8;
 Tue, 25 Oct 2022 12:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60931C433D6;
 Tue, 25 Oct 2022 12:47:17 +0000 (UTC)
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
X-Inumbo-ID: 28dc214c-5463-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666702037;
	bh=PRmqS5H+nCp9dplF7lCxZ/svls2XGbTUgDWMeIMlsbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O16r+C8HYrEgaR0P0z3/hFYuLy0xAnu9sEbIfGlOOfQCoSWHULDzBxmppvxU7hE8j
	 lVYQXCmknfIwBbCNw3vBkg5PV5+lZgKV/yNUhkExYtevIQjjb1NDTJrfemJS++jSnA
	 hwV2PWwEAX3vTqQG9BkfOPcOL976KoEVpzlxurmY=
Date: Tue, 25 Oct 2022 14:47:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavel Machek <pavel@denx.de>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	Kees Cook <keescook@chromium.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 4.19 174/229] x86/entry: Work around Clang __bdos() bug
Message-ID: <Y1fa082Vhar2x1DM@kroah.com>
References: <20221024112959.085534368@linuxfoundation.org>
 <20221024113004.718917343@linuxfoundation.org>
 <20221024174127.GC25198@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024174127.GC25198@duo.ucw.cz>

On Mon, Oct 24, 2022 at 07:41:27PM +0200, Pavel Machek wrote:
> Hi!
> 
> > From: Kees Cook <keescook@chromium.org>
> > 
> > [ Upstream commit 3e1730842f142add55dc658929221521a9ea62b6 ]
> > 
> > Clang produces a false positive when building with CONFIG_FORTIFY_SOURCE=y
> > and CONFIG_UBSAN_BOUNDS=y when operating on an array with a dynamic
> > offset. Work around this by using a direct assignment of an empty
> > instance. Avoids this warning:
> > 
> > ../include/linux/fortify-string.h:309:4: warning: call to __write_overflow_field declared with 'warn
> > ing' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wat
> > tribute-warning]
> >                         __write_overflow_field(p_size_field, size);
> >                         ^
> > 
> > which was isolated to the memset() call in xen_load_idt().
> > 
> > Note that this looks very much like another bug that was worked around:
> > https://github.com/ClangBuiltLinux/linux/issues/1592
> 
> We don't have CONFIG_UBSAN_BOUNDS in 4.19, so maybe we don't need this
> one?

Good point, I'll drop this from 5.4.y and older now, thanks.

greg k-h

