Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595DA1CF6E8
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYVlC-0000Cg-Lo; Tue, 12 May 2020 14:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uja8=62=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jYVlB-0000Ca-EG
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:19:53 +0000
X-Inumbo-ID: a411d25a-945b-11ea-a2b1-12813bfff9fa
Received: from mail-wm1-f43.google.com (unknown [209.85.128.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a411d25a-945b-11ea-a2b1-12813bfff9fa;
 Tue, 12 May 2020 14:19:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m24so12358552wml.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 07:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JNzLOzK3zqQaTGgwDwdkMFE+RsO3Jbe8dnugUcCb/oY=;
 b=XKPbxyxPfau+HBUBk95H4uiYMArzv98df4gIzumIIQLjJ/8i/eghbF2frnsTzqMvm9
 ALvtv4upYXohoI870I7YqrPRXEG+ZuNmlaqWYQM+z0T9Uxk9+dz2CXixHrbqxGNBU8Ed
 88wsSuYhmdrrJAAQBQBHMt8alojtlhpeMOOjkaWKGmzodEcpo8PQ5avJLQHfXETm2bi/
 xqyA+VsdNJfOExSvNxYu9M/ZV4sMAMni+rsOg0qfbDr++anHyvokqCyl7j6WNvTS3dA4
 bBzWlauhfRFbb0ZkmuOwGOEMfGV5KwfocRdSYmdyn1fB6wZfY4OYw//cTzkzl1bnY/ks
 bfNg==
X-Gm-Message-State: AGi0PuazHb6zzG15BlxNnAzVmptbH7p6/yRBUoc1C0ONlLeJMj+OAYTL
 Qthfv+jgZATOEnbJpEJPd8U=
X-Google-Smtp-Source: APiQypKxUSY/Ei5/fk56Fi65Ht9AesMwP09vvQDI9OOSdiFzHHK4q51a+KLd+JP9XP9c6LLn/d9SAw==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr40139842wmi.159.1589293190080; 
 Tue, 12 May 2020 07:19:50 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d1sm14095035wrc.26.2020.05.12.07.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 07:19:49 -0700 (PDT)
Date: Tue, 12 May 2020 14:19:47 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: use of "stat -"
Message-ID: <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 12:58:46PM +0200, Jan Beulich wrote:
> Hello,
> 
> now that I've been able to do a little bit of work from the office
> again, I've run into a regression from b72682c602b8 "scripts: Use
> stat to check lock claim". On one of my older machines I've noticed
> guests wouldn't launch anymore, which I've tracked down to the
> system having an old stat on it. Yes, the commit says the needed
> behavior has been available since 2009, but please let's not forget
> that we continue to support building with tool chains from about
> 2007.
> 
> Putting in place and using newer tool chain versions without
> touching the base distro is pretty straightforward. Replacing the
> coreutils package isn't, and there's not even an override available
> by which one could point at an alternative one. Hence I think
> bumping the minimum required versions of basic tools should be
> done even more carefully than bumping required tool chain versions
> (which we've not dared to do in years). After having things
> successfully working again with a full revert, I'm now going to
> experiment with adapting behavior to stat's capabilities. Would
> something like that be acceptable (if it works out)?

Are you asking for reverting that patch?

Wei.

> 
> Jan

