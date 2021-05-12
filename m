Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA137B68A
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 09:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126139.237456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgitr-0002ig-Ob; Wed, 12 May 2021 07:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126139.237456; Wed, 12 May 2021 07:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgitr-0002gl-L6; Wed, 12 May 2021 07:03:19 +0000
Received: by outflank-mailman (input) for mailman id 126139;
 Wed, 12 May 2021 07:03:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bb7k=KH=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1lgitq-0002gf-Cm
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 07:03:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80e97148-56f2-4fad-8e2d-4e7539d8a64a;
 Wed, 12 May 2021 07:03:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 456C161289;
 Wed, 12 May 2021 07:03:16 +0000 (UTC)
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
X-Inumbo-ID: 80e97148-56f2-4fad-8e2d-4e7539d8a64a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620802996;
	bh=iUBD/U+nLN+h/hvAp8X9UtIAIcPumBbY0yRDv4Ky7FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIE1ZlhZWjvF0yx+OJ/kzFm0svM7pv9OhNyTWJ0XmSt3U89fhRj4UcSrJpPQphqfJ
	 KcEDfj5SfoIYnudPMJTlMYo6wyH3xWLxiE9lYv52LFwIfth3aUeg59qheZp5SkrHup
	 +sYDMRC1tPqmLgr7JIR96sjVcgG0fVhLFhK0GaZg=
Date: Wed, 12 May 2021 09:03:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Connor Davis <connojdavis@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: xhci: Notify xen when DbC is unsafe to use
Message-ID: <YJt9su1k67KEFh6K@kroah.com>
References: <cover.1620776161.git.connojdavis@gmail.com>
 <2af7e7b8d569e94ab9c48039040ca69a8d52c89d.1620776161.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2af7e7b8d569e94ab9c48039040ca69a8d52c89d.1620776161.git.connojdavis@gmail.com>

On Tue, May 11, 2021 at 06:18:21PM -0600, Connor Davis wrote:
> When running as a dom0 guest on Xen, check if the USB3 debug
> capability is enabled before xHCI reset, suspend, and resume. If it
> is, call xen_dbgp_reset_prep() to notify Xen that it is unsafe to touch
> MMIO registers until the next xen_dbgp_external_startup().
> 
> This notification allows Xen to avoid undefined behavior resulting
> from MMIO access when the host controller's CNR bit is set or when
> the device transitions to D3hot.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  drivers/usb/host/xhci-dbgcap.h |  6 ++++
>  drivers/usb/host/xhci.c        | 57 ++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h        |  1 +
>  3 files changed, 64 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
> index c70b78d504eb..24784b82a840 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -227,4 +227,10 @@ static inline int xhci_dbc_resume(struct xhci_hcd *xhci)
>  	return 0;
>  }
>  #endif /* CONFIG_USB_XHCI_DBGCAP */
> +
> +#ifdef CONFIG_XEN_DOM0
> +int xen_dbgp_reset_prep(struct usb_hcd *hcd);
> +int xen_dbgp_external_startup(struct usb_hcd *hcd);
> +#endif /* CONFIG_XEN_DOM0 */
> +
>  #endif /* __LINUX_XHCI_DBGCAP_H */
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index ca9385d22f68..afe44169183f 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -37,6 +37,57 @@ static unsigned long long quirks;
>  module_param(quirks, ullong, S_IRUGO);
>  MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
> 
> +#ifdef CONFIG_XEN_DOM0
> +#include <xen/xen.h>

<snip>

Can't this #ifdef stuff go into a .h file?

thanks,

greg k-h

