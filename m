Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E0AB1E9B
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 22:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980355.1366797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDUnK-0003Ia-Dq; Fri, 09 May 2025 20:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980355.1366797; Fri, 09 May 2025 20:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDUnK-0003Gn-At; Fri, 09 May 2025 20:58:10 +0000
Received: by outflank-mailman (input) for mailman id 980355;
 Fri, 09 May 2025 20:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDUnJ-0003Gh-JG
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 20:58:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e13a683-2d18-11f0-9eb5-5ba50f476ded;
 Fri, 09 May 2025 22:58:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8C3AAA4D44C;
 Fri,  9 May 2025 20:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19196C4CEE4;
 Fri,  9 May 2025 20:58:03 +0000 (UTC)
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
X-Inumbo-ID: 4e13a683-2d18-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746824285;
	bh=89GvoYV+xgetI0H6k01GKNKKZHz8+LxBhTfaHALHDi8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jTvoXFFCEuGyyjVqb4y7vs12GEpYD1NRBG+A8ISVV7MynLtuJyN/4awPCL9nS46ZX
	 mMBjJR/eBmkTeccuCVyQqfQt3lBx3sk4KJKN2c34QMpyPaDxq+NVBgYFmRb3m1D1B+
	 yBMhGks1AnSiAKLH+xNZvIvVHukZ5NUBAMrd6BxsWb8gLIR4KoATvYv5G79IrTCfiQ
	 jPwlGZTeRM0MrTfj1Ac6MgR8nh+ZAM4yWGHBs+xmNTgefDw339SixqNYN5+JKDTlKa
	 SwB4lO+i8OxEA0qHdJjSVq6C7n53+2VZFTwJ97bhjsDt9RK+TQZ4btbuIU5gqrXusJ
	 dapyEMoM2IVTQ==
Date: Fri, 9 May 2025 13:58:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v21 1/2] arm/vpci: mask off upper bits in vPCI read mmio
 handler
In-Reply-To: <20250508104608.531079-2-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505091357510.3879245@ubuntu-linux-20-04-desktop>
References: <20250508104608.531079-1-stewart.hildebrand@amd.com> <20250508104608.531079-2-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 May 2025, Stewart Hildebrand wrote:
> On Arm, we expect read handlers to have the bits above the access size
> zeroed. vPCI read handlers may return all 1s. Mask off the bits above
> the access size.
> 
> Fixes: 9a5e22b64266 ("xen/arm: check read handler behavior")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/vpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index b63a356bb4a8..3a3ff5d0812c 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -37,7 +37,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                          1U << info->dabt.size, &data) )
>      {
> -        *r = data;
> +        *r = data & invalid;
>          return 1;
>      }
>  
> -- 
> 2.49.0
> 

