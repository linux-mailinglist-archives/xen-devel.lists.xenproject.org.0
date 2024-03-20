Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7B88118E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 13:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695887.1086137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmusE-0005Yv-Rc; Wed, 20 Mar 2024 12:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695887.1086137; Wed, 20 Mar 2024 12:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmusE-0005Wc-P5; Wed, 20 Mar 2024 12:16:50 +0000
Received: by outflank-mailman (input) for mailman id 695887;
 Wed, 20 Mar 2024 12:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmusC-0005WB-Tj
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 12:16:48 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7b1598e-e6b3-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 13:16:46 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2218da9620cso4127203fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 05:16:46 -0700 (PDT)
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
X-Inumbo-ID: b7b1598e-e6b3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710937004; x=1711541804; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxTehvAy01ef+xD6YVY/YpS6ickPDvxqOMXF4vv3hD8=;
        b=Nv/qLBFRHqacuRWRQmkotgfMFAc4Sobozb73esiHW9nltCXzlrRZwcHDrZjl+bjQr8
         hla+X/7LbKED4J3xxT7cOiIBnbOQvV3EeEz3uzrT04vxPCL88eM+ED6QmFbo4tOSwV2l
         Uta5UIR61j0zTgGwnGtDPOI7XR/IGyOXx9rDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937004; x=1711541804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxTehvAy01ef+xD6YVY/YpS6ickPDvxqOMXF4vv3hD8=;
        b=PsV3t9cwOhBs3EZFNw1OO1niCP7x7hAnzwKKkP/R8+qHPlWFv7OQI3Xh6eDu64U8vg
         tph93aVn509Ol22FWToWeyU4nqUrattJP0iVrvpQLdNkHIsJBK0FSL/BzvmzT2YbPKdi
         9wQZbC9oc8N4hdbFvooM2hiWCV3x18Rnofpblf39HNSB2DVLjh2JPOAFUz6Vzl9EczlE
         c9vr7c5GqAyohmsxiyDejJJsuMemIIuMHkFRrNsxpcuGEDSd3Zs7EWSzf/qZiecdeMg9
         1DxoJjfeefBh1XUhlGQ6rKdu0j7ZZ6KPdWaipdqNGVH4V1Wo/yOZmgZLagauyx7S9fEi
         JuLw==
X-Gm-Message-State: AOJu0YyFEGGRDTiI9b4J78fl6IlR80MXYi/e+4O/NlhAqEsEOgKI7oOW
	33NCPqhySaZcwn2j61AzwDD9dVgj+38GaO+5TNrNt2WcaS7071XDB89ps2uxzBCBauYlobITlxJ
	oSRxDyab4UOd8sFNBIJJVca1zGBkwCR2b8LDcYQ==
X-Google-Smtp-Source: AGHT+IFd9gBqs6P8Egl/tb96SbBAUYGXBgrkrsKgvk6ABPS1BpTVmFy3xlhg5waCNLGzqrgRvzJWzC9HBu09bDLYKOE=
X-Received: by 2002:a05:6870:3101:b0:220:8d2e:c78d with SMTP id
 v1-20020a056870310100b002208d2ec78dmr19302983oaa.7.1710937004561; Wed, 20 Mar
 2024 05:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-3-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 12:16:33 +0000
Message-ID: <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] xen/credit2: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> There is no need for bitfields anywhere - use more sensible types.  There=
 is
> also no need to cast 'd' to (unsigned char *) before passing it to a func=
tion
> taking void *.  Switch to new trace_time() API.
>
> No functional change.

Hey Andrew -- overall changes look great, thanks for doing this very
detailed work.

One issue here is that you've changed a number of signed values to
unsigned values; for example:

> @@ -1563,16 +1559,16 @@ static s_time_t tickle_score(const struct schedul=
er *ops, s_time_t now,
>      if ( unlikely(tb_init_done) )
>      {
>          struct {
> -            unsigned unit:16, dom:16;
> -            int credit, score;
> -        } d;
> -        d.dom =3D cur->unit->domain->domain_id;
> -        d.unit =3D cur->unit->unit_id;
> -        d.credit =3D cur->credit;
> -        d.score =3D score;
> -        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
> -                    sizeof(d),
> -                    (unsigned char *)&d);
> +            uint16_t unit, dom;
> +            uint32_t credit, score;

...here you change `int` to `unit32_t`; but `credit` and `score` are
both signed values, which may be negative.  There are a number of
other similar instances.  In general, if there's a signed value, it
was meant.

I don't want to delay this another 3 years, so if there's not a strong
argument in favor of converting the signed types into uint32_t, I can
make the change myself and re-submit the series.

(I'll probably end up making a change to xenalyze.c as well, to update
the structure definitions there to match what's in Xen, so it wouldn't
be any extra effort.)

 -George

