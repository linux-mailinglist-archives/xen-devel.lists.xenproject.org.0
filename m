Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01119383C8E
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 20:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128482.241208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liiBi-00032w-Ru; Mon, 17 May 2021 18:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128482.241208; Mon, 17 May 2021 18:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liiBi-000309-OX; Mon, 17 May 2021 18:41:58 +0000
Received: by outflank-mailman (input) for mailman id 128482;
 Mon, 17 May 2021 18:41:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1CF0=KM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1liiBh-000303-9U
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 18:41:57 +0000
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5393c8c7-48b4-4c7e-91d4-078aed8fd2b4;
 Mon, 17 May 2021 18:41:56 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so156881wmn.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 11:41:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h15sm1691655wmq.1.2021.05.17.11.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 11:41:55 -0700 (PDT)
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
X-Inumbo-ID: 5393c8c7-48b4-4c7e-91d4-078aed8fd2b4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EuPClXwtkqqvCFK9WnOJFo34QC+yCQRQ0OVjAS1R/20=;
        b=l6Mk+ErcVmP4YLOgYQt7YOkg0+HJvo+UzZKhqvHqlM7DaNZX2+nfouUGbelGbIQ/rH
         JUlWd7gc7u4YTHnF5IAMutJNBX0/Ek8jjPsz7mbGyfMubTjU5VqoUcoTgsLsihhmyNi6
         ctIKDKd9s6FuNbzYVLK/ySys4r76xtov6ll9vpmLaG0qXyyOkpymm1v2WKLYlS+ftih1
         npo4qd1Gyl6oUo7ZhZxRjLQBzD5pJKjvG9uVMrc5l0jLy3iq8KE7v31eYxK/LLiW4iqd
         F2LAmiGqVkk0RxSAcOpYVrKLBS0a+yFkA8frhsYfkUgUYXrltOw0mZ3CP0b2fxG2hDWK
         m6KA==
X-Gm-Message-State: AOAM532aAXDZxqJqWQNc+wNp9qUdcgLTOKf5WWZ/ZQXzN+UoXcADxK9U
	KTEwVw3w5b2f6mgq+V2YBxI=
X-Google-Smtp-Source: ABdhPJwqYvchC/R5Vm+kenSBq3TwNsoSvuZ9oZMyqpos07ojN/oMekcNvVgZMuB8ywXnkrhIkv8plA==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr469628wmq.104.1621276915852;
        Mon, 17 May 2021 11:41:55 -0700 (PDT)
Date: Mon, 17 May 2021 18:41:53 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: PING Re: [PATCH 00/14] Use const whether we point to literal
 strings (take 1)
Message-ID: <20210517184153.wwj4ek4bkmelpuia@liuwe-devbox-debian-v2>
References: <20210405155713.29754-1-julien@xen.org>
 <05eaa910-7630-d1e4-4b70-3008d672fe5c@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05eaa910-7630-d1e4-4b70-3008d672fe5c@xen.org>

On Mon, May 10, 2021 at 06:49:01PM +0100, Julien Grall wrote:
> Hi,
> 
> Ian, Wei, Anthony, can I get some feedbacks on the tools side?

I think this is moving to the right direction so

Acked-by: Wei Liu <wl@xen.org>

