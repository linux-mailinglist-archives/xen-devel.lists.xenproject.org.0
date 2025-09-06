Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92621B4774D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 23:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113554.1461236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uv0Ct-0004OP-LF; Sat, 06 Sep 2025 21:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113554.1461236; Sat, 06 Sep 2025 21:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uv0Ct-0004Le-IG; Sat, 06 Sep 2025 21:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1113554;
 Sat, 06 Sep 2025 21:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTp=3R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uv0Cs-0004LY-KL
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 21:12:22 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cad02a1-8b66-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 23:12:20 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-336c2194a65so25711781fa.2
 for <xen-devel@lists.xenproject.org>; Sat, 06 Sep 2025 14:12:20 -0700 (PDT)
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
X-Inumbo-ID: 2cad02a1-8b66-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757193140; x=1757797940; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1YUNJZqPjxHJSc8Jg7VGMsUgSR+kl5Uak2Fz4Fd8n4=;
        b=Ux4Tap3Pa+4oki6lEyt82hP2H43cZ+amUhl5FrfCl6Qdoxt8h9eoPQXDU4KOU+toO1
         Q2Ba3DpCrwXuF+6uwZmK17wIkU9cZwcXFEQz/yCKr4agOv/UKJ7aKNedDW70YI6VYkMz
         dvMzwhehzmPMErZkgslXRnQK0YdXKmrMmJAblDe8snpkdZqMPpiqSaWe9lYhpRNExzXw
         NWn+aWH1pAn3CevBouqPKnMWE03AOf7NTXmOe0esdNXLm9dSvRcj5FnCAo8QhES7+ioV
         axD2208BbP0UEWrPuCh7tnnXgC+zah1PCIOCCWPu8jcE2aaDUeTxszytDLqIUbXwo+1d
         YLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757193140; x=1757797940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1YUNJZqPjxHJSc8Jg7VGMsUgSR+kl5Uak2Fz4Fd8n4=;
        b=jQkCfL0/Onk57MnJ7VW+gzfH1KOh7GrYBzwhj+G+x3xqgvKjOrNkW4fTfMlaZAF7gI
         mFz0neLaR9LWfKXgZCzfID5ubW9fIFrnjrE6Zs2sHSAr377gzTis1VzGOPVBKCrFbJ9Z
         1L40Z7CYUHIvkoa4Z/uhHsO5pr5IDVQ7+wRPQ/ZaRn8N3vU2Mzi2gxYEBkpnD09o5DKp
         J1VGyotpPfriJx83QHyLT97yL840Fo3WZPfbZKRtvRPYNoJ1R2iaZA/4uGZlqjsvPxZT
         EgOM2tSJTfE99wRhUySP15+I58QXzAf8Zlj9vWudWEbyc0byUOAb5s9pt3gXrqTaryml
         UaLA==
X-Gm-Message-State: AOJu0YwwrUTNumUJskkk4yQ3p9bWdT2Pnbx1MUGlb1px8xhpe7dHnMfT
	uQeZ4y9GodLnIb6a2qn6buaism+p+phOTMQGaz7HzFZiYNORpFXWO1lLRXveZ866GJDeLTIbCd4
	/jCo4iB99/8zmF57WgndQdL630fMNGh4=
X-Gm-Gg: ASbGncvazgxGWg+43APb8LusxpdkoDqnjoNPrC9FhaQ6RMvopHS3UDcpNT/krLGepm7
	kbas2rYTWx3KUHXrSVFmaQJ5yUEBymGWAx0DCQtzOb2ZYdynaqmJMPevJmtGMPoRIF9wUobWhp0
	21ow5FmFNbKlzy9bCI7L0mvpTxnm0PdcICzdEu3hh6xPcbib6e8DJy5+TmBdZPl0IcFuLCiK1L1
	s5cK8vfkT0KKug3
X-Google-Smtp-Source: AGHT+IFyz5ci8gEnwgRws8nKH5t7vD2VIn2E2Srz/SNYPxV2Ga/dN/uf47xVpaowL5rS1P34xCJTh75Q4EF/UYHJEPg=
X-Received: by 2002:a2e:a78a:0:b0:336:e102:95fd with SMTP id
 38308e7fff4ca-33b52b71809mr8925441fa.29.1757193139287; Sat, 06 Sep 2025
 14:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-5-dmukhin@ford.com>
In-Reply-To: <20250905232715.440758-5-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sun, 7 Sep 2025 00:12:08 +0300
X-Gm-Features: Ac12FXwGHdVJ_iZIvTssQsbw4bPxufgrKp0zubMpLRCiBqTjWitvVG3Dwh_bXvE
Message-ID: <CAGeoDV9wbhkDr7MSOVCZoiu8xqzmtwPY4hUdBtmeZiNKqj8=-w@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] emul/ns16x50: implement DLL/DLM registers
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Sat, Sep 6, 2025 at 3:11=E2=80=AFAM <dmukhin@xen.org> wrote:
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
> Changes since v5:
> - dropped ns16x50_dlab_get() hunk (moved to emulator stub)
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-5-=
dmukhin@ford.com/
> ---
>  xen/common/emul/vuart/ns16x50.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 0462a961e785..7f479a5be4a2 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -97,8 +97,13 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns1=
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

Some documentation (e.g., DesignWare DW_apb_uart Databook, v3.04a)
notes that if the Divisor Latch Registers (DLL and DLH) are set to
zero, the baud clock is disabled and no serial communications occur.

Should we handle the zero-divisor case to emulate this behavior more
accurately?

> +
>      return rc;
>  }
>
> @@ -109,8 +114,16 @@ static int ns16x50_io_write8(
>  static int ns16x50_io_write16(
>      struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
>  {
> +    uint16_t val =3D *data;
>      int rc =3D -EINVAL;
>
> +    if ( ns16x50_dlab_get(vdev) && reg =3D=3D UART_DLL )
> +    {
> +        vdev->regs[NS16X50_REGS_NUM + UART_DLL] =3D val & 0xff;
> +        vdev->regs[NS16X50_REGS_NUM + UART_DLM] =3D (val >> 8) & 0xff;

Instead of hardcoding 0xff here (and in similar lines below), consider
using UINT8_MAX. This makes it explicit that the value is the maximum
for a uint8_t and avoids magic numbers.

> +        rc =3D 0;
> +    }
> +
>      return rc;
>  }
>
> @@ -146,9 +159,13 @@ static int ns16x50_io_write(
>  static int ns16x50_io_read8(
>      struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
>  {
> +    uint8_t *regs =3D vdev->regs;
>      uint8_t val =3D 0xff;
>      int rc =3D 0;
>
> +    if ( ns16x50_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UA=
RT_DLM) )
> +        val =3D regs[NS16X50_REGS_NUM + reg];
> +
>      *data =3D val;
>
>      return rc;
> @@ -163,6 +180,13 @@ static int ns16x50_io_read16(
>      uint16_t val =3D 0xffff;
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
> @@ -280,12 +304,17 @@ out:
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
> +    vdev->regs[NS16X50_REGS_NUM + UART_DLL] =3D divisor & 0xff;
> +    vdev->regs[NS16X50_REGS_NUM + UART_DLM] =3D (divisor >> 8) & 0xff;
> +
>      register_portio_handler(d, info->base_addr, info->size, ns16x50_io_h=
andle);
>
>      return 0;
> --
> 2.51.0
>
>

Best regards,
Mykola

