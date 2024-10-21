Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54D9A5D4D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 09:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823206.1237175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2n1K-0005Cz-5J; Mon, 21 Oct 2024 07:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823206.1237175; Mon, 21 Oct 2024 07:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2n1K-00059K-2R; Mon, 21 Oct 2024 07:40:06 +0000
Received: by outflank-mailman (input) for mailman id 823206;
 Mon, 21 Oct 2024 07:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cz9x=RR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1t2n1I-0004Lr-6a
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 07:40:04 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeb65ee2-8f7f-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 09:40:02 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso4324268e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 00:40:02 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22456503sm411931e87.306.2024.10.21.00.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 00:40:00 -0700 (PDT)
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
X-Inumbo-ID: aeb65ee2-8f7f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729496402; x=1730101202; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut6tdXFoieCwDzjCk3rSVYe/V5H9QVhV/RCoAHnEImI=;
        b=kqtVQRRdAzhgsHApEHHYKH5rzjJhYlsNObz6UV60JnkdTENQDOjc73KQVF9ryCqx/a
         YOzcRABaj8dc9jejZ5uSHS4QzyDZdjxW0RtLJhtFZ9ygdbZ1ZtHTUNvfC96PwlhWYSt5
         S0iZ4BPtjyruceYIsnhs50iZtHmKMJTEy5lbQupwWvR+28IL4lFyIFoBPO2vrGH128Yr
         KZekiTbmCuZo6QDrA6VtbHav1l/HJv9+Kv0MH6g4PMRjPDVUfE/1WhJEzT98eIeRkSkO
         4ai1+O0bxH1CiEyABZkroLb02M6yA+EiyvFQZoYR+4h6LD1oJv9aSw5in0iFDeKgpRD8
         Gsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496402; x=1730101202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut6tdXFoieCwDzjCk3rSVYe/V5H9QVhV/RCoAHnEImI=;
        b=gJ/vW8a5c6J5dicWMgw2N1fKIkieBjYTq/mJkSkgesXfxDcpnwvwmLk+7Ko5nT1dmN
         V2CKBP07vqkdJrFRAEgj0Ts4KaqXlm+ZFtduCSlJmPfGWmDZn4ydHJ+cIXPVU2iM1nTn
         MgDg3adDxUMwoT07nNSoK+zT+89SvKvhNo32GG+kja9cfUNL+LiNnuWtNWdKZ/cFZdJy
         A3r8IMDmNVDIgNVjjT/GNolt8zIniZLQzSn63FkfSFm4ucMqr/TzcW6L3bH6rsKCAZTt
         bAf+bgDpA9jbKd+Lw7dZoV8S82NbtOZJ9HBRcY1Mcuc7pY0zAd3Km60c0+yJbm3YSrTZ
         H6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgDl6m10LuwbeyJnI6XhKovNsh099rsdWA0KEai11LnXxPldbdxDJa8A1AdNx25d5ZWQQSUo5Ed/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi1/Z+MZO7n4YebJLTihO/1SuP7k9ZHmjHHBXU7/6wmaRXS0cb
	hZ+jPkQVurfiV3QWN90dNimnj3jARwmAT/1hDWceKZlMjuXdahRe
X-Google-Smtp-Source: AGHT+IHQciL+iTlfAU599XwSCdWoMZD5RsI/tADgn8OXsviefzQLziznjymiXZ5JCWF6gR0gAzu4Hg==
X-Received: by 2002:a05:6512:3a95:b0:539:ee0d:2bb4 with SMTP id 2adb3069b0e04-53a154b2cb6mr5122358e87.45.1729496402045;
        Mon, 21 Oct 2024 00:40:02 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v1 1/1] hw/xen: Avoid use of uninitialized bufioreq_evtchn
Date: Mon, 21 Oct 2024 09:39:57 +0200
Message-ID: <20241021073957.1851500-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021073957.1851500-1-edgar.iglesias@gmail.com>
References: <20241021073957.1851500-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Avoid use of uninitialized bufioreq_evtchn. It should only
be used if buffered IOREQs are enabled.

Resolves: Coverity CID 1563383
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-hvm-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 7d2b72853b..7ffbbfea23 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -752,9 +752,10 @@ static int xen_map_ioreq_server(XenIOState *state)
         return -1;
     }
 
-    trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
-
-    state->bufioreq_remote_port = bufioreq_evtchn;
+    if (state->has_bufioreq) {
+        trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
+        state->bufioreq_remote_port = bufioreq_evtchn;
+    }
 
     return 0;
 }
-- 
2.43.0


