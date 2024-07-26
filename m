Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBD93D629
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765521.1176208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvA-0002nb-MN; Fri, 26 Jul 2024 15:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765521.1176208; Fri, 26 Jul 2024 15:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvA-0002lw-H1; Fri, 26 Jul 2024 15:31:52 +0000
Received: by outflank-mailman (input) for mailman id 765521;
 Fri, 26 Jul 2024 15:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMv8-00084Z-Fm
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:50 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ce49961-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:50 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6b797234b09so6976056d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:50 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3faf858csm17507206d6.128.2024.07.26.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:48 -0700 (PDT)
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
X-Inumbo-ID: 2ce49961-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007908; x=1722612708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufe7axpF1ypMkRxpc+P1Xp8b7quSOOvHVvX3frr6ICk=;
        b=TyDYpBwrBC9nFO9DFal52naltESj2OEJ01croPBXbqBGwzv6BArT7pdZLC0CQfTGbk
         IQKxa+F875U+FsrEZj6i/RasPvv6o1h2c2IcePYcGPvEOxfbpJAGh2abLDAG4NpCe78c
         acyPsY5pk5m4EApMMw6ceyVlKDVsF8mw3EP7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007908; x=1722612708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufe7axpF1ypMkRxpc+P1Xp8b7quSOOvHVvX3frr6ICk=;
        b=FXydynoG708w1rGsnX+hsXcUGyLAHsDOixxlJ7eszVjOLja411xqRH73tU/dCZwdyr
         R3yFn5UV5Ag9/okreSigPalTheT9WxFOmkpNMETO4zKKFplVF01XLJmayxnYjcRmAUhK
         GeYJZFghNfkt9PTiPtFlRn+PdqMZvTIu5NeBq7L9WJDRScJl53SDUPcB5Ap9w/YQSIX7
         QXR761ACaqoQcQ6Yx4Av7NVhSxFcmdcHNU6L2pdvI68vC77k8u2M7NQHaIhPEmghylPz
         Tr/EEHVIkfG9QrMe0gT9qjKTKxfKY0ucTXC5dJ0jd5GuJR6kl44dvTcsDxDiCQ49XSn9
         T60A==
X-Gm-Message-State: AOJu0YwXN8H++EsmMI3rugLUn+sB/KwKkL8ZejNR5aHOS9+JPIMdkSI4
	kktJrtIPXsE8ezRkwpRdj03n04KJ3r7vTSsRt0uXHohUlPyg5DXI+a+Jn2DVG3hBRcXMnMDWEgY
	D
X-Google-Smtp-Source: AGHT+IHc7fZj2qbt+CZssxa2I5bm4GBAKmtWk5QMumzkfy0VWkMpko7m2q+uj3dIHAa/OM3tGAsQnQ==
X-Received: by 2002:a05:6214:1785:b0:6b7:9a53:70e9 with SMTP id 6a1803df08f44-6b99154d6d4mr154646366d6.17.1722007908375;
        Fri, 26 Jul 2024 08:31:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 10/22] x86/mm: move FLUSH_ROOT_PGTBL handling before TLB flush
Date: Fri, 26 Jul 2024 17:21:54 +0200
Message-ID: <20240726152206.28411-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the handling of FLUSH_ROOT_PGTBL in flush_area_local() ahead of the logic
that does the TLB flushing, in preparation for further changes requiring the
TLB flush to be strictly done after having handled FLUSH_ROOT_PGTBL.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/flushtlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 18748b2bc805..fd5ed16ffb57 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -191,6 +191,9 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
 {
     unsigned int order = (flags - 1) & FLUSH_ORDER_MASK;
 
+    if ( flags & FLUSH_ROOT_PGTBL )
+        get_cpu_info()->root_pgt_changed = true;
+
     if ( flags & (FLUSH_TLB|FLUSH_TLB_GLOBAL) )
     {
         if ( order == 0 )
@@ -254,9 +257,6 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
         }
     }
 
-    if ( flags & FLUSH_ROOT_PGTBL )
-        get_cpu_info()->root_pgt_changed = true;
-
     return flags;
 }
 
-- 
2.45.2


