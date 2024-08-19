Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E15956EDD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 17:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779832.1189516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4PC-0003P2-Q1; Mon, 19 Aug 2024 15:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779832.1189516; Mon, 19 Aug 2024 15:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4PC-0003Mc-NC; Mon, 19 Aug 2024 15:34:50 +0000
Received: by outflank-mailman (input) for mailman id 779832;
 Mon, 19 Aug 2024 15:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bfyF=PS=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sg4PA-0003Kz-FB
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 15:34:48 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90300041-5e40-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 17:34:46 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6bf7ba05f75so28627026d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 08:34:46 -0700 (PDT)
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
X-Inumbo-ID: 90300041-5e40-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724081685; x=1724686485; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5ArTXO+cUPJSq5/DoTfh2KgX+f/iX0kdJB/pxog0gc=;
        b=JXib6HE0UsuKDwtFiI8A9YGjU/wNFJT2xy9soZyWXcdmawYwIqdjNOimq9DQUqr8EY
         dNQHhWv4iUM/xPohamXb/Gd/iKmCZ0K5NZClAH8T2QUdRD2eByj059wrSBVutnAko8lf
         y3JmJuXq6iha5dffpAlEl5+yyDh3/ugxtNQfbvOvUUPNf6fgc6AA+cIQ86oaDEK3qiky
         FtWHWjw/lCQE2dmSHoYVb5roMVhBYbMNqnQJnm+lE6/qHBg7TJCtxbef2ixGOKghcM1F
         jqQwb/hqxnVnjsTahF8vwVmMj6ci9QhilE9H6tohoVg/i6dHukTGR5+CNIb9+SD4oETq
         iTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724081685; x=1724686485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5ArTXO+cUPJSq5/DoTfh2KgX+f/iX0kdJB/pxog0gc=;
        b=tliPvYtF0WKTdaC1fGJnikoxwAEnneMivbxdmKwLH3Y8QZdBXMEDvecEGTfvE2q6OW
         psv+2BclYU4msg6ztJT8bfIf3lLGEY2Dm67v4EIvA7XsmuytKZITz6Xa/Bi9QwRxjGqY
         wq2np+V5el0nkf6lbUJT3u2e7Gg+ZivBuMN/MrWQJ0ejm/ec3yn8XnxMDxP1E2YoVWtV
         i7kj2tqJtgtOmEqHrBOEuW2KafUEVYHXxAnAOGdyRswz640wqCajTGUYmS+bsZZWKnKQ
         dFSQQ+oA9TNRGJirKgdlvoIOnEX7gfssCSm9tQ3LZsavt/7OR77BdPzc4r8xx2ZX6jCK
         SgXg==
X-Forwarded-Encrypted: i=1; AJvYcCUy3VxeGyzO0j+MsJGiJjslBrmzrZps8xPXLDKLaQ7pULaoa1WclSMfFOH1IZMmg9dzQ0zCWpPFdlYdkKrBmDLdY+nr3RLcL7jLwZFopSk=
X-Gm-Message-State: AOJu0YxOeG+8nT8CQdd+7ECOM4QQ3VKVrM9YOxAWxhjfx4dowCIcFSv3
	cZgUtOhZlqlSrGcSNVIkXggvPtEIqPJH+KDBw57nDhZ5GohNbnMKe0+aiVIFSkO/er8otw5y1ia
	zQU4athA84Tp/2nXdaTF/uDjAcro=
X-Google-Smtp-Source: AGHT+IElojV+Oy0IeWERoJ+hC+Ei2JjYOdmI6eVYEkLIm5YGpXYDRqPBOAh7+bYqCkfdeheZZfe4Ppo3v7lkssiUYzo=
X-Received: by 2002:a05:6214:4287:b0:6bb:8b2e:8e7a with SMTP id
 6a1803df08f44-6bf7d5c47c1mr197599136d6.24.1724081685440; Mon, 19 Aug 2024
 08:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
 <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
 <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>
In-Reply-To: <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Mon, 19 Aug 2024 17:34:34 +0200
Message-ID: <CAKp59VEM6UWHM1Yu9NToFu9T4GfJpgKiXdAzA096KMVcMRqEsg@mail.gmail.com>
Subject: Re: [PATCH v2] xen: PE/COFF image header
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jan,

On Mon, Jul 29, 2024 at 1:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 23.07.2024 20:22, Milan Djokic wrote:
> > From: Nikola Jelic <nikola.jelic@rt-rk.com>
> >
> > Added PE/COFF generic image header which shall be used for EFI
> > application format for x86/risc-v. x86 and risc-v source shall be adjus=
ted
> > to use this header in following commits. pe.h header is taken over from
> > linux kernel with minor changes in terms of formatting and structure me=
mber comments.
> > Also, COFF relocation and win cert structures are ommited, since these =
are not relevant for Xen.
> >
> > Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 36e4fc57fc16
> >
> > Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
> > Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
>
> This looks okay to me now, but I can't ack it (or more precisely my ack
> wouldn't mean anything). There are a few style issues in comments, but
> leaving them as they are in Linux may be intentional. Just one question,
> more to other maintainers than to you:
>
Are we supposed to CC someone additionally for approval?

> > +#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
> > +#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
> > +#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
> > +#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
> > +#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
> > +#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
> > +#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
> > +#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
> > +
> > +#define IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT         0x0001
> > +#define IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT 0x0040
>
> The naming inconsistency (underscore or not after DLL) is somewhat
> unhelpful. Do we maybe want to diverge from what Linux has here? Note
> that e.g. the GNU binutils header has at least a comment there.
>

> What I'm puzzled by is IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
> having the same value as IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE. Are
> these meant to apply to the same field? Or do these values rather
> relate to IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS? Some clarification
> may be needed here, or the two entries may simply want omitting for
> now.
>
These values relate to different fields.
IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE value is related to COFF
optional header, while IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
is related to debug section directory ( when directory type is
IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS as you assumed). Sorry for the
late response on this one, I was off in the past weeks.

BR,
MIlan

