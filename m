Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC3F9350E5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760597.1170523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJL-0000Bs-65; Thu, 18 Jul 2024 16:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760597.1170523; Thu, 18 Jul 2024 16:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJL-00009h-0n; Thu, 18 Jul 2024 16:48:55 +0000
Received: by outflank-mailman (input) for mailman id 760597;
 Thu, 18 Jul 2024 16:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJK-0007PV-77
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:54 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dcf5687-4525-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 18:48:53 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52ee4e26790so767008e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:53 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:52 -0700 (PDT)
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
X-Inumbo-ID: 9dcf5687-4525-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321332; x=1721926132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhFAb8PBQU/57PNqveksaa0wxKn4j+nTJ+P+HwWc7e4=;
        b=jQ0bWDdjaR9m+QbYmV2C1XVWkpO8CBWMTmAnftexBYwdblB/ZjNxGmjVtoBEwyw9kg
         5JhUaXRHF5PAo10LRe7b//GIDDnSgVPXHehkcrYof1CNu66S/BclbP46CRJT+u/54qZU
         f5IR4d1LRBItOz9doundZ2VakqtDeULWZrvWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321332; x=1721926132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhFAb8PBQU/57PNqveksaa0wxKn4j+nTJ+P+HwWc7e4=;
        b=E97GePdMyUjXhmix57GrMWnS2hwxGDY4vph/cvaeWrzcFgCQPRLLN/PDl5u9LVyAOm
         sLPyMdMDR0pwMk0RoDIlgcOfqN7Q1ukNMXSw2zIpKWVaSMCeV/KJWkiwcbtt2ECtjvDn
         CiBXUHEUBAXoz0TaD96KQ/WRiN/vkuPn71pNs6BO6dKNZGcG72HcLhMNheKx2r5mvLv2
         qfEJlycnxsEJVcx55q+I3QS0llK0SznRPng7jW5+bGy2Jj/i+W2HabKADgiSH0Npllpw
         TgF8LDlbZo4oKenwmYiSWWRYTq5uhHREkUp4zWTfgWymv5gKeztIoK5eRNx9eQC7SWLg
         vC2w==
X-Gm-Message-State: AOJu0Yz650rppTEa4oQxWM9cY/UI6n2+A6N1Y9hQAsNYsyG4kqv6CPMO
	X7/BlR1ItU4+zO+ixQ66Wyqx0dD1XFpGL6RnCJpuq5DKEoB2v/Y2VS61AAzlb7AmiBJVBloIpCs
	F
X-Google-Smtp-Source: AGHT+IG4Fe3mXPxhBviT+OHpGVmgrBeFMtY0KoXy8ywzzLjRF6J/wTS1Q3D3OlChZOth7bazYM/HZA==
X-Received: by 2002:a05:6512:1082:b0:52b:bee3:dcc6 with SMTP id 2adb3069b0e04-52ee542de4emr3859041e87.51.1721321332536;
        Thu, 18 Jul 2024 09:48:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/6] tools/libxs: Stop playing with SIGPIPE
Date: Thu, 18 Jul 2024 17:48:42 +0100
Message-Id: <20240718164842.3650702-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's very rude for a library to play with signals behind the back of the
application, no matter ones views on the default behaviour of SIGPIPE under
POSIX.  Even if the application doesn't care about the xenstored socket, it my
care about others.

This logic has existed since xenstore/xenstored was originally added in commit
29c9e570b1ed ("Add xenstore daemon and library") in 2005.

It's also unnecessary.  Pass MSG_NOSIGNAL when talking to xenstored over a
pipe (to avoid sucumbing to SIGPIPE if xenstored has crashed), and forgo any
playing with the signal disposition.

This has a side benefit of saving 2 syscalls per xenstore request.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 9db5c02661f5..63d754e17014 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -579,7 +579,7 @@ static bool sendmsg_exact(int fd, struct iovec *iov, unsigned int nr)
 	assert(iov->iov_len == sizeof(struct xsd_sockmsg));
 
 	while (hdr.msg_iovlen) {
-		ssize_t res = sendmsg(fd, &hdr, 0);
+		ssize_t res = sendmsg(fd, &hdr, MSG_NOSIGNAL);
 
 		if (res < 0 && errno == EINTR)
 			continue;
@@ -680,7 +680,6 @@ static void *xs_talkv(struct xs_handle *h,
 	void *ret = NULL;
 	int saved_errno;
 	unsigned int i, msg_len;
-	struct sigaction ignorepipe, oldact;
 
 	/* Element 0 must be xsd_sockmsg */
 	assert(num_vecs >= 1);
@@ -697,11 +696,6 @@ static void *xs_talkv(struct xs_handle *h,
 
 	msg->len = msg_len;
 
-	ignorepipe.sa_handler = SIG_IGN;
-	sigemptyset(&ignorepipe.sa_mask);
-	ignorepipe.sa_flags = 0;
-	sigaction(SIGPIPE, &ignorepipe, &oldact);
-
 	mutex_lock(&h->request_mutex);
 
 	if (!write_request(h, iovec, num_vecs))
@@ -713,7 +707,6 @@ static void *xs_talkv(struct xs_handle *h,
 
 	mutex_unlock(&h->request_mutex);
 
-	sigaction(SIGPIPE, &oldact, NULL);
 	if (reply_type == XS_ERROR) {
 		saved_errno = get_error(ret);
 		free(ret);
@@ -732,7 +725,6 @@ static void *xs_talkv(struct xs_handle *h,
 	/* We're in a bad state, so close fd. */
 	saved_errno = errno;
 	mutex_unlock(&h->request_mutex);
-	sigaction(SIGPIPE, &oldact, NULL);
 close_fd:
 	close(h->fd);
 	h->fd = -1;
-- 
2.39.2


