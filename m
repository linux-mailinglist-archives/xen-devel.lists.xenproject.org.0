Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB42073C1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4tf-0001zo-9K; Wed, 24 Jun 2020 12:52:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbuU=AF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jo4td-0001zc-Q7
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:52:57 +0000
X-Inumbo-ID: a02ce316-b619-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a02ce316-b619-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 12:52:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h19so2365223ljg.13
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L2VfXr+wrRkLpcYiMpgSJbGnKK49VpSgllN39LKBgUE=;
 b=moJpyLkWwhBSb97Itz2uOmKHAMBB6Shej3HOy3IyJQvTM53KA9KJhMHnL8FYt+zjuA
 nIbGXg9dMF2oENgkDQ+3pX5Z1CScve4fPLZn9mlVnNuYz5BroRrDm2sGdQbqMx0aBzoG
 +WgXWUeGIFcnNAoyk+pqzBmM0GxGq84p2OKqR/PmnVjUQw7iahHZmPfrhyJ7nRnUr/vV
 2TupTloIhqaJXHtUSvZTVGyCPCK5+X5mifUMSUJjZNQq5eOzPJqS8KJLhIFhbjfmmepB
 TJmbG2tRZh/rHWnArCMYPwUMHbjw5ZFKu8UjcK5UlWOHEy8PdKF3jQn+u33ukIwJ/zCz
 zU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L2VfXr+wrRkLpcYiMpgSJbGnKK49VpSgllN39LKBgUE=;
 b=hvScFf6mPYVh8wC9yPyjZ+iq5yN5/v8p7WAkdwvyk3sRJp45JHPHeT2vyr7GWQDE8m
 cAeMqxjCEDJX0rgtAUv9ZgvK6jCGNMGHH1cKHVQqiI6ArT1GorqoK19OJGW7T0O0QvoK
 hX9brIS4y/bqSXlEMSALt8hpx1gAULSNF5KeyVdvg/tUF10ersLTfgnLJZuYmHukfSwU
 Qgv4lrS/zuqxg6urYv+XEW55o6co3bBvoUec2FFsOjRWBF1XzcfJZh3dGqvTSZlxJXVC
 PkujWGYScO+TfN1Xwz98KXs12xrWrLoPkpmwxUgz7qbWEMt5EDxpjpjTLXz/Itq7yFzu
 QCZA==
X-Gm-Message-State: AOAM530UfqnB7JzqvJ2+S+CHk+PEREHmNHO+qdLVXFEv3uncCsukEf1b
 3HtpWc88ASEdFX1OW3OVhNaTLUxS7UqKS0c1cfM=
X-Google-Smtp-Source: ABdhPJyIxbtadZc95+Z5PRSpPgsxAcE1qBgoXjjgpynlW/K8aJOqdQu1yqcI78stkMCEvVZ69GuBZqLEw98bdJ76kdI=
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr14830277ljp.368.1593003176111; 
 Wed, 24 Jun 2020 05:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200624121939.10282-1-jandryuk@gmail.com>
 <000a01d64a23$4a595e90$df0c1bb0$@xen.org>
In-Reply-To: <000a01d64a23$4a595e90$df0c1bb0$@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 24 Jun 2020 08:52:44 -0400
Message-ID: <CAKf6xpuiRj_b+M+E0wBzPhraLxdebL6xr_1dMGc-jnzhWb0mhg@mail.gmail.com>
Subject: Re: [PATCH] xen: Fix xen-legacy-backend qdev types
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 8:30 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Jason Andryuk <jandryuk@gmail.com>
> > Sent: 24 June 2020 13:20
> > To: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul
> > Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> > Cc: Jason Andryuk <jandryuk@gmail.com>; qemu-devel@nongnu.org
> > Subject: [PATCH] xen: Fix xen-legacy-backend qdev types
> >
> > xen-sysdev is a TYPE_SYS_BUS_DEVICE.  bus_type should not be changed so
> > that it can plug into the System bus.  Otherwise this assert triggers:
> > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> > failed.
> >
> > TYPE_XENBACKEND attaches to TYPE_XENSYSBUS, so its class_init needs to
> > be set accordingly to attach the qdev.  Otherwise the following assert
> > triggers:
> > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> > failed.
> >
> > TYPE_XENBACKEND is not a subclass of XEN_XENSYSDEV, so it's parent
> > is just TYPE_DEVICE.  Change that.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Clearly we raced. This patch and my patch #1 are identical so I'm happy to give my ack to this.

Yeah, looks like you beat me by a hair :)

Either way it gets fixed is fine by me.

Thanks,
Jason

