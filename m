Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C0B10CC2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056135.1424289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewe2-0006DE-3I; Thu, 24 Jul 2025 14:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056135.1424289; Thu, 24 Jul 2025 14:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewe2-0006Ao-0Z; Thu, 24 Jul 2025 14:10:02 +0000
Received: by outflank-mailman (input) for mailman id 1056135;
 Thu, 24 Jul 2025 14:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uewe0-00068E-Sx
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:10:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd3c2900-6897-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:09:51 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45611a6a706so5126245e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:09:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458705779c1sm21459765e9.30.2025.07.24.07.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 07:09:49 -0700 (PDT)
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
X-Inumbo-ID: dd3c2900-6897-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753366190; x=1753970990; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RhkfTCYys9dOvQkGvX0KQ1TXRGW71FISjhWme9Xqi7c=;
        b=Kp9TudoT05JTv5ZbMbqBSA0xVGMysJSYdmEvJRt0wBGxF9KWS9/7MO+qul66svdGlA
         FlZmiK0SSWc6PbcrDyoxaaGkKKETWG02D99mZM8Ty2TV3Jup8fFvdMPzU81ALPDQJK1J
         nnfl7VjxSJcNN3u9gn4mfNkUsxyJCygAxAi5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366190; x=1753970990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhkfTCYys9dOvQkGvX0KQ1TXRGW71FISjhWme9Xqi7c=;
        b=nYuMqQYRE5SNRNzxI53/uoOSgsPlCrkRAFOOqLZZS+3T78Wve5Eezs/mFZfYEZrYue
         2VQvu3ctpt/xNuv2PYcSUJ1rqVFtHuybq9gcCODnazaqaij95GNgj1KrCjTXyy3l4984
         xAuD2ClBKZgnbEIKNaEyG0IGnbZZV5E2sHuGzmh4f1nRfqploYyKqK/WQJ7sJ17j8kJy
         Qc/kq+yJrtVmu9rsLVlWmOcI99W99Cp2bDSzPZAb6oniDllxRG/JaHvs+zm2585MoN1u
         u8k5EZZKA/j7zBgM2NxlEK6PmRUm1INg4hJ6GiqFKlKxIYeMLNv60NE8aNgg+5AQyS3f
         mh2w==
X-Gm-Message-State: AOJu0YymNkmdWFaFOGIk0thBOb1bR1rbd53F2h0VHKZwgUCbPwaWsk7a
	OqYp6+TuqNc2ekECDmRc2NgB73YB/RS93NKykXRrYCI1w+pziwcPy6ColEgVk3qCvnPzLwPOOT+
	t41+U
X-Gm-Gg: ASbGncs+JOg0t1c3+IwnB32ySlc4OKmOmuQF4x8UQkS68Q6ral7hjTDPZZshwU7vzZ3
	cxfKzPSZj0d0FOzl+bdQV2Iz6gSeQh4OEyolZoq8I4TSijtIgevEISNvdjhinN+EEfuarC8TQ8u
	82jYC+npGPjCv93hq95Dx4SAuqG4xE5SwUA4OKNFttHgyMN4P4+XPfF9DNLoP0vF/4jXvpW9m8j
	yk9UcUYeEPOhZsEoe6ev0NVatyWeogYCRL9Mtxp7e7Smq9A6EAiZ5pXWEK2sOamTmfNSu8OhhSs
	zP7VDLcd06LEqJ8n9qBXf8SkXYYhSn54Nkk5xl6B/2uG+TqKI6ScEMbQzBbK2TzwyOtHccRkoEf
	Puic6IUolSFL40Nzk3oLehAIA4NYWohAGehgsB5RXnDwcQQ2aUrvaPPl7e3j2DtUfWw==
X-Google-Smtp-Source: AGHT+IHbAbmrjT/tAUI+g3M7o9jCT/tjPEvD35t6Icgo+914QlaAk4oiOQsu6NrzU+izrjQmV92CXw==
X-Received: by 2002:a05:600c:a00e:b0:456:1846:6566 with SMTP id 5b1f17b1804b1-45868d5221amr58190365e9.29.1753366190343;
        Thu, 24 Jul 2025 07:09:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:09:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] video/lfb: switch to xv[mz]alloc*()
Message-ID: <aII-rabID-mHw-dA@macbook.local>
References: <5dce6693-0a04-4cac-8a68-929f9ae2c124@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dce6693-0a04-4cac-8a68-929f9ae2c124@suse.com>

On Thu, Jul 24, 2025 at 10:18:37AM +0200, Jan Beulich wrote:
> Use the more "modern" form, thus doing away with effectively open-coding
> xmalloc_array() at the same time. While there is a difference in
> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
> code really cared about such higher than default alignment, it should
> request so explicitly.
> 
> Also clear the pointers when freeing them.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3: Use xv[mz]alloc_array().

I don't really get this v3 changelog, patch is v1 AFAICT?  Maybe it
was split from a different series?

Thanks, Roger.

