Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5438C997E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 09:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725840.1130154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8xiv-0000Ps-4q; Mon, 20 May 2024 07:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725840.1130154; Mon, 20 May 2024 07:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8xiv-0000Nx-2E; Mon, 20 May 2024 07:46:21 +0000
Received: by outflank-mailman (input) for mailman id 725840;
 Mon, 20 May 2024 07:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovh5=MX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s8xit-0000Nq-Cl
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 07:46:19 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af8c875-167d-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 09:46:18 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5766cd9ca1bso1475019a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 00:46:18 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c323887sm14838455a12.89.2024.05.20.00.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 00:46:17 -0700 (PDT)
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
X-Inumbo-ID: 0af8c875-167d-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716191178; x=1716795978; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iV+0g0/GQ8wUbJqz6bMOVhIdbF+12LObjVNNzEiUTgU=;
        b=Hl2OW1bj6Zt+L+OIPEhVIMvloN00bVOaDJsKlsd25hHHMici/QxhO/dsmrr/0GmTeB
         2keOOpsSVocZgNl3XTcy6VyJt9vMuaxhf8ycFZ0THDOPOk5spgzxfQ/4HULHs4+vrORO
         8lDqSyr7mrXa9ghw4ifbNfeDUEce5JHjHwn2EkbL70pEw6tp7ctQM8x+ZMC/GbxNL3N2
         93/f6JinXFbLdMrlZCX7pOYmGSvgJL01PZCY4UwWLfPBqvU5Ns6npKU7T6v1i0uah9Fw
         cLaX1q4lTC9HqkqSlTj2qDxMcGWcAsdTgkOKxzpK1eWAivXKtnr3b0HR8LnuR06TRrUI
         xonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716191178; x=1716795978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iV+0g0/GQ8wUbJqz6bMOVhIdbF+12LObjVNNzEiUTgU=;
        b=XyhA0U3nF8PJ8EDwjnPKQSE3EpbzQ7rurzb6aOsjgHutXeeR+4AMyCEVzCBIilBagv
         EVv1p63qXEbo7WbvgZ1J4vunUnXQEEk79S/AKiNjbtVjGyggM86EaLCCfS+aaqvjZRoL
         IWzHIBR6uDt0fnqbpkHPoJ23AyOozCvWgliSHJfxEvz/BNjQxS/URYibhWsU1VpAJRYL
         aKRPQnw3i48DNaQ0DE1GT18SrArNcvQKCQiLQyVl5xLZVGomKyj+W65Yy44vQ4Kz8vrA
         dR+ijWgj9wP0W0YVOfh1RY3LwO+jpA7vdugktCidsT+/h4cTBoogjOioP8gZ+D9h2Pyo
         vXQw==
X-Forwarded-Encrypted: i=1; AJvYcCVFZTH14KMZJ5LU1/LB/RPbDloeFGkF+3fqbreN1RIVa1fQ9aWlwCqUNsVh66yD9dn4tCkjJArCimkaKCxkn4tmpTB8IXzBZOPrjq5QWEY=
X-Gm-Message-State: AOJu0YwrR42uDk6luYy1TH6uQP0c3uvWjN3f6DWKA4da0l4ppCmhy84J
	JNoLMUor7U25ZPF2uYfWwnxfZ5wvnlJsUkBTyu/1tzmKWM9zweF/
X-Google-Smtp-Source: AGHT+IHdO+7a9m7ODEgZ87P2NlJggK6m3Ogi2+lwWBOHo3sR7ZRkleEvVifd1jG7Yikt4Y+v225UjQ==
X-Received: by 2002:a50:a456:0:b0:56f:e585:2388 with SMTP id 4fb4d7f45d1cf-5734d6de9a1mr19332993a12.36.1716191177624;
        Mon, 20 May 2024 00:46:17 -0700 (PDT)
Message-ID: <4a5ac8daf5d16662a0233771a625b8313f0fecc7.camel@gmail.com>
Subject: Re: [PATCH for-4.19] x86/msi: prevent watchdog triggering when
 dumping MSI state
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Date: Mon, 20 May 2024 09:46:16 +0200
In-Reply-To: <20240517135605.94781-1-roger.pau@citrix.com>
References: <20240517135605.94781-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-05-17 at 15:56 +0200, Roger Pau Monne wrote:
> Use the same check that's used in dump_irqs().
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> =C2=A0xen/arch/x86/msi.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 19830528b65a..0c97fbb3fc03 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/pci.h>
> =C2=A0#include <xen/pci_regs.h>
> +#include <xen/softirq.h>
> =C2=A0#include <xen/iocap.h>
> =C2=A0#include <xen/keyhandler.h>
> =C2=A0#include <xen/pfn.h>
> @@ -1451,6 +1452,9 @@ static void cf_check dump_msi(unsigned char
> key)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *type =3D "??=
?";
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !(irq & 0x1f) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proce=
ss_pending_softirqs();
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !irq_desc_initializ=
ed(desc) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
continue;
> =C2=A0

Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

