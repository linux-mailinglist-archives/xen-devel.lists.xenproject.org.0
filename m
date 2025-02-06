Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4EA2B2A6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 20:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883119.1293191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg7sK-00069d-Ng; Thu, 06 Feb 2025 19:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883119.1293191; Thu, 06 Feb 2025 19:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg7sK-00067Z-Kf; Thu, 06 Feb 2025 19:49:24 +0000
Received: by outflank-mailman (input) for mailman id 883119;
 Thu, 06 Feb 2025 19:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BTF=U5=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1tg7sJ-00067N-TB
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 19:49:23 +0000
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [2607:f8b0:4864:20::92c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 742ec032-e4c3-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 20:49:19 +0100 (CET)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-867032b0393so162413241.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 11:49:19 -0800 (PST)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51f22736ed8sm283221e0c.12.2025.02.06.11.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:49:17 -0800 (PST)
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
X-Inumbo-ID: 742ec032-e4c3-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738871358; x=1739476158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1AHQGaQ6a+2WwzZc/NqArKgJbl25fEKxLjNub7Wpx0U=;
        b=keIsn6dshaL3S+OL5jwIJE/5vKbnO9tcIjpFhZefMx2tzbXylI/i2e8cN4rj7v8btr
         3GFnSlxpxo8NVGHBSK0Zw2eTv/NTdukoiIW3WK+bDklj2lNcZhjtYk6cQabm5M76vlZu
         ulbvltkxPKs43jw62CbdegC9zxpEeuLb+S3QzkjlHd/G+xqyOOPBLy6+oL6N6qkmnCn8
         bPb1hSZ5LOvj9up6xDUsQdeZRvaG25ZN9HqtPjX26mqKWjbEn7pl30Q5shfZOq2MAa43
         YyiacyM6VYHi+HDkPDGs3dgt23bVWMirBKVL7vMDC0mzD9ufK+TRMJ/vj7vRDUVsP4qc
         si5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871358; x=1739476158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AHQGaQ6a+2WwzZc/NqArKgJbl25fEKxLjNub7Wpx0U=;
        b=AwAN9i8IZjuShE52eU+Pa6ySgnBkAwQJ+2Zvh3UEIG8brqRHCzDC0uV00VqTzVfw2S
         4BuXA1oFjUpTtWtnwP9we39MPRYUHyLi5F80Wyk2mB6f/6cbpoAZDSQVDGbplR3bH0fh
         miKIpVfIKMSCy0i6kO13XKcwcuJ9A8ONwakNMgPgAR+JkIAdr9wwvEGpVWNa6HumDpwm
         USbkQPRte7C01tVuBe+TWQpJrGa+N3paBr8tSJkvA0whAO7maAALDxQ0ck4sP9YrGlEl
         U3zRyKqwaYdIF5qeohmjuD5oh1ze1yGBL1Y56zc1StG/Sjt2YkTxyy2lD7zXF9cKSgmM
         BtJg==
X-Forwarded-Encrypted: i=1; AJvYcCXrOFFbZDRT1gE1L8Uk1jF7yxlUv89Dl9iwU9E+pNhwlNhmz4LYUeHjt7O0KQ7YQwDSQQYtQXTjhU4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvwvn0IGMb9NU053GmNW+ElzvMvf397VcOIPiN3WnhgLk3ViZb
	XjMOLpNL7CDQyznLKGU7kQUvpsXeFZrRnRCW04/VbUJluFEsFwpw
X-Gm-Gg: ASbGncuj9CImqncMnJWNrBRlXFVPu6crKlzMMvzyvNAILVlKuj2NEBMGnx0vlnCqFjE
	GUexvxe7ukLd3M0sj/xNls4NZdqWuJC37cYBGZT9JJ4It2faRtegRaLMD/ZLlBnXoF/C1xmXLEp
	Q99KED3wWDDNNftxOYytMzLCOTjbPLE+FSFhJogri3X/SWwm7/JLitiQ5W01jZttqtw05tTtHnA
	Y0KnwHXa/F6gexqls8j9BoFMO59MwV6nlaHNuuCX/gL9E8xVJeXP98cifh4OWNijarM3giOQTs2
	lX0yRd7897sADJkkWNZtZsBRaBIg6fOa7cFUQPJ/af5aOPdNNDGlFrJFgKM/gQ==
X-Google-Smtp-Source: AGHT+IFVsnACvhkr17SGqaghVSfNMb9sKxIujmMevzJ6uGZOdHm49960ITi5q9P0koSCvsuUZzIwGA==
X-Received: by 2002:a05:6122:8c0b:b0:51c:c23e:8cd3 with SMTP id 71dfb90a1353d-51f2e151fbcmr630171e0c.4.1738871358385;
        Thu, 06 Feb 2025 11:49:18 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	olaf@aepfle.de,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/1]  xen: Remove invalidation of mapcache_grants on IOREQ_TYPE_INVALIDATE
Date: Thu,  6 Feb 2025 20:49:14 +0100
Message-ID: <20250206194915.3357743-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Olaf reported a slowdown in boot time on x86 HVM guests and Stefano
provided a patch that removes the invalidation of the grants mapcache
since not needed, more details here:
https://lore.kernel.org/all/Z5oIvUINVDfrrVla@zapote/T/

Cheers,
Edgar

Stefano Stabellini (1):
  xen: No need to flush the mapcache for grants

 hw/xen/xen-mapcache.c | 1 -
 1 file changed, 1 deletion(-)

-- 
2.43.0


