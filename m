Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F787EE29
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694954.1084360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHP-0005h6-5i; Mon, 18 Mar 2024 16:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694954.1084360; Mon, 18 Mar 2024 16:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHO-0005P6-IZ; Mon, 18 Mar 2024 16:56:06 +0000
Received: by outflank-mailman (input) for mailman id 694954;
 Mon, 18 Mar 2024 16:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHL-0002f9-5l
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:03 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 669a38fd-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:01 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so5801720e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:01 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:00 -0700 (PDT)
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
X-Inumbo-ID: 669a38fd-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780961; x=1711385761; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd9iUaTqxVeuY65CjLGL6cDo2UmB5wPhRHB/vSr/mm0=;
        b=tNh1J3lEzrqY8SlbTejF3KRU7H5V3RAdDfPgeOeiEcCniSLtEJ/D6m7lfgWVGxh5kH
         NLzTfW/XfYQdluRpr9Dvfpq/ZfyYcy/PoWp/kIuMxtfCPMnNJKaj4GdpsRs8JD8GCF0w
         8GjBq0Gc0pZM4EuRyiZWzRdob7VEXcbppvP0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780961; x=1711385761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd9iUaTqxVeuY65CjLGL6cDo2UmB5wPhRHB/vSr/mm0=;
        b=SNW8B42qZipSA4aXqL2KBcKN2bXARaypmorNtywM3VJJ/oZru8YwGZepDC02RIxNEj
         1M4BlG4Z6gSptiRlYm5M9T8zI4vBXCK6D2CRQVFp66G7ZZx8VE8wafY4pRVVqO7aZXMd
         XOSZ1V69MYGNtkX+HrwDCdJD6cncnWmQFtolE70laqK63Wu/ZW/ujOzX085kdphlDaTf
         86PJFj/Amut6+5me4TLLVllni/emeOvLwV3Q/0YLM0hmLtrHYQTi1ckwJvM4kYUkRhnl
         2jJM/aA+H9Kr43ulIGCre4fcko++Z0sFKqbB0DqbtU3MG+6q9T8aJ65MpRbNkePK8DoE
         hpHw==
X-Gm-Message-State: AOJu0YzIM6FLh4cHr967psuCtN7ovf5q+jCM/AkoS1SYHedIYqznBIvd
	8hVDwekqdNyXixUw/aTvI/wibD6RBHq5kK9+Va+UEy9bh/pxmos/wB5tmN+WCbx5t9BxIZIJoyO
	8
X-Google-Smtp-Source: AGHT+IHlMI0WDpjOGMDmBg0WcpDF0MYnwJqnd2kHpPPrEe/KcP+Vq3g2qp8yYST2nrjesKhVRsX19g==
X-Received: by 2002:ac2:5047:0:b0:512:bf99:7d80 with SMTP id a7-20020ac25047000000b00512bf997d80mr7427974lfm.1.1710780961046;
        Mon, 18 Mar 2024 09:56:01 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 12/36] di_installcmdline_core: Add link_wait_timeout to install cmdline
Date: Mon, 18 Mar 2024 16:55:21 +0000
Message-Id: <20240318165545.3898-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default wait time of 3 seconds isn't always enough get an IP from
the DHCP, give more time to the installer to find a NIC that works.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 14ec2293..cf5a3bd1 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -723,6 +723,7 @@ sub di_installcmdline_core ($$;@) {
                "hostname=$tho->{Name}",
                "$xopts{PreseedScheme}=$ps_url",
                "netcfg/dhcp_timeout=150",
+               "netcfg/link_wait_timeout=10",
                "netcfg/choose_interface=$netcfg_interface",
                );
 
-- 
Anthony PERARD


