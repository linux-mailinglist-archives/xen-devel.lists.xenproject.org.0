Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB7792AC74
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 01:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755649.1164065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQxZ5-00058K-IM; Mon, 08 Jul 2024 23:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755649.1164065; Mon, 08 Jul 2024 23:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQxZ5-00056D-Fl; Mon, 08 Jul 2024 23:14:35 +0000
Received: by outflank-mailman (input) for mailman id 755649;
 Mon, 08 Jul 2024 23:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgpN=OI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sQxZ4-000567-Lw
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 23:14:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4c2b747-3d7f-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 01:14:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3660611EB;
 Mon,  8 Jul 2024 23:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558CC116B1;
 Mon,  8 Jul 2024 23:14:28 +0000 (UTC)
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
X-Inumbo-ID: d4c2b747-3d7f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720480470;
	bh=0QHGRQ292hmDIAtRoV8vjuJiWMGOE6ygT3BwAK0/NNw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X2rzQeP5qrwQXsPvKE631Ejpm08ZcSe11JzFqc0OAIyn5BpFRhVA19w8f6OlLXMTd
	 OT5JC8klstKIAc0ifkygPVwC1L9CZtKEi1W5hgDLs5OD5HB3voA9rImTkiOYHqb/tS
	 j1YkQQkkJGx+QFIGxSZmB2Ll9EW9LyzDknqHnXVuK4d8dVMfK/TyIuG2p2FPA7ql9n
	 e7rou1/9GJjbMoXUVOfxlQmVoUKXlo+UMG3FILlZEpqSgP8Vmm2bZJvub+wKQW8UQ1
	 clNPDEz2sc15R5u5vPVpiTL/xZTz9Q//njRXXrcnEfC130QylZVIG/ggDBfIkmx5XD
	 KgZHpTI0anrFQ==
Date: Mon, 8 Jul 2024 16:14:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v1 1/2] physmem: Bail out qemu_ram_block_from_host() for
 invalid ram addrs
In-Reply-To: <20240701224421.1432654-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2407081614210.3635@ubuntu-linux-20-04-desktop>
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com> <20240701224421.1432654-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jul 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Bail out in qemu_ram_block_from_host() when
> xen_ram_addr_from_mapcache() does not find an existing
> mapping.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  system/physmem.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/system/physmem.c b/system/physmem.c
> index 33d09f7571..59d1576c2b 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2277,6 +2277,10 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>          ram_addr_t ram_addr;
>          RCU_READ_LOCK_GUARD();
>          ram_addr = xen_ram_addr_from_mapcache(ptr);
> +        if (ram_addr == RAM_ADDR_INVALID) {
> +            return NULL;
> +        }
> +
>          block = qemu_get_ram_block(ram_addr);
>          if (block) {
>              *offset = ram_addr - block->offset;
> -- 
> 2.43.0
> 

