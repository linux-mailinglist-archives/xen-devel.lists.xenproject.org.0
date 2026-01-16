Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B5ED389B1
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jan 2026 00:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207107.1520157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgt6l-0005Y0-Uu; Fri, 16 Jan 2026 23:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207107.1520157; Fri, 16 Jan 2026 23:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgt6l-0005Uh-RO; Fri, 16 Jan 2026 23:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1207107;
 Fri, 16 Jan 2026 23:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHEn=7V=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vgt6k-00058c-Jz
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 23:19:58 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de3e41b6-f331-11f0-9ccf-f158ae23cfc8;
 Sat, 17 Jan 2026 00:19:56 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1768605591708468.66365585678;
 Fri, 16 Jan 2026 15:19:51 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-45ca0d06eddso754526b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 15:19:51 -0800 (PST)
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
X-Inumbo-ID: de3e41b6-f331-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1768605593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hxpQY7oXVtnBV+MAdIdMnliHaxdqxFHzyaNqldLn1yTTL0ey1bcKuWPy8jxxZai9W5P8Hl9/zl2J8ibb2XP96MNccQD7N2eYL++oCjC+/FdIpBfgv0o++mwnF9HTbmEEzcahqPEXS131uVYxF3thFNkkOo8Q+mY1x+p5fMhsXHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768605593; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qr25avvDLnDOnm9RWcIZUh3dqPd+LfGVqV0F0VX+7Xs=; 
	b=Jb3e7pbuxjsKvRxMQ91jDwXZ7FNtp/n2bf158pHe2rYUtHXVZhyHbTS0w5UBXhqIttIPfvJfRTVrV4ByA29Eb/vmCNnHOIP2iWS+Mo9j5T33mHUUhTXEeuarsm/WWcq1XRuFC8FpnilR+8CjnK/Gn39H6AO2zX/q3qfEFOwS3Xw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768605593;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=qr25avvDLnDOnm9RWcIZUh3dqPd+LfGVqV0F0VX+7Xs=;
	b=KWhX1+EKH+He+VA+1fCxO6O5xPAiyNMqBqviWHYWEEAthHQw4YWs4i4+yFeogVNk
	XLNGtajew4sbbxNRDzlVTs4tCzy7N9S0hi1WAlvx906DdDg/LDcUaJs3xE0ipC3ZwVI
	FP1ZTnqhnOUJVzY8TE8/bQzzZDvDGRVZRPuvNZGk=
X-Gm-Message-State: AOJu0YwYHOoPufUeEBQ5+R8yb270FkKSoSNrJdxGaQZZT2844FLTjfJ+
	m0867pSEFqUZ9Fh2ubqjAsLhwWazoOPN1V+zEziUfZVucR0RUZqxK4LoZ8J07RLdKMOQJ7v9w3U
	xnPGAtiqjk2N6M8Kvll5c/S5dhorqAFs=
X-Received: by 2002:a05:6808:c2d9:b0:459:98aa:672e with SMTP id
 5614622812f47-45c9bf866a0mr1843899b6e.4.1768605585563; Fri, 16 Jan 2026
 15:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20260115092841.2651224-1-Penny.Zheng@amd.com> <20260115092841.2651224-4-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-4-Penny.Zheng@amd.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 16 Jan 2026 18:19:00 -0500
X-Gmail-Original-Message-ID: <CABfawhnCr2MTswfDVrFH6=1SaAmH7VzV3v_idK5Y-j_fQ3bBTA@mail.gmail.com>
X-Gm-Features: AZwV_QhpBcX11oR94k7K1BbsOj961rwAavKNmzwxBVJv0aGo93lZWIYYBsIZkhs
Message-ID: <CABfawhnCr2MTswfDVrFH6=1SaAmH7VzV3v_idK5Y-j_fQ3bBTA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, jason.andryuk@amd.com, ray.huang@amd.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: multipart/alternative; boundary="000000000000ace4d40648899375"

--000000000000ace4d40648899375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:29=E2=80=AFAM Penny Zheng <Penny.Zheng@amd.com> w=
rote:

> Feature monitor_op is based on vm event subsystem, so monitor.o shall be
> wrapped under CONFIG_VM_EVENT.
> The following functions are only invoked by monitor-op, so they all shall
> be
> wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=3Dn):
> - hvm_enable_msr_interception
>   - hvm_function_table.enable_msr_interception
> - hvm_has_set_descriptor_access_existing
>   - hvm_function_table.set_descriptor_access_existi
> - arch_monitor_get_capabilities
> Function monitored_msr() still needs a stub to pass compilation when
> VM_EVENT=3Dn.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--000000000000ace4d40648899375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 4:29=E2=80=AFAM Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.=
com">Penny.Zheng@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Feature monitor_op is based on vm event subsystem, =
so monitor.o shall be<br>
wrapped under CONFIG_VM_EVENT.<br>
The following functions are only invoked by monitor-op, so they all shall b=
e<br>
wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and<br=
>
violate Misra rule 2.1 when VM_EVENT=3Dn):<br>
- hvm_enable_msr_interception<br>
=C2=A0 - hvm_function_table.enable_msr_interception<br>
- hvm_has_set_descriptor_access_existing<br>
=C2=A0 - hvm_function_table.set_descriptor_access_existi<br>
- arch_monitor_get_capabilities<br>
Function monitored_msr() still needs a stub to pass compilation when<br>
VM_EVENT=3Dn.<br>
<br>
Signed-off-by: Penny Zheng &lt;<a href=3D"mailto:Penny.Zheng@amd.com" targe=
t=3D"_blank">Penny.Zheng@amd.com</a>&gt;<br>
Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_b=
lank">jbeulich@suse.com</a>&gt;<br>
Reviewed-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" tar=
get=3D"_blank">jason.andryuk@amd.com</a>&gt;</blockquote><div><br></div><di=
v>Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tama=
s@tklengyel.com</a>&gt;=C2=A0</div></div></div>

--000000000000ace4d40648899375--

