Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA5ABE814
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 01:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991239.1375129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWRu-0004WY-Dq; Tue, 20 May 2025 23:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991239.1375129; Tue, 20 May 2025 23:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWRu-0004TR-AI; Tue, 20 May 2025 23:32:42 +0000
Received: by outflank-mailman (input) for mailman id 991239;
 Tue, 20 May 2025 23:32:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iUqS=YE=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uHWRs-0004TL-R9
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 23:32:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7f3281c-35d2-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 01:32:39 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so75846115e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 16:32:39 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b297easm50341795e9.6.2025.05.20.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 16:32:37 -0700 (PDT)
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
X-Inumbo-ID: b7f3281c-35d2-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747783958; x=1748388758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8V1hl11gRxp9GaliI0XC+7jI+TfFKoJTghQ0PP0k5o=;
        b=blFgHdCcwnVg/AMZI3KpTm5eD5DCudocNl+8Y2cfrrP6OCvYjnfeqVvKDYIyCmZelx
         imzDV70mUVBDaPSEIK3tJNTNiwmeEV5/QijloizJXSgiHde7BnumeuAbtEDmbAAnXb/9
         H+T72pzNCWlSluv+rPnJzpgGUlzvXUIsJZL6rJIdK2AET+KDPWPY55VG+OvPvxiCu7eZ
         Ag7JKNHx2Jb3SiGN0K8BlJ1p7xUl9kbkjwkkIIq1ROAv+CCmQgM2ZYHORa8soIOWhz1C
         L3O95gjBrU5HCHHEXjxnc5fnvqzqiVxbYQW0f+smJrjXLTP8WejecEXGZNth8nu/OBkb
         RvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747783958; x=1748388758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8V1hl11gRxp9GaliI0XC+7jI+TfFKoJTghQ0PP0k5o=;
        b=pnx4F1GGosO2pQgG2bjtdGBfKXgSjiexZ7Y73/AG3TzaTdQVLYlHN61qX2tVlZZZk9
         MfT7av5sJR8olb03orPEZ+n1OrfEzZ+3DRHxbUcjs25+IU1DTNgfWcqF+ezVksXKgoRF
         ZgsT6yjp+8oaGyRJVwRkVJuaDM7pHgIwuLL/h2dhywVLAoyIOq/qv2yZ22i7jgmD2kxr
         rVnsfgCmiC+J3BfcaRi30mu+dYvYgzK3VeRmG97gfYMTi/dEZtIqAqCMsvsfizxhXqAO
         5J5HigGf5pNGlOrzwwDy9yk8Mra6I+7Q0nehAUe5oFcm6B6q0WYFDv/n/JRYF/hyIj9w
         8W5A==
X-Gm-Message-State: AOJu0Yzkv34hYbKiXKYIR2+r5Qo8AV2ZQ4s6SbkakseAt2Yrl8IXOcJ1
	WWW1V5wBjZkbsvnRf7uWdncxG7NYM+amZrvZXpYrlffutGPdJvv95nj1AYEwzg==
X-Gm-Gg: ASbGncv+sWH2o2bgzI3qFzFlmMPUEjL7kNNUPZt985uP5/DzXUW/4cU8f5ZYfvElzX3
	APONZa3UfY1Sjl1ms+uPSMRggq2nPRjTg8njHGSf/9I3WJH+vuWzAVr2RZpOqp4XPCZ2cBJNN3O
	q6FzVk8bkPsyqd34DupoBUaww9NkWLbZkUOvzVjPED4KKfhk1LOlmOzd5yfUFzkPGY1k88RgZtF
	tmd6gzi6BLZUo406g2HhYQCGS5uxqxOS9g1sIbHrst5s0JNLRNGkftpfbKsWSOM/N2xnqyi+L1C
	L9CmUueW9H6l5yzQf+EUqDiUWm270jfHLiQiDSLlZfaf3iehVGr3vqI9hz8Rppzhw5/a69ktT8U
	=
X-Google-Smtp-Source: AGHT+IHxFziV1JdmTPj33vQndpna0YnSHJI7adhPiuJPEVysxFsM8IEqWA40pZhj7DrjHxlMS9IXVA==
X-Received: by 2002:a05:600c:4686:b0:442:f4a3:9338 with SMTP id 5b1f17b1804b1-442fd664a41mr150737175e9.21.1747783957932;
        Tue, 20 May 2025 16:32:37 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: include Argo documentation in the ARGO section
Date: Wed, 21 May 2025 00:32:19 +0100
Message-Id: <20250520233220.868258-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..e7198363c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -226,6 +226,7 @@ S:	Maintained
 F:	xen/include/public/argo.h
 F:	xen/include/xen/argo.h
 F:	xen/common/argo.c
+F:	docs/designs/argo.pandoc
 
 ARINC653 SCHEDULER
 M:	Nathan Studer <nathan.studer@dornerworks.com>
-- 
2.25.1


