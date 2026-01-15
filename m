Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45739D29300
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 00:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205932.1519799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgWSk-0007gG-Ju; Thu, 15 Jan 2026 23:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205932.1519799; Thu, 15 Jan 2026 23:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgWSk-0007dn-HF; Thu, 15 Jan 2026 23:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1205932;
 Thu, 15 Jan 2026 23:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NyJg=7U=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vgWSj-0007dh-Je
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 23:09:09 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e68d2c6-f267-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 00:09:03 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768518536669160.44063775779557;
 Thu, 15 Jan 2026 15:08:56 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-45c8e85deffso441581b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 15:08:55 -0800 (PST)
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
X-Inumbo-ID: 2e68d2c6-f267-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1768518539; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X3+Ukw+c+X0YgvNgW8qAkvfr9mJ8Ad+KmjOHC7NN7d+fo7JepIavUbrbxCFCiUHvZHpt648Gm/s5OLHvJtp/CWWz4AYVAhqqbSgptkwfOvSvi/JNgqxM6fFgnM7XDwI7WLMuK1ahT0EsuEorporRVfd7Ke0lAvc9+tst7bqoNEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768518539; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bDJVVA3E22bQ/IxWhkb2Y4579buw3WQ1C3StIr1NqAQ=; 
	b=IoLEXfZEEXm5mWaxuQIW8NRG4OvyyYEsG9PSWskxV9yoDyuD6ku1s7oReLT0H3b79srRWCxfPg7J7PVF8RRomFFw0678YjsRThl1SNW8Hp+AtgVBvffcI6E8Dk3QWcaYMG5H4ucw8rGom4txrJBcYRGm7KWFjnLjFAkJ7AaWeV0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768518539;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=bDJVVA3E22bQ/IxWhkb2Y4579buw3WQ1C3StIr1NqAQ=;
	b=eCqIje+3lvOAU81V8WPNMglp5HDt5JyzXuNJNngZ9uJ9xUjGzoSofws4xhGAVPAJ
	Qvmja/BR3BKvers1St0GePM2VjSNnlNBLwZ1uI+w5jUns9m/UFGNUbmpRuNpQyRj5cl
	BAQYBEWTxGhgYpnch3JpI3wzSf1qrRKzAtenNcXA=
X-Gm-Message-State: AOJu0YyY2JJGLiBOEQn50KTkvGolEwlrvj3brAPe5BlJxNGP0crC1ldy
	vqyv3uGbLXBp+5J5neFh1pQsj4e1a5ffvcxjyEsduTGe8037CqtVYM7B6i+AGKr04NVRnBjsurv
	pR7W3qjRxUhddDYGjNdedLmg7q5PZFIs=
X-Received: by 2002:a05:6808:344c:b0:450:c7b5:23d0 with SMTP id
 5614622812f47-45c9d8a85f4mr406673b6e.49.1768518535318; Thu, 15 Jan 2026
 15:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20260115092841.2651224-1-Penny.Zheng@amd.com> <20260115092841.2651224-2-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-2-Penny.Zheng@amd.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 15 Jan 2026 18:07:00 -0500
X-Gmail-Original-Message-ID: <CABfawhnvTZmSRcofpG=ts5=NTs4KCjsnTKBP2WTsDRmj1_EsEg@mail.gmail.com>
X-Gm-Features: AZwV_QgAK-Tq1TmBE3lhHnVK_Fy5hdvXUja-jL0JwNzb4POF3gcp1Dgou6AgwUQ
Message-ID: <CABfawhnvTZmSRcofpG=ts5=NTs4KCjsnTKBP2WTsDRmj1_EsEg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] xen/x86: move declaration from mem_access.h to altp2m.h
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, jason.andryuk@amd.com, ray.huang@amd.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: multipart/alternative; boundary="000000000000139fb30648754f3f"

--000000000000139fb30648754f3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:29=E2=80=AFAM Penny Zheng <Penny.Zheng@amd.com> w=
rote:

> Memory access and ALTP2M are two seperate features, and each could be
> controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration
> when ALTP2M=3Dy and VM_EVENT=3Dn on compiling hvm.o/altp2m.o, we move
> declaration
> of the following functions from <asm/mem_access.h> to <asm/altp2m.h>:
> - p2m_set_suppress_ve
> - p2m_set_suppress_ve_multi
> - p2m_get_suppress_ve
> Potential error on altp2m.c also breaks Misra Rule 8.4.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--000000000000139fb30648754f3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 4:29=E2=80=AFAM Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.=
com">Penny.Zheng@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Memory access and ALTP2M are two seperate features,=
 and each could be<br>
controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration<b=
r>
when ALTP2M=3Dy and VM_EVENT=3Dn on compiling hvm.o/altp2m.o, we move decla=
ration<br>
of the following functions from &lt;asm/mem_access.h&gt; to &lt;asm/altp2m.=
h&gt;:<br>
- p2m_set_suppress_ve<br>
- p2m_set_suppress_ve_multi<br>
- p2m_get_suppress_ve<br>
Potential error on altp2m.c also breaks Misra Rule 8.4.<br>
<br>
Signed-off-by: Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.com" targe=
t=3D"_blank">Penny.Zheng@amd.com</a>&gt;<br>
Reviewed-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D=
"_blank">jbeulich@suse.com</a>&gt;<br>
Reviewed-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" tar=
get=3D"_blank">jason.andryuk@amd.com</a>&gt;</blockquote><div><br></div><di=
v>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tama=
s@tklengyel.com</a>&gt;=C2=A0</div></div></div>

--000000000000139fb30648754f3f--

