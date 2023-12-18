Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A77816D21
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655910.1023810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCFj-0006Er-6Q; Mon, 18 Dec 2023 11:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655910.1023810; Mon, 18 Dec 2023 11:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCFj-0006CS-3j; Mon, 18 Dec 2023 11:57:43 +0000
Received: by outflank-mailman (input) for mailman id 655910;
 Mon, 18 Dec 2023 11:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFCFh-0006CM-N3
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:57:41 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35465d1-9d9c-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:57:37 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50c04ebe1bbso3818483e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:57:37 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a195f0a000000b0050e38f8ba2esm259192lfb.273.2023.12.18.03.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:57:36 -0800 (PST)
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
X-Inumbo-ID: a35465d1-9d9c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702900657; x=1703505457; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dYi86SiMnphl8dWBxbqFJm3Le7+SIw0V803ihqs4b1A=;
        b=GkbKaYgR2VTchkqct5Y5/cBsGbHzzbg+Hot3NMKUmNtafjY/sZq5obguFv9VujFqZw
         1dHgjtJ3uwiF/TZOchdCU+8uulrBNYn/jhUN0luStBR/aLouW5HaTf5zXwcLfqo86KV4
         2kiLt2vYAb1Sl6Jj/FZ5hQVn5h2XWKI8vXrmIseS9pqwphtxSazVvXiBgvImnJzeOGjV
         tb83FOqpeAIVgLsByyywVoV727Y/+/rixgjhAiQ6x+w+9PL2YTg5LVJrAXEcZrfPJUW8
         AxvUrhAZaU6gdH+lGGSGRXXcMLtRdStCQ3BPvBW+qT9xCwEHyReZEphSz8cLpjz1UtVL
         F9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702900657; x=1703505457;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYi86SiMnphl8dWBxbqFJm3Le7+SIw0V803ihqs4b1A=;
        b=e9JUVZefIAjexsVtXf0z1+ZmyzKImBO4szdkzVl5tmSHAqqPyq7ZSYojmU0DBhewEB
         dTsqcl+yZq63epolYrE9sDtVas23HMe4DDpMcFwDAbUefk+MyQl1lofAgT0877ctgCxK
         qnO6i0BVlWl7B/4k3rxKmWyKkH4pEVo3L4rxdiC7UUg6q6gYuyigyUf0pK9Bw9zQaTMe
         e5qqSz00bMXHxSQZf289DYJ1cDIyxrLz8KmQDXTYgQCm4pNrt8dUGgDKO1hsl0uq6VGw
         Yk04KIRSZEVesV33UMlL7d8tc+jTLSIDSjrBOVPkSETZfJzKLoe1HdfUQ5pDgzt2OC5c
         vg9Q==
X-Gm-Message-State: AOJu0YzBOOfOtZ/1OA9HQAQ2VTZbpVK2ak/fnnJG5eqnxNljtqnupQf1
	KOltneo1v7rzDxImu/LlS7Q=
X-Google-Smtp-Source: AGHT+IG3Jo7V4DTj44V+yQguI+0NiGxbBZCAqv1OlMpAlZrAqHVbtHOhFZFtsuTcwLvuh3QEMGBwfA==
X-Received: by 2002:ac2:4849:0:b0:50e:2ade:af45 with SMTP id 9-20020ac24849000000b0050e2adeaf45mr1728066lfy.29.1702900657033;
        Mon, 18 Dec 2023 03:57:37 -0800 (PST)
