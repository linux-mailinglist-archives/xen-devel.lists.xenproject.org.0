Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD001D29304
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 00:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205940.1519809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgWTo-0000fl-TJ; Thu, 15 Jan 2026 23:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205940.1519809; Thu, 15 Jan 2026 23:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgWTo-0000dE-Qh; Thu, 15 Jan 2026 23:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1205940;
 Thu, 15 Jan 2026 23:10:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NyJg=7U=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vgWTn-000844-HF
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 23:10:15 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58395493-f267-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 00:10:13 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768518609448327.96669906004786;
 Thu, 15 Jan 2026 15:10:09 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-66106a2f8d0so957647eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 15:10:08 -0800 (PST)
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
X-Inumbo-ID: 58395493-f267-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1768518611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n869em04m5spi5M/gM3TTvQJycSh60+EuBK/MvRkENyilLSTTQFtwO5IVb0Y3QYx4V+Dc3XmzyFpNALowau1F0oYTgPngt5SxSbQqlgbSMpFBvIoul47BGnITY67qoktEOeN1eqzOnfzetxTdFEuYrHlh/wC+Ctxono40eMFcSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768518611; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=siaeCtKqcCym2YtgRvOP6EB2cSKk/5lXJOvehqUu0Qw=; 
	b=eBuiZwtYYRI69M3hIBh3AKM6p0r67aEQFdvVvunDmPPXmqX6XUg5mznYjMJ52e36rlegEv80COPuo93+4LQINmC/f4ZVXv9j1JFJhBoy1Yp9jFDHE/mGbV2kY5cTGQOVKqwwFAm6eLSTAFQizZy1DVYOrpi5ClHQzG9rkST9MrY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768518611;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=siaeCtKqcCym2YtgRvOP6EB2cSKk/5lXJOvehqUu0Qw=;
	b=Fd/Am4RfB03sudAniORexM2gK2SGMggMRnHtJ3kKAqhRaUJt4PWP5csU1D1nB4nY
	1cEGSFu1d6p2XW8zub0mB4QCLnvh9eXFYdF4QZw/skBO3Tuod9sWRgGVEpUmfwOickb
	zeeSw4Nkwv2gSLG79O8q37FW/h8m3bV6pMIgck3A=
X-Forwarded-Encrypted: i=1; AJvYcCWtyEqv7y+yvKdKnPh6DALSDbFIaXESwleZfw+faLnM/bMO1L1yFuDhHHGqduR6oAk0x5EPItIn56c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGaamVSEs8Sj4NLG3nNl9jQfOEZYQdPG76IktIRjmky1jy3dfP
	MPKOAt1hqfi3pNukCggz3UeiXKMWqflAN4aKQt17mL1Yl6Tujdd5P3ZHaaaN0Pe6f3DgsEQ2pnn
	h9dnyuzEzTzCSdcbUI45XXJ8JbwHYCSc=
X-Received: by 2002:a05:6820:160f:b0:65f:6cc6:5ffd with SMTP id
 006d021491bc7-66117990684mr618756eaf.33.1768518608084; Thu, 15 Jan 2026
 15:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20260115092841.2651224-1-Penny.Zheng@amd.com> <20260115092841.2651224-5-Penny.Zheng@amd.com>
 <f346d915-5da3-4a4a-9314-24af17f92718@amd.com>
In-Reply-To: <f346d915-5da3-4a4a-9314-24af17f92718@amd.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 15 Jan 2026 18:09:00 -0500
X-Gmail-Original-Message-ID: <CABfawh=CTY19EeCvq=jViwY39oru2dTe5S6L0opMSWB4t_mpDA@mail.gmail.com>
X-Gm-Features: AZwV_QhTc1KOPhSYAhbdzoWv41YMqEsmvQYVT2UNiYCPQWhrKvTog2dxIwuufvk
Message-ID: <CABfawh=CTY19EeCvq=jViwY39oru2dTe5S6L0opMSWB4t_mpDA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] xen/p2m: move xenmem_access_to_p2m_access() to
 common p2m.c
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org, ray.huang@amd.com, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000069e85e06487553bd"

--00000000000069e85e06487553bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:21=E2=80=AFAM Jason Andryuk <jason.andryuk@amd.c=
om>
wrote:

> On 2026-01-15 04:28, Penny Zheng wrote:
> > Memory access and ALTP2M are two seperate features, while both dependin=
g
> on
> > helper xenmem_access_to_p2m_access(). So it betters lives in common
> p2m.c,
> > other than mem_access.c which will be compiled out when VM_EVENT=3Dn &&
> ALTP2M=3Dy.
> > Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise =
it
> > will become unreachable when both VM_EVENT=3Dn and ALTP2M=3Dn, and henc=
e
> > violating Misra rule 2.1
> > We also need to move declaration from mem_access.h to p2m-common.h
> > An extra blank line is inserted after each case-block to correct coding
> > style at the same time.
> >
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--00000000000069e85e06487553bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15, 2026=
 at 10:21=E2=80=AFAM Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.=
com" target=3D"_blank">jason.andryuk@amd.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 2026-01-15 04:28, Penny Zhen=
g wrote:<br>
&gt; Memory access and ALTP2M are two seperate features, while both dependi=
ng on<br>
&gt; helper xenmem_access_to_p2m_access(). So it betters lives in common p2=
m.c,<br>
&gt; other than mem_access.c which will be compiled out when VM_EVENT=3Dn &=
amp;&amp; ALTP2M=3Dy.<br>
&gt; Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise=
 it<br>
&gt; will become unreachable when both VM_EVENT=3Dn and ALTP2M=3Dn, and hen=
ce<br>
&gt; violating Misra rule 2.1<br>
&gt; We also need to move declaration from mem_access.h to p2m-common.h<br>
&gt; An extra blank line is inserted after each case-block to correct codin=
g<br>
&gt; style at the same time.<br>
&gt; <br>
&gt; Signed-off-by: Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.com" =
target=3D"_blank">Penny.Zheng@amd.com</a>&gt;<br>
&gt; Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
<br>
Reviewed-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" tar=
get=3D"_blank">jason.andryuk@amd.com</a>&gt;<br></blockquote><div><br></div=
><div>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com" =
target=3D"_blank">tamas@tklengyel.com</a>&gt;=C2=A0</div></div></div>
</div>

--00000000000069e85e06487553bd--

