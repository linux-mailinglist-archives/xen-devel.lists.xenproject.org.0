Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B582C55DD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 14:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38552.71301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiHUD-0007Rm-4v; Thu, 26 Nov 2020 13:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38552.71301; Thu, 26 Nov 2020 13:39:01 +0000
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
	id 1kiHUD-0007RM-1C; Thu, 26 Nov 2020 13:39:01 +0000
Received: by outflank-mailman (input) for mailman id 38552;
 Thu, 26 Nov 2020 13:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnMB=FA=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kiHUB-0007RG-5k
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:38:59 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd1bfaee-425a-4fa3-8d84-9bbadca92b99;
 Thu, 26 Nov 2020 13:38:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so2435487wmh.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 05:38:58 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id s133sm7035825wmf.38.2020.11.26.05.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:38:56 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tnMB=FA=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
	id 1kiHUB-0007RG-5k
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:38:59 +0000
X-Inumbo-ID: fd1bfaee-425a-4fa3-8d84-9bbadca92b99
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fd1bfaee-425a-4fa3-8d84-9bbadca92b99;
	Thu, 26 Nov 2020 13:38:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so2435487wmh.4
        for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLYy9GrW221tE7bgw0J/86UTqSktvqRhGJxBlLeC3CQ=;
        b=l8uEDUWZzvTPhQEmHkZEDzGn+Iktals9WkH8ixtmNOmOetN+vKndogKyVo59zGXYLz
         XRXvLUk5/+I04WWy7FCL0sLq4G94vw7QdXKfevLaySsnixEVKYZjC38zOVHNwqTkRYLN
         La8EC6Kxt6FBWP9D25iK6dlCY0QSnmFPjI0JmdW+T/tdAWhzrLYaOiJHbt1NLSwEkhEx
         Y5DRG1yTcLpH7SVmPZVFWQDYEG3aMUf+bQ4cF2ARtkMOy6ywbUIdkC/0GkwZWXKV+ZrI
         GJxdb71yq3kNI4ucwGOAP83wwCKHEcGCH1dgmfnG+q6ylSw4bmYBixyYObvyjE2aYJuI
         JqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLYy9GrW221tE7bgw0J/86UTqSktvqRhGJxBlLeC3CQ=;
        b=C/C5NPsVPWb4XYiXEl3XaOLe+76uZFOGbqdB5xuLxr3255BPP756dUbEer6uSduQoo
         hFF+Ytq60KRjiH77ialvpGQCwjRh+nDMQb+5ZJOsu5IdhAlnqg5nmZOnGFSD0eOzO0V+
         1VktPn32AVtBSlckR2KqoOVsXkAQJHx/IgVFYxJBQUHIE/stK923SHyCo5xSW8Ymxw/C
         JKPUAubDXKXr5kKwzFj60O+7hNPbG4qyHLGjWgNocaNSsBjgBSi1h+A4ts2ndnpqoqun
         WG/mjVNoPXlto5mTNn8/4SfLs41fPfDm/4/cXm84Mw6WwGN4EvFv3/TLOIOkL9PTK1es
         SSkw==
X-Gm-Message-State: AOAM533AdnOVUVU3SxhJDPCvsmP6aZBAaBPIxIH+0xpar5xRZr4pHqhe
	R3Z2U5IlisFe/MwJEVoGSFAF6g==
X-Google-Smtp-Source: ABdhPJyX27kWdIdFacrNhU+B2wpKeoJmDR9OAO7qJiUZ6oA3MPy3XKvt03Krjrfl2kApfFtGjVazXw==
X-Received: by 2002:a1c:dc82:: with SMTP id t124mr3481528wmg.94.1606397937237;
        Thu, 26 Nov 2020 05:38:57 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id s133sm7035825wmf.38.2020.11.26.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:38:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dany Madden <drt@linux.ibm.com>,
	Daris A Nevil <dnevil@snmc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Erik Stahlman <erik@vt.edu>,
	Geoff Levand <geoff@infradead.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
	Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Allen <jallen@linux.vnet.ibm.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Lijun Pan <ljp@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	netdev@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>,
	Paul Durrant <paul@xen.org>,
	Paul Mackerras <paulus@samba.org>,
	Peter Cammaert <pc@denkart.be>,
	Russell King <rmk@arm.linux.org.uk>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Santiago Leon <santi_leon@yahoo.com>,
	Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
	Utz Bacher <utz.bacher@de.ibm.com>,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/8] Rid W=1 warnings in Net
Date: Thu, 26 Nov 2020 13:38:45 +0000
Message-Id: <20201126133853.3213268-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resending the stragglers.

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (8):
  net: ethernet: smsc: smc91x: Demote non-conformant kernel function
    header
  net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
  net: ethernet: ti: am65-cpsw-qos: Demote non-conformant function
    header
  net: ethernet: ti: am65-cpts: Document am65_cpts_rx_enable()'s 'en'
    parameter
  net: ethernet: ibm: ibmvnic: Fix some kernel-doc misdemeanours
  net: ethernet: toshiba: ps3_gelic_net: Fix some kernel-doc
    misdemeanours
  net: ethernet: toshiba: spider_net: Document a whole bunch of function
    parameters
  net: ethernet: ibm: ibmvnic: Fix some kernel-doc issues

 drivers/net/ethernet/ibm/ibmvnic.c           | 27 ++++++++++----------
 drivers/net/ethernet/smsc/smc91x.c           |  2 +-
 drivers/net/ethernet/ti/am65-cpsw-qos.c      |  2 +-
 drivers/net/ethernet/ti/am65-cpts.c          |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c |  9 ++++---
 drivers/net/ethernet/toshiba/spider_net.c    | 18 ++++++++-----
 drivers/net/xen-netback/xenbus.c             |  4 +--
 drivers/net/xen-netfront.c                   |  6 ++---
 8 files changed, 37 insertions(+), 33 deletions(-)

Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Dany Madden <drt@linux.ibm.com>
Cc: Daris A Nevil <dnevil@snmc.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Erik Stahlman <erik@vt.edu>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ishizaki Kou <kou.ishizaki@toshiba.co.jp>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jens Osterkamp <Jens.Osterkamp@de.ibm.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Allen <jallen@linux.vnet.ibm.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: netdev@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Paul Durrant <paul@xen.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Cammaert <pc@denkart.be>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: Rusty Russell <rusty@rustcorp.com.au>
Cc: Santiago Leon <santi_leon@yahoo.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Cc: Utz Bacher <utz.bacher@de.ibm.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: xen-devel@lists.xenproject.org
-- 
2.25.1


