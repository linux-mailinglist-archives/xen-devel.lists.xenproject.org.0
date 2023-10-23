Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163717D33CF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621383.967800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutC9-0004Ff-V5; Mon, 23 Oct 2023 11:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621383.967800; Mon, 23 Oct 2023 11:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutC9-0004DF-Sa; Mon, 23 Oct 2023 11:34:05 +0000
Received: by outflank-mailman (input) for mailman id 621383;
 Mon, 23 Oct 2023 11:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qutC8-0004Bf-KW
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:34:04 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c1c1c6-7198-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 13:34:02 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso45246431fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:34:02 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a2e9d83000000b002c5109e3d0asm1579250ljj.135.2023.10.23.04.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:34:01 -0700 (PDT)
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
X-Inumbo-ID: 10c1c1c6-7198-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698060842; x=1698665642; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+QRHc191hMKkB0/ALRub9V+zlPReTVB7mIswMTd3oDc=;
        b=Nnv1fOXDkT8Zb4N7tr7iRZceH4DxMRzGR2qvEUrloBmQrjHkQlTTRE/5eoyzJd8wel
         ZpjoFQItBQyZB9NKbyVpPLyAB+RO4kx4ZGsO81M4/S4uU2iE2s2OHCYvNlQB7uh9xWLJ
         6qHH8tKfwGL226wdhiJaoBC1WjG/ZZgUFYBGlm2sRZQMwOJqKKfKJMpIlQL2khFIY4Kr
         mQYyv8eobpXFmlD+GB/aG5wbhGQBdjkNXMkRFIhVYQtXpcpXGUEQfJ2l0tVPgy/Cby5N
         BxrnfStCu6qubFUUP051aMXVviH7OcbK7ycIdU5kJJVKk4/xerG8irRHy3Z6DTUsQdkR
         ulcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060842; x=1698665642;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QRHc191hMKkB0/ALRub9V+zlPReTVB7mIswMTd3oDc=;
        b=OiOCQoT+01tF0CRDXGhjxjMiSpPxo0uu+PnIGO+0fmRvBjGUwZHxlpnz6qrMLd7dWy
         YCjwSY5J77a67Po0Jr46+UJqsyohbuO4L1WdQ/kRDSCIla6yglKeiAQTvfgDlsI82xtd
         MbIvSg08DJgUzUpKFLQMg+0a3NBCTWRkRTEVMsvOIhIb3oiy0tAVpfRj+JeN9Vu3Jmjk
         IwBAUvTw58AB34FJG3Xlv7QWJign7X/i++YP3cZDEt4uQgFd8A7PsDKUzzgoPxkTWAb2
         xnlKmDfqtU9cfOoJQOkLTHcIwLP9Rq3e+0JxPyClGlwPD+kKBsNrJBBMNYaOn5fr0Shs
         tsmg==
X-Gm-Message-State: AOJu0YwHFsXzyBpd/NrkxFRhQDmVZH6TIIkRYdYXGOFA2BMqtW7oAJsH
	zog78if+X8bKvXiZNQxFzDQ=
X-Google-Smtp-Source: AGHT+IEHWTBHBvOzqc+5oAulJKB8J3O7eVDeHvAg+44EFVzpwY7UkiQP3t12eyUZBLF2kkNwQ+Nkiw==
X-Received: by 2002:a2e:7d17:0:b0:2c1:3d9f:1f4d with SMTP id y23-20020a2e7d17000000b002c13d9f1f4dmr6372711ljc.9.1698060841926;
        Mon, 23 Oct 2023 04:34:01 -0700 (PDT)
Message-ID: <25ba35fb33008c9e6484d4280179703dca6aa26c.camel@gmail.com>
Subject: Re: [PATCH v1 21/29] xen/asm-generic: introduce stub header altp2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:34:00 +0300
In-Reply-To: <32b0e0b0-aed4-4204-ef6b-8b93bfb557c6@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <619b24fbd568f439baf1941a972c6943f423b4ad.1694702259.git.oleksii.kurochko@gmail.com>
	 <32b0e0b0-aed4-4204-ef6b-8b93bfb557c6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 13:27 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > The patch introduces header stub necessry for full Xen build.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/include/asm-generic/altp2m.h | 34
> > ++++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 34 insertions(+)
> > =C2=A0create mode 100644 xen/include/asm-generic/altp2m.h
>=20
> While odd to be needed, this looks largely okay for the moment. Just
> one remark:
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/altp2m.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_ALTP2M_H
> > +#define __ASM_GENERIC_ALTP2M_H
> > +
> > +#include <xen/bug.h>
> > +
> > +struct domain;
> > +struct vcpu;
> > +
> > +/* Alternate p2m on/off per domain */
> > +static inline bool altp2m_active(const struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Not implemented on GENERIC. */
> > +=C2=A0=C2=A0=C2=A0 return false;
> > +}
> > +
> > +/* Alternate p2m VCPU */
> > +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
>=20
> uint16_t is what x86 wants, but even on Arm it's suspicious. For a
> generic header I'd say make it unsigned int, thus also eliminating
> the question whether xen/types.h should be included here.

Thanks. I'll make sure to update the patch accordingly.

~ Oleksii

