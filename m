Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5976372A53
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122280.230590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUE-0005kd-Si; Tue, 04 May 2021 12:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122280.230590; Tue, 04 May 2021 12:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUE-0005k1-PJ; Tue, 04 May 2021 12:49:14 +0000
Received: by outflank-mailman (input) for mailman id 122280;
 Tue, 04 May 2021 12:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUC-0005hX-Qv
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:12 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 946902fd-f0d2-4c30-aca5-e82efc7bfee3;
 Tue, 04 May 2021 12:49:11 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id k127so8295938qkc.6
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:11 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:10 -0700 (PDT)
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
X-Inumbo-ID: 946902fd-f0d2-4c30-aca5-e82efc7bfee3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3KzzfjROMAHRA0Cu1BG5VLwtVA1MVVdfpHeND8oqJ2s=;
        b=Z1mqDmUNXCDfiBRm5rhrsqEJUoJIgMk+Pi+znrsBuB/1g6cQmHDAmwD3dwb4d122CE
         lqlmGYTiyr43E5GscRvhsk55hxa2tQwk4LgHxPzdpuJbZ6TnjlL2A25ALevXUryF7ahc
         DMJvDP8sfZKtdKyQ3rpwsnDCzYMt/Hpyl5fbB1dAD6neI5Bxr9OSG9cjAbSTDqIARZD1
         ozOj0A79gFKVsb+AkNgNdoNJjnfRU7bY6gYF9cVtt8bjiOqHsBW+9utWaUtPZkNfnWLf
         viy96ok1QxMfXLP5wT8EwABmpIZ6RXiT7JQaH13z1O694pZ7pLinehCflueL1Do9pHU8
         SsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3KzzfjROMAHRA0Cu1BG5VLwtVA1MVVdfpHeND8oqJ2s=;
        b=ZzjMlzOlaOgrmFpymWGXjJpGSRXvcfcqlVf/eE6Jsl63OZOYweBYDrwjK5xMC4KXXE
         f29ALw0TUqOT5pxqF4Tx74vwrcFtFb8pFccdFx+ZwVQLxf7IR9X8HFJ2wtptljLGYY4n
         dEkT20Nms7TO77fkWuKGG4bqpIDxBFkFZ7W1r8uKD1KRa0voVJAJeZ979bSKU/26Vc45
         dHCaMi6UK112q442kcsTSU8TBH4dtzkTwFIeRnve8M+VtfVT+Y3y99VUxAHd+Iq/y3sQ
         SJv5RR10mkP8rh6R4MQeoeHQwvY2oret7If3VUume8mr6HuZc7BEkDqxCXnXhj9y7oxL
         uwmw==
X-Gm-Message-State: AOAM533Vn6kJjV3PEJ+SJgVpdaCL1MVI0Y0FgU5suo3Fyr3K4Kr6NaLY
	/v/jv4WBunCWk6Nbz0HPUvGtwlRLtzk=
X-Google-Smtp-Source: ABdhPJx33CuWTBGjz85fbgCR8dzRj4XXn1W5IDA4Vv7+cIK1vR9R0m97XLxCBsvYZfnw8LLjv+RuQQ==
X-Received: by 2002:a37:ae44:: with SMTP id x65mr24485179qke.9.1620132550933;
        Tue, 04 May 2021 05:49:10 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/9] docs: Warn about incomplete vtpmmgr TPM 2.0 support
Date: Tue,  4 May 2021 08:48:34 -0400
Message-Id: <20210504124842.220445-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vtpmmgr TPM 2.0 support is incomplete.  Add a warning about that to
the documentation so others don't have to work through discovering it is
broken.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/man/xen-vtpmmgr.7.pod | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
index af825a7ffe..875dcce508 100644
--- a/docs/man/xen-vtpmmgr.7.pod
+++ b/docs/man/xen-vtpmmgr.7.pod
@@ -222,6 +222,17 @@ XSM label, not the kernel.
 
 =head1 Appendix B: vtpmmgr on TPM 2.0
 
+=head2 WARNING: Incomplete - cannot persist data
+
+TPM 2.0 support for vTPM manager is incomplete.  There is no support for
+persisting an encryption key, so vTPM manager regenerates primary and secondary
+key handles each boot.
+
+Also, the vTPM manger group command implementation hardcodes TPM 1.2 commands.
+This means running manage-vtpmmgr.pl fails when the TPM 2.0 hardware rejects
+the TPM 1.2 commands.  vTPM manager with TPM 2.0 cannot create groups and
+therefore cannot persist vTPM contents.
+
 =head2 Manager disk image setup:
 
 The vTPM Manager requires a disk image to store its encrypted data. The image
-- 
2.30.2


