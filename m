Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD776C0ED2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 11:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511824.791096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCmv-0005iA-Ly; Mon, 20 Mar 2023 10:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511824.791096; Mon, 20 Mar 2023 10:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCmv-0005fl-JI; Mon, 20 Mar 2023 10:30:49 +0000
Received: by outflank-mailman (input) for mailman id 511824;
 Mon, 20 Mar 2023 10:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=noC+=7M=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1peCmt-0005ff-AM
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 10:30:47 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 452976d3-c70a-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 11:30:44 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id y20so14261102lfj.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 03:30:44 -0700 (PDT)
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
X-Inumbo-ID: 452976d3-c70a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679308244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsTkbvT4rgjE0ML7sLxhUzy8YVNFx72szjO8MAtj1Mk=;
        b=AnoKtzYEi2Kv45j77jhfn8SqiGvGzYrfWB8uFgLUI6mfRtNoE8zyQJnv/v5lrLxDrl
         WZHsEuHKYb3oQzdw03pBMTb2Jbkgx3HB9HPqortkSQv/+D82KA4KKqN0p0G/KZQhOnsl
         c4K8sqvrDb3DYSzub0m+kY1Rf/5vn8jErxzKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsTkbvT4rgjE0ML7sLxhUzy8YVNFx72szjO8MAtj1Mk=;
        b=eFFqaU7TUerCMxRPr3TxzPDbiRu8O9LD8oyuRWqNhZYY3DH9l6Nx0cR9HqzOc6RZ+w
         /yzS+DAR6LkBbvemwQyqBui1RF3OJ0udMJ0jePk9RtJgcE4xJ46IfqZPrl21K5k91b02
         2FiGdFiq0syV30esyAbaKE/9HNSeAd3rhvO1xm7mP4wf6TdYIC/ooTYz3zOW/JedP7kS
         zqW2pbcj2SeHyoScrtdonsom+zgN4TqZ554guSQ9sg23AHtxI0Cvrx+A6YnVS+uiTbyo
         xtl6HHY4CFCe204aNrNgGd7CuMM60s/qJHs1ClwNaVHkveF6KFWD8DVVF+md46Ml4lPq
         dWBw==
X-Gm-Message-State: AO0yUKUqFrtf2OYJ85xP5w7LziEpUAhYo9APQFXUkd9BaofATzZrBEt5
	JCL5ZbNUQQTX7+WW6bTT9GC4PL/62Vg/Edqck6zJfw==
X-Google-Smtp-Source: AK7set9PUQzTqKtloQw2fWAywttrqvIrbkdtHeSYK1XaD0bqfHi/55Gakb7KYe3qtUtJaLyoHef1ToQDbOUm67NLWEw=
X-Received: by 2002:a19:c510:0:b0:4d5:ca32:6ed5 with SMTP id
 w16-20020a19c510000000b004d5ca326ed5mr3413626lfe.3.1679308243813; Mon, 20 Mar
 2023 03:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230317131949.4031014-1-luca.fancellu@arm.com> <20230317131949.4031014-9-luca.fancellu@arm.com>
In-Reply-To: <20230317131949.4031014-9-luca.fancellu@arm.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 20 Mar 2023 10:30:33 +0000
Message-ID: <CA+zSX=YByE9ucFxWWTQrJhet41u-Db5u=ax+9aA8F81bLC-khQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] tools: add physinfo arch_capabilities handling
 for Arm
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000005763da05f7526b11"

--0000000000005763da05f7526b11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 1:20=E2=80=AFPM Luca Fancellu <luca.fancellu@arm.co=
m> wrote:

> On Arm, the SVE vector length is encoded in arch_capabilities field
> of struct xen_sysctl_physinfo, make use of this field in the tools
> when building for arm.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>

Golang bits:

Acked-by: George Dunlap <george.dunlap@citrix.com>

--0000000000005763da05f7526b11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 17, 2023 at 1:20=E2=80=AF=
PM Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.com">luca.fancellu=
@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Arm, the SVE vector length is encoded in arch_capabilities field=
<br>
of struct xen_sysctl_physinfo, make use of this field in the tools<br>
when building for arm.<br>
<br>
Signed-off-by: Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.com" t=
arget=3D"_blank">luca.fancellu@arm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Golang bits:</div><div><br></div><div>Acked-by: George Dunlap &lt;<=
a href=3D"mailto:george.dunlap@citrix.com">george.dunlap@citrix.com</a>&gt;=
</div><div>=C2=A0</div></div></div>

--0000000000005763da05f7526b11--

