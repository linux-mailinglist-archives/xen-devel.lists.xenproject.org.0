Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDE7186F8
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 18:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541891.845127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4OGw-0000iG-Qe; Wed, 31 May 2023 16:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541891.845127; Wed, 31 May 2023 16:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4OGw-0000fL-N4; Wed, 31 May 2023 16:02:02 +0000
Received: by outflank-mailman (input) for mailman id 541891;
 Wed, 31 May 2023 16:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOFA=BU=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q4OGu-0000fF-QB
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 16:02:00 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 795243f8-ffcc-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 18:01:59 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6077660c6so44853495e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 09:01:59 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x2-20020adff0c2000000b0030af20aaa3fsm7330260wro.71.2023.05.31.09.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 09:01:58 -0700 (PDT)
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
X-Inumbo-ID: 795243f8-ffcc-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685548919; x=1688140919;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rSNxuF1FaMsejw/Nfe/KRC/8shyYVQNtl+Xbzvh5/58=;
        b=eQ0AfemjkLXxcbEamcsZ2VSGMe0m1rkPvVL4kWZBZRRU+s1tkhmFlFw1naPpRryfWF
         nkjjpeBGY6eLkbzEmo1gFxEJUVC31xL2qgoJg1bsQ3bbDwkNMfJbbMyA6Tz2F+Giqmsi
         We/MuOwEOQdiMbZqm3fIxZeaPwIgaiEFKLIZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685548919; x=1688140919;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSNxuF1FaMsejw/Nfe/KRC/8shyYVQNtl+Xbzvh5/58=;
        b=HQNeSOxrSbUHwD1CIdozxxSo3segCAMEE74i4+T5Xz5lv5lAN2GBmMGIYi+cYDFgw6
         lrEPg3Dl4FEqtmnH4LETfFyoSfGWL3U6mev3Ik5VQ/LE5p5ef+8vg0tfxfVVmAYA7OVb
         hOMwY9wm555gg0Bl4hX3O4EFrr3rzvRKAkYAoHTtqJXnAVJ79UDAoUjF93I1qxejAjQB
         1A4w67+nDv2iW/VoTt4hCE3Coem2q4kW/zJUq9gRmPdl1HGh8nPnSyc+io47d/hGvCNw
         igI/uhmfD1mAW2CQoVqX7XQb9DcWNwMzcgjYks61pRzsDj/hmjrtadXsbuCgRQV+67cI
         Ieig==
X-Gm-Message-State: AC+VfDwVeK+8zZ489PY78ehhjYKFaFOgK+E2oCOBT0vWxwDUp2a8Zzs9
	YH6KqVSGuCyz6ZKt2EpvnjNRqA==
X-Google-Smtp-Source: ACHHUZ5RryIwBjPcyFi943X8mwdoKpxVWwwB5XQiQqY2Qkbae05rwFNl607OJ+Pm4RhxtOMxYKhURg==
X-Received: by 2002:adf:f685:0:b0:306:30e8:eb34 with SMTP id v5-20020adff685000000b0030630e8eb34mr4155725wrp.48.1685548918830;
        Wed, 31 May 2023 09:01:58 -0700 (PDT)
Message-ID: <64776f76.df0a0220.3fe7d.ce8b@mx.google.com>
X-Google-Original-Message-ID: <ZHdvdPF2PXZpEBBa@EMEAENGAAD19049.>
Date: Wed, 31 May 2023 17:01:56 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/cpu-policy: Add an IBRS -> AUTO_IBRS dependency
References: <20230531153028.1224147-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531153028.1224147-1-andrew.cooper3@citrix.com>

On Wed, May 31, 2023 at 04:30:28PM +0100, Andrew Cooper wrote:
> AUTO_IBRS is an extention over regular (AMD) IBRS, and needs hiding if IBRS is
> levelled out for any reason.
True that. My bad.

> ---
>  xen/tools/gen-cpuid.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index f28ff708a2fc..973fcc1c64e8 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -319,7 +319,7 @@ def crunch_numbers(state):
>          # as dependent features simplifies Xen's logic, and prevents the guest
>          # from seeing implausible configurations.
>          IBRSB: [STIBP, SSBD, INTEL_PSFD],
> -        IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
> +        IBRS: [AMD_STIBP, AMD_SSBD, PSFD, AUTO_IBRS,
>                 IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
>          AMD_STIBP: [STIBP_ALWAYS],
>  
> 
> base-commit: 465217b0f872602b4084a1b0fa2ef75377cb3589
> -- 
> 2.30.2
> 

LGTM

Alejandro

