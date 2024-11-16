Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6A9CFD6A
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 10:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838628.1254598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCEf4-0003lm-00; Sat, 16 Nov 2024 09:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838628.1254598; Sat, 16 Nov 2024 09:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCEf3-0003kC-Sj; Sat, 16 Nov 2024 09:00:09 +0000
Received: by outflank-mailman (input) for mailman id 838628;
 Sat, 16 Nov 2024 09:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zkug=SL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tCEf3-0003jC-3a
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 09:00:09 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad16a3c-a3f9-11ef-99a3-01e77a169b0f;
 Sat, 16 Nov 2024 10:00:04 +0100 (CET)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7180ab89c58so689108a34.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 Nov 2024 01:00:03 -0800 (PST)
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
X-Inumbo-ID: 2ad16a3c-a3f9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC1vdDEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJhZDE2YTNjLWEzZjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNzQ3NjA0LjA4OTkwNCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731747603; x=1732352403; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTbW386E+4x70tu0Oqr6Co5qRfriONnFUJwS5ofOy7Y=;
        b=Cg27FahZh3s8KyijFIOWDRNm4c6z5Csd7J/9OuZtPShkre/IGLYDTyBN1wJv48XY5k
         wIYmrCU7+7FYNOzDd+SzXCeiBbuJWzJORVl6gU6UHqP8D2joXIq1uhx6AgvOK8p02OeU
         vMxeDzUqXq+zEi4hV0sJJdkOUgFrGT+voI5xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731747603; x=1732352403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTbW386E+4x70tu0Oqr6Co5qRfriONnFUJwS5ofOy7Y=;
        b=spFhhOng5HfwO12NPR1CRYmjNwQTnQgy3pG/nU+hKEfPP9g9liQj5iF3jBnj/b1Rqb
         HjxytyrtWW2EAku1Te+AYyMSdi6/iNYHFqOIg042Uleu6+F+PWBpSF0QI5/THSkCOnFO
         oGDsQp4645/kduOChrFzQjUlLVWA0eiHzxo/K6dCkgdPoOM5k/X7y3h1+jQn3vcum3O9
         MTQvC3rvXsDMTxJo3f6ofJ0Sv/ZHtjZI5uoNclsDsm9qb53/UwalbtgicF3sTFbqZxAk
         IJtXlVHtvLNma409fmJShq+2cZaQ/U096uCPwZlHol1wyutX7nujwLjnFd05cYZV1MIM
         zDug==
X-Gm-Message-State: AOJu0YzLaMFr0+fIePLdRK+3SjVaB9VMHFd3/zfJOwI0nBJQpNzuVUCk
	Z/+boTZBgfOhICilr96JdbkuIOoNeiVVXtub/0hJJvFszTJ35r0kt7M73/lxryPT0qqBg1rJEnb
	SlpazlrMY1aDmDfgeX+TVvH2gdz6zDx6jOK6t7Q==
X-Google-Smtp-Source: AGHT+IElMW+9HmYDsLVNULkddheex2DjtehqjYQTdSRJS0D7s/BjKBjgo2baMc8kakGW+tX1lNG/9XOyCacRvx5irOQ=
X-Received: by 2002:a05:6830:3691:b0:718:1767:912f with SMTP id
 46e09a7af769-71a777b6770mr6399585a34.0.1731747602681; Sat, 16 Nov 2024
 01:00:02 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Sat, 16 Nov 2024 08:59:52 +0000
Message-ID: <CACHz=ZjZtP=tLuBX5Ko88_OLK8mEiPEvSwzNB4rd=-fn2uK_Eg@mail.gmail.com>
Subject: Re: [PATCH] misra: increase identifiers length to 64
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alessandro.zucchelli@bugseng.com, 
	simone.ballarin@bugseng.com, consulting@bugseng.com, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, julien@xen.org, roger.pau@citrix.com, 
	bertrand.marquis@arm.com, michal.orzel@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 12:23=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Currently the identifiers characters limit is arbitrarily set to 40. It
> causes a few violations as we have some identifiers longer than 40.
>
> Increase the limit to another rather arbitrary limit of 64. Thanks to
> this change, we remove a few violations, getting us one step closer to
> marking Rules 5.2 and 5.4 as clean.
>
> Also update the ECLAIR config that was actually set to 63 as character
> limit.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation=
/eclair_analysis/ECLAIR/toolchain.ecl
> index 86e9a79b52..8fb1778bce 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -155,8 +155,8 @@
>  -doc_end
>
>  -doc_begin=3D"See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
> --config=3DSTD.extidsig, behavior+=3D{c99, GCC_ARM64, "63"}
> --config=3DSTD.extidsig, behavior+=3D{c99, GCC_X86_64, "63"}
> +-config=3DSTD.extidsig, behavior+=3D{c99, GCC_ARM64, "64"}
> +-config=3DSTD.extidsig, behavior+=3D{c99, GCC_X86_64, "64"}
>  -doc_end
>
>  #
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 4a144da8d6..3ed5801bff 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -154,7 +154,7 @@ maintainers if you want to suggest a change.
>     * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_05_01_2.c>`_
>       - Required
>       - External identifiers shall be distinct
> -     - The Xen characters limit for identifiers is 40. Public headers
> +     - The Xen characters limit for identifiers is 64. Public headers
>         (xen/include/public/) are allowed to retain longer identifiers
>         for backward compatibility.
>

Do we need to retain this comments about public headers or now with 64
characters they all fit into the limit?

> @@ -162,7 +162,7 @@ maintainers if you want to suggest a change.
>       - Required
>       - Identifiers declared in the same scope and name space shall be
>         distinct
> -     - The Xen characters limit for identifiers is 40. Public headers
> +     - The Xen characters limit for identifiers is 64. Public headers
>         (xen/include/public/) are allowed to retain longer identifiers
>         for backward compatibility.
>
> @@ -177,7 +177,7 @@ maintainers if you want to suggest a change.
>     * - `Rule 5.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_05_04.c>`_
>       - Required
>       - Macro identifiers shall be distinct
> -     - The Xen characters limit for macro identifiers is 40. Public
> +     - The Xen characters limit for macro identifiers is 64. Public
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
>
>

Frediano

