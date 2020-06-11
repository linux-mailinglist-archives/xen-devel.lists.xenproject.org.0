Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5E1F608D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvf-0008Dw-DZ; Thu, 11 Jun 2020 03:30:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvd-0007xd-Sc
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:57 +0000
X-Inumbo-ID: e98808b4-ab93-11ea-bb8b-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e98808b4-ab93-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l17so4334414qki.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jBbbs2empnWr4OrIOc7w1Xk6T14OGQN0B87vFfy4hdE=;
 b=eUweJLbDTdnBpX5SsoXJM2K72GHviq9XjGrlOwvQdhlGZgtM7K6IU/8iFa31ui8Uku
 R8vJOtPfanGzGUKPQeP3uBP2uQAFdwa4qLqRATFfQfiCpBuCvtTH2sYVrc9C2Ibx6xo8
 fxaB+NQMiBkskXxATPZMz0bVZj/7G2nIIeRZnNvgQxG/2GYaZRe8SGCxLY5ne7E42iqN
 J5alV1dzQQeAge8bVtBdmBw5KVYIfgXZiCF87dKkOxUPQOTFXPLc79SI7pAFRhgEqtm2
 2UYqHkgyRtp9TMuEnIAElZK2pkoyvWrhv4ZJJXXrF80PCYehydckhABoe/6LJMI/58dI
 /9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jBbbs2empnWr4OrIOc7w1Xk6T14OGQN0B87vFfy4hdE=;
 b=aIX0VGeh/2xY+KHIFGKD0zzRibkv91NFoZ1oafy3t/9ESYx9O6VSgPlC260Blyq5mX
 yeJ1Sn5W8R3MoaWXqpb2QhKv+hXQDyRX53BrzzONOzX69dDY9HAsBMgPieP3cTlxI1ae
 wA6XrVFdVTx8xTwW6GI0Mt0Tk3DHnqhHm5MvTSaDpN4h2OPO0DHg3/5Vn60Spoz/uszD
 BYzccuM3NEsTwQ92a0+7TA4QOsQ565R7z0kb2xymKRH8tKTQd56FmBk5rX44XCY+7EI2
 bY9cZEZL5Vavx3Uuwq9BEDAEtSK2zhdxo0kRlmd6ye4GupwZXMuWj2Q+bVNKs50MT47t
 aSkw==
X-Gm-Message-State: AOAM5307KM25A1ur7TZ0+bSIM8/wvtC7hw9NGqnc2hQ2+wDnIzHPHJR2
 Bn+Zby0Wke0Bc09IlGHafiwK7m/D
X-Google-Smtp-Source: ABdhPJyUgzppKig/FkUgRMJXAOFXdwdkz9Bo8jHpQNMRLt+rs6RiduerxyRzPMSEA+M3JN5rCx1C0g==
X-Received: by 2002:ae9:e10f:: with SMTP id g15mr6616600qkm.285.1591846234982; 
 Wed, 10 Jun 2020 20:30:34 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:34 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 08/10] vchan-socket-proxy: Set closed FDs to -1
Date: Wed, 10 Jun 2020 23:29:34 -0400
Message-Id: <20200611032936.350657-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200611032936.350657-1-jandryuk@gmail.com>
References: <20200611032936.350657-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These FDs are closed, so set them to -1 so they are no longer valid.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 29a12260ed..cd7629bc4e 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -326,7 +326,9 @@ int data_loop(struct vchan_proxy_state *state)
                 while (outsiz)
                     socket_wr(state->output_fd);
                 close(state->output_fd);
+                state->output_fd = -1;
                 close(state->input_fd);
+                state->input_fd = -1;
                 discard_buffers(state->ctrl);
                 break;
             }
-- 
2.25.1


