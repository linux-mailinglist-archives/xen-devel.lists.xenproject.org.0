Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1FF251C4A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 17:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAat3-0008I6-Ax; Tue, 25 Aug 2020 15:29:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGji=CD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kAat1-0008I1-JQ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 15:29:23 +0000
X-Inumbo-ID: 88e5ec17-ba21-485c-acd5-3b83623477bb
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88e5ec17-ba21-485c-acd5-3b83623477bb;
 Tue, 25 Aug 2020 15:29:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a5so13170759wrm.6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2020 08:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u4ZpEiWCnNdroFMguJbKDHaQ3UnFEXQTaCW1EjuC6a0=;
 b=Rm+2TLEl7zA+wqCCUPGGo/HnD8h3py4wDtLT5STDAH6CsXfLUButmNPZofyeECKUcu
 RyrcA0U7BBjiyNLlDO8+v88eNhtr1rTX7ZrDPKkafMYc7LzDhB9+UOjp5H4ZLw6+SJ+q
 5Ve2ccCCzM20NyiMnZYndoHQcBZZYpHKvhhHkzOHaWRd4qiCD23K87QNQWZPSKZXccnV
 j207zfidEOgRrsnt2FmiXOQbL8wXijKlD3bjsE1WpCkbbocZnwq1Uc/dIIWlq/z8uqZy
 H8hrtpUkpYKcENbqbt4IXbIdhRc7Pv32iWouhzF3+jCtCGeJVLV6jCNE5XCzjOXCe9jm
 idEA==
X-Gm-Message-State: AOAM532dz9jJfa8UeycM0HcbxT4RBNnXBA2qlzXAkjVUQCSZ0EjestSC
 06SbeGDvVooG11+I84GsX2g=
X-Google-Smtp-Source: ABdhPJwhN9orZy1Ogc4D6Oi71XWrFoIBcDuh8KEwwHSyEPrEpHBaQxOUDlqQ5JlzzUNL8Xkqrz4PdQ==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr11935926wro.164.1598369361805; 
 Tue, 25 Aug 2020 08:29:21 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t14sm35983399wrg.38.2020.08.25.08.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 08:29:21 -0700 (PDT)
Date: Tue, 25 Aug 2020 15:29:19 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] make better use of mfn local variable in free_heap_pages()
Message-ID: <20200825152919.iwzc3n3fdoslemx6@liuwe-devbox-debian-v2>
References: <e129d355-f0ba-eb1c-9755-f6f38b9212e4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e129d355-f0ba-eb1c-9755-f6f38b9212e4@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Please put "xen: " in the subject line.

On Tue, Aug 25, 2020 at 02:31:12PM +0200, Jan Beulich wrote:
> Besides the one use that there is in the function (of the value
> calculated at function entry), there are two more places where the
> redundant page-to-address conversion can be avoided.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

> 
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1380,7 +1380,7 @@ static void free_heap_pages(
>  {
>      unsigned long mask;
>      mfn_t mfn = page_to_mfn(pg);
> -    unsigned int i, node = phys_to_nid(page_to_maddr(pg)), tainted = 0;
> +    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
>      unsigned int zone = page_to_zone(pg);
>  
>      ASSERT(order <= MAX_ORDER);
> @@ -1417,7 +1417,7 @@ static void free_heap_pages(
>          default:
>              printk(XENLOG_ERR
>                     "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
> -                   i, mfn_x(page_to_mfn(pg + i)),
> +                   i, mfn_x(mfn) + i,
>                     pg[i].count_info, pg[i].v.free.order,
>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
>              BUG();

