Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE7939279
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 18:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762241.1172375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVvrH-0003hJ-Q6; Mon, 22 Jul 2024 16:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762241.1172375; Mon, 22 Jul 2024 16:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVvrH-0003fI-Mo; Mon, 22 Jul 2024 16:25:55 +0000
Received: by outflank-mailman (input) for mailman id 762241;
 Mon, 22 Jul 2024 16:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVvrG-0003fC-2e
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 16:25:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fef7be4-4847-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 18:25:52 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77c080b521so472855566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 09:25:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785c6csm438867066b.20.2024.07.22.09.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 09:25:50 -0700 (PDT)
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
X-Inumbo-ID: 0fef7be4-4847-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721665551; x=1722270351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUyFkTHbNh/Rb5s0ouExkhBiQNtcl7K03KDiyz1UOhU=;
        b=Xg3eJ3hAdMn8Ntkj/Eq/1IqPaSwhe+VUrDoB+XSwp/OBI1sBRgMjvXANPCWYxELKPU
         CzLIGsBG/Pq4uSp8raCx6qgJS1jyl2HodWTTCGo0kq64TqUg6NHUuUcVAY/S3gfOArJB
         P+I55eICExVjt2U5Y/Uo+Mu0QULArV5sJFvEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721665551; x=1722270351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUyFkTHbNh/Rb5s0ouExkhBiQNtcl7K03KDiyz1UOhU=;
        b=WIDgXMzXANkiT+Duu5TS1DAvDM0lpnjTiWcZyUs/YzkcG6tmolbZBW/i/QZlrdjcNP
         4Q4x0ENF9WabppMasRVADUs8Os+qWgbSmqM0vbWl32kN3bs53w2sYTyMZ7P0ZLFQKFwI
         u6WFh7l6RYz5uYgqEBdNMEqb3phiV8frYcw54lh/5g7tXD0b41JGoYVhdR29V6IubRV5
         bQYXR1UkJDm4tyKpulyFdAvtny8xLiCgN8reOAi1StqFL8rKcIJPAbloTNo8gfAV6nNY
         N8VrJuAaTfXxdqSvsBcAOxfHLkj/8Or5ZX0F4NGx2vSLLM67RYvKLTwxVG4iHJKF6u2t
         qOZA==
X-Gm-Message-State: AOJu0YwE0ab1MqFDvww9TZ0tHBHMEL/U8NymDYPDAvBHbGSqbSrjANLn
	GQXmwUpI/sUWQdtz/dnZ59v17qg9QGbS8mdRtUvWMxVjPjiF2T8yzP8KI8a2ke1e2o7jaenNZHj
	d
X-Google-Smtp-Source: AGHT+IGdFBghLLbiZbvjjJLeZXG3vwnJwAbxYsOXoDtLTjSAGxTlLuUevIgBJmou9owXIYW6Kp4IXQ==
X-Received: by 2002:a17:907:8693:b0:a7a:83a5:4a1d with SMTP id a640c23a62f3a-a7a83a54b0emr62629366b.69.1721665551006;
        Mon, 22 Jul 2024 09:25:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH v1.1 5/6] tools/libxs: Use writev()/sendmsg() instead of write()
Date: Mon, 22 Jul 2024 17:25:47 +0100
Message-Id: <20240722162547.4060813-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
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
CC: Frediano Ziglio <frediano.ziglio@cloud.com>

v1.1:
 * Fix iov overread, spotted by Frediano.  Factor the common updating logic
   out into update_iov().
---
 tools/libs/store/xs.c | 94 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index e820cccc2314..f80ac7558cbe 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -563,6 +563,95 @@ static void *read_reply(
 	return body;
 }
 
+/*
+ * Update an iov/nr pair after an incomplete writev()/sendmsg().
+ *
+ * Awkwardly, nr has different widths and signs between writev() and
+ * sendmsg(), so we take it and return it by value, rather than by pointer.
+ */
+static size_t update_iov(struct iovec **p_iov, size_t nr, size_t res)
+{
+	struct iovec *iov = *p_iov;
+
+        /* Skip fully complete elements, including empty elements. */
+        while (nr && res >= iov->iov_len) {
+                res -= iov->iov_len;
+                nr--;
+                iov++;
+        }
+
+        /* Partial element, adjust base/len. */
+        if (res) {
+                iov->iov_len  -= res;
+                iov->iov_base += res;
+        }
+
+        *p_iov = iov;
+
+	return nr;
+}
+
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
+		hdr.msg_iovlen = update_iov(&hdr.msg_iov, hdr.msg_iovlen, res);
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
+		nr = update_iov(&iov, nr, res);
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
@@ -605,9 +694,8 @@ static void *xs_talkv(struct xs_handle *h,
 
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


