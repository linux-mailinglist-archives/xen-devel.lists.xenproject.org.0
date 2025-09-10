Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08BB513A4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 12:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118109.1464009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHs8-0004Om-AV; Wed, 10 Sep 2025 10:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118109.1464009; Wed, 10 Sep 2025 10:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHs8-0004Lc-6o; Wed, 10 Sep 2025 10:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1118109;
 Wed, 10 Sep 2025 10:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwrE=3V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uwHs6-0004LW-Ky
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 10:16:14 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d59ae28-8e2f-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 12:16:12 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-33c9f2bcdceso31964761fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 03:16:12 -0700 (PDT)
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
X-Inumbo-ID: 2d59ae28-8e2f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757499372; x=1758104172; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1kaL6Mnx2gH5E13iVZci7fObqBOOVo+qKkougytvlI=;
        b=ce0v63GbgXdkv7PIs++omtmNYAr6/EXdjl5KqGGEjjAwAxt9HEkswBx5oqmOce1JwR
         8TQMVa4Snp/BuFmJrxftzpuumyCWdIYtuKCs42MQfVR3ibSLQnWR+8gyRRcw5oLnWQ0G
         NU7uzHDm+0YYRtveg7mONipORIG2d7OC0AKgTGydloQ2jKC5r5/nqMQZk6v3o7gaozqO
         hAPMLYDhVJ8pRiX55j0Fg+sKEP2JXpBZu3ZN5mH7RSbGy/zV/yRf+D6LQ8pLIA9UXqGA
         iSxBo56m5afN5Q9+C2/r2As1i4lyfl0KsQ4wFrznJLzWsTStDX2EG7o+diz9qL3debEw
         MADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757499372; x=1758104172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1kaL6Mnx2gH5E13iVZci7fObqBOOVo+qKkougytvlI=;
        b=OPA6Ghx7UKx6UClpHj31v1Ly21UEFsGx595tHhZ0J2dqlhTl1x4RDMtxgmGZZHdbmD
         +dfBwhMF8CzoG2NmEvKhxY/KeEjy54VNGc+28IbMh3pUEzqUkehYz7FRHZlIjkePLy4L
         pxepdH4YLDhrdK+kW/UgtdjS7dVwWFXThYqxL5x/TdWwMcS8wuTB/HqjaMw3Xw+juUGe
         3nGMlx+ZGAegzABk/uow6Y3yiQegqQNKyCy9mtgQ7BST94Ne89sdPvc8rXJhl/2J/Gta
         /NwGICmE/8of4OqOyGUP67MywB/R7Hqx+cSn/wA86VJlKy5wZ/Z/ljOI6G6c+ALATw9Q
         fuCw==
X-Gm-Message-State: AOJu0YwprqdX9P0JkDxsUyIWP3bTXHx1mnlgdIuB16VwRZl19TWepQMN
	0Jct6YrTrl0Upu0XPJNmpSR1lhvvV6QJWmfHpryzvIGoUsAw+C2z9zZE6p0kqZ2/pfeN2ErnUJi
	XFZxsWg1QCUXZzwDSahDEkQanzzWorn0=
X-Gm-Gg: ASbGncua/BSYgPZKTDtzmCeKZfxt6fk1dJNRdMQxG1cyv6ZChrtambuUQkTqIc9IJNe
	VrVP9elGQAi61OMPL563CWQgK2kCbTe3zmiIOTGCMUZuljmVwevz3Uv/U+QpZY+wLwMP7ulLMty
	J2RWZ4vdGid+nbcNbz0PAO5AEQnSCyPuhvveh/F/TvX2zHHCuSTgLkzNo5d8HeHe4JmlfWsM1Me
	2LvuQ==
X-Google-Smtp-Source: AGHT+IEmZxc9EWjD9ymApbizg7ZlVlUym0SuEVLn1ccZwx8eUbbVinofMrduHVTD6EsxCoHM3Bv1X0WQkmfsmmGfsSk=
X-Received: by 2002:a05:651c:214e:b0:336:c080:4149 with SMTP id
 38308e7fff4ca-33b50f93fffmr33208981fa.18.1757499371675; Wed, 10 Sep 2025
 03:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-5-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-5-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 10 Sep 2025 13:16:00 +0300
