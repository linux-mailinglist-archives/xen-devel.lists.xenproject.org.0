Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FCB6B9A7F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509727.786064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc750-0001NB-8w; Tue, 14 Mar 2023 16:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509727.786064; Tue, 14 Mar 2023 16:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc750-0001KW-5M; Tue, 14 Mar 2023 16:00:50 +0000
Received: by outflank-mailman (input) for mailman id 509727;
 Tue, 14 Mar 2023 16:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snfi=7G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pc74y-0001KQ-DH
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:00:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 622dc391-c281-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 17:00:47 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id eh3so8099939edb.11
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 09:00:47 -0700 (PDT)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 mc21-20020a170906eb5500b009273859a9bdsm1320820ejb.122.2023.03.14.09.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:00:46 -0700 (PDT)
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
X-Inumbo-ID: 622dc391-c281-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678809646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fOSNojHn9ltK6kwSaP+Xc27/6RlJCA3YEy+FDCI1T7M=;
        b=hva+GrIj5oXWcDxnuoUSWkrroKxN/eIVWNQG+uP02T08/3WsB0siFclJw2glz0IYgR
         gxQV30cUje6wq6mJn4tHTXW9E6r7wfgce+RBaY6hp23pykvwWiEQFCah0LdQsBGbGGSX
         macbgnnwp+c4eV5+DT/k3qtjMZXNvOCeMRESKI6T0xMbwIJfuEubyvLn46u4YOqP+3Q3
         sEloTLqZzhjXdIJuHWA+Uh/A2Dpkfq/BcxKwQtIBuSS+Fy4ghueTk5LrEriYUHBYjiSh
         LGPXqo8uCBjdKW3y6ggGuwne/+3uZ+jYsiJs4bGnYNJ9pPq3MSViLtxdLHEPZyeLN33m
         IAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678809646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOSNojHn9ltK6kwSaP+Xc27/6RlJCA3YEy+FDCI1T7M=;
        b=BXa/0dGXrEHbdciPBEFHyFA/Nk0RSUgU3oHmKXIWZsOsl0BKuK3ly+K0Xq8IjN1KAu
         T9Yfkd2ddoOyxikUNWyZTBAUCVQmccU2NRPAJyYicchreJ0L57uk2nDpBqTeaYKYfQ34
         oFrf4jA8dmobq6L+bGME6MFn+DrmWVYCwu9/vb+rxDaQKmu3O5r7L5ZA+r8x5O2agjfn
         uUXnehDZztdGTBZuph6Q1kswQLn7AbCmLrx8EOm3EWKXDk47g8WrlXRIdzHVozO8enIL
         FF+zfJznLDOU0aT8S9Ds9JdQsm9TvzTZrYclDbTg74xw4U25jCrV6detqL769NfDdVrn
         tgxQ==
X-Gm-Message-State: AO0yUKX7wDKPtIjF5wQOm4Uvn/OMocFj0kjksr9zPocZFAid7TI6AgpP
	DzkfTlp+Q7B5lidUXtDS/N92x+uPbyU=
X-Google-Smtp-Source: AK7set+hjCWxDo6FCFPC7d9gZ638GvZI8jJtxTF8pYXchL7FeyRurdWaMADO5NXgG/FbYVt7k+m6Uw==
X-Received: by 2002:a17:906:1b10:b0:870:baa6:6762 with SMTP id o16-20020a1709061b1000b00870baa66762mr3084739ejg.14.1678809646537;
        Tue, 14 Mar 2023 09:00:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1] xen/riscv: make calculation of stack address PC-relative
Date: Tue, 14 Mar 2023 18:00:41 +0200
Message-Id: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch is needed to keep all addresses PC-relative.

Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
'auipc/l{w|d}'. It depends on the .option directive: nopic and pic.

Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
where all addresses will be without counting that it might happen
that linker address != load address.

To be sure that SP is loaded always PC-relative address
'la' should be changed to 'lla', which always transforms to
'auipc/addi'.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 8887f0cbd4..e12d2a7cf3 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -27,7 +27,7 @@ ENTRY(start)
         add     t3, t3, __SIZEOF_POINTER__
         bltu    t3, t4, .L_clear_bss
 
-        la      sp, cpu0_boot_stack
+        lla     sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
-- 
2.39.2


