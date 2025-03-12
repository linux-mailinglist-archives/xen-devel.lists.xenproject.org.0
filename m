Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26877A5E87F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911053.1317616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVef-0002w4-I2; Wed, 12 Mar 2025 23:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911053.1317616; Wed, 12 Mar 2025 23:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVef-0002uI-EG; Wed, 12 Mar 2025 23:38:29 +0000
Received: by outflank-mailman (input) for mailman id 911053;
 Wed, 12 Mar 2025 23:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVed-0002u6-HN
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:38:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 131fe1fa-ff9b-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:38:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 89B0CA44E4D;
 Wed, 12 Mar 2025 23:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BBDC4CEDD;
 Wed, 12 Mar 2025 23:38:15 +0000 (UTC)
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
X-Inumbo-ID: 131fe1fa-ff9b-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822697;
	bh=7sLtySOIXizZt6wv3vwL2RjT0pgpsLe2ZaEJVVqlJtk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=arc5dwOzXj99pSrGFxiiKnlnnIGBWPWcWgUWJjCHJJp9HDUadCWr63qY9xBao5D5N
	 UCR76Ysy6zsChfsPH9gkVyHEp7QdVOEr6x9JHrVJPg5PrDkEznG5VnNJYzGd5V1SC/
	 kqJ0aZWe9J180Kbzw7UF51NE7Sto+4XsN529z9TjnGoA4E4R39Rg/J/GT/iVwzRREH
	 jkzjqwx/DIy/HnmjIJVjU1aoh5slxVs0Kf01bNLl8NOADLwOSpUJ5GzGTZGeyoTOKH
	 pH/d+yPVBjQKTzaGX3R/PgczXmfGFSfZGkoBsSYqhonypzN1/LdneyYI7Vn03ltx5/
	 LmE1KJ1pm4QnA==
Date: Wed, 12 Mar 2025 16:38:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 17/19] xen/sysctl: wrap around
 XEN_SYSCTL_livepatch_op
In-Reply-To: <20250312040632.2853485-18-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121638070.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-18-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
> shall depend on CONFIG_SYSCTL
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index fbaca097ff..583972f7e3 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -426,7 +426,7 @@ config CRYPTO
>  config LIVEPATCH
>  	bool "Live patching support"
>  	default X86
> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
>  	select CC_SPLIT_SECTIONS
>  	help
>  	  Allows a running Xen hypervisor to be dynamically patched using
> -- 
> 2.34.1
> 

