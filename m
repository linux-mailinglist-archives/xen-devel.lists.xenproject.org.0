Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5948730FB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 09:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688986.1073847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhmqe-0006zG-1z; Wed, 06 Mar 2024 08:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688986.1073847; Wed, 06 Mar 2024 08:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhmqd-0006wU-VL; Wed, 06 Mar 2024 08:41:59 +0000
Received: by outflank-mailman (input) for mailman id 688986;
 Wed, 06 Mar 2024 08:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCvN=KM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhmqc-0006wM-Gn
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 08:41:58 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 638b389e-db95-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 09:41:56 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6906a7870f3so14165126d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 00:41:56 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 om13-20020a0562143d8d00b0069049135a69sm7023441qvb.118.2024.03.06.00.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 00:41:55 -0800 (PST)
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
X-Inumbo-ID: 638b389e-db95-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709714515; x=1710319315; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gRA45BD+xOCjZlCt+0rrl0MG9mC7LmUmAHQuHFIET2w=;
        b=eXBonDp4Et2PjJqPej77X+FwTC6dLQuPDiswoSzFMXH5v5aYFNGxda8V97BpBGahz4
         FrqMTJHdZalvg3gce0CCH2XknChE890hq0GyHscMKN9RqHF41R1zz9i7dl9p/ADcW0Vb
         ZrGzzRKXeMhgUzj3g+z95Drj0CEVI3ohaIi6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709714515; x=1710319315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRA45BD+xOCjZlCt+0rrl0MG9mC7LmUmAHQuHFIET2w=;
        b=Y7gHvJHQJXnLFyhbXNUEN2UBWMe4ywSGC8cmaifA/wZzXq6mFIA1GngFOuPYgbyjH2
         XQywxapJIixZx0T/j+dyMPxaAi612HqvqIfbEJ8u8fsFQ8o+o2MnoemVFG1bXPpLV61z
         esFNyTFpjekQ6NHP+ar60+K0hPFiJaFa2aXctr6n7nBLwLYRo3mToDhMQlql8f59LKHP
         UUgBw+fiRaG7RXQ41IjKZc4go7csg0wm79P1lYULGGajIGk5dapOmur6qsZM6AHqm9tE
         ZloYix5NyPeUd+OS9gYnfiSKG0e/82zyejpcdNfA6qzt/hPfsatP+hFQrkC0yqO4BZze
         kKQA==
X-Gm-Message-State: AOJu0YyfqfKTSbdsSh/g79I7YhfOSxNYJyaKGqNYLD2x8rIGM0vPRpMt
	1agCq8iagQNj/zEPGUtP8h7ADWNgBU8iKcu2ZzNOE/kFRmDP1RykpsF3qjqtxjw=
X-Google-Smtp-Source: AGHT+IHpHaaRiPnv86gpjeI/vrv1bQdEaUCNhyFGxCmZwrQz3mpvQ2u7eoPrR2nhhxxk28dsqfwmAw==
X-Received: by 2002:a05:6214:8ea:b0:690:4deb:3aa5 with SMTP id dr10-20020a05621408ea00b006904deb3aa5mr4141781qvb.42.1709714515606;
        Wed, 06 Mar 2024 00:41:55 -0800 (PST)
Date: Wed, 6 Mar 2024 09:41:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: flyingpenghao@gmail.com
Cc: xen-devel@lists.xenproject.org, Peng Hao <flyingpeng@tencent.com>
Subject: Re: [PATCH]  xen/blkback: use kmap_local_page()
Message-ID: <ZegsUUDfgNg3mzEw@macbook>
References: <20240306051548.90954-1-flyingpeng@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240306051548.90954-1-flyingpeng@tencent.com>

On Wed, Mar 06, 2024 at 01:15:48PM +0800, flyingpenghao@gmail.com wrote:
> From: Peng Hao <flyingpeng@tencent.com>
> 
> From: Peng Hao <flyingpeng@tencent.com>
> 
> Use kmap_local_page() instead of kmap_atomic() which has been
> deprecated.
> 
> Signed-off-by: Peng Hao <flyingpeng@tencent.com>
> ---
>  drivers/block/xen-blkback/blkback.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
> index 4defd7f387c7..cce534f43292 100644
> --- a/drivers/block/xen-blkback/blkback.c
> +++ b/drivers/block/xen-blkback/blkback.c
> @@ -937,8 +937,8 @@ static int xen_blkbk_parse_indirect(struct blkif_request *req,
>  		if ((n % SEGS_PER_INDIRECT_FRAME) == 0) {
>  			/* Map indirect segments */
>  			if (segments)
> -				kunmap_atomic(segments);
> -			segments = kmap_atomic(pages[n/SEGS_PER_INDIRECT_FRAME]->page);
> +				kunmap_local(segments);
> +			segments = kmap_local_page(pages[n/SEGS_PER_INDIRECT_FRAME]->page);

Don't you need to also switch to kunmap_local() then instead of
kunmap_atomic()?

Thanks, Roger.

