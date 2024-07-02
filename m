Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E699242CA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 17:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752572.1160789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOfmc-0003zE-81; Tue, 02 Jul 2024 15:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752572.1160789; Tue, 02 Jul 2024 15:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOfmc-0003wx-5A; Tue, 02 Jul 2024 15:51:06 +0000
Received: by outflank-mailman (input) for mailman id 752572;
 Tue, 02 Jul 2024 15:51:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOfmb-0003wr-8f
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 15:51:05 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33e5c3c-388a-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 17:51:04 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so4563761e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 08:51:04 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b24asm1841450e87.271.2024.07.02.08.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 08:51:03 -0700 (PDT)
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
X-Inumbo-ID: e33e5c3c-388a-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719935463; x=1720540263; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pnKnL/YkY7ozqDYH/QXfMK319NiqCdyY7Mwn+3rP8Xw=;
        b=f7FhgPXN4mkF7567QwD9JYRXw6Rn0OVVM06LobEbulZeNlINYe3fOesWLmkowAirCP
         Nvg0CzRwdwFDRmWOvZvFnKvsQoQV06X3IQ8a6Arx6jCCY9s4TlLwNYny45ohGdAs8pvy
         j/mrx+V8MYlPQA7jRNn6Jhu/j513tP+fbJQ4ssPCAJuOUUs61rEMe7MLSrI/9DNl8sV2
         Hg6VvixwaaUsQfO3p6XL5EL7ZDGEEgWviiEmext8mnX+1tchMmkpISBodZjeC7bv/oJj
         QcPvQTcxTWBWENbTWw/D7l8VIH/LavF5DvcUaFETFEx2n4JQE3w115i/l1LIiTepa1zw
         wMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719935464; x=1720540264;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnKnL/YkY7ozqDYH/QXfMK319NiqCdyY7Mwn+3rP8Xw=;
        b=hC2Hj+ltHd4JAZ5V//Adk3lQ48x1w9FyfBtcgi/VBy5fATRjMEaSQ/kn5qhyD3jXmr
         Ov9Wy/TrOOOstBxnjuC+35i2O0kPzx120b9pv1o05qqmxkGjK2EZZnxnteKgBfXt8fQr
         aamY2thprdMbs5l9LuIwSd0JWiwTi31U0ODLgXGwVezWspWJRrUEcmR8VgaTCUWdp08z
         8zTvdO7r4ir8b7dl/mclRBmfmm9ONVoAUDukobtIdwOg1jtT9PG+9Gs4KR9pefAf1FOE
         eA8Fc8c4+t9yUnbHsWuIga3mW9fua65TIMzKOj4McUN8fM/LEm/NIJ2g5iOvRHs/dulL
         gAEw==
X-Forwarded-Encrypted: i=1; AJvYcCXDpefaGWlhomso4WEAqrv3uyHtoXD8q3STGt9TP6IXcK0/8oQRYcB00p4vUWCsrSL4vo3OgKqUkAxNcEiEnaT/hH5CA8KukH2kZ5a+w7Q=
X-Gm-Message-State: AOJu0YyFbbaUD2Qth1t0acFHz7puT3KcwrYtEMz0vV/fPQchY2Y4jI1g
	+taaJkrK0qEvW/0atZDXWc8xdhNabaw5Z2IyOmIM1025DEAqEm3Q
X-Google-Smtp-Source: AGHT+IGcG0sL0SplPebQo3Nklkfkyori0YSQpIxD9KrxXFzYEm3Sy3iyrcNlnAy5reOtxpBowYQYyw==
X-Received: by 2002:a05:6512:acd:b0:52e:7674:b51d with SMTP id 2adb3069b0e04-52e8264bf35mr6094774e87.12.1719935463339;
        Tue, 02 Jul 2024 08:51:03 -0700 (PDT)
Message-ID: <06ab486e46148281eda3abf08d43811a4cb2ac85.camel@gmail.com>
Subject: Re: [PATCH v14 8/9] xen/riscv: introduce ANDN_INSN
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 02 Jul 2024 17:51:02 +0200
In-Reply-To: <15d42265-0aec-40c1-b468-e6ebaabffbeb@suse.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
	 <07c628e8552f6e31a07e4261b273553cb4a3669b.1719917348.git.oleksii.kurochko@gmail.com>
	 <15d42265-0aec-40c1-b468-e6ebaabffbeb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-02 at 14:08 +0200, Jan Beulich wrote:
> > --- a/xen/arch/riscv/include/asm/cmpxchg.h
> > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > @@ -18,6 +18,19 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" );
> > =C2=A0=20
> > +/*
> > + * To not face an issue that gas doesn't understand ANDN
> > instruction
> > + * it is encoded using .insn directive.
> > + */
> > +#ifdef __riscv_zbb
> > +#define ANDN_INSN(rd, rs1, rs2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 ".insn r 0x33, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\=
n"
>=20
> Why 0x33? Just like in the other patch you used MISC_MEM (as
> suggested,
> for being more descriptive), you want to use OP here. Then
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> (and I'd certainly be okay making the change while committing)

According to Volume 1, Unprivileged Specification version 20240411 the
andn instruction looks
like:
31          25 24 20 19 15 14   12 11 7 6           0
0 1 0 0 0 0 0   rs2   rs1   1 1 1   rd  0 1 1 0 0 1 1
                                               OP

This instruction is R-type. According to the gcc manual
( https://sourceware.org/binutils/docs/as/RISC_002dV_002dFormats.html
):
R type: .insn r opcode6, func3, func7, rd, rs1, rs2
+-------+-----+-----+-------+----+---------+
| func7 | rs2 | rs1 | func3 | rd | opcode6 |
+-------+-----+-----+-------+----+---------+
31      25    20    15      12   7        0

so opcode6 in case of andn is 0x33 (0110011)

~ Oleksii

