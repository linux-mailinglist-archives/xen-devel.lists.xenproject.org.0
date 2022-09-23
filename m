Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620E25E78A2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 12:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410699.653820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgD4-0005po-8J; Fri, 23 Sep 2022 10:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410699.653820; Fri, 23 Sep 2022 10:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgD4-0005mv-5X; Fri, 23 Sep 2022 10:47:06 +0000
Received: by outflank-mailman (input) for mailman id 410699;
 Fri, 23 Sep 2022 10:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NOxE=Z2=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1obgD2-0005mp-UK
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 10:47:04 +0000
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d170dfb-3b2d-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 12:47:00 +0200 (CEST)
Received: by mail-wm1-f50.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso2957181wmq.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 03:47:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003a5537bb2besm2381730wmb.25.2022.09.23.03.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 03:47:02 -0700 (PDT)
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
X-Inumbo-ID: 0d170dfb-3b2d-11ed-9374-c1cf23e5d27e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=C9Ixt7ZPmjv3wabGBTiF81Yt9jGnlGxSuwbQ49syOEg=;
        b=GTMjdgjfYygypxuBHA5ml07/mFk6rpPRYjvrqeklPTFWx6HnEWuvxFSQ7DgSetn6eL
         5xRh+2gI0/pDLOnWihkhBYwu5EiM2gPzXYzwvh7WWK7viC+A823O4c3BAMDvFSglONRT
         8PMv93Rg7jrfHl967H9ZNM2FkzV2yN+kvcy7QIWdvYpEXzaMjxMhnfNhKEWBYxPxl0FB
         kxV1nVUPp2J1iIgsN8Q08PJFFfxQZVAXvkD6dUU214Z+BUme7NwXbW6Vvz5WuwZgq6Xw
         MQ4CgSKKJnrJizcngwwVnuNR/AlEq8p/y2uMGMzG7ENbIjmemXa5WvB2hU+/FDSk08N/
         SoSg==
X-Gm-Message-State: ACrzQf339ZWDCE5GBeHII5KnoldzrlUa6zch4XMKOJQYJSfDLSOxeUUI
	SF388f5/H7jVnhkQJCqS8M0=
X-Google-Smtp-Source: AMsMyM58sinn3dOD8Ey7/0k7+hRpfbrgHSF5AozbhZNVJTKa3qZA7sr92yRjb4LPdGvjsnF2Q7YodA==
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id r5-20020a05600c35c500b003b4bf50f84amr5289326wmq.22.1663930023269;
        Fri, 23 Sep 2022 03:47:03 -0700 (PDT)
Date: Fri, 23 Sep 2022 10:47:00 +0000
From: Wei Liu <wei.liu@kernel.org>
To: cgel.zte@gmail.com
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] xen-netback: use kstrdup instead of open-coding it
Message-ID: <Yy2OpADjx2L7WF7A@liuwe-devbox-debian-v2>
References: <20220921021617.217784-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921021617.217784-1-chi.minghao@zte.com.cn>

On Wed, Sep 21, 2022 at 02:16:17AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> use kstrdup instead of open-coding it.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Acked-by: Wei Liu <wei.liu@kernel.org>

