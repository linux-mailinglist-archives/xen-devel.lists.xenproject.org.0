Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43858BFBEF
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 13:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718734.1121225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRs-0004dY-1l; Wed, 08 May 2024 11:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718734.1121225; Wed, 08 May 2024 11:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRr-0004aP-Ug; Wed, 08 May 2024 11:26:59 +0000
Received: by outflank-mailman (input) for mailman id 718734;
 Wed, 08 May 2024 11:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0je0=ML=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4fRq-0004Lt-4U
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 11:26:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e14a2c93-0d2d-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 13:26:57 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-573137ba8d7so1323641a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 04:26:57 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ds9-20020a0564021cc900b005705bfeeb27sm7483983edb.66.2024.05.08.04.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 04:26:56 -0700 (PDT)
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
X-Inumbo-ID: e14a2c93-0d2d-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715167617; x=1715772417; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3tygfqqTA1tpknR6/VpOTguLDppE0Q8yESUk/lbUEQ=;
        b=PeDhNHJc/G5PctJ0aQSeKah54LSD8i9qXqHBBRbbKldzm94S4iqdOR1ZiEOA7w6nNM
         K8evlx9UWTCCTzg/M9DMl2vW8HHhY+0Y4tTwk/jWlYhOakUVBzfmTXWHZSGDSIO6wxxi
         AlA5N1yW7/+ncFrIFlt1csNdBNbJRZZxAVZSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167617; x=1715772417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3tygfqqTA1tpknR6/VpOTguLDppE0Q8yESUk/lbUEQ=;
        b=im1uBoAIkxQZpcJ/pnTy1hwPZINb98kkJmMlHSJKCynqkffVzEmflO41s/swAJb25b
         YxQPmOthc1B2Za8gbiYUE7cfFY3D6V+x7q3f9mQc2BfLs+77toQlbvawR6++4hivCick
         +rTVDJNq/kRQ5BQtqlh9HPjb1m+Bx/nvyGGciPbJE1WQYjG4XEWGXMDJYODQAJr8d7bd
         JPjz0MOtsYAc3KEHiS8Xt3nCcXYPpljMZQEjIfOhuoT5VHp8rHnH3rec+FzsNmd88ML2
         vDHQ+wepZiycaHzAycurTe0vw1m2Zf42Uz8nMBLRjg+wnQBo1a+50XJcmVSh1UUJxtV9
         GDrw==
X-Gm-Message-State: AOJu0YyGfKt9uJQzO9+BK1eLK1OTHDYgzQtivGEKOciQ3y+ldenHXdLT
	qb+xGecrMHBbyBqFi7PMY/ojC9GFDhkl57Kqw1BkH8bWQf4iwPwJlxGV7/PgcjPdOUBhw1A7eus
	8
X-Google-Smtp-Source: AGHT+IH/1U2J21bD3IY1H/G66eCkgtvsFEgF8vyRrrhwjx+EZKl3CjCkyvOuUWbjDz7v0WRnQtmQjw==
X-Received: by 2002:a05:6402:7d0:b0:572:e81d:6e70 with SMTP id 4fb4d7f45d1cf-57311084911mr4703148a12.15.1715167616786;
        Wed, 08 May 2024 04:26:56 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 v2 1/3] xen/x86: account number of foreign mappings in the p2m
Date: Wed,  8 May 2024 13:23:21 +0200
Message-ID: <20240508112323.38946-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508112323.38946-1-roger.pau@citrix.com>
References: <20240508112323.38946-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Such information will be needed in order to remove foreign mappings during
teardown for HVM guests.

Right now the introduced counter is not consumed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
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


