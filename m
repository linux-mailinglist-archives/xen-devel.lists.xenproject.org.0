Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE08BA804
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 09:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716265.1118363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2nbn-0007R4-RH; Fri, 03 May 2024 07:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716265.1118363; Fri, 03 May 2024 07:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2nbn-0007OX-Og; Fri, 03 May 2024 07:45:31 +0000
Received: by outflank-mailman (input) for mailman id 716265;
 Fri, 03 May 2024 07:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1aGk=MG=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2nbm-0007OR-8J
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 07:45:30 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bcd7789-0921-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 09:45:28 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6eb93ec8804so4935563a34.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 00:45:28 -0700 (PDT)
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
X-Inumbo-ID: 1bcd7789-0921-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714722327; x=1715327127; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lNJa2Jm70diUip67ciyH7ehDCuPj0ZhHiJYE6JP/oGY=;
        b=q79r7L657hxNFSOo+j5ibDf2+4cx37VdRGwwcDlHHSmfl1A1iyxvt8eyCesQP8GiEB
         sIiMLW8xWv3UOaNeqtmd7NJ2QtskZi4pICTTDIzqtNmqVUemLhNjZh+QWbxQFeZxdvhs
         De55qa2AE8I4RoEt87N6yaXjA2tXwrG7R3SNT7b2SwOwiouX8WRqtzi1qs6cRSqpHAA0
         jwt9sepWV1V4N27NeY6aFIrtz13+I7jTwygO5rCMFzGWjIUCfm0FYMlnifQHghviedSQ
         i8xCge9SUDFqTxXLpl/16EcsgB+Kx0/AIzvO0NwR5PWRr+27Irww3FEWCqkFfxeNxH73
         nWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714722327; x=1715327127;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNJa2Jm70diUip67ciyH7ehDCuPj0ZhHiJYE6JP/oGY=;
        b=p5xzQWU+bwhiffPw65aXe0bkA0+rDOS6s60a4oFfoOemL5QMeqw7lsCk3dn3rTIrfk
         JQVkG3cIxxS99894LU3b6EVy1jvy4R6GZ1VM8Z5K4lqmStU0lsl0ldXlWo9DHe2onvaU
         9QcxXZZEIbKvFIABOX0MQ38MHwRHcFXdQ+5ghXi0nOlsHuVdVpzvxN9N2pK9zMiccmYE
         mNTKVx/rXvpNS+oxR5BDkaLdVA0iWYrc4qzVLW3iuphbrXZhcFTtmztVHNrBOJOQLA5B
         lKAxMrDWHmSUwsjgzirD6oOycZktgj0PjVE1XFD3/hmtn5yrUKkl6+g2NxkYy/dYpiTT
         aqGw==
X-Gm-Message-State: AOJu0Yx/ndFHopxMWORQfcQuX+dD85sZGLtBBcASRRzxrH5TNiuwFlEz
	yTeagJrG51G137laR8TuIkiSf1MZkfAtIVZUP47SNzardk0B8/u1k1mB5/vZmHnkeIFeZ+CctOU
	N8ckCG+rSybOADCRo8C48oL+ACpdDh8KCccxn9Q==
X-Google-Smtp-Source: AGHT+IGpzQm1nxrYlFMaLissBILcV7ybWqVSQw3QdxEceqh1ZDtbiSUCXQ8ndgJRMogkMTxUm/raAUl4o4olr/7grjU=
X-Received: by 2002:a05:6830:91b:b0:6ed:d4bc:1b72 with SMTP id
 v27-20020a056830091b00b006edd4bc1b72mr2962404ott.5.1714722327163; Fri, 03 May
 2024 00:45:27 -0700 (PDT)
MIME-Version: 1.0
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 May 2024 09:45:15 +0200
Message-ID: <CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com>
Subject: Referencing domain struct from interrupt handler
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Xen maintainers,

In my patch series [XEN PATCH v4 0/5] FF-A notifications [1] I need to
get a reference to a domain struct from a domain ID and keep it from
being destroyed while using it in the interrupt handler
notif_irq_handler() (introduced in the last patch "[XEN PATCH v4 5/5]
xen/arm: ffa: support notification"). In my previous patch set [2] I
used get_domain_by_id(), but from the following discussion
rcu_lock_live_remote_domain_by_id() seems to be a better choice so
that's what I'm using now in the v4 patch set. The domain lock is held
during a call to vgic_inject_irq() and unlocked right after.

While we're reviewing the patch set in [1] I'd like to check the
approach with rcu_lock_live_remote_domain_by_id() here.

What do you think? Is using rcu_lock_live_remote_domain_by_id() the
best approach?

[1] https://patchew.org/Xen/20240502145645.1201613-1-jens.wiklander@linaro.org/
[2] https://patchew.org/Xen/20240426084723.4149648-1-jens.wiklander@linaro.org/

Thanks,
Jens

