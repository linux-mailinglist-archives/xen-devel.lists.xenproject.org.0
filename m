Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06734880CC9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695782.1085851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmr2v-0008Od-9O; Wed, 20 Mar 2024 08:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695782.1085851; Wed, 20 Mar 2024 08:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmr2v-0008Le-6N; Wed, 20 Mar 2024 08:11:37 +0000
Received: by outflank-mailman (input) for mailman id 695782;
 Wed, 20 Mar 2024 08:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmr2t-0008LY-Pk
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:11:35 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77369291-e691-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 09:11:34 +0100 (CET)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-609f060cbafso77308957b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 01:11:34 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a05622a258500b00430b9aecf7asm5161601qtb.40.2024.03.20.01.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 01:11:33 -0700 (PDT)
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
X-Inumbo-ID: 77369291-e691-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710922293; x=1711527093; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owEYcVK3rZp2I8kR5h1MMWipU/reZain9WHPFoHFS94=;
        b=ndybDDrYzniHt2UV3hz62Ev+QnSVLuHrVSBjKgcBfichWFhycKdKMEBJaRL88PoCs0
         Qj4msbnN9VNa0XvfIEwMjWyoy2aLt9X3gizV/fKk85vhAxdQ9iCVUoB9+/x0VYjw/2Y1
         5qkDit4eRuKkZoaLkdbLfPNNZIwshbJ0/cRjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710922293; x=1711527093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owEYcVK3rZp2I8kR5h1MMWipU/reZain9WHPFoHFS94=;
        b=v89CQ3XYJuL08sryYoM5lqDDeEScqjjVELY4SR8IZKeCs52fByuqyvo0VSV5GkhlyD
         54SZmuJnWpMTEEoX+vrnE+XyVDoJF7F1f/sJ9ahKiXVWu4A+lrb9fVM2p0nkKO8Avnyc
         8wAoRYSg3WFIUX+nZQnscynLBRZn6/dKISIaOEhBb1jppupJZbdw4v7WQToP90VWzQKN
         fSL1c1MPTLXgRZ4QD0VvSw0cJj0p0qUyLmJgHfzY9xR01JHXkzYLpS1M3ITJeNbNaK3W
         DKOg8GdAEGqkhswpHnsw5TpWpuogiou7zFj2+fNmdTFBKmLaR+bBFxs/yZ+dUeWQTh1Z
         FeCg==
X-Gm-Message-State: AOJu0Yy/WYdrWXv9BrOQED4mivYCIqYH2UHRWzFvbs0gvggJ24nSbNQJ
	V6rh3UCojl8cLV+lysUYQGyiUdpSCZQJ6Sd6uzMcRbLGCuiLZ2HQUxxWb2/0rKL8WAhrWnwgkiu
	c
X-Google-Smtp-Source: AGHT+IH6lf1tqCwS9FlI6S9Ko/Gwnt551R7ltqkgYcGhdkYHDR0IcwErxKwaZzzGUx7QFGolIi8oug==
X-Received: by 2002:a81:ae05:0:b0:610:e1f5:64d with SMTP id m5-20020a81ae05000000b00610e1f5064dmr4120479ywh.23.1710922293390;
        Wed, 20 Mar 2024 01:11:33 -0700 (PDT)
Date: Wed, 20 Mar 2024 09:11:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: Refine address alignment checks in
 modify_xen_mappings_lite()
Message-ID: <ZfqaM41QSABsKuVF@macbook>
References: <20240319195856.4172284-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240319195856.4172284-1-andrew.cooper3@citrix.com>

On Tue, Mar 19, 2024 at 07:58:56PM +0000, Andrew Cooper wrote:
> Require 's' to be superpage aligned if given over a superpage mapping.  This
> is expected to be the case in practice, and prevents the v getting misaligned
> over superpages during the processing loop.
> 
> Rmove the requirement for 'e' to be page aligned.  All this is doing is
> forcing work for the caller just to satisfy an assertion.
> 
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One suggestion below.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/mm.c           | 10 ++++++----
>  xen/common/virtual_region.c |  8 ++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 62f5b811bbe8..018d21f8bd92 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5900,9 +5900,9 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>   *
>   * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>   * Must be called with present flags, and over present mappings.
> - * It is the callers responsibility to not pass s or e in the middle of
> - * superpages if changing the permission on the whole superpage is going to be
> - * a problem.
> + * It is the callers repsonsibility to pass 's' on a PAGE/SUPERPAGE boundary,
> + * and for there to not be anything interesting in the PAGE/SUPERPAGE
> + * following 'e'.

Instead of mentioning 'anything interesting' I would just state that
'e' will be extended to the next page/superpage boundary:

"It is the callers repsonsibility to pass 's' on a PAGE/SUPERPAGE boundary,
note that 'e' will be rounded up to the next PAGE/SUPERPAGE boundary."

Thanks, Roger.

