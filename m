Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7003987EE4D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:02:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694987.1084467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGN2-0007d7-FB; Mon, 18 Mar 2024 17:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694987.1084467; Mon, 18 Mar 2024 17:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGN2-0007aY-C0; Mon, 18 Mar 2024 17:01:56 +0000
Received: by outflank-mailman (input) for mailman id 694987;
 Mon, 18 Mar 2024 17:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHc-0002f9-VH
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f1a7b56-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:16 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-414624a65beso23055e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:16 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:15 -0700 (PDT)
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
X-Inumbo-ID: 6f1a7b56-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780975; x=1711385775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQG3ZS/KBjrX61gOBxTf9yeYNXKYHvM6r6BPx94cQKs=;
        b=fJK4BJ2mYlO7zN2Vef512nm9m3Uqv81Bmis0gqsEdCT4kE5bMgWrgNSslWytVDqwHs
         sGjRLf4T3H5tPZkJfWFB+kTTP76lGH/FwhYEh4PFdhurYexZrshmCvZOUI8phFoPSfrn
         5TIIYAGydoi7jERBCM29O3+T9qjXUwq1LATi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780975; x=1711385775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQG3ZS/KBjrX61gOBxTf9yeYNXKYHvM6r6BPx94cQKs=;
        b=XGjMQshHKgBNUBVHcptEV/7rlZuh4s4dwjiPaINy2MLLqm2I50F5VOX3HCkgvDWhsE
         gEdoO8dXJRutNbF5TjLcrOBHW/UoX26wbUMXZJnTbt722ZOtktsdLA/tydUWbB0VCT01
         9ILahsh21pTo4eEyUQqgXfeIDnoDTKgC3IFP9a6ND9peXFIA1Gv44q5azczQctXhpB1k
         oixHYnGk9rlLDQq7ejmESaNFXgF2rBOoYeX45jPaqxwUKAt43uN1VrvjLN+G5csCpbyU
         EonMdt8p0VI/t7Ly59gC8/p+RUrpuEQULERH88ifVJ2yFtKwR0S6JUjsjaHyaIkpBbE6
         BxzQ==
X-Gm-Message-State: AOJu0YzeVLd1NTHCian01YUDdJqDtvI5XS2h8uW/S7mQIJt26AJOZdFm
	EYucUfwDX41xyfKEYvMNfePUvBcz1dmCZTyU1DrF9ZcoL+N+UwEb2x8uGJ+zCUvrrsLRpMG+3NU
	W
X-Google-Smtp-Source: AGHT+IFxPNgilfqdmRvgJO2Paa+HImA+CbRYKWFQN+pgq1nbnYiSEISR9mtJGNc7Acdzf42snqeVxQ==
X-Received: by 2002:a05:600c:3c99:b0:413:fa31:b9f6 with SMTP id bg25-20020a05600c3c9900b00413fa31b9f6mr9694564wmb.2.1710780975478;
        Mon, 18 Mar 2024 09:56:15 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 29/36] ts-debian-hvm-install: Increase min guest ram size
Date: Mon, 18 Mar 2024 16:55:38 +0000
Message-Id: <20240318165545.3898-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

768 MB for the guest isn't enough anymore for Debian Bookworm, at boot
it print this message:

    Low memory
    ----------

    Entering low memory mode

    This system has relatively little free memory, so it will enter low memory
    mode. Among other things, this means that this program will proceed in English.
    You should set up swap space as soon as possible.
    [Press enter to continue]

So, automatic installation fails. An empiric test shows that the min
was 817M for one particular situation (test-amd64-amd64-xl-qemuu-ovmf-amd64)
but we probably need some leg room, so increase to 1 GB.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-debian-hvm-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-debian-hvm-install b/ts-debian-hvm-install
index 44eb3ab1..60c95b37 100755
--- a/ts-debian-hvm-install
+++ b/ts-debian-hvm-install
@@ -241,7 +241,7 @@ sub prep () {
          if ($host_freemem_mb > $ram_lots * 2 + $ram_minslop) {
               $ram_mb = $ram_lots;
          } else {
-              $ram_mb = 768;
+              $ram_mb = 1024;
          }
     }
     logm("Host has $host_freemem_mb MB free memory, setting guest memory size to $ram_mb MB");
-- 
Anthony PERARD


