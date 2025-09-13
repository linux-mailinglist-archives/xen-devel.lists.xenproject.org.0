Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AAB56156
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 16:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123297.1466418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxQuv-0003ih-O5; Sat, 13 Sep 2025 14:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123297.1466418; Sat, 13 Sep 2025 14:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxQuv-0003gx-Ks; Sat, 13 Sep 2025 14:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1123297;
 Sat, 13 Sep 2025 14:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWgP=3Y=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uxQuu-0003gr-Ip
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 14:07:52 +0000
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f99544-90ab-11f0-9809-7dc792cee155;
 Sat, 13 Sep 2025 16:07:50 +0200 (CEST)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-887764c2834so169282439f.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 07:07:50 -0700 (PDT)
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
X-Inumbo-ID: 07f99544-90ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757772469; x=1758377269; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M3PsKtcxHDBTZqejD/5uhh+ObuTl+eI1gWgG9+w7CQo=;
        b=MjawJm2xmy+mWzHqV4UjVd6MYclZMBwryvW13n8xFXzbL8xNuuzfNC2VhMgokWcwO0
         JB9mNeI/rbvxFk2twBx9C/vCebl3T1D3W4wQTC2zx5IRQKqN6nmCm0Fi9dhvlN/WYOiD
         EADq5KCZ1pfl21tP5cn/fNovCz4pqiOHoT3JYOyWrtXsUhYc11hoPHMuMyI4B+GKYUUJ
         c7+3sfFl9DAtaRKZVqkizMfp1E07NBE5eNNp0Txq9Xigwol1hq+u0IWWRGzKPs+7nUlm
         s99PGjkIf+ltnlWHj2WMoGL9QZvRUvVO943U8VE8Vwn3Je1mMQ1PH3X5zuUr0FI5sLxM
         77Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757772469; x=1758377269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3PsKtcxHDBTZqejD/5uhh+ObuTl+eI1gWgG9+w7CQo=;
        b=Rtnd+58iKFDwFe/1AaAjzab9jgItsgzASVB1q/80J/wkV6GeVE7nQsP7JS/3c85Mr6
         UbrHQQ7WwcIBE7Jc2p0I9yaeSjXUoBpIOXOziY9P4Z5pPLkGjVPJJ+ADbDaN/lGaiydx
         EiSFXS/dJwwzP5mFaWja7dw1LkrY/oq0rjlmBUfNKFZGeJa75ZHT8r5+YVRqFuvOeBdT
         RmJUm8QYLby8iXow8wGbtIHprzARHrnr3UxSYQ+e+siPSY2vVAMCRroYA6R1090eIWkd
         i6QZcoWkjzPFCwDvlK+PfbhonkpcL78g3gir5FSZ0S1cieMCPz1lnMhzUdEJyC5Ownf5
         ziww==
X-Gm-Message-State: AOJu0YxRjiuaJAl3V4J8DyjNUghoNGE/O5LicuC2xx+wl8uC/5FXqdQ1
	t6u+VnUi0Av+kU+rLYgQm3jnxPQxwLjWt5ia5L4lGrIPeSPV6ZTnhR3tq7giteEruvl51OJ43Fm
	qbRdscwVE/GZ9o7XAtAuF9RBNtXI1kBg=
X-Gm-Gg: ASbGncuF+Nhdw5zmaMamQCL4loonoVE2yYLFvmIeOjqjaAn3NGYoIf5+u0SpPD9A7Xd
	+p45vFqLojmMD2NN+JBvL4QeptgtdmYTbtwlrrry2N0qk66IXFnhFE5wDwWPmOEdOG+9lObaZBJ
	GCi73DGQHTPLu4UnfLvICKoDWeHfmYsURCfGKM5Lft9j3ES4vENOemdI9CTgllciD/7YHMxVEJV
	PnpSfc=
X-Google-Smtp-Source: AGHT+IF89tmQegCh6KAMDjdGA+TabGB+hc+yDdmhYIA9SYQsEnlna6Q8sqIe5NtrTdKlPEYGjaC7lPhF/dRnKmNMLB0=
X-Received: by 2002:a05:6602:2ccf:b0:88d:69d4:39b4 with SMTP id
 ca18e2360f4ac-890351aeffdmr794069639f.18.1757772465398; Sat, 13 Sep 2025
 07:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com>
In-Reply-To: <164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Sat, 13 Sep 2025 17:07:34 +0300
X-Gm-Features: Ac12FXwCyXiBCi50rT6fK1r8TQptK4hLc4L4nnyZXEDCLJO6_Ko1cLbg4Q5Tztg
Message-ID: <CAPD2p-no-PzREaQNnH6XWmM6qE+MNUW7aErGq8N_FeSfswoXSQ@mail.gmail.com>
Subject: Re: [PATCH][for-4.21] xen/arm: Reorder SCI resource cleanup in domain destruction
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="000000000000657449063eaf4bcc"

--000000000000657449063eaf4bcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 1:31=E2=80=AFPM Oleksii Moisieiev <
Oleksii_Moisieiev@epam.com> wrote:

Hello Oleksii

