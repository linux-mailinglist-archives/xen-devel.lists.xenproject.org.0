Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1984380157
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 02:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127116.238826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM8t-0004rB-LC; Fri, 14 May 2021 00:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127116.238826; Fri, 14 May 2021 00:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM8t-0004ox-I4; Fri, 14 May 2021 00:57:27 +0000
Received: by outflank-mailman (input) for mailman id 127116;
 Fri, 14 May 2021 00:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhM8s-0004or-C2
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 00:57:26 +0000
Received: from mail-io1-xd2e.google.com (unknown [2607:f8b0:4864:20::d2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c44bed0-55f6-4d98-b88c-2f63eb0ebddd;
 Fri, 14 May 2021 00:57:25 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id d11so6153610iod.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 17:57:25 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g25sm1981538ion.32.2021.05.13.17.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 17:57:24 -0700 (PDT)
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
X-Inumbo-ID: 9c44bed0-55f6-4d98-b88c-2f63eb0ebddd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3wEUqD5QhLS2UhtL5j7UqBMamQk3HhwXmumgBPx1P8=;
        b=hcN6w+BypiE5zN1KXHBF4f9O0oom+Q2j0Uo1g9Gd/LiXSvBT4gUXeolwGYSAMv61Su
         GmZhr+7jNEd20bCPrT+SsrfZ53U+zbwlqr9z2QTnpm8oEEZ7Nm9Qdk/PvNgh9C7+rJLt
         DKcHhb1MgYUN08Ued/nwzuZ/lX7vaizEBXJOhGRm7vNn5/CBzEcJTOTBbnG3UF6pQOaR
         EVBLUd1K9yVT/2JunLG+yac246uWjJwWcrg4XgHvPrZmIYHHSwifnwzhD4cXcJyaswir
         zgg/SC0mFliMPn4HB7kfRUC/QydemZzgfZpwza4MT6selUltS0uKSrMJLq61uj0CJSti
         +Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3wEUqD5QhLS2UhtL5j7UqBMamQk3HhwXmumgBPx1P8=;
        b=TxwNF4kU4+PQ8bUFFPIGFaAncnxEdKASnk1hfdHbDWhk7zKCJHOB2ZG0i9qt4fqAiE
         hGJ/6I6Pp/S5M1/F7kTQtwyj8pEmEL2er+PoCQL+0gGnQ/ZtQwRhlLJpOWUds/bu2dHN
         C80/nCTgtjcOUyld/6d6Hgg5KDxgLk+CCsHDlF+rJL5SIzD75nuqBEIctE3reiP01aon
         8h7j8yDz9y8XvN5wVEaEL6MfyJy/ukfeCD7/sz0cBM/W+pyoQxsRZUw/+x0/sL4mW1Aa
         YbuVrEoqzcoxhsKXeEPRoMqlpBiSuy1UlSpvlDnUUtJbvjiWccVzbmXTpWktEiHf+H4o
         LeFQ==
X-Gm-Message-State: AOAM531fLMEbZGLwNRhpCz/ZRswFrc/Rv9wpUr0hFte9gdTQ2Q+o5597
	Vraksbfbp1JZ1LAGaQbc1tc=
X-Google-Smtp-Source: ABdhPJyB4KylG8BajfWzW2sICVndWhPHbf+Sta1dYqbL8ii+leuCVgYktVAW4oFkpqaC0W9obhMlLA==
X-Received: by 2002:a5d:89c5:: with SMTP id a5mr33586495iot.172.1620953845046;
        Thu, 13 May 2021 17:57:25 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Connor Davis <connojdavis@gmail.com>,
	linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee.jones@linaro.org>,
	Jann Horn <jannh@google.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Petr Mladek <pmladek@suse.com>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 0/4] Support xen-driven USB3 debug capability
Date: Thu, 13 May 2021 18:56:47 -0600
Message-Id: <cover.1620950220.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This goal of this series is to allow the USB3 debug capability (DbC) to be
safely used by xen while linux runs as dom0.

The first patch prevents the early DbC driver from using an
already-running DbC.

The second exports xen_dbgp_reset_prep and xen_dbgp_external_startup
functions when CONFIG_XEN_DOM0 is enabled so they may be used by the
xHCI driver.

The third ensures that xen_dbgp_reset_prep/xen_dbgp_external_startup
return consistent values in failure cases. This inconsistency illustrated
another issue: dbgp_reset_prep returned the value of xen_dbgp_reset_prep
if it was nonzero, but callers of dbgp_reset_prep interpret nonzero
as "keep using the debug port" and would eventually (needlessly) call
dbgp_external_startup. Patch three _should_ fix this issue, but
I don't have any EHCI hardware available to test unfortunately.

The last uses the xen_dbgp_* functions to notify xen of unsafe periods
(e.g. reset and D3hot transition).

Thanks,
Connor

--
Changes since v1:
 - Added patch for dbgp return value fixes
 - Return -EPERM when !xen_initial_domain() in xen_dbgp_op
 - Moved #ifdef-ary out of xhci.c into xhci-dbgcap.h

--
Connor Davis (4):
  usb: early: Avoid using DbC if already enabled
  xen: Export dbgp functions when CONFIG_XEN_DOM0 is enabled
  usb: dbgp: Fix return values for reset prep and startup
  usb: xhci: Notify xen when DbC is unsafe to use

 drivers/usb/early/ehci-dbgp.c  |  9 ++++---
 drivers/usb/early/xhci-dbc.c   | 10 ++++++++
 drivers/usb/host/xhci-dbgcap.h | 19 ++++++++++++++
 drivers/usb/host/xhci.c        | 47 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h        |  1 +
 drivers/xen/dbgp.c             |  4 +--
 include/linux/usb/ehci-dbgp.h  | 14 ++++++----
 7 files changed, 94 insertions(+), 10 deletions(-)


base-commit: 88b06399c9c766c283e070b022b5ceafa4f63f19
-- 
2.31.1


