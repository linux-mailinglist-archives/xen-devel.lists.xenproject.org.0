Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E787664462
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474742.736065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGO9-0005R5-Br; Tue, 10 Jan 2023 15:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474742.736065; Tue, 10 Jan 2023 15:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGO9-0005Nl-0a; Tue, 10 Jan 2023 15:18:09 +0000
Received: by outflank-mailman (input) for mailman id 474742;
 Tue, 10 Jan 2023 15:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGO7-0005Fu-CE
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:07 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb20730a-90f9-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 16:18:05 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id g13so18965052lfv.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:05 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:04 -0800 (PST)
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
X-Inumbo-ID: fb20730a-90f9-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7sI+87rn5yOEodXtae6iqX6/XNkgcCetji6u3zffsM=;
        b=Wcd+e1vaZ7jCFWNGH/6ZmgG8lMqmO5xhPnKN3ktZfI/PnHoeOzqYtwbZUeK5YQQekf
         Bz4qNhSrO8EAwQih9+bzTsTAVeEmzIC9aVW4edgZNrLDVMu5nsQTnoi0MnDdYo4QpgwM
         IKV1zFPVZdfctGAafPDgpzEQrwSkQmMWNIpSk6PBpVShrD1B2JcgLwdidmx2wR0h16yr
         tceSmVuJcbWls4L16BoDbD9tsqkZHI986vyx2Q6P7KpHproyAV6Wj94ndIQ9M6qu+ZWQ
         tvNQiQutSpyc4deTvrAn5PGz1eJCn7JOjyJREbamG7WbXx9E+ZdhpH6eNaoNl8LwKgqu
         8INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7sI+87rn5yOEodXtae6iqX6/XNkgcCetji6u3zffsM=;
        b=8J26y+XR2RHbK1gRxuPFHR2TgJKmYXmDqFmcwumAEraL4wnPTAWgL/9s/kuyvOtD7y
         cLztmqosxfjQnAsUdXhguB6+aYkA7qXYlRtKSvS3bFfn/3cZ4KGdlYT+bx0scig6m7zf
         hMeQF8y3WcXZylhnmgw2euRh7YWXJ+1+6l9egbtsfoVC01B/nsW850UyRUhGhnoTWWeG
         rpOlaf4mgZ1Y6uyHA58S4faly8+DkimGsPH+gRXRsQal6es5CuFg9SsXhFPhPS8MXOWf
         NgA/h1LYYMKwXK10muIjFt6/Eark+a3oRHDUf9wEubHexqklYRS5j4l+FmIDwj+llebW
         Oo/Q==
X-Gm-Message-State: AFqh2krfKYRRxYMRYmDfuj+9qLKMkonAQX/FwCk7nWU2UFLEinn9T/pM
	ABpjwf2URQvqmbEDpnwVcdJr6UTjJTLKUEUq
X-Google-Smtp-Source: AMrXdXu6J6iJ2CHmwuWTqgPYwkvNGDt8B1Nj6qG/RDyMjRIDl6ZmqknoP7CuZmRNXuvTQOHUt8Aeqw==
X-Received: by 2002:a05:6512:b27:b0:4b6:eaed:f18f with SMTP id w39-20020a0565120b2700b004b6eaedf18fmr21721242lfu.38.1673363884715;
        Tue, 10 Jan 2023 07:18:04 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 1/6] xen/riscv: introduce dummy asm/init.h
Date: Tue, 10 Jan 2023 17:17:54 +0200
Message-Id: <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673362493.git.oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following patches require <xen/init.h> which includes
<asm/init.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
    - Nothing changed
---
Changes in V2:
    - Add explanation comment to the comment message
---
 xen/arch/riscv/include/asm/init.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/init.h

diff --git a/xen/arch/riscv/include/asm/init.h b/xen/arch/riscv/include/asm/init.h
new file mode 100644
index 0000000000..237ec25e4e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/init.h
@@ -0,0 +1,12 @@
+#ifndef _XEN_ASM_INIT_H
+#define _XEN_ASM_INIT_H
+
+#endif /* _XEN_ASM_INIT_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.38.1


