Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961751276C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315729.534527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqqf-0000Qr-CS; Wed, 27 Apr 2022 23:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315729.534527; Wed, 27 Apr 2022 23:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqqf-0000Os-9Z; Wed, 27 Apr 2022 23:13:29 +0000
Received: by outflank-mailman (input) for mailman id 315729;
 Wed, 27 Apr 2022 23:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIub=VF=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1njqqe-0000Om-E1
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 23:13:28 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4d5ed33-c67f-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 01:13:27 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id u3so4474989wrg.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 16:13:27 -0700 (PDT)
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
X-Inumbo-ID: a4d5ed33-c67f-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxiiRmMl5WBejmvqm2h9HANsI9aHhNewk5E5NijQr/o=;
        b=eivdzjr+bvYej3sqsPZTpahW99j1DDGQYv/x4hZi7RboztnxvKQ7F2tpzNqXB+l5qM
         ZYR1c25lB4TT0S+wSUnkLjdqsxlO2YnKAMVgChdzU84WdV49uGCQk6jJZh7nAxQnkf5b
         B0h+IPMup6u3hUC0R/Uz8qD5CWR4B7DVSrCOVhf75V2vluZ5xkLN6Xazj/kubgFQrOIQ
         35aK4WnVNMB+V+Y5c8Mpc2WKlflluuN3abRG0hpR5R6pOpRT5tfwuF3+Bc+Kkz1tCIpt
         HgOCSQgLZKTZmceJ1gdImMJREsuHsKB/4bQ8GchufK4NTq9QXORI7dnMX/iqrl68Ez89
         TI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxiiRmMl5WBejmvqm2h9HANsI9aHhNewk5E5NijQr/o=;
        b=jpdpnFtFQOivKEm3HJEplrvAh4tCjiz1cXAOpDMuO5RVPJENGhweGYWVqL5hPxFLwO
         ZzLsdEAnn+kVN54Vngo5IYhgIn+erit1QQuTmOWHIyAki+q4fnsCD6aPaDg6udoGq37B
         VV2SQ4LmeP/UVXm0Turbtn4GektWJ/Fit5ZYIyw+DbiyichkkOE0BrdfK6ot+TMOtR2m
         B6dbYfb8d0jyddy8rYrPP0h8E6bLNAkcLeCfakCNvreg/hJRFqfynGvvqy1fPdUA3VK1
         X126tZZ9V/5nhRo5B3qlGF+EoYT6mGkjfS1t+2GGuZzNk0FC1j+9ava1nBdKQ0X37NxK
         o9aA==
X-Gm-Message-State: AOAM530zkIt7p34Ze/5GxB+4rvND0jGJkiskLHCnkEMgdWMB+Jk2TTT+
	C9QEih/yLQHQd1B0oCtx1BN7FkncR/DnAcNqItQ=
X-Google-Smtp-Source: ABdhPJy9FOnAe4DIcaJl8HsJwgR7U2znP40WqNsmOLagkLtS7SLE73VR7AXDPptJEB++DH7ueAUKVIVEVZIDWRx1Uf4=
X-Received: by 2002:a5d:4645:0:b0:20a:db5d:258f with SMTP id
 j5-20020a5d4645000000b0020adb5d258fmr13708827wrs.135.1651101206642; Wed, 27
 Apr 2022 16:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <osstest-169781-mainreport@xen.org> <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
 <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 28 Apr 2022 00:13:15 +0100
Message-ID: <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	David Vrabel <dvrabel@amazon.co.uk>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000e9040605ddaaf45e"

--000000000000e9040605ddaaf45e
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

On Thu, 28 Apr 2022, 00:02 Stefano Stabellini, <sstabellini@kernel.org>
wrote

> It seems to me that it is acceptable to allocate memory with interrupt
> disabled during __init. I cannot see any drawbacks with it. I think we
> should change the ASSERT to only trigger after __init: system_state ==
> SYS_STATE_active.
>
> What do you think?
>

This would solve the immediate problem but not the long term one (i.e cpu
hotplug).

So I think it would be better to properly fix it right away.

Cheers,

>

--000000000000e9040605ddaaf45e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefano,<br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, 28 Apr 2022, 00:02 Stefano Stabelli=
ni, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a=
>&gt; wrote</div></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
It seems to me that it is acceptable to allocate memory with interrupt<br>
disabled during __init. I cannot see any drawbacks with it. I think we<br>
should change the ASSERT to only trigger after __init: system_state =3D=3D<=
br>
SYS_STATE_active.<br>
<br>
What do you think?<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">This would solve the immediate problem but not the long t=
erm one (i.e cpu hotplug).</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">So I think it would be better to properly fix it right away.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000e9040605ddaaf45e--

