Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1B3A9BB4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143115.263995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHd-0004Lb-Kc; Wed, 16 Jun 2021 13:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143115.263995; Wed, 16 Jun 2021 13:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHd-0004Fr-74; Wed, 16 Jun 2021 13:08:41 +0000
Received: by outflank-mailman (input) for mailman id 143115;
 Wed, 16 Jun 2021 13:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1t-00075D-8k
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:25 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd38271b-afa3-43fb-bb08-840dca73930b;
 Wed, 16 Jun 2021 12:51:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpjtmM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:45 +0200 (CEST)
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
X-Inumbo-ID: fd38271b-afa3-43fb-bb08-840dca73930b
ARC-Seal: i=1; a=rsa-sha256; t=1623847906; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Vbs1j7mJbricsA1IIQ8f5z4T87A3bI9ApYAk+bMRpD8bhxcTw5qvgllKCvFNm+WwCw
    WmOKlZMV9uGIwJg03kHSni+u88xYHW9DMdPtis4Q9gXtaQgY9xbbplBw5+X3BwqZe59w
    VkvV/xN9uEtJNjE18co5YigmoL1BPFlF2RAQG3NJyHpK7YGEowhl5f93iEbj3MoAGMSJ
    fOjOPiNLSdVQoKSulFYSp9mWLF8VikPXhZSPTJNK85EmXNOxJnuAMGtBvqiBKRP3Yiqi
    2P6Irr3/kB0KEnCZZFvnk1cNpKjCQ8q3pxlPwYNHDI4OkxykCWdAo2iMqZ9PE9pcENzd
    4mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847906;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0LMXyjqr5dhJU6Kt86LbarPPbfCTtmro+NAOq1cH7Ts=;
    b=pLJdI34sA4mQh8XdxM4ZJwGOprEg6rp0dENeOEVsTbec9S87BDRDWvSYINYY+MvbSv
    jwRvEPnnWuNfJ91oRSnr/1zGp3uI5Rt+pvRH4sCJzy/jum3qIETlctAlLXVH3snHFyOQ
    c7p7qLFz3L5s5dDCal9ApishyyhVgMjir9anBkAKd6XycAnhyKYFI0pKz49WnBtkMyJp
    nuin+YUvbYR4iKQJgm7+544NQDJnUjZQi7zMlBnwSywmFe87HlGD3gmupMFXdP5NvD6q
    OaB6rJ2VXaXxYzLF94l0r8EYg/B23qSunWp/+6WQ/Yyj3hmXBzfPIDJPxHw4J8tm2yx+
    ewtw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847906;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0LMXyjqr5dhJU6Kt86LbarPPbfCTtmro+NAOq1cH7Ts=;
    b=iYOUWSZIPy/UeeZszze/3scZsU10jMdAzh7SXzV8Ou6jDvEfVIfruOS0enhMOI1WnQ
    +3tTWcJdMz5iKbR4gQX/ZrQXs7uUvDpyQfn5HhXOUyrVtNlIFw7eg7v9mFb5WTRjnWYY
    Rsmhw6Ao1Uem1OgyRvZbFbUnLyFLaEpOsa/Kjo4dAjd9wifCjt/KjwUDYIsBe2JRI3B/
    worMaYRqYW/RmV5KgKDJpCLhwCIHibY7FYcAQJJ+bDHxl5etIiPgxK8patbwwzcVvSkV
    BAckxj5Wghl0WjZwzjtlD0HCAgXTaNsdbGCrlzogg9eLVnq5T9uo1NDS3XfVH6FvW+bo
    TcLg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 27/36] tools: recognize LIBXL_API_VERSION for 4.16
Date: Wed, 16 Jun 2021 14:51:20 +0200
Message-Id: <20210616125129.26563-28-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required by upcoming API changes.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/libxl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f..29931626a2 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -729,7 +729,8 @@ typedef struct libxl__ctx libxl_ctx;
 #if LIBXL_API_VERSION != 0x040200 && LIBXL_API_VERSION != 0x040300 && \
     LIBXL_API_VERSION != 0x040400 && LIBXL_API_VERSION != 0x040500 && \
     LIBXL_API_VERSION != 0x040700 && LIBXL_API_VERSION != 0x040800 && \
-    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400
+    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400 && \
+    LIBXL_API_VERSION != 0x041600
 #error Unknown LIBXL_API_VERSION
 #endif
 #endif

