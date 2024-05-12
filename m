Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A188C3728
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2024 17:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720590.1123554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6BOZ-0008FU-3B; Sun, 12 May 2024 15:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720590.1123554; Sun, 12 May 2024 15:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6BOZ-0008CA-05; Sun, 12 May 2024 15:45:51 +0000
Received: by outflank-mailman (input) for mailman id 720590;
 Sun, 12 May 2024 15:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAR6=MP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s6BOX-0008C2-Ho
 for xen-devel@lists.xenproject.org; Sun, 12 May 2024 15:45:49 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3623ce7-1076-11ef-b4bb-af5377834399;
 Sun, 12 May 2024 17:45:47 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a599eedc8eeso870232366b.1
 for <xen-devel@lists.xenproject.org>; Sun, 12 May 2024 08:45:47 -0700 (PDT)
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
X-Inumbo-ID: b3623ce7-1076-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715528747; x=1716133547; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKmmFPcTG26A6s5ZXSLIEmZvIAaQiyyqS4DPU6yGGTc=;
        b=HM2I2aJvNQMlNn3RaymTxQW3dmbO3Kw1AugKiuZFY11D5pVnmNu+5d/g9f2ZcGAk0u
         kBKJiUl9PGhrA8b1ha9xqbYDBdzDeYRVKDYE9v2hOjkl/zXMcrpB6qgbLIE1pM+mNyv3
         pbYEMqFvMwSddWNb1fdZs5AboTthyqwRRogKN3teUGYT6Wu+Cplzec4JybtyvLOQq7+l
         ijP37g1dgIDrGFf/EzZLR8VnngXvQrHlwyqSUeu1/OvwKF1MHM66HC+BlrQL9WwLIX5W
         EKCNVJt7rDt7Wzazu3X26AUsY+BbF054TCq3OVVr3L2wt4fVtoJExUwvDJqZ17U+12eo
         QJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715528747; x=1716133547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKmmFPcTG26A6s5ZXSLIEmZvIAaQiyyqS4DPU6yGGTc=;
        b=BLulC396m1BfFwJFLOm9zD8km54zt5Ou44Haw9CiDIGWmTmOrwk2FdcxO0z8X9jHyZ
         S9l0r598zoITRX+ffWkuWzkkn3an08MEX9guWlMgtyFSLh2NCXPqxvJs11eSMZk+uUj9
         LGAkHLlpQHngJ0BefjkVgFr5LLCZ102hGm65HNPTZ4ndiQ7sTU61D4UaP/7cOqhDyMep
         MIM0bkkD4f6ymKFTK4ApR92tFOyEp7zy2Djbujb+zgyBQZVC1O2kJm4J/KEof2mhHfJO
         LitvSIvZiLQ1rYmL5EsxG0tCqELgO1CVZyHmmdq22YiuTXlhTlH0B9CsUT+bQnE/pJf5
         D1Ag==
X-Gm-Message-State: AOJu0YzWKUPWzPjRJkHeewUEn0Nd8pT0UxDBa3IwdNZcxAZ055wDPmB/
	Sf7fgPV6seIts/N3FDKaM8MiLFdTQV/HGmUSuWjVMWupT6beclq3edW+c+PB1j8Koh8na+qwMhN
	f2H6C7FD9oGMDjEuGPnq6Ad37Y5g=
X-Google-Smtp-Source: AGHT+IF6oBvJFCg8ByuGE3oCtb80sRB3w6NPDaCr2YObwkOUZFXc3DeGOBWmK+O5JR44ShgLDmRHmP8JG4lcFERthv8=
X-Received: by 2002:a50:bb05:0:b0:572:5f28:1f25 with SMTP id
 4fb4d7f45d1cf-5734d5c1692mr5465543a12.7.1715528746560; Sun, 12 May 2024
 08:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240508213824.55824-1-leigh@solinno.co.uk> <20240508213824.55824-2-leigh@solinno.co.uk>
In-Reply-To: <20240508213824.55824-2-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 12 May 2024 11:45:34 -0400
Message-ID: <CAKf6xptmD79GaPrEB5-Z4p1zr-0atQUoE=1UJEv9MOBg9z-=Fw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/5] tools/libs/light: Add vlan field to libxl_device_nic
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 7:43=E2=80=AFPM Leigh Brown <leigh@solinno.co.uk> wr=
ote:
>
> Add `vlan' string field to libxl_device_nic, to allow a VLAN
> configuration to be specified for the VIF when adding it to the
> bridge device.
>
> Update libxl_nic.c to read and write the vlan field from the
> xenstore.
>
> This provides the capability for supported operating systems (e.g.
> Linux) to perform VLAN filtering on bridge ports.  The Xen
> hotplug scripts need to be updated to read this information from
> the xenstore and perform the required configuration.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

I think vlan is a better name than vid for the field.

Thanks,
Jason

