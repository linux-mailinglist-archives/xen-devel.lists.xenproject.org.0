Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF530821C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 00:52:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77518.140425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5H5Q-0002NK-5Y; Thu, 28 Jan 2021 23:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77518.140425; Thu, 28 Jan 2021 23:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5H5P-0002Mu-WC; Thu, 28 Jan 2021 23:52:27 +0000
Received: by outflank-mailman (input) for mailman id 77518;
 Thu, 28 Jan 2021 23:52:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VX8S=G7=gmail.com=michael.d.labriola@srs-us1.protection.inumbo.net>)
 id 1l5H5O-0002Mp-W0
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 23:52:27 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fd309f3-07b4-40bf-9c94-ea0dc26a91d5;
 Thu, 28 Jan 2021 23:52:26 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id l27so7179282qki.9
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 15:52:26 -0800 (PST)
Received: from aragorn (wsip-72-215-235-61.ri.ri.cox.net. [72.215.235.61])
 by smtp.gmail.com with ESMTPSA id j11sm4668165qkm.47.2021.01.28.15.52.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Jan 2021 15:52:25 -0800 (PST)
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
X-Inumbo-ID: 1fd309f3-07b4-40bf-9c94-ea0dc26a91d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:message-id:from:to:subject;
        bh=RD/LxBAWTwAy2rb69wLLZgdJrwEuGTJQYn4XDIMEKFU=;
        b=PhrT3C9PtWqAfOHfGG0dltWF2tbNuZXOuBfgRO28HGgXfi88SxE8xoqAcO0+N5dP64
         4/7N+rZyuGD4JNcCOwoSRwUZoh+VwHLt833mLYbxJQdDxWifddc35lVGzY4DKmGzx2Er
         K2aPICc/eXRjqkl1Kt7bJP/tKNwfvkgJAQiY5uWK+InSsCBoeReZnh5I+7wFtLuDaTzn
         wq1FuwM1+nzxhrbDj+Gx9wfGJIsGP3tDV46f0bFy9qXVLiXaMsymK2Y8mkUoYFyAVhFu
         7ZbFwztDUU78Kuuw8mBFWPBKhlUjYIbmHDxRy6F0qWF52DeeqVt6LZO5NjAcpzhggKHA
         jlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:subject;
        bh=RD/LxBAWTwAy2rb69wLLZgdJrwEuGTJQYn4XDIMEKFU=;
        b=h6fFGh8aHxIbhvwgg19rCZKVaNYAkpNznrYJ0Gj2lGzLwEGsSQrtsdMbNTBNiDpb8c
         2k1H3ri5jhfyTYXmwHK8K9ZVg/JNiwCYgZzsx5A/wtpqmMq8oX/DFSDKnDP8MbxjDd5B
         xiXdVvwaPYFw2nutUScRyigyCDGle9WOClyLqx/oVL2yJ8Ci1VNt+pRQsrTEHc86ATTT
         kJq8Kc771xGFgaqoLHuhkj+QvzES2w//7smKrSI+b1zunIi7w5RJ4G7d5MyPo3/VyZeg
         E3M+QITMF1SwTvIoGKXf09rEibPDw9/RPgD1smqou+UY55KF4maM1G8FJymKC9oCvti3
         ENdQ==
X-Gm-Message-State: AOAM5322+Y2UYUEBugMmprUtdihjAomgnP0eOJBzzDkxjQQvdzCT6LUY
	/hvLJI12Pd8CBerunsl7JgA=
X-Google-Smtp-Source: ABdhPJxo/CUWvspwtLWswY7LQBJuxrJzhTYF76ZJz6BlO7W/b6Pm4O0dLsk4HMUZJz4jDdHrYJGt6w==
X-Received: by 2002:a37:5a47:: with SMTP id o68mr1842516qkb.423.1611877945816;
        Thu, 28 Jan 2021 15:52:25 -0800 (PST)
Date: Thu, 28 Jan 2021 18:52:23 -0500
Message-Id: <2nft2kipqg.fsf@aragorn.infrastructure.cah>
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: David Woodhouse <dwmw@amazon.co.uk>,Boris Ostrovsky <boris.ostrovsky@oracle.com>,Juergen Gross <jgross@suse.com>,Sasha Levin <sashal@kernel.org>,Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,Roger Pau Monne<roger.pau@citrix.com>,xen-devel@lists.xenproject.org,linux-kernel@vger.kernel.org
Subject: Problems starting Xen domU after latest stable update

Hey, everyone.  I've run into problems starting up my Xen domUs as of
the latest batch of stable updates.  Whenever I try to create one, I
get a bunch of block device errors like this:

libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51712
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51728
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51744
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51760
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51776
libxl: error: libxl_create.c:1452:domcreate_launch_dm: Domain 4:unable to add disk devices
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51712
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51728
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51744
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51760
libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51776
libxl: error: libxl_domain.c:1290:devices_destroy_cb: Domain 4:libxl__devices_destroy failed
libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain 4:Non-existant domain
libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain 4:Unable to destroy guest
libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain 4:Destruction of domain failed

I'm using Xen 4.13.1 on the box I've been testing with.

I bisected down to this commit, and reverting it does indeed fix my
problem.  Well, this commit upstream and it's cherry-picked variants
on linux-5.4.y and linux-5.10.y.

commit 3499ba8198cad47b731792e5e56b9ec2a78a83a2
Author: David Woodhouse <dwmw@amazon.co.uk>
Date:   Wed Jan 13 13:26:02 2021 +0000

    xen: Fix event channel callback via INTX/GSI
    
    For a while, event channel notification via the PCI platform device
    has been broken, because we attempt to communicate with xenstore before
    we even have notifications working, with the xs_reset_watches() call
    in xs_init().
    
    We tend to get away with this on Xen versions below 4.0 because we avoid
    calling xs_reset_watches() anyway, because xenstore might not cope with
    reading a non-existent key. And newer Xen *does* have the vector
    callback support, so we rarely fall back to INTX/GSI delivery.
    
    To fix it, clean up a bit of the mess of xs_init() and xenbus_probe()
    startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
    case, deferring it to be called from xenbus_probe() in the XS_HVM case
    instead.
    
    Then fix up the invocation of xenbus_probe() to happen either from its
    device_initcall if the callback is available early enough, or when the
    callback is finally set up. This means that the hack of calling
    xenbus_probe() from a workqueue after the first interrupt, or directly
    from the PCI platform device setup, is no longer needed.
    
    Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
    Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    Link: https://lore.kernel.org/r/20210113132606.422794-2-dwmw2@infradead.org
    Signed-off-by: Juergen Gross <jgross@suse.com>


