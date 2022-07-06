Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8356911A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 19:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362453.592479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o99AV-0000Im-06; Wed, 06 Jul 2022 17:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362453.592479; Wed, 06 Jul 2022 17:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o99AU-0000Fp-TW; Wed, 06 Jul 2022 17:50:30 +0000
Received: by outflank-mailman (input) for mailman id 362453;
 Wed, 06 Jul 2022 17:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwIU=XL=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o99AT-0000Eu-SV
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 17:50:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9989e7-fd54-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 19:50:27 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so9408455wml.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 10:50:27 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 o4-20020a05600c378400b003a2b708c26dsm5807321wmr.40.2022.07.06.10.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 10:50:26 -0700 (PDT)
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
X-Inumbo-ID: 1e9989e7-fd54-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKQ9VmXy5rX90RpfhKkPwWRfbVofooIOTElwk25AdsI=;
        b=kSPYsiPgnM6saXW2671Fwpi9pp5ktEyXzH5skLXNcJ6VFGQPqdbhaCBVf+rrmQMGuY
         TIR8zTZyMMX4xFlNDRkenjK0MSC/RmLaa6Gmm5PqJrmVfFO14PNQk7DgEGPReSJ0J8Ns
         0Q8hMIs1l/oftpymTe5AaLE1VmjxSIlib0tI1tbPODb5Dlv6QeqHUljrwwQiDycwsHEo
         AxmOSQ7L3dIasZ24UYaKbv5LXgHhK/8BpugN1Y66CJwym8ler8ZfZAVw11oE5rI692RX
         Uw1IHFf7ZIzq8DicrvO5UJORKIkrL2h4wNO3OQCqH2jzNUnxSFhIcfsmnZbApimSK0JB
         sSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKQ9VmXy5rX90RpfhKkPwWRfbVofooIOTElwk25AdsI=;
        b=Aix9Lp8M6nZfgxU6Eoyg6kaEUcj5ZnSXNdIkgalDju9qrCgiJiAv11V6TTMuQnKY3V
         ctVOcP9qv0IIs7LPHfIcX0Sw01kxYUua7O3vB2EvNbkfXSdEIFgO00ucGmsHw5hFn0Pf
         m9TlF/RMErCRY2gPKwMRJ05gjJg4yFjbBwvwZlaJ2ygBj+y8AUUi6kwEdovyijP7hppp
         Xd8cIwlQAeEHEkxJVfxxHK2iFBq2RO3oYoHlBbj4c8Zl4t73EuRqHFuRqUcjyd6YnhIK
         DtDSkL4eapleyIM/x0rWHdOFwMrDs5l68hNV6W0b+ItkbGwgtRNfUOpTg6pGHICg6cN+
         fyvA==
X-Gm-Message-State: AJIora/eNk9s/VMx5y5tEBGeV5Cp6UA/f4uualqkxP2Fg83sLd5OQdji
	EExI/D2BoD4BJCM1SG1RKkOEupGo+Oo=
X-Google-Smtp-Source: AGRyM1vqM7YG2Q1DT2DYxOKNL1W8BY3VVgJz4eOom1TeMgLeIuOJWI2i6N0KrWSphp4EEk5VCLw/Lg==
X-Received: by 2002:a7b:c8d8:0:b0:3a0:42ca:d03 with SMTP id f24-20020a7bc8d8000000b003a042ca0d03mr45900838wml.167.1657129826772;
        Wed, 06 Jul 2022 10:50:26 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/char: pv_console: Fix MISRA C 2012 Rule 2.1 violation
Date: Wed,  6 Jul 2022 20:50:13 +0300
Message-Id: <20220706175013.675258-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the definition of the function pv_console_evtchn(),
when CONFIG_XEN_GUEST is not set, because the function is not used.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/include/xen/pv_console.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/xen/include/xen/pv_console.h b/xen/include/xen/pv_console.h
index 4745f46f2d..55b20323fb 100644
--- a/xen/include/xen/pv_console.h
+++ b/xen/include/xen/pv_console.h
@@ -19,11 +19,6 @@ static inline void pv_console_set_rx_handler(serial_rx_fn fn) { }
 static inline void pv_console_init_postirq(void) { }
 static inline void pv_console_puts(const char *buf, size_t nr) { }
 static inline size_t pv_console_rx(struct cpu_user_regs *regs) { return 0; }
-evtchn_port_t pv_console_evtchn(void)
-{
-    ASSERT_UNREACHABLE();
-    return 0;
-}
 
 #endif /* !CONFIG_XEN_GUEST */
 #endif /* __XEN_PV_CONSOLE_H__ */
-- 
2.34.1


