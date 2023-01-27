Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8C67E41C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485526.752824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNED-0006e7-Tk; Fri, 27 Jan 2023 11:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485526.752824; Fri, 27 Jan 2023 11:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNED-0006bN-Q5; Fri, 27 Jan 2023 11:49:09 +0000
Received: by outflank-mailman (input) for mailman id 485526;
 Fri, 27 Jan 2023 11:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLNEC-0006b8-3N
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:49:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a199ad5-9e38-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:49:06 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5249904wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:49:06 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 m14-20020a5d6a0e000000b002bfd09f2ca6sm1965515wru.3.2023.01.27.03.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:49:05 -0800 (PST)
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
X-Inumbo-ID: 9a199ad5-9e38-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7AyoerhmqCeZ8pg+s7b8bghinbz1l+MavFXsve8+Lmo=;
        b=Zi6UfbzXY5r5pi95k3hTnHxVLqfDn8zkOVCMuIQJ8+T0KhMIptD9o8rW2WnOvnnru+
         ++Yfnp1n6kEgfYSfL9eWY6l3D0UhA8KqORc9HmXnYW+sF9+3GxAimpt7pnMRPdX5j98T
         yliSncIwksl/WwxHUuko40p77/amLETUdKfpzjGM+RZU1IwBilIN/0R2w+uqBkl/0w4x
         G+aRLfl3gWUEbgSMUbO1A7mziDJW/z2zU8DzkBjbRQbqMHr8X8x8QrLX7w3rKfVSI6/Y
         8efmXhGHxbNK8PAN+/8MCLEEX7dsLdu6lOTBVRXn5SXkoQKeATqtM7p69yi+3kteummB
         ZbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AyoerhmqCeZ8pg+s7b8bghinbz1l+MavFXsve8+Lmo=;
        b=dVQWpw8j6cU5hlVogEBz0ogqCcHh/qGKaxbvGkuFxcwVqJsSAvt3Y8GsePO0Z5EpsE
         xOg5E7kN7aKuo0uhTAGFfvFSPH5Lw8zfI838t6AHt8xGXp/SdSgA4/escV/DirC2I0PU
         uvXwaO6NnCWFm+7l/8b/8EZF7lEQNt93cUG9/Ze7ptHuRxAcB535vgCSRZ/ouUEm1zO+
         sxUr2IxNtEGs+hXwX7+XNZwSRjLoB42CQHUEQIp0KnIZloouQ30BSBWI39l8DdZjXuBW
         +ZLzuJVTqx5gw07nTKqNb/AL1scfQJQoLWUzUkuAZQXnwWTqYLm+6A5rLQ9o5KrjNntu
         YIaQ==
X-Gm-Message-State: AFqh2kqU1YBqPwJksy2zk0a0hTlnRzCEuejVq0G9SNP/HWljOik63n4f
	g/iwNcxETZS+O3Qaw4UsV7s=
X-Google-Smtp-Source: AMrXdXt2zD+S0X1Vu5V/GxQiUgpWj4okTGy0/Gapl31SOMAdPMXlSMTInfI8FKWLzqtvZkn6PLzslg==
X-Received: by 2002:a05:600c:214:b0:3db:30f:bd72 with SMTP id 20-20020a05600c021400b003db030fbd72mr36948159wmi.8.1674820145489;
        Fri, 27 Jan 2023 03:49:05 -0800 (PST)
Message-ID: <b7070c68ce88fdd3a1a7b04400ca8c3366ddf416.camel@gmail.com>
Subject: Re: [PATCH v6 1/2] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Bobby Eshleman
 <bobby.eshleman@gmail.com>
Date: Fri, 27 Jan 2023 13:49:04 +0200
In-Reply-To: <fbab23b9-663e-9516-5721-a92486686f84@xen.org>
References: <cover.1674816429.git.oleksii.kurochko@gmail.com>
	 <06c2c36bd68b2534c757dc4087476e855253680a.1674816429.git.oleksii.kurochko@gmail.com>
	 <fbab23b9-663e-9516-5721-a92486686f84@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-27 at 11:26 +0000, Julien Grall wrote:
> Hi,
>=20
> On 27/01/2023 11:15, Oleksii Kurochko wrote:
> > Because printk() relies on a serial driver (like the ns16550
> > driver)
> > and drivers require working virtual memory (ioremap()) there is not
> > print functionality early in Xen boot.
> >=20
> > The patch introduces the basic stuff of early_printk functionality
> > which will be enough to print 'hello from C environment".
> >=20
> > Originally early_printk.{c,h} was introduced by Bobby Eshleman
> > (
> > https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d
> > 1aab71384)
> > but some functionality was changed:
> > early_printk() function was changed in comparison with the original
> > as
> > common isn't being built now so there is no vscnprintf.
> >=20
> > This commit adds early printk implementation built on the putc SBI
> > call.
> >=20
> > As sbi_console_putchar() is already being planned for deprecation
> > it is used temporarily now and will be removed or reworked after
> > real uart will be ready.
> >=20
> > Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > ---
> > Changes in V6:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Remove __riscv_cmodel_medany check from earl=
y_printk.c
>=20
> Why? I know Andrew believed this is wrong, but I replied back with my
> understanding and saw no discussion afterwards explaining why I am=20
> incorrect.
>=20
> I am not a maintainer of the code here, but I don't particularly=20
> appreciate comments to be ignored. If there was any discussion on
> IRC,=20
> then please summarize them here.
Sorry, I have to mentioned that in the description of patch series.

There is no any specific reason to remove and only one reason I decided
to remove the check was that the check wasn't present in original
Alistair/Bobby patches and based on my experiments with that patches=20
all worked fine. ( at least with some additional patches from my side I
was able to run Dom0 with console )

I pushed a new version (v7) of the patch series ( as I missed to change
dependency for CI job ) so probably we have to open a discussion again
as Andrew don't answer for a long time.
>=20
> Cheers,
>=20
~ Oleksii


