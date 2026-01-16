Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8299D389B0
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jan 2026 00:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207103.1520146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgt6Q-0005AB-Ji; Fri, 16 Jan 2026 23:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207103.1520146; Fri, 16 Jan 2026 23:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgt6Q-00058i-Fc; Fri, 16 Jan 2026 23:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1207103;
 Fri, 16 Jan 2026 23:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHEn=7V=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vgt6P-00058c-PJ
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 23:19:37 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0e8d651-f331-11f0-9ccf-f158ae23cfc8;
 Sat, 17 Jan 2026 00:19:34 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768605568308525.6440969563023;
 Fri, 16 Jan 2026 15:19:28 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-45c958d48a9so1143183b6e.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 15:19:27 -0800 (PST)
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
X-Inumbo-ID: d0e8d651-f331-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1768605570; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ecloVruetXAjpq9kp/31ODkpx1zLfPoOP2W89vWSJxQfoF+VkoA9q2/FghISWvQrgnuU0/RROJuWYlgvl/myfRryRpAw43lT5L+X15xJe2xaloVwY1j+w1/9oypgz/UbyFmqONWqMM3Qv0eD96hQeRUbkEHdk6AVkf5cw+X5Ph0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768605570; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p2YteRo9HLg4hO9nC7EOOavXwgX3pSd+0fOVfpkd1Ic=; 
	b=fOB+uvb8cJbaoh1UrBBvLc1L1dy4Ov0Xih/c9ww5bUBgBoff0KmQkRLVu0LE3LPzjQnEpFvwQ4Dv7aucDft9ATpeH2fHfMSypnARvrrKJzL2ymhBBDOZU6fobJUGbxbgJqo4YDCiGwJE42NAO901CpeGpcHd+Uso5n6m8wr0DOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768605570;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=p2YteRo9HLg4hO9nC7EOOavXwgX3pSd+0fOVfpkd1Ic=;
	b=UK4lipqErXkh3ExmTGve9kN7oHgqI6+sSL6xkGxvDLlU/IXaQf0aQ9W1wD+W0G64
	ebtlDBwVrV5Pl6lnQLBkxi3+rph7tLed04UGQhkRKhMHTaCVQEMyUtEry82PYHF48FB
	7OLZigJHDdZ4y5gKGgKxx4dlF0mYkyIm26ugFDa8=
X-Gm-Message-State: AOJu0YwDFsSQyy6wn8jhlYIHIsMU6w0pZCR0+4DS1xmz4+ozrZgvVtZF
	JN3u5F8/tC7Mkk/Mtu4+MM2BUur7YAvt1jn/6bvDRbrPwh9sir42J7YBubZoXBN87hpqi+Kvhml
	zDA9j0SVrBEhujwhCe6kGYIUklgO31hk=
X-Received: by 2002:a05:6808:1b1f:b0:450:bc64:d159 with SMTP id
 5614622812f47-45c9c11971bmr1950662b6e.54.1768605567013; Fri, 16 Jan 2026
 15:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20260115092841.2651224-1-Penny.Zheng@amd.com> <20260115092841.2651224-3-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-3-Penny.Zheng@amd.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 16 Jan 2026 18:19:00 -0500
X-Gmail-Original-Message-ID: <CABfawhmJ_qfU6LTWFASg6hpFWVm28zU_M-uabz97S31sHB3+xA@mail.gmail.com>
X-Gm-Features: AZwV_Qim6pJ-PlwFTlssJgpCQPKoBnb_eTYi5BnhK9_K95MPNzxIPWTB6KYiBrY
Message-ID: <CABfawhmJ_qfU6LTWFASg6hpFWVm28zU_M-uabz97S31sHB3+xA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] x86/vm_event: introduce vm_event_is_enabled()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, jason.andryuk@amd.com, ray.huang@amd.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: multipart/alternative; boundary="00000000000091da7d064889920a"

--00000000000091da7d064889920a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:29=E2=80=AFAM Penny Zheng <Penny.Zheng@amd.com> w=
rote:

> Function vm_event_is_enabled() is introduced to check if vm event is
> enabled,
> and also make the checking conditional upon CONFIG_VM_EVENT, which could
> help
> DCE a lot unreachable calls/codes, such as hvm_monitor_io(), etc,
> when having VM_EVENT=3Dn.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--00000000000091da7d064889920a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 4:29=E2=80=AFAM Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.=
com">Penny.Zheng@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Function vm_event_is_enabled() is introduced to che=
ck if vm event is enabled,<br>
and also make the checking conditional upon CONFIG_VM_EVENT, which could he=
lp<br>
DCE a lot unreachable calls/codes, such as hvm_monitor_io(), etc,<br>
when having VM_EVENT=3Dn.<br>
<br>
Signed-off-by: Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.com" targe=
t=3D"_blank">Penny.Zheng@amd.com</a>&gt;<br>
Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_b=
lank">jbeulich@suse.com</a>&gt;<br>
Reviewed-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" tar=
get=3D"_blank">jason.andryuk@amd.com</a>&gt;</blockquote><div><br></div><di=
v>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tama=
s@tklengyel.com</a>&gt;=C2=A0</div></div></div>

--00000000000091da7d064889920a--

