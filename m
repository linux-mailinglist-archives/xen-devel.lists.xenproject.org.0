Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AA949784
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 20:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773042.1183490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbOr3-0003h8-9K; Tue, 06 Aug 2024 18:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773042.1183490; Tue, 06 Aug 2024 18:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbOr3-0003fI-6V; Tue, 06 Aug 2024 18:24:17 +0000
Received: by outflank-mailman (input) for mailman id 773042;
 Tue, 06 Aug 2024 18:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+gn=PF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sbOr2-0003fC-Dq
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 18:24:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14316341-5421-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 20:24:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 19671CE0B2C;
 Tue,  6 Aug 2024 18:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3708C32786;
 Tue,  6 Aug 2024 18:24:09 +0000 (UTC)
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
X-Inumbo-ID: 14316341-5421-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722968650;
	bh=bWHhvPFF8Wx2JGLU3gSDx/cmkVvRs8T4Ai9q3ToRkYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IohomgoVcfYAkHxSHouyASF4e2zQiAYII0fI7vxylj9gQ8OTKrD1RLSGR+umhENez
	 W2sgKtaTEybKdx5SSc0isel7KYpKEVBaZyA4LEHJXrSqDn95ZtEzThxlC5F0KKxaEA
	 DW4bPG8IzZKXwrC3IWcDemZTJffVA+QK6owz/HXmbI7YsCTcKkm+t5e58Y7/pTcoDP
	 oWnDsRcXF7FJnCGfHBhu5HfsGJMgvqcIohxEjs4VdDKA9n44d4dwotL+L/Spgy0SmC
	 K4Xnh0MtcT7Mo8dO+bfTW0SO5xVs448DqoIzbBEU+ewwQwOlV/StVjRY7z4zkOp042
	 Pc8kE27XQAQIw==
Date: Tue, 6 Aug 2024 11:24:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
In-Reply-To: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408061117080.4954@ubuntu-linux-20-04-desktop>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Jan Beulich wrote:
> LAR, LSL, VERR, and VERW emulation involve calling protmode_load_seg()
> with x86_seg_none. The fuzzer's read_segment() hook function has an
> assertion which triggers in this case. Calling the hook function,
> however, makes little sense for those insns, as there's no data to
> retrieve. Instead zero-filling the output structure is what properly
> corresponds to those insns being invoked with a NUL selector.
> 
> Fixes: 06a3b8cd7ad2 ("x86emul: support LAR/LSL/VERR/VERW")
> Oss-fuzz: 70918
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looking at oss-fuzz's report and at this patch I think it is correct

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>


That said, there are a few other places where read_segment is called
without any checks for seg being x86_seg_none. The hvm implementation of
read_segment (hvmemul_read_segment) seems to return error if
x86_seg_none is passed as an argument, but there is no return error
checks any time we call ops->read_segment in x86_emulate.c.

It seems that there might still be an issue?


> ---
> It is pure guesswork that one of those insns did trigger the assertion.
> The report from oss-fuzz sadly lacks details on the insn under
> emulation. I'm further surprised that AFL never found this.
> 
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -839,7 +839,8 @@ protmode_load_seg(
>          case x86_seg_tr:
>              goto raise_exn;
>          }
> -        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
> +        if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
> +             !ops->read_segment ||
>               ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
>              memset(sreg, 0, sizeof(*sreg));
>          else
> 

