Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF3918383
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749017.1157065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA8-0003I9-0F; Wed, 26 Jun 2024 13:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749017.1157065; Wed, 26 Jun 2024 13:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA7-0003BZ-L2; Wed, 26 Jun 2024 13:58:15 +0000
Received: by outflank-mailman (input) for mailman id 749017;
 Wed, 26 Jun 2024 13:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA5-0000aq-LD
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:13 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 209e8c70-33c4-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:58:13 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-79c0bbff48aso152550085a.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:13 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:11 -0700 (PDT)
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
X-Inumbo-ID: 209e8c70-33c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410292; x=1720015092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3jc/D3oGiKvIBrZUXRabVXNRbnlweDK3F2GwPRZj5o=;
        b=S5T1oBiY7HpIqqQj5UBrBgDEhVlDzpevKmgYY03agoWjnfE1SslwTzWQzFMPT8SuGW
         t0vzskujDGvM1SyGKjVZ7jDGsvAPZ5JQFw/ZveCZQKD5FJaSJ9jLgDQJ8WRqtXMD5BoM
         O3NiGMfTiswm2H8gDsCQJTHEWlUDCC9kKQ03E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410292; x=1720015092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3jc/D3oGiKvIBrZUXRabVXNRbnlweDK3F2GwPRZj5o=;
        b=Cwuq01hezb9SMfqudNFGxW42/0eglrUv/juDhjeErs+81skXHJqXXuh13Rs3I8iLYm
         Pusjpk0wPiDSEMapKn1/aIRqb7UQI+jKUiNg0H9h69jM7XFFe6zwJYvyCfXGj0hzngVB
         nWtRr1akFqKlOiRnVXmq3PuJANEgm4QHxPCIfoRhma2zTUhUaqpR4xUa7VmLgpdvBnty
         EQMQa1JxiJX8DvNjJ9pCHYdJ8i2g6946ywW9PbngoK1Z8cWNGSOuabCgydQyotVyWm1Z
         q/ei1qzXnU4CH3JwOKX4cegYgkwIyn8i/w941Syp9gxdyjKB/k+a7rdTZCq3WAsRbBNk
         DL2w==
X-Gm-Message-State: AOJu0YzP5DI2jfcsnURcVI1KCxElXdiVrxEI1UTIFjqBQ63XiH3V4eEL
	YakWgf7ryzwiFvopkCH5lLUAE74Om5NHq/OQ2oc6xVgaf4q5f8Ev65X/zrnvwLCvSIiC2g8ihuz
	k7h4=
X-Google-Smtp-Source: AGHT+IGot/l4FhRSt0d1zR1K2xibC+CVce1BvKCqj8naOo9yU4mayrW66/FlAJVn8S5u6fG4LZWhRA==
X-Received: by 2002:a05:620a:3727:b0:798:db85:c999 with SMTP id af79cd13be357-79be6f13d87mr1195903485a.51.1719410291966;
        Wed, 26 Jun 2024 06:58:11 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>
Subject: [PATCH WIP 11/14] x86/trace: Add trace to xsetbv svm/vmx handler path
Date: Wed, 26 Jun 2024 14:38:50 +0100
Message-Id: <20240626133853.4150731-12-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are already "HVM handler" trace records for writing to XCRs in
the context of an HVM guest.  This trace is currently taken in
hvmemul_write_xcr.

However, both VMX and SVM vmexits call hvm_handle_xsetbv as a result
of an XSETBV vmexit, and hvm_handle_xsetbv calls x86emul_write_xcr
directly, bypassing the trace, resulting in no "HVM handler" trace
record for that VMEXIT.

For maximal DRY-ness, we would want hvm_handle_xsetbv to call
hvmemul_write_xcr; but since the intent seems to be for hvmemul_* to
be only accesible via hvm_emulate(), just duplicate the trace.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Andrew Cooper <andrew.cooper@cloud.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
---
 xen/arch/x86/hvm/hvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0fe2b85b16..628a131399 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2073,6 +2073,8 @@ int hvm_handle_xsetbv(u32 index, u64 new_bv)
     if ( index == 0 )
         hvm_monitor_crX(XCR0, new_bv, current->arch.xcr0);
 
+    TRACE(TRC_HVM_XCR_WRITE64, index, new_bv, new_bv >> 32);
+
     rc = x86emul_write_xcr(index, new_bv, NULL);
     if ( rc != X86EMUL_OKAY )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
-- 
2.25.1


