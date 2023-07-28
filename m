Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20876766F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 21:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571543.895644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTGf-00051h-Nk; Fri, 28 Jul 2023 19:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571543.895644; Fri, 28 Jul 2023 19:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTGf-0004zW-Kl; Fri, 28 Jul 2023 19:36:53 +0000
Received: by outflank-mailman (input) for mailman id 571543;
 Fri, 28 Jul 2023 19:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBqy=DO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qPTGd-0004zQ-Vz
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 19:36:52 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1803193c-2d7e-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 21:36:48 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52229f084beso3460581a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 12:36:48 -0700 (PDT)
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
X-Inumbo-ID: 1803193c-2d7e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690573008; x=1691177808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeKpeXqg16TMqrSTrUuvy9GLYPI7wPEenQQCLcLj5aQ=;
        b=pBRmZ1BgqPvjmdwqVYFirWCABRVLJQVd6lsSlk0/z+pkM++SWywXPuahMf3BdP31vP
         aDqHmAdvgznih39SSYXW0ekY3KOQArXdiTjp+s+p7hQdOP2SU2yRUP4O2g4wTm32BW+q
         ya9f2uQ6Ox4hPO3FU5D+qcnB9IBVTC30RqMOiS84qMBv4DlysPDBlyQJOs04/l2RUVPE
         7yWzOZxvEa5NfvOaoVm6i6B6vcSV8dT2jqh0CpNthWwB9/PHcRo9he9X22Ni/XeNruaW
         fwTJpirRq5K6yYXkoHbJ3eAj1jU4Y8vkekVUxGHneCmvC2qxAePGtLjFLZzOmI+S+a4N
         kBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690573008; x=1691177808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeKpeXqg16TMqrSTrUuvy9GLYPI7wPEenQQCLcLj5aQ=;
        b=GZu/vNMYry2KBa6iE54eLFrksSz48uB4tl2b9afBn9qAoLgFzrK3+FUt6U9vbYMl3R
         R1SXfoAIGcr33GCkdXo4iJqBAHeR2dn3wZcUaxx/cmUbQsgcPxFkB+bHEYwrcXuOo2hx
         SbAGvFTy4CvuT3buEjoyRqjCFpd9HQPDG9bryLYxC65ExrBNHbzSdgdGftnhUXsK0H/t
         artXL7rPZ9tvgfJQm30WVy09TtACSWtOxVs0gDB4m8HgjJ4mUbDm8pNh+c/ixmd+xUSk
         TJUSDeHyV4Gld47/5IZbWp+o/37p2Bbh0XDVr2Wp2Esurd24yADDszS5tDt9VnuDoBR9
         qsrw==
X-Gm-Message-State: ABy/qLao0ZEepImIIGpP5hdao2M7lVAua2T7qQpKvHH41mcTr6u2M64B
	AKVc6dkXizNpfdnAzQ6IGGCDHW/scK/8ckix574=
X-Google-Smtp-Source: APBJJlE3xImprInJP5h7TM/E8bj/5lUZ/M1sjGW6RmFmp0QppZxbgucIyaRALCikRxBJE25TYOuSB5h6wlJ7ozIyuKA=
X-Received: by 2002:a05:6402:10c1:b0:522:200f:cc50 with SMTP id
 p1-20020a05640210c100b00522200fcc50mr3121302edu.19.1690573008120; Fri, 28 Jul
 2023 12:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230727145447.2701-1-anthony.perard@citrix.com>
In-Reply-To: <20230727145447.2701-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 28 Jul 2023 15:36:36 -0400
Message-ID: <CAKf6xpvLO284aRJ8BcAzFfjRbPEkcJX4DX=QPFAMu5pQf9UguQ@mail.gmail.com>
Subject: Re: [XEN PATCH v3 0/2] build: reduce number of $(shell) execution on
 make 4.4
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 10:55=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
> Anthony PERARD (2):
>   build: evaluate XEN_BUILD_* and XEN_DOMAIN immediately
>   Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS immediately

For the series:
Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

