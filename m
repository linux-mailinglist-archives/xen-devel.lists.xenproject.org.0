Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B7719485
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 09:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542275.845948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cx5-0003MW-99; Thu, 01 Jun 2023 07:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542275.845948; Thu, 01 Jun 2023 07:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cx5-0003KK-6R; Thu, 01 Jun 2023 07:42:31 +0000
Received: by outflank-mailman (input) for mailman id 542275;
 Thu, 01 Jun 2023 07:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ddig=BV=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1q4cx4-0003K7-AQ
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:42:30 +0000
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db8c986c-004f-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 09:42:28 +0200 (CEST)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-5ed99ebe076so7133476d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:42:28 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175]) by smtp.gmail.com with ESMTPSA id
 em1-20020ad44f81000000b006263afa6ab9sm2709623qvb.144.2023.06.01.00.42.25
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-75b04e897a5so56834385a.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
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
X-Inumbo-ID: db8c986c-004f-11ee-b231-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605347; x=1688197347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC4AZRVcHnRKNLMlbDCAYeJz9LlsudAe96MnAggdWqk=;
        b=C5/Ob/CZeUXXkrVJM4PCTZGaQdKwvczSNvqx6Xv1rUVUQbocYWg4Ma7lIXVXSydDV5
         B//1ogWyy2dl+5Uht+E3OEDQG1viLifHxdaw05sMe29bpjQ/Sw0+5hIcxFjROtA3dO9I
         YYDpY7RM5lYr1XPZkEL4UvagI2g2pLNoY6pEDZLc79d+47+eVlSWV++2f/BkTY+257Yj
         dyf+Bblu4IxltImUcZznJjv6xB/0G1dDpq3h1OiFXINdcCPY2+jDgFsoiFfZjY6Rjlj+
         vBwhLYpjEBRu3LGoEL8MYNjwbTeXVciYXD9cDwVnDomC5MtMIH8brT5UBYnQNOyPzva2
         Cnww==
X-Gm-Message-State: AC+VfDz3g5Pw8jz60NVCiynvI7H7hBRRSfb0wz8NwbjMCSNmPc60S5Xc
	ntDU4uy/fk16sX4pyc/tWSwBK3cZPVb9Mg==
X-Google-Smtp-Source: ACHHUZ4Dmglos39wq8mjBVZATTk+28N8PjiJSbpMXLT1CIXiRf+S+XIN7sQMAw+qKtSP60MGHjlHjA==
X-Received: by 2002:ad4:5baa:0:b0:626:2668:8ba7 with SMTP id 10-20020ad45baa000000b0062626688ba7mr8212416qvq.41.1685605347632;
        Thu, 01 Jun 2023 00:42:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:75b:23a1:3603 with SMTP id
 ea16-20020a05620a489000b0075b23a13603mr8693674qkb.20.1685605345152; Thu, 01
 Jun 2023 00:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-31-vishal.moola@gmail.com> <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
In-Reply-To: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:42:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Thu, Jun 1, 2023 at 9:28=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> > <vishal.moola@gmail.com> wrote:
> > > Part of the conversions to replace pgtable constructor/destructors wi=
th
> > > ptdesc equivalents. Also cleans up some spacing issues.
> > >
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume this series is supposed to go through some mm tree?

I think so, so your Acked-by would be appreciated...

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

