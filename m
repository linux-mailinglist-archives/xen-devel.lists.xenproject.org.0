Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B2AE60EF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023487.1399467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU01N-0003ct-I3; Tue, 24 Jun 2025 09:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023487.1399467; Tue, 24 Jun 2025 09:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU01N-0003aD-Eo; Tue, 24 Jun 2025 09:32:53 +0000
Received: by outflank-mailman (input) for mailman id 1023487;
 Tue, 24 Jun 2025 09:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uU01L-0003YL-98
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:32:51 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 323bca5e-50de-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 11:32:50 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-553b60de463so5511550e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 02:32:50 -0700 (PDT)
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
X-Inumbo-ID: 323bca5e-50de-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750757570; x=1751362370; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjfv4ZRWPWr+bDVThanQyVMbl9QwdG+xGJH6IJSYiYs=;
        b=JDfBr9XGKyapd9hX2EMJL6Sha4E5rDQlSoSRd6MYKpYzAeVb8AiO8xhFWPxqCSURxA
         byFaCiPeahDlRRCVYXWNoKbnNui5Z/i18TwG1vdAPmDj9MVaqNXrCjti59AqZSG7SDfs
         4fqFR3KR5dnLSS5zi6ECdwDLp7POhX9wrHcmYYCV7DDg6NVmlXz10K5Qt61sBpjlZ7NN
         FGhgzY80ZVJKuYa78c81JZYkWACxXl5xJVnQ6mPVhrEWcOytZkZUAWFSEx8eh/f6c6gH
         dapIbKgCqNPNjT3QasNG7O7/fFG5j/pMGkwNutQSVfEEYtFRb9O9WOLLa1A+O52zFg5h
         bx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750757570; x=1751362370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zjfv4ZRWPWr+bDVThanQyVMbl9QwdG+xGJH6IJSYiYs=;
        b=be7B95+Fv3Yu1pcsG9YOmDJJNFT2Kir3yhYN3/14MTU0ixgCf3glTp5Y1AZZr4PndI
         +keXPQNPAq/GrPT4LRPB9PZeH9Sn+/O/96NfSlIminFSQq2BTcbKxCzJZCwsQWsOQBrp
         lKgPHuQmoM4WLkIP62j2Vjpgqwylq+38qHGPdOUddJ61lPQ5rYHrcCfHwhSEEbmPww5O
         Kr6QtdIy9lkIB+6fCeMElU5MNGFKuhMEhAEM+P3fr5k1I9UAepIXQKSZItTp/PELcAuQ
         BcpwY4uSUSWHQuLAyc2sSQ0fj9anf/3pJAnFrhE+vNc31UKl5hIDkwMCZZ/t++WJIEEe
         xoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK8SRuXa41slYYW/dD9cB0Rxo5p5f4m7Xt64W728mpeykPr55FeT1lcCrK3WA0xML0kWbPiM7sSrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVz9+09qAKOrntdVBIJd+2Qi/yKI4fLpCSaiJHMSkBZvq2jdcR
	u31nXEd0uPdxRXpecEfU75ZuoVxh14PS/T26EN1KF3Wama0Yoj5vuSMOTFrKM1L+WpUayRTWLhy
	3BRg3kzBnLyJpNM6mqfkUg6WdaJvmxAk=
X-Gm-Gg: ASbGncv92lNLP4TXoTywsCVARxdsXbRgYhi+R67S5LhoM2BpXsUFMrSzI/Uwz0mPpqh
	V/iqIOc+XCvqztslFGvT0ESkm9Xhlm6A0oNYm6ONV0cSPdrZdkLZufmQaRdgXrJz2KkGq4H1Rpd
	yeWsiQ2BxuUZetqL+9oLaI7gnDvsTv6fwTrlYQyqaPfw==
X-Google-Smtp-Source: AGHT+IFoocmjn9MyDHvP+VU0KkkfaturAcbKHIS58gY4vHCNTW5754Q6jZJc2fD9Qf3+TC8oJKPHMm/HqeWTC1JGl/8=
X-Received: by 2002:ac2:4f08:0:b0:553:2311:e1f6 with SMTP id
 2adb3069b0e04-553e3d05097mr4344893e87.49.1750757569673; Tue, 24 Jun 2025
 02:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com> <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
 <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com>
In-Reply-To: <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Jun 2025 12:32:38 +0300
X-Gm-Features: AX0GCFuirwi4-Me3nNzmgiRWkBwchd5myKsSKc3iYICknn2TvnuJaCYsSfhx3P4
Message-ID: <CAGeoDV9zYwGg0pSrMZVK8AdGpX1m8kjExc2twx93yR+SbnrkcA@mail.gmail.com>
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 24.06.2025 10:29, Mykola Kvach wrote:
> > On Tue, Jun 24, 2025 at 10:53=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 24.06.2025 09:18, Mykola Kvach wrote:
> >>> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uar=
t_driver =3D {
> >>>      .start_tx     =3D scif_uart_start_tx,
> >>>      .stop_tx      =3D scif_uart_stop_tx,
> >>>      .vuart_info   =3D scif_vuart_info,
> >>> +#ifdef CONFIG_SYSTEM_SUSPEND
> >>> +    .suspend      =3D scif_uart_suspend,
> >>> +    .resume       =3D scif_uart_resume,
> >>> +#endif
> >>>  };
> >>
> >> As this being put inside #ifdef was to be expected, imo a prereq chang=
e is to
> >> also make the struct fields conditional in xen/console.h. I think I di=
d even
> >> comment to this effect back at the time.
> >
> > Would you prefer that I include this change in the current patch
> > series, or is it acceptable to address it in a separate patch?
>
> Either way is fine with me. I expect the header fine change to be able to=
 go
> in right away (once submitted), whereas the patch here may take some time=
 for
> people to review.

Got it, I'll submit a separate patch to make the struct fields and
related code wrapped within SYSTEM_SUSPEND.

~Mykola

>
> Jan

