Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8E906F1D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 14:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739884.1146841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjNp-0008U7-OU; Thu, 13 Jun 2024 12:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739884.1146841; Thu, 13 Jun 2024 12:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjNp-0008S0-Is; Thu, 13 Jun 2024 12:16:49 +0000
Received: by outflank-mailman (input) for mailman id 739884;
 Thu, 13 Jun 2024 12:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xLSK=NP=bounce.vates.tech=bounce-md_30504962.666ae32b.v1-a1a12ac15ee84a27862ee32dd567ea52@srs-se1.protection.inumbo.net>)
 id 1sHjNn-0008Rn-Qr
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:16:47 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc7f90e4-297e-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 14:16:45 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4W0LxR70YbzCf9PPj
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 12:16:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a1a12ac15ee84a27862ee32dd567ea52; Thu, 13 Jun 2024 12:16:43 +0000
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
X-Inumbo-ID: cc7f90e4-297e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718281004; x=1718541504;
	bh=Si1H+0tUp3aV0kgXlGZ06VpmpP6WpGI1yiw22kocZDk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pDTrdiHzEmXxuwfPMWwUWnBUi6F/r2k0j3GA9HUoWlPFey1RzxoLBtM4l8ePfUo2X
	 wjRcYUP9oVNauoOz0lNMN/hZ2ndnXIB42W2gWcfQ/9/P8zVCiPjq5P3MS8DtODaWkB
	 JtFbSgTxm4ktw84BH6eMPOQ3RR43RyEgclPIAKPLkDdW1P4jj8e7VQM6aqK3z/3NYK
	 qo7Fxs+aoDmx93akKzm59NuSxNBSraxlIjY0H9l+sVe8H1FibcEpYQTNAsBf1ZuGLc
	 o281aN34sdfgw4jf2+GJN9Bh3+Ybhiofz8yb+hUSE2l/p7+0bZAuFZB5NkXPmGbLXL
	 78G9uwWCku6hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718281004; x=1718541504; i=teddy.astie@vates.tech;
	bh=Si1H+0tUp3aV0kgXlGZ06VpmpP6WpGI1yiw22kocZDk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ha5g06IMmj4caP8Agqckb45mSfuMqSAh4vl1ZbJ3mAl/Dpa8tYiQ0F/4EePW9L+EI
	 R1vXX8SNoLGbVHkxdpER+n+d5CTk61J+PfP4mMY+1l/sNGK9v0Hilq/fjlNVvprJhY
	 rCGQJ9xcsMM8GAMDGCgIkxpuZ15X4CmLMqQGMeNgdPeQS2+LWhiQ+H2r1yioHZUwl0
	 3tyXEICLLwDAcWvnUL5lkh0vwN+/jdDQm3czP3YO3PkoBtNvrUKZLIXLJe95NRTBtR
	 iODBjOUwf6gbv2cMJfVP7V//T+Yt/nBXD/SVR9O3Hd74J77x26DwnvtT3rK33YwkH2
	 jXl+i1+13mecA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH=201/5]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718281001992
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <2aa4e20a1d7aeb51f393cde4d142732e18d3a57c.1718269097.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1718269097.git.teddy.astie@vates.tech>
References: <cover.1718269097.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a1a12ac15ee84a27862ee32dd567ea52?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240613:md
Date: Thu, 13 Jun 2024 12:16:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

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

