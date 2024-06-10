Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5429025E3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737405.1143692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhCB-00052h-CW; Mon, 10 Jun 2024 15:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737405.1143692; Mon, 10 Jun 2024 15:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhCB-000517-9d; Mon, 10 Jun 2024 15:44:31 +0000
Received: by outflank-mailman (input) for mailman id 737405;
 Mon, 10 Jun 2024 15:44:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRC9=NM=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sGhCA-00050q-2C
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:44:30 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 521cf19e-2740-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:44:28 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6f9866bd5ccso66580a34.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:44:28 -0700 (PDT)
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
X-Inumbo-ID: 521cf19e-2740-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718034267; x=1718639067; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdir/UNx0SSe9If8XC4A9luyE79i5T/zOKoNAl1clQM=;
        b=RXQX2yycty5AeUFWuZK6jOUBU1tS5RjHhEvHC9xv73pv6Dpso13tf2nfwgoV1eMDs8
         +fKJE9XXo1yB4rtFSYpP6zJ2drdAXK+NrZIX7hQY8ZXEMXghLMqjX5Ix3FnqUaydVA5H
         X5/qP8CmZHwXReVUtcNJT2Xb4npmA6akDW1i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718034267; x=1718639067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdir/UNx0SSe9If8XC4A9luyE79i5T/zOKoNAl1clQM=;
        b=kFcQy5RESAkiFiQ10AV0PZxlrsSONhmrKiT3DNZTPfMrvE20xJn8cv3avTYd6RMZPX
         XIPa8YAxLFpeyhh+IDOJkgAFIB2cI6NfKp3NB62bHlIEeVID2jABMvaTXUzr15TGQB8n
         Vngk4MjGY7IMF9JbZiRu1aEe+C7OiCcw2tSLz0wJAqzwD+wY4hyvxaX80sgXTeQyxxb6
         tsZndtpi9JPKC2V5yE6Twp4RqaT48f8LOn+ztePXAdnp6WG+EsnC+9A+l483ziXdG56X
         uAWBB2mwqtE7mvoe2lGnJ6nUvcLcWMw1v6i45+AWOHpEImxcW00UxhKw5T2dNEm0pZ6J
         CAfA==
X-Gm-Message-State: AOJu0Yxx2XOJOpOLbhKUv6tUQdxhnYpRTpm9Sg0D2XlydPp7kOl5mDs9
	D9DArU75bp9zmquQnbuC4Lr8e8uNI6MKP/IfdvSvY1tPJGLsSoVuyiblkdWLRJjzeadEarTVXF/
	7gf8vl33fbCRQeltEXL1d7/cqMFIdscPCVyEWmQ==
X-Google-Smtp-Source: AGHT+IHGHopiDXgahkEfW7GwMW+RmLo6MeGwznjXO2H+eXg6yect+cbsCO+B7a/xyikoTTj4P0L4gsC/LsVVwcJl3A0=
X-Received: by 2002:a05:6870:65ac:b0:254:b4a6:958d with SMTP id
 586e51a60fabf-254b4a6a1f8mr4558972fac.2.1718034267534; Mon, 10 Jun 2024
 08:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240606054745.23555-1-jgross@suse.com> <20240606054745.23555-2-jgross@suse.com>
In-Reply-To: <20240606054745.23555-2-jgross@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 10 Jun 2024 16:44:16 +0100
Message-ID: <CA+zSX=akVNGAKnhsXRvMpBthUi-gZGpjKjimP88rgnux=XfQ+w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add me as scheduer maintainer
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 6:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> I've been active in the scheduling code since many years now. Add
> me as a maintainer.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ba7d2765f..cc40c0be9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -490,6 +490,7 @@ F:  xen/common/sched/rt.c
>  SCHEDULING
>  M:     George Dunlap <george.dunlap@citrix.com>
>  M:     Dario Faggioli <dfaggioli@suse.com>
> +M:     Juergen Gross <jgross@suse.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

Welcome aboard, Juergen!

