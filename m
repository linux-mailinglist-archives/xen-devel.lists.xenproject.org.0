Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994CE4090A7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 15:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185686.334371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmOp-0001Et-Vx; Mon, 13 Sep 2021 13:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185686.334371; Mon, 13 Sep 2021 13:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmOp-0001Cn-SS; Mon, 13 Sep 2021 13:53:31 +0000
Received: by outflank-mailman (input) for mailman id 185686;
 Mon, 13 Sep 2021 13:53:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01x7=OD=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mPmOo-0001Ch-7B
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:53:30 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1b934a3-f2f0-406a-87f8-6427bc7c4801;
 Mon, 13 Sep 2021 13:53:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q26so14836354wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 13 Sep 2021 06:53:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm1838350wru.56.2021.09.13.06.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:53:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BC831FF96;
 Mon, 13 Sep 2021 14:53:26 +0100 (BST)
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
X-Inumbo-ID: e1b934a3-f2f0-406a-87f8-6427bc7c4801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FrxeFVXB0iHRu6ysUDY2Cx68qEn3yyoUjhHHUgs2xrc=;
        b=QWAMEFwudHmTzPrqwwC9aSNmIov2MWk2aff+MlCmsbNpUVWWkulcxXtU051WdUC+aN
         x8FxvFnPHX4wZcpaYlX3UYDNck8UwVAEs1wD3MyD7yQOLNSrB+qQ9Fh67EDr2hvWZ00V
         9u5wW9vowdmb9HIKRSiVKEitDjf1samltdI0PdtQbN32AOR8bet4eJE/6Ww7sOY2VdDq
         lxfUO+Wx3t+qITLGQQE21CuTRxWVNu0le9KXoBF0IYWEQZlnr8talGomecr2TkK6ddGE
         BQ1xlIqH17JcZ84CGPR28Eagj/Mna4851yiwM1OlxMTC5adWc8yqDbnSO0qsgDHXViQn
         FbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FrxeFVXB0iHRu6ysUDY2Cx68qEn3yyoUjhHHUgs2xrc=;
        b=4Kyo1sapC1r1G8uRe+YK7xC/Er8A9b0M4UOmURHnfd9414EGuPxjv/3zVK7h6mYOXX
         0MHlkrmVZyYJHRPiEh/3GySkcFLMR5X9KKf9pgZDvoCSD7ECNKCNXuDL1+SgYNfH1W1Q
         GIbaiqpgA4wAE1hPKqgTrX/oyAKmbsNE2GAV+ic1FhLnQ4p2UhoqJ/1AyPj7GJrcTIJs
         O4X+WsbfWl1kWsLJx5lgeiCU6yJEGr64Ww0YHyW4v+Cm50POshw4i36x51HmAEfw2Q/9
         Gvh1t0XkzjQXc4yNq4MQ75AbP9JVOJ38qwdn0mu94EBMdl7fyB6SKqhiE8+PkEhKMIea
         QhlA==
X-Gm-Message-State: AOAM532foLvFMAa/lI+SLOwYOsZ1RJPAPlbFT0a+ZvnOwd9CZBmGbSVc
	S71VfPNw83HNo92Qx9acFfc2zw==
X-Google-Smtp-Source: ABdhPJyY9fKnZ104ODYyH3fJsphgPUR61GnQVgVDFVl0PD346R5DURujcNuLktUjJWRtn5MDYG6JnQ==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr12877435wrv.34.1631541208154;
        Mon, 13 Sep 2021 06:53:28 -0700 (PDT)
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Wei Liu <wl@xen.org>
Cc: "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 xen-devel@lists.xenproject.org, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Is it time to start implementing Xen bindings for rust-vmm?
Date: Mon, 13 Sep 2021 13:44:55 +0100
Message-ID: <87lf40vay1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

As we consider the next cycle for Project Stratos I would like to make
some more progress on hypervisor agnosticism for our virtio backends.
While we have implemented a number of virtio vhost-user backends using C
we've rapidly switched to using rust-vmm based ones for virtio-i2c,
virtio-rng and virtio-gpio. Given the interest in Rust for implementing
backends does it make sense to do some enabling work in rust-vmm to
support Xen?

There are two chunks of work I can think of:

  1. Enough of libxl/hypervisor interface to implement an IOREQ end point.

  This would require supporting enough of the hypervisor interface to
  support the implementation of an IOREQ server. We would also need to
  think about how we would map the IOREQ view of the world into the
  existing vhost-user interface so we can re-use the current vhost-user
  backends code base. The two approaches I can think of are:

    a) implement a vhost-user master that speaks IOREQ to the hypervisor
    and vhost-user to the vhost-user slave. In this case the bridge
    would be standing in for something like QEMU.

    b) implement some variants of the vhost-user slave traits that can
    talk directly to the hypervisor to get/send the equivalent
    kick/notify events. I don't know if this might be too complex as the
    impedance matching between the two interfaces might be too great.

  This assumes most of the setup is done by the existing toolstack, so
  the existing libxl tools are used to create, connect and configure the
  domains before the backend is launched.

which leads to:

  2. The rest of the libxl/hypervisor interface.

  This would be the rest of the interface to allow rust-vmm tools to be
  written that could create, configure and manage Xen domains with pure
  rust tools. My main concern about this is how rust-vmm's current model
  (which is very much KVM influenced) will be able to handle the
  differences for a type-1 hypervisor. Wei's pointed me to the Linux
  support that was added to expose a Hyper-V control interface via the
  Linux kernel. While I can see support has been merged on other rust
  based projects I think the rust-vmm crate is still outstanding:

    https://github.com/rust-vmm/community/issues/50

  and I guess this would need revisiting for Xen to see if the proposed
  abstraction would scale across other hypervisors.

Finally there is the question of how/if any of this would relate to the
concept of bare-metal rust backends? We've talked about bare metal
backends before but I wonder if the programming model for them is going
to be outside the scope of rust-vmm? Would be program just be hardwired
to IRQs and be presented a doorbell port to kick or would we want to
have at least some of the higher level rust-vmm abstractions for dealing
with navigating the virtqueues and responding and filling in data?

Thoughts?

--=20
Alex Benn=C3=A9e

