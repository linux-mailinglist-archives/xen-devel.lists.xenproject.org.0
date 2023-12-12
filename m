Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD980F431
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 18:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653346.1019838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD6LF-0003G8-IV; Tue, 12 Dec 2023 17:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653346.1019838; Tue, 12 Dec 2023 17:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD6LF-0003EQ-Es; Tue, 12 Dec 2023 17:14:45 +0000
Received: by outflank-mailman (input) for mailman id 653346;
 Tue, 12 Dec 2023 17:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8c9m=HX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rD6LD-0003EK-EQ
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 17:14:43 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0015391-9911-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 18:14:41 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9e9c2989dso80080711fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 09:14:41 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a2e9bc2000000b002ca01163d2bsm1569704ljj.84.2023.12.12.09.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 09:14:40 -0800 (PST)
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
X-Inumbo-ID: f0015391-9911-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702401281; x=1703006081; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Z60KvZ5MnGTmqpE+D1c5OUlyXv64/7/OFBRqgli1qI=;
        b=bJYyyF351MxETa3Vy6WYy5xmNTFhKTGpun2I/0gVgOdIkcEubAPQJT40QgLcchuGaL
         MaCUhRaZvaFEWrlLbNDjGhUrfm3NFEKoPvB0Rbx8j7VmwzLpqmpQ4Dyml3jft4AgCRAw
         UVhzy2mEokzjieJE7jaWy3zGHqTBlxsoXinUWYmBEvVBUBoJ8Cp/9G7wHinT9Rzms9+O
         z2fYl5jbAuL0EOshR63jIKimAMNB4Q4ICNKDAxVAcBLtWGHfpU0bNocs6ePcqtNf4Oh6
         hcr1SskI+bYu54LSHfgM3IZC+uAymhOwblXuFSyP2qi7u55JZze1PjF3RwVoi0tY4SU1
         eMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702401281; x=1703006081;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Z60KvZ5MnGTmqpE+D1c5OUlyXv64/7/OFBRqgli1qI=;
        b=XObKq52hmAdKVE6aO4uwK8EZxyMKlxmjEX9zrsZCEruct38EMegIyxInqKI3yzoz8A
         WRREaQhVtZisXl5J8rKizqwjK3TaL/rdovcMyIO22YqbvjXWX5qRlh0JEJV7IassITQi
         7S+B4XFtNsBjxrIeVwTcYZuIj7GOHHeScCKFR0V6AjTpG0I2Yzc1i87AL3L4CohZHPJ0
         aQiL9Ty7+mbN6pbU+TrF3xfS1ubQOmcu8z85qOAebT7Sb7W59sXvAknkBQ5WtPFrH5OF
         0d0SoiDVSwxSTEKphdHRUDVLthagIaPhdOQbeSK3PwKY/6H5+wyqRP7cS5k4lXIPtsod
         cDLw==
X-Gm-Message-State: AOJu0YzgqclrbK0tvBZ+FvNezBK8Vt1ANQn1AyGNYCWcyvram1kJ83mG
	pB6fS0LHSFsDYN8C9yWdnTUC2LyIsZFexg==
X-Google-Smtp-Source: AGHT+IHAjrGmShi/0/muM6LtXQc+D8oLCkO34+3jDlXxdTiPYIR8IHedFq1Pk5u1C+birM3oGdoyWQ==
X-Received: by 2002:a2e:a545:0:b0:2cc:202f:6266 with SMTP id e5-20020a2ea545000000b002cc202f6266mr1800841ljn.96.1702401280712;
        Tue, 12 Dec 2023 09:14:40 -0800 (PST)
Message-ID: <97b62b54099c78eb5b2e89c087280a9a45546380.camel@gmail.com>
Subject: Re: [PATCH v2 18/39] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 12 Dec 2023 19:14:39 +0200
In-Reply-To: <9f0bac57-5851-4d40-9b9c-3f430d58b0b2@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <981cabb593fb4b5d8927071d456ec7016891fe71.1700761381.git.oleksii.kurochko@gmail.com>
	 <9f0bac57-5851-4d40-9b9c-3f430d58b0b2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-12-12 at 17:51 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > 	- update the comment at the top of the header.
> > 	- change xen/lib.h to xen/bug.h.
> > 	- sort inclusion of headers properly.
> > ---
> > =C2=A0xen/arch/riscv/include/asm/cmpxchg.h | 379
> > +++++++++++++++++++++++++++
> > =C2=A01 file changed, 379 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/cmpxchg.h
> > b/xen/arch/riscv/include/asm/cmpxchg.h
> > new file mode 100644
> > index 0000000000..c535bc9660
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > @@ -0,0 +1,379 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + *=C2=A0 Taken and modified from Linux.
>=20
> Depending on how heavily this file was modified, further adjustments
> may or
> may not be advisable. Can the description here please be non-empty to
> cover
> how close to the original the result is, plus also what version or
> commit
> you started from?
Sure. I'll add but it was only minor changes:

This header isn't changed to much in Linux kernel so this one version
can be used as a base:
https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/cmpxc=
hg.h#L310

The following was changed:
1. 	default: \
		BUILD_BUG();
  BUILD_BUG -> ASSERT_UNREACHABLE
2. Remove prefixes arch_ before some macros.

But it will be changed more as Xen uses xchg and cmpxchg with 1 and 2
bytes types, so it should be handled...

Anyway, I'll be happy with your comments, and I'll apply them in the
next patch version.

~ Oleksii



