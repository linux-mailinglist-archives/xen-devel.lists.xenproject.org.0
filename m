Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310328B3143
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 09:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712484.1113219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Fu5-0006Ah-T2; Fri, 26 Apr 2024 07:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712484.1113219; Fri, 26 Apr 2024 07:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Fu5-000690-Pl; Fri, 26 Apr 2024 07:21:53 +0000
Received: by outflank-mailman (input) for mailman id 712484;
 Fri, 26 Apr 2024 07:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Svmy=L7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s0Fu4-00068u-RM
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 07:21:52 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6134c55-039d-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 09:21:50 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-78f04581a66so112390285a.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 00:21:50 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 c16-20020a05620a201000b0078ede411c92sm7702902qka.27.2024.04.26.00.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 00:21:48 -0700 (PDT)
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
X-Inumbo-ID: a6134c55-039d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714116109; x=1714720909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j14dfvYZvjCdt7gs1P2gIvnQbYZ2Cot6fyVm3A+/tOU=;
        b=wG+FlDXTBOb4M1rKpgubygxxEri3iqaMcmWEvIS48SjZad9jki3h7gRE2da6GDvjDp
         EuE+pWacVeVe9tdkRLpnn1LEIvROiDtuRtNI2Th4PdGm0g5Oif6YmmC8AA5e3dndfOiV
         BEVUZBPQ+fs65Lz0U9MG63UyFNGAmCUqIq2Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714116109; x=1714720909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j14dfvYZvjCdt7gs1P2gIvnQbYZ2Cot6fyVm3A+/tOU=;
        b=TGh+70U4PYAaOmQ+PFeHgZTfQIQ1sD+3pg5T7fDAQ4JdezTtRhhWuFQqIaNwJajpf6
         aA6CIdonvIkvywQVYPzV1+cYO/OaJUH8h6kRLeDSsFB5MXrtHsT6k1qYvosdEpWzpImJ
         TpuB76jGoud2hkRAim3TFLgp6hT0a9UoXzNqNvpCcvgoe0/H70L3VDjcW6n8f9eJj8cs
         agvMV8d6DOQMnCIajNHv3KOHKAnu0hw9nddx8adECn5AjAkfBvG5/YRV5G2cnRx+ZRtU
         bdCOc1sH3lt4m3HDnFKh6tqgBPQTov8EijBo6fAO/ZbpxXZ14U1rQu0SLcmyazCuNOoR
         9JlA==
X-Gm-Message-State: AOJu0YxvX4EKogjbK6CJHsA5orJDw3nVjjNepfscSAOWijqW9yIf00Di
	qeVCdXrtOEbR2Afbz4244Lk4fZmphC0K7MwN6e94C+kW2iPP73itfOIcv9b76Uq/EZ3Ni9f+r4P
	w
X-Google-Smtp-Source: AGHT+IEplsnCxLrtfOwGU2zMO6qC9tsY39Xf1LsNHp+KUi3VAS28wEFyUAG4Wxf5den2ZKX24/+zrQ==
X-Received: by 2002:a05:620a:469e:b0:78e:dc0d:9e70 with SMTP id bq30-20020a05620a469e00b0078edc0d9e70mr2496491qkb.45.1714116108969;
        Fri, 26 Apr 2024 00:21:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen-livepatch: fix --force option comparison
Date: Fri, 26 Apr 2024 09:21:44 +0200
Message-ID: <20240426072144.48828-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The check for --force option shouldn't be against 0.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 62a72092a517 ('livepatch: introduce --force option')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/misc/xen-livepatch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index c16fb6862d6c..f406ea1373ae 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -576,7 +576,7 @@ int main(int argc, char *argv[])
         return 0;
     }
 
-    if ( strcmp("--force", argv[1]) )
+    if ( !strcmp("--force", argv[1]) )
     {
         if ( argc <= 2 )
         {
-- 
2.44.0


