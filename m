Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CE2DB13B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54437.94560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD69-000321-94; Tue, 15 Dec 2020 16:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54437.94560; Tue, 15 Dec 2020 16:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD69-00031e-5n; Tue, 15 Dec 2020 16:22:49 +0000
Received: by outflank-mailman (input) for mailman id 54437;
 Tue, 15 Dec 2020 16:22:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpD67-00031X-P0
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:22:47 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2681c8cd-97b0-4f8f-82b5-0a06d9ca39e5;
 Tue, 15 Dec 2020 16:22:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 3so19065218wmg.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:22:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j13sm36619380wmi.36.2020.12.15.08.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:22:45 -0800 (PST)
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
X-Inumbo-ID: 2681c8cd-97b0-4f8f-82b5-0a06d9ca39e5
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LPVhR5UAWejAwKJd+I2ZO/5ggdQlOv2pSnWqNxfe7XU=;
        b=lAoCyljHmWu8LGKf4VYevyDtEVfWiuEWxBkw7l4jxKhjLxhd/xEnAtojKeJ5CNs59w
         i/X/AcC7CKmWRmwVxiFf7mw6TNJlmTeqOJtHqP9btPXfH15er0g8++uOHbyNgVtP0T11
         FQlCOfgg0gLqke+UGNJGQFIRXpAQgpQXPlEo+/gcAA1vSsJ59ewkRHYFgwquPhed/x7w
         cuA4S3cRP7eVCzKwuUL0PZRUOkkEZ2QEFPf3ORvy+J77xF3zNBBth2bV4ruv50iB9VsZ
         /7o2kUc/BRMozEsbqKG9Z09fNOqaNLihTC+YWrgKjVfqDgty1s8DCjhb5rhsPPdyb+RY
         Q64Q==
X-Gm-Message-State: AOAM533osW5yPni3JMzO4cX+crEeP1osbv4d0DpkgeZt0yoRgvj/lnpA
	sifkv0l8yPgX/26xfYKtrM8=
X-Google-Smtp-Source: ABdhPJwpAwtMIm6fDqxm9jAFAoS5W2OrNEbLoYH1bx8nwOZywJZFvkTJ4QGl+Zr40CZybgvxjlx+oA==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr33365654wmb.136.1608049366385;
        Tue, 15 Dec 2020 08:22:46 -0800 (PST)
Date: Tue, 15 Dec 2020 16:22:44 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 3/3] tools: add API to work with sevaral bits at once
Message-ID: <20201215162244.mln6xm5qj7pmvauc@liuwe-devbox-debian-v2>
References: <20201209155452.28376-1-olaf@aepfle.de>
 <20201209155452.28376-3-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209155452.28376-3-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Dec 09, 2020 at 04:54:51PM +0100, Olaf Hering wrote:
> Introduce new API to test if a fixed number of bits is clear or set,
> and clear or set them all at once.
> 
> The caller has to make sure the input bitnumber is a multiply of BITS_PER_LONG.
> 
> This API avoids the loop over each bit in a known range just to see
> if all of them are either clear or set.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

I would rather these be introduced along side their callers.

> ---
>  tools/libs/ctrl/xc_bitops.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
> index f0bac4a071..92f38872fb 100644
> --- a/tools/libs/ctrl/xc_bitops.h
> +++ b/tools/libs/ctrl/xc_bitops.h
> @@ -77,4 +77,29 @@ static inline void bitmap_or(void *_dst, const void *_other,
>          dst[i] |= other[i];
>  }
>  
> +static inline int test_bit_long_set(unsigned long nr_base, const void *_addr)

What's wrong with requiring the input addr be const unsigned long *?

