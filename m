Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0F65DFCB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 23:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471514.731388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDC5k-0005QG-6E; Wed, 04 Jan 2023 22:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471514.731388; Wed, 04 Jan 2023 22:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDC5k-0005Nj-1F; Wed, 04 Jan 2023 22:18:36 +0000
Received: by outflank-mailman (input) for mailman id 471514;
 Wed, 04 Jan 2023 22:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pDC5i-0005NX-8v
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 22:18:34 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a785ba-8c7d-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 23:18:30 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so86128864ejc.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 14:18:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a1709062e9100b007bd9e683639sm15718720eji.130.2023.01.04.14.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:18:28 -0800 (PST)
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
X-Inumbo-ID: b7a785ba-8c7d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ysHgPmEoM4C0MsKpxmajfVnShhx28Dsr3QVGstLB34=;
        b=VV0KG9555T9PoLAI8dAC21IQsnZ3lSR8DsLsgK/MtaWHYl/VxEiwDbH+RTDfrr5dQW
         WA4utGik6635RTmghS0a7WkHbgjPjuHiE+pO+hgiksDUq+n8V5BNHExlZHlUloYboqY7
         zrU8PN4gZjq2WnCGmIiIMR675pgNyuDdsxOet1Bt9y03U0vOuXBwptSClErZqrI/0bHR
         KFQQFiqETpzUcm2ka7wktHggBLgYZyP7Mvj21q6OfiyMwE7sHyIMp+Dz2BCx02mnBy6N
         5FNUZefTOV8iHE77uu4IjCU7RVsjQhh39eEJrTwmwNi2v/yN30VM+aOjm2Gsij5+8n96
         tXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ysHgPmEoM4C0MsKpxmajfVnShhx28Dsr3QVGstLB34=;
        b=yJX0MjuGvD6UQ9jmX2V71pklPnvolzEK9g79Qx+aDlFgeK8Tz45oYxU0w5Mh9UY7tr
         E3Lc1FtU5fjgwAjxetEKNY3WGXpBwLgQmzs1I2IAGqHgQiCRrAqi4oqRAAK9T7zuW9Hv
         XfSaDKUrUjgQ+K1hUeq6rGBbq7XSVciW4wW5d7IuOKhd1/JFjshZvtYnQJOKR5CYW1Ke
         glf94T3QVXDFEJVIXKl4lj0yAJ39BidEsXxYxPy116B5hF6XxaLXGnEB86lhoHJ4nWt4
         mfu3oGoRyPnT09vtiZJJ2FcWMFXFFOAcBNwT0QCtuvNNUZepWBuPj14/Yd4RdnUWlnxj
         uXig==
X-Gm-Message-State: AFqh2kqFRfWKeQ7dm3rp1dhH08/UMGT8hVf2oyChg7fFjJ67e3jRpKJO
	Ui+Ph4s6gQAOp4H4sNzg+HibBg==
X-Google-Smtp-Source: AMrXdXviPfF39VzEoGdqBpllgHy43HnZ0JUR7GccE1WHtt6JagF8scMFZzI1nxTausiLoRgwOJZm3A==
X-Received: by 2002:a17:906:94f:b0:7c1:4f7c:947f with SMTP id j15-20020a170906094f00b007c14f7c947fmr44428107ejd.72.1672870709605;
        Wed, 04 Jan 2023 14:18:29 -0800 (PST)
Message-ID: <877abde0-2e76-7fde-0212-eb7ce1384ea6@linaro.org>
Date: Wed, 4 Jan 2023 23:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
 <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
 <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 20:29, Chuck Zmudzinski wrote:
> On 1/4/23 1:48 PM, Philippe Mathieu-Daudé wrote:

>> Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
>> south bridge chipset, which expose a PCI-to-ISA bridge". A better
>> name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
>> device is named "PIIX3" with no indication of ISA bridge.
> 
> 
> Thanks, you are right, I see the PIIX3 device still exists after
> this patch set is applied.
> 
> chuckz@debian:~/sources-sid/qemu/qemu-7.50+dfsg/hw/i386$ grep -r PIIX3 *
> pc_piix.c:        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> 
> I also understand there is the PCI-to-ISA bridge at 00:01.0 on the PCI bus:
> 
> chuckz@debian:~$ lspci
> 00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)

All these entries ('PCI functions') ...:

> 00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
> 00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
> 00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
> 00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)

... are part of the same *device*: the PIIX south bridge.

This device is enumerated as #1 on the PCI bus #0.
It currently exposes 4 functions: ISA/IDE/USB/ACPI.

> 00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
> 00:03.0 VGA compatible controller: Device 1234:1111 (rev 02)
> 
> I also see with this patch, there is a bridge that is a PIIX4 ACPI at 00:01.3.
> I get the exact same output from lspci without the patch series, so that gives
> me confidence it is working as designed.

Historically the PIIX3 and PIIX4 QEMU models have been written by
different people with different goals.

- PIIX3 comes from x86 machines and is important for KVM/Xen
   accelerators
- PIIX4 was developed by hobbyist for MIPS machines

PIIX4 added the ACPI function which was proven helpful for x86 machines.

OS such Linux don't consider the PIIX south bridge as a whole chipset,
and enumerate each PCI function individually. So it was possible to add
the PIIX4 ACPI function to a PIIX3... A config that doesn't exist with
real hardware :/
While QEMU aims at modeling real HW, this config is still very useful
for KVM/Xen. So this Frankenstein config is accepted / maintained.

Bernhard is doing an incredible work merging the PIIX3/PIIX4 differences
into a more maintainable model :)

Regards,

Phil.

