Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CF792282
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 14:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595649.929233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV3a-0000yA-Kw; Tue, 05 Sep 2023 12:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595649.929233; Tue, 05 Sep 2023 12:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV3a-0000wL-GX; Tue, 05 Sep 2023 12:21:22 +0000
Received: by outflank-mailman (input) for mailman id 595649;
 Tue, 05 Sep 2023 12:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddRg=EV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qdV3Z-0000wD-BY
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 12:21:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b280f1a6-4be6-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 14:21:16 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so22832255e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 05:21:10 -0700 (PDT)
Received: from localhost.localdomain ([37.69.27.38])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adfe704000000b0031c5e9c2ed7sm17364203wrm.92.2023.09.05.05.21.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Sep 2023 05:21:01 -0700 (PDT)
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
X-Inumbo-ID: b280f1a6-4be6-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916462; x=1694521262; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo1aRaoDGIJk9TkLkiwceh/LZhlV95aaWzCdG9GKBDU=;
        b=L66FSv2K8WEHYtcSJiqo1ZAKD6q2cz8cFG8hvsbRzTGWgMYJtuRcsPCyV9H3RbNxm6
         1zrhi0vc2VI6P4syzuX2PwC+ZE5Ip4+PzA9EekyZGG/QZ0jzNNsNPeYGS2SNDn5wkbLW
         7Ucg3U2gOhB+3CTkA2qAzv23Cpm9WiiEThM3dJUvw60GUXq/8oST0UFLzSvQPEe8FAGx
         /5x9RyPeGNneRXz9nZD/LUV/DYZ7VA9jrmYZR06IaERJdrn6akCWUDDHKPnojlXDO0W4
         Jlp8wyU5WYFACty0krloAJJkL/LP+7JNe6fXIJHyzlot1rmFPcNYbsEdnaPTcN15599I
         y/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916462; x=1694521262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo1aRaoDGIJk9TkLkiwceh/LZhlV95aaWzCdG9GKBDU=;
        b=a7HGM0XkvZlMuTxYh6eEyfe12DOahWWOenwgrKBE5VcUvrD8O2QfnYXZs6vCJlkuRD
         U8Ey9Ty4GALnHH8oZkGSbGsTk6H0CnIB4W5kWLqjCNvOgf5iEmOIRzjFOOVNXE+zn1Ej
         lmCJbH2O95wEKy8VtITrFWZmaw639AczsiT6gMOIMCmu3WwsuhcVSE0RBVuFdH12dHcU
         aRINky9Z4uZWviyFc6mONyWZvKzgDU0liKiDQUoeAoxvRbjizhDgh04uFxyfdRhpzA9t
         yJCdDVeEPgkzwcubbzG7dPELS0tvx3b52EIiHGwr3pmrLvjFUumVyWH8oVKcMZnisX3K
         S1AA==
X-Gm-Message-State: AOJu0YxvvCHJsqDeOKPdSvZtAaKqPBECRwmyAqRZN/pdVo5lq4D/t4Ws
	0plJ3FSncKUCGYhAhrgCr1KRfA==
X-Google-Smtp-Source: AGHT+IGj+FWbnOLg0Wi9eXeWmYpkHUZdidVng2m9pM2hnF3MRQ/aMSTXN0nrcceqHNV4hMS2iFeAfg==
X-Received: by 2002:a5d:4843:0:b0:317:3c89:7f03 with SMTP id n3-20020a5d4843000000b003173c897f03mr9032646wrs.5.1693916462037;
        Tue, 05 Sep 2023 05:21:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 0/3] sysemu/accel: Simplify sysemu/xen.h
Date: Tue,  5 Sep 2023 14:20:56 +0200
Message-ID: <20230905122100.5787-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Trivial cleanups which simplify "sysemu/xen.h".

Philippe Mathieu-Daudé (3):
  sysemu/xen: Remove unuseful CONFIG_USER_ONLY header guard
  sysemu/xen: Remove unreachable xen_ram_alloc() code
  sysemu/xen: Allow elision of xen_hvm_modified_memory()

 include/exec/ram_addr.h |  8 ++++++--
 include/sysemu/xen.h    | 24 +++---------------------
 2 files changed, 9 insertions(+), 23 deletions(-)

-- 
2.41.0


