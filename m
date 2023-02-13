Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F072694957
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494608.764756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHP-0001tS-3D; Mon, 13 Feb 2023 14:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494608.764756; Mon, 13 Feb 2023 14:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHO-0001pd-Ts; Mon, 13 Feb 2023 14:58:06 +0000
Received: by outflank-mailman (input) for mailman id 494608;
 Mon, 13 Feb 2023 14:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHM-0001Ha-W7
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0d24940-abae-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:58:03 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id eq11so13271373edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:03 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:02 -0800 (PST)
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
X-Inumbo-ID: d0d24940-abae-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehevLc9UhGQTTXawWIjo+7aNcyD01VoFpnNrDZ36mVw=;
        b=c9lUKLlsbtltLGWVZRSYyjKUzvZBFCrc2pKH061xmq457BT5H00nnOlPWHpQJvU7xH
         EbMm9buOdH5hGvx/huQcGmVyF8qDpVcVf1oENRftqo1HH0Hwscai5fHS/WTdlvkl8IaA
         SX0thonEGefecuqO0oyKbsgozeCWdXWW/KKMf1fdM9KOozrFpWOIyS4FPXoVZKp/Ha7T
         JYF4yavwnmcbSyeULGB73vAF7X/nLc8RF63k2G8ZpacZKvyN60p4IlQT+oYbbPkqy25G
         nnjy2X4tcJYJG4Q2aHGT+n8eE0kMXVVGrGvvQRLq6BDv3YfMc+sjM+OkENAWC/S/qmh6
         PRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehevLc9UhGQTTXawWIjo+7aNcyD01VoFpnNrDZ36mVw=;
        b=qqOpeTFjtJrmOKgO0wZtQuWBEep6CmLP+g3MqBXes7mphlU79pq45boWkJSpC8GlRv
         XwLbe7obKUr4rYPlqHvEh0chCZPVPb49cqTByq7TyV8FfHVusLNzN6rcD63/E12Civqn
         rpJbazDeAhS469Y0c3BSvzxH0HB9xrF56ysOeC+rqTBLlnjNl9iKV/9xwxErzGQub3K/
         NOrDK9+o/WZnhFq+sBU9VYdt+dCZsi8Nz/3Ms3kWOAZmkXY0gZL96ktUAw89c7aITeJg
         yiOffKpIht9QLu9ya97e7JC232ew1T65xnCG/1WhGkvu15TUZycighVMef1AImTrrqXH
         IZ1w==
X-Gm-Message-State: AO0yUKW4SlBuJoJGdifF0FQBqO0O7tqA6uaPcvaN9manMphqI1lKXlIu
	mRFnH5pF4n8sadDPv+uBO+jAG8VvayM=
X-Google-Smtp-Source: AK7set/RhU+VKXAMuoVSRcH0AkySbUzaBHdZAEoRN54+E6ZdszX6hHmjPmE+XYWHO9PeKbDe2npL9w==
X-Received: by 2002:a50:bb4a:0:b0:4aa:f932:6f49 with SMTP id y68-20020a50bb4a000000b004aaf9326f49mr20931521ede.8.1676300282961;
        Mon, 13 Feb 2023 06:58:02 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 03/10] x86/p2m: guard vmx specific ept functions with INTEL_VMX
Date: Mon, 13 Feb 2023 16:57:44 +0200
Message-Id: <20230213145751.1047236-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions ept_p2m_init(), ept_p2m_uninit() and p2m_init_altp2m_ept() are
VT-x specific.
Implement them as unreachable static inline functions when !INTEL_VMX.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/mm/p2m.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index cc0f6766e4..ac80414688 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -35,9 +35,25 @@ void p2m_nestedp2m_init(struct p2m_domain *p2m);
 int p2m_init_nestedp2m(struct domain *d);
 void p2m_teardown_nestedp2m(struct domain *d);
 
+#ifdef CONFIG_INTEL_VMX
 int ept_p2m_init(struct p2m_domain *p2m);
 void ept_p2m_uninit(struct p2m_domain *p2m);
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
+#else
+static inline int ept_p2m_init(struct p2m_domain *p2m)
+{
+    ASSERT_UNREACHABLE();
+    return -EINVAL;
+}
+static inline void ept_p2m_uninit(struct p2m_domain *p2m)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif
 
 /*
  * Local variables:
-- 
2.37.2


