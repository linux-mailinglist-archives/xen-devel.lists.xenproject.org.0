Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3859EB32C4F
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 00:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091560.1448082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upwhQ-0001TI-8I; Sat, 23 Aug 2025 22:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091560.1448082; Sat, 23 Aug 2025 22:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upwhQ-0001PK-1B; Sat, 23 Aug 2025 22:27:00 +0000
Received: by outflank-mailman (input) for mailman id 1091560;
 Sat, 23 Aug 2025 22:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFF/=3D=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1upwhO-0001Mm-R9
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 22:26:58 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47d4fabd-8070-11f0-a32b-13f23c93f187;
 Sun, 24 Aug 2025 00:26:58 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b72d690so450913a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 15:26:58 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fd37fbsm252045166b.47.2025.08.23.15.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 15:26:56 -0700 (PDT)
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
X-Inumbo-ID: 47d4fabd-8070-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755988017; x=1756592817; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxbSUIBsw0EVkmhIu0DrRsRTOlPMr0YznFiwwKR8I0U=;
        b=Sr7Ud6jS6eRSf0GZDtOwnKjqsPOJCNk45Eub2ilnAjRR2u2p3mU2W1cMQSIoUXVHlO
         tX4RNhNZ6uMYdvEzDyjUfPO7P5oSmcfSin4WuvvINJSQda/EKKXJNo8cG2CG0X77T8BL
         nMj4yfJtAQkJxg+EFogCwMFmYK8oE2TjgVPoLJYtNdK5VtCXNxoDH9rcGpMPmL3aE4+A
         vl8p/r9A2bjTEveeiCNrk4OOqtiZ0ffp4P1kpaSjqxPSelNksR0POTYnmLU118Rj7oPU
         viXqlyihiQj7BLixjle35J+EdMjGoucyxwapWRu9euJksDV8cj/gwr5FVUpu7dkCTAEg
         MeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755988017; x=1756592817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxbSUIBsw0EVkmhIu0DrRsRTOlPMr0YznFiwwKR8I0U=;
        b=dqBM2JYk60PBOATgethxl1vTOLd+HiRThSH78o5dwXVyKRJDUCodWqUpfqS280zLKF
         xEoJP24+qFpxaIRLmX8TMijAYK0kIMAcvcgFrxKuAuwBFRgrB7WFgxx6B1fy+H7079rv
         7dlvwWtTWPVb+NsDAEIQ1wcDtNDGOebzM/qKnGFGpfGNvM6puCqU5qku18UdZbNzo9oI
         39zMevDOK+czNoFTrj+gBeG1SS9NbkgwRqGwaJ8xjjz/tnGVyhcq37RDhtXTI5nMo63+
         0wj/Nd7IwPodZwfWYH7csxZ1q5+g5hLhlxrzc0JDuUjr+HO3Q7nSxPIHO33T7O2LN4LX
         tzUA==
X-Gm-Message-State: AOJu0Yyp123CJKcmiSOrxGgMVfkU50bNwrD82ToYRFh89dk2+WyOWHd8
	vDEg2+kbeWYNFRyOaWYCRhnujd6AOLZ18D6NMmxCLsjcvXnEumSEySXRy+6LcQ==
X-Gm-Gg: ASbGncsghcISAjGTmwj5lgne+JMLrHWsOZZaUvhvM7NqFaVNZx2ZCKqI7IDeDwhIiyh
	6qRl1cRkQLzXKpUUnKNXd8NbOwZG1cFjLzHaYwSBIt7CvKEFT4Jz+A4A4p7cq6brPtVwwVgqBh3
	Rngr4W/eNb3Pb37jQHo0XBqb5MqKpqO1xnjS87ECJf1otDAkRqsARIl/8nR8BY4iSQ21kLN/lsa
	0TW/pSHZiGTPJD9AzuG5W9L9Bbnt9X2N18aGcsH+FNypo6CFJRSi0XN8zoZmR14gFBDdJTZKlob
	HZveEJOe2g06yg8QS8z848Pi7GZu/CVUMqGe3rNHnMeR+T72VmUhOcTdk0WYx8veVEE3XPT2uZ7
	y0vUI4hnp4wqIQyIPqdkPa8ctcDGy1yX7BxInWRBNCdiLZYslKHhPYMRb5py+GDRf8R7amiSNZ6
	+lCNdq70ARPWkJSxMG3vPfhA==
X-Google-Smtp-Source: AGHT+IGiF52LgoFc0dxwElU/Bxjwb+i8FifOsoea3FMdnNUewjH/+n9bU2JS++tq+h0gcEicTZJ7Cg==
X-Received: by 2002:a17:906:4794:b0:af8:fd22:6e28 with SMTP id a640c23a62f3a-afe2903168dmr384184466b.7.1755988016979;
        Sat, 23 Aug 2025 15:26:56 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 1/4] tools: add sizeof_field and endof_field macros
Date: Sat, 23 Aug 2025 22:26:49 +0000
Message-Id: <8dd6b217fbde427407113fedabb70f54d12aed61.1755987697.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1755987697.git.w1benny@gmail.com>
References: <cover.1755987697.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

* `sizeof_field` returns the size of a specific struct member
* `endof_field` returns the offset to the end of the member within the struct

It will be useful in upcoming layout checks of SMBIOS structs.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/include/xen-tools/common-macros.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 0088208c2e..9838a108aa 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -83,6 +83,11 @@
 #define __packed __attribute__((__packed__))
 #endif
 
+#define sizeof_field(type, member) sizeof(((type *)NULL)->member)
+
+#define endof_field(type, member) \
+    (offsetof(type, member) + sizeof_field(type, member))
+
 #define container_of(ptr, type, member) ({              \
     typeof(((type *)0)->member) *mptr__ = (ptr);        \
     (type *)((char *)mptr__ - offsetof(type, member));  \
-- 
2.34.1


