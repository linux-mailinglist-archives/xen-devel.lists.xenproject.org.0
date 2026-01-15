Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E1D29348
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 00:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205950.1519819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgWWU-0001Bl-8k; Thu, 15 Jan 2026 23:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205950.1519819; Thu, 15 Jan 2026 23:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgWWU-00019i-6C; Thu, 15 Jan 2026 23:13:02 +0000
Received: by outflank-mailman (input) for mailman id 1205950;
 Thu, 15 Jan 2026 23:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NyJg=7U=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vgWWS-00019Y-VH
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 23:13:00 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb218ce3-f267-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 00:12:59 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768518776463307.9111597064151;
 Thu, 15 Jan 2026 15:12:56 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-65e943048afso551573eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 15:12:55 -0800 (PST)
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
X-Inumbo-ID: bb218ce3-f267-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1768518777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eKRZUhoOJCVNAT5+UKI5k+GS9VstnVhaxnitJpAI+El0e8T4IhozBBcgBa7qXlX6/eamQoTqgc0tXPgUZrF9iPBA5cOoS3EqWnflyhiS3aMrqgVHtPSZeCaqK4I1xOc1sosaryHvk2CYdy1EFsje2S9Cxylv5+dCXpVYq+5Ij94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768518777; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0l3q3A8gUey+LqCIoBCGD6oDpOqHDGxXljILJBuxYyg=; 
	b=nKB0nVg1qcpHmXSrNaGTEX9X400FWCwCKCzzKhN8V76x/29ki/wInPKXb3qw57ngs5H8GXQM0Py+0314V+NZhJOKI5DQpNwe+cFmmRoReVVPLap3jxKCXDfxDbRmI8ItLSI9pVk+FBNTw+zZXLirN5ulgPLBTuvszyP3vOhXlMY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768518777;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=0l3q3A8gUey+LqCIoBCGD6oDpOqHDGxXljILJBuxYyg=;
	b=dCiYKTUC0mjkw8FhZaj9o1RZMq/Pq2LJ/TnLjuA+K0XB14r7Dic3ntjhQWDO71da
	2lHluVNthdlOvki1ikPoj2cixRdqOfTKReBC7NX+RDZuuCWyFYc+1nYyICQhnlwOpAm
	ZToxsddIluHB4Stc4fAUO+vYmrctlzW+5bNSojNY=
X-Gm-Message-State: AOJu0YxJWCF/ayDI24oG8UkHxBFOKaeRpwY/8kSWZcGvLAvv/x4YncbT
	xb9Q+vXnL5LCG6WPdUoqWziqjsuFDhHG+Djf4woJKyOHNCZYVRu1GKcmw7T1Nek4MQ2nlCS1n0d
	rjS3DMgmSTv4Fnjobc+mqPR2z6A/iwa4=
X-Received: by 2002:a05:6820:1896:b0:65f:2baf:4ad with SMTP id
 006d021491bc7-661188fb236mr373189eaf.30.1768518775291; Thu, 15 Jan 2026
 15:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20260115092841.2651224-1-Penny.Zheng@amd.com> <20260115092841.2651224-7-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-7-Penny.Zheng@amd.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 15 Jan 2026 18:11:00 -0500
X-Gmail-Original-Message-ID: <CABfawhmA2jUJusnN8Srj1waVgyz2rDnP3YhtiOvKF3kg7fCc_w@mail.gmail.com>
X-Gm-Features: AZwV_Qi5Y4yS1ot7FV7Z3AgAM0GHcw4zW3O9rm-SfsAkiEQRkjVGaBBKp2ChL2M
Message-ID: <CABfawhmA2jUJusnN8Srj1waVgyz2rDnP3YhtiOvKF3kg7fCc_w@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] xen/vm_event: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, jason.andryuk@amd.com, ray.huang@amd.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: multipart/alternative; boundary="0000000000006143bf0648755df0"

--0000000000006143bf0648755df0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:29=E2=80=AFAM Penny Zheng <Penny.Zheng@amd.com> w=
rote:

> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handlin=
g
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
>
> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
> CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
> make VM_EVENT=3Dy on default only on x86 to retain the same.
>
> The following functions are developed on the basis of vm event framework,
> or
> only invoked by vm_event.c, so they all shall be wrapped with
> CONFIG_VM_EVENT
> (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=3Dn):
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - hvm_emulate_one_vm_event
>     -
> hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_i=
o}_discard
> And Function vm_event_check_ring() needs stub to pass compilation when
> VM_EVENT=3Dn.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--0000000000006143bf0648755df0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 4:29=E2=80=AFAM Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.=
com">Penny.Zheng@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">File hvm/vm_event.c and x86/vm_event.c are the exte=
nd to vm_event handling<br>
routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.<br>
<br>
Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via<br>
MEM_ACCESS_ALWAYS_ON, we could disable it through disabling<br>
CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and<br>
make VM_EVENT=3Dy on default only on x86 to retain the same.<br>
<br>
The following functions are developed on the basis of vm event framework, o=
r<br>
only invoked by vm_event.c, so they all shall be wrapped with CONFIG_VM_EVE=
NT<br>
(otherwise they will become unreachable and<br>
violate Misra rule 2.1 when VM_EVENT=3Dn):<br>
- hvm_toggle_singlestep<br>
- hvm_fast_singlestep<br>
- hvm_emulate_one_vm_event<br>
=C2=A0 =C2=A0 - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,r=
ead_io,write_io}_discard<br>
And Function vm_event_check_ring() needs stub to pass compilation when<br>
VM_EVENT=3Dn.<br>
<br>
Signed-off-by: Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.com" targe=
t=3D"_blank">Penny.Zheng@amd.com</a>&gt;<br>
Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_b=
lank">jbeulich@suse.com</a>&gt;<br>
Reviewed-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" tar=
get=3D"_blank">jason.andryuk@amd.com</a>&gt;<br></blockquote><div><br></div=
>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tamas=
@tklengyel.com</a>&gt;</div></div>

--0000000000006143bf0648755df0--

