Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594298A99D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 18:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807550.1219088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJ6i-0001D4-Me; Mon, 30 Sep 2024 16:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807550.1219088; Mon, 30 Sep 2024 16:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJ6i-00019w-Fp; Mon, 30 Sep 2024 16:18:44 +0000
Received: by outflank-mailman (input) for mailman id 807550;
 Mon, 30 Sep 2024 16:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svJ6g-00019g-Ri
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 16:18:42 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fdcac7-7f47-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 18:18:41 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso40211181fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 09:18:41 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776d83sm550760366b.43.2024.09.30.09.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 09:18:39 -0700 (PDT)
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
X-Inumbo-ID: a7fdcac7-7f47-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727713120; x=1728317920; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0k2oe68lAyFisL1zN1DBSynwwGWDgaQyH91miIvCjuU=;
        b=jWEVQTiJXlUtk1mgbjssLaScdUd2eNkVN8wCPR7QyjYd6q5rFrwUSVFREaJbb6xtJs
         Uh4DTAAKVCZ6YXXFsDuSC1gJ2DJ30N6W3dG+cnITHWrAH3hMHI8TCqxkXTTWEtJOOsnG
         aBMGX5cBy0qVCNg0cqTkfUHtlm4Tn4V4IUjRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713120; x=1728317920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0k2oe68lAyFisL1zN1DBSynwwGWDgaQyH91miIvCjuU=;
        b=F2/Wo4yelGireEuDqGNyI+aHwyOscMGx3nz46keSZxGWVMWybLE6M5j8bb2Tvh2QNN
         R+5fjEHlwj6KGxMFvWVnwqdEc+fdVk4Hkrht+fetCkiXrqRsTy9ZCiJ0usXaC8mKzbIt
         IW3oHdI5zAuTY2RRnZzl7YhSrrIIbSOSNJg+Uu5CJ6tTd8C/s1JVoOTyoZHMabX6qv1a
         iY7a9YlAByCXrOLJSbYzNGPvyts15ISKPs/JOZMpIQ+IaMZpixP5peCjHOA9AmYqaiG4
         JsMqClm6GwzMKeSnCfr3d84//HkAZBCUUbZJeyH6Vk2o7Vy+Nn2nExYmUQ6p7OifLeQo
         Fm/A==
X-Gm-Message-State: AOJu0Yx+uh3sPQaie6NRtL4/9kKVyO8L9hjSbHrc1vqyU0CZWx7jIjGY
	nUIhAfaBgFTPTz5kjRokF0owj5ejeK/AdAVcMP2L7liqMBjVMlKo2A4X7xAD39TrtUsZczVu17Z
	07J4=
X-Google-Smtp-Source: AGHT+IFESAcDkl8dOtiGjrqgrZ/YOZymqyDNJksvqtP2C8/v1i4oZX919SXMRujwMwHRbYHQGzm/Dw==
X-Received: by 2002:a2e:a58f:0:b0:2f3:cd4e:b931 with SMTP id 38308e7fff4ca-2f9d3e4856cmr83530051fa.10.1727713119625;
        Mon, 30 Sep 2024 09:18:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/pv: Fixes to guest_io_okay()
Date: Mon, 30 Sep 2024 17:18:35 +0100
Message-Id: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Needs to be used in combination with Jan's "x86/PV: simplify (and thus
correct) guest accessor functions" to provide correct behaviour.  See patch 2.

Andrew Cooper (2):
  x86/pv: Rework guest_io_okay() to return X86EMUL_*
  x86/pv: Handle #PF correctly when reading the IO permission bitmap

 xen/arch/x86/pv/emul-priv-op.c | 63 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 28 deletions(-)

-- 
2.39.5


