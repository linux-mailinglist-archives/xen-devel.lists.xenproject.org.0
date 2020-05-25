Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70BF1E04EB
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Cr-0004R0-1t; Mon, 25 May 2020 02:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Cp-0004Qe-EC
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:51:11 +0000
X-Inumbo-ID: 92a2e492-9e32-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92a2e492-9e32-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 02:51:03 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id p4so7501325qvr.10
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=11/9Z+esWpnjGME4OYhJ11vNo1bXthXQQy5dVc6MS2w=;
 b=dUU5g9Gx88n6jfEOpIMwOpx2rQOev5secFI/pcOIwqVQs7iia4Ks117tv6/vjBQoK6
 ndINVcAH47xkE/9+cFfL4Sv2T/0ZQAI3yvLSZ6rdycRPTdjpZEi3MbPqzuTNc+6lnHJW
 LpG5CKzDTQ5zRmgnE+SU9Y/uCzW8NRnT/hziA/ckmkMBJDYWuGJdK1g+Z0X1Ls7sRrQ3
 3cI3jHxFHPtTc3zshG8RJ96sUeOtE4UyWPpVHjKsOchp6P5LpcbS59LuZtmlePy6vuQE
 4cbCRBcmD744cJqURtaHNIOtoYnAa6cC/Y7WI9Dq2zT+Ce4uoZ9zYbleWYuLdNeJlOiu
 Gvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11/9Z+esWpnjGME4OYhJ11vNo1bXthXQQy5dVc6MS2w=;
 b=NkkTi0M4OodIwv5mDVKjKwtAb8eCRm6u12/hTLc5AHuoZMczSQfCUbszuHKKMH4lxO
 rJVx51edUuOdJbz7Bv0yLhUEc9PAW2FWON0iSkvBPzEMtvSSBkPqJLFC/HhbLhXvqNxv
 b/KHtqVyVKLNRRldiSyVRc78Jng/kESHwMD/NUIRe+hu2U35X92gjsvkTKt0/nZDWIWM
 nzHAPPqu9N895gagXRUTWStcBuoSCwQsEup3JsH+1M4QwfiQagOW/12P96Plvc0TkQyT
 VN/0nPASUmqWTIEGDfNOTrzSdLq4Y+9CTYFugVmT7PExxbTLp8eyGkytxwrlUsbNOSLm
 V8vQ==
X-Gm-Message-State: AOAM532+d0//xbTS/1dB1R9pjFDcfwpy1DwI1EWPFqa8oI40tUqI1eUL
 aCFpbAV/Nzq0g4lI1OAxo8639AgJ
X-Google-Smtp-Source: ABdhPJxh5j5c3BvA8/blIR/5rb6cXSRpiv6MBzO1RF04GCNvAYfvlxsJ2jqcP5+ri/t0wK0Thqws0Q==
X-Received: by 2002:a0c:a144:: with SMTP id d62mr13412979qva.229.1590375062897; 
 Sun, 24 May 2020 19:51:02 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:51:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 6/8] vchan-socket-proxy: Set closed FDs to -1
Date: Sun, 24 May 2020 22:49:53 -0400
Message-Id: <20200525024955.225415-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200525024955.225415-1-jandryuk@gmail.com>
References: <20200525024955.225415-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These FDs are closed, so set them to -1 so they are no longer valid.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 32be410609..f3f6e5ec09 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -319,7 +319,9 @@ int data_loop(struct vchan_proxy_state *state)
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


