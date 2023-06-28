Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786DB741C1A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 01:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556617.869291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEe9P-0003Et-W2; Wed, 28 Jun 2023 23:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556617.869291; Wed, 28 Jun 2023 23:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEe9P-0003BZ-SR; Wed, 28 Jun 2023 23:00:39 +0000
Received: by outflank-mailman (input) for mailman id 556617;
 Wed, 28 Jun 2023 23:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzH+=CQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qEe9O-0003BT-Ri
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 23:00:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97636320-1607-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 01:00:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BF0D61485;
 Wed, 28 Jun 2023 23:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ABAC433C8;
 Wed, 28 Jun 2023 23:00:33 +0000 (UTC)
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
X-Inumbo-ID: 97636320-1607-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687993234;
	bh=4NxMM46wx4n80Ir9D1FNLVnF1fmV4ZnNhWSbFqmSnmg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oyrCEqRAPSmL4f9qj3gpXLzTPcEdW0Z2OJFaHEjStlntNKfYcoqiO+aAdh2ugt+U7
	 94mj2FkJXqD/hkqonu2b7M01WXoclYlXdlCCjRrhT3F+I7aa3kElhqgN8lBIxn9f3G
	 CM7kIJ91sWwd3x0+upkP1IgusLvNIotsabwRwgykT9PBtCKS+OTCjVV8zmHVlV/CCF
	 Z3YQdK7MSWAOkPa1M+UQJiC/pEEVsRXltrd4EpKiVU8vXUTcAywzCX26V6sdLbEe/1
	 BxTkOSulceMu4Svq9/jHBWxMKOLlna9jp/QdX21/oAsm3PQt1G29NsSl+lcNhrFuje
	 ZxRtpFz3SvLUQ==
Date: Wed, 28 Jun 2023 16:00:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2] xen/arm: arm32: Allow Xen to boot on unidentified
 CPUs
In-Reply-To: <20230626181444.2305769-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306281600250.3936094@ubuntu-linux-20-04-desktop>
References: <20230626181444.2305769-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jun 2023, Ayan Kumar Halder wrote:
> Currently if the processor id is not identified (ie it is missing in proc-v7.S)
> , then Xen boot fails quite early.
> We have removed this restriction as for some CPUs (eg Cortex-R52), there isn't
> any special initialization required.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from -
> 
> v1 - "[PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52 processor"
> No need to add R52 proc id and empty stubs as there is no cpu initialization
> required.
> 
>  xen/arch/arm/arm32/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index f9f7be9588..3e88178552 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -324,7 +324,7 @@ cpu_init:
>          PRINT("- Missing processor info: ")
>          print_reg r4
>          PRINT(" -\r\n")
> -        b     fail
> +        b     cpu_init_done
>  1:
>          /* Jump to cpu_init */
>          ldr   r1, [r1, #PROCINFO_cpu_init]  /* r1 := vaddr(init func) */
> -- 
> 2.25.1
> 
> 

