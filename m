Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2008271BC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663554.1033511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMqtH-0000pk-6c; Mon, 08 Jan 2024 14:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663554.1033511; Mon, 08 Jan 2024 14:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMqtH-0000mV-29; Mon, 08 Jan 2024 14:46:11 +0000
Received: by outflank-mailman (input) for mailman id 663554;
 Mon, 08 Jan 2024 14:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHUo=IS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rMqtG-0000mP-8U
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:46:10 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a866f5d2-ae34-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 15:46:09 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd56dac1adso10339091fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:46:08 -0800 (PST)
Received: from [192.168.223.212] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a2e6e0b000000b002cd054fbb34sm1616496ljc.9.2024.01.08.06.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 06:46:07 -0800 (PST)
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
X-Inumbo-ID: a866f5d2-ae34-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704725168; x=1705329968; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=htYOfdr6ndmWBD0eONTPZM6TsTMTN8C8nyd2KqyTMyA=;
        b=TwJiTYfEVW6Si9qJ3vkw6k9rJaxwYxgorX8iwO5qjALPL/njgz/QGZ3WycclWw7RC3
         n9Lt4WPwarWso7WSKES4G3SrESkdHIIOCbejR7b6Yp6a0+NOx8WT/VdNJDIi3tu91VdD
         fbUNfNvU7+enq6vTu2iK/oNYaYG87PWTl1/R734kwnsfryT4hnhG7ZiJ7WbWTBD0438H
         mp8HCVkBJrnNbDOUm6r0aV2u4Vqtjw5/M4EinGEzmP5NRN7mRF0trLP3H0bNf8HoEgBG
         TxjLayQpd0y4iMU7IIJa8SKvV5ay+7NI4A4YlSc6I+COH/sh6btbLDyUz+ZrK2KDUYnt
         G7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725168; x=1705329968;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htYOfdr6ndmWBD0eONTPZM6TsTMTN8C8nyd2KqyTMyA=;
        b=D1yaUkwv9JvXEQBHYn3PTHLFO0iRCWkUbNwjyIBlR+OkhXHv1ObO9ibx4psy42RkJ0
         pdFoImZyuzZHEPPoeYxH2i5lMspni/QAhoktiO5X9mW6bLhtn8hJoWfyshPFiSdukGMZ
         cXedw4iz4qikgk9AcbaJKAq+UXEG78OLLFWdXM1b7EANsMt4oP6CVBcctC7Mo+j7krRf
         RN83E2JA0yHxN6EvJUwJV1rQ436tKLVEGs3M0YvZIQfH/YZjgkklxJ4jTO5Pp3ZaqqdD
         ICK6xGIzqsDZiu5mwDBw38oIalTwQ6Zb41W4tq0uRUuNvGWBQt470h90FkF8Y//soMAd
         txYA==
X-Gm-Message-State: AOJu0YxxfMfV0x25Er5HDEshjev/4NB3fCWrj1sV5tWa55hVnbaVhVGu
	T/CkRrPC/UA3BEIATyRLARY=
X-Google-Smtp-Source: AGHT+IFpao2OdE9TEdSoNpHf5pnQVb0OKNe4h6iUzsxh05VZVHASSSOW0SKNFwTOVq2+K8U6ie2biQ==
X-Received: by 2002:a2e:2a43:0:b0:2cc:c794:57c2 with SMTP id q64-20020a2e2a43000000b002ccc79457c2mr1642832ljq.14.1704725167578;
        Mon, 08 Jan 2024 06:46:07 -0800 (PST)
Message-ID: <da5c455fb419998fa7d6d0df64e95510cf4b182a.camel@gmail.com>
Subject: Re: [PATCH v3 03/34] xen: add support in public/hvm/save.h for PPC
 and RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 08 Jan 2024 16:46:03 +0200
In-Reply-To: <e506cc91-c03c-436e-bfbe-8ff5a3039dc8@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <365d4ab4591129af3a52176d991146b2f64f944b.1703255175.git.oleksii.kurochko@gmail.com>
	 <e506cc91-c03c-436e-bfbe-8ff5a3039dc8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-04 at 12:01 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Since you change how PPC is handled, this can't go without
> description (i.e.
> justification).
I thought adding a comment in the code would be sufficient. I can
include something similar in the commit message as well.


~ Oleksii

>=20
> > --- a/xen/include/public/hvm/save.h
> > +++ b/xen/include/public/hvm/save.h
> > @@ -89,8 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct
> > hvm_save_end);
> > =C2=A0#include "../arch-x86/hvm/save.h"
> > =C2=A0#elif defined(__arm__) || defined(__aarch64__)
> > =C2=A0#include "../arch-arm/hvm/save.h"
> > -#elif defined(__powerpc64__)
> > -#include "../arch-ppc.h"
> > +#elif defined(__powerpc64__) || defined(__riscv)
> > +/* no specific header to include */
> > =C2=A0#else
> > =C2=A0#error "unsupported architecture"
> > =C2=A0#endif
>=20


