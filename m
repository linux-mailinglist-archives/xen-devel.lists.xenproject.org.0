Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB899F790
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 21:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819440.1232765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0nc5-0000Uu-FA; Tue, 15 Oct 2024 19:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819440.1232765; Tue, 15 Oct 2024 19:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0nc5-0000S1-CM; Tue, 15 Oct 2024 19:53:49 +0000
Received: by outflank-mailman (input) for mailman id 819440;
 Tue, 15 Oct 2024 19:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFtG=RL=redhat.com=alex.williamson@srs-se1.protection.inumbo.net>)
 id 1t0nc4-0000Rv-A9
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 19:53:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2da3abad-8b2f-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 21:53:42 +0200 (CEST)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-0b376iYUM3W-uskGzZ3WzA-1; Tue, 15 Oct 2024 15:53:40 -0400
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-8354a67eb57so56549139f.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 12:53:40 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbec9b24b5sm462948173.59.2024.10.15.12.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 12:53:39 -0700 (PDT)
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
X-Inumbo-ID: 2da3abad-8b2f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729022021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDdlfoCJodlBAEHv18hly2baxUxV3CY1ROqq62ZwNfA=;
	b=GW5kbgnroZdypZ0pri7f9IK/W/kIDeKtNVySbDcPp6EDis7zRB6U7TwcovpS1hjJHSBhx4
	DrRJuB3jWOEnhigNPJMq+ISDVH/+4Ys/o3vwInG9p3jQQU0hoqvCQaGF4DfLZIqpUcJzsR
	cNTygXR/ZlZ9LJOL56rpiwq9BEpuEqo=
X-MC-Unique: 0b376iYUM3W-uskGzZ3WzA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022020; x=1729626820;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDdlfoCJodlBAEHv18hly2baxUxV3CY1ROqq62ZwNfA=;
        b=An8Jt/U/+0Xn9uT09zNIaeHPs/+Ca4MxGSfF/jZ0S4fUmbvnhhIZi2Yp5G2HjDyX1X
         VeJ9ZDyHeqXes/uBc+9wweEAkreLgbSbygsKz4+i2gVsdAREIKmLaXMs3bv0HBXpifJY
         DrRAD3J8ema8HJg7fCF0iOvDzIHmWV69U6X08VBJPKFHkfJKHdFMcDsOlzFKW7rTGDRY
         QlfVwh059PkV92Q+OE7MFEykWf5vPp/nZCmksqqH4o8cmlDFKAn+Q/hXgMwfYyKF4/Z3
         xgaCLWsC27/UhEldYnEmXNAf0wFd0ZiANcmGgKTv4uj3zI4rCC9OqbJ3ZNUqixncDP2G
         Bi0g==
X-Forwarded-Encrypted: i=1; AJvYcCVQG3fR+mDdT0Gi4gXEyFdbOwLb1WOweVstf2D7Yhz2essxgqYrVy10Q/3FjVkYKM4hgQEOAEBJz4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZbw9/X2EbC/urwFd8twdjsnpVKvhfKVf1I3oLvx0GDUzHgt3H
	tF/kfblNvvfxpLI6im/GZkuGwvGGa/UVD4Pa/JqMt8IxXpe9QWUyhOAmLWyY5Fnug35KCRH6FzA
	gkdcBqKkYiDHaYrayRBUHfjAWrObDo94Iuh6ZfNbj2yTydusx3HScV0N2Z6mHP4qQ
X-Received: by 2002:a05:6e02:20e6:b0:3a2:57d2:3489 with SMTP id e9e14a558f8ab-3a3de12de3emr696205ab.3.1729022019793;
        Tue, 15 Oct 2024 12:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESXVYWbDvg1wxgtSYFRG8WjdQ6j0NF7QGGfISEgWPkRfl6g2CRlLVPppWhf9Avs6HBI8mwDw==
X-Received: by 2002:a05:6e02:20e6:b0:3a2:57d2:3489 with SMTP id e9e14a558f8ab-3a3de12de3emr696075ab.3.1729022019438;
        Tue, 15 Oct 2024 12:53:39 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:53:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Christian
 Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, Eric Auger
 <eric.auger@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>, Ye
 Bin <yebin10@huawei.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
Message-ID: <20241015135336.0de9795e.alex.williamson@redhat.com>
In-Reply-To: <20241015185124.64726-14-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
	<20241015185124.64726-14-pstanner@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Oct 2024 20:51:23 +0200
Philipp Stanner <pstanner@redhat.com> wrote:

> pci_intx() and its managed counterpart pcim_intx() only exist for older
> drivers which have not been ported yet for various reasons. Future
> drivers should preferably use pci_alloc_irq_vectors().
> 
> Mark pci_intx() and pcim_intx() as deprecated and encourage usage of
> pci_alloc_irq_vectors() in its place.

I don't really understand this.  As we've discussed previously
pci_alloc_irq_vectors() is, unsurprisingly, for allocating PCI IRQ
vectors while pci_intx() is for manipulating the INTx disable bit on
PCI devices.  The latter is a generic mechanism for preventing PCI
devices from generating INTx, regardless of whether there's a vector
allocated for it.  How does the former replace the latter and why do we
feel the need to deprecate the latter?

It feels like this fits some narrow narrative and makes all users of
these now deprecated functions second class citizens.  Why?  At it's
root these are simply providing mask and set or mask and clear register
bit operations.  Thanks,

Alex
 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 5 ++++-
>  drivers/pci/pci.c    | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 6f8f712fe34e..4c76fc063104 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -435,7 +435,7 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
>  }
>  
>  /**
> - * pcim_intx - managed pci_intx()
> + * pcim_intx - managed pci_intx() (DEPRECATED)
>   * @pdev: the PCI device to operate on
>   * @enable: boolean: whether to enable or disable PCI INTx
>   *
> @@ -443,6 +443,9 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
>   *
>   * Enable/disable PCI INTx for device @pdev.
>   * Restore the original state on driver detach.
> + *
> + * This function is DEPRECATED. Do not use it in new code.
> + * Use pci_alloc_irq_vectors() instead (there is no managed version, currently).
>   */
>  int pcim_intx(struct pci_dev *pdev, int enable)
>  {
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7ce1d0e3a1d5..dc69e23b8982 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4477,11 +4477,14 @@ void pci_disable_parity(struct pci_dev *dev)
>  }
>  
>  /**
> - * pci_intx - enables/disables PCI INTx for device dev
> + * pci_intx - enables/disables PCI INTx for device dev (DEPRECATED)
>   * @pdev: the PCI device to operate on
>   * @enable: boolean: whether to enable or disable PCI INTx
>   *
>   * Enables/disables PCI INTx for device @pdev
> + *
> + * This function is DEPRECATED. Do not use it in new code.
> + * Use pci_alloc_irq_vectors() instead.
>   */
>  void pci_intx(struct pci_dev *pdev, int enable)
>  {


