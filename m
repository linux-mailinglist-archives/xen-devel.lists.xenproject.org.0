Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8AB99908
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 13:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129301.1469315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NZv-0007z3-CG; Wed, 24 Sep 2025 11:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129301.1469315; Wed, 24 Sep 2025 11:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NZv-0007wo-9Q; Wed, 24 Sep 2025 11:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1129301;
 Wed, 24 Sep 2025 11:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R8Be=4D=redhat.com=clg@srs-se1.protection.inumbo.net>)
 id 1v1NZt-0007wi-RN
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 11:22:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c06424c1-9938-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 13:22:28 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-7O7_IitvOie3eLey579gAg-1; Wed, 24 Sep 2025 07:22:23 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ee13e43dd9so2807472f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 04:22:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2aae3d58sm30912385e9.21.2025.09.24.04.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 04:22:21 -0700 (PDT)
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
X-Inumbo-ID: c06424c1-9938-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758712947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KQXPYLh+of7Gb6x92qz6TH1PpHfEJDOd50U9lMltvh8=;
	b=YypqHN1NfLTTsxuBzFLtC+4aR0shp0FJA4DYFxtJp1lg+xBm+Zu3SVfGtXE6byoUre4zb1
	UDqE72ySq3u+WSQ6OOD8kBifrfx8Diw8rEe0z8JGqCZaIyr4A13/lvjTj7MidYoJLFF55/
	y+As8CMt7TRLNXGxRg7xf+mXajg3F9Q=
X-MC-Unique: 7O7_IitvOie3eLey579gAg-1
X-Mimecast-MFC-AGG-ID: 7O7_IitvOie3eLey579gAg_1758712943
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758712942; x=1759317742;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQXPYLh+of7Gb6x92qz6TH1PpHfEJDOd50U9lMltvh8=;
        b=ty63CHjAz5oMnHr4ngZBcd8UWXmHf5KLyQxDMmTyE2I3KcFeGYF6XSik1r9bW3PB5Q
         7fBZNqYX603VdeWHvLzQ0bjT5UBp9oF5SCmCkJWUlyytP5DHggAD9E589e6SM4HRSFOW
         quxXS9LlkMiUAuoMaPH5v7kyX3C0V0AQ2l3nzIfJQwIcapwu7cWlb6DFKjQjXi7BzOSN
         7E3w6b4XWKZrnD/g6llYByjNLTZI+RdJX58S6ewnfr6hFcY0l3TH4zTVTUWjHkN+IiyE
         OH/wNBfiZhGYt4guLGF77KWrkfZzsadm8l4IuN1rq2FmbC5VXB9T+EzwYBEbI4y1rAX4
         yarw==
X-Forwarded-Encrypted: i=1; AJvYcCVBvBs+ptl19CA840ctz65n/1GGNwiPcLmS1nFuTOpJCvyZ/RpUiXpe+KqEpLC5IUjr2BX0VsZQqL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu0mXrjPFlIvcm9Q4w7Hipm6zU+T/Eo7gTSNlhrHmusI4EAjZX
	CqCiCghiRhhxUxLFxHewB+8oS1lb1DJSL/HOUuc8L/CCvyyu7yiSRN/Cw4ux5muGjxcMS+EAFbE
	H30W6IfNVlTR/8Xek2WAF+wXaqX92Jb7uhpsA8SCo5H5mc68fRvjRM7Q6cH3t3QzGSahr
X-Gm-Gg: ASbGncucchKhzd3iItZ+4h7nwNrm6kSxsBLK1A5S2nira86ZYrMUAwcgvgDgXZjjSnI
	jJUOnaueCtJFW0ozPGeH2MPDgJBmjknfvo4hfMSXMUmJRNFCMglBN7N+datpHe+5YGZlEQW6pFU
	AUdIcpNklVfY6/3JAgIYBmz1ZpF63/Ljj7PT+qDnLQuqVOa4w/lXG9/FcLR8VRUGm7ms6bexrct
	R/NWGu0MI1wRsdwcI8gvV+XTU5mlZ5pHUazvm4opcup+ldPmTittFgqwcrdlJhM6GiZRPwf0xmE
	jG00udqYrDu6iZ5lzB/WS7oJZTzCzkeKlL04yNXD4uesaep1AQCb3CmGp/Vi5t4ejxiDesu3hQu
	rEz0=
X-Received: by 2002:a05:600c:1c27:b0:46d:7fa2:7579 with SMTP id 5b1f17b1804b1-46e1d97f519mr61733495e9.9.1758712942615;
        Wed, 24 Sep 2025 04:22:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4zxIdqb0bQt7+O6bR7wlR8dDmENCHycIYRfk3vyL1fyeHgFfcRcxjXOAAR51hT9R4ZdiPfA==
X-Received: by 2002:a05:600c:1c27:b0:46d:7fa2:7579 with SMTP id 5b1f17b1804b1-46e1d97f519mr61732805e9.9.1758712942128;
        Wed, 24 Sep 2025 04:22:22 -0700 (PDT)
Message-ID: <2e5a20cd-7ea6-44fd-9401-82e741a089ff@redhat.com>
Date: Wed, 24 Sep 2025 13:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] vfio/pci: Do not unparent in instance_finalize()
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Yanan Wang <wangyanan55@huawei.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Rikalo
 <arikalo@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250924-use-v4-0-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
 <20250924-use-v4-2-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250924-use-v4-2-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SchNzHXNnjs-JEJIRyJ-edVWWGAnq8Bdlz9h_-cIM-A_1758712943
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/25 06:37, Akihiko Odaki wrote:
> Children are automatically unparented so manually unparenting is
> unnecessary.
> 
> Worse, automatic unparenting happens before the insntance_finalize()
> callback of the parent gets called, so object_unparent() calls in
> the callback will refer to objects that are already unparented, which
> is semantically incorrect.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/vfio/pci.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index d14e96b2f82d..bc0b4c4d562b 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2025,7 +2025,6 @@ static void vfio_bars_finalize(VFIOPCIDevice *vdev)
>           vfio_region_finalize(&bar->region);
>           if (bar->mr) {
>               assert(bar->size);
> -            object_unparent(OBJECT(bar->mr));
>               g_free(bar->mr);
>               bar->mr = NULL;
>           }
> @@ -2033,9 +2032,6 @@ static void vfio_bars_finalize(VFIOPCIDevice *vdev)
>   
>       if (vdev->vga) {
>           vfio_vga_quirk_finalize(vdev);
> -        for (i = 0; i < ARRAY_SIZE(vdev->vga->region); i++) {
> -            object_unparent(OBJECT(&vdev->vga->region[i].mem));
> -        }
>           g_free(vdev->vga);
>       }
>   }
> 



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



