Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DA1ED908
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 01:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgchf-0003Z2-2u; Wed, 03 Jun 2020 23:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cLay=7Q=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jgchd-0003Yt-Sn
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 23:21:45 +0000
X-Inumbo-ID: fd4aa896-a5f0-11ea-8993-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd4aa896-a5f0-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 23:21:44 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n141so4181110qke.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=viHdAaovZfZLny6/K1OkFJ6S08Git+InCrEIHu5pizw=;
 b=C5r8Uthbh9S5TrzKsjBJusBQi81im4pyZEzlrIimJDKAFNrILSBL7UJkov33BQY0dj
 IOC8js358LOtHACLpVTD9EkcFBK7ivejDrIz0X79/QTr2mBVKSL80JUID3PLxnNPjUt7
 AM5b/DfaLiyg6iIrbfFkdXY28h1Mv+e2krYRsF9YPGc576INMjlRZy8cAYD9UfUnifWm
 dBEhv4kPNY9MlNf1vRKW2RtQCaqsTgcf0ZcmEbqZugdmzaoEpZnzX3dCZZ+Gz4e6GZPr
 mNWqQjtw9jCTcBpIAuN/XChbXQcCqhUGEAe6mzp+gxMQc/IcmACZMJ4HcmXMDWL8YkLT
 uGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=viHdAaovZfZLny6/K1OkFJ6S08Git+InCrEIHu5pizw=;
 b=o5kNYGcEclOa9mAXKhSYOLSoJZb220jcms0yP4rcuiad3zxjAOg8R8qTQuvBaff8zl
 vTQ4B3eWs+kMGPUQi41pFKnldywg/VD3kMjFhnf8VdbovcOubypEAOg7bPY9rVjI0kM3
 ga0a60Omm1dp3MLmrWt1Vnq81mZJb3s7DZOSVI9C4HIUpVs87u/gMiwV3qmDP49iZFqf
 vK/i2Gn1/YZ9VQx9v5jOVofBu3vLaTnUjHhZmrGQbG20jVn07h3zy/etifh45kWRupwS
 LW29XK3dn2E2474Vj3S+5iHWJOmXnb+NNtJtUhU/NzDf6Fwd4aMvK0pkJDUzKc4AME3L
 H8Qw==
X-Gm-Message-State: AOAM533bgtOdbEqCZIIDMCWrOd7dwAjewlr+YRerU+qQX2UUPO5pN464
 WMQ8vSo9eJNWMNBxoRx4TVXMbibND6zkBlwILD0q4w==
X-Google-Smtp-Source: ABdhPJw9W66DBBxUF1Xcku92BsMzHxkg4qumsdT7oP9BMRG8p7Y/sNTmF7udpGJpmUUk0p0bUfjnXKILGsSCDiUBSlU=
X-Received: by 2002:a05:620a:90a:: with SMTP id
 v10mr2169214qkv.22.1591226504632; 
 Wed, 03 Jun 2020 16:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200603223156.12767-1-sstabellini@kernel.org>
In-Reply-To: <20200603223156.12767-1-sstabellini@kernel.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 3 Jun 2020 16:21:33 -0700
Message-ID: <CAMmSBy_coPQdQ-4snPo7XCKX+dN+wWUSQZHbsK7vf8hqe=-3Cg@mail.gmail.com>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, tamas@tklengyel.com,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, cminyard@mvista.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 3, 2020 at 3:31 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Touching the watchdog is required to be able to reboot the board.
>
> The implementation is based on
> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Tested-by: Roman Shaposhnik <roman@zededa.com>

Thanks,
Roman.

