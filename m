Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B212BFACE7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 10:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147688.1479870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBTux-0008HU-Dq; Wed, 22 Oct 2025 08:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147688.1479870; Wed, 22 Oct 2025 08:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBTux-0008Fp-BB; Wed, 22 Oct 2025 08:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1147688;
 Wed, 22 Oct 2025 08:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vj3f=47=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBTuw-0008Fj-Hm
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 08:09:58 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78616883-af1e-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 10:09:45 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4711810948aso45686485e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 01:09:45 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b985esm24733044f8f.34.2025.10.22.01.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:09:43 -0700 (PDT)
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
X-Inumbo-ID: 78616883-af1e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761120585; x=1761725385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5W3vw0dKWSTSqpjqiTpD1sBd7qgaB5sDy0DD3Bgxoo=;
        b=Bk0VdpgS6KO3zyJoADF2r+nyPTnH/bkhtiZSSvq6kYhcXl5VPRLm0gWF0Tm19Axtac
         i7h+rlj3nQaGjJWtvxwd8Yd9/SHLs+Z2U5l6q6jexrhko/MgHZ64aj12fNrhRtH748pa
         DgTiF9Hk5qhh/WcaaiBEfz8w8ZiF7Ed0HY1h4rXzDAqAkDvFgEDyODBOjOJOPu0dwGJ3
         zRoHOFz3xX+EfcPaP0I8IkrRBBeWGQTK7nm4zEmSLS8gQpqZ0Ez18lgDpA8NSQXLHUi7
         4UJp+MHFDQa/em9GDuFMmbVyIP+V9vu9a7SNH7dz2MAdK0ks4VLjB5R3RbDbqH2elR8I
         N8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120585; x=1761725385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5W3vw0dKWSTSqpjqiTpD1sBd7qgaB5sDy0DD3Bgxoo=;
        b=pdifvdX4GzY0VPbJt9e/TAdJb2o15Hye6PbqsA6gqph+zwdzB6MbY5WN2Nu1H/fDPD
         U8jJW4xDFIsg+Ea9iuzCIEc62zb6RgPD8duI/xf2M1llNgg8xkdKJZzUp8I9HpZJ4mle
         eY5nNwI0YHZR9AQ+Z3hyynIP8ue31L0Rge75Hw0863s6nV5ufvgfZoPj4TA/KLjXD+ft
         bLp23X2xrVCG6rf6uII6juU/aveauh/bosP5hiR8B7jUZT1IMk4eNXIljrAu3Ib4mZDO
         BJ7O7APGkRPV2NttK8uEzqIf6Kf5pjQ2IZ/7CJRudSaNpkmXIMDtGS87or21y+v+Hc3X
         Gxrw==
X-Forwarded-Encrypted: i=1; AJvYcCV2kVJ9F5dz52g+9/3TWj3eVsttKlLLiTjgGw6WtgcUEKCYi05sNMAd63R479KH7TEZgnaXaSpHtsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvXZsKf091/Mn1HgPA5NDpyQL8Beb832EZ2sznWQXyrbI4CWdz
	CtvFN+pBGZ9uRzFcnZFN2yJavx+hU7YOP8oQ9sH3vNnXnoztMDfXllWyfu8h2Y4q8ME=
X-Gm-Gg: ASbGncvUOMVPKsVW0kIHtKQgYjT7DBL4Fwfs+mkKqZN/KuA+iXzLPnjSGiuYvSPrCun
	iwefnVbvNDnath2ihZ5ZcupEnQhrCkV94qzWm8/6SM8ynOr1+YI2nXywJT3t8NkgXkUuSWMfBVO
	lao88NX3Yirl/uZ5u0jvJaO7ni2ALKAIPHv0KwRwaPSzECn9TJ75jbl3D4AH0O5s4T8fJu2JGJY
	NmqhtAtGwKXgtoir1GiNwNRIPQoJXUszwylp/RSe4rXkLGXowLUoYXGbXTXmzzcWZr08RiYLp5G
	gL9aCVGwQsMYW1oV81vrFZZOxTojg9fnITpJuHIOBhbnhvoAKBjB9jdYhJ2bf3DHPsGsGPyvHp8
	cnkG4srSQ+SnRhw7PY5nw2wDVGWCmhBWxeI8W5v6YvM+V9GakvM8y1NcgFA+PD7CLcm7dNAXmXe
	+7KbGQ28YqFtIhblVp7SAs9xnJd7jr9RIvORKWIv/LgI+Ztr6v2DRD8BC8pSLTXPNY
X-Google-Smtp-Source: AGHT+IG5BpeXiJ6nHMocdx8fLCUYDlkFMY0PuWuFCGQMHFAZ8n3dQ7nToTymecUtEebWDB9IZS4Cfw==
X-Received: by 2002:a05:600c:3149:b0:470:bcc4:b0a0 with SMTP id 5b1f17b1804b1-47117925919mr168171395e9.34.1761120584565;
        Wed, 22 Oct 2025 01:09:44 -0700 (PDT)
