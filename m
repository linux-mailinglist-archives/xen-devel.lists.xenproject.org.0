Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC459980CF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815829.1230043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syosC-0006dO-3c; Thu, 10 Oct 2024 08:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815829.1230043; Thu, 10 Oct 2024 08:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syosB-0006bp-W4; Thu, 10 Oct 2024 08:50:15 +0000
Received: by outflank-mailman (input) for mailman id 815829;
 Thu, 10 Oct 2024 08:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe3N=RG=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1syos9-0006bj-Rb
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:50:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a6e797-86e4-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 10:50:11 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4311420b675so5427865e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:50:11 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43117ff5930sm9483515e9.0.2024.10.10.01.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 01:50:10 -0700 (PDT)
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
X-Inumbo-ID: a8a6e797-86e4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550211; x=1729155011; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C28wmYcjpWumVpaF4ufJJPgnJaeWt/0xGrgSlXatWFI=;
        b=vMmo50l8ZX1tPJbgXIxDobbo+PKNVfFyiOm7Db8kVihfX0h3hk4rjhjsgqTwH9jxmo
         yZVmS423Ix6bqmZZHKF4lP2FJXdpKZYqe3M8p1AUAeH9lt8kiQr9QchuWrBGA2F+iBVm
         Saxl/0T9/HmQXjuuQlKFWrvBSbfBxP2V7R/LYNqTS3LVG93oAQJChBxEkTGD3ulEC1KC
         OAxPTVVBLBJhi2UY3nWwqZ4Xz/LVT2uRrj2opUIPHGEAMYd2l7umE7VItOyQqMJqvmhn
         N/LqPSYaouYJGkJV5OivdEk0LQd1pPPEAcbI5SKKOsI9cUnfCcxoFURowyo7P/GL0aGQ
         Zezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550211; x=1729155011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C28wmYcjpWumVpaF4ufJJPgnJaeWt/0xGrgSlXatWFI=;
        b=roHSoWf0+9HWSaunXJ6SrXrrt832AdNlQnJh1zNpw/r+PSQg1BekthF/pkqVt+0g+o
         MmzLd4MQQZCqzZ+bmwqjIG5+kouuVu5lKTgkeoxsvD2ps0u2Se4Go/yKIHtnmXu9Fz9Q
         1Im2vcltFGuKK0Xye05l+Dq0DunHqWm5wmZr3HQg+bL58ELAttFEZtHXY897BvXHO7ax
         5XIM75Fg9KcV+MPBNkrrLtZfDfsLoTSjnYg8mIYEVy9NRLbFv48mhaX44OxHQNQnQPXJ
         jjy6j3WaQfUA9J843+xBeY/6nGxr5DvRufgga8R+vRoX1Owsk413A3rRd2YLYz7SSiEX
         xg6A==
X-Forwarded-Encrypted: i=1; AJvYcCVHR6Qmu2QOKxl5PHrx0bu/zqr+GI1QUXUhF4UJ6o308BXMrP2rSe/VmFX3nQpdzEG0+gX1T333+2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5bGaFtc9dO1ykoX7cYnOeVPkjh3/I/VekvhubbpjLRdeiVdHe
	BRul/PGAhzYKDIF8JISzXbYXSFECutUPo2CKfxqDqTKzn5M99lKsCeI6AemhOEA=
X-Google-Smtp-Source: AGHT+IFucfSES3j62KAzEm41LuUqQRM3VySAkjPe4+iZpB8R8Lb977wIeQTSTeOu3TgGseFk0hICSw==
X-Received: by 2002:a05:600c:4b95:b0:431:1a98:cb40 with SMTP id 5b1f17b1804b1-4311a98cc3dmr1671235e9.18.1728550211283;
        Thu, 10 Oct 2024 01:50:11 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:50:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH 13/13] Remove devres from pci_intx()
Message-ID: <7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-14-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009083519.10088-14-pstanner@redhat.com>

On Wed, Oct 09, 2024 at 10:35:19AM +0200, Philipp Stanner wrote:
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
> Remove the devres functionality from pci_intx(). Remove pci_intx_unmanaged().
> Have all users of pci_intx_unmanaged() call pci_intx().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

I don't like when we change a function like this but it still compiles fine.
If someone is working on a driver and hasn't pushed it yet, then it's probably
supposed to be using the new pcim_intx() but they won't discover that until they
detect the leaks at runtime.

Why not leave the pci_intx_unmanaged() name.  It's ugly and that will discorage
people from introducing new uses.

regards,
dan carpenter


