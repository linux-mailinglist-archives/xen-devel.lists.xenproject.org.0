Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CCFA448E8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 18:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895939.1304618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmz52-00045I-DQ; Tue, 25 Feb 2025 17:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895939.1304618; Tue, 25 Feb 2025 17:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmz52-000438-AK; Tue, 25 Feb 2025 17:50:52 +0000
Received: by outflank-mailman (input) for mailman id 895939;
 Tue, 25 Feb 2025 17:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdnF=VQ=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tmz51-000432-6g
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 17:50:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ae5ebbd-f3a1-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 18:50:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9278D5C5036;
 Tue, 25 Feb 2025 17:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE98C4CEDD;
 Tue, 25 Feb 2025 17:50:45 +0000 (UTC)
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
X-Inumbo-ID: 0ae5ebbd-f3a1-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740505846;
	bh=O7jDYX7iRfrB1UVmAe+E/vNwrykYgFudqrrJuLaSk8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fBu8XFIcBwXzPCuLucy0C2svFoYEU7W3Qe5lu2eqGEffvvnNv0C0iCPp8VORRutU3
	 5uyHQFGoNTYDjQkY4fY31ezuZEtnFIihih/DII6i2X52enZ7LkErjBNUKOpLMy8u7p
	 BBNv7jZ5EEcnVdWHgvufYa0XyFu+HBSQxbPrGkqH7boD0AFZOtAi4aty6G02iNg0fv
	 WNnftdTe3QrC/vx7KxIjB5UaGeorD5QutGt+yqSlrfYUQHZueIRyA8p+KBtjzxix9T
	 WvBbJVXxSJS7G2onhV18w40avekUuD0Z1KNoWMH9wx8OakVnqoHyk2c4SVpzeNV7Ye
	 CMl9laZL1JrSQ==
Date: Tue, 25 Feb 2025 11:50:44 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] xen: Add support for XenServer 6.1 platform device
Message-ID: <20250225175044.GA511149@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225140400.23992-1-frediano.ziglio@cloud.com>

On Tue, Feb 25, 2025 at 02:03:53PM +0000, Frediano Ziglio wrote:
> On XenServer on Windows machine a platform device with ID 2 instead of
> 1 is used.
> This device is mainly identical to device 1 but due to some Windows
> update behaviour it was decided to use a device with a different ID.
> This causes compatibility issues with Linux which expects, if Xen
> is detected, to find a Xen platform device (5853:0001) otherwise code
> will crash due to some missing initialization (specifically grant
> tables).
> The device 2 is presented by Xapi adding device specification to
> Qemu command line.

Add blank lines between paragraphs.

A crash seems unfortunate.  And it sounds like a user mistake, e.g., a
typo in the Qemu device specification, could also cause a crash?

If the crash is distinctive, a hint here like a dmesg line or two
might help users.

> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  drivers/xen/platform-pci.c | 2 ++
>  include/linux/pci_ids.h    | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
> index 544d3f9010b9..9cefc7d6bcba 100644
> --- a/drivers/xen/platform-pci.c
> +++ b/drivers/xen/platform-pci.c
> @@ -174,6 +174,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
>  static const struct pci_device_id platform_pci_tbl[] = {
>  	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM,
>  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> +	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM_XS61,
> +		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
>  	{0,}
>  };
>  
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 1a2594a38199..e4791fd97ee0 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -3241,6 +3241,7 @@
>  
>  #define PCI_VENDOR_ID_XEN		0x5853
>  #define PCI_DEVICE_ID_XEN_PLATFORM	0x0001
> +#define PCI_DEVICE_ID_XEN_PLATFORM_XS61	0x0002

If this is the only place PCI_DEVICE_ID_XEN_PLATFORM_XS61 is used, we
would put this in platform-pci.c, per the pci_ids.h comment:

 *      Do not add new entries to this file unless the definitions
 *      are shared between multiple drivers.

>  #define PCI_VENDOR_ID_OCZ		0x1b85
>  
> -- 
> 2.48.1
> 

