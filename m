Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F159990A4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 20:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816439.1230655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syy05-0004IP-Ao; Thu, 10 Oct 2024 18:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816439.1230655; Thu, 10 Oct 2024 18:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syy05-0004G7-7Z; Thu, 10 Oct 2024 18:35:01 +0000
Received: by outflank-mailman (input) for mailman id 816439;
 Thu, 10 Oct 2024 18:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe3N=RG=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1syy03-0004G1-Lv
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 18:34:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f5f42e-8736-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 20:34:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4311c285bc9so2687685e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 11:34:58 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311835696esm23005225e9.37.2024.10.10.11.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 11:34:56 -0700 (PDT)
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
X-Inumbo-ID: 59f5f42e-8736-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728585297; x=1729190097; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytCziD1c5I5FhCXF5EK5g0FeePvbLPZ6YQt0NDF0j9M=;
        b=wG3SkAfdQUUicL4cofdNMQiNgSM4MgmhPpIwrAsMtOTPM/o+RqQ12jDx5+GjyScLXz
         IPpWB5YzMW+ieTe0siau7EafmmfN7+5x8EnLu2lPg2WgiIiLZpsfNITKGXceqCRrfLx7
         z3YoPJ6bqtZR34waesooXJzJ6aTbsal9ByoElzHN6R5NszDJUu4c8HvZ9erEe4gwW61o
         FqE17VnBHX80Dpfy4GFrFZ5RJGaCxv+eHpRxhJltpEOdvGgxTAFAkc85lbmcB+ICC6L/
         rDulce7uA1Krx0N67vbqWr3cga/x/BbAB9mt8W4M51bvUe7YUPMzYxQhY2bPGUDziDuA
         XCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585297; x=1729190097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytCziD1c5I5FhCXF5EK5g0FeePvbLPZ6YQt0NDF0j9M=;
        b=m3WrsFb85ph3a3ayWmQh7WeaPrpLlwfUSetZlABQhYrz8xdvAz0lndxquqHZsTxQMT
         X/SoYD/SOAEMDL7aQdm35z7+S0h0dWkon+LDZ24XTB6KLHyzx6i2sQsx/uYTF4bNxoZW
         m5RTCLoLZYj1ChuAj6IiWolZ9xIhGefT685mOeDX0MTqGLnOJHgbWrfwKSepbaJYwPTw
         8BWKDjTM9LSlIkdsn12PB43i4hKI4i9b+fQVAoNyKbjyW3pdGNOw8b23AUVsaXZFtkZa
         ZP3b/lliiUKCv0v/CkN6MhY7NdU5yvnK8y9twPszXLiEM6V4+E7FcJs56o+Ccode2/jq
         xfMg==
X-Forwarded-Encrypted: i=1; AJvYcCUj3wyL3ibzTKL67ktuRYE5ZR26UNTa9RYPWILapObBcB1T+5u4OO02T3EzoFzkUYPEr0+mqlxVnvk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygm/u+kZRRDMVvfTaMfmvgfej/kjPt29BXlRx7WtFxtoVO88rb
	FZCdJ9YDml/lt7nk2/0sdG4MLWKRQjAWJzH7gFgQlWLeqU/dxLDoq1TDHvV2TPo=
X-Google-Smtp-Source: AGHT+IGrQtiU9KkPJvVdlsqZUQMKOCUeX11EZAgMHCeWVATX5aFzmtkTu4Efnh91V5tJdIM1vfefqw==
X-Received: by 2002:a05:600c:46c9:b0:42c:c401:6d86 with SMTP id 5b1f17b1804b1-431157e56e5mr37151355e9.27.1728585297410;
        Thu, 10 Oct 2024 11:34:57 -0700 (PDT)
Date: Thu, 10 Oct 2024 21:34:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Philipp Stanner <pstanner@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
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
Message-ID: <0990d9f9-cab9-44c2-b2e3-bd8fa556cc02@stanley.mountain>
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-14-pstanner@redhat.com>
 <7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
 <f42bb5de4c9aca307a3431dd15ace4c9cade1cb9.camel@redhat.com>
 <20241010114314.296db535.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010114314.296db535.alex.williamson@redhat.com>

On Thu, Oct 10, 2024 at 11:43:14AM -0600, Alex Williamson wrote:
> FWIW, I think pcim_intx() and pci_intx() align better to our naming
> convention for devres interfaces.  Would it be sufficient if pci_intx()
> triggered a WARN_ON if called for a pci_is_managed() device?  Thanks,
> 

To be honest, I also don't mind if you also just merge the patchset as-is.  I
was mostly just throwing out ideas.

regards,
dan carpenter

