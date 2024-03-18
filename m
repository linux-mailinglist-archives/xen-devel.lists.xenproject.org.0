Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F387EE80
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695058.1084604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGVh-0001Ex-DR; Mon, 18 Mar 2024 17:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695058.1084604; Mon, 18 Mar 2024 17:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGVh-0001Cb-9c; Mon, 18 Mar 2024 17:10:53 +0000
Received: by outflank-mailman (input) for mailman id 695058;
 Mon, 18 Mar 2024 17:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHk-0002f9-0A
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72dd039b-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:22 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so5154828e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:21 -0700 (PDT)
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
X-Inumbo-ID: 72dd039b-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780981; x=1711385781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6SOJAPHzTw3MYpCL3W6xE70pNKEvpjBBoKho15ndy8=;
        b=kRiQYmPdBe14TBvTEtSjLETcNPXCowgqpeTGJcPEwXdFDJR91J0yECQqdn+NqMBp8x
         7qCrxiRuQdT2yIJ/wkX0RFP7iNjQBNw+arRnchNkGamF+lvLsOVHLzU8UpK7BJVRB3Cy
         F5BgwPAutrCrl2uxU0K44tJ2mWrDykzAM/1GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780981; x=1711385781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6SOJAPHzTw3MYpCL3W6xE70pNKEvpjBBoKho15ndy8=;
        b=k3WIgaPNxd2Q0OM22lEKLjPyDF+JCUDVYOKIUH/Cqo+N7wieLVAPpzgFx6cf8xIYmo
         uzmyntnLVOX09nvU2By/qfgZacRDARMqiBUMkqnRlbO+0Hls6HBvtMsH3r2s7DoG9uqf
         Wcpu34gMZCwLxNJ6Fic8amwJhrqyoSQWzATVltOdH69UhxJxNGU/Pb6RhGZlWnRtw4vv
         zyB0P+VdVxvhHbObfUCqJEGYRE5crKgu8SIfbTIHKsCVX/KCijX2dcPQZsvF8K6ahi+7
         +N/gvpdJtm9ep0JSvM+edMjhW/axa1p3ht3Ur0rpET9k0VyJWxeF3rA5L5Hjx3hRbpmI
         nhDw==
X-Gm-Message-State: AOJu0Yy0nY9f960kBqkbNP+G+ErMk4FJKCUYqKluSPqLyyiSoo+LQq+m
	3UhdSWnbGkSWdvplyyrYT/0Yph2fxwyAaiKAPNpP18F5vzi/VAknBly4XPbknqmRY+Pco+pcJfc
	b
X-Google-Smtp-Source: AGHT+IFmG58z5oOeybe79OGRLnMNdyftivOKXgykL/ptl1wsy9WLHmGjr9kBMpbh1ubkmFjsj7ZC7A==
X-Received: by 2002:a19:9118:0:b0:513:d71e:eeb4 with SMTP id t24-20020a199118000000b00513d71eeeb4mr7066453lfd.18.1710780981703;
        Mon, 18 Mar 2024 09:56:21 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 36/36] make-hosts-flight: default to bookworm
Date: Mon, 18 Mar 2024 16:55:45 +0000
Message-Id: <20240318165545.3898-37-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 make-hosts-flight | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/make-hosts-flight b/make-hosts-flight
index 63ac7b71..0177f605 100755
--- a/make-hosts-flight
+++ b/make-hosts-flight
@@ -26,7 +26,7 @@ blessing=$4
 buildflight=$5
 
 : ${ALL_ARCHES:=amd64 i386 arm64 armhf}
-: ${ALL_SUITES:=buster stretch jessie}
+: ${ALL_SUITES:=bookworm buster stretch jessie}
 # ^ most preferred suite first
 
 : ${PERHOST_MAXWAIT:=20000} # seconds
-- 
Anthony PERARD


