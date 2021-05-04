Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7D372A55
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122283.230614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUO-0005sv-JJ; Tue, 04 May 2021 12:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122283.230614; Tue, 04 May 2021 12:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUO-0005s8-Fd; Tue, 04 May 2021 12:49:24 +0000
Received: by outflank-mailman (input) for mailman id 122283;
 Tue, 04 May 2021 12:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUM-0005hX-RN
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:22 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3699f7f1-1e70-41dc-be90-334e67911516;
 Tue, 04 May 2021 12:49:14 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id a2so8300387qkh.11
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:14 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:12 -0700 (PDT)
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
X-Inumbo-ID: 3699f7f1-1e70-41dc-be90-334e67911516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y48tGnkudDovdl/5JuqPSC9kMpsbk+sIm1W0tcK17X8=;
        b=D9u6t/78OOZobHOleD5mosdiTLzjI0yT/Vwz2SX8CqEyiK890JH2KY4OMfo8XMPaqz
         An7urQlk5XuCejgn29hKhx+liwck/MHjiUeIBW8W6pXVZDJ7UwAoc3rY5G5qt4OkZCDH
         SHlQGsfK+rl9e/JQxbohFfolV/jEuZTtsp3DUIXIRD86cZl7W0vMZ1ACD3/MljF1Fvh4
         a977kXEEITQLooL6KZxDbM7WWSg1LIyN5gPQzYSkGzoZPgOsXJyPYBVclfqGzagKFiP0
         aqbrapmYc2E9wDJkTyE30kNRTizkJQXRexzwZ//E3OwVSOAwwNFUneahEV9sgtRjdkoW
         odIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y48tGnkudDovdl/5JuqPSC9kMpsbk+sIm1W0tcK17X8=;
        b=Q9vJHqxATvn6xt6UzX5hWeFojGT7YBOmqTCd6rpjUhHFULm8ccsFUOxfwpp4+pOem+
         hHLrhD4K6/WQPqALDs3mNKWzYyuAaf/2+kplerJ+fmTWPwK9i9ODhW5BXadsI/fgOTku
         zeph9QkEbOFMg3X8ggHkFRVxlI0snrtKNofMg98mWVznZhCZqQou9EhDqvMSCUDFIDQN
         ly/tF6jiTID10Ul5p5A/c8RsvNVuNqKA+t3NXEqWg+YroZ8Fx8qFSS+7bbafw7m9WeT8
         jt9Mh6Ywe2kHWXRxWdLOvqf/eOeF+BeN1PVdxQ0Xd8g/TLpLr8MQN3hy3OpH7Te5rst0
         dN8A==
X-Gm-Message-State: AOAM533LDtjlyE4fKhKVjewBUlqyEbSLAwss+T+yo63A7VHWDpX0q1Oy
	NHeTGEy9zrRNv/yOBNoUbdjdA+Qtn4s=
X-Google-Smtp-Source: ABdhPJwuPnT/sqnCz0dlIhe6T7rERiv//tc6a1gUXO0jBEomuTR9x/exHYo6BgSqVcqURggccyun+A==
X-Received: by 2002:a05:620a:918:: with SMTP id v24mr24268623qkv.54.1620132553430;
        Tue, 04 May 2021 05:49:13 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 3/9] stubom: newlib: Enable C99 formats for %z
Date: Tue,  4 May 2021 08:48:36 -0400
Message-Id: <20210504124842.220445-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
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
---
I haven't tried, but the other option would be to cast size_t and avoid
%z.  Since this seems to be the only mini-os use of %z, that may be
better than building a larger newlib.
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


