Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA45375548
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123536.233014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXv-0005Yl-F6; Thu, 06 May 2021 14:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123536.233014; Thu, 06 May 2021 14:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXv-0005Vk-Aj; Thu, 06 May 2021 14:00:07 +0000
Received: by outflank-mailman (input) for mailman id 123536;
 Thu, 06 May 2021 14:00:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeXt-0003iB-NZ
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:05 +0000
Received: from mail-qt1-x831.google.com (unknown [2607:f8b0:4864:20::831])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5510c360-3273-4078-818c-feb0b1c5fd49;
 Thu, 06 May 2021 13:59:57 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id g13so4036987qts.4
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 06:59:57 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:56 -0700 (PDT)
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
X-Inumbo-ID: 5510c360-3273-4078-818c-feb0b1c5fd49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K2IS4DIH6mLVlW67hNLVvhjqoD6ItQVTxI1gVdmna5w=;
        b=O+YCoBZo1K0G1sBZPrSk8KEPWO7UHlD2AFTiezkwB7XInHsh+bWguOGAMV4/rQBY0R
         Ls0TzFg8BhB0XLkw61Aa5YGgPo/TuX+rp+pSiBXH76F8ssEmyyifotDaKAcdFDsOpfMH
         T+//z3/qW3h5W1wduRU1Q4UeJd4COqUgdCLbrbPuA1Py2ml7u5v9o10stk2J92NznM6j
         cP0i+b2aCn/OP+wc9lGfBtGlnJB4FaqM0WaQoLl9uV2b5EFzCH/iuXbKjll6IEhuOXOA
         kP9IJTbpuk6GkRmQXDo//H5jzwry6bCwECTt7ATv1G9ecxq+3fEOafagQWArZTfTYZXX
         Y/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K2IS4DIH6mLVlW67hNLVvhjqoD6ItQVTxI1gVdmna5w=;
        b=NQzSQeLUkNwSJ+mhfzeDs5LbalCOmE6NgoVFQXPQ6nsxaUfNuQkxf6Np8lYvo2DgML
         ETZgHKAhyjFtlI5U3/qaYake8hxen8ieW9U48/w8p1YC3bdks4k9wC2fAS86HytcpJgK
         0YzXbtxKKFt/HSDEigpKnA05x/S5/Qf7HtoYOAGw86iegEw/C9smcEfY01kx7tmPREpm
         t8iQ7YJLiLFGaxRcO73F0nL3sWCbYbc3K4vNiBFipiyHMQyn7kM/4NyPd0eRz2PotvvF
         pP2WB2gYj3H1fVgr7mZKlVP4DbpY6jNM0GoRTE62LpbTWE6PgT6egkReaM+vtejJIF32
         W2vQ==
X-Gm-Message-State: AOAM533Te1rqf7JP9x933/QX+EIh3Pbh9FXyEakBAkuYkixNRUAgdCF8
	vfXgT3QzMo+3jjwwDjGwzphcSF3Ltqs=
X-Google-Smtp-Source: ABdhPJzKmDpKlFkDdTij8Y3/yo50zJDY90tSPO+GddOvwyita+2uSsv2W35Iln1+DCgigN2dW8CdvQ==
X-Received: by 2002:ac8:6f4c:: with SMTP id n12mr4580168qtv.22.1620309596651;
        Thu, 06 May 2021 06:59:56 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 03/13] stubom: newlib: Enable C99 formats for %z
Date: Thu,  6 May 2021 09:59:13 -0400
Message-Id: <20210506135923.161427-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vtpmmgr was changed to print size_t with the %z modifier, but newlib
isn't compiled with %z support.  So you get output like:

root seal: zu; sector of 13: zu
root: zu v=zu
itree: 36; sector of 112: zu
group: zu v=zu id=zu md=zu
group seal: zu; 5 in parent: zu; sector of 13: zu
vtpm: zu+zu; sector of 48: zu

Enable the C99 formats in newlib so vtpmmgr prints the numeric values.

Fixes 9379af08ccc0 "stubdom: vtpmmgr: Correctly format size_t with %z
when printing."

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 stubdom/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 90d9ffcd9f..c6de5f68ae 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -105,7 +105,7 @@ cross-newlib: $(NEWLIB_STAMPFILE)
 $(NEWLIB_STAMPFILE): mk-headers-$(XEN_TARGET_ARCH) newlib-$(NEWLIB_VERSION)
 	mkdir -p newlib-$(XEN_TARGET_ARCH)
 	( cd newlib-$(XEN_TARGET_ARCH) && \
-	  CC_FOR_TARGET="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(NEWLIB_CFLAGS)" AR_FOR_TARGET=$(AR) LD_FOR_TARGET=$(LD) RANLIB_FOR_TARGET=$(RANLIB) ../newlib-$(NEWLIB_VERSION)/configure --prefix=$(CROSS_PREFIX) --verbose --target=$(GNU_TARGET_ARCH)-xen-elf --enable-newlib-io-long-long --disable-multilib && \
+	  CC_FOR_TARGET="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(NEWLIB_CFLAGS)" AR_FOR_TARGET=$(AR) LD_FOR_TARGET=$(LD) RANLIB_FOR_TARGET=$(RANLIB) ../newlib-$(NEWLIB_VERSION)/configure --prefix=$(CROSS_PREFIX) --verbose --target=$(GNU_TARGET_ARCH)-xen-elf --enable-newlib-io-long-long --enable-newlib-io-c99-formats --disable-multilib && \
 	  $(MAKE) DESTDIR= && \
 	  $(MAKE) DESTDIR= install )
 
-- 
2.30.2


