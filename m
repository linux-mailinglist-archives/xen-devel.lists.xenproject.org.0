Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B427E8BA017
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716109.1118193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2atu-00071w-Hl; Thu, 02 May 2024 18:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716109.1118193; Thu, 02 May 2024 18:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2atu-00070R-Et; Thu, 02 May 2024 18:11:22 +0000
Received: by outflank-mailman (input) for mailman id 716109;
 Thu, 02 May 2024 18:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2ats-0006Np-Vt
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:11:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fbbf117-08af-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 20:11:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6267F61BFB;
 Thu,  2 May 2024 18:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7333BC113CC;
 Thu,  2 May 2024 18:11:16 +0000 (UTC)
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
X-Inumbo-ID: 5fbbf117-08af-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714673478;
	bh=XhYOxmZWkP66YztGtxmVj1HWIYgzpvO5VBxe2rJtMBc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s4y7zGWDzJenlan5uDQq3mzmQ+ocer6Fpxr84npjHlzsY2E9VWt9aRWRYF+KdfHlF
	 yIMJehZ8Ge2C3mFrusdiLt0ioFlqWGGJD3k8rgPE+ua7cEUkGmEvxXJcyVSFglErF/
	 rpmE7poR0aT+A/08w8gQgqTOu1Y1vYy31xUDXUnESd0ea6Ns9/DxsIqz6laVurDNCK
	 4XJYfeF6P8UPolOAH94ULAkiCjrYNTJIPgv/p7+oIHOnNx/B1ui7Esf6DRYsDARKtm
	 Lr/hdVeGXISk4ADZhKawCdl6AlRWiuCsuxHKa6VWvcx609bL0R9Sk8nRzjMIQ6HtDv
	 dLyTsgHd8hktw==
Date: Thu, 2 May 2024 11:11:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v1.1] xen/commom/dt-overlay: Fix missing lock when remove
 the device
In-Reply-To: <20240426015550.577986-1-xin.wang2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405021111070.624854@ubuntu-linux-20-04-desktop>
References: <20240426015550.577986-1-xin.wang2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1925617102-1714673478=:624854"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1925617102-1714673478=:624854
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Apr 2024, Henry Wang wrote:
> If CONFIG_DEBUG=y, below assertion will be triggered:
> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     00000a0000257418 iommu_remove_dt_device+0x8c/0xd4
> (XEN) LR:     00000a00002573a0
> (XEN) SP:     00008000fff7fb30
> (XEN) CPSR:   0000000000000249 MODE:64-bit EL2h (Hypervisor, handler)
> [...]
> 
> (XEN) Xen call trace:
> (XEN)    [<00000a0000257418>] iommu_remove_dt_device+0x8c/0xd4 (PC)
> (XEN)    [<00000a00002573a0>] iommu_remove_dt_device+0x14/0xd4 (LR)
> (XEN)    [<00000a000020797c>] dt-overlay.c#remove_node_resources+0x8c/0x90
> (XEN)    [<00000a0000207f14>] dt-overlay.c#remove_nodes+0x524/0x648
> (XEN)    [<00000a0000208460>] dt_overlay_sysctl+0x428/0xc68
> (XEN)    [<00000a00002707f8>] arch_do_sysctl+0x1c/0x2c
> (XEN)    [<00000a0000230b40>] do_sysctl+0x96c/0x9ec
> (XEN)    [<00000a0000271e08>] traps.c#do_trap_hypercall+0x1e8/0x288
> (XEN)    [<00000a0000273490>] do_trap_guest_sync+0x448/0x63c
> (XEN)    [<00000a000025c480>] entry.o#guest_sync_slowpath+0xa8/0xd8
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
> (XEN) ****************************************
> 
> This is because iommu_remove_dt_device() is called without taking the
> dt_host_lock. Fix the issue by taking and releasing the lock properly.
> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1.1:
> - Move the unlock position before the check of rc.
> ---
>  xen/common/dt-overlay.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index 1b197381f6..ab8f43aea2 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -381,7 +381,9 @@ static int remove_node_resources(struct dt_device_node *device_node)
>      {
>          if ( dt_device_is_protected(device_node) )
>          {
> +            write_lock(&dt_host_lock);
>              rc = iommu_remove_dt_device(device_node);
> +            write_unlock(&dt_host_lock);
>              if ( rc < 0 )
>                  return rc;
>          }
> -- 
> 2.34.1
> 
--8323329-1925617102-1714673478=:624854--

