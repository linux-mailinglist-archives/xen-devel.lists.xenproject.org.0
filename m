Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F2A4CB64
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 19:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900536.1308407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpAvO-0005gu-M4; Mon, 03 Mar 2025 18:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900536.1308407; Mon, 03 Mar 2025 18:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpAvO-0005fV-JF; Mon, 03 Mar 2025 18:53:58 +0000
Received: by outflank-mailman (input) for mailman id 900536;
 Mon, 03 Mar 2025 18:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpAvN-0005fK-O4
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 18:53:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db5ea915-f860-11ef-9ab3-95dc52dad729;
 Mon, 03 Mar 2025 19:53:55 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so51780085e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 10:53:55 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47965f3sm15140904f8f.9.2025.03.03.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 10:53:54 -0800 (PST)
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
X-Inumbo-ID: db5ea915-f860-11ef-9ab3-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741028034; x=1741632834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXb6sYy/XnAXzqISnjQ/S5snGzuW0HU8RlEFyO+RPZI=;
        b=m911OlkB/05FcZpAYMTIJEfq7f7I/n8tAd6TxPy3yyOmPd9p3ftOP/eoVicxgDNlTX
         rskpuEHdwVeB+A13oIwvdy5yYGIVfnP3P2WTfWdhxaYO9WnMYvhVkWVDwEXqAOpu/a9o
         rK+50zRvtAVF8WL28HOoLzIIVRVxdGVoG3YEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028034; x=1741632834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXb6sYy/XnAXzqISnjQ/S5snGzuW0HU8RlEFyO+RPZI=;
        b=vqDtgGLuLdRpTtJdph8g6/EeYpKJkDF4GDvOt1H/Q66dt5buaYEitH9V3gVPJKyawV
         cOqYljI2CXpFbdeCP+aOmhVvpk1Du/BS+hubb/K8XmvbNPlZ6fBtA0fg4oqTkwKMo7HF
         img+x5ugpp2a40vy213rswAb+o441sxIfpLT047om5TESJ28fcWrdgXL+iRe+BiZIeDF
         hDtCzm+RYJD7QZRzY/b0ZeH1oZkR2lKYHGNs2gs7zNMN1bogmqJOCvHeEzoByaIV5pl0
         fq/f4lQqeac/HOo1TUSO/QeciQ+UW/S6V8yKu2ei0RIpp6IiemCXQQULRGKfAZhAeX9G
         gtwQ==
X-Gm-Message-State: AOJu0YzjDlrd/IhPI07xk9ltjezghmJxRMh94LvylM7PyjuTc52rRzE0
	2+jOk4uhqb7TtnC5BC3ZNtgfvPL5YyLkZ3sZBHAFk9V6bLBl4GrK8yKAl4pNEXnIjicOlVi6Hb6
	5
X-Gm-Gg: ASbGncuJYjel7oyelrhZBeod1cRHr0Wt3+nH/qAsdBWnjWXWvujX0MkqfBPy9UcbM6J
	9RlckpdMvQQ46MBe5rNUHilzHlLsHr5+MTpsEgnGZG+U5wD+bWc3yY+vDYTNB+NoK9OiCWIzlZl
	TU0RKRZDhoQrmA+jsBCB6T4eZ99MIkDHqUO2fULhAiJA+DYGHOhxLovmHOM7thMikwwrdZOj7Z3
	TWfwY7PD9q0ofEaiYaorrItxXUxNX0jaVOULbezfNFLF0m4NwQ5vZUM4mCps3df6Dl4r8aVhyLV
	x1Vdk3sYjdFdufb7+LNugiQ5Wxcf2hpXd3O1jBiDCrWJK2LB3+rjk/Q=
X-Google-Smtp-Source: AGHT+IEy2Fkb9fgoHtZYEd0g1sFHiqQbjhbokw3NxJx4w3trL0nK4BwXfjCyinFmSN7yCHvr+fx2jg==
X-Received: by 2002:a05:600c:4fd3:b0:439:a255:b2ed with SMTP id 5b1f17b1804b1-43ba66e5f09mr144493115e9.9.1741028034622;
        Mon, 03 Mar 2025 10:53:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] x86/vlapic: Fixes to APIC_ESR handling
Date: Mon,  3 Mar 2025 18:53:50 +0000
Message-Id: <20250303185352.86499-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found because of yesterday's Pentium errata fun, and trying to
complete/publish the XSA-462 PoC.

v2 has involved substantial CPU archeology, but has confirmed that the
LVTERR delivery behaviour is implementation specific, and therefore
Xen is fine to stay with it's current behaviour.

Andrew Cooper (2):
  x86/vlapic: Fix handling of writes to APIC_ESR
  x86/vlapic: Drop vlapic->esr_lock

 xen/arch/x86/hvm/vlapic.c              | 34 ++++++++++++++------------
 xen/arch/x86/include/asm/hvm/vlapic.h  |  1 -
 xen/include/public/arch-x86/hvm/save.h |  1 +
 3 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.34.1


