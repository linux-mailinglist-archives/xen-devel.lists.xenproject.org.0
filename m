Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32D782EAD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587717.919094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY80d-00016J-QJ; Mon, 21 Aug 2023 16:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587717.919094; Mon, 21 Aug 2023 16:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY80d-00014e-NZ; Mon, 21 Aug 2023 16:44:07 +0000
Received: by outflank-mailman (input) for mailman id 587717;
 Mon, 21 Aug 2023 16:44:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPgY=EG=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1qY80c-00014Y-FH
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:44:06 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f04c4df7-4041-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 18:44:05 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-58c4f61ca12so39285387b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 09:44:05 -0700 (PDT)
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
X-Inumbo-ID: f04c4df7-4041-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692636244; x=1693241044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+F2jRBcLa1AI1IhGGWTgrljDVsVBLaFUBfyc+9vHQY=;
        b=h9gQVjzL/24yrVAU2+ni5E0xFo7n63n9tcS+78w5Z/PpLpA8y8N2VCfZiaP1/QkaGG
         +7GIzxzZSbp6qpPsywGK+qG8RVBLMnQD9VlpnvEv/hSD/+yppvbWsVIkGwtJnPOV6F4r
         QJn984VgfxOnrhG+B7VnL0b0jkkrK5leAYm9VhPwQ/GhnTRLd9EFBjuWTbBfcavkCiIx
         6TLMjyKLQOtAiZQhC9JQfJdiFzNCw6LQGQB3KoWR8LpguG4F60ExwbZFQRbHyqSODw3R
         YeGHD+hIxsu1WdQjATRSDwKVB1xHoLt7V0RpBf482RltzAyPwS2TUsrWpc8y1JxNICea
         kv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692636244; x=1693241044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+F2jRBcLa1AI1IhGGWTgrljDVsVBLaFUBfyc+9vHQY=;
        b=KGH82ZKiP6BpZohxIVrYtRsJxutSK2hrdMWUC6USqDcTavQgiBfU2bebVIgBlRcJ2U
         cvWm8qJDHZQ6TFGkG9qKY/oo5e9XS1ctOVb55fZ40sWSSe3vDZvXCTVSZ4022p1/7669
         Vos5mUqeOBqeNpNxgABErRkEGBjWgwZoJ+F5NXkWSAHY0KJsv99HNpXQpe6f/FOg+uzo
         va/7JnQETVZMwZRPQDz48aV2nkeoRgMBPM/U0NkRInfmRRh+HEzwVMaESntB0ZijC5mO
         vcxTAnemhqNDmxNwJ8Nu7piKlUyOdeWd01lVDGsPBIFrsLTmn06bhhMsCZM3F5ScQq9x
         wgzA==
X-Gm-Message-State: AOJu0YwmnO19ry6wqDUGAq4Mcnp3c7zIN4j+0HRYN3j8ckDbrvIhjCuU
	1BKD8q6n1ZY6o/vP/SRSUFOTVx/vWs7xQO65zenCgHeBgaeLqA==
X-Google-Smtp-Source: AGHT+IHO3RPAqBEQqs+3zQtGbLpwrx0rayeanswRJ7J57vyEWMxJ5P9wAMB3SLPKbSjNAwsbsNlGuibarfM7nHgetLU=
X-Received: by 2002:a25:858b:0:b0:d71:8f08:30a9 with SMTP id
 x11-20020a25858b000000b00d718f0830a9mr8558559ybk.14.1692636243863; Mon, 21
 Aug 2023 09:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692181079.git.oleksii.kurochko@gmail.com> <5e9219fb6c5e3d0ad921d7d050abc2a802d1742b.1692181079.git.oleksii.kurochko@gmail.com>
In-Reply-To: <5e9219fb6c5e3d0ad921d7d050abc2a802d1742b.1692181079.git.oleksii.kurochko@gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 21 Aug 2023 18:43:27 +0200
Message-ID: <CABfawhm3NrjsNYK77uFNQZWS9a5nJQWo3+0VXvGkit2YzCdVQg@mail.gmail.com>
Subject: Re: [PATCH v1 44/57] xen/riscv: introduce asm/vm_event.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 12:30=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/vm_event.h | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/vm_event.h

I don't think we ought to replicate this header for every arch when
clearly the functions in them are only relevant for specific
architectures. Would make more sense to me to just conditionalize the
caller side to the specific archs where these functions are actually
defined, which would largely just be CONFIG_X86.

Tamas

