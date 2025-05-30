Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A15AC892F
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 09:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000484.1380730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKuOn-0002TB-Fd; Fri, 30 May 2025 07:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000484.1380730; Fri, 30 May 2025 07:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKuOn-0002RF-CW; Fri, 30 May 2025 07:43:29 +0000
Received: by outflank-mailman (input) for mailman id 1000484;
 Fri, 30 May 2025 07:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2SZ=YO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uKuOl-0002R9-Vo
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 07:43:28 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c50d8dcb-3d29-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 09:43:25 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-55220699ba8so2103914e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 00:43:25 -0700 (PDT)
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
X-Inumbo-ID: c50d8dcb-3d29-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748591005; x=1749195805; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+C2bkQuLVU4qaDIX7UgfRe3HQUfdHIw200e7iRp/4c=;
        b=MffKqcA6yYe8Tx4QuD8erHOoaeWuFip4mPCB1yb+wM+LFqy0Qwqg/2dVHESFr0DYKk
         j3F0SpbVcmYS+8N9EbTRDz/jADagBjXH+TXydqmzHCtYyo0nn1rCc8i/c+72Bqw4BsPK
         1vKSc3br/xMoAlb+xeOBN/R0FPx++MJ7zUIj0Wt3P5T64EhTft2udvFZioZAYK5iakIg
         Db8aKOUsutp30dUb8F1mHbUBVBp+rD1Pe9O+F9UnyZCnBzVnlby05M0fFceqXOh+eMPY
         6e3Tp1+ls/dKrizURnUG3fTJIMuZgItdWxnCWBCPEXacO8X5LAQImBKrHunBzbtXhmC3
         niSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748591005; x=1749195805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+C2bkQuLVU4qaDIX7UgfRe3HQUfdHIw200e7iRp/4c=;
        b=E5LUaOKXIdys7tzptBfh5faS7wIyyM9GmbrLUrl/FaNY97mXUz6o5KORKsNhIo8BdD
         BlMM+htPf7hEuD+KTqR6w31RPkIYw6MITKrbRLWT0kFf3Go87YgCCenX6VQHuD+Xth7F
         EB+BiOd9t8tKyjWQNZtDrfqkc9IiF2y2bZkB+WAJcGyVYOq2Ye1OWtdqkOyLGRm5uXSv
         TUSb/8Q2rdGMvShm2zPV5YIsYFHxsokSGLDB/HUjaiLFPcUJkMcU5kVYTAvi6XfSbGyd
         xjlgpRtldVJ+IIDs7PAs372ZF99MqNZq/AUX2cid5ybFflozT8hWiJOmpdLOqeedrWwR
         RodA==
X-Gm-Message-State: AOJu0Yx9JCqXQXBBFh8au05lOtsikCGdRb1X8Lg/4cEwbCHtXN4ouAaB
	JPpCoNGekI0q0+hjy+F4E9C21EuLe3zMBn6FLLj0Zapq5epGKCe5twX/PoDJHcLaAR64d9Mnsgm
	lkyjmhqcxyQrRgpGyexRjUYGvTh0twzI=
X-Gm-Gg: ASbGncuMzrAxqLRAoW3qMRl9CJmhd0/Nrshvn3zudJxrbWpUi+AkovDxxeuvI5S8XYl
	9HbU2n3BOyUSLkoh+aIKVYUO2NMAdBkUOn67aipb8TH7b10bR30+OkHil5eKMInUvEYsF7Ucr+R
	Ln1xaywFucLnYThM/8ME1F2Fomayv0tpYwtwvJl6++iSct8oHlw3y2
X-Google-Smtp-Source: AGHT+IE9Aa7XCPx9v6oxcRr5KKPvZnwwJJirlOQVJUUJ/7alcfD5AdvjTSY27+GPa5wrIkcRJSyzn5UHx1eWyQqWkKQ=
X-Received: by 2002:a05:6512:33cc:b0:553:3492:b708 with SMTP id
 2adb3069b0e04-5533d1ad693mr322241e87.49.1748591004883; Fri, 30 May 2025
 00:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <3881310bb93e20fd7d28d067e11ec9d19b68c60c.1748547428.git.mykola_kvach@epam.com>
 <83cc8e35-b670-4a56-ab5d-5356a44394c2@amd.com>
In-Reply-To: <83cc8e35-b670-4a56-ab5d-5356a44394c2@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 30 May 2025 10:43:13 +0300
X-Gm-Features: AX0GCFvXcxOld-LvO942St-rJOEomcC8QIdMx7s5uOmvQXYH_PnL8xjA4OBO4lU
Message-ID: <CAGeoDV9dMtbEGXm-gL+93jn7_8fGZwz4a_RHdwgpZ0kFyGXWRA@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: vpsci: Fix typo in comment (SCCC changed to SSSC)
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Michal Orzel

On Fri, May 30, 2025 at 9:43=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 29/05/2025 21:40, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Corrected a typo in a comment within vpsci.c:
> NIT: use imperative mood in commit msg
Thank you for pointing that out. I=E2=80=99ll correct it.

>
> >   replaced "SCCC_SMCCC_*_REVISION" with the correct "SSSC_SMCCC_*_REVIS=
ION".
> >
> > This change improves clarity but does not affect functionality.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>
> > ---
> >  xen/arch/arm/vpsci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index d1615be8a6..7ba9ccd94b 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -268,7 +268,7 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, =
uint32_t fid)
> >  {
> >      /*
> >       * /!\ VPSCI_NR_FUNCS (in asm/vpsci.h) should be updated when
> > -     * adding/removing a function. SCCC_SMCCC_*_REVISION should be
> > +     * adding/removing a function. SSSC_SMCCC_*_REVISION should be
> >       * updated once per release.
> >       */
> >      switch ( fid )
>

Best regards,
Mykola

