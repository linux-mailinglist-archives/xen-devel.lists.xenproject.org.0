Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C256746D9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481354.746180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIdvg-0005iP-Sa; Thu, 19 Jan 2023 23:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481354.746180; Thu, 19 Jan 2023 23:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIdvg-0005fh-P1; Thu, 19 Jan 2023 23:02:44 +0000
Received: by outflank-mailman (input) for mailman id 481354;
 Thu, 19 Jan 2023 23:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIdvf-0005fb-AI
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:02:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 605450ae-984d-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 00:02:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B85961D80;
 Thu, 19 Jan 2023 23:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8253DC433EF;
 Thu, 19 Jan 2023 23:02:39 +0000 (UTC)
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
X-Inumbo-ID: 605450ae-984d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674169360;
	bh=xM+fVZyXdWtZjElkj5Vr0f5uVWipaXvA1W5Ch7MZ8wE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YU/t43PS3jcNJ00OGIVESZ/sfTLj/U9EEHwAScfwgizAGnjweed2erLFu/ZeL9Aa7
	 0YsXeoK2sxEgIrM0EcT2oePWCCkCz85c1C620WnaIJU7qTngyPKRz2KSVxBYS5Of8W
	 +7vvVUWDPFIZt63DCnOkHa5EL4zOm0su1W8StU9Bh0P7p4cAWPzCfcAn8fZi5iE80n
	 x3LbFLn1vlv0qbwH/cve9Lvx/HQYkP2fIOuVmanlYNlHGVbZjuVj+WTybhjjEPQscQ
	 Ze8522pm1JJ654M/4eI7ME1XpEc1c6MTjKaKcPhCHlT1sCDMJfLRtnGPpxbJnTq/Ju
	 EQUNwIBuUQS2g==
Date: Thu, 19 Jan 2023 15:02:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 03/11] xen/arm: domain_build: Replace use of paddr_t in
 find_domU_holes()
In-Reply-To: <20230117174358.15344-4-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191459230.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-4-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> bankbase, banksize and bankend are used to hold values of type 'unsigned
> long long'. This can be represented as 'uint64_t' instead of 'paddr_t'.
> This will ensure consistency with allocate_static_memory() (where we use
> 'uint64_t' for rambase and ramsize).
> 
> In future, paddr_t can be used for 'uin32_t' as well to represent 32bit
> physical addresses.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

I saw that Julien commented about using unsigned long long. To be
honest, given that we typically use explicitly-sized integers (which is
a good thing) and unsigned long long is always uint64_t on all
architectures, I can see the benefits of using uint64_t here.

At the same time, I can see that the reason for change the type here is
that we are dealing with ULL values, so it would make sense to use
unsigned long long.

I cannot see any big problem/advantages either way, so I am OK with
this patch. (Julien, if you prefer unsigned long long I am fine with
that also.)

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> 
> Changes from -
> 
> v1 - Modified the title/commit message from "[XEN v1 6/9] xen/arm: Use 'u64' to represent 'unsigned long long"
> and moved it earlier.
> 
>  xen/arch/arm/domain_build.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 33a5945a2d..f904f12408 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1726,9 +1726,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>                                    struct meminfo *ext_regions)
>  {
>      unsigned int i;
> -    paddr_t bankend;
> -    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
> -    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
> +    uint64_t bankend;
> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>      int res = -ENOENT;
>  
>      for ( i = 0; i < GUEST_RAM_BANKS; i++ )
> -- 
> 2.17.1
> 

