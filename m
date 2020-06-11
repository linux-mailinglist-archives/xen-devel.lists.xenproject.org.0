Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED5B1F608E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvj-0008Hz-Nj; Thu, 11 Jun 2020 03:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvi-0007xd-Sw
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:31:02 +0000
X-Inumbo-ID: eab8e834-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eab8e834-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id g18so3576001qtu.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tzm6Mh214muY5lx/rQlFhXvADj4YlPdVI5v2o4d8yuk=;
 b=f37z0AnH7+bYS0HKpYVntf0Qni0Aax6duvGiA3QSII8dzY4/Y72MpGqWpFnuFiS8gf
 vgtf+XD0TsYKzn4HeCrQVZet9wK5nHD98GARtJiz/irbBvdJsoAdDD3yx2uy45wqmS1O
 PHcZq5j8+xFBlp6Qkt/LgeoEoxJZvVbbKAKTCh+j6qr69rsY7zHvFT6PeBkq4JTJS7a1
 j2ocbNDwhPGvqBSL1aRrdvXXH22qvWpSIF97vZOzHl6bCUDqqQ17V3VufgHItwBs2lQS
 Lx46+um3MJmmemuAifhN+PyjJHBFDBZ5WvT45MVle0ffY0gGwNpRuie8HhJkq3irStIZ
 LnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tzm6Mh214muY5lx/rQlFhXvADj4YlPdVI5v2o4d8yuk=;
 b=hZ2bLqrwSFihmh/Np2/D6+5QHto4+BIrIzOrzbRDfxkN+S2TbO2R3JtygRnS5W1JGx
 jG5ZV4/7QKJ5QT+UXS0jVh7SEjHYahxppIaYF9JjdYhLKsHvam9cAD1CYPmTD6inueCT
 zm6U26h1SK4jr+b3G+DVBt3WZCQ4KJMfFeF33P1AosHwgeWbMm3Xec62BCVwZ4skaYZY
 g40X41Bc9PXvKUHRk3cBpZOO2AXVFHWv9T03yfnmGmIbr3AvCEhHWD+7BbjezN2skhkK
 5WfvKnOpvAgrDKSX+nvX8NVP4fMWKWVnZTGmD5E+6VkNpATaA3XnblisD8x55OK61mgE
 85YA==
X-Gm-Message-State: AOAM5304A45kITz6hvRl/u3R8fnY8zZV9JX6JIE8h0y6PQv1iqZUl8Yb
 yCDjNUV5NSrbpQJY1CJKq83Clb/X
X-Google-Smtp-Source: ABdhPJxmdePJkrVa2BdhDezcmAvxku0TI6Mdn10/VkgQUT3queN0E8kb8S6GrS020z7e8W5WLa0n8w==
X-Received: by 2002:ac8:7cd:: with SMTP id m13mr6539169qth.332.1591846236971; 
 Wed, 10 Jun 2020 20:30:36 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 09/10] vchan-socket-proxy: Cleanup resources on exit
Date: Wed, 10 Jun 2020 23:29:35 -0400
Message-Id: <20200611032936.350657-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200611032936.350657-1-jandryuk@gmail.com>
References: <20200611032936.350657-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Close open FDs and close th vchan connection when exiting the program.

This addresses some Coverity findings about leaking file descriptors.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index cd7629bc4e..3552783ec2 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -518,5 +518,14 @@ int main(int argc, char **argv)
         }
     }
 
+    if (state.output_fd >= 0)
+        close(state.output_fd);
+    if (state.input_fd >= 0)
+        close(state.input_fd);
+    if (state.ctrl)
+        libxenvchan_close(state.ctrl);
+    if (socket_fd >= 0)
+        close(socket_fd);
+
     return ret;
 }
-- 
2.25.1


