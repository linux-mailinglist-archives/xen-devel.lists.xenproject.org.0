Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A191859E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749161.1157192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUTw-0006dG-Tg; Wed, 26 Jun 2024 15:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749161.1157192; Wed, 26 Jun 2024 15:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUTw-0006ZT-PB; Wed, 26 Jun 2024 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 749161;
 Wed, 26 Jun 2024 15:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1DF7=N4=bounce.vates.tech=bounce-md_30504962.667c3243.v1-103ac74f00f0420b835b12a5fefcf48e@srs-se1.protection.inumbo.net>)
 id 1sMUTu-0006XW-Q5
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:22:46 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef96bde0-33cf-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 17:22:45 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W8QS34Zjdz5QkLmN
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 15:22:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 103ac74f00f0420b835b12a5fefcf48e; Wed, 26 Jun 2024 15:22:43 +0000
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
X-Inumbo-ID: ef96bde0-33cf-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719415363; x=1719675863;
	bh=+dqkQHl/dBDSZmbUuZEbUp1Dg+EDo5EWONBvSTIRkoc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zu+1txio9rqtGtc8zodvtjexU2773Q3kE6DDkqfs5NaIYQzQolU/wib/CMBICgMQK
	 96Nwnbj5zuIz49aAPesvRrRaib4I5tdkTzVFDgUVVdrTCfn/RfxVE/V9sCmzXcSxRf
	 q6sV001135tlUgppi1Q8q3nzp58hh4tbEWgFCO2MiMxaFH8WgucOKbve9FweBuILp+
	 vvRz64bMnDoD2Vld/kav1yNNJKCTVbI+avlAQYSKOzUfjnTkxdTLKE6JiebVdwuUYp
	 /zyxoTr9hrB0ML8a4ZhA/NJFG1AdCETs/9MjYQA0cBgu1LGCs1CR3WMAlW8ky/2byx
	 Z7sKj7hvg3JvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719415363; x=1719675863; i=teddy.astie@vates.tech;
	bh=+dqkQHl/dBDSZmbUuZEbUp1Dg+EDo5EWONBvSTIRkoc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=me3tWdZQgeFilzrzDFkNMkKnF0yQ4SSKmtRI+M1sVhvKgsh+hOHL1k8eBpPBhelbW
	 x6AyHxSObmywC2x0YoJmF977tM9JrmRx4JEE/9YZJ7GI4c4+HAmdGTIR9BtCQPS/R1
	 zaKfL0qfYcx7NixsNC5VWfqqXp5+1A6aY+vP3shj3tNPavSU85Nb5CKe9gJSh3xUAS
	 PglqDhqgRZnZvVLvxR6PUsxazhgR+PLl84JMmJUvR9DKEh6pGra3Ua5bZ5Ap43jhvw
	 ezdTDUac0msFGp8FQtzP/93GJznAdkMKqf4D8jBHXLa9No+fsD1QhuAOfqIi6f8EDv
	 s06n+3N4dtkEA==
From: TSnake41 <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH=20v2=201/5]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719415360143
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <6642b573ddc8abc79f376c9393b7917c4f42a590.1719414736.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1719414736.git.teddy.astie@vates.tech>
References: <cover.1719414736.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.103ac74f00f0420b835b12a5fefcf48e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240626:md
Date: Wed, 26 Jun 2024 15:22:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Teddy Astie <teddy.astie@vates.tech>

Some operating systems want to use IOMMU to implement various features (e.g
VFIO) or DMA protection.
This patch introduce a proposal for IOMMU paravirtualization for Dom0.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 docs/designs/pv-iommu.md | 105 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 docs/designs/pv-iommu.md

diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
new file mode 100644
index 0000000000..c01062a3ad
--- /dev/null
+++ b/docs/designs/pv-iommu.md
@@ -0,0 +1,105 @@
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
+The number of IOMMU context a domain can use is predetermined at domain creation
+and is configurable through `dom0-iommu=nb-ctx=N` xen cmdline.
+
+# IOMMU operations
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
2.45.2



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

