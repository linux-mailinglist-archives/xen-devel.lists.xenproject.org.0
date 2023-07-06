Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68274A230
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 18:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559955.875428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRqh-0004i0-VK; Thu, 06 Jul 2023 16:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559955.875428; Thu, 06 Jul 2023 16:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRqh-0004fP-SW; Thu, 06 Jul 2023 16:28:55 +0000
Received: by outflank-mailman (input) for mailman id 559955;
 Thu, 06 Jul 2023 16:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRuO=CY=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qHRqg-0004fJ-Pl
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 16:28:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32553325-1c1a-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 18:28:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so10103845e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 09:28:53 -0700 (PDT)
Received: from [10.95.131.194] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a1c720a000000b003f733c1129fsm797wmc.33.2023.07.06.09.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 09:28:52 -0700 (PDT)
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
X-Inumbo-ID: 32553325-1c1a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688660933; x=1691252933;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Nrzaoz+rsxVgQTd6TxexIuCRlSLkofQwGuRUpX9fTY=;
        b=lRE5ncMMCLuhjZR7WCD9aIRabbtkx72rnve+GOLxtTjFVgCmhjIjI1BAyFoegY0t6+
         PRFrrxdVjaFL3OLdaNmXR16w786N8MHGmcm+MVOoZMMjs5GKyfOF7sP5DClmcmwAsSAK
         0wzjGoSKnIHCBGRAmu+3uOt8aK5g6xWX0lxQof+d4tKxb+P+1RFJE5DOp2fjpqZ7lucF
         fZf9ukLA0CS1JZaSzCMIoRL1X/6334t/BCvebW/LS0c+2fwJV4oVzQ7jRjickoReikRX
         z5CSX5skhwsPzo/LUkGGZ9Dnntgbp2CX2XjBLynF5Kon+6KTS1ecJO63B3Ap+TTfsMBZ
         SWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688660933; x=1691252933;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Nrzaoz+rsxVgQTd6TxexIuCRlSLkofQwGuRUpX9fTY=;
        b=LdR52mEEsgvTP5qe4CjdR7fs5IB0sQnCK35ZoD6YqBfstOvvPDSquJLCiZ2NPTgUma
         2pUQXDEIdnbwVaJ2k5Ota1VoDVXonwi/ZDRTXpmv3EoQBEuNn/sh1tlFHB436i9sPCSM
         zg24Gk8CUknGrFNdwoJocyJO4oIP2wT+5Tt22iIOwa1DkULp/pf8msdGIsh8elW8Jwkj
         Eriyup2gd+edvdlAzvRfab8+d4XQ//Gl4NT8Y5JB+RXGv3rCmNyGu/4mKvYzB8J40quD
         hEzv9IFFBtOWWHcXEiK0WlYzg+axGaXT7RpcOZYrw0d8wd9Mwzf1P5qa5Oj0mEBJZoD1
         1OUQ==
X-Gm-Message-State: ABy/qLYDKbq023LpCLyULFtxaXckMwdQqooTQYkcL+1ajnFda+Hytvq3
	1LjyHe9qbB+cTCPeDrlZsFw=
X-Google-Smtp-Source: APBJJlGWcxJJF03lZm81+ayN8BYKTAHsb1a6gRv3FRByPiONZ3DSvT07hsvUipV0f0QybLNHfc56Dg==
X-Received: by 2002:a05:600c:2055:b0:3f7:4961:52ad with SMTP id p21-20020a05600c205500b003f7496152admr1975126wmg.3.1688660932849;
        Thu, 06 Jul 2023 09:28:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c1d5ff39-2e2a-d863-7de5-7092e559c344@xen.org>
Date: Thu, 6 Jul 2023 17:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-block: Avoid leaks on new error path
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org
References: <20230704171819.42564-1-anthony.perard@citrix.com>
Organization: Xen Project
In-Reply-To: <20230704171819.42564-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2023 18:18, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Commit 189829399070 ("xen-block: Use specific blockdev driver")
> introduced a new error path, without taking care of allocated
> resources.
> 
> So only allocate the qdicts after the error check, and free both
> `filename` and `driver` when we are about to return and thus taking
> care of both success and error path.
> 
> Coverity only spotted the leak of qdicts (*_layer variables).
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: Coverity CID 1508722, 1398649
> Fixes: 189829399070 ("xen-block: Use specific blockdev driver")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   hw/block/xen-block.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


