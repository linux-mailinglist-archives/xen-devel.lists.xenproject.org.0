Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D40719481
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 09:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542272.845940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cwQ-0002so-1Y; Thu, 01 Jun 2023 07:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542272.845940; Thu, 01 Jun 2023 07:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cwP-0002pT-Un; Thu, 01 Jun 2023 07:41:49 +0000
Received: by outflank-mailman (input) for mailman id 542272;
 Thu, 01 Jun 2023 07:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+w1M=BV=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q4cwP-0002ni-5E
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:41:49 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b9300e-004f-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 09:41:47 +0200 (CEST)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so501000a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:41:47 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a62b416000000b0064d1349dc31sm4424818pfn.199.2023.06.01.00.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:41:45 -0700 (PDT)
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
X-Inumbo-ID: c2b9300e-004f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685605306; x=1688197306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bc1VxBw2ts7gzODbDt725l/y9yXi0D1Tw4esM7ANdJo=;
        b=YDujPal7wEEBLnpAJsvdWRdpTPTHWkcgLybiafBwUGy8Gv4A9m7mFoizaRlbqOxVAf
         03TR1Kk/2g2omrqvungoh3GSuN6YGNnQ6+SC/j2J0RV9XQL4RlXW1yU3OPhywzp3Jf//
         9b6khcU6Pts1pUs9oG4fuoQOnQCbreK6yl0+QmtMj5pxtbUdsoixB1RGMWMD7rYbgX9M
         qFEUyRjOuqJ6OHPGLRC4g1LVzc0fxo5FFO71B3bljyarT6gj2y+dhL21gOSzKxZqqKJX
         WjvAeU8+st8NK021a35W+pNz1SaePj0A6/zFrLF9k9tA5OTc6g+RSqyHAXZHG0FZ/TDN
         ZmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605306; x=1688197306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bc1VxBw2ts7gzODbDt725l/y9yXi0D1Tw4esM7ANdJo=;
        b=dYmo5Q0oaN1yi4xbAsP1FPljdMvo5Np/YY0/ppBPOcPvYOgXKV3aTJnjhDXmHEaEQf
         f4IQQE9VYA6kdarmNGZ7qVMMZ66N80CTd28n8dCFicUXpyEPnYYoTBIDertPNK+DK80G
         XnOM/sW5VD3XKi4qne5lGygGH9kJk1LczJA2xKUPoXKsp5z3nceVl1AfO6viGGppNcf7
         wwoPkooARAgfKMb8xblrv16aMj5TmFzaeYva9mNSta01/LfL4211Hc7F6iFp2aJJ24lO
         xBsjlha985+HPHqnuUtemU4PBg0+gJT6rts4ZQ8nm0IsonvGtZomxL8q8MQ2niXmje+b
         5DGA==
X-Gm-Message-State: AC+VfDzRSH2+0OIlLDcaiOEhwbVfyRbbBci9j/CbTACgFQksbbN59Q4X
	cR86OP5MuFE+UhYnp3w69IGeNg==
X-Google-Smtp-Source: ACHHUZ7TDkTXVGJ/r9kX7PKwjBkqfm4bwdAX6ZtU3aCnPohgVAZ1rbRjP2ABSRQr4SAKEAvK6nYpfA==
X-Received: by 2002:a05:6a20:3d0c:b0:10b:4539:fa0a with SMTP id y12-20020a056a203d0c00b0010b4539fa0amr11339542pzi.1.1685605305794;
        Thu, 01 Jun 2023 00:41:45 -0700 (PDT)
Message-ID: <233b42b2-6fbb-3882-6158-d2a82bf88be1@daynix.com>
Date: Thu, 1 Jun 2023 16:41:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P
 <pj.pandit@yahoo.co.in>, Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <72ccd4c2-7c60-e015-2322-721d09a8334b@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <72ccd4c2-7c60-e015-2322-721d09a8334b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/06/01 16:16, Philippe Mathieu-Daudé wrote:
> On 1/6/23 05:18, Akihiko Odaki wrote:
>> Recently MemReentrancyGuard was added to DeviceState to record that the
>> device is engaging in I/O. The network device backend needs to update it
>> when delivering a packet to a device.
>>
>> This implementation follows what bottom half does, but it does not add
>> a tracepoint for the case that the network device backend started
>> delivering a packet to a device which is already engaging in I/O. This
>> is because such reentrancy frequently happens for
>> qemu_flush_queued_packets() and is insignificant.
>>
>> This series consists of two patches. The first patch makes a bulk 
>> change to
>> add a new parameter to qemu_new_nic() and does not contain behavioral 
>> changes.
>> The second patch actually implements MemReentrancyGuard update.
> 
> /me look at the 'net' API.
> 
> So the NetReceive* handlers from NetClientInfo process the HW NIC
> data flow, independently from the CPUs.
> 
> IIUC MemReentrancyGuard is supposed to protect reentrancy abuse from
> CPUs.
> 
> NetReceive* handlers aren't restricted to any particular API, they
> just consume blob of data. Looking at e1000_receive_iov(), this data
> is filled into memory using the pci_dma_rw() API. pci_dma_rw() gets
> the AddressSpace to use calling pci_get_address_space(), which returns
> PCIDevice::bus_master_as. Then we use the dma_memory_rw(), followed
> by address_space_rw(). Beh, I fail to see why there is reentrancy
> checks from this NIC DMA HW path.
> 
> Maybe the MemoryRegion API isn't the correct place to check for
> reentrancy abuse and we should do that at the AddressSpace level,
> keeping DMA ASes clear and only protecting CPU ASes?

The involvement of CPU is not essential in my understanding. A typical 
scenario of DMA reentrancy is like the following:
1) The guest configures the DMA destination address register the device 
has to the address of another device register.
2) The DMA gets triggered.
3) The device performs the DMA, writing its own register.
4) The write causes reentrancy.
5) The re-entered device code corrupts the device state.

I guess 2) is done by CPU in most cases, but sometimes it happen with 
another cause. In fact, the current reentrancy protection code covers 
the case that bottom half handlers triggers DMA. The intention of this 
series is to extend the coverage and handles the case that incoming 
network traffic triggers DMA.

The essence of DMA reentrancy is in 3). This happens when the DMA 
address space contains the MMIO region of the device and there is no 
involvement of CPU here.

