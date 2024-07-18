Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B99350E1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760595.1170514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJJ-0008OD-QZ; Thu, 18 Jul 2024 16:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760595.1170514; Thu, 18 Jul 2024 16:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJJ-0008IC-N7; Thu, 18 Jul 2024 16:48:53 +0000
Received: by outflank-mailman (input) for mailman id 760595;
 Thu, 18 Jul 2024 16:48:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJI-0007PV-09
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:52 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c7d0fc6-4525-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 18:48:51 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77e85cb9b4so130933866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:49 -0700 (PDT)
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
X-Inumbo-ID: 9c7d0fc6-4525-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321330; x=1721926130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkTFy1Zu0Gr3zYTHQkG7FDGi6T4zpbFrbx2OTn5XtTQ=;
        b=mUMPKZtcMV/1kx2RfqtvJVAKaULrCxEgcH7W8w9rQsJTm+2Th1VPBHI15BCnG1SR3h
         5Y5R2LeTe0+JTns7TA+SripEnTQIleUupBrRv66tWHjX8hxlY/7hF/KHABRyZqbt8y4R
         rwH69D3UDdWnoBgQ5KNushp8AechEPDnIk8Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321330; x=1721926130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkTFy1Zu0Gr3zYTHQkG7FDGi6T4zpbFrbx2OTn5XtTQ=;
        b=IiesVEgBeRmG47r65AMmRksvsgS6bpkXlpJjYnmx27AI+DmouXFASNnJXWXTu4e51e
         Lo21Mw0L48dwiaLvSIRBZj0ByD7Ybgo4aotg2FUojbGR8/mJxhjok7seT0GqHfw6gBjR
         UJiv8M1JKJZPRVHT0GMxZCRprV5G3H6Y2UJ6DwQ2293AAwF8HyverDeDBoLBRPf+/oTj
         EFZ8Ii6dmSJm9kKvTlOJwBzKo3Maz1+KYmMhnucGaAr09ZYC3GomGgkqpqu4qqxPtPb/
         6p4y3NRtVOvuPtSM7nrRmr/g+U1Q+IfNVbtZnezshAGlZPbpedda2zuw8PCUv9VAod0C
         Mc7w==
X-Gm-Message-State: AOJu0Yxy624AuvsObaG31a2h864jp37XmmAeSJ+XiYkneOkxwyd0J8VD
	0wbvJ8u2dhUBEE74oYKoIkMyVrSQAbqbNW5XH8u6EY7z5o/rHREnn5eTT8gOvgXcrquTVjv3ycT
	X
X-Google-Smtp-Source: AGHT+IEd3YKoTQS49yqTGntO+HlOOzWaMziAkw4OTK8/nbvgjO2uP5cSTIwTE7Qy4RgevDhVddCB+w==
X-Received: by 2002:a17:906:4c51:b0:a77:c0f5:69d1 with SMTP id a640c23a62f3a-a7a01352d79mr392894966b.60.1721321330513;
        Thu, 18 Jul 2024 09:48:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/6] tools/libxs: Track whether we're using a socket or file
Date: Thu, 18 Jul 2024 17:48:40 +0100
Message-Id: <20240718164842.3650702-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It will determine whether to use writev() or sendmsg().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 96ea2b192924..f4edeb05f03b 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -65,6 +65,9 @@ struct xs_stored_msg {
 struct xs_handle {
 	/* Communications channel to xenstore daemon. */
 	int fd;
+
+	bool is_socket; /* is @fd a file or socket? */
+
 	Xentoolcore__Active_Handle tc_ah; /* for restrict */
 
 	/*
@@ -305,6 +308,8 @@ static struct xs_handle *get_handle(const char *connect_to)
 	if (h->fd == -1)
 		goto err;
 
+	h->is_socket = S_ISSOCK(buf.st_mode);
+
 	XEN_TAILQ_INIT(&h->reply_list);
 	XEN_TAILQ_INIT(&h->watch_list);
 
-- 
2.39.2


