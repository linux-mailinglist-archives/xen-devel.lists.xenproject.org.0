Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0D770AFB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577357.904452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2NH-0003JM-Mu; Fri, 04 Aug 2023 21:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577357.904452; Fri, 04 Aug 2023 21:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2NH-0003Gz-JQ; Fri, 04 Aug 2023 21:30:19 +0000
Received: by outflank-mailman (input) for mailman id 577357;
 Fri, 04 Aug 2023 21:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2NF-0003Gr-OX
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:30:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191dc224-330e-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 23:30:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77681620DC;
 Fri,  4 Aug 2023 21:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF8CC433C8;
 Fri,  4 Aug 2023 21:30:11 +0000 (UTC)
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
X-Inumbo-ID: 191dc224-330e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691184612;
	bh=jE1feFZVsHIUi2jn8BB5TK5WmyVgoA8N7R50JfUrPfY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q6XF5hlexnTSOJkXIov9xhowr3sjHUb8cX8tWYopB/qZctEtkbTZ44EXVfdxiU8jc
	 fh0EP1+Z5aiNiL5XA+uy8pzI/5dLTxfvRv6MtOkNMWdwBiq5FIKkY6aaNR9TP+wY9v
	 nq9aLB8aVPpBirl4iiYW8jHYIWxnLEo1U+oecFyQX8qA0dHAyTzrROaOerCUfHtcOd
	 2rPKtl3/yjS1Ztv0i9XxQEeU42vlFtQlfzFyBGfJf3pgfYjMikwwenc0qliMsqlIMi
	 pRz9UwnUv9gof/7mfh906NRQrUFHv6oX8LcbII52lWMgfz9IApBk5H4We577JDQgrR
	 c+ycrR3j9z7Dg==
Date: Fri, 4 Aug 2023 14:30:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 6/6] x86: refactor macros in 'xen-mca.h' to address
 MISRA C:2012 Rule 5.3
In-Reply-To: <a3459c0d04b900f9164bd849cf264134@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041429500.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com> <a3459c0d04b900f9164bd849cf264134@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> > -            _mic = x86_mcinfo_next(_mic);                       \
> > +            mic_ = x86_mcinfo_next(mic_);                         \
> >          }                                                       \
> > -        (_ret) = found ? _mic : NULL;                           \
> > +        (ret) = found_ ? mic_ : NULL;                            \
> >      } while (0)
> > 
> > 
> > --
> > 2.34.1
> 
> Stray blanks here, sorry.

Aside from the stray blanks:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

