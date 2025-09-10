Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628BB5119F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 10:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117962.1463928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwGML-0002Fz-Fc; Wed, 10 Sep 2025 08:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117962.1463928; Wed, 10 Sep 2025 08:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwGML-0002EV-Ct; Wed, 10 Sep 2025 08:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1117962;
 Wed, 10 Sep 2025 08:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwrE=3V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uwGMK-0002EP-6u
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 08:39:20 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a46be685-8e21-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 10:39:19 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f6f7edf45so6136394e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 01:39:19 -0700 (PDT)
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
X-Inumbo-ID: a46be685-8e21-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493559; x=1758098359; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdrSKgt6Kn7bDeROkON13jokpSii2R5xx0UfbqquSXE=;
        b=MHXsxAd/42fQXk8sSdSDy6mE/Crk6Uj2IbMbixLUsqm2chyvXJ5y+Z+FPfaRyZfmoP
         2DmN5c+IOkyAzgTGAFaO1DvXM1gWq9jCx+HCb/uk7dZyW4HD+BJAlTW6dfBw1sFV42jp
         mJKniHJPb76lpeZT7isjuz8JTEoX0v0uvVtly1m+PokXUsnx69I/VohiFkyBfJ32gXCy
         IgyG+uLvjSUK54Eurl6AiVgsy5wX0Oj/2vfxKSuLqDhujGhCJSOG1Hj5+mzprMrOoGXA
         uvFv2dA3C8eKaS//nzd1iGaZdYNfqEZmHJH33bNuf5Nbnx1PPnD4Slt8RfXFV6uMuiHT
         Iq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493559; x=1758098359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdrSKgt6Kn7bDeROkON13jokpSii2R5xx0UfbqquSXE=;
        b=abBU6QHDvJoso3p127AxA90ZI9ZvpDIxr8L+V1icfVkMuNSVwXIUn8E9/c+YkExpWF
         IHuPqoZyTHDacg2BM4kS9EwUCst5FZVZG7wqQtjXDq60CD3Pn8n5lQGXj3nVlFHFFdjD
         JDhG01XuMbC+H3RcSdSF8aDzvUD++MUszpmRBc/tLJjN4CZD+YSQ4ibEZxtzRupQaWov
         gCsXeqoOWNuZuw3+lcGJQ4PktnNhPmgHkPlbXNRR4Hubnk+nu+OoJ4xX5hKkzdJzTfI0
         O9MD6MmT+n1sTpBq2c61Mx+1CAVJlYUUhomIm7nKa+JC2qdpfr9wgjuIq+q42AvgegXx
         YNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFJtCkp2lHWCkVHXCrblO47HQgoxjH+NMGIlk7UTyjNBEJx+rZ6thyPCh/2LxQyF6UJGS+gtubKVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF8gCoWo1w5S+O+rbmv9LjTp+wzlF86qoqjML3XSz398e1H6WW
	bRXtu80XuXig/ksTIBx5OZac9MM63CDMDAM2Em76s2kW+G4IfN4tKlIjFnfB4KAmXnxwcexWn86
	nKESLSP8n1CGiYaDXf7Ev++EFtDlX9Ao=
X-Gm-Gg: ASbGncv+HmJcvGfjcZ0VEpGKfu77AY4wGPT+DAicSK2koGdv7Oaq8GlvCEyFDh9Uq2A
	GPSmZzrZDnsPon9E6a1kQmr7KKUF3RqPZjfgGcTYpkw+aPFx/itvhMVd2zL5VNjXxQG52Zz50kG
	1IXrQECNW22avbFDpii4LImxEYMAPH5lIewyIsfazrpHfzYdROOJsuLpNKk41IodQOew1PPFb2v
	LZ6xw==
X-Google-Smtp-Source: AGHT+IFJBtHdlQwtD2Q1Kq83ja3jL3Nf93+ud9uDaAVFT0qsuxdG5qwofQdBP/fNzm+WebtK8VMZBPl9RB+AFXI7dAA=
X-Received: by 2002:a05:6512:3d25:b0:55f:601d:a819 with SMTP id
 2adb3069b0e04-56262667f4fmr4424177e87.33.1757493558218; Wed, 10 Sep 2025
 01:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-3-dmukhin@ford.com>
 <54211c3c-f911-41c3-b4bd-1e27fcc09f93@suse.com>
In-Reply-To: <54211c3c-f911-41c3-b4bd-1e27fcc09f93@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 10 Sep 2025 11:39:07 +0300
X-Gm-Features: Ac12FXzkYqO6TBsCaBgjstzF6T9hR1eJI7W5JNLp04Y2G7MtVri7zYnkWNnhiNs
Message-ID: <CAGeoDV_53E3M3JmoDUbOL+5W8orMEoYUVFqc8XHREec_vwEpkg@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] xen/8250-uart: update definitions
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, 
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, 
	sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the updates from the previous version of patch series,

