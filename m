Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F17EE07B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634147.989443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFV-0003pi-CU; Thu, 16 Nov 2023 12:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634147.989443; Thu, 16 Nov 2023 12:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFV-0003oE-8t; Thu, 16 Nov 2023 12:13:33 +0000
Received: by outflank-mailman (input) for mailman id 634147;
 Thu, 16 Nov 2023 12:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFU-0003ZM-A8
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ecdab3b-8479-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:13:31 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32ddfb38c02so496875f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:31 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p1-20020a5d48c1000000b0032f933556b8sm13482302wrs.7.2023.11.16.04.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:31 -0800 (PST)
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
X-Inumbo-ID: 8ecdab3b-8479-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136811; x=1700741611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjlhZh+sLdNk7wcLFSKpl0cKtv3ClZ49wgL2gB3Kgko=;
        b=JBnliYI39CYgsYQ+iqaJF6QiA/hmk+GHk4xzvQUDNHZVjURHC4u6l+4p5Fnm4/2G+Z
         bbd6AIqZ/+xmeQOksNL4zhLYJhU0AsTTGNk6gUEjJtU+/kYxwWvIZVheWUwmw2gwWEAT
         eaWr6yke+TwqjzguPvd+fOU7jtKrspvHS5baw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136811; x=1700741611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjlhZh+sLdNk7wcLFSKpl0cKtv3ClZ49wgL2gB3Kgko=;
        b=FUa/XBcpo7xH2u27itBU1asd2cWRsg9Miaq0AnGtwgZe1UB4fXR6QuxY9mGsGhf0H4
         p1uLGNYZhoKlWOAXrDnCyw60CX6W9VB3ZLcPzL4e8grKt6PCez4Pb70YjNDuBsLVrokW
         hCaRj5Eq2/UtIKYVBcUUjQvr08wIo+H67MuvM1q+kVwM0EJs406Ed8ykutbALkZAEJ/3
         LWn3XuvbNLIUFUwmzYoIXBB1YjFM4zSHIVMwdZjDbbCqLO3owKyFgabHcTBV2QNaCoK+
         pqrwTMv1wUXzVCAPmCQtrNYDvapi+qRUnrCclLdrVzXyZ4bfyMcotvrR923bYA27RbW0
         dU5Q==
X-Gm-Message-State: AOJu0YzM05B9EzbQSr9lD81oEZzktqG6V9v+5Vwybasjkdtj7FGrp962
	R9u5xUfcWjbIWFcYDVcMwNSr3BFuEhr2e10TIDY=
X-Google-Smtp-Source: AGHT+IECWTu53i91pW224J9uL28axZTnvLhWRbfdvBGTv53IjXCuJYnMj8FQOHa0uMlQuAQco2t+TQ==
X-Received: by 2002:adf:d1cf:0:b0:32d:819d:ec75 with SMTP id b15-20020adfd1cf000000b0032d819dec75mr1758594wrd.60.1700136811239;
        Thu, 16 Nov 2023 04:13:31 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/6] automation: add timestamps to QEMU non-smoke x86-64 test
Date: Thu, 16 Nov 2023 13:13:06 +0100
Message-ID: <20231116121310.72210-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116121310.72210-1-roger.pau@citrix.com>
References: <20231116121310.72210-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/scripts/qemu-alpine-x86_64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index a1c41c030a47..8e398dcea34b 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -68,7 +68,7 @@ cd ../..
 cat >> binaries/pxelinux.0 << EOF
 #!ipxe
 
-kernel xen console=com1
+kernel xen console=com1 console_timestamps=boot
 module bzImage console=hvc0
 module xen-rootfs.cpio.gz
 boot
-- 
2.42.0


