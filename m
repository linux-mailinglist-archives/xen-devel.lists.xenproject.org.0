Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422DAE26B5
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 02:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021381.1397359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmOG-0004M7-Qc; Sat, 21 Jun 2025 00:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021381.1397359; Sat, 21 Jun 2025 00:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmOG-0004Jp-Ny; Sat, 21 Jun 2025 00:47:28 +0000
Received: by outflank-mailman (input) for mailman id 1021381;
 Sat, 21 Jun 2025 00:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSmOF-0004Jj-96
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 00:47:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bdfcbc7-4e39-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 02:47:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C827743E3D;
 Sat, 21 Jun 2025 00:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2ABC4CEE3;
 Sat, 21 Jun 2025 00:47:22 +0000 (UTC)
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
X-Inumbo-ID: 4bdfcbc7-4e39-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750466843;
	bh=eNyfj4HcVVfJwlfA5ckj0FD7tOgstwB1mZA2xwOFq+I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XCWr4CH06RlWP2Iy0mCZ2GZQT+IUQrne3JcBC4OKXA06Ph7rSw/0iooGL5Fy3irfz
	 VWdnYNA3FEb0hGBAxedFw1glpwCzTaXOypU+8TNuSExMXb3IXgrbcIOdONQVIkxEXD
	 Oren2ElSPedS6Q4FanIqJoi2+tZCBU8iIw6xYaFSh4ovMpbFbMsXaSKktWhsN8QrU4
	 KVFhouEaLaryLgk+lYL1l3w47XDsO7Zet87wHzlTQa3qczDSavzSKvp/bhl6N3sOEp
	 E7e4XfnBmYUpLJbhet8Kp2CxitJG3ukX6QP6vsWBCtKLJId5zqLYnWXJEkEgY4Mjpp
	 rWG0DMj+9jv2Q==
Date: Fri, 20 Jun 2025 17:47:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3] xen/dt: Remove loop in dt_read_number()
In-Reply-To: <20250619114206.1014-1-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506201747130.2978375@ubuntu-linux-20-04-desktop>
References: <20250619114206.1014-1-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Alejandro Vallejo wrote:
> The DT spec declares only two number types for a property: u32 and u64,
> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
> with a switch statement. Default to a size of 1 cell in the nonsensical
> size case, with a warning printed on the Xen console.
> 
> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> If there's any #address-size > 2 out there at least we'll know in debug builds.
> It's not like this function can cope with them either way.
> 
> I haven't tested things past CI.
> 
> pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1876848415
> 
> v3:
>   * s/WARNING/ERR
>   * //-style comment to /**/-style comment
>   * break after ASSERT_UNREACHABLE() to please MISRA
> ---
>  xen/include/xen/device_tree.h | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..d2de7c3a13 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,22 @@ void intc_dt_preinit(void);
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)
>  {
> -    u64 r = 0;
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +        break;
> +    default:
> +        /* Nonsensical size. default to 1 */
> +        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
> +        ASSERT_UNREACHABLE();
> +        break;
> +    };
>  
> -    while ( size-- )
> -        r = (r << 32) | be32_to_cpu(*(cell++));
>      return r;
>  }
>  
> 
> base-commit: 22650d6054625be10172fe0c78b9cadd1a39bd63
> -- 
> 2.43.0
> 

