Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE75B2009C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076990.1438088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNFf-0000Tx-2Y; Mon, 11 Aug 2025 07:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076990.1438088; Mon, 11 Aug 2025 07:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNFe-0000Rh-W1; Mon, 11 Aug 2025 07:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1076990;
 Mon, 11 Aug 2025 07:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8H9H=2X=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ulNFd-0000Rb-N7
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:47:25 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b74bc14-7687-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 09:47:24 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b785a69454so2219776f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 00:47:24 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3ac115sm39636210f8f.12.2025.08.11.00.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 00:47:23 -0700 (PDT)
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
X-Inumbo-ID: 6b74bc14-7687-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754898444; x=1755503244; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ezl5tCBooH8WN9HvZvjHdhsjX5bPZiSZee/ywlRokhM=;
        b=MSdGU4ioW7bQWucHMLBar1pawq98XguFKRV8lfVUP8E5otPksNI2uGkUtFFHkpucFJ
         3XLFBc6WTepxiq7mcvB1Rtndhy4OODkY+1b3JInC2SF2aHoDdEKNwiBc1xe1wErmP8WW
         +lQyx8PJcsDBmUWDkIAG3pRP7TumB44mPMj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898444; x=1755503244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezl5tCBooH8WN9HvZvjHdhsjX5bPZiSZee/ywlRokhM=;
        b=jFM/p8hC1WpB9Q/bLFIXARI2uqWiDPYJFLXzwnIRc6L/otEhK3e/CptMGFjpCxKlFM
         yZcuTadaNMUqnWjAJSDMMzAVhXXbmXVBMHg83vFLZUGqQE76e3/uD5h1CD6F3m/gpdb6
         /5CRK/vjqHMmVweBO1YpecYBT1ZE3Ogr75acCGyzS6+97cS3vTHLJ2Y4aComkEltWsQk
         yQ0pU5i12RpG3XBVV43Z3It+z65Oezxjf2eZx59Gr9Euc8RDpTsKHquqCiKs2XaKyO74
         Yk9SVQ/IPucDAeR2iMC8CNWUWSXlgNeoZrHNJxE5BbhcCdapnXcsVz0BoQdRqwldDTKT
         OqzA==
X-Gm-Message-State: AOJu0YwImui4rfbV0698kphQzwYkPG37OPeQJCjUDym7RxLahRZH5SiM
	V4vfzQZ8l15mk0Kcx1Hd87eMSMDgnhEOKqQnYhWAhNdlz/fouCgxyW/p/Rh4S8xlUsA=
X-Gm-Gg: ASbGncsnFsONvYZ7nOk93u1hYpXAvz37B3NqtBkgGjslLd8foN0Yl7vwjOkOhddcfE3
	U6kiv9KqfwrhfK8Xx2d7procinlApSRbHedE1obRRfb4236IOUTWAVBv6b5DPWaOv8AZ6IKV0Kj
	/1IfPQhf3RfUWN6+Q7eCakNswslDhcEf5iJhHfkdonvX5XUBGQmdXk0PJYTrc2EC+w2q3bkKJpr
	vZkHSZRtEE94ubPI/rjbrUxWok9Blmgul/SQl9F882mIunO8bzsQy3EocNABzXw/juFci6MrVjN
	eSASKNa7ic49yxTduvJkX5KUM219EUcHdGe3N+kyk2gJoSpnaWh4v8tNzzdAn/k6qVoN4RvZ4mE
	7BuoS2cbkCsbwLTmPmIQL2BZQxpBq8+Ov+sVxLuwNw44vbIrQKq1DSNqPjyjDc576Aw==
X-Google-Smtp-Source: AGHT+IGNpEhkW2UGeIE1UZYhj9rlhoyt/UrpoBJbp2gTZV/6Vk1yZaZBkT534aOUDF8Ru9bWWnPhtA==
X-Received: by 2002:a05:6000:2282:b0:3b7:8b20:6fdc with SMTP id ffacd0b85a97d-3b900b31494mr10938322f8f.24.1754898443888;
        Mon, 11 Aug 2025 00:47:23 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:47:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: nicola.vetrini@gmail.com
Cc: xen-devel@lists.xenproject.org,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
Message-ID: <aJmgCv4wgl-IHupn@macbook.local>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>

On Sun, Aug 10, 2025 at 03:03:53PM +0200, nicola.vetrini@gmail.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The enforced toolchain baseline for clang is version 11,
> therefore this logic is effectively dead code.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
> ---
>  xen/common/coverage/llvm.c   | 4 ----
>  xen/include/xen/self-tests.h | 9 +--------
>  2 files changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 50d7a3c5d301..517b2aa8c202 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -44,12 +44,8 @@
>      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>  #endif
>  
> -#if __clang_major__ >= 4 || (__clang_major__ == 3 && __clang_minor__ >= 9)
>  #define LLVM_PROFILE_VERSION    4
>  #define LLVM_PROFILE_NUM_KINDS  2
> -#else
> -#error "clang version not supported with coverage"
> -#endif

Rant: most of the LLVM coverage stuff is already kind of dead code, as
the format of the data changes between versions and there's no way for
LLVM to generate the blob itself using a builtin function or
similar.  We haven't kept up with new formats, and now it's not
possible to parse the output coverage data when using newish LLVM
versions.

Linux converts it's LLVM coverage data to gcov format (which AFAIK is
way more stable), and exports it in gcov format.  We should consider
importing that from Linux.

Thanks, Roger.

