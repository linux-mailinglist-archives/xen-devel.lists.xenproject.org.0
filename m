Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D01198459
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzO-00062B-Pb; Mon, 30 Mar 2020 19:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzN-00061L-6a
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:25 +0000
X-Inumbo-ID: c268c1f8-72bb-11ea-b9f4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c268c1f8-72bb-11ea-b9f4-12813bfff9fa;
 Mon, 30 Mar 2020 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/pIVztCOZ+Oro9OyPZ8rpK5+2/IrWNjAFttuxKSq30=; b=tbXnFvDrokb0deanZ48HiDe08H
 3BaJ7R53ka4p7uR+B9abIT0HELSLTbhFBGducfWVCW91JzRKgC35rbnW5vYwhJox/xPAatYHdSJB+
 RZXq3RWpcZDqKEfXao+JjMU4rjQKEkq7Ms53msDaflHyehtEbYpSrI6Kjd4NDYWeDUlU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzA-0003la-NF; Mon, 30 Mar 2020 19:22:12 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzA-0007AJ-EK; Mon, 30 Mar 2020 19:22:12 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:54 +0100
Message-Id: <20200330192157.1335-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 5/8] tools/ocaml: libxc: Check error return in
 stub_xc_vcpu_context_get()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, dfaggioli@suse.com,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

xc_vcpu_getcontext() may fail to retrieve the vcpu context. Rather than
ignoring the return value, check it and throw an error if needed.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 904da45c4f..0fdbeac158 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -497,6 +497,8 @@ CAMLprim value stub_xc_vcpu_context_get(value xch, value domid,
 	vcpu_guest_context_any_t ctxt;
 
 	ret = xc_vcpu_getcontext(_H(xch), _D(domid), Int_val(cpu), &ctxt);
+	if ( ret < 0 )
+		failwith_xc(_H(xch));
 
 	context = caml_alloc_string(sizeof(ctxt));
 	memcpy(String_val(context), (char *) &ctxt.c, sizeof(ctxt.c));
-- 
2.17.1


