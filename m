Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4A641F01
	for <lists+xen-devel@lfdr.de>; Sun,  4 Dec 2022 19:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453078.710740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1u6l-0007lZ-Ec; Sun, 04 Dec 2022 18:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453078.710740; Sun, 04 Dec 2022 18:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1u6l-0007jT-Bm; Sun, 04 Dec 2022 18:52:59 +0000
Received: by outflank-mailman (input) for mailman id 453078;
 Sun, 04 Dec 2022 18:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+kJe=4C=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p1u6j-0007jN-Hh
 for xen-devel@lists.xen.org; Sun, 04 Dec 2022 18:52:57 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0596f9-7404-11ed-91b6-6bf2151ebd3b;
 Sun, 04 Dec 2022 19:52:55 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id bp15so15358810lfb.13
 for <xen-devel@lists.xen.org>; Sun, 04 Dec 2022 10:52:54 -0800 (PST)
Received: from [192.168.1.53] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a2e9108000000b0026dffa29989sm888603ljg.23.2022.12.04.10.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 10:52:52 -0800 (PST)
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
X-Inumbo-ID: dc0596f9-7404-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r6gQQB1HCMusFGezDXaBPEjcTkGUvwcdpyzvmFhQQA=;
        b=A8ukTlA/9syAbG2nQMeawY/oTf/ToBROq3twK1bfxAfPCxbQ4dlsXT01HYXBZDhWES
         +8gExUj3UWzm7EN4GpvAoKFAeUD0SloRg9yWzP6xV7rL3wO6J2WP8iExt7NpeysfIFn3
         cq4ExtEbHB9K8OpvMTLk/5CZakoI/rc92QoDtuyR7sglacw9YtyzOF9KVmQTSjWESATE
         eKDAQZZ2tvmmpKRHa7q+BBp3mn/RZemY/Uf15pJsCnqdoIK6JKM3Pew3uxTIPHZT1vzI
         SGU2K9UALeJrBl0tNobzlxhknLYINNP3Zd7T4MtsKKATqxjgaRx2+DAk6A19r1tqAZpD
         Lryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9r6gQQB1HCMusFGezDXaBPEjcTkGUvwcdpyzvmFhQQA=;
        b=gNogiCl1e1uxaHAoDmBDp9mUr2CHvTalnCsct3URmiTb80RUJGz7dAoLuG/aQS9bH/
         HB856RlIB4/yQjKnIOHNqqiMyiuhjFXaG4Y7B3kRBj02EMpsw6Tf0ZhFllMhPEER8C39
         JEs52F50sao/zwHI4gBDwQNBK96MnXITkibUNW396Cs/BzZBZI3uHN5oqEj93iegBsrI
         9G8IABZAM1VnN+sF9aZG6BqLuNBYhO7+KTsD1ibNrRFJbTSVBHSKwcfWp1PRaJImgOYx
         kafuKpc8Oeaq/vDcaO2rVYKjICOnV+m4LWLbmf+7MYGJqDOn9IuOgUDV5Q7/Yda++XQ+
         J3xw==
X-Gm-Message-State: ANoB5plU3rvQYOv/5KyK8yZs3hNXqOU7NDr1n5kx753szuCjWHq8aRS2
	ML/aSEk1ZU1E0aisOe9npH8=
X-Google-Smtp-Source: AA0mqf4MW+9qJA0MdWcZ8D+ReCUqTXLu60Ieuly9TQ5o04gGjStzUULpuYU3YW49hdasnp4Eb0KGtg==
X-Received: by 2002:a05:6512:2c85:b0:4a2:5937:e9b with SMTP id dw5-20020a0565122c8500b004a259370e9bmr25249240lfb.11.1670179973341;
        Sun, 04 Dec 2022 10:52:53 -0800 (PST)
Message-ID: <4fbe5c89-4468-9ad4-e391-2f51ceaa5b67@gmail.com>
Date: Sun, 4 Dec 2022 20:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 3/3] docs: Add documentation for generic virtio devices
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xen.org, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <24a0278313ea9a9e6c093880dead835184025734.1667906228.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <24a0278313ea9a9e6c093880dead835184025734.1667906228.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.11.22 13:24, Viresh Kumar wrote:

Hello Viresh


[sorry for the possible format issues if any]

> This patch updates xl.cfg man page with details of generic Virtio device
> related information.


So as I understand current series adds support for two virtio devices 
(i2c/gpio) that require specific device-tree sub node with specific 
compatible in it [1]. Those backends are standalone userspace 
applications (daemons) that do not require any additional configuration 
parameters from the toolstack other than just virtio-mmio irq and base 
(please correct me if I am wrong).

Well, below just some thoughts (which might be wrong) regarding the 
possible extensions for future use. Please note, I do not suggest the 
following to be implemented right now (I mean within the context of 
current series):

1. For supporting usual virtio devices that don't require specific 
device-tree sub node with specific compatible in it [2] we would 
probably need to either make "compatible" (or type?) string optional or 
to reserve some value for it ("common" for the instance).
2. For supporting Qemu based virtio devices we would probably need to 
add "backendtype" string (with "standalone" value for daemons like yours 
and "qemu" value for Qemu backends).
3. For supporting additional configuration parameters for Qemu based 
virtio devices we could probably reuse "device_model_args" (although it 
is not clear to me what alternative to use for daemons).

Any other thoughts?

> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   docs/man/xl.cfg.5.pod.in | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 31e58b73b0c9..1056b03df846 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1585,6 +1585,27 @@ Set maximum height for pointer device.
>   
>   =back
>   
> +=item B<virtio=[ "VIRTIO_DEVICE_STRING", "VIRTIO_DEVICE_STRING", ...]>
> +
> +Specifies the Virtio devices to be provided to the guest.
> +
> +Each B<VIRTIO_DEVICE_STRING> is a comma-separated list of C<KEY=VALUE>
> +settings from the following list:
> +
> +=over 4
> +
> +=item B<compatible=STRING>

Shouldn't it be "type" instead (the parsing code is looking for type and 
the example below suggests the type)?

> +
> +Specifies the compatible string for the specific Virtio device. The same will be
> +written in the Device Tree compatible property of the Virtio device. For
> +example, "type=virtio,device22" for the I2C device > +
> +=item B<transport=STRING>
> +
> +Specifies the transport mechanism for the Virtio device, like "mmio" or "pci".
> +
> +=back
> +
>   =item B<tee="STRING">
>   
>   B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution



Also the commit description for #1/3 mentions that Virtio backend could 
run in any domain. So looks like the "backend" string is missing here. I 
would add the following:

=item B<backend=domain-id>

Specify the backend domain name or id, defaults to dom0.


P.S. I am wondering do i2c/gpio virtio backends support Xen grant 
mappings for the virtio? Have you tried to run the backends in 
non-hardware domain with CONFIG_XEN_VIRTIO=y in Linux?


[1]
https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
[2]
https://www.kernel.org/doc/Documentation/devicetree/bindings/virtio/mmio.yaml




