Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D878AAD3E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708996.1108251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm1W-0007TQ-T9; Fri, 19 Apr 2024 11:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708996.1108251; Fri, 19 Apr 2024 11:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm1W-0007R1-Pc; Fri, 19 Apr 2024 11:03:18 +0000
Received: by outflank-mailman (input) for mailman id 708996;
 Fri, 19 Apr 2024 11:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxm1U-0007Qv-VB
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:03:16 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6baca2d1-fe3c-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 13:03:16 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-22f32226947so990128fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:03:16 -0700 (PDT)
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
X-Inumbo-ID: 6baca2d1-fe3c-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713524594; x=1714129394; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2jbxJoWie299DLIJbLQ3cPdkIIkemn5pm+kfICbNcQ=;
        b=Behsb8T4mcxJT5bHW4HKnh1MWnQMhi/xxhCmpYtqfH4JN0Il72naYU1DBqv/FmVqij
         WgJZpRDDMLz4AbZ14qF/2buSOza81TEErsUNZAM21i4Z1PW2bK8An4s+g0nwxWQJw4mY
         7xPRLbq6J550YjQFPHeKWY9WjTv1W8m70V9WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524594; x=1714129394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2jbxJoWie299DLIJbLQ3cPdkIIkemn5pm+kfICbNcQ=;
        b=IpfijMxpRtobEXAUA1ZQhzMnshjS5FDc5KiSTzrhf7GLzIeBc13iyHfmuTw9ATEJri
         FturmweqA5yM1Py6jHC6p53FNbDTwjkd2t10BqarDIVsWKPCvnT9H4vMdEQ9iazF78UE
         1JJYWyQv1XoR4PLY1rP1w5mxsfh8Q8bJhDD3DnMMjnyyq4sOXrgqr8KgjwNyT1LRaTCp
         369yBw1XFECx5pl3IAWZZzcYSV4Je818vwnYqzESlRFik01879W4zjr8o/a7W/JA+Nt3
         t97wNilsborxKijAbUucK84AlOPVPh9ns6v23eh9G0ifDAqoBDCMraRJNCEmwTq6wZVQ
         qFRg==
X-Gm-Message-State: AOJu0Yzq+KmkQrofN+M2LD9JeYFwsXVhwdgaioUnk+h+cDR0C0l3v6Cy
	9RwrlhGWQ2VxWY0yRoPJk+jVI3ZzLP/WgppokwMuNbWOTpf6eBx7vM3MJFnssvqGrNUxSVJnIb0
	oR/xi0qHCpbAIKjrRRaUPgF44O6HhL54wmNpchTknYB6Yhf5z
X-Google-Smtp-Source: AGHT+IETIyySoN2MrwI2wyCDAnhlcZVvBgWfV/3Gb6JUEw1DsUPUS5g2f7PzlffUgOR7MYXqot1QlFmZBxcs3O1R+TA=
X-Received: by 2002:a05:6870:1d0a:b0:233:abab:6d6c with SMTP id
 pa10-20020a0568701d0a00b00233abab6d6cmr2016879oab.7.1713524594467; Fri, 19
 Apr 2024 04:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240419105037.700283-1-george.dunlap@cloud.com> <20240419105037.700283-2-george.dunlap@cloud.com>
In-Reply-To: <20240419105037.700283-2-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 19 Apr 2024 12:03:03 +0100
Message-ID: <CA+zSX=ZqOyk6P4GrZNQULuxwUNyxLhWM3u4986Dpkvanbksdng@mail.gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: Run `go fmt` on non-generated golang files
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 11:59=E2=80=AFAM George Dunlap <george.dunlap@cloud=
.com> wrote:
>
> No functional change.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> CC: Nick Rosbrook <rosbrookn@gmail.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/golang/xenlight/xenlight.go | 55 +++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xe=
nlight.go
> index d793f172e5..0ff28590ee 100644
> --- a/tools/golang/xenlight/xenlight.go
> +++ b/tools/golang/xenlight/xenlight.go
> @@ -633,9 +633,11 @@ func (ctx *Context) CpupoolInfo(Poolid uint32) (pool=
 Cpupoolinfo, err error) {
>  }
>
>  // int libxl_cpupool_create(libxl_ctx *ctx, const char *name,
> -//                          libxl_scheduler sched,
> -//                          libxl_bitmap cpumap, libxl_uuid *uuid,
> -//                          uint32_t *poolid);
> +//
> +//     libxl_scheduler sched,
> +//     libxl_bitmap cpumap, libxl_uuid *uuid,
> +//     uint32_t *poolid);

Gah, sorry, I forgot to delete some of these blank lines that were
added in.  I'll fix it up in v2.

 -George

