Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4859D4E574A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294001.499683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4dJ-0006YB-M2; Wed, 23 Mar 2022 17:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294001.499683; Wed, 23 Mar 2022 17:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4dJ-0006VE-IP; Wed, 23 Mar 2022 17:18:53 +0000
Received: by outflank-mailman (input) for mailman id 294001;
 Wed, 23 Mar 2022 17:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4dH-0004Zy-SL
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:18:51 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e44ff65-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:18:51 +0100 (CET)
Received: by mail-pg1-x52b.google.com with SMTP id c11so1654462pgu.11
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:18:51 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 y9-20020a056a00180900b004faa45a2230sm455168pfa.210.2022.03.23.10.18.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:49 -0700 (PDT)
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
X-Inumbo-ID: 4e44ff65-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R7g63uMCtTkVNfRXBZkshJ0Wiw4mo6s3K6WysQFVeHQ=;
        b=EMCnSQO4I48BMsxvvg3i3Lpu7MpcHIBM0VPU1LmYCuVl/RlXBQKnI+aX6Rw5+Otp1s
         8IIMhkhQPGFAd7938UkWmV4lBtqZCbG9FdGo8U8RK3KvsKQbLGAa0c0IrtuSOjDJjuSV
         QFauhI8kpDEcO0CLjjNlJcZcwM0mAHerEv/s6+nsiQVem/Cxo3XuGDnC60sV25zy8Fr3
         R6tcgTKLH53w67BvarZnpfob+GRcW9FPC96YnIAXa78jP8pjuvS3DMa/3hObSK9vvZeU
         ObQvhKX5xWReNbdvvifVE7tLNNOUGXQ9hqL23HPdi01BtJXokaAH3+6DQf7r2EYk52H9
         xHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7g63uMCtTkVNfRXBZkshJ0Wiw4mo6s3K6WysQFVeHQ=;
        b=t9IAeuKFnloQHtE8HzVp2o8n9iOKyePbYPVpHPfikhxpJBNySLrbMBssI4ol3bUdg+
         GjCeobCus0t42jyjjQMfwFC7pJfJincbSv9ZG+7YX3SmgEade9aNwlr6QrG63uJRiTdn
         P3n+wjscDlTd+5+qvyzEXV41ITWzF23OR5Un6J4TzTqt4eMUUHoQ55TmmwExOFOhyolT
         i4YWvsPSH4ey6aUhBFQQ6BUlvPAjxAG4ItAdDIndB9h5iCwrbLSFp98VFPFy++aMFgfY
         LfhRiyKST7raS0NNYbQqjGJlPxhBbAwr42ibFnM/6zoZbBL5oR2oAFtoA6caUzlE9QlR
         JV2w==
X-Gm-Message-State: AOAM533SgP11lGmpzM0yWRV24dj35U63DJ7QzINihm7hBjEku0yX6Cjt
	papq/YCxXs3usetV5rMe1H0=
X-Google-Smtp-Source: ABdhPJwsqttKPum5jvLljX6MsvisPeyZTYUskQFajfuzSlqwRvUxcgnszNBQqCwAUxI0R7csaGC+rA==
X-Received: by 2002:a05:6a00:1d85:b0:4fa:9dba:f1f2 with SMTP id z5-20020a056a001d8500b004fa9dbaf1f2mr956040pfw.31.1648055929515;
        Wed, 23 Mar 2022 10:18:49 -0700 (PDT)
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
Subject: [PATCH v4 04/13] accel/hvf: Remove pointless assertion
Date: Wed, 23 Mar 2022 18:17:42 +0100
Message-Id: <20220323171751.78612-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Both the comment and the hvf_enabled() check are duplicated
at the beginning of hvf_cpu_thread_fn(), which is the thread
callback created by hvf_start_vcpu_thread(). Remove.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/hvf/hvf-accel-ops.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 54457c76c2..5c33dc602e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -446,12 +446,6 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    /*
-     * HVF currently does not support TCG, and only runs in
-     * unrestricted-guest mode.
-     */
-    assert(hvf_enabled());
-
     cpu->thread = g_malloc0(sizeof(QemuThread));
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
     qemu_cond_init(cpu->halt_cond);
-- 
2.35.1


