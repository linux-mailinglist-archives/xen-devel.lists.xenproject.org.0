Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD873BE1D6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 06:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151746.280671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0yp0-00023U-11; Wed, 07 Jul 2021 04:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151746.280671; Wed, 07 Jul 2021 04:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0yoz-00020V-Tk; Wed, 07 Jul 2021 04:06:01 +0000
Received: by outflank-mailman (input) for mailman id 151746;
 Tue, 06 Jul 2021 21:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJkz=L6=gmail.com=vilhelm.gray@srs-us1.protection.inumbo.net>)
 id 1m0slO-0004YA-6G
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 21:37:54 +0000
Received: from mail-pj1-x102b.google.com (unknown [2607:f8b0:4864:20::102b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0266d66e-1ea5-4382-b3e3-b9592c6beb90;
 Tue, 06 Jul 2021 21:37:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso2326669pjx.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 14:37:51 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id h14sm14343197pgv.47.2021.07.06.14.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:37:49 -0700 (PDT)
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
X-Inumbo-ID: 0266d66e-1ea5-4382-b3e3-b9592c6beb90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ocbz7plpl2GsaeWZtT2xSwu/ECmgcGgX+U0mFWoVx8o=;
        b=fjV4+ka8h0vH05QQfb5mosysrP9nHimBGyZMIaa5AG6oYKlZIJ9fBu1u8zdUGxqK0V
         Um+d4Woup62vh1nDeTEMfYQu/z07c7tU/WMAtzd8zyjZ+D++/9qAcGD3Qi5HWfAEidnP
         LVIhoqq3BcdDCaWawKEqjjS8yu6I4JR+nAEzkK0jeMXN28vBiyhs3oL9vVM3I/zG4bRq
         0ch+fVpWTwIZJdpOA5MGN4Hsas/DzY0s55S8/73rafQT0BQHzaPtbSSjdX9FgBPH3Kng
         zdOUu0zymj0lCUC9mcaI5h90C5jAW9R9slEqBMssceloFyAtObCoJPafpr9GaUMLPWWg
         1jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ocbz7plpl2GsaeWZtT2xSwu/ECmgcGgX+U0mFWoVx8o=;
        b=p4dlAqOS4Jdg8QCEBDvYKCFGVYCqUGrOTdrvTI+3Bglc8y4B5N9IxHJZAWSXVPPnHy
         GhcKM7n3IqBHYU8rWy6BLsl08huldBSUfzD+YxvJ/p2eZi0RdJiIW6UUATixaLBl/hoH
         sSy66333ui3xIsS1bi/vuotviIegoww65PtGCHun1M49+qsIctx+i0PCBAhXDjqH70id
         RK5Wv1Gm0J9Yhe3VmJ25yb8bgXMzhMoJ4tZE3cFoj61BDqqhRXx7RIREMkkGD2Dv4EDM
         7FB5dWqzZfKNYmaDCZx4IjqE395KhZ4YJuPe0yoXlO4vcWjNl64HgD6QgsbGXU4V0GTk
         EwWA==
X-Gm-Message-State: AOAM531482PajkqifxTQPZLC8ytO4Ps5GczOcNZgd0Wq1cycQZ2GbYCt
	FgIlYj6SQsjl5gOh2wvtM7s=
X-Google-Smtp-Source: ABdhPJyn2Hi8kaCYu+WokB25snaMIG+9Q6KwjeQoMDQJIrAIZd3JeXm641055Ca25Y6q1bD80UK2hA==
X-Received: by 2002:a17:90a:3009:: with SMTP id g9mr2332932pjb.82.1625607470831;
        Tue, 06 Jul 2021 14:37:50 -0700 (PDT)
Date: Wed, 7 Jul 2021 06:37:39 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	industrypack-devel@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-ntb@googlegroups.com,
	linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <YOTMp88HfFiy6+RM@shinobu>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VOubNWsj2sFIOkFX"
Content-Disposition: inline
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>


--VOubNWsj2sFIOkFX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 05:48:03PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
>=20
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
>=20
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
>=20
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk> (For ARM, Am=
ba and related parts)
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Chen-Yu Tsai <wens@csie.org> (for drivers/bus/sunxi-rsb.c)
> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org> (for drivers/media)
> Acked-by: Hans de Goede <hdegoede@redhat.com> (For drivers/platform)
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Acked-by: Juergen Gross <jgross@suse.com> (For Xen)
> Acked-by: Lee Jones <lee.jones@linaro.org> (For drivers/mfd)
> Acked-by: Johannes Thumshirn <jth@kernel.org> (For drivers/mcb)
> Acked-by: Johan Hovold <johan@kernel.org>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org> (For drive=
rs/slimbus)
> Acked-by: Kirti Wankhede <kwankhede@nvidia.com> (For drivers/vfio)
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com> (For ulpi and=
 typec)
> Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com> (For ipac=
k)
> Reviewed-by: Tom Rix <trix@redhat.com> (For fpga)
> Acked-by: Geoff Levand <geoff@infradead.org> (For ps3)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

>  drivers/base/isa.c                        | 4 +---

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

--VOubNWsj2sFIOkFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDkzSMACgkQhvpINdm7
VJLVFhAAyxEk2xOSRC1xhJSnjLQvNeb+KeTAJr+uaSAwwExERXcbGlIryhqCZSij
fZRzkvgPIscNAegWidvmuhZlhkFJPwvPArfhB/pFIDvQ1xX0kCPH3T51Lncu35Tf
vgluc4JhAW9+1UzoKZsv8RK4uY2ETRMBBeYs7epjqK2RhCvzG8rDMD+Dy49nxrYX
eNdmcR+7EcK8RjLmb/YEfNXxcXdDW0KlU5ATAh+PKuAPKbOKpoKfKuYsOYS7VrGJ
MAk5lC5J/bqbBWM4eqm+g5NbskWMr1N5WC60R7K3isMCoaEpnKNhSD3kvYIFe2Tf
mWyIE2c7D+UWhzbp+Kq4+DHzBN4ajLBy0oMd28HrGOQmD+/chjjc1zTOK9uNBvKz
xBRbxQl7OrAnKhUqcrgVpVL30EvTNajZIOZdwtGXhQCWW+MX747JE+H291VLg3gz
a0p6IJ8TS+gOgGGvmNjVg6yHYuKv6XDbDfI7tc0dRJUOoVqfbkIHSvAQQzn0LIFn
k/Ln4D8LDFj8X3fHbfz200+nzo9gwA5ZXhWXzvTKXhSEyBoc3+i+Ihn3bgYf6rI8
j8LozqWaWpNxaLMBrLuy06ldAuzhnQ7wPw1JuGXDAY1vdMYVVRp1XcbjBSqybXMA
weoaxx4Lwh05XikzxZpXDQBx5N+5V3sYRuqGrYs7H1ZUm0rT0I0=
=yTaM
-----END PGP SIGNATURE-----

--VOubNWsj2sFIOkFX--

