Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8A86A18C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 22:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686317.1068194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf4tj-0002iX-8K; Tue, 27 Feb 2024 21:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686317.1068194; Tue, 27 Feb 2024 21:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf4tj-0002g1-4q; Tue, 27 Feb 2024 21:21:59 +0000
Received: by outflank-mailman (input) for mailman id 686317;
 Tue, 27 Feb 2024 21:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PYXm=KE=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1rf4tg-0002fv-TL
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 21:21:57 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a8a7896-d5b6-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 22:21:54 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5d862e8b163so1802684a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 13:21:54 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194]) by smtp.gmail.com with ESMTPSA id
 r10-20020a635d0a000000b005dc36279d6dsm6125145pgb.73.2024.02.27.13.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 13:21:52 -0800 (PST)
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
X-Inumbo-ID: 3a8a7896-d5b6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1709068913; x=1709673713; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UANm1dgS5T0WOHSiSrzCuBbRubRxDNMtxNP78En/ilQ=;
        b=uqyWEx2lFUaEwblYV8FlU1y84VKAHaWPVI+4r8CRg1wvGxhQVkUZajtcwoCFyUrBVg
         o3cRb7WvREtbZOXo1mJTpHcl2EfysmdTBgEVq5q/yl3jUn+7IneBuaLoEI6eUqhjf3Ai
         6uKrekVqOzNuP9qKms3meWBvZCy+cfX6XS9Sln6RIjoRTcb3CNDs1EmfrlkLtq7uzdGs
         G9Nyr7aOrpc9JT1HqdiCp1vgZ02DIbFUu4rfMzVzzhtdO68Ep4eBFryU6cbMGmBJwYp/
         A7zyPQod6Ly9Y4/RxCzUffKIU9055z6fvZV5L8OVehzS8+p9uAt9X6iLi2/APOBvbWqe
         fr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709068913; x=1709673713;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UANm1dgS5T0WOHSiSrzCuBbRubRxDNMtxNP78En/ilQ=;
        b=g85Z9U5HTctJG/rZOAmdU6jtDjFtjdLqPIm6ACS6PE+Zv84CgfrIfmELeUSjKSe2/E
         DsLQaKmneHtrkSDkFkqWWCY+gO1WR6aHGHECr69+GKxwgTZg9DuihRi1kKiGeWWxqeRG
         x+iBm4KjvkOO1OOjzE/ShF/gsg/y0RGtPV2ANYQxkUiKUr3qIMCt5zqi8XaB5xOCezUM
         vHFb7P7zi4cOr8/0QhBK3C/5ekAizVtUSgtoL3hDHybaNhYGPT7atrKqbJVaLgKFWeOu
         7qgcTi869kgrW9wHO1SgsMC+3STfg4TAWJuqoCOk0JD6i1K2wGP7k+un69Tom1M9ayaN
         ukEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUabo+ssVHoFmDoJr2yj9a8lPLkTpyc91X1QA2/814nEk40NqDdGJBlFQ//imBJgood6dvwip9hOQjyqx05yxJPXTT88s2XAvLnfAYf+g4=
X-Gm-Message-State: AOJu0YzXaEwHHzriQe3w/KE5DZrsDBBLrQAVA1/Df29BQKREBg+QBoc8
	R8iQDmYHSTWG+TIcPVoWT/6yTXsGfGe2bQxJuUZ/O+ZYqpXsKCG7AL4m4lJ77Mg=
X-Google-Smtp-Source: AGHT+IF8ppKk3qSRiiw1IL2DaiUC6GURziSEFqA+jG8dpM8Ewv32Uofv42ldLmpmg5FLD3yIW5RJVg==
X-Received: by 2002:a05:6a20:4283:b0:1a0:e557:7ec3 with SMTP id o3-20020a056a20428300b001a0e5577ec3mr14434749pzj.1.1709068913195;
        Tue, 27 Feb 2024 13:21:53 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>
In-Reply-To: <20240221125845.3610668-1-hch@lst.de>
References: <20240221125845.3610668-1-hch@lst.de>
Subject: Re: convert xen-blkfront to atomic queue limit updates v2
Message-Id: <170906891213.1104664.4203607989260212614.b4-ty@kernel.dk>
Date: Tue, 27 Feb 2024 14:21:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Wed, 21 Feb 2024 13:58:41 +0100, Christoph Hellwig wrote:
> this series converts xen-blkfront to the new atomic queue limits update
> API in the block tree.  I don't have a Xen setup so this is compile
> tested only.
> 
> Changes since v1:
>  - constify the info argument to blkif_set_queue_limits
>  - remove a spurious word from a commit message
> 
> [...]

Applied, thanks!

[1/4] xen-blkfront: set max_discard/secure erase limits to UINT_MAX
      commit: 4a718d7dbab873bc24034fc865d3a5442632d1fd
[2/4] xen-blkfront: rely on the default discard granularity
      commit: 738be136327a56e5a67e1942a2c318fb91914a3f
[3/4] xen-blkfront: don't redundantly set max_sements in blkif_recover
      commit: 4f81b87d91be2a00195f85847d040c2276cac2ae
[4/4] xen-blkfront: atomically update queue limits
      commit: ba3f67c1163812b5d7ec33705c31edaa30ce6c51

Best regards,
-- 
Jens Axboe




