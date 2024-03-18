Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1FE87EE30
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694960.1084416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHZ-0008Vk-Rg; Mon, 18 Mar 2024 16:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694960.1084416; Mon, 18 Mar 2024 16:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHZ-000818-5t; Mon, 18 Mar 2024 16:56:17 +0000
Received: by outflank-mailman (input) for mailman id 694960;
 Mon, 18 Mar 2024 16:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHU-0002gq-KK
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b5cee19-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:09 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4140fcf4d02so9699765e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:08 -0700 (PDT)
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
X-Inumbo-ID: 6b5cee19-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780969; x=1711385769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x31hu31lN3/8MBLeRtOzuN/pstr4iAsaXj67oA29mMM=;
        b=QDF9rrS+Q0GRBzA0qB4B0FSE4WeWxLtTj0MBCJnB5qYDrLZUlzY9JzM65zelP9rx2A
         FFs5pDNLJDMb94agL2MVK9hSwlDkk71JBfmJ4CnxlJKBGDji62xnrlT3DtwAEadCgD3D
         Tk+/CKrLjZ6PROWw0k/29TT1i9hfG7E3HbP/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780969; x=1711385769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x31hu31lN3/8MBLeRtOzuN/pstr4iAsaXj67oA29mMM=;
        b=uBODwpH66FtDbp5/SVmdfbWE13da51DKK6FcjBBsu14O9Ct2G3UXGvelewGKutKGXb
         WqK5FIIeVB5Ef+VId0rSXq77J3uU5cMlHy7Esey4uj/Ye6/3u9kMsGiVnSwHZJ96/zIe
         4Lr9jihRPrEAsdWD8nJoXl4BPyY7g2bi6sNRgv1S+SnWoviuAItAXDhF52y6qIS8r9pB
         RTOtF9DGbl/tG6cmzfI9c4L1aJvolKbT0L9Nkb/YxcUNSZqUWyy27n4cvf6dECzh9RdM
         6pTz0mkHCfMKYZqp4RETtZqIUOHheamUnk0HgyKaj0c6Kwow8PJm1sM+xClKi4jz5LGO
         3egg==
X-Gm-Message-State: AOJu0YxDwtaM5u3nku6VILtUxz9OE/ewAjcuRsjk9zknIHrfMU3ZGblq
	UMC9AyztQsuq0AU6GmghL5JtO5SHt58+iPlArMDFmifK8XG0mCr1rS2KoonZBrOJRM3UvqJkrOd
	j
X-Google-Smtp-Source: AGHT+IFb+ZRklxoef/nwlHBK96uZAbyl0zIIXrk9peG9eD6AT/xjIMfOYyOunlmza/YB/lsbTucYTw==
X-Received: by 2002:a05:600c:4f92:b0:414:101a:fa67 with SMTP id n18-20020a05600c4f9200b00414101afa67mr20261wmq.18.1710780969153;
        Mon, 18 Mar 2024 09:56:09 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 21/36] ts-xtf-install: Install python symlink
Date: Mon, 18 Mar 2024 16:55:30 +0000
Message-Id: <20240318165545.3898-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ts-xtf-run does run ./xtf-runner, which run `python` in its shebang.
So install a `python` symlink to `python3`.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xtf-install | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ts-xtf-install b/ts-xtf-install
index a64fd329..fea737ff 100755
--- a/ts-xtf-install
+++ b/ts-xtf-install
@@ -28,6 +28,11 @@ $whhost ||= 'host';
 
 our $ho= selecthost($whhost);
 
+sub packages () {
+    if ($ho->{Suite} !~ m/wheezy|jessie|stretch|buster/) {
+        target_install_packages($ho, qw(python-is-python3));
+    }
+}
 sub extract () {
     my %distpath;
 
@@ -35,4 +40,5 @@ sub extract () {
                                $r{xtfbuildjob}, \%distpath);
 }
 
+packages();
 extract();
-- 
Anthony PERARD


