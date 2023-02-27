Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4516A4CC0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 22:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502931.774975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWkjF-0003M7-PS; Mon, 27 Feb 2023 21:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502931.774975; Mon, 27 Feb 2023 21:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWkjF-0003KM-MX; Mon, 27 Feb 2023 21:08:13 +0000
Received: by outflank-mailman (input) for mailman id 502931;
 Mon, 27 Feb 2023 21:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pWkjE-0003KE-2x
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 21:08:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d70907f3-b6e2-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 22:08:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4190DB80DA3;
 Mon, 27 Feb 2023 21:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E86EC433EF;
 Mon, 27 Feb 2023 21:08:07 +0000 (UTC)
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
X-Inumbo-ID: d70907f3-b6e2-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677532089;
	bh=z7jgl+rkzbV8KLibn061z5BMzWghZWTEtb8c76rL5+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tsLYIVpnB5VzwpJvD8j5HupGyxmO15mKOyj531PWV9ML98aEByIbz3BgmtPsYilPC
	 Eh002xOxTb64AJA3R1fhhjoLe5eK2liStRJtWGGmBZtpssTMesJKMWYEPuevoTkTOb
	 +enuKs09srrNzCJFpOMnvppRsB3W4DwgKWH0uxWuJiiqG1EVQPWvXGGl9SUV6BuLxP
	 fOrohygvn62qiAoo7zGCMNVGeNE1TnyMIUtL9nMzl4Yk/554zBLFPWRsbQ4V8QQVfR
	 zOQSMREgWw8Fk8o7DO4jLTRMSI+rPjYvmUjoERGiBApwYjGsLlfY6vlsh9tHCN5Det
	 Xg6RdFI8Hs5Tw==
Date: Mon, 27 Feb 2023 13:08:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Simplify RISCV smoke testing
In-Reply-To: <20230224153721.2623760-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2302271307580.3680@ubuntu-linux-20-04-desktop>
References: <20230224153721.2623760-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Feb 2023, Andrew Cooper wrote:
> Use a single fairly generic string as the "all done" message to look for,
> which avoids the need to patch qemu-smoke-riscv64.sh each time a new feature
> is added.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> 
> I considered "All set up and nowhere to go" but it's probably a little niche.
> ---
>  automation/scripts/qemu-smoke-riscv64.sh | 2 +-
>  xen/arch/riscv/setup.c                   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index e0f06360bc43..4008191302f9 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,5 +16,5 @@ qemu-system-riscv64 \
>      |& tee smoke.serial
>  
>  set -e
> -(grep -q "Hello from C env" smoke.serial) || exit 1
> +(grep -q "All set up" smoke.serial) || exit 1
>  exit 0
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index d09ffe1454a4..1c87899e8e90 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -11,6 +11,7 @@ void __init noreturn start_xen(void)
>  {
>      early_printk("Hello from C env\n");
>  
> +    early_printk("All set up\n");
>      for ( ;; )
>          asm volatile ("wfi");
>  
> -- 
> 2.30.2
> 

