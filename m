Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F177D6DDF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622919.970196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveRM-00028G-Oc; Wed, 25 Oct 2023 14:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622919.970196; Wed, 25 Oct 2023 14:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveRM-00025n-Ln; Wed, 25 Oct 2023 14:00:56 +0000
Received: by outflank-mailman (input) for mailman id 622919;
 Wed, 25 Oct 2023 14:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qveRL-00025c-Ca
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:00:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e4e8ab-733e-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:00:54 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso875979466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 07:00:54 -0700 (PDT)
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
X-Inumbo-ID: e9e4e8ab-733e-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698242454; x=1698847254; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siQEOMfBX9/EZCjKNtYvmMYGAkJKnvvBHcr0Zdb85gQ=;
        b=AMd6cob63JN1TeL7+M1lm+LwZNNHMMKYmRjk7uQ1yGqWAwNZirlWk11NJiBmKkmkYG
         tyu4UgTy44yT7IUhvbHhd0aO179Ko32foQrJgx//I9POTQgBTtrEkRjzVxVC1lvWgoQ5
         C2i5tfvuOPrHcmUe9dW0IPxu29vLzFEPqRnlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698242454; x=1698847254;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siQEOMfBX9/EZCjKNtYvmMYGAkJKnvvBHcr0Zdb85gQ=;
        b=US9BkV+nuGW6NpNsKcahzChGbN7cHjDy5106GoubRuGq/342dw+bS/8apVA+7cgPh7
         3Dg3G0Gx9mJQ7xaT1oWpHs1VnUr/V8FXL2PVDnjSry7sdjWWNNI9bn9K5IxQg5jq/xFz
         GPjhKw5T6Htyx8MT1JcJcCvv7lP9ff6OuxcJrYu7bEjg50peCpb/QzWb2cdqfWI7OLP8
         Sr19hOkHvNNqNyPttioYfP0VrEL+1KGOu9+DDN/vAbgquX8x/o7dF4Vj5+3+xoGI06lN
         tTOHY2rx/z9HYfAokwy05OGD4VV7XFMokgz1QeD46LDA486ZAaOFdRow5Kfy3Q+arSzp
         nYFQ==
X-Gm-Message-State: AOJu0YzLg3Zkw5WND8U6YiC30ucNGMHjn/o19TI+9C+mVYBVnDf/CQFH
	2ob7wzPHs2ji8x/eDMPyLr24XBILTfqxK78/g/y1RiFmB6GVNdxr1Ib3Dw==
X-Google-Smtp-Source: AGHT+IGL+9MHAS+VAhn9gCK/i4W+oFWw/N5k1tck1b5EJNpZd1TBhBq8EpkpsEPZCPOVYUgXUHYagvP+VRZHCrM8Xsw=
X-Received: by 2002:a17:907:703:b0:9b6:50cd:a222 with SMTP id
 xb3-20020a170907070300b009b650cda222mr12790866ejb.54.1698242453831; Wed, 25
 Oct 2023 07:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
In-Reply-To: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Wed, 25 Oct 2023 15:00:42 +0100
Message-ID: <CAEfZLv=wVZzD2jXAXZstjE6fjCNbf1CFE1cgfMBxafFJfzfGzA@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when
 compiling OCaml C stubs
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 2:58=E2=80=AFPM Edwin T=C3=B6r=C3=B6k <edwin.torok@=
cloud.com> wrote:
> [...]
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>

Sorry about the duplicate emails to the list, my 'git send-email'
isn't working quite right.

