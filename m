Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E433A9E26C
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 12:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969815.1358749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8z5n-0006cw-VY; Sun, 27 Apr 2025 10:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969815.1358749; Sun, 27 Apr 2025 10:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8z5n-0006aR-Sz; Sun, 27 Apr 2025 10:18:35 +0000
Received: by outflank-mailman (input) for mailman id 969815;
 Sun, 27 Apr 2025 10:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mo7N=XN=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u8z5m-0006aL-0w
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 10:18:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5a1fa4f-2350-11f0-9ffb-bf95429c2676;
 Sun, 27 Apr 2025 12:18:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C3B55C365B;
 Sun, 27 Apr 2025 10:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E785C4CEEF;
 Sun, 27 Apr 2025 10:18:22 +0000 (UTC)
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
X-Inumbo-ID: f5a1fa4f-2350-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745749106;
	bh=L7uhmgzdcPMMNpeCjXVtvKibb8+nFSEltpr8Sjv+mGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvCrjiybvTY0/WvL1ox/pY2ZElx88ZlFJXqTv22U0Yn7gwzaqmLmacBEfhQgvgrfL
	 8SI72doZ4zQQ2fTGluj2fPPRLSdBU1mQVPKKpB5lc3hS0YdF2CCIXnNBpGr3VSINjE
	 CHWysqhvkgob59ydkDUqfVBQ+mQSkUAfk/eyOhkb37d0UJRmy02DjlHSNY+jHSBp/x
	 njihO9Gof91jSkeg4Dtv0Vv6CXBm+U517/QysoHnszSSAZsN2VYrEATGNZ/cVCEiy0
	 duvXRbmEOmujKqCS8PutcLDaBQmi2b3QfVuFe48V/0H+YjxXirETLEIMUdYhwKcpIc
	 w+9GubMfHo3mw==
Date: Sun, 27 Apr 2025 12:18:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA4EbGhuHNUYlkp_@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <9D1971C6-8C13-4526-8D2B-37A1D3B0B066@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9D1971C6-8C13-4526-8D2B-37A1D3B0B066@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> The undefined zero case applies to family < 6 as far as I know... the 
> same platforms which don't have cmov...

So, technically, these are family 5 CPUs with CMOV support, if 
Kconfig.cpu can be believed:

  MGEODE_LX
  MCRUSOE

Right?

	Ingo

