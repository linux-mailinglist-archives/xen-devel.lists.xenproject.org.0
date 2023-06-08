Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2387279A6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 10:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545173.851451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AjU-00009B-O6; Thu, 08 Jun 2023 08:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545173.851451; Thu, 08 Jun 2023 08:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AjU-00007f-LA; Thu, 08 Jun 2023 08:11:00 +0000
Received: by outflank-mailman (input) for mailman id 545173;
 Thu, 08 Jun 2023 08:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bD3=B4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q7AjT-00007W-EN
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 08:10:59 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fed26b5e-05d3-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 10:10:57 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f62cf9755eso434525e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jun 2023 01:10:57 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac2510e000000b004f64fb058f7sm98631lfb.225.2023.06.08.01.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 01:10:55 -0700 (PDT)
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
X-Inumbo-ID: fed26b5e-05d3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211856; x=1688803856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FecPW7WF+fj+fSsMSdgAEe6LdyFLQ6jYIlPQF1916mg=;
        b=dikZuKbrzoqtTBrsGMBEGvBG5hGrw5Io3DFojCz8xAWu8juhIkVbSejxvNdtOsFLKB
         nwYZzQ1YCGJhnGbc6xDhlw8MbGvIzINflj3kKvZhAkW4CCMzZj+H3wsAptlg7lIk76+P
         5RShorfi67DxqvdDlR02Bhimn2dIS48BQsNTACZiDEjTpWR+i6edSEpoHGxn5uE/NS4l
         WP8mJY3JLcmy9s5W5xm/2TEX+PwShglg/zqHHOj/FtCx3BIg7T5mUuKCEe1evSK4H+rx
         SkJmpHfXGuIOmb/vfVoqay0AORunUSZwC/K8sLgi3+vFyZB2NehLbn+5hFBhO0cbtcky
         X5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211856; x=1688803856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FecPW7WF+fj+fSsMSdgAEe6LdyFLQ6jYIlPQF1916mg=;
        b=NGIINDvq1nz9G9n3CBeoxwgrJcmonkUOU+hFoDom9vvN8XkUL7PwieahISK4l3hJEx
         vo7QzzMYG/rsouA8jzbzoNECmIFTenYYc3jqzRRZRf0s8X2NUwe7w4UNzjmfZSntWx7G
         iOdB04YSjCP7Kh586laLRzIvLSNNrd4h7qDfUpmZ9Cc3kQuFJZyvWV0R1Q8Iyv+TzS9e
         7A48jblAXayi8d0ihjd10UICaAXhpvHthpfy+x/j1itEaA6zXxquRfYv9ouoRz9HJCqJ
         0UY+4ZhAeKclfuowTxG6qy+NAiqs7UA0CjWkCNCEaYTaDMyArekj5Ow/4H2meZG9s27p
         N/6w==
X-Gm-Message-State: AC+VfDyBgNyXExkAKDuG++9HnYd86/3c+uJ0WJvordDqz8zttZdQsXHL
	1mZS5RySxlLpNTEgDKZaPGM=
X-Google-Smtp-Source: ACHHUZ40y3hU1r8ePcVIxpVzeM+P/SP26r8paSpMX0rKiwAHyN9T8Eg3j9+6yscF0IjXGufMPPSMIg==
X-Received: by 2002:ac2:4c0c:0:b0:4f6:d9e:7c3a with SMTP id t12-20020ac24c0c000000b004f60d9e7c3amr3264945lfq.47.1686211855855;
        Thu, 08 Jun 2023 01:10:55 -0700 (PDT)
Message-ID: <f828cca2eaa3e599d730c501a7981f53f3371f32.camel@gmail.com>
Subject: Re: [PATCH v1 6/8] xen/riscv: add SPDX tags
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Connor Davis
 <connojdavis@gmail.com>
Date: Thu, 08 Jun 2023 11:10:54 +0300
In-Reply-To: <2c1399c7-458a-61cd-fa81-945c96383210@xen.org>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <1034fa44a9b589a18f89b7849877c00ee0a362d5.1686080337.git.oleksii.kurochko@gmail.com>
	 <2c1399c7-458a-61cd-fa81-945c96383210@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

Hi Julien,

On Wed, 2023-06-07 at 11:20 +0100, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 06/06/2023 20:55, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/riscv/include/asm/config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/current.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/early_printk.h | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/page-bits.h=C2=A0=C2=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/traps.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 ++
> > =C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 ++
> > =C2=A0 10 files changed, 20 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index 38862df0b8..3ae35f57b3 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -1,3 +1,5 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
>=20
> The default license for Xen is GPL-2.0-only. So any particular reason
> to=20
> diverge?
Thanks for a remark.

There is no any particular reason for that. I copied it from on of a
file from RISC-V arch directory.

I'll  change it to GPL-2.0-only in the next version of the patch
series.

~ Oleksii

