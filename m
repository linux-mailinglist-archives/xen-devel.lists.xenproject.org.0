Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656BA308DF2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 21:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78478.142778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zxh-0008JV-Kd; Fri, 29 Jan 2021 20:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78478.142778; Fri, 29 Jan 2021 20:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zxh-0008J7-HI; Fri, 29 Jan 2021 20:01:45 +0000
Received: by outflank-mailman (input) for mailman id 78478;
 Fri, 29 Jan 2021 20:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfjn=HA=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l5Zxg-0008Iz-2V
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 20:01:44 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5119a59f-28b7-4b75-9010-dcdc6574e19f;
 Fri, 29 Jan 2021 20:01:43 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-88-6keuMNXWyOWXzubWLeQ-1; Fri, 29 Jan 2021 15:01:41 -0500
Received: by mail-ed1-f69.google.com with SMTP id f4so5462635eds.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 12:01:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a22sm5083124edv.67.2021.01.29.12.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 12:01:38 -0800 (PST)
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
X-Inumbo-ID: 5119a59f-28b7-4b75-9010-dcdc6574e19f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611950503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XX+ykdl9ts6jQuVV/cBxZAvPSn3+goydXU0pGt7Dz5o=;
	b=hXo0U3kaVTCNk/9q6gCyht51WozfU+Tfq8du7kmdkNCGLOHdcUyBm+g12/iHsHehOuo4MM
	PGKrNrGRNbjcufFjOGe4i2fHeh/lfVowcDZmTn3jY4D9yjes1ZwMSXo8CSJG1tfodlmI6E
	wtFd7nMIA81ueppG1siL/2WAorkkr4E=
X-MC-Unique: 88-6keuMNXWyOWXzubWLeQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XX+ykdl9ts6jQuVV/cBxZAvPSn3+goydXU0pGt7Dz5o=;
        b=PLXKcOp8Pd3qweOwmSg1SjO9+V/CTzFEbEDfWoIeNrGeHSS4zldDUNPnZOSIyt/D31
         jc+znaufsdT27BYv4RMvjVkLfqmhRqeIks7W+6lofFsLrouHDEIbUpmWe0T4DF18neoS
         UoqUR18SLtMTK9Eop+1vMKQRxN1uhccpvc22AVe7Kcz/47TCCwfjqDv+Lydd9HFwhEqb
         xx3VYTJBGf8noKYJ9fnO15f4NDIQBlLC8VaQ3HHBge2A7g0Xm6lKOwC8FGaNaDfFcMY6
         mOeQxJNs7t6wyqDphkUfZDBgl0UOoDLHWeYODe0nmIFGFrLrI4pxChapiiKD4eLkCgsV
         0tHA==
X-Gm-Message-State: AOAM530xYn2/jf4O6sttPXh/KRtZ+NhA/AmNWQTpeLegXnH0QmhIow0v
	W8QnmQvUteeUwyBy/jNYotvQHyXk75y1GcV32la8ezB+PUrTp+dKN8WLkhIeeUulHEBQ2/FZ6Xi
	IVaCxC3WH7wChM8uiOheVfYc8k+rAdyximVxkL8DefCtk85n6n/LlTsa3/9jGuafwPn/jmTaF3k
	dxFUU=
X-Received: by 2002:a05:6402:558:: with SMTP id i24mr7147862edx.141.1611950499594;
        Fri, 29 Jan 2021 12:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVNI8v1QDdEme3HQH7Sas86efflD76xf+vmPDm8tutllEho3ZH2nSFtDKX2fvmwWqwPC+JVw==
X-Received: by 2002:a05:6402:558:: with SMTP id i24mr7147830edx.141.1611950499408;
        Fri, 29 Jan 2021 12:01:39 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] hw/xen/Kconfig: Introduce XEN_PV config
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-4-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <036c1da5-894f-0111-4169-b5e904367eae@redhat.com>
Date: Fri, 29 Jan 2021 21:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129194415.3925153-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
> xenpv machine requires USB, IDE_PIIX and PCI:
> 
>    /usr/bin/ld:
>    libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>    hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
>    hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
>    hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
>    hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/Kconfig     | 1 +
>   hw/xen/Kconfig | 6 ++++++
>   2 files changed, 7 insertions(+)
>   create mode 100644 hw/xen/Kconfig
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 5ad3c6b5a4b..f2a95591d94 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -39,6 +39,7 @@ source usb/Kconfig
>   source virtio/Kconfig
>   source vfio/Kconfig
>   source watchdog/Kconfig
> +source xen/Kconfig
>   
>   # arch Kconfig
>   source arm/Kconfig
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> new file mode 100644
> index 00000000000..15944144a17
> --- /dev/null
> +++ b/hw/xen/Kconfig
> @@ -0,0 +1,6 @@
> +config XEN_PV
> +    bool
> +    depends on XEN
> +    select PCI
> +    select USB
> +    select IDE_PIIX
> 

Since you're hacking around you can also "select ISA_BUS" here, but the 
right solution would be to have a "config XEN_FV" and leave 
hw/i386/xen/xen_platform.c out of XEN_PV.

Paolo


