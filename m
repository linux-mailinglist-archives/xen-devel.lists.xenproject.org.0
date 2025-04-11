Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E17A85A8C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947029.1344762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1c-00008K-M2; Fri, 11 Apr 2025 10:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947029.1344762; Fri, 11 Apr 2025 10:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1c-00006T-I9; Fri, 11 Apr 2025 10:54:20 +0000
Received: by outflank-mailman (input) for mailman id 947029;
 Fri, 11 Apr 2025 10:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3C1b-00006D-GV
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:54:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 514be73f-16c3-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 12:54:18 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so1006707f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:54:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae96400dsm1703607f8f.11.2025.04.11.03.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:54:17 -0700 (PDT)
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
X-Inumbo-ID: 514be73f-16c3-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368858; x=1744973658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFYE7oR89OgS7wmrEALx0NVD7P/DNddXsGfdMj0wDnU=;
        b=WNrf1M6VYPx3Mq35se1kHKk9VcsejfCnHjWFMngTcW3f340e2W5LhaFEe1DXWfZ6so
         j6tze8v1/dcvU4NDh5HJiZpYTHq9EGQfIKOWuBzGKWG20/+LD+JnJjD3A6jJtk3rWh+k
         kD9o9VfOPeiEhgSxD6m/auCJl6BJSEYFeZ0Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368858; x=1744973658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFYE7oR89OgS7wmrEALx0NVD7P/DNddXsGfdMj0wDnU=;
        b=KISY898xJ3ikBapO8rCs8mzuuU8dUUT/u61U30bsjEBhCXdL5wsY4s826D+oRjZbzb
         JJ3uX+6tRGovmuQ0jt+LFr1IwgZc5HIA02Woj8ziZJ5z7KJbUvoFPMxUIh2gVdkIyhdX
         gjFB6lCdjXjkSZ5k8+FrR7IJp/95dOoL5fk/YjcSlpXHxo5kgdm4zk57tc9sb36bueOS
         7BwJOUrRMsss3njtEX3GSvIeYHrbZ1xe/nBiDnyyjzXsM5shqG2QvIH2JN2ZOLaUVtv6
         UZqiMs6/7ZHGFUOo0YzJ5xTlrYPGZU56zq+YlsWj5eb9ljKaDECWMx+yO+vd6KTD0KIX
         opSw==
X-Gm-Message-State: AOJu0YzAoEHIlZkfuI/XlH1VV9XO/s1YXi7Avh1ss8RgesbF1vAOwQSH
	iRBRaZkJzJmLy5+ceDwVWss3aeRsM/b3OcZ1mNI3EX+d3X/n1GQGi4NvQvYw83SiI4E51zH6Fbv
	J
X-Gm-Gg: ASbGnct0A2e2za4jWbbNDvwu+kTm23Ks9MzWqezPZ470Iqj9kEYJUztrF0SpRLcBwic
	0vfytTTvorBueZiUaX6KzuCNU8WtWeTl+qDBiDkBc8JmSLqs7AADiHAnkAgiio0Nj7uU3Xmr1AC
	eC66IdtRpYyXdkdltaEgXULHgdWwDQ+RfuBAgcWvE1kFmByyrREIdXAMCZwl/yrubm3jSuHt4ZU
	CHQoal44JkMoC6NVt4HLsnM12TkolbPObi4hHnwJWupvRdp9hs3BK/Vv8ab+Q4AlUi+XX49MsXO
	fS/Mvf9UKXSDz8fiDuqlI8glptAkzLAOYOm7jLOIfYsRmA==
X-Google-Smtp-Source: AGHT+IG+0aHMf+gcjUPaF3A4Cr5jBdZdfnpiBWKiLTs/5HHicDRzCTmTEN6MoKG/Nvzcy95ESVaR1g==
X-Received: by 2002:a5d:588a:0:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39ea51ee9c3mr1885396f8f.1.1744368857883;
        Fri, 11 Apr 2025 03:54:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/5] x86/mm: account for the offset when performing subpage r/o MMIO access
Date: Fri, 11 Apr 2025 12:54:07 +0200
Message-ID: <20250411105411.22334-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105411.22334-1-roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic in subpage_mmio_write_emulate() doesn't take into account
the page offset, and always performs the writes at offset 0 (start of the
page).

Fix this by accounting for the offset before performing the write.

Fixes: 8847d6e23f97 ('x86/mm: add API for marking only part of a MMIO page read only')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4fecd37aeca0..1cf236516789 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5131,6 +5131,7 @@ static void subpage_mmio_write_emulate(
         return;
     }
 
+    addr += offset;
     switch ( len )
     {
     case 1:
-- 
2.48.1


