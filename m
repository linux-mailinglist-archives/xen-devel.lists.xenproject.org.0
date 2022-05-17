Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A752B1D3
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 07:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331284.555148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrC7Z-0008Bj-3W; Wed, 18 May 2022 05:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331284.555148; Wed, 18 May 2022 05:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrC7Y-00089M-W5; Wed, 18 May 2022 05:21:16 +0000
Received: by outflank-mailman (input) for mailman id 331284;
 Tue, 17 May 2022 16:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG/f=VZ=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1nr0HL-0007gm-EH
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:42:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59855c5e-d600-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 18:42:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9390661311;
 Tue, 17 May 2022 16:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4DAC385B8;
 Tue, 17 May 2022 16:42:31 +0000 (UTC)
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
X-Inumbo-ID: 59855c5e-d600-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652805751;
	bh=40QgoKo6FsbvUbi5QdZQ8LuhD5fRy9TTvAullSg1NJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwWIlS2PIiYyBVnn4Mwh5gpkaGvjZ9XXs6xAfg/B47Nwbmbxt1jD4gbBJqWNjqdMQ
	 9HsczaMvfd1/rGWYbOOfRQQ8ljqODK0+cJuySkUlONzKGxTAf8vwfrIVpXgVVx8uEs
	 2wEIDbBj2r6oEJ8Bg+f36Z7hiv1BLcfQOKNiXlvcmlPA51l29SkqrSaHJPFlCkSIOv
	 ZO+9XIU4/ifqWs5xRjRbqYPsENsylbITKTx1dz0Y7FgDcqk5osLy4ZTnejsI+dxtEZ
	 bmhi2bch/bLTXyegzpR1TlkIA84eFyb3Od9vzJccH13ypTlfBkZZJB3euhFYap4q4G
	 St6J2fKtLWqSA==
Date: Tue, 17 May 2022 09:42:29 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Maximilian Heyne <mheyne@amazon.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86: xen: remove STACK_FRAME_NON_STANDARD from xen_cpuid
Message-ID: <20220517164229.ixz7fqxwrxwmiizn@treble>
References: <20220517162425.100567-1-mheyne@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220517162425.100567-1-mheyne@amazon.de>

On Tue, May 17, 2022 at 04:24:25PM +0000, Maximilian Heyne wrote:
> Since commit 4d65adfcd119 ("x86: xen: insn: Decode Xen and KVM
> emulate-prefix signature"), objtool is able to correctly parse the
> prefixed instruction in xen_cpuid and emit correct orc unwind
> information. Hence, marking the function as STACKFRAME_NON_STANDARD is
> no longer needed.
> 
> This commit is basically a revert of commit 983bb6d254c7 ("x86/xen: Mark
> xen_cpuid() stack frame as non-standard").
> 
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> CC: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> cr: https://code.amazon.com/reviews/CR-69645080
      ^^^^^

This looks like an internal amazon link and should be removed.
Otherwise, looks good to me.

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh

