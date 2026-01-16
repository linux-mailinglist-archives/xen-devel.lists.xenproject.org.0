Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51546D389B2
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jan 2026 00:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207124.1520167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgt7f-00078v-6k; Fri, 16 Jan 2026 23:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207124.1520167; Fri, 16 Jan 2026 23:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgt7f-00075o-3C; Fri, 16 Jan 2026 23:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1207124;
 Fri, 16 Jan 2026 23:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHEn=7V=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vgt7e-0005RK-1r
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 23:20:54 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff744436-f331-11f0-b15e-2bf370ae4941;
 Sat, 17 Jan 2026 00:20:52 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768605648057100.37824651156598;
 Fri, 16 Jan 2026 15:20:48 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-65f66d72b3fso1718726eaf.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 15:20:47 -0800 (PST)
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
X-Inumbo-ID: ff744436-f331-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1768605649; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Un8is00hNzVntpxcDK4/ddu+5be/GO5xL2T3YfGmhwK0J1hAHmUZn4exi5V516ocbBK66Q0K5ZJy34+sSGqBozD0vXm/IJUdL4/tzTnqtGsfAXmM/2kd0hzvToZU85uyCVouUWBs5+mC5RFVelRx4GiYttaZdd/c/YhE6k5Spog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768605649; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TKtiMH8oBdrfkRfa3Gcqh/WpBKYSshT5TbDes+EMBp0=; 
	b=DxHsd30+UCmB5fQFmKOD0cyOe2kqXDkvsd3aNDuUzSVLm9KzrHQrLPfUpf0HnoV4I04Ra5C8d9Peu/edIvZuLKvhj6nidC3Y0gs3BYy+8xKKEdvNXRlh7X0w5/3TwWMHuJVzIDMX9j9uq0QRNKjgtP/IVumHjU+jWT35vmap0nk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768605649;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=TKtiMH8oBdrfkRfa3Gcqh/WpBKYSshT5TbDes+EMBp0=;
	b=PE96VqBV9EdMdNAto5TGq+lpilsaUFi4pmmmF5OCrctHTa5LPIxlTc+H16cpu87p
	nUIE+HKFmQld+OSPqswfgyWUkPavVVGAgU95TAQdc5eFrNfYrwFzH8YZBDXVZBGuBDX
	OWFnIl4ThCmsDxmA0RlXu6F1AZOwEMHpwLvI0S5o=
X-Forwarded-Encrypted: i=1; AJvYcCXKDVvd2r4IkxmMnEIIezmui9LSW2e51ZaNDxSrN02SKyrZx/zyJu9xZoq55P1mBD0XD+NitEYJ6oA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZx/+xtwgh8Aph6n9z5bp4xDaPy2/quvuiroSOwjBGVn2dUFPU
	dbHAhpPxftD1wph30SpGbYGTBSbtkzI1InIA3z01JYoZBmkkrXMyRW/2+g2m4FVQKePz9JQnipj
	RRpP6LTDAe31yTVVZesHi2MQe1KliKTM=
X-Received: by 2002:a05:6820:1c97:b0:659:9a49:904d with SMTP id
 006d021491bc7-6611795a29cmr1849712eaf.24.1768605647446; Fri, 16 Jan 2026
 15:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20260115092841.2651224-1-Penny.Zheng@amd.com> <20260115092841.2651224-6-Penny.Zheng@amd.com>
 <84943630-0f68-4097-a5a4-4aba17c0fb86@amd.com>
In-Reply-To: <84943630-0f68-4097-a5a4-4aba17c0fb86@amd.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 16 Jan 2026 18:19:00 -0500
X-Gmail-Original-Message-ID: <CABfawh=zW-MvDLGC84zhhcPhiqg04RgzLVbugoRKP64cZWktiA@mail.gmail.com>
X-Gm-Features: AZwV_QjIVHKJlvK2mzsmXj03m5Q7EZzX2_PGu0SBNmdrc9rM8GVfPhFFaWzy13Y
Message-ID: <CABfawh=zW-MvDLGC84zhhcPhiqg04RgzLVbugoRKP64cZWktiA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] xen/mem_access: wrap memory access when VM_EVENT=n
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org, ray.huang@amd.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: multipart/alternative; boundary="0000000000005d2994064889977b"

--0000000000005d2994064889977b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:21=E2=80=AFAM Jason Andryuk <jason.andryuk@amd.c=
om>
wrote:

> On 2026-01-15 04:28, Penny Zheng wrote:
> > Feature memory access is based on vm event subsystem, and it could be
> disabled
> > in the future. So a few switch-blocks in do_altp2m_op() need
> > vm_event_is_enabled() condition check to pass compilation when ALTP2M=
=3Dy
> and
> > VM_EVENT=3Dn(, hence MEM_ACCESS=3Dn), like HVMOP_altp2m_set_mem_access,=
 etc.
> > Function p2m_mem_access_check() still needs stub when VM_EVENT=3Dn to
> > pass compilation.
> > Although local variable "req_ptr" still remains NULL throughout its
> lifetime,
> > with the change of NULL assignment, we will face runtime undefined erro=
r
> only
> > when CONFIG_USBAN is on. So we strengthen the condition check via addin=
g
> > vm_event_is_enabled() for the special case.
> >
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--0000000000005d2994064889977b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 10:21=E2=80=AFAM Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk=
@amd.com">jason.andryuk@amd.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 2026-01-15 04:28, Penny Zheng wrote:<br=
>
&gt; Feature memory access is based on vm event subsystem, and it could be =
disabled<br>
&gt; in the future. So a few switch-blocks in do_altp2m_op() need<br>
&gt; vm_event_is_enabled() condition check to pass compilation when ALTP2M=
=3Dy and<br>
&gt; VM_EVENT=3Dn(, hence MEM_ACCESS=3Dn), like HVMOP_altp2m_set_mem_access=
, etc.<br>
&gt; Function p2m_mem_access_check() still needs stub when VM_EVENT=3Dn to<=
br>
&gt; pass compilation.<br>
&gt; Although local variable &quot;req_ptr&quot; still remains NULL through=
out its lifetime,<br>
&gt; with the change of NULL assignment, we will face runtime undefined err=
or only<br>
&gt; when CONFIG_USBAN is on. So we strengthen the condition check via addi=
ng<br>
&gt; vm_event_is_enabled() for the special case.<br>
&gt; <br>
&gt; Signed-off-by: Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.com" =
target=3D"_blank">Penny.Zheng@amd.com</a>&gt;<br>
&gt; Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
<br>
Reviewed-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" tar=
get=3D"_blank">jason.andryuk@amd.com</a>&gt;<br></blockquote><div><br></div=
><div>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">=
tamas@tklengyel.com</a>&gt;=C2=A0</div></div></div>

--0000000000005d2994064889977b--

