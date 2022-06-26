Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCE55B424
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 23:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356135.584171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXl-00032l-7l; Sun, 26 Jun 2022 21:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356135.584171; Sun, 26 Jun 2022 21:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXl-0002zk-4g; Sun, 26 Jun 2022 21:11:45 +0000
Received: by outflank-mailman (input) for mailman id 356135;
 Sun, 26 Jun 2022 21:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5ZXj-0002ze-PW
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 21:11:43 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 930c94fe-f594-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 23:11:42 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id lw20so15193372ejb.4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 14:11:41 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm6367556edb.60.2022.06.26.14.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:11:40 -0700 (PDT)
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
X-Inumbo-ID: 930c94fe-f594-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qduxVfcPOGMNJk2aZ/6LiSflO/gNs4M/uoLPaxFuqI=;
        b=l0umNaPa48VuyaWeWwKUHz/ZvTdUaBnP73WaWMnnelaE7bVPBYqmfKys0u1YU+3Uzq
         iBXy9he3/DDh3QzJv6SNdjywm8m9cGW19NNDIUFwbdR0aZr2blGWwibGbjoQPE/B0Fsz
         xNgKHppL4z9T0fDgVAfmcTLhNESHTI9hwQUwI8YT1PzwLch+BPtOclH/cDnp1oPMstes
         9+vq6RZciDyOoX0hXlPX4XDOVIAOZQlvOYpyxtQpUq+omp5ujsgsTpUB6h/dNemYVZi4
         RPoEGzhgBxpZqOj/CvKPe2QcdFAl2BrgrVweB8cif/5EO0hx6iqToStMLkY2T/A5yrhR
         elUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qduxVfcPOGMNJk2aZ/6LiSflO/gNs4M/uoLPaxFuqI=;
        b=l6WyTbnrk/HqeNJOH9rqDX5X/YH6Lr5dhYP7J1UlYfK8qmRDz1u/9MjU240YXMVvL5
         aYtbrSl7Z4xZUOsCVeLOrbNPuxnpHBfcrZbEYjyygVhZYV1Iv4dZD5nS7GZ2qvL6ntc+
         Tfuhhpjz97VZ1W/bSN3NEu0K3D6DvlQ+kAVmIUpgeJ376KvJyOnBsEUq/PYQnBcTICj8
         uJMlaYuJt0EXMSnOwKGdFwwLTeqY2WnsZcoD2+ErtDyvalFxEy+HDjTqmDXrltvciz84
         2L/SQ+Q52TrUMBI5rPk3AIwVqskxwJrQmA1/xoPD3uO89W0JlMpaoTgUUt/oGkZCrse1
         58cg==
X-Gm-Message-State: AJIora8rVl0F1bCPNKKzJQo3jPDqOPrMTzMuEtwP3w8y5S+9dQed+HeT
	+zx67GaV/2f77MHN0+Lmpf0FnZTFB9tPig==
X-Google-Smtp-Source: AGRyM1t9NbO0l9vtidZltnkofT1vz6DNU0R4X5dmgUIGYW1MYJ6Bym85yUDBHtGbpFteqvHRotynnw==
X-Received: by 2002:a17:907:6e17:b0:726:2b3c:d373 with SMTP id sd23-20020a1709076e1700b007262b3cd373mr9520821ejc.357.1656277900662;
        Sun, 26 Jun 2022 14:11:40 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/5] Fix MISRA C 2012 violations
Date: Mon, 27 Jun 2022 00:11:26 +0300
Message-Id: <20220626211131.678995-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve MISRA C 2012 Rule 8.4 warnings.

Xenia Ragiadakou (5):
  xen/common: page_alloc: Fix MISRA C 2012 Rule 8.7 violation
  xen/common: vm_event: Fix MISRA C 2012 Rule 8.7 violation
  xen/drivers: iommu: Fix MISRA C 2012 Rule 8.7 violation
  xen/sched: credit: Fix MISRA C 2012 Rule 8.7 violation
  xen/arm64: traps: Fix MISRA C 2012 Rule 8.4 violations

 xen/arch/arm/arm64/traps.c             | 1 +
 xen/arch/arm/include/asm/arm64/traps.h | 2 ++
 xen/common/page_alloc.c                | 4 ++--
 xen/common/sched/credit.c              | 2 +-
 xen/common/vm_event.c                  | 2 +-
 xen/drivers/passthrough/iommu.c        | 2 +-
 6 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.34.1


