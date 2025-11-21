Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51656C77BDD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168245.1494319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLr9-0003G0-JA; Fri, 21 Nov 2025 07:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168245.1494319; Fri, 21 Nov 2025 07:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLr9-0003Cy-Fu; Fri, 21 Nov 2025 07:46:59 +0000
Received: by outflank-mailman (input) for mailman id 1168245;
 Fri, 21 Nov 2025 07:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaQO=55=redhat.com=kkostiuk@srs-se1.protection.inumbo.net>)
 id 1vMLkH-0001Ph-Qp
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:39:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43277d44-c6ad-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:39:51 +0100 (CET)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-_HjfTZ-0M7GoaHdbqsabQw-1; Fri, 21 Nov 2025 02:39:48 -0500
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88237204cc8so22370826d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 23:39:48 -0800 (PST)
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
X-Inumbo-ID: 43277d44-c6ad-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763710790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nsxb1+ZtH/utbUjrw5MXl9iDkbIwPjjaHwBbbnpvgnE=;
	b=Ku2/P5Vr9zsKs9RsXibepZpY9WRFJt1a6lf4pgNGfBCdnyvSzC7dSMMUR3RL+z2tt7uTum
	MayD/9djtiwyGUIPdmsBfINcIFgnnLXS4RcB9mqKr6eBiW84aFQFCVOyVmoUXp+IU/GWM1
	hIWssqguv8SImD3Dgoy5NjZg5X20IKo=
X-MC-Unique: _HjfTZ-0M7GoaHdbqsabQw-1
X-Mimecast-MFC-AGG-ID: _HjfTZ-0M7GoaHdbqsabQw_1763710788
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763710788; x=1764315588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsxb1+ZtH/utbUjrw5MXl9iDkbIwPjjaHwBbbnpvgnE=;
        b=I2twrUD8fnH6aPXJp7UBdn4b7h3A4I5p8ye4y15urVCpqINPEqy34B8cY080381E3G
         ftIC91sMGMijR/Fcehr+ZVUOToViIuqNXtll0UDg4jNqV91PHXW5Qmm09eUEh22lrv2o
         89/ZAK9VGqduAE0Lc+BqzwXssW543SFPy6YxsexmuAiwvtFgSFVtwj4FgVsTXOhEEe7g
         C9hlb3B33WbcOmqOpPnf3xbSMeGKE2TtfJ+wTJIVGvhowkaV+OvAgoWV3Q+DKOWnMSjn
         OVkU53mL2f1qzSUqAh5GKamGb69BGCaz1/2VOFmNbVRIaRVkYdF7o9u70DX7ftpgHfCN
         9hlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXCkpaIyqPGnYC/JgxMAGt02hBX1/Omvp9pRUW51pGN7c0bdxOs8ZLa9ztr8n4DKHfs2hZy8UBPwA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1tnARBIKPls8i/eiuKtL8I1sSigs9Kz84ZidioFz+5sBhQGud
	xXt+izM5s7CG+G0sY7oXi5nyTd/HvxrB+eneDWM0qRzP6QWwy5CnZZywO5LNx1OOu+mwiGK6guc
	5ny8qorgn2k7ZJQUkz6ooIoa0nK7Wn7Bw1t0zfhcZOfsTqf2zOo0EW9bibrIcRBFRSvQThz1c2D
	mNM67XkRRfutIwt4/sFEp0walFht26CbfMjnGzo1NUEZ0=
X-Gm-Gg: ASbGnctJINntoz7gpnwb3m9ADWVsplf1Px9yrg/Dk57PLhFv1MwljtTSq+IB8U1y7Qv
	+GbsR1FS3H2R09pNRv0jTdL4uarewxS6dhg3Zww4cS0vTEdHnsuyzWuNAT6o0695QniZUOi6ctR
	4OFxiSyV+GrtUN73N53MN9jo4WEiZ874/zX6sQp1cN5+tEPBKfCnIkb5FnclLPFLZuOKTq
X-Received: by 2002:a05:622a:118c:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4ee5884991amr17159851cf.24.1763710788159;
        Thu, 20 Nov 2025 23:39:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLyPkFkG3x0S6uI+xdlOI37nnwdMuiwb0nN0Gl6T/QJxCnm5Mh8QiLNWxZMD4XY2VbeYYHMBdVUMjbZObmN1Y=
X-Received: by 2002:a05:622a:118c:b0:4eb:a8ba:947b with SMTP id
 d75a77b69052e-4ee5884991amr17159341cf.24.1763710787702; Thu, 20 Nov 2025
 23:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20251120191339.756429-1-armbru@redhat.com> <20251120191339.756429-5-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-5-armbru@redhat.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Fri, 21 Nov 2025 09:39:36 +0200
