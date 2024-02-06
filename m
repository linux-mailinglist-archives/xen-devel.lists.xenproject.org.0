Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46084B631
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 14:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676920.1053272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLMl-0006o9-Cg; Tue, 06 Feb 2024 13:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676920.1053272; Tue, 06 Feb 2024 13:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLMl-0006ls-9x; Tue, 06 Feb 2024 13:19:59 +0000
Received: by outflank-mailman (input) for mailman id 676920;
 Tue, 06 Feb 2024 13:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60ZD=JP=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rXLMk-0006lm-Ne
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 13:19:58 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b18bdb0-c4f2-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 14:19:57 +0100 (CET)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179]) by mx.zohomail.com
 with SMTPS id 1707225592988261.1018244172735;
 Tue, 6 Feb 2024 05:19:52 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6047cfd1f5cso5137627b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 05:19:52 -0800 (PST)
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
X-Inumbo-ID: 6b18bdb0-c4f2-11ee-8a47-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; t=1707225594; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cL02Ku0IQtKMqV/NTJie9lYsLUetZX4DOhwQnft6FXOD7upXALl7MzJbO4h0OX+R6GnkfO2W9iGE03xMyfxlcFFYQ3HVAAOFR/sFTuWuKH3hSYZ49Ds7AH2flXtuMOk5B0zTyGWExAoKsB035IS0ip3y/g4r/df1hu0N9EauY/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1707225594; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AcLOC/B+zC/6qFNeSnAd6vo5Xv4mxXGkXuFcuaV4UJw=; 
	b=EuO1DaqpziDI1J5oFH9eQS0H5svK+ZpPe6O6AJwupGm+2AKAyRBcuiViXvS5DxaOXop/GlI5UUqe9et09DWW78xapJ5c0hIk567My+yNIAId8mYSYDXIr1Oi3VfbBKAfoSumDa7o8cVs7j8a2dnnjzW66XQ+sy0thRGTkHYtHyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707225594;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AcLOC/B+zC/6qFNeSnAd6vo5Xv4mxXGkXuFcuaV4UJw=;
	b=N8LCTPGbSgB2LJRJqMbBIEdgM1mgFxt3Lvw5jMmqEvJl36c+KfVribOowDky4Ag9
	48N62H4m7nSp0KjhxzQzee70ftfHaaO8qHXNKnwZoVt7GZSB/U9g1qYxNIYj8XUYQZG
	oYqeHMlH9P8WdcX7lFJeySGABHBTnqclHAJavFug=
X-Gm-Message-State: AOJu0YzTBnDNZNG7rha8BujhAnfkCfg1HcZ2mdLG+j7Q4At3BJI1+sHA
	5NDztyOB96Zk2PRQkFg2hZaU/SwrdFjJ6K0OcT+ZcrTfxT1Na6Oh+Q29e8E19/3litlYhwRIQTD
	E4HL2sBL7nSeF5SMeEJHmwRxV4L8=
X-Google-Smtp-Source: AGHT+IGoYFQfrjNcmQfvWdJFAmAU4/LKUO44kppH4PWiT0XTvp3pvHQNBlTd7uxRAN6c9gNhjGnzF+uvEp7mXkK4m48=
X-Received: by 2002:a81:b3c7:0:b0:603:bc00:b469 with SMTP id
 r190-20020a81b3c7000000b00603bc00b469mr1874263ywh.11.1707225591949; Tue, 06
 Feb 2024 05:19:51 -0800 (PST)
MIME-Version: 1.0
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
In-Reply-To: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 6 Feb 2024 08:19:16 -0500
X-Gmail-Original-Message-ID: <CABfawh=V14gV14McU_5mhb+714QCjXA1+G3y5WQmSMeFJVYKBQ@mail.gmail.com>
Message-ID: <CABfawh=V14gV14McU_5mhb+714QCjXA1+G3y5WQmSMeFJVYKBQ@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 5:08=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com> =
wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> This patch addresses a behavior discrepancy in the handling of altp2m vie=
ws,
> where upon the creation and subsequent EPT violation, the page access
> permissions were incorrectly inherited from the hostp2m instead of respec=
ting
> the altp2m default_access.
>
> Previously, when a new altp2m view was established with restrictive
> default_access permissions and activated via xc_altp2m_switch_to_view(),
> it failed to trigger an event on the first access violation.  This behavi=
or
> diverged from the intended mechanism, where the altp2m's default_access
> should dictate the initial permissions, ensuring proper event triggering =
on
> access violations.
>
> The correction involves modifying the handling mechanism to respect the
> altp2m view's default_access upon its activation, eliminating the need fo=
r
> setting memory access permissions for the entire altp2m range (e.g. withi=
n
> xen-access.c).  This change not only aligns the behavior with the expecte=
d
> access control logic but also results in a significant performance improv=
ement
> by reducing the overhead associated with setting memory access permission=
s
> across the altp2m range.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

