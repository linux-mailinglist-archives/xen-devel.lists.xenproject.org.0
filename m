Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6491F2D14FE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46775.82918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIiK-0005NQ-5A; Mon, 07 Dec 2020 15:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46775.82918; Mon, 07 Dec 2020 15:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIiK-0005N1-1p; Mon, 07 Dec 2020 15:46:12 +0000
Received: by outflank-mailman (input) for mailman id 46775;
 Mon, 07 Dec 2020 15:46:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN+h=FL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmIiH-0005Mw-Tf
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:46:09 +0000
Received: from mail-wm1-f53.google.com (unknown [209.85.128.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14b4345b-a6f6-43ad-8ec0-a0b6dc3a8a44;
 Mon, 07 Dec 2020 15:46:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c198so11892149wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:46:09 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q1sm15426803wrj.8.2020.12.07.07.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:46:07 -0800 (PST)
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
X-Inumbo-ID: 14b4345b-a6f6-43ad-8ec0-a0b6dc3a8a44
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gZqI8/dnzfZY7IWPMn40GMkW9Jdbsk89hKKk2ZqlQfc=;
        b=dbsuQAMHFllzAuGY5kXp4/PZb1quF2Q3zhCy42IpX5u2cxE7ermvqLWKS81kZ2aSdh
         liEx5yotj7PpyDe9ZvX0QzrR5f+BoME8JR963DX6RQwEHxQAXgIOR0MEXq0ezoBDoHUr
         GLS/EMdV+6VFbmdGvVr2EUoBDqJucVibKmgTYIyJOAlDa8YNWEs4eQJDskwL/NBS7WfZ
         1KyO16UILTJ3LftvjgYqm5Fegir/9hmKR68Wnn3dvQErUegLI4digNMZnKRU4XUmkdpm
         DXJvm8XDlwN9nx5lTzlXU9VjW/ZwiO1jS70TfUm4HAxa5Z1jvv87T1bC/ixHqEDYebkw
         B2zg==
X-Gm-Message-State: AOAM533K7bF6GUvckYcBJj1+mVZfKa6ZBWKi6MmYRjH6QE/w+bmouAzT
	/7wVYO5b0CStSVLx59hGuu4=
X-Google-Smtp-Source: ABdhPJzp8m4FwJnbkhMLbgL+XavhU7Nn8RozoEfM5ahyfGXcbvFUbeNjRq9BOyxI1apQpBRwNEvG2w==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr20131908wme.23.1607355968383;
        Mon, 07 Dec 2020 07:46:08 -0800 (PST)
Date: Mon, 7 Dec 2020 15:46:06 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/2] ns16550: #ifdef-ary
Message-ID: <20201207154606.xd6ivom5jnzzdoui@liuwe-devbox-debian-v2>
References: <b74ba81a-da34-1e9a-9a15-f9dbb6005de8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b74ba81a-da34-1e9a-9a15-f9dbb6005de8@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Nov 19, 2020 at 09:54:58AM +0100, Jan Beulich wrote:
> 1: "com<N>=" command line options are x86-specific
> 2: drop stray "#ifdef CONFIG_HAS_PCI"
> 

Acked-by: Wei Liu <wl@xen.org>

