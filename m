Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F8A28888
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 11:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882118.1292296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfd2C-0004AH-Pr; Wed, 05 Feb 2025 10:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882118.1292296; Wed, 05 Feb 2025 10:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfd2C-00048M-NK; Wed, 05 Feb 2025 10:53:32 +0000
Received: by outflank-mailman (input) for mailman id 882118;
 Wed, 05 Feb 2025 10:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QrMT=U4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfd2B-00048G-Fu
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 10:53:31 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f147db2-e3af-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 11:53:29 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5dccaaca646so1582218a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 02:53:29 -0800 (PST)
Received: from localhost ([46.149.103.13]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcdf8529f1sm725511a12.1.2025.02.05.02.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:53:28 -0800 (PST)
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
X-Inumbo-ID: 6f147db2-e3af-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738752809; x=1739357609; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S79cnXj0xDh57l0DIpuxobQyWwCV3UjACzIa9GRq0f0=;
        b=CjvUnEGimPZ2zFosFR+TresWvV4EhMtGVeTtPSLAqVOLTd9PRB3iDtcl11CzH1SgYR
         FM7tFZE3ALXnfiIApAD/EUHJGEDojjs2XehY70OB8OqMohgADZ5Rq2I3zY6hSEJlsNZm
         uLYaqMJ6QXcNyT8y06kJOOOda6ccviDikN49g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752809; x=1739357609;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S79cnXj0xDh57l0DIpuxobQyWwCV3UjACzIa9GRq0f0=;
        b=KrLEZIjT8jWEZEv+wUcfdsmsakStRO0bmh4a/7jwaG+YUPli8jkE050o+mX/F0Gk5v
         8jtBhjBYdH79ZjIN9jVwpF3n9Em1HHiSeyXMvETtDfbMxZRXcUAhRIHFvv5nmsiH3Nt3
         SaLii8xbqEpaAbQfjxvQjPcDHsu/hygev+75TZmuGL10o84evEudUJfFOFXNM7yuhQ2s
         R5522ySfo3QYe+xDL8zbXNy4uWC2Jm4Y7PtCKECURHC3q8tJZZWXT01HFpAmZsHLPSjl
         bmDcbaASEeBPOIWvGU4jbueo9Ntkn3BzSpyCHsuP+BkZ3Pu2BAw95KOB/TjH4glW72Sk
         zLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvDr/Z2U7o1xUwwCBRvx7B6srtiGc8+RxKpOFRLSX90FJx9qXAxRhCChInd1S/Yt4Wt11Ufs7Ccxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwKAzevUJDIzMFgG5zvWi6ozDJPWRZvsB8WPa3g12aOaVDwkMB
	06bFzsaAZvE4yQvNw+Ix6Q1hWeOAEKADFrRndYdwL7pZq5SZefPSqoQZe+1HyP4=
X-Gm-Gg: ASbGncuw9AEBR0p97pybtPiKVd3BbTzA8um+QK1Co9qLfHVB1rZtPTEjdu52J0GsCaH
	CON0APxqXZ73VUVIqhcOWVXy70mfZb55GP86QtIn7DcgCwylcPWxzSHqlaDiyZpq4brCXwITTgq
	CBwhhMlfc+yeE6AvOq8DaR03m7hxGfFwuwmfXkT5W0NpqBux/1v79X3jJCmWYRKjlBKEsTY2mEZ
	k4fN7wAUh+qxEs0ffGqtkFALGIqb4YDFqmtPsBwWE72c2Fa4jaisXnI7SWAKjL1Adx6N3dLiHOr
	Y4n1RdLNYAs/oFHA49eM8g==
X-Google-Smtp-Source: AGHT+IHl2HyI21ccDTs0YuwtfivixNeeqW9Uv0Xr7cYu1D8gxdSvcAbaHG/VrSBm0DhJtC3oPRFfiw==
X-Received: by 2002:a05:6402:4486:b0:5d9:a5b:d84c with SMTP id 4fb4d7f45d1cf-5dcdbff3624mr2682143a12.3.1738752808959;
        Wed, 05 Feb 2025 02:53:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Feb 2025 10:53:26 +0000
Message-Id: <D7KGFG2DO1B9.1MZ7UYCS0SOMT@cloud.com>
Cc: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
 <michal.orzel@amd.com>, <jbeulich@suse.com>, <julien@xen.org>,
 <roger.pau@citrix.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: Re: [RFC] enable UBSAN for automation tests
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <alpine.DEB.2.22.394.2502041612070.9756@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2502041612070.9756@ubuntu-linux-20-04-desktop>

On Wed Feb 5, 2025 at 12:44 AM GMT, Stefano Stabellini wrote:
> Hi all,
>
> I would like to propose to enable the UBSAN config option in our Gitlab
> pipelines. The attached patch (just for testing, do not commit) enables
> UBSAN on the Xen build jobs used for most of the ARM and x86 tests. The
> pipeline passes.
>
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1656001=
157
>
> Cheers,
>
> Stefano
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
> index bc4a8a5ad2..92790648aa 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -333,6 +333,8 @@ alpine-3.18-gcc-debug:
>        CONFIG_EXPERT=3Dy
>        CONFIG_UNSUPPORTED=3Dy
>        CONFIG_ARGO=3Dy
> +      CONFIG_UBSAN=3Dy
> +      CONFIG_UBSAN_FATAL=3Dy
> =20
>  debian-12-x86_64-gcc-debug:
>    extends: .gcc-x86-64-build-debug
> @@ -419,6 +421,11 @@ alpine-3.18-gcc-debug-arm64:
>    extends: .gcc-arm64-build-debug
>    variables:
>      CONTAINER: alpine:3.18-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=3Dy
> +      CONFIG_UNSUPPORTED=3Dy
> +      CONFIG_UBSAN=3Dy
> +      CONFIG_UBSAN_FATAL=3Dy
> =20
>  alpine-3.18-gcc-arm64-randconfig:
>    extends: .gcc-arm64-build

Sounds good to me. Particularly seeing how the pipeline is already clean. W=
e
did some UBSAN checking in XenServer and it did uncovered a number of "oops=
,
yes that shouldn't quite be like that" sort of issues.

There's already precedent for making debug builds do slightly different thi=
ngs
to exercise different code paths (e.g: forcing map_domain_page() to always =
use
the mapcache rather than short-circuiting via the directmap).

Cheers,
Alejandro

