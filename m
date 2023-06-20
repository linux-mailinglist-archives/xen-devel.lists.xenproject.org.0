Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09A7372C2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552076.861989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7X-0007eJ-5C; Tue, 20 Jun 2023 17:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552076.861989; Tue, 20 Jun 2023 17:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7X-0007Zz-0Z; Tue, 20 Jun 2023 17:26:23 +0000
Received: by outflank-mailman (input) for mailman id 552076;
 Tue, 20 Jun 2023 17:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7V-0005Q4-C5
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:21 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e49442-0f8f-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:26:20 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5700401acbeso54070667b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:20 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:18 -0700 (PDT)
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
X-Inumbo-ID: 91e49442-0f8f-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281979; x=1689873979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ketisDiBHbRbLfAtb4owX6CirSCgZ560hstWukEHPU=;
        b=JV7mVW9o+DEfW49UhY6Ry0LlDSYnubxQvhH/85RSPJPv5iznjafVvKwT0WTw80NIHH
         ZzVJZ4uxnp6Hy9ouHIKN/+dUXz8k7PgDunBleGVEfPS4AGMqIIn0cN0bzuYyHyjXJt9S
         c4qjaIg4M+xIfnZlwwTV4j2h2oPsNsgCab9w5IYYB7RNikhwoAkZ7HPMhFE+Y/J6GhHn
         vL5uSRHMD7mxu/Qe0WvnyIcUII9xycI5IylaW7/BSTgK9RIqaXATKHTUBh9mjIBw2MUY
         jqGFkFdOXhXlpkyJu+qAZTjJsClrW1bOrRSiDbVFLiEPjs4JJdZo6525f4dH3VxIWXDR
         yNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281979; x=1689873979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ketisDiBHbRbLfAtb4owX6CirSCgZ560hstWukEHPU=;
        b=BoOvfSqPVu6KDIrMOKYsQYtZL4zf5Lu+PCJ03BKA5SiiXGqGDEcK7z4lOk7FNCh7i6
         c1JPwYdScUexfvxfI+ooB+86dEN6zAoGyemXlBjCCThPe5aH5FZ8pJBqZgLG/YDhjWnP
         ax4mXA/xYJsEbmCPDvN3XbOj3TLGv/nk5LSuxz8rVERJOb2h93fIqwwOkn/O15ERf/fl
         laNiWDs2pAWHyMUT9f5veAVlbo9lQvnciZDzDw+SCa/TX1R//tH9q9wjlteP18JVXkFW
         JuIk3NUahpbNPApB8kT6O2vwhKqNQsMP5uv5AswdoTsanYW/mm/5FxSBo9rfI+wiraYa
         r8kQ==
X-Gm-Message-State: AC+VfDx1ySQZOAEbUp1reIjHOX1r5qJ28VdmsIf8I1/rwLzf6cT4FVTD
	GM0tztKXNFHkBsmggXYuS5Y=
X-Google-Smtp-Source: ACHHUZ7Sy8MslonVrUjxUdWKSpd6ukF5+zxv5os2k+6NK3tmmIpKUWxcbVfweJ393p1b0WLmoKTnJw==
X-Received: by 2002:a0d:e447:0:b0:565:99c0:a690 with SMTP id n68-20020a0de447000000b0056599c0a690mr12747083ywe.36.1687281979267;
        Tue, 20 Jun 2023 10:26:19 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 12/23] xen/pt: allow to hide PCIe Extended Capabilities
Date: Tue, 20 Jun 2023 13:24:46 -0400
Message-Id: <c8295fdebb40f9c5c2af6db8ed9451e4897dbb5c.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to hide some unwanted PCI/PCIe capabilities for passed through
devices.
Normally we do this by marking the capability register group
as XEN_PT_GRP_TYPE_HARDWIRED which exclude this capability from the
capability list and returns zeroes on attempts to read capability body.
Skipping the capability in the linked list of capabilities can be done
by changing Next Capability register to skip one or many unwanted
capabilities.

One difference between PCI and PCIe Extended capabilities is that we don't
have the list head field anymore. PCIe Extended capabilities always start
at offset 0x100 if they're present. Unfortunately, there are typically
only few PCIe extended capabilities present which means there is a chance
that some capability we want to hide will reside at offset 0x100 in PCIe
config space.

The simplest way to hide such capabilities from guest OS or drivers
is faking their capability ID value.

This patch adds the Capability ID register handler which checks
- if the capability to which this register belong starts at offset 0x100
  in PCIe config space
- if this capability is marked as XEN_PT_GRP_TYPE_HARDWIRED

If it is the case, then a fake Capability ID value is returned.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt.c | 11 ++++++++++-
 hw/xen/xen_pt.h |  4 ++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index f757978800..2399fabb2b 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -164,7 +164,16 @@ static uint32_t xen_pt_pci_read_config(PCIDevice *d, uint32_t addr, int len)
     reg_grp_entry = xen_pt_find_reg_grp(s, addr);
     if (reg_grp_entry) {
         /* check 0-Hardwired register group */
-        if (reg_grp_entry->reg_grp->grp_type == XEN_PT_GRP_TYPE_HARDWIRED) {
+        if (reg_grp_entry->reg_grp->grp_type == XEN_PT_GRP_TYPE_HARDWIRED &&
+            /*
+             * For PCIe Extended Capabilities we need to emulate
+             * CapabilityID and NextCapability/Version registers for a
+             * hardwired reg group located at the offset 0x100 in PCIe
+             * config space. This allows us to hide the first extended
+             * capability as well.
+             */
+            !(reg_grp_entry->base_offset == PCI_CONFIG_SPACE_SIZE &&
+            ranges_overlap(addr, len, 0x100, 4))) {
             /* no need to emulate, just return 0 */
             val = 0;
             goto exit;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index eb062be3f4..9a191cbc8f 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -93,6 +93,10 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCIE_CAP_ID 0
+#define XEN_PCIE_CAP_LIST_NEXT 2
+#define XEN_PCIE_FAKE_CAP_ID_BASE 0xFE00
+
 #define XEN_PCI_IGD_DOMAIN 0
 #define XEN_PCI_IGD_BUS 0
 #define XEN_PCI_IGD_DEV 2
-- 
2.34.1