X-Gm-Features: Ac12FXzjl9SPOwJf5S296-Gm78h0olHMBwG-lMADjTcEeQmMxl2QaWRtDjvmraM
Message-ID: <CAGeoDV_MhGzL5Y8bZpgzvL-E-O50Tib48VJm4C+ip8T6eGobyg@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] emul/ns16x50: implement DLL/DLM registers
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

I appreciate you addressing the comments from the earlier version
of the patch series.

On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add DLL/DLM registers emulation.
>
> DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.
>
> Add stub for ns16x50_dlab_get() helper.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - added default registers handling for non-DLL/DLM accesses
> - used UINT8_MAX
> ---
>  xen/common/emul/vuart/ns16x50.c | 47 +++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index a3bdf9f415ca..da8583a1dc93 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -96,8 +96,22 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns1=
6x50 *vdev)
>  static int ns16x50_io_write8(
>      struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
>  {
> +    uint8_t *regs =3D vdev->regs;
> +    uint8_t val =3D *data;
>      int rc =3D 0;
>
> +    if ( ns16x50_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UA=
RT_DLM) )
> +        regs[NS16X50_REGS_NUM + reg] =3D val;
> +    else
> +    {
> +        switch ( reg )
> +        {
> +        default:
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +    }
> +
>      return rc;
>  }
>
> @@ -108,8 +122,16 @@ static int ns16x50_io_write8(
>  static int ns16x50_io_write16(
>      struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
>  {
> +    uint16_t val =3D *data;
>      int rc =3D -EINVAL;
>
> +    if ( ns16x50_dlab_get(vdev) && reg =3D=3D UART_DLL )
> +    {
> +        vdev->regs[NS16X50_REGS_NUM + UART_DLL] =3D val & UINT8_MAX;
> +        vdev->regs[NS16X50_REGS_NUM + UART_DLM] =3D (val >> 8) & UINT8_M=
AX;
> +        rc =3D 0;
> +    }
> +
>      return rc;
>  }
>
> @@ -145,9 +167,22 @@ static int ns16x50_io_write(
>  static int ns16x50_io_read8(
>      struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
>  {
> +    uint8_t *regs =3D vdev->regs;
>      uint8_t val =3D UINT8_MAX;
>      int rc =3D 0;
>
> +    if ( ns16x50_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UA=
RT_DLM) )
> +        val =3D regs[NS16X50_REGS_NUM + reg];
> +    else
> +    {
> +        switch ( reg )
> +        {
> +        default:
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +    }
> +
>      *data =3D val;
>
>      return rc;
> @@ -162,6 +197,13 @@ static int ns16x50_io_read16(
>      uint16_t val =3D UINT16_MAX;
>      int rc =3D -EINVAL;
>
> +    if ( ns16x50_dlab_get(vdev) && reg =3D=3D UART_DLL )
> +    {
> +        val =3D vdev->regs[NS16X50_REGS_NUM + UART_DLM] << 8 |
> +              vdev->regs[NS16X50_REGS_NUM + UART_DLL];
> +        rc =3D 0;
> +    }
> +
>      *data =3D val;
>
>      return rc;
> @@ -278,12 +320,17 @@ out:
>
>  static int ns16x50_init(void *arg)
>  {
> +    const uint16_t divisor =3D (UART_CLOCK_HZ / 115200) >> 4;
>      struct vuart_ns16x50 *vdev =3D arg;
>      const struct vuart_info *info =3D vdev->info;
>      struct domain *d =3D vdev->owner;
>
>      ASSERT(vdev);
>
> +    /* NB: report 115200 baud rate. */
> +    vdev->regs[NS16X50_REGS_NUM + UART_DLL] =3D divisor & UINT8_MAX;
> +    vdev->regs[NS16X50_REGS_NUM + UART_DLM] =3D (divisor >> 8) & UINT8_M=
AX;
> +
>      register_portio_handler(d, info->base_addr, info->size, ns16x50_io_h=
andle);
>
>      return 0;
> --
> 2.51.0
>
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

