Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA66594973D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 19:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773024.1183469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbOT6-0006xy-7R; Tue, 06 Aug 2024 17:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773024.1183469; Tue, 06 Aug 2024 17:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbOT6-0006vd-4x; Tue, 06 Aug 2024 17:59:32 +0000
Received: by outflank-mailman (input) for mailman id 773024;
 Tue, 06 Aug 2024 17:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+gn=PF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sbOT4-0006vX-F7
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 17:59:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fc1da7f-541d-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 19:59:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 715C260EF9;
 Tue,  6 Aug 2024 17:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADD3C32786;
 Tue,  6 Aug 2024 17:59:26 +0000 (UTC)
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
X-Inumbo-ID: 9fc1da7f-541d-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722967167;
	bh=GrfkeoeKJld1TWWzn8ni1CD1wNZ1Mx9SdRHvpW/rEDQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LTV75rIHjRBE1uzwq78+clPD24d2AX8AoTuUGpAqp31kJKVx9UsU9U73EPV0reX/v
	 4Qvt4F7v8/mmD4+EJvLuSYjMgNAmJD6i/HbEYsJB0t0yKvLqyM6wKryxP/iMLiT6cN
	 ykW+ta1C7YeAF3N0pZYnFTvNVhIUJDqMe6BMSCFNwtO549PieSDfEg5OevYAnlI6UV
	 DUYldqEgs8GD/yhF2w1hnaIGtPxvfX8Z7u9lDirECzW2Sb3tNN9A/yTvf0r47uNyHs
	 EaYTwBPk2mK3hG/u4vZ6ix91PDTNzkcaiY+23UEAAxD1RMEqdCm+M5NmAPMZhhlSK5
	 +53CI4nHKowrg==
Date: Tue, 6 Aug 2024 10:59:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: avoid UB shift in AVX512 VPMOV* handling
In-Reply-To: <9f73c7bd-4aa3-4a66-a12c-4bfda6aa233a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408061059180.4954@ubuntu-linux-20-04-desktop>
References: <9f73c7bd-4aa3-4a66-a12c-4bfda6aa233a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Jan Beulich wrote:
> For widening and narrowing moves, operand (vector) size is calculated
> from a table. This calculation, for the AVX512 cases, lives ahead of
> validation of EVEX.L'L (which cannot be 3 without raising #UD). Account
> for the later checking by adjusting the constants in the expression such
> that even EVEX.L'L == 3 will yield a non-UB shift (read: shift count
> reliably >= 0).
> 
> Fixes: 3988beb08 ("x86emul: support AVX512{F,BW} zero- and sign-extending moves")
> Oss-fuzz: 70914
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -5788,7 +5788,7 @@ x86_emulate(
>              d = DstMem | SrcReg | TwoOp;
>          }
>          generate_exception_if(evex.brs, X86_EXC_UD);
> -        op_bytes = 32 >> (pmov_convert_delta[b & 7] + 1 - evex.lr);
> +        op_bytes = 64 >> (pmov_convert_delta[b & 7] + 2 - evex.lr);
>          elem_bytes = (b & 7) < 3 ? 1 : (b & 7) != 5 ? 2 : 4;
>          goto avx512f_no_sae;
>  
> 

