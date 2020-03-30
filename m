Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0F198463
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzT-00064E-36; Mon, 30 Mar 2020 19:22:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzS-000642-6J
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:30 +0000
X-Inumbo-ID: c34cee6e-72bb-11ea-b9f4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c34cee6e-72bb-11ea-b9f4-12813bfff9fa;
 Mon, 30 Mar 2020 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SeTP5PjKpdztRFSH2djowiTCzoQ8o/T7Y3wvlnDwhHk=; b=TcefiyBlZ3lnjAHdNvaPZbBRWS
 Zah8M9C9laLhy/vo/xoCPcadFcuM9Adik5NQImgEHUSYG+YwnjbxGeO5CHaoUIZPbPcU1Fctr5J8E
 IcL9yFfsYQWLm5rZqWpWrJ9ScAFqXG7HfEnybEJqt/D7szWcUlE6bn88nziw/so2aLJw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzC-0003li-0H; Mon, 30 Mar 2020 19:22:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzB-0007AJ-Nd; Mon, 30 Mar 2020 19:22:13 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:55 +0100
Message-Id: <20200330192157.1335-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 6/8] tools/ocaml: libxb: Harden
 stub_header_of_string()
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

stub_header_of_string() should not modify the header. So mark the
variable 'hdr' as const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/ocaml/libs/xb/xenbus_stubs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xb/xenbus_stubs.c b/tools/ocaml/libs/xb/xenbus_stubs.c
index a68e783f70..001bb03371 100644
--- a/tools/ocaml/libs/xb/xenbus_stubs.c
+++ b/tools/ocaml/libs/xb/xenbus_stubs.c
@@ -40,12 +40,12 @@ CAMLprim value stub_header_of_string(value s)
 {
 	CAMLparam1(s);
 	CAMLlocal1(ret);
-	struct xsd_sockmsg *hdr;
+	const struct xsd_sockmsg *hdr;
 
 	if (caml_string_length(s) != sizeof(struct xsd_sockmsg))
 		caml_failwith("xb header incomplete");
 	ret = caml_alloc_tuple(4);
-	hdr = (struct xsd_sockmsg *) String_val(s);
+	hdr = (const struct xsd_sockmsg *) String_val(s);
 	Store_field(ret, 0, Val_int(hdr->tx_id));
 	Store_field(ret, 1, Val_int(hdr->req_id));
 	Store_field(ret, 2, Val_int(hdr->type));
-- 
2.17.1


