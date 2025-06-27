Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD36AEB880
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 15:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027626.1402204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV8oR-0005vJ-N9; Fri, 27 Jun 2025 13:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027626.1402204; Fri, 27 Jun 2025 13:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV8oR-0005tL-Jf; Fri, 27 Jun 2025 13:08:15 +0000
Received: by outflank-mailman (input) for mailman id 1027626;
 Fri, 27 Jun 2025 13:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hlj0=ZK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uV8oQ-0005tF-Lb
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 13:08:14 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7e97717-5357-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 15:08:14 +0200 (CEST)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2ea35edc691so533261fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 06:08:13 -0700 (PDT)
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
X-Inumbo-ID: c7e97717-5357-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751029692; x=1751634492; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeNb4NNp7U68SZvu2wdZ7aXGx7gqQBH0jROY08RE26Q=;
        b=kXWvUeH0B3LGz6SO2KgxxkcRT18Cslhg9+x22N+wT7A1Fjqhn4oZVJ7/xa4+80xjWR
         aV22Cj6rFk02qXoxexOSWBCOnCGLEZewg6p3pTGsTXRvqIc9vly0T0q1vbqC6XoCLaQa
         vPtNStfo0085fSQYWC8DMnpwoc4d/X1SsdqGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029692; x=1751634492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeNb4NNp7U68SZvu2wdZ7aXGx7gqQBH0jROY08RE26Q=;
        b=o1UISrYDP2JdJx+NmrEyQE5Wcbza+MPaMGRFuPynSMMMopeRXReVeyrNa9bJJ3pLzA
         9qXJhgQuDj0VtYZ5MHKBrUAO04fo1he1sAaeWtLNwzsj0R6Bo3KxiFR8TuWuAWS0pH5e
         xVeWqoJgg+k2vK0jHgctAUSCSlxGb/MX6KDQ8uazlyj+l+RGNRe0Z9HFDkCrQLCgJ3DE
         IgfNhL9wsXCSzcTvuWj/bc4M8zn8e3yAJoMFKkDVwc4r7R8W5ZJcuE4D3buePwp6PqcW
         Z1K/txro57fxbHQKBjiFPvSlMXKdurRltNzQvXtk6RSDwRh+72dniDJNWPKtnPKihrBy
         1t4A==
X-Gm-Message-State: AOJu0YxbDzKoQ6GHyK1FYSOf5A3euo1iQXRInuAkKOUSp6vtbUXAu194
	9OYfhBstTm5dqS508f3+ByR4Gv7Ghcz7UG1qui7oEfdBp4aQxjFridWUA3IqD5DIVhLR1WVzXrW
	DsLgIntEgldLBSZar+DMId4i9sSBUd4DVnFKEiosD8D3wJNWCuex0iXM=
X-Gm-Gg: ASbGnct+gXe6SgRO3CoVkUNtCyJXV7hKD7/+ZnXeycnskZ7WK6GxGQ/ejvzw/5tJOdn
	TrgoHbCXtur9ZvED0IOYCTEMITi7zjAPp3KFNDBhDDtLC05Xo1CP4xJdlNfXKn54tri4nZ4Y8tk
	utsLRxSl1wwcoh2fEPnJiB5ISuAPqnzYJo2WdvkAei
X-Google-Smtp-Source: AGHT+IFyfEbDVimxbMJ4IJxpSYDSHZM66k37L9yazfgAzU5ak0wZJ+ytUC6UcJq5NgcGqEGv9B1F+VL1sKWsfuzDigI=
X-Received: by 2002:a05:6870:3118:b0:2d5:2955:aa6c with SMTP id
 586e51a60fabf-2efed72bbd1mr1822721fac.31.1751029692199; Fri, 27 Jun 2025
 06:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com> <20250605111638.2869914-2-andrew.cooper3@citrix.com>
In-Reply-To: <20250605111638.2869914-2-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 27 Jun 2025 14:08:00 +0100
X-Gm-Features: Ac12FXzr5y8X9sPKzzW7vKXQc_OdEvf8EB6BkHunW3nzLZG31PiC_Z6bBBQa2Uk
Message-ID: <CACHz=Zhkt-a+vTPg+HJhSU=qvir94hiZOKjoBoZofeGpac+sGQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:17=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> The format of the buildid is a property of the binary, not a property of =
how
> it was loaded.  This fixes buildid recognition when starting xen.efi from=
 it's
> MB2 entrypoint.
>
> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>
> I don't like this patch and tried hard to do it in a better way, but the =
EFI
> aspects of the build system are too intractable.
>
> While on x86 I can in principle pull the same common-stubs.o trick, split=
 on
> XEN_BUILD_PE rather than XEN_BUILD_EFI, that doesn't work on ARM which
> hand-codes it's PE-ness.  Also, it's really not EFI related, other than a=
s a
> consequence of that being the only reason we use PE32+ binaries.
>
> Binutils 2.25 is now the minimum, and the makefiles can be cleaned up
> somewhat, but I need to backport this patch, internally at least.
> ---
>  xen/common/version.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/version.c b/xen/common/version.c
> index 5474b8e385be..56b51c81d2fc 100644
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -203,8 +203,11 @@ void __init xen_build_init(void)
>      rc =3D xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>
>  #ifdef CONFIG_X86
> -    /* Alternatively we may have a CodeView record from an EFI build. */
> -    if ( rc && efi_enabled(EFI_LOADER) )
> +    /*
> +     * xen.efi built with a new enough toolchain will have a CodeView re=
cord,
> +     * not an ELF note.
> +     */
> +    if ( rc )
>      {
>          const struct pe_external_debug_directory *dir =3D (const void *)=
n;
>

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I cannot see a better proposal in the discussion, but I prefer this
fixed than keep it broken.

Frediano

