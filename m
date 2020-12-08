Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E52D2934
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 11:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47323.83798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmaYS-0006TL-FI; Tue, 08 Dec 2020 10:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47323.83798; Tue, 08 Dec 2020 10:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmaYS-0006Sw-CE; Tue, 08 Dec 2020 10:49:12 +0000
Received: by outflank-mailman (input) for mailman id 47323;
 Tue, 08 Dec 2020 10:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tPq0=FM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmaYR-0006Sr-A3
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 10:49:11 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f2b32e3-6fc6-4678-bc87-78d561c3bae6;
 Tue, 08 Dec 2020 10:49:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i9so161387wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 02:49:08 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v20sm1298719wra.19.2020.12.08.02.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 02:49:07 -0800 (PST)
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
X-Inumbo-ID: 6f2b32e3-6fc6-4678-bc87-78d561c3bae6
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SARJCBDALgKrxEAD0MNVA8yh4y1JKPKQxvzqwlnVTpE=;
        b=DscfhaV+AZ2UAUjo2ebZUgBThZCXzSz4Ys0RahKmsxYFz4IyZDjVPK27UX2Ae6ao1a
         XkusBeHqVvnfLWntTwG8pgJkoMk2cv/0aPngJ4tRMXe5vB0SrJfr/oG4WGEL5tRhYMxB
         DMN9Shq6dtfjADNfaAkjVfrmsiL0kFZHuYIUnu2GTkenIK8tFZ5AzRv+hzNz9v1jqmbZ
         sXMQr7Fy/zblTigubp4HrgBfpdBO/pmycfoDaCtPNFyvQqCq68So0wSG/qtEoS+IZvr5
         GItB6NyXfKWcANNnVJTazAMs3ZlfPGVt0V5JNCjc9OwQ5hJOrnkslgwqsbxvQZiO2iEB
         Jarg==
X-Gm-Message-State: AOAM533n5cowtmzQVcfCVqW/wLtbF8Yt4OB/ub3mHx6NSSHTHujxyB1M
	xHvdFwMLQdvweGJN+nMgu0A=
X-Google-Smtp-Source: ABdhPJyOGZi4xWSEmgNgSlxhUraRdKkRNdoVwtaqC2/jITq0vDfZFoapZuSPbNyScw4Fnn5VAl3zUA==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr24232655wrp.339.1607424547720;
        Tue, 08 Dec 2020 02:49:07 -0800 (PST)
Date: Tue, 8 Dec 2020 10:49:05 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: add me as maintainer for tools/xenstore/
Message-ID: <20201208104905.7roijzd3ytictsbf@liuwe-devbox-debian-v2>
References: <20201208103026.28772-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208103026.28772-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 11:30:26AM +0100, Juergen Gross wrote:
> I have been the major contributor for C Xenstore the past few years.
> 
> Add me as a maintainer for tools/xenstore/.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

Thanks for stepping up.

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dab38a6a14..6dbd99aff4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -584,6 +584,13 @@ F:	xen/include/asm-x86/guest/hyperv-hcall.h
>  F:	xen/include/asm-x86/guest/hyperv-tlfs.h
>  F:	xen/include/asm-x86/hvm/viridian.h
>  
> +XENSTORE
> +M:	Ian Jackson <iwj@xenproject.org>
> +M:	Wei Liu <wl@xen.org>
> +M:	Juergen Gross <jgross@suse.com>
> +S:	Supported
> +F:	tools/xenstore/
> +
>  XENTRACE
>  M:	George Dunlap <george.dunlap@citrix.com>
>  S:	Supported
> -- 
> 2.26.2
> 

