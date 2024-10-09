Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03302997C6B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 07:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815131.1229166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sylku-0004oa-Gm; Thu, 10 Oct 2024 05:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815131.1229166; Thu, 10 Oct 2024 05:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sylku-0004n1-Dq; Thu, 10 Oct 2024 05:30:32 +0000
Received: by outflank-mailman (input) for mailman id 815131;
 Wed, 09 Oct 2024 19:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFTV=RF=gmail.com=philipp.g.hortmann@srs-se1.protection.inumbo.net>)
 id 1sycYv-0001gg-W9
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 19:41:34 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c2e0b90-8676-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 21:41:32 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5398e53ca28so118184e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 12:41:32 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf5f3adsm28720915e9.22.2024.10.09.12.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 12:41:30 -0700 (PDT)
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
X-Inumbo-ID: 7c2e0b90-8676-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728502891; x=1729107691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Io1G2uneGwHsYKAwtaIvvynFX0xlOmokHD97rmisdy0=;
        b=l1NfiOcIRcLmrbPsOsJSfNYfK/FgcsRj9atb7fS6UgvSdCQXVfCkRHMlh3tIR6EIFs
         UVYqeJHLVQdJoTG1bxLy0QA2eZtdWSwAJtVyOGFaQSImkREu4Fk+0xfMdirnFUEKCZJM
         6iz/yz+0vrCgocgbYfMKWzvHN5sywWCcFH72a6m/75ht3+uhcf8aJjoxDX0Ytsj/1qfC
         a88NuSgwwWttJqStjs7J/t5M5ta9l7wUjzDxnIlIFEoB1h5IWtikTlWuaf/F2SjGwxhY
         RsnwfwteP1DegD5Noi9pFow9oZQwvGthKlpOGjcjKWroXthaphktZDr800FQdyz/MNhB
         SN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728502891; x=1729107691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Io1G2uneGwHsYKAwtaIvvynFX0xlOmokHD97rmisdy0=;
        b=Umpmy/BEGOuQ+r5YEnQWUdWwzjtJfFFH8ta4mUhjAGifuqt+l0NnPc4Zwt64hPjYg1
         +gUQLsXAePdi1fADLipw57Ab8bp2oV2DNyKQoX6uC8geuoSVLBGP8iVGGo7SB6HecUYj
         RdtXJczcpo+cSruMTu4jv4QS+FrWi22PkkHWhmHJDYaw1gs8ZfmnQqWF2bNqc8YAkJG6
         NBvVcTy/NHcEji9oMDMOFktwfHDfC6tHOdoyJ4S71rF3rBmws/62t0RSAnlFmf6AtHCx
         kUR6Up3AX1GC4oSpiPYIUNn8i6mQ30CnbNY/a7mviEuHj5osaOgLce7EcpSX8ERNnzPc
         NJzA==
X-Forwarded-Encrypted: i=1; AJvYcCWuQjtk7WKuO+LfC3ISqEb0kPdKSgHh6QVQkqI84PV9Taf3aEdGNL2FJ+lIpZFS7i7oQFoEvEz9OCQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUrFV2rA2NIEV2/64jRqNkU+8OYzdxH8Z7B9kFJ8aSNEQbGnuu
	hwvZV9HI7xdCiV/jObVNLfWpj0UL/+Mr5jE7EL1nuN5bEFyGR6S4
X-Google-Smtp-Source: AGHT+IEJ7Hh7KYSEFQ7TnvOgBW+KHHTbn0YpY2aq9eVXupaQTxUm7Wi9eOrRO7yFgrSR7VO5SquDug==
X-Received: by 2002:a05:6512:224b:b0:539:921a:44af with SMTP id 2adb3069b0e04-539c4967bbemr2532382e87.48.1728502891046;
        Wed, 09 Oct 2024 12:41:31 -0700 (PDT)
Message-ID: <411f3c94-58b5-471e-bc58-e23d89d2078f@gmail.com>
Date: Wed, 9 Oct 2024 21:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/13] staging: rts5280: Use always-managed version of
 pci_intx()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-staging@lists.linux.dev,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-sound@vger.kernel.org
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-11-pstanner@redhat.com>
 <2024100936-brunette-flannels-0d82@gregkh>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2024100936-brunette-flannels-0d82@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/24 11:38, Greg Kroah-Hartman wrote:
> On Wed, Oct 09, 2024 at 10:35:16AM +0200, Philipp Stanner wrote:
>> pci_intx() is a hybrid function which can sometimes be managed through
>> devres. To remove this hybrid nature from pci_intx(), it is necessary to
>> port users to either an always-managed or a never-managed version.
>>
>> rts5208 enables its PCI-Device with pcim_enable_device(). Thus, it needs the
>> always-managed version.
>>
>> Replace pci_intx() with pcim_intx().
>>
>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/staging/rts5208/rtsx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

Hi Philipp,

this driver (rts5208) will be removed soon - patch is send in.

Discussion about removal:
https://lore.kernel.org/linux-staging/2024100943-shank-washed-a765@gregkh/T/#t

Thanks for your support.

Bye Philipp


