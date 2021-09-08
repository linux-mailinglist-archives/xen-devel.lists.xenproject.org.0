Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138554041B2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182411.329991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sE-00070n-9F; Wed, 08 Sep 2021 23:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182411.329991; Wed, 08 Sep 2021 23:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sE-0006yQ-4m; Wed, 08 Sep 2021 23:20:58 +0000
Received: by outflank-mailman (input) for mailman id 182411;
 Wed, 08 Sep 2021 23:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6sC-0006qz-06
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:20:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6aa80e62-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:20:55 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-R6zlE6tdNA-tMDGhi21A2g-1; Wed, 08 Sep 2021 19:20:51 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so4241wma.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:20:51 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c3sm30713wrd.34.2021.09.08.16.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:50 -0700 (PDT)
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
X-Inumbo-ID: 6aa80e62-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6u3sclI6JBi/0aQ8m/8uYmNWK6u/Efc+CTX33mwcn4=;
	b=UAbntxhNMDLfhVBJUanQ/nbNFX8SsAgORd8PabEo0ooHKj4cGHZLtZJV1Ap4C+4U+v4W1m
	9JXqOZLnbflNIhvAsLodB2QDw6saRyC5xk4oXokL4grrM0ug0kgsIlLCH43ermB775L6GW
	OxaKR8ypL7bHx7uyTyNf2AXNhuX1iS8=
X-MC-Unique: R6zlE6tdNA-tMDGhi21A2g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6u3sclI6JBi/0aQ8m/8uYmNWK6u/Efc+CTX33mwcn4=;
        b=sT9ulG+ZLywii1VxtIiObwE6Cfz6u6/yBn70EPuwbVCw6/ZfKA7qU6gdGHNv+JLu4O
         xlNFhV2PQQmkq3Ag8ta/I/6EmwPQXwbfwYBp4TwLJzPK4Ya5gMyGCHwxZcdADwRphnPo
         ZMz0xm+EBplM2vappXNzHx52zdCcBrGNbpKrcbsOLUPBmfbPnmudlQ8a/FudIlvcfhoE
         9uAoRPeUjJTuaNaFnRG/XrJBd/pjvFcFQwa8bdVkI8v9Vbmqhrkf7dIADSo/nSKlawVI
         wsNSYxohSKxP/6aKtAx2qd6p37SER7F1rBI67QD/mQrHWPtaD/5iLGcAjXST6f5Bs6KP
         YBlA==
X-Gm-Message-State: AOAM533FLPUp4ly/iDks+MJ/+x1m+bKmxFUHVLy/dT6Ux8hPMnJStnIi
	MakxHz1GfiQpUmSh/Tj+/OZTLTNAXNjqcEYY6kZeLBdqbnkenuQsMrM8bKjPAoWJPpC+zj1xuL8
	mwPT2FIrR3Klpf1KaWlgBJty5t08=
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr108073wrr.164.1631143250631;
        Wed, 08 Sep 2021 16:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrh/n5wSnZqfaTQvrzl6IJ2DKh1pSXkkHEuOdKtVrOvCH+TWDpEiwg1GoyEgBtyhNoco5QeA==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr108055wrr.164.1631143250497;
        Wed, 08 Sep 2021 16:20:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 05/10] block/null: Mark 'read-zeroes=off' option as unsafe
Date: Thu,  9 Sep 2021 01:20:19 +0200
Message-Id: <20210908232024.2399215-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See commit b317006a3f1 ("docs/secure-coding-practices: Describe how
to use 'null-co' block driver") for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/null.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/null.c b/block/null.c
index cc9b1d4ea72..11e428f3cc2 100644
--- a/block/null.c
+++ b/block/null.c
@@ -99,6 +99,13 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
     return ret;
 }
 
+static bool null_taints_security_policy(BlockDriverState *bs)
+{
+    BDRVNullState *s = bs->opaque;
+
+    return !s->read_zeroes;
+}
+
 static int64_t null_getlength(BlockDriverState *bs)
 {
     BDRVNullState *s = bs->opaque;
@@ -283,6 +290,7 @@ static BlockDriver bdrv_null_co = {
     .bdrv_parse_filename    = null_co_parse_filename,
     .bdrv_getlength         = null_getlength,
     .bdrv_get_allocated_file_size = null_allocated_file_size,
+    .bdrv_taints_security_policy = null_taints_security_policy,
 
     .bdrv_co_preadv         = null_co_preadv,
     .bdrv_co_pwritev        = null_co_pwritev,
-- 
2.31.1


