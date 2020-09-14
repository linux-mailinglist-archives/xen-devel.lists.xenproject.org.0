Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E42268B2C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnlh-0001jq-ID; Mon, 14 Sep 2020 12:39:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHnlf-0001jN-EI
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:39:35 +0000
X-Inumbo-ID: 60667035-976a-4454-9902-1853e3fddc70
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60667035-976a-4454-9902-1853e3fddc70;
 Mon, 14 Sep 2020 12:39:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73581AC79;
 Mon, 14 Sep 2020 12:39:49 +0000 (UTC)
Subject: [PATCH 3/3] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at the
 same time
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
Message-ID: <d6661f16-0cd2-1eed-0128-c89f1aca240d@suse.com>
Date: Mon, 14 Sep 2020 14:39:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This combination doesn't really make sense (and there likely are more).
The alternative here would be some presumably intrusive #ifdef-ary to
get this combination to actually build again.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
 
@@ -90,8 +90,8 @@ config PV_LINEAR_PT
          If unsure, say Y.
 
 config HVM
-	def_bool !PV_SHIM_EXCLUSIVE
-	prompt "HVM support"
+	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
 	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot


