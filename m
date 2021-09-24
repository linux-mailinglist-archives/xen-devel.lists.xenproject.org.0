Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C493416F27
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195065.347545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThgB-0001pj-G9; Fri, 24 Sep 2021 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195065.347545; Fri, 24 Sep 2021 09:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThgB-0001ne-D1; Fri, 24 Sep 2021 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 195065;
 Fri, 24 Sep 2021 09:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqZh=OO=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mThgA-0001nY-Av
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:39:38 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 010ed95d-f68b-4f90-983d-4912a67057b2;
 Fri, 24 Sep 2021 09:39:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i23so25587473wrb.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Sep 2021 02:39:37 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c185sm8256519wma.8.2021.09.24.02.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:36 -0700 (PDT)
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
X-Inumbo-ID: 010ed95d-f68b-4f90-983d-4912a67057b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
        b=bfJDRUtHlsDizMGatZPk963VYYfAkBfTjsNmiwj/ymhx0kRc6VMLElf3zBqxnARhDn
         lgmgbrEhIGHtgHu/8x+tntzdV2SngC2qWF2GAwfvOtMhG+V42rxSWucJiP7xIrIGReXz
         l5t9jVP65mPF1GmicTiZGk4oLjys78iV6BtOhMY43Z6OA7grVc9JwzvqRzjqVuuxwUkC
         i1rYTGO8A5FNd3Xng6BsOrIPE1h+jG56FVJbFE/XhtVgUXtuAxE+HmINDUE2vF+hCr/y
         7CIfaAlsit+sLqNVs49NVF94QACZCvY/8QbD4Llhgxgoqiw1AsyONwYLBrR6BOTi/Z/H
         7hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
        b=M7lugumHkhZfDGtaKlcUfzmC7ap7BhxGMMj2hz3CFLvP3nBzA8JxpQeC0xT1NSfTYq
         PJajpvLz87D7uTxH4wafv6SZL6tTkQYnyB9KFGRlmo1vPB86iECK5HkB7vPj1YqfYT3x
         PT35d3LBWIFfAZTboZZ9Jt6CDo2OmkT9JN1qLdhZoF1Ynqe5qHtEOIs4YHwrow7W3mik
         bh8kfRGnKJkZTGwiQk85DXZMrHe5A34qlD0Eud9stmc3C3dYd7ElxZvX3fIr2qT1Dgax
         b+LAsdmxzlNI0xYjfJCQWAxsU4lka9QeJUD0M6mKgsFfrYuhAmTMUhecxVBsHgVpf2qS
         6w/w==
X-Gm-Message-State: AOAM53249hKo6V9hY7ZSvMssZxW/WZ3nzjQAZgqPu2B6jqbrpSCAdHJa
	UX3K14VNiD2JBmnHFx1smEI=
X-Google-Smtp-Source: ABdhPJzv1Bde65pNl0VvYERfNs+TTxQ5croc4mEh0wp0bxdkKK3MHRcKkC10fZSBqwi13saNHJwzfg==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr1077703wmi.60.1632476376611;
        Fri, 24 Sep 2021 02:39:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v6 10/40] accel/xen: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:17 +0200
Message-Id: <20210924093847.1014331-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
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


