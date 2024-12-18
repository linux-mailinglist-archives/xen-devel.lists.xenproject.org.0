Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C79F6CCA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 18:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860706.1272706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNyJb-0002qy-Mj; Wed, 18 Dec 2024 17:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860706.1272706; Wed, 18 Dec 2024 17:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNyJb-0002oj-K1; Wed, 18 Dec 2024 17:58:31 +0000
Received: by outflank-mailman (input) for mailman id 860706;
 Wed, 18 Dec 2024 17:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMRJ=TL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tNyJZ-0002oc-M0
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 17:58:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aea523cb-bd69-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 18:58:27 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso1018220466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 09:58:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96005f73sm581353066b.4.2024.12.18.09.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 09:58:26 -0800 (PST)
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
X-Inumbo-ID: aea523cb-bd69-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734544706; x=1735149506; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Vta22zvzKVvQJh7L1iAoOLDMNpOa2sF2ZKHPn3LP54=;
        b=NeLJq7EC3JPVVzWVB5+pIjax4EF9B70DmOVqDL9Jr9Wed/cDHrFh9wajxA5cm48+PL
         spKl1/FZFBF1qI9sGuCJDdyhWQsTzH9yHXMj4h2ysTcxy7/1EVnLnRi/nswn0OcwQPPa
         b5ISDEUUAldJBsKVPk4U9WuKsb6BIOV8MHIYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734544706; x=1735149506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vta22zvzKVvQJh7L1iAoOLDMNpOa2sF2ZKHPn3LP54=;
        b=h6DfhoZ5PM1kal5P7xI7anTzCN/Gh1gXoOpwE2mWPRoAboLSbrU9praLt6HKDcl8mz
         fUSqqlk9MExH9cbo73m+qFuUqk5exz53c7bsoWwsccDBkMH2eAj1wMTkFRgkymVy13GN
         +Ef/u+Q+zkTv2aXJxwrG8fCpeOpL1qYJ+8Q2+QcdfHF3tSRbi6ghiUxipB00yzZkRMhz
         ao/ikhz+7rIrxa1xegT3tEF9spxHoVjsqkOB6p7cSGMTxejfAy9dkvtTbkNOWd2Ds//p
         KIkSs7R1tnlVndfu2KMFUc2w+Cy2YCBgaNENR0NGMcB0dBgL1uXp2XzpqhSLCIxFSiJS
         rBhg==
X-Gm-Message-State: AOJu0YzanMz7hkEwLPjnu32MwPSxTm9gVXFCX3n+caEtCnHe7rXEyfkX
	ye5Xp2DmJXeVxG1d0FNb5PNIWasne018ubvpRPTBUq52fCLEEnSWRTMmxdWFrtsKS7rP6OpOGVe
	X
X-Gm-Gg: ASbGncvRks3hYFAyn6xNAlemIxTX6+j25rHRt0+DNeuAjnngHgeP5CNE7gLRPMWpJBZ
	Z/ohjwNlRGAT/xD06S06et+h82R7Sdxw1o7IuKfJ2EdG8m0ztEXh8MIG2YYRyVF+LKItq0nOGYm
	iVF0N9PwcQ5XNXrj/JAepQWUkHwAhkxntpw/0XZv1Ipl04sBPhBYxM0adbjV2wzUENGMAQs0ag+
	h1MFCj/rFUB7/sZnbtUr4Qe6JdAZBQ1ZNu7gWTUjasnjjxxmN8yP30qgAx6Ig==
X-Google-Smtp-Source: AGHT+IE36nF8Vv+G+Ax4cVHLopoSTV7V+o2MBiWGkwPzCvyFLheY7n76XyvgbEVyRB4BPQBJmPQA3g==
X-Received: by 2002:a17:907:7709:b0:aac:83f:e10a with SMTP id a640c23a62f3a-aac083fe1b6mr12356366b.19.1734544706513;
        Wed, 18 Dec 2024 09:58:26 -0800 (PST)
Date: Wed, 18 Dec 2024 18:58:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
Message-ID: <Z2MNQTDM3N22ceWy@macbook.local>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241008213225.728922-1-marmarek@invisiblethingslab.com>

On Tue, Oct 08, 2024 at 11:32:23PM +0200, Marek Marczykowski-Górecki wrote:
> Linux 6.12-rc2 fails to decompress with the current 128MiB, contrary to
> the code comment. It results in a failure like this:
> 
>     domainbuilder: detail: xc_dom_kernel_file: filename="/var/lib/qubes/vm-kernels/6.12-rc2-1.1.fc37/vmlinuz"
>     domainbuilder: detail: xc_dom_malloc_filemap    : 12104 kB
>     domainbuilder: detail: xc_dom_module_file: filename="/var/lib/qubes/vm-kernels/6.12-rc2-1.1.fc37/initramfs"
>     domainbuilder: detail: xc_dom_malloc_filemap    : 7711 kB
>     domainbuilder: detail: xc_dom_boot_xen_init: ver 4.19, caps xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
>     domainbuilder: detail: xc_dom_parse_image: called
>     domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ...
>     domainbuilder: detail: loader probe failed
>     domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...
>     domainbuilder: detail: loader probe failed
>     domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ...
>     domainbuilder: detail: _xc_try_lzma_decode: XZ decompression error: Memory usage limit reached
>     xc: error: panic: xg_dom_bzimageloader.c:761: xc_dom_probe_bzimage_kernel unable to XZ decompress kernel: Invalid kernel
>     domainbuilder: detail: loader probe failed
>     domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ...
>     domainbuilder: detail: loader probe failed
>     xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
>     libxl: error: libxl_dom.c:566:libxl__build_dom: xc_dom_parse_image failed
> 
> The important part: XZ decompression error: Memory usage limit reached
> 
> This looks to be related to the following change in Linux:
> 8653c909922743bceb4800e5cc26087208c9e0e6 ("xz: use 128 MiB dictionary and force single-threaded mode")
> 
> Fix this by increasing the block size to 256MiB. And remove the
> misleading comment (from lack of better ideas).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I assumed I already RB this, but it seems not.

Could we get an Ack from the tools or libs maintainer for this to go
in?  It's not the best solution, but we need to get this sorted in
time for 4.20, and backport to stable branches.

Thanks, Roger.

