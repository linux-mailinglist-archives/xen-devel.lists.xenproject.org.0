Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53926C31B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 15:08:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIXAI-0003TD-V7; Wed, 16 Sep 2020 13:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIXAH-0003T2-Iq
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:08:01 +0000
X-Inumbo-ID: d2997bba-642d-42ba-9a39-321a4dbe2d4a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2997bba-642d-42ba-9a39-321a4dbe2d4a;
 Wed, 16 Sep 2020 13:08:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600261680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYPkibsC0LeUUORujDjgVjc3ApbAi3m5v6WMoC7LJ8g=;
 b=WZ320q41n3qVyMVl7/0eEkM4tHzqSqRdn5C8aKvea0W8dMzVV8f8w7sijowxbfiZZ5y5JW
 +aAR1i//rapApvw6bTeIhHnHYKw15pqUoaTWNwxFnoFqblm3MoCsghOmaoRLgDxkenrNPl
 2n0vLmf+XoBK+p4at0uv9notHJdOTvPi7qXz6IXvOodkncIqpXtg8BUbPkyRIQ8oe3Vcln
 V3U7vztESwnEb6Oq9jMr8oF9C5DeefZjui31J0aWgvdJt1sVxBS2N5mBCegMZTdm1ji5bi
 WFFPm6Aaag9Q89h51FcxW8v69B01x0DKKxt4Z/Ga2jzbhbSP1IRxDGMhnFnGXA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82D4DB2CE;
 Wed, 16 Sep 2020 13:08:15 +0000 (UTC)
Subject: [PATCH v2 3/4] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at
 the same time
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
Message-ID: <c94e4480-96a0-34b6-a4c6-6176daa57588@suse.com>
Date: Wed, 16 Sep 2020 15:08:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
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

This combination doesn't really make sense (and there likely are more);
in particular even if the code built with both options set, HVM guests
wouldn't work (and I think one wouldn't be able to create one in the
first place). The alternative here would be some presumably intrusive
#ifdef-ary to get this combination to actually build (but still not
work) again.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
 
@@ -90,8 +90,9 @@ config PV_LINEAR_PT
          If unsure, say Y.
 
 config HVM
-	def_bool !PV_SHIM_EXCLUSIVE
-	prompt "HVM support"
+	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
 	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot


