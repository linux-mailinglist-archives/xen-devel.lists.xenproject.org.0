Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193011AE866
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 00:51:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPZpR-0001cg-Jd; Fri, 17 Apr 2020 22:51:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r7J8=6B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jPZpQ-0001cb-9x
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 22:51:20 +0000
X-Inumbo-ID: f37b5cec-80fd-11ea-b58d-bc764e2007e4
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f37b5cec-80fd-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 22:51:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t14so4781765wrw.12
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2020 15:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3PsbtqPjNhGMvcmhOuB1O8bVlsofWGA32h2HvSAUH4=;
 b=Zuosua/2vhlvLM5TS9x3eJrKKRPnMxMqcBO2E0vRelvhNy68Z29I1CCnVa/3PHJ72b
 sY35vWoP6vZR2OStJsVfAhwowLVvjrVADy/Le2cyChwAb8h5wVx7dYgyMtwappk97lVl
 s68o61X9VxoFa9T5wydFO8kh88DUVewUY7eDA5+k3JXIi/YJzUu/RdUp3XtdqWB+7rkL
 8h/gOf5xnkJ5JzpsG5P3XfMn11DMKQuPfNMVBINm6CN7miL7m5yuVxyaqVfUAPGOCSaj
 73RYBE+zxkA9QIn6k20ZyVXbZ4+Wzt1jZikz6IJbbb0n+Xt9Rj825A8n5nSUWvnshf5n
 kIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3PsbtqPjNhGMvcmhOuB1O8bVlsofWGA32h2HvSAUH4=;
 b=XuJ7zS7NE1eXcrMsagCtYfOa5OpS1J8K/6goosN9MN52lb8Tn2s1hwTXVyeVDZ/IKA
 lJgyB91laTn/9sBWtl1GknW6elj+EsDj6TyN1fdcDPSpN4Wz/WI3s8S4DFWYTHPm8kxX
 XyAdTytGCQhIK8+58msZjB6rgi1TQq01p0nUlsOokqHR/kRSE013NO4V/58Z83IKjeX0
 QQccKwtj1zAFICDntBHH/UrCo3ZCzkeKMcu+oc5l3XNsrYOoAA0su4rpTf8Tx4yFRJ0z
 uA3uPkfbBonMsV1dQ3cQ4xm+ZKPN6FxCEO6ksTxO/D45xDmDCNGaRVRjDCxw2wng3Wd1
 6jfg==
X-Gm-Message-State: AGi0PubLOXvUjhvvcO6WMX5Urlfye+MIxwpUtTsdC5YyXsTFb73C2eCv
 SaRgLYTHIzP6ywet6VHR9prZ+u9HH7JG0UnpcUA=
X-Google-Smtp-Source: APiQypJC1Jpy8ygtBYdhcm+mTVyw5//BpBUPhLshm4Zk5fFpy1SlEAWGZnaM4QpvXWYG8Q9oIM/FWcJeFLE+c2Zoqx8=
X-Received: by 2002:adf:f30c:: with SMTP id i12mr6525380wro.426.1587163878490; 
 Fri, 17 Apr 2020 15:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200417221609.19928-1-sstabellini@kernel.org>
In-Reply-To: <20200417221609.19928-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 17 Apr 2020 23:51:07 +0100
Message-ID: <CAJ=z9a2yCLfOGChD8YL3K7H50spGyifcpeLq_dz_T7aFV8VGQQ@mail.gmail.com>
Subject: Re: [PATCH][RESEND] xen/arm: vgic-v3: fix GICD_ISACTIVER range
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

The title claim this is a resend, but this is actually not the latest
version of this patch. Can you explain why you decided to use v1
rather than v2?

On Fri, 17 Apr 2020 at 23:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
>
> (See https://marc.info/?l=xen-devel&m=158527653730795 for a discussion on
> what it would take to implement GICD_ISACTIVER/GICD_ICACTIVER properly.)
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I don't think you can be at the same time an author of the patch and a
reviewer. Otherwise, I could review my own patch ;).

Cheers,

