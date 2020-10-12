Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC328C20E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 22:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6022.15772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS46u-00073y-Uc; Mon, 12 Oct 2020 20:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6022.15772; Mon, 12 Oct 2020 20:07:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS46u-00073Q-RU; Mon, 12 Oct 2020 20:07:56 +0000
Received: by outflank-mailman (input) for mailman id 6022;
 Mon, 12 Oct 2020 20:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKVJ=DT=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kS46t-00073L-GT
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:07:55 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39d3af10-0f9d-466d-99fa-bca774f334a7;
 Mon, 12 Oct 2020 20:07:54 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c23so14472348qtp.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 13:07:54 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9802:d83e:b724:7fdf])
 by smtp.gmail.com with ESMTPSA id d129sm13418350qkg.127.2020.10.12.13.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 13:07:53 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CKVJ=DT=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kS46t-00073L-GT
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:07:55 +0000
X-Inumbo-ID: 39d3af10-0f9d-466d-99fa-bca774f334a7
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39d3af10-0f9d-466d-99fa-bca774f334a7;
	Mon, 12 Oct 2020 20:07:54 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c23so14472348qtp.0
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v0Cs33Gr8ZIAyIhglkddtMKcyQqAbuNNR2DdCRh4xdo=;
        b=I5NqU2FmUWwd1I3YdYafLj6MuoLjP8vfg48bx4m87EUu2Z9j57n0IL2LEKO9zUeFPN
         yddqJSh6ZdXpGKz4oNhDbdJyLMQO9wAbrYe/k+07LrlqsItDNlE26EPfVhL4KYFkf5Th
         HK3QAXukmMHGZT71wNmI/11SnDwPxidsRANoKS94e9UWIIZSd57K1JhKPdS5RS88vGLl
         62QVH4qOoUOpKfmEDt/iJ3wXCvNQSi7PYo9fNu221qung4MlK+9gPbfxBa67CF3zL4Wm
         HO1D+I5SvUURf8TNTTl5gV0lzdEo6WTsIHOcwZFaz7ZFZCTaKQ0+0SRdBmIGorsFn0nI
         lpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v0Cs33Gr8ZIAyIhglkddtMKcyQqAbuNNR2DdCRh4xdo=;
        b=ReorT8aPLrPFIiMgUx9Y8yLpWxC9hdrKRqew+ZWO7iGLvOtv2Vq3a0CvyYjVYkGZW/
         aAI5SmE8jKhYrRL+emBmp6z56y4pfFpN+YTsmINmk8chr/pKwJg5B79oVYc3eDkRR4t+
         kflenN3x/Ccg2/8HRyXvZCa1nMa8UQpSiwRg0kTZZEVVtRXxckQ9cNJO92xbVrtF6rkE
         u6sY5VFQq6LA/uBOU6R9WLVPrpd9SrHmaindDCN+AVb+ibxRPGGL9bR82sTfYAG6pxbA
         d2JJAjVgVrsnN/6DP5Gie2me3XjtAXAjVH6GUCeS3xilqlRZhAd/OsjnUpIOBSUIbEb3
         0uGA==
X-Gm-Message-State: AOAM530rA8L0hvallFSxDGmusRvyWfGs6N15Jdp0u6BsqmAWULFRHUl+
	Xc2ho2i1GzVMjFzy5WScuwk=
X-Google-Smtp-Source: ABdhPJzLBfY+CXT7WdaA1EBpQhcIOT8q6V+A1sEJrRQx5zR8sS7e385nJtH7BRiNQ/b/X/cAnaaHGA==
X-Received: by 2002:ac8:1a6f:: with SMTP id q44mr11703130qtk.136.1602533274354;
        Mon, 12 Oct 2020 13:07:54 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9802:d83e:b724:7fdf])
        by smtp.gmail.com with ESMTPSA id d129sm13418350qkg.127.2020.10.12.13.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 13:07:53 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] Add Xen CpusAccel
Date: Mon, 12 Oct 2020 16:07:22 -0400
Message-Id: <20201012200725.64137-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen was left behind when CpusAccel became mandatory and fails the assert
in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
Move the qtest cpu functions to a common location and reuse them for
Xen.

Jason Andryuk (2):
  accel: move qtest CpusAccel functions to a common location
  accel: Add xen CpusAccel using dummy-cpu

 .../qtest-cpus.c => dummy/dummy-cpus.c}       | 22 +++++--------------
 .../qtest-cpus.h => dummy/dummy-cpus.h}       | 10 ++++-----
 accel/dummy/meson.build                       |  7 ++++++
 accel/meson.build                             |  1 +
 accel/qtest/meson.build                       |  1 -
 accel/qtest/qtest.c                           |  7 +++++-
 accel/xen/xen-all.c                           | 10 +++++++++
 7 files changed, 34 insertions(+), 24 deletions(-)
 rename accel/{qtest/qtest-cpus.c => dummy/dummy-cpus.c} (76%)
 rename accel/{qtest/qtest-cpus.h => dummy/dummy-cpus.h} (59%)
 create mode 100644 accel/dummy/meson.build

-- 
2.25.1


