Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F350BF2411
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146537.1479013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH7-0006Av-Bo; Mon, 20 Oct 2025 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146537.1479013; Mon, 20 Oct 2025 15:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH7-000606-2n; Mon, 20 Oct 2025 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1146537;
 Mon, 20 Oct 2025 15:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH5-0004DQ-2V
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982e4fa1-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:18 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-63c31c20b64so5172609a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:18 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:17 -0700 (PDT)
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
X-Inumbo-ID: 982e4fa1-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975897; x=1761580697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6BAq3H0KqE2yjNiry0QdQgxMPMOFJPPmMH3FkExtuw=;
        b=Vt37kjDVBC7ac+59ZZRb+k9OR+3aT46+U+XMVfRZKEt09wIcUUR8j1Q6OYkc2isU0f
         bI9oTR5PexfONaRbTcyh85isa18kY2ZU5e+zqta9ae3UzIR7ZaNDTq9Ua6glHYJtOL5A
         +rP4tSY2h9oyvpUun6cXBLICHx3cB1PzGvSiRZS9kyFO1xh7rkDUCakWruYWAy8NTwA2
         9zmVF1pe4d62UfAXC0lhfuviQa2M0NOUrQCoevA1AEScLyPulUOGuImbjG59zoUtFTtR
         GfPOsJIp/3siohdxBYFK4Wog3ojrkZ85yNpd45ynr3Dz1nlktJ5T+LSSL0475l1JU3Do
         1VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975897; x=1761580697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6BAq3H0KqE2yjNiry0QdQgxMPMOFJPPmMH3FkExtuw=;
        b=PKEQ33ypcX0lkJ7WTsJmLMJx/xzY2cvLgRgM4ydBpTf9S36gqxswy6EVjvxKwDXqeN
         S962qhVzS0WSZa/GY3h3bEtlJhTSd4RwMoKejCXw8vcD/piNZWzKTYjLs+PndktRXAP0
         rAsKT+V11i2mLCtuJiVn4PjbqfrIle3FrUQgRzOs5j3F+A9FwAziCTurx8l/K/ZxnwvS
         +mgp40/wdux6HIhbSQ35bvo2MWV18LY9NvqEs48fwzu9AZtVKTd29hPZrhvVFVQB1E96
         rnymaWnP5vq6B4oIZAGAIrGRGfShVVAnC9GMFxk+zt6k5UNzjaN+zfy5A6F0cGeqhcux
         +VZg==
X-Gm-Message-State: AOJu0YwVs+loHGqfVa5rXYC0ru+kycetvuATHLuCqwo/H496ZUPolZeT
	iZAL6xLbHfZq3mkJlA1C4/Y3opvCla446EO5gytVjh2xcxk7XSrcSrvvgdu1fQ==
X-Gm-Gg: ASbGncufpInSw/hfH56PV9Gs1zceOWtb7vfisQFrldCXQ9hq6hXP+8DGwnUDifiKB10
	kxcrI5B67JvxGGxxacZ/st1NdOUkTg7YX+Ti0de5nJvVPTDwjbzS46PuJ56SVON8OoW+Udv4tkC
	v+/JYbVHd56av3v3Sn23uR8NsXDTYtgZHQQN1Coqa0jHqpfctCHQe9UPTrAdDO3VAGmNg+tmEEI
	oRU2Se3ujwfV+/c3s5ECtFa6WpyRlVA6KckOv5EMd7Y4cczIiqLXzZTeLAtpgtffccqCGNinsgN
	X59dolVJfHx/zhTqYJIMnmV811XuZ0bKYWFMLV//BSwk+8eRzl62FHVEhQSDXIwUNm+Q0RS//nl
	decynkAuVrP8BqeEMV0mOkm7HQtNEtTePDU2lxbKw7FHzmRSdQtRiducfZ8tO4Hplw+UEDBDNN+
	tjQ/3iXxXIdBThmolPevSnUbReya+5KVE5721Y+D4M8NiAcow=
X-Google-Smtp-Source: AGHT+IFiZ7nj4wU6MknH+3QUfh/hnhNU+QAzJrXYZzJn1FzMXfELhNoZQK66Qe7EBad08EhJquSbBg==
X-Received: by 2002:a05:6402:144e:b0:63c:2d6:f471 with SMTP id 4fb4d7f45d1cf-63c1f6e047cmr14844618a12.26.1760975897467;
        Mon, 20 Oct 2025 08:58:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [for 4.22 v5 07/18] xen/riscv: add new p2m types and helper macros for type classification
Date: Mon, 20 Oct 2025 17:57:50 +0200
Message-ID: <ece4dc97a40a8da06f46242ae7dcc1ce6bc20947.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_mmio_direct,
  p2m_ext_storage.
- Added macros to classify memory types: P2M_RAM_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
- Introduce arch_dt_passthrough() to tell handle_passthrough_prop()
  from common code how to map device memory.
- Introduce p2m_first_external for detection for relational operations
  with p2m type which is stored outside P2M's PTE bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Drop underscores for argumets of p2m_is_ram() and p2m_is_any_ram().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Drop underscode in p2m_to_mask()'s argument and for other similar helpers.
 - Introduce arch_dt_passthrough_p2m_type() instead of p2m_mmio_direct.
 - Drop for the moment grant tables related stuff as it isn't going to be used in the nearest future.
---
Changes in V3:
 - Drop p2m_ram_ro.
 - Rename p2m_mmio_direct_dev to p2m_mmio_direct_io to make it more RISC-V specicific.
 - s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
---
Changes in V2:
 - Drop stuff connected to foreign mapping as it isn't necessary for RISC-V
   right now.
---
 xen/arch/riscv/include/asm/p2m.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 85e67516c4..46ee0b93f2 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -64,8 +64,29 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
+                           PTE_PBMT_IO will be used for such mappings */
+    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+
+    /* Sentinel — not a real type, just a marker for comparison */
+    p2m_first_external = p2m_ext_storage,
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_io;
+}
+
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t) BIT(t, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
+
+/* Useful predicates */
+#define p2m_is_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+#define p2m_is_any_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
-- 
2.51.0


