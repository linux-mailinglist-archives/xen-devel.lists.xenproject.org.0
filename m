Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABA660105
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:14:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472542.732806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYV-0003XS-Vs; Fri, 06 Jan 2023 13:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472542.732806; Fri, 06 Jan 2023 13:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYV-0003Sw-Sn; Fri, 06 Jan 2023 13:14:43 +0000
Received: by outflank-mailman (input) for mailman id 472542;
 Fri, 06 Jan 2023 13:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYU-0002z5-Dm
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:42 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 149870ba-8dc4-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 14:14:41 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so1913806lfb.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:41 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:40 -0800 (PST)
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
X-Inumbo-ID: 149870ba-8dc4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB3mP3saGY5zi4vniFjN+fb62F0tD8zzx/q/eV6PI4g=;
        b=dHhG0y7E8/G36jeTb3kkFqbhUorGTTD1mCXTlEOCv5nLd0t6yij8q6f2XhSvjbCHSz
         4LzUKh/1RbdJJ7qgeiImwk3EztRh9oPbpX+iJqmQgCuJY2xHs3Jqb3giU9uM6FDa+cFP
         gutliizUf4Wg24ZwSqNd3yN/cKX5mUXHtkje923o2AaxnnfaLMYg/53aRm+WB7XV95bC
         0ND1IglLWaPtvyWmqxjBvmnsy29uP6OkLA6ELEAiogGUwyvDU08UIx8tU6BBSVrsHKUk
         bOfrfqyRVJhfSD4VpvorITmB1PTLQxhnzj9KYF7wEyyyEBYF+qQXyj7s8YOnkkMMQZ1g
         5ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MB3mP3saGY5zi4vniFjN+fb62F0tD8zzx/q/eV6PI4g=;
        b=H8EkbD5Bs3MyPAC5+0dBnv88GLV9kVuGS3+EXnaXKhG5Pgecjjb3x37di/aiUJNgBB
         rxDWUjO3Up91Nq49mLD5129Q0AVtnE+kzn8KkAjwOxTT6GlIvdVedEfbpCVRf/zRGpcT
         zk4eeBgrTqh+qHATHSEQbfxdl50tjvM1qS1rf40v8xG83jYcnogGZu1kx3ObenzkfOph
         VHc20MK5z+OsEemOL1rYr/1QYc9wCAIsPOsfruHPjtxX2RtifUrPriQZ7ur1jjn8Y19X
         1hooJ0kr6kGSmpurlv2lffmnuzxwNtEIfezuQSLKrnKEL1vBTHW7tLQnPTHQd5+Rc/4V
         mJ2Q==
X-Gm-Message-State: AFqh2kpCRf64iCbwrcO5crNNwEPYOFNnTun2nMD6SosStHjyz+yn4p7c
	ObeJvLWYrjtkfDYfkk021kmDFVDgaeMX0rv0
X-Google-Smtp-Source: AMrXdXtja92B/6NXyi/klzTpbEH82FEmrjFVVSWx/83yonduRUFATBxzf42E31lSTN70xqAB7n1C+w==
X-Received: by 2002:a05:6512:1513:b0:4a4:a7d7:4769 with SMTP id bq19-20020a056512151300b004a4a7d74769mr17352068lfb.8.1673010881180;
        Fri, 06 Jan 2023 05:14:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 2/8] xen/riscv: introduce asm/types.h header file
Date: Fri,  6 Jan 2023 15:14:23 +0200
Message-Id: <ce66a86285e966700acb13521851aca5b764a56e.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/types.h | 73 ++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/types.h

diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..48f27f97ba
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,73 @@
+#ifndef __RISCV_TYPES_H__
+#define __RISCV_TYPES_H__
+
+#ifndef __ASSEMBLY__
+
+typedef __signed__ char __s8;
+typedef unsigned char __u8;
+
+typedef __signed__ short __s16;
+typedef unsigned short __u16;
+
+typedef __signed__ int __s32;
+typedef unsigned int __u32;
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+#if defined(CONFIG_RISCV_32)
+typedef __signed__ long long __s64;
+typedef unsigned long long __u64;
+#elif defined (CONFIG_RISCV_64)
+typedef __signed__ long __s64;
+typedef unsigned long __u64;
+#endif
+#endif
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+#if defined(CONFIG_RISCV_32)
+typedef signed long long s64;
+typedef unsigned long long u64;
+typedef u32 vaddr_t;
+#define PRIvaddr PRIx32
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0ULL)
+#define PRIpaddr "016llx"
+typedef u32 register_t;
+#define PRIregister "x"
+#elif defined (CONFIG_RISCV_64)
+typedef signed long s64;
+typedef unsigned long u64;
+typedef u64 vaddr_t;
+#define PRIvaddr PRIx64
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "016lx"
+typedef u64 register_t;
+#define PRIregister "lx"
+#endif
+
+#if defined(__SIZE_TYPE__)
+typedef __SIZE_TYPE__ size_t;
+#else
+typedef unsigned long size_t;
+#endif
+typedef signed long ssize_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __RISCV_TYPES_H__ */
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


