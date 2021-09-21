Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C075412A2B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 03:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191263.341217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSUIg-00072W-KW; Tue, 21 Sep 2021 01:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191263.341217; Tue, 21 Sep 2021 01:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSUIg-000705-HB; Tue, 21 Sep 2021 01:10:22 +0000
Received: by outflank-mailman (input) for mailman id 191263;
 Tue, 21 Sep 2021 01:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kw8l=OL=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mSUIf-0006zz-13
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 01:10:21 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c041c80-bd5e-4e97-b10f-b4c2ca141a5b;
 Tue, 21 Sep 2021 01:10:19 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j13so67938927edv.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 18:10:19 -0700 (PDT)
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
X-Inumbo-ID: 9c041c80-bd5e-4e97-b10f-b4c2ca141a5b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6xsV2Snj3hmYGZRLK0SCl9aPfUPXhJvF4zDUBdiC8V8=;
        b=FphWseX+R9mo3NN4TqKJ/CROgzW8DfCc2XzEiCJcg9+diJ1RaxjFS5LUbPxzAhmML+
         so8OvAsQJ+QzW8Xa3+zJj7JXGMK1jVCBY7jJtoGsN4eacRmPvc6n8Ule3PAiXPTGPwSl
         vkIslBz/MLIBDH/n3Koe+A57EACWZ1JIMbfoZtF2xVwZ7CgcA+tKKKLKrg3m6p6j57Go
         C/xbRDm4nuowmmRMEJagW1YdZmMWBDuZBmbYEGhobfCT5JFZ1flA1AIfwkK1MYnDz70q
         7OuacPy32OPc2yYYLoQSBrb5Xlm0x4ia/oyv7DniNfM6B08QEUiWzUC3IwbWso44MQdA
         J+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6xsV2Snj3hmYGZRLK0SCl9aPfUPXhJvF4zDUBdiC8V8=;
        b=WDNSeYwIhMFEZWxxAPA4vN6oT3ukPXUnkcgm39kEIRsmQcMtQ1W8huYvk9ydpRx3gv
         /fXfIgHYtJ5BxLJ9+z91we/rnyoTnix6NTP7yi/UtSvcvVTccG+2OYBaHWQaDP9B+7d5
         knRgrZtD9NFRcmWjoQc7RQVXzpoEK4GTrwCHYFZVbR83vzOuwZp5nfYU4JvLLQwask+j
         AjifW5U/EfpxgxQZ6+mSOETYo/NiLNOOIMdaWq4mGS6k8mhfM37stsZrm7gO1TfGX+BY
         xI8YexOVPfTHFFWMxUCgmuoGKK2nST918Q4eV/InJfgQ+WOc7GnbqfJvVmMvsQ251Lst
         JCgg==
X-Gm-Message-State: AOAM533mLRAWVR57ef8llehMFuKQyKgJRJ4QVO1GNOWM/Q0u7262wxuH
	j67YKkQ4OzDMvs3Pwz7CJ7MF0LchBZdjR2ICsCE=
X-Google-Smtp-Source: ABdhPJzMY2qHNp75jeWCMEO868zFthPsNebKcpJqlnex1ETEZrQWYbkEi2sVuZO9mdTOAH2nQPXQUNapfhGe6eWQVLo=
X-Received: by 2002:aa7:df92:: with SMTP id b18mr31403763edy.47.1632186618539;
 Mon, 20 Sep 2021 18:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210920172529.24932-1-andrew.cooper3@citrix.com> <20210920194033.25998-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210920194033.25998-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 21 Sep 2021 06:10:07 +0500
Message-ID: <CAJ=z9a2VcqOow9ELDVjc4BhUQdmqTxwZho9uCowksehMKjd-bQ@mail.gmail.com>
Subject: Re: [PATCH v2.1 16/12] xen/trace: Restrict CONFIG_TRACEBUFFER to x86 PV
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="0000000000009af41205cc770fe2"

--0000000000009af41205cc770fe2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, 21 Sep 2021, 00:41 Andrew Cooper, <andrew.cooper3@citrix.com> wrote=
:

> The mapping interface can only be used by x86 PV guests.
>

Tracebuffer works on Arm... The support was added a couple of years ago
using the foreign mapping interface.


> This can and should be fixed by changing to an acquire_resource() based
> interface, which is compatbile with x86 PVH and ARM dom0's, but until thi=
s
> happens, don't give the impression of this feature being useable elsewher=
e.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> ---
>  xen/common/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index db687b1785e7..6b6f7139e6f0 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -429,6 +429,7 @@ config DTB_FILE
>
>  config TRACEBUFFER
>         bool "Enable tracing infrastructure" if EXPERT
> +       depends on PV
>         default y
>         ---help---
>           Enable tracing infrastructure and pre-defined tracepoints withi=
n
> Xen.
> --
> 2.11.0
>
>

--0000000000009af41205cc770fe2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Andrew,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, 21 Sep 2021, 00:41 Andrew Cooper, &l=
t;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The mapping interface =
can only be used by x86 PV guests.<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Tracebuffer works on Arm... The support w=
as added a couple of years ago using the foreign mapping interface.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
This can and should be fixed by changing to an acquire_resource() based<br>
interface, which is compatbile with x86 PVH and ARM dom0&#39;s, but until t=
his<br>
happens, don&#39;t give the impression of this feature being useable elsewh=
ere.<br>
<br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank" rel=3D"noreferrer">andrew.cooper3@citrix.com</a>&gt;<b=
r>
---<br>
CC: Jan Beulich &lt;<a href=3D"mailto:JBeulich@suse.com" target=3D"_blank" =
rel=3D"noreferrer">JBeulich@suse.com</a>&gt;<br>
CC: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com" target=
=3D"_blank" rel=3D"noreferrer">roger.pau@citrix.com</a>&gt;<br>
CC: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" target=3D"_blank" rel=3D"nore=
ferrer">wl@xen.org</a>&gt;<br>
CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<br>
CC: Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank" re=
l=3D"noreferrer">julien@xen.org</a>&gt;<br>
CC: Volodymyr Babchuk &lt;<a href=3D"mailto:Volodymyr_Babchuk@epam.com" tar=
get=3D"_blank" rel=3D"noreferrer">Volodymyr_Babchuk@epam.com</a>&gt;<br>
---<br>
=C2=A0xen/common/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/xen/common/Kconfig b/xen/common/Kconfig<br>
index db687b1785e7..6b6f7139e6f0 100644<br>
--- a/xen/common/Kconfig<br>
+++ b/xen/common/Kconfig<br>
@@ -429,6 +429,7 @@ config DTB_FILE<br>
<br>
=C2=A0config TRACEBUFFER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Enable tracing infrastructure&quot; =
if EXPERT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PV<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---help---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable tracing infrastructure and pre-de=
fined tracepoints within Xen.<br>
-- <br>
2.11.0<br>
<br>
</blockquote></div></div></div>

--0000000000009af41205cc770fe2--

