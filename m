Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CC765B80
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 20:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571252.894644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP5w3-0003EV-E8; Thu, 27 Jul 2023 18:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571252.894644; Thu, 27 Jul 2023 18:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP5w3-0003CZ-BC; Thu, 27 Jul 2023 18:42:03 +0000
Received: by outflank-mailman (input) for mailman id 571252;
 Thu, 27 Jul 2023 18:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qP5w1-0003CT-Ps
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 18:42:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455a043a-2cad-11ee-b24a-6b7b168915f2;
 Thu, 27 Jul 2023 20:42:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79B4361E90;
 Thu, 27 Jul 2023 18:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB50C433C7;
 Thu, 27 Jul 2023 18:41:58 +0000 (UTC)
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
X-Inumbo-ID: 455a043a-2cad-11ee-b24a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690483318;
	bh=juL/Fs+z0WaByJA+d+6gaJXz5Tv4ufqtBBaFNGf9/3Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f5Owtnh8sIYu8KN0lEREURFHaqh1Hwjy67CN3VV4eBQHM2jhW+QqwE7fxe17iM9uV
	 fOdaZcy33ZAo8wPWEXheSQ3PkTzOJ1rc0w7J3ILedBE12AfEhvbiymb09iqJ636F2o
	 +sJlG39Z7cctK7dJJsLeliCf0KChcxOu5MaGCsZkD124r1jttkuZ7BaGGye9WPxFIO
	 klYFDAcNMCO/6cqvWHdmvXPwWQpGcPBlKmw9otscFiFTszqr4OiJzjH/BWMxAM8tME
	 TU1APhgU/127FG9wE96zee0PWpfNnAHFZuvPq1gLYnBTzMetf3vM79DUF0skba79a8
	 tKjPozWI+QAvg==
Date: Thu, 27 Jul 2023 11:41:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Paul Durrant <paul@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/HVM: drop dead assignments from
 hvmemul_rep_{movs,stos}()
In-Reply-To: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307271141500.3118466@ubuntu-linux-20-04-desktop>
References: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jul 2023, Jan Beulich wrote:
> In the latter case the variable altogether is then unused and hence gets
> dropped, eliminating a Misra Rule 5.3 violation. I'm afraid I mistakenly
> introduced both assignments in 57a57465daaf ("x86/HVM: use available
> linear->phys translations in REP MOVS/STOS handling"), likely as a
> result of some re-work on the patch.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1861,7 +1861,6 @@ static int cf_check hvmemul_rep_movs(
>              return rc;
>      }
>  
> -    bytes = PAGE_SIZE - (daddr & ~PAGE_MASK);
>      if ( hvio->mmio_access.write_access &&
>           (hvio->mmio_gla == (daddr & PAGE_MASK)) &&
>           /* See comment above. */
> @@ -1988,7 +1987,7 @@ static int cf_check hvmemul_rep_stos(
>          container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
>      struct vcpu *curr = current;
>      struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
> -    unsigned long addr, bytes;
> +    unsigned long addr;
>      paddr_t gpa;
>      p2m_type_t p2mt;
>      bool_t df = !!(ctxt->regs->eflags & X86_EFLAGS_DF);
> @@ -1998,7 +1997,6 @@ static int cf_check hvmemul_rep_stos(
>      if ( rc != X86EMUL_OKAY )
>          return rc;
>  
> -    bytes = PAGE_SIZE - (addr & ~PAGE_MASK);
>      if ( hvio->mmio_access.write_access &&
>           (hvio->mmio_gla == (addr & PAGE_MASK)) &&
>           /* See respective comment in MOVS processing. */
> 

