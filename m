Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D322630AF2B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 19:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80080.146184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6duJ-0001rz-ON; Mon, 01 Feb 2021 18:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80080.146184; Mon, 01 Feb 2021 18:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6duJ-0001ra-Kw; Mon, 01 Feb 2021 18:26:39 +0000
Received: by outflank-mailman (input) for mailman id 80080;
 Mon, 01 Feb 2021 18:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HCN7=HD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l6duI-0001rV-Oj
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 18:26:38 +0000
Received: from mail-wm1-f52.google.com (unknown [209.85.128.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3689bfb6-838f-498a-b1e0-3a8918503333;
 Mon, 01 Feb 2021 18:26:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c127so133192wmf.5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 10:26:37 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q7sm28880579wrx.18.2021.02.01.10.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 10:26:36 -0800 (PST)
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
X-Inumbo-ID: 3689bfb6-838f-498a-b1e0-3a8918503333
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jJEaWxu0zKpeLIV6D0wE2eRdohtKy6L9pNjk+x70Wp8=;
        b=fvgfKXgL5QCjd/K3jX59LGwkQas2GKUvdENCDY4K5GYmsMjKDYZ/q2RhOQGMKd8BAp
         diQAwvN6n+xvLLjZjXQFhF5mtGuPIVVddrPz+Z1Zw/jKbXjJ19yC5f6w+GRPee1QlEl4
         DVSwINqqJZL+w/sfh87MYwPxJ3YRnG+AeBDJqOJiWSgcnjqofkV8o9s8dK82n7FXQmge
         4fQ7Qs5LS+ex4JRUD9KsA/bSmre0PKHvaYnbrrABVWxjEf0DmyjbX70riyds8GfnLvPI
         uIKsV295fPcnEEXPpHg6PpESYXOpitTQhaTYNpPIuXlcligQuKS9v20jm+/VWeoQd+vQ
         EBkQ==
X-Gm-Message-State: AOAM530oxfs6ADVHJFYWbZmwdu1PnIJ9mhAhSkscSz7aJWZ5eO2M9EwX
	Skfxc5XLpKum3n130EuHo0U=
X-Google-Smtp-Source: ABdhPJzsjSF9AItcHM0JM82B83x8qRjwGQNpPEQp9FJUe0TfnMExtwpkwZmaZMqVXvFWwiz5Dq0reQ==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr172766wmf.120.1612203997162;
        Mon, 01 Feb 2021 10:26:37 -0800 (PST)
Date: Mon, 1 Feb 2021 18:26:35 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] memory: fix build with COVERAGE but !HVM
Message-ID: <20210201182635.kqtdth6zwtvergbu@liuwe-devbox-debian-v2>
References: <84a05b9e-a0c3-7860-4a59-a591a873b884@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84a05b9e-a0c3-7860-4a59-a591a873b884@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Feb 01, 2021 at 05:20:54PM +0100, Jan Beulich wrote:
> Xen is heavily relying on the DCE stage to remove unused code so the
> linker doesn't throw an error because a function is not implemented
> yet we defined a prototype for it.
> 
> On some GCC versions (such as 9.4 provided by Debian sid), the compiler
> DCE stage will not manage to figure that out for
> xenmem_add_to_physmap_batch():
> 
> ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
> /xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
> /xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated
> to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
> prelink-efi.o: in function `xenmem_add_to_physmap_batch':
> /xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
> make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
> make[2]: *** Waiting for unfinished jobs....
> ld: /xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' isn't defined
> ld: final link failed: bad value
> 
> It is not entirely clear why the compiler DCE is not detecting the
> unused code. However, cloning the check introduced by the commit below
> into xenmem_add_to_physmap_batch() does the trick.
> 
> No functional change intended.
> 
> Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Wei Liu <wl@xen.org>

