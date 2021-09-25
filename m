Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068B4182E2
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 16:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195895.348761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mU925-0006AT-OM; Sat, 25 Sep 2021 14:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195895.348761; Sat, 25 Sep 2021 14:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mU925-00068L-L4; Sat, 25 Sep 2021 14:52:05 +0000
Received: by outflank-mailman (input) for mailman id 195895;
 Sat, 25 Sep 2021 14:52:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVfW=OP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mU924-00068C-6Y
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 14:52:04 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61fdaef3-827c-4cd1-85b7-902ff9a5ac01;
 Sat, 25 Sep 2021 14:52:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so36384886wra.8
 for <xen-devel@lists.xenproject.org>; Sat, 25 Sep 2021 07:52:03 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 20sm16920479wme.46.2021.09.25.07.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:01 -0700 (PDT)
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
X-Inumbo-ID: 61fdaef3-827c-4cd1-85b7-902ff9a5ac01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
        b=G+GmU72zjpBNcQjaJkUxR7Hm9Y3LE8KiQt/SI3NeS6OLKULhwLAVtEcL4ZDR0Jag3I
         9Iqu7RniWGbPuunBaeHSb4uaOW1HdC2SIyhodow0oCFW0XZoRHzN/zJPKDXAUsrTJYbM
         o0tDzvkIczPzHnDbHc0znNPAZVEXTt+qBGmRo4pyGYCa3HQJ83meRkO9SVxoKlo9UeJ1
         nIqgFF+VvYvmGPzkpUox87plIThC0qe8NZE+3Q2d5FskCrFpydmZtE6Xb6AqInYZwrDa
         YbNDzLTFdcU1ZqZ6fDRMfqsaJAvDTGh4DXeDd8S8Htmyi/O/u1OIGLRJSsN5WaOPH7nW
         CM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
        b=vpm4cmKuEvDdDmg1kuVZCviZtheNJwTXkpbc+2fDO+Im3qkle+dytNAKZCDHDvJlTb
         64QB+HavPUmiSSEfcwn+QDvd3QXs+EO9ppjxAVfiWggupMWZXOCvnpH0LZJrecQvFUhJ
         aa7TnYI2wRMo6bv/fwpSCeg1TDE8aCpPlNKdGD18i0K2Dm1WWEaVT570yRP86mNLVlHA
         Ev5CmzDoLpjKrhNf12ZrxHi2MEypg3xxJsfuTem1Uq+Nko8K1iO3zzr5kbd37f8UtElN
         gK7aKpC2KcEwEMCKpW+VquqWomR3TKZkzTlhCW/jVHXaw3DSGuWm4UVK5zAflMvBHdbZ
         AzOQ==
X-Gm-Message-State: AOAM533lSP+zVBvYtXxzYt3lGOcgv4ts3GaspoDuTtp5uU3enwnFrGOZ
	4UkEdqjb1YbmZ0P7HI2JumA=
X-Google-Smtp-Source: ABdhPJzkjnLgo6lRvy/ft690imOHBkl2yBKGxN4EX4PM++nl4LReYCioSoopkYZjVGMaG0ouAce+jg==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr17319095wrw.289.1632581522279;
        Sat, 25 Sep 2021 07:52:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v7 09/40] accel/xen: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:47 +0200
Message-Id: <20210925145118.1361230-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since there is no specific Xen handling for cpu_has_work() in
cpu_thread_is_idle(), implement Xen has_work() handler as a
simple 'return false' code.

Acked-by: Paul Durrant <paul@xen.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/xen/xen-all.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..fe5a37fa2e6 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -215,11 +215,17 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static bool xen_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->has_work = xen_cpu_has_work;
 }
 
 static const TypeInfo xen_accel_ops_type = {
-- 
2.31.1