Message-ID: <61afc7bf7dd153c368173eb8a82052d726ae2512.camel@gmail.com>
Subject: Re: [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 13:57:36 +0200
In-Reply-To: <2fa8fa4f-86d9-4856-91f3-f3dcf1c1013c@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <34a4bc023eb50e1d1cf70fa149825c51f2f4555f.1700761381.git.oleksii.kurochko@gmail.com>
	 <ccef1adc-af39-43b2-8f97-ed3895e8809d@suse.com>
	 <c0ae5654e6be1eb10282a3d95fb419d5c975e98b.camel@gmail.com>
	 <2fa8fa4f-86d9-4856-91f3-f3dcf1c1013c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-18 at 12:36 +0100, Jan Beulich wrote:
> On 18.12.2023 11:45, Oleksii wrote:
> > On Thu, 2023-12-14 at 16:57 +0100, Jan Beulich wrote:
> > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > >=20
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > >=20
> > > I wonder though ...
> > >=20
> > > > --- a/xen/arch/riscv/include/asm/page.h
> > > > +++ b/xen/arch/riscv/include/asm/page.h
> > > > @@ -6,6 +6,7 @@
> > > > =C2=A0#ifndef __ASSEMBLY__
> > > > =C2=A0
> > > > =C2=A0#include <xen/const.h>
> > > > +#include <xen/bug.h>
> > > > =C2=A0#include <xen/types.h>
> > > > =C2=A0
> > > > =C2=A0#include <asm/mm.h>
> > > > @@ -32,6 +33,9 @@
> > > > =C2=A0#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE
> > > > |
> > > > PTE_WRITABLE)
> > > > =C2=A0#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VAL=
ID)
> > > > =C2=A0
> > > > +/* TODO */
> > > > +#define PAGE_HYPERVISOR 0
> > >=20
> > > ... whether this couldn't be defined properly right away.
> > It can be introduced now but it requires some additional defines to
> > be
> > introduced in the same time:
> >=20
> > #define _PAGE_W_BIT=C2=A0=C2=A0=C2=A0=C2=A0 2
> > #define _PAGE_XN_BIT=C2=A0=C2=A0=C2=A0 3
> > #define _PAGE_RO_BIT=C2=A0=C2=A0=C2=A0 1
> > #define _PAGE_XN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1U << _PAGE=
_XN_BIT)
> > #define _PAGE_RO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1U << _PAGE=
_RO_BIT)
> > #define _PAGE_W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1U << =
_PAGE_W_BIT)
>=20
> Why would you need these, when you already have
> PTE_{READABLE,WRITABLE,EXECUTABLE} just out of context from above?
I thought that the hypervisor page table is fully software-related, and
that's why a separate PAGE*BIT was introduced. These bits can be
different from PTE* bits, which are hardware-related
https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/include/asm/=
page.h?ref_type=3Dheads#L66

It looks like I misunderstood that, and PTE* can be used everywhere
instead of _PAGE*. Alternatively, we could consider renaming everything
to PAGE* to maintain consistency across architectures.

Does it make sense?


> (And
> that's aside from me (a) not following the naming (vs their purpose)
> and
> (b) not seeing what _PAGE_*_BIT are needed for, not even thinking
> about
> the leading underscores in these identifiers again.)
>=20
> > ...
> > /*
> > =C2=A0* _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are
> > not
> > =C2=A0* meant to be used outside of this header.
> > =C2=A0*/
> > // #define _PAGE_DEVICE=C2=A0=C2=A0=C2=A0 _PAGE_XN
> > #define _PAGE_NORMAL=C2=A0=C2=A0=C2=A0 _PAGE_PRESENT
> >=20
> > #define PAGE_HYPERVISOR_RW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_PAGE_NORMAL =
| _PAGE_RO | _PAGE_XN
> > |
> > _PAGE_W)
> >=20
> > #define PAGE_HYPERVISOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 PAGE_HYPERVISOR_RW
> >=20
> > And _PAGE_PRESENT in pgtbl-bits.h:
> >=20
> > #define _PAGE_PRESENT=C2=A0=C2=A0 (1 << 0)
> >=20
> > I prefer to introduce all this things when it will be really used.
>=20
> I understand that, yet for easy things it may help doing them right
> away, rather than leaving them to be touched (in a straightforward
> way)
> again very soon.
>=20
~ Oleksii