X-Gm-Features: AWmQ_bkbTDRklsFcwFvNMZRSvPNhhVVXvsEkVWTHdAglGa310j_mRubzsRFOFH4
Message-ID: <CAPMcbCrQvuCf_zqgB7HkQd+VoP3Kha73EwTXjVqKcVEqPFz1Lg@mail.gmail.com>
Subject: Re: [PATCH 04/14] qga: Use error_setg_file_open() for better error messages
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
X-Mimecast-MFC-PROC-ID: Q2W1UOl6kEsIqrX1WCogbSHNHVBsk96CQ9tTCnwspK8_1763710788
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fce1ef064415ea4e"

--000000000000fce1ef064415ea4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

On Thu, Nov 20, 2025 at 9:13=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> Error messages change from
>
>     open("FNAME"): REASON
>
> to
>
>     Could not open 'FNAME': REASON
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/commands-linux.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
> index 4a09ddc760..5cf76ca2d9 100644
> --- a/qga/commands-linux.c
> +++ b/qga/commands-linux.c
> @@ -1502,14 +1502,15 @@ static void transfer_vcpu(GuestLogicalProcessor
> *vcpu, bool sys2vcpu,
>
>      dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
>      if (dirfd =3D=3D -1) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +        error_setg_file_open(errp, errno, dirpath);
>          return;
>      }
>
>      fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
>      if (fd =3D=3D -1) {
>          if (errno !=3D ENOENT) {
> -            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn=
);
> +            error_setg_errno(errp, errno, "could not open %s/%s",
> +                             dirpath, fn);
>          } else if (sys2vcpu) {
>              vcpu->online =3D true;
>              vcpu->can_offline =3D false;
> @@ -1711,7 +1712,7 @@ static void transfer_memory_block(GuestMemoryBlock
> *mem_blk, bool sys2memblk,
>      dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);
>      if (dirfd =3D=3D -1) {
>          if (sys2memblk) {
> -            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
> +            error_setg_file_open(errp, errno, dirpath);
>          } else {
>              if (errno =3D=3D ENOENT) {
>                  result->response =3D
> GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
> @@ -1936,7 +1937,7 @@ static GuestDiskStatsInfoList
> *guest_get_diskstats(Error **errp)
>
>      fp =3D fopen(diskstats, "r");
>      if (fp  =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        error_setg_file_open(errp, errno, diskstats);
>          return NULL;
>      }
>
> @@ -2047,7 +2048,7 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>
>      fp =3D fopen(cpustats, "r");
>      if (fp  =3D=3D NULL) {
> -        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> +        error_setg_file_open(errp, errno, cpustats);
>          return NULL;
>      }
>
> --
> 2.49.0
>
>

--000000000000fce1ef064415ea4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Nov 20, 2025 at 9:13=E2=80=AFPM Markus Armbruster &lt;<a h=
ref=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Error messages change fro=
m<br>
<br>
=C2=A0 =C2=A0 open(&quot;FNAME&quot;): REASON<br>
<br>
to<br>
<br>
=C2=A0 =C2=A0 Could not open &#39;FNAME&#39;: REASON<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-linux.c | 11 ++++++-----<br>
=C2=A01 file changed, 6 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
index 4a09ddc760..5cf76ca2d9 100644<br>
--- a/qga/commands-linux.c<br>
+++ b/qga/commands-linux.c<br>
@@ -1502,14 +1502,15 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,<br>
<br>
=C2=A0 =C2=A0 =C2=A0dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
=C2=A0 =C2=A0 =C2=A0if (dirfd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, dirpath);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fd =3D openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);=
<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno !=3D ENOENT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s/%s\&quot;)&quot;, dirpath, fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;could not open %s/%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirpath, fn);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (sys2vcpu) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;online =3D true;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcpu-&gt;can_offline =3D fa=
lse;<br>
@@ -1711,7 +1712,7 @@ static void transfer_memory_block(GuestMemoryBlock *m=
em_blk, bool sys2memblk,<br>
=C2=A0 =C2=A0 =C2=A0dirfd =3D open(dirpath, O_RDONLY | O_DIRECTORY);<br>
=C2=A0 =C2=A0 =C2=A0if (dirfd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sys2memblk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;open(\&quot;%s\&quot;)&quot;, dirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno=
, dirpath);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D ENOENT) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result-&gt;re=
sponse =3D GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;<br>
@@ -1936,7 +1937,7 @@ static GuestDiskStatsInfoList *guest_get_diskstats(Er=
ror **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fp =3D fopen(diskstats, &quot;r&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (fp=C2=A0 =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, diskstats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, diskstats);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -2047,7 +2048,7 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **err=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fp =3D fopen(cpustats, &quot;r&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (fp=C2=A0 =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, cpustats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, cpustats);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000fce1ef064415ea4e--


