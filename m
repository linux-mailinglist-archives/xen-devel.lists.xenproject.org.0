Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D218AB1E2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 17:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709160.1108454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqDE-0004Gw-9P; Fri, 19 Apr 2024 15:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709160.1108454; Fri, 19 Apr 2024 15:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqDE-0004FK-6d; Fri, 19 Apr 2024 15:31:40 +0000
Received: by outflank-mailman (input) for mailman id 709160;
 Fri, 19 Apr 2024 15:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3rY=LY=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1rxqDD-0004FE-MH
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 15:31:39 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e975db22-fe61-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 17:31:37 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso2070661e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 08:31:37 -0700 (PDT)
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
X-Inumbo-ID: e975db22-fe61-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713540697; x=1714145497; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5zJtn2TY2j58RPQBfS4+ArFvZha23oxxgG5twrkNxY=;
        b=GHvUZyvDjWf23PmM8cy6Va4hQF5SfzSmXdBxdKREYhs3Emj5Go1sHjPqFzwMtOuIuI
         YF5HsKNs19K/djaU5asZzJVSrU83jntqNzn2f6UtMlekBa4CM09GTioIaAwHaSl4HQZm
         CBIpf3Uhnwzqle9q/poQ6pwQZXeXz8WvvGwOHyiQ9GGIcmYdng/niVC83aUwdsRK0bv2
         Tk1CAObFmpCvnaYhCYSo+7Rwss08WYJZV3y6wSaxaEVn9QY9AKXkTIadE1EtpLh8eS38
         b6F6iNtn/ejyZmK6bn7LGnsJZksH7fLTFDA5DEJNjTHnGzXoep1wMTwa1mLmLj5CbdNp
         ka8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713540697; x=1714145497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5zJtn2TY2j58RPQBfS4+ArFvZha23oxxgG5twrkNxY=;
        b=mg40Wfv+I3bao8aeY3hvxk8NyTzCncEjt5yY/SwQJ6EELFoiyA8/iYcaQ/WCQGQ98h
         Uab23tjHR1i9DLg6F1CkVzlh2UZq7NKGdhMb+h2beAlYQhbBLjxSbs0Y9nUGcNg2hB1U
         rdfdZIj/6DGaILGGG8FrXszDRJjme8N0i7fqw29MHCVfx74pyDJY9hpfHLywZVxds4eE
         E6tPmS55aArVlShaEewhXiHCYWGNKvjjCvS6a7G4hY0t67DTOhFo7lXs0WN1P+B3WCr9
         Cao3zuOWoTnekgnqvcVkqWMLl6a8QTh/t7v1FOxorF4oNXPvR1tvJjMyCUeqRgpeQ4AT
         khhA==
X-Gm-Message-State: AOJu0Yz0FxcveKvk0qTNLbpaQTRwq4D/7T+O0Iczkaz1iftmW7ZEnGbR
	8BbH/SLG1/kVcJ5QspOWUOK3LQ0cFSGt9yJkEVJ8Tt4Rph2S17gP6RoJ2eGemqNtrSTDt5vpZEx
	W4DNITrC1naJWOdxQwLDEm/3qAvY=
X-Google-Smtp-Source: AGHT+IFmpQ8tYKrCtGKAeLNvCoqUNdDf1Lx8KU22oiq1Cv6donsebfYMTIKMys+GK5jDphIf5qVSiUw9MrLye57W7rY=
X-Received: by 2002:a19:8c07:0:b0:51a:ca3f:75a2 with SMTP id
 o7-20020a198c07000000b0051aca3f75a2mr517753lfd.29.1713540697234; Fri, 19 Apr
 2024 08:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240419135120.830517-1-george.dunlap@cloud.com> <20240419135120.830517-3-george.dunlap@cloud.com>
In-Reply-To: <20240419135120.830517-3-george.dunlap@cloud.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 19 Apr 2024 11:31:26 -0400
Message-ID: <CAEBZRScVdncmY5HOPfzTRHdfY-_17Qvz3szcCJ1WpT1DSFCYfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tools/golang: Run `go vet` as part of the build process
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 10:00=E2=80=AFAM George Dunlap <george.dunlap@cloud=
.com> wrote:
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> CC: Nick Rosbrook <rosbrookn@gmail.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/golang/xenlight/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makef=
ile
> index c5bb6b94a8..645e7b3a82 100644
> --- a/tools/golang/xenlight/Makefile
> +++ b/tools/golang/xenlight/Makefile
> @@ -29,6 +29,7 @@ $(subst .gen.,.%.,$(GOXL_GEN_FILES)): gengotypes.py $(L=
IBXL_SRC_DIR)/libxl_types
>  # so that it can find the actual library.
>  .PHONY: build
>  build: xenlight.go $(GOXL_GEN_FILES)
> +       CGO_CFLAGS=3D"$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APP=
END_CFLAGS)" CGO_LDFLAGS=3D"$(call xenlibs-ldflags,light toollog) $(APPEND_=
LDFLAGS)" $(GO) vet
>         CGO_CFLAGS=3D"$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APP=
END_CFLAGS)" CGO_LDFLAGS=3D"$(call xenlibs-ldflags,light toollog) $(APPEND_=
LDFLAGS)" $(GO) build -x
>
>  .PHONY: install
> --
> 2.25.1
>
Acked-by: Nick Rosbrook <rosbrookn@gmail.com>

Thanks,
Nick

