Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F539BAA4DC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133115.1471294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgM-0000zO-OX; Mon, 29 Sep 2025 18:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133115.1471294; Mon, 29 Sep 2025 18:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgM-0000w9-Ij; Mon, 29 Sep 2025 18:33:06 +0000
Received: by outflank-mailman (input) for mailman id 1133115;
 Mon, 29 Sep 2025 18:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IgK-0000iD-Sw
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbcaa35d-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:33:03 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so49025485e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc88b0779sm19057657f8f.58.2025.09.29.11.33.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:02 -0700 (PDT)
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
X-Inumbo-ID: bbcaa35d-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170783; x=1759775583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8vf9ta3nqwm/Fyb5G7ZjHvxKsRPPnP+TTAqHaMFdKE=;
        b=BxFF1A6aSFT9Lh5ufG7ZKqr/zqzAHro76dWDLVcVuNzi4LROc/uw9J+3L7AgKk0nk+
         UCB+nAbGe43nut/lMYTYkCSwlVMpAmBDlyQ1xffFBl4ddR6t/Jq4piStF7HzQSxPYjQ1
         V/bcBjImLtDVrg2kYCtpocYyey469IRA5hT6rnmp5BshoxQvMxF8fL9WByfqev+P7/lN
         s/8HRjWc+HddoGog8HL+U8yU7OqYamNa6svgOft8JnJ5/c+rPPLn2N9omt73cepGRgd4
         1rX742C5sRjhqgeIMVqtGNh2EX1NfsPF6jhBkwBLAJgD0SLOXw2hYWPCozN2hhJqphT1
         iSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170783; x=1759775583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8vf9ta3nqwm/Fyb5G7ZjHvxKsRPPnP+TTAqHaMFdKE=;
        b=kovjke9VJCd4vPIz+DpAWOhtRsJp60ZbUJusQP7yMq/YRnPCWWdZPomtQ1FEub7Of2
         v20JVYEPlDwAsoqHUUv2qgZNYLzhDQVnchiV8vmrOhZLILn1AjUD3zsXu4fRAK8H7xH1
         rbDBmhjODsVkFAjlGocBxQTQcaFP5nyXfP0nW77OQZHWX/XcUlad/Z+5WOIWALrEBuGg
         Jfbxa5vTtlIVP8rx3V8V/jTZUbzk4T9w5UH05z9dPkOyMkoIjLtnYVrN8hCGjg1jd0z8
         dTYUWnbPLeB7q0gOuBRxQDkOMWNkk/xEwhgdZKW8jJCe+mdCOxvBnl15JX7wJ6XSzHFJ
         6hrg==
X-Forwarded-Encrypted: i=1; AJvYcCXIt/4eSobyfwv0UCUHxpN/CfVqe+f5f7Sb+h2RdjbzvbXNyp7irGQ/XENpM1Ap7Ez3uI7Mjrr/dv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK3QWg5gSwN0fy2U3PZCYxmqnLlb27Cwwy3WCTM5LQ4Om3YwoY
	xIYUCzO09Ck3GW/tTib0oQgRhVCVa438roAb++QXpi4j/z6M1yHo+zT8UN91NIy//lo=
X-Gm-Gg: ASbGnctb3xQnPhl0p5yZNXT2YGRggXtUPcqK5vbUph8Yfo8ZhwWM9s8wgR+Q87ZkglT
	KiXfpIolviWs4QX+fO+c2cpwl4lzpPTvXHBSB9T8LQyTgsbSEqc5R9HNt9v1Bc8mpqcwjOpLUqw
	OruL9NXQuL7rr3MH2dcc7eanabT4Tu3MJ1NENAemOTFjvYwSmH22/weNpzFG+gB22NGoFA0ZoHy
	s7v3gKCjwJ36pHsyRlGRYGIoqAdkAdvSWr1V0bXG80FRtnqFfzwdyxfym/x8elhh7MDvL84f76y
	lUxbLNzUTZOekBMVRps6p2ZbsiArS+oOmq4dITi0eLb93uWEzST885oWClXvyX1fdUnSQCjrexK
	7/kn3rMy8yxFFKGCIHxn+uScFWEwxTjhYqOwOam2hsT2n/2MCMmXmqfGi0L6MOrbtmu7oqxV3GY
	Qph2KrYUk=
X-Google-Smtp-Source: AGHT+IHvn5eYPMtDO5pcLQu1/TqV9ktVhW1E6kH/3j8sdOMbTO5qR8/yD6k9KVyFZbMuU0yLOSpWPQ==
X-Received: by 2002:a05:600c:1508:b0:458:c094:8ba5 with SMTP id 5b1f17b1804b1-46e329b62bcmr112008465e9.12.1759170782675;
        Mon, 29 Sep 2025 11:33:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	Eric Farman <farman@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 01/15] docs/devel/loads-stores: Stop mentioning cpu_physical_memory_write_rom()
Date: Mon, 29 Sep 2025 20:32:40 +0200
Message-ID: <20250929183254.85478-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the documentation after commit 3c8133f9737 ("Rename
cpu_physical_memory_write_rom() to address_space_write_rom()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


