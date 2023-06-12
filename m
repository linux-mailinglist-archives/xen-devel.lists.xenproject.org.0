Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B39772C95F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547292.854598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jA1-0005rW-JX; Mon, 12 Jun 2023 15:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547292.854598; Mon, 12 Jun 2023 15:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jA1-0005pS-Gb; Mon, 12 Jun 2023 15:08:49 +0000
Received: by outflank-mailman (input) for mailman id 547292;
 Mon, 12 Jun 2023 15:08:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oj3S=CA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q8jA0-0005pM-Dy
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:08:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07ded345-0933-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 17:08:47 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-516a008e495so9172147a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 08:08:47 -0700 (PDT)
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
X-Inumbo-ID: 07ded345-0933-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582527; x=1689174527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZAhXYFLy0EieDe2pYQ1FtzFiqmEGbWvBqsQmj/RF00=;
        b=U4R33eMMy/CUlsX98UI+SwKb3I5atwPvUtQbYGdSRzyJ0UEinrf4Hhca8FXwk7YhUo
         S2vGXhlYBiXI4OAWCMipGracfoD7ebm+xFpBsZsKUy/MEXe/CBsfJeG3MT5ox7X2mPeY
         XLnRFc/7DMADI1vKr2VKb5mwx5nC9LnnPZSVAotQKTVn0Ov70x3X6eYpQGbsydih6PVZ
         EUFeCle+f53hE2YRGVx+tMQ8jsPQ5YKskeo1ZbPjPgea+Q10jTSj+lCyo5ib399pQCiF
         33VnZta5F9KIHDINwxzQpBrCuD95DEp7OOnD5A+rlp9h3oPrmPkhKef/E9NZM5O+D5d5
         Sysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582527; x=1689174527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZAhXYFLy0EieDe2pYQ1FtzFiqmEGbWvBqsQmj/RF00=;
        b=Et7EybtC3k79oMFyaSjvGI6jy+SHxSQgdZPHRWuSFfdCDZjB4LLZr17Rx4zF9cYgn4
         fg6nLOvWSXy+qAuQfz0uv9Vy2yMTXFeCuFSXkeoles2BcYxsF/rdS4fz/T7qwom3dvNT
         UHjg6XCv3PEVd0cnAHizu9H7WtLA9P5P4cEXQ31Eju/8GE25I8ZIGDC01tOzbkgp2Q0r
         cWMI5tUMAUpsCqCQMU7a7Ucm/xgb5iESBgXMOTI0g0nuux62RhvX8wD7GtYOlHlOp3cm
         JpdKdQmIVXc5BY+isTTU2clQqlw2TAlnC3SW5w2Dtuj+gAVmSMoyjf6Ek69kjCRksrxV
         Z7aQ==
X-Gm-Message-State: AC+VfDyHUB3gcEdYceAcxd4gDYAmDxWBjmmr1koN52U2OSSJj8Lv5Ttt
	t8GL4rHwfQ4QvAXqtyGxq0Ci9w5WrqLkR/smEWg=
X-Google-Smtp-Source: ACHHUZ5LdI8IHJ1KuVdgKULlbQXCixLxQSS0jvtSoIwY4uGT5dWFowaAINJSMi0yVqfOlXzSDyGABqxoiXp6dcr+RWI=
X-Received: by 2002:a05:6402:5114:b0:514:387c:930 with SMTP id
 m20-20020a056402511400b00514387c0930mr6708030edd.5.1686582526916; Mon, 12 Jun
 2023 08:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230612101319.29842-1-julien@xen.org>
In-Reply-To: <20230612101319.29842-1-julien@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 12 Jun 2023 11:08:34 -0400
Message-ID: <CAKf6xpsxGpN=mKQzYD+va7C__BDWZ1aRiFXnYEFGiQwxgXf_TQ@mail.gmail.com>
Subject: Re: [PATCH] tools/xenstored: Correct the prototype of domain_max_chk()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 6:13=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Some version of GCC will complain because the prototype and the
> declaration of domain_max_chk() don't match:
>
> xenstored_domain.c:1503:6: error: conflicting types for 'domain_max_chk' =
due to enum/integer mismatch; have '_Bool(const struct connection *, enum a=
ccitem,  unsigned int)' [-Werror=3Denum-int-mismatch]
>  1503 | bool domain_max_chk(const struct connection *conn, enum accitem w=
hat,
>       |      ^~~~~~~~~~~~~~
> In file included from xenstored_domain.c:31:
> xenstored_domain.h:146:6: note: previous declaration of 'domain_max_chk' =
with type '_Bool(const struct connection *, unsigned int,  unsigned int)'
>   146 | bool domain_max_chk(const struct connection *conn, unsigned int w=
hat,
>       |      ^~~~~~~~~~~~~~
>
> Update the prototype to match the declaration.
>
> This was spotted by Gitlab CI with the job opensuse-tumbleweed-gcc.
>
> Fixes: 685048441e1c ("tools/xenstore: switch quota management to be table=
 based")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>

This fixes the issue on Fedora 38, too.

Thanks,
Jason

