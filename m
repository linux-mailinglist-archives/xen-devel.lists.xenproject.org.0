Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70043993982
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812525.1225314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvXa-0002Vb-OS; Mon, 07 Oct 2024 21:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812525.1225314; Mon, 07 Oct 2024 21:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvXa-0002U4-Ld; Mon, 07 Oct 2024 21:45:18 +0000
Received: by outflank-mailman (input) for mailman id 812525;
 Mon, 07 Oct 2024 21:45:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxvXZ-0002T9-0T
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:45:17 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fbb8f03-84f5-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 23:45:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EFDACA4086D;
 Mon,  7 Oct 2024 21:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B1EC4CEC6;
 Mon,  7 Oct 2024 21:45:13 +0000 (UTC)
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
X-Inumbo-ID: 6fbb8f03-84f5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728337514;
	bh=Mh4sT+IaV43reervkTF/KCNaezg5y8WO/3Q6Uoo4PZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rNyYjOynwcMHFfFkvSy7s5d3XfeMAwSBnYwo47yaioLepDKp1exHfz4kORLM4B19s
	 hZES1CKspw3LwdhGQuQa7/hu1HiIlkHJ1pmZOInNHGz/sSjGZQ5Rqp8q+7zfqwjsnG
	 PWhT7Ky8k4ZgQbq1s6f0arAGLjc1pA2U9bfnQIUfyBpmNhf3LGbn0ifvY1W+cZHRiT
	 1mnuD9jVHGb2lLdzwOeHbfKxd0vp5PXCtEhX0u8N5kzBYbs52lO5i2Q2TvnY3wza2U
	 k0aO69tnnyokGKlqLG503ogYPDHYY9jncQIQayo46DlOzFi8It6CU+SOWpgaKP3CzL
	 rvHup6NvLsMfQ==
Date: Mon, 7 Oct 2024 14:45:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 4/4] xen/pci: address a violation of MISRA C Rule
 16.3
In-Reply-To: <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2410071445060.3512606@ubuntu-linux-20-04-desktop>
References: <cover.1728308312.git.federico.serafini@bugseng.com> <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Oct 2024, Federico Serafini wrote:
> Refactor the code to avoid an implicit fallthrough and address
> a violation of MISRA C:2012 Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - improved description.
> ---
>  xen/drivers/passthrough/pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 5a446d3dce..a5705def3f 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
>      {
>      case 1: case 2: case 4:
>          if ( *s )
> -    default:
>              return -EINVAL;
> +        break;
> +    default:
> +        return -EINVAL;
>      }
>  
>      phantom_devs[nr_phantom_devs++] = phantom;
> -- 
> 2.43.0
> 

