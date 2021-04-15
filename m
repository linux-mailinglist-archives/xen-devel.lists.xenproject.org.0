Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BFA3605A5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110958.212027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyHu-0007te-2Q; Thu, 15 Apr 2021 09:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110958.212027; Thu, 15 Apr 2021 09:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyHt-0007tF-VQ; Thu, 15 Apr 2021 09:27:49 +0000
Received: by outflank-mailman (input) for mailman id 110958;
 Thu, 15 Apr 2021 09:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWyHs-0007tA-HZ
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:27:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f854273-b158-463c-bd1c-22f1e298a680;
 Thu, 15 Apr 2021 09:27:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8B02B1E9;
 Thu, 15 Apr 2021 09:27:46 +0000 (UTC)
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
X-Inumbo-ID: 4f854273-b158-463c-bd1c-22f1e298a680
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618478866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0Xbu4+aWtjIIvopxYQT1lfxhOX2yVXGUX8zzjEMWzc=;
	b=RBhz4vrZrmAZUllCfh9GMR9XmMFQFOQTqvlBmLD6idEWmNSgp4xrJ64cioFGUYv9mlsxLW
	x7yS8MHbZb1vvEney+qxlZeOGr7WJEb3zGZHKjIRZW4SfKNugWjlhHCiAZ1ToYEqtG/N8n
	VJO8K2zV+nX9ja7OSxVYGWVtfCLgzlo=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at the
 same time
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Message-ID: <164d8e67-fd65-9e98-53ef-51187310de0b@suse.com>
Date: Thu, 15 Apr 2021 11:27:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

This combination doesn't really make sense (and there likely are more);
in particular even if the code built with both options set, HVM guests
wouldn't work (and I think one wouldn't be able to create one in the
first place). The alternative here would be some presumably intrusive
#ifdef-ary to get this combination to actually build (but still not
work) again.

Fixes: 8b5b49ceb3d9 ("x86: don't include domctl and alike in shim-exclusive builds")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Default HVM to !PV_SHIM, as suggested by Jürgen.
v2: Restore lost default setting.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -23,7 +23,7 @@ config X86
 	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
-	select HAS_VPCI if !PV_SHIM_EXCLUSIVE && HVM
+	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
 	select NUMA
 
@@ -90,9 +90,10 @@ config PV_LINEAR_PT
          If unsure, say Y.
 
 config HVM
-	def_bool !PV_SHIM_EXCLUSIVE
+	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
+	default !PV_SHIM
 	select IOREQ_SERVER
-	prompt "HVM support"
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
 	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot

