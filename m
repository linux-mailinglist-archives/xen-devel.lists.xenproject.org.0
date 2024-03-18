Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD087EE1F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694945.1084285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHG-0003XG-6q; Mon, 18 Mar 2024 16:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694945.1084285; Mon, 18 Mar 2024 16:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHF-0003PE-Sh; Mon, 18 Mar 2024 16:55:57 +0000
Received: by outflank-mailman (input) for mailman id 694945;
 Mon, 18 Mar 2024 16:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHE-0002gq-9i
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63090c5b-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:55:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-414624a65beso19915e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:55 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:54 -0700 (PDT)
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
X-Inumbo-ID: 63090c5b-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780955; x=1711385755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJd5erfZkWtwSzXglEFDYQHe8C/Kx7YDmuH1rlEbXsI=;
        b=W+3SSKsj25z4mEM2262ebLcKPVVrUDuKL8880DMLcgNqRaBkJUkE20KT2d4jbpQ2ZE
         zGeA7IeFFelyEZ1PBnCQ5YFXzD4q7PGvmqaHXzNe6g57USnYojqsicBleJBjzJq9ZSP1
         CWNhpcrY1NOgT876Jw7j8JArRO0StL2KWFm54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780955; x=1711385755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJd5erfZkWtwSzXglEFDYQHe8C/Kx7YDmuH1rlEbXsI=;
        b=NHnv4F+Lwd7xeD3sWv/cKIPA/xiJAb/kWpDBnI/xhPN9PHkrikd1tjkecAfx5XdYUw
         B0uUBQUERjFjjjzUAAAxK3Ev+Pt+rm0ejqN4fJgnZAHgPKlGkETJgQJmSNsjDJwsxtPS
         DeSrd0pGvs5gqMOVPoqUiYWNAWr0zXlaMpAN3m1FTlCqaQGJhlDomAbFVNhi1LDmuEW+
         UA5ohZ0YmJRtEvIU6rGTNmp2XLfDdOPjPVR6rcxeaGZz/csSY2KfQ8KGedWLTqlgLWtK
         zIIbPMN1hG6r7Tvgr1R1Ojpb5mQEALO8IKIJMuAI0Xtvo8nGYnOYMSq9fJVUXRv36znY
         B8cQ==
X-Gm-Message-State: AOJu0YzwN9D3yvpySyxKy+2e48kWNWrxflfiquSUPyHz/f5sTvFbZEBL
	lVf7g7XP13LldfG+ZVHKM/yjH50R/ekZwXIlf7cTAyn9VJigyhtCJSBR60wnXjbtmuBMwbhDwtA
	P
X-Google-Smtp-Source: AGHT+IEJ2/iL6KmWbo51mROrBbNxnkrtty+8fZDPRUDG1OnLfQQ6qKRZF4wesc3cLJt4vWLpR13A7A==
X-Received: by 2002:a05:600c:458b:b0:413:e523:eed2 with SMTP id r11-20020a05600c458b00b00413e523eed2mr10017053wmo.33.1710780955190;
        Mon, 18 Mar 2024 09:55:55 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 05/36] ts-host-install: fix ntp.conf path on bookworm
Date: Mon, 18 Mar 2024 16:55:14 +0000
Message-Id: <20240318165545.3898-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-host-install | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/ts-host-install b/ts-host-install
index f79a1beb..61433e64 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -151,7 +151,13 @@ END
 
     my $ntpserver = get_target_property($ho, 'NtpServer');
     if ($ntpserver) {
-	target_editfile_root($ho, '/etc/ntp.conf', sub {
+        my $ntpconf_path;
+        if ($ho->{Suite} =~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
+            $ntpconf_path = '/etc/ntp.conf';
+        } else {
+            $ntpconf_path = '/etc/ntpsec/ntp.conf';
+        }
+	target_editfile_root($ho, $ntpconf_path, sub {
 	    my $done= 0;
 	    while (<EI>) {
 		if (m/^server\b|^pool\b\s/) {
-- 
Anthony PERARD


