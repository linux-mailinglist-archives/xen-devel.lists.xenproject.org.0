Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8091D2C12
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 12:02:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZAgN-0000Pr-A0; Thu, 14 May 2020 10:01:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZsc=64=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jZAgL-0000Pm-SZ
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 10:01:37 +0000
X-Inumbo-ID: e58d6090-95c9-11ea-a464-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e58d6090-95c9-11ea-a464-12813bfff9fa;
 Thu, 14 May 2020 10:01:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f13so1162382wmc.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2020 03:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hpaBJ8k/wS/3dOaZzQwwuKmfoM1Lz+L6HOA3llNZp6g=;
 b=jq0JENzvFyc29P8RiD08BGdKDX2LW5zOc0nSV/IbgfwvsT87+8DChxlZuY2K8KzH+0
 JN5RNQlO/z4Me9cew/CBYOVlLy8Ayl6NjJvMuHzoxsE93oYZGSPxIaAt52ZBZMvpubX/
 J0spnq75s3DT94OgbEaE4+B6iOPL5Pc51KyxjEM7cR2vapZaAMs9fzG1c0cbmgcI/bao
 eNtvoTQq5Xr//JlXhpfBWaM5GTurYoMY+pIqqxsmIfLUsd5rhFkRqVjlFPAS/aNa7e5z
 VTT/CgznryTU1Vgt0Z6Q489XHB+RFPcuhDz7RhzHEdSKdXKNjGNhjk1otwmPDbaDMEyx
 bFJw==
X-Gm-Message-State: AOAM531XuLyc9mUL8mVQwFIzxtSqNvKieTW+JEw5seVV0mQoCST4OAjA
 pEOjPB9Ng5WBjNZ5qQMHml0=
X-Google-Smtp-Source: ABdhPJzj6sKBOsEL8o563s+cwBODl1NfFJXXI3GJ7tYjFnrfXqfA/+yv6JK2vRWqP74c741h8PSBmA==
X-Received: by 2002:a1c:7d43:: with SMTP id y64mr9673774wmc.46.1589450495718; 
 Thu, 14 May 2020 03:01:35 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w15sm14050208wmi.35.2020.05.14.03.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 03:01:35 -0700 (PDT)
Date: Thu, 14 May 2020 10:01:33 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Subject: Re: [PATCH] domain_page: handle NULL within unmap_domain_page() itself
Message-ID: <20200514100133.ne3ed6laazrta3xa@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <a3ddf0c755227a3c742f6b93783c576135a86874.1589384602.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3ddf0c755227a3c742f6b93783c576135a86874.1589384602.git.hongyxia@amazon.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 13, 2020 at 04:43:33PM +0100, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> The macro version UNMAP_DOMAIN_PAGE() does both NULL checking and
> variable clearing. Move NULL checking into the function itself so that
> the semantics is consistent with other similar constructs like XFREE().
> This also eases the use unmap_domain_page() in error handling paths,
> where we only care about NULL checking but not about variable clearing.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Wei Liu <wl@xen.org>

