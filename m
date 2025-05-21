Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63844ABF620
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 15:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991872.1375669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjXm-0004yr-0R; Wed, 21 May 2025 13:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991872.1375669; Wed, 21 May 2025 13:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjXl-0004wp-Tf; Wed, 21 May 2025 13:31:37 +0000
Received: by outflank-mailman (input) for mailman id 991872;
 Wed, 21 May 2025 13:31:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uHjXk-0004wi-Kb
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 13:31:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uHjXk-005z0l-0p;
 Wed, 21 May 2025 13:31:36 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uHjXj-005iVa-1x;
 Wed, 21 May 2025 13:31:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=AYgMM8TTWykfG7/hepnajJiNI4TqFpZRrRvK14NRjSQ=; b=7AhSisHwENZhf894PMILYQTZTn
	NA4nPdxCiviBMR22e66GMcM4NwCtxwSY55CiaDIU9tm4qFBrNYxg/xkM8d1kys1j5Xog3N5AjyKl0
	cIV7DePnBSKTZqjEwqS+SbQhOb15mKkNj35lV5l4ucTWRPv/Z7aL6408l4QvtQy5MqPY=;
Date: Wed, 21 May 2025 15:31:33 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2
Message-ID: <aC3VtZ0yYOPY5da3@l14>
References: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>

On Tue, Apr 08, 2025 at 03:23:13PM +0200, Marek Marczykowski-Górecki wrote:
> Consider also "Display controller" an IGD, not only "VGA compatible
> controller" in few more places.
> 
> Fixes: 4191619e0893 ("libxl: extend IGD check")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Do you prefer this to be split into two patches (libxl, hvmloader)?
> 
>  tools/firmware/hvmloader/pci.c | 1 +
>  tools/libs/light/libxl_pci.c   | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index c3c61ca060a6..1ee97a5b4b20 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -173,6 +173,7 @@ void pci_setup(void)
>          switch ( class )
>          {
>          case 0x0300:
> +        case 0x0380:
>              /* If emulated VGA is found, preserve it as primary VGA. */
>              if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
>              {
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 1647fd6f4756..db1299832cce 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2575,7 +2575,8 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>  
>          if (sysfs_dev_get_class(gc, pci, &pci_device_class))
>              continue;
> -        if (pci_device_class != 0x030000) /* VGA class */
> +        if (pci_device_class != 0x030000 && /* VGA class */
> +                pci_device_class != 0x038000) /* Display class */

According to some not too random document on internet [1][2], the whole
0x03 would be the display class, with 0x0380 been other display
controller. So it might be better to change the new comment to "Other
display controller".

[1] https://pcisig.com/sites/default/files/files/PCI_Code-ID_r_1_12__v9_Jan_2020.pdf
[2] https://wiki.osdev.org/PCI#Class_Codes

Otherwise, change looks fine to me:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

