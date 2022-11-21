Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D52632867
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446725.702483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8tt-0001bJ-QJ; Mon, 21 Nov 2022 15:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446725.702483; Mon, 21 Nov 2022 15:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8tt-0001Y4-N1; Mon, 21 Nov 2022 15:40:01 +0000
Received: by outflank-mailman (input) for mailman id 446725;
 Mon, 21 Nov 2022 15:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+Qx=3V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ox8tr-0001Su-QG
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:39:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c13b0ab6-69b2-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 16:39:58 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id f27so29534309eje.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 07:39:58 -0800 (PST)
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
X-Inumbo-ID: c13b0ab6-69b2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TL4bxAMdTZ7/1iyaxpPl4jxAMqdKroHRy/h4GAuBQWQ=;
        b=HRicA2c2dHd8dbFhosIW4sVbG3lBUOTPKDKmYe8cR6sg29ZjWSxVPDQt4z+N4hG7tO
         aZzD5XwkNpgQRh6IbTCjFxrlAAEteg7YgmTlN6YJvLbjSCN/wR8Twn8Gj9P4mQCeRp1s
         +P/6MzvX/dpsh83ZR9MTs0xVVKzC7FmNN4ZvGliFAptZgBIZjp+AqZtxVLe+fKGLg52m
         3eTrv/xfR1pz2mjZ3ISQQeRr9HfHXWR0uRr50j87rjfsXCbP5ruQHjl8zQ9p1lCVIfh2
         79x+nuztF3Lww/HwcZEkvY+ERzt8g+5RYL0AtCZd53u0QEcNyE96OH1KmNwiCeVHDi1V
         EADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TL4bxAMdTZ7/1iyaxpPl4jxAMqdKroHRy/h4GAuBQWQ=;
        b=kXXcOA83Za2KPWB1yUZIGBF84dkmY7o/3kLJ78VU+qftoRH/BlZwdm6H+kGWemL0QH
         bONppDS3xUPzBYM/tG54kXM4lP7dj0xW/A+pE9LftjptEK3MMvRV905uxg8/5H9TRvkJ
         f3KwM8wDa5oePQ2vN7Sgeng4c9xCuUyIudLIApZwUxB11oUV9/ud1PSEpc5CUMH/klxr
         DN1d5FXDK/fdZfDj3FeWQOR9u/D2wK3fXeaN29ToUOrJhFanOgCfC047k/8dG9audcgE
         yMPk0OQHGDam6AdzD//XntlloHlr8eExwrgUNpRMUNfTQNXsZUwqCiH6HLFRDH7ulyE1
         e78w==
X-Gm-Message-State: ANoB5pm71D6jHlmYo744FBEcNe/dKUpur+DZvYbnRlzH/714gN5HcZyr
	pfgjQrsJMveu4NAkXcz6nxb3adTbIbn8oq65K40=
X-Google-Smtp-Source: AA0mqf7j8jthng5USitAtvZjDRWXc92ugVtfIfkWRF/Wr83E3WdNJS8TQ5MdKmxwzsvvewdkXRLx+QS/+WWQyT+8hTs=
X-Received: by 2002:a17:907:b686:b0:78d:f796:c00d with SMTP id
 vm6-20020a170907b68600b0078df796c00dmr1335927ejc.251.1669045198116; Mon, 21
 Nov 2022 07:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20221121143731.27545-1-andrew.cooper3@citrix.com> <20221121143731.27545-3-andrew.cooper3@citrix.com>
In-Reply-To: <20221121143731.27545-3-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 21 Nov 2022 10:39:46 -0500
Message-ID: <CAKf6xpto_4KPH5K=vXorAK0_e483qE6RRu1ioF7pRwh8TBGjaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/flask: Wire up XEN_DOMCTL_{get,set}_paging_mempool_size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 9:37 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> These were overlooked in the original patch, and noticed by OSSTest which does
> run some Flask tests.
>
> Fixes: 22b20bd98c02 ("xen: Introduce non-broken hypercalls for the paging mempool size")
> Suggested-by: Daniel Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
> CC: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks, Andrew.  Though we might want a small tweak - possibly as a follow up?

> diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
> index 424daab6a022..6b7b7d403ab4 100644
> --- a/tools/flask/policy/modules/xen.if
> +++ b/tools/flask/policy/modules/xen.if
> @@ -92,7 +92,7 @@ define(`manage_domain', `
>         allow $1 $2:domain { getdomaininfo getvcpuinfo getaffinity
>                         getaddrsize pause unpause trigger shutdown destroy
>                         setaffinity setdomainmaxmem getscheduler resume
> -                       setpodtarget getpodtarget };
> +                       setpodtarget getpodtarget getpagingmempool setpagingmempool };

There is also create_domain_common which is for a dedicated "domain
builder" that creates but does not manage domains.  I think that
should gain setpagingmempool permission?

Regards,
Jason

