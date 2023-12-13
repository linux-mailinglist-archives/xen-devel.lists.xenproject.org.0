Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30649811904
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654106.1020784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRw0-0001Lo-J2; Wed, 13 Dec 2023 16:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654106.1020784; Wed, 13 Dec 2023 16:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRw0-0001JF-G7; Wed, 13 Dec 2023 16:18:08 +0000
Received: by outflank-mailman (input) for mailman id 654106;
 Wed, 13 Dec 2023 16:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdY9=HY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rDRvz-0001J9-7l
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:18:07 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31eb5b66-99d3-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 17:18:05 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso4411555f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 08:18:05 -0800 (PST)
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
X-Inumbo-ID: 31eb5b66-99d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702484284; x=1703089084; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tuZaQdrAxao2zUrd8u8T+Wt5o/b8bVscyhk+k0kxUE=;
        b=KY6Azdg/h8x1QuNtrob20pi8FY8anlKSrdh4kXD6JYHqITMrzCCy6B1VYSx/6R/RM1
         0sG5ytG5i0UZe97SEx0cN5vI1DpKFapLI1mOhyklaeJGCzzGeq3s838cJb2s+oJ+W2lO
         9XdXybfcJMXIj9MTzkIEmPi1yAOD+pGKL/ptc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484284; x=1703089084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tuZaQdrAxao2zUrd8u8T+Wt5o/b8bVscyhk+k0kxUE=;
        b=riIlHqbdUOdoyQ0uRNOI72SZ0uT64VAYvGLDkECH7mPdNzYux4+vAjEQbJL0EkH+vD
         2s7CV+xyG+v9oxM1MxQ6kkJNKuXjkPATQobz9jrdKnqlXVfsfJF7HmLMAGXpv/cibhle
         gyNt07c4I7/vp1WW+LNm5WAG9HhPJ3yFBpC5e+Dme73eeZdlWudwB6Te8M0xJoV/Xw7Q
         hZD79OvCSlSzk5cQI8zXbx527ZHTHJsg9h9Xt4dknqIrHobmXviZrdAH4GD2EF5YBMkW
         v4dTCiIjuP5JObO6z80//UwW40yPOIJ7IJe2aQZ6iCsdiFiXibx3NiaKHVGLidgx9YmJ
         vFVQ==
X-Gm-Message-State: AOJu0YwN6Lgr2PsMPbnPrJTIUOpxRHnUsq4Rf9ncUgEmJxTkt71bhlpj
	hY6dEvB4sJgL5JwiHQG8zWGdlPScyTG8xqN2fpEC
X-Google-Smtp-Source: AGHT+IFlsK9lA/Dg2yiTnHHD8Bspket/+0/wDAo+4R6rvF0cfLPRD0LVRqNF+mRTtg1ORtEEZtomLBK4WV2ovqafZA0=
X-Received: by 2002:a05:600c:12c6:b0:40c:3612:386d with SMTP id
 v6-20020a05600c12c600b0040c3612386dmr4315660wmd.170.1702484284570; Wed, 13
 Dec 2023 08:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20231213135147.6749-1-roger.pau@citrix.com>
In-Reply-To: <20231213135147.6749-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 13 Dec 2023 16:17:53 +0000
Message-ID: <CAG7k0Eq+3nTts_Ak-yRDpqDV2rKXeED0o9zDhybQbUG6pW+JQg@mail.gmail.com>
Subject: Re: [PATCH] livepatch-build-tools: fix misuse of script directory as
 work directory
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 1:52=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> It's incorrect to assume that the script directory will always match the
> directory the script is executed from.  Instead cache the directory at th=
e
> start of script execution in order to be able to get back to it if needed=
.
>
> Fixes: 629ab8ddb775 ('livepatch-build-tools: do not use readlink -m optio=
n')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  livepatch-build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index f622683fc56c..e318cecd4da6 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -25,6 +25,7 @@
>  # script.
>
>  SCRIPTDIR=3D"$(readlink -f $(dirname $(type -p $0)))"
> +WORKDIR=3D"$(readlink -f -- .)"
>  CPUS=3D"$(getconf _NPROCESSORS_ONLN)"
>  DEBUG=3Dn
>  XEN_DEBUG=3Dn
> @@ -459,7 +460,7 @@ if [ "${SKIP}" !=3D "build" ]; then
>  fi
>
>  if [ "${SKIP}" !=3D "diff" ]; then
> -    cd "${SCRIPTDIR}" || die
> +    cd "${WORKDIR}" || die
>      [ -d "$outputarg" ] || die "Output directory does not exist"
>      OUTPUT=3D"$(readlink -f -- "$outputarg")"
>
>
> base-commit: 0ed8ef88dc300750696a64e89efa3b82502f6dc7
> prerequisite-patch-id: 20327fdf775db3903c8067a0642254d67c495806
> --
> 2.43.0
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks,
Ross

