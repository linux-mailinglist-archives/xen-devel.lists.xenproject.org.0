Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA04073F6
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184877.333675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOq20-0002UN-Mg; Fri, 10 Sep 2021 23:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184877.333675; Fri, 10 Sep 2021 23:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOq20-0002Re-Il; Fri, 10 Sep 2021 23:34:04 +0000
Received: by outflank-mailman (input) for mailman id 184877;
 Fri, 10 Sep 2021 23:34:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOq1z-0002RY-0H
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:34:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a97889bd-7406-45c9-91dd-ea3ba2cf26b3;
 Fri, 10 Sep 2021 23:34:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ED4261212;
 Fri, 10 Sep 2021 23:34:01 +0000 (UTC)
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
X-Inumbo-ID: a97889bd-7406-45c9-91dd-ea3ba2cf26b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631316841;
	bh=AlGT+1ZkR5OARaW5Qf3AVAgmSVngDxhk8G1V2NgY8A0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LSWH98E9Gp5vV79OPvBxPiatelKbDD5+9HxdN1YHHO4924YI1NgzILiFxLXotbXLx
	 86ptja5pEcL1FEipFRXC4IZDhGH6DztwwC712yTJl81CWT0fv1orEbu+8etn7MsPIu
	 D4Dp4eDhht2mKDBdHn0rnTwHksyO88yl7deMkKrnUM6iNpVU4a+xuR5KpSP+HY5tLV
	 C8Aw47BSI6aNoLfmxe4a6C/RzFVCgbEVhEesi7NVe47nmICW1Ax6PyHfMqbL9tJCR+
	 YsTPbrgdaRv+xCOGhKrnosM4p5ZGVqlv+CONxR11zR07FaWusdOhfaVhBmrWwvti7p
	 OsNjVv664L+nw==
Date: Fri, 10 Sep 2021 16:34:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 10/12] xen-pcifront: this module is PV-only
In-Reply-To: <bbfb4191-9e34-53da-f179-4549b10dcfb3@suse.com>
Message-ID: <alpine.DEB.2.21.2109101633530.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <bbfb4191-9e34-53da-f179-4549b10dcfb3@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> It's module init function does a xen_pv_domain() check first thing.
> Hence there's no point building it in non-PV configurations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

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

