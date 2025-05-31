Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CBFAC98A9
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001726.1381855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAJl-0005p8-Dz; Sat, 31 May 2025 00:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001726.1381855; Sat, 31 May 2025 00:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAJl-0005m9-Am; Sat, 31 May 2025 00:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1001726;
 Sat, 31 May 2025 00:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAJk-0005m1-BY
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:43:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c1d1079-3db8-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 02:43:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4CA85C680E;
 Sat, 31 May 2025 00:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992A3C4CEE9;
 Sat, 31 May 2025 00:43:11 +0000 (UTC)
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
X-Inumbo-ID: 3c1d1079-3db8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652193;
	bh=FaU9HWD89sdfcTJbsxzCp71UmwvKZJYlSV7gG1ejjrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RH8qyTPg2fOhc5uPcZl5e4YTnDKhJl5bY9MxbxFyNGTK3cL5QjPlfU7/+9wpX2xPk
	 zp1aF3C5ZAlvnu567L8lwB0o/hJWmDzsjpQllvN+VLg9c4YInsfvF0z7hF4l2moxOL
	 ui68YlBf3WbL0Xg3djAMdzz0ISkIsJJ67fIO1GOSRB2ce0dxycfV7k4bNHqyh35qQf
	 8QhCQJbbhGeEdH0ucwwruMo9ObZ+UDXe2WvZC1BUFKGWQnOUQFnyJaZY2x7ZYxo8ou
	 xmgVTYddI9qud1sVzQGMMUNzz/p2VvNouTJ/MzaHooAfbtrNcmAk1uibm2dt7Li4Qf
	 Lp9jonP+1KfjQ==
Date: Fri, 30 May 2025 17:43:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 03/19] riscv: Add missing forward declaration to intc.h
In-Reply-To: <20250530120242.39398-4-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301743030.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-4-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> Very much not a functional change
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/riscv/include/asm/intc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
> index 52ba196d87..81f74736ba 100644
> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -8,6 +8,8 @@
>  #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
>  #define ASM__RISCV__INTERRUPT_CONTOLLER_H
>  
> +struct dt_device_node;
> +
>  enum intc_version {
>      INTC_APLIC,
>  };
> -- 
> 2.43.0
> 

