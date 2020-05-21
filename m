Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F491DC539
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 04:32:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbb04-0000FC-PF; Thu, 21 May 2020 02:32:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsrW=7D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbb02-0000F6-WD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 02:31:59 +0000
X-Inumbo-ID: 3e6df7a6-9b0b-11ea-ae69-bc764e2007e4
Received: from mail-ot1-f66.google.com (unknown [209.85.210.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e6df7a6-9b0b-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 02:31:58 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a68so4351376otb.10
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 19:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lqT0rYGXAALaM5oRy93eFgEEeqmfVVoL1lRpleol+kI=;
 b=XhXPv8JzlqkYS86ILA/PhouyjuWLD4MAINuI4mEzyuQVQ19cu+hCPIpUmDMOxzeY+D
 MGCoioICMa3fvfb5Cxd2toa39PiKQJuajdqo40NkHWr02UhjmP2CrY9szfzZsldx6rQW
 r67DGQtCqI0BbZ5bX6pPkno2nvypX/PQ43DWMq/bkKd9ehSJz2F5huOXaruoIn7lpUex
 YD0bR9nMVKtAqCQ6wkRwgHsjXvqvYxyM7o1ErkCdzjQA5DOsqVkXRWGmzikcxXF2gWLL
 QyakteMb/8povRPfbG3p2IIwmvZw5R6swAwf4c/JJgsaYdn5+HjbtDL9Th4t/rZKYVo/
 7x6A==
X-Gm-Message-State: AOAM533HnFXWVsf36owVT8TzQX+L0TbxToztuoX4t8ioELWjRBxMmz+l
 01GdcqU12gM4XfDS1D/Uil4zfpdp4Ow=
X-Google-Smtp-Source: ABdhPJwP80gNyO2BO1OARPyAuTYqYMbZOfnfg26W2PGWnf8JfkcjHemYO/SXXkhq7TuVtBsb+DyR7w==
X-Received: by 2002:a9d:6352:: with SMTP id y18mr5968701otk.4.1590028317478;
 Wed, 20 May 2020 19:31:57 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id r17sm1312480ooq.2.2020.05.20.19.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 19:31:56 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 0/3] vm_event: fix race-condition when disabling
 monitor events
Date: Wed, 20 May 2020 20:31:51 -0600
Message-Id: <cover.1590028160.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For the last couple years we have received numerous reports from users of
monitor vm_events of spurious guest crashes when using events. In particular,
it has observed that the problem occurs when vm_events are being disabled. The
nature of the guest crash varied widely and has only occured occasionally. This
made debugging the issue particularly hard. We had discussions about this issue
even here on the xen-devel mailinglist with no luck figuring it out.

The bug has now been identified as a race-condition between register event
handling and disabling the vm_event interface.

Patch 96760e2fba100d694300a81baddb5740e0f8c0ee, "vm_event: deny register writes
if refused by  vm_event reply" is the patch that introduced the error. In this
patch emulation of register write events can be postponed until the
corresponding vm_event handler decides whether to allow such write to take
place. Unfortunately this can only be implemented by performing the deny/allow
step when the vCPU gets scheduled. Due to that postponed emulation of the event
if the user decides to pause the VM in the vm_event handler and then disable
events, the entire emulation step is skipped the next time the vCPU is resumed.
Even if the user doesn't pause during the vm_event handling but exits
immediately and disables vm_event, the situation becomes racey as disabling
vm_event may succeed before the guest's vCPUs get scheduled with the pending
emulation task. This has been particularly the case with VMS  that have several
vCPUs as after the VM is unpaused it may actually take a long time before all
vCPUs get scheduled.

The only solution currently is to poll each vCPU before vm_events are disabled
to verify they had been scheduled before it is safe to disable vm_events. The
following patches resolve this issue in a much nicer way.

Patch 1 adds an option to the monitor_op domctl that needs to be specified if
    the user wants to actually use the postponed register-write handling
    mechanism. If that option is not specified then handling is performed the
    same way as before patch 96760e2fba100d694300a81baddb5740e0f8c0ee.
    
Patch 2 performs sanity checking when disabling vm_events to determine whether
    its safe to free all vm_event structures. The vCPUs still get unpaused to
    allow them to get scheduled and perform any of their pending operations,
    but otherwise an -EAGAIN error is returned signaling to the user that they
    need to wait and try again disabling the interface.
    
Patch 3 adds a vm_event specifically to signal to the user when it is safe to
    continue disabling the interface.
    
Shout out to our friends at CERT.pl for stumbling upon a crucial piece of
information that lead to finally squashing this nasty bug.

v2: minor adjustments based on Jan's comments

Tamas K Lengyel (3):
  xen/monitor: Control register values
  xen/vm_event: add vm_event_check_pending_op
  xen/vm_event: Add safe to disable vm_event

 xen/arch/x86/hvm/hvm.c            | 63 +++++++++++++++++++++++--------
 xen/arch/x86/hvm/monitor.c        | 14 +++++++
 xen/arch/x86/monitor.c            | 23 ++++++++++-
 xen/arch/x86/vm_event.c           | 23 +++++++++++
 xen/common/vm_event.c             | 17 +++++++--
 xen/include/asm-arm/vm_event.h    |  7 ++++
 xen/include/asm-x86/domain.h      |  2 +
 xen/include/asm-x86/hvm/monitor.h |  1 +
 xen/include/asm-x86/vm_event.h    |  2 +
 xen/include/public/domctl.h       |  3 ++
 xen/include/public/vm_event.h     |  8 ++++
 11 files changed, 144 insertions(+), 19 deletions(-)

-- 
2.26.1


