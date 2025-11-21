Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDEAC77BDE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168251.1494326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLr9-0003Jz-U3; Fri, 21 Nov 2025 07:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168251.1494326; Fri, 21 Nov 2025 07:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLr9-0003GE-O1; Fri, 21 Nov 2025 07:46:59 +0000
Received: by outflank-mailman (input) for mailman id 1168251;
 Fri, 21 Nov 2025 07:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaQO=55=redhat.com=kkostiuk@srs-se1.protection.inumbo.net>)
 id 1vMLnc-0002ep-V0
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:43:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf1a05bb-c6ad-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 08:43:19 +0100 (CET)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-FO5fd91IOaGCRozr1PkAyw-1; Fri, 21 Nov 2025 02:43:16 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so49599431cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 23:43:16 -0800 (PST)
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
X-Inumbo-ID: bf1a05bb-c6ad-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763710998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UaRrR/bSI9ifC9leQ59k3dsXaJNuvD/OvOK7ugPKPuQ=;
	b=GPltHw1dgFf9BLHPWOjuQktCYFUWiXgMTMyQQb9r5rJuMecy1Mlrxm0ADbErYh2NOD1Q5p
	3ZIIoEnISpQ5PeWdvzQHzQGQR1nLuXZYImx2lQyUBRoW/V5W7MAJL11+MBhK8Dy5cw7p8Q
	rdwaiCv0b6Q1KMtnHikHkBpmDlfEEkw=
X-MC-Unique: FO5fd91IOaGCRozr1PkAyw-1
X-Mimecast-MFC-AGG-ID: FO5fd91IOaGCRozr1PkAyw_1763710996
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763710996; x=1764315796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaRrR/bSI9ifC9leQ59k3dsXaJNuvD/OvOK7ugPKPuQ=;
        b=ZudeOENtKw34Kx4+n/CaIK/mMz4g1aVX7cJtIA8QIANH1sJ4oPX8PhxQkNLFSXOFmE
         fs6qdwNO5pDI3GfZORX1UQdo42WtzRuYWPHT/pwByCtKLmGxyGiQ4R4hXJAbzDB3FUza
         lxVsPKUWGoScO1xOaewRN2xXdMpUBU2mGkgRtRcRRa6Gp/NgbdDFzz4jgUzThVfIb7w5
         yKccxPYOJo4Og1Rzrat8Z0ypWHjJI4fLMpd9pOyE/WgmCBsl5kkaBtJGTf37TlMSKhfc
         gAUiuELTQ17HBWm0uTwuCdbRqYRmiKLZGflPjjNl8ujv7dOt0Kni0Es/76r1fBbYGpeZ
         MmOg==
X-Forwarded-Encrypted: i=1; AJvYcCWIkc9038ZcG9Y44g8hy9dIwJ801hZh8NpOWc/G5whwiDrux28f3T82TtD4ZTHc7yIItWymK+vrQvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya/VL/8M+svFj4Iz6bP7adZ9kAJ4q2kQdAcqE8+l3qVT4Tfh4H
	P33KKRK9V/lSTTDAP/e3Q+vos1aVhIwDFU4h+V/STHo9IDsNjTd+7cR4jqpVdBpoODfLDbwY+mQ
	a8IfgJrGYmQOU9j4W1lwehpwU3BPt56qh4W9SKkVTdFYIJxPSNeYGerq7l6XmuMqFgxutTbkzzV
	m7q/9OMKjkKry9UjTm7hpN/fU9O2Ehp1dIbpRGRONOD9o=
X-Gm-Gg: ASbGncusvUKYqMgDri/wIyJjmUUQi99XEr0QXBPKQ/jbZ3okHRW+ALelswAAMVDeicB
	iDYV/ana7+twqq1jJmcAy5wXeF6ery72SNsOHuX4uYpQvO45wvOaaEk4xpDSuj9sfC1pImJgVkq
	5BFxe//HU7ipokYg4/LMLs7AUN880ZaUTzrmkDEfR8xOGrifpbOG32MP3TVyrAQeQNZc6Y
X-Received: by 2002:a05:622a:199b:b0:4ed:ae38:6592 with SMTP id d75a77b69052e-4ee589409f9mr19048271cf.79.1763710996257;
        Thu, 20 Nov 2025 23:43:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETP0cHXZT3TQIN11rmLao5OEegQ9+57ZsItOyprELi91KV6ANui+OB+j0cbxmwyqlkyxoABL6wqmfFCHzvktk=
X-Received: by 2002:a05:622a:199b:b0:4ed:ae38:6592 with SMTP id
 d75a77b69052e-4ee589409f9mr19047861cf.79.1763710995835; Thu, 20 Nov 2025
 23:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20251120191339.756429-1-armbru@redhat.com> <20251120191339.756429-14-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-14-armbru@redhat.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Fri, 21 Nov 2025 09:43:04 +0200
