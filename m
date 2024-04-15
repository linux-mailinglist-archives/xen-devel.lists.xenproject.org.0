Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF008A56AE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 17:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706351.1103473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU5-0000wA-UP; Mon, 15 Apr 2024 15:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706351.1103473; Mon, 15 Apr 2024 15:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU5-0000t0-Qz; Mon, 15 Apr 2024 15:43:05 +0000
Received: by outflank-mailman (input) for mailman id 706351;
 Mon, 15 Apr 2024 15:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwOU2-0000NU-H7
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 15:43:02 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d766b22e-fb3e-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 17:43:01 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso385856466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 08:43:01 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b00a526457fc84sm1987261ejc.57.2024.04.15.08.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 08:43:00 -0700 (PDT)
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
X-Inumbo-ID: d766b22e-fb3e-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713195781; x=1713800581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BacL8QB7ZWP7TY5BHnn9lSxgM8xcnJnilaGER3YBeY=;
        b=S5pW7g21FrdgTExQ0+kWvzsRwbYAnKuAQA7lI3Pk6jp6U2821A7cmHW+Sqe/PZTLyt
         j9bjJekwvFVAbBw2UB0R/Pp74+zrKx40BdWtsgxpBQKVQ+EeW28VTkW7MtzQfOnMH7p2
         xRxUas7mkBeKy1ePuu+J8CMPVSBbEzdfgsmhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713195781; x=1713800581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BacL8QB7ZWP7TY5BHnn9lSxgM8xcnJnilaGER3YBeY=;
        b=ocmupnFAUKK7Iqr8WfeY3KET0xkodkq7GqczS5cf1X9rcAoIatUYCLcxRdVW1/SmJE
         CI5XbJF4Dw7Y/WrRW+EBskIGH0ULhfEzWoMsJmbvQqGGr6cHdmiBhazadEz6yPes8KEV
         Ecp0rXh4T0YjtrYBogXmHq9cl04Q5Pmd8Jc2lHodOAfoRz1iJzXTrA90+rqUGDtVPFEL
         8MOlJ5mEGKHLW1Pg5xC4S+hake/895DCyND1em4nhYLC0sDKRVn0KyLSXg4w4udHfBu6
         Q/WtN/F3xMwPHFJShsIyX/H6gV+5hyTfBsCzWL9dEhnvWFO8p/ZD6dcbwESqdwbPqMne
         wATg==
X-Gm-Message-State: AOJu0YyU2H0onVinGJU8QiwMWNxf3u9F+y37WFxW9NboSQRSkT7+QTdd
	FLJHkIArPniiuQ71Iaj7ki+ulCg9r+Sydm2LH188HnaXqyErwVFtjIyskzk3lYnyRLHVdeYFbVp
	u0ko=
X-Google-Smtp-Source: AGHT+IHPz7GVUB+XTlypiLu1c10rF57FJ4U4D8ixvfZxpXBt7kQI+18aXvdN+HDsFCKk62mq/iTuYA==
X-Received: by 2002:a17:906:254c:b0:a51:a06e:afd1 with SMTP id j12-20020a170906254c00b00a51a06eafd1mr6141580ejb.23.1713195781048;
        Mon, 15 Apr 2024 08:43:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 3/4] xen/gnttab: Perform compat/native gnttab_query_size check
Date: Mon, 15 Apr 2024 16:41:54 +0100
Message-Id: <20240415154155.2718064-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This subop appears to have been missed from the compat checks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/compat/grant_table.c | 4 ++++
 xen/include/xlat.lst            | 1 +
 2 files changed, 5 insertions(+)

diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index af98eade17c9..8a754055576b 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -30,6 +30,10 @@ CHECK_gnttab_unmap_grant_ref;
 CHECK_gnttab_unmap_and_replace;
 #undef xen_gnttab_unmap_and_replace
 
+#define xen_gnttab_query_size gnttab_query_size
+CHECK_gnttab_query_size;
+#undef xen_gnttab_query_size
+
 DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
 DEFINE_XEN_GUEST_HANDLE(gnttab_copy_compat_t);
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index b3befd9cc113..53a1bdfc533f 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -88,6 +88,7 @@
 !	gnttab_get_status_frames	grant_table.h
 ?	gnttab_get_version		grant_table.h
 ?	gnttab_map_grant_ref		grant_table.h
+?	gnttab_query_size		grant_table.h
 ?	gnttab_set_version		grant_table.h
 !	gnttab_setup_table		grant_table.h
 ?	gnttab_swap_grant_ref		grant_table.h
-- 
2.30.2


