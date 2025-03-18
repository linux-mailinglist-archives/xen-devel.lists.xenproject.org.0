Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E4A6712D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 11:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918899.1323514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuU8g-00082S-7S; Tue, 18 Mar 2025 10:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918899.1323514; Tue, 18 Mar 2025 10:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuU8g-00080o-4R; Tue, 18 Mar 2025 10:25:38 +0000
Received: by outflank-mailman (input) for mailman id 918899;
 Tue, 18 Mar 2025 10:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9yH=WF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tuU8f-00080i-9T
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 10:25:37 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 540a8301-03e3-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 11:25:36 +0100 (CET)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3fa6c54cdb2so3837935b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 03:25:36 -0700 (PDT)
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
X-Inumbo-ID: 540a8301-03e3-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742293534; x=1742898334; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q3GxsQGWIvzfFjxsMvTXyevofE6hPWTBtK5jwd0F3U=;
        b=GB1ZYnArax1GTNP/hESRzJvgQhqtToai9pxsQ30z393pw4Veny8VxIwyoedc64XgEM
         Gj42BVyxxtNg8+/5C8t1Gxmwv818usqF6V8DV9iXbRMgwgDXTPWOaZ5W6TCQEOaVn3YJ
         C9bYbb+p3G7Irn24xIiNyQBsQyhRmN8R/mVRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293534; x=1742898334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Q3GxsQGWIvzfFjxsMvTXyevofE6hPWTBtK5jwd0F3U=;
        b=al+cQTdx21QpsrHKfV6WI9E3TmpMEKvpOBSkQkBv7o0NZ0x2wOXTO3NuGkalnNXYjE
         TOwX6Bnchxm7j36RcBo9g13J5NNWI1WHvrWkRLrfVH9zLkxSE/RlqH4Z47vy59EiAfv3
         pNRgRuYwpQbY1SEERyJTR6G+wqRMmTMeL4mk9HNdWClIb0Ls0xnqcqq8aKpgfAx9A3yj
         w1Z1zgUbQffen28vnviSzLarCT0ZU6QGI29BH9hhGNB7J+4Z8cJxODGnsgB8zI+smhQV
         M591QIidpzV0Pj5TamU5sh2tieAQiL/hemc3xeMBzzteuU9Phc9sgmcm+pR02bhRuktp
         tpEg==
X-Gm-Message-State: AOJu0YxPVaixfik3BCWGfhBbMFodhIicGAvICiLMoww9m6h8Hmf6uATt
	vH5CiJ+GvgWvqSGFbWiqIPFro5aw2E6h5/x/y7u7npekGTTK4nRQxpQyV7lpACEiFrZxR7ORaX9
	ujFymw8RWa3D9Q9q9SBKr11vHE62tinkwU8kbICnZaj+qgAeT
X-Gm-Gg: ASbGncsgCsiO8t+dBfD6UO8H5ggZTklt2QgE2BfnLj+GxfCUqSHGoygXRWkzV9Gt3hH
	TRoDbunpSFvEt2T17vjaZ2tdokbJ9LcfBj05XHzyAqne83CJJiaA1Y89Jnyks/aOCVowOCySyS5
	aVTNm50S/Gzwcw6S46hIYx23A=
X-Google-Smtp-Source: AGHT+IEDIj8kRVC1XCh+uiSqERG2j3yw8teBeP/OzwYpmKshfLhSxkx07aR2yEwMvF8cVHbFYgtrV6ANCAh7AtBdWaA=
X-Received: by 2002:a05:6808:1487:b0:3f3:f90b:f1b9 with SMTP id
 5614622812f47-3fdebccff3bmr8025361b6e.0.1742293534594; Tue, 18 Mar 2025
 03:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250228152100.23105-1-frediano.ziglio@cloud.com> <20250304132253.23955-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250304132253.23955-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 18 Mar 2025 10:25:23 +0000
X-Gm-Features: AQ5f1Jplf7bBX9JnRJkhzukIbl7tpVlIvJyaE9mw7Xy_MuQaLSjbtePzgkfDXE4
Message-ID: <CACHz=ZiwCVKdaL-wCV4gpyoyv=25nt8d8+gc4vA5Hs1XOacsuw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: Add some details on XenServer PCI devices
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 1:23=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
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
>
>  Some Xen vendors wish to provide alternative and/or additional guest dri=
vers
>  that can bind to virtual devices[1]. This may be done using the Xen PCI
> @@ -86,4 +89,8 @@ and unplug protocol.
>  libxl provides support for creation of a single additional xen-pvdevice.
>  See the vendor_device parameter in xl.cfg(5).
>
> +XenServer might present a xen-pvdevice device with ID 0xC000.
> +Such device is a placeholder for Windows update usage and is always expo=
sed
> +in conjunction with a Xen Platform PCI device, usually with ID 0x0002
> +
>  =3Dback

Any additional comment?

Frediano

