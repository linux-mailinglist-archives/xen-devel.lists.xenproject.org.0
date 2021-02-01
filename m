Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E804F30A545
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79720.145127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WMa-0003ia-2q; Mon, 01 Feb 2021 10:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79720.145127; Mon, 01 Feb 2021 10:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WMZ-0003iB-Vx; Mon, 01 Feb 2021 10:23:19 +0000
Received: by outflank-mailman (input) for mailman id 79720;
 Mon, 01 Feb 2021 10:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDK9=HD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l6WMY-0003i6-JJ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:23:18 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 12dd5824-b4e8-4722-9342-f1cd5d0785fe;
 Mon, 01 Feb 2021 10:23:16 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-GKx9rcpDMOOjuvzfoDn0SA-1; Mon, 01 Feb 2021 05:23:14 -0500
Received: by mail-wm1-f69.google.com with SMTP id y9so145772wmj.7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 02:23:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x9sm4234865wmb.14.2021.02.01.02.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:23:12 -0800 (PST)
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
X-Inumbo-ID: 12dd5824-b4e8-4722-9342-f1cd5d0785fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612174995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aJMOuyPSvjfhIQ04b1GIIwOFY3oexeLpV4TNKMqWiI=;
	b=Ig9VYT4nOehZv3vos89PLHQiUROwoBFC3GmOZTOLmVThxFAUppqdK+garDjTQuXq860h03
	lrTezMa/Wgvnz3t79nhbKzpQ/MBpxYN6NqIV5V6x/cRJQ5DB3sUgr5QrZIaMFqXkdgNx7v
	R7ZmsQJ8c6YaiTcdlNQ7r4gphhHRWow=
X-MC-Unique: GKx9rcpDMOOjuvzfoDn0SA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5aJMOuyPSvjfhIQ04b1GIIwOFY3oexeLpV4TNKMqWiI=;
        b=jEZRYL3Qne6GwumK1zONhmxV0A+7sfpH1coxpoNiU7wJI8Pnh+N9UpyjA46LQA0nLU
         1lJHDezWleSO2ixiWmeTfsULfVF6Bq2xctf/fEV/L8vobjEeNUnHwK9xQmPWTXM1qfbo
         7YfB28IPI0craCc4jemUiWKbtBd9Ma8LnqJ139XHJj0RtL4cBX4/t9isgddOOFBHdK0g
         wyVGpXlKzn+OM0qDYZTZuQyllpabJ4ZTVO2ATl6hRWqyBEkoFMV474avnugIf89u+FrB
         pphUGl5VF3F8/Tz3zRNXHBYYAz78s7d3YyvrV1TxrPItNPOir4HLWCnLKJ0HXurnDeZq
         DWlg==
X-Gm-Message-State: AOAM53363JlO6oRhna0vXtFTsznu97n1JOsQhTK0JJnqa2bbwxn60Ns/
	1XhRSfoTIyBUn3LrD76GBTvwBWxkzn3k+luA3u2IoJnwHIrsC8FccA/m12IPcYzb2vQFSlKjS05
	E0zKfc/2A3uTaWTcILm/j3HFutovj8tWIg8oPRs7dhpGGT+HDEqprttbpMC7MfQeHe7GYnrZDNB
	dh79U=
X-Received: by 2002:adf:8b47:: with SMTP id v7mr1554771wra.133.1612174993047;
        Mon, 01 Feb 2021 02:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRiU0yK4wM7pHxMScsrUEJgrMLA/P5aBurhjGx5cZ0jxtB++LorBC//x8+uxwvN9hX5go09A==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr1554744wra.133.1612174992844;
        Mon, 01 Feb 2021 02:23:12 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
 <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
 <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50306fbf-c6f0-e281-248f-de1bc984b113@redhat.com>
Date: Mon, 1 Feb 2021 11:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/02/21 10:18, Philippe Mathieu-Daudé wrote:
> FYI using 'imply FSDEV_9P' instead I get:
> 
> /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
> `xen_be_register_common':
> hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'

Ok, so then we have the case of a file (hw/xen/xen-legacy-backend.c) 
brought in by CONFIG_XEN.  In that case this patch is incorrect...

> The function is:
> 
>    void xen_be_register_common(void)
>    {
>        xen_set_dynamic_sysbus();
> 
>        xen_be_register("console", &xen_console_ops);
>        xen_be_register("vkbd", &xen_kbdmouse_ops);
>    #ifdef CONFIG_VIRTFS
>        xen_be_register("9pfs", &xen_9pfs_ops);
>    #endif
>    #ifdef CONFIG_USB_LIBUSB
>        xen_be_register("qusb", &xen_usb_ops);
>    #endif
>    }
> 
> The object is compiled using:
> 
> -- >8 --
> -#ifdef CONFIG_VIRTFS
> +#ifdef CONFIG_FSDEV_9P
>       xen_be_register("9pfs", &xen_9pfs_ops);
>   #endif
> ---

... and this is the best fix, together with:

- a "#include CONFIG_DEVICES" at the top (to get CONFIG_FSDEV_9P)

- moving xen-legacy-backend.c from softmmu_ss to specific_ss (to get 
CONFIG_DEVICES)

- changing "select" to "imply" in accel/Kconfig (otherwise the patch has 
no effect)

But really, doing nothing and just dropping this patch is perfectly fine.

Paolo


