Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210595BDB3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 19:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781948.1191428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shBtW-0004MO-El; Thu, 22 Aug 2024 17:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781948.1191428; Thu, 22 Aug 2024 17:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shBtW-0004K8-CA; Thu, 22 Aug 2024 17:46:46 +0000
Received: by outflank-mailman (input) for mailman id 781948;
 Thu, 22 Aug 2024 17:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kYXT=PV=kernel.org=kees@srs-se1.protection.inumbo.net>)
 id 1shBov-0003m2-Ag
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 17:42:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2bae648-60ad-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 19:41:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 371EACE0599;
 Thu, 22 Aug 2024 17:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DECC32782;
 Thu, 22 Aug 2024 17:41:51 +0000 (UTC)
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
X-Inumbo-ID: d2bae648-60ad-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724348511;
	bh=EIA1hEYwm1C2TI9GOWGiHROnOXNDw/yWFqOCejDP7oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gr6enR+36v6pPq8NzbStvk6GTD120FWyjr6SQHOSZ7oQZpGhHbE+1VFa7NmXzNFnV
	 qi9pD51GM1eorajAlFle0jVSHC7W6LbGVrGiREVBiuNEiHH3B3qNcmrRVlqKJFaMQV
	 p+i9fSRcqakGYyoDrlBKXgaSoNXToyXX3zswYTJ20xS6GPs5aBC6JREBgC7bYxuKty
	 samd23N8OLvgX9JLDVN5PkLwpLwejSwKlmXBzsTjJMNECaEERrZ62oEo0ixmayO4bF
	 15Btlg/GzTisTXtSygtdIZjkZssPtoTcuZ/ZMqLpfh/QuoIHPe63hDWTmkKR9w5q7e
	 RFUJdoo4HNANg==
Date: Thu, 22 Aug 2024 10:41:50 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] xen/pci: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <202408221040.2961A81@keescook>
References: <ZsU58MvoYEEqBHZl@elsanto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsU58MvoYEEqBHZl@elsanto>

On Tue, Aug 20, 2024 at 06:50:56PM -0600, Gustavo A. R. Silva wrote:
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with this, fix the following warning:
> 
> drivers/xen/pci.c:48:55: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/xen/pci.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 72d4e3f193af..a2facd8f7e51 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -44,15 +44,11 @@ static int xen_add_device(struct device *dev)
>  	}
>  #endif
>  	if (pci_seg_supported) {
> -		struct {
> -			struct physdev_pci_device_add add;
> -			uint32_t pxm;
> -		} add_ext = {
> -			.add.seg = pci_domain_nr(pci_dev->bus),
> -			.add.bus = pci_dev->bus->number,
> -			.add.devfn = pci_dev->devfn
> -		};
> -		struct physdev_pci_device_add *add = &add_ext.add;
> +		DEFINE_RAW_FLEX(struct physdev_pci_device_add, add, optarr, 1);
> +
> +		add->seg = pci_domain_nr(pci_dev->bus);
> +		add->bus = pci_dev->bus->number;
> +		add->devfn = pci_dev->devfn;
>  
>  #ifdef CONFIG_ACPI
>  		acpi_handle handle;

Looks correct to me!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

