Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87AAE6C9E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023953.1400027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gj-0000Dw-Hv; Tue, 24 Jun 2025 16:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023953.1400027; Tue, 24 Jun 2025 16:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gj-00008v-CB; Tue, 24 Jun 2025 16:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1023953;
 Tue, 24 Jun 2025 16:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7et=ZH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uU6gi-00006F-K6
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:40:00 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddaf4de0-5119-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 18:39:58 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2883247f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:39:58 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810caefsm2295472f8f.87.2025.06.24.09.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 09:39:57 -0700 (PDT)
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
X-Inumbo-ID: ddaf4de0-5119-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750783198; x=1751387998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYwnFK0C0cMRTnZqft/FNMzoDb8C6vWJ4xwQUmz06WM=;
        b=JkaFHxHDk+oQ1ZxwWMLtu4jXa2QdWxga5nwyuvXOS6IKYWVyYODVjXb4IAJGUNOV13
         C7gOIinfu6cDUDnIZIN2AxZZmSSE6MRokTZvNoFVLaYmd3WTeluEBsON7UhxlKFBKLNN
         4/ED0evzH4PatJOL64ggLnQjXffX9qefCfFfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783198; x=1751387998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYwnFK0C0cMRTnZqft/FNMzoDb8C6vWJ4xwQUmz06WM=;
        b=wU8dpEbAYVd+LqMovT/cObMjyyIdCkpRwOjXtX4EtuYX4u6s9tiRLTCXKeADqNP/kz
         KxjNOdffW4F6EDD+mX/mPHxwLi6cfPhc+BB9dNDhuJoAK0bLZfelZz6j6huqMjW5LgJY
         m+Z2OiwkLM2PHUv/nNOwyOx/ZVjuyp6IfYx/4Bj7Yk9GXIivscgZkdWtj6K1pYZfV3sD
         EWJ1yuCBbkDqWj07DCrwXohdLEd1zYv2jYtVev+4lGD10igALaiV2xktwJvnrWxixrdC
         57kYgPnP9eER94FuO4YzUk2eHrcdykoVM65VABpiUP+17AhwoOGvg5aEn0hC7VwLvCmo
         GsVA==
X-Gm-Message-State: AOJu0YwQDTva7yWl9D9W754mnqNDVC/EWMfEll7zOCElOp11yQqlzIiu
	3+PIqfaHVLHXNiEGLmi820QRf0KcmwRfBoQsY3t8UHRf+HoFbBTJ2vUMPb8UqAskxVVGlIrly4S
	4bx7HO8lSQZib
X-Gm-Gg: ASbGncvu20j/1VSUvftdrXVnkd3fOeVZjASGsOMZm8wWBxY8qM3n/jXFid3GfmC4/bN
	tIn355dqrlwVyeFh6JqmqH3XMafmhGlCW+qObiQefJuc3St+ly5c0vt7Cdwo6PJ6+iJQgR9dar0
	V6/PD7DflduDp+7krGVwX93iiuE0iqIxDlAK+IPS6Hp0BOg23JAdgKDnnpmgGasOB3IxyibYjV9
	KJyJ8Yw29fe1j5alzrJoGlURtqzWysn6qosUUuhGaS9y0CyKL4ZPEp35YWWBhFR9NKhl5z+lOtY
	+S94qjYdaAB340TPj0XJYgwsKfC8DkhQ0OtEisGXBGURt6+bNxoJsI6ROPigmIAMWGu36kSlQUT
	R1agspfEt0PWF0uuOkiQ41c3PSYOUiDIKQ70=
X-Google-Smtp-Source: AGHT+IHiMcqReeXuTvZrLXu14uY6Rc20uOTaaUVUUM+BzmlGvgR2/Hwks1nJqqegnC27WWyS2OB/Vw==
X-Received: by 2002:adf:b605:0:b0:3a5:3930:f57 with SMTP id ffacd0b85a97d-3a6d13160c0mr12867062f8f.51.1750783197737;
        Tue, 24 Jun 2025 09:39:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] x86/idle: Fixes and cleanup
Date: Tue, 24 Jun 2025 17:39:47 +0100
Message-Id: <20250624163951.301743-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assorted fixes for mwait/monitor that I've had sitting around too long.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1887059030

Andrew Cooper (4):
  x86/idle: Move monitor()/mwait() wrappers into cpu-idle.c
  x86/idle: Remove MFENCEs for CLFLUSH_MONITOR
  Revert part of "x86/mwait-idle: disable IBRS during long idle"
  x86/idle: Misc cleanup

 xen/arch/x86/acpi/cpu_idle.c           | 94 ++++++++++++--------------
 xen/arch/x86/cpu/intel.c               |  3 +-
 xen/arch/x86/cpu/mwait-idle.c          | 12 +---
 xen/arch/x86/include/asm/cpufeatures.h |  3 +-
 xen/arch/x86/include/asm/processor.h   | 17 -----
 5 files changed, 51 insertions(+), 78 deletions(-)


base-commit: cc7394164633e75fb61d52565f75271e0b7f1236
-- 
2.39.5


