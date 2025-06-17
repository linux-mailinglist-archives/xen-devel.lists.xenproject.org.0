Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5622ADDD47
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 22:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018507.1395390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRd28-0005lW-7X; Tue, 17 Jun 2025 20:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018507.1395390; Tue, 17 Jun 2025 20:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRd28-0005j7-4A; Tue, 17 Jun 2025 20:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1018507;
 Tue, 17 Jun 2025 20:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRd26-0005in-Pb
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 20:35:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a710e856-4bba-11f0-a30a-13f23c93f187;
 Tue, 17 Jun 2025 22:35:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 664FCA51E05;
 Tue, 17 Jun 2025 20:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4D1C4CEF1;
 Tue, 17 Jun 2025 20:35:47 +0000 (UTC)
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
X-Inumbo-ID: a710e856-4bba-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750192548;
	bh=uAi8POX0ByOPTyFAILw9Y1dj0FN6VKth7MfuDiGcRz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dZ/Ljp2u3OhxVyVFRykPGqmJZx6dnnxpayoCSadlRWufMYX03RQUQaeb5rWb9IsO1
	 qD367hlYYUnZYifoZi0AU/UPmEa5f9wil1Uxx9uA8MaNMv+rzKrgMndOpN2vBVwp33
	 OkuRf2W33i1O76u+x9Ov2l7b13MCiK1HEWB8QThQ6wRD+BeQQrtQzoI9WuRFB1PA3S
	 /Uha7asKUEHmQDl4Stt3/VPV3DcT407JgIW5iSx/epSD0Gjy2rw17G3QW/QI7UQI+t
	 9oCMlmRoiR4cR5gqRgqkq/wHRFeBAPo54gHGerBlt5VDKdky4xnhv2Us5TV+4sp3gs
	 hK5IxF8YXmjAQ==
Date: Tue, 17 Jun 2025 13:35:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] xen/dt: Remove loop in dt_read_number()
In-Reply-To: <20250617171358.670642-1-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506171102480.1384757@ubuntu-linux-20-04-desktop>
References: <20250617171358.670642-1-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Alejandro Vallejo wrote:
> The DT spec declares only two number types for a property: u32 and u64,
> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
> with a switch statement. Default to a size of 1 cell in the nonsensical
> size case, with a warning printed on the Xen console.
> 
> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v2:
>   * Added missing `break` on the `case 2:` branch and added ASSERT_UNREACHABLE() to the deafult path
> ---
>  xen/include/xen/device_tree.h | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..2ec668b94a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,21 @@ void intc_dt_preinit(void);
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
> +        // Nonsensical size. default to 1.

NIT: comment style is /* comment */

> +        printk(XENLOG_WARNING "dt_read_number(%d) bad size\n", size);
> +        ASSERT_UNREACHABLE();

You need a break statement even after ASSERT_UNREACHABLE() for MISRA R16.3


> +    };
>  
> -    while ( size-- )
> -        r = (r << 32) | be32_to_cpu(*(cell++));
>      return r;
>  }
>  
> 
> base-commit: 14c57887f36937c1deb9eeca852c3a7595d2d0b8
> -- 
> 2.43.0
> 

