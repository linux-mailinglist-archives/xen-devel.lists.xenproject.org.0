Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1E4E5777
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294007.499717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4lv-0001HA-53; Wed, 23 Mar 2022 17:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294007.499717; Wed, 23 Mar 2022 17:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4lv-0001El-29; Wed, 23 Mar 2022 17:27:47 +0000
Received: by outflank-mailman (input) for mailman id 294007;
 Wed, 23 Mar 2022 17:27:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4e3-0004Zy-1B
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:19:39 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8ccecb-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:19:38 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id c23so2185288plo.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:19:38 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 d25-20020a639919000000b00364f999aed5sm349409pge.20.2022.03.23.10.19.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:36 -0700 (PDT)
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
X-Inumbo-ID: 6a8ccecb-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGzoIEiqotEx27Bg+Z4eL5zpKSfKxDxE5VGRYeUpF1U=;
        b=YN2nPW6qFv/FXMaZbHoge7dvyFY38/0TL7t4FHhvZ3ROq4ndXz7aVe/WYlNC1die01
         TcD+kFy/xidXVPGx7gpqZ75SywkLL2EYPJoDBotF8TIRl44RYN5JTM1qKjZv3d6GIfqU
         jWotsaKHFfCdSkhPSpjxx+SuvENG8Rj/Mv3l0DwhQfohsPpFU6t73UPPj8CSrbQfuBkd
         9Z/VXAQWYd7J2zxrjtJ/gWD5iowxhsrQ7vwQGuFXZNP0fMUeSz4fBHXmC/cKAe6dYlVs
         NCh7inykD23K3nAQkmHK7E/YkkRS5g4L8ZmGYcKNVOwgDWWwZ2QenCCnu2L1vwreGob1
         13sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGzoIEiqotEx27Bg+Z4eL5zpKSfKxDxE5VGRYeUpF1U=;
        b=rBCS/tiuUZ4/diJtDaF+KZ8G/B7f7HuHnnjl/H+WBQMVSwrRZ0WaQik0FmkAodny5a
         5axPAz7gEVBfOig4Un2xJWLbvR746jpfF+DKRC0gJ8tnGjgWlMg5FbapV6Tw4/aiLMVf
         fWg1J+bvXeG0+gaxEMlg2jXVteSOWUEmVZFZrXrueFlWzE8spKikbe365aUJQxTU5XVy
         xhrshLgVPpnGNt0soQv6mE4MT6oj1Qentj3HPFwupLXxTNyGVTLo4YX5vbP1BZ/4xb3Y
         jrZXTF4fBp7DLZVTu76XBdG+UGz+u4BtS7duew9euWISBRBwDYow05IG9G8r5oxlh55u
         I5QQ==
X-Gm-Message-State: AOAM530snBK1T5Ljo3eIilyrOH8LinSzF8IvT+UClhtlkQ616SHevwYP
	Pr9lSGQarWlbEHUGd2bWVLc=
X-Google-Smtp-Source: ABdhPJypHL2FuS5xBRJ7IZra6e8WHCycd0JJ50I5gNrC37pYhlUHgXYCXbDEv97OJjTv0XckGdi+gQ==
X-Received: by 2002:a17:902:8543:b0:154:9588:52ab with SMTP id d3-20020a170902854300b00154958852abmr1177032plo.50.1648055976951;
        Wed, 23 Mar 2022 10:19:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 08/13] accel/tcg: Extract rr_create_vcpu_thread_precheck()
Date: Wed, 23 Mar 2022 18:17:46 +0100
Message-Id: <20220323171751.78612-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to extract common pattern from rr_start_vcpu_thread().
First extract the rr_create_vcpu_thread_precheck() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 7 +++++++
 accel/tcg/tcg-accel-ops-rr.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index de8af32af7..3da684b8e6 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -272,6 +272,13 @@ static void *rr_cpu_thread_fn(void *arg)
     return NULL;
 }
 
+static QemuThread *single_tcg_cpu_thread;
+
+bool rr_create_vcpu_thread_precheck(CPUState *cpu)
+{
+    return !single_tcg_cpu_thread;
+}
+
 void rr_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
diff --git a/accel/tcg/tcg-accel-ops-rr.h b/accel/tcg/tcg-accel-ops-rr.h
index 54f6ae6e86..e2273b66d4 100644
--- a/accel/tcg/tcg-accel-ops-rr.h
+++ b/accel/tcg/tcg-accel-ops-rr.h
@@ -15,6 +15,7 @@
 /* Kick all RR vCPUs. */
 void rr_kick_vcpu_thread(CPUState *unused);
 
+bool rr_create_vcpu_thread_precheck(CPUState *cpu);
 /* start the round robin vcpu thread */
 void rr_start_vcpu_thread(CPUState *cpu);
 
-- 
2.35.1


