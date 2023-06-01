Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58FF71940A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 09:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542258.845906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cbh-0007iz-Nl; Thu, 01 Jun 2023 07:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542258.845906; Thu, 01 Jun 2023 07:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cbh-0007fk-KO; Thu, 01 Jun 2023 07:20:25 +0000
Received: by outflank-mailman (input) for mailman id 542258;
 Thu, 01 Jun 2023 07:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ddig=BV=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1q4cbg-0007fe-S4
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:20:24 +0000
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5ad4993-004c-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 09:20:23 +0200 (CEST)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-565e6beb7aaso5623707b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:20:23 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 v66-20020a0dd345000000b005618c4fcab6sm6007794ywd.50.2023.06.01.00.20.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:20:21 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bacf685150cso535472276.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:20:19 -0700 (PDT)
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
X-Inumbo-ID: c5ad4993-004c-11ee-b231-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685604022; x=1688196022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uahBQ1+NZ4LtBmJlKuzSeHMKUQpvPqnHtI00z7d7Eg4=;
        b=SSFl7DR4EKo/0bKgNdl6gygA8l2Eyppb20dbC9NTKBuKmmJnmpDe39pUZKF9wwd/w7
         /SylQ5tWAFsvi8euO7NtRBrqk7rn7WNWF8OP988/jADWWWnaGsZoVcy1RREfXi/CNq7B
         pvY9vMGSPuTg5Lm6SCFzsgGtzoUSFK6iQzF0WXU0eFwEnNgJvaktWD+Ly8xh3lxPS3+S
         1lRD9rHfNFGTxk1X/7QC56PZhpHcEgJDyKpOtQ/4zPO/ns6p/SiLKuDuJlmgtftY+Jy6
         IzZi9fHiLxW85NMS70pA73KGh/gm3+P3gaz5Aak+G4G0cEUudirGSeN1Z9uDntA2mGUK
         qOFw==
X-Gm-Message-State: AC+VfDwhKOEhzXIv5A2LuF9MniR+FwsO8pBAs3NbwRBpayZDwz0f5M9q
	aCdm0J82oRMF0hDNSRM81/BqFtM13EG72Q==
X-Google-Smtp-Source: ACHHUZ5zyhF81iAF/yoCUp4xDiPmdUMDUzTQ1hcNg5fWEQ0+DGRyOROkE0ZUBQQlF/Q7hb9QU5UVTg==
X-Received: by 2002:a0d:df54:0:b0:565:a3e6:1b7b with SMTP id i81-20020a0ddf54000000b00565a3e61b7bmr8930018ywe.18.1685604022436;
        Thu, 01 Jun 2023 00:20:22 -0700 (PDT)
X-Received: by 2002:a25:6891:0:b0:ba8:7122:2917 with SMTP id
 d139-20020a256891000000b00ba871222917mr10052062ybc.0.1685604018484; Thu, 01
 Jun 2023 00:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-31-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-31-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:20:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Message-ID: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
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
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents. Also cleans up some spacing issues.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

