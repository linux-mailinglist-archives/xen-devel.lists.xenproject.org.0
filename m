Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E060F567928
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361538.591128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgk-0004gR-7k; Tue, 05 Jul 2022 21:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361538.591128; Tue, 05 Jul 2022 21:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgk-0004bp-3o; Tue, 05 Jul 2022 21:02:30 +0000
Received: by outflank-mailman (input) for mailman id 361538;
 Tue, 05 Jul 2022 21:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8pgi-0003b1-Ob
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:02:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6cbaf4e-fca5-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 23:02:28 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so7947890wmb.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 14:02:28 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 l26-20020a1ced1a000000b003a03ae64f57sm2897401wmh.8.2022.07.05.14.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:02:26 -0700 (PDT)
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
X-Inumbo-ID: c6cbaf4e-fca5-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkaVC8qOCJ3UPIdTEyzMpTlDCcABnjbSgrgYQldov+o=;
        b=cOLxgFWU8N514uleMGCElsG8ATfStWkMOMl3HupjfmkmLHTtbL1rGUAz7f4c8oxM5g
         v9ohz2MBgInX8iL0H1AHDZTYDvXxVdzAFYRMrNXR9zq8dI0/KA3mZJ1sPg9lhnL51/Yh
         0r+s4UDih+Spb0ZnWvlMH64yJZ0VbtvyWla+RbDVrRUyV07GE3Bp6KC97QlhFTWAySW/
         k41g3s3RGzpTNVY6c8kADqsi6MtWCNeoi8nqDB6VZ/J+2XpGnu2QLVphybduZvfy+JDo
         mlTIMYk9StQXcbQ9/qQEpJM0STKGUvezUj5gC0qZvQKG7GnQ9RjfYwIqzjoW2uOLamz+
         53Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkaVC8qOCJ3UPIdTEyzMpTlDCcABnjbSgrgYQldov+o=;
        b=ML3WmNQOeDKQOajrfFpwpwcCI3AvsDYHhmvV71E4wNsgnSSBUia7ia2hHjCzGvS9K6
         ics/ypVihjbA1OBRdrelQZc9IbnYuVFz7KBcB789pYB+ObdBXKNut06rb0lDvNK5iyS0
         tjKYcew1IfOpdIWBhuo0yFaCP5ZQK1wHuwZlCdqroGkZ/avCS4A3hCcBjoZAB0V4BAhI
         SZbriTqiaZ8sitdaH/Lr7+V3koCpB63heGCsO5bumDdXuNQPpURix7IlrN7ZzuVjNZp8
         plUbfYphGXdde6EsD6hQq50M6+s548+60WCnCz4fZkMdaS7a1xI2UmxMn/hCUPk9QEDd
         plPw==
X-Gm-Message-State: AJIora8NG205kmcliLW5nKKKnphak7e5U1JiEhRtMHj7oW4i/4xZBTWF
	sY2lBAayAVA03AhPJ8V7YcRTaQu2Y0g=
X-Google-Smtp-Source: AGRyM1u2zRzYBC+jrV2YPjoAyboW0KZhHp1AN41tOKejBwQEN9SyFWgw/PxlF8NaValM6teFAW/gfw==
X-Received: by 2002:a05:600c:a18d:b0:3a0:2c9a:b3de with SMTP id id13-20020a05600ca18d00b003a02c9ab3demr37965632wmb.147.1657054947271;
        Tue, 05 Jul 2022 14:02:27 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] xen/char: pv_console: Fix MISRA C 2012 Rule 8.4 violation
Date: Wed,  6 Jul 2022 00:02:18 +0300
Message-Id: <20220705210218.483854-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705210218.483854-1-burzalodowa@gmail.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function pv_console_evtchn() is defined in the header <xen/pv_console.h>.
If the header happens to be included by multiple files, this can result in
linker errors due to multiple definitions,
So, it is more appropriate to resolve this MISRA C 2012 Rule 8.4 violation
warning by making pv_console_evtchn() inline with internal linkage.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/include/xen/pv_console.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/pv_console.h b/xen/include/xen/pv_console.h
index 4745f46f2d..a96a6368b1 100644
--- a/xen/include/xen/pv_console.h
+++ b/xen/include/xen/pv_console.h
@@ -19,7 +19,7 @@ static inline void pv_console_set_rx_handler(serial_rx_fn fn) { }
 static inline void pv_console_init_postirq(void) { }
 static inline void pv_console_puts(const char *buf, size_t nr) { }
 static inline size_t pv_console_rx(struct cpu_user_regs *regs) { return 0; }
-evtchn_port_t pv_console_evtchn(void)
+static inline evtchn_port_t pv_console_evtchn(void)
 {
     ASSERT_UNREACHABLE();
     return 0;
-- 
2.34.1


