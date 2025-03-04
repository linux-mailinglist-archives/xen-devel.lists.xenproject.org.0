Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57AA4E151
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 15:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901204.1309189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTSi-0007iF-GW; Tue, 04 Mar 2025 14:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901204.1309189; Tue, 04 Mar 2025 14:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTSi-0007fr-Dt; Tue, 04 Mar 2025 14:41:36 +0000
Received: by outflank-mailman (input) for mailman id 901204;
 Tue, 04 Mar 2025 14:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wukS=VX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tpTSh-0006DV-4L
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 14:41:35 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5004b93-f906-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 15:41:34 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abf4d756135so542887466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 06:41:34 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1e152fdd4sm239863066b.176.2025.03.04.06.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 06:41:33 -0800 (PST)
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
X-Inumbo-ID: c5004b93-f906-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741099294; x=1741704094; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOq2unFrF81Uzistv6gqc5mzCn6FDMKefHbm6FP9QEM=;
        b=OLSDSgwW//FB8v6dY7dWoL+yp4an059y3XQ1QEfMz0Y2M7aq27uFo4/lWQUMaErr1Z
         2NQZwGmPxo6esXaYfpxohlMYgY8d5zpDvSFURxuS2TT9MK2ezlWya8t2rKWB52CWpfN6
         uVUkndCT0XyxRoC2Yghpjd6HGQ+l8cXqC3eLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099294; x=1741704094;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DOq2unFrF81Uzistv6gqc5mzCn6FDMKefHbm6FP9QEM=;
        b=uyvO1CSma2Cm78tfwwqWVSlf5yv4OU17InYfJ5ejiTbYFr3NoJU7y2C1jDUQzZI66H
         1CU7JSDFfT/Kknadf0+H9vqLGwMLEUShVoW308909YpTRTIovSuh6xvnRS9c1sj8Y4q6
         rKt90QAW8zk5biFzsqM48fd/51c08VXm9mJ6ByKXHZWF5a3TWLCfXrfzQqS7h3X/LXhE
         eB8Y7jXLeSQ5X0vmM4KcqY5A+w1fdxwcZ78ZC0NEMdl3oRPy76bcqNDX2Xqe81Xw8CFA
         bZ82mT/tB0A2ZHb+PRDr/Z6Az8XZKKI5E/0rhd/WsT9c7qjEnOeOh21jWXaXWFnk4qhy
         +zQw==
X-Forwarded-Encrypted: i=1; AJvYcCU/gkPIELO9xuN/9acej+q5bC6ieox4vyb49VAi54aXlKu8HMSjerbB6BOvKqdCTP/O2P6Afx64q8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwDdpFSNJJ76NwIGuQjQ8mL858iL67+tqaaWqYBGFvoa+kgjR0
	1pqeYgz2n8GctK77DJjkMnvICuom4Cw5TVhH0oDlktDfW583vP1bZE8lchBM428=
X-Gm-Gg: ASbGncvFeP8/pGtfo5b7vd0O1/wI+T9DR7NgAfU2Ec1gL19VdovSEGfAj0Bi365VlLI
	yAKXUN/SHOMG1xKA5HHFeGO7V9d+SsQuVC+ULMN+/CeZy7thsIn/6Y1gmFoDfwhDIUXZNpDRMac
	NdP2xKVKsGJ8ot5YfRoJy6vI9iLIwQQ42sVJPI9xnaCpNLqJoGFGEdh5nNIaTgd/pqPZy9DeYt8
	5ymqw30x/qK97YhDg4AIRi54F7r4UaXMZ7pMHbtB3VkXietFkw3Cq3Ej4i5MnoPIyuZfRKICUC7
	EbHdklpw9wW8kbA26CYCR7d2PsdKBNnJw5LJJIgDehKYNm00Ex5CmiFF0oLIP8PLPq/D8hAfIbs
	=
X-Google-Smtp-Source: AGHT+IH0dRrVCcRL6pgsEmF3RpWaRMP7Ms99IV+SiRWiYGmtYPBeiArfErI+3Q7AB1h/JMOGBqnWFQ==
X-Received: by 2002:a17:907:2da4:b0:abf:4b6e:e107 with SMTP id a640c23a62f3a-abf4b6ee2d2mr1675275366b.25.1741099293704;
        Tue, 04 Mar 2025 06:41:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Mar 2025 14:41:28 +0000
Message-Id: <D87K6R8AC3H4.SBNHBSR4A0HC@cloud.com>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v2] docs: Add some details on XenServer PCI devices
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
 <20250304132253.23955-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250304132253.23955-1-frediano.ziglio@cloud.com>

On Tue Mar 4, 2025 at 1:22 PM GMT, Frediano Ziglio wrote:
> Describe the usage of devices 5853:0002 and 5853:C000.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - address minor comments
> ---
>  docs/man/xen-pci-device-reservations.7.pod | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xen-pc=
i-device-reservations.7.pod
> index 9ddf3a18ad..adc325069c 100644
> --- a/docs/man/xen-pci-device-reservations.7.pod
> +++ b/docs/man/xen-pci-device-reservations.7.pod
> @@ -10,6 +10,9 @@ use of this is with device ID 0x0001 to advertise the X=
en Platform PCI
>  device - the presence of this virtual device enables a guest Operating
>  System (subject to the availability of suitable drivers) to make use of
>  paravirtualisation features such as disk and network devices etc.
> +XenServer, for Windows machines, may present Xen Platform device with de=
vice
> +ID 0x0002 instead of 0x0001. Device 0x0001 and 0x0002 should be mutually
> +exclusive.
> =20
>  Some Xen vendors wish to provide alternative and/or additional guest dri=
vers
>  that can bind to virtual devices[1]. This may be done using the Xen PCI
> @@ -86,4 +89,8 @@ and unplug protocol.
>  libxl provides support for creation of a single additional xen-pvdevice.
>  See the vendor_device parameter in xl.cfg(5).
> =20
> +XenServer might present a xen-pvdevice device with ID 0xC000.
> +Such device is a placeholder for Windows update usage and is always expo=
sed
> +in conjunction with a Xen Platform PCI device, usually with ID 0x0002
> +
>  =3Dback

LGTM

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

