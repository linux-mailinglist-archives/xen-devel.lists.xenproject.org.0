Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D96A09808
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 18:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869868.1281318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWIMu-0006dG-TY; Fri, 10 Jan 2025 17:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869868.1281318; Fri, 10 Jan 2025 17:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWIMu-0006bS-Qx; Fri, 10 Jan 2025 17:00:20 +0000
Received: by outflank-mailman (input) for mailman id 869868;
 Fri, 10 Jan 2025 17:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWIMu-0006bM-5K
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 17:00:20 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea05430-cf74-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 18:00:18 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-43618283d48so17342915e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 09:00:18 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc895esm57237825e9.13.2025.01.10.09.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 09:00:17 -0800 (PST)
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
X-Inumbo-ID: 5ea05430-cf74-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736528418; x=1737133218; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBy7MaoemUkmDMZM2GaOX0N85rym2pTWdWimCszo1Gc=;
        b=HL6MtkZFzq+LTsFdXjUcIpFuUCbbOVxaiYP3SXsQ2vEQv4rfG+iiVQZsaCyLmqAya2
         vG1wMVWIFF4YE+xgW96nMOB8mJ0bRMp/EuLrBbf3ifklPDrsR+hi/sHcieMfXbz1oxMZ
         I7Nwh7m+mNBK23EJdEv/yav47Bv6QlJUV7NVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736528418; x=1737133218;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PBy7MaoemUkmDMZM2GaOX0N85rym2pTWdWimCszo1Gc=;
        b=lsRfSTPAhDaCNZUlHuSY+NuU2zZl5IU7CNU3i4EjRRrqO8aLpVI9956ex6sU4lh1N7
         12rTHNZ5DXVTojgajIadwQGk5HfOewlrcifpAl3qsy8hOmMh2x+7nKtTz0g63QnwHJAR
         hViHf46FixbumTFK5N+B17Ek4R9ox4/PMrQ2gC/U5Dj9YOE+FqgwNaKHSzJBLCotnMTn
         DJBRhdx0+QVTw9r77bkzvU8TZqGWaiiSyACIoFc8wQHlV7LgzKvpeY8mfDKPER2dj8Z5
         5aF3+Ktzf+UZJ/WcvjDgXprGixoPnAi3CyvY8MQe+RgpgXioaGcGN+DJ6b1XTcljYxnA
         X8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUpYWpN9eWLo1xn4p3oYJJSNZKX2E850rxtWZGIWMYf7MQFGm3CwZKBqEkDAUJtjA/nCXMDiE1oCqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfSnWjqTfwpebqk668bWqOSEJ1cVy8uz27q8T33EGaKcTTFC6f
	7wIzZdoGqHsnTZUoXm0+s4+hZqn4/7vmTWeAePC2fULsM99fjtYOOqi+RDV5B1A=
X-Gm-Gg: ASbGncsKa0jWwourlFZLqTCyUIa5QXmbR6wq6eFaH2aQmAWVtj2m4JdDs5gd1edRxTc
	fid8EoGZ4/l98nuxfYh0VUGpxgLB3uWvIHfOKL69QqFqFGahgS6nfHmqUNKC81ABAfbWWuh754r
	FOT2XpDbucqcIhQgz9gwrvlSB/+mgegFQXsPJ/fHNqRGnjSOiLR4F3CP0+5phJx7kfGezUoFXOc
	dJq22gshyrUiop4ZiC7S52JDWXhcCkIAi6fMPtkM21KYbDsoQ3LMryzlN3g5Is=
X-Google-Smtp-Source: AGHT+IHsPfGH2zq/iR4xUFgiWR4xgEIUyxx91LKPnooORGN7TaXYiCEcbwR70UJ+YGh77EnlhRu3rw==
X-Received: by 2002:a05:600c:1c88:b0:434:a350:207c with SMTP id 5b1f17b1804b1-436e26e5533mr95827995e9.23.1736528417817;
        Fri, 10 Jan 2025 09:00:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 17:00:15 +0000
Message-Id: <D6YJY56LLW9U.1JHBJ5DF1A8UK@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Oleksii Kurochko"
 <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] CI: Add an x86_64 Clang Randconfig job
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250110160217.183887-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250110160217.183887-1-andrew.cooper3@citrix.com>

On Fri Jan 10, 2025 at 4:02 PM GMT, Andrew Cooper wrote:
> This was recently identified as a hole in testing.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8820980201
> ---
>  automation/gitlab-ci/build.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
> index 3abd2a0c6575..cb84f379b754 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -551,6 +551,12 @@ debian-12-x86_64-clang:
>    variables:
>      CONTAINER: debian:12-x86_64
> =20
> +debian-12-x86_64-clang-randconfig:
> +  extends: .clang-x86-64-build
> +  variables:
> +    CONTAINER: debian:12-x86_64
> +    RANDCONFIG: y
> +
>  debian-12-x86_64-gcc:
>    extends: .gcc-x86-64-build
>    variables:

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

