Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43926A64E65
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916681.1321742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9OZ-0001Z2-BU; Mon, 17 Mar 2025 12:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916681.1321742; Mon, 17 Mar 2025 12:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9OZ-0001XI-7k; Mon, 17 Mar 2025 12:16:39 +0000
Received: by outflank-mailman (input) for mailman id 916681;
 Mon, 17 Mar 2025 12:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9OX-0000kV-Ql
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:16:37 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac096b58-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:16:37 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22359001f1aso29200095ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-737115292e7sm7462998b3a.31.2025.03.17.05.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:16:34 -0700 (PDT)
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
X-Inumbo-ID: ac096b58-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213795; x=1742818595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqruY2zqiKwVWXNzUWsXUStihAIHimWujQ8x4YzmKqo=;
        b=NPK78TWh6BJN/rw6HwNtd/t8AXPXfkcY7enDU8yMNKIkOROKSFnjbLN0qdm0DsN5Q7
         JVToGG1by9OuMIiY7zNeL9fHJwPpDUcmbV+uN1MuSZ+on2Ltuo53ADjmzmBnXVuD3tpZ
         QPXlZKAR6tly8gyqXbW1xqa4Yr1IPzAK7jwKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213795; x=1742818595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqruY2zqiKwVWXNzUWsXUStihAIHimWujQ8x4YzmKqo=;
        b=tcy8uuYaAb1Eq/9bUF8qWVi9bBA/L5trveZG2lLcDwLrggrZXNFGJFoOVUujZ9djSO
         NJSKr1YjDuKD6ODgSVKvrTqsltYVA12okJusi3Qaj+EezIQc3alj9U76xm9Pcyt2g28O
         xJek5iZqZnakZ/VVUvPTv6obOWnBG8pBdeEWQEmDi66/u1HoRIfbCQYH04nr9dRe86cs
         VaZaRWYYT8K+LvV9xu0/Lb26CYTbURhuS8zrsEEeL/hF0A7DmraVaUJVHwUPGrsfGkEs
         860RCCAkjVyd7fO4llV+O/0TSvhFZR/g2H+9lrwDqDon7wEjkW+DDNLpJyn9uV/KX1QT
         BRZQ==
X-Gm-Message-State: AOJu0YwCOnE0FMPatuUbuBnzQLdKP+xyp4RvQsZxNzmAIKJLz85uHyZP
	755zE4EwZKihMp4cIdD58tQXvcYCs2rMe6Tf52EGIYt7Ha1QmGQZgeOwk/CPnYqXqNxEwTluSox
	j
X-Gm-Gg: ASbGncvUyIBgE/mIeq1TsZxSI2cix3+zEPuFGaRAfLxbYl1N5YjFijb4dEUso7HmoUP
	RQuVc5iZrUdc6KYCKMqoRgRnowbvGZDjhrWVhpcnVI3Tf/piufUtz+vcXC3I2DopHQhklwjz8mi
	SOPhMdly5XL7NDwZnjRiXEj1JDznQQX3uDPhqoUluYg4RgE2JGZaGMSi8v3CoxL4VqQpKFtFntE
	oaIgNyH48RVPlOm/ABrnZ49x+9V5PI8pqwgk1gbzlPEwE7qmzq7Y4MKEHS7h+6VAEfXKz7O5958
	sx4tQGzKRS9qp1lorGEIoaBw17nCC7fT3pDcOvsPDQtF4pKTcyA5mq8=
X-Google-Smtp-Source: AGHT+IHpbVNizWoefPAPCwT+bPjXcyMkHyJdRbxXD5NzD7goGx3fymiwXC8AgwUD2y0IMHmbXD8uvg==
X-Received: by 2002:a05:6a00:2382:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-7372233ae33mr13295030b3a.9.1742213795305;
        Mon, 17 Mar 2025 05:16:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/8] automation/cirrus-ci: add timestamps
Date: Mon, 17 Mar 2025 13:16:09 +0100
Message-ID: <20250317121616.40687-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Such timestamps can still be disabled from the Web UI using a tick box.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 1a39f5026f9a..aa195ba370ac 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -14,6 +14,7 @@ freebsd_template: &FREEBSD_ENV
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
     CIRRUS_CLONE_DEPTH: 1
+    CIRRUS_LOG_TIMESTAMP: true
 
 freebsd_artifacts: &FREEBSD_ARTIFACTS
   always:
-- 
2.48.1


