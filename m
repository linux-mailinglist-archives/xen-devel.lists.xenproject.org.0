Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D784F48CC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 02:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299382.510047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbtFs-0006Of-QQ; Wed, 06 Apr 2022 00:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299382.510047; Wed, 06 Apr 2022 00:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbtFs-0006Md-NJ; Wed, 06 Apr 2022 00:10:36 +0000
Received: by outflank-mailman (input) for mailman id 299382;
 Wed, 06 Apr 2022 00:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbtFr-0006MX-LQ
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 00:10:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8c27f3-b53d-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 02:10:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A305B81B94;
 Wed,  6 Apr 2022 00:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D73BC385A1;
 Wed,  6 Apr 2022 00:10:31 +0000 (UTC)
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
X-Inumbo-ID: fa8c27f3-b53d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649203831;
	bh=pT1Nd0zZFpwy7cAKIscpZuiWMms8Pax4/HWEeLWBiKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VV/ZY8+RZx0SOTEMmqLGr+BPnMkI1WDdwriMJBOo8llNv6ld5Sy0z72AMVRGdwUNp
	 XmxNcHxfcLMND/WmUrO+P0ieit3WdPfcvIqfY3Dgbv1LIbmZWsjP/FDAisva8he4BD
	 IjBeIU66PTZZK70zak38sAxJs1XIIpuhYRsOFj/GqncG5OAjyjLZl2LP6l4ihqQtfQ
	 O817tgM8UaKNSmSNaApE0heDTDrznNYYbyM3IdDodcxheoyVPv3Hxa5awLTNTvjAg9
	 pH1fkht0Xeolb+L3QBjGpwXI10QXzdD8Nh1K/htRk0+7ghktnL0oZgaMERmRp5DK3O
	 9gyJ971RiQQdw==
Date: Tue, 5 Apr 2022 17:10:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 13/19] xen/arm: Move fixmap definitions in a separate
 header
In-Reply-To: <ddfdefed-21e6-06ee-182b-731fd130794a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051705010.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-14-julien@xen.org> <alpine.DEB.2.22.394.2204051411510.2910984@ubuntu-linux-20-04-desktop> <ddfdefed-21e6-06ee-182b-731fd130794a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Apr 2022, Julien Grall wrote:
> On 05/04/2022 22:12, Stefano Stabellini wrote:
> > > +/* Map a page in a fixmap entry */
> > > +extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
> > > +/* Remove a mapping from a fixmap entry */
> > > +extern void clear_fixmap(unsigned map);
> > > +
> > > +#endif /* __ASSEMBLY__ */
> > > +
> > > +#endif /* __ASM_FIXMAP_H */
> > 
> > 
> > It is a good idea to create fixmap.h, but I think it should be acpi.h to
> > include fixmap.h, not the other way around.
> 
> As I wrote in the commit message, one definition in fixmap.h rely on define
> from acpi.h (i.e NUM_FIXMAP_ACPI_PAGES). So if we don't include it, then user
> of FIXMAP_PMAP_BEGIN (see next patch) will requires to include acpi.h in order
> to build.
> 
> Re-ordering the values would not help because the problem would exactly be the
> same but this time the acpi users would have to include pmap.h to define
> NUM_FIX_PMAP.
> 
> > 
> > The appended changes build correctly on top of this patch.
> 
> That's expected because all the users of FIXMAP_ACPI_END will be including
> acpi.h. But after the next patch, we would need pmap.c to include acpi.h.
> 
> I don't think this would be right (and quite likely you would ask why
> this is done). Hence this approach.


I premise that I see your point and I don't feel very strongly either
way. In my opinion the fixmap is the low level "library" that others
make use of, so it should be acpi.h and pmap.h (the clients of the
library) that include fixmap.h and not the other way around.

So I would rather define NUM_FIXMAP_ACPI_PAGES and NUM_FIX_PMAP in
fixmap.h, then have both pmap.h and acpi.h include fixmap.h. It makes
more sense to me. However, I won't insist if you don't like it. Rough
patch below for reference.



diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index c46a15e59d..a231ebfe25 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -4,8 +4,13 @@
 #ifndef __ASM_FIXMAP_H
 #define __ASM_FIXMAP_H
 
-#include <xen/acpi.h>
-#include <xen/pmap.h>
+#include <xen/lib.h>
+#include <asm/lpae.h>
+
+#define NUM_FIXMAP_ACPI_PAGES  64
+
+/* Large enough for mapping 5 levels of page tables with some headroom */
+#define NUM_FIX_PMAP 8
 
 /* Fixmap slots */
 #define FIXMAP_CONSOLE  0  /* The primary UART */
@@ -22,6 +27,10 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/mm-frame.h>
+
+extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
+
 /* Map a page in a fixmap entry */
 extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
 /* Remove a mapping from a fixmap entry */
diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
index 70eafe2891..31d29e021d 100644
--- a/xen/arch/arm/include/asm/pmap.h
+++ b/xen/arch/arm/include/asm/pmap.h
@@ -2,9 +2,8 @@
 #define __ASM_PMAP_H__
 
 #include <xen/mm.h>
+#include <asm/fixmap.h>
 
-/* XXX: Find an header to declare it */
-extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
 
 static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
 {
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 1b9c75e68f..afcc9d5b4f 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -28,12 +28,7 @@
 #define _LINUX
 #endif
 
-/*
- * Fixmap pages to reserve for ACPI boot-time tables (see
- * arch/x86/include/asm/fixmap.h or arch/arm/include/asm/fixmap.h),
- * 64 pages(256KB) is large enough for most cases.)
- */
-#define NUM_FIXMAP_ACPI_PAGES  64
+#include <asm/fixmap.h>
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/include/xen/pmap.h b/xen/include/xen/pmap.h
index 93e61b1087..aa892154c0 100644
--- a/xen/include/xen/pmap.h
+++ b/xen/include/xen/pmap.h
@@ -1,9 +1,6 @@
 #ifndef __XEN_PMAP_H__
 #define __XEN_PMAP_H__
 
-/* Large enough for mapping 5 levels of page tables with some headroom */
-#define NUM_FIX_PMAP 8
-
 #ifndef __ASSEMBLY__
 
 #include <xen/mm-frame.h>

