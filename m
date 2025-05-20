Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7746ABE813
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 01:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991240.1375137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWRw-0004ir-N7; Tue, 20 May 2025 23:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991240.1375137; Tue, 20 May 2025 23:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWRw-0004hP-KD; Tue, 20 May 2025 23:32:44 +0000
Received: by outflank-mailman (input) for mailman id 991240;
 Tue, 20 May 2025 23:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iUqS=YE=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uHWRv-0004fT-8p
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 23:32:43 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b917dc22-35d2-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 01:32:41 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so49783495e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 16:32:41 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b297easm50341795e9.6.2025.05.20.16.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 16:32:38 -0700 (PDT)
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
X-Inumbo-ID: b917dc22-35d2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747783960; x=1748388760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aknpjrvPsir/Vt/v4dJDAQUN8C3kR9VROKP2hMJVwTo=;
        b=kl3xmiDoY2qeSjPgXzfieWGy+YWcWVif8kKRKeF+5PQ2ckW6GbGVbqV5wguRNBpu6L
         yf4Tb5DSv+bLcBI6H3MgJUF2p/7u1xy/xAaYEDKHJvEVrUZyvWHxOwjWPVaAF7sn5mJh
         lZgwnAanQkjJZtvcaedDoiv+InYmSnFy/HQWOJT0l6PcGz7odfpBBnVVDEzf1YARhX6l
         gFHfe+Gl+w0eMlVZaXJ5h1wadEGiMwHsupN8Rv59Oyy+IXy/dIvRqdDLhx8ib0NckKu1
         /YYkXmga9cHCV7HkWOt440kHrXHZGC5/Cz61W3/wKNJWMbAkWRhMWLTHu5Yx5Rh53cUm
         BNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747783960; x=1748388760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aknpjrvPsir/Vt/v4dJDAQUN8C3kR9VROKP2hMJVwTo=;
        b=GXfjs2N87KQPDlD5dOxQS2uoWFGeTw+7EWik53aN/GfzpwXEhouPfq3jqLGlFt1e+c
         uwVekPspX8Hrer7gM7d2oncZiIIPOdBAFeLdmIrJv0bDA54CBIUPE0CqVlA2iBJzKWm7
         TxwQKRAroV8vzKz2TABCYYFHUcB5n+uh1/vwisDLDb2KJ5dIYCjvF6z+44tcE4eredBZ
         BRjKC4VeAOMDWsuWGQOHhbMdShIFz3lj2iNnoSaBDsD/atBCoec1reTG1lKHtfMlEwFB
         sqrjyO0WC71AAVYMgcf8eWoYJsl9BC0BX1ZYOFFqZlq5/igh8aR5QhJ9htfpF5CJ0Jf/
         1AzQ==
X-Gm-Message-State: AOJu0YyZm8uH9k0SZwiRQONyGb66f7RIAeD+lQMYDNqj9RLSiCRb3/mv
	ETEAh0kUq2gegF76I8lGu6kZuwS2nH6DIz0y3FcZCLd8yF4AKXpQkuv1lfN/AA==
X-Gm-Gg: ASbGncvg2ZwQsCqEIBW7HGS2bipf0f0tIb92tuvnt50xpnsYzMZexDFMFvlWWmzTZhW
	FKRjMzodPpV9B6/wYGYriboltnzM4CB2zBxVeFpFSJzdnNH0Zq7KsWa0dLg1xiht27yr5fMqHgk
	WDwDMXqu4bKc8TDv/6c0e9TyusRpSvR6U7jfWRta4UNrP5AlbXqCrXD8fRPAYNZ3bkGH3kJ0sgL
	LAULnkzDTcolS7ps2MZVUv2SSlSH9y27UU6yDZytI6nA/ucTYypN8MD7A8f85r58mgH4XKdfipW
	HAwO5sVgK4F2rFIiesOLncsOb27I+v61AZQos592wmWk/Db8KBAL1bZa14mDXxghcxWtfyiy63T
	tQ/JzEVrcrA==
X-Google-Smtp-Source: AGHT+IEMQ4NwdqfF9MurWZhs1a8hiz5P6QQdKVqbcyYKA345zM1sIB/fETk6TVfj13tL21HE6kEKZg==
X-Received: by 2002:a05:600c:4592:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-442fd6649d0mr139970645e9.22.1747783959758;
        Tue, 20 May 2025 16:32:39 -0700 (PDT)
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
Subject: [PATCH 2/2] MAINTAINERS: add Daniel P. Smith as an Argo maintainer
Date: Wed, 21 May 2025 00:32:20 +0100
Message-Id: <20250520233220.868258-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250520233220.868258-1-christopher.w.clark@gmail.com>
References: <20250520233220.868258-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Daniel is a longstanding contributor to the OpenXT Project where Argo
was developed and is in active use with Xen, and to Argo itself,
involved with the design and development of Argo software.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7198363c5..c2e4f8528f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -222,6 +222,7 @@ F:	tools/libacpi/
 
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Maintained
 F:	xen/include/public/argo.h
 F:	xen/include/xen/argo.h
-- 
2.25.1


