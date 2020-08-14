Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597D244C9C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 18:26:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6cVo-0005Jh-DK; Fri, 14 Aug 2020 16:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iRrF=BY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k6cVm-0005Jc-UL
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 16:24:58 +0000
X-Inumbo-ID: 76c4b7e5-f176-4a71-8ff7-f18813dc7b84
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76c4b7e5-f176-4a71-8ff7-f18813dc7b84;
 Fri, 14 Aug 2020 16:24:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a14so8862992wra.5
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2020 09:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=obTHsDcwlphCGsYgL25btq5F/gJ6Ly2B/xwBrO0x0J4=;
 b=bkCKcLmh4H8ymd3evacSW/b00JNY0l4ACdURpjc5rlBcWnqHqRcrFSREUjjSjBbV1r
 +ms1F9aXck7JTryuicS9Rydx+SZpN+W89JRmrrPbGyuUxw6tcIFoVH5hD0QLt3dMNmTL
 gyVYu46/us40yquBnKOcYH8tjoUjYjOUKircJHccT8VvPzgu6AYpcigLgeLjMw01i022
 VdySeoNNh0Qdbr4CQscWgm+G92ZD0RbIb2VIuhp7kHoVgoTGloMburiCFCUMAUTYmni9
 NwPqST7JyTvDGH4NOHB4bt5GBezymVBNVO3uaOSOqX615JF238CkaQ4tFQwvmaURYayV
 o20A==
X-Gm-Message-State: AOAM5310JO1cJzyBZPTwGTZFkvV/8WQajeNkFL+isjVWVxSHxJKf5QYA
 djuJylvez/fWgmp/UgFg3uk=
X-Google-Smtp-Source: ABdhPJzFU7+lsu+hKUN/h0KWzRz88DnophmINsn23iOf5HpbtlmqR9GEw2oqoN9P5bPqFggQZ2kF5g==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr3297314wrm.113.1597422297106; 
 Fri, 14 Aug 2020 09:24:57 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q5sm16046568wrp.60.2020.08.14.09.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 09:24:56 -0700 (PDT)
Date: Fri, 14 Aug 2020 16:24:54 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/8] public/io/netif: specify MTU override node
Message-ID: <20200814162454.o6q3ftwkhuns4wzw@liuwe-devbox-debian-v2>
References: <20200811080202.31163-1-paul@xen.org>
 <20200811080202.31163-2-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811080202.31163-2-paul@xen.org>
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

On Tue, Aug 11, 2020 at 09:01:55AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> There is currently no documentation to state what MTU a frontend should
> adertise to its network stack. It has however long been assumed that the
> default value of 1500 is correct.
> 
> This patch specifies a mechanism to allow the tools to set the MTU via a
> xenstore node in the frontend area and states that the absence of that node
> means the frontend should assume an MTU of 1500 octets.
> 
> NOTE: The Windows PV frontend has used an MTU sampled from the xenstore
>       node specified in this patch.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Wei Liu <wl@xen.org>

