Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F920F822
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 17:20:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqI3J-0006Fk-2r; Tue, 30 Jun 2020 15:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sbHC=AL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jqI3H-00062X-HB
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 15:20:04 +0000
X-Inumbo-ID: 2ad5f906-bae5-11ea-864a-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2ad5f906-bae5-11ea-864a-12813bfff9fa;
 Tue, 30 Jun 2020 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593530401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3Q68uV4NKCffVlEx9DmYr8Tcy2UpV4TM2zGQR62nl10=;
 b=EeNwzWoKOg0m2RVZu6dcT/Ll34IavyPy5Qf0pYYznrMqsq5Itgd/VOyOCGlLA4KOf0W33T
 JzD6TjJpzpoUhWRv7U37UrgHu7OLgwEPigNRcWXySnmstZiBNMpj71TS850bBBAESJLGfb
 +nKOpr2EM7VaTlkl78IZ3TZKQwj4wPk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-6gHfxwZ-M3Cs-gVDEWjYDw-1; Tue, 30 Jun 2020 11:19:56 -0400
X-MC-Unique: 6gHfxwZ-M3Cs-gVDEWjYDw-1
Received: by mail-ed1-f71.google.com with SMTP id v8so10500734edj.4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 08:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3Q68uV4NKCffVlEx9DmYr8Tcy2UpV4TM2zGQR62nl10=;
 b=FBT/ntQWWgiQukk2ZNfXA7Wnof5ytcV5wEfq0TQ+EsfeTsXOwwKonGs/JIP4j5wwMd
 nOCB0hOL7IJyeiqEv6HnY9v1BMXptIPEaiWhMR6Azqq3s2cKR4OxKCaUJmdUajQB8AuN
 mQgCX65euqQQNLWU+TKXys/Can/FYCCFRAqGfUAy8RHIFawx5aWZMWQow3e3XABMVpeu
 oJLppjXmhxRXb9QCiQhd6CeyehB4FnJkTXhrsB5EWg1TWDwOoDgQcbRv0Bx8eEX97Q5H
 /6npUj7hX/SeIldOgi32968HiMz2qHAStZeyVXrHFatrkih/grT+te3dxP2TH20hL1He
 d2Aw==
X-Gm-Message-State: AOAM533OvJTbSJsekHS2J0QVdbVZW4pvDIkCTr9bJiUm9fYaSX+JemE2
 dz1ByklWlRvgjGoI0VVt/3T592NtX0TNhZCmptJ/NsbhKA3AI74cyWe42fftfcICaUtGFK1JOrw
 O3wrrk/xx9l06T4dWXfWP/96Qk34=
X-Received: by 2002:a17:906:4086:: with SMTP id
 u6mr20093275ejj.9.1593530395530; 
 Tue, 30 Jun 2020 08:19:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx968WRLbUisR+Ua1av2ZFZrg5txPJ4uxePXOJef4L9Vgi/0Ql6VBEd7JzAxiIPxCPm9IU36A==
X-Received: by 2002:a17:906:4086:: with SMTP id
 u6mr20093262ejj.9.1593530395330; 
 Tue, 30 Jun 2020 08:19:55 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id k15sm2231802eji.49.2020.06.30.08.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 08:19:54 -0700 (PDT)
Subject: Re: [PATCH 1/2] xen: fix legacy 'xen-sysdev' and 'xen-backend' bus
 types
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 qemu-devel@nongnu.org
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-2-paul@xen.org>
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
Message-ID: <ee15f95a-ef85-8246-f10d-2778baa343c7@redhat.com>
Date: Tue, 30 Jun 2020 17:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200624121841.17971-2-paul@xen.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/24/20 2:18 PM, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> 'xen-sysdev' plugs into the 'System' bus type, not 'xen-sysbus. That bus type
> is what 'xen-backend' plugs into.
> 'xen-sysdev' is drived form 'sys-bus-device' so the bus type need not be
> overridden. 'xen-backend' is derived from 'device', which plugs into the
> generic 'bus' type, so its bus type should be overridden to 'xen-sysbus'.
> 
> Without this patch, the following assertion will fail:
> 
> qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> failed.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Fixes: 81cb05732efb ("qdev: Assert devices are plugged into a bus that can take them")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> ---
>  hw/xen/xen-legacy-backend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 2335ee2e65..c5c75c0064 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      /* xen-backend devices can be plugged/unplugged dynamically */
>      dc->user_creatable = true;
> +    dc->bus_type = TYPE_XENSYSBUS;
>  }
>  
>  static const TypeInfo xendev_type_info = {
>      .name          = TYPE_XENBACKEND,
> -    .parent        = TYPE_XENSYSDEV,
> +    .parent        = TYPE_DEVICE,
>      .class_init    = xendev_class_init,
>      .instance_size = sizeof(struct XenLegacyDevice),
>  };
> @@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      device_class_set_props(dc, xen_sysdev_properties);
> -    dc->bus_type = TYPE_XENSYSBUS;
>  }
>  
>  static const TypeInfo xensysdev_info = {
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


