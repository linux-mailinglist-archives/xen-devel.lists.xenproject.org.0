Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A66A21C8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501429.773253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9U-0005P7-2Z; Fri, 24 Feb 2023 18:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501429.773253; Fri, 24 Feb 2023 18:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9T-0005JD-P9; Fri, 24 Feb 2023 18:50:39 +0000
Received: by outflank-mailman (input) for mailman id 501429;
 Fri, 24 Feb 2023 18:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9R-0002YL-Ff
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:37 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f4a88b9-b474-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 19:50:35 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id eg37so918338edb.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:35 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:34 -0800 (PST)
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
X-Inumbo-ID: 1f4a88b9-b474-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgbm5NZC1PT7zNDMW6qxeefiGl1B4h2NMbEX/nSdgxk=;
        b=ABOZi85NTTLSQ1Bzz3aLA2XtgFm22B/2plA8glx7U0Mw/31zy85yrNLJr+nuhrA100
         43pNXxhtXFBniSt0EXclVrSgiXQZM83FM1tLw7aeNpCvXn9ubP5esNPScGdN+JKVljR+
         hgIS17l5Z+94KdjGLha4yvnUAUPC5K3PwImxIJweT3bDWpFpTsjxbOr+v3MLivCQxbqt
         1dM5RA6+5Te9W1ocW+1nyx8N88QxrbUjhhztpHsB1yjEzuQlYMaM3Ui8knwaLvwhQ9l+
         5RAMdv6XwpyuIkRpvJafVJAiGaSEKXmvGnnixpL3TXBPPKJMF7e6rB+t+osmIm7yPeYt
         THZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgbm5NZC1PT7zNDMW6qxeefiGl1B4h2NMbEX/nSdgxk=;
        b=hXTxUYX8Ryl0Or1Ir1MeDTtfTufNBdZFuYVcrhk40bb6eN6yzZdpL3EqArHwQIisqF
         dAkn6JJAI81omMZTA3SOGvP705VwQEijXatERbnRZrmTXSuyGBDbX9ti25dCnlRDfXO8
         v9dN/1x+Yx1h3um0FpnYCxssN6C4S147uRRE1tfiFpXIYdjnPNBpb1wj31BHQ4N7+Q+c
         xFAnXzO9Nt+jRWwnNCn/JZlq98MD366GSTbITQqODnAlRVZFjpKG+p8qAL3lb6yqsKDo
         wQ3+NWXuDCxbfG0BwVDFTQF/EiRPezDc2C2kac3hmtAghY62jHB5hfRH5QWEazZLNfsM
         A9GQ==
X-Gm-Message-State: AO0yUKVFEvCQtGNweKTq857OBH9DSpuNOJ8QmLkkiy3yoJjJLDnBekhE
	C3E7ufGwNXYrvNm8bYyqj4F4BDRGTnQ=
X-Google-Smtp-Source: AK7set9FmOCw2k3VCNZ7PgS99bFeT8J2UOQic9ubHYd1gWEaUXF26RKSt33YmUyN1OWt0euzIKLkeg==
X-Received: by 2002:a17:906:8484:b0:8b1:7f7d:7282 with SMTP id m4-20020a170906848400b008b17f7d7282mr29967280ejx.7.1677264634878;
        Fri, 24 Feb 2023 10:50:34 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 12/14] x86/vmx: declare nvmx_enqueue_n2_exceptions() static
Date: Fri, 24 Feb 2023 20:50:08 +0200
Message-Id: <20230224185010.3692754-13-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the scope of nvmx_enqueue_n2_exceptions() to static because it is used
only in this file.

Take the opportunity to remove a trailing space.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Changes in v3:
  - add Jan's R-b tag

 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 9b009ebcef..72d8f058f7 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1897,7 +1897,7 @@ static void cf_check vmx_update_guest_efer(struct vcpu *v)
         vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
 }
 
-void nvmx_enqueue_n2_exceptions(struct vcpu *v, 
+static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
             unsigned long intr_fields, int error_code, uint8_t source)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
-- 
2.37.2


