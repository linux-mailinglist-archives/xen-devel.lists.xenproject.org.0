Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A0B1745F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065852.1431174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVdk-0000Kr-08; Thu, 31 Jul 2025 15:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065852.1431174; Thu, 31 Jul 2025 15:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVdj-0000JD-TJ; Thu, 31 Jul 2025 15:56:19 +0000
Received: by outflank-mailman (input) for mailman id 1065852;
 Thu, 31 Jul 2025 15:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g10J=2M=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uhVdj-0008NN-9u
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:56:19 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e47f2079-6e26-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:56:17 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2ebb468cbb4so863523fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:56:17 -0700 (PDT)
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
X-Inumbo-ID: e47f2079-6e26-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753977376; x=1754582176; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbAkfH/Kh66/pWxcM/rrnxgFmDIShR9m+ETVOh2JEFQ=;
        b=WROZ3axMZFVuJC7pgSHHmjJ1mCUgi+vrA9KmVXJFvR+hCidBXvOf+XfwqIclGVZEvB
         ti0FPhpDIu2JKvN3nFEl7gYEcCIItAb1Yb7qGtXbFCzHNDc0mWRCpaQmnjUcFKlAlaBh
         geP1K/Qi7P8YHoX6ehOBq3ik6b3O+UNnI6tj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977376; x=1754582176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbAkfH/Kh66/pWxcM/rrnxgFmDIShR9m+ETVOh2JEFQ=;
        b=giT/3nuR4xiT3EhSgvhTwOEAbFcXyeIHaVV53Uxah+bqTbqDQouRhna6RYc4H895Ie
         nKQEDjOUaRENZR6I+340RDiT4kRblYnEZf77Q7JJZpnSnkZFbq/r5o/nFnmH5HglsHNC
         lhxYxKf69uk0f+QdBkZ3cSzGlVrSvTupiD7AG4/ewocC13UQRjekDutXTroxgWhccMbF
         0IgmF71hBXQbHzCvPC2rRL5hdqB7afhLSZyoxW6bM1Gk7KTjEZjxPTqxvT9tkYVMSbGm
         zQlpsC3gPhPDw047T3Fiv58RzxNfAakJzl1xMMQt19ZkHEGPiZ7iBaM4MC/MC0EAw4w5
         Vtsw==
X-Gm-Message-State: AOJu0YxO42d+xCYYCqutLm96kccv59ytU/KZmAHOSnZq6k4YXrnYTfEc
	q6qkz3CGcm6HpqVSWwW5z6EcZtH0PxoaDD5L+D3aa2CFFHSJ3SApEVxZzUHg7rPi/07kk0nCpsk
	Q66I56gcbL6hAL03qsAS6cvOwQTAAttsDrP3Wi17e
X-Gm-Gg: ASbGnct13z8T5ibTMughxM6Myjne89i6wNmEHOue4nEgT5gzd/Gb4QMw6sRR+3p6c8U
	r6A5JQWqav2ORa4/eo8yaIMmXozOyuKZXteY9iv5sQIpa7CT3Y0PAsdtyRyjuvoBpz1Xz7i07bc
	oUkJDVF/bj+J3AxxVNhIix5DsIXXvlC0YG475DNJTrrkiwjeMdoJuWcsvhk/h3gv/KejsTXzVrj
	9t/ig==
X-Google-Smtp-Source: AGHT+IGOW08oKnv7Unvzuf0eK9lJgHhODeKiFGBKTnamzAEtDhvoJ9nt0xUGn4DSj+d4zoXbzXt5l7YKk86l25quhQk=
X-Received: by 2002:a05:6870:a908:b0:306:e3a8:a97b with SMTP id
 586e51a60fabf-30785c8f016mr4592505fac.21.1753977376331; Thu, 31 Jul 2025
 08:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250731110231.3551636-1-andrew.cooper3@citrix.com> <20250731110231.3551636-3-andrew.cooper3@citrix.com>
In-Reply-To: <20250731110231.3551636-3-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 31 Jul 2025 16:56:04 +0100
X-Gm-Features: Ac12FXx9bQ3p0q2dkJUATy_Dm9N25VnepvLjjWa79CBl5eij8eiKo-1SySfmpGg
Message-ID: <CAG7k0Eob8eaGt=qA2hCEWHi5FbavJOe70odo5n+xDdeO6TyeQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/version: Remove xen_build_id() and export the
 variable instead
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 12:02=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> The API is unergonomic to use, and leads to poor code generation because =
of
> unnecessary forcing of data to the stack.
>
> Rename build_id_p to xen_build_id, and build_id_len to xen_build_id_len, =
make
> them __ro_after_init, and export the variables directly.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Both the code diffstat, and the binary on x86 speaks for themselves:
>
>   add/remove: 1/2 grow/shrink: 0/6 up/down: 4/-348 (-344)
>   Function                                     old     new   delta
>   xen_build_id_len                               -       4      +4
>   build_id_len                                   4       -      -4
>   build_id_p                                     8       -      -8
>   xen_build_id                                  42       8     -34
>   livepatch_printall                           470     432     -38
>   build_id_dep                                 152     113     -39
>   livepatch_op                                7930    7866     -64
>   do_xen_version                              2436    2363     -73
>   livepatch_op.cold                           1420    1332     -88
> ---
>  xen/common/kernel.c       | 14 ++++----------
>  xen/common/livepatch.c    | 23 ++++++++++-------------
>  xen/common/version.c      | 25 +++++++------------------
>  xen/include/xen/version.h |  4 +++-
>  4 files changed, 24 insertions(+), 42 deletions(-)
>
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 5be668ba855a..e6979352e100 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -510,21 +510,15 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HAN=
DLE_PARAM(void) arg)
>      struct xen_varbuf user_str;
>      const char *str =3D NULL;
>      size_t sz;
> -    int rc;
>
>      switch ( cmd )
>      {
>      case XENVER_build_id:
> -    {
> -        unsigned int local_sz;
> -
> -        rc =3D xen_build_id((const void **)&str, &local_sz);
> -        if ( rc )
> -            return rc;
> -
> -        sz =3D local_sz;
> +        str =3D xen_build_id;
> +        sz  =3D xen_build_id_len;
> +        if ( !sz )
> +            return -ENODATA;
>          goto have_len;
> -    }
>
>      case XENVER_extraversion2:
>          str =3D xen_extra_version();
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 9a0df5363b59..9285f88644f4 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -475,8 +475,8 @@ static int parse_buildid(const struct livepatch_elf_s=
ec *sec,
>
>  static int check_xen_buildid(const struct livepatch_elf *elf)
>  {
> -    const void *id;
> -    unsigned int len;
> +    const void *id =3D xen_build_id;
> +    unsigned int len =3D xen_build_id_len;

Is it worth making this const? Or you could just remove these variables
entirely and use xen_build_id / xen_build_id_len directly in the rest of
the function.

In any case,

Reviewed-by: Ross Lagerwall <Ross.lagerwall@citrix.com>

