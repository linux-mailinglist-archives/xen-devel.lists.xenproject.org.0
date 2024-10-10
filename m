Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E215A998E8D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 19:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816411.1230624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syxC0-0000H0-6k; Thu, 10 Oct 2024 17:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816411.1230624; Thu, 10 Oct 2024 17:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syxC0-0000Eh-4A; Thu, 10 Oct 2024 17:43:16 +0000
Received: by outflank-mailman (input) for mailman id 816411;
 Thu, 10 Oct 2024 17:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnc=RG=redhat.com=alex.williamson@srs-se1.protection.inumbo.net>)
 id 1syxBy-0000Eb-Hw
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 17:43:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e39a051-872f-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 19:43:12 +0200 (CEST)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-ej2_7V4iOzSjX9TZHuTimw-1; Thu, 10 Oct 2024 13:43:09 -0400
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-82d1ecfb77dso17669739f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 10:43:09 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbad9d47d4sm324603173.64.2024.10.10.10.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 10:43:07 -0700 (PDT)
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
X-Inumbo-ID: 1e39a051-872f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728582191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okv2RKybuCagmoTr+5nQR2nTb+IA1DURK3Hada+1xdc=;
	b=Izljrfxv9BcCexeNqtB7NRkx0dx6rl/BTVCBoEX82qFNnYBABCleCadp+zRgO0O2lhYPIR
	zvX/9oVQNtSyjzVclB7vlyuiysiNb2CTrItyxmqXGadHPF69Kmm+Ucv3s6ifDkbs/jjoMu
	+1izB0Zv8Ml/5J3VSFmCCuR9PUwSfIE=
X-MC-Unique: ej2_7V4iOzSjX9TZHuTimw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728582189; x=1729186989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okv2RKybuCagmoTr+5nQR2nTb+IA1DURK3Hada+1xdc=;
        b=YCFGrTJ8Nx9mUIZPusfclYmtVG7/OM+wqYptwRqnMgYTVsInzYnjIomCacRiDYFhGs
         naSPYSlPN6dyAF8pqYMPZN7puklkVEurOUkbHa1cffXwDMwLmqqsh2L2VbYsVlGFfvBl
         bOim2Vb3Mt8EU/9uoSJDRdSwMhq12+vnsdR+yCtnoDNpK96RfoSrJD+VGtVr90FKmWYG
         2lFmNY8UjqabLsjeUjxlhSGgynOYOxdo0ozTkUHlOZZlrpcBtoHlqJSUOI9tniySKks3
         6a1WRiCAp9RZTnoj/VhFC3SPJ76AMtPoYdCbUZSerYZTHKWV6ItY8vW7ipMiJVKVP0N0
         b/bw==
X-Forwarded-Encrypted: i=1; AJvYcCV6iqYs62zLNVv0vDb/FD/RQYNo2AIwou7eLdQkil3LwPt519s0Fvq4gxoxP/nwRPo2EGnDeht4s0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOYwzk2NKrPqjke5FLbRiYdhkI9V4XSPgZdG+ypW+Olx4nCIeS
	Dhepc+/NWvyjLS3GdCQO1QR3BBGYRf5b3Jbl9hoDhat49fzoRf+Pjhd91rt2A0mA9gXyy9tTeaC
	HLOQFHZVdvA2dm+a87/XOQu24sqcBqkc1R/rhMua76+JDzm1W1bG/SEvhXaxnb2Q2
X-Received: by 2002:a05:6e02:1f0b:b0:3a3:a5c5:3914 with SMTP id e9e14a558f8ab-3a3a5c53b23mr8780755ab.7.1728582188973;
        Thu, 10 Oct 2024 10:43:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4wPODz5d2oXE9aKocFeCuVGB9sHsZCElsoW8M99wIhH/mdFxCjREgEp2wTOzqiP6m0FOTw==
X-Received: by 2002:a05:6e02:1f0b:b0:3a3:a5c5:3914 with SMTP id e9e14a558f8ab-3a3a5c53b23mr8780315ab.7.1728582188363;
        Thu, 10 Oct 2024 10:43:08 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:43:04 -0600
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
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org,
 linux-staging@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH 01/13] PCI: Prepare removing devres from pci_intx()
Message-ID: <20241010114304.064f5d3d.alex.williamson@redhat.com>
In-Reply-To: <20241009083519.10088-2-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	<20241009083519.10088-2-pstanner@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Oct 2024 10:35:07 +0200
Philipp Stanner <pstanner@redhat.com> wrote:

