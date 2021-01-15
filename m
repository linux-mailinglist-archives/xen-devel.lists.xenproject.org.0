Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDED2F8646
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 21:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68604.122809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VPK-0000BA-9Y; Fri, 15 Jan 2021 20:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68604.122809; Fri, 15 Jan 2021 20:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VPK-0000Ao-6Z; Fri, 15 Jan 2021 20:09:18 +0000
Received: by outflank-mailman (input) for mailman id 68604;
 Fri, 15 Jan 2021 20:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1kp=GS=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1l0VPI-0000Aj-7j
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 20:09:16 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adc77eab-6849-4931-8d6e-aeede56abd84;
 Fri, 15 Jan 2021 20:09:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o10so2520184wmc.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 12:09:15 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id d85sm9187863wmd.2.2021.01.15.12.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:09:13 -0800 (PST)
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
X-Inumbo-ID: adc77eab-6849-4931-8d6e-aeede56abd84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+7DadD0dH9745VxT7RGgUcZc8wWMxigcxcfDKgHA0M=;
        b=NGmfFs6An4O5Z1bTOhZvumD/b4aFaBLo5GodZjrpzZAET9hm3fXvg9Nat+QCjYyvUd
         Cu51qhHS/zcfGaUQTdOBKgaBLX6K/BCwPlrksmeEtHwUoIUBY9nB42PNg0260erKlRlj
         2DUVbt/VkBrxXGJW9CIugFaL8RtaUt01KqIeKMDG289Vs46noZhkbpHesaP2CnwmRG2N
         iXVwbCu6GW+WxsV6056N191kIDEz/EmAxTeGZW8Zy7NCzdpFepH5NSB8fni7nBIYJ763
         fxfAEDkdKoVffdFqVIJMUAuFA2wHGu9xpBnfqJK/+at08FCDWczw/hm8ESWiPSMbuGdq
         zWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+7DadD0dH9745VxT7RGgUcZc8wWMxigcxcfDKgHA0M=;
        b=DIwfYu7FQRCroYPgQN/Hi1yHvBgERgZcw6tLKYrvVd6i4Jmb9GA4TQg9QREk3LvLJB
         0aNTfDbC79RKwqeahEutEIu6Y2AgOnJN9yZ5b29SrxWKJEcHqLcqOSlRSCkfUpb/urJ/
         IeB9bPkJjczpiz/fTATZHTM3IXoy00rfrc5R906XwCX+53Bc51tLw3V+WtKdB5ie6Z5t
         gVpZtByLy2Y1xEFudNg2bpmlEuagsoq/AyCYDfJKzeKLYieuKg62WYtqWlxPLljbBeWM
         l03Yt3rzVmRIqU4j3RiEf3K4Zs9gd1AWBDvdtr5+woP/5TFSJWOyi8Gv24KnC3+JB1hd
         Csuw==
X-Gm-Message-State: AOAM533Uqce0UYzdCMwvTh1cfewUy/BU061e4gIOo8KxEL78+LzHxhxa
	m0g+07b0grW+bP9COnNdzbcdEQ==
X-Google-Smtp-Source: ABdhPJzRbd30yjZefst2rKry0v+qGXIk906iFx/zco+XZMf5YM39ujaWaXx9Rhy6Yqec4ppN1urxlA==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr10222048wme.15.1610741354435;
        Fri, 15 Jan 2021 12:09:14 -0800 (PST)
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
Subject: [RESEND v2 0/7] Rid W=1 warnings in Ethernet
Date: Fri, 15 Jan 2021 20:08:58 +0000
Message-Id: <20210115200905.3470941-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resending the stragglers again.
This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.                                                                                         

No changes since v2, just a rebase onto net-next.

v2:                                                                                                             
 - Squashed IBM patches                                                                                     
 - Fixed real issue in SMSC
 - Added Andrew's Reviewed-by tags on remainder

Lee Jones (7):
  net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
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

 drivers/net/ethernet/ibm/ibmvnic.c           | 27 ++++++++++----------
 drivers/net/ethernet/smsc/smc91x.c           |  2 +-
 drivers/net/ethernet/ti/am65-cpsw-qos.c      |  2 +-
 drivers/net/ethernet/ti/am65-cpts.c          |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c |  8 +++---
 drivers/net/ethernet/toshiba/spider_net.c    | 18 ++++++++-----
 drivers/net/xen-netback/xenbus.c             |  4 +--
 drivers/net/xen-netfront.c                   |  6 ++---
 8 files changed, 37 insertions(+), 32 deletions(-)

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


