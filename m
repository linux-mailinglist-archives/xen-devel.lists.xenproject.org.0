Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5EAE1855
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 11:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020760.1396907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYRe-00015O-1y; Fri, 20 Jun 2025 09:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020760.1396907; Fri, 20 Jun 2025 09:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYRd-000137-Va; Fri, 20 Jun 2025 09:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1020760;
 Fri, 20 Jun 2025 09:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSYRc-00012y-Nv
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 09:54:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c74cc09-4dbc-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 11:53:58 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so10273735e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 02:53:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d1189977sm1543148f8f.82.2025.06.20.02.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 02:53:57 -0700 (PDT)
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
X-Inumbo-ID: 7c74cc09-4dbc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750413238; x=1751018038; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sTuUUBWSSYBoqV1/4Ia/RrBVDTs9rH4NkrSo0YdX5A=;
        b=eYRNoUWRBfnQhVi4wQedPe0OJFek2VLFy1vPwJts9fcAMFnUvc7molLWOhbf1ZRnW8
         NBU3SvxbCeHJD7Dxvh9qaF/acxNURrqb2zGa3msUDOCxG3sO2oHtEkWr1rvBGEnWL5zh
         20+jHX/xd+4VR89R/FnAMqWFWUE33XwLjRGjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413238; x=1751018038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sTuUUBWSSYBoqV1/4Ia/RrBVDTs9rH4NkrSo0YdX5A=;
        b=q58iixQx39Phhdfdve9X+M1z2I7qODYWhMWRhTTcYSSO4LfhHKXJ1L5pKRlvKmsNCx
         n6YOVPdaJqxRshYcXSBzu7j8yWMiYng2v88Sm5LupQWcxSjQaApVZyuaYSxrmgM9Tl7B
         ShfcXOthVSrMUKittTCD3gQdkLztfvSLvlqueStPzBhECH6iPkK7iTVpHp52e4M33FvH
         nd7M5h4SLt+k3frYKAPE6FJoV7BYi0qb/uiMwRTuMViPyeLcoWiVwIZVjR8FLaA7Jtxi
         RIA+uJ6ADm8+2sycLQw2Ik4v+93QLjXj34ZbNEQehw57rg0PMEsMbRFRAfkWBxIauyYM
         gS1w==
X-Gm-Message-State: AOJu0YwJ/d0BcBcma3K7td18gPDqiGmuH0Jw+jEOdVXcykEtKyMby5D3
	Mr2y4xTKwQzPykl6Sw72EWdlRFyDmo8U3K61SenDdy45yuFxiaE85QpkBEzgIu0HQfs=
X-Gm-Gg: ASbGncvr1U0i7ajgpb5ymRyWSlzI4VF9Id/bEnJ/3Dr4wWTFcDsxbcTc/Pg93DXnf4h
	Y6VxkwcA9zyJLMGMZ/jsYvW3Ac70tgHzG5yKRB7kuNAZNm/Ywe6daq7fkHOTICqNELHDGj9xlps
	F++qSxEiuwjelWPorRib3HwyvMGi8Q+YElgKbaEetG0Q37pF5G+kdmRjIo/GgE3rCrF2xRgnKCc
	06PdSys9O2Z7H7x/ScZ9J4jexw63NF41sQrEc9b/l3lddlmaWee4Sf6uR1QCAgn6h0mXZdfq0Pv
	jVeP/8l+GZc6zon8TN7R4c3zPag9ZdwakI9luHiK/al4KRTIp7jCTKh/CWcgAPEXp1fzxPX/cRF
	C1rINaA1lhR9ChAfnxiF+C5NcCQzqb0dXChY=
X-Google-Smtp-Source: AGHT+IHsn/onSdo+ti11S55Rsqb8gQVLZ+uzY/M5CyPBMQPEjr1LY8qDv4e9i7DrW7Ar3aZ6tPEZzg==
X-Received: by 2002:a05:6000:2890:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a6d130d49cmr1678680f8f.42.1750413238078;
        Fri, 20 Jun 2025 02:53:58 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:53:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/5] crypto: Add RSA support
Message-ID: <aFUvtMeBDEIc8njk@macbook.local>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-4-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602133639.2871212-4-ross.lagerwall@citrix.com>

On Mon, Jun 02, 2025 at 02:36:35PM +0100, Ross Lagerwall wrote:
> In preparation for adding support for livepatch signing, add support for
> RSA crypto.
> 
> The RSA code is extracted from Nettle at tag nettle_3.2_release_20160128
> (https://git.lysator.liu.se/nettle/nettle).
> 
> The MPI code is extracted from Linux at commit eef0df6a5953 (lib/mpi/*).
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> In v3:
> 
> * Move mpi.c to lib
> * Fix header guard name
> 
>  xen/crypto/Makefile   |    1 +
>  xen/crypto/rsa.c      |  196 +++++
>  xen/include/xen/mpi.h |   68 ++
>  xen/include/xen/rsa.h |   74 ++
>  xen/lib/Makefile      |    1 +
>  xen/lib/mpi.c         | 1729 +++++++++++++++++++++++++++++++++++++++++

Just FTAOD: all the functions imported in mpi.c are used I think?  So
that we don't introduce unreachable code.

Thanks, Roger.

