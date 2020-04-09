Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDDE1A3909
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMbAu-0005nR-4J; Thu, 09 Apr 2020 17:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Iid=5Z=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jMbAr-0005nM-Tb
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:41:09 +0000
X-Inumbo-ID: 4bcfd43e-7a89-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bcfd43e-7a89-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 17:41:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y24so601708wma.4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5eep34qFM9WTUXMciMCrMC8mHfKlQON/nFhYf3jFqg=;
 b=ODOhJQQZ2cFHEdxIqvQv6xyJOshCXluZ3X/m2XbmUlkBFUXbhqC+gO95cz3qfNM5Rg
 IF0msiyf6IEAX/DfqN0XbF24R6kxFGr29ZCyhTLenP1xYzpXWy3tGoz439pAh/Zq2xIW
 2ugE7mSM2J06StaBuLztuOyQGd2hU/3OFyhUXahNh0KMyIR0oRJIvVDn+p6QFQGhkWYL
 HaAG7qUmyvn9gM1RB0923n0KMKrLuVoiu6ay0YEYPjDrs26KQAw3Qcq156k1pHEJlYV5
 mj4306ZKR9GU3yNd8JIuDlEcZuH/YrdxKjlaYOHjlYSnFPxF19gyR0rL11YAzZzF7s9h
 Y5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=E5eep34qFM9WTUXMciMCrMC8mHfKlQON/nFhYf3jFqg=;
 b=SE325lX1nAxZRpGeOYFXI7Dalu0QGWAVzMDmMyRtdL9ipESWHNVYPhTamwofD+F9b4
 6ZF0WeAp2P7GbK6ZB4KCNDGuHk+tSGbQLLx4SA7kDZGamJuHPFqFraIIH01HX+qCiz0R
 p+ihOEBmjxXGVx6qHLp0nKN8KJ809QLvKULCisDta0G+Yw/PjhKm4Oip6DQ70frZw/Q8
 Cu741vF58yc8O6gelVWOeqauvRYaDqw/S3hE2V+Lels016j772yz+lI+YDEyumndh5+O
 N6wbDqvFfF+5biM1ppaKz957zf3nBn1mHcd2J2OoYSRI8ubBn7YN+tTW/dhXv4zeTV/F
 8FeQ==
X-Gm-Message-State: AGi0PubEwFwziePUxolZgkEReitC+tBt7mL9iNbZjShyXVUlmBD6tRPw
 BuhkBLM+eyXX8NRPigPKVTZI/uDz
X-Google-Smtp-Source: APiQypJpL/MirOXRsXiJ3Pr0IuG+zLESLV8Ljo43hy0WukG7hYWBrPgAWnp8khz1z/5UK8b/CtSrAg==
X-Received: by 2002:a1c:4c0f:: with SMTP id z15mr941417wmf.95.1586454068385;
 Thu, 09 Apr 2020 10:41:08 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 c18sm40086006wrx.5.2020.04.09.10.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 10:41:07 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH v5 0/3] Xen on Hyper-V: Implement L0 assisted TLB flush
Date: Thu,  9 Apr 2020 18:41:01 +0100
Message-Id: <20200409174104.23946-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all

This seris is based on Roger's L0 assisted flush series v9. In patch 1 I
dropped FLUSH_TLB_FLAGS_MASK per Jan's request. Other than that, nothing
is changed.

Wei.

Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Michael Kelley <mikelley@microsoft.com>
Cc: Paul Durrant <pdurrant@amazon.com>

Wei Liu (3):
  x86/hypervisor: pass flags to hypervisor_flush_tlb
  x86/hyperv: skeleton for L0 assisted TLB flush
  x86/hyperv: L0 assisted TLB flush

 xen/arch/x86/guest/hyperv/Makefile     |   2 +
 xen/arch/x86/guest/hyperv/hyperv.c     |  17 ++
 xen/arch/x86/guest/hyperv/private.h    |  12 ++
 xen/arch/x86/guest/hyperv/tlb.c        | 214 +++++++++++++++++++++++++
 xen/arch/x86/guest/hyperv/util.c       |  75 +++++++++
 xen/arch/x86/guest/hypervisor.c        |   4 +-
 xen/arch/x86/guest/xen/xen.c           |   2 +-
 xen/arch/x86/smp.c                     |   2 +-
 xen/include/asm-x86/guest/hypervisor.h |  10 +-
 9 files changed, 329 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/x86/guest/hyperv/tlb.c
 create mode 100644 xen/arch/x86/guest/hyperv/util.c

-- 
2.20.1


