Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCFBB5520A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122087.1465977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50u-0004Of-Mx; Fri, 12 Sep 2025 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122087.1465977; Fri, 12 Sep 2025 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50u-0004MP-HE; Fri, 12 Sep 2025 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1122087;
 Fri, 12 Sep 2025 14:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50s-0004JZ-VI
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:34 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feb920db-8fe6-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 16:44:32 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3e46fac8421so1630889f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:32 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:31 -0700 (PDT)
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
X-Inumbo-ID: feb920db-8fe6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688272; x=1758293072; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHN27rLxCbFWo2ic6OFVcKs35MAX0SyPbGCQ+GtE01g=;
        b=C5jmUg/VxY0mSa94wMGoDigi2Z6slgMaJcCCf0zmLZ4EIwV5OwtMZ+15dQFiOxGWI4
         o7PtKQXuK4DTpUebALLv03mZqb7FZdeSHlVtylyWDR/DhsAAlTGjRd3u8mbw9m2SvbvY
         lkoMVumAzhPtHCd1oJ1mFpcDzhvbHe9EaGXlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688272; x=1758293072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHN27rLxCbFWo2ic6OFVcKs35MAX0SyPbGCQ+GtE01g=;
        b=Na/Mx+U5/p145EW6yaAx4fejccEG38ovcvhDwg8fUJivXhGOfROzXoqyfdEctqJu1w
         iGR8C3GmQ6KT9bXwDY3bYUEAHIY/rbb367TpwW+XLcVKluH+0XPG3st5X2VK7MyeRa82
         Ps63mAeHb9xY4sjVRC7dm4ECXGvJ961/y7SAUanza1W/Choqp2iWjyu+RjyrYpg26YDe
         qMVBJd6HaV9/BqXb5N1RHAEn3qk2bh/I09tzsYQFaDJ72ufupbwCGAOpAQ+YYTJvXnPB
         3DjbkWJ3HNF+uxGYfoKW7ieYRc6ESfdh7+0HcA4lHKHzEDmLN1L7aRA/YZ514Ibp9RMP
         2Yjg==
X-Gm-Message-State: AOJu0YwwidUTACfwg7CPmpbMYMmhb9zR6wv7pJZsoIHzVrMdg3X4hXpC
	D4l/vBmgHN5W2Ywc2cRDzc3p9vxr3kXpvXjXrHWKwd4aUD4afQuE+hIBZd/zyEjtqbIjmab+cEX
	XGEnh
X-Gm-Gg: ASbGnct1LHuqIbIuf4tAo9w1NUTQHzCjk3WSBGfEpiW73W1Jbn6632WZDxTW/53noli
	cZn3ywoo1YNJpNpzv1GMZ25noViUa3PB8lTEQDt3vQdoeIIyk3MCoHvSquUwJnprx4Lo5X4lH/k
	e1ks+YvSkl8qWkkh9OoRZC1NZJOaROo3DtGFlFNiBevugEEG6iCl7Hm7uo9xZ0Kkn4cF4/Xfgwo
	bFufq5E9eWH3UTA29THgGeIqkoK6FUBRSB0wgNtGPV6nns4qQ6THuEPDiDSxQ/Fc3C3DA7VumfI
	VQk43J7kxNMQnZ7PLUQNW1rwNMTiy/CgFZcKXI1P7f0kfoi5L/lboZ5aHaBkX+0uK2O70x4+uKc
	fTvToK2UN5c03nbGkNGaXK1lvgVjP97rwPcFDXbNBOrJqWQ1Wvsd25ntEx+4NhaR9rNAEqInCuL
	4H
X-Google-Smtp-Source: AGHT+IHLR9W1AAW8bZY3UEfIgtgmYJsL/LNz6U91e2MZKjQUa//DJo2Ra1QyEyPrRXAvjYqP0w1dWg==
X-Received: by 2002:a05:6000:1849:b0:3e6:a8ba:7422 with SMTP id ffacd0b85a97d-3e765780a9amr3586244f8f.10.1757688271921;
        Fri, 12 Sep 2025 07:44:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v4 1/8] CI: Use the Debian Trixie container for RISC-V test jobs
Date: Fri, 12 Sep 2025 15:44:20 +0100
Message-Id: <20250912144427.1905141-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was missed when introducing Trixie.

Fixes: aad6ebf0596f ("CI: Update riscv64 to use Debian Trixie")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

v3:
 * New
---
 automation/gitlab-ci/test.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 95b883b32bb6..1de68a0fe450 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -77,7 +77,7 @@
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     LOGFILE: qemu-smoke-riscv64.log
   artifacts:
     paths:
-- 
2.39.5


