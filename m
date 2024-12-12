Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423B39EE97C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 15:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856113.1268845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkeI-0006B6-M9; Thu, 12 Dec 2024 14:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856113.1268845; Thu, 12 Dec 2024 14:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkeI-00069Q-I0; Thu, 12 Dec 2024 14:58:42 +0000
Received: by outflank-mailman (input) for mailman id 856113;
 Thu, 12 Dec 2024 14:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ohRn=TF=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1tLkeH-00069I-9B
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 14:58:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91bac255-b899-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 15:58:39 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-w4Q-E6ceN7CWhDudgIcVDw-1; Thu, 12 Dec 2024 09:58:35 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43627bb20b5so2996165e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 06:58:35 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559edc3sm19213025e9.22.2024.12.12.06.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 06:58:33 -0800 (PST)
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
X-Inumbo-ID: 91bac255-b899-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734015518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mp7PByfrT26c6XlUU6lXZIxvrN1DU5qMvcLQpbxnk5A=;
	b=Q4ieOnsNtSrfUI+gNJ5dX/tEjo8dMVfuODtCVZfS6FOyjIt7UwqTlZwA+WjS2euJkvEA76
	6vOZLCCO0bldypzGkBwqRdSBgFbnuSyf2KQXfuEUfr0Q2xIodsWHV9wGw5yLybhHVKVOw1
	mrV+fa+GsdI0Mw0Mjd2g//eXko3EqNg=
X-MC-Unique: w4Q-E6ceN7CWhDudgIcVDw-1
X-Mimecast-MFC-AGG-ID: w4Q-E6ceN7CWhDudgIcVDw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734015514; x=1734620314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp7PByfrT26c6XlUU6lXZIxvrN1DU5qMvcLQpbxnk5A=;
        b=T3/lk2CdNFWJ/c0oORaqpNIJ8SQci14IT3XwPmSvnOVg3G6DxRgHAG7dzqalnu9ZYD
         O9Lix/tKDrpDrhyrDw/1yk51dbCX1o6ZJGPuZh+QMIr6cj/6YV8VSqKegUdhTTkZJ7Vi
         HXyd7WeSC8NukUKKYuDBf/SEGpou/BHCSl6DiQstX5NH25FAfFP8sYy4wC2uw1YE0/10
         r2PlFDL74nE4Fl/H7CM8VIJFGx6mbdTkMON2w4DlLmL4kLGAGPKNUMFOKOOMcpHsmPWH
         VDBWkcB6NrXD08P9M8ny9dPgRThf5Y0sVgOMXgjdgDLsvlIDNH1iOr6wHfLXueXrj3KE
         C3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvkCSPoIXeudmmgLZA23Hl32LmLT/3hdsP0/A1SbPqrm82sPgl4H6GIJCkGUgMZxaYjdePZpF2ywU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB1Z9EnWl7YshJ8zm78IRLu5BYHBDnw13X0olYsjs2ZXiGM8/c
	1wRgsuwAGtddNoun0huixqeCKuj1O9h8MPq764eOk/txvbF8yGgCR/VOcX53w4dgD57oA+fZc0G
	K/1xvNHkkNpn0YnSrYtN7EZC+InIlztmC8YL3MFBwoJ4VZuO25hoy59AdPCLyKmJh
X-Gm-Gg: ASbGnctKYdjDQgDXd42W6pN9l39CA+lrG3pIMSYZpge4kjDa2YEHD1o5CHyEIbtFuj8
	IdR9Tdi4PgfihWLFDz5PM1sBG4WggyoY7gBjqEodwMvmBj5hom/AmbXZb4fl4/hSgLN1M3GAhpy
	R2HH1QUImKJZgTeEXKgCKuwpwhOUozMLbthsY57tksxuZnCHqpi5SaX3liIanYR+aHeohFCKKid
	tOOO4pmAOH2YMJ9d1QR1SOyGHtU3h9kV+8lBTWh4rIDBuZbG2pp9ThKiT9e1XRo1fuUHpmqrnYD
	4gfQB9o=
X-Received: by 2002:a05:600c:1e89:b0:435:21a1:b109 with SMTP id 5b1f17b1804b1-436228239d4mr34776345e9.2.1734015514544;
        Thu, 12 Dec 2024 06:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoQPXURHNGvrny3f7vl2oVT9jWXY7D4FX6dkSlxmx2R9PGBk/+viTtA90lBPMFXjybTLaFQQ==
X-Received: by 2002:a05:600c:1e89:b0:435:21a1:b109 with SMTP id 5b1f17b1804b1-436228239d4mr34775655e9.2.1734015514130;
        Thu, 12 Dec 2024 06:58:34 -0800 (PST)
Message-ID: <a6d7a4ee-929e-4bee-80bf-a7b4f4f89f4a@redhat.com>
Date: Thu, 12 Dec 2024 15:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] Remove devres from pci_intx()
To: Philipp Stanner <pstanner@redhat.com>, amien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@linutronix.de>,
 Kevin Tian <kevin.tian@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20241209130632.132074-2-pstanner@redhat.com>
 <20241209130632.132074-13-pstanner@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241209130632.132074-13-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EZHz_EX21hJITz_zMuEDfcwZJqnwOg8rTEdzfdk7i8w_1734015514
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/24 14:06, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. This hybrid nature is undesirable.
> 
> Since all users of pci_intx() have by now been ported either to
> always-managed pcim_intx() or never-managed pci_intx_unmanaged(), the
> devres functionality can be removed from pci_intx().
> 
> Consequently, pci_intx_unmanaged() is now redundant, because pci_intx()
> itself is now unmanaged.
> 
> Remove the devres functionality from pci_intx(). Have all users of
> pci_intx_unmanaged() call pci_intx(). Remove pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/misc/cardreader/rtsx_pcr.c            |  2 +-
>  drivers/misc/tifm_7xx1.c                      |  6 +--
>  .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |  2 +-
>  drivers/net/ethernet/brocade/bna/bnad.c       |  2 +-
>  drivers/ntb/hw/amd/ntb_hw_amd.c               |  4 +-
>  drivers/ntb/hw/intel/ntb_hw_gen1.c            |  2 +-
>  drivers/pci/devres.c                          |  4 +-
>  drivers/pci/msi/api.c                         |  2 +-
>  drivers/pci/msi/msi.c                         |  2 +-
>  drivers/pci/pci.c                             | 43 +------------------
>  drivers/vfio/pci/vfio_pci_core.c              |  2 +-
>  drivers/vfio/pci/vfio_pci_intrs.c             | 10 ++---
>  drivers/xen/xen-pciback/conf_space_header.c   |  2 +-
>  include/linux/pci.h                           |  1 -
>  14 files changed, 22 insertions(+), 62 deletions(-)

For the net bits:

Acked-by: Paolo Abeni <pabeni@redhat.com>


