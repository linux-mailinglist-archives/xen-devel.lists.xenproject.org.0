Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A67BEA3E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614429.955479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvVR-0001L6-VS; Mon, 09 Oct 2023 19:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614429.955479; Mon, 09 Oct 2023 19:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvVR-0001IT-Sp; Mon, 09 Oct 2023 19:01:29 +0000
Received: by outflank-mailman (input) for mailman id 614429;
 Mon, 09 Oct 2023 19:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5tbQ=FX=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1qpvVQ-0001IN-ED
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:01:28 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3c9d7a-66d6-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 21:01:27 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690bd59322dso3542670b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 12:01:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 f24-20020aa78b18000000b0068fd026b496sm6613220pfd.46.2023.10.09.12.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 12:01:25 -0700 (PDT)
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
X-Inumbo-ID: 3f3c9d7a-66d6-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696878086; x=1697482886; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IFH55pRhzV5onmAR0V0RcmvgjZQ6iKkHWC3kCd8jJc=;
        b=iyayy6nNuwlNH1j4dTXg27vXR/mBIvjOiPBWhPS4Sn6XVF2OTLuYd2kaptr9KxRuE0
         i7FiAZ7F+0nSLKbZtP4vrqRFv9eJtpbmbiaf4c1Ab+DiTiOrz2S/nKwxPtLB9Oi8EddC
         z+pcsBqM8S5Ul9yOZZxjS/qa9P0MagV+JqFjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696878086; x=1697482886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IFH55pRhzV5onmAR0V0RcmvgjZQ6iKkHWC3kCd8jJc=;
        b=k1A+ufU1QBhYr9wu2e/lRbDIwLd1ZzCXisjzneJvea3PT76GbREoMf45e+3rYfsVxi
         jogB3/eXpHiLGa+DQSExxDZJLkBsibRGvCD5/G2SMlr/4MCm9wvJQjZ8VbEx/ZnwpPi4
         kT6oQVguwEux/s6JqElenGPTyQPSx4AMvcXVPWaobJ9vXft/VCdVKLPimqum04Gh50AZ
         3lAnNovDZEC0FjFic1fkXAncDT1b9R03NGXzYZ1d84VY5AnYi2xFPLqjTJq5VhV7eSNG
         IkHSFDviLS3TNqjOie5G5cfqhPLgqnxN7bYczGjN00H+nP03wRPMS36HStU9RcgQw/t1
         BMSg==
X-Gm-Message-State: AOJu0YxE9fcjbKo68IwUXImeARtNeJAPNOuA0ik8caDtmm0/F2ogEgNS
	aUt4/SeBJI2I1BR8qf/o2e7yMEKZEEAfV2L8t5U=
X-Google-Smtp-Source: AGHT+IEdiLUEPaXGkHEsA/tYV+jvxhXR25Tgergrl7cSdjdxq9CSr6ZJuinl4dMflGBaKnVK+mZmDw==
X-Received: by 2002:a05:6a00:b82:b0:68f:e810:e894 with SMTP id g2-20020a056a000b8200b0068fe810e894mr17362981pfj.33.1696878085896;
        Mon, 09 Oct 2023 12:01:25 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:01:23 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] xen/xenbus: Add __counted_by for struct
 read_buffer and use struct_size()
Message-ID: <202310091200.2DFF1FE4B5@keescook>
References: <ZSRMosLuJJS5Y/io@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSRMosLuJJS5Y/io@work>

On Mon, Oct 09, 2023 at 12:55:30PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks good. There are going to be lots of 1-byte flex array members...

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

