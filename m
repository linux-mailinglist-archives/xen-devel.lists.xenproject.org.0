Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EEA7F7208
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640516.998866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TkC-0005f9-RZ; Fri, 24 Nov 2023 10:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640516.998866; Fri, 24 Nov 2023 10:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TkC-0005br-Nn; Fri, 24 Nov 2023 10:49:08 +0000
Received: by outflank-mailman (input) for mailman id 640516;
 Fri, 24 Nov 2023 10:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTU-0006hy-MZ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acca16f6-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:49 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so2450252a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:48 -0800 (PST)
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
X-Inumbo-ID: acca16f6-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821908; x=1701426708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+aQuxKjfQGzFTZoazT2PEhCRLSw5p9w+6+GEIbGRQE=;
        b=dR66v/Ky2iaNX1EUxZfWCloAZ8t0HeaJ8HzOU9hxBXeBdE9Ygmh9uIqKhXLWF7xzJd
         UA8INshW8w+PPoIvUfQU0JrOJnk6XWZ2hapRcvYqaXcfciV/8DyAwHu+7BjWwCEFhvxt
         al/yjdjfANn0FTdo2RbOyxi9SAEL6jU860gEaTpRE97i1CUhaWuBVOHc8FXbL0vj1gq0
         9b+MJi1D3LdobKqu5d16oOvZprI9jKbC3g9bvAWrblxhpMOjWvzIKjzYeQglEY367bD0
         lygKsWrjXlWt6h5vw9vmh6IT/V9aBbtcvL2qyVmHs2EHBSfpBrnVbGt/lByBB8XR1x/u
         zfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821908; x=1701426708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+aQuxKjfQGzFTZoazT2PEhCRLSw5p9w+6+GEIbGRQE=;
        b=P5k3YS4WvpTx6HASkg6GyKdovOyzmLK6K3cruLq8srhX/BX/B+oahxYIWp/vrrb+KU
         JK8LMdVxZ75CnNdkkJr1o1K194xlBKG/5lAw+PKxV3LEOirqgZiSK1p9lbBRLxfbRpXK
         vn8iX/599l5WO/tptherfUmN3/7sNjqhiAlWdn9+uCqe9aG0KlNHCuNOB1oPrCOQeBGF
         IZ1OW/c3faTxYphHICgoH37izrz6nJSSMzGSK9Si1ZWExx1PhVEqwaYkLKXNFdCgIrgo
         rlcriSxNXJlG295zuS4OATrNNcL79MblBesbRduso6iUqEwMe/t1Bti/b0N/jAv+jvWR
         OItQ==
X-Gm-Message-State: AOJu0YxVlNbA2bJSrrSswKQIY3jjBjk9BrFSWAw40UfWgaEuLliU4Fr8
	mDPAW6qq932y3d0Oh8SMvU7VJg15FEy6ag==
X-Google-Smtp-Source: AGHT+IFwI0S4Mg/Ep/Heeyi1TtpQWh+LY+imflpzU/xVjPVSNoFn/noZ0fiWhCkbkZUdq1gr+BwP7A==
X-Received: by 2002:a17:906:389b:b0:a02:1e8d:b94f with SMTP id q27-20020a170906389b00b00a021e8db94fmr1568595ejd.57.1700821908613;
        Fri, 24 Nov 2023 02:31:48 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 39/39] xen: fix compilation issue of serial.c
Date: Fri, 24 Nov 2023 12:30:59 +0200
Message-ID: <6e1f19de1e8a276d487e8517810da3e8e68104ff.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following issue occurs on RISC-V platforms:
drivers/char/serial.c: In function 'serial_tx_interrupt':
drivers/char/serial.c:88:9: error: implicit declaration of function 'cpu_relax' [-Werror=implicit-function-declaration]
   88 |         cpu_relax();

cpu_relax() is defined in <asm/processor.h> so it was added
an inclusion of the header to serial.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New commit introduced in V2
---
 xen/drivers/char/serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 00efe69574..35df58fe33 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -13,6 +13,8 @@
 #include <xen/serial.h>
 #include <xen/cache.h>
 
+#include <asm/processor.h>
+
 /* Never drop characters, even if the async transmit buffer fills. */
 /* #define SERIAL_NEVER_DROP_CHARS 1 */
 
-- 
2.42.0