X-Gm-Features: AWmQ_bmdKUn6ydK6C5Q1jdfMet69rDLS9kOEgzlcXdE8rv6sRstOoduZH2Z6aYY
Message-ID: <CAPMcbCqzp9BwUvRF1kt1CoeftAL3jiVWoWE_3DyrkBx+dyKabQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] qga/commands-win32: Use error_setg_win32() for
 better error messages
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com, pizhenwei@bytedance.com, 
	alistair.francis@wdc.com, stefanb@linux.vnet.ibm.com, kwolf@redhat.com, 
	hreitz@redhat.com, sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, 
	mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com, 
	shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com, 
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org, 
	edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com, 
	sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, philmd@linaro.org, 
	alex@shazbot.org, clg@redhat.com, peterx@redhat.com, farosas@suse.de, 
	lizhijian@fujitsu.com, dave@treblig.org, jasowang@redhat.com, 
	samuel.thibault@ens-lyon.org, michael.roth@amd.com, zhao1.liu@intel.com, 
	mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com, 
	liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
	marcandre.lureau@redhat.com, qemu-block@nongnu.org, qemu-ppc@nongnu.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pr_SPKQV_tUXlLA10l_zj2DuIfMvS5rRh1wWBlKMvIo_1763710996
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000064bbee064415f7a2"

--00000000000064bbee064415f7a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

On Thu, Nov 20, 2025 at 9:14=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> We include numeric GetLastError() codes in error messages in a few
> places, like this:
>
>     error_setg(errp, "GRIPE: %d", (int)GetLastError());
>
> Show text instead, like this:
>
>     error_setg_win32(errp, GetLastError(), "GRIPE");
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/commands-win32.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index acc2c11589..0fd0c966e4 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -1798,8 +1798,8 @@ void qmp_guest_set_time(bool has_time, int64_t
> time_ns, Error **errp)
>      tf.dwHighDateTime =3D (DWORD) (time >> 32);
>
>      if (!FileTimeToSystemTime(&tf, &ts)) {
> -        error_setg(errp, "Failed to convert system time %d",
> -                   (int)GetLastError());
> +        error_setg_win32(errp, GetLastError(),
> +                         "Failed to convert system time");
>          return;
>      }
>
> @@ -1810,7 +1810,8 @@ void qmp_guest_set_time(bool has_time, int64_t
> time_ns, Error **errp)
>      }
>
>      if (!SetSystemTime(&ts)) {
> -        error_setg(errp, "Failed to set time to guest: %d",
> (int)GetLastError());
> +        error_setg_win32(errp, GetLastError(),
> +                         "Failed to set time to guest");
>          return;
>      }
>  }
> @@ -1834,13 +1835,12 @@ GuestLogicalProcessorList
> *qmp_guest_get_vcpus(Error **errp)
>          (length > sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION))) {
>          ptr =3D pslpi =3D g_malloc0(length);
>          if (GetLogicalProcessorInformation(pslpi, &length) =3D=3D FALSE)=
 {
> -            error_setg(&local_err, "Failed to get processor information:
> %d",
> -                       (int)GetLastError());
> +            error_setg_win32(&local_err, GetLastError(),
> +                             "Failed to get processor information");
>          }
>      } else {
> -        error_setg(&local_err,
> -                   "Failed to get processor information buffer length:
> %d",
> -                   (int)GetLastError());
> +        error_setg_win32(&local_err, GetLastError(),
> +                         "Failed to get processor information buffer
> length");
>      }
>
>      while ((local_err =3D=3D NULL) && (length > 0)) {
> --
> 2.49.0
>
>

--00000000000064bbee064415f7a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Nov 20, 2025 at 9:14=E2=80=AFPM Markus Armbruster &lt;<a h=
ref=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">We include numeric GetLas=
tError() codes in error messages in a few<br>
places, like this:<br>
<br>
=C2=A0 =C2=A0 error_setg(errp, &quot;GRIPE: %d&quot;, (int)GetLastError());=
<br>
<br>
Show text instead, like this:<br>
<br>
=C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(), &quot;GRIPE&quot;);<br=
>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index acc2c11589..0fd0c966e4 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -1798,8 +1798,8 @@ void qmp_guest_set_time(bool has_time, int64_t time_n=
s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0tf.dwHighDateTime =3D (DWORD) (time &gt;&gt; 32);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!FileTimeToSystemTime(&amp;tf, &amp;ts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Failed to convert syste=
m time %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int)=
GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Failed to convert system time&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1810,7 +1810,8 @@ void qmp_guest_set_time(bool has_time, int64_t time_n=
s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!SetSystemTime(&amp;ts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Failed to set time to g=
uest: %d&quot;, (int)GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(errp, GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Failed to set time to guest&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -1834,13 +1835,12 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(length &gt; sizeof(SYSTEM_LOGICAL_PROCES=
SOR_INFORMATION))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D pslpi =3D g_malloc0(length);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (GetLogicalProcessorInformation(pslpi,=
 &amp;length) =3D=3D FALSE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err, &quot=
;Failed to get processor information: %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(int)GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(&amp;local_err,=
 GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to get processor information&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;local_err,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Failed to get processor information buffer length: %d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int)=
GetLastError());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(&amp;local_err, GetLastError(=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Failed to get processor information buffer length&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while ((local_err =3D=3D NULL) &amp;&amp; (length &gt; =
0)) {<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--00000000000064bbee064415f7a2--


