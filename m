Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD69D27A5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840100.1255887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOtz-0005I7-OP; Tue, 19 Nov 2024 14:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840100.1255887; Tue, 19 Nov 2024 14:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOtz-0005Ey-LL; Tue, 19 Nov 2024 14:08:23 +0000
Received: by outflank-mailman (input) for mailman id 840100;
 Tue, 19 Nov 2024 14:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDOty-0005Eq-B4
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:08:22 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b91f88a5-a67f-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:08:17 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so3946052a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:08:17 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfbcca8abesm2688129a12.44.2024.11.19.06.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:08:15 -0800 (PST)
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
X-Inumbo-ID: b91f88a5-a67f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI5MWY4OGE1LWE2N2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI1Mjk3LjAzNzQ1Miwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732025296; x=1732630096; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4G/ZnPTlcS4BaCmknAlG1P6W6gWNLWNybjIyJxF5zqA=;
        b=X8pZhUfANvBQcJ83PiJA6xoemQDJEeVjMckxop0C19anhBa5mDKamiYEGgezsL+1Fq
         1QCjS1C9ACkatVafM9Q8zfo4XUGvpNBoQfuqV782cd9fogxur3r6TnbLk5YpXtHag0/h
         p8GFetSTyNB//p+5z1NB+74tXCD1WuZ918oXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025296; x=1732630096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G/ZnPTlcS4BaCmknAlG1P6W6gWNLWNybjIyJxF5zqA=;
        b=guJA5T0y1AZYeVfZiptEXgGoTi3MHNLUqgO5QeLGEfs8zdRSLJrYf3FAdTA/6B5sjg
         IaVeVfFEhKNrzqkRb4hwKGO11gYxnRk/yFDeSA1/DGr5hPS/+U3vxnUcGRRHUs+gS1z2
         C0F6G/gfXrkRpyrYp9yteekLp3Ex0zWBmziymFko7DBBHZ8k1EyVYMSO9pzkfHI968Qu
         tDXVjAk7PIXH3D88IrorGJq+LJX6891ZH+pxGGPubMAJETXTju3tdr9Idb4PKMEA5wez
         7vRqG0LJHlJiqMQLpcUN8ij2kkaL0SWeq6irbOLie6mSGnZoqkaKL8PDP2NoRVtjDpyX
         0rGw==
X-Gm-Message-State: AOJu0YxeEe6kvxiD37y9yEs3WE98jxI3nigGKXLhZChRE5zyR/7udjrG
	CBCkAQAUIQzO+7gjpuKZVgRDd4e/mzS0OciAMuevdG7rFm6mE+KONB9NaoimOIM=
X-Google-Smtp-Source: AGHT+IHYW288bpwv4Ys/1JSa43FS5a0uAVjBiMt7IcCikQ2XVJQ2hCIzpaOe20sFOr2oSQQstnhnww==
X-Received: by 2002:a50:9346:0:b0:5ce:fa13:2668 with SMTP id 4fb4d7f45d1cf-5cf8fcfbf47mr10976376a12.27.1732025296163;
        Tue, 19 Nov 2024 06:08:16 -0800 (PST)
Date: Tue, 19 Nov 2024 15:08:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v2 3/4] xen/arm: Use vmap_contig instead of __vmap where
 it's possible
Message-ID: <Zzybz2WUejRtl1LW@macbook>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-4-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119085806.805142-4-luca.fancellu@arm.com>

On Tue, Nov 19, 2024 at 08:58:05AM +0000, Luca Fancellu wrote:
> Currently the arm code uses __vmap function in few parts to map
> physically contiguous pages, vmap_contig was introduced recently
> and does the same because it's a wrapper for __vmap, so use the
> latter instead of the direct __vmap function.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

