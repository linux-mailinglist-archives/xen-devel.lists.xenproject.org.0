Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A56C4A85
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513400.794321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexbT-00089L-D5; Wed, 22 Mar 2023 12:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513400.794321; Wed, 22 Mar 2023 12:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexbT-00086T-9g; Wed, 22 Mar 2023 12:30:07 +0000
Received: by outflank-mailman (input) for mailman id 513400;
 Wed, 22 Mar 2023 12:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYju=7O=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pexbR-00086N-Uh
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:30:05 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455f5e3f-c8ad-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:30:03 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id cn12so26560769edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 05:30:04 -0700 (PDT)
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
X-Inumbo-ID: 455f5e3f-c8ad-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679488203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DgiUrzWt20XlNb1m4jdLgEw9KZ60K/tfMxOJ5u3wVs=;
        b=CAL4cpFbZ17oBGfj8awo4UYrbIPYjL/5kijJ2e7LNqvOs9v13sdAtJyc9bGfZcKZxM
         ylJHsgUoDFyRK9YINY4iWqK/ecpVpzPvVFSmzscNgo6TcHlujPZvbNDfZ+VJPvPNnYLF
         07FZwbimu4zzLhItAWPuPg17CvcBvQmM42MebVOdWAs0vFQdRY01t3TyWoN1nl22MiGq
         EdGdSagG+ef+sKYf0Ce3dbNqUqpY9Uw0Iv+XUQZWI4v+XeFGrgdiYmK3dPDvSgMVFnMx
         qaF80CskQLv+prtaEKfyvPboPQDQ5lSH0qJrF08smOUKFsmpDpzty3KmVPaPa6mOgE6m
         hYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DgiUrzWt20XlNb1m4jdLgEw9KZ60K/tfMxOJ5u3wVs=;
        b=nSzQCzM+EybxMkVh8XtA1LZrQDcrCtQcgtkEzrO9gV/H4CMUAKxA9f7mRjievInX5y
         F1d7MMTwCqblhgULCJO9F5azWGOCGbIEe55H+I1NNeAemjDbWVqINaNryLJOiDDydpnZ
         TZUkUnPWB/AT5n/Og/aNYvxle7hzC5Cg1Zv+El16hzSOtd622n+W2qiG4vxfH+ryGe17
         f5IGD8EJZV7dtyu8M9Qjw/Dh4LOIXWij78xNLDl5rnizcfe4Zd7K59NrovOSdtx4Qece
         JQ+kbnWBk7cdE6u3PXQdnJY5Qh6tu7V6ISILfFgpkXymp4rkT3A6ccwjSUD5wxpe8m0P
         GlIg==
X-Gm-Message-State: AO0yUKWinYjfr6JMRUe03nOkC/fzg6YOXIORVsbUBdeWxAB2i63faVEf
	9fqTjihGgJTsSZIszKemZ4/CWFaFoCf4kP+v17s=
X-Google-Smtp-Source: AK7set+iAvotDccN2pKqDAqWzWCnK6GFVn7kgBrPMqco4+pj5M+aD7QFWmndfiziYQ2J8fb2wiXqBgpjB6J0fdGevEc=
X-Received: by 2002:a17:906:2cc5:b0:931:c1a:b517 with SMTP id
 r5-20020a1709062cc500b009310c1ab517mr3047167ejr.3.1679488203521; Wed, 22 Mar
 2023 05:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230322073453.7853-1-jgross@suse.com> <20230322073453.7853-3-jgross@suse.com>
In-Reply-To: <20230322073453.7853-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Mar 2023 08:29:51 -0400
Message-ID: <CAKf6xpvG5+OGJ1iivOAqO7mAf+SfsimMgdfjEh1F36AfatUUkA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] tools/xl: make split_string_into_pair() more usable
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 3:35=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Today split_string_into_pair() will not really do what its name is
> suggesting: instead of splitting a string into a pair of strings using
> a delimiter, it will return the first two strings of the initial string
> by using the delimiter.
>
> This is never what the callers want, so modify split_string_into_pair()
> to split the string only at the first delimiter found, resulting in
> something like "x=3Da=3Db" to be split into "x" and "a=3Db" when being ca=
lled
> with "=3D" as the delimiter. Today the returned strings would be "x" and
> "a".
>
> At the same time switch the delimiter from "const char *" (allowing
> multiple delimiter characters) to "char" (a single character only), as
> this makes the function more simple without breaking any use cases.
>
> Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

