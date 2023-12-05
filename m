Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A68056EC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647934.1011712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWC4-0000bV-6q; Tue, 05 Dec 2023 14:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647934.1011712; Tue, 05 Dec 2023 14:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWC4-0000Zr-45; Tue, 05 Dec 2023 14:14:36 +0000
Received: by outflank-mailman (input) for mailman id 647934;
 Tue, 05 Dec 2023 14:14:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WXV=HQ=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rAWC3-0000Zl-GS
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:14:35 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d11260e-9378-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:14:34 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-286e57fde73so361374a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:14:34 -0800 (PST)
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
X-Inumbo-ID: 9d11260e-9378-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701785673; x=1702390473; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eugi3LJPk8rwPJF3ewrBaB6RIcMiqfgdnHhizrGagQs=;
        b=P+L7XPl8TugTwIIjZhQaYmdIsB0nPulUicQ1zLPlXt9JZtVtVmW/PPmDzrEtMCbq9h
         RrLJ2QtRPuDesmLBbl4bRMy7t+p0ZD+xDFFiyjAtPk1cE+5fm9yd5hJQ1GWVvWItfbhv
         NQC4Xlbd66EjE9N3x6GqqwOPMBF/toi/HCMIDdOp3YJH2E9gx9vU+MOQm+NQv93AvqeO
         cRiNK3i67TWYWxpVuq7NPwKIThaqvs5WemGGehcV9Le7sxZbG6TcJ2LtA7BIrqu7O3FP
         bNo43XMM+vYGymQkWHajTd8vYAOc2Zvf+jAt7Y/6G2uVOznvVGVVXUt1JVAQXkNDfegL
         tsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701785673; x=1702390473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eugi3LJPk8rwPJF3ewrBaB6RIcMiqfgdnHhizrGagQs=;
        b=UZAjvdnlPFM7sv66YHAZSA/dixS3kayyHuMqxa4fol0GEcaPUwQbPdmUWvLClxwj6t
         Dt17H6WuYfj9sbM9euHej3huk31VPqCM6YxpLnLZYHxmch64AFzjdbIitJFJZgMZ+y2Z
         lkYebw/EAr4WMgXbC9xniQz5wuRO+f0l7HesszKzd4IJJAgmK+NRye41I2USw9Gukc6F
         I338Ch5NFrbNM0NB2zujo14NowvlqOiM4oKoOMSFrlW1UgLw4o0VEWGWYaTs98G0fecN
         t3RAyq6cw5fyAFIS27iEphrp0hvo/IqIBX9sVulyyPh5+iAt8+9b3t0XslZzOT6pZLLu
         Wmyw==
X-Gm-Message-State: AOJu0YwE6nDg+l5vJTd+b/f+Sp/6osmSgKTYvvZ3C1/3RWqzhFG5Mzk/
	gjq+MxnY0PPzzPApfQ64BXuTVYJtUKIHrPwFogNVCSt3Pko=
X-Google-Smtp-Source: AGHT+IHKQf0E64pS76qN32ZvIO/yrpurcQRb80bo0l8wyRKWzQIVzpn98u1B85XJERJlnxTZ89HOpJBRLqJ/FqbINfM=
X-Received: by 2002:a17:90a:4007:b0:286:54a3:c34e with SMTP id
 u7-20020a17090a400700b0028654a3c34emr935771pjc.26.1701785672749; Tue, 05 Dec
 2023 06:14:32 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
In-Reply-To: <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 15:14:21 +0100
Message-ID: <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

 booting kernel with "dyndbg=file drivers/gpio/* +p"

[    1.997798] i2c_designware AMDI0010:00: using ACPI '\_SB.I2CA' for
'scl' GPIO lookup
[    1.997804] acpi AMDI0010:00: GPIO: looking up scl-gpios
[    1.997806] acpi AMDI0010:00: GPIO: looking up scl-gpio
[    1.997807] i2c_designware AMDI0010:00: using lookup tables for GPIO lookup
[    1.997809] i2c_designware AMDI0010:00: No GPIO consumer scl found
[    2.007517] i2c_designware AMDI0010:03: using ACPI '\_SB.I2CD' for
'scl' GPIO lookup
[    2.007521] acpi AMDI0010:03: GPIO: looking up scl-gpios
[    2.007523] acpi AMDI0010:03: GPIO: looking up scl-gpio
[    2.007524] i2c_designware AMDI0010:03: using lookup tables for GPIO lookup
[    2.007526] i2c_designware AMDI0010:03: No GPIO consumer scl found
[    2.343905] gpiochip_find_base: found new base at 512
[    2.344408] gpio gpiochip0: Persistence not supported for GPIO 0
[    2.344436] gpio gpiochip0: Persistence not supported for GPIO 61
[    2.344458] gpio gpiochip0: Persistence not supported for GPIO 62
[    2.344480] gpio gpiochip0: Persistence not supported for GPIO 58
[    2.344502] gpio gpiochip0: Persistence not supported for GPIO 59
[    2.344523] gpio gpiochip0: Persistence not supported for GPIO 2
[    2.344546] gpio gpiochip0: Persistence not supported for GPIO 6
[    2.344571] gpio gpiochip0: Persistence not supported for GPIO 54
[    2.344646] gpio gpiochip0: (AMDI0030:00): added GPIO chardev (254:0)
[    2.344648] gpio gpiochip0: registered GPIOs 512 to 767 on AMDI0030:00
[    2.344650] gpio gpiochip0: (AMDI0030:00): created GPIO range
0->255 ==> AMDI0030:00 PIN 0->255
[    2.357663] acpi MSFT0101:00: GPIO: looking up 0 in _CRS
[    2.376188] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    2.376193] mdio_bus fixed-0: No GPIO consumer reset found
[    2.401459] rtc_cmos 00:01: using ACPI '\_SB.PCI0.LPC0.RTC' for
'wp' GPIO lookup
[    2.401464] acpi PNP0B00:00: GPIO: looking up wp-gpios
[    2.401465] acpi PNP0B00:00: GPIO: looking up wp-gpio
[    2.401467] rtc_cmos 00:01: using lookup tables for GPIO lookup
[    2.401468] rtc_cmos 00:01: No GPIO consumer wp found
[    2.659765] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660047] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660162] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660277] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660393] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660504] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660609] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660726] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    5.445265] acpi FRMW0004:00: GPIO: looking up 0 in _CRS
[    5.445396] acpi FRMW0005:00: GPIO: looking up 0 in _CRS
[    5.448467] acpi PIXA3854:00: GPIO: looking up 0 in _CRS
[    5.448483] gpio gpiochip0: Persistence not supported for GPIO 84
[    5.452476] gpio gpiochip0: Persistence not supported for GPIO 5
[    5.463304] gpio gpiochip0: Persistence not supported for GPIO 8

