Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8F172DAD3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547845.855468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ySn-0002Iy-VZ; Tue, 13 Jun 2023 07:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547845.855468; Tue, 13 Jun 2023 07:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ySn-0002GJ-Sn; Tue, 13 Jun 2023 07:29:13 +0000
Received: by outflank-mailman (input) for mailman id 547845;
 Tue, 13 Jun 2023 07:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJJj=CB=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1q8ySm-0002GD-Kp
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:29:12 +0000
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcf0716c-09bb-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 09:29:10 +0200 (CEST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-56d1cb6a607so25707457b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 00:29:10 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 w2-20020a814902000000b0056d32a330bcsm895922ywa.62.2023.06.13.00.29.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-56d1cb6a607so25707267b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
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
X-Inumbo-ID: fcf0716c-09bb-11ee-b232-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641349; x=1689233349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKEzJjzBKla4S0x8jxwIAxVSx314J/aF9PC4BBXNBUc=;
        b=XWrf7DdFfOoG8vPLQ9NlQQBOCjMZqF5ZkWcMXkCrdkiLilzftB0x4pUZpJVsi/v7TW
         7RZkbpdbBn6WFcS/YbVvCpiIoG2eZZJsUak5wJ/rmrkY13NTI6eOZ4tV5E80vrE1ekn+
         Ci1R3g+o+KFLKnRjHg2ALlSJdVG2cdecOz1JtuRvmNahQofBayTun0K3kQwesXgMsGjc
         oOikihog7N3zzG2gN6CO3NR/R/yNIEb5buCL6jPFBYwPqCyEtuSmYjiOj+Cr8W/ZS9SA
         ZmlxnnE2nzifhLeN4zbYAGVzCWKsCeJwFTwfVkRxWF4P4rHDGWKG7qH6fBwUAMtGGp+Y
         Pr3A==
X-Gm-Message-State: AC+VfDy6ULsFbEsh2Nd1GyudRMP/5gNiX6pKWy8voeDqtx07F/snVbwR
	OTxy/D6mZp5YDyvLoOf9vR+hXaYI5OSZBQ==
X-Google-Smtp-Source: ACHHUZ7So6tlojidepERRQKBiXdEabRBpIKTvR4h89AKxdh9O9NzdtzntrbILKh5ac6LnQ5P81SVSg==
X-Received: by 2002:a81:a091:0:b0:56c:f8f1:eed5 with SMTP id x139-20020a81a091000000b0056cf8f1eed5mr1120210ywg.6.1686641349543;
        Tue, 13 Jun 2023 00:29:09 -0700 (PDT)
X-Received: by 2002:a0d:d611:0:b0:56d:ddc:cdbb with SMTP id
 y17-20020a0dd611000000b0056d0ddccdbbmr1077781ywd.25.1686641348561; Tue, 13
 Jun 2023 00:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com> <20230612210423.18611-26-vishal.moola@gmail.com>
In-Reply-To: <20230612210423.18611-26-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 09:28:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Subject: Re: [PATCH v4 25/34] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:05=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

