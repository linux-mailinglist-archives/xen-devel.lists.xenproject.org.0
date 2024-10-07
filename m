Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E864299397F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812521.1225304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvWm-00022K-GJ; Mon, 07 Oct 2024 21:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812521.1225304; Mon, 07 Oct 2024 21:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvWm-00020p-DU; Mon, 07 Oct 2024 21:44:28 +0000
Received: by outflank-mailman (input) for mailman id 812521;
 Mon, 07 Oct 2024 21:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxvWl-00020j-CL
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:44:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52326b4d-84f5-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 23:44:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 526B9A4086D;
 Mon,  7 Oct 2024 21:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D8AC4CECD;
 Mon,  7 Oct 2024 21:44:23 +0000 (UTC)
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
X-Inumbo-ID: 52326b4d-84f5-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728337464;
	bh=dsIN3HN8rPdN2lOtYfmq32KUMmIZ6M+ZX6V2MykRGrY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cOEFcXjUFDPNnHWnQJzSuV3kSEs6ll0exiKGTsfoTkDpms/Ar9BcYlOEitkJMpN3U
	 NLIP/pRkg96KHQfs9AdoFP9RGdyV04M5B5wpQGPBYzm2Tdhh7gIedfVSGmZMlisptr
	 282Sos8gw2UxbxdExW0JSWOgyzB3ruG0voRwMKtIYC9QyO+jzp6P2Gd/dNNT9SvSHQ
	 3cITx3Y3Ioxjei0LNLYvxv+RILBhdCPlmcCrPsr8clZw/AhtaGNonNIhB4M00seWDN
	 j7D0Cc21Q56Y7Fn6gbTwVhEWbKkev9JBKoTiAAAKZ5odZ3Bn9bdHnLi6a+5B/EsK0T
	 d3yLV8ia6WOgA==
Date: Mon, 7 Oct 2024 14:44:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/4] xen/vpci: address violations of MISRA C Rule
 16.3
In-Reply-To: <a91c0223b827593f5c1a7ca7ece786266e5b8f52.1728308312.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2410071442570.3512606@ubuntu-linux-20-04-desktop>
References: <cover.1728308312.git.federico.serafini@bugseng.com> <a91c0223b827593f5c1a7ca7ece786266e5b8f52.1728308312.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Oct 2024, Federico Serafini wrote:
> Address violations of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes from v2:
> - simply break without returning X86EMUL_UNHANDLEABLE.
> 
> As pointed out by Jan, these functions only return X86EMUL_OKAY but:
> https://lists.xenproject.org/archives/html/xen-devel/2024-09/msg00727.html
> 
> Do you have any comments?
> ---
>  xen/drivers/vpci/msix.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index fbe710ab92..5bb4444ce2 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -364,6 +364,7 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
>      spin_unlock(&vpci->lock);
>  
> @@ -512,6 +513,7 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
>      spin_unlock(&vpci->lock);

I think in both cases it should be:

spin_unlock(&vpci->lock);
return X86EMUL_UNHANDLEABLE;

In general, it seems to be that we want to return X86EMUL_UNHANDLEABLE
in these situations and either we returning it from the default label,
or we need to do rc = X86EMUL_UNHANDLEABLE; and later on return rc;

