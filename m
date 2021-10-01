Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A0641E590
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200328.354821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6Zd-0001lB-Gz; Fri, 01 Oct 2021 00:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200328.354821; Fri, 01 Oct 2021 00:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6Zd-0001jN-D6; Fri, 01 Oct 2021 00:38:49 +0000
Received: by outflank-mailman (input) for mailman id 200328;
 Fri, 01 Oct 2021 00:38:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6Zb-0001jH-L2
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:38:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eff7b274-224f-11ec-bd77-12813bfff9fa;
 Fri, 01 Oct 2021 00:38:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C54B761439;
 Fri,  1 Oct 2021 00:38:45 +0000 (UTC)
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
X-Inumbo-ID: eff7b274-224f-11ec-bd77-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633048726;
	bh=cd2WhwfsF89bAF8W/xWc7AMqgy0VDlXR6nG/JjsO7LE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OStWoSnwYj728LzcWHxmN8cI4cnUIvrEpAiN04ynrYZ3gyDRlnosKqv4TOoWZ5/yf
	 yB/cUi7s9ZtbFgDmOU7rP5nlSp0s/G8BJ7AA8KGYnHbNL9r9u8Koe2siHvBRGxpPp2
	 /0Xt/fpAHznBAN7Y3RwG69BrMJ4p61R1aocsRLikQTWO2dMTWjhfxWqXa61dFdNwF/
	 kZ2H9UawUFxQxYpb1hZRJT9Q0mTt/V+2zkl/gED3gj0vLmFJeyXpCrBRnlBmf4tb/B
	 qgwxHt9gIcCBfZ3g/Mx5t559GTaHdoL+GWkYMx5cxylIx3JccY0hLbxZ0XIgoSUUGQ
	 1mKwlL+njgs5w==
Date: Thu, 30 Sep 2021 17:38:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 07/11] libxl: Allow removing PCI devices for all types
 of domains
In-Reply-To: <20210930071326.857390-8-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301737500.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-8-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> The PCI device remove path may now be used by PVH on ARM, so the
> assert is no longer valid.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  tools/libs/light/libxl_pci.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 1a1c2630803b..59f3686fc85e 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1947,8 +1947,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>              goto out_fail;
>          }
>      } else {
> -        assert(type == LIBXL_DOMAIN_TYPE_PV);
> -
>          char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
>                                       pci->bus, pci->dev, pci->func);
>          FILE *f = fopen(sysfs_path, "r");
> -- 
> 2.25.1
> 

