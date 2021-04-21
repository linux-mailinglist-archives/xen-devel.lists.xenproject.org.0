Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785F3366925
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114382.217978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA3z-0000vZ-8p; Wed, 21 Apr 2021 10:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114382.217978; Wed, 21 Apr 2021 10:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA3z-0000vD-5j; Wed, 21 Apr 2021 10:26:31 +0000
Received: by outflank-mailman (input) for mailman id 114382;
 Wed, 21 Apr 2021 10:26:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZA3x-0000v7-Cr
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:26:29 +0000
Received: from mail-wr1-f46.google.com (unknown [209.85.221.46])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62e4fc4a-6bea-474e-8c98-387c39aa7cea;
 Wed, 21 Apr 2021 10:26:28 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j5so39825509wrn.4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:26:28 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h5sm1720079wmq.23.2021.04.21.03.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:26:27 -0700 (PDT)
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
X-Inumbo-ID: 62e4fc4a-6bea-474e-8c98-387c39aa7cea
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sgHPJNd6yt4X4FpIxBb4H3ocAUbJEf7Rkftjj8J3SHw=;
        b=AIONHD+Owf1ra7b5bK03pshnr8qcPgE87N+Fh6JVtDDjBHvbZSzxyaTPbizAsaJMWq
         X9on544f/AO0B2W1IrtMtaRvCkRN11AcpPhnmbB+WRIL4FdIQlLRBjTIAlKweVL5RBqn
         tiZgsIXIjrm4YnlcGgKsrHpdnjBJUnGjzlMB8QGchPhvdHz4lDInMrUhTU/EqlqvEy2V
         A9ZDiQjkBWXGEesgAKOYcXHFlgCGckYHlKaLcWjDoK9r9mu3H1tcSjxYrCc2TSw9o65m
         Lh8gETrBZWUrbIbjKpJmiTnhl/+FsO6nQ4r1mulkg6hCn2ud0Gvwqdu8DaBb3SPDZW8M
         XgXA==
X-Gm-Message-State: AOAM533uKi4gBIbXYXdFYxQCK0THLlmfiZ9Gmd6dgwGH0LaApjYf5xVF
	CbvJXJlFcEeq8+HqpPpzDl4=
X-Google-Smtp-Source: ABdhPJzHtgVsS+uaCJry8RNZiANCHI4lQOR4x+cBpT7Y8fjOZ5/s4FUDmtuKqK6XCe1LoEFwaW9XQQ==
X-Received: by 2002:adf:f990:: with SMTP id f16mr26200263wrr.312.1619000787859;
        Wed, 21 Apr 2021 03:26:27 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:26:26 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4] tools: create libxensaverestore
Message-ID: <20210421102626.ilsm4vaiyn2uvkyc@liuwe-devbox-debian-v2>
References: <20210415131138.8709-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415131138.8709-1-olaf@aepfle.de>

On Thu, Apr 15, 2021 at 03:11:38PM +0200, Olaf Hering wrote:
> Move all save/restore related code from libxenguest.so into a separate
> library libxensaverestore.so. The only consumer is libxl-save-helper.
> There is no need to have the moved code mapped all the time in binaries
> where libxenguest.so is used.
> 
> According to size(1) the change is:
>    text	   data	    bss	    dec	    hex	filename
>  187183	   4304	     48	 191535	  2ec2f	guest/libxenguest.so.4.15.0
> 
>  124106	   3376	     48	 127530	  1f22a	guest/libxenguest.so.4.15.0
>   67841	   1872	      8	  69721	  11059	saverestore/libxensaverestore.so.4.15.0
> 
> While touching the files anyway, take the opportunity to drop the
> reduntant xg_sr_ filename prefix.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

