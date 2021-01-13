Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B52F5028
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 17:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66622.118387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzjD9-0006gP-JM; Wed, 13 Jan 2021 16:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66622.118387; Wed, 13 Jan 2021 16:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzjD9-0006g3-G6; Wed, 13 Jan 2021 16:41:31 +0000
Received: by outflank-mailman (input) for mailman id 66622;
 Wed, 13 Jan 2021 16:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmDu=GQ=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kzjD7-0006fy-O0
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 16:41:29 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dd81de0-f52c-4ef1-bfef-db98fee0af59;
 Wed, 13 Jan 2021 16:41:28 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r7so2819466wrc.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 08:41:28 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t16sm3836510wmi.3.2021.01.13.08.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 08:41:26 -0800 (PST)
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
X-Inumbo-ID: 4dd81de0-f52c-4ef1-bfef-db98fee0af59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VH2FQtV9QAPgHDpG8J2TH6UYciFbrGSHFdOWafzf8L0=;
        b=mgWrFTRdLTo53CvivpWWpGvsnBy/sDUJBspvULY4feH6SbFZS7E8cSPYam9a5jpklb
         kqxz5+5Hc26gNe3UcOqgusUkt7Ziejsa7lie23otmOkvPtir46B1POMr13XSd0a8IEW7
         tFqivez7ig+l/Yu5jKTarybJkbTcy3RgaqCPmtjRg2u0TqPP5qmgVy1b3ErpV0pBVHmI
         5TtapSlZlEosS6jB5aYIPr45RihABmY9w53n2+ZOI6kXcfhjxDFk0/jx0MSjQWIaWGxJ
         kfUHXACCiKmAWR/WOIPTsUaSGUcx1Tvs4u5jbxrAqqHl3wPj/+iimviABCXYtr63aizN
         y4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VH2FQtV9QAPgHDpG8J2TH6UYciFbrGSHFdOWafzf8L0=;
        b=UPA1Rit0HyS0vGgDMOsSN2bNuOKbuiT6+ss8BW86Ujh6dpjS9k5LVldCJvzd8uS5ao
         8ZL937ysVUGlhivqZFx9Vmq6crjV95ZDlZljZ4+nIZlzjiCyYvaYOlRWGaP+UXGI0wfV
         3la1XjLggeqoBrKuy+nmz0mhDsQ6edAscq8Cm+96jV2K9X5DUrP34g+nccpyn5WDjo3v
         zRrCPJxiIkaryU00caml9X5Q6PbKuRgLoS5+yqOfDiRw7ve3VSSWqba9utgJwuz/vJFg
         Ne0XQtO5JqeAOD5w9Pfvmnu2Pf6dAR4uVbPlCDFtFqAEfUHe+po8zMpJlwKnRKPTilpD
         Q6KA==
X-Gm-Message-State: AOAM530dslN6TdcaCGBt13soYv8uV2cjukUGEmCwFw1o75FKekdlCVyu
	eEKjrW4YS1Jz2gk7PbrNrkNRww==
X-Google-Smtp-Source: ABdhPJxhdh6nQ0ZeDfEEeSe5MD+NUFjp0Ab5CLvQ9W4maua5nayIueG0xrQYYgqoBCc5WqlU293mGw==
X-Received: by 2002:adf:82c8:: with SMTP id 66mr3473402wrc.420.1610556087746;
        Wed, 13 Jan 2021 08:41:27 -0800 (PST)
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
Subject: [PATCH v2 0/7] Rid W=1 warnings in Ethernet 
Date: Wed, 13 Jan 2021 16:41:16 +0000
Message-Id: <20210113164123.1334116-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resending the stragglers again.                                                                                  

This set is part of a larger effort attempting to clean-up W=1                                                   
kernel builds, which are currently overwhelmingly riddled with                                                   
niggly little warnings.                                                                                          
                                                                                                                 
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


