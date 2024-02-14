Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D2854903
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680710.1058787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEBg-0002z0-LL; Wed, 14 Feb 2024 12:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680710.1058787; Wed, 14 Feb 2024 12:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEBg-0002vo-I3; Wed, 14 Feb 2024 12:16:28 +0000
Received: by outflank-mailman (input) for mailman id 680710;
 Wed, 14 Feb 2024 12:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raEBe-0002vi-VJ
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:16:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfdf60cd-cb32-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 13:16:26 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5638c4a8d6eso338139a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 04:16:26 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vs2-20020a170907a58200b00a3d5b5221bbsm301885ejc.141.2024.02.14.04.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 04:16:25 -0800 (PST)
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
X-Inumbo-ID: dfdf60cd-cb32-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707912985; x=1708517785; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E/IXyESE4Z5lTt9/WS9WESTAg/XUURSl0UZdLXssyhg=;
        b=PMLBJ4Ew3PuNBkMkziUSb0VImnXBA0s+Zf3oNMBElcBGOEYHpqdVmXGVBUTh1L9wG2
         3qHhzbCSgbwi46TK1QWlHopzYjWb5J4FzgMkQMzsfQiutsUC0jVjwJaCVfqc5xVNGux6
         5QGfhgU1Xwju04Sj9qlxLxGTFgZVp7tqfihJWGTrTe3XddWpxU6Wzxc1+y99h4GX0zMt
         sMn+DCCVMTBiKJRzBzULwmswbphQATRkdQVR1YPQmLUq3lZCmp1QUI1dp6us7HXB/gsA
         ugl2l7e9Hq/9uUGeLXj91+1rbowLS8/lfAoadkstRCnjWYnnVBW8erSDMuF8moBKHMh8
         mM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707912985; x=1708517785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/IXyESE4Z5lTt9/WS9WESTAg/XUURSl0UZdLXssyhg=;
        b=jvTQsita8P8L5i480fm0UWhYDo0vtIQpnMSecS0USLAeYmEX6E3Ax0CiNDBMToIFlW
         wZree41hhFS78auzdZGtKYd1FCu/DnL8PDM61/AYCIP86xK/pgrbAdjWbiuR6xfDBb41
         J+Ih7Ixx+BgqPU9HT1tL4nNRuxpZkfJjix4kb7Je2ZHmAil18bHoz4/w3ne3pLR3Pm7F
         lvQQv5QMO1JU7KtB3VjvR5TAmzYD8vjHF3UHiqxr4naww+ryKLXYNTtnFVjU5tfqSFFd
         CgGY1GeXEIlLsds/SwHSdDYnmYoUU5/2iv7LFV4lfEzcbuHx8ESO1zEQIR6lQhtMdk0W
         zoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHOgdPp99wOaZQAfSRMYP2P13GmZmF6hMZMiW+IVvg2smZyspNNE+fMplZRHcqxeUoy860mEcNhpV8BaZnmNG2nAjU446PqvQgGjpUOwc=
X-Gm-Message-State: AOJu0Yz0GzgKHPmqF6CJd6fRSZKftTPiEax/ZCX/zHaYuEoTAJCAdree
	ZUd7dWdYZzgcCFsBN6wnp3DngB1Qdq8CrxcddqXw/GsELwExCf+R
X-Google-Smtp-Source: AGHT+IER8QuamIdkDMFDgBnmG3CnFbvCkYKlE1vob/BlPUua6lxzawWnI5Yb39sHCH0dJfyvQb2UiQ==
X-Received: by 2002:a17:906:5596:b0:a3c:eeef:2283 with SMTP id y22-20020a170906559600b00a3ceeef2283mr1555308ejp.43.1707912985462;
        Wed, 14 Feb 2024 04:16:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXL9iMGe537taVKj48hcR93UOO5CjYv7ZC5hcdZ4NvHjBIUHn5RjHTjMTaupSFI1MWgQfPWemwXLRNRmJxMJe90BGOqIurDeOzZS1bDyZOgi5t8j0zCV8NTh8n0J1OXIAjbQD+DcTEOKQl6rd7FKbIi/QPz/q3yAAYdk9wm5cd45mzgR0uv3cLBUquD64D8E/yVft3mvHOMw4uDluw6TxESOBsRHyMBwfMzHFGpInnK6Pu9aiWs6z3nUr7skHZGCOf9VLgRbTCh7oXhcwEE83Ry4fOknj2OFeRe2z92XkKyQBMyhnNpaNQ=
Message-ID: <39e07917c237a2d2e8879a66511edef4590d9fba.camel@gmail.com>
Subject: Re: [PATCH v4 19/30] xen/riscv: introduce event.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 13:16:24 +0100
In-Reply-To: <36b25710-cf95-4250-bf4a-6ccf4f418909@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <a57aed8d2d8424c63b1f27d007b2d5cfe35460cc.1707146506.git.oleksii.kurochko@gmail.com>
	 <36b25710-cf95-4250-bf4a-6ccf4f418909@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:20 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> again with a nit, though:
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/event.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_RISCV_EVENT_H__
> > +#define __ASM_RISCV_EVENT_H__
> > +
> > +#include <xen/lib.h>
> > +
> > +void vcpu_mark_events_pending(struct vcpu *v);
> > +
> > +static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline int local_events_need_delivery(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline void local_event_delivery_enable(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +}
> > +
> > +/* No arch specific virq definition now. Default to global. */
> > +static inline bool arch_virq_is_global(unsigned int virq)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +
> > +#endif
>=20
> This want to gain the usual comment.
Do you mean that commit messag should be updated?

~ Oleksii

