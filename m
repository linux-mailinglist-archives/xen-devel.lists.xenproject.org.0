Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A3739427
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 02:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553229.863664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC8bv-0002EO-FZ; Thu, 22 Jun 2023 00:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553229.863664; Thu, 22 Jun 2023 00:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC8bv-0002Bx-CT; Thu, 22 Jun 2023 00:55:43 +0000
Received: by outflank-mailman (input) for mailman id 553229;
 Thu, 22 Jun 2023 00:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kw6x=CK=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qC8bu-0002Bo-Fg
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 00:55:42 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81b4a3cc-1097-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 02:55:40 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-3f9cf20da1dso64371631cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 17:55:40 -0700 (PDT)
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
X-Inumbo-ID: 81b4a3cc-1097-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687395339; x=1689987339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3GCCFSjerORUlNkaagrmGxtlF6e541WtJg2AqtOtag=;
        b=QO2x0hgX9+3VZFmD2Elq1QWrtdE3ZFKvMsT9UJM3RjHTZvNVN9LYv95wQhJcGInVww
         7vk6ryieK6IWpQx/H5flA83b0gcN48gPqITP8YePDmpQcF2wt9Q0AC5XpmhTRb77S+yx
         QtoWQNe7YJ7/eqBWKEFoobpJs7ZynjO3JPqPYGOztfjwawil5U9bmdxhbTC71keoAETl
         vitTbJRDe3lxs9Oc8sl6FK0GgJt3af+5BHm2o3Krdo+YvqWbYvw1T6Vv8Rog25LV+BPK
         3Y9euqSbaZlA34rfp0UIohIrW0d46usF+AWFpuvbgz7S4esrYlt88D1868/X7M7Olie1
         zBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687395339; x=1689987339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3GCCFSjerORUlNkaagrmGxtlF6e541WtJg2AqtOtag=;
        b=i+nr3DYb3C4bXUP+RVg0bgXg82fChncVm6U4wzkFbZWIIDPxU2ZiKRwDP1Sm5eEIZU
         IaH3VJpj5IxrF4Xt5F6lYtFLcaTtdjZkRpREDIkunoHGXlLU7lCniR1GfCGeSenWxuT1
         Ohltol77LFHIfIRpMvr5Zs/zunXU+raYyscWYn+H/4CYRAXwGqsOmfDa5UAe4B3Mbs/N
         e/e0rvKxTcdjgtI0ZF6YaddGO5rQokr1eMIZ99fV1AyYtM5zh4iTh3AldAvHBmpHYTwL
         EwjaZbQ7e3sEgLQhCoCW3i348ZfV2AWTZBn1j/46OZTEP2hS6oCaPvFtgsWUAo28yHWw
         KTNA==
X-Gm-Message-State: AC+VfDyeSGai1GoylCavh5yw5TD+obXjd6ziOb583m3BAHGkTN9uo11C
	SZRreYpFPARs0InUpe5vRkhcUpob4ylM/qntZd4=
X-Google-Smtp-Source: ACHHUZ5PPfj55R3kuU6Ulhq/z/HKm/LKinLrQ3A4xB6JiXyMEh0sxlQiUt0OGBbyL+YV4yUqjgDLfnZAxrHPh6vhG5c=
X-Received: by 2002:ac8:594e:0:b0:3ff:2983:27e2 with SMTP id
 14-20020ac8594e000000b003ff298327e2mr10079949qtz.17.1687395339260; Wed, 21
 Jun 2023 17:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230621211200.4132989-1-andrew.cooper3@citrix.com> <20230621211200.4132989-2-andrew.cooper3@citrix.com>
In-Reply-To: <20230621211200.4132989-2-andrew.cooper3@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 10:55:13 +1000
Message-ID: <CAKmqyKOyVxfZv5fNGE3HtL+S0R28BAKekgydKaRhuTW-KdawdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 7:12=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> All supported compilers have these types.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Timothy Pearson <tpearson@raptorengineering.com>
>
> https://godbolt.org/z/Y6PWcd6js
> ---
>  xen/include/xen/types.h | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 6aba80500aaf..8b22a02eeaa4 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -5,18 +5,11 @@
>
>  #include <asm/types.h>
>
> -#if defined(__SIZE_TYPE__)
>  typedef __SIZE_TYPE__ size_t;
> -#else
> -typedef unsigned long size_t;
> -#endif
> +
>  typedef signed long ssize_t;
>
> -#if defined(__PTRDIFF_TYPE__)
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
> -#else
> -typedef signed long ptrdiff_t;
> -#endif
>
>  #define BITS_TO_LONGS(bits) \
>      (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
> --
> 2.30.2
>
>

