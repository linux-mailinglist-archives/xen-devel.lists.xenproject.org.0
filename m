Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D15854862
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680599.1058606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDTX-0001Rx-Kz; Wed, 14 Feb 2024 11:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680599.1058606; Wed, 14 Feb 2024 11:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDTX-0001Pq-Hh; Wed, 14 Feb 2024 11:30:51 +0000
Received: by outflank-mailman (input) for mailman id 680599;
 Wed, 14 Feb 2024 11:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWPZ=JX=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1raDTW-0001Pk-KE
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:30:50 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fdcf12e-cb2c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:30:48 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2185739b64cso3403076fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:30:48 -0800 (PST)
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
X-Inumbo-ID: 7fdcf12e-cb2c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707910247; x=1708515047; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g+2n+lFd1EoSzGvfq+eeDzfB8zXGJFLjsEcNhQw+uw=;
        b=My5atkWn9hVxmW7l1BnNCO7hD7Z4q8xe80XRMO/3/0+g77Q6g8Ier9GUDJypnHyT2h
         vafaGzWgeyFWycJsKOQUvaEZA+sf8ZGv7dkazgsYaz3gsm2XQMFeFkVmyJxz2IQBPfXF
         v9MbEGj3+/5JyoOaoJeM5qNpvCzIPa7S8iRtzKL1bCUZ+6Z+GYrWxjmjqw9TC3QZ3bzo
         Mn/Ih1y7qaFFHjgghjAR/n8b/3Tt2MdgURctjPjj5m/xrPyfIR5MzyXD+O9+K7voZDSZ
         MX2zGHKbNHtiA3Jvs0Mez0TGLcGGVd753t5SIsfr1hr75FjxOESM31fmlPhKAjUD9mlN
         mVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910247; x=1708515047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g+2n+lFd1EoSzGvfq+eeDzfB8zXGJFLjsEcNhQw+uw=;
        b=Hek6lHutQwGNu5RLtL54cKm1ge95TrTEJgwb2OdEVPKb3dnBYhdfZ0MDeAkkTEtza6
         yjA90stCVNdX1nnydZOse5Dm0itvl7BBErrodnMrVoD9CeXuHAO1HheTeQNGCBbackyW
         rP2fU5K9RhqdyjJv0Lum6U0FlyS0LjPjJ0eYIOvG+AQPPGnejOcAlY3UV0Ds9sbVdeAM
         WLtDSYBRgP0XNMMBVO/PpZj7s34l7Ldu+5WyW7J3bwlHd60MGS+RjFLeu79PgjbikrhU
         nBzY5D4kVESJPSo52YDHV2/G/WzwdTLEdiOrkYMQrj8nvI+sX67oSAB58Pri9hVsgfC7
         1H9w==
X-Forwarded-Encrypted: i=1; AJvYcCXlXTuohuuu/nR3xUz9O/Vy8dyMm2omoJqmq0OjbjLZQcQNor7c4a+ADHl5F0Ltk7OH+5/Y5qRi0VcGf6suG4D5ZJdWjwm/6Z38IBdMgF8=
X-Gm-Message-State: AOJu0YxzKVZAKNSU3zVFt+TGQPfND2pOZIOemKRjCDdJfUInHG/CL71o
	7v+cKFAiiDDIeS6oGeb2DugXgEVD5okH3+1TWdmYM5gyWYcft7digIQhOV8vDECKJSCHhYQOofn
	+UeRitS/mhWEEDbgnNAMEm+pJF6M=
X-Google-Smtp-Source: AGHT+IFRBf+8YTuGQPtDmqCnI+rSbaLJuYzTauzsLB1Fco8wJ+FQbHxHl4JbLzq7cRWpTLrJ1nuoC3X+IIZOhSuYfxQ=
X-Received: by 2002:a05:6870:d628:b0:21a:6563:f4d3 with SMTP id
 a40-20020a056870d62800b0021a6563f4d3mr2398037oaq.49.1707910247408; Wed, 14
 Feb 2024 03:30:47 -0800 (PST)
MIME-Version: 1.0
References: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
 <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com> <01b0d902-1903-4618-ad43-f625e57b61e1@suse.com>
In-Reply-To: <01b0d902-1903-4618-ad43-f625e57b61e1@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 14 Feb 2024 12:30:36 +0100
Message-ID: <CAKBKdXjdOoGSbN_c4gyBqAHni+D4+o+gC=LNc4VEaaezYYki+g@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
To: Jan Beulich <jbeulich@suse.com>
Cc: Christian Lindig <christian.lindig@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 8:12=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 08.02.2024 10:13, Christian Lindig wrote:
> >> On 7 Feb 2024, at 22:04, Petr Bene=C5=A1 <w1benny@gmail.com> wrote:
> >> Add the missing `vmtrace_buf_kb` field to the OCaml bindings to match =
the
> >> vm.cfg configuration, correcting an oversight from its initial introdu=
ction.
> >>
> >> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > Acked-by: Christian Lindig <christian.lindig@cloud.com>
> >
> > This looks correct from an OCaml perspective. Why was the new field add=
ed in the middle of the record type domctl_create_config and thus forcing c=
hanges to the index of fields coming later in the record versus just append=
ing the new field to the record type?
> >
> > The critical bit is using the correct type in "Int32_val(VAL_VMTRACE_BU=
F_KB)=E2=80=9D that matches the type "vmtrace_buf_kb: int32;=E2=80=9D - whi=
ch it does.
>
> Is this then perhaps also lacking a
>
> Fixes: 45ba9a7d7688 ("tools/[lib]xl: Add vmtrace_buf_size parameter")
>
> and hence wanting backporting?
>
> Jan

In my opinion, yes.

P.

