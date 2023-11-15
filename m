Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68D7EC9A5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 18:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633809.988866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jfy-00034D-P5; Wed, 15 Nov 2023 17:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633809.988866; Wed, 15 Nov 2023 17:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jfy-00032D-MT; Wed, 15 Nov 2023 17:27:42 +0000
Received: by outflank-mailman (input) for mailman id 633809;
 Wed, 15 Nov 2023 17:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3DQ=G4=casper.srs.infradead.org=BATV+a96bd05b928ee04f18d5+7388+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r3Jfw-00031s-LU
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 17:27:41 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e58e07-83dc-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 18:27:37 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r3Jfh-00FTE8-Nd; Wed, 15 Nov 2023 17:27:25 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r3Jfh-004sFH-0w; Wed, 15 Nov 2023 17:27:25 +0000
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
X-Inumbo-ID: 43e58e07-83dc-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=U2nfIn0v8qQcweyjpuwetdqXtDTacmG9Ew4TFyBXTIk=; b=Z0hyEVwBzW2EjTAYTKEL9c5Jxb
	FIFLgifQJSEBNQMSx1dJbhnwRd5EyKn413VSvoQitCGS1XgTHSiuwuY1iKWaOjex+I+QwAtNtIkrZ
	ncu525Eu5aYcICJbRPH0prOFfUd7psULCeDYK1sd+1u8YT/uOWkTt+l2/HBIOf6Ok5JiT6BGVN4K/
	dPLPIQMMl72swFVHG5VOl9pTmf/iEojG7bdPQwBgUBDl2Bt90S8SMmypzJxsdYFt+nSJB12Kd96IL
	9BOfxKI4YY8f13ViEYj0RRLpzy6cDH/Si+CJs/FBAzOU6eL1n+y8cCdjZXlA7grXwNcE2848vcEG8
	KYSN3t1A==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH 2/3] vl: disable default serial when xen-console is enabled
Date: Wed, 15 Nov 2023 17:24:36 +0000
Message-ID: <20231115172723.1161679-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115172723.1161679-1-dwmw2@infradead.org>
References: <20231115172723.1161679-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

If a Xen console is configured on the command line, do not add a default
serial port.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 system/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/vl.c b/system/vl.c
index 5af7ced2a1..8109231834 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -198,6 +198,7 @@ static const struct {
     const char *driver;
     int *flag;
 } default_list[] = {
+    { .driver = "xen-console",          .flag = &default_serial    },
     { .driver = "isa-serial",           .flag = &default_serial    },
     { .driver = "isa-parallel",         .flag = &default_parallel  },
     { .driver = "isa-fdc",              .flag = &default_floppy    },
-- 
2.41.0


