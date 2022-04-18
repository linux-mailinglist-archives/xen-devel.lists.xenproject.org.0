Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDF7506010
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 01:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307655.522876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngaPg-00033y-37; Mon, 18 Apr 2022 23:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307655.522876; Mon, 18 Apr 2022 23:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngaPf-00031N-VT; Mon, 18 Apr 2022 23:04:07 +0000
Received: by outflank-mailman (input) for mailman id 307655;
 Mon, 18 Apr 2022 23:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGAa=U4=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1ngaPe-00031H-O5
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 23:04:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d83d44a2-bf6b-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 01:04:05 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id m14so20179952wrb.6
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 16:04:05 -0700 (PDT)
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
X-Inumbo-ID: d83d44a2-bf6b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOg9LZC2IjRjuND7dpeRT2K91j6txG9Sx44bcjjryEw=;
        b=JZnvG/91J5N4Vj4TOnNWS5OAKc2gHrpGNw0Rtp1nbIMex+2wpnPz6Bh/juHxXedzft
         u+mtdor7hICvROmS8lhIhj8DwSyW9WrHSJlgIBMJajJQwOE2YmX1tBo8N6KK4qCPh+iO
         wVYMKqD2qC0m4FrxcSf/oXghzQ/ig7u5z7DpszcpUKRxsgXWVHznBtVk/sG/ioi0ovWd
         Ao+WnRBnxFuO+AsSBA/fSI4SeKlksvfPpJ5Gu/4yaZJEM+wLQUujRSahhd10VzyvzaDU
         KFlqPw6gEqCmmUiLvZrdEpRtLzQCPSJsgHDr3VBVGexlRZ7UuwkEqt4/avaPGemkTkSW
         4YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOg9LZC2IjRjuND7dpeRT2K91j6txG9Sx44bcjjryEw=;
        b=fyCGJjy0bGuVM+x+aw4BglZRhzx19esXGkWx0Yg4m+XWQAffze7fTQZpnS53kfQBwN
         9yLyEGrG3aTXtsFvaxeS/6t/SgfrNymCw+Cupz9M9AY0ygX7jMhpL7vRmS9QeVlans/A
         vveIYVE+CkLecnPPY92rkegJ5yDwXur8nxEOedeiznLKXWK5zoowO/p4IFZUhFWT2Ezc
         3tad4d1v5hNvq66eL6ZMJitY4PUxvk6qRWFBzQZfG04LYoCUeMZtu6BulwYGI0wQVLso
         6ga35wEQB2H5t0/v0yYItSHY/uTfCS/uUvwZHDLItgJ9qO/ZApVjq5Z8v7dw2iu7kfaq
         oO5A==
X-Gm-Message-State: AOAM531xOMQEg7R9TsaC1gLJNQ987cg2UDLnFq+pZ0+puN7H/zl7mWA3
	Kq5nazpLw6s8kTDuWOUyPVv7fue+ukEBsYBKFB8=
X-Google-Smtp-Source: ABdhPJzFu/hDOhyUh6ftWEfSYIcMxDQRwz4rxChpKaXL9oMbO2Pui8JLqjJiZeI+OhAlELQ0zP5ovbdYHQaqTtxDRXA=
X-Received: by 2002:adf:dd8a:0:b0:207:9e5f:fd0a with SMTP id
 x10-20020adfdd8a000000b002079e5ffd0amr9280174wrl.94.1650323044809; Mon, 18
 Apr 2022 16:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-3-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2204181417370.915916@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2204181417370.915916@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 18 Apr 2022 23:03:52 +0000
Message-ID: <CAJ=z9a30ADk98EP5nsS+w9QY-8exQeOLYrVQTSsJUsfwUcfFhA@mail.gmail.com>
Subject: Re: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <julien.grall@arm.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jiamei Xie <Jiamei.Xie@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: multipart/alternative; boundary="000000000000d9bdf805dcf5c65a"

--000000000000d9bdf805dcf5c65a
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting issues.

On Mon, 18 Apr 2022, 21:41 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> > +static uint64_t virtio_mmio_base;
> > +static uint32_t virtio_mmio_irq;
>
> No need for these two variables to be global in this file, they could be
> local variables in libxl__arch_domain_prepare_config.


It is more than "no need". Libxl can be used by a daemon to handle multiple
domains. So we can't use static variable to keep track of local information.

Cheers,

--000000000000d9bdf805dcf5c65a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Sorry for the formatting issues.<br><br><div class=3D"gmail_quote" dir=
=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Apr 2022, 21:41 =
Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabelli=
ni@kernel.org</a>&gt; wrote:</div></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +static uint64_t virtio_mmio_base;<br>
&gt; +static uint32_t virtio_mmio_irq;<br>
<br>
No need for these two variables to be global in this file, they could be<br=
>
local variables in libxl__arch_domain_prepare_config.</blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">It is more than &quot;no n=
eed&quot;. Libxl can be used by a daemon to handle multiple domains. So we =
can&#39;t use static variable to keep track of local information.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><b=
r></div></div>

--000000000000d9bdf805dcf5c65a--

