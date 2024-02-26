Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EB8675B5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685525.1066376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVe-00053j-Ix; Mon, 26 Feb 2024 12:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685525.1066376; Mon, 26 Feb 2024 12:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVe-00051p-Ec; Mon, 26 Feb 2024 12:55:06 +0000
Received: by outflank-mailman (input) for mailman id 685525;
 Mon, 26 Feb 2024 12:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1reaVd-0004hn-2S
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:55:05 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4205485a-d4a6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 13:55:03 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so399546466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:55:03 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a42e4b5ab00sm2379645ejc.41.2024.02.26.04.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 04:55:02 -0800 (PST)
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
X-Inumbo-ID: 4205485a-d4a6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708952103; x=1709556903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpfXncMohFLZgpylZu3EmkAWeq+PuPeKADHYSj96UJs=;
        b=v6OAlLR89UxQ74ZgWloIpSq5qw8DW21I2fpyFq5fslg7UAzLPc/mgPh0B6H4Q5hgnT
         l9kEkuOnaoz5wUJ+DUEMdyStPY98e4S6M93A9sOXgAo7/dKzEV+naf461FsxVMkInT5K
         xvcXgqSyW8vM8RkXdj95+CmKkaBpU8UljVj3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952103; x=1709556903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpfXncMohFLZgpylZu3EmkAWeq+PuPeKADHYSj96UJs=;
        b=ACNUZxOBRqXHpiu5PHzasvRiI0zCB24cXLPAbK3N7nKysZoUSnMuJttJAMoS/USkfO
         P1r1f43f9rwdMcfSkli4wMApYhubeNNA0RYRHXfCVv6raS605lwthy7tkn3VdIgzN2O6
         gYQhs5OqkCM7VGdGnR4J2LgLBiVm+b7AIDTGL74WznEHbQ0fX/E6Gjbh/td4qDsDvPbU
         Qxwr5ChMWQTutj+gRhodZqYGzdsOlCyD4/k2QQ4tdny1JYbR4AzCrK7zAVxkkDrJAlOC
         lcSXREmSnzPs+7ZGzbOWGmz9H8M57e8OuMSwaQJj5iKctmWAW2A1kf/CpQOZAEbw3tlz
         9JSw==
X-Gm-Message-State: AOJu0YyrAH6mpvPSyIIicuHu/dC7f2D9f72lTqxX8Cy3CMgDDz6HU73k
	3sXX8E0x8jyEv/Wzo4M8nqRx+T3RYky5OQ6EeiYhCS4UobDmx1UortspQzULACwbm+KqZDNpPc2
	d
X-Google-Smtp-Source: AGHT+IHLDkpHncUByB7yvq733QUUtLrPIsQgcZFEgyD9njN+AB36pv1EjM9BRT+uXVSZK43w/9ebJA==
X-Received: by 2002:a17:906:3516:b0:a42:615:1395 with SMTP id r22-20020a170906351600b00a4206151395mr4149355eja.11.1708952102806;
        Mon, 26 Feb 2024 04:55:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] x86/entry: More cleanup
Date: Mon, 26 Feb 2024 12:54:58 +0000
Message-Id: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Misc adjustments and cleanup.  No functional change.

Andrew Cooper (3):
  x86/entry: Adjustments to "reduce assembly code size of entry points"
  x86/entry: Simplify expressions in compat_restore_all_guest()
  x86/entry: Introduce EFRAME_* constants

 xen/arch/x86/include/asm/asm_defns.h | 12 +++++
 xen/arch/x86/x86_64/asm-offsets.c    | 17 +++++++
 xen/arch/x86/x86_64/compat/entry.S   | 12 ++---
 xen/arch/x86/x86_64/entry.S          | 76 +++++++++++++---------------
 4 files changed, 69 insertions(+), 48 deletions(-)


base-commit: 8de3afc0b402bc17f65093a53e5870862707a8c7
-- 
2.30.2


