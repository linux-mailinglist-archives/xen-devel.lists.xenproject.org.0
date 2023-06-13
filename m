Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB772EA36
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548368.856300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9861-0003Cs-DN; Tue, 13 Jun 2023 17:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548368.856300; Tue, 13 Jun 2023 17:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9861-00039b-A0; Tue, 13 Jun 2023 17:46:21 +0000
Received: by outflank-mailman (input) for mailman id 548368;
 Tue, 13 Jun 2023 17:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szI4=CB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q985z-000373-Fe
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:46:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a7bc06-0a12-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 19:46:18 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f649db9b25so7216556e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 10:46:18 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a197003000000b004f00189e1dasm1831301lfc.143.2023.06.13.10.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 10:46:17 -0700 (PDT)
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
X-Inumbo-ID: 33a7bc06-0a12-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686678378; x=1689270378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RGfIeKUA8BkoE8fkhjKJI0cd3PZOliJz44DxIItUE3Q=;
        b=VCUE6sv5JGjU9EGA+xSjOAzyLxrziyB/VD/HngitbH4GTtehc/3IHzskJxcWcO9Ob9
         lmPbZkM9c0dcwYGTjQ/Ycf4TT+dWb7URNys7EMbhe6r5ZgrfVtV0iRor1uZdRQYTEkDW
         7ji3KQipF3BATgwYwxdNHdH5mIxhoEy/mNFEim2AX1NztqOOfpWUdtIWgQZvBCrGJaDu
         xyW7ZA6pRr2kFBzaFuDkG4B3wjX08gw/6GbtBQtl+TDkm/iHtje+HWQUtb4Q67zdUet0
         878xQbeYVaj/GtfLKeXscjxw4gbAhTTxgR29rKxTAMBW/WtpC0xLGIIue9cdmvC7/aw3
         Dp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678378; x=1689270378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGfIeKUA8BkoE8fkhjKJI0cd3PZOliJz44DxIItUE3Q=;
        b=PqxEljdb6kN+v3vfeqQCa4Jzvi4LrTY2aTM7DDIybDgnUvVWCdgDrwVph/l45opHOX
         SCSu2YpiRhvb3vB2VWkG24j+6FsYxbarf4IEVAMBLmERCGzO1ByeRvp09iE7I/1aqXab
         wVv6Muisj1XaA8UwDa5WqDxzsbERsGL535ymmvUUdjmSaWFv7/hj/tS2QbI3SYnMQFSC
         s8Rwqg/2tq+rVlFzkVJkBhXukjbN/0Ohom5LLYLtAP0cGegB1sLAAq+2IcDwdMPJvADh
         qniMDoLYs9n72no333vC0JTq56bVH/ysUoyDHF/oGTDwgyboOau/7Vg9qR1FrXrQ2ujI
         r3qQ==
X-Gm-Message-State: AC+VfDzTKsZOuZxLpkx7HbIZA4hUHI80Vv5YtrKcIorjYrecRT7znUjz
	EJO/xFVpazmJq0FzJQj+Umg=
X-Google-Smtp-Source: ACHHUZ6+u5xiDbTtqtK5t2jP3I0mI9jQWC1adn4tEnBUVTUiVzHqKP/Zhpo0Rt1IFAR0QQh+m7+CnQ==
X-Received: by 2002:ac2:5b89:0:b0:4f6:d9e:7c3a with SMTP id o9-20020ac25b89000000b004f60d9e7c3amr7866275lfn.47.1686678378007;
        Tue, 13 Jun 2023 10:46:18 -0700 (PDT)
Message-ID: <102112e1ed3dce8318aba4d9254f9d02600c71c7.camel@gmail.com>
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce reset_stack() function
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 13 Jun 2023 20:46:16 +0300
In-Reply-To: <92fab0b8-647a-b9c1-d15b-1217a4420715@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
	 <92fab0b8-647a-b9c1-d15b-1217a4420715@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-12 at 09:12 +0200, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> This wants addressing the "Why?" aspect in the description. Is the
> present
> code wrong in some perhaps subtle way? Are you meaning to re-use the
> code?
I am re-using it after switching from 1:1 world to reset a stack.

> If so, in which way (which is relevant to determine whether the new
> function may actually continue to live in .text.header)?
Actually there is no such requirement for reset_stack to live in
.text.header.

> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -27,8 +27,14 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 t3, t3, __SIZEOF_POINTER__
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltu=C2=A0=C2=A0=C2=A0=
 t3, t4, .L_clear_bss
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=C2=A0=
 reset_stack
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0 star=
t_xen
> > +
> > +ENTRY(reset_stack)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sp, cpu0_boot_stack
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 t0, STACK_SIZE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, sp, t0
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0 star=
t_xen
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > +
>=20

~ Oleksii


