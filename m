Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78F8A4A2B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 10:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705912.1102840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwHWi-0002r1-Ez; Mon, 15 Apr 2024 08:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705912.1102840; Mon, 15 Apr 2024 08:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwHWi-0002oS-C8; Mon, 15 Apr 2024 08:17:20 +0000
Received: by outflank-mailman (input) for mailman id 705912;
 Mon, 15 Apr 2024 08:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRdI=LU=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rwHWg-0002o1-Ig
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 08:17:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a24341-fb00-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 10:17:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41879f3d204so679225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 01:17:17 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a05600c45cb00b00417f65f148esm12200309wmo.31.2024.04.15.01.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 01:17:16 -0700 (PDT)
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
X-Inumbo-ID: 92a24341-fb00-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713169037; x=1713773837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TspVDJcKtf2IiF6MMEJrOi4bZh+9dt3isUhG9ha8kdE=;
        b=f10UOVBUHGWviwmFu25HT6MxoLu4zb6GJpMyoqupJHq2olM+QcpJw8WAtl3SfTHVtm
         QsxnE2bne9NzWyE58mmNSVy3QAwg3cMMNmvCDjMbKGMFRiCBJw95+O4QVPs6GBR9BCzd
         krOcsPNxXVXkhm3woBQInkjpCTx+nSfdnpHRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713169037; x=1713773837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TspVDJcKtf2IiF6MMEJrOi4bZh+9dt3isUhG9ha8kdE=;
        b=esDoj3J64f/ej4TfYZ8LGzKHd0R+faUh30casGIGJX7QN50AEfjNLGgM9hIdosUzh4
         LSrwU+w/WFDg9e5M0OoR8nmeebUCXry2wUONO2g1NpQ5XlNq6H2m9dFMsiDTGyqc+Lhx
         IMdy4xstcONU1emWjfmNtfTXVVcQmScaNgTbAyjrChzfw2cqeUZLghpUFqumbHNQAdV4
         NDrtpF8HgVFeeFWeA3GL49XXctG4cqiycIUN76jFgk+H90HwmfsAivDNX0vM6j9NLfUc
         nmBvpNmnvBlFAmZBHnhIcPcuGYSSF4bWYLE6dSC5mMLnck/0RF5gHziT24IF0r4y3rG/
         yUjA==
X-Gm-Message-State: AOJu0YypuCIVXSyK+FecFBMIEXNqBKYXS/93w3rE+gyFKZ8rfdl9gzK6
	kXuiKDHx7sJL0OhV4mwmPh+4WF9nacx2qV4SzJE21HdIN2hJjkSyLbRtJ+6bhfu4vcZDFtDgQc1
	x
X-Google-Smtp-Source: AGHT+IF921XNWkwYiDM2gXOaRX/DqQsGeogXdq3tDnvfflJDFcEi9mw298ObyPZVY0y0PrDziAkeOA==
X-Received: by 2002:a05:600c:444a:b0:418:cae:5086 with SMTP id v10-20020a05600c444a00b004180cae5086mr5260360wmn.10.1713169036813;
        Mon, 15 Apr 2024 01:17:16 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH] production-config: override mirror url for buster, use archive
Date: Mon, 15 Apr 2024 09:17:08 +0100
Message-Id: <20240415081708.32671-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

buster-backport isn't available on the main mirror anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I've tested the patch already, so I'll push that soon.

 production-config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/production-config b/production-config
index 6345c40c..5b0c640d 100644
--- a/production-config
+++ b/production-config
@@ -95,6 +95,8 @@ TftpDiVersion_buster 2023-06-20
 
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
 
+DebianMirror_buster http://archive.debian.org/debian/
+
 # For ISO installs
 DebianImageVersion_wheezy 7.2.0
 DebianImageVersion_jessie 8.2.0
-- 
Anthony PERARD


