Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B33668CD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114266.217710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9iZ-0004yT-Bf; Wed, 21 Apr 2021 10:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114266.217710; Wed, 21 Apr 2021 10:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9iZ-0004y4-8J; Wed, 21 Apr 2021 10:04:23 +0000
Received: by outflank-mailman (input) for mailman id 114266;
 Wed, 21 Apr 2021 10:04:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9iY-0004xz-4x
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:04:22 +0000
Received: from mail-wm1-f53.google.com (unknown [209.85.128.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ef2504f-778c-4c01-954c-415579778020;
 Wed, 21 Apr 2021 10:04:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id w186so17322137wmg.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:04:21 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x2sm2803118wrg.31.2021.04.21.03.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:04:20 -0700 (PDT)
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
X-Inumbo-ID: 4ef2504f-778c-4c01-954c-415579778020
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aHHMw379TDjDiNyx9CVK2Ceo7oMZV/w/eTWbijiylQw=;
        b=rDFT+621JdBYztxVZSqkKdYpiYLlH2TIEvVgz9pyZp5l0exkTaUyO/cw6bDNO17NOX
         Wtx/aESS/RUaB7Cv4tfW+nk5mDfibBs5WpEzXV+kEQxHaFXbFbrNsqdC7CyAgM1/Rq3b
         YxsNUghoWG3KAfDUwO4rDzg6Jx1G5Jepnq77PkMMTp6pKcJviyGSyPac7GZp3FsXlU/j
         UmP0PwsaEfqa5aju31NCJIoMNbn65AEDuan862eNwyoGM4TfL2VAp6a2wWrILNk9lrKP
         W4VWwN881v1f/aIoFKgVA6YTwSZD0eETMnverzW1JKibcXlZBc6ZRk246LEq+cw/aMN0
         RQ3g==
X-Gm-Message-State: AOAM532iWTpROh0XENc0cTbC08QAdaVRl+ZgwuM9UoWDttK+25Tt+oqc
	22H+1hsxDxO0PjxiynEApnc=
X-Google-Smtp-Source: ABdhPJxfMVlu4uPFhZiWARfNqkCPU0pyYjbSAfyaeGMoQYFEADoKvPofSijVy/kivFv3eSNOr7XL3A==
X-Received: by 2002:a1c:6184:: with SMTP id v126mr9142014wmb.118.1618999460366;
        Wed, 21 Apr 2021 03:04:20 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:04:18 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Drop TravisCI
Message-ID: <20210421100418.7nyuka557iv6z2qk@liuwe-devbox-debian-v2>
References: <20210421092705.2295-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421092705.2295-1-andrew.cooper3@citrix.com>

On Wed, Apr 21, 2021 at 10:27:05AM +0100, Andrew Cooper wrote:
> Travis-ci.org is shutting down shortly.  The arm cross-compile testing has
> been broken for a long time now, and all testing has now been superseded by
> our Gitlab infrastructure.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

I guess this also needs backporting?

