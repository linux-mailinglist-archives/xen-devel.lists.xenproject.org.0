Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943532006DA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 12:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmEST-0001va-LQ; Fri, 19 Jun 2020 10:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Qeh=AA=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jmESS-0001vV-6M
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 10:41:16 +0000
X-Inumbo-ID: 65dc4f8e-b219-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 65dc4f8e-b219-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592563273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1BMxPj6jvkgxEoqHhhNw20WQP+13803h1hAdaccBo/Q=;
 b=Ne9hFeiy016cmj+16acc/AtARExfJerAPRWtukMSavBUmlPR8O7I0Dz+/ViZfsifhTk/Fx
 HYn6sqmTL71fOoBM0qnRyA5zUJEMGl+uLYVQYQmumk92CLyGUd7cDqKfVhQm1nBv4z/Lo8
 UR2mEr+kjDNg5Q396zeISeVIGBuE4O4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-SzAsRwlgO6W1a9iqSi722w-1; Fri, 19 Jun 2020 06:41:12 -0400
X-MC-Unique: SzAsRwlgO6W1a9iqSi722w-1
Received: by mail-wm1-f70.google.com with SMTP id u15so2535550wmm.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 03:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1BMxPj6jvkgxEoqHhhNw20WQP+13803h1hAdaccBo/Q=;
 b=HXryhGFLBY05Em0M9bn6n/y4N6V3TBgB6yWQkSdZ6tcvJkesl6EqkAoH/VU1JIsUNB
 Aqwo5ArZ245YDn6qU9sJL5513JkFfXlLLuksa8T5iYiXJG2K42X67U3jkc0BU482bNNk
 Crp28ZK2xRxDpyrMJkDHpFWw93c/raAZOrYj9d0xSLcHy7KAbaICNr4yiRdJREEO+Dvr
 Fgpv/pK0KmTMIZrSlwm15bWtloObjPkfmZrbUygTw3LKhi4lq6oqXUZLZZmSKLvspuSP
 I7qBxs0R9sNvosZu0zWiOTy117SKMoTXZDLQdEhgc1osr27jyBCX2TclwqzJ0tIBIwB1
 7P5w==
X-Gm-Message-State: AOAM5332WzeX+RMZ34IAt/9w8qlHs86G6JOp0t/2Jxgiwdfo9EwfqW/Y
 vIYdpZV6P62SGvWEGVUJnooldrArjoCpXq1IQ55cm97G/uBSJODM3+e7FdV1PWcD4vdLPDiAr8x
 ylbfVNulL95Qmw+hAtDy6mHNTgso=
X-Received: by 2002:a1c:408:: with SMTP id 8mr2998293wme.15.1592563270875;
 Fri, 19 Jun 2020 03:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysr9XU0u8Oe1wPyRQ/8NIjEzFmaKRLuA+Bks786+y4wSunuhXx2jSFnMskrfFEi6CWBCEgTg==
X-Received: by 2002:a1c:408:: with SMTP id 8mr2998284wme.15.1592563270692;
 Fri, 19 Jun 2020 03:41:10 -0700 (PDT)
Received: from [192.168.1.37] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id 30sm2018044wrm.74.2020.06.19.03.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 03:41:10 -0700 (PDT)
Subject: Re: [PATCH] xen: Actually fix build without passthrough
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20200619103115.254127-1-anthony.perard@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <3d2f13ca-abb3-1e96-8fa2-cc9c462c58ed@redhat.com>
Date: Fri, 19 Jun 2020 12:41:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200619103115.254127-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/19/20 12:31 PM, Anthony PERARD wrote:
> Fix typo.
> 
> Fixes: acd0c9416d48 ("xen: fix build without pci passthrough")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  hw/xen/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> index 3fc715e5954d..502b32d877a0 100644
> --- a/hw/xen/Makefile.objs
> +++ b/hw/xen/Makefile.objs
> @@ -4,4 +4,4 @@ common-obj-y += xen-legacy-backend.o xen_devconfig.o xen_pvdev.o xen-bus.o xen-b
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt_load_rom.o
> -obj-$(call $(lnot, $(CONFIG_XEN_PCI_PASSTHROUGH))) += xen_pt_stub.o
> +obj-$(call lnot,$(CONFIG_XEN_PCI_PASSTHROUGH)) += xen_pt_stub.o

Uh...

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


