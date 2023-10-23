Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FD7D2EA7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621159.967320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurQC-0001AD-EM; Mon, 23 Oct 2023 09:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621159.967320; Mon, 23 Oct 2023 09:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurQC-00017U-BW; Mon, 23 Oct 2023 09:40:28 +0000
Received: by outflank-mailman (input) for mailman id 621159;
 Mon, 23 Oct 2023 09:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qurQB-00017O-9W
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:40:27 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316b2502-7188-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:40:25 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507a62d4788so4811467e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:40:26 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a056512078a00b00507a0098424sm1608318lfr.109.2023.10.23.02.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:40:24 -0700 (PDT)
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
X-Inumbo-ID: 316b2502-7188-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698054026; x=1698658826; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vNcsuFsrnKIOO5YGPBrm4Q9F28dPL1sekgtRjihi25o=;
        b=hJC93MEfPcU7hfASm1G6P19fgwZvxKcZyULA5a2z5Ck/S6NsKlLVghvJ6uVYzm9DLH
         VcAGW5gacN5vvtq8gKeT8fR+JUIfhpkdffn1q49n3+4lZIubgtC05jXZysau5/CAbYRR
         pcIi9A6sKirntNro+b6iDP/0Rc9PRM+cBFYmmgQz29T3KA9Ji/aQxnMI2fiRIiEu9sR1
         cz7zdmF6KU+cYXWEZPknWvfNQftrlYB8zAMYU4rSsNVgXN5up/Q0AMh9COcltscz5Cwj
         XrAZ8onh1ZlOQiRMsRZOEcHfk1QQwONDvljtO/rtn5D6Qq9Uov9y2/aTHLWkSBGX42PO
         V5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054026; x=1698658826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNcsuFsrnKIOO5YGPBrm4Q9F28dPL1sekgtRjihi25o=;
        b=a9vwA9IqnkMn/efToIyay/U2CWiMwVQTqBvnJrH2XQZMWg9Uev095ObZ3naBUcsDMj
         x+nG3b4bKJ9+MkOxpYRiRh+OSDfYq7CO4iWtlJMBcyoX2i1lQ7BKsmuYWT1rgwCUpfrf
         r8ujLcfXWn6hIVsbNliVxkHZ90cAOB7yZ22pVtfreGWPioG4kyLA6pUha3CDppuNl4w5
         W4LfMc/08irUehy1VmlZSXxlFlhWoBDhHS9Ruh57xDFS74ZsBlc9wg94s5r4sRiW9SrO
         Qo4DBwbfcn9U9m86l3wqr9KUyNyTqVuqiS3/XrU6mF+HQVU6iyC0dgPpsO0GMQWNjgqf
         J5uw==
X-Gm-Message-State: AOJu0YzHgyRwpqxIqI4Z+MKzsg0S1Sg0vB3mc+SiL/x9ExQddX5debKO
	BLGEnp8SaBLujKhbJr0arK4=
X-Google-Smtp-Source: AGHT+IHnJmaHS/zjB/EBhm6Wyjk9YSymIU4xfaFHe44fa+NzXzlHJ77jMy7xyVcMIcSOMNMXh2hEfQ==
X-Received: by 2002:ac2:46c6:0:b0:503:256a:80cc with SMTP id p6-20020ac246c6000000b00503256a80ccmr5550886lfo.42.1698054025522;
        Mon, 23 Oct 2023 02:40:25 -0700 (PDT)
Message-ID: <9b446557abc4579219c0ead28263ded8136fefbc.camel@gmail.com>
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 12:40:24 +0300
In-Reply-To: <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
	 <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:05 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > The patch introduces stub header needed for full Xen build.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/include/asm-generic/paging.h | 17 +++++++++++++++++
> > =C2=A01 file changed, 17 insertions(+)
> > =C2=A0create mode 100644 xen/include/asm-generic/paging.h
> >=20
> > diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-
> > generic/paging.h
> > new file mode 100644
> > index 0000000000..2aab63b536
> > --- /dev/null
> > +++ b/xen/include/asm-generic/paging.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_PAGING_H__
> > +#define __ASM_GENERIC_PAGING_H__
> > +
> > +#define paging_mode_translate(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0(1)
> > +#define paging_mode_external(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(1)
> > +
> > +#endif /* __ASM_GENERIC_PAGING_H__ */
>=20
> Looks okay, but wants accompanying by dropping (i.e. effectively
> moving)
> Arm's respective header. The description than also wants adjusting
> (it
> wasn't quite suitable anyway, as there's missing context).
If I understand you correctly, I'll re-use ARM's header, but I am not
sure I know how the description should be changed except that it can be
more specific regarding which one header is introduced.

~ Oleksii


