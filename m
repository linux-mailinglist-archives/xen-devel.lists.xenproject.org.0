Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743C960CBE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784068.1193441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwho-00049V-3V; Tue, 27 Aug 2024 13:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784068.1193441; Tue, 27 Aug 2024 13:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhn-000480-Ug; Tue, 27 Aug 2024 13:57:55 +0000
Received: by outflank-mailman (input) for mailman id 784068;
 Tue, 27 Aug 2024 13:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwhn-0003sI-7W
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:57:55 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af6c258-647c-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:57:53 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5334c018913so5306700e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:57:53 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588adf2sm113898966b.173.2024.08.27.06.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:57:51 -0700 (PDT)
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
X-Inumbo-ID: 5af6c258-647c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724767073; x=1725371873; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYUYCRiWwMW/1FuT+OVshjNKOGKuxH1Fw4wYQKJXxb0=;
        b=sqrurdTT8jjhh+R+YEoHKDNn3anL3HqiB5b2alp9mnxCInAJ2I9flMuPtOO9xatRoh
         PF8lGN1a0MOlzABrjdRpe6JboDLY7jNjW6fHIuh/9/+0b5qx04PdKTvdNlAEAESm6UOs
         4NaQrxlrzcL6xOYIspJYk339mTKluZopSaW6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767073; x=1725371873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYUYCRiWwMW/1FuT+OVshjNKOGKuxH1Fw4wYQKJXxb0=;
        b=kIVQrRuzHkDaiwhzXt+k65INYxLDlNZz24eAPOshLz7kVTGExRHChtBuw0TlCSrzkQ
         YtSQfe8SFETEuaJmDudU015RlVEh6o+XvztRwxukLlvhQ2Fe9ta/WXn21CglhFJRTQDj
         yqYx1x4yIU7+AyX+pnRCUOd1FpBp3SyqtM2RgzKakqW0wUAL/bTExexKD/4rUa02k8Cf
         2Rs3jSqTYe4bBgh+Q+6OKwehXth4E8lElnSinxgkqFCBywjuFWV3oAK8mPbrBBAXtHsa
         XpamJmIdzBqFL67RX2+M2dKZbUGI+JgInuMuz1osUA4PlbS/nfYrnzFuoW3uhp2RSEQU
         sN5Q==
X-Gm-Message-State: AOJu0YxH46NEuy1cj8KolGRF07fbxKdHCPG8xs4jnKVYIuQhEFZ11gC4
	hSnwTpn03wQPBNa+vC++qRMIOxydJ9IoH7vDq+YqA+2d3DIK5QwoEmAoUKgPhfmI9Gxv8rUYgoQ
	W
X-Google-Smtp-Source: AGHT+IERoOD6iXtrsHj8rsKjRo76854THB5EUFy13WvC4RK0qO0OsG8wpMiH0FsWnKKl2ZlYQq/QSQ==
X-Received: by 2002:a05:6512:1589:b0:52c:e05e:849b with SMTP id 2adb3069b0e04-53438861080mr8192058e87.39.1724767072370;
        Tue, 27 Aug 2024 06:57:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] xen/bitops: More for_each_bit() conversions
Date: Tue, 27 Aug 2024 14:57:42 +0100
Message-Id: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All patches are independent.  Patch 4 has been posted before, with only a
request for some wording changes.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1428997960

Andrew Cooper (4):
  xen/evtchn: Use bitmap_for_each() in evtchn_check_pollers()
  x86/hvm: Use for_each_set_bit() in hvm_emulate_writeback()
  x86/hvm: Rework hpet_write() for improved code generation
  x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more efficient

 xen/arch/x86/hvm/emulate.c             | 20 ++++----
 xen/arch/x86/hvm/hpet.c                | 29 +++--------
 xen/arch/x86/hvm/vmx/vmx.c             | 70 +++++++++++++++++++++++---
 xen/arch/x86/include/asm/hvm/emulate.h |  4 +-
 xen/common/event_channel.c             |  4 +-
 5 files changed, 83 insertions(+), 44 deletions(-)

-- 
2.39.2


