Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEFEA6A9A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922520.1326449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHho-0001Eu-VH; Thu, 20 Mar 2025 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922520.1326449; Thu, 20 Mar 2025 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHho-0001BZ-Qj; Thu, 20 Mar 2025 15:21:12 +0000
Received: by outflank-mailman (input) for mailman id 922520;
 Thu, 20 Mar 2025 15:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvHhn-0000Nz-DC
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:21:11 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f425247a-059e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:21:10 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5c9662131so1377960a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:21:10 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3dd25105csm100781566b.168.2025.03.20.08.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:21:09 -0700 (PDT)
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
X-Inumbo-ID: f425247a-059e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484070; x=1743088870; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W13Eu/suZTu92BTXvCV4kWp1HlyXFt94bf9zYXo3zgc=;
        b=jE/ljVnA3nN8juACa25gjNqK8FCowa4pe3xgQuJYQE7KakdvPNAQggcTlcZO5zJR+D
         KoEIZc3/2Fr6TdsABR84PqBEATg0FjEbewZxQUHCURFfauCRG05V9V98xxLQ295e+sgx
         rzjCzHxP1xHyuy8nKe7qMEOdOc1/DNF/JbEe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484070; x=1743088870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W13Eu/suZTu92BTXvCV4kWp1HlyXFt94bf9zYXo3zgc=;
        b=nOm7iVWYJpmumxe/mnQknTGtAFTyzh5RC56AHp4PQhEx6/2VaFb+GdrnZhWi5X/aYj
         JENRC0lYHudevU3vVBBbJm4LoCSPf4cXwpNUAlFK5XEnmwHtvLhIICmuAyHxUO4DwAkI
         HKTcN3cpyZmFKd460XmHJJAeXU/Hsc48W3qHIna99oLV0hglnxrjQlrJE+nb+Y4nC1ez
         aYQDUh6IU1Joo/jYa/0USzvX+AaAbF1cuiiQFXwnbfO1+TL/JADArWIyDd+ICr7VUAjC
         c/0IOuZLGkq/4wf+kxMlGfaczkxul+C5roBGinNq0NOw3Pj2aA2BIgeVqPt9AEldleYr
         nOOg==
X-Gm-Message-State: AOJu0YwAP0mmL7ehQJzyxGJ5Olg1bFs9syDo7PT48a4d9fzGrM/HUDI2
	t+gM3ZM6bYIMo+NZPyI47CLFyT/TDaqoLoWfV2YQWi8M1eeN3AabPsRLn0zaO6oSXUFzP5IMAYF
	2
X-Gm-Gg: ASbGnctaZphQ50nItmykzQwh6zRYad+1hKUlfxV9AyKyqCWJV7FkFy+2SAs6OPcTq/F
	pDyd7IKOoI7ZmZMh1zBMMac+l9EWUT9SzuoHJjN/qmBMeR4RGkw2XYIH822iqnIBX6BEuDJRyN+
	O5SwNhIUv8fYSBHlWW5p4uhUu4tT/vFd7cIyOpyQxRQtuTxsaxo7ccnPrned3OmJHun8JH+woFi
	9/RIuXsZY2FSsQy34kCMOo4t8TLjPQT05iw6qhg56RohX56WlGdv3F0PduQffUeJI7rY5MljP76
	YSyuDFxKTRq7H1DTsKSrqu1TJePRduNFPKNST9oq/+OxNaS7TA==
X-Google-Smtp-Source: AGHT+IGAWyxXHu6ApYE8Nf2Bh84J5CmQhruf0h1VrE+KueULJp/0Jbe9YNfMAT8zbmJLlufLuvpiEQ==
X-Received: by 2002:a17:907:7e5d:b0:ac3:8d36:ead3 with SMTP id a640c23a62f3a-ac3cdf8cac7mr481587866b.12.1742484069971;
        Thu, 20 Mar 2025 08:21:09 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/4] automation/cirrus-ci: store XTF and Xen build artifacts
Date: Thu, 20 Mar 2025 16:20:19 +0100
Message-ID: <20250320152020.88526-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320152020.88526-1-roger.pau@citrix.com>
References: <20250320152020.88526-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for adding some smoke tests that will consume those outputs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 .cirrus.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index a6e4a5d0308b..38b654f75cf2 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -61,6 +61,14 @@ task:
   build_script:
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
+  xen_artifacts:
+    path: xen/xen
+    type: application/octet-stream
+
+  debug_artifacts:
+    path: xen/xen-syms
+    type: application/octet-stream
+
 task:
   name: 'FreeBSD: randconfig build'
 
@@ -106,3 +114,7 @@ task:
     - cc --version
     - git rev-parse HEAD
     - gmake -j`sysctl -n hw.ncpu` LLVM=y
+
+  xtf_artifacts:
+    path: xtf/tests/selftest/test-*-selftest
+    type: application/octet-stream
-- 
2.48.1


