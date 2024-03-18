Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F7687EE83
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695073.1084633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGWL-0002wh-3S; Mon, 18 Mar 2024 17:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695073.1084633; Mon, 18 Mar 2024 17:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGWK-0002uy-WB; Mon, 18 Mar 2024 17:11:32 +0000
Received: by outflank-mailman (input) for mailman id 695073;
 Mon, 18 Mar 2024 17:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHV-0002gq-Ka
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c40284e-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:11 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41411421113so7765955e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:10 -0700 (PDT)
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
X-Inumbo-ID: 6c40284e-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780970; x=1711385770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1FmchBsn53IniDlrcuaP8DsX+RYkOrmvm7uzgbbq7I=;
        b=GCIDuRpdPlNgeAGAnH0+/8OzTcPZufOurq4jpflyQ45brtbpbvt3QM6dExvcltJE45
         ZMEUZxYsaTTvLA+4WVQ1WmWMn5cQ3DcRPLOv59loa8u4Q7AQxBoDPlyaL+HC/CxosnWO
         eaI5J1Rut1cONFewmRLPZ5TfMduTSZcO5xuBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780970; x=1711385770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1FmchBsn53IniDlrcuaP8DsX+RYkOrmvm7uzgbbq7I=;
        b=cl8FTVMZLI57AmhAkW0JHYMTYGfX2h7IloMVV50rrKZlLwhRbqKkd5+ThNQVVuEn7F
         EHmZomkCamrZ/MRfHAFK4daxhGASJYObQqCWbkgT71o8qVsMKMdxBJS6xTpxygykwG4R
         ONOVdmSWx8+fPDP2bFUel+46AJB4O3iMlXhXuHqbR2d4RDRRG89cayJ5q+Yhke8XHIM+
         A23VdXTws3plnXxx0O9t1eaKNjFYcA11SpQZo24JlYilKPW0/SQ+rXwtvK96c9k/4E4d
         T6NhJKilIfwzO3qi88Fq/SJxAN4i/4zszxiB4NUC0HUa6z92TNeRASPLItKG0+qf3pnQ
         wxzA==
X-Gm-Message-State: AOJu0YzeS6Ygj5q5uuDV9dVve1j2QWfZQziC5sn8d+KzKUfJ69JiijyD
	eDIxoyHVUWEzWwcZbo08vEsGxAHhki6TrA93Y3R7pIvgdyDUMvhhUCmNbJgLkE6DppxY6tcasG7
	k
X-Google-Smtp-Source: AGHT+IHUWsml3D4ikWb31YIkSLv/z6wgQgGRvJNqTp7bVNw7TXv3i6SHWlKhpDk7+qlnPGxvigH7tw==
X-Received: by 2002:a05:600c:1554:b0:414:39c:d9f0 with SMTP id f20-20020a05600c155400b00414039cd9f0mr27157wmg.2.1710780970663;
        Mon, 18 Mar 2024 09:56:10 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 23/36] bookworm: Extend ARM clock workaround
Date: Mon, 18 Mar 2024 16:55:32 +0000
Message-Id: <20240318165545.3898-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Still broken on arndale, serial stop working early, then the machine
timeout when working on creating a xen guest with xen-create-guest.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 4f07cdef..68f1be60 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -253,8 +253,10 @@ END
 	my @xenkopt = @kopt;
 	push @xenkopt, $xenkopt;
 	# https://bugs.xenproject.org/xen/bug/45
+	# #45 - arm: domain 0 disables clocks which are in fact being used
+	# https://lore.kernel.org/xen-devel/1414672390.2064.31.camel@citrix.com/
 	push @xenkopt, "clk_ignore_unused"
-	    if $ho->{Suite} =~ m/wheezy|jessie|stretch|buster/;
+	    if $ho->{Suite} =~ m/wheezy|jessie|stretch|buster|bookworm/;
 
 	$xenkopt = join ' ', @xenkopt;
 	logm("Dom0 Linux options: $xenkopt");
-- 
Anthony PERARD


