Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF49816A8F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655778.1023550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAYf-00010R-Al; Mon, 18 Dec 2023 10:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655778.1023550; Mon, 18 Dec 2023 10:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAYf-0000xO-7w; Mon, 18 Dec 2023 10:09:09 +0000
Received: by outflank-mailman (input) for mailman id 655778;
 Mon, 18 Dec 2023 10:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFAYd-0000S6-NB
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:09:07 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7adc42d4-9d8d-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:09:07 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cc6a52231cso10443181fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:09:07 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a2e9ace000000b002cc68f0c127sm613303ljj.134.2023.12.18.02.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:09:06 -0800 (PST)
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
X-Inumbo-ID: 7adc42d4-9d8d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702894147; x=1703498947; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/i2SWE2VS1xxt0Fg74/ZRVGtJav8DC8Y3wsFqZpLhs=;
        b=WmDNFw8UgNBNUeGGxUdf8iDieqDMpkoDU1LHpncYMDvlAYsCI07BhfzvSz1NbzScDP
         L4gp4ZK0WJViNEgQ9z4+G5TWsDJMXTY0ClAD5V5ePvY4I3opjd8Vq+MvKRJbU1Bsqu74
         4cdjlZ0U5eRC6Cwd3M0QpzESnRtys6EwX3IqcbXAU6VJjnvZWIXBpJ9N23pwJTNQXELH
         bCBKGC5DTQBIEoY/BZTf5ogaG7nLg6Y6ktc4LLp8sURUf/Fq2U56AP+V+/W68y2HdOt3
         8TSwzyPTxqxIM9rDOp9YtQx9cAyTcZuQh4bymWAfCGhYgRhK6YaLWH7moKDQVt/OyIjL
         gvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894147; x=1703498947;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/i2SWE2VS1xxt0Fg74/ZRVGtJav8DC8Y3wsFqZpLhs=;
        b=KZGU7+PQkVUU8OHbgKB0YQ50hTxz+7Wfm7Ffv+vusJ2kKl2pBXqbyIhg/zNa30ihMz
         TdcDqszeQfNEIvqVZaLD/c/CTz1HhxxxdBfom3bJYsJksA1xFERoEw7WL8l4Hm/gWKWK
         CzR0zhhD1q2ARdcp/mRjFcVYluy995kNGUdyGpVeLOIdAk0DQpIqujSDm42zO5AGIARe
         Lv1/vsLN8lkLRE6YWeaffDbZgHvbXL5YZV3cuNtqDjDRTPOUiLd3zaArzYJhhc9SxxwJ
         OkLyH+8zfsWNEtfhvcV/Qvk8O+YkVyIbJwrg/gZ0t3QIiIZ2SCpkTgQ993foYKV4UW1P
         h74w==
X-Gm-Message-State: AOJu0Yw4pwON4rmJtWWdvnQ9y5+EjFUm/hU2eH4khJdQszojsNdLhQt7
	6ZxfuWRWaTZabKcN9PSFWkQ=
X-Google-Smtp-Source: AGHT+IFcSEQg16pGRQ3DgxqiMLSuete5Zj6KNX82Ror8iAb896JmOZyjRNQpebr+3ceGT+Wff5dGGw==
X-Received: by 2002:a2e:9350:0:b0:2cc:7125:fa8c with SMTP id m16-20020a2e9350000000b002cc7125fa8cmr481871ljh.62.1702894146707;
        Mon, 18 Dec 2023 02:09:06 -0800 (PST)
Message-ID: <6a41baabbeaedf16b3c82d839f9f3bb53c4fb980.camel@gmail.com>
Subject: Re: [PATCH v2 27/39] xen/riscv: introduce asm/time.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:09:05 +0200
In-Reply-To: <96e877a8-a98e-4275-9d99-da7b1b6dea4b@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <ab09f88d1c43478938811511c54c9d425f4080d6.1700761381.git.oleksii.kurochko@gmail.com>
	 <96e877a8-a98e-4275-9d99-da7b1b6dea4b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 16:06 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/time.h
> > @@ -0,0 +1,19 @@
> > +#ifndef __ASM_RISCV_TIME_H__
> > +#define __ASM_RISCV_TIME_H__
> > +
> > +#include <xen/bug.h>
> > +#include <asm/csr.h>
> > +
> > +struct vcpu;
> > +
> > +/* TODO: implement */
> > +static inline void force_update_vcpu_system_time(struct vcpu *v) {
> > BUG(); }
> > +
> > +typedef unsigned long cycles_t;
> > +
> > +static inline cycles_t get_cycles(void)
> > +{
> > +	return csr_read(CSR_TIME);
> > +}
> > +
> > +#endif /* __ASM_RISCV_TIME_H__ */
> > \ No newline at end of file
>=20
> With this taken care of (and the SPDX header added)
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks.

I'll add SPDX and fix "No newline..."

~ Oleksii


