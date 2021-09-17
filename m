Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0340FDE2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 18:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189595.339383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGjJ-0001hD-G5; Fri, 17 Sep 2021 16:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189595.339383; Fri, 17 Sep 2021 16:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGjJ-0001ev-DE; Fri, 17 Sep 2021 16:28:49 +0000
Received: by outflank-mailman (input) for mailman id 189595;
 Fri, 17 Sep 2021 16:28:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QZl=OH=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mRGjI-0001ep-AP
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 16:28:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54c99d42-17d4-11ec-b6e7-12813bfff9fa;
 Fri, 17 Sep 2021 16:28:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D155160555;
 Fri, 17 Sep 2021 16:28:45 +0000 (UTC)
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
X-Inumbo-ID: 54c99d42-17d4-11ec-b6e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631896126;
	bh=RRE6NMda31/dIqqeP4g2Zg1MqUaKnLsM3Ro/I9LVt3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IBbNMhquNK9liwy6lIWmdPIXzOZVsmIh3XmUdeu0OCTs9jMQRFZj4wNKUIerdiVKo
	 mBMDO993ITGHINd9RLo1DY66iD3VOGkNh0ua2l7uUucIPa9VgX2bJ3+P0Wr0K7/+HG
	 og0S6Mz5MOJn7XReD5EeUMdc7TA2gihk25XztwGh86GImWJqlCB0TDSX67KV04NaMv
	 p0osTnLc/lTsOfpedLQ+EjMmJ/gAqIX/e1CLxFaP52jp3kxgAwF0cddgUxqB22Gld3
	 JCAGcSeUs7Bd1NpgzoHU2PijOf49moRGDvKEylzevEZ2zsFtcDoaQ8cwiS5GKTUyN4
	 Jjblai00CbORg==
Date: Fri, 17 Sep 2021 11:28:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"hch@lst.de" <hch@lst.de>, Konrad Wilk <konrad.wilk@oracle.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] PCI: only build xen-pcifront in PV-enabled
 environments
Message-ID: <20210917162844.GA1722208@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a7f6c9b-215d-b593-8056-b5fe605dafd7@suse.com>

s/only/Only/ in subject

On Fri, Sep 17, 2021 at 12:48:03PM +0200, Jan Beulich wrote:
> The driver's module init function, pcifront_init(), invokes
> xen_pv_domain() first thing. That construct produces constant "false"
> when !CONFIG_XEN_PV. Hence there's no point building the driver in
> non-PV configurations.

Thanks for these bread crumbs.  xen_domain_type is set to
XEN_PV_DOMAIN only by xen_start_kernel() in enlighten_pv.c, which is
only built when CONFIG_XEN_PV=y, so even I can verify this :)

> Drop the (now implicit and generally wrong) X86 dependency: At present,
> XEN_PV con only be set when X86 is also enabled. In general an
> architecture supporting Xen PV (and PCI) would want to have this driver
> built.

s/con only/can only/

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> v2: Title and description redone.
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

