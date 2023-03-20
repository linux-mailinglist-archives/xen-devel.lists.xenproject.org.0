Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732EC6C2351
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 22:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512135.791856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMcM-0004TS-MU; Mon, 20 Mar 2023 21:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512135.791856; Mon, 20 Mar 2023 21:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMcM-0004R8-Im; Mon, 20 Mar 2023 21:00:34 +0000
Received: by outflank-mailman (input) for mailman id 512135;
 Mon, 20 Mar 2023 21:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkzI=7M=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1peMcK-0004R2-CK
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 21:00:32 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5fe1f7-c762-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 22:00:30 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id j24so2818655wrd.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 14:00:30 -0700 (PDT)
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
X-Inumbo-ID: 3f5fe1f7-c762-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679346030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqJWahcMA1W2uh/BtssTHtJ1R/mZUz2vXzd48/3uLn0=;
        b=q3CzNCU+tpjnyUzR1KUARZjmYYg9E+/ABzmcwLkDaS+iGU/gh8hVtTThyhXJfzUSu7
         iNB0K6GSpwQkAPitBDV0dVTZkePOJBa0jYbMiHWfgg/YceICAt2k199b0xgeSKd988Pt
         dH5Gg5OaFpBexI6x6UTbKGfcs3MrWDf/CAdC1DpiAh0vbxvu/MQRmEltd3K2/R6m03Wj
         NNOmrFLqYQlNBHAmfearN+Ez7zvabsZ8cW/csi/yi+TNQdgSJJUXMwbnNJr8BqQIIbbx
         CBYPLRmoA7vpb+2zEkh8VLn4NkA+Vr2n0JwazjRqGKmMHEe78zgYpHikg3Rwy9anAU2h
         z7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679346030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqJWahcMA1W2uh/BtssTHtJ1R/mZUz2vXzd48/3uLn0=;
        b=j72EtwmNICCHfqEnWq/zT008fqK5UDzmCX5evJK6umJ4RwHZt2yB0f3RcfcxvlEa0C
         CnMc0ROi5f3oATWGKKwzK0oJIQ6sULD3PNBWEVPnrenaJ8D5NS/CojUopkKzXSdPwfr8
         pocjYdwvrYai+x/j2BYmk9pw4NGa0h5tbVIglw0GWtDiov/+4AKj4e4dGhwYRkHn2Duk
         WMQtQn0o31vt/yYbcE+1N/+JHiSvNzgSGQ/khrg3zj8Pux2Cz+kHIyppv4JptTq/QWJv
         z1k4SnNiYjDOnkfzxxtIhCBU10OkVxQUbhkMyeUpExVujpH7tjBmv4oojPmvC/49jNNu
         bg9g==
X-Gm-Message-State: AO0yUKWV4PgI/r+cjlJXbYco3KoGU16oFp088PMBSUjJLIm2Tq9g4Bls
	brCKGtGTPIG+ZpwDz1Nn7Zp2/yJw73CHFcUhiBE+UMlxzz4=
X-Google-Smtp-Source: AK7set9elKwJ8zTMBum2ABjr6yOytTdy2Eh2mSPOxO1w52FCIEOIJp14m5KKsvESLB7SGV0Fu3+RlDQwd4nsDxr6pBM=
X-Received: by 2002:a50:ce45:0:b0:4fb:80cf:898b with SMTP id
 k5-20020a50ce45000000b004fb80cf898bmr460182edj.7.1679346008983; Mon, 20 Mar
 2023 14:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230320000554.8219-1-jandryuk@gmail.com> <A6498A22-B701-4B0A-884E-575EEBD77EAB@gmail.com>
In-Reply-To: <A6498A22-B701-4B0A-884E-575EEBD77EAB@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Mar 2023 16:59:57 -0400
Message-ID: <CAKf6xpsnUambc26RFktFRmj3z5o4wBz9qBBMvVzCBH_BO6n0Rw@mail.gmail.com>
Subject: Re: [PATCH] xen: Fix host pci for stubdom
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 2:41=E2=80=AFPM Bernhard Beschow <shentey@gmail.com=
> wrote:
>
>
>
> Am 20. M=C3=A4rz 2023 00:05:54 UTC schrieb Jason Andryuk <jandryuk@gmail.=
com>:
> >PCI passthrough for an HVM with a stubdom is PV PCI passthrough from
> >dom0 to the stubdom, and then QEMU passthrough of the PCI device inside
> >the stubdom.  xen-pciback has boolean module param passthrough which
> >controls "how to export PCI topology to guest".  If passthrough=3D1, the
> >frontend shows a PCI SBDF matching the backend host device.  When
> >passthough=3D0, the frontend will get a sequentially allocated SBDF.
> >
> >libxl passes the host SBDF over QMP to QEMU.  For non-stubdom or stubdom
> >with passthrough=3D1, this works fine.  However, it fails for
> >passthrough=3D0 when QEMU can't find the sysfs node for the host SBDF.
> >
> >Handle all these cases.  Look for the xenstore frontend nodes.  If they
> >are missing, then default to using the QMP command provided SBDF.  This
> >is the non-stubdom case.  If xenstore nodes are found, then read the
> >local SBDF from the xenstore nodes.  This will handle either
> >passthrough=3D0/1 case.
> >
> >Based on a stubdom-specific patch originally by Marek
> >Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>, which is ba=
sed
> >on earlier work by HW42 <hw42@ipsumj.de>
> >
> >Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >---
> > hw/xen/xen-host-pci-device.c | 96 +++++++++++++++++++++++++++++++++++-
> > hw/xen/xen-host-pci-device.h |  6 +++
> > 2 files changed, 101 insertions(+), 1 deletion(-)
> >
> >diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
> >index 8c6e9a1716..51a72b432d 100644
> >--- a/hw/xen/xen-host-pci-device.c
> >+++ b/hw/xen/xen-host-pci-device.c
> >@@ -9,6 +9,7 @@
> > #include "qemu/osdep.h"
> > #include "qapi/error.h"
> > #include "qemu/cutils.h"
> >+#include "hw/xen/xen-legacy-backend.h"
> > #include "xen-host-pci-device.h"
> >
> > #define XEN_HOST_PCI_MAX_EXT_CAP \
> >@@ -33,13 +34,101 @@
> > #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
> > #define IORESOURCE_MEM_64       0x00100000
> >
> >+/*
> >+ * Non-passthrough (dom0) accesses are local PCI devices and use the gi=
ven BDF
> >+ * Passthough (stubdom) accesses are through PV frontend PCI device.  T=
hose
>
> I'm unable to parse this sentence, which may be due to my unfamiliarity w=
ith Xen terminology.

It's two sentences, but it's missing a period.
"Non-passthrough (dom0) accesses are local PCI devices and use the
given BDF."  and "Passthough (stubdom) accesses are through PV
frontend PCI device."

> There is also an extra space before "Those".

It's two spaces between sentences, which visually separates the
sentences.  It's a common formatting, so I think it's okay.

Thanks for taking a look.

> >+ * either have a BDF identical to the backend's BFD (xen-backend.passth=
rough=3D1)

(And a typo here: s/BFD/BDF/)

> >+ * or a local virtual BDF (xen-backend.passthrough=3D0)
> >+ *
> >+ * We are always given the backend's BDF and need to lookup the appropr=
iate
> >+ * local BDF for sysfs access.
> >+ */

Regards,
Jason

