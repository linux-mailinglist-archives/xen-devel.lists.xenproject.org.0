Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E509A048B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819693.1233106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zcy-0007si-O7; Wed, 16 Oct 2024 08:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819693.1233106; Wed, 16 Oct 2024 08:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zcy-0007qj-LE; Wed, 16 Oct 2024 08:43:32 +0000
Received: by outflank-mailman (input) for mailman id 819693;
 Wed, 16 Oct 2024 08:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9FP=RM=gmail.com=hkallweit1@srs-se1.protection.inumbo.net>)
 id 1t0zcx-0007qd-Ao
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:43:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7ec862a-8b9a-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 10:43:30 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso380323a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 01:43:30 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a554:2300:6c65:3e15:b0c4:185e?
 (dynamic-2a02-3100-a554-2300-6c65-3e15-b0c4-185e.310.pool.telefonica.de.
 [2a02:3100:a554:2300:6c65:3e15:b0c4:185e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9a29750a9asm156042266b.88.2024.10.16.01.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 01:43:28 -0700 (PDT)
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
X-Inumbo-ID: b7ec862a-8b9a-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729068209; x=1729673009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PaNHk+1EBRyWir9RbKJJvbLwl0XroaJpy79cuY3a4Cc=;
        b=FT/AV5cTw40dWBVeNwHgmSGQhH4KjwExd2kpGtUB0qIHhoMDRWlapJhRZPR5rN0eRG
         crrjGNDTfi/chfMBge8qA++2fAsDFCK6O3JnBmhscu8nBqYNpqCFFvBiEuh3afBA3YYz
         LVYYXNidDg7KVKqOxWX18PTbjmSkUFzHmD6RNrnEHkX9aAgYEBEpAtfv3vsghwutR5Fd
         fGRUvehGnoAqmy+u4p8+I3wikCGEWOasuJr3Mu/NPMnjFiGLyOKB7/ektemXxdNLsJnZ
         wYWKI6spW1+1MxHaeoLmtqn2dfM+HaU9d2X5fU8YGBur4OLqZLeM+5rQ7OtAFN5bUtj2
         WPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068209; x=1729673009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaNHk+1EBRyWir9RbKJJvbLwl0XroaJpy79cuY3a4Cc=;
        b=iumcLmE/CcbYt4KMToKtFL8nkSrXU6csIdYHMKywL5qmknfuXTh00lZXeLH9Alwyhe
         dh9+Wk3MNQiCCxzgSfvHFfuhaYwNSHwTxxREo/+SqZuXM/GAow4OTh3MZEDZvbOUSwc4
         8qxOk3oCxdg5NI5Vqz0RY411b0TqR69whPBsmWTGQWH62GK54YZmwQiTHnQ8Yw+x1Jo6
         QMnvlRx6l+2O3vbpTSvRd8A5evgwFKFqYSWq0B0k/jW9rWX9Pv8LINtAD8qGwO98x65t
         9hpsBKi704lwjANRzSagCzMuAeHuj7wWNVVzRlT95p0QtSHcnR8byt/gsBhTcv9nrUTf
         B88w==
X-Forwarded-Encrypted: i=1; AJvYcCU5tEXjp3YkuCIPsp6+UbOmtr1zgSE9jVps3agKq1vP3ZmFnfH3evDXBMNew6Jr0z4uiDWfjPRoffI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA5Cb6zaf5JeXtNK2BGVuvv4xhs5IGAD9f82yUxWSBZ8+DWmZa
	9/S9E1VXMao262PcWe+gFJuzOGoimzRC+upzrI2TXKT4VOLlY5pV
X-Google-Smtp-Source: AGHT+IG7Mc74tdlZs67Lg0fXYJgdjilcvHeVlNjg83zAHOOdY3c3eJlxhWztO741FFj+cDImqCMJ7w==
X-Received: by 2002:a17:906:4fc8:b0:a8a:6c5d:63b2 with SMTP id a640c23a62f3a-a99b937a6d4mr1476269166b.18.1729068209160;
        Wed, 16 Oct 2024 01:43:29 -0700 (PDT)
Message-ID: <297b5511-8f6a-4798-a2b4-d4c634969aed@gmail.com>
Date: Wed, 16 Oct 2024 10:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
To: Philipp Stanner <pstanner@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello <mario.limonciello@amd.com>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, Christian Brauner <brauner@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
References: <20241015185124.64726-1-pstanner@redhat.com>
 <20241015185124.64726-14-pstanner@redhat.com>
 <20241015135336.0de9795e.alex.williamson@redhat.com>
 <fc7244823a5665d3db40c94aea099a2973032a0b.camel@redhat.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <fc7244823a5665d3db40c94aea099a2973032a0b.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2024 08:57, Philipp Stanner wrote:
> On Tue, 2024-10-15 at 13:53 -0600, Alex Williamson wrote:
>> On Tue, 15 Oct 2024 20:51:23 +0200
>> Philipp Stanner <pstanner@redhat.com> wrote:
>>
>>> pci_intx() and its managed counterpart pcim_intx() only exist for
>>> older
>>> drivers which have not been ported yet for various reasons. Future
>>> drivers should preferably use pci_alloc_irq_vectors().
>>>
>>> Mark pci_intx() and pcim_intx() as deprecated and encourage usage
>>> of
>>> pci_alloc_irq_vectors() in its place.
>>
>> I don't really understand this.  As we've discussed previously
>> pci_alloc_irq_vectors() is, unsurprisingly, for allocating PCI IRQ
>> vectors while pci_intx() is for manipulating the INTx disable bit on
>> PCI devices.  The latter is a generic mechanism for preventing PCI
>> devices from generating INTx, regardless of whether there's a vector
>> allocated for it.  How does the former replace the latter and why do
>> we
>> feel the need to deprecate the latter?
>>
>> It feels like this fits some narrow narrative and makes all users of
>> these now deprecated functions second class citizens.  Why?  At it's
>> root these are simply providing mask and set or mask and clear
>> register
>> bit operations.  Thanks,
> 
> I got the feeling from the RFC discussion that that was basically the
> consensus: people should use pci_alloc_irq_vectors(). Or did I
> misunderstand Andy and Heiner?
> 
I think there are two different use cases for pci_intx().
At first there are several drivers where the direct usage of pci_intx()
can be eliminated by switching to the pci_alloc_irq_vectors() API.

And then there's usage of pci_intx() in
drivers/vfio/pci/vfio_pci_intrs.c
drivers/xen/xen-pciback/conf_space_header.c
There we have to keep the (AFAICS unmanaged) pci_intx() calls.

> I'm perfectly happy with dropping this patch and continue offering
> pci{m}_intx() to users, since after removing that hybrid hazzard I
> don't see any harm in them anymore.
> 
> 
> P.
> 
>>
>> Alex
>>  
>>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>  drivers/pci/devres.c | 5 ++++-
>>>  drivers/pci/pci.c    | 5 ++++-
>>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
>>> index 6f8f712fe34e..4c76fc063104 100644
>>> --- a/drivers/pci/devres.c
>>> +++ b/drivers/pci/devres.c
>>> @@ -435,7 +435,7 @@ static struct pcim_intx_devres
>>> *get_or_create_intx_devres(struct device *dev)
>>>  }
>>>  
>>>  /**
>>> - * pcim_intx - managed pci_intx()
>>> + * pcim_intx - managed pci_intx() (DEPRECATED)
>>>   * @pdev: the PCI device to operate on
>>>   * @enable: boolean: whether to enable or disable PCI INTx
>>>   *
>>> @@ -443,6 +443,9 @@ static struct pcim_intx_devres
>>> *get_or_create_intx_devres(struct device *dev)
>>>   *
>>>   * Enable/disable PCI INTx for device @pdev.
>>>   * Restore the original state on driver detach.
>>> + *
>>> + * This function is DEPRECATED. Do not use it in new code.
>>> + * Use pci_alloc_irq_vectors() instead (there is no managed
>>> version, currently).
>>>   */
>>>  int pcim_intx(struct pci_dev *pdev, int enable)
>>>  {
>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>> index 7ce1d0e3a1d5..dc69e23b8982 100644
>>> --- a/drivers/pci/pci.c
>>> +++ b/drivers/pci/pci.c
>>> @@ -4477,11 +4477,14 @@ void pci_disable_parity(struct pci_dev
>>> *dev)
>>>  }
>>>  
>>>  /**
>>> - * pci_intx - enables/disables PCI INTx for device dev
>>> + * pci_intx - enables/disables PCI INTx for device dev
>>> (DEPRECATED)
>>>   * @pdev: the PCI device to operate on
>>>   * @enable: boolean: whether to enable or disable PCI INTx
>>>   *
>>>   * Enables/disables PCI INTx for device @pdev
>>> + *
>>> + * This function is DEPRECATED. Do not use it in new code.
>>> + * Use pci_alloc_irq_vectors() instead.
>>>   */
>>>  void pci_intx(struct pci_dev *pdev, int enable)
>>>  {
>>
> 
> 


