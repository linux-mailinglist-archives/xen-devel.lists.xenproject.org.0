Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1716F17F9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527295.819767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNEj-0002YB-4O; Fri, 28 Apr 2023 12:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527295.819767; Fri, 28 Apr 2023 12:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNEj-0002VA-1L; Fri, 28 Apr 2023 12:30:05 +0000
Received: by outflank-mailman (input) for mailman id 527295;
 Fri, 28 Apr 2023 12:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZgR+=AT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1psNEh-0002H3-Qh
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:30:03 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6609aa96-e5c0-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:30:02 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50a14564d17so16740261a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 05:30:02 -0700 (PDT)
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
X-Inumbo-ID: 6609aa96-e5c0-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682685002; x=1685277002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuPCMNYSGWT14kmdLajotbLRxh0Bhc5GAJSMt+VdK8A=;
        b=VWBbw826lKjtBd3HVPlKPaIgM78uNeDqHUuXKuJFbf/H8aicwb1Nk1XoFpEOphWkgo
         eKTm/YEsTuAlAdkqkulB5Kxjha8rXza2SVTQXN8H+NkKb93dqgIBNxh1unx4qQhcpIjM
         Y2ix2p/F3+aSxUlzzbeuvf04tG53ufrPr+NSBTXF2V9yLsJ/I91/gLjFXyaspYcwCyC1
         AFP1jiIhwArUzN9Ql6Zs8kNGsvXXOWatfoQTUF8HXaA17l1qffoRzAjp45l33tKjiNuQ
         nnSWLB87ZEc3wg04L5Q10rNrtVaHarks1n38AAJJNepJYIGTRE0qeu4ySd4v38/vhl0l
         LvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682685002; x=1685277002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuPCMNYSGWT14kmdLajotbLRxh0Bhc5GAJSMt+VdK8A=;
        b=QAoVT5QLiPrTT/kNYoGU+8Lm+V20B19XgpjD741bhAk6YCjj3YjuxhyLqO/Lo7Xqhw
         z68lCl/a8tixUpQzSg3ZX8xrApcNzYa/K0aLN4tr1W+yE2bC/YO63Uvc8swRgyoo5t7S
         1vnovAGvfP0L987ojkb+L58TnO3OBXbj+pdjtTPu5TiAQs7LuCH/rZmxwuvKK9pm7qqH
         bKrV5IWDu6kaLpOObNAk1vq9+lmmW7EjP+L1X1G6PDHr7eHqM6f03MLkC13/0Yx5Jvpl
         ASv1lmNZ6xqnIC59ratTRXyIVH8NoLxzdMqi7AX62cFKoS9YDfj6Ym6CIsaKTZKr/x/x
         N6rg==
X-Gm-Message-State: AC+VfDxDeROaRR9IHWPIQAbfBIrCqujJqlKLHPI8D//jdTRlpSkBdzq2
	C05n/pfunqbRw8LQueK0oklY8XmaTdHn5knZ+GU=
X-Google-Smtp-Source: ACHHUZ67O0z6utftdqDDSWnFcRX3tuAn3yczRfnZt2GBSL/M2YvdJBEGUwxa2dm+GbSfgvlw1O2yaKhheC4sS7c66r4=
X-Received: by 2002:a05:6402:40cc:b0:506:bbf8:5152 with SMTP id
 z12-20020a05640240cc00b00506bbf85152mr9206160edb.9.1682685002102; Fri, 28 Apr
 2023 05:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-2-jennifer.herbert@citrix.com> <CAKf6xpsbaZMMFCW3Uw0XZ2gm185iwwtT2H+RcAReFrze9UWdAw@mail.gmail.com>
 <573ebf81-5565-b127-61c1-fc08854c9064@citrix.com>
In-Reply-To: <573ebf81-5565-b127-61c1-fc08854c9064@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 28 Apr 2023 08:29:49 -0400
Message-ID: <CAKf6xpvmyfa6TYk1UWzpqsBbPxqytyuiyjhCoUhVE7jabj0smA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] acpi: Make TPM version configurable.
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 8:49=E2=80=AFAM Jennifer Herbert
<jennifer.herbert@citrix.com> wrote:
>
>
> On 26/04/2023 21:27, Jason Andryuk wrote:
> > Hi, Jennifer,
> >
> > On Tue, Apr 25, 2023 at 1:48=E2=80=AFPM Jennifer Herbert
> > <jennifer.herbert@citrix.com> wrote:
> >> This patch makes the TPM version, for which the ACPI libary probes, co=
nfigurable.
> >> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) s=
hould be probed.
> >> I have also added to hvmloader an option to allow setting this new con=
fig, which can
> >> be triggered by setting the platform/tpm_version xenstore key.
> >>
> >> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> > ...
> >> --- a/tools/libacpi/build.c
> >> +++ b/tools/libacpi/build.c
> >> @@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acp=
i_ctxt *ctxt,
> > ...
> >> +        switch ( config->tpm_version )
> >>           {
> >> -            tcpa->lasa =3D ctxt->mem_ops.v2p(ctxt, lasa);
> >> -            tcpa->laml =3D ACPI_2_0_TCPA_LAML_SIZE;
> >> -            memset(lasa, 0, tcpa->laml);
> >> -            set_checksum(tcpa,
> >> -                         offsetof(struct acpi_header, checksum),
> >> -                         tcpa->header.length);
> >> +        case 0: /* Assume legacy code wanted tpm 1.2 */
> > This shouldn't be reached, since tpm_version =3D=3D 0 won't have
> > ACPI_HAS_TPM set.  Still, do you want to make it a break or drop the
> > case to avoid falling through to the TPM1.2 code?
>
> So there was concerns in v2 about backward compatilibity before of this
> area of code.  The exact nature of the concern was vauge, so I made this
> very conservative.   This was intended to mitigate agaist this code
> being run, but with the structure being set up with something other
> then  the code in tools/firmware/hvmloader/util.c.  Any such alaternate
> code would set the tpm flag, but not know about the version field, and
> so leave it at zero.  In this case, dropping into 1.2 probing would be
> the correct solution.
>
> As you say, in the use cases I'm farmiliar with, this would not get
> reached, so shoudn't affect anything.
> Haveing a break or dropping the case would result in it silently
> ignoring the 'invalid' tpm configuration, so if not compatibilty mode,
> I'd personally prefer some sort of assert, although i'm not sure how
> best to do that in this code.

Ok, sounds good to leave it as you wrote it here.  The split of
hvmloader and libacpi requires the backwards compatible approach
inside libacpi.

Thanks,
Jason

