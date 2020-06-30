Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80B20FFEE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 00:14:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqOUn-0006uk-Rw; Tue, 30 Jun 2020 22:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8b9=AL=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1jqOUm-0006uf-R4
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 22:12:52 +0000
X-Inumbo-ID: d6e792b6-bb1e-11ea-86a3-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6e792b6-bb1e-11ea-86a3-12813bfff9fa;
 Tue, 30 Jun 2020 22:12:52 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D16072081A;
 Tue, 30 Jun 2020 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593555171;
 bh=h1obBUyTPJ75QgeorGRJK1b9zJ+cbov4c/nHPyLr+yw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=M/84Qq3eKACfAHQjDCkpV3cm4rQfN9fudLtrODHV/aJYn7tGBP4MbNKzLWTc4wcbQ
 8wxU6ED77IYa/Qy/hiMpWO6dMSUxGVVEE//2L7iGf/0Lt9kZ4iUwcFbIHZrWAum8Iq
 d1+6PKGsAIhjnkj3qCRYtXN45CyM9IaaV6LCntes=
Date: Tue, 30 Jun 2020 17:12:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] xen/pci: remove redundant assignment to variable irq
Message-ID: <20200630221249.GA3491219@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409114118.249461-1-colin.king@canonical.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-pci@vger.kernel.org,
 x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Bjorn Helgaas <bhelgaas@google.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

[+cc Juergen, Boris]

On Thu, Apr 09, 2020 at 12:41:18PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable irq is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to pci/virtualization for v5.9, thanks!

I don't see this in linux-next yet, but if anybody else would prefer
to take it, let me know and I'll drop it.  

> ---
>  arch/x86/pci/xen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 91220cc25854..80272eb49230 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -63,7 +63,7 @@ static int xen_pcifront_enable_irq(struct pci_dev *dev)
>  static int xen_register_pirq(u32 gsi, int gsi_override, int triggering,
>  			     bool set_pirq)
>  {
> -	int rc, pirq = -1, irq = -1;
> +	int rc, pirq = -1, irq;
>  	struct physdev_map_pirq map_irq;
>  	int shareable = 0;
>  	char *name;
> -- 
> 2.25.1
> 

