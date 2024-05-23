Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D458D8CCD0F
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728088.1132853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA2ug-0008DT-Ls; Thu, 23 May 2024 07:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728088.1132853; Thu, 23 May 2024 07:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA2ug-0008Bx-J0; Thu, 23 May 2024 07:30:58 +0000
Received: by outflank-mailman (input) for mailman id 728088;
 Thu, 23 May 2024 07:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA2uf-0008BO-3y
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:30:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6474cd23-18d6-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:30:56 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4202ca70287so10515835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 00:30:56 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fb9840sm16671255e9.42.2024.05.23.00.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:30:55 -0700 (PDT)
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
X-Inumbo-ID: 6474cd23-18d6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716449455; x=1717054255; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJIuqIYDJT5oOIvrbW+DQrke5YDIdSv4a9t/Q3ZFSuQ=;
        b=XlgEu8pHZXmvsFpQi1eKBb/KRZ3oDoKWLKZMcv1i59qFoMBocLfpcz8YkoruAo1SnT
         j0gedZYv9wqPnEYPOrHAFuEbLNe0c/Ziwp7ggbGLypB8cIwilcVwwGdf3ozLy9ASgiUE
         a3W6eYEjbC3oxLKFKxGIsDFmBgccLpXu8+7M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716449455; x=1717054255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJIuqIYDJT5oOIvrbW+DQrke5YDIdSv4a9t/Q3ZFSuQ=;
        b=ksQu0u3d8tcXFU8afGUgzr0e2eKKRPdPCpQ3LqnwbiSX7Lvae3H7d9kOiZEGw0UwXX
         1SdP2+6Pr2SXSSaKIZYfvoUGxHAB7h02LIC3P3hN3GaDusHtzAL48/LPMsVIrVrMwHib
         67m8h6Z8xa/g5aRC4MusdIaUuBhHAcFXKOFT6DS9kWKGj2k99ulGTl76uNa5MPm8SEYL
         Hq9YARRIPscl1+Ix/UCsYH6t7u/PoDH53AmJauPAOFxwmtHqu3S/47+prGY1GYiqBfbf
         I9x+Za9pG40EvhrZ1Cvtdh3qiLUBpng9f8ckghqULBrJ9mea1b3my6QNVpFc5qmTv0vN
         blEQ==
X-Gm-Message-State: AOJu0Yy22jlRgLmg4nQchrqcv49AbRN2wXNdiDSSVNblXWKHMHAn+rLH
	Ar8J0vW+2S63a7B9D0EH5arfh2/iTilJq0z9npnBF4OWpMfu2GujfKNsJ5CULYo=
X-Google-Smtp-Source: AGHT+IHQCQSYp4Z81XvVBIY+IyRiFx0DBqXAXNZ4RvRg6SyFQOIvJSOdWDkhC8UEEKdjztc3f4DWPw==
X-Received: by 2002:a05:600c:4f4a:b0:421:20d:e3a4 with SMTP id 5b1f17b1804b1-421020de48dmr9873995e9.17.1716449455337;
        Thu, 23 May 2024 00:30:55 -0700 (PDT)
Date: Thu, 23 May 2024 09:30:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v16 3/5] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <Zk7wrlMJjlrBJx6p@macbook>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-4-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522225927.77398-4-stewart.hildebrand@amd.com>

On Wed, May 22, 2024 at 06:59:22PM -0400, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

