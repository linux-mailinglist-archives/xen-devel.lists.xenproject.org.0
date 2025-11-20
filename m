Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A1C73A20
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166858.1493298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Xz-0001uS-E3; Thu, 20 Nov 2025 11:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166858.1493298; Thu, 20 Nov 2025 11:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Xz-0001s1-94; Thu, 20 Nov 2025 11:09:55 +0000
Received: by outflank-mailman (input) for mailman id 1166858;
 Thu, 20 Nov 2025 11:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4u1Y=54=bounce.vates.tech=bounce-md_30504962.691ef6fe.v1-4085b47ab6ed4a5fa90b0d9e1de06089@srs-se1.protection.inumbo.net>)
 id 1vM2Xx-0001P8-IV
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:09:53 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f247af5-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:09:51 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwby304dzCf9P1H
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:09:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4085b47ab6ed4a5fa90b0d9e1de06089; Thu, 20 Nov 2025 11:09:50 +0000
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
X-Inumbo-ID: 6f247af5-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763636990; x=1763906990;
	bh=GXinnFzT2Dw3AKOWRX54Rw2tJx5c93LXLNjbjR065W4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WXPBYSuj6i52fQ0MfwmD8mPYEN9b6Tpqf1ueyBthSDr7MN8IG9azC4oLv5jy6Of91
	 MBjEOuYUyfAgYeNPB8YkkV1tl5sKJMw8sgvcLE/PrGcAkdT4NQwF/wZjw8E5JY+t89
	 t+lisIROdB+uG2ZOXEdBiiCwy6eQgcbJKzIt+qdoSYHDsVCrCPPYUdOMIiGNrOVHwU
	 bcHGW0aEgviEGe2DgrO4qoMJLBSZl7aBcbbdFZd00AUPHTS2wlfdxxP8xyqVIvsvor
	 xm1oLfcCWQvoah5nMMpbppan7gj+KxYZ3uYsSFfB7k6T/VSQUt4xRYW2cwHnAN21yj
	 adE9qOGRdbvvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763636990; x=1763897490; i=teddy.astie@vates.tech;
	bh=GXinnFzT2Dw3AKOWRX54Rw2tJx5c93LXLNjbjR065W4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b623Ziwa2oYEazPE9+4uSXZCewBvlUHRmm2SNZRrH84fjppf2ayzh8xONsxY9Tnq8
	 sq7rktFs87xKbrBPQu1bgnXi/Uynev7YFZ6vX1WR4hpyId0WHIhOzcKmHvfLrgGQgG
	 ty6KdLtux5puoG643gdLoBs7RYOqZQv0ahFg494fdZBsy3H/64eKmRaujqDtlLC8hY
	 /oT132cLBpJu06njFO1ul6dr4tBHB55pHQP8cB5z7KYm4sWn4I5zEUVaYFDTMTt9C4
	 XgexWm/4j3CxM0b/Ibxj/WxbpduUn33ON9Tr6znikp2yQuwAR8cqs/CHxCide703ce
	 b7LH47aYG25rQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2002/14]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763636989083
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <7d5e25fe9c042e3e58f957c71eb2cdd51b8fc0af.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4085b47ab6ed4a5fa90b0d9e1de06089?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:09:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Some operating systems want to use IOMMU to implement various features (e.g
VFIO) or DMA protection.
This patch introduce a proposal for IOMMU paravirtualization for Dom0.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 docs/designs/pv-iommu.md | 118 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 docs/designs/pv-iommu.md

diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
new file mode 100644
index 0000000000..d2f708b3e8
--- /dev/null
+++ b/docs/designs/pv-iommu.md
@@ -0,0 +1,118 @@
+# IOMMU paravirtualization for Dom0
+
+Status: Experimental
+
+# Background
+
+By default, Xen only uses the IOMMU for itself, either to make device address
+space coherent with guest address space (x86 HVM/PVH) or to prevent devices
+from doing DMA outside it's expected memory regions including the hypervisor
+(x86 PV).
+
+A limitation is that guests (especially privileged ones) may want to use
+IOMMU hardware in order to implement features such as DMA protection and
+VFIO [1] as IOMMU functionality is not available outside of the hypervisor
+currently.
+
+[1] VFIO - "Virtual Function I/O" - https://www.kernel.org/doc/html/latest/driver-api/vfio.html
+
+# Design
+
+The operating system may want to have access to various IOMMU features such as
+context management and DMA remapping. We can create a new hypercall that allows
+the guest to have access to a new paravirtualized IOMMU interface.
+
+This feature is only meant to be available for the Dom0, as DomU have some
+emulated devices that can't be managed on Xen side and are not hardware, we
+can't rely on the hardware IOMMU to enforce DMA remapping.
+
+This interface is exposed under the `iommu_op` hypercall.
+
+In addition, Xen domains are modified in order to allow existence of several
+IOMMU context including a default one that implement default behavior (e.g
+hardware assisted paging) and can't be modified by guest. DomU cannot have
+contexts, and therefore act as if they only have the default domain.
+
+Each IOMMU context within a Xen domain is identified using a domain-specific
+context number that is used in the Xen IOMMU subsystem and the hypercall
+interface.
+
+The number of IOMMU context a domain is specified by either the toolstack or
+the domain itself.
+
+# IOMMU operations
+
+## Initialize PV-IOMMU
+
+Initialize PV-IOMMU for the domain.
+It can only be called once.
+
+## Alloc context
+
+Create a new IOMMU context for the guest and return the context number to the
+guest.
+Fail if the IOMMU context limit of the guest is reached.
+
+A flag can be specified to create a identity mapping.
+
+## Free context
+
+Destroy a IOMMU context created previously.
+It is not possible to free the default context.
+
+Reattach context devices to default context if specified by the guest.
+
+Fail if there is a device in the context and reattach-to-default flag is not
+specified.
+
+## Reattach device
+
+Reattach a device to another IOMMU context (including the default one).
+The target IOMMU context number must be valid and the context allocated.
+
+The guest needs to specify a PCI SBDF of a device he has access to.
+
+## Map/unmap page
+
+Map/unmap a page on a context.
+The guest needs to specify a gfn and target dfn to map.
+
+Refuse to create the mapping if one already exist for the same dfn.
+
+## Lookup page
+
+Get the gfn mapped by a specific dfn.
+
+## Remote command
+
+Make a PV-IOMMU operation on behalf of another domain.
+Especially useful for implementing IOMMU emulation (e.g using QEMU)
+or initializing PV-IOMMU with enforced limits.
+
+# Implementation considerations
+
+## Hypercall batching
+
+In order to prevent unneeded hypercalls and IOMMU flushing, it is advisable to
+be able to batch some critical IOMMU operations (e.g map/unmap multiple pages).
+These batched operations should be preemptable/abortable to prevent a large
+map/unmap to block execution forever.
+
+## Hardware without IOMMU support
+
+Operating system needs to be aware on PV-IOMMU capability, and whether it is
+able to make contexts. However, some operating system may critically fail in
+case they are able to make a new IOMMU context. Which is supposed to happen
+if no IOMMU hardware is available.
+
+The hypercall interface needs a interface to advertise the ability to create
+and manage IOMMU contexts including the amount of context the guest is able
+to use. Using these informations, the Dom0 may decide whether to use or not
+the PV-IOMMU interface.
+
+## Page pool for contexts
+
+In order to prevent unexpected starving on the hypervisor memory with a
+buggy Dom0. We can preallocate the pages the contexts will use and make
+map/unmap use these pages instead of allocating them dynamically.
+
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


