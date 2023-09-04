Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD3791A0D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 16:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595284.928799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdAvV-0007Pe-Ak; Mon, 04 Sep 2023 14:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595284.928799; Mon, 04 Sep 2023 14:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdAvV-0007NK-84; Mon, 04 Sep 2023 14:51:41 +0000
Received: by outflank-mailman (input) for mailman id 595284;
 Mon, 04 Sep 2023 14:51:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6iaL=EU=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qdAvU-0007NE-9d
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 14:51:40 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b23a40e-4b32-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 16:51:36 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26fe4997871so601935a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Sep 2023 07:51:35 -0700 (PDT)
Received: from leoy-huanghe ([98.98.49.29]) by smtp.gmail.com with ESMTPSA id
 5-20020a17090a19c500b0026596b8f33asm9857731pjj.40.2023.09.04.07.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 07:51:33 -0700 (PDT)
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
X-Inumbo-ID: 8b23a40e-4b32-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693839094; x=1694443894; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMXteDfS81V7Qlzz5HpuyJ9OfkKMENRaE66CVAPvD58=;
        b=lBM8sgRw9+xziQTLTJYti5+yPtZTRNcnFZW3UdlaAzgRlhNhWxKZrKHrso16tTm/wI
         kGu+j3lwpmTmwdo3KeRVpeBbuzt3rQoAh9ufgB+s7qGs7/J9G/wDwXhVmZl9CTI2a1b9
         f0KqQrSRmBiNac5byuerut60zEnO4TfGkATaPy0W5tNQ2tceTyUjRY2zuBj6oLstcZQO
         HP9SKKQlUtTqk5w0gOXJYoEKsmWThJoLSaR7MToilJAZgztNORhYZyGK2mBRG/COfTW4
         jLDLNY8vIMNjM+/lnif66nn6+er75k/0GTLIyUJpMgEYYbMJoKJXsJVQJsvqBtePJp/h
         tiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693839094; x=1694443894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMXteDfS81V7Qlzz5HpuyJ9OfkKMENRaE66CVAPvD58=;
        b=dwllEyhWYXzqBqU1YsMN+fSKnW143qlW8iqYszuCo0QNMHe8Tl1SW0VR5trBkiqtf5
         wyR707tMozwvALIig29DuhiGFAS9/3Ndusp+pJ1/7GyLt3/t00YwmGDB86Lnh4z7Wl6z
         A4Wp9GNxjzgEzNOzTNiZ9bHDt6JxZu/2Qqyt4Z7qYn6tl+ZnxA/BPWXRjk2XgOFekiJv
         zebs9CUHsC3xdGuGNvs/kHyZgQp3BmUfK7VFD9/gXcihaA7PnSBlgdPDReO5jezE+n8K
         1w2JserfPSTa50dU//oWnp/6LaaYU8ahbJrVt4Tbq2bLUeB0NFcG5WrHhg6JbJpe1OUG
         zi+g==
X-Gm-Message-State: AOJu0YzufMYPiX/yB99O8u2fMram8sjn0DDuPsdkfRpx/PwEtJRPtDqX
	VYYrAn/LfV3w0fKR45zxc49PvA==
X-Google-Smtp-Source: AGHT+IHtkuS3ZlkzSMGPsrHQjZV/cG8KYJb1TgngMVovIqfXtTZUYUP8dFm0RLYCaPNsmFpjW1orQg==
X-Received: by 2002:a17:90b:909:b0:268:2500:b17e with SMTP id bo9-20020a17090b090900b002682500b17emr7508664pjb.23.1693839094310;
        Mon, 04 Sep 2023 07:51:34 -0700 (PDT)
Date: Mon, 4 Sep 2023 22:51:30 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH v1 2/2] xen/arm: Enlarge identity map space to 127TiB
Message-ID: <20230904145130.GC114383@leoy-huanghe>
References: <20230831110107.2747633-1-leo.yan@linaro.org>
 <20230831110107.2747633-3-leo.yan@linaro.org>
 <338BB8BD-5B22-4201-8411-4836B5768AF4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <338BB8BD-5B22-4201-8411-4836B5768AF4@arm.com>

Hi Bertrand,

On Mon, Sep 04, 2023 at 01:55:12PM +0000, Bertrand Marquis wrote:
> Hi Leo,
> 
> > On 31 Aug 2023, at 13:01, Leo Yan <leo.yan@linaro.org> wrote:
> > 
> > On some platforms, the memory regions could be:
> > 
> >  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
> >  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
> >  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
> >  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> > 
> > In this case, the Xen binary is loaded above 2TB, so Xen fails to boot
> > up due to the out of the identity map space.
> > 
> > This patch enlarges identity map space to 127TiB, which can support the
> > memory space [0x0 .. 0x00007eff_ffff_ffff], thus it has flexibility for
> > support different platforms.
> > 
> > Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> > Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> This is not based on the current status of staging where this part of the
> code was modified.
> 
> Currently Xen virtual address is at 2TB and the extension you are making
> will potentially make it possible to load Xen at 2TB which will clash for the
> identity mapping handling in Xen.

I will check the stage code if this patch will introduce any clash
with the identity mapping handling.

> Please rebase on the latest staging and check there how you can do as
> this patch if rebased on staging right now with rightfully end in a compilation
> error.

Sure, I will rebase on the latest staging branch.

Thank you for suggestions.

Leo

