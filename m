Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1C78C753B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723180.1127828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHh-0007nv-5S; Thu, 16 May 2024 11:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723180.1127828; Thu, 16 May 2024 11:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHg-0007is-W1; Thu, 16 May 2024 11:28:29 +0000
Received: by outflank-mailman (input) for mailman id 723180;
 Thu, 16 May 2024 11:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHg-0006b6-66
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:28 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a2d68c9-1377-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:28:27 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so3346789a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:27 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:25 -0700 (PDT)
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
X-Inumbo-ID: 6a2d68c9-1377-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858907; x=1716463707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcXsJFjS9m5+2bzRAoHvtJjIOqkMU5GtwndPgJCwhX4=;
        b=FWWYWfDreGrMzpIK2IDFXfRKtGx+biIrQU41MFruHink8j+mCoPA43ryt75rnGfhf0
         IjAm7qjEoA/27cULb5hD66pkbej8DwvpUxRm65k+b4m9Q+RfDU1CewEW1t/3J7oSQS99
         ISk9PN/eg4LgvYFPa0vWxzGL7uzpFKmbOpUUfzMAoSF8Y6O4a3Ri9ajasLERagsr2k1A
         t303GUQRGPCvgsSHU7YlYHCU9Rz1Bz0oWVEfNuVpK0kYC0H45OUv8HmhA8Twkw3fYT+F
         jZLg+WYilupzgc/w3EDqyuxTOiiqe516lmYfd+U/giYEssH+6jT1bWLy0ny054faS/ri
         De6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858907; x=1716463707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcXsJFjS9m5+2bzRAoHvtJjIOqkMU5GtwndPgJCwhX4=;
        b=sDL+yKVUjDM3B7lT67vZ+VRnEft3kyH0pi/oRYMmycWiNu90u0Bez9dNOb3lOcCDcW
         h/neoZZZyfwM33wLWvB1RhEBr8Rf08AHE/5h1bisVAC47u3l/ovpMciznwL06KWfd3O3
         uW5DQg8LTdPLMjT++k/+QMkygmGPpZ6wpjwpBpKw0JrSJPL4Iith2NwcAIWOBCQ6C+PW
         PhRSl0ZomRpa+UA0BfQEWsWa8R1Hg2ePBjB05LkoqClqzgK9DQ+2N8u2E9Qllp01J1lr
         PNT1K8PABlh+xlimYk//rf2SW8ue4tBcTs744Rx52cJkdojt70wLf+TQA+wcVe6oO3Fk
         Y7Eg==
X-Gm-Message-State: AOJu0YwrMYVFIf2nXJhDuEomBNfNGHCMXS4eEkwCycAc6IzwCc/Mlyse
	LA2UqrZQzqv4Uw2CKrhcfMbwa9+5xTZVAEsxUcr6thjE1/OWB0AapbDDUg==
X-Google-Smtp-Source: AGHT+IEDNx0Eao0z1ZBy+RPyD3phVLCE34VncoyEhxg5SSGon5U7YHDOnSbpDqNvuzkTzzEeJEbSSw==
X-Received: by 2002:a50:8d4e:0:b0:571:bed1:3a27 with SMTP id 4fb4d7f45d1cf-5734d6f2d33mr13268941a12.38.1715858905672;
        Thu, 16 May 2024 04:28:25 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v3 5/6] tools/libxl: Activate the altp2m_count feature
Date: Thu, 16 May 2024 11:28:12 +0000
Message-Id: <d478dbe742f9b8abd9d2e843a9c7b2a8a156157f.1715858136.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715858136.git.w1benny@gmail.com>
References: <cover.1715858136.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/libs/light/libxl_create.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 236b8c1965..f5eb16d0dc 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -657,6 +657,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .nr_altp2m = b_info->altp2m_count,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
--
2.34.1


