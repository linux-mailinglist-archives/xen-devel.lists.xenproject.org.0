Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83FBF6EDB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147288.1479621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCse-0002Y4-4K; Tue, 21 Oct 2025 13:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147288.1479621; Tue, 21 Oct 2025 13:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCse-0002We-1d; Tue, 21 Oct 2025 13:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1147288;
 Tue, 21 Oct 2025 13:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGWz=46=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vBCsc-0002WY-KL
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:58:26 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02789dfc-ae86-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 15:58:24 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b550eff972eso3825929a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 06:58:24 -0700 (PDT)
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
X-Inumbo-ID: 02789dfc-ae86-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761055103; x=1761659903; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pPdygudXA5Lxli1F/++PwS4Z3c1EOK1lIXgoZ6EeQsQ=;
        b=EQ4hWbW0KOWQSaV+VbSZtQJTTRkhsWi52UTMaWYx2NKnISeT2CM2A2n5QqPhuYqHCY
         EX1/cd9CZ0yTtdWufM4Cevpf88t+kxu9MuBtneoZLsG/z4witUdFHnnfjAQxgbmeJYZP
         +gGTclpC5YCUt/o+O7XZTQuH9WBFnOB1T2jU0bR4rVDJ0HssEKaSzOijMG7i2Yh9aMEk
         dt2VTw+k+Im6EZQuboFcWmm8Rpmt+1UyT8exHHH3pvjAxXdiAbpfV/Gje8nvjMR2UGBH
         /9ULuBTJAQ8MfMj+gZX3X00aD08E7QbDDx391/BiQAh8voXqOdgsLrV72462NIfuX7qb
         LPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055103; x=1761659903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPdygudXA5Lxli1F/++PwS4Z3c1EOK1lIXgoZ6EeQsQ=;
        b=hdpAnl+tDTCB2cgKU0FCGy3WGci9xdxFmRTldzPNV+zCdKDakFxT2O3ukUb3QLcQvZ
         VdU5CAuCvG6eS2jpayZd2TDu0VAXunw7WvNBBo/maRX4LegUf9824EUS6nJ4O8FR4Rh9
         HlxsDx5N/dE1VV9wK42tQeyy2IkjHY++O6vRcHevRamiGjgun6Sq0YIDpYbrShzBc6NO
         mjVsfcPcEFZ8IEP1Jbwi41UTeWlsg3JVf0e4zk+91jeDVwXe26eZ3N/ktsCXVGcPbGSN
         O7EkJTbHMDgjY4VGpbpx2I1jOzSLl6r5m7d4ED2jXPKk/jHkr5H3gMcyEMbQ7AgrQ9Dp
         AYFA==
X-Forwarded-Encrypted: i=1; AJvYcCUCIbYeXZAh7fQQrYbILNsa9j2EieAJtiPJSTuedlMIXwRKvieByvRHPB+hS6xYBtmdso8H+9FWT9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4WrbbVTnFnfY0lZUPGFrFEm1xylFhD/MoCSVuWBl3F02dfigb
	7Hy0kOLxRZLeEt5OAuh8ED04D4q9qFxzooLNU6uh6Aw+t78MmyxEgg6gH6q/s4yD5Q+D5LitLkF
	2DFiuFKBRqV+uPfDoUTGkuZTzZvETYpg=
X-Gm-Gg: ASbGnctCKF0F4SpyKfJLaUj30q6pWNgevIGgtWuabQhm/jP6Y+Nt6z0BSR3HjENceOD
	VaARyJkNaY4W8gG6nn+D/aeIMGaQAg9ZHY+VZwfoc+wwzXG66jJ/gfVU4frxvvcyG5X4E/25ZaT
	VaQmKqOS5wYDPAmhaabnsxXqAwL5t69CMJk4rHU9JSl/OBQx3k8oOAdT9caEN10I6LZNoHu6C2G
	bFrARphfAJhIcoSA4eVbemzh5HTeLtUAAsCzrAk9XwLgA4ndYKHki4Z7ecAX6aH8kQkTQ==
X-Google-Smtp-Source: AGHT+IE0+jvJP+jHgFuOGd7AG/ldZHoV3AfhKDbcZoT/QZC6z/r+l4UHVkiL0/gXj0woSudmdvCYrWf6uSTZqfAxvCw=
X-Received: by 2002:a17:903:94e:b0:290:533b:25c9 with SMTP id
 d9443c01a7336-290c9c8ae4dmr192613605ad.2.1761055103171; Tue, 21 Oct 2025
 06:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251017155136.16540-1-roger.pau@citrix.com>
In-Reply-To: <20251017155136.16540-1-roger.pau@citrix.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 21 Oct 2025 15:58:09 +0200
X-Gm-Features: AS18NWA58CeS14FdkkCNsTOZQHqLAPZdt-7l1MEooVrAG7tg9H44TnVA3_KoSpQ
Message-ID: <CAJy5ezpoN0mdSWStgF_RjtrnkbfkaMMsnrHHGuiQqNd4aNp0nQ@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: pass PCI domain to xc_physdev_map_pirq_msi()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000dabea70641ab9724"

--000000000000dabea70641ab9724
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 5:51=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om>
wrote:

> It's currently impossible for passthrough devices on segment different th=
an
> 0 to work correctly, as the PCI domain is not provided to
> xc_physdev_map_pirq_msi(), and hence it's unconditionally assumed that al=
l
> devices are on segment 0.
>
> Adjust the call to xc_physdev_map_pirq_msi() to pass the PCI domain in th=
e
> high 16bits of the bus parameter.  On versions of Xen where this is not
> supported the passed segment will be ignored and assume to be 0, no worse
> than the current state.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

--000000000000dabea70641ab9724
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 17,=
 2025 at 5:51=E2=80=AFPM Roger Pau Monne &lt;<a href=3D"mailto:roger.pau@ci=
trix.com">roger.pau@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">It&#39;s currently impossible for passthrough=
 devices on segment different than<br>
0 to work correctly, as the PCI domain is not provided to<br>
xc_physdev_map_pirq_msi(), and hence it&#39;s unconditionally assumed that =
all<br>
devices are on segment 0.<br>
<br>
Adjust the call to xc_physdev_map_pirq_msi() to pass the PCI domain in the<=
br>
high 16bits of the bus parameter.=C2=A0 On versions of Xen where this is no=
t<br>
supported the passed segment will be ignored and assume to be 0, no worse<b=
r>
than the current state.<br>
<br>
Signed-off-by: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.=
com" target=3D"_blank">roger.pau@citrix.com</a>&gt;<br></blockquote><div><b=
r></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.igl=
esias@amd.com">edgar.iglesias@amd.com</a>&gt;</div><div><br></div></div></d=
iv>

--000000000000dabea70641ab9724--

