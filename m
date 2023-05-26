Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2AA712BB7
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 19:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540185.841772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2bBr-0006G7-MY; Fri, 26 May 2023 17:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540185.841772; Fri, 26 May 2023 17:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2bBr-0006D9-Jp; Fri, 26 May 2023 17:25:23 +0000
Received: by outflank-mailman (input) for mailman id 540185;
 Fri, 26 May 2023 17:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EF2/=BP=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q2bBp-0006D3-VP
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 17:25:22 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49e08057-fbea-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 19:25:20 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3095557dd99so963277f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 10:25:20 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q13-20020a7bce8d000000b003f43f82001asm9460677wmj.31.2023.05.26.10.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 10:25:19 -0700 (PDT)
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
X-Inumbo-ID: 49e08057-fbea-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685121919; x=1687713919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tVWBGoKTqzPYFhiehgdZZa3uz8aCOBB1zrZo2N0D55Q=;
        b=AQ6dDJ+LkP78tqjrY8Vvk2shOTpgvsMv8OH9Wh+cpyiZ+k4A5yAfPpOjxMGNBSfgNK
         aYDbiasIwMf7Sv5nHC8J+rM8SokJmpJVA9AOozY8tVcGGBBLh2hLRuaLNSl3i99+UT4j
         F+NqMPjLtO6B+/2Xyj2vMPciutYjSYZQxyOi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685121919; x=1687713919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVWBGoKTqzPYFhiehgdZZa3uz8aCOBB1zrZo2N0D55Q=;
        b=fBdqbdF3dDCQhx8PQKrbBSjQDfLPOjEuZv0ZDyigztvH4Cuu2N+V7bmLeDqEkT/zSL
         +xfK9CPRnYtKNLWD/uolZq1k48iO4eShfDJgqZCOAh/CB5zPxgsQKIgGS993MhD46Nw6
         kUJKptcE6MZu/jlo+ZCm9wE5e67Qzd1y7reZkDdkAWzJqnztq5ttSHuX+RB6bMDLjdmv
         HJgwOC5AOsQ+H+gHuSUUp316D9UzRH/1ZpGws7M3VL4sylo4zBnZiGR9SjQ+dVJrdFtl
         a5fzdFBnD1zQVdPUd8tdHMSKC9bPpfeBsV6YEpCzmDQa1fBKO8nZJnEDhtOtsK7tE8nu
         PN7A==
X-Gm-Message-State: AC+VfDxtbdPGN6N3RdL/l9ZPh/UtIVjTqYP35nmfLCWqMgLoxQ1lrM01
	Or2x9juZdnLWMuymQUszYSznyQ==
X-Google-Smtp-Source: ACHHUZ7Hlfd20juY4xKjmeGQcTlONIjcfAs4Iuu1GQQKdU/Na9fZihQ1YFRJA2Pw4N2/vTo9hUpOEg==
X-Received: by 2002:adf:e4cf:0:b0:309:4f21:ec7b with SMTP id v15-20020adfe4cf000000b003094f21ec7bmr2014174wrm.30.1685121919510;
        Fri, 26 May 2023 10:25:19 -0700 (PDT)
Message-ID: <6470eb7f.7b0a0220.994d2.c853@mx.google.com>
X-Google-Original-Message-ID: <ZHDrfZpfrKQMjVvT@EMEAENGAAD19049.>
Date: Fri, 26 May 2023 18:25:17 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] x86: Add bit definitions for Automatic IBRS
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-2-alejandro.vallejo@cloud.com>
 <d2d13e52-6dd7-6783-f9ba-337afa464f40@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2d13e52-6dd7-6783-f9ba-337afa464f40@citrix.com>

On Fri, May 26, 2023 at 05:46:51PM +0100, Andrew Cooper wrote:
> AIBRS and EIBRS are very much not the same, and I argued hard to not
> have Linux confuse the too, but alas.
> 
> Don't mention EIBRS at all.
> 
> Simply "Auto IBRS is a new feature in AMD Zen4 CPUs and late, intended
> to reduce the overhead involved with operating IBRS", or something along
> these lines.
Sure. I did go out of my way to avoid ambiguityin the code, but it's true
the commit message is unfortunate.

> 
> > diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> > index 5d0c64a45f..e487885a5c 100644
> > --- a/tools/misc/xen-cpuid.c
> > +++ b/tools/misc/xen-cpuid.c
> > @@ -200,6 +200,8 @@ static const char *const str_e21a[32] =
> >      [ 2] = "lfence+",
> >      [ 6] = "nscb",
> >  
> > +    [ 8] = "auto-ibrs",
> > +
> 
> This wants to be:
> 
>      [ 6] = "nscb",
> +    [ 8] = "auto-ibrs",
> 
> as they are adjacent with names in two columns.  Gaps are only for
> discontinuities in numbering.
>
> [...]
>
> Were possible, we want to use the same names.  AUTO_IBRS is fine here,
> and shorter to use throughout Xen.
Sure to both.

Alejandro