Message-ID: <36b8e200-10ab-48b0-beda-9ca2c42f2b48@linaro.org>
Date: Wed, 22 Oct 2025 10:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] char: rename CharBackend->CharFrontend
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Corey Minyard <minyard@acm.org>,
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Vijai Kumar K <vijai@behindbytes.com>,
 Samuel Tardieu <sam@rfc1149.net>, Gustavo Romero
 <gustavo.romero@linaro.org>, Raphael Norwitz <raphael@enfabrica.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Zhang Chen
 <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>,
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
References: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/10/25 09:46, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The actual backend is "Chardev", CharBackend is the frontend side of
> it (whatever talks to the backend), let's rename it for readability.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   chardev/chardev-internal.h           |  12 +-
>   include/chardev/char-fe.h            |  67 +++++----
>   include/chardev/char.h               |   4 +-
...

> diff --git a/chardev/chardev-internal.h b/chardev/chardev-internal.h
> index 9752dd75f7..8ea10414ab 100644
> --- a/chardev/chardev-internal.h
> +++ b/chardev/chardev-internal.h
> @@ -37,9 +37,9 @@
>   struct MuxChardev {
>       Chardev parent;
>       /* Linked frontends */
> -    CharBackend *backends[MAX_MUX];
> -    /* Linked backend */
> -    CharBackend chr;
> +    CharFrontend *frontends[MAX_MUX];
> +    /* frontend of the underlying muxed chardev */
> +    CharFrontend chr;
>       unsigned long mux_bitset;
>       int focus;
>       bool term_got_escape;
> diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> index 8ef05b3dd0..7901856f95 100644
> --- a/include/chardev/char-fe.h
> +++ b/include/chardev/char-fe.h
> @@ -8,12 +8,12 @@ typedef void IOEventHandler(void *opaque, QEMUChrEvent event);
>   typedef int BackendChangeHandler(void *opaque);
>   
>   /**
> - * struct CharBackend - back end as seen by front end
> + * struct CharFrontend - Chardev as seen by front end
>    * @fe_is_open: the front end is ready for IO
>    *
>    * The actual backend is Chardev
>    */
> -struct CharBackend {
> +struct CharFrontend {
>       Chardev *chr;
>       IOEventHandler *chr_event;
>       IOCanReadHandler *chr_can_read;
> @@ -27,53 +27,52 @@ struct CharBackend {
>   /**
>    * qemu_chr_fe_init:
>    *
> - * Initializes a front end for the given CharBackend and
> - * Chardev. Call qemu_chr_fe_deinit() to remove the association and
> - * release the driver.
> + * Initializes the frontend @c for the given Chardev backend @s. Call
> + * qemu_chr_fe_deinit() to remove the association and release the backend.
>    *
>    * Returns: false on error.
>    */
> -bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp);
> +bool qemu_chr_fe_init(CharFrontend *c, Chardev *s, Error **errp);

IMO even clearer for this API would be to use:

   bool qemu_chr_fe_init(CharFrontend *fe, Chardev *be, Error **errp);

and update documentation accordingly.

>   
>   /**
>    * qemu_chr_fe_deinit:
> - * @b: a CharBackend
> + * @c: a CharFrontend
>    * @del: if true, delete the chardev backend
>   *
> - * Dissociate the CharBackend from the Chardev.
> + * Dissociate the CharFrontend from the Chardev.
>    *
>    * Safe to call without associated Chardev.
>    */
> -void qemu_chr_fe_deinit(CharBackend *b, bool del);
> +void qemu_chr_fe_deinit(CharFrontend *c, bool del);
>   
>   /**
>    * qemu_chr_fe_get_driver:
>    *
> - * Returns: the driver associated with a CharBackend or NULL if no
> + * Returns: the driver associated with a CharFrontend or NULL if no
>    * associated Chardev.
>    * Note: avoid this function as the driver should never be accessed directly,
>    *       especially by the frontends that support chardevice hotswap.
>    *       Consider qemu_chr_fe_backend_connected() to check for driver existence
>    */
> -Chardev *qemu_chr_fe_get_driver(CharBackend *be);
> +Chardev *qemu_chr_fe_get_driver(CharFrontend *c);
>   
>   /**
>    * qemu_chr_fe_backend_connected:
>    *
> - * Returns: true if there is a chardevice associated with @be.
> + * Returns: true if there is a backend associated with @c.
>    */
> -bool qemu_chr_fe_backend_connected(CharBackend *be);
> +bool qemu_chr_fe_backend_connected(CharFrontend *c);

LGTM otherwise!

