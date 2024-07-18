Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84279350E4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760598.1170532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJM-0000VD-Ek; Thu, 18 Jul 2024 16:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760598.1170532; Thu, 18 Jul 2024 16:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJM-0000RT-Ap; Thu, 18 Jul 2024 16:48:56 +0000
Received: by outflank-mailman (input) for mailman id 760598;
 Thu, 18 Jul 2024 16:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJK-0007P6-OC
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:54 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d8477d4-4525-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 18:48:53 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eeef45d865so13798371fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:53 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:50 -0700 (PDT)
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
X-Inumbo-ID: 9d8477d4-4525-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321332; x=1721926132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYc4CYlNYiXlhGTE3F3Z17D5dfT00FoaAtahQbVBGvo=;
        b=XwKwEFgd0gPh1dsPy587tpI62YA4S3W96UeQ3afyyO92rhQjwqSJMUxVrwUQolNi0j
         anD7lc2vVEfHGj2ObLxgDutwMcV8s020d6e1fJY8Pe6xFhu6gPdiJiitU5f8UH0Nd/nv
         8y+dt0souw3scDL4bjf+AlES5omp6jHlkOfi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321332; x=1721926132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYc4CYlNYiXlhGTE3F3Z17D5dfT00FoaAtahQbVBGvo=;
        b=dIjTrRttSs32iY2q8551YvE8MdqsPB9jnnA1p7ScEeyLK131A5ec1MQfMzz45+yTVK
         Awf9ixE3msu6fZxZhExFm31cp6k/X3QpgcPaYcHyI6Q0ouWipuNUg9AkkjnqpWq7n3/J
         t9b/o2o4XbQ9NrU5TpFy2/3/Sbf0gbf+6JTMcPGNSERGig6Sn8qCDPDf5fB2x4XyaS2c
         Goll1G/RS2H3vy4HuHcRyyA7fvvQEv8rMrWPijEruYH9JM+n6J+LJmcAwc7MOoZ3IogN
         VdNbPdqA5vC3UzY/jrfDz/1fl2Uo79HNvfylZdtQgS/GsGTF73QVqYn/Em49Zb/d9xM6
         QzKA==
X-Gm-Message-State: AOJu0Yxr8Qz7qJ91kgFk0/m9k36Batb3NINU9X6QN9TWvNqxds2vmEA3
	807jLiVbUme8zflPXHFb/Qqq1Qrn8bjBSmvq8CDkr5M4GJLK/8pQfI40g8lCno8yci1q2Q6Vry9
	q
X-Google-Smtp-Source: AGHT+IEY1gnYXw/cRpFVXBzT2Q9vxvDB6ROlWIMl2FDXaLt4meEJFMN2uWHJZXsyiVHGgXIQQMBViw==
X-Received: by 2002:a05:6512:6cf:b0:52c:905b:ea5f with SMTP id 2adb3069b0e04-52ee545400amr5237900e87.63.1721321331774;
        Thu, 18 Jul 2024 09:48:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 5/6] tools/libxs: Use writev()/sendmsg() instead of write()
Date: Thu, 18 Jul 2024 17:48:41 +0100
Message-Id: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the input data now conveniently arranged, use writev()/sendmsg() instead
of decomposing it into write() calls.

This causes all requests to be submitted with a single system call, rather
than at least two.  While in principle short writes can occur, the chances of
it happening are slim given that most xenbus comms are only a handful of
bytes.

Nevertheless, provide {writev,sendmsg}_exact() wrappers which take care of
resubmitting on EINTR or short write.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 104 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index f4edeb05f03b..9db5c02661f5 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -563,6 +563,105 @@ static void *read_reply(
 	return body;
 }
 
+/*
+ * Wrapper around sendmsg() to resubmit on EINTR or short write.  Returns
+ * @true if all data was transmitted, or @false with errno for an error.
+ * Note: May alter @iov in place on resubmit.
+ */
+static bool sendmsg_exact(int fd, struct iovec *iov, unsigned int nr)
+{
+	struct msghdr hdr = {
+		.msg_iov = iov,
+		.msg_iovlen = nr,
+	};
+
+	/* Sanity check first element isn't empty */
+	assert(iov->iov_len == sizeof(struct xsd_sockmsg));
+
+	while (hdr.msg_iovlen) {
+		ssize_t res = sendmsg(fd, &hdr, 0);
+
+		if (res < 0 && errno == EINTR)
+			continue;
+		if (res <= 0)
+			return false;
+
+		while (res) {
+			if (res >= hdr.msg_iov->iov_len) {
+				/* Skip full element. */
+				res -= hdr.msg_iov->iov_len;
+				hdr.msg_iovlen--;
+				hdr.msg_iov++;
+				continue;
+			}
+
+			/* Partial element, adjust base/len. */
+			hdr.msg_iov->iov_len  -= res;
+			hdr.msg_iov->iov_base += res;
+			break;
+		}
+
+		while (hdr.msg_iov->iov_len == 0) {
+			/* Skip empty element. */
+			hdr.msg_iovlen--;
+			hdr.msg_iov++;
+		}
+	}
+
+	return true;
+}
+
+/*
+ * Wrapper around sendmsg() to resubmit on EINTR or short write.  Returns
+ * @true if all data was transmitted, or @false with errno for an error.
+ * Note: May alter @iov in place on resubmit.
+ */
+static bool writev_exact(int fd, struct iovec *iov, unsigned int nr)
+{
+	/* Sanity check first element isn't empty */
+	assert(iov->iov_len == sizeof(struct xsd_sockmsg));
+
+	while (nr) {
+		ssize_t res = writev(fd, iov, nr);
+
+		if (res < 0 && errno == EINTR)
+			continue;
+		if (res <= 0)
+			return false;
+
+		while (res) {
+			if (res >= iov->iov_len) {
+				/* Skip full element. */
+				res -= iov->iov_len;
+				nr--;
+				iov++;
+				continue;
+			}
+
+			/* Partial element, adjust base/len. */
+			iov->iov_len  -= res;
+			iov->iov_base += res;
+			break;
+		}
+
+		while (iov->iov_len == 0) {
+			/* Skip empty element. */
+			nr--;
+			iov++;
+		}
+	}
+
+	return true;
+}
+
+static bool write_request(struct xs_handle *h, struct iovec *iov, unsigned int nr)
+{
+	if (h->is_socket)
+		return sendmsg_exact(h->fd, iov, nr);
+	else
+		return writev_exact(h->fd, iov, nr);
+}
+
 /*
  * Send message to xenstore, get malloc'ed reply.  NULL and set errno on error.
  *
@@ -605,9 +704,8 @@ static void *xs_talkv(struct xs_handle *h,
 
 	mutex_lock(&h->request_mutex);
 
-	for (i = 0; i < num_vecs; i++)
-		if (!xs_write_all(h->fd, iovec[i].iov_base, iovec[i].iov_len))
-			goto fail;
+	if (!write_request(h, iovec, num_vecs))
+		goto fail;
 
 	ret = read_reply(h, &reply_type, len);
 	if (!ret)
-- 
2.39.2


