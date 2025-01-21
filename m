Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F7A181C9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875533.1285989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGsa-0001yz-24; Tue, 21 Jan 2025 16:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875533.1285989; Tue, 21 Jan 2025 16:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGsZ-0001v2-O4; Tue, 21 Jan 2025 16:13:27 +0000
Received: by outflank-mailman (input) for mailman id 875533;
 Tue, 21 Jan 2025 16:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=whPl=UN=bounce.vates.tech=bounce-md_30504962.678fc7a3.v1-ff9033a53f704e2c929778eda4f784eb@srs-se1.protection.inumbo.net>)
 id 1taGsX-0001oY-P7
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:13:25 +0000
Received: from mail187-43.suw11.mandrillapp.com
 (mail187-43.suw11.mandrillapp.com [198.2.187.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3cebce8-d812-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 17:13:24 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-43.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Ycsh36JvHzLfHCRV
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 16:13:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ff9033a53f704e2c929778eda4f784eb; Tue, 21 Jan 2025 16:13:23 +0000
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
X-Inumbo-ID: a3cebce8-d812-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737476003; x=1737746003;
	bh=xTxb6vk36SreQPSgyQdzBvLcCEpJSeagGkdZk4HqOW8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SZckJbenf0532KYIm9npEXP0Mi4W3Y8u7HufTRPKfmueyXS8ZrZZCRXBkAgaNxPVM
	 wVd6H2A5bDI047ZE1RKliaaFfyJ+0ApiCwsvfVdluNPPcYN7o5T8kcf6K+5tKsAQuF
	 MYYPmnPsEvGPHZbQqX+/WjP7hu8ThWay45oYS2mhC+Vi/fB4aBj0Yf3ZnlkmNtr3oo
	 gWE5v3jvdIbwr1jyGILVY+gnZCnbGZvRe+9D4DH+piy31MIxEy8i3nGEqSf25FmNsK
	 2BS4nkC2+rNRlSV7YrGEQ/sOKrj3++BnFd7pOXO7UtV1ilO/HoKLPEfR+ubl6MnFWK
	 UaRjgjWINaKCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737476003; x=1737736503; i=teddy.astie@vates.tech;
	bh=xTxb6vk36SreQPSgyQdzBvLcCEpJSeagGkdZk4HqOW8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FhR9N9X6KL7Wfk5wGG1WGYjWr6H8hlaefkF+61WimS/Di7cYtm5n8NKDMlM7hEN6X
	 v7hzUjpffSvEiyg4NHGWlUYdCBxCHPZWcqopoy71psZ7r688Q68WccJNnT0lO/6HQs
	 lNISCn9fcV9OQQmRcfa/3TsGfJw3YkZKAXoGUVuHvIVowHPYZEiTp6iE0e7c0GEBnc
	 DHVkJnBNFy7tSbM2uGqG5okhX+DCo4eEM4LQrXLpucJka3VqNuTzfJG7vLq6vb0vtB
	 /8Hcc0MBfiRWrtwFQ5KZ4+N/MJY340/RgPypSgLTGGZ6kBlVIXh37xmaRKxKVDIDhR
	 KyiuVTREnh8Fg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v5=202/5]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Mailer: git-send-email 2.45.3
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737476002887
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <34db7226a1abe8ac6f8dc0f61415e2783988ea45.1737470269.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1737470269.git.teddy.astie@vates.tech>
References: <cover.1737470269.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ff9033a53f704e2c929778eda4f784eb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250121:md
Date: Tue, 21 Jan 2025 16:13:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Some operating systems want to use IOMMU to implement various features (e.g
VFIO) or DMA protection.
This patch introduce a proposal for IOMMU paravirtualization for Dom0.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changed in V2:
* nit s/dettach/detach/

Changed in v4:
* updated for iommu_context locking changes
---
 docs/designs/pv-iommu.md | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 docs/designs/pv-iommu.md

diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
new file mode 100644
index 0000000000..7df9fa0b94
--- /dev/null
+++ b/docs/designs/pv-iommu.md
@@ -0,0 +1,116 @@
+# IOMMU paravirtualization for Dom0
+
+Status: Experimental
+
+# Background
+
+By default, Xen only uses the IOMMU for itself, either to make device adress
+space coherent with guest adress space (x86 HVM/PVH) or to prevent devices
+from doing DMA outside it's expected memory regions including the hypervisor
+(x86 PV).
+
+A limitation is that guests (especially privildged ones) may want to use
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
2.45.3



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

