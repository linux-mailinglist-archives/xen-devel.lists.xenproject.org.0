Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3979D1E04FA
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:54:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Fl-0005Fh-Hh; Mon, 25 May 2020 02:54:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Fj-0005Fc-Pu
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:54:11 +0000
X-Inumbo-ID: 02b26712-9e33-11ea-ae69-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b26712-9e33-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 02:54:11 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b6so16400916qkh.11
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gd2QZnhqRG2wfOUzgNesrJhEW8WJZJ6w2ov6jlm8W5o=;
 b=OsB9g1UAriBq4kboxMcUwtzv278fUPt2vOcCEXJJ1O6mM2vFpeOZ5zGTjpjngJfYHZ
 S4c+F6BU5o818jJa5XdtW7uNLyyR7VtRvoSHzJW5oLphUcxqd3VafQ9d9v8gqj5N1K+q
 8I4TTcv6xofD/yhm99g6PUSnAaoTRaraFKLClVYoWk2rrqlSXYh61E328dGDZClSLV18
 rE7VcnnWyvE3ATHmoP8QeVFhUHpm8QH/EVqzTo3vl1MnC/dDsrPmezIGHMjS5CeL6NUY
 qZAKIf1zcgkT2AtaLrjd+AkLfgnPYf9Lhj8iSbrhpZ7ShjN6Gj7nBDCeu0ser/kTLpOr
 BsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gd2QZnhqRG2wfOUzgNesrJhEW8WJZJ6w2ov6jlm8W5o=;
 b=NlaOZI10Esu5cndpTWmmB4M2gF+f4c1JoaK4IgESWXCZA9+X4UX3MwmnfG6qYHErhl
 TIFDXrqzAotPVYX22Aa9SJ1EuBKKgHhazkPRcMc9bx+nd0dX2F+kAOwXZDcblxc1RFVl
 5usu5/TsFEpo/zGK0K4B27qUeffXqZMAMzIO6vr/vS9oi1+V9EEf6fAyKI8xmCCky/oN
 PFOvo7EkI6qOThRrDOmZ5ehn05Ws3+emX2ZoVlotAMeA+c/BJ8+N4srRIPF1rdQaOSfr
 0DtK+kCRtSfUreADZsPPc1OSXfAj3SURkBCSxgbzKS4p51nT9wi7hRJQ+012H+bKn1Xy
 qZWg==
X-Gm-Message-State: AOAM530qFHoYU31ml9khW8rijGuDDUXI5bjUpXOqDhBNXITAxpAFuU9A
 iogLhQb9/0CWu8L+54cbo5ikT5Bh
X-Google-Smtp-Source: ABdhPJwfuCYfsVOLTBWJmgJF0ndj8awyy8F6sa6kpfnh8VSsdrOS7osVB7vGROUh4v0+2Wz1K0E10A==
X-Received: by 2002:a37:6e42:: with SMTP id j63mr8169954qkc.329.1590375250901; 
 Sun, 24 May 2020 19:54:10 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id o14sm12962296qkj.27.2020.05.24.19.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:54:10 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] CHANGELOG: Add qemu-xen linux device model stubdomains
Date: Sun, 24 May 2020 22:54:02 -0400
Message-Id: <20200525025402.225884-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Community Manager <community.manager@xenproject.org>,
 Paul Durrant <paul@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add qemu-xen linux device model stubdomain.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ccb5055c87..52ed470903 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    fixes.
  - Hypervisor framework to ease porting Xen to run on hypervisors.
  - Initial support to run on Hyper-V.
+ - libxl support for running qemu-xen device model in a linux stubdomain.
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.25.1


