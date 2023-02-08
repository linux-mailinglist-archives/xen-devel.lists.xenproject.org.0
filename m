Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8CF68FA89
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 00:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492044.761437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPtPo-0007RD-ID; Wed, 08 Feb 2023 22:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492044.761437; Wed, 08 Feb 2023 22:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPtPo-0007PC-Ed; Wed, 08 Feb 2023 22:59:48 +0000
Received: by outflank-mailman (input) for mailman id 492044;
 Wed, 08 Feb 2023 22:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5Eh=6E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pPtPn-0007Kn-8u
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 22:59:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47ee4f12-a804-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 23:59:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF28617F5;
 Wed,  8 Feb 2023 22:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3532C4339B;
 Wed,  8 Feb 2023 22:59:43 +0000 (UTC)
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
X-Inumbo-ID: 47ee4f12-a804-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675897184;
	bh=YnK7HRJ4hK2uu+41T7pp/AupUdbQmAdObEN04h8C2U0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C4OZWlarqbqgXTzUTXxTgRgPSqm+iTcyAQtKcRHbTbCjJy2XgwzPg3+U7rrgWP2nO
	 /9RmR0EK5bh38ebNB1FgEdkkIWmVjPn2nTgO9osd1dU1YqbbUJgFBQ03WM3myW2ttn
	 qg3XZ3x8IwOyc025KSpP7+nTaqhL9tKZIrteG+A6ZfvPUfM26dAZ//AxKCLxUIKOX8
	 HfSht4wyQLcXX1LTH1++tqm01kd8L4aVUIxpN3O4j3br8aqFGDaOd9WUaeLrHFEzUM
	 xcNH5tJbxRhLFRVd5DTO/vm0sZme+FvHyLDpGwVtHJEqQFv26tImvnPdVcy5Sj7Zb2
	 tuBuZmks7HRAg==
Date: Wed, 8 Feb 2023 14:59:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Gianluca Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 14/14] automation: modify RISC-V smoke test
In-Reply-To: <95527748699e6ab643dc2fdee634fe934ae12f60.1675779308.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2302081459350.4661@ubuntu-linux-20-04-desktop>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <95527748699e6ab643dc2fdee634fe934ae12f60.1675779308.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Feb 2023, Oleksii Kurochko wrote:
> The patch modifies the grep pattern to reflect the usage of WARN.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V3:
>  - Update commit message
> ---
> Changes in V2:
>  - Leave only the latest "grep ..."
> ---
>  automation/scripts/qemu-smoke-riscv64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index e0f06360bc..02fc66be03 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,5 +16,5 @@ qemu-system-riscv64 \
>      |& tee smoke.serial
>  
>  set -e
> -(grep -q "Hello from C env" smoke.serial) || exit 1
> +(grep -q "WARN is most likely working" smoke.serial) || exit 1
>  exit 0
> -- 
> 2.39.0
> 

