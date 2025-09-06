Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4DB47767
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 23:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113565.1461246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uv0Om-00061F-Lj; Sat, 06 Sep 2025 21:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113565.1461246; Sat, 06 Sep 2025 21:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uv0Om-0005yM-ID; Sat, 06 Sep 2025 21:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1113565;
 Sat, 06 Sep 2025 21:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTp=3R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uv0Ol-0005yG-3p
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 21:24:39 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3c141b8-8b67-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 23:24:36 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f7cd8ec2cso4131192e87.2
 for <xen-devel@lists.xenproject.org>; Sat, 06 Sep 2025 14:24:36 -0700 (PDT)
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
X-Inumbo-ID: e3c141b8-8b67-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757193876; x=1757798676; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zbvt6oOBwV3PGgfK6/FgHYGh+bR/uoLcr6FyocAarY=;
        b=Dr/GQGRg6GFtDaAuOwYGrWDRIPyyfdjswk582I2Kih9iVsKBPQNltLVtyz0d9acV6r
         0bGgc5nW0YCbS5CTbBxypTLQBaFB7dyQSD7uyisksA5KWjxh9svNBVv0/VfbiesFSdFc
         mp/+ed2yThAMwpAE5nmGl6PuhrMxZYuZ2KKO8woiD+4z/CUFy22QAXjKvseMPsX6vIew
         HPcIhVWNyUnhYfQPi2KXsGtth+sZgf6ETAxaqYX3TFeNJKinVLqMYWFYee/7gQNtjxuY
         rL64EdgL7JQb7r+AaaTWKNwln0cPxW9NC+jIysApeOoKv0+dt83b0TTnD+kNGpu9a+wJ
         dpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757193876; x=1757798676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Zbvt6oOBwV3PGgfK6/FgHYGh+bR/uoLcr6FyocAarY=;
        b=sgwDBeiGz4Asg2fyVBxQrBTMqIWhBP98G7wYsvre5nY0Z4VQW+EjGbD4VeTkMVgoHB
         VW5ISDtu+oclpa3EI3T8iA+nTHyyihdkLUI6yxxJe1/obyc8XqGfwzuSA99dBwDcKTT/
         9Q096+P05Tzj/pRxYV5Tt7gpYohjKTZtYohmxkV5FdJJ9bTnrVDBNLCB+59BUZOFowqd
         sAuQ10HqZRlOVaVe0cKQ/c2YDyBP6UOu67IEziH8g+WP79ZFr0awg4M03jgUazblVJej
         1oWjLa73BWAVnH/8gM9UUEGKiup2qsrJo/XHFnx/tIju7u6kxCV1dcIbQScKel2aZuDL
         Zf8A==
X-Gm-Message-State: AOJu0Yx4ScmHRSJAzMltGqkswb/EyzMaeX9VTLOLr5RiWgeamFg4a/dx
	p4qsGF1OVFcNDWSnwJMYGmhrby9oIkirDRNDHqi1WrxZOZRSO/1vjFQZKbga3S6qS9IwTHij9uM
	k+05yyIa900hLhqgamp10l71vJHPEywc=
X-Gm-Gg: ASbGnct6gw5MeMCjzrYiN+HCYa5rA0Sk9pIu0lhOJ6uTxF5vG6CYGbprmaXan5GBXB+
	fycybhS3jxu4U9iBkN1Qo/gr7YAtxMPkf51CrvISYTp4xmyav0v/BxiRVUxhiWf1vVzgLMvwA0U
	8ggWB54LvA4DGUJA6mBR6cXbbIkmXbFzuHZjBKllCG9qFmZ2QYJADVh5AX/iZqKa2kKuRrXRec9
	DzTtg==
X-Google-Smtp-Source: AGHT+IH4t02xrH24g6DqccWlzjGa/TZfpXr/VusbElSTvXa/ScX1Pj2e1rPmwzPp0a2+iua7sHdORv9grupx41kjj9M=
X-Received: by 2002:a05:6512:138a:b0:560:8484:a92e with SMTP id
 2adb3069b0e04-5625f5355ffmr1048505e87.15.1757193876041; Sat, 06 Sep 2025
 14:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-6-dmukhin@ford.com>
In-Reply-To: <20250905232715.440758-6-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sun, 7 Sep 2025 00:24:24 +0300
X-Gm-Features: Ac12FXxMBmI9d_pQVABD4456xopwScZyRU_4MxZyPpF7J5sXNqXylvrhfWhkFu8
Message-ID: <CAGeoDV_YrSrKTYj5LitZQzdcO9-QBCqVmnqE63hGAendiqNxpw@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] emul/ns16x50: implement SCR register
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Sat, Sep 6, 2025 at 2:27=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add SCR register emulation to the I/O port handler.
> Firmware (e.g. OVMF) may use SCR during the guest OS boot.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - moved earlier in the series to simplify I/O handler population in
>   the follow on patches
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-11=
-dmukhin@ford.com/
> ---
>  xen/common/emul/vuart/ns16x50.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 7f479a5be4a2..51ec85e57627 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -103,6 +103,20 @@ static int ns16x50_io_write8(
>
>      if ( ns16x50_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UA=
RT_DLM) )
>          regs[NS16X50_REGS_NUM + reg] =3D val;
> +    else
> +    {
> +        switch ( reg )
> +        {
> +        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
> +        case UART_SCR:
> +            regs[UART_SCR] =3D val;
> +            break;
> +
> +        default:
> +            rc =3D -EINVAL;

In the previous commit, when ns16x50_dlab_get() was zero and UART_DLL
or UART_DLM was accessed, the function returned 0. With this commit,
the behavior changes: now an -EINVAL error is returned for both DLL
and DLM when ns16x50_dlab_get() is zero.

Should this be fixed in the previous commit, or is this change
intentional in this one? Note that for 16-bit accesses you already
return an error when ns16x50_dlab_get() is zero, so the behavior is
inconsistent for 8-bit accesses to DLL/DLM.

> +            break;
> +        }
> +    }
>
>      return rc;
>  }
> @@ -165,6 +179,19 @@ static int ns16x50_io_read8(
>
>      if ( ns16x50_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UA=
RT_DLM) )
>          val =3D regs[NS16X50_REGS_NUM + reg];
> +    else
> +    {
> +        switch ( reg )
> +        {
> +        case UART_SCR:
> +            val =3D regs[UART_SCR];
> +            break;
> +
> +        default:
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +    }
>
>      *data =3D val;
>
> --
> 2.51.0
>
>

Best regards,
Mykola

