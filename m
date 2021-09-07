Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB95402BD7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 17:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181180.328214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNd3G-0002Tb-GJ; Tue, 07 Sep 2021 15:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181180.328214; Tue, 07 Sep 2021 15:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNd3G-0002Qi-Cc; Tue, 07 Sep 2021 15:30:22 +0000
Received: by outflank-mailman (input) for mailman id 181180;
 Tue, 07 Sep 2021 15:30:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bt8x=N5=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mNd3E-0002Qc-Qs
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 15:30:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 823dd0b8-0ff0-11ec-b109-12813bfff9fa;
 Tue, 07 Sep 2021 15:30:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9E9B610D0;
 Tue,  7 Sep 2021 15:30:18 +0000 (UTC)
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
X-Inumbo-ID: 823dd0b8-0ff0-11ec-b109-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631028619;
	bh=kp8Q8kJRz0WoYnZlxjaDlmj4GyxqVupLYpX0r3kh5eI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FE6OgWm/fxpyj4FLQwu9LoQuMjKnA94XCfxVDByukq4rictBgJBARDgnsuKZZf51p
	 WXTFndXhgPK25xj8rW4dWKHHBd93KkRJMISbXYQeHJ0AMHoyWkddZYiARPkgRcGwBJ
	 AT6niJGOnCXNPNvY3lbnqpZz36S29V/LYwGZE4/xaCHHf6512nYdVpZOaJSLMuZUoR
	 sM+3SiKS+cOzVNn/u7KymTC8iwDRxTh24dDklEeX8z7qtgA+ZJj3kLfOVv0bv4A6b7
	 7vbe+oIWcT0eDqgNzqf+WJuR4rDw+5kM7nUIpdutwsL0sFBHvcbEN7fiD4Vb+EWH86
	 LY7D7/lwqLanA==
Date: Tue, 7 Sep 2021 10:30:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 10/12] xen-pcifront: this module is PV-only
Message-ID: <20210907153017.GA741607@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbfb4191-9e34-53da-f179-4549b10dcfb3@suse.com>

Update subject to follow conventions (use "git log --oneline
drivers/pci/Kconfig").  Should say what this patch does.

Commit log below should also say what this patch does.  Currently it's
part of the rationale for the change, but doesn't say what the patch
does.

On Tue, Sep 07, 2021 at 02:10:41PM +0200, Jan Beulich wrote:
> It's module init function does a xen_pv_domain() check first thing.
> Hence there's no point building it in non-PV configurations.

s/It's/<name of function that calls xen_pv_domain()/   # pcifront_init()?
s/building it/building <name of module>/               # xen-pcifront.o?

I see that CONFIG_XEN_PV is only mentioned in arch/x86, so
CONFIG_XEN_PV=y cannot be set on other arches.  Is the current
"depends on X86" just a reflection of that, or is it because of some
other x86 dependency in the code?

The connection between xen_pv_domain() and CONFIG_XEN_PV is not
completely obvious.

If you only build xen-pcifront.o when CONFIG_XEN_PV=y, and
xen_pv_domain() is true if and only if CONFIG_XEN_PV=y, why bother
calling xen_pv_domain() at all?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -110,7 +110,7 @@ config PCI_PF_STUB
>  
>  config XEN_PCIDEV_FRONTEND
>  	tristate "Xen PCI Frontend"
> -	depends on X86 && XEN
> +	depends on XEN_PV
>  	select PCI_XEN
>  	select XEN_XENBUS_FRONTEND
>  	default y
> 

