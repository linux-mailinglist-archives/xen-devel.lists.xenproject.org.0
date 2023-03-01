Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261916A69FC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503930.776352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJ25-0005r3-8t; Wed, 01 Mar 2023 09:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503930.776352; Wed, 01 Mar 2023 09:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJ25-0005ns-5h; Wed, 01 Mar 2023 09:45:57 +0000
Received: by outflank-mailman (input) for mailman id 503930;
 Wed, 01 Mar 2023 09:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXJ23-0005nm-KK
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:45:55 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc12c5b1-b815-11ed-96a0-2f268f93b82a;
 Wed, 01 Mar 2023 10:45:55 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id i9so16840577lfc.6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 01:45:54 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 w14-20020ac2442e000000b004db00b4c671sm1660387lfl.7.2023.03.01.01.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:45:53 -0800 (PST)
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
X-Inumbo-ID: dc12c5b1-b815-11ed-96a0-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677663954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xGd25hKD6s5gYIjdZ2TJ8putMxGMRWq8uqxg0K9WGy8=;
        b=PYebjBpkRJ7c8bmhgNCn+UTbyof8RAVzD58Gg0uwEZdFldUh69uw/cXpbTM4N750P6
         oRijbx1M9PsvQoJTIIJk19aJt3GBgCvH+wHFCF5nSXmViTESHLKAXZUhHudFR2vSrKea
         4XjKEz/Z/hQz1bi4CkudMlGnszkMsdg5wOlS8DAo2Qw0vV7iFMFOXlZfynaTIhSmXTRa
         BitEbVft7bhpFusapzkx5bvDCnENm+rOi3NR2yOGugV4oAyTcDa76WH3OQJ9bjSJ/sUS
         QE8Qk6/oRqmgEsGw+36ceA2l2quq4UTNrMKCFKuDfv/gcN10gffi7uoZP002Yc5tOqBG
         UpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677663954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGd25hKD6s5gYIjdZ2TJ8putMxGMRWq8uqxg0K9WGy8=;
        b=kDJfwg1IfU+g1E0e2BDzDGrIwH1eNJJXCkUgfiUzcpUC8DrNJucUDs8RhYWnS/w+Xr
         vZi6q1KAEkk2YsnG5NgnVHgBicOnen95f1xfHDsUnO3u06eAShxUQI5n1EofOhnIXnOh
         dlKDP9pByklzdX5nY0If+M0gqJ6GY7UiFls2g8IHr41TPMXqrRgpgtpIjni/FE8Ex8P9
         gKu9L7te3f/AI8rMeEctSGyIHUMMjPBEC2ZSRUKWqLMp7b4J/T9cZTrBcHo0HufLmJFm
         0iHXZtb7o6iY9vrfTgdzRvrrcdLFthSCxe3PUh+0gscZC8hR2dRbCCQgKJmvLbNoWtBQ
         tzcg==
X-Gm-Message-State: AO0yUKVoz4zFrKxSg+2LRQ0l07xpjtKXLrcOF69Z85Ekiuyb0vy9jgeD
	/RyNudX1q4XpdUdNFqDUxEw=
X-Google-Smtp-Source: AK7set93g12AZQJGfNXIzhRCR4dhgNfO+Ps2jOP9k/GVVBk81uMyE2nto5limetFQFXBXNkHtUqNhw==
X-Received: by 2002:a05:6512:63:b0:4e1:7dd:1142 with SMTP id i3-20020a056512006300b004e107dd1142mr1531462lfo.51.1677663953998;
        Wed, 01 Mar 2023 01:45:53 -0800 (PST)
Message-ID: <1815e0ae98493797c0f30030acd461928b9a4120.camel@gmail.com>
Subject: Re: [PATCH v4 1/5] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 01 Mar 2023 11:45:51 +0200
In-Reply-To: <d35a9e46666819552a1174094bac8e8c1c5baece.camel@gmail.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
	 <397e6741438a8b125dc53945a74a58246fac4faf.1677237653.git.oleksii.kurochko@gmail.com>
	 <2fb6e5ad-9e25-9c63-7f01-8a3d55297cf7@suse.com>
	 <d35a9e46666819552a1174094bac8e8c1c5baece.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-01 at 11:41 +0200, Oleksii wrote:
> On Mon, 2023-02-27 at 13:48 +0100, Jan Beulich wrote:
> > On 24.02.2023 12:35, Oleksii Kurochko wrote:
> > > --- a/xen/arch/riscv/traps.c
> > > +++ b/xen/arch/riscv/traps.c
> > > @@ -4,10 +4,95 @@
> > > =C2=A0 *
> > > =C2=A0 * RISC-V Trap handlers
> > > =C2=A0 */
> > > +
> > > +#include <xen/errno.h>
> >=20
> > I couldn't spot anything in the file which would require this
> > inclusion.
> -EINVAL, -ENOENT are used in do_bug_frame() I missed that when wrote
> previous answer on e-mail.
Sorry for confusion. I resolved merge conflicts after rebase so
<xen/errno.h> should be remove as anything is used in traps.c from it

~ Oleksii