> pci_intx() is a hybrid function which sometimes performs devres
> operations, depending on whether pcim_enable_device() has been used to
> enable the pci_dev. This sometimes-managed nature of the function is
> problematic. Notably, it causes the function to allocate under some
> circumstances which makes it unusable from interrupt context.
> 
> To, ultimately, remove the hybrid nature from pci_intx(), it is first
> necessary to provide an always-managed and a never-managed version
> of that function. Then, all callers of pci_intx() can be ported to the
> version they need, depending whether they use pci_enable_device() or
> pcim_enable_device().
> 
> An always-managed function exists, namely pcim_intx(), for which
> __pcim_intx(), a never-managed version of pci_intx() had been
> implemented.
> 
> Make __pcim_intx() a public function under the name
> pci_intx_unmanaged(). Make pcim_intx() a public function.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 24 +++---------------------
>  drivers/pci/pci.c    | 26 ++++++++++++++++++++++++++
>  include/linux/pci.h  |  2 ++
>  3 files changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index b133967faef8..475a3ae5c33f 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -411,31 +411,12 @@ static inline bool mask_contains_bar(int mask, int bar)
>  	return mask & BIT(bar);
>  }
>  
> -/*
> - * This is a copy of pci_intx() used to bypass the problem of recursive
> - * function calls due to the hybrid nature of pci_intx().
> - */
> -static void __pcim_intx(struct pci_dev *pdev, int enable)
> -{
> -	u16 pci_command, new;
> -
> -	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> -
> -	if (enable)
> -		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
> -	else
> -		new = pci_command | PCI_COMMAND_INTX_DISABLE;
> -
> -	if (new != pci_command)
> -		pci_write_config_word(pdev, PCI_COMMAND, new);
> -}
> -
>  static void pcim_intx_restore(struct device *dev, void *data)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct pcim_intx_devres *res = data;
>  
> -	__pcim_intx(pdev, res->orig_intx);
> +	pci_intx_unmanaged(pdev, res->orig_intx);
>  }
>  
>  static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
> @@ -472,10 +453,11 @@ int pcim_intx(struct pci_dev *pdev, int enable)
>  		return -ENOMEM;
>  
>  	res->orig_intx = !enable;
> -	__pcim_intx(pdev, enable);
> +	pci_intx_unmanaged(pdev, enable);
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(pcim_intx);

What precludes this from _GPL?  Also note that this is now calling a
GPL symbol, so by default I'd assume it should also be GPL.  Thanks,

Alex

>  
>  static void pcim_disable_device(void *pdev_raw)
>  {
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7d85c04fbba2..318cfb5b5e15 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4476,6 +4476,32 @@ void pci_disable_parity(struct pci_dev *dev)
>  	}
>  }
>  
> +/**
> + * pci_intx - enables/disables PCI INTx for device dev, unmanaged version
> + * @pdev: the PCI device to operate on
> + * @enable: boolean: whether to enable or disable PCI INTx
> + *
> + * Enables/disables PCI INTx for device @pdev
> + *
> + * This function behavios identically to pci_intx(), but is never managed with
> + * devres.
> + */
> +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
> +{
> +	u16 pci_command, new;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> +
> +	if (enable)
> +		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
> +	else
> +		new = pci_command | PCI_COMMAND_INTX_DISABLE;
> +
> +	if (new != pci_command)
> +		pci_write_config_word(pdev, PCI_COMMAND, new);
> +}
> +EXPORT_SYMBOL_GPL(pci_intx_unmanaged);
> +
>  /**
>   * pci_intx - enables/disables PCI INTx for device dev
>   * @pdev: the PCI device to operate on
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 573b4c4c2be6..6b8cde76d564 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1353,6 +1353,7 @@ int __must_check pcim_set_mwi(struct pci_dev *dev);
>  int pci_try_set_mwi(struct pci_dev *dev);
>  void pci_clear_mwi(struct pci_dev *dev);
>  void pci_disable_parity(struct pci_dev *dev);
> +void pci_intx_unmanaged(struct pci_dev *pdev, int enable);
>  void pci_intx(struct pci_dev *dev, int enable);
>  bool pci_check_and_mask_intx(struct pci_dev *dev);
>  bool pci_check_and_unmask_intx(struct pci_dev *dev);
> @@ -2293,6 +2294,7 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
>  				    struct pci_dev *dev) { }
>  #endif
>  
> +int pcim_intx(struct pci_dev *pdev, int enabled);
>  void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
>  void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
>  				const char *name);


