Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DDA4DA23
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 11:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900888.1308863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPPV-00014C-Ib; Tue, 04 Mar 2025 10:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900888.1308863; Tue, 04 Mar 2025 10:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPPV-00011K-FV; Tue, 04 Mar 2025 10:22:01 +0000
Received: by outflank-mailman (input) for mailman id 900888;
 Tue, 04 Mar 2025 10:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wukS=VX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tpPPU-00011E-1H
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 10:22:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 811314e2-f8e2-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 11:21:58 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abf5358984bso466006866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 02:21:58 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1e729ed77sm167148366b.4.2025.03.04.02.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 02:21:57 -0800 (PST)
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
X-Inumbo-ID: 811314e2-f8e2-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741083718; x=1741688518; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwQbWqnCGdRXjvCMOhUYpkXpbq2LFAvwImVdT2/cNlo=;
        b=WgYrLbEHsutofVlL8ST3y1Ejamk0myhqMO10sMnP+4moQPYZSdbsN+CpUk1a3Zgtz1
         IAtcegCKvv2M2FjRKd2V8586UkR1R2TndHmzrnWU+MmSnIoldgInP4i+i59YXe5scHAE
         BWdlyrHulrwEerUe2cOjhicwkA4/1V0XPt+vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741083718; x=1741688518;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwQbWqnCGdRXjvCMOhUYpkXpbq2LFAvwImVdT2/cNlo=;
        b=O/9hTLQepn7ysIj51qzLBL6zjjQh5ypZYOzcAgrBkpX5ixGrIlFx6mt2lurCBnT+7L
         8fezfHJHtaQyfaCaR4K4/g9jgVba2f8y+B3LMNSziRoBHSqncRDLr2mCd90v4IiT9e9I
         DLZ8+tlrp9Ycip+pqFettKZaapbF5p0XHGd+lix6oSdqvwYbW2HPH/LyjqxaBx1R4ERT
         wGzivvi6xBNoAJrf6ha3J4zlqlXzseF7OnKGkuJKGkSvdLEDtpVUOAd04VVvbgh1RooA
         QgRFJY1sPnyoYQxQXaZkk/R/MW4q+UEjWotdF0KdCLhyvsckOLSZpioUdAATbttb3U0d
         lOmw==
X-Forwarded-Encrypted: i=1; AJvYcCWG887exwStoavm3AYDI68ouN9sfEsj2jgbcLpoXALiyKg+uQM7CUKEdNBaS8MgRoNCM1WJx+qzpXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOypRxTO28pzBgMeVVkgeXK4XRwAaV3uJMnNB/0686TdvwzhBG
	HkzrQ+tklEK3j22sK+Ft3bQraTkjarFEO+JE+Hx72k+WsPO9uRyDJbXbFldQi9M=
X-Gm-Gg: ASbGnctSSZTs29we97SK6j21e1nZF5/MkeRkfPr/5dVTehR2ztq/4iJOvEgz4EKcqpG
	C30TaE6YGJlActP3NpNKk0tfwaOs8Z7awV4AStK3UNDciNMQdOoVN1Dr5zaq90RgT/pIf8QApbU
	GF4TjWO9FvXEkBaQ/hxgoNaQV+joUftJOfxpYeQ9QpRYytJi55oaFrUOn63/ckDUj927cqG+7/H
	H1qEohzXjXAY62dpLqACZlFRToDOP/f9q9PW3zA9iSgUEgkkvxElDOBRLzCYml2fsHuydHyghlv
	XQe85midLktwQfvlv1lG7R8uy/Z/XP5D1qJwFJ8+tyxjg80Oc/45PrNoikR2a2HM/uRDuJAoqLg
	=
X-Google-Smtp-Source: AGHT+IG5ctqgAFdJeQ6wKttb2Uj+vXiwGM3hwnAqvQI3gJ08CXgr4QqtdQ85pl/BbbV7aMyh2gc+Rg==
X-Received: by 2002:a17:907:608f:b0:ac0:527c:9cd5 with SMTP id a640c23a62f3a-ac0527ca802mr555969666b.42.1741083717890;
        Tue, 04 Mar 2025 02:21:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Mar 2025 10:21:52 +0000
Message-Id: <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com>
Subject: Re: [PATCH] docs: Add some details on XenServer PCI devices
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250228152100.23105-1-frediano.ziglio@cloud.com>

Hi,

On Fri Feb 28, 2025 at 3:21 PM GMT, Frediano Ziglio wrote:
> Describe the usage of devices 5853:0002 and 5853:C000.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  docs/man/xen-pci-device-reservations.7.pod | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xen-pc=
i-device-reservations.7.pod
> index 9ddf3a18ad..62f3bd2105 100644
> --- a/docs/man/xen-pci-device-reservations.7.pod
> +++ b/docs/man/xen-pci-device-reservations.7.pod
> @@ -10,6 +10,8 @@ use of this is with device ID 0x0001 to advertise the X=
en Platform PCI
>  device - the presence of this virtual device enables a guest Operating
>  System (subject to the availability of suitable drivers) to make use of
>  paravirtualisation features such as disk and network devices etc.
> +XenServer, for Windows machines, presents Xen Platform device with devic=
e
> +ID 0x0002 instead of 0x0001.

nit: in the interest of future-proofing the doc 's/presents/may present/'?

> =20
>  Some Xen vendors wish to provide alternative and/or additional guest dri=
vers
>  that can bind to virtual devices[1]. This may be done using the Xen PCI
> @@ -86,4 +88,11 @@ and unplug protocol.
>  libxl provides support for creation of a single additional xen-pvdevice.
>  See the vendor_device parameter in xl.cfg(5).
> =20
> +=3Ditem 2.
> +
> +XenServer, for Windows machines, presents a device with ID 0xC000.
> +This device is a placeholders for Windows update.
> +Device 0xC000 is presented with a Xen Platform PCI device, usually with =
ID
> +0x0002.
> +
>  =3Dback

Wouldn't this be better covered under "=3Ditem 1"? Device 0xc000 is a
xen-pvdevice, so it could be simplified to a single line of "XenServer uses
device-id=3D0xc000 for its pvdevice on Windows guests", or something like t=
hat.

Otherwise it reads as some other device, IMO.

Cheers,
Alejandro

