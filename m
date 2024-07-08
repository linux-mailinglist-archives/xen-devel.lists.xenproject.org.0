Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B792A7FA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 19:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755524.1163909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQrsG-00055s-Kz; Mon, 08 Jul 2024 17:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755524.1163909; Mon, 08 Jul 2024 17:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQrsG-00053p-Hc; Mon, 08 Jul 2024 17:10:00 +0000
Received: by outflank-mailman (input) for mailman id 755524;
 Mon, 08 Jul 2024 17:09:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQrsF-00053j-8X
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 17:09:59 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e65d24d0-3d4c-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 19:09:57 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-79ef8fe0e90so208982785a.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 10:09:56 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f18ff695dsm10162985a.14.2024.07.08.10.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:09:55 -0700 (PDT)
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
X-Inumbo-ID: e65d24d0-3d4c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720458596; x=1721063396; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WX9HGNqyT895VmKzQ0BsOnL/b6zmLY23I1w48g1ZhRE=;
        b=kOVhvZrtONcGM896HDaXI5NGhFJY6yWyFDVqvol5kjVTxbM9lhn3Iltg3GxEOd9x4f
         ctJLwo1D3PMmUWf1KxlcGfhy7XzHnGL38AlMTAB9026nMyAtdRg4pK2wJV/kHL8MhZ+g
         7F13j88hjhrPXPh7tA7Oro2/+vLpMBHrQEJXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458596; x=1721063396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WX9HGNqyT895VmKzQ0BsOnL/b6zmLY23I1w48g1ZhRE=;
        b=a47z15GZChY38wQhh9PmQaWelHYZlP7a+2sfuETxKOByLxNRs6ti9mWD0w4eHHBGZ7
         iZ9PNayrIdEv8qSKCre61hKsUiFU5Tw59riezrDY4g2EZFCwaeVU6Fudf9uWsqm573aa
         kH17+0QzBxl/kh+8ocBseCkQxrbTRuKSZAaooDZEeAFXQrKSAoD055d0VKAF66e7UM80
         6/0272iihb8//4tecso12CfxxnqkYVyTksNi8T2RzW4Ctsl5/tEBMhrWAX4rTTYOgbCC
         862a9YWi9zqGxLZM3Ma4xt24RhYeNJq9Rhu7I0hCn4YZihXBtkOKpA+yebD0MkqO1KSC
         x5Rw==
X-Gm-Message-State: AOJu0YyedgR8N1bcyS9mMRqbrQe7kPFYGdMkmwgcUq1i2l/AbE93XgYH
	kRXFWMBnRb+N1m0+cdqwf0g0CMTHJ6Nx8pAt6NZ7DZAX/WUYuPYzPF2t+JkcnxA=
X-Google-Smtp-Source: AGHT+IHt48Vwzg2wcb43HIAznH/r75Pd+DvBtiZyGrb+tGAGHKq4HbOYRm1OH8sKhy9wFX85Qc1Zxw==
X-Received: by 2002:a05:620a:9c2:b0:79f:7b8:4950 with SMTP id af79cd13be357-79f19ab8cb0mr15144785a.51.1720458595776;
        Mon, 08 Jul 2024 10:09:55 -0700 (PDT)
Date: Mon, 8 Jul 2024 19:09:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 v2 3/6] CI: Refresh the Coverity Github Action
 configuration
Message-ID: <ZowdXsQiYry-ZiCj@macbook.local>
References: <20240705152037.1920276-4-andrew.cooper3@citrix.com>
 <20240708154228.2177924-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708154228.2177924-1-andrew.cooper3@citrix.com>

On Mon, Jul 08, 2024 at 04:42:28PM +0100, Andrew Cooper wrote:
> Update to Ubuntu 24.04, and checkout@v4 as v2 is deprecated.
> 
> The build step goes out of it's way to exclude docs and stubdom (but include
> plain MiniOS), so disable those at the ./configure stage and simplify the
> build step somewhat.
> 
> Refresh the package list.  libbz2-dev was in there twice, and e2fslibs-dev is
> a a transitional package to libext2fs-dev.  I'm not aware of libtool ever
> having been a Xen dependency.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

