Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630343375E6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96643.183056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMUj-0007kT-7c; Thu, 11 Mar 2021 14:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96643.183056; Thu, 11 Mar 2021 14:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMUj-0007k7-4b; Thu, 11 Mar 2021 14:40:57 +0000
Received: by outflank-mailman (input) for mailman id 96643;
 Thu, 11 Mar 2021 14:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKMUh-0007k0-N2
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:40:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e43e1200-1ea9-4ec1-92f7-5ae55f97bcf4;
 Thu, 11 Mar 2021 14:40:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3B7CAB8C;
 Thu, 11 Mar 2021 14:40:53 +0000 (UTC)
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
X-Inumbo-ID: e43e1200-1ea9-4ec1-92f7-5ae55f97bcf4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615473654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+X69GrozWYaghxwvS9MPdag8I8/4ve4VeVt9yKkZhYs=;
	b=Nz1PRdnUSOdE9jtsJU3xqs4L//HENNUebiCm6H4gdKgedYR6kE3npHieyVCq3gAR7Mu6g4
	3GreSc/GDdXn0hvU2XdVee0k2gomGl/chDx3IRgOKPXpdX73Ik6OStBrLIu6s0RNvMZF7K
	uZvPmEwx/Dkr5Il0PSjbfYpAV8siOCE=
Subject: [PATCH v2 2/2] tools/x86: move arch-specific include/xen/ population
 into arch-specific rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Message-ID: <e6bcfa87-aa12-97dd-23f4-d2f085e2e4f6@suse.com>
Date: Thu, 11 Mar 2021 15:40:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for the common "xen-dir" rule to have an arch-specific
part when there already is a arch-specific rule where this can be taken
care of (arguably instead of all-y this might better be xendir-y
anyway).

Also change the pattern from *autogen.h to *-autogen.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Insert dash in pattern. Re-base over changed earlier patch.
---
I was tempted to move the "xen-dir" dependency from all-$(CONFIG_X86) to
the general all-y, but perhaps that's less related and hence should
really be a separate change (and there may also be arguments against
that).

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -29,14 +29,12 @@ xen-dir:
 	ln -s ../xen-foreign xen/foreign
 	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
 	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
-ifeq ($(CONFIG_X86),y)
+
+all-$(CONFIG_X86): xen-dir
 	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
 	mkdir -p xen/lib/x86
-	ln -s $(filter-out %autogen.h,$(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h)) xen/lib/x86/
+	ln -s $(filter-out %-autogen.h,$(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h)) xen/lib/x86/
 	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
-endif
-
-all-$(CONFIG_X86): xen-dir
 	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
 
 # Not xen/xsm as that clashes with link to


