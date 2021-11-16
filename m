Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4F4534C2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226342.391106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzva-0007BP-1E; Tue, 16 Nov 2021 14:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226342.391106; Tue, 16 Nov 2021 14:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzvZ-00078m-UE; Tue, 16 Nov 2021 14:59:17 +0000
Received: by outflank-mailman (input) for mailman id 226342;
 Tue, 16 Nov 2021 14:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DEI=QD=weissschuh.net=linux@srs-se1.protection.inumbo.net>)
 id 1mmzvY-00078g-8X
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:59:16 +0000
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c37f8132-46ed-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 15:59:14 +0100 (CET)
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
X-Inumbo-ID: c37f8132-46ed-11ec-9787-a32c541c8605
Date: Tue, 16 Nov 2021 15:59:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1637074752;
	bh=cb2OUIDphqHIt9Wszcy0dU6ogQaVy9OblEb3njsk/BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5PlIfWp5E08QiHGOMYxCuLCDfYIbCPJj9eaWw0rLFxzA7H9i21vDwkA0gIAt3OyX
	 S96NinLjfE/a4cPxwZffSsOdNJllUyN1EQrpwBkYWzBRbafCNRsP52kPJBbFjDfkKs
	 CcrSv9y00pONx+RkgMvF1gflACpgp/j6Edjvcj+E=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Message-ID: <aa39e0f1-77cb-48f9-ae52-2bdbc19fa702@t-8ch.de>
References: <20211116143323.18866-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116143323.18866-1-jgross@suse.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6

Thanks!

On 2021-11-16 15:33+0100, Juergen Gross wrote:
> This configuration option provides a misc device as an API to userspace.
> Make this API usable without having to select the module as a transitive
> dependency.
> 
> This also fixes an issue where localyesconfig would select
> CONFIG_XEN_PRIVCMD=m because it was not visible and defaulted to
> building as module.
> 
> Based-on-patch-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/Kconfig | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a1b11c62da9e..a2e91d3ca372 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -259,9 +259,14 @@ config XEN_SCSI_BACKEND
>  	  if guests need generic access to SCSI devices.
>  
>  config XEN_PRIVCMD
> -	tristate
> +	tristate "Xen hypercall passthrough driver"
>  	depends on XEN
>  	default m
> +	help
> +	  The hypercall passthrough driver allows user land programs to perform
> +	  Xen hypercalls. This driver is normally required for systems running
> +	  as Dom0 to perform privileged operations, but in some disaggregated
> +	  Xen setups this driver might be needed for other domains, too.
>  
>  config XEN_ACPI_PROCESSOR
>  	tristate "Xen ACPI processor"
> -- 
> 2.26.2

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

