Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5A730BB9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 01:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549281.857729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9a9W-0002QA-Is; Wed, 14 Jun 2023 23:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549281.857729; Wed, 14 Jun 2023 23:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9a9W-0002OV-Fz; Wed, 14 Jun 2023 23:43:50 +0000
Received: by outflank-mailman (input) for mailman id 549281;
 Wed, 14 Jun 2023 23:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9a9V-0002OP-OS
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 23:43:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eb2545b-0b0d-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 01:43:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72F4C62DE5;
 Wed, 14 Jun 2023 23:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070B0C433C8;
 Wed, 14 Jun 2023 23:43:45 +0000 (UTC)
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
X-Inumbo-ID: 4eb2545b-0b0d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686786226;
	bh=JMaitTtVtZSmRh3vCis5EXNzOM6bThQaUF9PykfQSFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mCWYM7LCQ8hf3M5ZREtbQaSt5AGBBeIvWF5tx7kGIgxOTYQ7HLbjq/0TSIxyedfoA
	 23lpBihjlZ2vP3i+2W5LkBXWsb6FaduV94GThbqlLiNMbcgmtRT1nKBvCgaEtLz8OR
	 EGDCnoXdZGMUgbEeK/6YHqjNoJE/xma7K4E4ep7jivInF17kARWlX7PT0XM1n8u+x1
	 I4XYkwZF0w5lmzatU1tDnqLBuTR4fFt5avAu2MwbXt/PEEt6KpYs+DpFyi1beImY+F
	 uj438yHlFggUmGxpCIYaZWt4q0fLTNRyaQpc4UcVT8YoSloyhF6S7uE7dmRKn5KuBt
	 ZU/hyfXvFxXYw==
Date: Wed, 14 Jun 2023 16:43:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] Arm: drop bogus ALIGN() from linker script
In-Reply-To: <303b0288-d372-315b-16f9-4116d7f478fc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306141643370.897208@ubuntu-linux-20-04-desktop>
References: <303b0288-d372-315b-16f9-4116d7f478fc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jun 2023, Jan Beulich wrote:
> Having ALIGN() inside a section definition usually makes sense only with
> a label definition following (an exception case is a few lines out of
> context, where cache line sharing is intended to be avoided).
> Constituents of .bss.page_aligned need to specify their own alignment
> correctly anyway, or else they're susceptible to link order changing.
> This requirement is already met: Arm-specific code has no such object,
> while common (EFI) code has another one. That one has suitable alignment
> specified.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Note how RISC-V had this dropped pretty recently.
> 
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -199,7 +199,6 @@ SECTIONS
>    .bss : {                     /* BSS */
>         __bss_start = .;
>         *(.bss.stack_aligned)
> -       . = ALIGN(PAGE_SIZE);
>         *(.bss.page_aligned)
>         . = ALIGN(PAGE_SIZE);
>         __per_cpu_start = .;
> 

