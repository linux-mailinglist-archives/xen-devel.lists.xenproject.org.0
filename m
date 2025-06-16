Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19EADB197
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017264.1394242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9lB-0002iN-2D; Mon, 16 Jun 2025 13:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017264.1394242; Mon, 16 Jun 2025 13:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9lA-0002fb-V3; Mon, 16 Jun 2025 13:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1017264;
 Mon, 16 Jun 2025 13:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LDO/=Y7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uR9l8-0002fV-S9
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:20:22 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a470acad-4ab4-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 15:20:17 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-606440d92eeso2142062eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 06:20:16 -0700 (PDT)
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
X-Inumbo-ID: a470acad-4ab4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750080015; x=1750684815; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO1GNpq15PCTF/PT+tBMoz1RhteBb8VqsNqH/jjIO7E=;
        b=E8rUQwrqn+uUHSlDBK2Y+25U3EJFZn5pd6rQKdJOgmBjyZmi+39JcjIhSyP0Z/MCK6
         8z7ssyjlGMYUz76lWJrth0L642CujnL9FZNJlFRW69JQq2k6MLguI9jTpIDdwuG2Gew7
         AHVCwLOyTTnrk6o3/M7/ar21B+d4/9q/YznSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080015; x=1750684815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sO1GNpq15PCTF/PT+tBMoz1RhteBb8VqsNqH/jjIO7E=;
        b=nl+1VdDRTugOFTNpndW7p+ldUqzmfC+ks/wtwCODSAcbgmUL3JZNG2+at1MywrNABO
         p9yWR0F2DxSqPVyOrBBK2kdZUVBiGKFR9Z78LjNCw3jaz9GFKZ+jn92Rxp7IkM563BUJ
         KKbbbT0nKGoQIDLUp7Ys+70M/OK+r9gIwwf4UkC6OyhNL7dC9BXxgyjeOIv1GD/6IzbV
         9KsNzzXDn1b/nh0fLrW2DHn0yB11uW9Z7I/Z6U9T3Bm1VmRu+xMufAwiwTIeqcplIu2j
         p0lSdvPdaduYWEeHmOY8tJbYLJFAAS0SXDZSk2rlaqkvJCz1iLvkDt/+FSMwnkYBQAYr
         v5BQ==
X-Gm-Message-State: AOJu0YyKXEVC5oHLSI/WFV+dgO9CjEs7+80/b4UTXN9cUOVH32YZ3u1s
	GuloCZFeF59C8JUfUrt3tqHx5qiaqgNGD+armSClzxy2ow++/Q+f2m5G5ExaNIiZV/ejDqYg84+
	u4APr+9acmMIvlZFR4RXzZ7XntJRwCzgZacR56lRC
X-Gm-Gg: ASbGncsAbdc8FNVXJq6RPHjzmZq+dd7jc/CqwmWy7A8pZDOFZSDR8UJbGZJBLWzf/kh
	9xkBQozQZJolFt+WRj+qOTGOBhl7+yAU1mHGJXis2ZRXZe7QElY4Br5W5ddWnl1+phYIAPNbrsT
	4O5gtks55IkQVq6wxSSubWMj1Aruq9lhnUfLZSOpSVbw==
X-Google-Smtp-Source: AGHT+IElknHf5fRK1/obsVEOLJZZRYfxK9SVu7sYNNKeRPSqYQHuPUbGzrXQIAbWm34jL2S5xllHiA3rnZwOqDUPU1I=
X-Received: by 2002:a05:6820:1610:b0:610:fbee:c0fa with SMTP id
 006d021491bc7-61110f4f8c5mr4566184eaf.1.1750080015568; Mon, 16 Jun 2025
 06:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <fd857526-cf52-4e24-bf97-16ff0d3f2607@suse.com>
In-Reply-To: <fd857526-cf52-4e24-bf97-16ff0d3f2607@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 16 Jun 2025 14:20:03 +0100
X-Gm-Features: AX0GCFs_d0uEIt2jgsN2fMK5PknBcE2TxkRv-D3hhA1c26WYv8gCpV3sknQDdM4
Message-ID: <CAG7k0EoyewmjPz68w=Mc1iAT1u-VTo1tT+ybxKyou5Qq=dJEMQ@mail.gmail.com>
Subject: Re: [PATCH] x86/pmstat: correct PMSTAT_get_pxstat buffer size checking
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 1:00=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> min(pmpt->perf.state_count, op->u.getpx.total) =3D=3D op->u.getpx.total c=
an
> be expressed differently as pmpt->perf.state_count >=3D op->u.getpx.total=
.
> Copying when the two are equal is fine; (partial) copying when the state
> count is larger than the number of array elements that a buffer was
> allocated to hold is what - as per the comment - we mean to avoid. Drop
> the use of min() again, but retain its effect for the subsequent copying
> from pxpt->u.pt.
>
> Fixes: aa70996a6896 ("x86/pmstat: Check size of PMSTAT_get_pxstat buffers=
")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks,
Ross

