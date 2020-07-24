Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFB22BE19
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 08:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyrEP-0006oH-Pu; Fri, 24 Jul 2020 06:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QctF=BD=canonical.com=andrea.righi@srs-us1.protection.inumbo.net>)
 id 1jyrEO-0006oC-HL
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 06:30:56 +0000
X-Inumbo-ID: 3a727c8c-cd77-11ea-87e3-bc764e2007e4
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a727c8c-cd77-11ea-87e3-bc764e2007e4;
 Fri, 24 Jul 2020 06:30:55 +0000 (UTC)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andrea.righi@canonical.com>) id 1jyrEM-0004j1-OQ
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 06:30:54 +0000
Received: by mail-ed1-f71.google.com with SMTP id r18so1214994edi.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2020 23:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f5Bi1N9eHmzbwm4KZS+jcd4luzKCa17r9gngXjYNYvc=;
 b=Q/Cky1XnVrT2iFj1FMjcYpxQP3QGdu7oQ4/k34DbGlmsA2gGmjY9gQkrvE9nMdmaSy
 Ej55I9fG1EzjVeo/X+ekptKUZg+idxHxzQmv8c3oMaXOrFjUjhngUrl2zOZ/9+ZYc1gf
 1vX1Bh5Gkt3jGVigYzA9yAB3a5LyrmBB4DueHOXQzdeKnyYB4n32Rkv0EPOzoM+qifE0
 4LRjiHHNDGVYqqlHDSmFtUHg/v0p9v0OZdaIvgO+U9IPrIHHVmZPyNWiJUfcj/4bbxQr
 1+TcDN49q3WzjRj6BejAsn2veD2VDuLJvzebcLiYcRNGzqrKNvugtZ7Nq6vxucsRyxc8
 6YrQ==
X-Gm-Message-State: AOAM533Wh0/ZmN5j/lXilbaGxyghrk0KYuq93hekvvdKY1hc2D7kOJTF
 8ho8tCRavXWEbZy3WQrxFs/eaHm8ziHV9gJmBhzpmJ6yfWngB8yrI1igesqRPQu+2Xu7kxZTrs5
 +REuhD21RI0gZlzMf4QT1FnKRQkEIcI+d0BcbD7NgIRq2
X-Received: by 2002:a17:906:3bd5:: with SMTP id
 v21mr3756077ejf.329.1595572254321; 
 Thu, 23 Jul 2020 23:30:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXO1++pFVwTCL/tYfrIs0xm/tuHNlxlyRivKJ5/9QT5Rk/9NHc5BZDVgyqSnOH54Jo7XttPw==
X-Received: by 2002:a17:906:3bd5:: with SMTP id
 v21mr3756053ejf.329.1595572254072; 
 Thu, 23 Jul 2020 23:30:54 -0700 (PDT)
Received: from localhost (host-87-11-131-192.retail.telecomitalia.it.
 [87.11.131.192])
 by smtp.gmail.com with ESMTPSA id r19sm48005edi.85.2020.07.23.23.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 23:30:53 -0700 (PDT)
Date: Fri, 24 Jul 2020 08:30:52 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen-netfront: fix potential deadlock in xennet_remove()
Message-ID: <20200724063052.GG841369@xps-13>
References: <20200722065211.GA841369@xps-13>
 <20200723.145722.752878326752101646.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723.145722.752878326752101646.davem@davemloft.net>
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
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kuba@kernel.org,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 02:57:22PM -0700, David Miller wrote:
> From: Andrea Righi <andrea.righi@canonical.com>
> Date: Wed, 22 Jul 2020 08:52:11 +0200
> 
> > +static int xennet_remove(struct xenbus_device *dev)
> > +{
> > +	struct netfront_info *info = dev_get_drvdata(&dev->dev);
> > +
> > +	dev_dbg(&dev->dev, "%s\n", dev->nodename);
> 
> These kinds of debugging messages provide zero context and are so much
> less useful than simply using tracepoints which are more universally
> available than printk debugging facilities.
> 
> Please remove all of the dev_dbg() calls from this patch.

I didn't add that dev_dbg() call, it's just the old code moved around,
but I agree, I'll remove that call and send a new version of this patch.

Thanks for looking at it!
-Andrea

