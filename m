Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A6AC063C
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993098.1376542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lL-0006Nc-5G; Thu, 22 May 2025 07:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993098.1376542; Thu, 22 May 2025 07:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lL-0006Lq-28; Thu, 22 May 2025 07:54:47 +0000
Received: by outflank-mailman (input) for mailman id 993098;
 Thu, 22 May 2025 07:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI0lJ-0006LU-LY
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:54:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 058481f5-36e2-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:54:43 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so55742325e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:54:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca5a04csm21898743f8f.23.2025.05.22.00.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:54:41 -0700 (PDT)
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
X-Inumbo-ID: 058481f5-36e2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747900482; x=1748505282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9QsM4NKOwV2R5dlmGWrikes0+MG3PhOjvwu44Y10RU=;
        b=VFb0x1yulla/1WxcIzG9GktthxnJVYoaCp8Ka7hxil42xPXVlcis+BHaGLPhfvMa1C
         jW1sMTzugKTyorYQJ367tt7wU7z0cs/EP6Rc+VF72vIfoZ4WrSlo161OfSxOho421HO9
         IB6rd7QW2hzLPe+aV9Gssc1Ag7KjX83queHLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900482; x=1748505282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9QsM4NKOwV2R5dlmGWrikes0+MG3PhOjvwu44Y10RU=;
        b=nOWoFp84OriXYpIYdnkZXxmRhNh7n5vr5TKrWXLjufnKfIatRtjbN5YL60exA97LBr
         1Db/MkXLT9y27A2SrEgMrYEKV+NWihZIdyP4dBlszcJWM0pGD1+03sT6J+i1ELyZNaWr
         0Czd/jiLg1shhJsdybjNvS13Nt/g9+OcdUhq2Auhp6ewR0cmCi2WG//r9616lytKxvQb
         Vk2vSIrA9xeobHeVTTYIKncBTHm5bnwa+YPSqyIGjtZFMqU6HvEuwAT71s5dCneWlH3t
         z/4TTo/xol/YaOojPeJj8+m8BwL1bf7mMLQw8sjHhjaS8m73Xg2/6MyaJpS2j8RhdHPl
         LUZw==
X-Gm-Message-State: AOJu0YyrD9xZIqtcHbVpHxPhieIk9Y2f/vty3LsbsuskzA+A9NlZKLRh
	rvZOZkqKo1jgKuNqenKq+3Q70c+Fvaiy08z7eS5RQX4h6HopsF6PB3RyNLR8iA1vU8Skh1cL8Yv
	i9Sfr
X-Gm-Gg: ASbGncuc20oHkb95q0TW002e2MYJAqvxISbqJE4KIOJDXwm6bqVYYMYLqZeEQb4Z71I
	+/HacVzAAS1WSklAux1ImfQlLUV/++GiH7AvgimUtm7sUKf+ix+/bErRnlj8R3BLa8d2LrAoBAl
	lR3kmtNUOnd+1oLgEs86djnqIymK8j/0b0YtYg1Jr99N3j2rLZCXasQk6pQ9UaHXpatfnc2O6Nr
	PYmMlieZTfTsPuB2pwV+GCnIIEmD7aqugW15Pn9IXao53q3glW7QwuMAblVqD+DBLL4YBRAWBg0
	wIkIiDuxWONG68TnyVXX04M2FcsuQYuHujxIusnfy/TO46/ZhUu9FH09jB5S9lcp7EyypYuouXO
	4GR9h7xb1owjrRLMeDvI=
X-Google-Smtp-Source: AGHT+IFgiLlTLphN51lEGGGXKJNhq/uJDJhi7PgykBfcB9NyDP+TqnYfXQjeTOsEorzfAEyCPC07FA==
X-Received: by 2002:a05:600c:5247:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-442fd60b4e8mr201922505e9.6.1747900482262;
        Thu, 22 May 2025 00:54:42 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/4] x86/boot: provide better diagnostics in AP boot failure
Date: Thu, 22 May 2025 09:54:36 +0200
Message-ID: <20250522075440.99882-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series attempts to improve AP boot failure diagnosis by improving
the printed failure messages (patch 1) and detecting AP getting stuck
during bringup (patch 4).  Patches 2 and 3 are preparatory changes for
the work done in patch 4.

They should be non-functional changes for systems working correctly.

Thanks, Roger.

Roger Pau Monne (4):
  x86/boot: print CPU and APIC ID in bring up failure
  x86/traps: remove smp_mb() ahead of IPI dispatch
  x86/traps: split code to dump execution state to a separate helper
  x86/boot: attempt to print trace and panic on AP bring up stall

 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/smpboot.c               | 14 +++++-
 xen/arch/x86/traps.c                 | 64 +++++++++++++++++-----------
 3 files changed, 51 insertions(+), 28 deletions(-)

-- 
2.49.0


