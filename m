Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD7BABFDA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133829.1471885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcD-0007VP-WA; Tue, 30 Sep 2025 08:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133829.1471885; Tue, 30 Sep 2025 08:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcD-0007Q9-R7; Tue, 30 Sep 2025 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1133829;
 Tue, 30 Sep 2025 08:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcB-0007Nm-SF
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:21:39 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6cdbe9-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:21:35 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so4950395f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:21:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm21770765f8f.8.2025.09.30.01.21.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:21:34 -0700 (PDT)
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
X-Inumbo-ID: 7a6cdbe9-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220495; x=1759825295; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6r7ywVdtgg6puBO7GNeh9QBn+ePwbPPQeAATrRMKjs=;
        b=gyS8IQ83XQePL0dmCrxB+R3Bmw9kUZDIfcsteCVOK8lm6GRlqlmiw+Mf7C0Hz4I55t
         ylbLgBdrh2JNCagOn0TJVnkcvwIQYzkrza5CkyTlLmEwcdi2gDaEQ7ngmjpfkt2hhdB6
         SdEOejxAzSy8xMTTbQibEhl9MgIw4rrgRKMCceHyhlUt8cycWE8XLW0OY4i2JeIIddC6
         8jxyPu4x1Qtm8w1iWQ/rVhKB/pqcQMGqN4Iek6paE5U7P2vmI8/PdlpjTpfPjIXKYZlR
         WEDCwYVIhhTljiE7qIz6xgLk0hbvQ9Bxv/JuWZvuyVY+ygHnUuwAYsklPAGV1qubJSsX
         U4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220495; x=1759825295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6r7ywVdtgg6puBO7GNeh9QBn+ePwbPPQeAATrRMKjs=;
        b=DE91NMU7iWi6eyGvKkr9MCaPg6bBol+QPSdbldESQ1qoSW8JrdqUB4KzsDtMJAA4IW
         R6pdAv42CIVug8HErxivmeR5kGMTkkmBfTkIjvY77cR4NvGpbfw0jm18g8LoV4se1vph
         G+UvcFC9oRHWYTaNUcjo7ZOteQ//nKrlY+zNqnyTfJBjoUYlHQzuA/yI+9Rr6HyMN8+e
         8CpbFR71WcjFZCO5VOyANQDIYXqtSXFaZQtrO7jbl3ih3GiGD0Fl/MmH1LdunhjNsz2L
         XySksmSwGz5PGYQO6pv0g+4T7ftkTSr4mhToXM3xxfAC0rvHJdQztPy/wy13atmgYMzv
         ApeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2L2ueVekOZ7zkzZOc/DdIzyTUPVB+FgVdKrXFuSyEUdCkNAp7GqafVN4ckoA9bWEIKDYIv54Y2Uk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOQgC2pCXWPuPzcrYgheJrqK01vloJpCoIdVjXVOEDAcZdnjto
	mRFPCqcR/svm8/3aR2kw+6cqIce2CPYLLRHGXKrAnZ/eZtP+0ADqvGdLaiV1RQ/biZk=
X-Gm-Gg: ASbGncv2LJ9yqlPCu21VYJw+gPGrK1CB6LMXNezDFKEU3RVlMiMvMlEUzQTw6C3jdLX
	TQMXxo3S/6JUALD6PURcTEKF7iB10wQBxewzokqqmcbvHZy1zwIv05cBREq017a3GYckXBzHxGt
	Kj6dcuiVVimBngimIjl9OuYrM/kguaBlrjkRY70ftQ4I7KPlYrnQ+g3xunwALOfKQaVgYP+9DDx
	VouVSJy/Ei3m2P950zlb8HW/p2Y9bW7AVN9fvDUixTurJTl+JlIqVzfq/M7YBTFET3VXgb72Y+q
	LF3oHW40a4kmSBAVCsVchYJn+YQ+4wLLx88NBE4HCeRMboVik2wMvQ4Efrnlww4NPcrDsc/Nlsy
	pMN3rRksr10us8wReYgYrjfjlrfUlYptEd7PaRn0evOb5d62rq+yhjblA68cYHy/TaADXNEHCT4
	1BsDkwfDjnNYO7bVgNxOBB6JX6dFa86h4=
X-Google-Smtp-Source: AGHT+IFpI3GL5cse+8n+ih1oF0AV0V9hqADSW+14D/yEjGe7vAb5o0N9WY3TIiFao6rN6HuitLNGGw==
X-Received: by 2002:a05:6000:2089:b0:3eb:5245:7c1f with SMTP id ffacd0b85a97d-40e429c9c58mr19095049f8f.2.1759220494580;
        Tue, 30 Sep 2025 01:21:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v3 01/18] docs/devel/loads-stores: Stop mentioning cpu_physical_memory_write_rom()
Date: Tue, 30 Sep 2025 10:21:08 +0200
Message-ID: <20250930082126.28618-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
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


