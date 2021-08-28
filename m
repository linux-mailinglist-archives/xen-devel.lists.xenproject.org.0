Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930743FA48A
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 11:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174229.317842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJuJA-00020M-93; Sat, 28 Aug 2021 09:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174229.317842; Sat, 28 Aug 2021 09:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJuJA-0001xh-53; Sat, 28 Aug 2021 09:07:24 +0000
Received: by outflank-mailman (input) for mailman id 174229;
 Sat, 28 Aug 2021 09:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpeQ=NT=gmail.com=fontaine.fabrice@srs-us1.protection.inumbo.net>)
 id 1mJuJ8-0001xb-A1
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 09:07:22 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5220c1e1-a641-4f73-b03b-cae2ba0f0b68;
 Sat, 28 Aug 2021 09:07:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h13so14174708wrp.1
 for <xen-devel@lists.xenproject.org>; Sat, 28 Aug 2021 02:07:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id d24sm7423190wmb.35.2021.08.28.02.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 02:07:19 -0700 (PDT)
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
X-Inumbo-ID: 5220c1e1-a641-4f73-b03b-cae2ba0f0b68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sH/jrHuo71/+6NebGzrhW9dd80+cJ2aN1P8SqmFG4Y=;
        b=QyVf/mUUeIEJ61MJnbAU22hmTgN6Vmff9CkaV8FroxULw7Xg1qVvifzVMdxqvZ4EB7
         pguRnl+SfSHkCXij4spgHC2PU6+xsYyQEjYtSV134QtcG2G8ehhw4AkxC/FVybP0yoik
         pwiC9nFmOh/1Y3mcYEZByMHYaNrUdGBa14SQZxMBXz1vBhcwiNMCs+luPwJz3Hgp3Ws8
         57iVca9hGrAjhEnDBez3pD1tXD+eh3A1V5ZTs2FXbI1G/wPGDr3knSFCwZUBLxSAyhrm
         cBb3aktSERl5ondLjepVlJe6WDd8R3IsVO0AlybN1IwOO4OHyuEdg4eY06SUwamv7kEw
         OXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sH/jrHuo71/+6NebGzrhW9dd80+cJ2aN1P8SqmFG4Y=;
        b=J9NDX8XE+oy26rKFueDg/mwT7svrgOXre20I7O4fiDbW7uhtO0QJ7ZIQmyB9HFto/4
         xzxt0eb4owa3J8x0NDH/QjutVjVB1s9Lh7f9JxaC3VLpK6aI2Zwty7YPsMOXGR6Ph/l7
         fSL/Kn53p4cDKR0Hb59B6eiLXMkC+a1CJdDpp5YGFUri3brOc/c7L/ZxQl2imfjyC8vA
         zZ94CaGaNHf0vQSQcB/ZqWkpePVllOZMAV9FRSpve3ddTdUMpuDTQ5MB1FLc0UT/Vtta
         TDx85fPs/bD8aSj84HBwiy1DPtha9X4+ddhU2y7EjfJXqQ0pgpdzRRXluR1aeJjJTE0k
         M4Ug==
X-Gm-Message-State: AOAM532lINJMq/+YwcqIug4FXE6DX7BiA496jZNUrBp9VKPUpJPQb9AO
	Wd4l5YVL4YDajQrStltHDRGwHvf9opH6zw==
X-Google-Smtp-Source: ABdhPJw0bk3v8/0UNwFLiqjovSZMtun130MfJKTZnZrm5RUPPYaJiX3gpJ7z/ulq+jvnTM200Vo+3w==
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr14745119wrs.278.1630141640131;
        Sat, 28 Aug 2021 02:07:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libs/light: fix tv_sec fprintf format
Date: Sat, 28 Aug 2021 11:07:09 +0200
Message-Id: <20210828090709.738512-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
Use %jd and cast to (intmax_t) instead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 tools/libs/light/libxl_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index c00c36c928..51a6127552 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1444,7 +1444,7 @@ static int libxl__mark_domid_recent(libxl__gc *gc, uint32_t domid)
         }
     }
 
-    r = fprintf(nf, "%lu %u\n", ctxt.ts.tv_sec, domid);
+    r = fprintf(nf, "%jd %u\n", (intmax_t)ctxt.ts.tv_sec, domid);
     if (r < 0) {
         LOGED(ERROR, domid, "failed to write to '%s'", new);
         goto out;
-- 
2.32.0


