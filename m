Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D854E5748
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293997.499673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4d8-00062h-D3; Wed, 23 Mar 2022 17:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293997.499673; Wed, 23 Mar 2022 17:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4d8-0005zj-8W; Wed, 23 Mar 2022 17:18:42 +0000
Received: by outflank-mailman (input) for mailman id 293997;
 Wed, 23 Mar 2022 17:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4d5-0004Zy-Vq
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:18:40 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475d90b2-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:18:39 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id n18so2155934plg.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:18:39 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm342070pga.36.2022.03.23.10.18.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:37 -0700 (PDT)
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
X-Inumbo-ID: 475d90b2-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bDnsp64dy23km8dL17HIpLYraoqdROmh6JM8WZ9QnxQ=;
        b=TgUmKBfMFNwRucBsohiY5JY8e9ioh62vGGPA59RsGbh//g7DqYEp6Ab52+czdRAyY8
         NP7JPeqO100BsBFOc/Ay4dhLNWNwRFNW03vJZd3riU8UJJWvYnCfPYB4pocDoGekJKUT
         EzAgZEJWkWoFt7AzL3aW+DcXjjEkdSBB2D7fwnNkzE01zFwCOgVJ7C0f1jNlgcaaL4GN
         MhaEpPpi7sWKWo2nMSg2I6MHW3HNXf4tqK4IqiAVB37OJeIwt+hp+9OnIiguj3TblBIw
         fUkPOD4SvMNhJbqs6CnecPk4971sAW1ktFQ1pBjZQ9c/VJNicw0UzYoWQqC6arJevJXa
         g6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bDnsp64dy23km8dL17HIpLYraoqdROmh6JM8WZ9QnxQ=;
        b=fbqV6WNR+FPinQ/XW/6doC3D1nuV9wYXRFOTJR+sAeLaFABbxMmhxyCmA3Bi9G04tu
         86NzRjuyMWj1zX5jynj88mkbqyBY5+DkBJB5JbkKL7N8XlLM3jDa/lk7hULidVo/q+8B
         BpGKEwKrlXbQQdR0pxEKS4RnL5EgxebgSX/ph3ZDBOqNZfhUmgu3Eg3BqTXncnoCka6D
         VwCvVxklHIqnsy1DkuQU450Hiz/HkXFQSnlITUePzILRkoYFVmsPuU3SRCyHxkPOYHFB
         q66u9rb0szn9ea+K4jyuayESbtwO6zemzE0Ic2HfiIidUaAGprrzOYSsyGJuM655FGAV
         NGQQ==
X-Gm-Message-State: AOAM532u0oFQqaJGWcRgOqyqYUZ5Bkcv77PRVrKBiQBNqEI+/DEIYRho
	WvU94JxXiyn9eusWJncvHXM=
X-Google-Smtp-Source: ABdhPJySoRv6SjqjiKCV5e8zH/IZey9o/1x0EduXwu4cNLj3RBjr1JlgyWZQVPeGljHAEFYooB4q3Q==
X-Received: by 2002:a17:90a:19d2:b0:1be:d815:477f with SMTP id 18-20020a17090a19d200b001bed815477fmr804349pjj.23.1648055917873;
        Wed, 23 Mar 2022 10:18:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>,
	Mark Kanda <mark.kanda@oracle.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v4 03/13] target/i386/hvf: Free resources when vCPU is destroyed
Date: Wed, 23 Mar 2022 18:17:41 +0100
Message-Id: <20220323171751.78612-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Both xsave_buf and hvf_caps are allocated in hvf_arch_init_vcpu(),
free them in hvf_arch_vcpu_destroy().

Reported-by: Mark Kanda <mark.kanda@oracle.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/hvf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index fc12c02fb2..39fa4641b9 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -163,7 +163,9 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
 
+    g_free(env->xsave_buf);
     g_free(env->hvf_mmio_buf);
+    g_free(hvf_state->hvf_caps);
 }
 
 static void init_tsc_freq(CPUX86State *env)
-- 
2.35.1