Move the SCI (System Control and Management Interface) resource cleanup
> earlier in the domain_relinquish_resources() sequence to ensure proper
> cleanup ordering during domain destruction.
>
> The SCI cleanup is now performed before TEE (Trusted Execution Environmen=
t)
> cleanup rather than after P2M mapping cleanup. This reordering ensures th=
at
> SCI resources are properly released before other subsystems that might
> depend on them are torn down.
>
> This change addresses potential resource cleanup dependencies where SCI
> resources need to be released before P2M mappings are cleaned up,
> preventing
> potential issues during domain destruction on ARM platforms with SCI
> support.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>
>  xen/arch/arm/domain.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 1a8585d02b..0ac381a5a5 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct domain *d)
>              return ret;
>  #endif
>

There is an enum above (not visible in context)

enum {
     PROG_pci =3D 1,
     PROG_tee,
     PROG_xen,
     PROG_page,
     PROG_mapping,
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
     PROG_sci,
     PROG_done,
};

I am sorry, but shouldn't PROG_sci location there reflect to where you now
put PROGRESS(sci)
(I mean above PROG_tee)?



> +    PROGRESS(sci):
> +        ret =3D sci_relinquish_resources(d);
> +        if ( ret )
> +            return ret;
> +
>      PROGRESS(tee):
>          ret =3D tee_relinquish_resources(d);
>          if (ret )
> @@ -1109,10 +1114,6 @@ int domain_relinquish_resources(struct domain *d)
>          ret =3D relinquish_p2m_mapping(d);
>          if ( ret )
>              return ret;
> -    PROGRESS(sci):
> -        ret =3D sci_relinquish_resources(d);
> -        if ( ret )
> -            return ret;
>
>      PROGRESS(p2m_root):
>          /*
> --
> 2.34.1
>
>

--=20
Regards,

Oleksandr Tyshchenko

--000000000000657449063eaf4bcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 13,=
 2025 at 1:31=E2=80=AFPM Oleksii Moisieiev &lt;<a href=3D"mailto:Oleksii_Mo=
isieiev@epam.com">Oleksii_Moisieiev@epam.com</a>&gt; wrote:<br></div><div d=
ir=3D"ltr" class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Hello O=
leksii</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Move the SCI (System Control and Managem=
ent Interface) resource cleanup<br>
earlier in the domain_relinquish_resources() sequence to ensure proper<br>
cleanup ordering during domain destruction.<br>
<br>
The SCI cleanup is now performed before TEE (Trusted Execution Environment)=
<br>
cleanup rather than after P2M mapping cleanup. This reordering ensures that=
<br>
SCI resources are properly released before other subsystems that might<br>
depend on them are torn down.<br>
<br>
This change addresses potential resource cleanup dependencies where SCI<br>
resources need to be released before P2M mappings are cleaned up, preventin=
g<br>
potential issues during domain destruction on ARM platforms with SCI suppor=
t.<br>
<br>
Signed-off-by: Oleksii Moisieiev &lt;<a href=3D"mailto:oleksii_moisieiev@ep=
am.com" target=3D"_blank">oleksii_moisieiev@epam.com</a>&gt;<br>
---<br>
<br>
=C2=A0xen/arch/arm/domain.c | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c<br>
index 1a8585d02b..0ac381a5a5 100644<br>
--- a/xen/arch/arm/domain.c<br>
+++ b/xen/arch/arm/domain.c<br>
@@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct domain *d)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0#endif<br></blockquote><div><br></div><div>There is an enum above (no=
t visible in context)</div><div><br></div><div>enum {<br>=C2=A0 =C2=A0 =C2=
=A0PROG_pci =3D 1,<br>=C2=A0 =C2=A0 =C2=A0PROG_tee,<br>=C2=A0 =C2=A0 =C2=A0=
PROG_xen,<br>=C2=A0 =C2=A0 =C2=A0PROG_page,<br>=C2=A0 =C2=A0 =C2=A0PROG_map=
ping,<br>=C2=A0 =C2=A0 =C2=A0PROG_p2m_root,<br>=C2=A0 =C2=A0 =C2=A0PROG_p2m=
,<br>=C2=A0 =C2=A0 =C2=A0PROG_p2m_pool,<br>=C2=A0 =C2=A0 =C2=A0PROG_sci,<br=
>=C2=A0 =C2=A0 =C2=A0PROG_done,<br>};</div><div><br></div><div>I am sorry, =
but shouldn&#39;t PROG_sci location there reflect to where you now put PROG=
RESS(sci)</div><div>(I mean above PROG_tee)?</div><div>=C2=A0</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
+=C2=A0 =C2=A0 PROGRESS(sci):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sci_relinquish_resources(d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( ret )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0PROGRESS(tee):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D tee_relinquish_resources(d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret )<br>
@@ -1109,10 +1114,6 @@ int domain_relinquish_resources(struct domain *d)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D relinquish_p2m_mapping(d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 PROGRESS(sci):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sci_relinquish_resources(d);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( ret )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0PROGRESS(p2m_root):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><spa=
n style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=
=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font=
></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenk=
o</font></span></div></div></div></div></div></div></div></div>

--000000000000657449063eaf4bcc--