On Tue, Sep 9, 2025 at 1:47=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.09.2025 23:11, dmukhin@xen.org wrote:
> > --- a/xen/include/xen/8250-uart.h
> > +++ b/xen/include/xen/8250-uart.h
> > @@ -32,6 +32,7 @@
> >  #define UART_MCR          0x04    /* Modem control        */
> >  #define UART_LSR          0x05    /* line status          */
> >  #define UART_MSR          0x06    /* Modem status         */
> > +#define UART_SCR          0x07    /* Scratch pad          */
> >  #define UART_USR          0x1f    /* Status register (DW) */
> >  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=3D1) */
> >  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=3D1) */
> > @@ -42,6 +43,8 @@
> >  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
> >  #define UART_IER_ELSI     0x04    /* rx line status       */
> >  #define UART_IER_EMSI     0x08    /* MODEM status         */
> > +#define UART_IER_MASK \
> > +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
>
> Here, aiui, ..._MASK covers all known bits. No #define-s for reserved
> ones.

I think we can follow the Linux kernel style here [1]. For example:

#define UART_IER_ALL_INTR (UART_IER_MSI | \
        UART_IER_RLSI | \
        UART_IER_THRI | \
        UART_IER_RDI)

This way we avoid using the *_MASK suffix, which could be confusing,
and clearly indicate that these are all valid interrupt bits.

>
> > @@ -51,12 +54,19 @@
> >  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
> >  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
> >  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> > +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
> >
> >  /* FIFO Control Register */
> >  #define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> >  #define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> >  #define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> > -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> > +#define UART_FCR_DMA      0x08    /* enter DMA mode       */
>
> Question is whether we can actually use the source you indicate as
> reference. TL16C550C may already be too different from what a "standard"
> 16550 is (where admittedly it also looks unclear what "standard" would be=
,
> as I'm unaware of a "canonical" spec).
>
> The source I'm looking at says something entirely different. Maybe we're
> better off simply omitting this #define?
>
> > +#define UART_FCR_RSRVD0   0x10    /* reserved; always 0   */
> > +#define UART_FCR_RSRVD1   0x20    /* reserved; always 0   */
> > +#define UART_FCR_RTB0     0x40    /* receiver trigger bit #0 */
> > +#define UART_FCR_RTB1     0x80    /* receiver trigger bit #1 */
> > +#define UART_FCR_TRG_MASK (UART_FCR_RTB0 | UART_FCR_RTB1)
>
> Continuing from the top comment - here, with the TRG infix, the scope is
> clear, too.
>
> > @@ -98,9 +108,30 @@
> >  /* Modem Control Register */
> >  #define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
> >  #define UART_MCR_RTS      0x02    /* Request to Send      */
> > -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> > +#define UART_MCR_OUT1     0x04    /* Output #1 */
> > +#define UART_MCR_OUT2     0x08    /* Output #2 */
> >  #define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> > +#define UART_MCR_RSRVD0   0x20    /* Reserved #0 */
> >  #define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=
=3D1) */
> > +#define UART_MCR_RSRVD1   0x80    /* Reserved #1 */
> > +#define UART_MCR_MASK \
> > +    (UART_MCR_DTR | UART_MCR_RTS | \
> > +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> > +     UART_MCR_LOOP | UART_MCR_TCRTLR)
>
> Here it's again all non-reserved bits. Yet why do we need #define-s for
> the two reserved ones here? (Same question for FCR, even if there's no
> UART_FCR_MASK.)
>
> > +/* Modem Status Register */
> > +#define UART_MSR_DCTS     0x01    /* Change in CTS */
> > +#define UART_MSR_DDSR     0x02    /* Change in DSR */
> > +#define UART_MSR_TERI     0x04    /* Change in RI */
> > +#define UART_MSR_DDCD     0x08    /* Change in DCD */
> > +#define UART_MSR_CTS      0x10
> > +#define UART_MSR_DSR      0x20
> > +#define UART_MSR_RI       0x40
> > +#define UART_MSR_DCD      0x80
> > +#define UART_MSR_CHANGE \
> > +    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
> > +#define UART_MSR_STATUS \
> > +    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
>
> Here it's properly two subsets.
>
> > @@ -111,6 +142,7 @@
> >  #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
> >  #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
> >  #define UART_LSR_ERR      0x80    /* Error                */
> > +#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
>
> But what's the deal here? Why would only two of the bits be covered?
>
> Jan
>

[1] https://elixir.bootlin.com/linux/v6.16.5/source/include/linux/serial.h#=
L15

Best regards,
Mykola

