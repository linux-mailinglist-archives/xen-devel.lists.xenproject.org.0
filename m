Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A269D1C15
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 00:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839602.1255390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBdn-0001bN-M1; Mon, 18 Nov 2024 23:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839602.1255390; Mon, 18 Nov 2024 23:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBdn-0001Yw-JA; Mon, 18 Nov 2024 23:58:47 +0000
Received: by outflank-mailman (input) for mailman id 839602;
 Mon, 18 Nov 2024 23:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5+n=SN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDBdm-0001Yq-Vw
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 23:58:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a119c05-a609-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 00:58:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 845CCA41FD2;
 Mon, 18 Nov 2024 23:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063DFC4CECC;
 Mon, 18 Nov 2024 23:58:40 +0000 (UTC)
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
X-Inumbo-ID: 0a119c05-a609-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjBhMTE5YzA1LWE2MDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTc0MzIzLjM3MTczLCJzZW5kZXIiOiJzc3RhYmVsbGluaUBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731974321;
	bh=PX0mpXdKKXHMdRljYUGqUi7dOJMFVoT5EBQ6rBGbwQ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I6WBOvLzQHy/DvnDof4nlfvwx/4VCay9cs4l4+S2W1HTo7M53uPnoTA4y0urC7J9K
	 LH6zqTujAH+RHqEogvVrzAT2AjRByOGx740ImI29fRO1h1Z3SCdpwwYWTM1BBvw8bq
	 +AeE7N36WH6awl65kptREodbhawIR8jN0FZ40IMFIBMt340l2cF9RwhiJqb1I+OFaT
	 Ij6bdUN+AN3Z1871p3VO5T8ZGuDIaIybUGJVpLIVpQpB+6zeo3eb3NS8gW0ylLP5kF
	 QsPgY6c7jhwumv2KoJCrzc0Wb7/xTbttbMVtiIqsFk/p/XoF7p4XITaQbeb5JpMs0j
	 xB4KF05Vp1zsw==
Date: Mon, 18 Nov 2024 15:58:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] xen/bootinfo: Include declaration for
 fw_unreserved_regions()
In-Reply-To: <20241118105145.2329902-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411181557520.1160299@ubuntu-linux-20-04-desktop>
References: <20241118105145.2329902-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Nov 2024, Andrew Cooper wrote:
> Eclair complains that fw_unreserved_regions() can't see it's declaration.
> Include <asm/setup.h> to address this.
> 
> This makes Mira Rule 8.4 clean on ARM, so tag it as such.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Very nice! Thank you!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1547057124
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
>  xen/common/device-tree/bootinfo.c             | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 9318e5b10ca8..7944ce2ee3b2 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -115,7 +115,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R8.4||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index f2e6a1145b7c..3738eb57ff52 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -17,6 +17,8 @@
>  #include <xen/libfdt/libfdt-xen.h>
>  #include <xen/mm.h>
>  
> +#include <asm/setup.h>
> +
>  struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
>  
>  const char * __init boot_module_kind_as_string(bootmodule_kind kind)
> 
> base-commit: 88c40dc108bfddb32a891e2e20d48bbe94949200
> -- 
> 2.39.5
> 

