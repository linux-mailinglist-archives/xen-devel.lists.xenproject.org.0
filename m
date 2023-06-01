Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF27193F8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 09:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542254.845895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cXd-0006Hn-6I; Thu, 01 Jun 2023 07:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542254.845895; Thu, 01 Jun 2023 07:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cXd-0006FW-3X; Thu, 01 Jun 2023 07:16:13 +0000
Received: by outflank-mailman (input) for mailman id 542254;
 Thu, 01 Jun 2023 07:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ln7V=BV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1q4cXb-0006FQ-Rz
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:16:11 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dc3f3eb-004c-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 09:16:08 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so5247215e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:16:08 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f4272c2d0csm1185408wmj.36.2023.06.01.00.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:16:07 -0700 (PDT)
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
X-Inumbo-ID: 2dc3f3eb-004c-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685603768; x=1688195768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WxzX/yCNlI8j55zMId0+95rQUKgWabv2ID5tlei60QM=;
        b=Gen2Cia+8jwTVAFZKVgGWlirQvMrtFyXZ9UoEsuR/bvjDIJOGRMO1lVO1gSIX4316Q
         +OJNvgZk8IX1ihXqQXwqenIpLkmpItGw5/co228wbljIfirJPEqEEgVld+V61ZA3s5zA
         Cic5VL9KIipJMomumYYWISL9cGH3jPqHF99y/q15gHBv7D12a5Mw/5ZIymC48Sm9y5sS
         qkuas5BNYbHlymXURf3sSCAO+av/DtT0fuSx5WKZ/JOXOBF75uwl7oSoOb0rAt2dV4es
         MGwK0yAJHxO7sI6vCYvZEVfTWDmIkQU2ZD82keOoDRTLpHyLMypa+6jxdJ6OWGPlyBA3
         5Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685603768; x=1688195768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxzX/yCNlI8j55zMId0+95rQUKgWabv2ID5tlei60QM=;
        b=UMdgTtLjZTNlDx4sj8Zbwr+FJZrLFmSJGOoEhw2YASEHZwBZbHrY7ODFxzecD1C3vZ
         4F5FJr/qqyAepd3iJyITfI862l0EQd5GWSnzuLbO88pBAO9FzWdK+Px9ZLvbQ2ugFd0O
         aP3nEbUsd9aAoFGPADMrFS4sShsWWSvonnXrOvfku5IfD1pl4/ivUUUmZAUXx7VRd6Cz
         h7cPAfmNSPKfHDEFQh6WuzvQkmiXEWViFnUdaara9DZPRquS305NiKYITkDel8RAdTnx
         vh2riY+IVNT295tVWuKnUnf8toL90EPWOm2TMieLBN8zMQodEfqv+7qvdie2jyTtayM0
         Gqhg==
X-Gm-Message-State: AC+VfDwAw/dG6Um71CeTN9GtL8fzxKqLvU6KyCraiNVCRVP7buceQlur
	m/0ONCWGR2/vZ4mKNwUa5yjyuA==
X-Google-Smtp-Source: ACHHUZ4hON2fkLvrpZTHSEtZk4pe9Oj8d4QR+Z+nkJfpLOiDJ009Fgvl5JdUmRVI16HmDclpVVxrAQ==
X-Received: by 2002:a7b:c5d4:0:b0:3f6:ffe:9ef1 with SMTP id n20-20020a7bc5d4000000b003f60ffe9ef1mr1110012wmk.36.1685603767760;
        Thu, 01 Jun 2023 00:16:07 -0700 (PDT)
Message-ID: <72ccd4c2-7c60-e015-2322-721d09a8334b@linaro.org>
Date: Thu, 1 Jun 2023 09:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230601031859.7115-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/23 05:18, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> This implementation follows what bottom half does, but it does not add
> a tracepoint for the case that the network device backend started
> delivering a packet to a device which is already engaging in I/O. This
> is because such reentrancy frequently happens for
> qemu_flush_queued_packets() and is insignificant.
> 
> This series consists of two patches. The first patch makes a bulk change to
> add a new parameter to qemu_new_nic() and does not contain behavioral changes.
> The second patch actually implements MemReentrancyGuard update.

/me look at the 'net' API.

So the NetReceive* handlers from NetClientInfo process the HW NIC
data flow, independently from the CPUs.

IIUC MemReentrancyGuard is supposed to protect reentrancy abuse from
CPUs.

NetReceive* handlers aren't restricted to any particular API, they
just consume blob of data. Looking at e1000_receive_iov(), this data
is filled into memory using the pci_dma_rw() API. pci_dma_rw() gets
the AddressSpace to use calling pci_get_address_space(), which returns
PCIDevice::bus_master_as. Then we use the dma_memory_rw(), followed
by address_space_rw(). Beh, I fail to see why there is reentrancy
checks from this NIC DMA HW path.

Maybe the MemoryRegion API isn't the correct place to check for
reentrancy abuse and we should do that at the AddressSpace level,
keeping DMA ASes clear and only protecting CPU ASes?

