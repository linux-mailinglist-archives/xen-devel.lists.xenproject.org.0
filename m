Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F88C8745
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724136.1129308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xjO-0003mv-FD; Fri, 17 May 2024 13:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724136.1129308; Fri, 17 May 2024 13:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xjO-0003lM-8M; Fri, 17 May 2024 13:34:42 +0000
Received: by outflank-mailman (input) for mailman id 724136;
 Fri, 17 May 2024 13:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJM7=MU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7xjM-0003lB-8J
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:34:40 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3573f61c-1452-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:34:39 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4202c1d19d5so984825e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:34:39 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe1ab43casm161950035e9.1.2024.05.17.06.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:34:37 -0700 (PDT)
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
X-Inumbo-ID: 3573f61c-1452-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715952878; x=1716557678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQiIH5EjccvKwupxVBx+YRsXJvqYn8GGNADJa6shblg=;
        b=lofsjYPFERb+66MY2PR+RTMnlLPxp2C5u0MbyuE26nv+4fMqbd0YBqrzB3FplcJEyS
         Fo4koxDS41uXPJLhzeLYfwI/rw7k+WuIhZoXDpIR6+YULfdSj07KVy50GPMgKlpS6aQO
         //2i/cOj8ciYfHYZ/XKKqMbZolM7s9rwzTCGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715952878; x=1716557678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQiIH5EjccvKwupxVBx+YRsXJvqYn8GGNADJa6shblg=;
        b=liVH9LxJCP+jBs2qijWzHv6lNrs9P5hhA0Xo6LStdwU/2yzUAvT/uyBU17mcZ+h8ee
         240i/61W6IpwmLa4wwik0hAEbo4pbOXv7eq8kbu/cj/hbKZKJ+M/x3KXuCmYTBPA+IvC
         01nizkGAP3J920x8Tg9LAVFl05Y04iba9djQsCBs0QzuLnCRFelLGI9AESHRj4qTTiwT
         eL58v94GWZ/Ht56c1s8UmK/cdEdf+O/yclBPGy3k22MNXH3lkHwFqwlILekabVnOzsu8
         cRiM9/s1eruxopGmC7Qs1aKkp/WXb3JlmqFrph+Lj9/RbarqZED6OLKPG7TVYqzxOohn
         lE0w==
X-Gm-Message-State: AOJu0YxsyYmzEWYTUebKY4tfvEdClMdUh5ptX2nehEPAHbsakIqQwhmh
	qqJSpGhUIJthY88XEnWa+C7hgfWlDapPhWI4FqmeNmCIBMHswY+Xdd8eVIMq0BqtkxLC7AdpznZ
	U
X-Google-Smtp-Source: AGHT+IG18ojI2l0jkzFxiCmjvzTqfP3VYfHPw8NO8LsBvdHo2eufXLp2SSvdtlyWOBfeoKxbhjjJYQ==
X-Received: by 2002:a05:600c:45cb:b0:41a:3b7e:2235 with SMTP id 5b1f17b1804b1-41fea9318cbmr203511785e9.5.1715952878102;
        Fri, 17 May 2024 06:34:38 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 v3 1/3] xen/x86: account number of foreign mappings in the p2m
Date: Fri, 17 May 2024 15:33:50 +0200
Message-ID: <20240517133352.94347-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517133352.94347-1-roger.pau@citrix.com>
References: <20240517133352.94347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Such information will be needed in order to remove foreign mappings during
teardown for HVM guests.

Right now the introduced counter is not consumed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Drop max_gfn accounting.
---
 xen/arch/x86/include/asm/p2m.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 111badf89a6e..107b9f260848 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -380,6 +380,9 @@ struct p2m_domain {
         unsigned int flags;
         unsigned long entry_count;
     } ioreq;
+
+    /* Number of foreign mappings. */
+    unsigned long      nr_foreign;
 #endif /* CONFIG_HVM */
 };
 
@@ -1049,6 +1052,8 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
         if ( !page_get_owner_and_reference(mfn_to_page(nfn)) )
             return -EBUSY;
 
+        p2m->nr_foreign++;
+
         break;
 
     default:
@@ -1069,6 +1074,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
             return -EINVAL;
         }
         put_page(mfn_to_page(ofn));
+        p2m->nr_foreign--;
         break;
 
     default:
-- 
2.44.0


