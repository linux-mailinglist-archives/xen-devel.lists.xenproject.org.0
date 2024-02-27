Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C086921C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686183.1067880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexZE-00061A-Ho; Tue, 27 Feb 2024 13:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686183.1067880; Tue, 27 Feb 2024 13:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexZE-0005zb-E3; Tue, 27 Feb 2024 13:32:20 +0000
Received: by outflank-mailman (input) for mailman id 686183;
 Tue, 27 Feb 2024 13:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeT6=KE=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rexZC-0005zV-SJ
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:32:18 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a063d41e-d574-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:32:17 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d2ab9c5e83so1171611fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 05:32:17 -0800 (PST)
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
X-Inumbo-ID: a063d41e-d574-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709040737; x=1709645537; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlfFfCKXh6eF1WcOCQlyirhSLscGtf3veXkT7yBHVjk=;
        b=NZ+XsX0CkIKLFloaTjKq8bK0rQUsHrdDwXp+183wEhoU9MmF3EdFCJsZFOB5QHlauB
         SnJVkQCgiXLnPp7rruacJKyPu2rKJUMnBqMdOaxYflVGfXkUNf9pWesRCHPaOd9GWBnV
         0WG92QnxCMT5NddlyzjEuqhe+ZxPI/dXBU9ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709040737; x=1709645537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlfFfCKXh6eF1WcOCQlyirhSLscGtf3veXkT7yBHVjk=;
        b=ECe7CtlOB89nFP3NCMPD1W8MFiig0oWje7s0xSHCg23iAKUFZY/kJf/+dPEUxYQmCI
         S77h8iZsK2FMHrmA8792P+TgZkxN0luZqbQwMsqjOU1CDeqPETuZoYlT1Z1SN8GI7dg0
         8sMNV+WclJCtuhJG7DzLv0LdUVmSKNhIfXu6IojpoAPqiZJVb5ibfYceFZBHYgIt0F4D
         oBxt74ODht0o+ltOb0RXTg8/gg9QJr6ND/5iH1H4PNde9qmUGt1XU+O7wr4VOo1RUSFW
         awz/epj7L1O6D7o5BwgzNZpqr3HfmGJVj+bQ5sc9Z82pCC4JJ0ijV1Z17sBwDf2CGI8V
         rrOg==
X-Gm-Message-State: AOJu0YzkR8u9xc/LtJCVzVPT7Dbe0CkdQ769LGfNQ1INbk5ffNjGW9aT
	oh8i+IrCjKQZtUq9zFc3yK3ujDtsSM2s3E6CNfsvHKI6a5CDcgtOSMhMxnHA4Y3zWgGkJsiyD/0
	uxUdmrhYRNAlr03cMiiYFn3+uM8/1b45hoOqL
X-Google-Smtp-Source: AGHT+IERoOUncLhTrpIy++4f2blcDkUt2umlcfRtBoX9WwR/Q0vuRVOXt/pHKCIltgv2iWsIlsQ4nyyXkYc6o6qKQiM=
X-Received: by 2002:a2e:9881:0:b0:2d2:7392:5057 with SMTP id
 b1-20020a2e9881000000b002d273925057mr6004309ljj.30.1709040737512; Tue, 27 Feb
 2024 05:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20240131165816.58762-1-roger.pau@citrix.com>
In-Reply-To: <20240131165816.58762-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Tue, 27 Feb 2024 13:32:05 +0000
Message-ID: <CAG7k0EqfMecUGQJSqMLxmR7vOjushAYQuG-r+3eAhs4a-UhuTw@mail.gmail.com>
Subject: Re: [PATCH] livepatch-build-tools: allow patch file name sizes up to
 128 characters
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 4:58=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> XenServer uses quite long Xen version names, and encode such in the livep=
atch
> filename, and it's currently running out of space in the file name.
>
> Bump max filename size to 128, so it also matches the patch name length i=
n the
> hypervisor interface.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  livepatch-build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index cdb852cc7fea..78dd2d801048 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -72,8 +72,8 @@ function make_patch_name()
>      fi
>
>      # Only allow alphanumerics and '_' and '-' in the patch name.  Every=
thing
> -    # else is replaced with '-'.  Truncate to 48 chars.
> -    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c 1-48
> +    # else is replaced with '-'.  Truncate to 128 chars.
> +    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c -128
>  }

I think it should be XEN_LIVEPATCH_NAME_SIZE - 1 to match the hypervisor
since AFAICT the hypervisor expects the last character to be NUL.

In get_name(), it checks:

    if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
        return -EINVAL;

... and:

    if ( n[name->size - 1] )
        return -EINVAL;

Do you agree with that?

Ross

