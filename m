Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95327B76E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 00:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN1nq-0005Gi-9N; Mon, 28 Sep 2020 22:39:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oz6v=DF=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1kN1np-0005Gd-1s
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 22:39:25 +0000
X-Inumbo-ID: 219cae10-197c-4059-86e5-d20f15bc19b0
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 219cae10-197c-4059-86e5-d20f15bc19b0;
 Mon, 28 Sep 2020 22:39:24 +0000 (UTC)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7978B23A40;
 Mon, 28 Sep 2020 22:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601332763;
 bh=kcdtApje+MBHdfUB2c2kJF6E7KxaJcvAdCzfKChA118=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AZfVaZqOhQrLRTWFaK+3oe/rJbTCK9wNNBBhz2CH0NbvtONNqYw9OzJx54t+PFWoy
 0bM3QR6hcc+ZKBGNusjuEQiO4mjK94byDszMcY4mEox17to9V+IREFI9tug/q/Uzcm
 TbLFoRYzjg9WiRWwCbkLwifP9Dt4+Uesfg8fvNvk=
Date: Mon, 28 Sep 2020 17:39:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Li Heng <liheng40@huawei.com>
Cc: konrad.wilk@oracle.com, bhelgaas@google.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] xen: Fix a previous prototype warning in xen.c
Message-ID: <20200928223922.GA2503371@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1600958176-23406-1-git-send-email-liheng40@huawei.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 24, 2020 at 10:36:16PM +0800, Li Heng wrote:
> Fix the warning:
> arch/x86/pci/xen.c:423:13: warning:
> no previous prototype for ‘xen_msi_init’ [-Wmissing-prototypes]
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Li Heng <liheng40@huawei.com>

Applied to pci/misc for v5.10, thanks!

> ---
>  arch/x86/pci/xen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 89395a5..f663a5f 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -420,7 +420,7 @@ int __init pci_xen_init(void)
>  }
> 
>  #ifdef CONFIG_PCI_MSI
> -void __init xen_msi_init(void)
> +static void __init xen_msi_init(void)
>  {
>  	if (!disable_apic) {
>  		/*
> --
> 2.7.4
> 

