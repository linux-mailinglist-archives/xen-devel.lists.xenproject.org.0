Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4794D8B0
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2024 00:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774973.1185352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scXzl-0002mQ-H2; Fri, 09 Aug 2024 22:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774973.1185352; Fri, 09 Aug 2024 22:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scXzl-0002kq-E5; Fri, 09 Aug 2024 22:22:01 +0000
Received: by outflank-mailman (input) for mailman id 774973;
 Fri, 09 Aug 2024 22:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waF5=PI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1scXzk-0002kk-9A
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 22:22:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8dbb91f-569d-11ef-8776-851b0ebba9a2;
 Sat, 10 Aug 2024 00:21:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B7435CE180B;
 Fri,  9 Aug 2024 22:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA01C32782;
 Fri,  9 Aug 2024 22:21:50 +0000 (UTC)
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
X-Inumbo-ID: c8dbb91f-569d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723242110;
	bh=PrNwgsGz4IBAQJsAwidi/ZJL1yTvraA18BklKUU+izw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=erln7huUmdj2aaRSEx9VLZdNxgAkLVTBwVfU1jqkRrMKRF0LsJaVyqOyMYHzvpFJq
	 UTbweGO0YaLgHrkLQKZtw5teELOm8llpDqYMTb1MKme9tMzl0lvmjSxVQRvnc30u58
	 QKxxWuU3If1dXPDu4k2Lf/2Y1osH2iDBOz0BGdt4absz7RgmGYM3OgquC4J0FUSlpk
	 yaovFa0xOSuNYX03MqTpgVAzMtWH6g9sK0GrIVZqv3ftfXSboxbLwj7J1bMfpT3JDx
	 7gGLjjdmTl8DeRdAnfv8WkMu4FpSAy4BhfkutBfyNr0LtvSdSecMazHBY3obTbanUs
	 BiEHcGB4LuRAg==
Date: Fri, 9 Aug 2024 15:21:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
In-Reply-To: <d4ea2213-4c12-40d2-ba12-64f2e7e492c6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408091515050.200407@ubuntu-linux-20-04-desktop>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com> <alpine.DEB.2.22.394.2408061117080.4954@ubuntu-linux-20-04-desktop> <d4ea2213-4c12-40d2-ba12-64f2e7e492c6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Aug 2024, Jan Beulich wrote:
> On 06.08.2024 20:24, Stefano Stabellini wrote:
> > On Mon, 5 Aug 2024, Jan Beulich wrote:
> >> LAR, LSL, VERR, and VERW emulation involve calling protmode_load_seg()
> >> with x86_seg_none. The fuzzer's read_segment() hook function has an
> >> assertion which triggers in this case. Calling the hook function,
> >> however, makes little sense for those insns, as there's no data to
> >> retrieve. Instead zero-filling the output structure is what properly
> >> corresponds to those insns being invoked with a NUL selector.
> >>
> >> Fixes: 06a3b8cd7ad2 ("x86emul: support LAR/LSL/VERR/VERW")
> >> Oss-fuzz: 70918
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Looking at oss-fuzz's report and at this patch I think it is correct
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> S-o-b?

Sorry I meant reviewed-by


> > That said, there are a few other places where read_segment is called
> > without any checks for seg being x86_seg_none. The hvm implementation of
> > read_segment (hvmemul_read_segment) seems to return error if
> > x86_seg_none is passed as an argument, but there is no return error
> > checks any time we call ops->read_segment in x86_emulate.c.
> 
> There is a pretty limited number of cases where x86_seg_none is used.
> For example, state->ea.mem.seg cannot hold this value.
> realmode_load_seg() also cannot be passed this value. We could add
> assertions to that effect, yet that can get unwieldy as further
> x86_seg_* enumerators are added (see "x86: introduce x86_seg_sys"; I
> expect we'll need at least one more when adding VMX/SVM insn emulation,
> where physical addresses are used as insn operands).
> 
> > It seems that there might still be an issue?
> 
> In my auditing I didn't spot any.

Following your explanation I come to the same conclusion as you, so I
think it is OK. But knowing that state->ea.mem.seg cannot hold this
value and realmode_load_seg() also cannot be passed this value is not
something for the casual observer, so in my opinion there is room here
for making the code more resilient and more obvious by always checking
the return value of read_segment.

