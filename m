Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07051BAB4C0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133433.1471550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkA-0006xc-CG; Tue, 30 Sep 2025 04:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133433.1471550; Tue, 30 Sep 2025 04:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkA-0006uP-9c; Tue, 30 Sep 2025 04:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1133433;
 Tue, 30 Sep 2025 04:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rk8-0006tq-Qp
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:13:36 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d579bb90-9db3-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:13:35 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e5b7dfeb0so907105e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:13:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm20717307f8f.17.2025.09.29.21.13.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:13:33 -0700 (PDT)
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
X-Inumbo-ID: d579bb90-9db3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205615; x=1759810415; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6r7ywVdtgg6puBO7GNeh9QBn+ePwbPPQeAATrRMKjs=;
        b=fVZPoyatAZE+MTsGz82hLPW8a0Gx8jGqMC9oMt118ArZSHvZhmHAbNgx4uGYiGyYZP
         C+o2JDUTR2Aly/f8G8YtihJs2MQGhvxg7bSAbElIDweo3nx6VUPl9Qgz7J5bopEebFEx
         gcNtZZ+fbdh2dLEiLyqrCZZZ0IEx3HKsjny9DeFPqzfh7bRbFY37vnXJtQmA6Vp1wOyB
         Ct+Wke9VSFlBwb5w2aVN59fVs5afq6oPpeNHlP6AmAvw6s42e5uzYumK1hPND6fj7mxy
         daIfAUlfbAdh4e1zkREAB0MykFWbwKU6oedkfXXLdRF40+/jtdi56Ei7HxafbH6OH96K
         0n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205615; x=1759810415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6r7ywVdtgg6puBO7GNeh9QBn+ePwbPPQeAATrRMKjs=;
        b=lZ6TxVscdMyHXY9SofpVGKRj8RBd1qXBLGeecTvK/venXUrHEmapQHq7nc7/5yXts0
         wyKVogujR5YqCpodWi6+PJun4xM41F8vf1KTK1vgWjzXHcHHwOhVrRhCAluMM7saEWwn
         1dpTm0gFwFKrXhAnDLv/RG9Ike5SrkET3/H7jdSZyVyXodItQQG4wbruT3jBt9Vgc9sy
         yHn1U2qtM/iaJBzrxAjp7ARwdP3Lie/17mP65SdQtCzVFda9L5PO/6R7qlV1vuPAcAen
         /KDdmL0Af7reFCjI/im+RDMfpG2FWKyjYgaNuMlyZFHS8rFuf6F890Vi2B6gdqXzSh5W
         MWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTfrkXUgzN1L34C4q6IQy4jI78Q+JF3o0t7ybsu8jrNGKaYbQ0w8SIkxCEiiDUkC0y1Gi+SIGzWEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQEjICHiDU/alQq6JbTdo905cFLQBVpq4PNtoGlyCWzVHR3/6e
	D5n5DrvyQWrLD9WAotAQWZnxXoedc+Fqqa3Y4M5ILVfX1jh01wLQ22c378YB1qpuIkY=
X-Gm-Gg: ASbGncs4x8EDvmDVHaKznAUYZizODYWhi47eBcOzxkm1n0KfgzrXs5iThJ2ECm1ldBn
	mAIGR0FyTzbG+Z7kjoTzVAQjxDHUGt2yG/Z4pbVUh3HAWtooUn6zohs+6FagvM9xOH4X5GcWdnw
	BUYZ0Q7148m36TstqTdOV75cBQACfWScp572zeuqCn0/ZkENKSpk9xMR1byZz+JePijpbhJDDtm
	IF1t7LgF4xPsoi58T6GI/lY5bRKHGOGWBoJQncPdkMRRE9LLPQvvZh2/pzolp3LyrIm95mQSykQ
	2079RJ+UEK0yI4jdFRlqUoWtRAF1JPe8huf02uqE8bmY0nBC/V0NsIp/abbz1tVHA6WJFTJ3n55
	AsOdU85Vqq/z9fc1QHaHPF1fursgyWi1jTcZrKyAW0fC7SDAVwfPIlFOqWSf5Mit/gn6S1TC+te
	1CL8VWW/xgaiuK//cP1XHYjLXcu4tM2/4=
X-Google-Smtp-Source: AGHT+IGBpgGcnWw+C0SOcyJxraGAzm/jw0VAg2sebXTPvNY3JrfVFmYx+CN+ELmzscd2IQVrEVRZAA==
X-Received: by 2002:a5d:5f54:0:b0:403:4b6f:546e with SMTP id ffacd0b85a97d-40e47ee04bfmr14022629f8f.30.1759205614864;
        Mon, 29 Sep 2025 21:13:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Eric Farman <farman@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 01/17] docs/devel/loads-stores: Stop mentioning cpu_physical_memory_write_rom()
Date: Tue, 30 Sep 2025 06:13:09 +0200
Message-ID: <20250930041326.6448-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the documentation after commit 3c8133f9737 ("Rename
cpu_physical_memory_write_rom() to address_space_write_rom()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/loads-stores.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 9471bac8599..f9b565da57a 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -474,7 +474,7 @@ This function is intended for use by the GDB stub and similar code.
 It takes a virtual address, converts it to a physical address via
 an MMU lookup using the current settings of the specified CPU,
 and then performs the access (using ``address_space_rw`` for
-reads or ``cpu_physical_memory_write_rom`` for writes).
+reads or ``address_space_write_rom`` for writes).
 This means that if the access is a write to a ROM then this
 function will modify the contents (whereas a normal guest CPU access
 would ignore the write attempt).
-- 
2.51.0


