Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8832695A5EA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 22:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781485.1190999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgrzh-0007dG-UI; Wed, 21 Aug 2024 20:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781485.1190999; Wed, 21 Aug 2024 20:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgrzh-0007bT-PD; Wed, 21 Aug 2024 20:31:49 +0000
Received: by outflank-mailman (input) for mailman id 781485;
 Wed, 21 Aug 2024 20:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sgrzg-0007VV-Ce
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 20:31:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62362ff9-5ffc-11ef-a50a-bb4a2ccca743;
 Wed, 21 Aug 2024 22:31:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39072CE0EE2;
 Wed, 21 Aug 2024 20:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9BFC32781;
 Wed, 21 Aug 2024 20:31:41 +0000 (UTC)
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
X-Inumbo-ID: 62362ff9-5ffc-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724272302;
	bh=+R8Dy7r63QjNE9vA1g9biK4T4oWUUq/f4KamlNJlfdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E57hC1PmIujDZ753pE5HvHonBU3Q/bXPDhRZ6fEtqhpzsbAXnZTMpPcTfJjoh9pBA
	 IyGcHw5PjpVszuwueRiO9DzGaiIQvtRhTxVsNmVGoAmh6D8fyXaaL1G94lmk30mHV9
	 3Nf891/Ex0GIY5Ga2KhtqaLJI6BModKfvDloSqDIHurW5X0ATKBiwLiP9i4cGsB1o0
	 hKzIYVEd+1m58fwIVtqwel5ZJ04G75Z7H41u0LZRWAM4GYPT1utvYafGN8ForItZ6d
	 h54IlXXAHT4MP1ZyKWl6JurCsclVsgJhOunn6ZzTCJ+/uIsgmBLjNIWnNrkjtQeJd5
	 GSmszFIB1O2bw==
Date: Wed, 21 Aug 2024 13:31:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <stefano.stabellini@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    anthony.perard@vates.tech, cardoe@cardoe.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2] automation: restore CR filtering
In-Reply-To: <20240821202958.3942632-1-stefano.stabellini@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408211331300.3871186@ubuntu-linux-20-04-desktop>
References: <20240821202958.3942632-1-stefano.stabellini@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2024, Stefano Stabellini wrote:
> After commit c36efb7fcea6 ("automation: use expect to run QEMU") we lost
> the \r filtering introduced by b576497e3b7d ("automation: remove CR
> characters from serial output"). This patch reintroduced it.
> 
> Fixes: c36efb7fcea6 ("automation: use expect to run QEMU")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - fix the sed expression to account for multiple \r
> - ensure Xen logs are visible too

I forgot to add:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1421979833


> ---
>  automation/scripts/qemu-alpine-x86_64.sh        | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm32.sh     | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm64.sh     | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm32.sh | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm64.sh | 2 +-
>  automation/scripts/qemu-smoke-ppc64le.sh        | 2 +-
>  automation/scripts/qemu-smoke-riscv64.sh        | 2 +-
>  automation/scripts/qemu-smoke-x86-64.sh         | 2 +-
>  automation/scripts/qemu-xtf-dom0less-arm64.sh   | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 5359e0820b..42a89e86b0 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -89,4 +89,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index bbdcb39f1a..fd64b19358 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -96,4 +96,4 @@ export QEMU_LOG="${serial_log}"
>  export LOG_MSG="Domain-0"
>  export PASSED="/ #"
>  
> -../automation/scripts/qemu-key.exp
> +../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index 0094bfc8e1..e0cea742b0 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -109,4 +109,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index 68ffbabdb8..e824cb7c2a 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -149,4 +149,4 @@ export QEMU_LOG="${serial_log}"
>  export LOG_MSG="${dom0_prompt}"
>  export PASSED="${passed}"
>  
> -../automation/scripts/qemu-key.exp
> +../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index eb25c4af4b..f42ba5d196 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -220,4 +220,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Welcome to Alpine Linux"
>  export PASSED="${passed}"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> index ccb4a576f4..594f92c19c 100755
> --- a/automation/scripts/qemu-smoke-ppc64le.sh
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -25,4 +25,4 @@ export QEMU_CMD="qemu-system-ppc64 \
>  export QEMU_LOG="${serial_log}"
>  export PASSED="Hello, ppc64le!"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index 0355c075b7..c2595f657f 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,4 +16,4 @@ export QEMU_CMD="qemu-system-riscv64 \
>  export QEMU_LOG="smoke.serial"
>  export PASSED="All set up"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> index 37ac10e068..3440b1761d 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -24,4 +24,4 @@ export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
>  export QEMU_LOG="smoke.serial"
>  export PASSED="Test result: SUCCESS"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> index 0666f6363e..4042fe5060 100755
> --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
>  export QEMU_LOG="smoke.serial"
>  export PASSED="${passed}"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> -- 
> 2.25.1
> 

